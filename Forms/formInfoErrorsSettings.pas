// This file is part of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle Workshop's copyright information
// File Description: Information and Errors Settings form

unit formInfoErrorsSettings;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, ComCtrls, CheckLst, ExtCtrls, IniFiles, ShellAPI, Buttons,
  CommonTypes;

type
  TfrmInfoErrorsSettings = class(TForm)
    pgeCtrl: TPageControl;
    pgeCheckFor: TTabSheet;
    pgeFix: TTabSheet;
    chkCheckEmptySubtitles: TCheckBox;
    chkCheckOverlapping: TCheckBox;
    chkCheckBadValues: TCheckBox;
    chkCheckHearingImpaired: TCheckBox;
    chkCheckTextBeforeColon: TCheckBox;
    chkCheckOnlyIfCapitalLetters: TCheckBox;
    chkCheckUnnecessaryDots: TCheckBox;
    chkCheckOverTwoLines: TCheckBox;
    chkCheckProhibitedChars: TCheckBox;
    chkCheckRepeatedChars: TCheckBox;
    chkCheckOCRErrors: TCheckBox;
    chkCheckRepeatedSubs: TCheckBox;
    chkCheckUnnecessarySpaces: TCheckBox;
    pgeUnnecessarySpaces: TTabSheet;
    lstSpacesToCheck: TCheckListBox;
    lblCheckFor: TLabel;
    lstSpacesToFix: TCheckListBox;
    lblFix: TLabel;
    chkFixEmptySubtitles: TCheckBox;
    chkFixOverlapping: TCheckBox;
    chkFixBadValues: TCheckBox;
    chkFixHearingImpaired: TCheckBox;
    chkFixTextBeforeColon: TCheckBox;
    chkFixOnlyIfCapitalLetters: TCheckBox;
    chkFixUnnecessaryDots: TCheckBox;
    chkFixOverTwoLines: TCheckBox;
    chkFixProhibitedChars: TCheckBox;
    chkFixRepeatedChars: TCheckBox;
    chkFixRepeatedSubs: TCheckBox;
    chkFixOCRErrors: TCheckBox;
    chkFixUnnecessarySpaces: TCheckBox;
    btnOk: TButton;
    btnCancel: TButton;
    pgeGeneral: TTabSheet;
    chkMarkErrorsInList: TCheckBox;
    chkBold: TCheckBox;
    chkItalic: TCheckBox;
    chkUnderline: TCheckBox;
    dlgSetColor: TColorDialog;
    chkFixOnLoad: TCheckBox;
    dlgLoad: TOpenDialog;
    btnEdit: TButton;
    pgeAdvanced: TTabSheet;
    edtRepeatableChars: TLabeledEdit;
    edtProhibitedChars: TLabeledEdit;
    edtToleranceRepeatedSubs: TLabeledEdit;
    udToleranceRepeatedSubs: TUpDown;
    lblMilliseconds: TLabel;
    edtSpaceAfterChars: TLabeledEdit;
    edtSpaceBeforeChars: TLabeledEdit;
    chkCheckSpaceAfterCustomChars: TCheckBox;
    chkCheckSpaceBeforeCustomChars: TCheckBox;
    chkFixSpaceAfterCustomChars: TCheckBox;
    chkFixSpaceBeforeCustomChars: TCheckBox;
    edtTooLongDuration: TLabeledEdit;
    udTooLongDur: TUpDown;
    edtTooShortDuration: TLabeledEdit;
    udTooShortDur: TUpDown;
    lblMilliseconds2: TLabel;
    lblMilliseconds3: TLabel;
    chkCheckTooLongDur: TCheckBox;
    chkCheckTooShortDur: TCheckBox;
    edtTooLongLine: TLabeledEdit;
    udTooLongLine: TUpDown;
    lblCharacters: TLabel;
    chkCheckTooLongLines: TCheckBox;
    chkFixOneUnitOverlap: TCheckBox;
    lblOCRDefFile: TLabel;
    cmbOCRFiles: TComboBox;
    chkShowConfInMainForm: TCheckBox;
    bvlSep1: TBevel;
    chkCheckLinesWithoutLetters: TCheckBox;
    bvlSep2: TBevel;
    bvlSep3: TBevel;
    chkFixLinesWithoutLetters: TCheckBox;
    bvlSep4: TBevel;
    bvlSep5: TBevel;
    chkCheckOpnDlgInSubsWithOneLine: TCheckBox;
    chkFixOpnDlgInSubsWithOneLine: TCheckBox;
    chkIndicTooLongLines: TCheckBox;
    pnlIndicTooLongLinesColor: TPanel;
    pnlIndicTooLongLinesBackground: TPanel;
    pnlMarkErrorsInListColor: TPanel;
    pnlMarkErrorsInListBackground: TPanel;
    chkOriginalTextColor: TCheckBox;
    chkOnlyIfThereIsAColorTag: TCheckBox;
    chkOriginalBackground: TCheckBox;
    chkOriginalTextStyle: TCheckBox;
    chkIndicTooShortDuration: TCheckBox;
    chkIndicTooLongDuration: TCheckBox;
    pnlIndicTooLongDurationColor: TPanel;
    pnlIndicTooLongDurationBackground: TPanel;
    pnlIndicTooShortDurationColor: TPanel;
    pnlIndicTooShortDurationBackground: TPanel;
    chkIndicBadValues: TCheckBox;
    pnlIndicBadValuesColor: TPanel;
    pnlIndicBadValuesBackground: TPanel;
    chkIndicOverTwoLines: TCheckBox;
    pnlIndicOverTwoLinesColor: TPanel;
    pnlIndicOverTwoLinesBackground: TPanel;
    pgeMark: TTabSheet;
    chkMarkEnable_16: TCheckBox;
    chkMarkEnable_1: TCheckBox;
    chkMarkEnable_7: TCheckBox;
    chkMarkEnable_6: TCheckBox;
    chkMarkEnable_5: TCheckBox;
    chkMarkEnable_18: TCheckBox;
    chkMarkEnable_17: TCheckBox;
    chkMarkEnable_19: TCheckBox;
    chkMarkEnable_14: TCheckBox;
    chkMarkEnable_15: TCheckBox;
    chkMarkEnable_13: TCheckBox;
    chkMarkEnable_12: TCheckBox;
    chkMarkEnable_8: TCheckBox;
    chkMarkEnable_11: TCheckBox;
    chkMarkOnlyIfCapitalLetters: TCheckBox;
    chkMarkEnable_10: TCheckBox;
    chkMarkEnable_9: TCheckBox;
    chkMarkEnable_4: TCheckBox;
    chkMarkEnable_3: TCheckBox;
    chkMarkEnable_2: TCheckBox;
    bvlSep8: TBevel;
    bvlSep7: TBevel;
    bvlSep6: TBevel;
    sbMarkStrikeOut_6: TSpeedButton;
    sbMarkUnderline_6: TSpeedButton;
    sbMarkItalic_6: TSpeedButton;
    sbMarkBold_6: TSpeedButton;
    sbMarkText_6: TSpeedButton;
    sbMarkHide_6: TSpeedButton;
    sbMarkShow_6: TSpeedButton;
    sbMarkNum_6: TSpeedButton;
    pnlMarkBckgr_6: TPanel;
    pnlMarkColor_6: TPanel;
    sbMarkNum_5: TSpeedButton;
    sbMarkShow_5: TSpeedButton;
    sbMarkHide_5: TSpeedButton;
    sbMarkText_5: TSpeedButton;
    sbMarkBold_5: TSpeedButton;
    sbMarkItalic_5: TSpeedButton;
    sbMarkUnderline_5: TSpeedButton;
    sbMarkStrikeOut_5: TSpeedButton;
    pnlMarkColor_5: TPanel;
    pnlMarkBckgr_5: TPanel;
    sbMarkNum_4: TSpeedButton;
    sbMarkShow_4: TSpeedButton;
    sbMarkHide_4: TSpeedButton;
    sbMarkText_4: TSpeedButton;
    sbMarkBold_4: TSpeedButton;
    sbMarkItalic_4: TSpeedButton;
    sbMarkUnderline_4: TSpeedButton;
    sbMarkStrikeOut_4: TSpeedButton;
    pnlMarkColor_4: TPanel;
    pnlMarkBckgr_4: TPanel;
    sbMarkNum_3: TSpeedButton;
    sbMarkShow_3: TSpeedButton;
    sbMarkHide_3: TSpeedButton;
    sbMarkText_3: TSpeedButton;
    sbMarkBold_3: TSpeedButton;
    sbMarkItalic_3: TSpeedButton;
    sbMarkUnderline_3: TSpeedButton;
    sbMarkStrikeOut_3: TSpeedButton;
    pnlMarkColor_3: TPanel;
    pnlMarkBckgr_3: TPanel;
    sbMarkNum_2: TSpeedButton;
    sbMarkShow_2: TSpeedButton;
    sbMarkHide_2: TSpeedButton;
    sbMarkText_2: TSpeedButton;
    sbMarkBold_2: TSpeedButton;
    sbMarkItalic_2: TSpeedButton;
    sbMarkUnderline_2: TSpeedButton;
    sbMarkStrikeOut_2: TSpeedButton;
    pnlMarkColor_2: TPanel;
    pnlMarkBckgr_2: TPanel;
    sbMarkNum_1: TSpeedButton;
    sbMarkShow_1: TSpeedButton;
    sbMarkHide_1: TSpeedButton;
    sbMarkText_1: TSpeedButton;
    sbMarkBold_1: TSpeedButton;
    sbMarkItalic_1: TSpeedButton;
    sbMarkUnderline_1: TSpeedButton;
    sbMarkStrikeOut_1: TSpeedButton;
    pnlMarkColor_1: TPanel;
    pnlMarkBckgr_1: TPanel;
    sbMarkNum_7: TSpeedButton;
    sbMarkShow_7: TSpeedButton;
    sbMarkHide_7: TSpeedButton;
    sbMarkText_7: TSpeedButton;
    sbMarkBold_7: TSpeedButton;
    sbMarkItalic_7: TSpeedButton;
    sbMarkUnderline_7: TSpeedButton;
    sbMarkStrikeOut_7: TSpeedButton;
    pnlMarkColor_7: TPanel;
    pnlMarkBckgr_7: TPanel;
    sbMarkNum_8: TSpeedButton;
    sbMarkShow_8: TSpeedButton;
    sbMarkHide_8: TSpeedButton;
    sbMarkText_8: TSpeedButton;
    sbMarkBold_8: TSpeedButton;
    sbMarkItalic_8: TSpeedButton;
    sbMarkUnderline_8: TSpeedButton;
    sbMarkStrikeOut_8: TSpeedButton;
    pnlMarkColor_8: TPanel;
    pnlMarkBckgr_8: TPanel;
    sbMarkNum_9: TSpeedButton;
    sbMarkShow_9: TSpeedButton;
    sbMarkHide_9: TSpeedButton;
    sbMarkText_9: TSpeedButton;
    sbMarkBold_9: TSpeedButton;
    sbMarkItalic_9: TSpeedButton;
    sbMarkUnderline_9: TSpeedButton;
    sbMarkStrikeOut_9: TSpeedButton;
    pnlMarkColor_9: TPanel;
    pnlMarkBckgr_9: TPanel;
    sbMarkNum_10: TSpeedButton;
    sbMarkShow_10: TSpeedButton;
    sbMarkHide_10: TSpeedButton;
    sbMarkText_10: TSpeedButton;
    sbMarkBold_10: TSpeedButton;
    sbMarkItalic_10: TSpeedButton;
    sbMarkUnderline_10: TSpeedButton;
    sbMarkStrikeOut_10: TSpeedButton;
    pnlMarkColor_10: TPanel;
    pnlMarkBckgr_10: TPanel;
    sbMarkNum_11: TSpeedButton;
    sbMarkShow_11: TSpeedButton;
    sbMarkHide_11: TSpeedButton;
    sbMarkText_11: TSpeedButton;
    sbMarkBold_11: TSpeedButton;
    sbMarkItalic_11: TSpeedButton;
    sbMarkUnderline_11: TSpeedButton;
    sbMarkStrikeOut_11: TSpeedButton;
    pnlMarkColor_11: TPanel;
    pnlMarkBckgr_11: TPanel;
    sbMarkNum_12: TSpeedButton;
    sbMarkShow_12: TSpeedButton;
    sbMarkHide_12: TSpeedButton;
    sbMarkText_12: TSpeedButton;
    sbMarkBold_12: TSpeedButton;
    sbMarkItalic_12: TSpeedButton;
    sbMarkUnderline_12: TSpeedButton;
    sbMarkStrikeOut_12: TSpeedButton;
    pnlMarkColor_12: TPanel;
    pnlMarkBckgr_12: TPanel;
    sbMarkNum_13: TSpeedButton;
    sbMarkShow_13: TSpeedButton;
    sbMarkHide_13: TSpeedButton;
    sbMarkText_13: TSpeedButton;
    sbMarkBold_13: TSpeedButton;
    sbMarkItalic_13: TSpeedButton;
    sbMarkUnderline_13: TSpeedButton;
    sbMarkStrikeOut_13: TSpeedButton;
    pnlMarkColor_13: TPanel;
    pnlMarkBckgr_13: TPanel;
    sbMarkNum_14: TSpeedButton;
    sbMarkShow_14: TSpeedButton;
    sbMarkHide_14: TSpeedButton;
    sbMarkText_14: TSpeedButton;
    sbMarkBold_14: TSpeedButton;
    sbMarkItalic_14: TSpeedButton;
    sbMarkUnderline_14: TSpeedButton;
    sbMarkStrikeOut_14: TSpeedButton;
    pnlMarkColor_14: TPanel;
    pnlMarkBckgr_14: TPanel;
    sbMarkNum_15: TSpeedButton;
    sbMarkShow_15: TSpeedButton;
    sbMarkHide_15: TSpeedButton;
    sbMarkText_15: TSpeedButton;
    sbMarkBold_15: TSpeedButton;
    sbMarkItalic_15: TSpeedButton;
    sbMarkUnderline_15: TSpeedButton;
    sbMarkStrikeOut_15: TSpeedButton;
    pnlMarkColor_15: TPanel;
    pnlMarkBckgr_15: TPanel;
    sbMarkNum_16: TSpeedButton;
    sbMarkShow_16: TSpeedButton;
    sbMarkHide_16: TSpeedButton;
    sbMarkText_16: TSpeedButton;
    sbMarkBold_16: TSpeedButton;
    sbMarkItalic_16: TSpeedButton;
    sbMarkUnderline_16: TSpeedButton;
    sbMarkStrikeOut_16: TSpeedButton;
    pnlMarkColor_16: TPanel;
    pnlMarkBckgr_16: TPanel;
    sbMarkNum_17: TSpeedButton;
    sbMarkShow_17: TSpeedButton;
    sbMarkHide_17: TSpeedButton;
    sbMarkText_17: TSpeedButton;
    sbMarkBold_17: TSpeedButton;
    sbMarkItalic_17: TSpeedButton;
    sbMarkUnderline_17: TSpeedButton;
    sbMarkStrikeOut_17: TSpeedButton;
    pnlMarkColor_17: TPanel;
    pnlMarkBckgr_17: TPanel;
    sbMarkNum_18: TSpeedButton;
    sbMarkShow_18: TSpeedButton;
    sbMarkHide_18: TSpeedButton;
    sbMarkText_18: TSpeedButton;
    sbMarkBold_18: TSpeedButton;
    sbMarkItalic_18: TSpeedButton;
    sbMarkUnderline_18: TSpeedButton;
    sbMarkStrikeOut_18: TSpeedButton;
    pnlMarkColor_18: TPanel;
    pnlMarkBckgr_18: TPanel;
    sbMarkNum_19: TSpeedButton;
    sbMarkShow_19: TSpeedButton;
    sbMarkHide_19: TSpeedButton;
    sbMarkText_19: TSpeedButton;
    sbMarkBold_19: TSpeedButton;
    sbMarkItalic_19: TSpeedButton;
    sbMarkUnderline_19: TSpeedButton;
    sbMarkStrikeOut_19: TSpeedButton;
    pnlMarkColor_19: TPanel;
    pnlMarkBckgr_19: TPanel;
    chkMarkDisableStandard: TCheckBox;
    chkMarkEnable_0: TCheckBox;
    sbMarkNum_0: TSpeedButton;
    sbMarkShow_0: TSpeedButton;
    sbMarkHide_0: TSpeedButton;
    sbMarkText_0: TSpeedButton;
    sbMarkBold_0: TSpeedButton;
    sbMarkItalic_0: TSpeedButton;
    sbMarkUnderline_0: TSpeedButton;
    sbMarkStrikeOut_0: TSpeedButton;
    pnlMarkColor_0: TPanel;
    pnlMarkBckgr_0: TPanel;
    btnSetDefaultStyles: TButton;
    chkAutoRecheckErrors: TCheckBox;
    rdoRecheckOnScriptsNo: TRadioButton;
    rdoRecheckOnScriptsMethod1: TRadioButton;
    rdoRecheckOnScriptsMethod2: TRadioButton;
    chkMarkEnable_20: TCheckBox;
    sbMarkNum_20: TSpeedButton;
    sbMarkShow_20: TSpeedButton;
    sbMarkHide_20: TSpeedButton;
    sbMarkText_20: TSpeedButton;
    sbMarkBold_20: TSpeedButton;
    sbMarkItalic_20: TSpeedButton;
    sbMarkUnderline_20: TSpeedButton;
    sbMarkStrikeOut_20: TSpeedButton;
    pnlMarkColor_20: TPanel;
    pnlMarkBckgr_20: TPanel;
    chkCheckUnnecessaryTags: TCheckBox;
    chkFixUnnecessaryTags: TCheckBox;
    chkCheckDashOnFirstLine: TCheckBox;
    chkCheckOnlyIfNoDashOnSecondLine: TCheckBox;
    chkMarkEnable_21: TCheckBox;
    chkMarkOnlyIfNoDashOnSecondLine: TCheckBox;
    chkFixDashOnFirstLine: TCheckBox;
    chkFixOnlyIfNoDashOnSecondLine: TCheckBox;
    sbMarkNum_21: TSpeedButton;
    sbMarkShow_21: TSpeedButton;
    sbMarkHide_21: TSpeedButton;
    sbMarkText_21: TSpeedButton;
    sbMarkBold_21: TSpeedButton;
    sbMarkItalic_21: TSpeedButton;
    sbMarkUnderline_21: TSpeedButton;
    sbMarkStrikeOut_21: TSpeedButton;
    pnlMarkColor_21: TPanel;
    pnlMarkBckgr_21: TPanel;
    chkFixTooLongDur: TCheckBox;
    chkFixTooShortDur: TCheckBox;
    chkFixTooLongLines: TCheckBox;
    chkCheckTooMuchCPS: TCheckBox;
    chkMarkEnable_22: TCheckBox;
    sbMarkNum_22: TSpeedButton;
    sbMarkShow_22: TSpeedButton;
    sbMarkHide_22: TSpeedButton;
    sbMarkText_22: TSpeedButton;
    sbMarkBold_22: TSpeedButton;
    sbMarkItalic_22: TSpeedButton;
    sbMarkUnderline_22: TSpeedButton;
    sbMarkStrikeOut_22: TSpeedButton;
    pnlMarkColor_22: TPanel;
    pnlMarkBckgr_22: TPanel;
    chkFixTooMuchCPS: TCheckBox;
    gbCPS: TGroupBox;
    edtTooMuchCPS: TLabeledEdit;
    udTooMuchCPS: TUpDown;
    lblCharactersPerSecond: TLabel;
    pnlTooMuchCPSColor: TPanel;
    pnlTooMuchCPSBckgr: TPanel;
    chkMarkCPSHintBox: TCheckBox;
    lblNormalCPSColors: TLabel;
    pnlNormalCPSColor: TPanel;
    pnlNormalCPSBckgr: TPanel;
    lblTooMuchCPSColors: TLabel;
    chkPercentageInCPSHintBox: TCheckBox;
    chkCurCPSInCPSHintBox: TCheckBox;
    chkMinTimeInCPSHintBox: TCheckBox;
    chkMaxCharInCPSHintBox: TCheckBox;
    edtTooShortPause: TLabeledEdit;
    udTooShortPause: TUpDown;
    lblMilliseconds4: TLabel;
    chkMarkEnable_23: TCheckBox;
    sbMarkNum_23: TSpeedButton;
    sbMarkShow_23: TSpeedButton;
    sbMarkHide_23: TSpeedButton;
    sbMarkText_23: TSpeedButton;
    sbMarkItalic_23: TSpeedButton;
    sbMarkBold_23: TSpeedButton;
    sbMarkUnderline_23: TSpeedButton;
    sbMarkStrikeOut_23: TSpeedButton;
    pnlMarkColor_23: TPanel;
    pnlMarkBckgr_23: TPanel;
    chkFixTooShortPause: TCheckBox;
    chkCheckTooShortPause: TCheckBox;
    chkCheckDialogueOnOneLine: TCheckBox;
    chkMarkEnable_24: TCheckBox;
    sbMarkNum_24: TSpeedButton;
    sbMarkShow_24: TSpeedButton;
    sbMarkHide_24: TSpeedButton;
    sbMarkText_24: TSpeedButton;
    sbMarkBold_24: TSpeedButton;
    sbMarkItalic_24: TSpeedButton;
    sbMarkUnderline_24: TSpeedButton;
    sbMarkStrikeOut_24: TSpeedButton;
    pnlMarkColor_24: TPanel;
    pnlMarkBckgr_24: TPanel;
    chkFixDialogueOnOneLine: TCheckBox;
    sbMarkPause_0: TSpeedButton;
    sbMarkPause_1: TSpeedButton;
    sbMarkPause_2: TSpeedButton;
    sbMarkPause_3: TSpeedButton;
    sbMarkPause_4: TSpeedButton;
    sbMarkPause_23: TSpeedButton;
    sbMarkPause_5: TSpeedButton;
    sbMarkPause_6: TSpeedButton;
    sbMarkPause_7: TSpeedButton;
    sbMarkPause_8: TSpeedButton;
    sbMarkPause_9: TSpeedButton;
    sbMarkPause_10: TSpeedButton;
    sbMarkPause_11: TSpeedButton;
    sbMarkPause_12: TSpeedButton;
    sbMarkPause_13: TSpeedButton;
    sbMarkPause_14: TSpeedButton;
    sbMarkPause_15: TSpeedButton;
    sbMarkPause_16: TSpeedButton;
    sbMarkPause_21: TSpeedButton;
    sbMarkPause_24: TSpeedButton;
    sbMarkPause_17: TSpeedButton;
    sbMarkPause_18: TSpeedButton;
    sbMarkPause_19: TSpeedButton;
    sbMarkPause_20: TSpeedButton;
    sbMarkPause_22: TSpeedButton;
    sbMarkDur_0: TSpeedButton;
    sbMarkDur_1: TSpeedButton;
    sbMarkDur_2: TSpeedButton;
    sbMarkDur_3: TSpeedButton;
    sbMarkDur_4: TSpeedButton;
    sbMarkDur_23: TSpeedButton;
    sbMarkDur_5: TSpeedButton;
    sbMarkDur_6: TSpeedButton;
    sbMarkDur_7: TSpeedButton;
    sbMarkDur_8: TSpeedButton;
    sbMarkDur_9: TSpeedButton;
    sbMarkDur_10: TSpeedButton;
    sbMarkDur_11: TSpeedButton;
    sbMarkDur_12: TSpeedButton;
    sbMarkDur_13: TSpeedButton;
    sbMarkDur_14: TSpeedButton;
    sbMarkDur_15: TSpeedButton;
    sbMarkDur_16: TSpeedButton;
    sbMarkDur_21: TSpeedButton;
    sbMarkDur_24: TSpeedButton;
    sbMarkDur_17: TSpeedButton;
    sbMarkDur_18: TSpeedButton;
    sbMarkDur_19: TSpeedButton;
    sbMarkDur_20: TSpeedButton;
    sbMarkDur_22: TSpeedButton;
    chkIndicTooSHortPause: TCheckBox;
    pnlIndicTooShortPauseColor: TPanel;
    pnlIndicTooShortPauseBackground: TPanel;
    chkIndicOverlapping: TCheckBox;
    pnlIndicOverlappingColor: TPanel;
    pnlIndicOverlappingBackground: TPanel;
    chkMarkEnable: TCheckBox;
    chkMarkOnLoad: TCheckBox;
    procedure btnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure chkCheckTextBeforeColonClick(Sender: TObject);
    procedure chkFixTextBeforeColonClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    //added by adenry: begin
    procedure ColorPanelsMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,  Y: Integer);
    procedure MarkTextColorPanelsMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,  Y: Integer);
    procedure MarkBckgrColorPanelsMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,  Y: Integer);
    procedure ColorPanelsDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure ColorPanelsDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure ColorPanelsEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure btnSetDefaultStylesClick(Sender: TObject);
    procedure SetDefaultStyles(SetMarkVars: Boolean);
    procedure chkCheckOnlyIfCapitalLettersClick(Sender: TObject);
    procedure chkCheckOnlyIfNoDashOnSecondLineClick(Sender: TObject);
    //added by adenry: end
    function GetDefaultMarkFlags(Index: Integer): TMarkFlags; //added by adenry
  private
    procedure SetLanguage;
  public
    { Public declarations }
    dragMade: Boolean;
    OCRFileEdited: Boolean;
  end;

