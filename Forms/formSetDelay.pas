// This file is part of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle Workshop's copyright information
// File Description: Set Delay form

unit formSetDelay;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, Mask, IniFiles,
  TimeMaskEdit;

type
  TfrmSetDelay = class(TForm)
    btnApply: TButton;
    cmbDelayType: TComboBox;
    rdoAllSubs: TRadioButton;
    rdoSelSubs: TRadioButton;
    bvlDelay: TBevel;
    btnCancel: TButton;
    tmeDelay: TTimeMaskEdit;
    rdoFromFirstSelected: TRadioButton;
    pnlDelayType: TPanel;
    rdoDelayPlus: TRadioButton;
    rdoDelayMinus: TRadioButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure edtDelayKeyPress(Sender: TObject; var Key: Char);
    procedure tmeDelayMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure tmeDelayMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure tmeDelayKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    procedure SetLanguage;
  public
    { Public declarations }
  end;

var
  frmSetDelay: TfrmSetDelay;

implementation

uses
  General, Functions, TreeViewHandle, //USubtitlesFunctions, //USubtitlesFunctions removed by adenry
  formMain;

{$R *.dfm}

// -----------------------------------------------------------------------------

procedure TfrmSetDelay.SetLanguage;
var
  LF: TIniFile;
begin
  LF := TIniFile.Create(frmMain.ActualLangFile);
  try
    With LF do
    begin
      Caption                       := ReadString('Set delay', '01', 'Set delay');
      rdoAllSubs.Caption            := ReadString('Set delay', '02', 'For all the subtitles');
      rdoSelSubs.Caption            := ReadString('Set delay', '03', 'For selected subtitles');
      rdoFromFirstSelected.Caption  := ReadString('Set delay', '04', 'From first selected until last subtitle');
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

procedure TfrmSetDelay.FormCreate(Sender: TObject);
var
  Ini: TIniFile;
begin
  SetLanguage;
  tmeDelay.FPS := GetFPS;
  if frmMain.FormatType = ftTime then
    tmeDelay.TimeMode := tmTime else
  begin
    tmeDelay.TimeMode  := tmFrames;
    tmeDelay.MaxLength := 7;
  end;
  Ini := TIniFile.Create(IniRoot);
  try
    cmbDelayType.ItemIndex := Ini.ReadInteger('Delay', 'Type', 0);
    if (cmbDelayType.ItemIndex = 0) then
      rdoDelayPlus.Checked := True else
      rdoDelayMinus.Checked := True;
    //removed by adenry: begin
    {rdoAllSubs.Checked := Ini.ReadBool('Delay', 'All subtitles', True);
    rdoSelSubs.Checked := not Ini.ReadBool('Delay', 'All subtitles', True);}
    //removed by adenry: end

    //added by adenry: begin
    if Ini.ReadInteger('Delay', 'All subtitles', 0) = 0 then
      rdoAllSubs.Checked:=True
    else if Ini.ReadInteger('Delay', 'All subtitles', 0) = 1 then
      rdoSelSubs.Checked:=True
    else rdoFromFirstSelected.Checked:=True;
    //added by adenry: end
  finally
    Ini.Free;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmSetDelay.FormDestroy(Sender: TObject);
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(IniRoot);
  try
    Ini.WriteInteger('Delay', 'Type', cmbDelayType.ItemIndex);
    //Ini.WriteBool('Delay','All subtitles',rdoAllSubs.Checked); //removed by adenry
    //added by adenry: begin
    if rdoAllSubs.Checked then
      Ini.WriteInteger('Delay','All subtitles',0)
    else if rdoSelSubs.Checked then
      Ini.WriteInteger('Delay','All subtitles',1)
    else Ini.WriteInteger('Delay','All subtitles',2);
    //added by adenry: end
  finally
    Ini.Free;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmSetDelay.btnApplyClick(Sender: TObject);
var
  DelayTime: Integer;
begin
  DelayTime := tmeDelay.Time;
  //added by adenry: begin
  if rdoDelayPlus.Checked then
    cmbDelayType.ItemIndex := 0 else
    cmbDelayType.ItemIndex := 1;
  //added by adenry: end
  if cmbDelayType.ItemIndex = 1 then
    DelayTime := -DelayTime;

  SetDelay(DelayTime, rdoSelSubs.Checked, rdoFromFirstSelected.Checked); //, rdoFromFirstSelected.Checked added by adenry

  frmMain.RefreshTimes;
  Close;
end;

// -----------------------------------------------------------------------------

procedure TfrmSetDelay.edtDelayKeyPress(Sender: TObject; var Key: Char);
begin
  if frmMain.FormatType = ftFrames then
  begin
    if not (Key in['0'..'9', Chr(VK_RETURN), Chr(VK_BACK), Chr(VK_ESCAPE)]) then
      Key := #0;
  end;
end;

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmSetDelay.tmeDelayMouseWheelUp(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
var
  step: Cardinal;
begin
    if frmMain.FormatType = ftTime then
      step := tmeDelay.TimeStep else
      step := Round((1000 * tmeDelay.FramesStep)/GetFPS);

    if ssAlt in Shift then
      step := Round(step / 2);
    if ssCtrl in Shift then
      step := step * 10;

    if (tmeDelay.Time + step > MAX_TIME) then
      tmeDelay.Time := MAX_TIME else
      tmeDelay.Time := tmeDelay.Time + step;

    tmeDelay.SelStart := 7;
    tmeDelay.SelLength := 0;

    Handled := True;
end;

procedure TfrmSetDelay.tmeDelayMouseWheelDown(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
var
  step: Cardinal;
begin
    if frmMain.FormatType = ftTime then
      step := tmeDelay.TimeStep else
      step := Round((1000 * tmeDelay.FramesStep)/GetFPS);

    if ssAlt in Shift then
      step := Round(step / 2);
    if ssCtrl in Shift then
      step := step * 10;

    if (tmeDelay.Time < step) then
      tmeDelay.Time := 0 else
      tmeDelay.Time := tmeDelay.Time - step;

    tmeDelay.SelStart := 7;
    tmeDelay.SelLength := 0;

    Handled := True;
end;

procedure TfrmSetDelay.tmeDelayKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    {+} 107 : rdoDelayPlus.Checked := True;
    {-} 109 : rdoDelayMinus.Checked := True;
  end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

end.
