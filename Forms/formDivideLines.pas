// This file is part of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle Workshop's copyright information
// File Description: Divide Lines form

unit formDivideLines;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Mask, ExtCtrls, ComCtrls, Math, IniFiles, Menus, ClipBrd, //ClipBrd added by adenry
  VirtualTrees, TimeMaskEdit,
  StrMan,
  CommonTypes;

type
  TfrmDivideLines = class(TForm)
    btnDivide: TButton;
    btnCancel: TButton;
    pnlDivideLines: TPanel;
    lblDivideAfterLineNumber: TLabel;
    edtDivideAfterBreakNum: TEdit;
    udDivideAfterBreakNum: TUpDown;
    btn31: TButton;
    btn13: TButton;
    btn32: TButton;
    btn23: TButton;
    btn21: TButton;
    btn12: TButton;
    btn11: TButton;
    Bevel1: TBevel;
    lblShowSub1: TLabel;
    lblHideSub1: TLabel;
    lblShowSub2: TLabel;
    lblHideSub2: TLabel;
    chkContinueDirectly: TCheckBox;
    mmoSub1Old: TMemo;
    mmoSub2Old: TMemo;
    lblDuration1: TLabel;
    lblDuration2: TLabel;
    lblLength1: TLabel;
    lblLength2: TLabel;
    chkUseAutoDur: TCheckBox;
    tmeShowSub1: TTimeMaskEdit;
    tmeHideSub1: TTimeMaskEdit;
    tmeDuration1: TTimeMaskEdit;
    tmeShowSub2: TTimeMaskEdit;
    tmeHideSub2: TTimeMaskEdit;
    tmeDuration2: TTimeMaskEdit;
    mmoSub1: TRichEdit;
    mmoSub2: TRichEdit; //TMemo changed to TRichEdit
    procedure chkContinueDirectlyClick(Sender: TObject);
    procedure btnDivideClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure udDivideAfterBreakNumChangingEx(Sender: TObject;
      var AllowChange: Boolean; NewValue: Smallint;
      Direction: TUpDownDirection);
    procedure mmoSubtitle1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mmoSubtitle2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn11Click(Sender: TObject);
    procedure btn12Click(Sender: TObject);
    procedure btn21Click(Sender: TObject);
    procedure btn13Click(Sender: TObject);
    procedure btn31Click(Sender: TObject);
    procedure btn23Click(Sender: TObject);
    procedure btn32Click(Sender: TObject);
    procedure mmoSubtitle1Change(Sender: TObject);
    procedure mmoSubtitle2Change(Sender: TObject);
    procedure chkUseAutoDurClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure tmeShowSub2TimeChangeFromEditOnly(Sender: TObject;
      NewTime: Cardinal);
    procedure tmeHideSub1TimeChangeFromEditOnly(Sender: TObject;
      NewTime: Cardinal);
    procedure tmeDuration1TimeChangeFromEditOnly(Sender: TObject;
      NewTime: Cardinal);
  private
    procedure SetLanguage;
    procedure CalculateTimes(Prop1, Prop2: Integer; AutomaticDur: Boolean = False);
  public
    { Public declarations }
  end;

var
  frmDivideLines      : TfrmDivideLines;
  OriginalString      : String;
  BreaksArray         : TOpenIntegerArray;
  //AdjustAutomatically : Boolean; //moved to formMain by adenry
  LengthInChars       : String;
  DoSelectAll         : Boolean; //added by adenry

implementation

uses
  General, Functions, TreeViewHandle, USubtitlesFunctions, Undo, VideoPreview, //VideoPreview added by adenry
  formMain;

{$R *.dfm}

// -----------------------------------------------------------------------------

procedure TfrmDivideLines.SetLanguage;
var
  LF: TIniFile;