var
  frmInfoErrorsSettings: TfrmInfoErrorsSettings;

// -----------------------------------------------------------------------------

implementation

uses
  General, InfoErrorsFunctions, OCRScripts, //TreeViewHandle, //TreeViewHandle, OCRScripts added by adenry
  formMain, formInfoErrors; //formInfoErrors added by adenry

{$R *.dfm}

// -----------------------------------------------------------------------------

procedure TfrmInfoErrorsSettings.SetLanguage;
var
  LF: TIniFile;
  i: Integer;
begin
  LF := TIniFile.Create(frmMain.ActualLangFile);
  try
    With LF do
    begin
      Caption                      := ReadString('Information and errors Settings', '01', 'Settings');
      pgeGeneral.Caption           := ReadString('Information and errors Settings', '02', 'General');
      pgeAdvanced.Caption          := ReadString('Information and errors Settings', '03', 'Advanced');
      pgeCheckFor.Caption          := ReadString('Information and errors Settings', '04', 'Check for');
      pgeMark.Caption              := ReadString('Information and errors Settings', '78', 'Mark'); //added by adenry
      pgeFix.Caption               := ReadString('Information and errors Settings', '05', 'Fix');
      pgeUnnecessarySpaces.Caption := ReadString('Information and errors Settings', '06', 'Unnecessary spaces');

      // ---------------------- //
      //      General page      //
      // ---------------------- //
      chkShowConfInMainForm.Caption := ReadString('Information and errors Settings', '07', 'Show confirmations in Main Window on fix');
      chkMarkErrorsInList.Caption   := ReadString('Information and errors Settings', '08', 'Mark errors in Main Window''s list');
      chkMarkEnable.Caption         := ReadString('Information and errors Settings', '08', 'Mark errors in Main Window''s list'); //added by adenry
      chkBold.Caption               := ReadString('Information and errors Settings', '10', 'Bold');
      chkItalic.Caption             := ReadString('Information and errors Settings', '11', 'Italic');
      chkUnderline.Caption          := ReadString('Information and errors Settings', '12', 'Underline');
      chkMarkOnLoad.Caption         := ReadString('Information and errors Settings', '13', 'Mark errors on load subtitle');
      chkFixOnLoad.Caption          := ReadString('Information and errors Settings', '14', 'Fix errors on load subtitle');
      chkFixOneUnitOverlap.Caption  := ReadString('Information and errors Settings', '15', 'Fix one unit overlap at load');
      lblOCRDefFile.Caption         := ReadString('Information and errors Settings', '16', 'OCR Script:');
      btnEdit.Caption               := ReadString('Information and errors Settings', '17', '&Edit');
      // ----
      //added by adenry: begin
      chkAutoRecheckErrors.Caption        := ReadString('Information and errors Settings', '79', 'Automatically recheck errors');
      rdoRecheckOnScriptsNo.Caption       := ReadString('Information and errors Settings', '80', 'Do not recheck on Pascal scripts');
      rdoRecheckOnScriptsMethod1.Caption  := ReadString('Information and errors Settings', '81', 'Recheck all once after a Pascal script executes');
      rdoRecheckOnScriptsMethod2.Caption  := ReadString('Information and errors Settings', '82', 'Recheck on each change made by a Pascal script (might be slow)');
      chkIndicTooLongLines.Caption        := ReadString('Information and errors Settings', '83', 'Indicate too long lines in Text and Translation labels');
      chkIndicTooShortDuration.Caption    := ReadString('Information and errors Settings', '84', 'Indicate too short duration in Duration box');
      chkIndicTooLongDuration.Caption     := ReadString('Information and errors Settings', '85', 'Indicate too long duration in Duration box');
      chkIndicTooSHortPause.Caption       := ReadString('Information and errors Settings', '86', 'Indicate too short pause in Pause box');
      chkIndicOverlapping.Caption         := ReadString('Information and errors Settings', '87', 'Indicate overlapping subtitles in Pause box');
      chkIndicBadValues.Caption           := ReadString('Information and errors Settings', '88', 'Indicate bad values in Show and Hide boxes');
      chkIndicOverTwoLines.Caption        := ReadString('Information and errors Settings', '89', 'Indicate subtitles over two lines in lines counter labels');
      // ----
      pnlIndicTooLongLinesColor.Hint          := ReadString('Information and errors Settings', '90', 'Text color');
      pnlIndicTooShortDurationColor.Hint      := pnlIndicTooLongLinesColor.Hint;
      pnlIndicTooLongDurationColor.Hint       := pnlIndicTooLongLinesColor.Hint;
      pnlIndicTooShortPauseColor.Hint         := pnlIndicTooLongLinesColor.Hint;
      pnlIndicOverlappingColor.Hint           := pnlIndicTooLongLinesColor.Hint;
      pnlIndicBadValuesColor.Hint             := pnlIndicTooLongLinesColor.Hint;
      pnlIndicOverTwoLinesColor.Hint          := pnlIndicTooLongLinesColor.Hint;
      pnlIndicTooLongLinesBackground.Hint     := ReadString('Information and errors Settings', '91', 'Background color');
      pnlIndicTooShortDurationBackground.Hint := pnlIndicTooLongLinesBackground.Hint;
      pnlIndicTooLongDurationBackground.Hint  := pnlIndicTooLongLinesBackground.Hint;
      pnlIndicTooShortPauseBackground.Hint    := pnlIndicTooLongLinesBackground.Hint;
      pnlIndicOverlappingBackground.Hint      := pnlIndicTooLongLinesBackground.Hint;
      pnlIndicBadValuesBackground.Hint        := pnlIndicTooLongLinesBackground.Hint;
      pnlIndicOverTwoLinesBackground.Hint     := pnlIndicTooLongLinesBackground.Hint;
      //added by adenry: end

      // ---------------------- //
      //      Advanced page     //
      // ---------------------- //
      edtRepeatableChars.EditLabel.Caption       := ReadString('Information and errors Settings', '18', 'Repeatable characters:');
      edtProhibitedChars.EditLabel.Caption       := ReadString('Information and errors Settings', '19', 'Prohibited characters:');
      edtToleranceRepeatedSubs.EditLabel.Caption := ReadString('Information and errors Settings', '20', 'Tolerance for repeated subtitles:');
      lblMilliseconds.Caption                    := ReadString('Information and errors Settings', '21', 'milliseconds.');
      edtSpaceAfterChars.EditLabel.Caption       := ReadString('Information and errors Settings', '22', 'Space after characters:');
      edtSpaceBeforeChars.EditLabel.Caption      := ReadString('Information and errors Settings', '23', 'Space before characters:');
      edtTooLongDuration.EditLabel.Caption       := ReadString('Information and errors Settings', '24', 'Too long duration:');
      edtTooShortDuration.EditLabel.Caption      := ReadString('Information and errors Settings', '25', 'Too short duration:');
      edtTooLongLine.EditLabel.Caption           := ReadString('Information and errors Settings', '26', 'Too long line:');
      lblCharacters.Caption                      := ReadString('Information and errors Settings', '27', 'characters.');
      lblMilliseconds2.Caption                   := lblMilliseconds.Caption;
      lblMilliseconds3.Caption                   := lblMilliseconds.Caption;
      // ----
      //added by adenry: begin
      edtTooShortPause.EditLabel.Caption         := ReadString('Information and errors Settings', '92', 'Too short pause under:');
      lblMilliseconds4.Caption                   := lblMilliseconds.Caption;
      gbCPS.Caption                              := ReadString('Information and errors Settings', '93', 'Characters per second (CPS)');
      edtTooMuchCPS.EditLabel.Caption            := ReadString('Information and errors Settings', '94', 'Too many CPS over:');
      lblCharactersPerSecond.Caption             := ReadString('Information and errors Settings', '95', 'characters per second');
      lblNormalCPSColors.Caption                 := ReadString('Information and errors Settings', '96', 'Normal CPS box colors:');
      lblTooMuchCPSColors.Caption                := ReadString('Information and errors Settings', '97', 'Too many CPS box colors:');
      chkPercentageInCPSHintBox.Caption          := ReadString('Information and errors Settings', '98', 'Display percentage in CPS box');
      chkCurCPSInCPSHintBox.Caption              := ReadString('Information and errors Settings', '99', 'Display current CPS in CPS box');
      chkMinTimeInCPSHintBox.Caption             := ReadString('Information and errors Settings', '100', 'Display minimum time in CPS box');
      chkMaxCharInCPSHintBox.Caption             := ReadString('Information and errors Settings', '101', 'Display maximum characters in CPS box');
      pnlNormalCPSColor.Hint                     := pnlIndicTooLongLinesColor.Hint;
      pnlTooMuchCPSColor.Hint                    := pnlIndicTooLongLinesColor.Hint;
      pnlNormalCPSBckgr.Hint                     := pnlIndicTooLongLinesBackground.Hint;
      pnlTooMuchCPSBckgr.Hint                    := pnlIndicTooLongLinesBackground.Hint;
      //added by adenry: end

      // ---------------------- //
      //        Check for       //
      // ---------------------- //
      chkCheckLinesWithoutLetters.Caption     := ReadString('Information and errors Settings', '28', 'Lines without letters');
      chkCheckEmptySubtitles.Caption          := ReadString('Information and errors Settings', '29', 'Empty subtitles');
      // ---
      chkCheckOverlapping.Caption             := ReadString('Information and errors Settings', '30', 'Overlapping subtitles');
      chkCheckBadValues.Caption               := ReadString('Information and errors Settings', '31', 'Bad values');
      chkCheckTooLongDur.Caption              := ReadString('Information and errors Settings', '32', 'Too long durations');
      chkCheckTooShortDur.Caption             := ReadString('Information and errors Settings', '33', 'Too short durations');
      chkCheckTooLongLines.Caption            := ReadString('Information and errors Settings', '34', 'Too long lines');
      chkCheckOverTwoLines.Caption            := ReadString('Information and errors Settings', '35', 'Subtitles over two lines');
      // ---
      chkCheckHearingImpaired.Caption         := ReadString('Information and errors Settings', '36', 'Hearing impaired subtitles');
      chkCheckTextBeforeColon.Caption         := ReadString('Information and errors Settings', '37', 'Text before colon (":")');
      chkCheckOnlyIfCapitalLetters.Caption    := ReadString('Information and errors Settings', '38', 'Only if text is in capital letters');
      chkCheckUnnecessaryDots.Caption         := ReadString('Information and errors Settings', '39', 'Unnecessary dots');
      chkCheckProhibitedChars.Caption         := ReadString('Information and errors Settings', '40', 'Prohibited characters');
      chkCheckRepeatedChars.Caption           := ReadString('Information and errors Settings', '41', 'Repeated characters');
      chkCheckRepeatedSubs.Caption            := ReadString('Information and errors Settings', '42', 'Repeated subtitles');
      chkCheckOCRErrors.Caption               := ReadString('Information and errors Settings', '43', 'OCR Errors');
      // ---
      chkCheckOpnDlgInSubsWithOneLine.Caption := ReadString('Information and errors Settings', '44', '"- " in subtitles with one line');
      chkCheckSpaceAfterCustomChars.Caption   := ReadString('Information and errors Settings', '45', 'Missing spaces after custom characters');
      chkCheckSpaceBeforeCustomChars.Caption  := ReadString('Information and errors Settings', '46', 'Missing spaces before custom characters');
      chkCheckUnnecessarySpaces.Caption       := ReadString('Information and errors Settings', '47', 'Unnecessary spaces');
      // ---
      //added by adenry: begin
      chkCheckTooShortPause.Caption           := ReadString('Information and errors Settings', '57', 'Too short pauses');
      chkCheckDashOnFirstLine.Caption         := ReadString('Information and errors Settings', '58', '"- " on first line');
      chkCheckOnlyIfNoDashOnSecondLine.Caption:= ReadString('Information and errors Settings', '59', 'Only if there is no "- " on second line');
      chkCheckDialogueOnOneLine.Caption       := ReadString('Information and errors Settings', '60', 'Dialogue on one line');
      chkCheckUnnecessaryTags.Caption         := ReadString('Information and errors Settings', '61', 'Unnecessary tags');
      chkCheckTooMuchCPS.Caption              := ReadString('Information and errors Settings', '62', 'Too many characters per second');
      //added by adenry: end

      //added by adenry: begin
      // ----------------------- //
      //           Mark          //
      // ----------------------- //
      chkMarkEnable_0.Caption  := ReadString('Information and errors Settings', '64', 'Default error marking');
      // ---
      chkMarkEnable_1.Caption  := chkCheckLinesWithoutLetters.Caption;
      chkMarkEnable_2.Caption  := chkCheckEmptySubtitles.Caption;
      // ---
      chkMarkEnable_3.Caption  := chkCheckOverlapping.Caption;
      chkMarkEnable_4.Caption  := chkCheckBadValues.Caption;
      chkMarkEnable_5.Caption  := chkCheckTooLongDur.Caption;
      chkMarkEnable_6.Caption  := chkCheckTooShortDur.Caption;
      chkMarkEnable_7.Caption  := chkCheckTooLongLines.Caption;
      chkMarkEnable_8.Caption  := chkCheckOverTwoLines.Caption;
      // ---
      chkMarkEnable_9.Caption  := chkCheckHearingImpaired.Caption;
      chkMarkEnable_10.Caption := chkCheckTextBeforeColon.Caption;
      chkMarkOnlyIfCapitalLetters.Caption := chkCheckOnlyIfCapitalLetters.Caption;
      chkMarkEnable_11.Caption := chkCheckUnnecessaryDots.Caption;
      chkMarkEnable_12.Caption := chkCheckProhibitedChars.Caption;
      chkMarkEnable_13.Caption := chkCheckRepeatedChars.Caption;
      chkMarkEnable_14.Caption := chkCheckRepeatedSubs.Caption;
      chkMarkEnable_15.Caption := chkCheckOCRErrors.Caption;
      // ---
      chkMarkEnable_16.Caption := chkCheckOpnDlgInSubsWithOneLine.Caption;
      chkMarkEnable_17.Caption := chkCheckSpaceAfterCustomChars.Caption;
      chkMarkEnable_18.Caption := chkCheckSpaceBeforeCustomChars.Caption;
      chkMarkEnable_19.Caption := chkCheckUnnecessarySpaces.Caption;
      // ---
      chkMarkEnable_23.Caption := chkCheckTooShortPause.Caption;
      chkMarkEnable_21.Caption := chkCheckDashOnFirstLine.Caption;
      chkMarkOnlyIfNoDashOnSecondLine.Caption := chkCheckOnlyIfNoDashOnSecondLine.Caption;
      chkMarkEnable_24.Caption := chkCheckDialogueOnOneLine.Caption;
      chkMarkEnable_20.Caption := chkCheckUnnecessaryTags.Caption;
      chkMarkEnable_22.Caption := chkCheckTooMuchCPS.Caption;
      chkMarkCPSHintBox.Caption:= ReadString('Information and errors Settings', '63', 'Mark too much CPS with CPS boxes');
      // ---
      btnSetDefaultStyles.Caption := ReadString('Information and errors Settings', '65', 'Set Default Styles');

      //hints:
      for i := 0 to Integer(High(TErrorType))+1 do
      begin
        TSpeedButton(FindComponent('sbMarkNum_'+IntToStr(i))).Hint        := ReadString('Information and errors Settings', '66', 'Mark column "Num"');
        TSpeedButton(FindComponent('sbMarkPause_'+IntToStr(i))).Hint      := ReadString('Information and errors Settings', '67', 'Mark column "Pause"');
        TSpeedButton(FindComponent('sbMarkShow_'+IntToStr(i))).Hint       := ReadString('Information and errors Settings', '68', 'Mark column "Show"');
        TSpeedButton(FindComponent('sbMarkHide_'+IntToStr(i))).Hint       := ReadString('Information and errors Settings', '69', 'Mark column "Hide"');
        TSpeedButton(FindComponent('sbMarkDur_'+IntToStr(i))).Hint        := ReadString('Information and errors Settings', '70', 'Mark column "Duration"');
        TSpeedButton(FindComponent('sbMarkText_'+IntToStr(i))).Hint       := ReadString('Information and errors Settings', '71', 'Mark column "Text"');
        TSpeedButton(FindComponent('sbMarkBold_'+IntToStr(i))).Hint       := ReadString('Information and errors Settings', '72', 'Mark as Bold');
        TSpeedButton(FindComponent('sbMarkItalic_'+IntToStr(i))).Hint     := ReadString('Information and errors Settings', '73', 'Mark as Italic');
        TSpeedButton(FindComponent('sbMarkUnderline_'+IntToStr(i))).Hint  := ReadString('Information and errors Settings', '74', 'Mark as Underline');
        TSpeedButton(FindComponent('sbMarkStrikeOut_'+IntToStr(i))).Hint  := ReadString('Information and errors Settings', '75', 'Mark as Strikethrough');
        TPanel(FindComponent('pnlMarkColor_'+IntToStr(i))).Hint           := ReadString('Information and errors Settings', '76', 'Mark the text color');
        TPanel(FindComponent('pnlMarkBckgr_'+IntToStr(i))).Hint           := ReadString('Information and errors Settings', '77', 'Mark the background color');
      end;
      //added by adenry: end

      // ---------------------- //
      //           Fix          //
      // ---------------------- //
      chkFixLinesWithoutLetters.Caption     := chkCheckLinesWithoutLetters.Caption;
      chkFixEmptySubtitles.Caption          := chkCheckEmptySubtitles.Caption;
      // ---
      chkFixOverlapping.Caption             := chkCheckOverlapping.Caption;
      chkFixBadValues.Caption               := chkCheckBadValues.Caption;
      chkFixOverTwoLines.Caption            := chkCheckOverTwoLines.Caption;
      // ---
      chkFixHearingImpaired.Caption         := chkCheckHearingImpaired.Caption;
      chkFixTextBeforeColon.Caption         := chkCheckTextBeforeColon.Caption;
      chkFixOnlyIfCapitalLetters.Caption    := chkCheckOnlyIfCapitalLetters.Caption;
      chkFixUnnecessaryDots.Caption         := chkCheckUnnecessaryDots.Caption;
      chkFixProhibitedChars.Caption         := chkCheckProhibitedChars.Caption;
      chkFixRepeatedChars.Caption           := chkCheckRepeatedChars.Caption;
      chkFixRepeatedSubs.Caption            := chkCheckRepeatedSubs.Caption;
      chkFixOCRErrors.Caption               := chkCheckOCRErrors.Caption;
      // ---
      chkFixOpnDlgInSubsWithOneLine.Caption := chkCheckOpnDlgInSubsWithOneLine.Caption;
      chkFixSpaceAfterCustomChars.Caption   := chkCheckSpaceAfterCustomChars.Caption;
      chkFixSpaceBeforeCustomChars.Caption  := chkCheckSpaceBeforeCustomChars.Caption;
      chkFixUnnecessarySpaces.Caption       := chkCheckUnnecessarySpaces.Caption;
      // ---
      //added by adenry: begin
      chkFixTooLongDur.Caption              := chkCheckTooLongDur.Caption;
      chkFixTooShortDur.Caption             := chkCheckTooShortDur.Caption;
      chkFixTooLongLines.Caption            := chkCheckTooLongLines.Caption;
      // ---
      chkFixTooShortPause.Caption           := chkCheckTooShortPause.Caption;
      chkFixDashOnFirstLine.Caption         := chkCheckDashOnFirstLine.Caption;
      chkFixOnlyIfNoDashOnSecondLine.Caption:= chkCheckOnlyIfNoDashOnSecondLine.Caption;
      chkFixDialogueOnOneLine.Caption       := chkCheckDialogueOnOneLine.Caption;
      chkFixUnnecessaryTags.Caption         := chkCheckUnnecessaryTags.Caption;
      chkFixTooMuchCPS.Caption              := chkCheckTooMuchCPS.Caption;
      //added by adenry: end

      // ---------------------- //
      //   Unnecessary spaces   //
      // ---------------------- //
      lblCheckFor.Caption := ReadString('Information and errors Settings', '48', 'Check for:');
      lblFix.Caption      := ReadString('Information and errors Settings', '49', 'Fix:');
      lstSpacesToCheck.Clear;
      lstSpacesToFix.Clear;
      lstSpacesToCheck.Items.Add(ReadString('Information and errors Settings', '50', 'Enters and spaces at the beginning and end'));
      lstSpacesToCheck.Items.Add(ReadString('Information and errors Settings', '51', 'Spaces between enters (left and right)'));
      lstSpacesToCheck.Items.Add(ReadString('Information and errors Settings', '52', 'Double spaces and enters'));
      lstSpacesToCheck.Items.Add(ReadString('Information and errors Settings', '53', 'Spaces in front of punctuation marks'));
      lstSpacesToCheck.Items.Add(ReadString('Information and errors Settings', '54', 'Space after "¿" and "¡"'));
      lstSpacesToCheck.Items.Add(ReadString('Information and errors Settings', '55', 'Space before "?" and "!"'));
      lstSpacesToCheck.Items.Add(ReadString('Information and errors Settings', '56', 'Spaces between numbers'));
      lstSpacesToFix.Items := lstSpacesToCheck.Items;

      btnOk.Caption      := BTN_OK;
      btnCancel.Caption  := BTN_CANCEL;

      // ------------------ //
      //      Set font      //
      // ------------------ //
      btnOk.ParentFont := True;
      Font             := frmMain.Font;
      btnOk.Font.Style := frmMain.Font.Style + [fsBold];
    end;
  finally
    LF.Free;
  end
