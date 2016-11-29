// This file is part of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle Workshop's copyright information
// File Description: Various Info form

unit formVariousInfo;

{$WARN UNIT_PLATFORM OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FileCtrl, Math, StdCtrls, ExtCtrls, ComCtrls, IniFiles,
  VirtualTrees,
  StrMan,
  CommonTypes;

type
  TInfoClass = record
    Info        : String;
    Description : String;
    ShowBold    : Boolean;
    SubNumber   : Integer;
  end;
  PInfoClass = ^TInfoClass;
  TfrmVariousInfo = class(TForm)
    pgeCtrl: TPageControl;
    pgeInformation: TTabSheet;
    pgeExtras: TTabSheet;
    gbBestFontSize: TGroupBox;
    lblFontName: TLabel;
    edtWidth: TLabeledEdit;
    btnFromAVI: TButton;
    cmbFonts: TComboBox;
    chkBold: TCheckBox;
    chkItalic: TCheckBox;
    btnCalculate: TButton;
    lstInfo: TVirtualStringTree;
    btnOk: TButton;
    dlgOpenAVI: TOpenDialog;
    btnRefreshInfo: TButton;
    procedure lstInfoFreeNode(Sender: TBaseVirtualTree;
      Node: PVirtualNode);
    procedure lstInfoGetNodeDataSize(Sender: TBaseVirtualTree;
      var NodeDataSize: Integer);
    procedure lstInfoInitNode(Sender: TBaseVirtualTree; ParentNode,
      Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);
    procedure lstInfoGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: TColumnIndex; TextType: TVSTTextType;
      var CellText: WideString);
    procedure FormCreate(Sender: TObject);
    procedure btnCalculateClick(Sender: TObject);
    procedure edtWidthKeyPress(Sender: TObject; var Key: Char);
    procedure btnFromAVIClick(Sender: TObject);
    procedure lstInfoPaintText(Sender: TBaseVirtualTree;
      const TargetCanvas: TCanvas; Node: PVirtualNode;
      Column: TColumnIndex; TextType: TVSTTextType);
    procedure lstInfoDblClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject); //added by adenry
    procedure btnRefreshInfoClick(Sender: TObject); //added by adenry
    procedure RefreshInfo(WorkWithTranslation: Boolean);
    procedure FormShow(Sender: TObject); //added by adenry
    procedure CallSetLanguage;
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject); //added by adenry
    procedure SetFont; //added by adenry
  private
    procedure SetLanguage;
  public
    { Public declarations }
  end;

var
  frmVariousInfo: TfrmVariousInfo;
  LongLineText  : String;
  InfoTypes     : array[1..25] of String; //range changed by adenry

implementation

uses
  General, Functions, TreeViewHandle, USubtitlesFunctions, //USubtitleAPI, //USubtitleAPI removed by adenry
  formMain;

{$R *.dfm}

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmVariousInfo.SetFont;
begin
  btnOk.ParentFont := True;
  Font             := frmMain.Font;
  btnOk.Font.Style := frmMain.Font.Style + [fsBold];
end;
//added by adenry: end

// -----------------------------------------------------------------------------

procedure TfrmVariousInfo.SetLanguage;
var
  LF: TIniFile;