begin
  LF := TIniFile.Create(frmMain.ActualLangFile);
  try
    with LF do
    begin
      Caption                          := ReadString('Divide lines', '01', 'Divide lines');
      lblDivideAfterLineNumber.Caption := ReadString('Divide lines', '02', 'Divide after line number:');
      chkUseAutoDur.Caption            := ReadString('Divide lines', '03', 'Use automatic duration');
      lblShowSub1.Caption              := ReadString('Divide lines', '04', 'Show:');
      lblShowSub2.Caption              := lblShowSub1.Caption;
      lblHideSub1.Caption              := ReadString('Divide lines', '05', 'Hide:');
      lblHideSub2.Caption              := lblHideSub1.Caption;
      lblDuration1.Caption             := ReadString('Divide lines', '06', 'Duration:');
      lblDuration2.Caption             := lblDuration1.Caption;
      chkContinueDirectly.Caption      := ReadString('Divide lines', '07', 'Continue directly');
      LengthInChars                    := ReadString('Divide lines', '08', '%s characters');

      // Buttons
      btnDivide.Caption := ReadString('Divide lines', '09', '&Divide!');
      btnCancel.Caption := BTN_CANCEL;

      // ------------------ //
      //      Set font      //
      // ------------------ //
      btnDivide.ParentFont := True;
      Font                 := frmMain.Font;
      btnDivide.Font.Style := frmMain.Font.Style + [fsBold];
      mmoSub1.Font := frmMain.mmoSubtitleText.Font;
      mmoSub2.Font := frmMain.mmoSubtitleText.Font;
    end;
  finally
    LF.Free;
  end;
end;

// -----------------------------------------------------------------------------

function ZeroIfMinor(Value: Integer): Integer;
begin
  Result := Value;
  if Value < 0 then Result := 0;
end;

// -----------------------------------------------------------------------------

procedure TfrmDivideLines.CalculateTimes(Prop1, Prop2: Integer; AutomaticDur: Boolean = False);
var
  InitialTime : Integer;
  FinalTime   : Integer;
  Duration1   : Integer;
begin
  with frmMain do
  begin
    InitialTime := GetStartTime(lstSubtitles.FocusedNode);
    FinalTime   := GetFinalTime(lstSubtitles.FocusedNode);
    Duration1   := DivideSubDuration(lstSubtitles.FocusedNode, mmoSub1.Text, Prop1, Prop2, DefaultSubPause, AutomaticDur);
    
    tmeShowSub1.Time  := InitialTime;
    tmeHideSub2.Time  := FinalTime;
    tmeHideSub1.Time  := InitialTime + Duration1;
    tmeShowSub2.Time  := tmeHideSub1.Time + DefaultSubPause; //1 replaced with DefaultSubPause by adenry
    tmeDuration1.Time := Duration1;
    tmeDuration2.Time := tmeHideSub2.Time - tmeShowSub2.Time; //1 replaced with DefaultSubPause by adenry
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmDivideLines.chkContinueDirectlyClick(Sender: TObject);
begin
  if chkContinueDirectly.Checked then
  begin
    tmeShowSub2.Enabled := False;
    if chkUseAutoDur.Checked = False then
    begin
      tmeShowSub2.Time  := StringToTime(tmeHideSub1.Text) + frmMain.DefaultSubPause; //1 replaced with DefaultSubPause by adenry
      tmeDuration2.Time := Cardinal(GetFinalTime(frmMain.lstSubtitles.FocusedNode)) - (tmeShowSub2.Time {+ 1}); //+1 removed by adenry
    end else
      CalculateTimes(1, 1, True);
  end else
    tmeShowSub2.Enabled := True;
end;

// -----------------------------------------------------------------------------

procedure TfrmDivideLines.btnDivideClick(Sender: TObject);
var
  Data       : PSubtitleItem;
  UndoAction : PUndoAction;