end;

// -----------------------------------------------------------------------------

procedure TfrmInfoErrorsSettings.FormCreate(Sender: TObject);
var
  Ini : TIniFile;
  i,n : Integer; //n added by adenry
begin
  //added by adenry later: this is necessary when using themes (XPManifest)
  for i := 0 to self.ComponentCount - 1 do
    if self.Components[i] is TPanel then
      TPanel(self.Components[i]).ParentBackground := False;

  pgeCtrl.ActivePageIndex := 0;
  SetLanguage;
  Ini := TIniFile.Create(IniRoot);
  try
    if frmMain.mnuOCRScripts.Count > 0 then
    begin
      cmbOCRFiles.Clear;
      // Add OCR Scripts
      for i := 2 to frmMain.mnuOCRScripts.Count-1 do
      begin
        cmbOCRFiles.Items.Add(frmMain.mnuOCRScripts.Items[i].Caption);
        if frmMain.mnuOCRScripts.Items[i].Checked then
          cmbOCRFiles.ItemIndex := i;
      end;
      cmbOCRFiles.ItemIndex := frmMain.cmbOCRScripts.ItemIndex;
    end else
    begin
      lblOCRDefFile.Visible := False;
      cmbOCRFiles.Visible   := False;
      btnEdit.Visible       := False;
    end;
    if (cmbOCRFiles.Items.Count >= 1) and (cmbOCRFiles.ItemIndex = -1) then
      cmbOCRFiles.ItemIndex := 0;
    OCRFileEdited := False; //added by adenry

    // ------------ //
    // General page //                                           
    // ------------ //
    chkShowConfInMainForm.Checked           := Ini.ReadBool('Information and Errors', 'Show confirmations in main form on fix', False);
    chkMarkErrorsInList.Checked             := Ini.ReadBool('Information and Errors', 'Mark errors in main form''s list', True);
    //dlgSetColor.Color                       := Ini.ReadInteger('Information and Errors', 'Mark with color', clRed); //removed by adenry
    pnlMarkErrorsInListColor.Color          := Ini.ReadInteger('Information and Errors', 'Mark with color', pnlMarkErrorsInListColor.Font.Color); //added by adenry
    pnlMarkErrorsInListBackground.Color     := Ini.ReadInteger('Information and Errors', 'Mark with background', pnlMarkErrorsInListBackground.Font.Color); //added by adenry
    chkBold.Checked                         := Ini.ReadBool('Information and Errors', 'Bold', True);
    chkItalic.Checked                       := Ini.ReadBool('Information and Errors', 'Italic', False);
    chkUnderline.Checked                    := Ini.ReadBool('Information and Errors', 'Underline', False);
    chkOriginalTextColor.Checked            := Ini.ReadBool('Information and Errors', 'Use original text color', False); //added by adenry
    chkOnlyIfThereIsAColorTag.Checked       := Ini.ReadBool('Information and Errors', 'Only if there is a color tag', True); //added by adenry
    chkOriginalBackground.Checked           := Ini.ReadBool('Information and Errors', 'Use original background', False); //added by adenry
    chkOriginalTextStyle.Checked            := Ini.ReadBool('Information and Errors', 'Use original text style', True); //added by adenry
    chkFixOnLoad.Checked                    := Ini.ReadBool('Information and Errors', 'Fix errors on load subtitle', False);
    chkAutoRecheckErrors.Checked            := Ini.ReadBool('Information and Errors', 'Automatically recheck errors', True); //added by adenry
    //added by adenry: begin
    if Ini.ReadInteger('Information and Errors', 'Recheck on scripts', 1) = 2 then
      rdoRecheckOnScriptsMethod2.Checked := True else
    if Ini.ReadInteger('Information and Errors', 'Recheck on scripts', 1) = 1 then
      rdoRecheckOnScriptsMethod1.Checked := True else
      rdoRecheckOnScriptsNo.Checked := True;
    //added by adenry: end
    chkFixOneUnitOverlap.Checked            := Ini.ReadBool('Information and Errors', 'Fix one unit overlap at load', False);
    chkIndicTooLongLines.Checked            := Ini.ReadBool('Information and Errors', 'Indicate too long lines', True); //added by adenry
    pnlIndicTooLongLinesColor.Color         := Ini.ReadInteger('Information and Errors', 'Indicate too long lines color', pnlIndicTooLongLinesColor.Font.Color); //added by adenry
    pnlIndicTooLongLinesBackground.Color    := Ini.ReadInteger('Information and Errors', 'Indicate too long lines background', pnlIndicTooLongLinesBackground.Font.Color); //added by adenry
    chkIndicTooShortDuration.Checked        := Ini.ReadBool('Information and Errors', 'Indicate too short duration', True); //added by adenry
    pnlIndicTooShortDurationColor.Color     := Ini.ReadInteger('Information and Errors', 'Indicate too short duration color', pnlIndicTooShortDurationColor.Font.Color); //added by adenry
    pnlIndicTooShortDurationBackground.Color:= Ini.ReadInteger('Information and Errors', 'Indicate too short duration background', pnlIndicTooShortDurationBackground.Font.Color); //added by adenry
    chkIndicTooLongDuration.Checked         := Ini.ReadBool('Information and Errors', 'Indicate too long duration', True); //added by adenry
    pnlIndicTooLongDurationColor.Color      := Ini.ReadInteger('Information and Errors', 'Indicate too long duration color', pnlIndicTooLongDurationColor.Font.Color); //added by adenry
    pnlIndicTooLongDurationBackground.Color := Ini.ReadInteger('Information and Errors', 'Indicate too long duration background', pnlIndicTooLongDurationBackground.Font.Color); //added by adenry
    chkIndicTooShortPause.Checked           := Ini.ReadBool('Information and Errors', 'Indicate too short pause', True); //added by adenry
    pnlIndicTooShortPauseColor.Color        := Ini.ReadInteger('Information and Errors', 'Indicate too short pause color', pnlIndicTooShortPauseColor.Font.Color); //added by adenry
    pnlIndicTooShortPauseBackground.Color   := Ini.ReadInteger('Information and Errors', 'Indicate too short pause background', pnlIndicTooShortPauseBackground.Font.Color); //added by adenry
    chkIndicOverlapping.Checked             := Ini.ReadBool('Information and Errors', 'Indicate overlapping', True); //added by adenry
    pnlIndicOverlappingColor.Color          := Ini.ReadInteger('Information and Errors', 'Indicate overlapping color', pnlIndicOverlappingColor.Font.Color); //added by adenry
    pnlIndicOverlappingBackground.Color     := Ini.ReadInteger('Information and Errors', 'Indicate overlapping background', pnlIndicOverlappingBackground.Font.Color); //added by adenry
    chkIndicBadValues.Checked               := Ini.ReadBool('Information and Errors', 'Indicate bad values', True); //added by adenry
    pnlIndicBadValuesColor.Color            := Ini.ReadInteger('Information and Errors', 'Indicate bad values color', pnlIndicBadValuesColor.Font.Color); //added by adenry
    pnlIndicBadValuesBackground.Color       := Ini.ReadInteger('Information and Errors', 'Indicate bad values background', pnlIndicBadValuesBackground.Font.Color); //added by adenry
    chkIndicOverTwoLines.Checked            := Ini.ReadBool('Information and Errors', 'Indicate over two lines', True); //added by adenry
    pnlIndicOverTwoLinesColor.Color         := Ini.ReadInteger('Information and Errors', 'Indicate over two lines color', pnlIndicOverTwoLinesColor.Font.Color); //added by adenry
    pnlIndicOverTwoLinesBackground.Color    := Ini.ReadInteger('Information and Errors', 'Indicate over two lines background', pnlIndicOverTwoLinesBackground.Font.Color); //added by adenry

    // ------------- //
    // Advanced page //
    // ------------- //
    edtRepeatableChars.Text          := Ini.ReadString('Information and Errors', 'Repeatable chars', '-¡!¿?";\/_[]=');
    edtProhibitedChars.Text          := Ini.ReadString('Information and Errors', 'Prohibited chars', '@#*');
    udToleranceRepeatedSubs.Position := Ini.ReadInteger('Information and Errors', 'Tolerance for repeated subtitles', 100);
    edtSpaceAfterChars.Text          := Ini.ReadString('Information and Errors', 'Space after characters', '-');
    edtSpaceBeforeChars.Text         := Ini.ReadString('Information and Errors', 'Space before characters', '');
    udTooLongDur.Position            := Ini.ReadInteger('Information and Errors', 'Too long duration', 7000);
    udTooShortDur.Position           := Ini.ReadInteger('Information and Errors', 'Too short duration', 1000);
    udTooLongLine.Position           := Ini.ReadInteger('Information and Errors', 'Too long line', 45);
    udTooShortPause.Position         := Ini.ReadInteger('Information and Errors', 'Too short pause', 200); //added by adenry
    udTooMuchCPS.Position            := Ini.ReadInteger('Information and Errors', 'Too much CPS', 20); //added by adenry
    pnlNormalCPSColor.Color          := Ini.ReadInteger('Information and Errors', 'Normal CPS Color', pnlNormalCPSColor.Font.Color); //added by adenry
    pnlNormalCPSBckgr.Color          := Ini.ReadInteger('Information and Errors', 'Normal CPS Background', pnlNormalCPSBckgr.Font.Color); //added by adenry
    pnlTooMuchCPSColor.Color         := Ini.ReadInteger('Information and Errors', 'Too much CPS Color', pnlTooMuchCPSColor.Font.Color); //added by adenry
    pnlTooMuchCPSBckgr.Color         := Ini.ReadInteger('Information and Errors', 'Too much CPS Background', pnlTooMuchCPSBckgr.Font.Color); //added by adenry
    chkPercentageInCPSHintBox.Checked:= Ini.ReadBool('Information and Errors', 'Percantage in CPS hint box', True); //added by adenry
    chkCurCPSInCPSHintBox.Checked    := Ini.ReadBool('Information and Errors', 'Current CPS in CPS hint box', False); //added by adenry
    chkMinTimeInCPSHintBox.Checked   := Ini.ReadBool('Information and Errors', 'Minimum time in CPS hint box', True); //added by adenry
    chkMaxCharInCPSHintBox.Checked   := Ini.ReadBool('Information and Errors', 'Maximum characters in CPS hint box', True); //added by adenry

    // ------------------- //
    // Errors to check for //
    // ------------------- //
    chkCheckLinesWithoutLetters.Checked     := Ini.ReadBool('Errors to check for', 'Lines without letters',                   True);
    chkCheckEmptySubtitles.Checked          := Ini.ReadBool('Errors to check for', 'Empty subtitles',                         True);
    chkCheckOverlapping.Checked             := Ini.ReadBool('Errors to check for', 'Overlapping subtitles',                   True);
    chkCheckBadValues.Checked               := Ini.ReadBool('Errors to check for', 'Bad values',                              True);
    chkCheckTooShortPause.Checked           := Ini.ReadBool('Errors to check for', 'Too short pause',                         True);//added by adenry
    chkCheckTooLongDur.Checked              := Ini.ReadBool('Errors to check for', 'Too long durations',                      True);
    chkCheckTooShortDur.Checked             := Ini.ReadBool('Errors to check for', 'Too short durations',                     True);
    chkCheckTooLongLines.Checked            := Ini.ReadBool('Errors to check for', 'Too long lines',                          True);
    chkCheckOverTwoLines.Checked            := Ini.ReadBool('Errors to check for', 'Subtitles over two lines',                True);
    chkCheckHearingImpaired.Checked         := Ini.ReadBool('Errors to check for', 'Hearing impaired subtitles',              True);
    chkCheckTextBeforeColon.Checked         := Ini.ReadBool('Errors to check for', 'Text before colon (":")',                 True);
    chkCheckOnlyIfCapitalLetters.Checked    := Ini.ReadBool('Errors to check for', 'Only if text is in capital letters',      True);
    chkMarkOnlyIfCapitalLetters.Checked     := chkCheckOnlyIfCapitalLetters.Checked; //added by adenry
    chkCheckUnnecessaryDots.Checked         := Ini.ReadBool('Errors to check for', 'Unnecessary dots',                        True);
    chkCheckProhibitedChars.Checked         := Ini.ReadBool('Errors to check for', 'Prohibited characters',                   False);
    chkCheckRepeatedChars.Checked           := Ini.ReadBool('Errors to check for', 'Repeated characters',                     True);
    chkCheckRepeatedSubs.Checked            := Ini.ReadBool('Errors to check for', 'Repeated subtitles',                      True);
    chkCheckOCRErrors.Checked               := Ini.ReadBool('Errors to check for', 'OCR Errors',                              True);
    chkCheckOpnDlgInSubsWithOneLine.Checked := Ini.ReadBool('Errors to check for', '"- " in subtitles with one line',         True);
    chkCheckDashOnFirstLine.Checked         := Ini.ReadBool('Errors to check for', '"- " on first line',                      True);//added by adenry
    chkCheckOnlyIfNoDashOnSecondLine.Checked:= Ini.ReadBool('Errors to check for', 'Only if there is no "- " on second line', True);//added by adenry
    chkMarkOnlyIfNoDashOnSecondLine.Checked := chkCheckOnlyIfNoDashOnSecondLine.Checked; //added by adenry
    chkCheckDialogueOnOneLine.Checked       := Ini.ReadBool('Errors to check for', 'Dialogue on one line',                    True);//added by adenry
    chkCheckSpaceAfterCustomChars.Checked   := Ini.ReadBool('Errors to check for', 'Space after custom characters',           True);
    chkCheckSpaceBeforeCustomChars.Checked  := Ini.ReadBool('Errors to check for', 'Space before custom characters',          False);
    chkCheckUnnecessarySpaces.Checked       := Ini.ReadBool('Errors to check for', 'Unnecessary spaces',                      True);
    chkCheckUnnecessaryTags.Checked         := Ini.ReadBool('Errors to check for', 'Unnecessary tags',                        True);//added by adenry
    chkCheckTooMuchCPS.Checked              := Ini.ReadBool('Errors to check for', 'Too much CPS',                            True);//added by adenry

    //added by adenry: begin
    // -------------- //
    // Errors to mark //
    // -------------- //

    n := 1;
    for i := 0 to Integer(High(TErrorType))+1 do
    begin
      TSpeedButton(FindComponent('sbMarkNum_'+IntToStr(i))).GroupIndex        := n; Inc(n);
      TSpeedButton(FindComponent('sbMarkPause_'+IntToStr(i))).GroupIndex      := n; Inc(n);
      TSpeedButton(FindComponent('sbMarkShow_'+IntToStr(i))).GroupIndex       := n; Inc(n);
      TSpeedButton(FindComponent('sbMarkHide_'+IntToStr(i))).GroupIndex       := n; Inc(n);
      TSpeedButton(FindComponent('sbMarkDur_'+IntToStr(i))).GroupIndex        := n; Inc(n);
      TSpeedButton(FindComponent('sbMarkText_'+IntToStr(i))).GroupIndex       := n; Inc(n);
      TSpeedButton(FindComponent('sbMarkBold_'+IntToStr(i))).GroupIndex       := n; Inc(n);
      TSpeedButton(FindComponent('sbMarkItalic_'+IntToStr(i))).GroupIndex     := n; Inc(n);
      TSpeedButton(FindComponent('sbMarkUnderline_'+IntToStr(i))).GroupIndex  := n; Inc(n);
      TSpeedButton(FindComponent('sbMarkStrikeOut_'+IntToStr(i))).GroupIndex  := n; Inc(n);
    end;

    chkMarkEnable.Checked := Ini.ReadBool('Errors to mark', 'Enabled', True);
    chkMarkOnLoad.Checked := Ini.ReadBool('Information and Errors', 'Mark errors on load subtitle', False); //moved here by adenry
    //chkMarkDisableStandard.Checked := Ini.ReadBool('Errors to mark', 'Disable standard marking', True);
    for i := 0 to Integer(High(TErrorType))+1 do
    begin
      //MarkFlags[i] := TMarkFlags(Word(Ini.ReadInteger('Errors to mark', 'Mark flags ' + IntToStr(i), 0)));
      //MarkColors[i] := Ini.ReadInteger('Errors to mark', 'Mark color ' + IntToStr(i), TPanel(FindComponent('pnlMarkColor_'+IntToStr(i))).Font.Color);
      //MarkBackgrounds[i] := Ini.ReadInteger('Errors to mark', 'Mark background ' + IntToStr(i), TPanel(FindComponent('pnlMarkBckgr_'+IntToStr(i))).Font.Color);

      TCheckBox(FindComponent('chkMarkEnable_'+IntToStr(i))).Checked := mfEnabled in MarkFlags[i];
      TSpeedButton(FindComponent('sbMarkNum_'+IntToStr(i))).Down := mfColNum in MarkFlags[i];
      TSpeedButton(FindComponent('sbMarkPause_'+IntToStr(i))).Down := mfColPause in MarkFlags[i];
      TSpeedButton(FindComponent('sbMarkShow_'+IntToStr(i))).Down := mfColShow in MarkFlags[i];
      TSpeedButton(FindComponent('sbMarkHide_'+IntToStr(i))).Down := mfColHide in MarkFlags[i];
      TSpeedButton(FindComponent('sbMarkDur_'+IntToStr(i))).Down := mfColDur in MarkFlags[i];
      TSpeedButton(FindComponent('sbMarkText_'+IntToStr(i))).Down := mfColText in MarkFlags[i];
      TSpeedButton(FindComponent('sbMarkBold_'+IntToStr(i))).Down := mfBold in MarkFlags[i];
      TSpeedButton(FindComponent('sbMarkItalic_'+IntToStr(i))).Down := mfItalic in MarkFlags[i];
      TSpeedButton(FindComponent('sbMarkUnderline_'+IntToStr(i))).Down := mfUnderline in MarkFlags[i];
      TSpeedButton(FindComponent('sbMarkStrikeOut_'+IntToStr(i))).Down := mfStrikeOut in MarkFlags[i];

      TPanel(FindComponent('pnlMarkColor_'+IntToStr(i))).Color := Ini.ReadInteger('Errors to mark', 'Mark color ' + IntToStr(i), TPanel(FindComponent('pnlMarkColor_'+IntToStr(i))).Font.Color);
      TPanel(FindComponent('pnlMarkBckgr_'+IntToStr(i))).Color := Ini.ReadInteger('Errors to mark', 'Mark background ' + IntToStr(i), TPanel(FindComponent('pnlMarkBckgr_'+IntToStr(i))).Font.Color);
    end;
    chkMarkCPSHintBox.Checked     := Ini.ReadBool('Errors to mark', 'Mark CPS hint box', True);//added by adenry
    //added by adenry: end

    // ------------- //
    // Errors to fix //
    // ------------- //
    chkFixLinesWithoutLetters.Checked     := Ini.ReadBool('Errors to fix', 'Lines without letters',                   True);
    chkFixEmptySubtitles.Checked          := Ini.ReadBool('Errors to fix', 'Empty subtitles',                         True);
    chkFixOverlapping.Checked             := Ini.ReadBool('Errors to fix', 'Overlapping subtitles',                   True);
    chkFixBadValues.Checked               := Ini.ReadBool('Errors to fix', 'Bad values',                              True);
  //chkFixTooShortPause.Checked           := Ini.ReadBool('Errors to fix', 'Too short pause',                         True);//added by adenry
  //chkFixTooLongDur.Checked              := Ini.ReadBool('Errors to fix', 'Too long durations',                      True);//added by adenry
  //chkFixTooShortDur.Checked             := Ini.ReadBool('Errors to fix', 'Too short durations',                     True);//added by adenry
  //chkFixTooLongLines.Checked            := Ini.ReadBool('Errors to fix', 'Too long lines',                          True);//added by adenry
    chkFixOverTwoLines.Checked            := Ini.ReadBool('Errors to fix', 'Subtitles over two lines',                True);
    chkFixHearingImpaired.Checked         := Ini.ReadBool('Errors to fix', 'Hearing impaired subtitles',              True);
    chkFixTextBeforeColon.Checked         := Ini.ReadBool('Errors to fix', 'Text before colon (":")',                 True);
    chkFixOnlyIfCapitalLetters.Checked    := Ini.ReadBool('Errors to fix', 'Only if text is in capital letters',      True);
    chkFixUnnecessaryDots.Checked         := Ini.ReadBool('Errors to fix', 'Unnecessary dots',                        True);
    chkFixProhibitedChars.Checked         := Ini.ReadBool('Errors to fix', 'Prohibited characters',                   False);
    chkFixRepeatedChars.Checked           := Ini.ReadBool('Errors to fix', 'Repeated characters',                     True);
    chkFixRepeatedSubs.Checked            := Ini.ReadBool('Errors to fix', 'Repeated subtitles',                      True);
    chkFixOCRErrors.Checked               := Ini.ReadBool('Errors to fix', 'OCR Errors',                              True);
    chkFixOpnDlgInSubsWithOneLine.Checked := Ini.ReadBool('Errors to fix', '"-" in subtitles with one line',          False);
    chkFixDashOnFirstLine.Checked         := Ini.ReadBool('Errors to fix', '"-" on first line',                       True); //added by adenry
    chkFixOnlyIfNoDashOnSecondLine.Checked:= Ini.ReadBool('Errors to fix', 'Only if there is no "- " on second line', True); //added by adenry
    chkFixDialogueOnOneLine.Checked       := Ini.ReadBool('Errors to fix', 'Dialogue on one line',                    True); //added by adenry
    chkFixSpaceAfterCustomChars.Checked   := Ini.ReadBool('Errors to fix', 'Space after custom characters',           True);
    chkFixSpaceBeforeCustomChars.Checked  := Ini.ReadBool('Errors to fix', 'Space before custom characters',          False);
    chkFixUnnecessarySpaces.Checked       := Ini.ReadBool('Errors to fix', 'Unnecessary spaces',                      True);
    chkFixUnnecessaryTags.Checked         := Ini.ReadBool('Errors to fix', 'Unnecessary tags',                        True);//added by adenry
  //chkFixTooMuchCPS.Checked              := Ini.ReadBool('Errors to fix', 'Too much CPS',                            True);//added by adenry

    // --------------------------- //
    // Unnecessary spaces to check //
    // --------------------------- //
    lstSpacesToCheck.Checked[0] := Ini.ReadBool('Unnecessary spaces to check for', 'Enters and spaces at the beginning and end', True);
    lstSpacesToCheck.Checked[1] := Ini.ReadBool('Unnecessary spaces to check for', 'Spaces between enters (left and right)',     True);
    lstSpacesToCheck.Checked[2] := Ini.ReadBool('Unnecessary spaces to check for', 'Double spaces and enters',                   True);
    lstSpacesToCheck.Checked[3] := Ini.ReadBool('Unnecessary spaces to check for', 'Spaces in front of punctuation marks',       True);
    lstSpacesToCheck.Checked[4] := Ini.ReadBool('Unnecessary spaces to check for', 'Spaces after "¿" and "¡"',                   True);
    lstSpacesToCheck.Checked[5] := Ini.ReadBool('Unnecessary spaces to check for', 'Spaces before "?" and  "!"',                 True);
    lstSpacesToCheck.Checked[6] := Ini.ReadBool('Unnecessary spaces to check for', 'Spaces between numbers',                     True);

    // ------------------------- //
    // Unnecessary spaces to fix //
    // ------------------------- //
    lstSpacesToFix.Checked[0] := Ini.ReadBool('Unnecessary spaces to fix', 'Enters and spaces at the beginning and end', True);
    lstSpacesToFix.Checked[1] := Ini.ReadBool('Unnecessary spaces to fix', 'Spaces between enters (left and right)',     True);
    lstSpacesToFix.Checked[2] := Ini.ReadBool('Unnecessary spaces to fix', 'Double spaces and enters',                   True);
    lstSpacesToFix.Checked[3] := Ini.ReadBool('Unnecessary spaces to fix', 'Spaces in front of punctuation marks',       True);
    lstSpacesToFix.Checked[4] := Ini.ReadBool('Unnecessary spaces to fix', 'Spaces after "¿" and "¡"',                   True);
    lstSpacesToFix.Checked[5] := Ini.ReadBool('Unnecessary spaces to fix', 'Spaces before "?" and  "!"',                 True);
    lstSpacesToFix.Checked[6] := Ini.ReadBool('Unnecessary spaces to fix', 'Spaces between numbers',                     True);

    chkCheckTextBeforeColonClick(Sender);
    chkFixTextBeforeColonClick(Sender);
  finally
    Ini.Free;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmInfoErrorsSettings.btnOkClick(Sender: TObject);
