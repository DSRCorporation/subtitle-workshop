// This file is part of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle Workshop's copyright information
// File Description: Smart Line Adjust form

unit formSmartLineAdjust; //added by adenry

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, ComCtrls, IniFiles,
  VirtualTrees,
  CommonTypes;

type
  TfrmSmartLineAdjust = class(TForm)
    btnApply: TButton;
    btnCancel: TButton;
    pnlSmartLineAdjust1: TPanel;
    lblTwoLinesIfLongerThan: TLabel;
    edtCharacters1: TEdit;
    udCharacters1: TUpDown;
    lblCharacters1: TLabel;
    lblBreakMethod: TLabel;
    edtCharacters2: TEdit;
    udCharacters2: TUpDown;
    lblCharacters2: TLabel;
    rdoBreakOnPunctuationMarks: TRadioButton;
    rdoEqualLines: TRadioButton;
    lblMinimumLineLength: TLabel;
    pnlSmartLineAdjust2: TPanel;
    rdoAllSubs: TRadioButton;
    rdoSelSubs: TRadioButton;
    chkDontUnbreak: TCheckBox;
    chkAdjustOnly: TCheckBox;
    chkAlwaysTry: TCheckBox;
    procedure btnApplyClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SetLanguage;
    procedure chkAlwaysTryEnable(Sender: TObject);
  private
    { Private declarations }
    function SmartLineAdjust(Text: String; FontCharset: TFontCharset): String;
  public
    { Public declarations }
  end;

var
  frmSmartLineAdjust: TfrmSmartLineAdjust;

implementation

uses
  General, Functions, InfoErrorsFunctions, Undo, TreeViewHandle, USubtitlesFunctions,
  formMain;

{$R *.dfm}

// -----------------------------------------------------------------------------

function TfrmSmartLineAdjust.SmartLineAdjust(Text: String; FontCharset: TFontCharset): String;
var
  DialoguesOnOneLineNum: Integer;
begin
  //first unbreak subtitles over two lines
  if CountLines(Text) > 2 then
    Text := ReplaceEnters(Text, ' ');

  //check for dialogue - we can't do anything if this is a two-line subtitle with a dialogue dash on second line
  if not HasDashOnSecondLine(Text, FontCharset) then
  begin
    DialoguesOnOneLineNum := HasDialogueOnOneLine(Text, FontCharset);
    if DialoguesOnOneLineNum > 0 then //whatever the line length is, fix dialogue on one line
      Text := FixDialogueOnOneLine(Text, FontCharset, DialoguesOnOneLineNum) else
      begin
        //unbreak
        if HasTooLongLine(Text, udCharacters1.Position+1) then
          Text := ReplaceEnters(Text, ' ') else
        begin
          //make 2-line subtitles 1-line subtitles if possible
          if not chkDontUnbreak.Checked then
          begin
            if not HasTooLongLine(ReplaceEnters(Text, ' '), udCharacters1.Position+1) then
              Text := ReplaceEnters(Text, ' ');
          end;
          //if all subtitles should be adjusted, not just the long ones... //added later
          if (chkAdjustOnly.Checked = False) and (CountLines(Text) = 2) then
            if rdoBreakOnPunctuationMarks.Checked then
              Text := FindBetterBreakPoint(Text, FontCharset, udCharacters1.Position, not chkAlwaysTry.Checked) else
              Text := BreakTextInTheMiddle(Text);
        end;

        if HasTooLongLine(Text, udCharacters1.Position+1) then
        begin
          //Break on punctuation
          if rdoBreakOnPunctuationMarks.Checked then
            Text := SmartWrapText(Text, FontCharset, udCharacters1.Position, True);
          //equal lines
          if HasTooLongLine(Text, udCharacters1.Position+1) then
            Text := BreakTextInTheMiddle(Text);
        end;
      end;
  end;
  Result := Text;
end;

// -----------------------------------------------------------------------------

procedure TfrmSmartLineAdjust.btnApplyClick(Sender: TObject);
var
  Node, NextNode  : PVirtualNode;
  UndoAction      : PUndoAction;
  Text            : String;
  Modified        : Boolean;
begin
Screen.Cursor := crHourglass; //added by adenry
try
  with frmMain do
  begin
    if rdoSelSubs.Checked then
      Node := lstSubtitles.GetFirstSelected else
      Node := lstSubtitles.GetFirst;

    while Assigned(Node) do
    begin
      if rdoSelSubs.Checked then
        NextNode := lstSubtitles.GetNextSelected(Node) else
        NextNode := Node.NextSibling;

      New(UndoAction);
      UndoAction^.UndoActionType := uaFullTextChange;
      UndoAction^.UndoActionName := uanSmartLineAdjust; //added by adenry
      UndoAction^.BufferSize     := SizeOf(TFullTextChange);
      UndoAction^.Buffer         := AllocMem(UndoAction^.BufferSize);
      UndoAction^.Node           := Node;
      UndoAction^.LineNumber     := Node.Index;
      PFullTextChange(UndoAction^.Buffer)^.OriginalOnly := not mnuTranslatorMode.Checked; //the NOT was added by adenry - bug fix
      PFullTextChange(UndoAction^.Buffer)^.OldText := GetSubText(Node);

      Modified := False;

      Text := FixTagsPositions(Text);
      Text := DeleteEmptyLines(Text);
      Text := SmartLineAdjust(GetSubText(Node), OrgCharset); //SMART LINE ADJUST
      if Text <> GetSubText(Node) then
      begin
        SetText(Node, Text);
        Modified := True;
      end;

      if mnuTranslatorMode.Checked then
      begin
        Text := SmartLineAdjust(GetSubTranslation(Node), TransCharset);
        if (Text <> GetSubTranslation(Node)) then
        begin
          PFullTextChange(UndoAction^.Buffer)^.OldTrans := GetSubTranslation(Node);
          SetTranslation(Node, Text);
          Modified := True;
        end;
      end;

      AutoRecheckNodeErrors(Node, TextErrors);
      UndoAction^.BindToNext := Assigned(NextNode);
      if Modified then
        AddUndo(UndoAction);

      Node := NextNode;
    end;

    if UndoList.Count > 0 then //added by adenry later
      PUndoAction(UndoList.Last)^.BindToNext := False; //added by adenry later
    lstSubtitles.Refresh;
    RefreshTimes;
  end;