begin
  with frmMain do
  begin
    // ------------------ //
    // Set first subtitle //
    // ------------------ //
    Data := lstSubtitles.GetNodeData(lstSubtitles.FocusedNode);

    New(UndoAction);
    UndoAction^.UndoActionType := uaFullTextChange;
    UndoAction^.UndoActionName := uanDivideLines; //added by adenry
    UndoAction^.Node           := lstSubtitles.FocusedNode;
    UndoAction^.LineNumber     := lstSubtitles.FocusedNode.Index;
    UndoAction^.BindToNext     := True;
    UndoAction^.BufferSize     := SizeOf(TFullTextChange);
    UndoAction^.Buffer         := AllocMem(UndoAction^.BufferSize);
    PFullTextChange(UndoAction^.Buffer)^.OriginalOnly := True;
    PFullTextChange(UndoAction^.Buffer)^.OldText := Data.Text;
    AddUndo(UndoAction);

    New(UndoAction);
    UndoAction^.UndoActionType := uaTimeChange;
    UndoAction^.UndoActionName := uanDivideLines; //added by adenry
    UndoAction^.Node           := lstSubtitles.FocusedNode;
    UndoAction^.LineNumber     := lstSubtitles.FocusedNode.Index;
    UndoAction^.BindToNext     := True;
    UndoAction^.BufferSize     := SizeOf(TTimeChange);
    UndoAction^.Buffer         := AllocMem(UndoAction^.BufferSize);
    PTimeChange(UndoAction^.Buffer)^.StartTime := Data.InitialTime;
    PTimeChange(UndoAction^.Buffer)^.FinalTime := Data.FinalTime;
    AddUndo(UndoAction);

    SetFinalTime(lstSubtitles.FocusedNode, tmeHideSub1.Time); //modified by adenry. was //Data.FinalTime := tmeHideSub1.Time;
    SetText(lstSubtitles.FocusedNode, mmoSub1.Text); //modified by adenry. was //Data.Text := mmoSub1.Text;
    lstSubtitles.InsertNode(lstSubtitles.FocusedNode, amInsertAfter);

    // ------------------- //
    // Set second subtitle //
    // ------------------- //
    New(UndoAction);
    UndoAction^.UndoActionType := uaInsertLine;
    UndoAction^.UndoActionName := uanDivideLines; //added by adenry
    UndoAction^.Node           := lstSubtitles.GetNextSibling(lstSubtitles.FocusedNode);
    UndoAction^.LineNumber     := UndoAction^.Node.Index;
    UndoAction^.BindToNext     := False;
    UndoAction^.Buffer         := nil;
    UndoAction^.BufferSize     := 0;
    AddUndo(UndoAction);

    Data := lstSubtitles.GetNodeData(lstSubtitles.GetNextSibling(lstSubtitles.FocusedNode));
    Data.InitialTime := tmeShowSub2.Time;
    Data.FinalTime   := tmeHideSub2.Time;
    Data.Text := mmoSub2.Text;
    if mnuTranslatorMode.Checked then
      Data.Translation := UntranslatedSub;

    UpdateSubSubtitleVisibilityAfterNodeChange(UndoAction^.Node, -1, -1, Data.InitialTime, Data.FinalTime); //added by adenry

    //lstSubtitles.Refresh; //AutoRecheck***Errors refreshes it
    RefreshTimes;
    OrgModified   := True;
    TransModified := True;
    //AutoRecheckAllErrors; //added by adenry
    AutoRecheckNodeErrorsAndRepaint(lstSubtitles.FocusedNode); //added by adenry
    AutoRecheckNodeErrorsAndRepaint(lstSubtitles.GetNextSibling(lstSubtitles.FocusedNode)); //added by adenry
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmDivideLines.FormCreate(Sender: TObject);
var
  Ini        : TIniFile;
  Out1, Out2 : String;
  MaxBreaks  : Integer;