var
  Ini: TMemIniFile; //TIniFile replaced with TMemIniFile by adenry
  i: Integer; //added by adenry
begin
Screen.Cursor := crHourGlass; //added by adenry
try
  Ini := TMemIniFile.Create(IniRoot); //TIniFile replaced with TMemIniFile by adenry
  try
    // ------------ //
    // General page //
    // ------------ //
    Ini.WriteBool('Information and Errors', 'Show confirmations in main form on fix', chkShowConfInMainForm.Checked);
    Ini.WriteBool('Information and Errors', 'Mark errors in main form''s list', chkMarkEnable.Checked); //added by adenry
    //Ini.WriteBool('Information and Errors', 'Mark errors in main form''s list', chkMarkErrorsInList.Checked);
    Ini.WriteBool('Information and Errors', 'Mark errors on load subtitle', chkMarkOnLoad.Checked); //moved here by adenry
    //Ini.WriteInteger('Information and Errors', 'Mark with color', pnlMarkErrorsInListColor.Color); //dlgSetColor changed to pnlMarkErrorsInListColor by adenry
    //Ini.WriteInteger('Information and Errors', 'Mark with background', pnlMarkErrorsInListBackground.Color); //added by adenry
    //Ini.WriteBool('Information and Errors', 'Bold', chkBold.Checked);
    //Ini.WriteBool('Information and Errors', 'Italic', chkItalic.Checked);
    //Ini.WriteBool('Information and Errors', 'Underline', chkUnderline.Checked);
    //Ini.WriteBool('Information and Errors', 'Use original text color', chkOriginalTextColor.Checked); //added by adenry
    //Ini.WriteBool('Information and Errors', 'Only if there is a color tag', chkOnlyIfThereIsAColorTag.Checked); //added by adenry
    //Ini.WriteBool('Information and Errors', 'Use original background', chkOriginalBackground.Checked); //added by adenry
    //Ini.WriteBool('Information and Errors', 'Use original text style', chkOriginalTextStyle.Checked); //added by adenry
    Ini.WriteBool('Information and Errors', 'Fix errors on load subtitle', chkFixOnLoad.Checked);
    Ini.WriteBool('Information and Errors', 'Automatically recheck errors', chkAutoRecheckErrors.Checked); //added by adenry
    //added by adenry: begin
    if rdoRecheckOnScriptsMethod2.Checked then
      frmMain.AutoRecheckOnScripts := 2 else
    if rdoRecheckOnScriptsMethod1.Checked then
      frmMain.AutoRecheckOnScripts := 1 else
      frmMain.AutoRecheckOnScripts := 0;
    Ini.WriteInteger('Information and Errors', 'Recheck on scripts', frmMain.AutoRecheckOnScripts);
    //added by adenry: end
    Ini.WriteBool('Information and Errors', 'Fix one unit overlap at load', chkFixOneUnitOverlap.Checked);
    Ini.WriteBool('Information and Errors', 'Indicate too long lines', chkIndicTooLongLines.Checked); //added by adenry
    Ini.WriteInteger('Information and Errors', 'Indicate too long lines color', pnlIndicTooLongLinesColor.Color); //added by adenry
    Ini.WriteInteger('Information and Errors', 'Indicate too long lines background', pnlIndicTooLongLinesBackground.Color); //added by adenry
    Ini.WriteBool('Information and Errors', 'Indicate too short duration', chkIndicTooShortDuration.Checked); //added by adenry
    Ini.WriteInteger('Information and Errors', 'Indicate too short duration color', pnlIndicTooShortDurationColor.Color); //added by adenry
    Ini.WriteInteger('Information and Errors', 'Indicate too short duration background', pnlIndicTooShortDurationBackground.Color); //added by adenry
    Ini.WriteBool('Information and Errors', 'Indicate too long duration', chkIndicTooLongDuration.Checked); //added by adenry
    Ini.WriteInteger('Information and Errors', 'Indicate too long duration color', pnlIndicTooLongDurationColor.Color); //added by adenry
    Ini.WriteInteger('Information and Errors', 'Indicate too long duration background', pnlIndicTooLongDurationBackground.Color); //added by adenry
    Ini.WriteBool('Information and Errors', 'Indicate too short pause', chkIndicTooSHortPause.Checked); //added by adenry
    Ini.WriteInteger('Information and Errors', 'Indicate too short pause color', pnlIndicTooShortPauseColor.Color); //added by adenry
    Ini.WriteInteger('Information and Errors', 'Indicate too short pause background', pnlIndicTooShortPauseBackground.Color); //added by adenry
    Ini.WriteBool('Information and Errors', 'Indicate overlapping', chkIndicOverlapping.Checked); //added by adenry
    Ini.WriteInteger('Information and Errors', 'Indicate overlapping color', pnlIndicOverlappingColor.Color); //added by adenry
    Ini.WriteInteger('Information and Errors', 'Indicate overlapping background', pnlIndicOverlappingBackground.Color); //added by adenry
    Ini.WriteBool('Information and Errors', 'Indicate bad values', chkIndicBadValues.Checked); //added by adenry
    Ini.WriteInteger('Information and Errors', 'Indicate bad values color', pnlIndicBadValuesColor.Color); //added by adenry
    Ini.WriteInteger('Information and Errors', 'Indicate bad values background', pnlIndicBadValuesBackground.Color); //added by adenry
    Ini.WriteBool('Information and Errors', 'Indicate over two lines', chkIndicOverTwoLines.Checked); //added by adenry
    Ini.WriteInteger('Information and Errors', 'Indicate over two lines color', pnlIndicOverTwoLinesColor.Color); //added by adenry
    Ini.WriteInteger('Information and Errors', 'Indicate over two lines background', pnlIndicOverTwoLinesBackground.Color); //added by adenry
    ShowConfMainForm            := chkShowConfInMainForm.Checked;
    AdvancedErrorMarking        := chkMarkEnable.Checked; //added by adenry
    //MarkErrorsInList            := chkMarkErrorsInList.Checked;
    MarkOnLoad                  := chkMarkOnLoad.Checked; //moved here by adenry
    //MarkWithColor               := pnlMarkErrorsInListColor.Color; //dlgSetColor changed to pnlMarkErrorsInListColor by adenry
    //MarkWithBackground          := pnlMarkErrorsInListBackground.Color; //added by adenry
    //MarkBold                    := chkBold.Checked;
    //MarkItalic                  := chkItalic.Checked;
    //MarkUnderline               := chkUnderline.Checked;
    //UseOriginalTextColor        := chkOriginalTextColor.Checked; //added by adenry
    //OnlyIfThereIsAColorTag      := chkOnlyIfThereIsAColorTag.Checked; //added by adenry
    //UseOriginalBackground       := chkOriginalBackground.Checked; //added by adenry
    //UseOriginalTextStyle        := chkOriginalTextStyle.Checked; //added by adenry
    frmMain.AutoRecheckErrors   := chkAutoRecheckErrors.Checked; //added by adenry
    FixOnLoad                   := chkFixOnLoad.Checked;
    FixOneUnitOverlap           := chkFixOneUnitOverlap.Checked;
    IndicTooLongLines           := chkIndicTooLongLines.Checked; //added by adenry
    TooLongLinesColor           := pnlIndicTooLongLinesColor.Color; //added by adenry
    TooLongLinesBackground      := pnlIndicTooLongLinesBackground.Color; //added by adenry
    IndicTooShortDuration       := chkIndicTooShortDuration.Checked; //added by adenry
    TooShortDurationColor       := pnlIndicTooShortDurationColor.Color; //added by adenry
    TooShortDurationBackground  := pnlIndicTooShortDurationBackground.Color; //added by adenry
    IndicTooLongDuration        := chkIndicTooLongDuration.Checked; //added by adenry
    TooLongDurationColor        := pnlIndicTooLongDurationColor.Color; //added by adenry
    TooLongDurationBackground   := pnlIndicTooLongDurationBackground.Color; //added by adenry
    IndicTooShortPause          := chkIndicTooShortPause.Checked; //added by adenry
    TooShortPauseColor          := pnlIndicTooShortPauseColor.Color; //added by adenry
    TooShortPauseBackground     := pnlIndicTooShortPauseBackground.Color; //added by adenry
    IndicOverlapping            := chkIndicOverlapping.Checked; //added by adenry
    OverlappingColor            := pnlIndicOverlappingColor.Color; //added by adenry
    OverlappingBackground       := pnlIndicOverlappingBackground.Color; //added by adenry   
    IndicBadValues              := chkIndicBadValues.Checked; //added by adenry
    BadValuesColor              := pnlIndicBadValuesColor.Color; //added by adenry
    BadValuesBackground         := pnlIndicBadValuesBackground.Color; //added by adenry
    IndicOverTwoLines           := chkIndicOverTwoLines.Checked; //added by adenry
    OverTwoLinesColor           := pnlIndicOverTwoLinesColor.Color; //added by adenry
    OverTwoLinesBackground      := pnlIndicOverTwoLinesBackground.Color; //added by adenry

    if cmbOCRFiles.Items.Count > 0 then
    if ( ((cmbOCRFiles.ItemIndex <> frmMain.cmbOCRScripts.ItemIndex) or (OCRFileEdited)) and (ErrorsToCheck.eOCRErrors or ErrorsToFix.eOCRErrors) ) or  //if the script file was edited or another script file was selected, and OCR Check/Fix is turned on //added by adenry
       ( ((ErrorsToCheck.eOCRErrors = False) and (ErrorsToFix.eOCRErrors = False)) and ((chkCheckOCRErrors.Checked) or (chkFixOCRErrors.Checked)) ) then //if OCR Check/Fix was just turned on //added by adenry
    begin
      OCRDefFile := ExtractFilePath(Application.ExeName) + 'OCRScripts\' + cmbOCRFiles.Items[cmbOCRFiles.ItemIndex] + ID_OCREXT;
      Ini.WriteString('Information and Errors', 'OCR Definitions file', OCRDefFile);
      frmMain.mnuOCRScripts.Items[cmbOCRFiles.ItemIndex].Checked := True;
      frmMain.cmbOCRScripts.ItemIndex := cmbOCRFiles.ItemIndex;
      //added by adenry later:
      if ((chkCheckOCRErrors.Checked) or (chkFixOCRErrors.Checked)) and (FileExists(OCRDefFile)) then
        ParseOCRErrors(OCRDefFile);
    end;
    OCRFileEdited := False; //added by adenry

    // ------------- //
    // Advanced page //
    // ------------- //
    Ini.WriteString('Information and Errors', 'Repeatable chars', edtRepeatableChars.Text);
    Ini.WriteString('Information and Errors', 'Prohibited chars', edtProhibitedChars.Text);
    Ini.WriteInteger('Information and Errors', 'Tolerance for repeated subtitles', udToleranceRepeatedSubs.Position);
    Ini.WriteString('Information and Errors', 'Space after characters', edtSpaceAfterChars.Text);
    Ini.WriteString('Information and Errors', 'Space before characters', edtSpaceBeforeChars.Text);
    Ini.WriteInteger('Information and Errors', 'Too long duration', udTooLongDur.Position);
    Ini.WriteInteger('Information and Errors', 'Too short duration', udTooShortDur.Position);
    Ini.WriteInteger('Information and Errors', 'Too long line', udTooLongLine.Position);
    Ini.WriteInteger('Information and Errors', 'Too short pause', udTooShortPause.Position);//added by adenry
    Ini.WriteInteger('Information and Errors', 'Too much CPS', udTooMuchCPS.Position);//added by adenry
    Ini.WriteInteger('Information and Errors', 'Normal CPS Color', pnlNormalCPSColor.Color);//added by adenry
    Ini.WriteInteger('Information and Errors', 'Normal CPS Background', pnlNormalCPSBckgr.Color);//added by adenry
    Ini.WriteInteger('Information and Errors', 'Too much CPS Color', pnlTooMuchCPSColor.Color);//added by adenry
    Ini.WriteInteger('Information and Errors', 'Too much CPS Background', pnlTooMuchCPSBckgr.Color);//added by adenry
    Ini.WriteBool('Information and Errors', 'Percantage in CPS hint box', chkPercentageInCPSHintBox.Checked);//added by adenry
    Ini.WriteBool('Information and Errors', 'Current CPS in CPS hint box', chkCurCPSInCPSHintBox.Checked);//added by adenry
    Ini.WriteBool('Information and Errors', 'Minimum time in CPS hint box', chkMinTimeInCPSHintBox.Checked);//added by adenry
    Ini.WriteBool('Information and Errors', 'Maximum characters in CPS hint box', chkMaxCharInCPSHintBox.Checked);//added by adenry
    RepeatableChars         := edtRepeatableChars.Text;
    ProhibitedChars         := edtProhibitedChars.Text;
    ToleranceForRepeated    := udToleranceRepeatedSubs.Position;
    SpaceAfterChars         := edtSpaceAfterChars.Text;
    SpaceBeforeChars        := edtSpaceBeforeChars.Text;
    TooLongDuration         := udTooLongDur.Position;
    TooShortDuration        := udTooShortDur.Position;
    TooLongLine             := udTooLongLine.Position;
    TooShortPause           := udTooShortPause.Position;//added by adenry
    TooMuchCPS              := udTooMuchCPS.Position;//added by adenry
    NormalCPSColor          := pnlNormalCPSColor.Color;//added by adenry
    NormalCPSBckgr          := pnlNormalCPSBckgr.Color;//added by adenry
    TooMuchCPSColor         := pnlTooMuchCPSColor.Color;//added by adenry
    TooMuchCPSBckgr         := pnlTooMuchCPSBckgr.Color;//added by adenry
    PercentageInCPSHintBox  := chkPercentageInCPSHintBox.Checked;//added by adenry
    CurCPSInCPSHintBox      := chkCurCPSInCPSHintBox.Checked;//added by adenry
    MinTimeInCPSHintBox     := chkMinTimeInCPSHintBox.Checked;//added by adenry
    MaxCharInCPSHintBox     := chkMaxCharInCPSHintBox.Checked;//added by adenry

    // ------------------- //
    // Errors to check for //
    // ------------------- //
    Ini.WriteBool('Errors to check for', 'Lines without letters',                   chkCheckLinesWithoutLetters.Checked);
    Ini.WriteBool('Errors to check for', 'Empty subtitles',                         chkCheckEmptySubtitles.Checked);
    Ini.WriteBool('Errors to check for', 'Overlapping subtitles',                   chkCheckOverlapping.Checked);
    Ini.WriteBool('Errors to check for', 'Bad values',                              chkCheckBadValues.Checked);
    Ini.WriteBool('Errors to check for', 'Too short pause',                         chkCheckTooShortPause.Checked);//added by adenry
    Ini.WriteBool('Errors to check for', 'Too long durations',                      chkCheckTooLongDur.Checked);
    Ini.WriteBool('Errors to check for', 'Too short durations',                     chkCheckTooShortDur.Checked);
    Ini.WriteBool('Errors to check for', 'Too long lines',                          chkCheckTooLongLines.Checked);
    Ini.WriteBool('Errors to check for', 'Subtitles over two lines',                chkCheckOverTwoLines.Checked);
    Ini.WriteBool('Errors to check for', 'Hearing impaired subtitles',              chkCheckHearingImpaired.Checked);
    Ini.WriteBool('Errors to check for', 'Text before colon (":")',                 chkCheckTextBeforeColon.Checked);
    Ini.WriteBool('Errors to check for', 'Only if text is in capital letters',      chkCheckOnlyIfCapitalLetters.Checked);
    Ini.WriteBool('Errors to check for', 'Unnecessary dots',                        chkCheckUnnecessaryDots.Checked);
    Ini.WriteBool('Errors to check for', 'Prohibited characters',                   chkCheckProhibitedChars.Checked);
    Ini.WriteBool('Errors to check for', 'Repeated characters',                     chkCheckRepeatedChars.Checked);
    Ini.WriteBool('Errors to check for', 'Repeated subtitles',                      chkCheckRepeatedSubs.Checked);
    Ini.WriteBool('Errors to check for', 'OCR Errors',                              chkCheckOCRErrors.Checked);
    Ini.WriteBool('Errors to check for', '"- " in subtitles with one line',         chkCheckOpnDlgInSubsWithOneLine.Checked);
    Ini.WriteBool('Errors to check for', '"- " on first line',                      chkCheckDashOnFirstLine.Checked); //added by adenry
    Ini.WriteBool('Errors to check for', 'Only if there is no "- " on second line', chkCheckOnlyIfNoDashOnSecondLine.Checked); //added by adenry
    Ini.WriteBool('Errors to check for', 'Dialogue on one line',                    chkCheckDialogueOnOneLine.Checked); //added by adenry
    Ini.WriteBool('Errors to check for', 'Space after custom characters',           chkCheckSpaceAfterCustomChars.Checked);
    Ini.WriteBool('Errors to check for', 'Space before custom characters',          chkCheckSpaceBeforeCustomChars.Checked);
    Ini.WriteBool('Errors to check for', 'Unnecessary spaces',                      chkCheckUnnecessarySpaces.Checked);
    Ini.WriteBool('Errors to check for', 'Unnecessary tags',                        chkCheckUnnecessaryTags.Checked);//added by adenry
    Ini.WriteBool('Errors to check for', 'Too much CPS',                            chkCheckTooMuchCPS.Checked);//added by adenry

    ErrorsToCheck.eLinesWithoutLetters      := chkCheckLinesWithoutLetters.Checked;
    ErrorsToCheck.eEmptySubtitle            := chkCheckEmptySubtitles.Checked;
    ErrorsToCheck.eOverlapping              := chkCheckOverlapping.Checked;
    ErrorsToCheck.eBadValues                := chkCheckBadValues.Checked;
    ErrorsToCheck.eTooShortPause            := chkCheckTooShortPause.Checked;//added by adenry
    ErrorsToCheck.eTooLongDurations         := chkCheckTooLongDur.Checked;
    ErrorsToCheck.eTooShortDurations        := chkCheckTooShortDur.Checked;
    ErrorsToCheck.eTooLongLines             := chkCheckTooLongLines.Checked;
    ErrorsToCheck.eOverTwoLines             := chkCheckOverTwoLines.Checked;
    ErrorsToCheck.eHearingImpaired          := chkCheckHearingImpaired.Checked;
    ErrorsToCheck.eTextBeforeColon          := chkCheckTextBeforeColon.Checked;
    ErrorsToCheck.eOnlyIfCapitalLetters     := chkCheckOnlyIfCapitalLetters.Checked;
    ErrorsToCheck.eUnnecessaryDots          := chkCheckUnnecessaryDots.Checked;
    ErrorsToCheck.eProhibitedCharacter      := chkCheckProhibitedChars.Checked;
    ErrorsToCheck.eRepeatedCharacter        := chkCheckRepeatedChars.Checked;
    ErrorsToCheck.eRepeatedSubtitle         := chkCheckRepeatedSubs.Checked;
    ErrorsToCheck.eOCRErrors                := chkCheckOCRErrors.Checked;
    ErrorsToCheck.eOpnDlgSubsOneLine        := chkCheckOpnDlgInSubsWithOneLine.Checked;
    ErrorsToCheck.eDashOnFirstLine          := chkCheckDashOnFirstLine.Checked;//added by adenry
    ErrorsToCheck.eOnlyIfNoDashOnSecondLine := chkCheckOnlyIfNoDashOnSecondLine.Checked; //added by adenry
    ErrorsToCheck.eDialogueOnOneLine        := chkCheckDialogueOnOneLine.Checked;//added by adenry
    ErrorsToCheck.eSpaceAfterCustChars      := chkCheckSpaceAfterCustomChars.Checked;
    ErrorsToCheck.eSpaceBeforeCustChars     := chkCheckSpaceBeforeCustomChars.Checked;
    ErrorsToCheck.eUnnecessarySpaces        := chkCheckUnnecessarySpaces.Checked;
    ErrorsToCheck.eUnnecessaryTags          := chkCheckUnnecessaryTags.Checked;//added by adenry
    ErrorsToCheck.eTooMuchCPS               := chkCheckTooMuchCPS.Checked;//added by adenry

    //added by adenry: begin
    // --------------- //
    // Errors to mark  //
    // --------------- //

    //Ini.WriteBool('Errors to mark', 'Enabled', chkMarkEnable.Checked);
    //AdvancedErrorMarking := chkMarkEnable.Checked;
    //Ini.WriteBool('Errors to mark', 'Disable standard marking', chkMarkDisableStandard.Checked);
    //MarkDisableStandard := chkMarkDisableStandard.Checked;

    for i := 0 to Integer(High(TErrorType))+1 do
    begin
      MarkFlags[i] := [];
      if TCheckBox(FindComponent('chkMarkEnable_'+IntToStr(i))).Checked   then MarkFlags[i] := MarkFlags[i] + [mfEnabled];
      if TSpeedButton(FindComponent('sbMarkNum_'+IntToStr(i))).Down       then MarkFlags[i] := MarkFlags[i] + [mfColNum];
      if TSpeedButton(FindComponent('sbMarkPause_'+IntToStr(i))).Down     then MarkFlags[i] := MarkFlags[i] + [mfColPause];
      if TSpeedButton(FindComponent('sbMarkShow_'+IntToStr(i))).Down      then MarkFlags[i] := MarkFlags[i] + [mfColShow];
      if TSpeedButton(FindComponent('sbMarkHide_'+IntToStr(i))).Down      then MarkFlags[i] := MarkFlags[i] + [mfColHide];
      if TSpeedButton(FindComponent('sbMarkDur_'+IntToStr(i))).Down       then MarkFlags[i] := MarkFlags[i] + [mfColDur];
      if TSpeedButton(FindComponent('sbMarkText_'+IntToStr(i))).Down      then MarkFlags[i] := MarkFlags[i] + [mfColText];
      if TSpeedButton(FindComponent('sbMarkBold_'+IntToStr(i))).Down      then MarkFlags[i] := MarkFlags[i] + [mfBold];
      if TSpeedButton(FindComponent('sbMarkItalic_'+IntToStr(i))).Down    then MarkFlags[i] := MarkFlags[i] + [mfItalic];
      if TSpeedButton(FindComponent('sbMarkUnderline_'+IntToStr(i))).Down then MarkFlags[i] := MarkFlags[i] + [mfUnderline];
      if TSpeedButton(FindComponent('sbMarkStrikeOut_'+IntToStr(i))).Down then MarkFlags[i] := MarkFlags[i] + [mfStrikeOut];
      MarkColors[i] := TPanel(FindComponent('pnlMarkColor_'+IntToStr(i))).Color;
      MarkBackgrounds[i] := TPanel(FindComponent('pnlMarkBckgr_'+IntToStr(i))).Color;

      Ini.WriteInteger('Errors to mark', 'Mark flags ' + IntToStr(i), Word(MarkFlags[i]));
      Ini.WriteInteger('Errors to mark', 'Mark color ' + IntToStr(i), MarkColors[i]);
      Ini.WriteInteger('Errors to mark', 'Mark background ' + IntToStr(i), MarkBackgrounds[i]);
    end;
    Ini.WriteBool('Errors to mark', 'Mark CPS hint box', chkMarkCPSHintBox.Checked);//added by adenry
    MarkCPSHintBox    := chkMarkCPSHintBox.Checked;//added by adenry

    //added by adenry: end

    // ------------- //
    // Errors to fix //
    // ------------- //
    Ini.WriteBool('Errors to fix', 'Lines without letters',                   chkFixLinesWithoutLetters.Checked);
    Ini.WriteBool('Errors to fix', 'Empty subtitles',                         chkFixEmptySubtitles.Checked);
    Ini.WriteBool('Errors to fix', 'Overlapping subtitles',                   chkFixOverlapping.Checked);
    Ini.WriteBool('Errors to fix', 'Bad values',                              chkFixBadValues.Checked);
  //Ini.WriteBool('Errors to fix', 'Too short pause',                         chkFixTooShortPause.Checked);//added by adenry
  //Ini.WriteBool('Errors to fix', 'Too long durations',                      chkFixTooLongDur.Checked);//added by adenry
  //Ini.WriteBool('Errors to fix', 'Too short durations',                     chkFixTooShortDur.Checked);//added by adenry
  //Ini.WriteBool('Errors to fix', 'Too long lines',                          chkFixTooLongLines.Checked);//added by adenry
    Ini.WriteBool('Errors to fix', 'Subtitles over two lines',                chkFixOverTwoLines.Checked);
    Ini.WriteBool('Errors to fix', 'Hearing impaired subtitles',              chkFixHearingImpaired.Checked);
    Ini.WriteBool('Errors to fix', 'Text before colon (":")',                 chkFixTextBeforeColon.Checked);
    Ini.WriteBool('Errors to fix', 'Only if text is in capital letters',      chkFixOnlyIfCapitalLetters.Checked);
    Ini.WriteBool('Errors to fix', 'Unnecessary dots',                        chkFixUnnecessaryDots.Checked);
    Ini.WriteBool('Errors to fix', 'Prohibited characters',                   chkFixProhibitedChars.Checked);
    Ini.WriteBool('Errors to fix', 'Repeated characters',                     chkFixRepeatedChars.Checked);
    Ini.WriteBool('Errors to fix', 'Repeated subtitles',                      chkFixRepeatedSubs.Checked);
    Ini.WriteBool('Errors to fix', 'OCR Errors',                              chkFixOCRErrors.Checked);
    Ini.WriteBool('Errors to fix', '"-" in subtitles with one line',          chkFixOpnDlgInSubsWithOneLine.Checked);
    Ini.WriteBool('Errors to fix', '"- " on first line',                      chkFixDashOnFirstLine.Checked);//added by adenry
    Ini.WriteBool('Errors to fix', 'Only if there is no "- " on second line', chkFixOnlyIfNoDashOnSecondLine.Checked);//added by adenry
    Ini.WriteBool('Errors to fix', 'Dialogue on one line',                    chkFixDialogueOnOneLine.Checked);//added by adenry
    Ini.WriteBool('Errors to fix', 'Space after custom characters',           chkFixSpaceAfterCustomChars.Checked);
    Ini.WriteBool('Errors to fix', 'Space before custom characters',          chkFixSpaceBeforeCustomChars.Checked);
    Ini.WriteBool('Errors to fix', 'Unnecessary spaces',                      chkFixUnnecessarySpaces.Checked);
    Ini.WriteBool('Errors to fix', 'Unnecessary tags',                        chkFixUnnecessaryTags.Checked); //added by adenry
  //Ini.WriteBool('Errors to fix', 'Too much CPS',                            chkFixTooMuchCPS.Checked); //added by adenry

    ErrorsToFix.eLinesWithoutLetters      := chkFixLinesWithoutLetters.Checked;
    ErrorsToFix.eEmptySubtitle            := chkFixEmptySubtitles.Checked;
    ErrorsToFix.eOverlapping              := chkFixOverlapping.Checked;
    ErrorsToFix.eBadValues                := chkFixBadValues.Checked;
    ErrorsToFix.eTooShortPause            := chkFixTooShortPause.Checked;//added by adenry
    ErrorsToFix.eOverTwoLines             := chkFixOverTwoLines.Checked;
    ErrorsToFix.eHearingImpaired          := chkFixHearingImpaired.Checked;
    ErrorsToFix.eTextBeforeColon          := chkFixTextBeforeColon.Checked;
    ErrorsToFix.eOnlyIfCapitalLetters     := chkFixOnlyIfCapitalLetters.Checked;
    ErrorsToFix.eUnnecessaryDots          := chkFixUnnecessaryDots.Checked;
    ErrorsToFix.eProhibitedCharacter      := chkFixProhibitedChars.Checked;
    ErrorsToFix.eRepeatedCharacter        := chkFixRepeatedChars.Checked;
    ErrorsToFix.eRepeatedSubtitle         := chkFixRepeatedSubs.Checked;
    ErrorsToFix.eOCRErrors                := chkFixOCRErrors.Checked;
    ErrorsToFix.eOpnDlgSubsOneLine        := chkFixOpnDlgInSubsWithOneLine.Checked;
    ErrorsToFix.eDashOnFirstLine          := chkFixDashOnFirstLine.Checked;//added by adenry
    ErrorsToFix.eOnlyIfNoDashOnSecondLine := chkFixOnlyIfNoDashOnSecondLine.Checked;//added by adenry
    ErrorsToFix.eDialogueOnOneLine        := chkFixDialogueOnOneLine.Checked;//added by adenry
    ErrorsToFix.eSpaceAfterCustChars      := chkFixSpaceAfterCustomChars.Checked;
    ErrorsToFix.eSpaceBeforeCustChars     := chkFixSpaceBeforeCustomChars.Checked;
    ErrorsToFix.eUnnecessarySpaces        := chkFixUnnecessarySpaces.Checked;
    ErrorsToFix.eUnnecessaryTags          := chkFixUnnecessaryTags.Checked; //added by adenry
    ErrorsToFix.eTooMuchCPS               := chkFixTooMuchCPS.Checked; //added by adenry

    // --------------------------- //
    // Unnecessary spaces to check //
    // --------------------------- //
    Ini.WriteBool('Unnecessary spaces to check for', 'Enters and spaces at the beginning and end', lstSpacesToCheck.Checked[0]);
    Ini.WriteBool('Unnecessary spaces to check for', 'Spaces between enters (left and right)',     lstSpacesToCheck.Checked[1]);
    Ini.WriteBool('Unnecessary spaces to check for', 'Double spaces and enters',                   lstSpacesToCheck.Checked[2]);
    Ini.WriteBool('Unnecessary spaces to check for', 'Spaces in front of punctuation marks',       lstSpacesToCheck.Checked[3]);
    Ini.WriteBool('Unnecessary spaces to check for', 'Spaces after "¿" and "¡"',                   lstSpacesToCheck.Checked[4]);
    Ini.WriteBool('Unnecessary spaces to check for', 'Spaces before "?" and  "!"',                 lstSpacesToCheck.Checked[5]);
    Ini.WriteBool('Unnecessary spaces to check for', 'Spaces between numbers',                     lstSpacesToCheck.Checked[6]);
    ErrorsToCheck.eWhatUnnecessarySpaces := [];
    if lstSpacesToCheck.Checked[0] then
      ErrorsToCheck.eWhatUnnecessarySpaces := ErrorsToCheck.eWhatUnnecessarySpaces + [EntersAndSpacesBeginningEnd];
    if lstSpacesToCheck.Checked[1] then
      ErrorsToCheck.eWhatUnnecessarySpaces := ErrorsToCheck.eWhatUnnecessarySpaces + [SpacesBetweenEnters];
    if lstSpacesToCheck.Checked[2] then
      ErrorsToCheck.eWhatUnnecessarySpaces := ErrorsToCheck.eWhatUnnecessarySpaces + [DoubleSpacesAndEnters];
    if lstSpacesToCheck.Checked[3] then
      ErrorsToCheck.eWhatUnnecessarySpaces := ErrorsToCheck.eWhatUnnecessarySpaces + [SpacesFrontPunctuation];
    if lstSpacesToCheck.Checked[4] then
      ErrorsToCheck.eWhatUnnecessarySpaces := ErrorsToCheck.eWhatUnnecessarySpaces + [SpacesAfterQuestionAndExclamation];
    if lstSpacesToCheck.Checked[5] then
      ErrorsToCheck.eWhatUnnecessarySpaces := ErrorsToCheck.eWhatUnnecessarySpaces + [SpacesBeforeQuestionAndExclamation];
    if lstSpacesToCheck.Checked[6] then
      ErrorsToCheck.eWhatUnnecessarySpaces := ErrorsToCheck.eWhatUnnecessarySpaces + [SpacesBetweenNumbers];

    // ------------------------- //
    // Unnecessary spaces to fix //
    // ------------------------- //
    Ini.WriteBool('Unnecessary spaces to fix', 'Enters and spaces at the beginning and end', lstSpacesToFix.Checked[0]);
    Ini.WriteBool('Unnecessary spaces to fix', 'Spaces between enters (left and right)',     lstSpacesToFix.Checked[1]);
    Ini.WriteBool('Unnecessary spaces to fix', 'Double spaces and enters',                   lstSpacesToFix.Checked[2]);
    Ini.WriteBool('Unnecessary spaces to fix', 'Spaces in front of punctuation marks',       lstSpacesToFix.Checked[3]);
    Ini.WriteBool('Unnecessary spaces to fix', 'Spaces after "¿" and "¡"',                   lstSpacesToFix.Checked[4]);
    Ini.WriteBool('Unnecessary spaces to fix', 'Spaces before "?" and  "!"',                 lstSpacesToFix.Checked[5]);
    Ini.WriteBool('Unnecessary spaces to fix', 'Spaces between numbers',                     lstSpacesToFix.Checked[6]);
    ErrorsToFix.eWhatUnnecessarySpaces := [];
    if lstSpacesToFix.Checked[0] then
      ErrorsToFix.eWhatUnnecessarySpaces := ErrorsToFix.eWhatUnnecessarySpaces + [EntersAndSpacesBeginningEnd];
    if lstSpacesToFix.Checked[1] then
      ErrorsToFix.eWhatUnnecessarySpaces := ErrorsToFix.eWhatUnnecessarySpaces + [SpacesBetweenEnters];
    if lstSpacesToFix.Checked[2] then
      ErrorsToFix.eWhatUnnecessarySpaces := ErrorsToFix.eWhatUnnecessarySpaces + [DoubleSpacesAndEnters];
    if lstSpacesToFix.Checked[3] then
      ErrorsToFix.eWhatUnnecessarySpaces := ErrorsToFix.eWhatUnnecessarySpaces + [SpacesFrontPunctuation];
    if lstSpacesToFix.Checked[4] then
      ErrorsToFix.eWhatUnnecessarySpaces := ErrorsToFix.eWhatUnnecessarySpaces + [SpacesAfterQuestionAndExclamation];
    if lstSpacesToFix.Checked[5] then
      ErrorsToFix.eWhatUnnecessarySpaces := ErrorsToFix.eWhatUnnecessarySpaces + [SpacesBeforeQuestionAndExclamation];
    if lstSpacesToFix.Checked[6] then
      ErrorsToFix.eWhatUnnecessarySpaces := ErrorsToFix.eWhatUnnecessarySpaces + [SpacesBetweenNumbers];

  finally
    Ini.UpdateFile; //added by adenry
    Ini.Free;
  end;

  // ------------------------- //
  // Refresh colors            //
  // ------------------------- //
  //added by adenry: begin
  if frmMain.lstSubtitles.Enabled then
  with frmMain do
  begin
    lstSubtitles.Refresh; //added by adenry: fixes a small bug
    //tmeDurationTimeChange(tmeDuration,tmeDuration.Time); //added by adenry: to repaint tmeDuration
    RefreshTimes; //added by adenry later
    if IndicTooLongLines then
    begin
      MarkLongLinesInLabel(lblText);
      MarkLongLinesInLabel(lblTranslation);
    end else
    begin
      {for i:= 1 to totalRedLabels do
      begin
        TLabel(frmMain.FindComponent('lblText'+IntToStr(i))).Visible:=False;
        TLabel(frmMain.FindComponent('lblTranslation'+IntToStr(i))).Visible:=False;
      end;}
      for i := 1 to lblText.Tag do
        TLabel(FindComponent('lblText'+IntToStr(i))).Free;
      lblText.Tag:=0;
      for i := 1 to lblTranslation.Tag do
        TLabel(FindComponent('lblTranslation'+IntToStr(i))).Free;
      lblTranslation.Tag:=0;
    end;
    AutoRecheckAllErrors; //added by adenry
  end;
  //added by adenry: end

  //todo: refresh Info&Errors form
  if Assigned(frmInfoErrors) then
    frmInfoErrors.SetErrorTypesCheckboxesEnabledState;