begin
  LF := TIniFile.Create(frmMain.ActualLangFile);
  try
    With LF do
    begin
      Caption                := ReadString('Various information', '01', 'Various information');
      pgeInformation.Caption := ReadString('Various information', '02', 'Information');
      pgeExtras.Caption      := ReadString('Various information', '03', 'Extras');
      // Information types
      // Generic
      InfoTypes[01] := ReadString('Various information', '04', 'Original file');
      InfoTypes[02] := ReadString('Various information', '05', 'Translated file');
      // Particular
      InfoTypes[03] := ReadString('Various information', '06', 'Current format:');
      InfoTypes[04] := ReadString('Various information', '07', 'File:');
      InfoTypes[05] := ReadString('Various information', '08', 'Size:');
      InfoTypes[06] := ReadString('Various information', '09', 'Total number of subtitles:');
      InfoTypes[07] := ReadString('Various information', '10', 'Total number of lines:');
      InfoTypes[08] := ReadString('Various information', '11', 'Total number of words:');
      InfoTypes[09] := ReadString('Various information', '12', 'Total number of letters:');
      InfoTypes[10] := ReadString('Various information', '13', 'Subtitles with one line:');
      InfoTypes[11] := ReadString('Various information', '14', 'Subtitles with two lines:');
      InfoTypes[12] := ReadString('Various information', '15', 'Subtitles with more than two lines:');
      InfoTypes[13] := ReadString('Various information', '16', 'Longest line:');
      InfoTypes[14] := ReadString('Various information', '17', 'In subtitle %d with %d characters');
      //added by adenry: begin
      InfoTypes[15] := ReadString('Various information', '25', 'Shortest line:');
      InfoTypes[16] := ReadString('Various information', '26', 'Longest pause:');
      InfoTypes[17] := ReadString('Various information', '27', 'Shortest pause:');
      InfoTypes[18] := ReadString('Various information', '28', 'In subtitle %d, %d,%.3d seconds');
      InfoTypes[19] := ReadString('Various information', '29', 'In subtitle %d, %d milliseconds');
      InfoTypes[20] := ReadString('Various information', '30', 'Most CPS:');
      InfoTypes[21] := ReadString('Various information', '31', 'Least CPS:');
      InfoTypes[22] := ReadString('Various information', '32', 'In subtitle %d, %d cps');
      InfoTypes[23] := ReadString('Various information', '33', 'Average CPS:');
      InfoTypes[24] := ReadString('Various information', '34', 'Longest duration:');
      InfoTypes[25] := ReadString('Various information', '35', 'Shortest duration:');

      btnRefreshInfo.Caption := ReadString('Various information', '36', 'Refresh info');
      //added by adenry: end

      gbBestFontSize.Caption     := ReadString('Various information', '18', 'Best font size for playback');
      edtWidth.EditLabel.Caption := ReadString('Various information', '19', 'Resolution width:');
      btnFromAVI.Caption         := ReadString('Various information', '20', 'From AVI');
      lblFontName.Caption        := ReadString('Various information', '21', 'Font name:');
      chkBold.Caption            := ReadString('Various information', '22', 'Bold');
      chkItalic.Caption          := ReadString('Various information', '23', 'Italic');
      btnCalculate.Caption       := ReadString('Various information', '24', 'Calculate');

      btnOk.Caption  := BTN_OK;
      
      // ------------------ //
      //      Set font      //
      // ------------------ //
      SetFont; //added by adenry
      //removed by adenry: begin
      {btnOk.ParentFont := True;
      Font             := frmMain.Font;
      btnOk.Font.Style := frmMain.Font.Style + [fsBold];}
      //removed by adenry: end 
    end;
  finally
    LF.Free;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmVariousInfo.lstInfoGetNodeDataSize(Sender: TBaseVirtualTree;
  var NodeDataSize: Integer);
begin
  NodeDataSize := SizeOf(TInfoClass);
end;

// -----------------------------------------------------------------------------

procedure TfrmVariousInfo.lstInfoInitNode(Sender: TBaseVirtualTree;
  ParentNode, Node: PVirtualNode;
  var InitialStates: TVirtualNodeInitStates);
var
  Data: PInfoClass;
begin
  Data             := Sender.GetNodeData(Node);
  Data.Info        := '';
  Data.Description := '';
end;

// -----------------------------------------------------------------------------

procedure TfrmVariousInfo.lstInfoFreeNode(Sender: TBaseVirtualTree;
  Node: PVirtualNode);
var
  Data: PInfoClass;
begin
  Data             := Sender.GetNodeData(Node);
  Data.Info        := '';
  Data.Description := '';
end;

// -----------------------------------------------------------------------------

procedure TfrmVariousInfo.lstInfoGetText(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
  var CellText: WideString);
var
  Data: PInfoClass;
begin
  Data     := Sender.GetNodeData(Node);
  if Column = 0 then
    CellText := StringToWideStringEx(Data.Info, CharSetToCodePage(frmMain.Font.Charset)) else
    CellText := StringToWideStringEx(Data.Description, CharSetToCodePage(frmMain.Font.Charset));
end;

// -----------------------------------------------------------------------------

procedure TfrmVariousInfo.FormCreate(Sender: TObject);

