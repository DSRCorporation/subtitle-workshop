// This file is part of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle Workshop's copyright information
// File Description: Auto Combine Subtitles form

unit formCombineSubtitles; //added by adenry

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, ComCtrls, ExtCtrls, IniFiles,
  VirtualTrees,
  CommonTypes;

type
  TfrmCombineSubtitles = class(TForm)
    btnApply: TButton;
    btnCancel: TButton;
    pnlCombineSubtitles2: TPanel;
    rdoAllSubs: TRadioButton;
    rdoSelSubs: TRadioButton;
    pnlCombineSubtitles1: TPanel;
    edtMinDuration: TLabeledEdit;
    udMinDuration: TUpDown;
    lblMilliseconds1: TLabel;
    edtMaxCPS: TLabeledEdit;
    udMaxCPS: TUpDown;
    lblCPS: TLabel;
    edtMaxPause: TLabeledEdit;
    udMaxPause: TUpDown;
    lblMilliseconds2: TLabel;
    pnlCombineSubtitles3: TPanel;
    edtMaxDuration: TLabeledEdit;
    udMaxDuration: TUpDown;
    lblMilliseconds3: TLabel;
    edtDecreaseDur: TLabeledEdit;
    udDecreaseDur: TUpDown;
    lblMilliseconds4: TLabel;
    pnlCombineSubtitles4: TPanel;
    chkPunctuationMarks: TCheckBox;
    pnlCombineSubtitles5: TPanel;
    edtMaxLineLength: TLabeledEdit;
    udMaxLineLength: TUpDown;
    lblCharacters: TLabel;
    procedure btnApplyClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SetLanguage;
  private
    { Private declarations }
    function StripText(S: String): String;
    function PunctuationDetection (S1, S2: String): Boolean;
  public
    { Public declarations }
  end;

var
  frmCombineSubtitles: TfrmCombineSubtitles;

implementation

uses
  General, Functions, TreeViewHandle, Undo, USubtitlesFunctions, InfoErrorsFunctions,
  formMain;

{$R *.dfm}

// -----------------------------------------------------------------------------

