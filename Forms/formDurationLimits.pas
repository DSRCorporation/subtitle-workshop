// This file is part of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle Workshop's copyright information
// File Description: Duration Limits form

unit formDurationLimits;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, ComCtrls, ExtCtrls, IniFiles,
  VirtualTrees,
  CommonTypes;

type
  TfrmDurationLimits = class(TForm)
    btnApply: TButton;
    btnCancel: TButton;
    Panel1: TPanel;
    edtMaxDur: TLabeledEdit;
    chkSetMaxDur: TCheckBox;
    lblNoOverlapping: TLabel;
    edtMinDur: TLabeledEdit;
    chkSetMinDur: TCheckBox;
    chkIncreaseAtStart: TCheckBox;
    procedure edtMaxDurKeyPress(Sender: TObject; var Key: Char);
    procedure edtMinDurKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
  private
    procedure SetLanguage;
  public
    { Public declarations }
  end;

var
  frmDurationLimits: TfrmDurationLimits;

implementation

uses
  General, TreeViewHandle, Undo,
  formMain;

{$R *.dfm}

// -----------------------------------------------------------------------------

procedure TfrmDurationLimits.SetLanguage;
var
  LF: TIniFile;
begin
  LF := TIniFile.Create(frmMain.ActualLangFile);
  try
    With LF do
    begin
      Caption                     := ReadString('Duration limits', '01', 'Duration limits');
      chkSetMaxDur.Caption        := ReadString('Duration limits', '02', 'Set maximum duration');
      edtMaxDur.EditLabel.Caption := ReadString('Duration limits', '03', 'Milliseconds');
      chkSetMinDur.Caption        := ReadString('Duration limits', '04', 'Set minimum duration');
      edtMinDur.EditLabel.Caption := edtMaxDur.EditLabel.Caption;
      lblNoOverlapping.Caption    := ReadString('Duration limits', '05', '* Increasing the time will not cause overlapping');
      chkIncreaseAtStart.Caption  := ReadString('Duration limits', '06', 'Increase at start if necessary');
      btnApply.Caption            := BTN_APPLY;
      btnCancel.Caption           := BTN_CANCEL;

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

procedure TfrmDurationLimits.edtMaxDurKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Not (Key in['0'..'9', Chr(VK_RETURN), Chr(VK_BACK)]) then
    Key := #0;
end;

// -----------------------------------------------------------------------------

procedure TfrmDurationLimits.edtMinDurKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Not (Key in['0'..'9', Chr(VK_RETURN), Chr(VK_BACK)]) then
    Key := #0;
end;

// -----------------------------------------------------------------------------

procedure TfrmDurationLimits.FormCreate(Sender: TObject);
var
  Ini: TIniFile;
begin
  SetLanguage;
  Ini := TIniFile.Create(IniRoot);
  try
    chkSetMaxDur.Checked        := Ini.ReadBool('Duration limits','Set maximum duration',True);
    chkSetMinDur.Checked        := Ini.ReadBool('Duration limits','Set minimum duration',True);
    edtMaxDur.Text              := IntToStr(Ini.ReadInteger('Duration limits', 'Maximum duration', 4000));
    edtMinDur.Text              := IntToStr(Ini.ReadInteger('Duration limits', 'Minimum duration', 800));
    chkIncreaseAtStart.Checked  := Ini.ReadBool('Duration limits','Increase at start',True);
  finally
    Ini.Free;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmDurationLimits.FormDestroy(Sender: TObject);
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(IniRoot);
  try
    Ini.WriteBool('Duration limits', 'Set maximum duration', chkSetMaxDur.Checked);
    Ini.WriteBool('Duration limits', 'Set minimum duration', chkSetMinDur.Checked);
    Ini.WriteInteger('Duration limits', 'Maximum duration', StrToInt(edtMaxDur.Text));
    Ini.WriteInteger('Duration limits', 'Minimum duration', StrToInt(edtMinDur.Text));
    Ini.WriteBool('Duration limits', 'Increase at start', chkIncreaseAtStart.Checked);//added by adenry
  finally
    Ini.Free;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmDurationLimits.btnApplyClick(Sender: TObject);
var
  StartTime     : Integer;
  FinalTime     : Integer;
  OldStartTime  : Integer;//added by adenry
  OldFinalTime  : Integer;//added by adenry
  Duration      : Integer;
  Node          : PVirtualNode;
  UndoAction    : PUndoAction;
