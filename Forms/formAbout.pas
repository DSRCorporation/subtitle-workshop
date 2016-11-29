// This file is part of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle Workshop's copyright information
// File Description: About form

unit formAbout;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, ComCtrls, Menus, ExtCtrls, IniFiles, ShellAPI;

type
  TfrmAbout = class(TForm)
    pgeCtrl: TPageControl;
    pgeInformation: TTabSheet;
    pgeCredits: TTabSheet;
    pnlBase: TPanel;
    pnlCredits: TPanel;
    lblProg: TLabel;
    lblProgrammedBy: TLabel;
    lblCreatedBy: TLabel;
    lblVer: TLabel;
    lblTranslators: TLabel;
    Timer: TTimer;
    btnOk: TButton;
    lblDeKSoft1: TLabel;
    lblSubtitleAPIBy: TLabel;
    lblAML1: TLabel;
    lblDirectShowProg: TLabel;
    lblAML2: TLabel;
    lblDeKSoft2: TLabel;
    lblVersion: TLabel;
    lblSubtitleAPIVer: TLabel;
    lblCopyright2: TLabel;
    lblWeb2: TLabel;
    lblEMail: TLabel;
    Bevel1: TBevel;
    pnlBelowTranslators: TPanel;
    lblBetaTesters: TLabel;
    lblBetaTester1: TLabel;
    lblBetaTester2: TLabel;
    lblBetaTester3: TLabel;
    lblBetaTester4: TLabel;
    imgIcon: TImage;
    lblAdditionalProgramming: TLabel;
    lblRoma1: TLabel;
    lblTranslatorsList: TLabel;
    lblBedazzle1: TLabel;
    lblDonation: TLabel;
    lblDefaultIconBy: TLabel;
    lblKornKid: TLabel;
    lblCopyright3: TLabel;
    Label2: TLabel;
    lblMTFBWY: TLabel;
    lblCopyright4: TLabel;
    pgeLicense: TTabSheet;
    reLicense: TRichEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    btnSupportedFormats: TButton;
    procedure TimerTimer(Sender: TObject);
    procedure pgeCtrlChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lblMouseEnter(Sender: TObject);
    procedure lblWebClick(Sender: TObject);
    procedure lblMouseLeave(Sender: TObject);
    procedure lblEMailClick(Sender: TObject);
    procedure lblDonationClick(Sender: TObject);
    function VersionNumber: String;
    procedure pnlCreditsMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer); //added by adenry
    procedure pnlCreditsMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnSupportedFormatsClick(Sender: TObject); //added by adenry
  private
    procedure SetLanguage;
    procedure GetTranslators;
  public
    { Public declarations }
  end;

var
  frmAbout: TfrmAbout;

implementation

uses
  General,
  formMain, formSubtitleAPIFormats;

{$R *.dfm}

// -----------------------------------------------------------------------------

procedure TfrmAbout.SetLanguage;
var
  LF: TIniFile;
  APIVersion: String;
