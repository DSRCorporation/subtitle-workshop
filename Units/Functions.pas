// This file is part of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle Workshop's copyright information
// File Description: Various functionality

unit Functions;

interface

uses
  Forms, Windows, Classes, SysUtils, StdCtrls, Mask, IniFiles, ComCtrls, ExtCtrls, ShellApi, Controls, Math, Graphics, {JvRichEditToHtml,} Messages, RichEdit, ClipBrd, //Graphics, JvRichEditToHtml, Messages, RichEdit, ClipBrd added by adenry
  VirtualTrees,
  StrMan, FastStrings,
  CommonTypes;

// -----------------------------------------------------------------------------

// --------------------------//
//         Charsets          //
// --------------------------//
procedure AddCharsets(ComboBox: TComboBox);
function StrCharsetToInt(CharSet: String): Byte;
// --------------------------//
//       Recent Files        //
// --------------------------//
procedure AddRecentFiles;
procedure SaveRecentFiles(var Ini: TMemIniFile);
// --------------------------//
//   FPS-Related Functions   //
// --------------------------//
procedure AddFPS(ComboBox: TComboBox);
procedure SaveFPS(ComboBox: TComboBox);
function GetInputFPS: Single;
function GetFPS: Single;
procedure AddFPSItem(FPS: Single; ModifyInputFPS, ModifyFPSTimes, ModifyInputFPSTimes: Boolean);
// --------------------------//
//   TAG-Related Functions   //
// --------------------------//
function RemoveSWTags(Text: String; Bold, Italic, Underline, Color: Boolean; OverrideNoInterWithTags: Boolean = False): String;
function TextHasFullTag(Text: String; Bold, Italic, Underline, Color: Boolean): Boolean; //added by adenry
function IsTagPart(Text: String; n: Integer): Boolean; //added by adenry
function CloseUnclosedTags(Text, OpenTag, CloseTag: String): String; //added by adenry
function FixTagsPositions(Text: String): String; //added by adenry
// Style tags
function GetSingleTagsModeFontStyles(Text: String): TFontStyles; //added by adenry
function SetSingleTagsModeFontStyles(Text: String; FontStyles: TFontStyles; Replace: Boolean): String; //added by adenry
// Color tags
function ColorToHTML(Color: Integer): String;
function HTMLToColor(HTML: String): Integer; //added by adenry
function SetColorTag(Text: String; Color: Integer): String;
function GetSubColor(Text: String; OnlyFullTag: Boolean = False): Integer;
//function HtmlSsaColor(var Color: String): Boolean; //added by adenry
// ------------------------------------//
//   RichEdit-/RTF-Related Functions   //
// ------------------------------------//
//function RTFtoHTML(re: TRichEdit): String; //added by adenry
//procedure HTMLtoRTF(re: TRichEdit; s: String); //added by adenry
//procedure SetRichEditWidth(RE : TRichEdit); //added by adenry
//procedure SetRichEditHeight(re: TRichEdit); //added by adenry
//procedure CopyRTFText(reSource, reDest: TRichEdit); //added by adenry
//procedure SetRichEditBgColor(RichEdit: TRichEdit; AColor: TColor); //added by adenry
procedure HighlightTags(re: TRichEdit); //by BDZL
function GetRichEditText(RichEdit: TRichEdit): AnsiString; //added by adenry
//function GetRichEditTextW(RichEdit: TRichEdit): WideString; //added by adenry
procedure SetRichEditText(RichEdit: TRichEdit; Text: String); //added by adenry
//function GetRichEditSelText(RichEdit: TRichEdit): String; //added by adenry
procedure SetRichEditSelText(RichEdit: TRichEdit; InsertText: String); //added by adenry
//TSWTextEdit
function GetSWTextEditText(SWTextEdit: TSWTextEdit): String; //added by adenry
procedure SetSWTextEditText(SWTextEdit: TSWTextEdit; Text: String); //added by adenry
//function GetSWTextEditSelText(SWTextEdit: TSWTextEdit): String; //added by adenry
procedure SetSWTextEditSelText(SWTextEdit: TSWTextEdit; Text: String); //added by adenry
//Clipboard
function GetUnicodeTextFromClipboard: WideString; //added by adenry
// ---------------------//
//   Search & Replace   //
// ---------------------//
function Replace(Text, This, ByThis: String; CaseSensitive, WholeWords, PreserveCase: Boolean): String;
function ContainsString(Text, This: String; CaseSensitive, WholeWords: Boolean): Boolean;
//function ReplaceInNode(This, ByThis: String; CaseSensitive, WholeWords, PreserveCase, SelectedItemToEnd: Boolean): PVirtualNode; //removed by adenry: not used
function FindInNode(This: String; CaseSensitive, MatchWholeWords, SelectedItemToEnd: Boolean): PVirtualNode;
// ---------------------//
//    Formats related   //
// ---------------------//
function GetFormatExt(FormatIndex: Integer): String;
procedure GetFormatsList(Result: TStrings);
// ---------------------//
//  Video file related  //
// ---------------------//
function GetVideoInfo(const FileName: String; var FPS: Single; var Duration: Integer): Boolean;
// -------------- //
//  Divide lines  //
// -------------- //
procedure DivideSubText(SubtitleText: String; var Breaks: TOpenIntegerArray; const AdjustAutomatically: Boolean; var Out1, Out2: String; var MaxBreaks: Integer); //added by adenry
function DivideSubDuration(Node:PVirtualNode; Text1:String; Prop1,Prop2:Byte; Pause:Integer; AutomaticDur:Boolean=False): Integer; //added by adenry
procedure TrimParts(var Part1, Part2: String);
// -------- //
//  Others  //
// -------- //
function IsFloat(Text : string): Boolean;
function StrSecToMS(Sec: String): Integer;
// ---------------------
function MsgBox(AMsg, BCap1, BCap2, BCap3: String; IconInd: Integer; MainForm: TForm; FontCharset: Integer = -1): Integer;
function QueryInput(const Caption, Prompt: String; var ResultStr: String; ParentForm: TForm): Integer;
// ---------------------
procedure MemoKeyPress(Sender: TObject; List: TVirtualStringTree; NextLine: Boolean);
procedure AdjustSubtitles(Points: TClassicSyncPoints; ActionType: Byte);
//function AdjustLines(Line: String; GoForwardAlso: Boolean = True; FindLessDifference: Boolean = True): String; //removed by adenry
// ---------------------
function GetLengthForEachLine(Text: String): String;
function FixRTLPunctuation(S: String): String;
// ---------------------
function TrimTimeString(Text: WideString): WideString; //added by adenry
function TrimSpacesAndNewLinesOnly(S: String): String; //added by adenry

// -----------------------------------------------------------------------------

implementation

uses
  General, USubtitlesFunctions, TreeViewHandle, Undo, InfoErrorsFunctions, //USubtitleApi, //InfoErrorsFunctions added by adenry //USubtitleApi removed by adenry
  formMain, formSaveAs;

// -----------------------------------------------------------------------------

procedure AddCharsets(ComboBox: TComboBox);
begin
  ComboBox.Items.Add('ANSI');
  ComboBox.Items.Add('Default');
  ComboBox.Items.Add('Symbol');
//  ComboBox.Items.Add('MAC');
  ComboBox.Items.Add('Shiftjis');
  ComboBox.Items.Add('Hangeul');
  ComboBox.Items.Add('Johab');
  ComboBox.Items.Add('GB2312');
  ComboBox.Items.Add('Chinese BIG5');
  ComboBox.Items.Add('Greek');
  ComboBox.Items.Add('Turkish');
  ComboBox.Items.Add('Vietnamese');
  ComboBox.Items.Add('Hebrew');
  ComboBox.Items.Add('Arabic');
  ComboBox.Items.Add('Baltic');
  ComboBox.Items.Add('Cyrillic');
  ComboBox.Items.Add('Thai');
  ComboBox.Items.Add('EastEurope');
  //ComboBox.Items.Add('OEM');
  ComboBox.ItemIndex := 0;
end;

// -----------------------------------------------------------------------------

function StrCharsetToInt(CharSet: String): Byte;
begin
  Result := DEFAULT_CHARSET;
  if CharSet = 'ANSI'         then Result := ANSI_CHARSET else
  if CharSet = 'Default'      then Result := DEFAULT_CHARSET else
  if CharSet = 'Symbol'       then Result := SYMBOL_CHARSET else
  if CharSet = 'Shiftjis'     then Result := SHIFTJIS_CHARSET else
  if CharSet = 'Hangeul'      then Result := HANGEUL_CHARSET else
  if CharSet = 'Johab'        then Result := JOHAB_CHARSET else
  if CharSet = 'GB2312'       then Result := GB2312_CHARSET else
  if CharSet = 'Chinese BIG5' then Result := CHINESEBIG5_CHARSET else
  if CharSet = 'Greek'        then Result := GREEK_CHARSET else
  if CharSet = 'Turkish'      then Result := TURKISH_CHARSET else
  if CharSet = 'Vietnamese'   then Result := VIETNAMESE_CHARSET else
  if CharSet = 'Hebrew'       then Result := HEBREW_CHARSET else
  if CharSet = 'Arabic'       then Result := ARABIC_CHARSET else
  if CharSet = 'Baltic'       then Result := BALTIC_CHARSET else
  if CharSet = 'Cyrillic'     then Result := RUSSIAN_CHARSET else
  if CharSet = 'Thai'         then Result := THAI_CHARSET else
  if CharSet = 'EastEurope'   then Result := EASTEUROPE_CHARSET;
end;

// -----------------------------------------------------------------------------

procedure AddFPS(ComboBox: TComboBox);
var
  Ini  : TIniFile;
  i    : Integer;
  Item : String;
begin
  Ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'FPS.ini');
  try
    for i := 1 to Ini.ReadInteger('FPS', 'Total', 0) do
    begin
      Item := FormatFloat('#.###', Ini.ReadFloat('FPS', IntToStr(i), 25));
      if ComboBox.Items.IndexOf(Item) = -1 then
        ComboBox.Items.Add(Item);
    end;
    if ComboBox.Items.Count > 0 then
    begin
      ComboBox.ItemIndex := Ini.ReadInteger('FPS', 'Active', 1) - 1;
      if ComboBox.Items[ComboBox.ItemIndex] = '' then
        ComboBox.ItemIndex := ComboBox.Items.IndexOf('25');
      if ComboBox.ItemIndex = -1 then
        ComboBox.ItemIndex := 0;
    end else
    begin
      ComboBox.Items.Add('15');
      ComboBox.Items.Add('20');
      ComboBox.Items.Add('23,976');
      ComboBox.Items.Add('23,978');
      ComboBox.Items.Add('24');
      ComboBox.Items.Add('25');
      ComboBox.Items.Add('29,97');
      ComboBox.Items.Add('30');
      ComboBox.ItemIndex := 5;
    end;
  finally
    Ini.Free;
  end;
end;

// -----------------------------------------------------------------------------

procedure SaveFPS(ComboBox: TComboBox);
var
  Ini : TIniFile;
  i   : Integer;
begin
  Ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'FPS.ini');
  try
    Ini.WriteInteger('FPS', 'Total', ComboBox.Items.Count);
    Ini.WriteInteger('FPS', 'Active', ComboBox.ItemIndex + 1);
    for i := 0 to ComboBox.Items.Count-1 do
      Ini.WriteString('FPS', IntToStr(i + 1), ComboBox.Items[i]);
  finally
    Ini.Free;
  end;
end;

// -----------------------------------------------------------------------------

function GetFPS: Single;
begin
  Result := StrToFloatDef(frmMain.cmbFPS.Items[frmMain.cmbFPS.ItemIndex], 25);
end;

// -----------------------------------------------------------------------------

function GetInputFPS: Single;
begin
  Result := StrToFloatDef(frmMain.cmbInputFPS.Items[frmMain.cmbInputFPS.ItemIndex], 25);
end;

// -----------------------------------------------------------------------------

procedure AddFPSItem(FPS: Single; ModifyInputFPS, ModifyFPSTimes, ModifyInputFPSTimes: Boolean);
var
  FPSStr : String;
  Index  : Integer;