finally
  Screen.Cursor := crDefault; //added by adenry
end;

end;

// -----------------------------------------------------------------------------

procedure TfrmInfoErrorsSettings.chkCheckTextBeforeColonClick(
  Sender: TObject);
begin
  chkCheckOnlyIfCapitalLetters.Enabled := chkCheckTextBeforeColon.Checked;
end;

// -----------------------------------------------------------------------------

procedure TfrmInfoErrorsSettings.chkFixTextBeforeColonClick(
  Sender: TObject);
begin
  chkFixOnlyIfCapitalLetters.Enabled := chkFixTextBeforeColon.Checked;
end;

// -----------------------------------------------------------------------------

procedure TfrmInfoErrorsSettings.btnEditClick(Sender: TObject);
  function GetWindowsDirectory: String;
  var
     pcWindowsDirectory : PChar;
     dwWDSize           : DWORD;
  begin
    dwWDSize := MAX_PATH + 1;
    GetMem(pcWindowsDirectory, dwWDSize);
    try
      if Windows.GetWindowsDirectory(pcWindowsDirectory, dwWDSize) <> 0 then
        Result := pcWindowsDirectory;
    finally
      FreeMem(pcWindowsDirectory);
    end;
    if Result[Length(Result)] <> '\' then
      Result := Result + '\';
  end;
