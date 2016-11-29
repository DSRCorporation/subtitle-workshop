// This file is part of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle Workshop's copyright information
// File Description: Automatic Durations form

unit formAutomaticDurations;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, ExtCtrls, IniFiles, ComCtrls, Math,
  VirtualTrees,
  StrMan,
  CommonTypes;

type
  TfrmAutomaticDurations = class(TForm)
    btnApply: TButton;
    gbMethod: TGroupBox;
    lblPerCharacter: TLabel;
    edtMSPerCharacter: TEdit;
    udMSPerCharacter: TUpDown;
    lblPerWord: TLabel;
    edtMSPerWord: TEdit;
    udMSPerWord: TUpDown;
    lblPerLine: TLabel;
    edtMSPerLine: TEdit;
    udMSPerLine: TUpDown;
    btnCancel: TButton;
    pnlWhere: TPanel;
    rdoSelectedSubs: TRadioButton;
    rdoAllSubs: TRadioButton;
    Panel1: TPanel;
    rdoNewDurGreaterOrg: TRadioButton;
    rdoAllCases: TRadioButton;
    rdoNewDurSmallerOrg: TRadioButton;
    rdoMilliseconds: TRadioButton;
    rdoCharacters: TRadioButton;
    edtCPS: TEdit;
    udCPS: TUpDown;
    lblPerSecond: TLabel;
    pnlIncreaseAtStart: TPanel;
    chkIncreaseAtStart: TCheckBox;
    lblMilliseconds: TLabel;
    edtMaxIncrease: TLabeledEdit;
    udMaxIncrease: TUpDown;
    procedure btnApplyClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    procedure SetLanguage;
  public
    { Public declarations }
  end;

var
  frmAutomaticDurations: TfrmAutomaticDurations;

implementation

uses
  General, Functions, USubtitlesFunctions, TreeViewHandle, Undo, InfoErrorsFunctions, //InfoErrorsFunctions added by adenry //FastStringFuncs replaced with USubtitlesFunctions
  formMain;

{$R *.dfm}

// -----------------------------------------------------------------------------

procedure TfrmAutomaticDurations.SetLanguage;
var
  LF: TIniFile;
begin
  LF := TIniFile.Create(frmMain.ActualLangFile);
  try
    With LF do
    begin
      Caption                           := ReadString('Automatic durations', '01', 'Automatic durations');
      //gbMilliseconds.Caption            := ReadString('Automatic durations', '02', 'Milliseconds');
      rdoMilliseconds.Caption           := ReadString('Automatic durations', '02', 'Milliseconds');
      lblPerCharacter.Caption           := ReadString('Automatic durations', '03', 'per character');
      lblPerWord.Caption                := ReadString('Automatic durations', '04', 'per word');
      lblPerLine.Caption                := ReadString('Automatic durations', '05', 'per line');
      rdoAllCases.Caption               := ReadString('Automatic durations', '06', 'Apply new duration in all cases');
      rdoNewDurGreaterOrg.Caption       := ReadString('Automatic durations', '07', 'Only if new duration is greater than original');
      rdoNewDurSmallerOrg.Caption       := ReadString('Automatic durations', '08', 'Only if new duration is smaller than original');
      rdoAllSubs.Caption                := ReadString('Automatic durations', '09', 'All subtitles');
      rdoSelectedSubs.Caption           := ReadString('Automatic durations', '10', 'Selected subtitles only');
      btnApply.Caption                     := BTN_APPLY;
      btnCancel.Caption                 := BTN_CANCEL;
      //added by adenry: begin
      gbMethod.Caption                  := ReadString('Automatic durations', '11', 'Method');
      rdoCharacters.Caption             := ReadString('Automatic durations', '12', 'Characters');
      lblPerSecond.Caption              := ReadString('Automatic durations', '13', 'per second');
      chkIncreaseAtStart.Caption        := ReadString('Automatic durations', '14', 'Increase at start if necessary');
      edtMaxIncrease.EditLabel.Caption  := ReadString('Automatic durations', '15', 'Maximum increase at start (0 = no limit):');
      lblMilliseconds.Caption           := ReadString('Automatic durations', '16', 'milliseconds');
      //added by adenry: end
      
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

