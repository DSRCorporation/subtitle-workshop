unit UTimedTextUtils;

interface

uses
  SysUtils,
  Classes,
  Windows,
  XMLIntf,
  XMLDoc,
  USubtitleFile,
  USubtitlesFunctions,
  UTagFinder;

const
  FULL_TIMECODE:          SubtitleString = 'hh:mm:ss.zzz';

  TTML_NS_URI:            SubtitleString = 'http://www.w3.org/ns/ttml';
  TTML_STYLING_NS_URI:    SubtitleString = 'http://www.w3.org/ns/ttml#styling';
  TTML_METADATA_NS_URI:   SubtitleString = 'http://www.w3.org/ns/ttml#metadata';
  TTML_PARAMETER_NS_URI:  SubtitleString = 'http://www.w3.org/ns/ttml#parameter';

type

  IXMLNodeArray = array of IXMLNode;

  TTtmlDocument = class
  private
    FDocument : IXMLDocument;
    FEncoding : SubtitleString;
    FTitle    : SubtitleString;
    FRoot     : IXMLNode;
    FHead     : IXMLNode;
    FBody     : IXMLNode;
    procedure FindServiceTag(var row, spaceCount: Integer);
  protected
    procedure BuildProlog;
    procedure BuildRoot;
    procedure BuildHead;
    procedure BuildBody;
    function GetXML: TStrings;
  public
    constructor Create(encoding: SubtitleString; title: SubtitleString);
    procedure AppendParagraphs(nodes: IXMLNodeArray);
    property XML: TStrings read GetXML;
  end;

  TTagProcessor = class
  private
    FParentNode : IXMLNode;
  protected
    function AppendSpan(tag: SubtitleString; params: SubtitleString): IXMLNode;
    procedure AddText(text: SubtitleString);
  public
    constructor Create(node: IXMLNode);
    procedure Process(content: WideString);
  end;
  
  TParagraphBuilder = class
  private
    FCharset    : Byte;
    FUtf8Encode : Boolean;
  protected
    function Encode(text: SubtitleString): WideString;
  public
    constructor Create(charset: Byte; utf8Encode: Boolean);
    function BuildParagraph(subtitle: TSubtitleItem): IXMLNode;
    function BuildParagraphs(subtitles: TSubtitles; From, UpTo: Integer): IXMLNodeArray;
  end;


implementation

const
  SERVICE_TAG: SubtitleString = 'div_content_stub';

//  TTtmlDocument

constructor TTtmlDocument.Create(encoding: SubtitleString; title: SubtitleString);
begin
  FDocument := NewXMLDocument;
  FEncoding := encoding;
  FTitle    := title;
  
  BuildProlog;
  BuildRoot;
  BuildHead;
  BuildBody;
end;

procedure TTtmlDocument.BuildProlog;
begin
  with FDocument do begin
    Version     := '1.0';
    Encoding    := FEncoding;
    StandAlone  := 'no';
    Options     := [doNodeAutoIndent];
  end;
end;

procedure TTtmlDocument.BuildRoot;
begin
  FRoot := FDocument.AddChild('tt');
  with FRoot do begin
    DeclareNamespace('', TTML_NS_URI);
    DeclareNamespace('tts', TTML_STYLING_NS_URI);
    DeclareNamespace('ttm', TTML_METADATA_NS_URI);
    DeclareNamespace('ttp', TTML_PARAMETER_NS_URI);
  end;
end;

procedure TTtmlDocument.BuildHead;
var
  metadata                : IXMLNode;
  styling, style          : IXMLNode;
  layout, region1, region2: IXMLNode;
begin
  FHead := FRoot.AddChild('head', TTML_NS_URI);

  // Build metadata
  metadata := FHead.AddChild('metadata');
  metadata.AddChild('ttm:title').Text := FTitle;

  // Build styles
  styling := FHead.AddChild('styling');
  style := styling.AddChild('style');
  with style do begin
    Attributes['tts:color']       := 'white';
    Attributes['tts:fontStyle']   := 'normal';
    Attributes['tts:fontWeight']  := 'normal';
    Attributes['tts:fontFamily']  := 'Arial';
    Attributes['tts:fontSize']    := '100%';
    Attributes['xml:id']          := 'basic';
  end;

  // Build layouts
  layout := FHead.AddChild('layout');
  region1 := layout.AddChild('region');
  with region1 do begin
    Attributes['tts:extent']        := '80% 40%';
    Attributes['tts:origin']        := '10% 10%';
    Attributes['tts:textAlign']     := 'center';
    Attributes['tts:displayAlign']  := 'before';
    Attributes['xml:id']            := 'topCenter';
  end;
  region2 := layout.AddChild('region');
  with region2 do begin
    Attributes['tts:extent']        := '80% 40%';
    Attributes['tts:origin']        := '10% 50%';
    Attributes['tts:textAlign']     := 'center';
    Attributes['tts:displayAlign']  := 'after';
    Attributes['xml:id']            := 'bottomCenter';
  end;
