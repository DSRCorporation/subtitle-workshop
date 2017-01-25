unit UTtmlParser;

interface

uses
  SysUtils,
  Classes,
  USubtitleFile,
  USubtitlesFunctions,
  UTtmlTimeConverter,
  LibXMLParser,
  Contnrs;

type
  TXMLState = (xsNone, xsSubtitleHeader, xsSubtitleText);
  
  TSWTag    = (swBold, swItalic, swUnderline, swColor);
  TSWTags   = set of TSWTag;
  PSWTags   = ^TSWTags;
  
  TUTFParser = class(TXMLParser)
  private
    FCharset : Byte;
  public
    constructor Create(charset: Byte);
    function  TranslateEncoding(const source : AnsiString) : AnsiString;  override;
  end;

  
  TTtmlParser = class
  private
    FParser     : TXMLParser;
    FState      : set of TXMLState;

    FMaxDuration: Integer;
    FExtraTime  : Integer;
    FSubtitle   : TSubtitleItem;

    FSpanStack  : TStack;

    FTmpColor   : AnsiString;
    FTimeConverter: TTtmlTimeConverter;

    procedure NormalizeTimes;
    function GetTime(attrName: AnsiString): Integer;
    function OpenSWTags(tags: TSWTags): AnsiString;
    function CloseSWTags(tags: TSWTags): AnsiString;
    function TranslateSpan: TSWTags;
    procedure InitTimeConverter;
  protected

    procedure ClearSubtitle;

    procedure AppendContent;
    procedure AppendNewLine;
    procedure AppendOpenLastTag;
    procedure AppendCloseLastTag;
    procedure ProcessOpenSpan;
  public
    constructor Create(charset: Byte; maxDuration, extraTime: Integer);
    destructor Destroy; override;

    function ParseTTML(subFile: TSubtitleFile; subtitles: TSubtitles; var DetectedEncoding: String): Boolean;
  end;
  
  
implementation

//  TUTFParser

constructor TUTFParser.Create(charset: Byte);
begin
  inherited Create;
  
  FCharset    := charset;
end;

function TUTFParser.TranslateEncoding(const source: AnsiString) : AnsiString;
var
  ws: WideString;
begin
  if FCurEncoding = 'UTF-8' then begin
    ws      := UTF8Decode(source);
    Result  := WideStringToStringEx(ws, CharSetToCodePage(FCharset));
  end else
    Result  := Source;
end;

//  TTtmlParser

constructor TTtmlParser.Create(charset: Byte; maxDuration, extraTime: Integer);
begin
  FParser := TUTFParser.Create(charset);

  FMaxDuration  := maxDuration;
  FExtraTime    := extraTime;
end;

destructor TTtmlParser.Destroy;
begin
  FParser.Destroy;

  inherited;
end;

function TTtmlParser.GetTime(attrName: AnsiString): Integer;
var
  expr: AnsiString;
begin
  try
    expr := FParser.CurAttr.Value(attrName);
    if Assigned(FTimeConverter) then
      Result := FTimeConverter.ParseTimeExpression(expr)
    else
      Result := StringToTime(expr);
  except
    Result := 0;
  end;
end;

function TTtmlParser.TranslateSpan: TSWTags;
begin
  Result := [];

  with FParser.CurAttr do begin
    if (Value('tts:fontWeight')     = 'bold')       then Include(Result, swBold);
    if (Value('tts:fontStyle')      = 'italic')     then Include(Result, swItalic);
    if (Value('tts:textDecoration') = 'underline')  then Include(Result, swUnderline);

    FTmpColor := Value('tts:color');
    if (FTmpColor <> '') then Include(Result, swColor);
  end;
end;

function TTtmlParser.OpenSWTags(tags: TSWTags): SubtitleString;
begin
  Result := '';

  if swBold       in tags then Result := Result + '<b>';
  if swItalic     in tags then Result := Result + '<i>';
  if swUnderline  in tags then Result := Result + '<u>';
  if swColor      in tags then Result := Result + '<c:' + FTmpColor +'>';
end;

function TTtmlParser.CloseSWTags(tags: TSWTags): SubtitleString;
begin
  Result := '';

  // NOTE: order of closing tags must be opposite to OpenTags(...) func order
  if swColor      in tags then Result := Result + '</c>';
  if swUnderline  in tags then Result := Result + '</u>';
  if swItalic     in tags then Result := Result + '</i>';
  if swBold       in tags then Result := Result + '</b>';
end;

procedure TTtmlParser.ProcessOpenSpan;
var
  tags  : TSWTags;
  pTags : PSWTags;
begin
  tags := TranslateSpan;
  if tags <> [] then begin
    New(pTags);
    pTags^ := tags;
    FSpanStack.Push(pTags);
  end;
end;

procedure TTtmlParser.AppendContent;
begin
  with FSubtitle do Text := Text + FParser.CurContent;
end;