begin
  APIVersion := IntToHex(SubtitleAPI.ModuleVersion, 3);
  Insert('.', APIVersion, Length(APIVersion)-1);

  LF := TIniFile.Create(frmMain.ActualLangFile);
  try
    With LF do
    begin
      Caption                     := Format(ReadString('About form', '01', 'About %s'), [ID_PROGRAM]);
      pgeInformation.Caption      := ReadString('About form', '02', 'Information');
      pgeCredits.Caption          := ReadString('About form', '03', 'Credits');
      pgeLicense.Caption          := ReadString('About form', '16', 'License');
      lblVersion.Caption          := Format(ReadString('About form', '04', 'Version: %s'), [ID_FULLVERSION]);
      lblSubtitleAPIVer.Caption   := Format(ReadString('About form', '05', '%s version: %s'), ['Subtitle API', APIVersion]);
      btnSupportedFormats.Caption := Format(ReadString('About form', '06', '%d different supported formats'), [SubtitleAPI.FormatsCount]);
      lblDonation.Caption         := ReadString('About form', '07', 'If you like this software, we would really appreciate you could make a donation. Click here to do it.');
      //lblCredits.Caption          := pgeCredits.Caption; //removed by adenry
      lblProgrammedBy.Caption     := ReadString('About form', '08', 'Programmed by');
      lblAdditionalProgramming.Caption := ReadString('About form', '09', 'Additional programming');
      lblSubtitleAPIBy.Caption    := Format(ReadString('About form', '10', '%s by'), ['Subtitle API']);
      lblDirectShowProg.Caption   := Format(ReadString('About form', '11', '%s programming'), ['DirectShow']);
      lblTranslators.Caption      := ReadString('About form', '12', 'Translators');
      lblBetaTesters.Caption      := ReadString('About form', '13', 'Testers');
      lblDefaultIconBy.Caption    := ReadString('About form', '14', 'Default icon by');
      //lblForUpdVisit.Caption      := ReadString('About form', '15', 'For updates visit:'); //removed by adenry
      btnOk.Caption := BTN_OK;                     
      
      // ------------------ //
      //      Set font      //
      // ------------------ //
      btnOK.ParentFont                    := True;
      lblVersion.ParentFont               := True;
      lblDonation.ParentFont              := True;
      lblVer.ParentFont                   := True;
      lblSubtitleAPIVer.ParentFont        := True;
      btnSupportedFormats.ParentFont      := True;
      //lblCredits.ParentFont               := True; //removed by adenry
      lblProgrammedBy.ParentFont          := True;
      lblAdditionalProgramming.ParentFont := True;
      lblSubtitleAPIBy.ParentFont         := True;
      lblDirectShowProg.ParentFont        := True;
      lblTranslators.ParentFont           := True;
      lblBetaTesters.ParentFont           := True;
      lblDefaultIconBy.ParentFont         := True;
      //lblForUpdVisit.ParentFont           := True; //removed by adenry
      Font                                := frmMain.Font;
      btnOk.Font.Style                    := frmMain.Font.Style + [fsBold];
      lblVersion.Font.Style               := frmMain.Font.Style + [fsBold];
      lblVersion.Font.Size                := 10; //added by adenry
      lblDonation.Font.Style              := frmMain.Font.Style + [fsBold];
      lblSubtitleAPIVer.Font.Style        := frmMain.Font.Style + [fsBold];
      lblVer.Font.Style                   := frmMain.Font.Style + [fsBold];
      lblVer.Font.Size                    := frmMain.Font.Size + 2;
      //lblCredits.Font.Style               := frmMain.Font.Style + [fsBold]; //removed by adenry
      lblProgrammedBy.Font.Style          := frmMain.Font.Style + [fsBold];
      lblAdditionalProgramming.Font.Style := frmMain.Font.Style + [fsBold];
      lblSubtitleAPIBy.Font.Style         := frmMain.Font.Style + [fsBold];
      lblDirectShowProg.Font.Style        := frmMain.Font.Style + [fsBold];
      lblTranslators.Font.Style           := frmMain.Font.Style + [fsBold];
      lblBetaTesters.Font.Style           := frmMain.Font.Style + [fsBold];
      lblDefaultIconBy.Font.Style         := frmMain.Font.Style + [fsBold];
      //lblForUpdVisit.Font.Style           := frmMain.Font.Style + [fsBold]; //removed by adenry

    end;
  finally
    LF.Free;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmAbout.GetTranslators;
var
  Busca      : TSearchRec;
  i          : Integer;
  Trans      : String;
  Ini        : TIniFile;
  tmpList    : TStringList;
  MDC        : hDC;
  CurMetrics : TTextMetric;
  Curfont    : HFont;
begin
  tmpList := TStringList.Create;
  try
    i := FindFirst(ExtractFilePath(Application.ExeName)+'Langs\*.lng', faAnyFile,Busca);
    while i = 0 do
    begin
      Trans := Copy(Busca.Name, 1, Length(busca.Name)-4) + ': ';
      Ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Langs\' + Busca.Name);
        Trans := Trans + Ini.ReadString('General', 'Translator', ID_PROGRAM);
      Ini.Free;
      tmpList.Add(Trans);
      i := FindNext(Busca);
    end;
    FindClose(Busca);
    tmpList.Sort;
    lblTranslatorsList.Caption := '';
    for i := 0 to tmpList.Count-1 do
      if i <> tmpList.Count-1 then
        lblTranslatorsList.Caption := lblTranslatorsList.Caption + tmpList[i] + #13#10 else
        lblTranslatorsList.Caption := lblTranslatorsList.Caption + tmpList[i];

    // Get text height
    MDC := GetDC(0);
    CurFont := SelectObject(MDC, lblTranslatorsList.Font.Handle);
    GetTextMetrics(MDC, CurMetrics);
    SelectObject(MDC, CurFont);
    ReleaseDC(0, MDC);

    // Set top appropiately depending on the number of translators (lines count)
    lblTranslatorsList.Height := CurMetrics.tmHeight * tmpList.Count{-1};
    if lblTranslatorsList.Caption <> '' then
      pnlBelowTranslators.Top := lblTranslatorsList.Top + lblTranslatorsList.Height + 16 else
      pnlBelowTranslators.Top := lblTranslatorsList.Top; // If there are no translators...
    pnlCredits.Height := pnlBelowTranslators.Top + pnlBelowTranslators.Height;
  finally
    tmpList.Free;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmAbout.TimerTimer(Sender: TObject);
