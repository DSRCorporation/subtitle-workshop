// This file is part of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle Workshop's copyright information
// File Description: Composite Custom Info form

unit formCompositeCustomInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, ExtCtrls, Menus, ComCtrls, ToolWin, IniFiles;

type
  TfrmCompositeCustomInfo = class(TForm)
    pnlErrorTypes: TPanel;
    bvlBottom: TBevel;
    bvlTop: TBevel;
    chkLinesWithoutLetters: TCheckBox;
    chkOverTwoLines: TCheckBox;
    chkEmptySubtitles: TCheckBox;
    chkOverlapping: TCheckBox;
    chkBadValues: TCheckBox;
    chkTooShortPause: TCheckBox;
    chkTooLongDur: TCheckBox;
    chkTooShortDur: TCheckBox;
    chkTooLongLines: TCheckBox;
    chkHearingImpaired: TCheckBox;
    chkTextBeforeColon: TCheckBox;
    chkUnnecessaryDots: TCheckBox;
    chkProhibitedChars: TCheckBox;
    chkRepeatedChars: TCheckBox;
    chkRepeatedSubs: TCheckBox;
    chkOCRErrors: TCheckBox;
    chkOpnDlgInSubsWithOneLine: TCheckBox;
    chkDashOnFirstLine: TCheckBox;
    chkDialogueOnOneLine: TCheckBox;
    chkSpaceAfterCustomChars: TCheckBox;
    chkSpaceBeforeCustomChars: TCheckBox;
    chkUnnecessarySpaces: TCheckBox;
    chkUnnecessaryTags: TCheckBox;
    chkTooMuchCPS: TCheckBox;
    btnCheckAll: TButton;
    btnCheckNone: TButton;
    chkMarkedSubs: TCheckBox;
    btnCheckInverse: TButton;
    pnlCustomInfo: TPanel;
    Bevel1: TBevel;
    scrollboxCustomInfo: TScrollBox;
    pnlInsideScrollBox: TPanel;
    edtCaption: TLabeledEdit;
    bvlInfoErrors: TBevel;
    btnOk: TButton;
    tmrDeleteCustomInfo: TTimer;
    tbAddCustomInfo: TToolBar;
    tbtnAddCustomInfo: TToolButton;
    mnuAddCustomInfoDropdown: TPopupMenu;
    mnuSubtitlesDurationCustomInfo: TMenuItem;
    mnuSubtitlesLineLengthCustomInfo: TMenuItem;
    mnuSubtitlesLinesCountCustomInfo: TMenuItem;
    mnuSubtitlesPauseCustomInfo: TMenuItem;
    mnuSubtitlesCPSCustomInfo: TMenuItem;
    mnuSubtitlesTextCustomInfo: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure btnCheckInverseClick(Sender: TObject);
    procedure btnCheckAllClick(Sender: TObject);
    procedure btnCheckNoneClick(Sender: TObject);
    procedure CheckAll(Checked: Boolean);
    //procedure btnAddClick(Sender: TObject);
    procedure CreateNewCustomInfo(CustomInfoType: ShortInt; Checked: Boolean; Text1, Text2: String; ItemIndex: SmallInt);
    procedure tmrDeleteCustomInfoTimer(Sender: TObject);
    procedure ButtonDelClick(Sender: TObject);
    procedure FreeCustomInfoComponents(Index: String);
    procedure EditNumKeyPress(Sender: TObject; var Key: Char);
    procedure EditNumChange(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    function GetCheckedTypesAsString: String;
    procedure SetCheckedTypesFromString(CheckedTypes: String);
    procedure mnuCustomInfoClick(Sender: TObject);
    procedure tbtnAddCustomInfoClick(Sender: TObject);
    procedure SetLanguage;
    procedure SetCustomInfosLanguage;
    procedure edtCaptionKeyPress(Sender: TObject; var Key: Char); //added later
    
  private
    { Private declarations }
  public
    { Public declarations }
    pnlPanelCreator         : TPanel;
    chkCheckboxCreator      : TCheckbox;
    lblLabelGreaterCreator  : TLabel;
    edtEdit1Creator         : TEdit;
    lblLabel1Creator        : TLabel;
    cmbComboBoxCreator      : TComboBox;
    lblLabelLessCreator     : TLabel;
    edtEdit2Creator         : TEdit;
    lblLabel2Creator        : TLabel;
    //btnButtonDelCreator     : TButton;
    tbToolBarCreator        : TToolBar;
    tbtnButtonDelCreator    : TToolButton;

    CustomInfosLastNumber   : Integer;
    CustomInfosCount        : Integer;

    CustomInfoToDelete      : Integer;
  end;

{var
  frmCompositeCustomInfo: TfrmCompositeCustomInfo;}

implementation

uses
  General, InfoErrorsFunctions,
  formMain, formInfoErrors;

{$R *.dfm}

// -----------------------------------------------------------------------------

procedure TfrmCompositeCustomInfo.FormCreate(Sender: TObject);
begin
  CustomInfosLastNumber   := 0;
  CustomInfosCount        := 0;
  CustomInfoToDelete      := 0;
  edtCaption.Font.Charset := DEFAULT_CHARSET;
end;

// -----------------------------------------------------------------------------

procedure TfrmCompositeCustomInfo.btnCheckInverseClick(Sender: TObject);
begin
    chkMarkedSubs.Checked               := not chkMarkedSubs.Checked;
    chkLinesWithoutLetters.Checked      := not chkLinesWithoutLetters.Checked;
    chkEmptySubtitles.Checked           := not chkEmptySubtitles.Checked;
    chkOverlapping.Checked              := not chkOverlapping.Checked;
    chkBadValues.Checked                := not chkBadValues.Checked;
    chkTooShortPause.Checked            := not chkTooShortPause.Checked;
    chkTooLongDur.Checked               := not chkTooLongDur.Checked;
    chkTooShortDur.Checked              := not chkTooShortDur.Checked;
    chkTooLongLines.Checked             := not chkTooLongLines.Checked;
    chkOverTwoLines.Checked             := not chkOverTwoLines.Checked;
    chkHearingImpaired.Checked          := not chkHearingImpaired.Checked;
    chkTextBeforeColon.Checked          := not chkTextBeforeColon.Checked;
    chkUnnecessaryDots.Checked          := not chkUnnecessaryDots.Checked;
    chkProhibitedChars.Checked          := not chkProhibitedChars.Checked;
    chkRepeatedChars.Checked            := not chkRepeatedChars.Checked;
    chkRepeatedSubs.Checked             := not chkRepeatedSubs.Checked;
    chkOCRErrors.Checked                := not chkOCRErrors.Checked;
    chkOpnDlgInSubsWithOneLine.Checked  := not chkOpnDlgInSubsWithOneLine.Checked;
    chkDashOnFirstLine.Checked          := not chkDashOnFirstLine.Checked;
    chkDialogueOnOneLine.Checked        := not chkDialogueOnOneLine.Checked;
    chkSpaceAfterCustomChars.Checked    := not chkSpaceAfterCustomChars.Checked;
    chkSpaceBeforeCustomChars.Checked   := not chkSpaceBeforeCustomChars.Checked;
    chkUnnecessarySpaces.Checked        := not chkUnnecessarySpaces.Checked;
    chkUnnecessaryTags.Checked          := not chkUnnecessaryTags.Checked;
    chkTooMuchCPS.Checked               := not chkTooMuchCPS.Checked;
end;

// -----------------------------------------------------------------------------

procedure TfrmCompositeCustomInfo.CheckAll(Checked: Boolean);
begin
  chkMarkedSubs.Checked               := Checked;
  chkLinesWithoutLetters.Checked      := Checked;
  chkEmptySubtitles.Checked           := Checked;
  chkOverlapping.Checked              := Checked;
  chkBadValues.Checked                := Checked;
  chkTooShortPause.Checked            := Checked;
  chkTooLongDur.Checked               := Checked;
  chkTooShortDur.Checked              := Checked;
  chkTooLongLines.Checked             := Checked;
  chkOverTwoLines.Checked             := Checked;
  chkHearingImpaired.Checked          := Checked;
  chkTextBeforeColon.Checked          := Checked;
  chkUnnecessaryDots.Checked          := Checked;
  chkProhibitedChars.Checked          := Checked;
  chkRepeatedChars.Checked            := Checked;
  chkRepeatedSubs.Checked             := Checked;
  chkOCRErrors.Checked                := Checked;
  chkOpnDlgInSubsWithOneLine.Checked  := Checked;
  chkDashOnFirstLine.Checked          := Checked;
  chkDialogueOnOneLine.Checked        := Checked;
  chkSpaceAfterCustomChars.Checked    := Checked;
  chkSpaceBeforeCustomChars.Checked   := Checked;
  chkUnnecessarySpaces.Checked        := Checked;
  chkUnnecessaryTags.Checked          := Checked;
  chkTooMuchCPS.Checked               := Checked;
end;

procedure TfrmCompositeCustomInfo.btnCheckAllClick(Sender: TObject); begin CheckAll(True); end;
procedure TfrmCompositeCustomInfo.btnCheckNoneClick(Sender: TObject); begin CheckAll(False); end;

// -----------------------------------------------------------------------------

{procedure TfrmCompositeCustomInfo.btnAddClick(Sender: TObject);
var
  frmTypeSelection : TForm;
  btnModalOk, btnModalCancel : TButton;
  rdoType1, rdoType2, rdoType3, rdoType4, rdoType5, rdoType6 : TRadioButton;
  SelectedType: Byte;
begin
  //CREATE THE TYPE SELECTION FORM
  //1. the form
  frmTypeSelection              := TForm.Create(frmInfoErrors);
  frmTypeSelection.BorderStyle  := bsDialog;
  frmTypeSelection.Width        := 320;
  frmTypeSelection.Height       := 200;
  frmTypeSelection.Caption      := 'Select Custom Info Type';
  frmTypeSelection.Font.Name    := frmMain.Font.Name;
  frmTypeSelection.Font.Size    := frmMain.Font.Size;
  frmTypeSelection.Font.Style   := frmMain.Font.Style;
  frmTypeSelection.BorderIcons  := [];
  frmTypeSelection.Position     := poScreenCenter;
  //2. the radio buttons
  rdoType1                      := TRadioButton.Create(frmTypeSelection);
  rdoType1.Parent               := frmTypeSelection;
  rdoType1.Caption              := 'Subtitles duration information';
  rdoType1.Top                  := 8;
  rdoType1.Left                 := 8;
  rdoType1.Width                := frmTypeSelection.ClientWidth - 16;
  rdoType1.Checked              := True;
  rdoType2                      := TRadioButton.Create(frmTypeSelection);
  rdoType2.Parent               := frmTypeSelection;
  rdoType2.Caption              := 'Subtitles line length information';
  rdoType2.Top                  := 24;
  rdoType2.Left                 := 8;
  rdoType2.Width                := frmTypeSelection.ClientWidth - 16;
  rdoType3                      := TRadioButton.Create(frmTypeSelection);
  rdoType3.Parent               := frmTypeSelection;
  rdoType3.Caption              := 'Subtitles lines count information';
  rdoType3.Top                  := 40;
  rdoType3.Left                 := 8;
  rdoType3.Width                := frmTypeSelection.ClientWidth - 16;
  rdoType4                      := TRadioButton.Create(frmTypeSelection);
  rdoType4.Parent               := frmTypeSelection;
  rdoType4.Caption              := 'Subtitles pause information';
  rdoType4.Top                  := 56;
  rdoType4.Left                 := 8;
  rdoType4.Width                := frmTypeSelection.ClientWidth - 16;
  rdoType5                      := TRadioButton.Create(frmTypeSelection);
  rdoType5.Parent               := frmTypeSelection;
  rdoType5.Caption              := 'Subtitles CPS information';
  rdoType5.Top                  := 72;
  rdoType5.Left                 := 8;
  rdoType5.Width                := frmTypeSelection.ClientWidth - 16;
  rdoType6                      := TRadioButton.Create(frmTypeSelection);
  rdoType6.Parent               := frmTypeSelection;
  rdoType6.Caption              := 'Subtitles text information';
  rdoType6.Top                  := 88;
  rdoType6.Left                 := 8;
  rdoType6.Width                := frmTypeSelection.ClientWidth - 16;
  //3. the ok and cancel buttons
  btnModalOk                    := TButton.Create(frmTypeSelection);
  btnModalOk.Parent             := frmTypeSelection;
  btnModalOk.Caption            := '&OK';
  btnModalOk.Font.Style         := [fsBold];
  btnModalOk.Height             := 25;
  btnModalOk.Width              := 113;
  btnModalOk.Left               := 8;
  btnModalOk.Top                := frmTypeSelection.ClientHeight - 8 - btnModalOk.Height;
  btnModalOk.ModalResult        := mrOk;
  btnModalOk.Default            := True;
  btnModalCancel                := TButton.Create(frmTypeSelection);
  btnModalCancel.Parent         := frmTypeSelection;
  btnModalCancel.Caption        := '&Cancel';
  btnModalCancel.Height         := 25;
  btnModalCancel.Width          := 113;
  btnModalCancel.Left           := frmTypeSelection.ClientWidth - btnModalCancel.Width - 8;
  btnModalCancel.Top            := frmTypeSelection.ClientHeight - 8 - btnModalCancel.Height;
  btnModalCancel.ModalResult    := mrCancel;
  //show the form and get the user's choice
  frmTypeSelection.ShowModal;
  if frmTypeSelection.ModalResult = mrCancel then
  begin
    frmTypeSelection.Free;
    Exit;
  end;
  SelectedType := 1;
  if rdoType2.Checked then SelectedType := 2 else
  if rdoType3.Checked then SelectedType := 3 else
  if rdoType4.Checked then SelectedType := 4 else
  if rdoType5.Checked then SelectedType := 5 else
  if rdoType6.Checked then SelectedType := 6;
  frmTypeSelection.Free;

  CreateNewCustomInfo(SelectedType, True, '', '', 0);
end;}

// -----------------------------------------------------------------------------

procedure TfrmCompositeCustomInfo.tbtnAddCustomInfoClick(Sender: TObject);
begin
  tbtnAddCustomInfo.CheckMenuDropdown;
end;

procedure TfrmCompositeCustomInfo.mnuCustomInfoClick(Sender: TObject);
begin
  CreateNewCustomInfo(TComponent(Sender).Tag, True, '', '', 0);
end;

// -----------------------------------------------------------------------------

procedure TfrmCompositeCustomInfo.CreateNewCustomInfo(CustomInfoType: ShortInt; Checked: Boolean; Text1, Text2: String; ItemIndex: SmallInt);
begin
if CustomInfoType > 0 then
begin
  //CREATE THE NEW CUSTOM INFO
  pnlInsideScrollBox.Height         := 24 * (CustomInfosCount + 1);
  //1. the parent panel
  pnlPanelCreator                   := TPanel.Create(Self);
  pnlPanelCreator.Name              := 'pnlParent' + IntToStr(CustomInfosLastNumber + 1);
  pnlPanelCreator.Parent	          := pnlInsideScrollBox;
  pnlPanelCreator.Left              := 0;
  pnlPanelCreator.Top               := 24 * CustomInfosCount;
  pnlPanelCreator.Height            := 24;
  pnlPanelCreator.Width             := pnlInsideScrollBox.Width;
  pnlPanelCreator.BevelOuter        := bvNone;
  pnlPanelCreator.Caption           := '';
  pnlPanelCreator.Tag               := CustomInfoType; //the .Tag stores the info type
  //2. the checkbox
  chkCheckboxCreator                := TCheckbox.Create(Self);
  chkCheckboxCreator.Name           := 'chkCaption' + IntToStr(CustomInfosLastNumber + 1);
  chkCheckboxCreator.Parent         := TPanel(FindComponent('pnlParent' + IntToStr(CustomInfosLastNumber + 1)));
  chkCheckboxCreator.Left           := 0;
  chkCheckboxCreator.Top            := 2;
  chkCheckboxCreator.Checked        := Checked;
  chkCheckboxCreator.TabStop        := False;
  chkCheckboxCreator.Caption        := IntToStr(CustomInfosLastNumber + 1) + '. ' + CustomInfoTypes[CustomInfoType];
  if CustomInfosLastNumber + 1 < 10 then
    chkCheckboxCreator.Caption      := '0' + chkCheckboxCreator.Caption;
  chkCheckboxCreator.Width          := 155;
  chkCheckboxCreator.Tag            := CustomInfosLastNumber + 1; //the .Tag stores the current custom info number
  //3. the Del button
  {btnButtonDelCreator               := TButton.Create(Self);
  btnButtonDelCreator.Name          := 'btnDel' + IntToStr(CustomInfosLastNumber + 1);
  btnButtonDelCreator.Parent        := TPanel(FindComponent('pnlParent' + IntToStr(CustomInfosLastNumber + 1)));
  btnButtonDelCreator.Left          := 400;
  btnButtonDelCreator.Top           := 2;
  btnButtonDelCreator.Height        := 18;
  btnButtonDelCreator.Width         := 65;
  btnButtonDelCreator.TabStop       := False;
  btnButtonDelCreator.Caption       := 'Delete';
  btnButtonDelCreator.Tag           := CustomInfosLastNumber + 1; //the .Tag stores the current custom info number
  btnButtonDelCreator.OnClick       := ButtonDelClick;}
  //3. the toolbar and Del button
  tbToolBarCreator                  := TToolBar.Create(Self); //added later
  tbToolBarCreator.Name             := 'tbToolBar' + IntToStr(CustomInfosLastNumber + 1);
  tbToolBarCreator.Parent           := TPanel(FindComponent('pnlParent' + IntToStr(CustomInfosLastNumber + 1)));
  tbToolBarCreator.Align            := alNone;
  tbToolBarCreator.EdgeBorders      := [];
  tbToolBarCreator.EdgeInner        := esNone;
  tbToolBarCreator.EdgeOuter        := esNone;
  tbToolBarCreator.Flat             := True;
  tbToolBarCreator.Height           := tbtnAddCustomInfo.Height;
  tbToolBarCreator.Width            := 23;
  tbToolBarCreator.Left             := pnlPanelCreator.Width - tbToolBarCreator.Width;
  tbToolBarCreator.Top              := (24-tbToolBarCreator.Height) div 2;
  tbToolBarCreator.TabStop          := False;
  tbToolBarCreator.Images           := frmMain.imgLstMenu;
  tbToolBarCreator.DisabledImages   := frmMain.imgLstMenuDisabled;
  tbToolBarCreator.Tag              := CustomInfosLastNumber + 1; //the .Tag stores the current custom info number
  tbToolBarCreator.Anchors          := [akTop,akRight];
  tbtnButtonDelCreator              := TToolButton.Create(Self);
  tbtnButtonDelCreator.Name         := 'tbtnDel' + IntToStr(CustomInfosLastNumber + 1);
  tbtnButtonDelCreator.Parent       := TToolBar(FindComponent('tbToolBar' + IntToStr(CustomInfosLastNumber + 1)));
  tbtnButtonDelCreator.Height       := tbToolBarCreator.Height;
  tbtnButtonDelCreator.Width        := tbToolBarCreator.Width;
  tbtnButtonDelCreator.Left         := 0;
  tbtnButtonDelCreator.Top          := 0;
  tbtnButtonDelCreator.Hint         := 'Delete';
  tbtnButtonDelCreator.ShowHint     := True;
  tbtnButtonDelCreator.ImageIndex   := 26;
  tbtnButtonDelCreator.Tag          := CustomInfosLastNumber + 1; //the .Tag stores the current custom info number
  tbtnButtonDelCreator.OnClick      := ButtonDelClick;

  if CustomInfoType = 6 then
  begin
    cmbComboBoxCreator              := TComboBox.Create(Self);
    cmbComboBoxCreator.Name         := 'cmb' + IntToStr(CustomInfosLastNumber + 1);
    cmbComboBoxCreator.Parent       := TPanel(FindComponent('pnlParent' + IntToStr(CustomInfosLastNumber + 1)));
    cmbComboBoxCreator.Left         := chkCheckboxCreator.Left + chkCheckboxCreator.Width + 4;
    cmbComboBoxCreator.Top          := 0;
    cmbComboBoxCreator.Height       := 21;
    cmbComboBoxCreator.Width        := 120;
    cmbComboBoxCreator.Style        := csDropDownList;
    cmbComboBoxCreator.Items.Add(CustomInfoCombos[3]);
    cmbComboBoxCreator.Items.Add(CustomInfoCombos[4]);
    cmbComboBoxCreator.Items.Add(CustomInfoCombos[5]);
    cmbComboBoxCreator.Items.Add(CustomInfoCombos[6]);
    cmbComboBoxCreator.Items.Add(CustomInfoCombos[7]);
    cmbComboBoxCreator.Items.Add(CustomInfoCombos[8]);
    cmbComboBoxCreator.Perform(CB_SETDROPPEDWIDTH, 300, 0);
    cmbComboBoxCreator.ItemIndex    := ItemIndex;
    cmbComboBoxCreator.Tag          := CustomInfosLastNumber + 1; //the .Tag stores the current custom info number
    cmbComboBoxCreator.ShowHint     := True;
    cmbComboBoxCreator.Hint         := cmbComboBoxCreator.Text;

    edtEdit1Creator                 := TEdit.Create(Self);
    edtEdit1Creator.Name            := 'edt1_' + IntToStr(CustomInfosLastNumber + 1);
    edtEdit1Creator.Parent          := TPanel(FindComponent('pnlParent' + IntToStr(CustomInfosLastNumber + 1)));
    edtEdit1Creator.Left            := cmbComboBoxCreator.Left + cmbComboBoxCreator.Width + 4;
    edtEdit1Creator.Top             := 0;
    edtEdit1Creator.Height          := 21;
    edtEdit1Creator.Width           := tbToolBarCreator.Left - edtEdit1Creator.Left - 4;
    edtEdit1Creator.Text            := Text1;
    edtEdit1Creator.Font.Charset    := frmMain.OrgCharset;
    edtEdit1Creator.Tag             := CustomInfosLastNumber + 1; //the .Tag stores the current custom info number
  end else
  begin
    lblLabelGreaterCreator          := TLabel.Create(Self);
    lblLabelGreaterCreator.Name     := 'lblGreater' + IntToStr(CustomInfosLastNumber + 1);
    lblLabelGreaterCreator.Parent   := TPanel(FindComponent('pnlParent' + IntToStr(CustomInfosLastNumber + 1)));
    lblLabelGreaterCreator.Caption  := '>';
    lblLabelGreaterCreator.Left     := chkCheckboxCreator.Left + chkCheckboxCreator.Width + 3;
    lblLabelGreaterCreator.Top      := 2;

    edtEdit1Creator                 := TEdit.Create(Self);
    edtEdit1Creator.Name            := 'edt1_' + IntToStr(CustomInfosLastNumber + 1);
    edtEdit1Creator.Parent          := TPanel(FindComponent('pnlParent' + IntToStr(CustomInfosLastNumber + 1)));
    edtEdit1Creator.Left            := lblLabelGreaterCreator.Left + lblLabelGreaterCreator.Width + 4;
    edtEdit1Creator.Top             := 0;
    edtEdit1Creator.Height          := 21;
    edtEdit1Creator.Width           := 41;
    edtEdit1Creator.Text            := Text1;
    edtEdit1Creator.OnKeyPress      := EditNumKeyPress;
    edtEdit1Creator.OnChange        := EditNumChange;
    edtEdit1Creator.Tag             := CustomInfosLastNumber + 1; //the .Tag stores the current custom info number

    lblLabel1Creator                := TLabel.Create(Self);
    lblLabel1Creator.Name           := 'lbl1_' + IntToStr(CustomInfosLastNumber + 1);
    lblLabel1Creator.Parent         := TPanel(FindComponent('pnlParent' + IntToStr(CustomInfosLastNumber + 1)));
    lblLabel1Creator.Caption        := CustomInfoLabels[CustomInfoType];
    lblLabel1Creator.Left           := edtEdit1Creator.Left + edtEdit1Creator.Width + 4;
    lblLabel1Creator.Top            := 4;

    cmbComboBoxCreator              := TComboBox.Create(Self);
    cmbComboBoxCreator.Name         := 'cmb' + IntToStr(CustomInfosLastNumber + 1);
    cmbComboBoxCreator.Parent       := TPanel(FindComponent('pnlParent' + IntToStr(CustomInfosLastNumber + 1)));
    cmbComboBoxCreator.Left         := edtEdit1Creator.Left + edtEdit1Creator.Width + btnCheckAll.Width div 2;
    cmbComboBoxCreator.Top          := 0;
    cmbComboBoxCreator.Height       := 21;
    cmbComboBoxCreator.Width        := 57;
    cmbComboBoxCreator.Items.Add(CustomInfoCombos[1]);
    cmbComboBoxCreator.Items.Add(CustomInfoCombos[2]);
    cmbComboBoxCreator.Style        := csDropDownList;
    cmbComboBoxCreator.ItemIndex    := ItemIndex;
    cmbComboBoxCreator.Tag          := CustomInfosLastNumber + 1; //the .Tag stores the current custom info number

    lblLabelLessCreator             := TLabel.Create(Self);
    lblLabelLessCreator.Name        := 'lblLess' + IntToStr(CustomInfosLastNumber + 1);
    lblLabelLessCreator.Parent      := TPanel(FindComponent('pnlParent' + IntToStr(CustomInfosLastNumber + 1)));
    lblLabelLessCreator.Caption     := '<';
    lblLabelLessCreator.Left        := cmbComboBoxCreator.Left + cmbComboBoxCreator.Width + 4;
    lblLabelLessCreator.Top         := 2;

    edtEdit2Creator                 := TEdit.Create(Self);
    edtEdit2Creator.Name            := 'edt2_' + IntToStr(CustomInfosLastNumber + 1);
    edtEdit2Creator.Parent          := TPanel(FindComponent('pnlParent' + IntToStr(CustomInfosLastNumber + 1)));
    edtEdit2Creator.Left            := lblLabelLessCreator.Left + lblLabelLessCreator.Width + 4;
    edtEdit2Creator.Top             := 0;
    edtEdit2Creator.Height          := 21;
    edtEdit2Creator.Width           := 41;
    edtEdit2Creator.Text            := Text2;
    edtEdit2Creator.OnKeyPress      := EditNumKeyPress;
    edtEdit2Creator.OnChange        := EditNumChange;
    edtEdit2Creator.Tag             := CustomInfosLastNumber + 1; //the .Tag stores the current custom info number

    lblLabel2Creator                := TLabel.Create(Self);
    lblLabel2Creator.Name           := 'lbl2_' + IntToStr(CustomInfosLastNumber + 1);
    lblLabel2Creator.Parent         := TPanel(FindComponent('pnlParent' + IntToStr(CustomInfosLastNumber + 1)));
    lblLabel2Creator.Caption        := CustomInfoLabels[CustomInfoType];
    lblLabel2Creator.Left           := edtEdit2Creator.Left + edtEdit2Creator.Width + 4;
    lblLabel2Creator.Top            := 4;
  end;

  Inc(CustomInfosLastNumber);
  Inc(CustomInfosCount);
end;
end;

// -----------------------------------------------------------------------------

procedure TfrmCompositeCustomInfo.ButtonDelClick(Sender: TObject);
begin
  if tmrDeleteCustomInfo.Enabled then exit; //in case the timer is currently deleting
  CustomInfoToDelete := TButton(Sender).Tag;
  tmrDeleteCustomInfo.Enabled := True;
end;

// -----------------------------------------------------------------------------

procedure TfrmCompositeCustomInfo.tmrDeleteCustomInfoTimer(Sender: TObject);
var
  i : Integer;
begin
  if CustomInfoToDelete > 0 then
  begin
    if FindComponent('pnlParent' + IntToStr(CustomInfoToDelete)) <> nil then
    begin
      FreeCustomInfoComponents(IntToStr(CustomInfoToDelete));
      Dec(CustomInfosCount);
      if CustomInfosCount = 0 then
        CustomInfosLastNumber := 0;

      //refresh height and positions
      for i := CustomInfoToDelete + 1 to CustomInfosLastNumber do
        if FindComponent('pnlParent' + IntToStr(i)) <> nil then
          TPanel(FindComponent('pnlParent' + IntToStr(i))).Top := TPanel(FindComponent('pnlParent' + IntToStr(i))).Top - 24;
      pnlInsideScrollBox.Height := 24 * CustomInfosCount;
    end;
  end;
  CustomInfoToDelete := 0;
  tmrDeleteCustomInfo.Enabled := False;
end;

// -----------------------------------------------------------------------------

procedure TfrmCompositeCustomInfo.FreeCustomInfoComponents(Index: String);
begin
  if TPanel(FindComponent('pnlParent' + Index)).Tag < 6 then
  begin
    TLabel(FindComponent('lbl2_' + Index)).Free;
    TEdit(FindComponent('edt2_' + Index)).Free;
    TLabel(FindComponent('lblLess' + Index)).Free;
    TLabel(FindComponent('lbl1_' + Index)).Free;
    TLabel(FindComponent('lblGreater' + Index)).Free;
  end;
  TComboBox(FindComponent('cmb' + Index)).Free;
  TEdit(FindComponent('edt1_' + Index)).Free;
  TButton(FindComponent('btnDel' + Index)).Free;
  TCheckbox(FindComponent('chkCaption' + Index)).Free;
  TPanel(FindComponent('pnlParent' + Index)).Free;
end;

// -----------------------------------------------------------------------------

procedure TfrmCompositeCustomInfo.EditNumKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    '0'..'9', #8  : ;
  else
    Key:=#0;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmCompositeCustomInfo.EditNumChange(Sender: TObject);
var
  p: PChar;
  s: String;
begin
  p := PChar(TEdit(Sender).Text);
  s := '';
  while p^ <> #0 do
  begin
    if p^ in ['0'..'9'] then
      s := s + p^;
    Inc(p);
  end;
  TEdit(Sender).Text := s;
end;

// -----------------------------------------------------------------------------

procedure TfrmCompositeCustomInfo.btnOkClick(Sender: TObject);
begin
  if frmInfoErrors.FindComponent('chkCaption'+IntToStr(Tag)) <> nil then
  begin
    TCheckBox(frmInfoErrors.FindComponent('chkCaption'+IntToStr(Tag))).Enabled := True;
    if edtCaption.Text <> '' then
      TCheckBox(frmInfoErrors.FindComponent('chkCaption'+IntToStr(Tag))).Caption := Copy(TCheckBox(frmInfoErrors.FindComponent('chkCaption'+IntToStr(Tag))).Caption, 1, 4) + edtCaption.Text else
      TCheckBox(frmInfoErrors.FindComponent('chkCaption'+IntToStr(Tag))).Caption := Copy(TCheckBox(frmInfoErrors.FindComponent('chkCaption'+IntToStr(Tag))).Caption, 1, 4) + CustomInfoTypes[7];
  end;
  //recheck custom info
  frmInfoErrors.DeleteCustomInfo(nil, Tag);
  frmInfoErrors.CheckCustomInfo(nil, Tag);    
end;

// -----------------------------------------------------------------------------

procedure TfrmCompositeCustomInfo.FormShow(Sender: TObject);
begin
  SetLanguage;
  SetCustomInfosLanguage;
  chkLinesWithoutLetters.Enabled     :=  ErrorsToCheck.eLinesWithoutLetters   ;
  chkEmptySubtitles.Enabled          :=  ErrorsToCheck.eEmptySubtitle         ;
  chkOverlapping.Enabled             :=  ErrorsToCheck.eOverlapping           ;
  chkBadValues.Enabled               :=  ErrorsToCheck.eBadValues             ;
  chkTooShortPause.Enabled           :=  ErrorsToCheck.eTooShortPause         ;
  chkTooLongDur.Enabled              :=  ErrorsToCheck.eTooLongDurations      ;
  chkTooShortDur.Enabled             :=  ErrorsToCheck.eTooShortDurations     ;
  chkTooLongLines.Enabled            :=  ErrorsToCheck.eTooLongLines          ;
  chkOverTwoLines.Enabled            :=  ErrorsToCheck.eOverTwoLines          ;
  chkHearingImpaired.Enabled         :=  ErrorsToCheck.eHearingImpaired       ;
  chkTextBeforeColon.Enabled         :=  ErrorsToCheck.eTextBeforeColon       ;
  chkUnnecessaryDots.Enabled         :=  ErrorsToCheck.eUnnecessaryDots       ;
  chkProhibitedChars.Enabled         :=  ErrorsToCheck.eProhibitedCharacter   ;
  chkRepeatedChars.Enabled           :=  ErrorsToCheck.eRepeatedCharacter     ;
  chkRepeatedSubs.Enabled            :=  ErrorsToCheck.eRepeatedSubtitle      ;
  chkOCRErrors.Enabled               :=  ErrorsToCheck.eOCRErrors             ;
  chkOpnDlgInSubsWithOneLine.Enabled :=  ErrorsToCheck.eOpnDlgSubsOneLine     ;
  chkDashOnFirstLine.Enabled         :=  ErrorsToCheck.eDashOnFirstLine       ;
  chkDialogueOnOneLine.Enabled       :=  ErrorsToCheck.eDialogueOnOneLine     ;
  chkSpaceAfterCustomChars.Enabled   :=  ErrorsToCheck.eSpaceAfterCustChars   ;
  chkSpaceBeforeCustomChars.Enabled  :=  ErrorsToCheck.eSpaceBeforeCustChars  ;
  chkUnnecessarySpaces.Enabled       :=  ErrorsToCheck.eUnnecessarySpaces     ;
  chkUnnecessaryTags.Enabled         :=  ErrorsToCheck.eUnnecessaryTags       ;
  chkTooMuchCPS.Enabled              :=  ErrorsToCheck.eTooMuchCPS            ;
end;

// -----------------------------------------------------------------------------

function TfrmCompositeCustomInfo.GetCheckedTypesAsString: String;
var
  CheckedTypes  : String;
begin
  CheckedTypes := '';
  if chkMarkedSubs.Checked               then CheckedTypes := CheckedTypes + '1' else CheckedTypes := CheckedTypes + '0';
  if chkLinesWithoutLetters.Checked      then CheckedTypes := CheckedTypes + '1' else CheckedTypes := CheckedTypes + '0';
  if chkEmptySubtitles.Checked           then CheckedTypes := CheckedTypes + '1' else CheckedTypes := CheckedTypes + '0';
  if chkOverlapping.Checked              then CheckedTypes := CheckedTypes + '1' else CheckedTypes := CheckedTypes + '0';
  if chkBadValues.Checked                then CheckedTypes := CheckedTypes + '1' else CheckedTypes := CheckedTypes + '0';
  if chkTooShortPause.Checked            then CheckedTypes := CheckedTypes + '1' else CheckedTypes := CheckedTypes + '0';
  if chkTooLongDur.Checked               then CheckedTypes := CheckedTypes + '1' else CheckedTypes := CheckedTypes + '0';
  if chkTooShortDur.Checked              then CheckedTypes := CheckedTypes + '1' else CheckedTypes := CheckedTypes + '0';
  if chkTooLongLines.Checked             then CheckedTypes := CheckedTypes + '1' else CheckedTypes := CheckedTypes + '0';
  if chkOverTwoLines.Checked             then CheckedTypes := CheckedTypes + '1' else CheckedTypes := CheckedTypes + '0';
  if chkHearingImpaired.Checked          then CheckedTypes := CheckedTypes + '1' else CheckedTypes := CheckedTypes + '0';
  if chkTextBeforeColon.Checked          then CheckedTypes := CheckedTypes + '1' else CheckedTypes := CheckedTypes + '0';
  if chkUnnecessaryDots.Checked          then CheckedTypes := CheckedTypes + '1' else CheckedTypes := CheckedTypes + '0';
  if chkProhibitedChars.Checked          then CheckedTypes := CheckedTypes + '1' else CheckedTypes := CheckedTypes + '0';
  if chkRepeatedChars.Checked            then CheckedTypes := CheckedTypes + '1' else CheckedTypes := CheckedTypes + '0';
  if chkRepeatedSubs.Checked             then CheckedTypes := CheckedTypes + '1' else CheckedTypes := CheckedTypes + '0';
  if chkOCRErrors.Checked                then CheckedTypes := CheckedTypes + '1' else CheckedTypes := CheckedTypes + '0';
  if chkOpnDlgInSubsWithOneLine.Checked  then CheckedTypes := CheckedTypes + '1' else CheckedTypes := CheckedTypes + '0';
  if chkDashOnFirstLine.Checked          then CheckedTypes := CheckedTypes + '1' else CheckedTypes := CheckedTypes + '0';
  if chkDialogueOnOneLine.Checked        then CheckedTypes := CheckedTypes + '1' else CheckedTypes := CheckedTypes + '0';
  if chkSpaceAfterCustomChars.Checked    then CheckedTypes := CheckedTypes + '1' else CheckedTypes := CheckedTypes + '0';
  if chkSpaceBeforeCustomChars.Checked   then CheckedTypes := CheckedTypes + '1' else CheckedTypes := CheckedTypes + '0';
  if chkUnnecessarySpaces.Checked        then CheckedTypes := CheckedTypes + '1' else CheckedTypes := CheckedTypes + '0';
  if chkUnnecessaryTags.Checked          then CheckedTypes := CheckedTypes + '1' else CheckedTypes := CheckedTypes + '0';
  if chkTooMuchCPS.Checked               then CheckedTypes := CheckedTypes + '1' else CheckedTypes := CheckedTypes + '0';
  Result := CheckedTypes;
end;

// -----------------------------------------------------------------------------

procedure TfrmCompositeCustomInfo.SetCheckedTypesFromString(CheckedTypes: String);
begin
  chkMarkedSubs.Checked               := StrToBool(Copy(CheckedTypes,1,1));
  chkLinesWithoutLetters.Checked      := StrToBool(Copy(CheckedTypes,2,1));
  chkEmptySubtitles.Checked           := StrToBool(Copy(CheckedTypes,3,1));
  chkOverlapping.Checked              := StrToBool(Copy(CheckedTypes,4,1));
  chkBadValues.Checked                := StrToBool(Copy(CheckedTypes,5,1));
  chkTooShortPause.Checked            := StrToBool(Copy(CheckedTypes,6,1));
  chkTooLongDur.Checked               := StrToBool(Copy(CheckedTypes,7,1));
  chkTooShortDur.Checked              := StrToBool(Copy(CheckedTypes,8,1));
  chkTooLongLines.Checked             := StrToBool(Copy(CheckedTypes,9,1));
  chkOverTwoLines.Checked             := StrToBool(Copy(CheckedTypes,10,1));
  chkHearingImpaired.Checked          := StrToBool(Copy(CheckedTypes,11,1));
  chkTextBeforeColon.Checked          := StrToBool(Copy(CheckedTypes,12,1));
  chkUnnecessaryDots.Checked          := StrToBool(Copy(CheckedTypes,13,1));
  chkProhibitedChars.Checked          := StrToBool(Copy(CheckedTypes,14,1));
  chkRepeatedChars.Checked            := StrToBool(Copy(CheckedTypes,15,1));
  chkRepeatedSubs.Checked             := StrToBool(Copy(CheckedTypes,16,1));
  chkOCRErrors.Checked                := StrToBool(Copy(CheckedTypes,17,1));
  chkOpnDlgInSubsWithOneLine.Checked  := StrToBool(Copy(CheckedTypes,18,1));
  chkDashOnFirstLine.Checked          := StrToBool(Copy(CheckedTypes,19,1));
  chkDialogueOnOneLine.Checked        := StrToBool(Copy(CheckedTypes,20,1));
  chkSpaceAfterCustomChars.Checked    := StrToBool(Copy(CheckedTypes,21,1));
  chkSpaceBeforeCustomChars.Checked   := StrToBool(Copy(CheckedTypes,22,1));
  chkUnnecessarySpaces.Checked        := StrToBool(Copy(CheckedTypes,23,1));
  chkUnnecessaryTags.Checked          := StrToBool(Copy(CheckedTypes,24,1));
  chkTooMuchCPS.Checked               := StrToBool(Copy(CheckedTypes,25,1));
end;

// -----------------------------------------------------------------------------

procedure TfrmCompositeCustomInfo.SetLanguage;
begin
    if Assigned(frmInfoErrors) then
    begin
      Caption                             := CustomInfoTypes[7] + ' (' + ErrorTypes[5] + ' ' + IntToStr(Tag) + ')';
      edtCaption.EditLabel.Caption        := CustomInfoCaption;
      btnCheckAll.Caption                 := frmInfoErrors.btnCheckAllCI.Caption;
      btnCheckNone.Caption                := frmInfoErrors.btnCheckNoneCI.Caption;
      btnCheckInverse.Caption             := frmInfoErrors.btnCheckInverseCI.Caption;

      chkMarkedSubs.Caption               := frmInfoErrors.chkMarkedSubs.Caption;
      chkLinesWithoutLetters.Caption      := frmInfoErrors.chkLinesWithoutLetters.Caption;
      chkEmptySubtitles.Caption           := frmInfoErrors.chkEmptySubtitles.Caption;
      chkOverlapping.Caption              := frmInfoErrors.chkOverlapping.Caption;
      chkBadValues.Caption                := frmInfoErrors.chkBadValues.Caption;
      chkTooShortPause.Caption            := frmInfoErrors.chkTooShortPause.Caption;
      chkTooLongDur.Caption               := frmInfoErrors.chkTooLongDur.Caption;
      chkTooShortDur.Caption              := frmInfoErrors.chkTooShortDur.Caption;
      chkTooLongLines.Caption             := frmInfoErrors.chkTooLongLines.Caption;
      chkOverTwoLines.Caption             := frmInfoErrors.chkOverTwoLines.Caption;
      chkHearingImpaired.Caption          := frmInfoErrors.chkHearingImpaired.Caption;
      chkTextBeforeColon.Caption          := frmInfoErrors.chkTextBeforeColon.Caption;
      chkUnnecessaryDots.Caption          := frmInfoErrors.chkUnnecessaryDots.Caption;
      chkProhibitedChars.Caption          := frmInfoErrors.chkProhibitedChars.Caption;
      chkRepeatedChars.Caption            := frmInfoErrors.chkRepeatedChars.Caption;
      chkRepeatedSubs.Caption             := frmInfoErrors.chkRepeatedSubs.Caption;
      chkOCRErrors.Caption                := frmInfoErrors.chkOCRErrors.Caption;
      chkOpnDlgInSubsWithOneLine.Caption  := frmInfoErrors.chkOpnDlgInSubsWithOneLine.Caption;
      chkDashOnFirstLine.Caption          := frmInfoErrors.chkDashOnFirstLine.Caption;
      chkDialogueOnOneLine.Caption        := frmInfoErrors.chkDialogueOnOneLine.Caption;
      chkSpaceAfterCustomChars.Caption    := frmInfoErrors.chkSpaceAfterCustomChars.Caption;
      chkSpaceBeforeCustomChars.Caption   := frmInfoErrors.chkSpaceBeforeCustomChars.Caption;
      chkUnnecessarySpaces.Caption        := frmInfoErrors.chkUnnecessarySpaces.Caption;
      chkUnnecessaryTags.Caption          := frmInfoErrors.chkUnnecessaryTags.Caption;
      chkTooMuchCPS.Caption               := frmInfoErrors.chkTooMuchCPS.Caption;

      tbtnAddCustomInfo.Hint                    := frmInfoErrors.tbtnAddCustomInfo.Hint;
      mnuSubtitlesDurationCustomInfo.Caption    := frmInfoErrors.mnuSubtitlesDurationCustomInfo.Caption;
      mnuSubtitlesLineLengthCustomInfo.Caption  := frmInfoErrors.mnuSubtitlesLineLengthCustomInfo.Caption;
      mnuSubtitlesLinesCountCustomInfo.Caption  := frmInfoErrors.mnuSubtitlesLinesCountCustomInfo.Caption;
      mnuSubtitlesPauseCustomInfo.Caption       := frmInfoErrors.mnuSubtitlesPauseCustomInfo.Caption;
      mnuSubtitlesCPSCustomInfo.Caption         := frmInfoErrors.mnuSubtitlesCPSCustomInfo.Caption;
      mnuSubtitlesTextCustomInfo.Caption        := frmInfoErrors.mnuSubtitlesTextCustomInfo.Caption;
      pnlInsideScrollBox.Caption                := frmInfoErrors.pnlInsideScrollBox.Caption;

      btnOk.Caption                       := BTN_OK;
      
      // ------------------ //
      //      Set font      //
      // ------------------ //
      btnOK.ParentFont                       := True;
      edtCaption.EditLabel.ParentFont        := True;
      //edtCaption.ParentFont                  := True;
      btnCheckAll.ParentFont                 := True;
      btnCheckNone.ParentFont                := True;
      btnCheckInverse.ParentFont             := True;
      chkMarkedSubs.ParentFont               := True;
      chkLinesWithoutLetters.ParentFont      := True;
      chkEmptySubtitles.ParentFont           := True;
      chkOverlapping.ParentFont              := True;
      chkBadValues.ParentFont                := True;
      chkTooShortPause.ParentFont            := True;
      chkTooLongDur.ParentFont               := True;
      chkTooShortDur.ParentFont              := True;
      chkTooLongLines.ParentFont             := True;
      chkOverTwoLines.ParentFont             := True;
      chkHearingImpaired.ParentFont          := True;
      chkTextBeforeColon.ParentFont          := True;
      chkUnnecessaryDots.ParentFont          := True;
      chkProhibitedChars.ParentFont          := True;
      chkRepeatedChars.ParentFont            := True;
      chkRepeatedSubs.ParentFont             := True;
      chkOCRErrors.ParentFont                := True;
      chkOpnDlgInSubsWithOneLine.ParentFont  := True;
      chkDashOnFirstLine.ParentFont          := True;
      chkDialogueOnOneLine.ParentFont        := True;
      chkSpaceAfterCustomChars.ParentFont    := True;
      chkSpaceBeforeCustomChars.ParentFont   := True;
      chkUnnecessarySpaces.ParentFont        := True;
      chkUnnecessaryTags.ParentFont          := True;
      chkTooMuchCPS.ParentFont               := True;
      pnlInsideScrollBox.ParentFont          := True;
      Font                                   := frmMain.Font;
      btnOk.Font.Style                       := frmMain.Font.Style + [fsBold];
      chkMarkedSubs.Font.Style               := frmMain.Font.Style + [fsBold];
    end;
end;

// -----------------------------------------------------------------------------

//Set custom infos language when changing SW interface language
procedure TfrmCompositeCustomInfo.SetCustomInfosLanguage;
var
  i         : Integer;
  Component : TComponent;
  CIType    : SmallInt;
  ItemIndex : Integer;
begin
    for i := 1 to CustomInfosLastNumber do
      if FindComponent('pnlParent' + IntToStr(i)) <> nil then
      begin
        CIType := TPanel(FindComponent('pnlParent' + IntToStr(i))).Tag; //Get Custom Info type
        Component := FindComponent('chkCaption' + IntToStr(i)); //Get Custom Info checkbox
        //Change the Custom Info Caption
        TLabel(Component).Caption := IntToStr(i) + '. ' + CustomInfoTypes[CIType];
        if i < 10 then TLabel(Component).Caption := '0' + TLabel(Component).Caption;
        //Change Custom Info DELETE button Hint text
        Component := FindComponent('tbtnDel' + IntToStr(i));
        TToolButton(Component).Hint := CustomInfoDelete;
        //Change strings in Text Custom Info type
        if CIType = 6 then
        begin
          //Change combobox fields text
          Component := FindComponent('cmb' + IntToStr(i));
          ItemIndex := TComboBox(Component).ItemIndex;
          TComboBox(Component).Items[0] := CustomInfoCombos[3];
          TComboBox(Component).Items[1] := CustomInfoCombos[4];
          TComboBox(Component).Items[2] := CustomInfoCombos[5];
          TComboBox(Component).Items[3] := CustomInfoCombos[6];
          TComboBox(Component).Items[4] := CustomInfoCombos[7];
          TComboBox(Component).Items[5] := CustomInfoCombos[8];
          TComboBox(Component).ItemIndex := ItemIndex;
          //Refresh text field charset
          TEdit(FindComponent('edt1_' + IntToStr(i))).Font.Charset := frmMain.OrgCharset;
          if frmMain.OrgCharset = 0 then
            TEdit(FindComponent('edt1_' + IntToStr(i))).Font.Charset := 0;
        end else
        //Change strings in the rest Custom Info types
        if CIType in [1..5] then
        begin
          //Change ms/char/lines/cps etc. text
          TLabel(FindComponent('lbl1_' + IntToStr(i))).Caption := CustomInfoLabels[CIType];
          TLabel(FindComponent('lbl2_' + IntToStr(i))).Caption := CustomInfoLabels[CIType];
          //Change OR/AND text
          Component := FindComponent('cmb' + IntToStr(i));
          ItemIndex := TComboBox(Component).ItemIndex;
          TComboBox(Component).Items[0] := CustomInfoCombos[1];
          TComboBox(Component).Items[1] := CustomInfoCombos[2];
          TComboBox(Component).ItemIndex := ItemIndex;
        end;
      end;
end;

// ----------------------------------------------------------

procedure TfrmCompositeCustomInfo.edtCaptionKeyPress(Sender: TObject; var Key: Char);
begin
{  case Key of
    #27:
    begin
      Key := #0;
      ModalResult := mrCancel;
      Close;
    end;
  end;}
end;

// ----------------------------------------------------------

end.