begin
  if FPS <> 0 then
  begin
    FPSStr := FormatFloat('#.###', FPS);
    with frmMain do
    begin
      OldFPS := GetFPS;
      Index := cmbInputFPS.Items.IndexOf(FPSStr);
      if (Index = -1) and (FPSStr <> '') then
      begin
        cmbInputFPS.ItemIndex := cmbInputFPS.Items.Add(FPSStr);
        cmbFPS.ItemIndex      := cmbFPS.Items.Add(FPSStr);
      end else
      begin
        if ModifyInputFPS then
        begin
          OldInputFPS := FPS;
          cmbInputFPS.ItemIndex := Index;
          if ModifyInputFPSTimes then
            cmbInputFPSSelect(frmMain as TObject);
        end;
        OldFPS := FPS;
        cmbFPS.ItemIndex := Index;
        if ModifyFPSTimes then
          cmbInputFPSSelect(frmMain as TOBject);
      end;
    end;
  end;
end;

// -----------------------------------------------------------------------------

function RemoveSWTags(Text: String; Bold, Italic, Underline, Color: Boolean; OverrideNoInterWithTags: Boolean = False): String;
var
  //i: Integer; //removed by adenry
  TagPos, Tag2Pos, Tag3Pos, SearchStart: Integer; //added by adenry
begin
  if (SubtitleAPI.NoInteractionWithTags = False) or (OverrideNoInterWithTags = True) then
  begin
    //added by adenry: begin
		if Bold = True then
		begin
			Text := ReplaceString(Text, '<b>', '');
			Text := ReplaceString(Text, '</b>', '');
		end;
    if Italic  = True then
		begin
			Text := ReplaceString(Text, '<i>', '');
			Text := ReplaceString(Text, '</i>', '');
		end;
    if Underline = True then
		begin
			Text := ReplaceString(Text, '<u>', '');
			Text := ReplaceString(Text, '</u>', '');
		end;    
    if Color = True then
    begin
			Text := ReplaceString(Text, '</c>', '');
			//Text := ReplaceString(Text, '</font>', '');

      TagPos := SmartPos('<c:#', Text, False);
      Tag2Pos := SmartPos('>', Text, True, TagPos+1);
      SearchStart := 1;
			while (TagPos > 0) and (Tag2Pos > 0) do
      begin
        Tag3Pos := SmartPos('<', Text, True, TagPos+1);
        if (Tag2Pos < Tag3Pos) or (Tag3Pos = 0) then
			  	Delete(Text, TagPos, Tag2Pos-TagPos+1) else
          SearchStart := TagPos+1;
        TagPos := SmartPos('<c:#', Text, False, SearchStart);
        Tag2Pos := SmartPos('>', Text, True, TagPos+1);
      end;

      {
      TagPos := SmartPos('<font', Text, False);
      Tag2Pos := SmartPos('>', Text, True, TagPos+1);
      SearchStart := 1;
      while (TagPos > 0) and (Tag2Pos > 0) do
      begin
        Tag3Pos := SmartPos('<', Text, True, TagPos+1);
        if (Tag2Pos < Tag3Pos) or (Tag3Pos = 0) then
				  Delete(Text, TagPos, Tag2Pos-TagPos+1) else
          SearchStart := TagPos+1;
        TagPos := SmartPos('<font', Text, False, SearchStart);
        Tag2Pos := SmartPos('>', Text, True, TagPos+1);
      end;
      }
    end;
    //added by adenry: end

    //removed by adenry: begin
    {if Color = True then
    begin
			if Bold      = True then Text := ReplaceString(Text, '<b>', '');
			if Italic    = True then Text := ReplaceString(Text, '<i>', '');
			if Underline = True then Text := ReplaceString(Text, '<u>', '');
      i := SmartPos('<c:#', Text, False);
      while (i > 0) and (SmartPos('>', Text, True, i + 1) > i) do
        Delete(Text, i, SmartPos('>', Text, True, i+1)); //removed by adenry
    end;}
    //removed by adenry: end
  end;
  Result := Text;
end;

// -----------------------------------------------------------------------------

//moved outside SetColorTag by adenry
function ColorToHTML(Color: Integer): String;
begin
  Result := Format('%.2x%.2x%.2x', [GetRValue(Color), GetGValue(Color), GetBValue(Color)]);
end;

// -----------------------------------------------------------------------------

//added by adenry: begin
function HTMLToColor(HTML: String): Integer;
var
  i: Integer;
begin
  Result := -1;

  if Length(HTML) <> 6 then exit;

  for i := 1 to 6 do
    if (HTML[i] in HexChars = False) then exit;

  Result := Integer(StrToInt('$' + Copy(HTML, 1, 2))) +
            Integer(StrToInt('$' + Copy(HTML, 3, 2))) shl 8 +
            Integer(StrToInt('$' + Copy(HTML, 5, 2))) shl 16;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
//Convert HTML to SSA or SSA to HTML Color
{
function HtmlSsaColor(var Color: String): Boolean;
begin
  Result := False;
  if Length(Color) = 6 then
    if (Color[1] in HexChars)and(Color[2] in HexChars)and(Color[3] in HexChars)and(Color[4] in HexChars)and(Color[5] in HexChars)and(Color[6] in HexChars) then
    begin
      color := color[5] + color[6] + color[3] + color[4] + color[1] + color[2];
      Result := True;
    end;
end;
}
//added by adenry: end

// -----------------------------------------------------------------------------

function SetColorTag(Text: String; Color: Integer): String;
begin
  if SubtitleApi.SingleTagsMode then //added by adenry
    Text := RemoveSWTags(Text, False, False, False, True);
  //added by adenry: begin
  //if SubtitleApi.MultiTagsMode then
  //  Result := '<font color=#' + ColorToHTML(Color) + '>' + Text + '</font>' else
  //added by adenry: end
    Result := '<c:#' + ColorToHTML(Color) + '>' + Text;
  //added by adenry: begin
  if SubtitleApi.MultiTagsMode then
    Result := Result + '</c>' else
  //added by adenry: end
end;

// -----------------------------------------------------------------------------

function GetSubColor(Text: String; OnlyFullTag: Boolean = False): Integer; //OnlyFullTag added by adenry
var
  tagPos: Integer; //added by adenry
begin
  Result := -1;

  tagPos := SmartPos('<c:#', Text, False); //added by adenry

  if ((OnlyFullTag = False) and (tagPos > 0))
  or ((tagPos = 1) and (SmartPos('</c>', Text, False) in [0, Length(Text)-3])) then
  begin
    Text := Copy(Text, tagPos + 4, 7);
    if Copy(Text, 7, 1) = '>' then
    begin
      Delete(Text, 7, 1);
      Result := HTMLToColor(Text);
    end;
  end;

  //added by adenry: begin
  {
  if (Result = -1) and (OnlyFullTag = False) then
  begin
    i:=SmartPos('<font color=', Text, False);
    if (i > 0) then
    begin
      Text:=Text+'1234567890'; //to prevent memory access violations
      if Text[i+18]='>' then Text:=Copy(Text,i+12,6) else //<font color=RRGGBB>
      if (Text[i+12]='"') and (Text[i+19]='"') and (Text[i+20]='>') then Text:=Copy(Text,i+13,6) else //<font color="RRGGBB">
      if (Text[i+12]='#') and (Text[i+19]='>') then Text:=Copy(Text,i+13,6) else //<font color=#RRGGBB>
      if (Text[i+12]='"') and (Text[i+13]='#') and (Text[i+20]='"') and (Text[i+21]='>') then Text:=Copy(Text,i+14,6); //<font color="#RRGGBB">
      begin
        Result := HTMLToColor(Text);
      end;
    end;
  end;
  }
  //added by adenry: end
end;

// -----------------------------------------------------------------------------

//added by adenry: begin
function GetSingleTagsModeFontStyles(Text: String): TFontStyles;
begin
  Result := [];
  if SmartPos('<b>', Text, False) > 0 then
    Result := Result + [fsBold];
  if SmartPos('<i>', Text, False) > 0 then
    Result := Result + [fsItalic];
  if SmartPos('<u>', Text, False) > 0 then
    Result := Result + [fsUnderline];
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
function SetSingleTagsModeFontStyles(Text: String; FontStyles: TFontStyles; Replace: Boolean): String;
begin
  if Replace then
    Text := RemoveSWTags(Text, True, True, True, False);
  Result := Text;
  if fsBold in FontStyles then
    Result := '<b>' + Result;
  if fsItalic in FontStyles then
    Result := '<i>' + Result;
  if fsUnderline in FontStyles then
    Result := '<u>' + Result;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

function IsFloat(Text : String): Boolean;
var
  i: integer;
begin
  Text  := Trim(Text);
  Result := True;
  if Length(Text) = 0 then
  begin
    Result := False;
    exit;
  end else
  begin
    if (Text[1] in ['0'..'9']) = False then
    begin
      Result := False;
      exit;
    end;
    for i := 1 to Length(Text) do
    begin
      if Pos(Text[i],'0123456789+-E' + DecimalSeparator) = 0 then
      begin
        Result := False;
        Break;
      end;
    end;

  end;
end;

// -----------------------------------------------------------------------------

//modified by adenry
function StrSecToMS(Sec: String): Integer;
var
  CommaPos: Integer;
  len: Integer;
begin
  Result := 0;
  len := Length(Sec);
  if len > 0 then
  begin
    CommaPos := Pos(',', Sec);
    if CommaPos = 0 then
      CommaPos := Pos('.', Sec);
    if CommaPos > 0 then
    begin
      Result := StrToInt(Copy(Sec, 1, CommaPos-1)) * 1000;
      if CommaPos < len then
        Result := Result + StrToInt(Copy(Sec, CommaPos +1, len));
    end else
      Result := StrToInt(Sec) * 1000;
  end;
end;

// -----------------------------------------------------------------------------

procedure AddRecentFiles;
var
  Ini : TIniFile;
  i   : Integer;
begin
  Ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + ID_ININAME);
  try
    for i := 0 to frmMain.RFMaxCount-1 do
      if (Ini.ReadString('Recent',IntToStr(i),'') <> '') and
         (FileExists(Ini.ReadString('Recent',IntToStr(i),''))) and
         (RecentFiles.IndexOf(Ini.ReadString('Recent',IntToStr(i),'')) = -1) then
            RecentFiles.Add(Ini.ReadString('Recent',IntToStr(i),''));
  finally
    Ini.Free;
  end;
end;

// -----------------------------------------------------------------------------

procedure SaveRecentFiles(var Ini: TMemIniFile); //(var Ini: TMemIniFile) added by adenry
var
  //Ini : TIniFile; //removed by adenry
  i   : Integer;
begin
  //removed by adenry: begin
  {Ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + ID_ININAME);
  try}
  //removed by adenry: end
    if RecentFiles.Count > 0 then
    begin
      for i := 0 to frmMain.RFMaxCount-1 do
      begin
        if i < RecentFiles.Count then
          Ini.WriteString('Recent',IntToStr(i),RecentFiles[i]) else
          Ini.WriteString('Recent',IntToStr(i),'');
      end;
    end else
      Ini.EraseSection('Recent');
  //removed by adenry: begin
  {finally
    Ini.Free;
  end;}
  //removed by adenry: end
end;

// -----------------------------------------------------------------------------

function MsgBox(AMsg, BCap1, BCap2, BCap3: String; IconInd: Integer; MainForm: TForm; FontCharset: Integer = -1): Integer;
var
  W              : TForm;
  lCaption       : TLabel;
  But1,But2,But3 : TButton;
  i1             : integer;
  Image1         : TImage;
  IHandle        : THandle;
  P1             : array [byte] of Char;
  Textsize       : TSize;
  MDC            : hDC;
  CurMetrics     : TTextMetric;
  Curfont        : HFont;
  Msgrect        : TRect;
const UserExe: array [0..9] of Char = 'user.exe';
const
{$IFDEF Win32}
  BHeight = 23;
{$ELSE}
  BHeight = 25;
{$ENDIF}
  BWidth = 77;