//removed by adenry: begin
//  function GetFileSize(const FileName: String): Real;
//    function Redondear(Valor: Real; Redondeo: Integer): Real;
//    begin
//      Redondear := Round(Valor * Power(10, Redondeo)) / Power(10, Redondeo);
//    end;
//  var
//    f: File;
//  begin
//    Result := 0;
//    if FileExists(FileName) then
//    begin
//      FileMode := fmOpenRead;
//      AssignFile(f, FileName);
//      {$I-}
//      Reset(f, 1);
//      {$I+}
//      Result := Redondear(FileSize(f) / 1024, 3);
//      CloseFile(f);
//    end;
//  end;

  {procedure AddInfo(const Info, Description: String; ShowBold: Boolean = False; SubNumber: Integer = -1);
  var
    Node: PVirtualNode;
    Data: PInfoClass;
  begin
    if lstInfo.RootNodeCount = 0 then
    begin
      lstInfo.RootNodeCount := 1;
      Node := lstInfo.GetFirst;
    end else
    begin
      lstInfo.InsertNode(lstInfo.GetLast, amInsertAfter);
      Node := lstInfo.GetLast;
    end;
    Data             := lstInfo.GetNodeData(Node);
    Data.Info        := Info;
    Data.Description := Description;
    Data.ShowBold    := ShowBold;
    Data.SubNumber   := SubNumber;
  end;

  function CheckLongestLine(MaxLength: Integer; Text: String): Integer;
  var
    PosEnter : Integer;
    Longest  : Integer;
    tempStr  : String;
  begin
    Longest := 0;
    PosEnter := Pos(#13#10, Text);
    while PosEnter > 0 do
    begin
      if Length(Copy(Text, 1, PosEnter-1)) > Longest then
      begin
        Longest := Length(Copy(Text, 1, PosEnter-1));
        tempStr := Copy(Text, 1, PosEnter-1);
      end;
      Text := Copy(Text, PosEnter + 2, Length(Text));
      PosEnter := Pos(#13#10, Text);
    end;
    if Length(Text) > Longest then
    begin
      Longest := Length(Text);
      tempStr := Text;
    end;
    if Longest > MaxLength then
    begin
      Result := Longest;
      LongLineText := tempStr;
    end else
      Result := MaxLength;
  end;
  
var
  Node    : PVirtualNode;
  SubText : String;
  // ------------------- //
  // Various information //
  // ------------------- //
  TotalLines    : Integer;
  TotalWords    : Integer;
  TotalLetters  : Integer;
  tempInt       : Integer;
  SubLongLine   : Integer;
  LongestLine   : Integer;
  Tot1LSubs     : Integer;
  Tot2LSubs     : Integer;
  TotMore2LSubs : Integer;}
//removed by adenry: end

var Ini: TIniFile; //added by adenry
begin
  pgeCtrl.ActivePageIndex := 0;
  SetLanguage;

  //added by adenry: begin
  Ini := TIniFile.Create(IniRoot);
  try
    Width   := Ini.ReadInteger('Various info', 'Width', 608);
    Height  := Ini.ReadInteger('Various info', 'Height', 336);
    Left    := Ini.ReadInteger('Various info', 'Left', (Screen.Width-Width) div 2);
    Top     := Ini.ReadInteger('Various info', 'Top', (Screen.Height-Height) div 2);
  finally
    Ini.Free;
  end;
  //SetWindowPos(Handle, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE + SWP_NOSIZE);  //added by adenry later
  //added by adenry: end

  //removed by adenry: begin
  {with frmMain do
  begin
    TotalLines    := 0;
    TotalWords    := 0;
    TotalLetters  := 0;
    SubLongLine   := 0;
    LongestLine   := 0;
    Tot1LSubs     := 0;
    Tot2LSubs     := 0;
    TotMore2LSubs := 0;

    Node := lstSubtitles.GetFirst;
    while Assigned(Node) do
    begin
      // Important!!: Remove tags before checking!
      SubText := RemoveSWTags(GetSubText(Node), True, True, True, True);
      Inc(TotalLines, sm.CountLines(SubText));
      case sm.CountLines(SubText) of
        1: Inc(Tot1LSubs);
        2: Inc(Tot2LSubs);
        3: Inc(TotMore2LSubs);
      end;
      Inc(TotalWords, sm.CountWords(SubText));
      Inc(TotalLetters, Length(SubText) - (StringCount(#13#10, SubText) * 2) - (StringCount(' ', SubText)));
      TempInt := CheckLongestLine(LongestLine, SubText);
      if TempInt > LongestLine then
      begin
        LongestLine := TempInt;
        SubLongLine := Node.Index + 1;
      end;

      Node := Node.NextSibling;
    end;

    if mnuTranslatorMode.Checked then
      AddInfo(InfoTypes[01], '', True);
    AddInfo(InfoTypes[03], SubtitleAPI.GetFormatName(frmMain.OrgFormat));
    AddInfo(InfoTypes[04], frmMain.OrgFile);
    AddInfo(InfoTypes[05], Format('%f kb', [GetFileSize(frmMain.OrgFile)]));
    AddInfo(InfoTypes[06], IntToStr(frmMain.lstSubtitles.RootNodeCount));
    AddInfo(InfoTypes[07], IntToStr(TotalLines));
    AddInfo(InfoTypes[08], IntToStr(TotalWords));
    AddInfo(InfoTypes[09], IntToStr(TotalLetters));
    AddInfo(InfoTypes[10], IntToStr(Tot1LSubs));
    AddInfo(InfoTypes[11], IntToStr(Tot2LSubs));
    AddInfo(InfoTypes[12], IntToStr(TotMore2LSubs));
    AddInfo(InfoTypes[13], Format(InfoTypes[14], [SubLongLine, LongestLine]), False, SubLongLine);

    if mnuTranslatorMode.Checked then
    begin
      TotalLines    := 0;
      TotalWords    := 0;
      TotalLetters  := 0;
      SubLongLine   := 0;
      LongestLine   := 0;
      Tot1LSubs     := 0;
      Tot2LSubs     := 0;
      TotMore2LSubs := 0;

      Node := lstSubtitles.GetFirst;
      while Assigned(Node) do
      begin
        // Important!!: Remove tags before checking!
        SubText := RemoveSWTags(GetSubTranslation(Node), True, True, True, True);
        Inc(TotalLines, sm.CountLines(SubText));
        case sm.CountLines(SubText) of
          1: Inc(Tot1LSubs);
          2: Inc(Tot2LSubs);
          3: Inc(TotMore2LSubs);
        end;
        Inc(TotalWords, sm.CountWords(SubText));
        Inc(TotalLetters, Length(SubText) - (StringCount(#13#10, SubText) * 2) - (StringCount(' ', SubText)));
        TempInt := CheckLongestLine(LongestLine, SubText);
        if TempInt > LongestLine then
        begin
          LongestLine := TempInt;
          SubLongLine := Node.Index + 1;
        end;

        Node := Node.NextSibling;
      end;

      AddInfo(InfoTypes[02], '', True);
      AddInfo(InfoTypes[03], SubtitleAPI.GetFormatName(frmMain.TransFormat));
      AddInfo(InfoTypes[04], frmMain.TransFile);
      AddInfo(InfoTypes[05], Format('%f kb', [GetFileSize(frmMain.TransFile)]));
      AddInfo(InfoTypes[06], IntToStr(frmMain.lstSubtitles.RootNodeCount));
      AddInfo(InfoTypes[07], IntToStr(TotalLines));
      AddInfo(InfoTypes[08], IntToStr(TotalWords));
      AddInfo(InfoTypes[09], IntToStr(TotalLetters));
      AddInfo(InfoTypes[10], IntToStr(Tot1LSubs));
      AddInfo(InfoTypes[11], IntToStr(Tot2LSubs));
      AddInfo(InfoTypes[12], IntToStr(TotMore2LSubs));
      AddInfo(InfoTypes[13], Format(InfoTypes[14], [SubLongLine, LongestLine]), False, SubLongLine);
    end;
  end;}
  //removed by adenry: end

  edtWidth.Text      := IntToStr(Screen.Width);
  chkItalic.Checked  := False;
  chkBold.Checked    := True;
  cmbFonts.Items     := Screen.Fonts;
  cmbFonts.ItemIndex := cmbFonts.Items.IndexOf('Tahoma');
end;

// -----------------------------------------------------------------------------

procedure TfrmVariousInfo.btnCalculateClick(Sender: TObject);
var
  W   : Integer;
  BMP : TBitmap;
begin
if LongLineText =  '' then btnRefreshInfoClick(Sender); //added by adenry
if LongLineText <> '' then //added by adenry
begin
  W := StrToIntDef(edtWidth.Text, 0);
  BMP := TBitmap.Create;
  try
    BMP.Canvas.Font.Charset := StrCharsetToInt(frmMain.cmbOrgCharset.Items[frmMain.cmbOrgCharset.ItemIndex]);
    BMP.Canvas.Font.Name    := cmbFonts.Items[cmbFonts.ItemIndex];
    BMP.Canvas.Font.Style   := [];
    if chkBold.Checked then
      BMP.Canvas.Font.Style := BMP.Canvas.Font.Style + [fsBold];
    if chkItalic.Checked then
      BMP.Canvas.Font.Style := BMP.Canvas.Font.Style + [fsItalic];
    BMP.Canvas.Font.Size  := 1;
    while BMP.Canvas.TextWidth(LongLineText) < W do
      BMP.Canvas.Font.Size := BMP.Canvas.Font.Size + 1;
    BMP.Canvas.Font.Size := BMP.Canvas.Font.Size - 1;

    MsgBox(Format(InfoMsg[07], [BMP.Canvas.Font.Size]), BTN_OK, '', '', MB_ICONINFORMATION, frmVariousInfo);
  finally
    BMP.Free;
  end;
end;
end;

// -----------------------------------------------------------------------------

procedure TfrmVariousInfo.edtWidthKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in['0'..'9', Chr(VK_RETURN), Chr(VK_BACK), Chr(VK_ESCAPE)]) then
    Key := #0;
end;

// -----------------------------------------------------------------------------

procedure TfrmVariousInfo.btnFromAVIClick(Sender: TObject);
  function GetVideoWidth(const FileName: String): Integer;
  const
    AviHeaderStart = 32; // Needed for positioning in the avi file
  var
    f : File;
    // Temporary values
    TempFormatTest : array[0..2] of Char; // should be "AVI"
    VWidth: Integer;
  begin
    Result := 0;
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
          exit;
        Seek(f, AviHeaderStart + 32);
        BlockRead(f, VWidth, 4);
        Result := VWidth;
      end;
    finally
      CloseFile(f);
    end;
  end;
var
  VWidth: Integer;
begin
  if (dlgOpenAVI.Execute) and (dlgOpenAVI.FileName <> '') then
  begin
    VWidth := GetVideoWidth(dlgOpenAVI.FileName);
    if VWidth = 0 then
      MsgBox(Format(ErrorMsg[05], [dlgOpenAVI.FileName]), BTN_OK, '', '', MB_ICONERROR, frmVariousInfo) else
      edtWidth.Text := IntToStr(VWidth);
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmVariousInfo.lstInfoPaintText(Sender: TBaseVirtualTree;
  const TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex;
  TextType: TVSTTextType);
var
  Data: PInfoClass;
begin
  Data := lstInfo.GetNodeData(Node);
  if Data.ShowBold then
    TargetCanvas.Font.Style := TargetCanvas.Font.Style + [fsBold] else
    TargetCanvas.Font.Style := TargetCanvas.Font.Style - [fsBold];
end;

// -----------------------------------------------------------------------------

procedure TfrmVariousInfo.lstInfoDblClick(Sender: TObject);
var
  Data: PInfoClass;
  Node: PVirtualNode;
begin
  Data := lstInfo.GetNodeData(lstInfo.FocusedNode);
  if Assigned(Data) then //added by adenry for a bug fix
    if Data.SubNumber > -1 then
    begin
      with frmMain do
      begin
        Node := GetNodeWithIndex(lstSubtitles, Data.SubNumber - 1);
        lstSubtitles.ScrollIntoView(Node, True);
        //lstSubtitles.Selected[frmMain.lstSubtitles.FocusedNode] := False; //removed by adenry
        UnSelectAll(frmMain.lstSubtitles); //added by adenry
        lstSubtitles.FocusedNode := Node;
        lstSubtitles.Selected[Node] := True;
        RefreshTimes;
      end;
      //Close; //removed by adenry
    end;
end;

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmVariousInfo.btnOkClick(Sender: TObject);
begin
  Close;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmVariousInfo.RefreshInfo(WorkWithTranslation: Boolean);

  function GetFileSize(const FileName: String): Real;
    function Redondear(Valor: Real; Redondeo: Integer): Real;
    begin
      Redondear := Round(Valor * Power(10, Redondeo)) / Power(10, Redondeo);
    end;
  var
    f: File;
  begin
    Result := 0;
    if FileExists(FileName) then
    begin
      FileMode := fmOpenRead;
      AssignFile(f, FileName);
      {$I-}
      Reset(f, 1);
      {$I+}
      Result := Redondear(FileSize(f) / 1024, 3);
      CloseFile(f);
    end;
  end;

  procedure AddInfo(const Info, Description: String; ShowBold: Boolean = False; SubNumber: Integer = -1);
  var
    Node: PVirtualNode;
    Data: PInfoClass;
  begin
    if lstInfo.RootNodeCount = 0 then
    begin
      lstInfo.RootNodeCount := 1;
      Node := lstInfo.GetFirst;
    end else
    begin
      lstInfo.InsertNode(lstInfo.GetLast, amInsertAfter);
      Node := lstInfo.GetLast;
    end;
    Data             := lstInfo.GetNodeData(Node);
    Data.Info        := Info;
    Data.Description := Description;
    Data.ShowBold    := ShowBold;
    Data.SubNumber   := SubNumber;
  end;

  function CheckLongestLine(MaxLength: Integer; Text: String): Integer;
  var
    PosEnter : Integer;
    Longest  : Integer;
    tempStr  : String;
  begin
    Longest := 0;
    PosEnter := Pos(#13#10, Text);
    while PosEnter > 0 do
    begin
      if Length(Copy(Text, 1, PosEnter-1)) > Longest then
      begin
        Longest := Length(Copy(Text, 1, PosEnter-1));
        tempStr := Copy(Text, 1, PosEnter-1);
      end;
      Text := Copy(Text, PosEnter + 2, Length(Text));
      PosEnter := Pos(#13#10, Text);
    end;
    if Length(Text) > Longest then
    begin
      Longest := Length(Text);
      tempStr := Text;
    end;

    if Longest > MaxLength then
    begin
      Result := Longest;
      LongLineText := tempStr;
    end else
      Result := MaxLength;
  end;

  //added by adenry: begin
  function GetShortestLineText(Text: String): String;
  var
    PosEnter      : Integer;
    ShortestLine  : String;
  begin
    ShortestLine := Text;
    PosEnter := Pos(#13#10, Text);
    while PosEnter > 0 do
    begin
      if Length(Copy(Text, 1, PosEnter-1)) < Length(ShortestLine) then
        if Length(Copy(Text, 1, PosEnter-1)) > 0 then
          ShortestLine := Copy(Text, 1, PosEnter-1);
      Text := Copy(Text, PosEnter + 2, Length(Text));
      PosEnter := Pos(#13#10, Text);
    end;
    if Length(Text) < Length(ShortestLine) then
      if Length(Text) > 0 then
        ShortestLine := Text;
    Result := ShortestLine;
  end;
  //added by adenry: end
  
var
  Node          : PVirtualNode;
  Data          : PSubtitleItem; //added by adenry
  PrevData      : PSubtitleItem; //added by adenry
  SubText       : String;
  // ------------------- //
  // Various information //
  // ------------------- //
  TotalLines        : Integer;
  TotalWords        : Integer;
  TotalLetters      : Integer;
  tempInt           : Integer;
  SubLongLine       : Integer;
  LongestLine       : Integer;
  //added by adenry: begin
  tempStr           : String;
  SubShortLine      : Integer;
  ShortestLine      : Integer;
  LongestDur        : Integer;
  LongestDurSub     : Integer;
  ShortestDur       : Integer;
  ShortestDurSub    : Integer;
  LongestPause      : Integer;
  LongestPauseSub   : Integer;
  ShortestPause     : Integer;
  ShortestPauseSub  : Integer;
  MostCPS           : Integer;
  MostCPSSub        : Integer;
  LeastCPS          : Integer;
  LeastCPSSub       : Integer;
  CPSSum            : Double;
  AverageCPS        : Integer;
  CurCPSDouble      : Double;
  CurCPS            : Integer;
  BadValuesSubs     : Cardinal;
  //added by adenry: end
  Tot1LSubs         : Integer;
  Tot2LSubs         : Integer;
  TotMore2LSubs     : Integer;

begin
  with frmMain do
  begin
    TotalLines        := 0;
    TotalWords        := 0;
    TotalLetters      := 0;
    SubLongLine       := 0;
    LongestLine       := 0;
    //added by adenry: begin
    SubShortLine      := 0;
    ShortestLine      := 0;
    LongestDur        := -1;
    LongestDurSub     := 0;
    ShortestDur       := -1;
    ShortestDurSub    := 0;
    LongestPause      := 0;
    LongestPauseSub   := 0;
    ShortestPause     := 0;
    ShortestPauseSub  := 0;
    MostCPS           := -1;
    MostCPSSub        := 0;
    LeastCPS          := -1;
    LeastCPSSub       := 0;
    CPSSum            := 0.0;
    AverageCPS        := 0;
    BadValuesSubs     := 0;
    //added by adenry: end
    Tot1LSubs         := 0;
    Tot2LSubs         := 0;
    TotMore2LSubs     := 0;

    Node := lstSubtitles.GetFirst;
    while Assigned(Node) do
    begin
      Data := frmMain.lstSubtitles.GetNodeData(Node);
      if WorkWithTranslation then
        SubText := Data.Translation else
        SubText := Data.Text;
      SubText := RemoveSWTags(SubText, True, True, True, True); // Important!!: Remove tags before checking!
      //Lines
      Inc(TotalLines, sm.CountLines(SubText));
      case sm.CountLines(SubText) of
        1: Inc(Tot1LSubs);
        2: Inc(Tot2LSubs);
        3: Inc(TotMore2LSubs);
      end;
      //Total words
      Inc(TotalWords, sm.CountWords(SubText));
      //Total letters
      Inc(TotalLetters, Length(SubText) - (StringCount(#13#10, SubText) * 2) - (StringCount(' ', SubText)));
      //Longest line
      TempInt := CheckLongestLine(LongestLine, SubText);
      if TempInt > LongestLine then
      begin
        LongestLine := TempInt;
        SubLongLine := Node.Index + 1;
      end;
      //added by adenry: begin
      //CHECK FOR SHORTEST LINE
      tempStr := GetShortestLineText(SubText);
      if (Length(tempStr) < ShortestLine) or (ShortestLine = 0) then
      begin
        ShortestLine := Length(tempStr);
        SubShortLine := Node.Index + 1;
      end;
      //CHECK PAUSES
      if Node <> lstSubtitles.GetFirst then
      begin
        PrevData := frmMain.lstSubtitles.GetNodeData(Node.PrevSibling);
        TempInt := Data.InitialTime - PrevData.FinalTime;
        //longest
        if TempInt > LongestPause then
        begin
          LongestPause := TempInt;
          LongestPauseSub := Node.Index + 1;
        end;
        //shortest
        if (TempInt < ShortestPause) or (ShortestPause = 0) then
          if TempInt > 0 then
          begin
            ShortestPause := TempInt;
            ShortestPauseSub := Node.Index + 1;
          end;
      end;
      //CHECK CPS
      if Data.FinalTime > Data.InitialTime then
      begin
        CurCPSDouble := GetSubCPS(Node);//Length(ReplaceString(RemoveSWTags(SubText,True,True,True,True),#13#10,'')) / ((Data.FinalTime-Data.InitialTime)/1000);
        CurCPS := Math.Ceil(CurCPSDouble);
        CPSSum := CPSSum + CurCPSDouble;
        //Most CPS
        if CurCPS > MostCPS then
        begin
          MostCPS := CurCPS;
          MostCPSSub := Node.Index + 1;
        end;
        //Least CPS
        if (CurCPS < LeastCPS) or (LeastCPS = -1) then
        begin
          LeastCPS := CurCPS;
          LeastCPSSub := Node.Index + 1;
        end;
      end else
        Inc(BadValuesSubs);
      //Longest duration
      TempInt := Data.FinalTime - Data.InitialTime;
      if TempInt > LongestDur then
      begin
        LongestDur := TempInt;
        LongestDurSub := Node.Index + 1;
      end;
      if (TempInt < ShortestDur) or (ShortestDur = -1) then
      begin
        ShortestDur := TempInt;
        ShortestDurSub := Node.Index + 1;
      end;
      //added by adenry: end

      Node := Node.NextSibling;
    end;

    if BadValuesSubs < frmMain.lstSubtitles.RootNodeCount then //prevent division by zero
      AverageCPS := Math.Ceil(CPSSum / (frmMain.lstSubtitles.RootNodeCount-BadValuesSubs)); //added by adenry

    if WorkWithTranslation then
    begin
      AddInfo(InfoTypes[02], '', True);
      AddInfo(InfoTypes[03], SubtitleAPI.GetFormatName(frmMain.TransFormat));
      AddInfo(InfoTypes[04], frmMain.TransFile);
      AddInfo(InfoTypes[05], Format('%f kb', [GetFileSize(frmMain.TransFile)]));
    end else
    begin
      //added by adenry: begin
      AddInfo(InfoTypes[24], Format(InfoTypes[18], [LongestDurSub, LongestDur div 1000, LongestDur mod 1000]), False, LongestDurSub);
      AddInfo(InfoTypes[25], Format(InfoTypes[18], [ShortestDurSub, ShortestDur div 1000, ShortestDur mod 1000]), False, ShortestDurSub);
      if frmMain.lstSubtitles.RootNodeCount > 1 then
      begin
        AddInfo(InfoTypes[16], Format(InfoTypes[18], [LongestPauseSub, LongestPause div 1000, LongestPause mod 1000]), False, LongestPauseSub);
        AddInfo(InfoTypes[17], Format(InfoTypes[18], [ShortestPauseSub, ShortestPause div 1000, ShortestPause mod 1000]), False, ShortestPauseSub);
      end else
      begin
        AddInfo(InfoTypes[16], '-');
        AddInfo(InfoTypes[17], '-');
      end;
      //added by adenry: end
      if mnuTranslatorMode.Checked then
        AddInfo(InfoTypes[01], '', True);
      AddInfo(InfoTypes[03], SubtitleAPI.GetFormatName(frmMain.OrgFormat));
      AddInfo(InfoTypes[04], frmMain.OrgFile);
      AddInfo(InfoTypes[05], Format('%f kb', [GetFileSize(frmMain.OrgFile)]));
    end;
    AddInfo(InfoTypes[06], IntToStr(frmMain.lstSubtitles.RootNodeCount));
    AddInfo(InfoTypes[07], IntToStr(TotalLines));
    AddInfo(InfoTypes[08], IntToStr(TotalWords));
    AddInfo(InfoTypes[09], IntToStr(TotalLetters));
    AddInfo(InfoTypes[10], IntToStr(Tot1LSubs));
    AddInfo(InfoTypes[11], IntToStr(Tot2LSubs));
    AddInfo(InfoTypes[12], IntToStr(TotMore2LSubs));
    AddInfo(InfoTypes[13], Format(InfoTypes[14], [SubLongLine, LongestLine]), False, SubLongLine);
    //added by adenry: begin
    AddInfo(InfoTypes[15], Format(InfoTypes[14], [SubShortLine, ShortestLine]), False, SubShortLine);
    AddInfo(InfoTypes[20], Format(InfoTypes[22], [MostCPSSub, MostCPS]), False, MostCPSSub);
    AddInfo(InfoTypes[21], Format(InfoTypes[22], [LeastCPSSub, LeastCPS]), False, LeastCPSSub);
    AddInfo(InfoTypes[23], IntToStr(AverageCPS));
    //added by adenry: end

    //also to add: Subtitle with most lines, subtitle with longest duration, subtitle with shortest duration
  end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmVariousInfo.btnRefreshInfoClick(Sender: TObject);
begin
  btnRefreshInfo.Enabled := False;
  lstInfo.Clear;
  if frmMain.lstSubtitles.RootNodeCount > 0 then
  begin
    RefreshInfo(False);
    if frmMain.mnuTranslatorMode.Checked then
      RefreshInfo(True);
  end;
  btnRefreshInfo.Enabled := True;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmVariousInfo.FormShow(Sender: TObject);
var
  Ini : TIniFile;
begin
  Ini := TIniFile.Create(IniRoot);
  try
    Ini.WriteBool('Various info', 'Various info form opened', True);
  finally
    Ini.Free;
  end;
  frmMain.tbVariousInfo.Down := True;

  btnRefreshInfoClick(Sender);
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmVariousInfo.CallSetLanguage;
begin
  SetLanguage;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmVariousInfo.FormDestroy(Sender: TObject);
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(IniRoot);
  try
    Ini.WriteInteger('Various info', 'Width', Width);
    Ini.WriteInteger('Various info', 'Height', Height);
    Ini.WriteInteger('Various info', 'Left', Left);
    Ini.WriteInteger('Various info', 'Top', Top);
  finally
    Ini.Free;
  end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmVariousInfo.FormClose(Sender: TObject; var Action: TCloseAction);
var
  Ini : TIniFile;
begin
  Ini := TIniFile.Create(IniRoot);
  try
    Ini.WriteBool('Various info', 'Various info form opened', False);
  finally
    Ini.Free;
  end;
  frmMain.tbVariousInfo.Down := False;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmVariousInfo.FormResize(Sender: TObject);
begin
  btnRefreshInfo.Top  := ClientHeight - 8 - btnRefreshInfo.Height;
  btnOk.Top           := btnRefreshInfo.Top;
  btnOk.Left          := ClientWidth - 8 - btnOk.Width;
  pgeCtrl.Width       := ClientWidth - 16;
  pgeCtrl.Height      := btnRefreshInfo.Top - 16;

end;
//added by adenry: end

// -----------------------------------------------------------------------------

end.