begin
  pnlCredits.Top := pnlCredits.Top - 1;
  if pnlCredits.Top + PnlCredits.Height <= 0 then
    pnlCredits.Top := pnlBase.Height;
end;

// -----------------------------------------------------------------------------

procedure TfrmAbout.pgeCtrlChange(Sender: TObject);
begin
  if pgeCtrl.ActivePageIndex = 0 then
    Timer.Enabled := False else
    Timer.Enabled := True;
end;

// -----------------------------------------------------------------------------

procedure TfrmAbout.FormCreate(Sender: TObject);
begin
  // Set caption of label
  lblProg.Caption       := ID_PROGRAM;
  lblVer.Caption        := ID_FULLVERSION;
  lblEMail.Caption      := Format('E-Mail: %s', [ID_EMAIL]);
  //lblWeb.Caption        := ID_WEBPAGE; //removed by adenry
  lblWeb2.Caption       := ID_WEBPAGE;
  //lblCopyright.Caption  := 'Copyright © 2001-2004 ' + 'URUSoft'; //removed by adenry
  //lblCopyright2.Caption := lblCopyright.Caption; //removed by adenry
  SetLanguage;

  pgeCtrl.ActivePageIndex   := 0;
  pnlCredits.Top            := pnlBase.Height + 1;
  GetTranslators;
end;

// -----------------------------------------------------------------------------

procedure TfrmAbout.lblMouseEnter(Sender: TObject);
begin
  (Sender as TLabel).Font.Color := clBlue;
  (Sender as TLabel).Font.Style := (Sender as TLabel).Font.Style + [fsUnderline];
end;

// -----------------------------------------------------------------------------

procedure TfrmAbout.lblMouseLeave(Sender: TObject);
begin
  (Sender as TLabel).Font.Color := clWindowText;
  (Sender as TLabel).Font.Style := (Sender as TLabel).Font.Style - [fsUnderline];
end;

// -----------------------------------------------------------------------------

procedure TfrmAbout.lblWebClick(Sender: TObject);
begin
  ShellExecute(0, 'open', PChar(ID_WEBPAGE), nil, nil, SW_SHOW);
end;

// -----------------------------------------------------------------------------

procedure TfrmAbout.lblEMailClick(Sender: TObject);
begin
  ShellExecute(0, 'open', PChar('mailto:' + ID_EMAIL), nil, nil, SW_SHOW);
end;

// -----------------------------------------------------------------------------

procedure TfrmAbout.lblDonationClick(Sender: TObject);
begin
  ShellExecute(0, 'open', PChar(ID_DONATIONPAGE), nil, nil, SW_SHOW);
end;

// -----------------------------------------------------------------------------

//added by adenry: begin
function TfrmAbout.VersionNumber: String;
var
  y,m,d:Word;
  ver: String;
begin
  DecodeDate(Date, y, m, d);
  ver := IntToStr(y mod 2000);
  if m < 10 then
    ver := ver + '0';
  ver := ver + IntToStr(m);
  if d < 10 then
    ver := ver + '0';
  ver := ver + IntToStr(d);
  Result := ver;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmAbout.pnlCreditsMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Timer.Enabled := False;
end;

procedure TfrmAbout.pnlCreditsMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Timer.Enabled := True;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmAbout.btnSupportedFormatsClick(Sender: TObject);
begin
  btnOk.SetFocus;
  frmSubtitleAPIFormats := TfrmSubtitleAPIFormats.Create(Application);
  try
    frmSubtitleAPIFormats.ShowModal;
  finally
    frmSubtitleAPIFormats.Free;
  end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

end.