var
  WinDir  : String;
  OCRFile : String;
begin
  OCRFile := ExtractFilePath(Application.ExeName) + 'OCRScripts\' + cmbOCRFiles.Items[cmbOCRFiles.ItemIndex] + ID_OCREXT;
  if FileExists(OCRFile) then
  begin
    WinDir := GetWindowsDirectory;
    if FileExists(WinDir + 'notepad.exe') then
    begin
      ShellExecute(Handle, 'open', PChar(WinDir + 'notepad.exe'), PChar(OCRFile), '', SW_SHOWMAXIMIZED);
      OCRFileEdited := True; //added by adenry
    end;
  end;
end;

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmInfoErrorsSettings.ColorPanelsMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,  Y: Integer);
begin
  if Button <> mbLeft then
    TPanel(Sender).Color := TPanel(Sender).Font.Color
  else {begin
    dlgSetColor.Color := TPanel(Sender).Color;
    if (dlgSetColor.Execute) then
      TPanel(Sender).Color := dlgSetColor.Color;
  end;}
    TPanel(Sender).BeginDrag(False);
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmInfoErrorsSettings.MarkTextColorPanelsMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,  Y: Integer);
begin
  if Button <> mbLeft then
    TPanel(Sender).Color := clWindowText
  else
    TPanel(Sender).BeginDrag(False);
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmInfoErrorsSettings.MarkBckgrColorPanelsMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,  Y: Integer);
begin
  if Button <> mbLeft then
    TPanel(Sender).Color := clWindow
  else
    TPanel(Sender).BeginDrag(False);
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmInfoErrorsSettings.ColorPanelsDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  if Source is TPanel then
  begin
    Accept:=True;
    dragMade := True;
  end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmInfoErrorsSettings.ColorPanelsDragDrop(Sender, Source: TObject; X, Y: Integer);