begin
  W    := TForm.CreateNew(Application);
  But2 := nil;
  But3 := nil;
  AMsg := ReplaceString(AMsg, '|', #13#10);
  try
    // set up form
    W.BorderStyle  := bsDialog;
    W.Ctl3D        := True;
    W.Width        := 360;
    W.Height       := 160;
//    W.Caption      := ID_PROGRAM;
    W.Caption      := ID_PROGRAM + ' '+ ID_VERSION;
    W.Font.Name    := Mainform.Font.Name;
    W.Font.Size    := Mainform.Font.Size;
    W.Font.Style   := Mainform.Font.Style;
    if FontCharset < 0 then
      W.Font.Charset := MainForm.Font.Charset else
      W.Font.Charset := FontCharset;

    // Get text extent
    for i1 := 0 to 25 do P1[i1] := Chr(i1 + Ord('A'));
    for i1 := 0 to 25 do P1[i1 + 26] := Chr(i1 + Ord('a'));
    GetTextExtentPoint(W.Canvas.Handle, P1, 52, TextSize);

    // Get line height
    MDC := GetDC(0);
    CurFont := SelectObject(MDC, W.Font.Handle);
    GetTextMetrics(MDC, CurMetrics);
    SelectObject(MDC, CurFont);
    ReleaseDC(0, MDC);

    // Set icon
    Image1 := TImage.Create(W);
    StrPCopy(P1,ParamStr(0));

    If Image1 <> nil then
    begin
      Image1.Width  := Image1.Picture.Icon.Width;
      Image1.Height := Image1.Picture.Icon.Height;
      Image1.Left   := 20;
      Image1.Top    := Textsize.CY  + (Textsize.CY div 2);
      Image1.Width  := 32;
      Image1.Height := 32;
      Image1.Parent := W;
      Image1.Name   := 'Image';
      // get icon index
      Case IconInd of
        16:  IHandle := ExtractIcon(hInstance,userexe,3);
        32:  IHandle := ExtractIcon(hInstance,userexe,2);
        48:  IHandle := ExtractIcon(hInstance,userexe,1);
        64:  IHandle := ExtractIcon(hInstance,userexe,4);
        128: IHandle := ExtractIcon(hInstance,userexe,0);
        256: IHandle := ExtractIcon(hInstance,userexe,5);
        512: IHandle := ExtractIcon(hInstance,userexe,6);
        else IHandle := ExtractIcon(hInstance,P1,IconInd);
      end;
      If IHandle <> 0 then
        Image1.Picture.Icon.Handle := IHandle else
        Image1.Picture.Icon        := Application.Icon;
    end;

    SetRect(MsgRect, 0, 0, Screen.Width div 2, 0);
    DrawText(W.Canvas.Handle, PChar(AMsg), -1, MsgRect, DT_CALCRECT or DT_WORDBREAK);

    // Set up label
    lCaption          := TLabel.Create(W);
    lCaption.Parent   := W;
    lCaption.Left     := 72;
    lCaption.Top      := Image1.Top;
    lCaption.Width    := Msgrect.Right;
    LCaption.Height   := Msgrect.Bottom;
    lCaption.Autosize := False;
    lCaption.WordWrap := True;

    // Adjust form width...must do here to accommodate buttons
    W.Width          := lCaption.Left + lCaption.Width + 30;
    lCaption.Caption := AMsg;

    // Buttons...
    But1             := TButton.Create(W);
    But1.Parent      := W;
    But1.Caption     := BCap1;
    But1.ModalResult := 1;

    If BCap2 <> '' then
    begin
      But2             := TButton.Create(W);
      But2.Parent      := W;
      But2.Caption     := BCap2;
      But2.ModalResult := 2;
      If BCap3 <> '' then
      begin
        But3 := TButton.Create(W);
        But3.Parent      := W;
        But3.Caption     := BCap3;
        But3.ModalResult := 3;
        But3.Cancel      := True;
      end else
      But2.Cancel := True;
    end else
    But1.Cancel := True;

    // Set button positions
    // set height depending on whether icon or message is tallest
    if lCaption.Height > Image1.Height then
      But1.Top := (lCaption.Top + lCaption.Height + 20) else
      But1.Top := (Image1.Top + Image1.Height + 20);

    But1.Width  := BWidth;
    But1.Height := BHeight;

    If But2 <> nil then
    begin
      But2.Height := BHeight;
      But2.Width  := BWidth;
      But2.Top    := But1.Top;
      If But3 <> nil then
      begin
        But3.Top    := But1.Top;
        But3.Width  := BWidth;
        But3.Height := BHeight;
        But3.Left   := (W.Width div 2) + ((BWidth div 2) + 8);
        But2.Left   := (W.Width div 2) - (BWidth div 2);
        But1.Left   := (W.Width div 2) - ((BWidth div 2) + BWidth + 8);
        But3.Cancel := True;
        if But3.Width + But3.Left > W.Width - 12 then
          W.Width := But3.Width + But3.Left + 12;
      end else
      begin
        But2.Left := (W.Width div 2) + 4;
        But1.Left := (W.Width div 2) - (BWidth + 4);
      end;
    end else
     But1.Left := (W.Width div 2) - (BWidth div 2);

    But1.Default := True;
    {
    case FocusInd of
      3: If BCap3 <> '' then But3.Default := True;
      2: If BCap2 <> '' then But2.Default := True;
      else But1.Default := True;
    end;   }

    // Set clientheight to proper height
    W.ClientHeight := But1.Top + But1.Height + TextSize.CY;

    // Show messagebox
    // Set position
    W.Position := poScreenCenter;
    {W.Left := Mainform.Left + ((Mainform.Width - W.Width) div 2);
    W.Top  := Mainform.Top + ((Mainform.Height - W.Height) div 2);   }
    W.ShowModal;
    Result := W.ModalResult;

  finally
    W.Free;
  end;
end;

// -----------------------------------------------------------------------------

function QueryInput(const Caption, Prompt: String; var ResultStr: String; ParentForm: TForm): Integer;
var
  frmInput     : TForm;
  Panel        : TPanel;
  LabelEdit    : TLabeledEdit;
  ButtonOk,
  ButtonCancel : TButton;
begin
  LabelEdit := nil;
  frmInput := TForm.CreateNew(Application);
  try
    frmInput.Ctl3D        := True;
    frmInput.BorderStyle  := bsSingle;
    frmInput.BorderIcons  := [];
    //frmInput.Width        := 271; //removed by adenry
    //frmInput.Height       := 138; //removed by adenry
    frmInput.Caption      := Caption;
    frmInput.ParentFont   := True;
    frmInput.Font.Name    := ParentForm.Font.Name;
    frmInput.Font.Size    := ParentForm.Font.Size;
    frmInput.Font.Style   := ParentForm.Font.Style;
    frmInput.Font.Charset := ParentForm.Font.Charset;
    frmInput.Position     := poScreenCenter;
    frmInput.BorderIcons  := [biSystemMenu]; //added by adenry

    // We create panel...
    Panel             := TPanel.Create(frmInput);
    Panel.Parent      := frmInput;
    Panel.Caption     := '';
    Panel.Ctl3D       := True;
    Panel.ParentFont  := True;
    Panel.BorderStyle := bsNone;
    Panel.BevelInner  := bvNone;
    Panel.BevelOuter  := bvRaised;
    Panel.BevelWidth  := 1;
    Panel.Left        := 8;
    Panel.Top         := 8;
    Panel.Width       := 249;
    Panel.Height      := 65;
    Panel.Show;
    // Now we create LabelEdit...
    LabelEdit                      := TLabeledEdit.Create(frmInput);
    LabelEdit.Parent               := Panel;
    LabelEdit.ParentFont           := True;
    LabelEdit.EditLabel.ParentFont := True;
    LabelEdit.EditLabel.Caption    := Prompt;
    LabelEdit.ParentFont           := True;
    LabelEdit.Text                 := ResultStr;
    LabelEdit.Top                  := 32;
    LabelEdit.Left                 := 8;
    LabelEdit.Width                := 233;
    LabelEdit.Height               := 21;
    // Ok Button...
    ButtonOk             := TButton.Create(frmInput);
    ButtonOk.Parent      := frmInput;
    ButtonOk.ParentFont  := True;
    ButtonOk.Caption     := BTN_OK;
    ButtonOk.Top         := 80;
    ButtonOk.Left        := 48;
    ButtonOk.Width       := 81;
    ButtonOk.Height      := 25;
    ButtonOk.ModalResult := mrOk;
    ButtonOk.Default     := True;
    // Cancel Button...
    ButtonCancel             := TButton.Create(frmInput);
    ButtonCancel.Parent      := frmInput;
    ButtonCancel.ParentFont  := True;
    ButtonCancel.Caption     := BTN_CANCEL;
    ButtonCancel.Top         := 80;
    ButtonCancel.Left        := 136;
    ButtonCancel.Width       := 81;
    ButtonCancel.Height      := 25;
    ButtonCancel.ModalResult := mrCancel;
    ButtonCancel.Cancel      := True;

    frmInput.ClientWidth  := Panel.Left*2 + Panel.Width; //added by adenry
    frmInput.ClientHeight := ButtonOk.Top + ButtonOk.Height + Panel.Top; //added by adenry

    Result := frmInput.ShowModal;
  finally
    if frmInput.ModalResult = mrOk then
      ResultStr := LabelEdit.Text;
    frmInput.Free;
  end;
end;

// -----------------------------------------------------------------------------

procedure MemoKeyPress(Sender: TObject; List: TVirtualStringTree; NextLine: Boolean);
begin
  if List.SelectedCount > 1 then
    exit;
  if NextLine then
  begin
    if List.FocusedNode.Index < List.RootNodeCount-1 then
    begin
      List.ScrollIntoView(List.FocusedNode.NextSibling, True);
      List.Selected[List.FocusedNode] := False;
      List.FocusedNode := List.FocusedNode.NextSibling;
      List.Selected[List.FocusedNode] := True;
      frmMain.RefreshTimes;
      (Sender as TWinControl).SetFocus;
      if (Sender.ClassType = TSWTextEdit) and (frmMain.SelTextNL = True) then //TMemo changed to TSWTextEdit
        (Sender as TSWTextEdit).SelectAll; //TMemo changed to TSWTextEdit
    end;
  end else
  begin
    List.ScrollIntoView(List.FocusedNode.PrevSibling, True);
    List.Selected[List.FocusedNode] := False;
    if List.FocusedNode <> List.GetFirst then
      List.FocusedNode := List.FocusedNode.PrevSibling;
    List.Selected[List.FocusedNode] := True;
    frmMain.RefreshTimes;
    (Sender as TWinControl).SetFocus;
    if (Sender.ClassType = TSWTextEdit) and (frmMain.SelTextPL = True) then //TMemo changed to TSWTextEdit
      (Sender as TSWTextEdit).SelectAll; //TMemo changed to TSWTextEdit
  end;
end;

// -----------------------------------------------------------------------------

//removed by adenry:
{function AdjustLines(Line: String; GoForwardAlso: Boolean = True; FindLessDifference: Boolean = True): String;
var
  // Tags
  Bold        : Boolean;
  Italic      : Boolean;
  Underline   : Boolean;
  Color       : Integer;
  // Points to break
  BreakPoint1 : Integer;
  BreakPoint2 : Integer;
  // Other
  tmpValue1  : Integer;
  tmpValue2  : Integer;
  LineLength : Integer;
begin
  if Line = '' then
  begin
    Result := '';
    exit;
  end;
  // Store tags
  Bold      := Pos('<b>', Line) > 0;
  Italic    := Pos('<i>', Line) > 0;
  Underline := Pos('<u>', Line) > 0;
  Color     := GetSubColor(Line);
  // Remove tags
  if SubtitleApi.SingleTagsMode then //added by adenry
    Line    := RemoveSWTags(Line, True, True, True, True);

  // Make one big line...
  while Pos(#13#10, Line) > 0 do
  begin
    if Line[Pos(#13#10, Line)-1] <> ' ' then
      Insert(' ', Line, Pos(#13#10, Line));
    Delete(Line, Pos(#13#10, Line), 2);
  end;

  Line := Trim(Line);

  if (Length(Line) > frmMain.TwoLinesIfLongerThan) or (Pos('-', Line) > 0) then
  begin
    // ----------------------------------------- //
    //              The way it works             //
    //                                           //
    // We are going to do two things:            //
    //   1. Length div 2 - Backwards_until_space //
    //   2. Length div 2 - Forwards_until_space  //
    //                                           //
    // After this we are going to see in which   //
    // break point there is less difference      //
    // between lines length, and we are going to //
    // stay with it.                             //
    // ----------------------------------------- //

    LineLength := Length(Line);
    if Pos('...', Line) > 0 then
      LineLength := LineLength - 2; // As "..." takes little space on the screen, we subtract a bit of length for better calculations...
    LineLength := LineLength div 2;

    BreakPoint1 := SmartPos(' ', Line, True, LineLength, False);
    if Copy(Line, BreakPoint1+1, 1)[1] in ['?', '!']  then
      BreakPoint1 := SmartPos(' ', Line, True, LineLength -1, False);

    if GoForwardAlso then
    begin
      if FindLessDifference = False then
      begin
        BreakPoint1 := SmartPos(' ', Line, True, LineLength);
        if Copy(Line, BreakPoint1+1, 1)[1] in ['?', '!']  then
          BreakPoint1 := SmartPos(' ', Line, True, LineLength -1, False);
      end else
      begin
        BreakPoint2 := SmartPos(' ', Line, True, LineLength);
        if Copy(Line, BreakPoint2+1, 1)[1] in ['?', '!']  then
          BreakPoint2 := SmartPos(' ', Line, True, LineLength+1);
        tmpValue1 := Abs(BreakPoint1 - (Length(Line) - BreakPoint1));
        tmpValue2 := Abs(BreakPoint2 - (Length(Line) - BreakPoint2));
        if tmpValue1 <> tmpValue2 then
        begin
          if Min(tmpValue1, tmpValue2) = tmpValue2 then
            BreakPoint1 := BreakPoint2;
        end;
        if tmpValue2 < tmpValue1 then
          BreakPoint1 := BreakPoint2;
      end;
    end;

    if (StringCount('-', Line) = 1) and (Pos('-', Line) > 1) then
    begin                //
      tmpValue1 := Pos('-', Line);
      // Only if it's not a word composed by "-"
      if (Line[tmpValue1+1] in SpecialChars = True) then
      begin
        if Pos(' -', Line) = 0 then
          Insert(' ', Line, tmpValue1); // Insert a space if there is not
        BreakPoint1 := Pos(' -', Line);
      end else
      begin
        if (Length(Line) < frmMain.TwoLinesIfLongerThan) then
          BreakPoint1 := -1;
      end;
    end else
    if (Pos('-', Line) = 1) and (StringCount('-', Line) = 2) then
    begin
      if SmartPos(' -', Line, True, Pos('-', Line)+1) = 0 then
        Insert(' ', Line, SmartPos('-', Line, True, Pos('-', Line)+1)); // Insert a space if there is not
      BreakPoint1 := SmartPos(' -', Line, True, Pos('-', Line)+1);
    end else
    if (Pos('-', Line) = 1) and (StringCount('-', Line) = 1) then
    begin
      if Length(Line) < frmMain.TwoLinesIfLongerThan then
        BreakPoint1 := -1;
    end;

    if BreakPoint1 > -1 then
    begin
      Delete(Line, BreakPoint1, 1);
      Insert(#13#10, Line, BreakPoint1);
    end;
  end;

  if SubtitleApi.SingleTagsMode then //added by adenry
  begin
    // Restore tags
    if Underline = True then Line := '<u>' + Line;
    if Bold      = True then Line := '<b>' + Line;
    if Italic    = True then Line := '<i>' + Line;
    if Color > -1 then
      Line := SetColorTag(Line, Color);
  end;

  Result := Line;
end;}

// -----------------------------------------------------------------------------

procedure AdjustSubtitles(Points: TClassicSyncPoints; ActionType: Byte);
var
  Node       : PVirtualNode;
  a, b       : Extended;
  StartTime  : Integer;
  FinalTime  : Integer;
  UndoAction : PUndoAction;
begin

  ///////////////////////////////////////////////////////////////////////////
  //                                                                       //
  //                        Method 1 - More precise                        //
  //                                                                       //
  // This  is the easiest way of adjusting subtitles; what you do is watch //
  // the movie,  note  the  time at which the first subtitle line appears, //
  // move to the end of movie and note the time at which the last subtitle //
  // line appears then enter those values in Subtitle Workshop.            //
  // For  example, I watch the video and at 00:10:00,000 the first line is //
  // spoken  but  it appears at 00:05:00,000 in my subtitle file. The last //
  // subtitle  line  is  spoken at 02:10:00,000 but in my subtitle file it //
  // appears at 01:45:00,000. Let's do the math...                         //
  //                                                                       //
  // The scope in the movie is:                                            //
  //                                                                       //
  // 02:10:00,000-00:10:00,000=02:00:00,00=7.200,000 seconds               //
  //                                                                       //
  // The scope in the subtitle is:                                         //
  //                                                                       //
  // 01:45:00,000-00:05:00,000=01:40:00,000=6.000,000 seconds              //
  //                                                                       //
  // The coefficient is:                                                   //
  //                                                                       //
  // 7.200,000/6.000,000=1,2                                               //
  //                                                                       //
  // Ok,  let's  do  it...  You  need  to set the offset (delay) for every //
  // subtitle  line  (move  them) so the first one appears at 00:00:00,000 //
  // and the last one appears at 01:40:00,000. This is very important!     //
  //                                                                       //
  // So,  now  that  you moved all the subtitles you simply multiply every //
  // time  with  the  coefficient and add 00:10:00,000 to multiplied times //
  // (the  time  when the first subtitle appears in the movie) and presto! //
  // instantly adjusted subtitles! It would take users a minute to do this //
  // and  subtitles  would  match  the first time around. Precision is the //
  // keyword  here  so  you would need to do all calculations unto a third //
  // decimal place.                                                        //
  ///////////////////////////////////////////////////////////////////////////

  ///////////////////////////////////////////////////////////////////////////
  //                                                                       //
  //        Method 2 - Supports two random points in video/subtitle        //
  //                                                                       //
  // It is a simple 2x2 linear system of equations. I need to figure out   //
  // the parameters of a funtion of the type f(x) = ax+b being a and b     //
  // this unknown parámeters, so I need two pairs of f(x) and x values to  //
  // be able to determine a and b :                                        //
  //                                                                       //
  // (1)    f(x1) = a * x1 + b     2x2 system (2 equations and 2 unknown   //
  //                                           parameters a & b)           //
  // (2)    f(x2) = a * x2 + b                                             //
  //                                                                       //
  // so, isolating a from (1) :                                            //
  // (3)    a = [ f(x1) - b ] / x1                                         //
  // replacing a from (3) in (2) :                                         //
  // (4)    f(x2) = [ f(x1) - b ] / x1 * x2 + b                            //
  // isolating b from (4) :                                                //
  // (5)    b = [f(x2)*x1 - f(x1)*x2 ] / (x1 - x2)                         //
  // replacing b from (5) into (3) :                                       //
  // (6)    a = [ f(x1) - f(x2) ] / (x1 - x2)                              //
  //                                                                       //
  // This gives you a (6) and b (5), now, you take each frame number of    //
  // the subtitles and apply the formula : f(x) = a * x + b, being x this  //
  // frame number, and f(x) the new frame number. So x1 and f(x1) are the  //
  // values you select of SubFileFrame and WantedFrame for the FirstPoint  //
  // and x2 and f(x2) the values you select for SubFileFrame and           //
  // WantedFrame for LastPoint.                                            //
  ///////////////////////////////////////////////////////////////////////////

  // If the points in the subtitle are not the first & last then use method 2...
  if (Points.Point1Sub <> GetStartTime(frmMain.lstSubtitles.GetFirst)) and
     (Points.Point2Sub <> GetStartTime(frmMain.lstSubtitles.GetLast)) then
  begin
    if (Points.Point1Movie <> Points.Point2Movie) and
       (Points.Point1Sub <> Points.Point2Sub) then
    begin
      a := (Points.Point1Movie - Points.Point2Movie)  / (Points.Point1Sub - Points.Point2Sub);
      b := Trunc((Points.Point1Movie - a * Points.Point1Sub) / a);
    end else
    begin
      a := 1;
      b := Points.Point1Movie - Points.Point1Sub;
    end;

    Node  := frmMain.lstSubtitles.GetFirst;
    while Assigned(Node) do
    begin
      StartTime := GetStartTime(Node);
      FinalTime := GetFinalTime(Node);

      New(UndoAction);
      UndoAction^.UndoActionType := uaTimeChange;
      //added by adenry: begin
      case ActionType of
        1: UndoAction^.UndoActionName := uanAdjustSubs;
        2: UndoAction^.UndoActionName := uanAdjustSubsSyncPoints;
        3: UndoAction^.UndoActionName := uanAdjustToSynchSubs;
      end;
      //added by adenry: end
      UndoAction^.BufferSize     := SizeOf(TTimeChange);
      UndoAction^.Buffer         := AllocMem(UndoAction^.BufferSize);
      UndoAction^.Node           := Node;
      UndoAction^.LineNumber     := Node.Index;
      UndoAction^.BindToNext     := True;
      PTimeChange(UndoAction^.Buffer)^.StartTime := StartTime;
      PTimeChange(UndoAction^.Buffer)^.FinalTime := FinalTime;
      AddUndo(UndoAction);

      SetStartTime(Node, Round(a * StartTime + b));
      SetFinalTime(Node, Round(a * FinalTime + b));
      Node := Node.NextSibling;
    end;
  end else
  // Use the most precise method, very useful in this case
  begin
    if ((Points.Point2Movie - Points.Point1Movie) > 0) and ((Points.Point2Sub - Points.Point1Sub) > 0) then
    begin
      // a = coefficient
      a := (Points.Point2Movie - Points.Point1Movie) / (Points.Point2Sub - Points.Point1Sub);
      // b = delay
      b := GetStartTime(frmMain.lstSubtitles.GetFirst);

      Node  := frmMain.lstSubtitles.GetFirst;
      while Assigned(Node) do
      begin
        StartTime := GetStartTime(Node);
        FinalTime := GetFinalTime(Node);

        New(UndoAction);
        UndoAction^.UndoActionType := uaTimeChange;
        //added by adenry: begin
        case ActionType of
          1: UndoAction^.UndoActionName := uanAdjustSubs;
          2: UndoAction^.UndoActionName := uanAdjustSubsSyncPoints;
          3: UndoAction^.UndoActionName := uanAdjustToSynchSubs;
        end;
        //added by adenry: end
        UndoAction^.BufferSize     := SizeOf(TTimeChange);
        UndoAction^.Buffer         := AllocMem(UndoAction^.BufferSize);
        UndoAction^.Node           := Node;
        UndoAction^.LineNumber     := Node.Index;
        UndoAction^.BindToNext     := True;
        PTimeChange(UndoAction^.Buffer)^.StartTime := StartTime;
        PTimeChange(UndoAction^.Buffer)^.FinalTime := FinalTime;
        AddUndo(UndoAction);

        SetStartTime(Node, Round((StartTime - b) * a + Points.Point1Movie));
        SetFinalTime(Node, Round((FinalTime - b) * a + Points.Point1Movie));
        Node := Node.NextSibling;
      end;
    end;
  end;

  if UndoList.Count > 0 then
    PUndoAction(UndoList.Last)^.BindToNext := False;

  frmMain.RefreshTimes;
  //frmMain.OrgModified   := True; //removed by adenry - MODIFIED bug fix - SetText/SetTranslation/SetStartTime/SetFinalTime handle the MODIFIED flags
  //frmMain.TransModified := True; //removed by adenry - MODIFIED bug fix - SetText/SetTranslation/SetStartTime/SetFinalTime handle the MODIFIED flags
  frmMain.AutoRecheckAllErrors(TimeErrors); //added by adenry
  //frmMain.lstSubtitles.Refresh; //AutoRecheck***Errors refreshes it
end;

// ---------------------------------------------------------------------------//
//                                                                            //
//                     Search & Replace related functions                     //
//                                                                            //
// ---------------------------------------------------------------------------//

function Replace(Text, This, ByThis: String; CaseSensitive, WholeWords, PreserveCase: Boolean): String;
begin
  if ByThis = '' then PreserveCase := False;
  Result := sm.Replace(This, ByThis, Text, not CaseSensitive, WholeWords, PreserveCase);
end;

// -----------------------------------------------------------------------------

function ContainsString(Text, This: String; CaseSensitive, WholeWords: Boolean): Boolean;
begin
  Result := Replace(Text, This, '', CaseSensitive, WholeWords, False) <> Text;
end;

// -----------------------------------------------------------------------------

//removed by adenry: not used
{function ReplaceInNode(This, ByThis: String; CaseSensitive, WholeWords, PreserveCase, SelectedItemToEnd: Boolean): PVirtualNode;
var
  Node   : PVirtualNode;
  RepStr : String;
  Text   : String;
  Bold, Italic, Underline: Boolean;
  Color : Integer;
  BreakNext: Boolean;
begin
  Result    := nil;
  BreakNext := False;
  if SelectedItemToEnd then
    Node := frmMain.lstSubtitles.GetFirstSelected.NextSibling else
    Node := frmMain.lstSubtitles.GetFirst;
  while Assigned(Node) do
  begin

    Text      := GetSubText(Node);
    Bold      := Pos('<b>', Text) > 0;
    Italic    := Pos('<i>', Text) > 0;
    Underline := Pos('<u>', Text) > 0;
    Color     := GetSubColor(Text);
    Text      := RemoveSWTags(Text, True, True, True, True);

    RepStr := Replace(Text, This, ByThis, CaseSensitive, WholeWords, PreserveCase);
    if Text <> RepStr then
    begin
      if SubtitleAPI.NoInteractionWithTags = False then
      begin
        // Restore tags
        if Underline = True then RepStr := '<u>' + RepStr;
        if Bold      = True then RepStr := '<b>' + RepStr;
        if Italic    = True then RepStr := '<i>' + RepStr;
        if Color > -1 then
          RepStr := SetColorTag(RepStr, Color);
      end;
      SetText(Node, RepStr);
      BreakNext := True;
    end;

    if frmMain.mnuTranslatorMode.Checked then
    begin
      Text      := GetSubTranslation(Node);
      Bold      := Pos('<b>', Text) > 0;
      Italic    := Pos('<i>', Text) > 0;
      Underline := Pos('<u>', Text) > 0;
      Color     := GetSubColor(Text);
      Text      := RemoveSWTags(Text, True, True, True, True);

      RepStr := Replace(Text, This, ByThis, CaseSensitive, WholeWords, PreserveCase);
      if Text <> RepStr then
      begin
        if SubtitleAPI.NoInteractionWithTags = False then
        begin
          // Restore tags
          if Underline = True then RepStr := '<u>' + RepStr;
          if Bold      = True then RepStr := '<b>' + RepStr;
          if Italic    = True then RepStr := '<i>' + RepStr;
          if Color > -1 then
            RepStr := SetColorTag(RepStr, Color);
        end;
        SetTranslation(Node, RepStr);
        BreakNext := True;
      end;
    end;

    if BreakNext then
    begin
      UnSelectAll(frmMain.lstSubtitles);
      frmMain.lstSubtitles.ScrollIntoView(Node, True);
      frmMain.lstSubtitles.FocusedNode := Node;
      frmMain.lstSubtitles.Selected[Node] := True;
      Result := Node;
      Break;
    end;

    Node := Node.NextSibling;
  end;
end;}

// -----------------------------------------------------------------------------

function FindInNode(This: String; CaseSensitive, MatchWholeWords, SelectedItemToEnd: Boolean): PVirtualNode;
var
  Node      : PVirtualNode;
  Text      : String;
  BreakNext : Boolean;
begin
  Result    := nil;
  BreakNext := False;
  if SelectedItemToEnd then
    Node := frmMain.lstSubtitles.GetFirstSelected.NextSibling else
    Node := frmMain.lstSubtitles.GetFirst;
  while Assigned(Node) do
  begin
    Text := RemoveSWTags(GetSubText(Node), True, True, True, True);
    if ContainsString(Text, This, CaseSensitive, MatchWholeWords) then
      BreakNext := True;

    if frmMain.mnuTranslatorMode.Checked then
    begin
      Text := RemoveSWTags(GetSubTranslation(Node), True, True, True, True);
      if ContainsString(Text, This, CaseSensitive, MatchWholeWords) then
        BreakNext := True;
    end;

    if BreakNext then
    begin
      UnSelectAll(frmMain.lstSubtitles);
      frmMain.lstSubtitles.ScrollIntoView(Node, True);
      frmMain.lstSubtitles.FocusedNode := Node;
      frmMain.lstSubtitles.Selected[Node] := True;
      Result := Node;
      Break;
    end;

    Node := Node.NextSibling;
  end;
end;

// -----------------------------------------------------------------------------

function GetFormatExt(FormatIndex: Integer): String;
var
  FName : String;
begin
  SubtitleAPI.GetFormatInfo(FormatIndex, FName, Result);
  if Pos(';', Result) = 0 then
    Result := Copy(Result, 2, Length(Result)) else
    Result := Copy(Result, 2, Pos(';', Result)-2);
end;

// -----------------------------------------------------------------------------

procedure GetFormatsList(Result: TStrings);
var
  i, TotalFormats: Integer;
  Desc, Ext: String;
begin
  TotalFormats := SubtitleAPI.FormatsCount;
  if (Assigned(Result)) and (TotalFormats > 0) then
  begin
    Result.Clear;
    for i := 1 to TotalFormats do
    begin
      SubtitleAPI.GetFormatInfo(i, Desc, Ext);
      Result.Add(Desc);
    end;
  end;
end;

// -----------------------------------------------------------------------------

function GetVideoInfo(const FileName: String; var FPS: Single; var Duration: Integer): Boolean;
const
  AviHeaderStart = 32; // Needed for positioning in the avi file
var
  f : File;
  // Temporary values
  TempFormatTest : array[0..2] of Char; // should be "AVI"
  TempMicroSec   : Integer;
  LengthInFrames : Integer;
begin
  // Get file size...
  FileMode := fmOpenRead;
  AssignFile(f, FileName);
  try
    {$I-}
    Reset(f, 1);
    {$I+}
    if IOResult = 0 then
    begin
      Seek(f, 8);
      BlockRead(f, TempFormatTest, SizeOf(TempFormatTest));
      if TempFormatTest <> 'AVI' then
      begin
        Result := False;
        Exit;
      end;
      Seek(f, AviHeaderStart);
      BlockRead(f, TempMicroSec, 4);
      // Length of movie in frames
      Seek(f, AviHeaderStart + 16);
      BlockRead(f, LengthInFrames, 4);
      // ---------------------- //
      //   Final calculations   //
      // ---------------------- //
      if TempMicroSec > 0 then
      begin
        FPS      := 1000000 / TempMicroSec; // Video FPS
        Duration := Trunc((LengthInFrames / FPS) * 1000); // Length in milliseconds
        Result   := (FPS > 0) and (Duration > 0);
      end else
        Result := False;
    end else
      Result := False;
  finally
    CloseFile(f);
  end;
end;

// -----------------------------------------------------------------------------

function GetLengthForEachLine(Text: String): String;
var
  TotLen  : Integer;
  PosEnter: Integer;
begin
  Result := '';
  //TotLen := Length(Text) - StringCount(#13#10, Text) * 2; //removed by adenry
  PosEnter := Pos(#13#10, Text);
  if PosEnter > 0 then
  begin
		TotLen:=0; //added by adenry
    while PosEnter > 0 do
    begin
			TotLen:=TotLen+Length(RemoveSWTags(Copy(Text, 1, PosEnter-1), True, True, True, True)); //added by adenry
      Result := Result + IntToStr(Length(RemoveSWTags(Copy(Text, 1, PosEnter-1), True, True, True, True))) + '/';
      Text := Copy(Text, PosEnter + 2, Length(Text));
      PosEnter := Pos(#13#10, Text);
    end;
		TotLen:=TotLen+Length(RemoveSWTags(Text, True, True, True, True)); //added by adenry
    Result := Result + IntToStr(Length(RemoveSWTags(Text, True, True, True, True))) + '=' + IntToStr(TotLen);
  end else
  Result := IntToStr(Length(RemoveSWTags(Text, True, True, True, True)));
end;

// -----------------------------------------------------------------------------

//removes unnecessary spaces and new lines in the beginning and end of texts
procedure TrimParts(var Part1, Part2: String);
var
  i        : Integer;
  tmpLines : TStrings;
begin
  tmpLines := TStringList.Create;
  try
    tmpLines.Text := Part1;
    for i := 0 to tmpLines.Count-1 do
      tmpLines[i] := Trim(tmpLines[i]);
    Part1 := tmpLines.Text;

    tmpLines.Text := Part2;
    for i := 0 to tmpLines.Count-1 do
      tmpLines[i] := Trim(tmpLines[i]);
    Part2 := tmpLines.Text;

    if Copy(Part1, Length(Part1)-1, 2) = #13#10 then
      Part1 := Copy(Part1, 1, Length(Part1)-2);
    if Copy(Part2, Length(Part2)-1, 2) = #13#10 then
      Part2 := Copy(Part2, 1, Length(Part2)-2);
  finally
    tmpLines.Free;
  end;
end;

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure DivideSubText(SubtitleText: String; var Breaks: TOpenIntegerArray; const AdjustAutomatically: Boolean; var Out1, Out2: String; var MaxBreaks: Integer);

  procedure ProcessStringToDivide(StringToDivide: String; var Breaks: TOpenIntegerArray; const AdjustAutomatically: Boolean; var Out1, Out2: String; var MaxBreaks: Integer);
  var
    PosEnter : Integer;
    PrevI    : Integer;
    Temp     : String;
    Temp2    : String; //added by adenry
    InBreak  : Integer;
  begin
    //added by adenry: begin
    //remove unnecessary new lines
    while Pos(#13#10#13#10, StringToDivide) > 0 do Delete(StringToDivide, Pos(#13#10#13#10, StringToDivide), 2);
    if Pos(#13#10, StringToDivide) = 1 then Delete(StringToDivide, 1, 2);
    if Copy(StringToDivide, Length(StringToDivide)-1, 2) = #13#10 then
      Delete(StringToDivide, Length(StringToDivide)-1, 2);
    //added by adenry: end
    SetLength(Breaks, 0);
    PrevI    := 0;
    Temp     := StringToDivide;
    PosEnter := Pos(#13#10, Temp);
    if PosEnter = 0 then
    begin
      Out1 := StringToDivide; //added by adenry
      exit;
    end;
    while PosEnter <> 0 do
    begin
      SetLength(Breaks, Length(Breaks)+1);
      Breaks[Length(Breaks)-1] := PosEnter + PrevI;
      PrevI    := PrevI + PosEnter + Length(#13#10)-1;
      Temp     := Copy(Temp, PosEnter + 2, Length(Temp) - PosEnter - 1);
      PosEnter := Pos(#13#10, Temp);
    end;
    MaxBreaks := Length(Breaks);
    InBreak   := (StringCount(#13#10, StringToDivide) + 1) div 2;
  
    if Length(Breaks) > 0 then
    begin
      //added by adenry: begin
      //determine middle row position
      if (MaxBreaks > 1) and ((MaxBreaks+1) mod 2 = 1) then
      begin
        if MaxBreaks > 3 then
          Temp := Copy(StringToDivide, Breaks[InBreak-2]+2, Breaks[InBreak-1]-1-(Breaks[InBreak-2]+2)) else
          Temp := Copy(StringToDivide, 1, Breaks[0]-1);
        Temp2 := Copy(StringToDivide, Breaks[InBreak-1]+2, Breaks[InBreak]-(Breaks[InBreak-1]+2));
  
        Temp := RemoveSWTags(Temp, True, True, True, True);
        Temp2 := RemoveSWTags(Temp2, True, True, True, True);
  
        if not (Temp2[1] in dashes) then
        if not (Temp[Length(Temp)] in ['!', '?', '.']) then
          if (Temp2[Length(Temp2)] in ['!', '?', '.']) then
            InBreak := InBreak + 1 else
            if Temp[Length(Temp)] <> ',' then
              if Temp2[Length(Temp2)] = ',' then
                InBreak := InBreak + 1 else
                if Temp[Length(Temp)] <> ':' then
                  if Temp2[Length(Temp2)] = ':' then
                    InBreak := InBreak + 1 else
                    if Temp[Length(Temp)] <> '-' then
                      if Temp2[Length(Temp2)] = '-' then
                        InBreak := InBreak + 1 else
                        if Temp[Length(Temp)] <> ';' then
                          if Temp2[Length(Temp2)] = ';' then
                            InBreak := InBreak + 1 else
                            if Temp[Length(Temp)] <> '"' then
                              if Temp2[Length(Temp2)] = '"' then
                                InBreak := InBreak + 1;
      end;
      //added by adenry: end
  
      Out1 := Copy(StringToDivide, 1, Breaks[InBreak-1]-1);
      Out2 := Copy(StringToDivide, Breaks[InBreak-1] + 2, Length(StringToDivide) - Breaks[InBreak-1]-1);//last -1 added by adenry
      if AdjustAutomatically then
      begin
        //Out1 := AdjustLines(Out1); //removed by adenry
        //Out2 := AdjustLines(Out2); //removed by adenry
        //added by adenry: begin
        Out1 := ReplaceEnters(Out1, ' ');
        Out1 := SmartWrapText(Out1, frmMain.OrgCharset, TooLongLine, False, False);
        if HasTooLongLine(Out1) then
          Out1 := BreakTextInTheMiddle(Out1);
        Out2 := ReplaceEnters(Out2, ' ');
        Out2 := SmartWrapText(Out2, frmMain.OrgCharset, TooLongLine, False, False);
        if HasTooLongLine(Out2) then
          Out2 := BreakTextInTheMiddle(Out2);
        //added by adenry: end
      end;
      //added by adenry: begin
      //remove leading dashes:
      Temp := Copy(RemoveSWTags(Out1, True, True, True, True), 1, 1);
      if Length(Temp) = 1 then
        if (Temp[1] in Dashes) then
          Delete(Out1, Pos(Temp, Out1), 1);
      Temp := Copy(RemoveSWTags(Out2, True, True, True, True), 1, 1);
      if Length(Temp) = 1 then
        if (Temp[1] in Dashes) then
          Delete(Out2, Pos(Temp, Out2), 1);
      //added by adenry: end
      TrimParts(Out1, Out2);
    end;
  end;

var
  FontStyles : TFontStyles;
  i          : Byte;
  tagPos     : Word;
begin
  FontStyles := GetSingleTagsModeFontStyles(SubtitleText);

  if Pos(#13#10, SubtitleText) = 0 then
    SubtitleText := SmartWrapText(SubtitleText, frmMain.OrgCharset, frmMain.BreakLineAfter);
  ProcessStringToDivide(SubtitleText, Breaks, AdjustAutomatically, Out1, Out2, MaxBreaks);
  TrimParts(Out1, Out2);

  if Out2 = '' then
    exit else
  //set tags:
  if SubtitleApi.SingleTagsMode then //added by adenry
  begin
    Out1 := SetSingleTagsModeFontStyles(Out1, FontStyles, True);
    Out2 := SetSingleTagsModeFontStyles(Out2, FontStyles, True);
  end else
  if SubtitleApi.MultiTagsMode then //new multiple tags mode
  begin

    //Out1
    for i := 1 to StringCount('<b>', Out1, False) - StringCount('</b>', Out1, False) do
      Out1 := Out1+'</b>';
    for i := 1 to StringCount('<i>', Out1, False) - StringCount('</i>', Out1, False) do
      Out1 := Out1+'</i>';
    for i := 1 to StringCount('<u>', Out1, False) - StringCount('</u>', Out1, False) do
      Out1 := Out1+'</u>';
    for i := 1 to StringCount('<c:#', Out1, False) - StringCount('</c>', Out1, False) do
      Out1 := Out1+'</c>';
    {
    for i := 1 to StringCount('<font', Out1, False) - StringCount('</font>', Out1, False) do
      Out1 := Out1+'</font>';
    }

    //Out2
    for i := 1 to StringCount('</b>', Out2, False) - StringCount('<b>', Out2, False) do
      Out2 := '<b>'+Out2;
    for i := 1 to StringCount('</i>', Out2, False) - StringCount('<i>', Out2, False) do
      Out2 := '<i>'+Out2;
    for i := 1 to StringCount('</u>', Out2, False) - StringCount('<u>', Out2, False) do
      Out2 := '<u>'+Out2;
    for i := 1 to StringCount('</c>', Out2, False) - StringCount('<c:#', Out2, False) do
      if i = 1 then
      begin
        //set last font tag from Out1
        tagPos := SmartPos('<c:#', Out1, False, Length(Out1)-1, False);
        if tagPos > 0 then
          Out2 := Copy(Out1, tagPos, 11) + Out2;
      end else
        //remove unnecessary </c> tag
        Delete(Out2, SmartPos('</c>', Out2, False), 7);
    {
    for i := 1 to StringCount('</font>', Out2, False) - StringCount('<font color=', Out2, False) do
      if i = 1 then
      begin
        //set last font tag from Out1
        tagPos := SmartPos('<font color=', Out1, False, Length(Out1)-1, False);
        if tagPos > 0 then
          Out2 := Copy(Out1, tagPos, 20) + Out2;
      end else
        //remove unnecessary </font> tag
        Delete(Out2, SmartPos('</font>', Out2, False), 7);
    }
  end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
//Calculate the duration of the first subtitle after subtitle division in two - this is new code + what was part of TfrmDivideLines.CalculateTimes
//the duration of the second subtitle will obviously be the duration of the initial undivided subtitile minus this duration minus the pause
function DivideSubDuration(Node:PVirtualNode; Text1:String; Prop1,Prop2:Byte; Pause:Integer; AutomaticDur:Boolean=False): Integer;
var
  InitialTime   : Integer;
  FinalTime     : Integer;
  DurPerChar    : Single;
  TotalLength   : Integer;
  TotalDuration : Integer;
  Duration1     : Integer;
  MinDuration   : Word;
begin
  with frmMain do
  begin
    InitialTime   := GetStartTime(Node);
    FinalTime     := GetFinalTime(Node);
    TotalDuration := FinalTime - InitialTime - Pause;
    if AutomaticDur = False then
    begin
      Duration1 := Rnd( TotalDuration / ((Prop1+Prop2)*Prop1) ); //- Pause added by adenry //Trunc replaced with Rnd by adenry
      //added by adenry: round time value:
      if AutoRoundTimeVals then
        Duration1 := RoundTimeValue(Duration1, RoundingFactor);
    end else
    begin
      TotalLength := Length(RemoveSWTags(GetSubText(Node),True,True,True,True)) - 2*StringCount(#13#10, GetSubText(Node));
      if TotalLength > 0 then
        DurPerChar := TotalDuration / TotalLength else // Milliseconds //- Pause added by adenry
        DurPerChar := 0;
      Duration1 := Rnd(DurPerChar * (Length(RemoveSWTags(Text1,True,True,True,True))-2*StringCount(#13#10, Text1)) );
      //round time value:
      if AutoRoundTimeVals then
        Duration1 := RoundTimeValue(Duration1, RoundingFactor);
      //Keep min duration:
      if KeepMinDur and (TotalDuration >= 2*KeepMinDurValue) then
      begin
        if Duration1 < KeepMinDurValue then
          Duration1 := KeepMinDurValue else
        if TotalDuration - Duration1 < KeepMinDurValue then
          Duration1 := TotalDuration - KeepMinDurValue;
      end else
      //Check for zero durations
      begin
        MinDuration := Max(1,RoundingFactor*Integer(AutoRoundTimeVals));
        if Duration1 < MinDuration then
          Duration1 := MinDuration else
        if TotalDuration - Duration1 < MinDuration then
          Duration1 := TotalDuration - MinDuration;
      end;
    end;
    Result := Duration1;
  end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

function FixRTLPunctuation(S: String): String;
const
  SpecialChars = '.,:;''()-?!+=*&$^%#@~`" /';
  Delimiter    = #13#10;
var
  Posit : Integer;
  A,B   : String;

  function FixSubString(Sub: String): String;
  var
    Prefix : String;
    Suffix : String;
    Temp   : String;
    P,I    : Integer;
  begin
    Temp   := Sub;
    Prefix := '';
    Suffix := '';
    I      := 1;
    if Temp = '' then
    begin
      Result := '';
      exit;
    end;
  
    P := Pos(Temp[i], SpecialChars);
    while P <> 0 do
    begin
      Prefix := Prefix + Temp[i];
      Temp   := Copy(Temp, 2, Length(Temp)-1);
      if Temp = '' then
        P := 0 else
        P := Pos(Temp[i], SpecialChars);
    end;
    if Suffix = ' -' then Suffix := '- ';
  
    I := Length(Temp);
    if Temp = '' then
      P := 0 else
      P := Pos(Temp[i], SpecialChars);
    while P <> 0 do
    begin
      Suffix := Suffix + Temp[I];
      Temp   := Copy(Temp, 1, Length(Temp)-1);
      i      := Length(Temp);
      if Temp = '' then
        P := 0 else
        P := Pos(Temp[i], SpecialChars);
      end;
    if Prefix = '- ' then Prefix := ' -';
  
    Result := Suffix + Temp + Prefix;
  end;

var
  Bold      : Boolean;
  Italic    : Boolean;
  Underline : Boolean;
  Color     : Integer;
begin
  // Store tags
  Bold      := Pos('<b>', S) > 0;
  Italic    := Pos('<i>', S) > 0;
  Underline := Pos('<u>', S) > 0;
  Color     := GetSubColor(S);
  // Remove tags
  if SubtitleApi.SingleTagsMode then //added by adenry
    S := RemoveSWTags(S, True, True, True, True);

  A := S;
  B := '';
  Posit := Pos(Delimiter, A);
  while Posit > 0 do
  begin
    B     := B + FixSubString(Copy(A, 1, Posit-1)) + Delimiter;
    A     := Copy(A, Posit + Length(Delimiter), Length(A) - Posit);
    Posit := Pos(Delimiter, A);
  end;
  B := B + FixSubString(A);

  if SubtitleApi.SingleTagsMode then //added by adenry
  begin
    // Restore tags
    if Underline = True then B := '<u>' + B;
    if Bold      = True then B := '<b>' + B;
    if Italic    = True then B := '<i>' + B;
    if Color > -1 then
      B := SetColorTag(B, Color);
  end;
  Result := B;
end;

// -----------------------------------------------------------------------------

//added by adenry: begin
//trim leading zeros for compact display of time
function TrimTimeString(Text: WideString): WideString;
begin
  while Text[1] in [WideChar('0'), WideChar(':')] do
    if Text[2] <> WideChar(',') then
      Delete(Text,1,1) else
      break;
  Result := Text;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
function IsTagPart(Text: String; n: Integer): Boolean;
var
  tagOpen, tagClose, temp: Integer;
  tag: String;
begin
  Result := False;
  if (n < 1) or (n > Length(Text)) then exit;
  //if Length(Copy(Text, n, 1)) = 1 then
  begin
    tagOpen  := SmartPos('<', Text, False, n, False);
    if (tagOpen > 0) and (tagOpen > SmartPos('>', Text, False, Max(1,n-1), False)) then
    begin
      tagClose := SmartPos('>', Text, False, n, True);
      temp := SmartPos('<', Text, False, n+1, True);
      if (tagClose > 0) and ((tagClose < temp) or (temp=0)) then
      begin
        tag := Copy(Text, tagOpen, 3);
        if (tag = '<b>') or (tag = '<i>') or (tag = '<u>')
        or (tag = '<B>') or (tag = '<I>') or (tag = '<U>') then
        begin
          Result := True;
          exit;
        end;
        tag := Copy(Text, tagOpen, 4);
        if (tag = '</b>') or (tag = '</i>') or (tag = '</u>') or (tag = '</c>')
        or (tag = '</B>') or (tag = '</I>') or (tag = '</U>') or (tag = '</C>')
        or (tag = '<c:#') or (tag = '<C:#') then
        begin
          Result := True;
          exit;
        end;
        {
        tag := Copy(Text, tagOpen, 5);
        if SmartPos('<font', tag, False) > 0 then
        begin
          Result := True;
          exit;
        end;
        tag := Copy(Text, tagOpen, 7);
        if SmartPos('</font>', tag, False) > 0 then
        begin
          Result := True;
          exit;
        end;
        }
      end;
    end;

  end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
function CloseUnclosedTags(Text, OpenTag, CloseTag: String): String;
var
  dif: Integer;
begin
  //dif := Round( ((Length(Text)-Length(StringReplace(Text,OpenTag,'',[rfReplaceAll])))/Length(OpenTag))-((Length(Text)-Length(StringReplace(Text,CloseTag,'',[rfReplaceAll])))/Length(CloseTag)) );
  dif := StringCount(OpenTag, Text, False) - StringCount(CloseTag, Text, False);
  while dif > 0 do
  begin
    Text := Text + CloseTag;
    dif := dif - 1;
  end;
  Result := Text;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
function FixTagsPositions(Text: String): String;
begin
  if SubtitleApi.MultiTagsMode then
  begin
    //TODO: We should also fix <c:# tags at the end of a line somehow...
    while (Pos('<i>'+#13#10, Text)>0) or (Pos('<b>'+#13#10, Text)>0) or (Pos('<u>'+#13#10, Text)>0) do
    begin
      Text := ReplaceString(Text, '<i>'+#13#10, #13#10+'<i>');
      Text := ReplaceString(Text, '<b>'+#13#10, #13#10+'<b>');
      Text := ReplaceString(Text, '<u>'+#13#10, #13#10+'<u>');
    end;
    while (Pos(#13#10+'</i>', Text)>0) or (Pos(#13#10+'</b>', Text)>0) or (Pos(#13#10+'</u>', Text)>0) or (Pos(#13#10+'</c>', Text)>0) {or (Pos(#13#10+'</font>', Text)>0)} do
    begin
      Text := ReplaceString(Text, #13#10+'</i>', '</i>'+#13#10);
      Text := ReplaceString(Text, #13#10+'</b>', '</b>'+#13#10);
      Text := ReplaceString(Text, #13#10+'</u>', '</u>'+#13#10);
      Text := ReplaceString(Text, #13#10+'</c>', '</c>'+#13#10);
      {
      Text := ReplaceString(Text, #13#10+'</font>', '</font>'+#13#10);
      }
    end;
  end;
  Result := Text;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
//trim leading and trailing spaces and new lines
function TrimSpacesAndNewLinesOnly (S: String): String;
var
  I, L: Integer;
begin
  L := Length(S);
  I := 1;
  while (I <= L) and (S[I] in [' ', #13, #10]) do Inc(I);
  if I > L then Result := '' else
  begin
    while S[L] in [' ', #13, #10] do Dec(L);
    Result := Copy(S, I, L - I + 1);
  end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
{
function RTFtoHTML(re: TRichEdit): String;
var
  jvretohtml: TJvRichEditToHtml;
  Strings: TStringList;
  THETEXT, s1, s2, s3, s4: String;
begin
  Result := GetRichEditText(re); //Result := re.Text;

  s1 := '<SPAN style="color: #' + ColorToHTML(re.Font.Color) + '; font-size: ' + IntToStr(re.Font.Size) + 'pt; font-family: ' + re.Font.Name + ';">';
  s2 := '</SPAN>';
  s3 := '<SPAN style="color: #';
  s4 := '; font-size: ' + IntToStr(re.Font.Size) + 'pt; font-family: ' + re.Font.Name + ';">';

  Strings := TStringList.Create;
  jvretohtml := TJvRichEditToHtml.Create(Application);
  jvretohtml.ConvertToHtmlStrings(re, Strings);

  THETEXT := Strings.Text;
  //Remove '<HTML>'+#13#10+'  <HEAD>'+#13#10+'    <TITLE></TITLE>'+#13#10+'  </HEAD>'+#13#10+'  <BODY>'+#13#10#13#10+'<P STYLE="text-align: left;">'
  THETEXT := StringReplace(THETEXT, '<HTML>'+#13#10+'  <HEAD>'+#13#10+'    <TITLE></TITLE>'+#13#10+'  </HEAD>'+#13#10+'  <BODY>'+#13#10#13#10+'<P STYLE="text-align: left;">'+#13#10, '', [rfReplaceAll, rfIgnoreCase]);
  //Remove '</P>'+#13#10#13#10+'  </BODY>'+#13#10+'</HTML>'
  THETEXT := StringReplace(THETEXT, #13#10+'</P>'+#13#10#13#10+'  </BODY>'+#13#10+'</HTML>'+#13#10, '', [rfReplaceAll, rfIgnoreCase]);
  //remove spans
  While(Pos(s1, THETEXT) > 0) do
  begin
    Delete(THETEXT, SmartPos(s2, THETEXT, False, Pos(s1, THETEXT), True), Length(s2));
    THETEXT := StringReplace(THETEXT, s1, '', [rfIgnoreCase]);
  end;
  //replace color tags
  //THETEXT := StringReplace(THETEXT, s3, '<font color=#', [rfReplaceAll, rfIgnoreCase]);
  THETEXT := StringReplace(THETEXT, s3, '<c:#', [rfReplaceAll, rfIgnoreCase]);
  THETEXT := StringReplace(THETEXT, s4, '>', [rfReplaceAll, rfIgnoreCase]);
  //THETEXT := StringReplace(THETEXT, s2, '</font>', [rfReplaceAll, rfIgnoreCase]);
  THETEXT := StringReplace(THETEXT, s2, '</c>', [rfReplaceAll, rfIgnoreCase]);
  //remove unnecessary new lines
  THETEXT := StringReplace(THETEXT, #13#10, '', [rfReplaceAll, rfIgnoreCase]);
  //replace new line tags
  THETEXT := StringReplace(THETEXT, '<BR><BR>', #13#10, [rfReplaceAll, rfIgnoreCase]);
  THETEXT := StringReplace(THETEXT, '<BR>', #13#10, [rfReplaceAll, rfIgnoreCase]);

  Result := THETEXT;

  jvretohtml.Free;
  Strings.Free;
end;
}
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
{
procedure HTMLtoRTF(re: TRichEdit; s: String);
const
  b: String = '<b>';
  b2: String = '</b>';
  i: String = '<i>';
  i2: String = '</i>';
  u: String = '<u>';
  u2: String = '</u>';
  f: String = '<font color=#';
  f2: String = '</font>';
  c: String = '<c:#';
  c2: String = '</c>';
var
  tPos, t2Pos: SmallInt;
begin
  re.SelectAll;
  re.SelAttributes.Style := [];
  re.SelAttributes.Color := re.Font.Color;
  re.Lines.Clear;

  SetRichEditText(re, s); //re.Text := s;

  //Replace BOLD tags
  tPos := SmartPos(b, re.Text, False);
  While(tPos > 0) do
  begin
    t2Pos := SmartPos(b2, re.Text, False);

    re.SelStart := tPos + 2;
    re.SelLength := t2Pos - tPos - 3; //if t2Pos = 0 SelLength automatically extends to the text's end
    re.SelAttributes.Style := re.SelAttributes.Style + [fsBold];

    re.SelStart := t2Pos - 1;
    re.SelLength := 4;
    re.SelText := '';
    re.SelStart := tPos - 1;
    re.SelLength := 3;
    re.SelText := '';

    tPos := SmartPos(b, re.Text, False);
  end;

  //Replace ITALIC tags
  tPos := SmartPos(i, re.Text, False);
  While(tPos > 0) do
  begin
    t2Pos := SmartPos(i2, re.Text, False);

    re.SelStart := tPos + 2;
    re.SelLength := t2Pos - tPos - 3; //if t2Pos = 0 SelLength automatically extends to the text's end
    re.SelAttributes.Style := re.SelAttributes.Style + [fsItalic];

    re.SelStart := t2Pos - 1;
    re.SelLength := 4;
    re.SelText := '';
    re.SelStart := tPos - 1;
    re.SelLength := 3;
    re.SelText := '';

    tPos := SmartPos(i, re.Text, False);
  end;

  //Replace UNDERLINE tags
  tPos := SmartPos(u, re.Text, False);
  While(tPos > 0) do
  begin
    t2Pos := SmartPos(u2, re.Text, False);

    re.SelStart := tPos + 2;
    re.SelLength := t2Pos - tPos - 3; //if t2Pos = 0 SelLength automatically extends to the text's end
    re.SelAttributes.Style := re.SelAttributes.Style + [fsUnderline];

    re.SelStart := t2Pos - 1;
    re.SelLength := 4;
    re.SelText := '';
    re.SelStart := tPos - 1;
    re.SelLength := 3;
    re.SelText := '';

    tPos := SmartPos(u, re.Text, False);
  end;

  //Replace COLOR tags
  tPos := SmartPos(c, re.Text, False);
  While(tPos > 0) do
  begin
    t2Pos := SmartPos(c2, re.Text, False);

    re.SelStart := tPos + 10;
    re.SelLength := t2Pos - tPos - 11; //if t2Pos = 0 SelLength automatically extends to the text's end
    re.SelAttributes.Color := RGB(StrToInt('$'+Copy(re.Text, tPos + 4, 2)), StrToInt('$'+Copy(re.Text, tPos + 6, 2)),StrToInt('$'+Copy(re.Text, tPos + 8, 2)));

    //delete </c> tag
    re.SelStart := t2Pos - 1;
    re.SelLength := 4;
    re.SelText := '';
    //delete <c:#XXXXXX> tag
    re.SelStart := tPos - 1;
    re.SelLength := 11;
    re.SelText := '';

    tPos := SmartPos(c, re.Text, False);
  end;

  //Replace FONT COLOR tags
  tPos := SmartPos(f, re.Text, False);
  While(tPos > 0) do
  begin
    t2Pos := SmartPos(f2, re.Text, False);

    re.SelStart := tPos + 19;
    re.SelLength := t2Pos - tPos - 20; //if t2Pos = 0 SelLength automatically extends to the text's end
    re.SelAttributes.Color := RGB(StrToInt('$'+Copy(re.Text, tPos + 13, 2)), StrToInt('$'+Copy(re.Text, tPos + 15, 2)),StrToInt('$'+Copy(re.Text, tPos + 17, 2)));

    //delete </font> tag
    re.SelStart := t2Pos - 1;
    re.SelLength := 7;
    re.SelText := '';
    //delete <font color=#XXXXXX> tag
    re.SelStart := tPos - 1;
    re.SelLength := 20;
    re.SelText := '';

    tPos := SmartPos(f, re.Text, False);
  end;

end;
}
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
{
procedure SetRichEditWidth(re : TRichEdit);
var
  RETop, RELeft, REHeight, i, CharIdx, NeededWidth : integer;
  //mxWidth: Integer;
  RHSPt, CharPt : TPoint;
  al: TAlignment;
const
  MinWidth : integer = 10;
begin

//  //RETop := re.Top;
//  //RELeft := re.Left;
//  //REHeight := re.Height;
//
//  re.Hide;    // make sure its not visible
//  mxWidth := MinWidth;
//
//  re.Width := 0;
//  //re.SetBounds (0, 0 , frmMain.pnlVideo.Width, frmMain.pnlVideo.Height);
//
//  for i := 0 to Length(re.Text) do
//  begin
//    re.Perform(EM_POSFROMCHAR, Integer(@CharPt), i); //EM_POSFROMCHAR = WM_USER + 38
//    if CharPt.x > mxWidth then
//      mxWidth := CharPt.x;
//  end;
//  re.Width := mxWidth; // + re.Width - re.ClientWidth;
//  //re.SetBounds (RELeft, RETop, mxWidth + re.Width - re.ClientWidth, REHeight);
//  re.Show;


  al := RE.Paragraph.Alignment;
  //save left, top and height
  REHeight := RE.Height;
  RETop := RE.Top;
  RELeft := RE.Left;
  RE.Hide;    // make sure its not visible
  RE.Paragraph.Alignment := taLeftJustify;
  RE.SetBounds(0, 0, frmMain.pnlVideoDisplay.Width, frmMain.pnlVideoDisplay.Height);
  NeededWidth := MinWidth;
  for i := 0 to (RE.Height div 5) do begin
    //get a point at RHS of richedeit
    RHSPt := point(RE.Width, i * 5);
    //get nearest char to that
    CharIdx := RE.Perform(EM_CHARFROMPOS, 0, integer(@RHSPt));
    //get point of that char
    RE.Perform(EM_POSFROMCHAR, integer(@CharPt), CharIdx + 1); // + 1 to get the position of RHS of last character and EM_POSFROMCHAR returns LHS of character
    //adjust NeededWidth is necessary
    if CharPt.X > NeededWidth then
      NeededWidth := CharPt.X;
  end;
  RE.SetBounds(RELeft, RETop, NeededWidth, REHeight); //RE.SetBounds(RELeft, RETop, NeededWidth + RE.Width - RE.ClientWidth, REHeight);
  RE.Paragraph.Alignment := al;
  RE.Show;

end;
}
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
{
procedure SetRichEditHeight(re: TRichEdit);
var
  BMP : TBitmap;
begin
  BMP := TBitmap.Create;
  TRY
    BMP.Canvas.Font.Assign(re.Font);
    re.Height := re.Lines.Count * BMP.Canvas.TextHeight('Wq');
  FINALLY
    FreeAndNIL(BMP);
  END;
end;
}
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
{
procedure CopyRTFText(reSource, reDest: TRichEdit); //added by adenry
var
  ms: TMemoryStream;
begin
  ms := TMemoryStream.Create;
  try
    reSource.Lines.SaveToStream(ms);
    ms.Seek(0, soFromBeginning);
    reDest.Lines.LoadFromStream(ms);
  finally
    ms.Free;
  end;
end;
}
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
{
procedure SetRichEditBgColor(RichEdit: TRichEdit; AColor: TColor);
var
  Format: CHARFORMAT2;
begin
  FillChar(Format, SizeOf(Format), 0);
  with Format do
  begin
    cbSize := SizeOf(Format);
    dwMask := CFM_BACKCOLOR;
    crBackColor := AColor;
    Richedit.Perform(EM_SETCHARFORMAT, SCF_SELECTION, Longint(@Format));
  end;
end;
}
//added by adenry: end

// -----------------------------------------------------------------------------

//Tags highlighting by BDZL
procedure HighlightTags(re: TRichEdit);

  procedure ProcessRE(re : TRichEdit; TextCol, TagCol: TColor);
  var
    i    : Integer;
    StoreStart  : Integer;
    StoreLength : Integer;
    TagStart : Integer;
  begin
    if re.Visible and re.Enabled then begin
      StoreStart  := re.SelStart;
      StoreLength := re.SelLength;

      re.SelStart := 0;
      re.SelLength := Length(re.Text);
      re.SelAttributes.Color := TextCol;

      TagStart := -1;
      for i := 1 to Length(re.Text) do begin
        if re.Text[i] = '<' then
        begin
          if IsTagPart(re.Text, i) then //added by adenry
            TagStart := i;
        end else
        if re.Text[i] = '>' then begin
          re.SelStart := TagStart-1;
          re.SelLength := i - TagStart+1;
          re.SelAttributes.Color := TagCol;
          TagStart := -1;
        end;
      end;

      re.SelStart  := StoreStart;
      re.SelLength := StoreLength;
    end;
  end;

begin
  if frmMain.TagsHighlight then
  begin
    SendMessage(re.Handle, WM_SETREDRAW, 0, 0);
    ProcessRE(re, re.Font.Color, frmMain.TagsHighlightColor);
    SendMessage(re.Handle, WM_SETREDRAW, 1, 0);
    InvalidateRect(re.Handle, nil, True);
  end;
end;

// -----------------------------------------------------------------------------

//added by adenry: begin
//Get RichEdit Text as ANSI String WITH THE PROPER ENCODING instead of the encoding of the system's default non-Unicode language
//This is the only function changed in 6.0b
function GetRichEditText(RichEdit: TRichEdit): AnsiString;
var
  GetTextLengthEx: TGetTextLengthEx;
  GetTextEx: TGetTextEx;
  Len: Integer;
  AnsiCodePage: UINT;

  i: Integer; //added by adenry
begin
  //Get and set text length:
  AnsiCodePage := CharsetToCodePage(RichEdit.Font.Charset);
  GetTextLengthEx.flags := GTL_DEFAULT;
  GetTextLengthEx.codepage := AnsiCodePage;
  Len := SendMessage(RichEdit.Handle, EM_GETTEXTLENGTHEX, WPARAM(@GetTextLengthEx), 0);
  if Len=E_INVALIDARG then
    raise Exception.Create('EM_GETTEXTLENGTHEX failed');

  Len := Len*2; //6.0b //added by adenry - we might be dealing with 2-byte characters (CJK languages), so we need the byte size to be twice the number of the characters

  SetLength(Result, Len);

  for i := 1 to Len do Result[i] := #0; //6.0b //added by adenry - fill the Result with #0. If we have 1-byte characters or a mix of 2-byte and 1-byte characters (CJK languages), the first #0 will terminate the string.

  if Len=0 then
    exit;
  //Get text:
  GetTextEx.cb := (Length(Result)+1)*SizeOf(AnsiChar);
  GetTextEx.flags := GTL_DEFAULT;
  GetTextEx.codepage := AnsiCodePage;
  GetTextEx.lpDefaultChar := nil;
  GetTextEx.lpUsedDefChar := nil;
  SendMessage(RichEdit.Handle, EM_GETTEXTEX, WPARAM(@GetTextEx), LPARAM(PChar(Result))); //PWideChar changed to PChar

  //added by adenry: trim unnecessary trailing #0 characters
  i := Pos(#0, Result);             //6.0b
  if i > 0 then                     //6.0b
    Result := Copy(Result, 1, i-1); //6.0b
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
//Get RichEdit Text as WideString
{
function GetRichEditTextW(RichEdit: TRichEdit): WideString;
var
  GetTextLengthEx: TGetTextLengthEx;
  GetTextEx: TGetTextEx;
  Len: Integer;
begin
  //Get and set text length:
  GetTextLengthEx.flags := GTL_DEFAULT;
  GetTextLengthEx.codepage := 1200;
  Len := SendMessage(RichEdit.Handle, EM_GETTEXTLENGTHEX, WPARAM(@GetTextLengthEx), 0);
  if Len=E_INVALIDARG then
    raise Exception.Create('EM_GETTEXTLENGTHEX failed');
  SetLength(Result, Len);
  if Len=0 then
    exit;
  //Get text:
  GetTextEx.cb := (Length(Result)+1)*SizeOf(WideChar);
  GetTextEx.flags := GTL_DEFAULT;
  GetTextEx.codepage := 1200;
  GetTextEx.lpDefaultChar := nil;
  GetTextEx.lpUsedDefChar := nil;
  SendMessage(RichEdit.Handle, EM_GETTEXTEX, WPARAM(@GetTextEx), LPARAM(PWideChar(Result)));
end;
}
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
//Set RichEdit Text as ANSI String WITH THE PROPER ENCODING instead of the encoding of the system's default non-Unicode language
procedure SetRichEditText(RichEdit: TRichEdit; Text: String);
// EM_SETTEXTEX and SETTEXTEX from RichEdit v.3
// Windows 2000/ME/XP or later is required for these to work
const
  {$IFDEF CPPBUILDER}{$EXTERNALSYM EM_SETTEXTEX}{$ENDIF}
  EM_SETTEXTEX = WM_USER + 97;
type
  // EM_SETTEXTEX info; this struct is passed in the wparam of the message
  PSetTextEx = ^TSetTextEx;
  {$IFDEF CPPBUILDER}{$EXTERNALSYM _settextex}{$ENDIF}
  _settextex = packed record
    flags: DWORD;       // Flags (see the ST_XXX defines)
    codepage: UINT;     // Code page for translation (CP_ACP for sys default, 1200 for Unicode, -1 for control default)
  end;
  {$IFDEF CPPBUILDER}{$EXTERNALSYM SETTEXTEX}{$ENDIF}
  SETTEXTEX = _settextex;
  TSetTextEx = _settextex;
var
  TheSetTextEx: TSetTextEx;
begin
  TheSetTextEx.flags := GTL_DEFAULT;
  TheSetTextEx.codepage := CharsetToCodePage(RichEdit.Font.Charset);
  SendMessage(RichEdit.Handle, EM_SETTEXTEX, WPARAM(@TheSetTextEx), LPARAM(PChar(Text))); //PWideChar changed to PChar
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure SetRichEditSelText(RichEdit: TRichEdit; InsertText: String);
var
  Text: String;
  SelStart: Integer;
begin
  Text := GetRichEditText(RichEdit);
  SelStart := RichEdit.SelStart;
  if RichEdit.SelLength > 0 then
    Delete(Text, SelStart + 1, RichEdit.SelLength);
  Insert(InsertText, Text, SelStart + 1);
  SetRichEditText(RichEdit, Text);
  RichEdit.SelStart := SelStart + Length(InsertText);
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
{function GetRichEditSelText(RichEdit: TRichEdit): String;
//var Text: String;
begin
  //if RichEdit.SelLength > 0 then
  //  Result := Copy(GetRichEditText(RichEdit), RichEdit.SelStart+1, RichEdit.SelLength) else
  //  Result := '';
  Result := RichEdit.SelText
end;}
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
function GetSWTextEditText(SWTextEdit: TSWTextEdit): String;
begin
  if SWTextEdit.ClassName = TRichEdit.ClassName then //if TSWTextEdit.InheritsFrom(TRichEdit) then
    Result := GetRichEditText(TRichEdit(SWTextEdit)) else
    Result := SWTextEdit.Text;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure SetSWTextEditText(SWTextEdit: TSWTextEdit; Text: String);
begin
  if SWTextEdit.ClassName = TRichEdit.ClassName then //if TSWTextEdit.InheritsFrom(TRichEdit) then
    SetRichEditText(TRichEdit(SWTextEdit), Text) else
    SWTextEdit.Text := Text;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
{function GetSWTextEditSelText(SWTextEdit: TSWTextEdit): String;
begin
  if SWTextEdit.ClassName = TRichEdit.ClassName then //if TSWTextEdit.InheritsFrom(TRichEdit) then
    Result := GetRichEditSelText(TRichEdit(SWTextEdit)) else
    Result := SWTextEdit.SelText;
end;}
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure SetSWTextEditSelText(SWTextEdit: TSWTextEdit; Text: String);
begin
  if SWTextEdit.ClassName = TRichEdit.ClassName then //if TSWTextEdit.InheritsFrom(TRichEdit) then
    SetRichEditSelText(TRichEdit(SWTextEdit), Text) else
    SWTextEdit.SelText := Text;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
function GetUnicodeTextFromClipboard: WideString;

  function WideStrAlloc(Size: Cardinal): PWideChar;
  begin
    //Size should probably be char count, not bytes; but at least 'div 2' below prevents overrun.
    Size := Size * SizeOf(WideChar);
    Inc(Size, SizeOf(Cardinal));
    GetMem(Result, Size);
    Cardinal(Pointer(Result)^) := Size;
    Inc(Result, SizeOf(Cardinal) div 2);
  end;

  function StrLCopyW(Dest: PWideChar; const Source: PWideChar; MaxLen: Cardinal): PWideChar;
  var
    Src: PWideChar;
  begin
    Result := Dest;
    if (Dest <> nil) and (MaxLen > 0) then
    begin
      Src := Source;
      if Src <> nil then
        while (MaxLen > 0) and (Src^ <> #0) do
        begin
          Dest^ := Src^;
          Inc(Src);
          Inc(Dest);
          Dec(MaxLen);
        end;
      Dest^ := #0;
    end;
  end;

var
  hMem     : Cardinal;
  dwLen    : DWord;
  ps1, ps2 : PWideChar;
begin
  OpenClipboard(frmMain.Handle); //Clipboard.Open;
  try
    if Clipboard.HasFormat( CF_UNICODETEXT ) then
    begin
      hMem := GetClipboardData( CF_UNICODETEXT );
      ps1 := GlobalLock( hMem );
      dwLen := GlobalSize( hMem );
      ps2 := WideStrAlloc( 1 + dwLen );
      StrLCopyW( ps2, ps1, dwLen );
      GlobalUnlock( hMem );
      Result := ps2;
      //Result := ps1;
      //MessageBoxW(frmMain.Handle, Result, 'Clipboard Wide String', MB_OK);
    end
    else
      Result := '';
  finally
    CloseClipboard; //Clipboard.Close;
  end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
function TextHasFullTag(Text: String; Bold, Italic, Underline, Color: Boolean): Boolean;
var
  openTag, closeTag: String;
begin
  if Bold then
  begin
    Italic := False;
    Underline := False;
    Color := False;
    openTag := '<b>';
    closeTag := '</b>';
  end else
  if Italic then
  begin
    Underline := False;
    Color := False;
    openTag := '<i>';
    closeTag := '</i>';
  end else
  if Underline then
  begin
    Color := False;
    openTag := '<u>';
    closeTag := '</u>';
  end else
  if Color then
  begin
    openTag := '<c:#';
    closeTag := '</c>';
  end;

  Text := RemoveSWTags(Text, not Bold, not Italic, not Underline, not Color, True);
  if (SmartPos(openTag, Text, False) <> 1) or ((SmartPos(closeTag, Text, False) > 0)and(SmartPos(closeTag, Text, False) < Length(Text)-3)) then
    Result := False else
    Result := True;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

end.



