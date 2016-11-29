// This file is part of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle Workshop's copyright information
// File Description: Round Time Values form

unit formRoundTimeValues; //added by adenry

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, ComCtrls, ExtCtrls, IniFiles;

type
  TfrmRoundTimeValues = class(TForm)
    pnlWhere: TPanel;
    rdoSelectedSubs: TRadioButton;
    rdoAllSubs: TRadioButton;
    btnApply: TButton;
    btnCancel: TButton;
    pnlRoundFactor: TPanel;
    edtRoundingFactor: TLabeledEdit;
    udRoundingFactor: TUpDown;
    lblMilliseconds: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SetLanguage;
    procedure btnApplyClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRoundTimeValues: TfrmRoundTimeValues;

implementation

uses
  General, Undo, //TreeViewHandle,
  formMain;

{$R *.dfm}

// -----------------------------------------------------------------------------

procedure TfrmRoundTimeValues.FormCreate(Sender: TObject);
var
  Ini: TIniFile;
begin
  SetLanguage;
  Ini := TIniFile.Create(IniRoot);
  try
    udRoundingFactor.Position := Ini.ReadInteger('Round Time Values', 'Rounding factor', 100);
    rdoSelectedSubs.Checked   := not Ini.ReadBool('Round Time Values', 'All subtitles', True);
  finally
    Ini.Free;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmRoundTimeValues.FormDestroy(Sender: TObject);
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(IniRoot);
  try
    Ini.WriteInteger('Round Time Values', 'Rounding factor', udRoundingFactor.Position);
    Ini.WriteBool('Round Time Values', 'All subtitles', rdoAllSubs.Checked);
  finally
    Ini.Free;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmRoundTimeValues.SetLanguage;
var
  LF: TIniFile;
begin
  LF := TIniFile.Create(frmMain.ActualLangFile);
  try
    With LF do
    begin
      Caption                             := ReadString('Round time values', '01', 'Round time values');
      edtRoundingFactor.EditLabel.Caption := ReadString('Round time values', '02', 'Round to:');
      lblMilliseconds.Caption             := ReadString('Round time values', '03', 'milliseconds');
      rdoAllSubs.Caption                  := ReadString('Round time values', '04', 'All subtitles');
      rdoSelectedSubs.Caption             := ReadString('Round time values', '05', 'Selected subtitles only');
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

procedure TfrmRoundTimeValues.btnApplyClick(Sender: TObject);
begin
  RoundSubtitlesValues(udRoundingFactor.Position, rdoSelectedSubs.Checked);
end;

// -----------------------------------------------------------------------------

end.