begin
  with frmMain do
  begin
    Node := lstSubtitles.GetFirst;

    while Assigned(Node) do
    begin
      StartTime     := GetStartTime(Node);
      OldStartTime  := StartTime; //added by adenry
      FinalTime     := GetFinalTime(Node);
      OldFinalTime  := FinalTime; //added by adenry
      Duration      := FinalTime - StartTime;

      // ---------------- //
      // Maximum duration //
      // ---------------- //
      if (chkSetMaxDur.Checked) and (Duration > StrToInt(edtMaxDur.Text)) and (StrToInt(edtMaxDur.Text) > 0) then
      begin
        //removed by adenry: begin
        {New(UndoAction);
        UndoAction^.UndoActionType                 := uaTimeChange;
        UndoAction^.BufferSize                     := SizeOf(TTimeChange);
        UndoAction^.Buffer                         := AllocMem(UndoAction^.BufferSize);
        UndoAction^.Node                           := Node;
        UndoAction^.LineNumber                     := Node.Index;
        UndoAction^.BindToNext                     := Assigned(Node.NextSibling);
        PTimeChange(UndoAction^.Buffer)^.StartTime := -1;
        PTimeChange(UndoAction^.Buffer)^.FinalTime := FinalTime;
        AddUndo(UndoAction);}
        //removed by adenry: end

        FinalTime := StartTime + StrToInt(edtMaxDur.Text);
        SetFinalTime(Node, FinalTime);
        Duration := FinalTime - StartTime;
      end;

      // ---------------- //
      // Mimimum duration //
      // ---------------- //
      if (chkSetMinDur.Checked) and (Duration < StrToInt(edtMinDur.Text)) then
      begin
        //removed by adenry: begin
        {New(UndoAction);
        UndoAction^.UndoActionType                 := uaTimeChange;
        UndoAction^.BufferSize                     := SizeOf(TTimeChange);
        UndoAction^.Buffer                         := AllocMem(UndoAction^.BufferSize);
        UndoAction^.Node                           := Node;
        UndoAction^.LineNumber                     := Node.Index;
        UndoAction^.BindToNext                     := Assigned(Node.NextSibling);
        PTimeChange(UndoAction^.Buffer)^.StartTime := -1;
        PTimeChange(UndoAction^.Buffer)^.FinalTime := FinalTime;
        AddUndo(UndoAction);}
        //removed by adenry: end

        FinalTime := StartTime + StrToInt(edtMinDur.Text);
        if (Node <> lstSubtitles.GetLast) and (FinalTime > GetStartTime(Node.NextSibling)-frmMain.DefaultSubPause) then //-frmMain.DefaultSubPause added by adenry
          FinalTime := GetStartTime(Node.NextSibling) - frmMain.DefaultSubPause; // - 1 replaced with DefaultSubPause by adenry
        if FinalTime > OldFinalTime then //prevent decreasing duration due to too short pauses
          SetFinalTime(Node, FinalTime) else
          FinalTime := OldFinalTime;

        //added by adenry: begin
        //extend duration by decreasing start time if necessary:
        if (FinalTime - StartTime < StrToInt(edtMinDur.Text)) and (chkIncreaseAtStart.Checked) then
        begin
          StartTime := FinalTime - StrToInt(edtMinDur.Text);
          if StartTime < 0 then
            StartTime := 0;
          if (Node <> lstSubtitles.GetFirst) and (StartTime < GetFinalTime(Node.PrevSibling)+frmMain.DefaultSubPause) then
            StartTime := GetFinalTime(Node.PrevSibling) + frmMain.DefaultSubPause;
          if StartTime < OldStartTime then //prevent decreasing duration due to too short pauses
            SetStartTime(Node, StartTime) else
            StartTime := OldStartTime;
        end;
        //added by adenry: end
      end;

      if (StartTime <> OldStartTime) or (FinalTime <> OldFinalTime) then
      begin
        New(UndoAction);
        UndoAction^.UndoActionType                 := uaTimeChange;
        UndoAction^.UndoActionName                 := uanSetDurLimits; //added by adenry
        UndoAction^.BufferSize                     := SizeOf(TTimeChange);
        UndoAction^.Buffer                         := AllocMem(UndoAction^.BufferSize);
        UndoAction^.Node                           := Node;
        UndoAction^.LineNumber                     := Node.Index;
        UndoAction^.BindToNext                     := Assigned(Node.NextSibling);
        if StartTime <> OldStartTime then
          PTimeChange(UndoAction^.Buffer)^.StartTime := OldStartTime else
          PTimeChange(UndoAction^.Buffer)^.StartTime := -1;
        if FinalTime <> OldFinalTime then
          PTimeChange(UndoAction^.Buffer)^.FinalTime := OldFinalTime else
          PTimeChange(UndoAction^.Buffer)^.FinalTime := -1;
        AddUndo(UndoAction);
      end;

      Node := Node.NextSibling;
    end;

    if UndoList.Count > 0 then //added by adenry later
      PUndoAction(UndoList.Last)^.BindToNext := False; //added by adenry later

    //OrgModified   := True; //removed by adenry - MODIFIED bug fix - SetText/SetTranslation/SetStartTime/SetFinalTime handle the MODIFIED flags
    //TransModified := True; //removed by adenry - MODIFIED bug fix - SetText/SetTranslation/SetStartTime/SetFinalTime handle the MODIFIED flags
    RefreshTimes;
    AutoRecheckAllErrors(TimeErrors); //added by adenry
  end;
  Close;
end;

// -----------------------------------------------------------------------------

end.
