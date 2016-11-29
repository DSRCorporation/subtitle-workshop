// This file is part of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle Workshop's copyright information
// File Description: Set Pauses form

unit formSetPauses; //added by adenry

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, Mask, IniFiles,
  TimeMaskEdit;

type
  TfrmSetPauses = class(TForm)
    btnCancel: TButton;
    btnApply: TButton;
    lblPausesValue: TLabel;
    rdoFirstSub: TRadioButton;
    lblShortenDurationOf: TLabel;
    rdoSecondSub: TRadioButton;
    rdoBothSubs: TRadioButton;
    rdoSubWithLessCPS: TRadioButton;
    tmePauseValue: TTimeMaskEdit;
    bvlPauses: TBevel;
    rdoSelSubs: TRadioButton;
    rdoAllSubs: TRadioButton;
    pnlPauses: TPanel;
    procedure btnApplyClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SetLanguage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSetPauses: TfrmSetPauses;

implementation

uses
  General, Functions, TreeViewHandle,
  formMain;

{$R *.dfm}

// -----------------------------------------------------------------------------

procedure TfrmSetPauses.btnApplyClick(Sender: TObject);
var
  method: Byte;
begin
  if rdoFirstSub.Checked then
    method := 1 else
  if rdoSecondSub.Checked then
    method := 2 else
  if rdoBothSubs.Checked then
    method := 3 else
    method := 4;
  SetPauses(tmePauseValue.Time, method, rdoSelSubs.Checked);
  frmMain.RefreshTimes;
  //Close;
end;

// -----------------------------------------------------------------------------

procedure TfrmSetPauses.FormDestroy(Sender: TObject);
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(IniRoot);
  try
    Ini.WriteInteger('Set Pauses', 'Value', tmePauseValue.Time);
    if rdoAllSubs.Checked then
      Ini.WriteBool('Set Pauses', 'All subtitles', True) else
      Ini.WriteBool('Set Pauses', 'All subtitles', False);
    if rdoFirstSub.Checked then
      Ini.WriteInteger('Set Pauses', 'Method', 1) else
    if rdoSecondSub.Checked then
      Ini.WriteInteger('Set Pauses', 'Method', 2) else
    if rdoBothSubs.Checked then
      Ini.WriteInteger('Set Pauses', 'Method', 3) else
      Ini.WriteInteger('Set Pauses', 'Method', 4);
  finally
    Ini.Free;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmSetPauses.FormCreate(Sender: TObject);
var
  Ini: TIniFile;
begin
  SetLanguage;
  tmePauseValue.FPS := GetFPS;
  if frmMain.FormatType = ftTime then
    tmePauseValue.TimeMode := tmTime else
  begin
    tmePauseValue.TimeMode  := tmFrames;
    tmePauseValue.MaxLength := 7;
  end;
  Ini := TIniFile.Create(IniRoot);
  try
    tmePauseValue.Time := Ini.ReadInteger('Set Pauses', 'Value', 200);
    rdoAllSubs.Checked := Ini.ReadBool('Set Pauses', 'All subtitles', True);
    rdoSelSubs.Checked := not rdoAllSubs.Checked;
    case Ini.ReadInteger('Set Pauses', 'Method', 4) of
      1: rdoFirstSub.Checked := True;
      2: rdoSecondSub.Checked := True;
      3: rdoBothSubs.Checked := True;
      else rdoSubWithLessCPS.Checked := True;
    end;
  finally
    Ini.Free;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmSetPauses.SetLanguage;
var
  LF: TIniFile;
begin
  LF := TIniFile.Create(frmMain.ActualLangFile);
  try
    With LF do
    begin
      Caption                       := ReadString('Set pauses', '01', 'Set pauses');
      lblPausesValue.Caption        := ReadString('Set pauses', '02', 'Pauses value:');
      lblShortenDurationOf.Caption  := ReadString('Set pauses', '03', 'Shorten duration of:');
      rdoFirstSub.Caption           := ReadString('Set pauses', '04', 'First subtitle only');
      rdoSecondSub.Caption          := ReadString('Set pauses', '05', 'Second subtitle only');
      rdoBothSubs.Caption           := ReadString('Set pauses', '06', 'Both subtitles equally');
      rdoSubWithLessCPS.Caption     := ReadString('Set pauses', '07', 'The subtitle with less CPS');
      rdoAllSubs.Caption            := ReadString('Set pauses', '08', 'For all the subtitles');
      rdoSelSubs.Caption            := ReadString('Set pauses', '09', 'For the selected subtitles');
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