end;

procedure TTtmlDocument.BuildBody;
begin
  FBody := FRoot.AddChild('body', TTML_NS_URI);
  FBody.AddChild('div').AddChild(SERVICE_TAG);
end;

function TTtmlDocument.GetXML: TStrings;
begin
  Result := FDocument.XML;
end;

procedure TTtmlDocument.FindServiceTag(var row, spaceCount: Integer);
var
  i, index: Integer;
begin
  row         := FDocument.XML.Count;
  spaceCount  := 0;

  for i := 0 to FDocument.XML.Count - 1 do begin
    index := Pos(Format('<%s/>', [SERVICE_TAG]), FDocument.XML[i]);

    if (index <> 0) then begin
      row         := i;
      spaceCount  := index - 1;
      Exit;
    end;
  end;
end;

procedure TTtmlDocument.AppendParagraphs(nodes: IXMLNodeArray);
var
  i, row, spaceCount: Integer;
  spaces : SubtitleString;
begin
  FindServiceTag(row, spaceCount);

  spaces := StringOfChar(' ', spaceCount);

  FDocument.XML.Delete(row);
  for i := Low(nodes) to High(nodes) do begin
    FDocument.XML.Insert(row, spaces + nodes[i].XML);
    Inc(row);
  end;
end;

//  TTagProcessor

constructor TTagProcessor.Create(node: IXMLNode);
begin
  FParentNode := node;
end;

function TTagProcessor.AppendSpan(tag: SubtitleString; params: SubtitleString): IXMLNode;
var
  span: IXMLNode;
begin
  span := FParentNode.AddChild('span');

  with span do begin
    if (tag = 'b') then Attributes['tts:fontWeight']      := 'bold';
    if (tag = 'i') then Attributes['tts:fontStyle']       := 'italic';
    if (tag = 'u') then Attributes['tts:textDecoration']  := 'underline';
    if (tag = 'c') then Attributes['tts:color']           := ReplaceString(params, ':', '');
  end;

  Result := span;
end;

procedure TTagProcessor.AddText(text: SubtitleString);
var
  strings : TStringList;
  i       : Integer;
begin
  strings       := TStringList.Create;
  strings.Text  := text;

  for i := 0 to strings.Count - 1 do begin
    if (i <> 0) then
      FParentNode.AddChild('br');
    FParentNode.ChildNodes.Add(FParentNode.OwnerDocument.CreateNode(strings[i], ntText));
  end;
end;

procedure TTagProcessor.Process(content: WideString);
var
  tagNode     : IXMLNode;
  tagFinder   : TTagFinder;
  tagProcessor: TTagProcessor;
begin
  while (content <> '') do begin
    tagFinder := FindFirstTag(content, ['b', 'i', 'u', 'c']);

    if (tagFinder.Left <> '') then
      AddText(tagFinder.Left);

    if tagFinder.Found and (tagFinder.content <> '') then begin
      tagNode := AppendSpan(tagFinder.Tag, tagFinder.Params);

      tagProcessor := TTagProcessor.Create(tagNode);
      tagProcessor.Process(tagFinder.Content);
      tagProcessor.Destroy;
    end;

    content := tagFinder.Right;
    tagFinder.Destroy;
  end;
end;

//  TParagraphBuilder

constructor TParagraphBuilder.Create(charset: Byte; utf8Encode: Boolean);
begin
  FCharset    := charset;
  FUtf8Encode := utf8Encode;
end;

function TParagraphBuilder.Encode(text: SubtitleString):WideString;
begin
  {$IFDEF UTF8}
  Result := text;
  {$ELSE}
  if (FUtf8Encode = True) then begin
    Result := StringToWideStringEx(text, CharSetToCodePage(FCharset));
    Result := UTF8Encode(Result);
  end else
    Result := text;
  {$ENDIF}
end;

function TParagraphBuilder.BuildParagraph(subtitle: TSubtitleItem): IXMLNode;
var
  start, final: SubtitleString;
  tagProcessor: TTagProcessor;
begin
  start := TimeToString(subtitle.InitialTime, FULL_TIMECODE);
  final := TimeToString(subtitle.FinalTime,   FULL_TIMECODE);

  Result := NewXMLDocument.CreateElement('p', '');
  with Result do begin
    Attributes['begin']   := start;
    Attributes['end']     := final;
    Attributes['region']  := 'bottomCenter';
    Attributes['style']   := 'basic';
  end;

  tagProcessor := TTagProcessor.Create(Result);
  tagProcessor.Process(Encode(subtitle.Text));
  tagProcessor.Destroy;
end;

function TParagraphBuilder.BuildParagraphs(subtitles: TSubtitles; From, UpTo: Integer): IXMLNodeArray;
var
  i: Integer;
begin
  SetLength(Result, UpTo - From + 1);
  for i := From to UpTo do begin
    Result[i] := BuildParagraph(subtitles[i]);
  end;
end;

end.