finally
  Screen.Cursor := crDefault; //added by adenry
end;
end;

// -----------------------------------------------------------------------------

procedure TfrmSmartLineAdjust.FormCreate(Sender: TObject);
var
  Ini: TIniFile;
begin
  SetLanguage;
  Ini := TIniFile.Create(IniRoot);
  try
    udCharacters1.Position              := Ini.ReadInteger('Smart Line Adjust', 'Max length', 45);
    rdoEqualLines.Checked               := Ini.ReadBool('Smart Line Adjust', 'Equal lines', False);
    rdoBreakOnPunctuationMarks.Checked  := not rdoEqualLines.Checked;
    //udCharacters2.Position              := Ini.ReadInteger('Smart Line Adjust', 'Min length', 5);
    chkDontUnbreak.Checked              := Ini.ReadBool('Smart Line Adjust', 'Dont unbreak', True);
    chkAdjustOnly.Checked               := Ini.ReadBool('Smart Line Adjust', 'Adjust only', True); //added later
    rdoAllSubs.Checked                  := Ini.ReadBool('Smart Line Adjust', 'All subtitles', True);
    rdoSelSubs.Checked                  := not rdoAllSubs.Checked;
    chkAlwaysTry.Checked                := Ini.ReadBool('Smart Line Adjust', 'Always try better breaking point', False);
    chkAlwaysTry.Enabled                := not chkAdjustOnly.Checked and rdoBreakOnPunctuationMarks.Checked; //added later
  finally
    Ini.Free;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmSmartLineAdjust.FormDestroy(Sender: TObject);
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(IniRoot);
  try
    Ini.WriteInteger('Smart Line Adjust', 'Max length', udCharacters1.Position);
    Ini.WriteBool('Smart Line Adjust', 'Equal lines', rdoEqualLines.Checked);
    //Ini.WriteInteger('Smart Line Adjust', 'Min length', udCharacters2.Position);
    Ini.WriteBool('Smart Line Adjust', 'Dont unbreak', chkDontUnbreak.Checked);
    Ini.WriteBool('Smart Line Adjust', 'Adjust only', chkAdjustOnly.Checked); //added later
    Ini.WriteBool('Smart Line Adjust', 'All subtitles', rdoAllSubs.Checked);
    Ini.WriteBool('Smart Line Adjust', 'Always try better breaking point', chkAlwaysTry.Checked); //added later
  finally
    Ini.Free;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmSmartLineAdjust.SetLanguage;
var
  LF: TIniFile;
begin
  LF := TIniFile.Create(frmMain.ActualLangFile);
  try
    With LF do
    begin
      Caption                             := ReadString('Smart line adjust', '01', 'Smart line adjust');
      lblTwoLinesIfLongerThan.Caption     := ReadString('Smart line adjust', '02', 'Two lines if longer than:');
      lblCharacters1.Caption              := ReadString('Smart line adjust', '03', 'characters');
      lblBreakMethod.Caption              := ReadString('Smart line adjust', '04', 'Break method:');
      rdoEqualLines.Caption               := ReadString('Smart line adjust', '05', 'Equal lines');
      rdoBreakOnPunctuationMarks.Caption  := ReadString('Smart line adjust', '06', 'Break on punctuation marks');
      chkDontUnbreak.Caption              := ReadString('Smart line adjust', '07', 'Don''t unbreak subtitles that are not too long');
      chkAdjustOnly.Caption               := ReadString('Smart line adjust', '08', 'Adjust only long subs and subs with more than 2 lines');
      rdoAllSubs.Caption                  := ReadString('Smart line adjust', '09', 'For all the subtitles');
      rdoSelSubs.Caption                  := ReadString('Smart line adjust', '10', 'For the selected subtitles');
      chkAlwaysTry.Caption                := ReadString('Smart line adjust', '11', 'Always try to find a better breaking point');
      btnApply.Caption                    := BTN_APPLY;
      btnCancel.Caption                   := BTN_CANCEL;
      
      // ------------------ //
      //      Set font      //
      // ------------------ //
      btnApply.ParentFont := True;
      Font                := frmMain.Font;
      btnApply.Font.Style := frmMain.Font.Style + [fsBold];
    end;
  finally
    LF.Free;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmSmartLineAdjust.chkAlwaysTryEnable(Sender: TObject);
begin
  chkAlwaysTry.Enabled := not chkAdjustOnly.Checked and rdoBreakOnPunctuationMarks.Checked;
end;

// -----------------------------------------------------------------------------

end.