begin
  SetLanguage;
  Ini := TIniFile.Create(IniRoot);
  try
    //AdjustAutomatically   := Ini.ReadBool('Advanced', 'Smart line adjust automatically', True);
    chkUseAutoDur.Checked := Ini.ReadBool('General', 'Use automatic durations (Divide lines)', True); //False changed to True by adenry
  finally
    Ini.Free;
  end;

  DoSelectAll := False; //added by adenry

  tmeShowSub1.FPS  := GetFPS;
  tmeHideSub1.FPS  := GetFPS;
  tmeShowSub2.FPS  := GetFPS;
  tmeHideSub2.FPS  := GetFPS;
  tmeDuration1.FPS := GetFPS;
  tmeDuration2.FPS := GetFPS;

  if frmMain.FormatType = ftTime then
  begin
    tmeShowSub1.TimeMode  := tmTime;
    tmeHideSub1.TimeMode  := tmTime;
    tmeShowSub2.TimeMode  := tmTime;
    tmeHideSub2.TimeMode  := tmTime;
    tmeDuration1.TimeMode := tmTime;
    tmeDuration2.TimeMode := tmTime;
  end else
  begin
    tmeShowSub1.TimeMode  := tmFrames;
    tmeHideSub1.TimeMode  := tmFrames;
    tmeShowSub2.TimeMode  := tmFrames;
    tmeHideSub2.TimeMode  := tmFrames;
    tmeDuration1.TimeMode := tmFrames;
    tmeDuration2.TimeMode := tmFrames;
  end;

  if frmMain.FormatType = ftFrames then
  begin
    tmeShowSub1.MaxLength  := 7;
    tmeShowSub2.MaxLength  := 7;
    tmeHideSub1.MaxLength  := 7;
    tmeHideSub2.MaxLength  := 7;
    tmeDuration1.MaxLength := 7;
    tmeDuration2.MaxLength := 7;
  end;
  chkContinueDirectly.Checked := True;
  with frmMain do
  begin
    mmoSub1.Alignment  := frmMain.mmoSubtitleText.Alignment;
    mmoSub2.Alignment  := frmMain.mmoSubtitleText.Alignment;
    OriginalString     := GetSubText(lstSubtitles.FocusedNode);//RemoveSWTags(GetSubText(lstSubtitles.FocusedNode), True, True, True, True); //RemoveSWTags added by adenry
    if Pos(#13#10, OriginalString) = 0 then
      //OriginalString := WrapText(OriginalString, frmMain.BreakLineAfter); //removed by adenry
      OriginalString := SmartWrapText(OriginalString, frmMain.OrgCharset, frmMain.BreakLineAfter); //added by adenry
  end;
  DivideSubText(OriginalString, BreaksArray, frmMain.AdjustAutomatically, Out1, Out2, MaxBreaks); //ProcessStringToDivide replaced with DivideSubText by adenry
  mmoSub1.Text := Out1;
  mmoSub2.Text := Out2;
  udDivideAfterBreakNum.Max := MaxBreaks;

  if udDivideAfterBreakNum.Max = 1 then
  begin
    udDivideAfterBreakNum.Enabled  := False;
    edtDivideAfterBreakNum.Enabled := False;
  end;
  Application.ProcessMessages;

  udDivideAfterBreakNum.Position := (StringCount(#13#10, OriginalString) + 1) div 2;
  CalculateTimes(1, 1, chkUseAutoDur.Checked);
end;

// -----------------------------------------------------------------------------

procedure TfrmDivideLines.udDivideAfterBreakNumChangingEx(Sender: TObject;
  var AllowChange: Boolean; NewValue: Smallint;
  Direction: TUpDownDirection);
var
  Part1, Part2: String;
begin
  if (NewValue >= 1) and (NewValue <= Length(BreaksArray)) then
  begin
    if Length(BreaksArray) > 0 then
    begin
      Part1 := Copy(OriginalString, 1, BreaksArray[NewValue-1]-1);
      Part2 := Copy(OriginalString, BreaksArray[NewValue-1] + 2, Length(OriginalString) - BreaksArray[NewValue-1]);
      TrimParts(Part1, Part2);
      mmoSub1.Text := Part1;
      mmoSub2.Text := Part2;
    end;
  end else
    AllowChange := True;
end;

// -----------------------------------------------------------------------------

procedure TfrmDivideLines.mmoSubtitle1Change(Sender: TObject);
begin
  lblLength1.Caption := Format(LengthInChars, [GetLengthForEachLine(mmoSub1.Text)]);
  if chkUseAutoDur.Checked then CalculateTimes(1, 1, True);

  if mmoSub1.ClassName = TRichEdit.ClassName then
  begin
    HighlightTags(TRichEdit(mmoSub1)); //by BDZL
    //added by adenry: fix Undo of TRichEdit
    if DoSelectAll then
    begin
      mmoSub1.SelectAll;
      DoSelectAll := False;
    end;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmDivideLines.mmoSubtitle2Change(Sender: TObject);
begin
  lblLength2.Caption := Format(LengthInChars, [GetLengthForEachLine(mmoSub2.Text)]);
  if chkUseAutoDur.Checked then CalculateTimes(1, 1, True);

  if mmoSub2.ClassName = TRichEdit.ClassName then
  begin
    HighlightTags(TRichEdit(mmoSub2)); //by BDZL
    //added by adenry: fix Undo of TRichEdit
    if DoSelectAll then
    begin
      mmoSub2.SelectAll;
      DoSelectAll := False;
    end;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmDivideLines.mmoSubtitle1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  Out1, Out2: String; //added by adenry
  MaxBreaks : Integer;//added by adenry
begin
  if ShortCut(Key, Shift) = frmMain.mnuFastSmartLineAdjust.ShortCut then
    //mmoSub1.Text := AdjustLines(mmoSub1.Text); //removed by adenry
  //added by adenry: begin
  begin
    mmoSub1.Text := FastSmartLineAdjust(mmoSub1.Text, frmMain.OrgCharset);
    mmoSub1.Text := FixTagsPositions(mmoSub1.Text);
    mmoSub1.Text := DeleteEmptyLines(mmoSub1.Text);
  end;
  //added by adenry: end

  //added by adenry: Undo support for when Tags Highlight is on
  if frmMain.TagsHighlight then
    if ShortCut(Key, Shift) = frmMain.mnuUndo.ShortCut then
    begin
      DivideSubText(OriginalString, BreaksArray, frmMain.AdjustAutomatically, Out1, Out2, MaxBreaks); //ProcessStringToDivide replaced with DivideSubText by adenry
      mmoSub1.Text := Out1;
      DoSelectAll := True;
    end;
  //added by adenry: paste plain text
  if ShortCut(Key, Shift) = frmMain.mnuPaste.ShortCut then
  begin
    Key := 0;
    frmMain.mnuPasteClick(Sender);
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmDivideLines.mmoSubtitle2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  Out1, Out2: String; //added by adenry
  MaxBreaks : Integer;//added by adenry
begin
  if ShortCut(Key, Shift) = frmMain.mnuFastSmartLineAdjust.ShortCut then
    //mmoSub2.Text := AdjustLines(mmoSub2.Text); //removed by adenry
  //added by adenry: begin
  begin
    mmoSub2.Text := FastSmartLineAdjust(mmoSub2.Text, frmMain.OrgCharset);
    mmoSub2.Text := FixTagsPositions(mmoSub2.Text);
    mmoSub2.Text := DeleteEmptyLines(mmoSub2.Text);
  end;
  //added by adenry: end

  //added by adenry: Undo support for when Tags Highlight is on
  if frmMain.TagsHighlight then
    if ShortCut(Key, Shift) = frmMain.mnuUndo.ShortCut then
    begin
      DivideSubText(OriginalString, BreaksArray, frmMain.AdjustAutomatically, Out1, Out2, MaxBreaks); //ProcessStringToDivide replaced with DivideSubText by adenry
      mmoSub2.Text := Out2;
      DoSelectAll := True;
    end;
  //added by adenry: paste plain text
  if ShortCut(Key, Shift) = frmMain.mnuPaste.ShortCut then
  begin
    Key := 0;
    frmMain.mnuPasteClick(Sender);
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmDivideLines.btn11Click(Sender: TObject);
begin
  CalculateTimes(1, 1);
end;

// -----------------------------------------------------------------------------

procedure TfrmDivideLines.btn12Click(Sender: TObject);
begin
  CalculateTimes(1, 2);
end;

// -----------------------------------------------------------------------------

procedure TfrmDivideLines.btn21Click(Sender: TObject);
begin
  CalculateTimes(2, 1);
end;

// -----------------------------------------------------------------------------

procedure TfrmDivideLines.btn23Click(Sender: TObject);
begin
  CalculateTimes(2, 3);
end;

// -----------------------------------------------------------------------------

procedure TfrmDivideLines.btn32Click(Sender: TObject);
begin
  CalculateTimes(3, 2);
end;

// -----------------------------------------------------------------------------

procedure TfrmDivideLines.btn13Click(Sender: TObject);
begin
  CalculateTimes(1, 3);
end;

// -----------------------------------------------------------------------------

procedure TfrmDivideLines.btn31Click(Sender: TObject);
begin
  CalculateTimes(3, 1);
end;

// -----------------------------------------------------------------------------

procedure TfrmDivideLines.chkUseAutoDurClick(Sender: TObject);
  procedure EnableCtrls(const Value: Boolean);
  begin
    chkContinueDirectly.Enabled := Value;
    tmeHideSub1.Enabled         := Value;
    tmeDuration1.Enabled        := Value;
    if chkContinueDirectly.Checked then
      tmeShowSub2.Enabled := False else
      tmeShowSub2.Enabled := Value = True;
  end;
begin
  CalculateTimes(1, 1, chkUseAutoDur.Checked);
  EnableCtrls(not chkUseAutoDur.Checked);
end;

// -----------------------------------------------------------------------------

procedure TfrmDivideLines.FormDestroy(Sender: TObject);
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(IniRoot);
  try
    Ini.WriteBool('General', 'Use automatic durations (Divide lines)', chkUseAutoDur.Checked);
  finally
    Ini.Free;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmDivideLines.tmeShowSub2TimeChangeFromEditOnly(
  Sender: TObject; NewTime: Cardinal);
begin
  tmeDuration2.Time := Cardinal(GetFinalTime(frmMain.lstSubtitles.FocusedNode)) - tmeShowSub2.Time;
end;

// -----------------------------------------------------------------------------

procedure TfrmDivideLines.tmeHideSub1TimeChangeFromEditOnly(
  Sender: TObject; NewTime: Cardinal);
var
  Time: Integer;
begin
  //if (chkContinueDirectly.Checked) then //removed by adenry
  //begin //removed by adenry
    Time := tmeHideSub1.Time;
    if (Time > -1) then
    begin
      if (chkContinueDirectly.Checked) then //added by adenry
        tmeShowSub2.Time  := Time + frmMain.DefaultSubPause; //1 replaced with DefaultSubPause by adenry
      tmeDuration1.Time := Time - GetStartTime(frmMain.lstSubtitles.FocusedNode);
      if (chkContinueDirectly.Checked) then //added by adenry
        tmeDuration2.Time := GetFinalTime(frmMain.lstSubtitles.FocusedNode) - (StringToTime(tmeShowSub2.Text));
    end;
  //end; //removed by adenry
end;

// -----------------------------------------------------------------------------

procedure TfrmDivideLines.tmeDuration1TimeChangeFromEditOnly(
  Sender: TObject; NewTime: Cardinal);
var
  Time: Integer;
begin
  //if (chkContinueDirectly.Checked) then //removed by adenry
  //begin //removed by adenry
    Time := tmeDuration1.Time;
    if (Time > -1) then
    begin
      if (chkContinueDirectly.Checked) then //added by adnery
        tmeShowSub2.Time  := GetStartTime(frmMain.lstSubtitles.FocusedNode) + Time + frmMain.DefaultSubPause; //1 replaced with DefaultSubPause by adenry
      if GetFocus <> tmeHideSub1.Handle then
        tmeHideSub1.Time  := GetStartTime(frmMain.lstSubtitles.FocusedNode) + Time;
      if (chkContinueDirectly.Checked) then //added by adenry
        tmeDuration2.Time := GetFinalTime(frmMain.lstSubtitles.FocusedNode) - (StringToTime(tmeShowSub2.Text));
    end;
  //end; //removed by adenry
end;

// -----------------------------------------------------------------------------

end.