function TfrmCombineSubtitles.StripText(S: String): String;
begin
  S := RemoveSWTags(S, True, True, True, True);
  S := ReplaceString(S, #13#10, '');
  S := ReplaceString(S, ' ', '');
  S := ReplaceString(S, '"', '');
  S := ReplaceString(S, #39, '');
  Result := S;
end;

// -----------------------------------------------------------------------------

//Result = True means S1 and S2 can be combined.
function TfrmCombineSubtitles.PunctuationDetection (S1, S2: String): Boolean;
var
  C1_Last, C1_BeforeLast, C2_First: Char;
begin
  Result := True;
  if not chkPunctuationMarks.Checked then
    exit else //True
    begin
      //check for dialogue in second text
      //if (Pos(#13#10+'-', S2)>0) or (Pos(#13#10#150, S2)>0) or (Pos(#13#10#151, S2)>0) or (Pos(#13#10#173, S2)>0) then
      if HasDashOnSecondLine(S2, frmMain.OrgCharset) then
      begin
        Result := False;
        exit;
      end;
      //check for dialogue in first text
      //if (Pos(#13#10+'-', S1)>0) or (Pos(#13#10#150, S1)>0) or (Pos(#13#10#151, S1)>0) or (Pos(#13#10#173, S1)>0) then
      if HasDashOnSecondLine(S1, frmMain.OrgCharset) then
      begin
        Result := False;
        exit;
      end;
      S1 := StripText(S1);
      S2 := StripText(S2);
      C1_Last := #0;
      C1_BeforeLast := #0;
      C2_First := #0;
      if Length(S1)>0 then
        C1_Last := Copy(S1, Length(S1), 1)[1];
      if Length(S1)>1 then
        C1_BeforeLast := Copy(S1, Length(S1)-1, 1)[1];
      if Length(S2)>0 then
        C2_First := Copy(S2, 1, 1)[1];

      if (C1_Last in ['?', '!', '.']) or ((C1_Last in dashes)and(C1_BeforeLast in dashes)) then  // first string should not end on ? . ! or --
        if not (C2_First in dashes) then //at this point, combine only if S2 has dash on first line
          Result := False;
    end;
end;

// -----------------------------------------------------------------------------

procedure TfrmCombineSubtitles.btnApplyClick(Sender: TObject);
var
  Node      : PVirtualNode;
  Data      : PSubtitleItem;
  Combined  : Boolean;
  UndoAction: PUndoAction;
  NewText   : String; //added ;ater
begin
  if (udMinDuration.Position > 0) or (udMaxCPS.Position > 0) then
  begin
  Screen.Cursor := crHourglass;
  try
    if rdoAllSubs.Checked then
      Node := frmMain.lstSubtitles.GetFirst else
      Node := frmMain.lstSubtitles.GetFirstSelected;

    while Assigned(Node) do
    begin
      Combined := False;
      //1. Check if the subtitle needs combinig
      if (GetFinalTime(Node)-GetStartTime(Node) < udMinDuration.Position) or (udMinDuration.Position = 0) or
      (GetSubCPS(Node) > udMaxCPS.Position) or (udMaxCPS.Position = 0) then
        begin
          //2. Try to combine with previous subtitle
          if Assigned(Node.PrevSibling) then
            //2.1. Check max pause condition
            if (GetPause(Node) <= udMaxPause.Position) or (udMaxPause.Position = 0) then
              //2.2. Check punctuation detection
              if PunctuationDetection(GetSubText(Node.PrevSibling), GetSubText(Node)) then
                //2.3. Check max duration of combined subs
                if (GetFinalTime(Node)-GetStartTime(Node.PrevSibling) <= udMaxDuration.Position+udDecreaseDur.Position) or (udMaxDuration.Position = 0) then
                  //2.4. Check max lines length of combined subs
                  if not HasTooLongLine(WrapTextEqualLines((GetSubText(Node.PrevSibling)+' '+GetSubText(Node)), #13#10, [' '], udMaxLineLength.Position), udMaxLineLength.Position+1) then
                  begin
                    //WE ARE COMBINING THE SUBS NOW!
                    Node := Node.PrevSibling; //because second node will be deleted...
                    //2.5. Add Undo for second subtitle (deleted) - it's important to first add the uaDeleteLine undo (for proper error refresh)!
                    Data := frmMain.lstSubtitles.GetNodeData(Node.NextSibling);
                    New(UndoAction);
                    UndoAction^.BufferSize                        := SizeOf(TLineChange);
                    UndoAction^.Buffer                            := AllocMem(UndoAction^.BufferSize);
                    UndoAction^.UndoActionType                    := uaDeleteLine;
                    UndoAction^.UndoActionName                    := uanAutoCombineSubs; //added by adenry
                    UndoAction^.BindToNext                        := True;
                    UndoAction^.LineNumber                        := Node.NextSibling.Index;
                    PLineChange(UndoAction^.Buffer)^.SubtitleItem := Data^;
                    AddUndo(UndoAction);
                    //2.6. Add Undo for first subtitle (full change)
                    Data := frmMain.lstSubtitles.GetNodeData(Node);
                    New(UndoAction);
                    UndoAction^.UndoActionType := uaFullSubChange;
                    UndoAction^.UndoActionName := uanAutoCombineSubs; //added by adenry
                    UndoAction^.BufferSize     := SizeOf(TLineChange);
                    UndoAction^.Buffer         := AllocMem(UndoAction^.BufferSize);
                    UndoAction^.Node           := Node;
                    UndoAction^.LineNumber     := Node.Index;
                    UndoAction^.BindToNext     := True;
                    PLineChange(UndoAction^.Buffer).SubtitleItem := Data^;
                    AddUndo(UndoAction);
                    //2.7. COMBINE SUBTITLES
                    //2.7.1. SET TEXT
                    NewText := ReplaceString(GetSubText(Node), #13#10, ' ') + #13#10
                             + ReplaceString(GetSubText(Node.NextSibling), #13#10, ' ');
                    NewText := SmartWrapText(NewText, frmMain.OrgCharset, udMaxLineLength.Position);
                    NewText := RemoveUnnecessaryTags(NewText);
                    SetText(Node, NewText);
                    //2.7.2. SET TRANSLATION
                    NewText := ReplaceString(GetSubTranslation(Node), #13#10, ' ');
                    if NewText = UntranslatedSub then
                      NewText := '' else
                      NewText := NewText + #13#10;
                    if (GetSubTranslation(Node.NextSibling) <> UntranslatedSub) or (NewText = '') then
                      NewText := NewText + ReplaceString(GetSubTranslation(Node.NextSibling), #13#10, ' ');
                    NewText := SmartWrapText(NewText, frmMain.TransCharset, udMaxLineLength.Position);
                    SetTranslation(Node, NewText);
                    //2.7.3. SET TIMINGS
                    if GetFinalTime(Node.NextSibling) - GetStartTime(Node) > udMaxDuration.Position then
                      SetFinalTime(Node, GetStartTime(Node)+udMaxDuration.Position) else
                      SetFinalTime(Node, GetFinalTime(Node.NextSibling));
                    //2.7.4. DELETE SECOND NODE
                    frmMain.lstSubtitles.DeleteNode(Node.NextSibling);
                    Combined := True;
                  end;
          //3. Try to combine with next subtitle if combining with the previous failed
          if not Combined and Assigned(Node.NextSibling) then
            //3.1. Check max pause condition
            if (GetPause(Node.NextSibling) <= udMaxPause.Position) or (udMaxPause.Position = 0) then
              //3.2. Check punctuation detection
              if PunctuationDetection(GetSubText(Node), GetSubText(Node.NextSibling)) then
                //3.3. Check max duration of combined subs
                if (GetFinalTime(Node.NextSibling)-GetStartTime(Node) <= udMaxDuration.Position+udDecreaseDur.Position) or (udMaxDuration.Position = 0) then
                  //3.4. Check max lines length of combined subs
                  if not HasTooLongLine(WrapTextEqualLines((GetSubText(Node)+' '+GetSubText(Node.NextSibling)), #13#10, [' '], udMaxLineLength.Position), udMaxLineLength.Position+1) then
                  begin
                    //WE ARE COMBINING THE SUBS NOW!
                    //3.5. Add Undo for second subtitle (deleted) - it's important to first add the uaDeleteLine undo (for proper error refresh)!
                    Data := frmMain.lstSubtitles.GetNodeData(Node.NextSibling);
                    New(UndoAction);
                    UndoAction^.BufferSize                        := SizeOf(TLineChange);
                    UndoAction^.Buffer                            := AllocMem(UndoAction^.BufferSize);
                    UndoAction^.UndoActionType                    := uaDeleteLine;
                    UndoAction^.UndoActionName                    := uanAutoCombineSubs; //added by adenry
                    UndoAction^.BindToNext                        := True;
                    UndoAction^.LineNumber                        := Node.NextSibling.Index;
                    PLineChange(UndoAction^.Buffer)^.SubtitleItem := Data^;
                    AddUndo(UndoAction);
                    //3.6. Add Undo for first subtitle (full change)
                    Data := frmMain.lstSubtitles.GetNodeData(Node);
                    New(UndoAction);
                    UndoAction^.UndoActionType := uaFullSubChange;
                    UndoAction^.UndoActionName := uanAutoCombineSubs; //added by adenry
                    UndoAction^.BufferSize     := SizeOf(TLineChange);
                    UndoAction^.Buffer         := AllocMem(UndoAction^.BufferSize);
                    UndoAction^.Node           := Node;
                    UndoAction^.LineNumber     := Node.Index;
                    UndoAction^.BindToNext     := True;
                    PLineChange(UndoAction^.Buffer).SubtitleItem := Data^;
                    AddUndo(UndoAction);
                    //3.7. COMBINE SUBTITLES
                    //3.7.1. SET TEXT
                    NewText := ReplaceString(GetSubText(Node), #13#10, ' ') + #13#10
                             + ReplaceString(GetSubText(Node.NextSibling), #13#10, ' ');
                    NewText := SmartWrapText(NewText, frmMain.OrgCharset, udMaxLineLength.Position);
                    NewText := RemoveUnnecessaryTags(NewText);
                    SetText(Node, NewText);
                    //3.7.2. SET TRANSLATION
                    NewText := ReplaceString(GetSubTranslation(Node), #13#10, ' ');
                    if NewText = UntranslatedSub then
                      NewText := '' else
                      NewText := NewText + #13#10;
                    if (GetSubTranslation(Node.NextSibling) <> UntranslatedSub) or (NewText = '') then
                      NewText := NewText + ReplaceString(GetSubTranslation(Node.NextSibling), #13#10, ' ');
                    NewText := SmartWrapText(NewText, frmMain.TransCharset, udMaxLineLength.Position);
                    SetTranslation(Node, NewText);
                    //3.7.3. SET TIMINGS
                    if GetFinalTime(Node.NextSibling) - GetStartTime(Node) > udMaxDuration.Position then
                      SetFinalTime(Node, GetStartTime(Node)+udMaxDuration.Position) else
                      SetFinalTime(Node, GetFinalTime(Node.NextSibling));
                    //3.7.4. DELETE SECOND NODE
                    frmMain.lstSubtitles.DeleteNode(Node.NextSibling);
                  end;
        end;

      if rdoAllSubs.Checked then
        Node := Node.NextSibling else
        Node := frmMain.lstSubtitles.GetNextSelected(Node);
    end;

    if UndoList.Count > 0 then
      PUndoAction(UndoList.Last)^.BindToNext := False;
    //frmMain.lstSubtitles.Refresh; //AutoRecheck***Errors refreshes it
    frmMain.RefreshTimes;
    frmMain.AutoRecheckAllErrors;
  finally
    Screen.Cursor := crDefault;
  end;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmCombineSubtitles.FormCreate(Sender: TObject);
var
  Ini: TIniFile;
begin
  SetLanguage;
  Ini := TIniFile.Create(IniRoot);
  try
    udMinDuration.Position      := Ini.ReadInteger('Combine subtitles', 'Min duration', 1000);
    udMaxCPS.Position           := Ini.ReadInteger('Combine subtitles', 'Max CPS', 20);
    udMaxPause.Position         := Ini.ReadInteger('Combine subtitles', 'Max pause', 2000);
    chkPunctuationMarks.Checked := Ini.ReadBool('Combine subtitles', 'Punctuation detection', True);
    udMaxDuration.Position      := Ini.ReadInteger('Combine subtitles', 'Max duration', 7000);
    udDecreaseDur.Position      := Ini.ReadInteger('Combine subtitles', 'Decrease duration', 1000);
    udMaxLineLength.Position    := Ini.ReadInteger('Combine subtitles', 'Max length', 45);
    rdoAllSubs.Checked          := Ini.ReadBool('Combine subtitles', 'All subtitles', True);
  finally
    Ini.Free;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmCombineSubtitles.FormDestroy(Sender: TObject);
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(IniRoot);
  try
    Ini.WriteInteger('Combine subtitles', 'Min duration', udMinDuration.Position);
    Ini.WriteInteger('Combine subtitles', 'Max CPS', udMaxCPS.Position);
    Ini.WriteInteger('Combine subtitles', 'Max pause', udMaxPause.Position);
    Ini.WriteBool('Combine subtitles', 'Punctuation detection', chkPunctuationMarks.Checked);
    Ini.WriteInteger('Combine subtitles', 'Max duration', udMaxDuration.Position);
    Ini.WriteInteger('Combine subtitles', 'Decrease duration', udDecreaseDur.Position);
    Ini.WriteInteger('Combine subtitles', 'Max length', udMaxLineLength.Position);
    Ini.WriteBool('Combine subtitles', 'All subtitles', rdoAllSubs.Checked);
  finally
    Ini.Free;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmCombineSubtitles.SetLanguage;
var
  LF: TIniFile;
begin
  LF := TIniFile.Create(frmMain.ActualLangFile);
  try
    With LF do
    begin
      Caption                                 := ReadString('Auto combine subtitles', '01', 'Auto combine subtitles');
      lblMilliseconds1.Caption                := ReadString('Auto combine subtitles', '02', 'milliseconds');
      lblMilliseconds2.Caption := lblMilliseconds1.Caption;
      lblMilliseconds3.Caption := lblMilliseconds1.Caption;
      lblMilliseconds4.Caption := lblMilliseconds1.Caption;
      edtMinDuration.EditLabel.Caption        := ReadString('Auto combine subtitles', '03', 'Combine if duration is less than (0 = no limit):');
      edtMaxCPS.EditLabel.Caption             := ReadString('Auto combine subtitles', '04', 'Combine if CPS is greater than (0 = no limit):');
      lblCPS.Caption                          := ReadString('Auto combine subtitles', '05', 'characters per second');
      edtMaxPause.EditLabel.Caption           := ReadString('Auto combine subtitles', '06', 'Don''t combine if pause is greater than (0 = no limit):');
      chkPunctuationMarks.Caption             := ReadString('Auto combine subtitles', '07', 'Punctuation marks detection');
      edtMaxDuration.EditLabel.Caption        := ReadString('Auto combine subtitles', '08', 'Combined subtitles maximum duration (0 = no limit):');
      edtDecreaseDur.EditLabel.Caption        := ReadString('Auto combine subtitles', '09', 'Decrease duration if necessary, with no more than:');
      edtMaxLineLength.EditLabel.Caption      := ReadString('Auto combine subtitles', '10', 'Combined subtitles maximum lines length (0 = no limit):');
      lblCharacters.Caption                   := ReadString('Auto combine subtitles', '11', 'characters');
      rdoAllSubs.Caption                      := ReadString('Auto combine subtitles', '12', 'For all the subtitles');
      rdoSelSubs.Caption                      := ReadString('Auto combine subtitles', '13', 'For the selected subtitles');
      btnApply.Caption                        := BTN_APPLY;
      btnCancel.Caption                       := BTN_CANCEL;
      
      // ------------------ //
      //      Set font      //
      // ------------------ //
      lblMilliseconds1.ParentFont             := True;
      lblMilliseconds2.ParentFont             := True;
      lblMilliseconds3.ParentFont             := True;
      lblMilliseconds4.ParentFont             := True;
      edtMinDuration.EditLabel.ParentFont     := True;
      edtMaxCPS.EditLabel.ParentFont          := True;
      lblCPS.ParentFont                       := True;
      edtMaxPause.EditLabel.ParentFont        := True;
      chkPunctuationMarks.ParentFont          := True;
      edtMaxDuration.EditLabel.ParentFont     := True;
      edtDecreaseDur.EditLabel.ParentFont     := True;
      edtMaxLineLength.EditLabel.ParentFont   := True;
      lblCharacters.ParentFont                := True;
      rdoAllSubs.ParentFont                   := True;
      rdoSelSubs.ParentFont                   := True;
      btnApply.ParentFont                     := True;
      btnCancel.ParentFont                    := True;
      Font                                    := frmMain.Font;
      btnApply.Font.Style                     := frmMain.Font.Style + [fsBold];
    end;
  finally
    LF.Free;
  end;
end;

// -----------------------------------------------------------------------------

end.
