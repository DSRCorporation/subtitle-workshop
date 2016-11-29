// This file is part of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle Workshop's copyright information
// File Description: Unbreak Subtitles form

unit formUnbreakSubtitles; //added by adenry

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, ComCtrls, ExtCtrls, IniFiles,
  VirtualTrees,
  CommonTypes;

type
  TfrmUnbreakSubtitles = class(TForm)
    gbCharactersLimit: TGroupBox;
    btnApply: TButton;
    btnCancel: TButton;
    pnlUnbreakSubtitles: TPanel;
    rdoAllSubs: TRadioButton;
    rdoSelSubs: TRadioButton;
    chkDashCheck: TCheckBox;
    rdoNoLimit: TRadioButton;
    rdoLimit: TRadioButton;
    edtCharacters: TEdit;
    udCharacters: TUpDown;
    lblCharacters: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure SetLanguage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUnbreakSubtitles: TfrmUnbreakSubtitles;

implementation

uses
  General, Functions, InfoErrorsFunctions, Undo, TreeViewHandle, USubtitlesFunctions,
  formMain;

{$R *.dfm}

// -----------------------------------------------------------------------------

procedure TfrmUnbreakSubtitles.FormCreate(Sender: TObject);
var
  Ini: TIniFile;
begin
  SetLanguage;
  Ini := TIniFile.Create(IniRoot);
  try
    rdoLimit.Checked      := Ini.ReadBool('Unbreak subtitles', 'Limit', True);
    rdoNoLimit.Checked    := not rdoLimit.Checked;
    udCharacters.Position := Ini.ReadInteger('Unbreak subtitles', 'Characters', 45);
    chkDashCheck.Checked  := Ini.ReadBool('Unbreak subtitles', 'Dash check', True);
    rdoAllSubs.Checked    := Ini.ReadBool('Unbreak subtitles', 'All subtitles', True);
    rdoSelSubs.Checked    := not rdoAllSubs.Checked;
  finally
    Ini.Free;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmUnbreakSubtitles.FormDestroy(Sender: TObject);
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(IniRoot);
  try
    Ini.WriteBool('Unbreak subtitles', 'Limit', rdoLimit.Checked);
    Ini.WriteInteger('Unbreak subtitles', 'Characters', udCharacters.Position);
    Ini.WriteBool('Unbreak subtitles', 'Dash check', chkDashCheck.Checked);
    Ini.WriteBool('Unbreak subtitles', 'All subtitles', rdoAllSubs.Checked);
  finally
    Ini.Free;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmUnbreakSubtitles.btnApplyClick(Sender: TObject);
var
  Node, NextNode  : PVirtualNode;
  UndoAction      : PUndoAction;
begin
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

      if Pos(#13#10, GetSubText(Node)) > 0 then
        if not (chkDashCheck.Checked) or not(HasDashOnSecondLine(GetSubText(Node), OrgCharset)) then
          if rdoNoLimit.Checked or (Length(RemoveSWTags(ReplaceEnters(GetSubText(Node), ' '), True, True, True, True))<=udCharacters.Position) then
          begin
            New(UndoAction);
            UndoAction^.UndoActionType := uaFullTextChange;
            UndoAction^.UndoActionName := uanUnbreakSubs; //added by adenry
            UndoAction^.BufferSize     := SizeOf(TFullTextChange);
            UndoAction^.Buffer         := AllocMem(UndoAction^.BufferSize);
            UndoAction^.Node           := Node;
            UndoAction^.LineNumber     := Node.Index;
            PFullTextChange(UndoAction^.Buffer)^.OriginalOnly := not mnuTranslatorMode.Checked; //the NOT was added by adenry - bug fix
            PFullTextChange(UndoAction^.Buffer)^.OldText := GetSubText(Node);

            SetText(Node, ReplaceEnters(GetSubText(Node), ' '));
            if mnuTranslatorMode.Checked then
            begin
              PFullTextChange(UndoAction^.Buffer)^.OldTrans := GetSubTranslation(Node);
              SetTranslation(Node, ReplaceEnters(GetSubTranslation(Node), ' '));
            end;

            AutoRecheckNodeErrors(Node, TextErrors);
            UndoAction^.BindToNext := True;//Assigned(NextNode); //modified by adenry later
            AddUndo(UndoAction);
          end;

      Node := NextNode;
    end;

    if UndoList.Count > 0 then //added by adenry later
      PUndoAction(UndoList.Last)^.BindToNext := False; //added by adenry later
    lstSubtitles.Refresh;
    RefreshTimes;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmUnbreakSubtitles.SetLanguage;
var
  LF: TIniFile;
begin
  LF := TIniFile.Create(frmMain.ActualLangFile);
  try
    With LF do
    begin
      Caption                       := ReadString('Unbreak subtitles', '01', 'Unbreak subtitles');
      gbCharactersLimit.Caption     := ReadString('Unbreak subtitles', '02', 'Characters limit');
      rdoNoLimit.Caption            := ReadString('Unbreak subtitles', '03', 'No limit');
      rdoLimit.Caption              := ReadString('Unbreak subtitles', '04', 'Don''t unbreak if line length exceeds:');
      lblCharacters.Caption         := ReadString('Unbreak subtitles', '05', 'characters');
      chkDashCheck.Caption          := ReadString('Unbreak subtitles', '06', 'Don''t unbreak subtitles with "—" on second line');
      rdoAllSubs.Caption            := ReadString('Unbreak subtitles', '07', 'For all the subtitles');
      rdoSelSubs.Caption            := ReadString('Unbreak subtitles', '08', 'For the selected subtitles');
      btnApply.Caption              := BTN_APPLY;
      btnCancel.Caption             := BTN_CANCEL;
      
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

end.