procedure TfrmAutomaticDurations.btnApplyClick(Sender: TObject);
var
  Node          : PVirtualNode;
  InitialTime   : Integer;
  FinalTime     : Integer; //added by adenry later
  OldDuration   : Integer;
  NewDuration   : Integer;
  StartIncrease : Integer; //added by adenry
  Text          : String;
  UndoAction    : PUndoAction;
  //PauseToPrev   : Integer; //added by adenry
  PauseToNext   : Integer; //added by adenry
  ModValInit    : Word; //added by adenry
  ModValFinal   : Word; //added by adenry
begin
  if rdoAllSubs.Checked then
    Node := frmMain.lstSubtitles.GetFirst else
    Node := frmMain.lstSubtitles.GetFirstSelected;
  while Assigned(Node) do
  begin
    Text := RemoveSWTags(GetSubText(Node), True, True, True, True);
    if rdoMilliseconds.Checked then
    begin
      // Duration = Tcharacter x Ncharacters + Tword x Nwords + Tline x Nlines
      NewDuration := (
                      udMSPerCharacter.Position * (Length(Text) - StringCount(' ', Text) - StringCount(#13#10, Text)*2) + //() added by adenry to fix a bug
                      udMSPerWord.Position      * sm.CountWords(Text) +
                      udMSPerLine.Position      * (StringCount(#13#10, Text)+1)
                      );
    end else
    begin
      Text := ReplaceString(Text, #13#10, ''); //added by adenry
      NewDuration := Math.Ceil((Length(Text) * 1000) / udCPS.Position);
    end;

    OldDuration := GetFinalTime(Node) - GetStartTime(Node);
    InitialTime := GetStartTime(Node);
    StartIncrease := 0;
    if Node <> frmMain.lstSubtitles.GetLast then
    begin
      // Avoid overlapping
      PauseToNext := Min(GetPause(Node.NextSibling), TooShortPause); //added by adenry
      if (InitialTime + NewDuration) > GetStartTime(Node.NextSibling) - PauseToNext then // - PauseToNext added by adenry
      //Decrease of NewDuration is necessary to avoid too short pauses
      begin
        StartIncrease := NewDuration;//store the target new duration temporarily //added by adenry
        NewDuration := GetStartTime(Node.NextSibling) - PauseToNext - InitialTime; // - 1 replaced with - PauseToNext by adenry
        //added by adenry: begin
        //Increase at Start if possible:
        if chkIncreaseAtStart.Checked and ((GetPause(Node) > TooShortPause) or ((Node = frmMain.lstSubtitles.GetFirst)and(GetStartTime(Node)>0))) then
        begin
          //PauseToPrev := Min(GetPause(Node), TooShortPause); //added by adenry
          StartIncrease := StartIncrease - NewDuration; //target duration - new duration
          if (StartIncrease > udMaxIncrease.Position) and (udMaxIncrease.Position > 0) then //max increase at start option
            StartIncrease := udMaxIncrease.Position;
          //Avoid overlapping again
          if InitialTime - StartIncrease < 0 then
            StartIncrease := InitialTime;
          if Node <> frmMain.lstSubtitles.GetFirst then
            if (InitialTime - StartIncrease) < GetFinalTime(Node.PrevSibling) + TooShortPause then  //PauseToPrev replaced with TooShortPause
              StartIncrease := InitialTime - GetFinalTime(Node.PrevSibling) - TooShortPause; //PauseToPrev replaced with TooShortPause //my bug fixed: +TooShortPause changed to -TooShortPause
        end else
          StartIncrease := 0;
        //added by adenry: end
      end;
    end;

    if ((rdoAllCases.Checked) and ((NewDuration <> OldDuration)or(StartIncrease>0))) or //and (NewDuration <> OldDuration) added by adenry
       ((rdoNewDurGreaterOrg.Checked) and ((NewDuration > OldDuration)or(StartIncrease>0))) or
       ((rdoNewDurSmallerOrg.Checked) and (NewDuration < OldDuration)) then
    begin

      New(UndoAction);
      UndoAction^.UndoActionType                    := uaTimeChange;
      UndoAction^.UndoActionName                    := uanAutoDur; //added by adenry
      UndoAction^.BufferSize                        := SizeOf(TTimeChange);
      UndoAction^.Buffer                            := AllocMem(UndoAction^.BufferSize);
      UndoAction^.Node                              := Node;
      UndoAction^.LineNumber                        := Node.Index;
      UndoAction^.BindToNext                        := True;//((rdoAllSubs.Checked) and (Assigned(Node.NextSibling))) or ((rdoAllSubs.Checked = False) and (Assigned(frmMain.lstSubtitles.GetNextSelected(Node)))); //changed by adenry
      if StartIncrease > 0 then //added by adenry
        PTimeChange(UndoAction^.Buffer)^.StartTime  := GetStartTime(Node) else //added by adenry
        PTimeChange(UndoAction^.Buffer)^.StartTime  := -1;
      PTimeChange(UndoAction^.Buffer)^.FinalTime    := GetFinalTime(Node);
      AddUndo(UndoAction);

      SetFinalTime(Node, InitialTime + NewDuration);
      SetStartTime(Node, InitialTime - StartIncrease);

      //added by adenry: begin
      //ROUNDING:
      if frmMain.AutoRoundTimeVals then
      begin
        InitialTime   := GetStartTime(Node);
        FinalTime     := GetFinalTime(Node);
        OldDuration   := FinalTime - InitialTime;
        ModValInit    := InitialTime mod frmMain.RoundingFactor;
        ModValFinal   := FinalTime mod frmMain.RoundingFactor;
        if (ModValInit > 0) or (ModValFinal > 0) then //if rounding is necessary
        begin
          //Round Initial Time:
          if ModValInit > 0 then
            if (StartIncrease = 0) and ( (GetPause(Node) >= frmMain.DefaultSubPause + ModValInit) or ((Node = frmMain.lstSubtitles.GetFirst)and(InitialTime >= frmMain.DefaultSubPause + ModValInit)) ) then
              SetStartTime(Node, RoundTimeValue(InitialTime, frmMain.RoundingFactor, False, True)) else //Round down the Initial Time
              SetStartTime(Node, RoundTimeValue(InitialTime, frmMain.RoundingFactor, True, False)); //Round up the Initial Time
          InitialTime := GetStartTime(Node);
          //Round Final Time:
          NewDuration := RoundTimeValue(FinalTime, frmMain.RoundingFactor, False, True) - InitialTime; //1: try to round down the final time
          if (NewDuration >= OldDuration) then
            SetFinalTime(Node, InitialTime + NewDuration) else //Success!
          begin
            //try to increase at end
            while (NewDuration < OldDuration) do
            begin
              NewDuration := NewDuration + frmMain.RoundingFactor;
              SetFinalTime(Node, InitialTime + NewDuration);
              if (GetPause(Node.NextSibling) < frmMain.DefaultSubPause) and (Node <> frmMain.lstSubtitles.GetLast) then
              //there is pause overlap with next sub
              begin
                NewDuration := NewDuration - frmMain.RoundingFactor; //decrease final time back because of pause overlap
                SetFinalTime(Node, InitialTime + NewDuration);
                //try to increase at start
                while (NewDuration < OldDuration) do
                begin
                  if (GetPause(Node) >= frmMain.DefaultSubPause + frmMain.RoundingFactor) or ((Node = frmMain.lstSubtitles.GetFirst)and(InitialTime >= frmMain.RoundingFactor)) then
                  //there is room to increase at start
                  begin
                    SetStartTime(Node, GetStartTime(Node) - frmMain.RoundingFactor);
                    InitialTime := GetStartTime(Node);
                    NewDuration := GetFinalTime(Node) - GetStartTime(Node);
                  end else
                    break; //can't increase at start
                end;
                break; //can't increase any more anywhere
              end;
            end;
          end;
        end;
      end;
      //added by adenry: end

    end;

    if rdoAllSubs.Checked then
      Node := Node.NextSibling else
      Node := frmMain.lstSubtitles.GetNextSelected(Node);
  end;

  if UndoList.Count > 0 then
    PUndoAction(UndoList.Last)^.BindToNext := False; //added by adenry
  //frmMain.lstSubtitles.Refresh; //AutoRecheck***Errors refreshes it
  frmMain.RefreshTimes;
  frmMain.AutoRecheckAllErrors(TimeErrors); //added by adenry
end;

// -----------------------------------------------------------------------------

procedure TfrmAutomaticDurations.FormCreate(Sender: TObject);
var
  Ini: TIniFile;
begin
  SetLanguage;
  Ini := TIniFile.Create(IniRoot);
  try
    udMSPerCharacter.Position := Ini.ReadInteger('Automatic durations', 'Per character', 60);
    udMSPerWord.Position      := Ini.ReadInteger('Automatic durations', 'Per word', 50);
    udMSPerLine.Position      := Ini.ReadInteger('Automatic durations', 'Per line', 50);
    rdoAllSubs.Checked        := Ini.ReadBool('Automatic durations', 'All subtitles', True);
    rdoSelectedSubs.Checked   := not Ini.ReadBool('Automatic durations', 'All subtitles', True);
    case Ini.ReadInteger('Automatic durations', 'Apply if', 1) of
      2: rdoNewDurGreaterOrg.Checked := True;
      3: rdoNewDurSmallerOrg.Checked := True else
      rdoAllCases.Checked := True;
    end;
    //added by adenry: begin
    rdoMilliseconds.Checked   := Ini.ReadBool('Automatic durations', 'Milliseconds', True);
    rdoCharacters.Checked     := not rdoMilliseconds.Checked;
    udCPS.Position            := Ini.ReadInteger('Automatic durations', 'CPS', 20);
    chkIncreaseAtStart.Checked:= Ini.ReadBool('Automatic durations', 'Increase at start', False);
    udMaxIncrease.Position    := Ini.ReadInteger('Automatic durations', 'Max increase', 0);
    //added by adenry: end
  finally
    Ini.Free;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmAutomaticDurations.FormDestroy(Sender: TObject);
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(IniRoot);
  try
    Ini.WriteInteger('Automatic durations', 'Per character', udMSPerCharacter.Position);
    Ini.WriteInteger('Automatic durations', 'Per word', udMSPerWord.Position);
    Ini.WriteInteger('Automatic durations', 'Per line', udMSPerLine.Position);
    Ini.WriteBool('Automatic durations', 'All subtitles', rdoAllSubs.Checked);
    if rdoAllCases.Checked         then Ini.WriteInteger('Automatic durations', 'Apply if', 1) else
    if rdoNewDurGreaterOrg.Checked then Ini.WriteInteger('Automatic durations', 'Apply if', 2) else
    if rdoNewDurSmallerOrg.Checked then Ini.WriteInteger('Automatic durations', 'Apply if', 3);
    //added by adenry: begin
    Ini.WriteBool('Automatic durations', 'Milliseconds', rdoMilliseconds.Checked);
    Ini.WriteInteger('Automatic durations', 'CPS', udCPS.Position);
    Ini.WriteBool('Automatic durations', 'Increase at start', chkIncreaseAtStart.Checked);
    Ini.WriteInteger('Automatic durations', 'Max increase', udMaxIncrease.Position);
    //added by adenry: end
  finally
    Ini.Free;
  end;
end;

// -----------------------------------------------------------------------------

end.