procedure TTtmlParser.AppendNewLine;
begin
  with FSubtitle do Text := Text + #13#10;
end;

procedure TTtmlParser.AppendOpenLastTag;
var
  tags : TSWTags;
begin
  if FSpanStack.Count > 0 then begin
    tags := TSWTags(FSpanStack.Peek^);
    with FSubtitle do Text := Text + OpenSWTags(tags);
  end;
end;

procedure TTtmlParser.AppendCloseLastTag;
var
  tags : TSWTags;
begin
  if FSpanStack.Count > 0 then begin
    tags := TSWTags(FSpanStack.Pop^);
    with FSubtitle do Text := Text + CloseSWTags(tags);
  end;
end;

procedure TTtmlParser.ClearSubtitle;
begin
  with FSubtitle do begin
    InitialTime := 0;
    FinalTime   := 0;
    Text        := '';
  end;
end;

procedure TTtmlParser.NormalizeTimes;
begin
  with FSubtitle do begin
    InitialTime := InitialTime  + FExtraTime;
    FinalTime   := FinalTime    + FExtraTime;

    if (FMaxDuration > 0) and (FinalTime > FMaxDuration) then FinalTime := InitialTime + FMaxDuration;
  end;
end;

procedure TTtmlParser.InitTimeConverter;
var
  attrValue     : AnsiString;
  frameRate,
  subFrameRate,
  tickRate,
  frNumerator,
  frDenominator : Integer;
  parts         : TStrings;
begin
  with FParser.CurAttr do
  try
    attrValue := Value('ttp:frameRate');
    if (attrValue <> '') then
      frameRate := StrToInt(attrValue)
    else
      frameRate := 30;

    attrValue := Value('ttp:frameRateMultiplier');
    if (attrValue <> '') then begin
      parts := TStringList.Create;
      ExtractStrings([' '], [], PChar(attrValue), parts);
      frNumerator   := StrToInt(parts[0]);
      frDenominator := StrToInt(parts[1]);
    end else begin
      frNumerator   := 1;
      frDenominator := 1;
    end;

    attrValue := Value('ttp:subFrameRate');
    if (attrValue <> '') then
      subFrameRate := StrToInt(attrValue)
    else
      subFrameRate := 1;

    attrValue := Value('ttp:tickRate');
    if (attrValue <> '') then
      tickRate := StrToInt(attrValue)
    else
      tickRate := 1;

    FTimeConverter := TTtmlTimeConverter.Create(frameRate, frNumerator, frDenominator, subFrameRate, tickRate);
  except
    FTimeConverter := TTtmlTimeConverter.Create(30, 1, 1, 1, 1);
  end;
end;

function TTtmlParser.ParseTTML(subFile: TSubtitleFile; subtitles: TSubtitles; var DetectedEncoding: String): Boolean;
var
  tag: AnsiString;
begin
  Result  := False;
  FState  := [xsNone];
  ClearSubtitle;

  FSpanStack := TStack.Create;
  FTimeConverter := nil;

  with FParser do
  try
    LoadFromBuffer(PChar(subFile.Text));

    StartScan;
    while Scan do begin
      DetectedEncoding := FParser.CurEncoding;
      tag := LowerCase(CurName);

      case CurPartType of
        ptStartTag  : if tag = 'div' then
                       Include(FState, xsSubtitleHeader)
                      else
                      if tag = 'p' then
                      begin
                        if (xsSubtitleHeader in FState) then
                        begin
                          with FSubtitle do begin
                            InitialTime := GetTime('begin');
                            FinalTime   := GetTime('end');
                          end;
                          Include(FState, xsSubtitleText);
                        end;
                      end
                      else
                      if tag = 'span' then
                      begin
                        ProcessOpenSpan;
                        AppendOpenLastTag;
                      end
                      else
                      if tag = 'br' then
                        AppendNewLine
                      else
                      if tag = 'tt' then
                      begin
                        InitTimeConverter;
                      end;

        ptEndTag    : if tag = 'p' then
                      begin
                        if (FSubtitle.InitialTime > -1) and (FSubtitle.FinalTime > -1) then
                        begin
                          NormalizeTimes;
                          subtitles.Add(FSubtitle);
                        end;
                        ClearSubtitle;

                        Exclude(FState, xsSubtitleText);
                      end
                      else
                      if tag = 'span' then
                      begin
                        AppendCloseLastTag;
                      end
                      else
                      if tag = 'div' then
                        Exclude(FState, xsSubtitleHeader)
                      else
                      if tag = 'body' then
                        Break;

        ptContent   : if (xsSubtitleText in FState) then
                        AppendContent;
        ptEmptyTag  : if tag = 'br' then
                        AppendNewLine;
      end;
    end;
  finally
    Free;
    FSpanStack.Destroy;
    FTimeConverter.Destroy;
    
    if subtitles.Count > 0 then Result := True;
  end;
end;

end.