begin
  if Sender is Tpanel then
    TPanel(Sender).Color:=TPanel(Source).Color;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmInfoErrorsSettings.ColorPanelsEndDrag(Sender, Target: TObject; X, Y: Integer);
begin
  if not dragMade then
  begin
    dlgSetColor.Color := TPanel(Sender).Color;
    if (dlgSetColor.Execute) then
      TPanel(Sender).Color := dlgSetColor.Color;
  end;
  dragMade:=False;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmInfoErrorsSettings.btnSetDefaultStylesClick(Sender: TObject);
begin
  SetDefaultStyles(False);
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmInfoErrorsSettings.SetDefaultStyles(SetMarkVars: Boolean);
var
  Ini: TIniFile;
  i: Integer;
  flags: TMarkFlags;
begin
  Ini := TIniFile.Create(IniRoot);
  try

  for i := 0 to Integer(High(TErrorType))+1 do
  begin
    flags := GetDefaultMarkFlags(i);

    TSpeedButton(FindComponent('sbMarkNum_'+IntToStr(i))).Down := mfColNum in flags;
    TSpeedButton(FindComponent('sbMarkShow_'+IntToStr(i))).Down := mfColShow in flags;
    TSpeedButton(FindComponent('sbMarkHide_'+IntToStr(i))).Down := mfColHide in flags;
    TSpeedButton(FindComponent('sbMarkText_'+IntToStr(i))).Down := mfColText in flags;
    TSpeedButton(FindComponent('sbMarkBold_'+IntToStr(i))).Down := mfBold in flags;
    TSpeedButton(FindComponent('sbMarkItalic_'+IntToStr(i))).Down := mfItalic in flags;
    TSpeedButton(FindComponent('sbMarkUnderline_'+IntToStr(i))).Down := mfUnderline in flags;
    TSpeedButton(FindComponent('sbMarkStrikeOut_'+IntToStr(i))).Down := mfStrikeOut in flags;

    {TSpeedButton(FindComponent('sbMarkNum_'+IntToStr(i))).Down := Boolean(TSpeedButton(FindComponent('sbMarkNum_'+IntToStr(i))).Tag);
    TSpeedButton(FindComponent('sbMarkShow_'+IntToStr(i))).Down := Boolean(TSpeedButton(FindComponent('sbMarkShow_'+IntToStr(i))).Tag);
    TSpeedButton(FindComponent('sbMarkHide_'+IntToStr(i))).Down := Boolean(TSpeedButton(FindComponent('sbMarkHide_'+IntToStr(i))).Tag);
    TSpeedButton(FindComponent('sbMarkText_'+IntToStr(i))).Down := Boolean(TSpeedButton(FindComponent('sbMarkText_'+IntToStr(i))).Tag);
    TSpeedButton(FindComponent('sbMarkBold_'+IntToStr(i))).Down := Boolean(TSpeedButton(FindComponent('sbMarkBold_'+IntToStr(i))).Tag);
    TSpeedButton(FindComponent('sbMarkItalic_'+IntToStr(i))).Down := Boolean(TSpeedButton(FindComponent('sbMarkItalic_'+IntToStr(i))).Tag);
    TSpeedButton(FindComponent('sbMarkUnderline_'+IntToStr(i))).Down := Boolean(TSpeedButton(FindComponent('sbMarkUnderline_'+IntToStr(i))).Tag);
    TSpeedButton(FindComponent('sbMarkStrikeOut_'+IntToStr(i))).Down := Boolean(TSpeedButton(FindComponent('sbMarkStrikeOut_'+IntToStr(i))).Tag);}

    TPanel(FindComponent('pnlMarkColor_'+IntToStr(i))).Color := TPanel(FindComponent('pnlMarkColor_'+IntToStr(i))).Font.Color;
    TPanel(FindComponent('pnlMarkBckgr_'+IntToStr(i))).Color := TPanel(FindComponent('pnlMarkBckgr_'+IntToStr(i))).Font.Color;

    if SetMarkVars then
    begin
      {MarkFlags[i] := [];
      //if TCheckBox(FindComponent('chkMarkEnable_'+IntToStr(i))).Checked then MarkFlags[i] := MarkFlags[i] + [mfEnabled];
      //TCheckBox(FindComponent('chkMarkEnable_'+IntToStr(i))).Checked := True;
      MarkFlags[i] := MarkFlags[i] + [mfEnabled];
      if TSpeedButton(FindComponent('sbMarkNum_'+IntToStr(i))).Down then MarkFlags[i] := MarkFlags[i] + [mfColNum];
      if TSpeedButton(FindComponent('sbMarkShow_'+IntToStr(i))).Down then MarkFlags[i] := MarkFlags[i] + [mfColShow];
      if TSpeedButton(FindComponent('sbMarkHide_'+IntToStr(i))).Down then MarkFlags[i] := MarkFlags[i] + [mfColHide];
      if TSpeedButton(FindComponent('sbMarkText_'+IntToStr(i))).Down then MarkFlags[i] := MarkFlags[i] + [mfColText];
      if TSpeedButton(FindComponent('sbMarkBold_'+IntToStr(i))).Down then MarkFlags[i] := MarkFlags[i] + [mfBold];
      if TSpeedButton(FindComponent('sbMarkItalic_'+IntToStr(i))).Down then MarkFlags[i] := MarkFlags[i] + [mfItalic];
      if TSpeedButton(FindComponent('sbMarkUnderline_'+IntToStr(i))).Down then MarkFlags[i] := MarkFlags[i] + [mfUnderline];
      if TSpeedButton(FindComponent('sbMarkStrikeOut_'+IntToStr(i))).Down then MarkFlags[i] := MarkFlags[i] + [mfStrikeOut];}
      MarkFlags[i] := flags;
      MarkColors[i] := TPanel(FindComponent('pnlMarkColor_'+IntToStr(i))).Color;
      MarkBackgrounds[i] := TPanel(FindComponent('pnlMarkBckgr_'+IntToStr(i))).Color;

      //Ini.WriteInteger('Errors to mark', 'Mark flags ' + IntToStr(i), Word(MarkFlags[i]));
      //Ini.WriteInteger('Errors to mark', 'Mark color ' + IntToStr(i), MarkColors[i]);
      //Ini.WriteInteger('Errors to mark', 'Mark background ' + IntToStr(i), MarkBackgrounds[i]);
    end;
  end;

  finally
    Ini.Free;
  end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
function TfrmInfoErrorsSettings.GetDefaultMarkFlags(Index: Integer): TMarkFlags;
var
  flags: TMarkFlags;
begin
  flags := [];
  if Index <> 22 then //22 is 'Too much CPS', it is marked with a CPS box by default
    flags := [mfEnabled];
  if Boolean(TSpeedButton(FindComponent('sbMarkNum_'+IntToStr(Index))).Tag)       then flags := flags + [mfColNum];
  if Boolean(TSpeedButton(FindComponent('sbMarkPause_'+IntToStr(Index))).Tag)     then flags := flags + [mfColPause];
  if Boolean(TSpeedButton(FindComponent('sbMarkShow_'+IntToStr(Index))).Tag)      then flags := flags + [mfColShow];
  if Boolean(TSpeedButton(FindComponent('sbMarkHide_'+IntToStr(Index))).Tag)      then flags := flags + [mfColHide];
  if Boolean(TSpeedButton(FindComponent('sbMarkDur_'+IntToStr(Index))).Tag)       then flags := flags + [mfColDur];
  if Boolean(TSpeedButton(FindComponent('sbMarkText_'+IntToStr(Index))).Tag)      then flags := flags + [mfColText];
  if Boolean(TSpeedButton(FindComponent('sbMarkBold_'+IntToStr(Index))).Tag)      then flags := flags + [mfBold];
  if Boolean(TSpeedButton(FindComponent('sbMarkItalic_'+IntToStr(Index))).Tag)    then flags := flags + [mfItalic];
  if Boolean(TSpeedButton(FindComponent('sbMarkUnderline_'+IntToStr(Index))).Tag) then flags := flags + [mfUnderline];
  if Boolean(TSpeedButton(FindComponent('sbMarkStrikeOut_'+IntToStr(Index))).Tag) then flags := flags + [mfStrikeOut];
  Result := flags;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmInfoErrorsSettings.chkCheckOnlyIfCapitalLettersClick(
  Sender: TObject);
begin
  chkMarkOnlyIfCapitalLetters.Checked := chkCheckOnlyIfCapitalLetters.Checked;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmInfoErrorsSettings.chkCheckOnlyIfNoDashOnSecondLineClick(
  Sender: TObject);
begin
  chkMarkOnlyIfNoDashOnSecondLine.Checked := chkCheckOnlyIfNoDashOnSecondLine.Checked;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

end.
