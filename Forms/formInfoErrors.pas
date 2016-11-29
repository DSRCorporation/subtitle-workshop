// This file is part of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle Workshop's copyright information
// File Description: Information and Errors form

unit formInfoErrors;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, ExtCtrls, IniFiles, Buttons, Math, ComCtrls, ToolWin, Menus, StrUtils, //Math added by adenry to use MIN; StrUtils added for DupeString
  VirtualTrees,
  FastStrings, RegExpr, //StrMan //FastStrings added by adenry to use SmartPos; RegExpr added by adenry //StrMan removed by adenry
  formCompositeCustomInfo, //formCompositeCustomInfo added by adenry
  CommonTypes;


type
  TErrorClass = (etError, etWarning, etInfo, etFixed, etCustomInfo); //etCustomInfo added by adenry
  TErrorClassSet = set of TErrorClass; //added by adenry
  //added by adenry: begin
  TCustomInfoDataSmall = record
    CustomInfoType  : SmallInt;
    Checked         : Boolean;
    Text1           : String;
    ItemIndex       : SmallInt;
    Text2           : String;
  end;
  TCustomInfoData = record
    CustomInfoType  : SmallInt;
    Checked         : Boolean;
    Text1           : String;
    ItemIndex       : SmallInt;
    Text2           : String;
    ANDCaption      : String;
    ANDErrorTypes   : String;
    ANDCustomInfo   : array of TCustomInfoDataSmall;
  end;
  //added by adenry: end
  TErrorDescription = (dNone,
                       dCustomInfo, //added by adenry
                       // ----------- //
                       // Information //
                       // ----------- //
                       ifTotalErrors,
                       ifFixedErrors,
                       // ---------------------- //
                       // Descriptions of errors //
                       // ---------------------- //
                       deMarkedSubtitle,
                       // -------------
                       deLinesWithoutLetters,
                       deEmptySubtitle,
                       deOverlapping,
                       deBadValues,
                       deTooLongDuration,
                       deTooShortDuration,
                       deTooLongLine,
                       deOverTwoLines,
                       deHearingImpaired,
                       deTextBeforeColon,
                       deUnnecessaryDots,
                       deProhibitedCharacter,
                       deRepeatedCharacter,
                       deRepeatedSubtitle,
                       deOCRError,
                       deOpnDlgSubsOneLine,
                       deNoSpaceAfterChar,
                       deNoSpaceBeforeChar,
                       deUnnecessarySpaces,
                       deUnnecessaryTags, //added by adenry
                       deDashOnFirstLine, //added by adenry
                       deTooMuchCPS, //added by adenry
                       deTooShortPause, //added by adenry
                       deDialogueOnOneLine, //added by adenry

                       // ---------------------------- //
                       // Descriptions of fixed errors //
                       // ---------------------------- //
                       dfLinesWithoutLetters,
                       dfEmptySubtitle,
                       dfOverlapping,
                       dfBadValues,
                       dfHearingImpairedAll, // All the subtitle is deleted
                       dfHearingImpairedPart, // Only a part is deleted
                       dfTextBeforeColon,
                       dfUnnecessaryDots,
                       dfOverTwoLines,
                       dfProhibitedCharacter,
                       dfRepeatedCharacter,
                       dfRepeatedSubtitle,
                       dfOCRError,
                       dfOpnDlgSubsOneLine,
                       dfNoSpaceAfterChar,
                       dfNoSpaceBeforeChar,
                       dfUnnecessarySpaces,
                       dfUnnecessaryTags, //added by adenry
                       dfDashOnFirstLine, //added by adenry
                       dfTooMuchCPS, //added by adenry
                       dfTooShortPause, //added by adenry
                       dfDialogueOnOneLine //added by adenry
                       );
  TErrorDescriptionSet = set of TErrorDescription; //added by adenry
  TInfoError = record
    Subtitle      : Integer;
    ErrorClass    : TErrorClass;
    Description   : TErrorDescription;
    Tag           : Integer; // To store information values
    CustomInfoNum : SmallInt; //added by adenry
  end;
  PInfoError = ^TInfoError;
  TfrmInfoErrors = class(TForm)
    btnOk: TButton;
    btnSettings: TButton;
    sbErrorTypes: TSpeedButton;
    sbCustomInfo: TSpeedButton;
    tmrDeleteCustomInfo: TTimer;
    pnlInfoErrorsWrapper: TPanel;
    pnlInfoErrorsList: TPanel;
    bvlInfoErrors: TBevel;
    lblFixedErrors: TLabel;
    lblTotalErrors: TLabel;
    lblDisplayed: TLabel;
    sbShowHideCustomInfoType: TSpeedButton;
    sbShowHideErrorType: TSpeedButton;
    sbShowHideFixedType: TSpeedButton;
    sbShowHideWarningType: TSpeedButton;
    lstErrors: TVirtualStringTree;
    btnCheck: TButton;
    btnPrevious: TButton;
    btnNext: TButton;
    btnFixErrors: TButton;
    btnSelect: TButton;
    btnSelectPlus: TButton;
    btnSelectMinus: TButton;
    chkConfirm: TCheckBox;
    pnlErrorTypes: TPanel;
    bvlBottom: TBevel;
    bvlTop: TBevel;
    btnCheckAllErr: TButton;
    btnCheckNoneErr: TButton;
    btnCheckInverseErr: TButton;
    pnlCustomInfo: TPanel;
    bvlTop2: TBevel;
    bvlBottom2: TBevel;
    scrollboxCustomInfo: TScrollBox;
    pnlInsideScrollBox: TPanel;
    cmbCustomInfoSets: TComboBox;
    btnCheckAllCI: TButton;
    btnCheckNoneCI: TButton;
    btnCheckInverseCI: TButton;
    spSplitter: TSplitter;
    tbErrorTypesSets: TToolBar;
    tbtnSaveErrorTypesSet: TToolButton;
    tbtnDeleteErrorTypesSet: TToolButton;
    tbCustomInfoSets: TToolBar;
    tbtnSaveCustomInfoSet: TToolButton;
    tbtnDeleteCustomInfoSet: TToolButton;
    tbAddCustomInfo: TToolBar;
    tbtnAddCustomInfo: TToolButton;
    pnlErrorTypesLeftCol: TPanel;
    chkMarkedSubs: TCheckBox;
    chkLinesWithoutLetters: TCheckBox;
    chkEmptySubtitles: TCheckBox;
    chkOverlapping: TCheckBox;
    chkBadValues: TCheckBox;
    chkTooShortPause: TCheckBox;
    chkTooLongDur: TCheckBox;
    chkTooShortDur: TCheckBox;
    chkTooLongLines: TCheckBox;
    chkOverTwoLines: TCheckBox;
    chkHearingImpaired: TCheckBox;
    chkTextBeforeColon: TCheckBox;
    lblCountMarkedSubs: TLabel;
    lblCountLinesWithoutLetters: TLabel;
    lblCountEmptySubtitles: TLabel;
    lblCountOverlapping: TLabel;
    lblCountBadValues: TLabel;
    lblCountTooShortPause: TLabel;
    lblCountTooLongDur: TLabel;
    lblCountTooShortDur: TLabel;
    lblCountTooLongLines: TLabel;
    lblCountOverTwoLines: TLabel;
    lblCountHearingImpaired: TLabel;
    lblCountTextBeforeColon: TLabel;
    pnlErrorTypesRightCol: TPanel;
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
    lblCountUnnecessaryTags: TLabel;
    lblCountUnnecessarySpaces: TLabel;
    lblCountUnnecessaryDots: TLabel;
    lblCountTooMuchCPS: TLabel;
    lblCountSpaceBeforeCustomChars: TLabel;
    lblCountSpaceAfterCustomChars: TLabel;
    lblCountRepeatedSubs: TLabel;
    lblCountRepeatedChars: TLabel;
    lblCountProhibitedChars: TLabel;
    lblCountOpnDlgInSubsWithOneLine: TLabel;
    lblCountOCRErrors: TLabel;
    lblCountDialogueOnOneLine: TLabel;
    lblCountDashOnFirstLine: TLabel;
    cmbErrorTypesSets: TComboBox;
    mnuAddCustomInfoDropdown: TPopupMenu;
    mnuCompositeCustomInfo: TMenuItem;
    mnuSubtitlesDurationCustomInfo: TMenuItem;
    mnuSubtitlesLineLengthCustomInfo: TMenuItem;
    mnuSubtitlesLinesCountCustomInfo: TMenuItem;
    mnuSubtitlesPauseCustomInfo: TMenuItem;
    mnuSubtitlesCPSCustomInfo: TMenuItem;
    mnuSubtitlesTextCustomInfo: TMenuItem;
    N1: TMenuItem;
    btnExportToFile: TButton;
    dlgSave: TSaveDialog;
    tmrBlink: TTimer;
    procedure lstErrorsFreeNode(Sender: TBaseVirtualTree;
      Node: PVirtualNode);
    procedure lstErrorsGetNodeDataSize(Sender: TBaseVirtualTree;
      var NodeDataSize: Integer);
    procedure lstErrorsGetText(Sender: TBaseVirtualTree;
      Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
      var CellText: WideString);
    procedure lstErrorsInitNode(Sender: TBaseVirtualTree; ParentNode,
      Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);
    procedure btnSettingsClick(Sender: TObject);
    procedure btnCheckClick(Sender: TObject);
    procedure btnFixErrorsClick(Sender: TObject);
    procedure lstErrorsDblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure lstErrorsPaintText(Sender: TBaseVirtualTree;
      const TargetCanvas: TCanvas; Node: PVirtualNode;
      Column: TColumnIndex; TextType: TVSTTextType);
    procedure FormResize(Sender: TObject);
    procedure lstErrorsHeaderClick(Sender: TVTHeader;
      HitInfo: TVTHeaderHitInfo);
    procedure lstErrorsCompareNodes(Sender: TBaseVirtualTree; Node1,
      Node2: PVirtualNode; Column: TColumnIndex; var Result: Integer);
    procedure btnOkClick(Sender: TObject);
    procedure RecheckNodeErrors(Index: Integer; RecheckType: TRecheckTypes); //added by adenry
    procedure sbErrorTypesClick(Sender: TObject); //added by adenry
    procedure IncLabel(lbl: TLabel); //added by adenry
    procedure DecLabel(lbl: TLabel); //added by adenry
    procedure CheckAllErrors(Checked: Boolean); //added by adenry
    //added by adenry: begin
    procedure ShowHideNodes(NodeType: TErrorDescription; Visible: Boolean; CustomInfoNum: SmallInt = -2);
    procedure chkLinesWithoutLettersClick(Sender: TObject);
    procedure chkEmptySubtitlesClick(Sender: TObject);
    procedure chkOverlappingClick(Sender: TObject);
    procedure chkBadValuesClick(Sender: TObject);
    procedure chkTooShortPauseClick(Sender: TObject);
    procedure chkTooLongDurClick(Sender: TObject);
    procedure chkTooShortDurClick(Sender: TObject);
    procedure chkTooLongLinesClick(Sender: TObject);
    procedure chkOverTwoLinesClick(Sender: TObject);
    procedure chkHearingImpairedClick(Sender: TObject);
    procedure chkTextBeforeColonClick(Sender: TObject);
    procedure chkUnnecessaryDotsClick(Sender: TObject);
    procedure chkProhibitedCharsClick(Sender: TObject);
    procedure chkRepeatedCharsClick(Sender: TObject);
    procedure chkRepeatedSubsClick(Sender: TObject);
    procedure chkOCRErrorsClick(Sender: TObject);
    procedure chkOpnDlgInSubsWithOneLineClick(Sender: TObject);
    procedure chkDashOnFirstLineClick(Sender: TObject);
    procedure chkDialogueOnOneLineClick(Sender: TObject);
    procedure chkSpaceAfterCustomCharsClick(Sender: TObject);
    procedure chkSpaceBeforeCustomCharsClick(Sender: TObject);
    procedure chkUnnecessarySpacesClick(Sender: TObject);
    procedure chkUnnecessaryTagsClick(Sender: TObject);
    procedure chkTooMuchCPSClick(Sender: TObject);
    procedure chkMarkedSubsClick(Sender: TObject);
    procedure btnCheckAllErrClick(Sender: TObject);
    procedure btnCheckNoneErrClick(Sender: TObject);
    procedure btnCheckInverseErrClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnPreviousClick(Sender: TObject);
    procedure sbCustomInfoClick(Sender: TObject);
    //procedure btnAddClick(Sender: TObject);
    procedure CreateNewCustomInfo(CIData : TCustomInfoData; Sender: TObject = nil);
    procedure ButtonDelClick(Sender: TObject);
    procedure ButtonEditClick(Sender: TObject);
    procedure tmrDeleteCustomInfoTimer(Sender: TObject);
    function CheckCustomInfo(NodeToCheck: PVirtualNode; CustomInfoN: Integer = -1; formName: String = 'frmInfoErrors'): Boolean;
    procedure DeleteCustomInfo(Node: PVirtualNode; CustomInfoN: Integer = -1);
    procedure DeleteAllCustomInfos;
    procedure EditNumKeyPress(Sender: TObject; var Key: Char);
    procedure EditNumKeyPress2(Sender: TObject; var Key: Char);
    procedure EditNumChange(Sender: TObject);
    procedure EditNumEnter(Sender: TObject);
    procedure EditNumExit(Sender: TObject);
    procedure cmbChange(Sender: TObject);
    procedure chkCaptionClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ShowHideType(ErrorClass: TErrorClass; Visible: Boolean);
    procedure sbShowHideErrorTypeClick(Sender: TObject);
    procedure sbShowHideWarningTypeClick(Sender: TObject);
    procedure sbShowHideFixedTypeClick(Sender: TObject);
    procedure sbShowHideCustomInfoTypeClick(Sender: TObject);
    procedure tbtnSaveErrorTypesSetClick(Sender: TObject);
    function GetCheckedTypesAsString: String;
    procedure SetCheckedTypesFromString(CheckedTypes: String; DontFireOnClickEvent: Boolean = False);
    procedure cmbErrorTypesSetsSelect(Sender: TObject);
    procedure tbtnDeleteErrorTypesSetClick(Sender: TObject);
    procedure cmbErrorTypesSetsKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmbCustomInfoSetsKeyPress(Sender: TObject; var Key: Char);
    procedure tbtnSaveCustomInfoSetClick(Sender: TObject);
    procedure cmbCustomInfoSetsSelect(Sender: TObject);
    procedure FreeCustomInfoComponents(Index: String);
    procedure tbtnDeleteCustomInfoSetClick(Sender: TObject);
    procedure LoadErrorTypesSets;
    procedure LoadCustomInfoSets;
    procedure LoadCurrentCustomInfo;
    procedure SaveCurrentCustomInfo;
    procedure SaveCustomInfoSets;
    procedure btnSelectClick(Sender: TObject);
    procedure btnSelectPlusClick(Sender: TObject);
    procedure btnSelectMinusClick(Sender: TObject);
    procedure SelectSubtitles(Selected: Boolean);
    procedure CallSetLanguage;
    procedure SetCustomInfosLanguage;
    procedure SetCustomInfosCharsets;
    procedure SetErrorTypesCheckboxesEnabledState;
    function CheckCompositeCustomInfo(Node: PVirtualNode; CustomInfoN: Integer = -1): Boolean;
    procedure btnCheckAllCIClick(Sender: TObject);
    procedure btnCheckNoneCIClick(Sender: TObject);
    procedure CheckAllCI(Checked: Boolean);
    procedure btnCheckInverseCIClick(Sender: TObject);
    procedure SetFont;
    procedure spSplitterMoved(Sender: TObject);
    procedure spSplitterCanResize(Sender: TObject; var NewSize: Integer;
      var Accept: Boolean);
    procedure mnuCustomInfoClick(Sender: TObject);
    procedure btnExportToFileClick(Sender: TObject);
    procedure tmrBlinkTimer(Sender: TObject);
    //added by adenry: end
  private
    procedure SetLanguage;
    procedure AddInfoError(Subtitle: Integer; ErrorClass: TErrorClass; ErrorDescription: TErrorDescription; Tag: Integer = -1; CustomInfoNum: Integer = -1); //CustomInfoNum added by adenry
  public
    { Public declarations }
    TotalErrors                   : Integer; //added by adenry
    FixedErrors                   : Integer; //moved here by adenry
    //added by adenry: begin
    pnlPanelCreator               : TPanel;
    chkCheckboxCreator            : TCheckbox;
    lblLabelGreaterCreator        : TLabel;
    edtEdit1Creator               : TEdit;
    lblLabel1Creator              : TLabel;
    cmbComboBoxCreator            : TComboBox;
    lblLabelLessCreator           : TLabel;
    edtEdit2Creator               : TEdit;
    lblLabel2Creator              : TLabel;
    lblLabelCountCreator          : TLabel;
    //btnButtonDelCreator           : TButton; //removed later
    tbToolBarCreator              : TToolBar; //added later
    tbtnButtonDelCreator          : TToolButton; //added later
    //btnButtonEditCreator          : TButton;
    tbtnButtonEditCreator         : TToolButton; //added later
    frmCompositeCustomInfoCreator : TfrmCompositeCustomInfo;
    //added by adenry: end
    CustomInfosLastNumber         : Integer; //added by adenry
    CustomInfosCount              : Integer; //added by adenry
    LastCustomInfoType            : Byte; //added by adenry
    CustomInfoToDelete            : Integer; //added by adenry
    EditNumEnterValue             : String; //added by adenry
    VisibleTypes                  : TErrorDescriptionSet; //added by adenry
    VisibleErrorClasses           : TErrorClassSet; //added by adenry
    ErrorTypesSets                : array of String; //added by adenry
    CustomInfoSets                : array of array of TCustomInfoData; //added by adenry
    CIHeight                      : Byte; //added by adenry
    MaxVisibleCIs                 : Byte; //added by adenry
    BottomAreaHeight              : Byte; //added by adenry
    tmrBlinkVal                   : Byte; //added by adenry
  end;

var
  frmInfoErrors         : TfrmInfoErrors;
  ErrorTypes            : array[1..6] of String; //range changed by adenry
  InfoMsgs              : array[1..3] of String; //range changed by adenry
  FixReports            : array[1..22] of String; //range changed by adenry

implementation

uses
  General, Functions, InfoErrorsFunctions, TreeViewHandle, Undo, USubtitlesFunctions, //OCRScripts,
  formMain, formInfoErrorsSettings;

{$R *.dfm}

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmInfoErrors.SetFont;
begin
  btnOk.ParentFont          := True;
  btnFixErrors.ParentFont   := True;
  lstErrors.ParentFont      := True;
  Font                      := frmMain.Font;
  lstErrors.Header.Font     := Font;
  btnOk.Font.Style          := frmMain.Font.Style + [fsBold];
  btnFixErrors.Font.Style   := frmMain.Font.Style + [fsBold];

  lblDisplayed.ParentFont   := True;
  lblTotalErrors.ParentFont := True;
  lblFixedErrors.ParentFont := True;
  chkMarkedSubs.ParentFont  := True;
  lblDisplayed.Font.Style   := frmMain.Font.Style + [fsBold];
  lblTotalErrors.Font.Style := frmMain.Font.Style + [fsBold];
  lblFixedErrors.Font.Style := frmMain.Font.Style + [fsBold];
  chkMarkedSubs.Font.Style  := frmMain.Font.Style + [fsBold];

  lstErrors.Header.Height   := frmMain.lblMode.Height + (frmMain.lblMode.Left div 2); //added by adenry
end;
//added by adenry: end

// -----------------------------------------------------------------------------

procedure TfrmInfoErrors.SetLanguage;
var
  LF: TIniFile;
begin
  LF := TIniFile.Create(frmMain.ActualLangFile);
  try
    With LF do
    begin
      Caption                                 := ReadString('Information and errors', '01', 'Information and errors');
      btnCheck.Caption                        := ReadString('Information and errors', '02', 'Check');
      btnFixErrors.Caption                    := ReadString('Information and errors', '03', 'Fix errors');
      btnSettings.Caption                     := ReadString('Information and errors', '04', '&Settings');
      chkConfirm.Caption                      := ReadString('Information and errors', '05', 'Confirm each deletion');
      //added by adenry: begin
      sbShowHideErrorType.Caption             := ReadString('Information and errors', '67', 'E');
      sbShowHideWarningType.Caption           := ReadString('Information and errors', '68', 'W');
      sbShowHideFixedType.Caption             := ReadString('Information and errors', '69', 'F');
      sbShowHideCustomInfoType.Caption        := ReadString('Information and errors', '70', 'CI');
      btnSelect.Caption                       := ReadString('Information and errors', '71', 'Select');
      btnSelectPlus.Caption                   := ReadString('Information and errors', '72', '+ Select');
      btnSelectMinus.Caption                  := ReadString('Information and errors', '73', '- Select');
      btnSelect.Hint                          := ReadString('Information and errors', '74', 'Select subtitles');
      btnSelectPlus.Hint                      := ReadString('Information and errors', '75', 'Add to selected subtitles');
      btnSelectMinus.Hint                     := ReadString('Information and errors', '76', 'Remove from selected subtitles');
      btnExportToFile.Caption                 := ReadString('Information and errors', '94', 'Export to file');
      dlgSave.Title                           := btnExportToFile.Caption;
      dlgSave.Filter                          := ReadString('Information and errors', '95', 'Text file') + '(*.txt)|*.txt';

      btnCheckAllErr.Caption                  := ReadString('Information and errors', '77', 'All');
      btnCheckAllCI.Caption := btnCheckAllErr.Caption;
      btnCheckNoneErr.Caption                 := ReadString('Information and errors', '78', 'None');
      btnCheckNoneCI.Caption := btnCheckNoneErr.Caption;
      btnCheckInverseErr.Caption              := ReadString('Information and errors', '79', 'Inverse');
      btnCheckInverseCI.Caption := btnCheckInverseErr.Caption;
      btnCheckAllErr.Hint                     := ReadString('Information and errors', '80', 'Select all');
      btnCheckAllCI.Hint := btnCheckAllErr.Hint;
      btnCheckNoneErr.Hint                    := ReadString('Information and errors', '81', 'Select none');
      btnCheckNoneCI.Hint := btnCheckNoneErr.Hint;
      btnCheckInverseErr.Hint                 := ReadString('Information and errors', '82', 'Invert selection');
      btnCheckInverseCI.Hint := btnCheckInverseErr.Hint;
      cmbErrorTypesSets.Hint                  := ReadString('Information and errors', '83', 'Error types sets');
      tbtnSaveErrorTypesSet.Hint              := ReadString('Information and errors', '84', 'Save error types set');
      tbtnDeleteErrorTypesSet.Hint            := ReadString('Information and errors', '85', 'Delete error types set');
      sbErrorTypes.Caption                    := ReadString('Information and errors', '86', 'Error types');
      sbCustomInfo.Caption                    := ReadString('Information and errors', '87', 'Custom info');
      sbShowHideErrorType.Hint                := ReadString('Information and errors', '88', 'Show/hide errors');
      sbShowHideWarningType.Hint              := ReadString('Information and errors', '89', 'Show/hide warnings');
      sbShowHideFixedType.Hint                := ReadString('Information and errors', '90', 'Show/hide fixed');
      sbShowHideCustomInfoType.Hint           := ReadString('Information and errors', '91', 'Show/hide custom info');
      sbErrorTypes.Hint                       := ReadString('Information and errors', '92', 'Show/hide Error types panel');
      sbCustomInfo.Hint                       := ReadString('Information and errors', '93', 'Show/hide Custom info panel');

      tbtnAddCustomInfo.Hint                  := ReadString('Custom info', '01', 'Add custom info');
      mnuCompositeCustomInfo.Caption          := ReadString('Custom info', '02', 'Composite custom info');
      mnuSubtitlesDurationCustomInfo.Caption  := ReadString('Custom info', '03', 'Subtitles duration information');
      mnuSubtitlesLineLengthCustomInfo.Caption:= ReadString('Custom info', '04', 'Subtitles line length information');
      mnuSubtitlesLinesCountCustomInfo.Caption:= ReadString('Custom info', '05', 'Subtitles lines count information');
      mnuSubtitlesPauseCustomInfo.Caption     := ReadString('Custom info', '06', 'Subtitles pause information');
      mnuSubtitlesCPSCustomInfo.Caption       := ReadString('Custom info', '07', 'Subtitles CPS information');
      mnuSubtitlesTextCustomInfo.Caption      := ReadString('Custom info', '08', 'Subtitles text information');
      cmbCustomInfoSets.Hint                  := ReadString('Custom info', '09', 'Custom info sets');
      tbtnSaveCustomInfoSet.Hint              := ReadString('Custom info', '10', 'Save custom info set');
      tbtnDeleteCustomInfoSet.Hint            := ReadString('Custom info', '11', 'Delete custom info set');
      pnlInsideScrollBox.Caption              := ReadString('Custom info', '12', ' There is no custom info. Click the "+" button to add new custom info.');
      //added by adenry: end

      lstErrors.Header.Columns[0].Text := StringToWideStringEx(ReadString('Information and errors', '06', 'Subtitle'), CharSetToCodePage(frmMain.Font.Charset));
      lstErrors.Header.Columns[1].Text := StringToWideStringEx(ReadString('Information and errors', '07', 'Type'), CharSetToCodePage(frmMain.Font.Charset));
      lstErrors.Header.Columns[2].Text := StringToWideStringEx(ReadString('Information and errors', '08', 'Description'), CharSetToCodePage(frmMain.Font.Charset));

      // ------------- //
      //  Error types  //
      // ------------- //
      ErrorTypes[1] := ReadString('Information and errors', '09', 'Error');
      ErrorTypes[2] := ReadString('Information and errors', '10', 'Warning');
      ErrorTypes[3] := ReadString('Information and errors', '11', 'Info');
      ErrorTypes[4] := ReadString('Information and errors', '13', 'Fixed');
      ErrorTypes[5] := ReadString('Information and errors', '65', 'Custom info'); //added by adenry

      // ---------------------- //
      //  Information messages  //
      // ---------------------- //
      InfoMsgs[1] := ReadString('Information and errors', '14', 'Total errors: %d');
      InfoMsgs[2] := ReadString('Information and errors', '15', 'Fixed errors: %d');
      InfoMsgs[3] := ReadString('Information and errors', '66', 'Displayed: %d'); //added by adenry
      lblTotalErrors.Caption := Format(InfoMsgs[1], [TotalErrors]); //added by adenry
      lblFixedErrors.Caption := Format(InfoMsgs[2], [FixedErrors]); //added by adenry
      lblDisplayed.Caption := Format(InfoMsgs[3], [lstErrors.VisibleCount]); //added by adenry

      // ------------- //
      //  Fix reports  //
      // ------------- //
      FixReports[01] := ReadString('Information and errors', '36', 'Deleted lines without letters');
      FixReports[02] := ReadString('Information and errors', '37', 'Empty subtitle was deleted');
      // ---
      FixReports[03] := ReadString('Information and errors', '38', 'Fixed overlapping');
      FixReports[04] := ReadString('Information and errors', '39', 'Fixed bad values');

      FixReports[05] := ReadString('Information and errors', '40', 'Subtitle over two lines was adjusted');
      // ---
      FixReports[06] := ReadString('Information and errors', '41', 'Removed hearing impaired subtitle');
      FixReports[07] := ReadString('Information and errors', '42', 'Hearing impaired part has been deleted');
      FixReports[08] := ReadString('Information and errors', '43', 'Removed text before colon (":")');
      FixReports[09] := ReadString('Information and errors', '44', 'Removed unnecessary dots');
      FixReports[10] := ReadString('Information and errors', '45', 'Had a prohibited character and was deleted');
      FixReports[11] := ReadString('Information and errors', '46', 'Fixed repeated character');
      FixReports[12] := ReadString('Information and errors', '47', 'Fixed repeated subtitle');
      FixReports[13] := ReadString('Information and errors', '48', 'Fixed OCR Errors');
      // ---
      FixReports[14] := ReadString('Information and errors', '49', 'Deleted "-" in subtitle with one line');
      FixReports[15] := ReadString('Information and errors', '50', 'Added space after custom character');
      FixReports[16] := ReadString('Information and errors', '51', 'Added space before custom character');
      FixReports[17] := ReadString('Information and errors', '52', 'Removed unnecessary spaces');
      // ---
      FixReports[18] := ReadString('Information and errors', '55', 'Removed unnecessary tags');//added by adenry
      FixReports[19] := ReadString('Information and errors', '57', 'Removed dash on first line');//added by adenry
      FixReports[20] := ReadString('Information and errors', '59', 'Fixed too much CPS');//added by adenry
      FixReports[21] := ReadString('Information and errors', '61', 'Fixed too short pause');//added by adenry
      FixReports[22] := ReadString('Information and errors', '63', 'Fixed dialogue on one line');//added by adenry

      //added by adenry: begin
      CustomInfoTypes[1]  := ReadString('Custom info', '14', 'Duration');
      CustomInfoTypes[2]  := ReadString('Custom info', '15', 'Lines length');
      CustomInfoTypes[3]  := ReadString('Custom info', '16', 'Lines count');
      CustomInfoTypes[4]  := ReadString('Custom info', '17', 'Pause');
      CustomInfoTypes[5]  := ReadString('Custom info', '18', 'CPS');
      CustomInfoTypes[6]  := ReadString('Custom info', '19', 'Text');
      CustomInfoTypes[7]  := ReadString('Custom info', '20', 'Composite info');
      CustomInfoLabels[1] := ReadString('Custom info', '21', 'ms');
      CustomInfoLabels[2] := ReadString('Custom info', '22', 'chars');
      CustomInfoLabels[3] := ReadString('Custom info', '23', 'lines');
      CustomInfoLabels[4] := CustomInfoLabels[1];
      CustomInfoLabels[5] := ReadString('Custom info', '24', 'cps');
      CustomInfoLabels[6] := '';
      CustomInfoCombos[1] := ReadString('Custom info', '25', 'AND');
      CustomInfoCombos[2] := ReadString('Custom info', '26', 'OR');
      CustomInfoCombos[3] := ReadString('Custom info', '27', 'Contains (Case sensitive)');
      CustomInfoCombos[4] := ReadString('Custom info', '28', 'Contains (Case insensitive)');
      CustomInfoCombos[5] := ReadString('Custom info', '29', 'Does not contain (Case sensitive)');
      CustomInfoCombos[6] := ReadString('Custom info', '30', 'Does not contain (Case insensitive)');
      CustomInfoCombos[7] := ReadString('Custom info', '31', 'Matches regular expression');
      CustomInfoCombos[8] := ReadString('Custom info', '32', 'Matches regular expression (tags ignored)');
      CustomInfoCaption   := ReadString('Custom info', '13', 'Caption');
      //added by adenry: end

      //added by adenry: begin
      chkMarkedSubs.Caption              := ErrorReports[20];
      chkLinesWithoutLetters.Caption     := ReadString('Information and errors Settings', '28', 'Lines without letters');
      chkEmptySubtitles.Caption          := ReadString('Information and errors Settings', '29', 'Empty subtitles');
      chkOverlapping.Caption             := ReadString('Information and errors Settings', '30', 'Overlapping subtitles');
      chkBadValues.Caption               := ReadString('Information and errors Settings', '31', 'Bad values');
      chkTooLongDur.Caption              := ReadString('Information and errors Settings', '32', 'Too long durations');
      chkTooShortDur.Caption             := ReadString('Information and errors Settings', '33', 'Too short durations');
      chkTooLongLines.Caption            := ReadString('Information and errors Settings', '34', 'Too long lines');
      chkOverTwoLines.Caption            := ReadString('Information and errors Settings', '35', 'Subtitles over two lines');
      chkHearingImpaired.Caption         := ReadString('Information and errors Settings', '36', 'Hearing impaired subtitles');
      chkTextBeforeColon.Caption         := ReadString('Information and errors Settings', '37', 'Text before colon (":")');
      chkUnnecessaryDots.Caption         := ReadString('Information and errors Settings', '39', 'Unnecessary dots');
      chkProhibitedChars.Caption         := ReadString('Information and errors Settings', '40', 'Prohibited characters');
      chkRepeatedChars.Caption           := ReadString('Information and errors Settings', '41', 'Repeated characters');
      chkRepeatedSubs.Caption            := ReadString('Information and errors Settings', '42', 'Repeated subtitles');
      chkOCRErrors.Caption               := ReadString('Information and errors Settings', '43', 'OCR Errors');
      chkOpnDlgInSubsWithOneLine.Caption := ReadString('Information and errors Settings', '44', '"- " in subtitles with one line');
      chkSpaceAfterCustomChars.Caption   := ReadString('Information and errors Settings', '45', 'Missing spaces after custom characters');
      chkSpaceBeforeCustomChars.Caption  := ReadString('Information and errors Settings', '46', 'Missing spaces before custom characters');
      chkUnnecessarySpaces.Caption       := ReadString('Information and errors Settings', '47', 'Unnecessary spaces');
      chkTooShortPause.Caption           := ReadString('Information and errors Settings', '57', 'Too short pauses');
      chkDashOnFirstLine.Caption         := ReadString('Information and errors Settings', '58', '"- " on first line');
      chkDialogueOnOneLine.Caption       := ReadString('Information and errors Settings', '60', 'Dialogue on one line');
      chkUnnecessaryTags.Caption         := ReadString('Information and errors Settings', '61', 'Unnecessary tags');
      chkTooMuchCPS.Caption              := ReadString('Information and errors Settings', '62', 'Too many characters per second');
      //added by adenry: end

      lstErrors.Hint        := ReadString('Information and errors', '53', 'Double-click to jump to subtitle in Main Window');
      btnOk.Caption         := BTN_OK;

      // ------------------ //
      //      Set font      //
      // ------------------ //
      SetFont; //added by adenry
      //removed by adenry: begin
      {btnOk.ParentFont          := True;
      btnFixErrors.ParentFont   := True;
      lstErrors.ParentFont      := True;
      Font                      := frmMain.Font;
      lstErrors.Header.Font     := Font;
      btnOk.Font.Style          := frmMain.Font.Style + [fsBold];
      btnFixErrors.Font.Style   := frmMain.Font.Style + [fsBold];}
      //removed by adenry: end
    end;
  finally
    LF.Free;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmInfoErrors.lstErrorsInitNode(Sender: TBaseVirtualTree;
  ParentNode, Node: PVirtualNode;
  var InitialStates: TVirtualNodeInitStates);
var
  Data: PInfoError;
begin
  Data             := Sender.GetNodeData(Node);
  Data.Subtitle    := -1;
  Data.ErrorClass  := etError;
  Data.Description := dNone;
end;

// -----------------------------------------------------------------------------

procedure TfrmInfoErrors.lstErrorsFreeNode(Sender: TBaseVirtualTree;
  Node: PVirtualNode);
var
  Data: PInfoError;
begin
  Data             := Sender.GetNodeData(Node);
  Data.Subtitle    := -1;
  Data.ErrorClass  := etError;
  Data.Description := dNone;
end;

// -----------------------------------------------------------------------------

procedure TfrmInfoErrors.lstErrorsGetNodeDataSize(
  Sender: TBaseVirtualTree; var NodeDataSize: Integer);
begin
  NodeDataSize := SizeOf(TInfoError);
end;

// -----------------------------------------------------------------------------

procedure TfrmInfoErrors.lstErrorsPaintText(Sender: TBaseVirtualTree;
  const TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex;
  TextType: TVSTTextType);
var
  Data: PInfoError;
begin
  Data := Sender.GetNodeData(Node);
  if (Data.Description = deMarkedSubtitle) or
     (Data.Description = ifTotalErrors) or
     (Data.Description = ifFixedErrors) then
    TargetCanvas.Font.Style := TargetCanvas.Font.Style + [fsBold];
end;

// -----------------------------------------------------------------------------

procedure TfrmInfoErrors.lstErrorsGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: WideString);
var
  Data: PInfoError;
  Text: String;
begin
  Data := Sender.GetNodeData(Node);
  if Assigned(Data) then
  begin
    case Column of
      0:
        begin
          if Data.Subtitle > -1 then
            Text := IntToStr(Data.Subtitle) else
            Text := '-';
        end;
      1:
        begin
          case Data.ErrorClass of
            etError       : Text := ErrorTypes[1];
            etWarning     : Text := ErrorTypes[2];
            etInfo        : Text := ErrorTypes[3];
            etFixed       : Text := ErrorTypes[4];
            etCustomInfo  : Text := ErrorTypes[5]; //added by adenry
          end;
        end;
      2:
        begin
          case Data.Description of
            dNone : Text := '';
            //added by adenry: begin
            // ----------- //
            // Custom Info //
            // ----------- //
            dCustomInfo :
            begin
              //7.
              if TPanel(FindComponent('pnlParent' + IntToStr(Data.CustomInfoNum))).Tag = 7 then
              begin
                Text := TCheckBox(FindComponent('chkCaption' + IntToStr(Data.CustomInfoNum))).Caption;
                CellText := StringToWideStringEx(Text, CharSetToCodePage(DEFAULT_CHARSET));
                exit;
              end else
              //6.
              if TPanel(FindComponent('pnlParent' + IntToStr(Data.CustomInfoNum))).Tag = 6 then
              begin
                Text := IntToStr(TEdit(FindComponent('edt1_' + IntToStr(Data.CustomInfoNum))).Tag) + '. ';
                if TEdit(FindComponent('edt1_' + IntToStr(Data.CustomInfoNum))).Tag < 10 then
                  Text := '0' + Text;
                Text := Text + TComboBox(FindComponent('cmb' + IntToStr(Data.CustomInfoNum))).Text + ' ';
                CellText := StringToWideStringEx(Text, CharSetToCodePage(frmMain.Font.Charset));
                Text := TEdit(FindComponent('edt1_' + IntToStr(Data.CustomInfoNum))).Text;
                CellText := CellText + StringToWideStringEx(Text, CharSetToCodePage(frmMain.OrgCharset));
                exit;
              end else
              //1, 2, 3, 4, 5
              begin
                Text := TCheckbox(FindComponent('chkCaption' + IntToStr(Data.CustomInfoNum))).Caption;
                if TEdit(FindComponent('edt1_' + IntToStr(Data.CustomInfoNum))).Text <> '' then
                  Text := Text + ' > ' + TEdit(FindComponent('edt1_' + IntToStr(Data.CustomInfoNum))).Text + ' ' + TLabel(FindComponent('lbl1_' + IntToStr(Data.CustomInfoNum))).Caption;
                if (TEdit(FindComponent('edt1_' + IntToStr(Data.CustomInfoNum))).Text <> '') and (TEdit(FindComponent('edt2_' + IntToStr(Data.CustomInfoNum))).Text <> '') then
                  Text := Text + ' ' + TComboBox(FindComponent('cmb' + IntToStr(Data.CustomInfoNum))).Text;
                if TEdit(FindComponent('edt2_' + IntToStr(Data.CustomInfoNum))).Text <> '' then
                  Text := Text + ' < ' + TEdit(FindComponent('edt2_' + IntToStr(Data.CustomInfoNum))).Text + ' ' + TLabel(FindComponent('lbl2_' + IntToStr(Data.CustomInfoNum))).Caption;
              end;
            end;
            //added by adenry: end
            // ----------- //
            // Information //
            // ----------- //
            ifTotalErrors : Text := Format(InfoMsgs[1], [Data.Tag]);
            ifFixedErrors : Text := Format(InfoMsgs[2], [Data.Tag]);
            // ------------------------------------------------------- //
            // Error reports that appear when you press "Check" button //
            // ------------------------------------------------------- //
            deLinesWithoutLetters  : Text := ErrorReports[01];
            deEmptySubtitle        : Text := ErrorReports[02];
            deOverlapping          : Text := ErrorReports[03];
            deBadValues            : Text := ErrorReports[04];
            deTooLongDuration      : Text := ErrorReports[05];
            deTooShortDuration     : Text := ErrorReports[06];
            deTooLongLine          : Text := ErrorReports[07];
            deOverTwoLines         : Text := ErrorReports[08];
            deHearingImpaired      : Text := ErrorReports[09];
            deTextBeforeColon      : Text := ErrorReports[10];
            deUnnecessaryDots      : Text := ErrorReports[11];
            deProhibitedCharacter  : Text := ErrorReports[12];
            deRepeatedCharacter    : Text := ErrorReports[13];
            deRepeatedSubtitle     : Text := ErrorReports[14];
            deOCRError             : Text := ErrorReports[15];
            deOpnDlgSubsOneLine    : Text := ErrorReports[16];
            deNoSpaceAfterChar     : Text := ErrorReports[17];
            deNoSpaceBeforeChar    : Text := ErrorReports[18];
            deUnnecessarySpaces    : Text := ErrorReports[19];
            deMarkedSubtitle       : Text := ErrorReports[20];
            deUnnecessaryTags      : Text := ErrorReports[21];//added by adenry
            deDashOnFirstLine      : Text := ErrorReports[22];//added by adenry
            deTooMuchCPS           : Text := ErrorReports[23];//added by adenry
            deTooShortPause        : Text := ErrorReports[24];//added by adenry
            deDialogueOnOneLine    : Text := ErrorReports[25];//added by adenry

            // -------------------------------------------------------- //
            // Report of fixes that appears when you press "Fix" button //
            // -------------------------------------------------------- //
            dfLinesWithoutLetters  : Text := FixReports[01];
            dfEmptySubtitle        : Text := FixReports[02];
            dfOverlapping          : Text := FixReports[03];
            dfBadValues            : Text := FixReports[04];
            dfOverTwoLines         : Text := FixReports[05];
            dfHearingImpairedAll   : Text := FixReports[06];
            dfHearingImpairedPart  : Text := FixReports[07];
            dfTextBeforeColon      : Text := FixReports[08];
            dfUnnecessaryDots      : Text := FixReports[09];
            dfProhibitedCharacter  : Text := FixReports[10];
            dfRepeatedCharacter    : Text := FixReports[11];
            dfRepeatedSubtitle     : Text := FixReports[12];
            dfOCRError             : Text := FixReports[13];
            dfOpnDlgSubsOneLine    : Text := FixReports[14];
            dfNoSpaceAfterChar     : Text := FixReports[15];
            dfNoSpaceBeforeChar    : Text := FixReports[16];
            dfUnnecessarySpaces    : Text := FixReports[17];
            dfUnnecessaryTags      : Text := FixReports[18];//added by adenry
            dfDashOnFirstLine      : Text := FixReports[19];//added by adenry
            dfTooMuchCPS           : Text := FixReports[20];//added by adenry
            dfTooShortPause        : Text := FixReports[21];//added by adenry
            dfDialogueOnOneLine    : Text := FixReports[22];//added by adenry
          end;
        end;
    end;
    CellText := StringToWideStringEx(Text, CharSetToCodePage(frmMain.Font.Charset));
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmInfoErrors.AddInfoError(Subtitle: Integer; ErrorClass: TErrorClass; ErrorDescription: TErrorDescription; Tag: Integer = -1; CustomInfoNum: Integer = -1); //CustomInfoNum added by adenry
var
  Data: PInfoError;
  IsVisible: Boolean;
begin
  lstErrors.RootNodeCount := lstErrors.RootNodeCount + 1; //add a new node
  Data                    := lstErrors.GetNodeData(lstErrors.GetLast); //connect the Data var to the new node's Data
  Data.Subtitle           := Subtitle;
  Data.ErrorClass         := ErrorClass;
  Data.Description        := ErrorDescription;
  Data.Tag                := Tag;
  Data.CustomInfoNum      := CustomInfoNum; //added by adenry

  //added by adenry: begin
  //set visibility
  IsVisible := True;
  if not (ErrorClass in VisibleErrorClasses) then
    IsVisible := False;
  if not(ErrorDescription in VisibleTypes) then
    //if ErrorDescription <> dCustomInfo then
    IsVisible := False;
  if ErrorDescription = dCustomInfo then
    if not TCheckBox(FindComponent('chkCaption' + IntToStr(CustomInfoNum))).Checked then IsVisible := False;
  lstErrors.IsVisible[lstErrors.GetLast] := IsVisible;
  lblDisplayed.Caption := Format(InfoMsgs[3], [lstErrors.VisibleCount]);//'Visible: ' + IntToStr(lstErrors.VisibleCount);
  //added by adenry: end
end;

// -----------------------------------------------------------------------------

procedure TfrmInfoErrors.btnSettingsClick(Sender: TObject);
begin
  frmInfoErrorsSettings := TfrmInfoErrorsSettings.Create(Application);
  frmInfoErrorsSettings.ShowModal;
  frmInfoErrorsSettings.Free;
end;

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmInfoErrors.IncLabel(lbl: TLabel);
begin
  lbl.Caption := IntToStr(StrToInt(lbl.Caption) + 1);
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmInfoErrors.DecLabel(lbl: TLabel);
begin
  lbl.Caption := IntToStr(StrToInt(lbl.Caption) - 1);
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmInfoErrors.RecheckNodeErrors(Index: Integer; RecheckType: TRecheckTypes);
var
  Node, Next  : PVirtualNode;
  ErrData     : PInfoError;
  SubData     : PSubtitleItem;
  ErrorsTypes : TErrorTypeSet;
begin
  //remove errors for this node from the errors list
  if RecheckType <> rtSubAdded then
  begin
    Node := lstErrors.GetFirst;
    while Assigned(Node) do
    begin
      Next := Node.NextSibling;
      ErrData := lstErrors.GetNodeData(Node);
      if ErrData.Subtitle = Index + 1 then
      begin
        if (ErrData.ErrorClass = etWarning) or (ErrData.ErrorClass = etError) then
        begin
          Dec(TotalErrors);
          case ErrData.Description of
            deLinesWithoutLetters:  DecLabel(lblCountLinesWithoutLetters);
            deEmptySubtitle:        DecLabel(lblCountEmptySubtitles);
            deOverlapping:          DecLabel(lblCountOverlapping);
            deBadValues:            DecLabel(lblCountBadValues);
            deTooLongDuration:      DecLabel(lblCountTooLongDur);
            deTooShortDuration:     DecLabel(lblCountTooShortDur);
            deTooLongLine:          DecLabel(lblCountTooLongLines);
            deOverTwoLines:         DecLabel(lblCountOverTwoLines);
            deHearingImpaired:      DecLabel(lblCountHearingImpaired);
            deTextBeforeColon:      DecLabel(lblCountTextBeforeColon);
            deUnnecessaryDots:      DecLabel(lblCountUnnecessaryDots);
            deProhibitedCharacter:  DecLabel(lblCountProhibitedChars);
            deRepeatedCharacter:    DecLabel(lblCountRepeatedChars);
            deRepeatedSubtitle:     DecLabel(lblCountRepeatedSubs);
            deOCRError:             DecLabel(lblCountOCRErrors);
            deOpnDlgSubsOneLine:    DecLabel(lblCountOpnDlgInSubsWithOneLine);
            deNoSpaceAfterChar:     DecLabel(lblCountSpaceAfterCustomChars);
            deNoSpaceBeforeChar:    DecLabel(lblCountSpaceAfterCustomChars);
            deUnnecessarySpaces:    DecLabel(lblCountUnnecessarySpaces);
            deUnnecessaryTags:      DecLabel(lblCountUnnecessaryTags);
            deDashOnFirstLine:      DecLabel(lblCountDashOnFirstLine);
            deTooMuchCPS:           DecLabel(lblCountTooMuchCPS);
            deTooShortPause:        DecLabel(lblCountTooShortPause);
            deDialogueOnOneLine:    DecLabel(lblCountDialogueOnOneLine);
            deMarkedSubtitle:       DecLabel(lblCountMarkedSubs);
          end;
        end;
        if ErrData.ErrorClass = etCustomInfo then
          DecLabel(TLabel(FindComponent('lblCount' + IntToStr(ErrData.CustomInfoNum))));
        lstErrors.DeleteNode(Node);
      end;
      Node := Next;
    end;
  end;

  //fix subtitle numbers in errors
  //if a subtitle was added all subtitle numbers from the added subtitle until the last subtitle have increased with one
  if RecheckType = rtSubAdded then
  begin
    Node := lstErrors.GetFirst;
    while Assigned(Node) do
    begin
      ErrData := lstErrors.GetNodeData(Node);
      if ErrData.Subtitle >= Index + 1 then
        ErrData.Subtitle := ErrData.Subtitle + 1;
      Node := Node.NextSibling;
    end;
  end;
  //if a subtitle was deleted all subtitle numbers from the added subtitle until the last subtitle have decreased with one
  if RecheckType = rtSubDeleted then
  begin
    Node := lstErrors.GetFirst;
    while Assigned(Node) do
    begin
      ErrData := lstErrors.GetNodeData(Node);
      if ErrData.Subtitle > Index + 1 then
        ErrData.Subtitle := ErrData.Subtitle - 1;
      Node := Node.NextSibling;
    end;
  end;

  //add the Node's new errors in the error list
  if RecheckType <> rtSubDeleted then
  begin
    //if (ErrorsToCheck.eOCRErrors) and (FileExists(OCRDefFile)) then ParseOCRErrors(OCRDefFile); //removed by adenry later
    Node := GetNodeWithIndex(frmMain.lstSubtitles, Index);
    SubData := frmMain.lstSubtitles.GetNodeData(Node);
    ErrorsTypes := SubData.ErrorType; //ErrorsTypes := GetError(Node, Node.PrevSibling); //no need to check the node's errors here - they have just been checked by AutoRecheckNodeErrors.
    if (etEmptySubtitle        in ErrorsTypes) then begin AddInfoError(Node.Index + 1, etError, deEmptySubtitle);       Inc(TotalErrors); IncLabel(lblCountEmptySubtitles); end;
    if (etLinesWithoutLetters  in ErrorsTypes) then begin AddInfoError(Node.Index + 1, etError, deLinesWithoutLetters); Inc(TotalErrors); IncLabel(lblCountLinesWithoutLetters); end;
    if (etOverlapping          in ErrorsTypes) then begin AddInfoError(Node.Index + 1, etError, deOverlapping);         Inc(TotalErrors); IncLabel(lblCountOverlapping); end;
    if (etBadValues            in ErrorsTypes) then begin AddInfoError(Node.Index + 1, etError, deBadValues);           Inc(TotalErrors); IncLabel(lblCountBadValues); end;
    if (etTooLongDuration      in ErrorsTypes) then begin AddInfoError(Node.Index + 1, etWarning, deTooLongDuration);   Inc(TotalErrors); IncLabel(lblCountTooLongDur); end;
    if (etTooShortDuration     in ErrorsTypes) then begin AddInfoError(Node.Index + 1, etWarning, deTooShortDuration);  Inc(TotalErrors); IncLabel(lblCountTooShortDur); end;
    if (etTooLongLine          in ErrorsTypes) then begin AddInfoError(Node.Index + 1, etWarning, deTooLongLine);       Inc(TotalErrors); IncLabel(lblCountTooLongLines); end;
    if (etOverTwoLines         in ErrorsTypes) then begin AddInfoError(Node.Index + 1, etWarning, deOverTwoLines);      Inc(TotalErrors); IncLabel(lblCountOverTwoLines); end;
    if (etHearingImpaired      in ErrorsTypes) then begin AddInfoError(Node.Index + 1, etError, deHearingImpaired);     Inc(TotalErrors); IncLabel(lblCountHearingImpaired); end;
    if (etTextBeforeColon      in ErrorsTypes) then begin AddInfoError(Node.Index + 1, etWarning, deTextBeforeColon);   Inc(TotalErrors); IncLabel(lblCountTextBeforeColon); end;
    if (etUnnecessaryDots      in ErrorsTypes) then begin AddInfoError(Node.Index + 1, etError, deUnnecessaryDots);     Inc(TotalErrors); IncLabel(lblCountUnnecessaryDots); end;
    if (etProhibitedCharacter  in ErrorsTypes) then begin AddInfoError(Node.Index + 1, etError, deProhibitedCharacter); Inc(TotalErrors); IncLabel(lblCountProhibitedChars); end;
    if (etRepeatedCharacter    in ErrorsTypes) then begin AddInfoError(Node.Index + 1, etError, deRepeatedCharacter);   Inc(TotalErrors); IncLabel(lblCountRepeatedChars); end;
    if (etRepeatedSubtitle     in ErrorsTypes) then begin AddInfoError(Node.Index + 1, etError, deRepeatedSubtitle);    Inc(TotalErrors); IncLabel(lblCountRepeatedSubs); end;
    if (etOCRErrors            in ErrorsTypes) then begin AddInfoError(Node.Index + 1, etError, deOCRError);            Inc(TotalErrors); IncLabel(lblCountOCRErrors); end;
    if (etOpnDlgSubsOneLine    in ErrorsTypes) then begin AddInfoError(Node.Index + 1, etError, deOpnDlgSubsOneLine);   Inc(TotalErrors); IncLabel(lblCountOpnDlgInSubsWithOneLine); end;
    if (etSpaceAfterCustChars  in ErrorsTypes) then begin AddInfoError(Node.Index + 1, etError, deNoSpaceAfterChar);    Inc(TotalErrors); IncLabel(lblCountSpaceAfterCustomChars); end;
    if (etSpaceBeforeCustChars in ErrorsTypes) then begin AddInfoError(Node.Index + 1, etError, deNoSpaceBeforeChar);   Inc(TotalErrors); IncLabel(lblCountSpaceBeforeCustomChars); end;
    if (etUnnecessarySpaces    in ErrorsTypes) then begin AddInfoError(Node.Index + 1, etError, deUnnecessarySpaces);   Inc(TotalErrors); IncLabel(lblCountUnnecessarySpaces); end;
    if (etUnnecessaryTags      in ErrorsTypes) then begin AddInfoError(Node.Index + 1, etError, deUnnecessaryTags);     Inc(TotalErrors); IncLabel(lblCountUnnecessaryTags); end; //added by adenry
    if (etDashOnFirstLine      in ErrorsTypes) then begin AddInfoError(Node.Index + 1, etError, deDashOnFirstLine);     Inc(TotalErrors); IncLabel(lblCountDashOnFirstLine); end; //added by adenry
    if (etTooMuchCPS           in ErrorsTypes) then begin AddInfoError(Node.Index + 1, etWarning, deTooMuchCPS);        Inc(TotalErrors); IncLabel(lblCountTooMuchCPS); end; //added by adenry
    if (etTooShortPause        in ErrorsTypes) then begin AddInfoError(Node.Index + 1, etWarning, deTooShortPause);     Inc(TotalErrors); IncLabel(lblCountTooShortPause); end; //added by adenry
    if (etDialogueOnOneLine    in ErrorsTypes) then begin AddInfoError(Node.Index + 1, etError, deDialogueOnOneLine);   Inc(TotalErrors); IncLabel(lblCountDialogueOnOneLine); end; //added by adenry
    if SubData.Marked                          then begin AddInfoError(Node.Index + 1, etWarning, deMarkedSubtitle);    Inc(TotalErrors); IncLabel(lblCountMarkedSubs); end;

    //all errors for this node are deleted, no need to delete the old custom infos
    CheckCustomInfo(Node);
  end;                    
  
  //refresh labels and sort list
  lblTotalErrors.Caption := Format(InfoMsgs[1], [TotalErrors]);//'Total errors: ' + IntToStr(TotalErrors);
  lblFixedErrors.Visible := False;
  lstErrors.Sort(lstErrors.RootNode, lstErrors.Header.SortColumn, lstErrors.Header.SortDirection);
end;
//added by adenry: end

// -----------------------------------------------------------------------------

procedure TfrmInfoErrors.btnCheckClick(Sender: TObject);
var
  Node, Next  : PVirtualNode;
  Data        : PSubtitleItem;
  ErrData     : PInfoError;
  ErrorsTypes : TErrorTypeSet;
  i           : Integer; //added by adenry
  //TotalErrors : Integer; //removed by adenry
begin
  Screen.Cursor := crHourGlass; //added by adenry
  TotalErrors := 0;
  //added by adenry: begin
  //recheck errors after pressing the Fix errors! button
  if Sender is TButton then
  begin
    Node := lstErrors.GetFirst;
    while Assigned(Node) do
    begin
      Next := Node.NextSibling;
      ErrData := lstErrors.GetNodeData(Node);
      if ErrData.ErrorClass <> etFixed then
        lstErrors.DeleteNode(Node);
      Node := Next;
    end;
  end else
  //added by adenry: end
    lstErrors.Clear;
  btnCheck.Enabled     := False;
  btnFixErrors.Enabled := False;
  //if (ErrorsToCheck.eOCRErrors) and (FileExists(OCRDefFile)) then ParseOCRErrors(OCRDefFile); //removed by adenry later

  //added by adenry: begin
  //clear all error types counters
  lblCountLinesWithoutLetters.Caption := '0';
  lblCountEmptySubtitles.Caption := '0';
  lblCountOverlapping.Caption := '0';
  lblCountBadValues.Caption := '0';
  lblCountTooShortPause.Caption := '0';
  lblCountTooLongDur.Caption := '0';
  lblCountTooShortDur.Caption := '0';
  lblCountTooLongLines.Caption := '0';
  lblCountOverTwoLines.Caption := '0';
  lblCountHearingImpaired.Caption := '0';
  lblCountTextBeforeColon.Caption := '0';
  lblCountUnnecessaryDots.Caption := '0';
  lblCountProhibitedChars.Caption := '0';
  lblCountRepeatedChars.Caption := '0';
  lblCountRepeatedSubs.Caption := '0';
  lblCountOCRErrors.Caption := '0';
  lblCountOpnDlgInSubsWithOneLine.Caption := '0';
  lblCountDashOnFirstLine.Caption := '0';
  lblCountDialogueOnOneLine.Caption := '0';
  lblCountSpaceAfterCustomChars.Caption := '0';
  lblCountSpaceBeforeCustomChars.Caption := '0';
  lblCountUnnecessarySpaces.Caption := '0';
  lblCountUnnecessaryTags.Caption := '0';
  lblCountTooMuchCPS.Caption := '0';
  lblCountMarkedSubs.Caption := '0';
  //added by adenry: end;

  //added by adenry: begin
  //clear all custom info counters
  for i := 1 to CustomInfosLastNumber do
    if FindComponent('lblCount' + IntToStr(i)) <> nil then
      TLabel(FindComponent('lblCount' + IntToStr(i))).Caption := '0';
  //added by adenry: end

  lblDisplayed.Caption := Format(InfoMsgs[3], [lstErrors.RootNodeCount]);//'Visible: 0'; //added by adenry

  with frmMain do
  begin
    Node := lstSubtitles.GetFirst;
    while Assigned(Node) do
    begin
      Data := lstSubtitles.GetNodeData(Node);
      if TControl(Sender).Name = frmMain.Name then
        ErrorsTypes := Data.ErrorType else
        ErrorsTypes := GetError(Node, Node.PrevSibling);
      //IncLabel added everywhere by adenry
      if (etEmptySubtitle        in ErrorsTypes) then begin AddInfoError(Node.Index + 1, etError, deEmptySubtitle); Inc(TotalErrors); IncLabel(lblCountEmptySubtitles); end;
      if (etLinesWithoutLetters  in ErrorsTypes) then begin AddInfoError(Node.Index + 1, etError, deLinesWithoutLetters); Inc(TotalErrors); IncLabel(lblCountLinesWithoutLetters); end;
      if (etOverlapping          in ErrorsTypes) then begin AddInfoError(Node.Index + 1, etError, deOverlapping); Inc(TotalErrors); IncLabel(lblCountOverlapping); end;
      if (etBadValues            in ErrorsTypes) then begin AddInfoError(Node.Index + 1, etError, deBadValues); Inc(TotalErrors); IncLabel(lblCountBadValues); end;
      if (etTooLongDuration      in ErrorsTypes) then begin AddInfoError(Node.Index + 1, etWarning, deTooLongDuration); Inc(TotalErrors); IncLabel(lblCountTooLongDur); end;
      if (etTooShortDuration     in ErrorsTypes) then begin AddInfoError(Node.Index + 1, etWarning, deTooShortDuration); Inc(TotalErrors); IncLabel(lblCountTooShortDur); end;
      if (etTooLongLine          in ErrorsTypes) then begin AddInfoError(Node.Index + 1, etWarning, deTooLongLine); Inc(TotalErrors); IncLabel(lblCountTooLongLines); end;
      if (etOverTwoLines         in ErrorsTypes) then begin AddInfoError(Node.Index + 1, etWarning, deOverTwoLines); Inc(TotalErrors); IncLabel(lblCountOverTwoLines); end;
      if (etHearingImpaired      in ErrorsTypes) then begin AddInfoError(Node.Index + 1, etError, deHearingImpaired); Inc(TotalErrors); IncLabel(lblCountHearingImpaired); end;
      if (etTextBeforeColon      in ErrorsTypes) then begin AddInfoError(Node.Index + 1, etWarning, deTextBeforeColon); Inc(TotalErrors); IncLabel(lblCountTextBeforeColon); end;
      if (etUnnecessaryDots      in ErrorsTypes) then begin AddInfoError(Node.Index + 1, etError, deUnnecessaryDots); Inc(TotalErrors); IncLabel(lblCountUnnecessaryDots); end;
      if (etProhibitedCharacter  in ErrorsTypes) then begin AddInfoError(Node.Index + 1, etError, deProhibitedCharacter); Inc(TotalErrors); IncLabel(lblCountProhibitedChars); end;
      if (etRepeatedCharacter    in ErrorsTypes) then begin AddInfoError(Node.Index + 1, etError, deRepeatedCharacter); Inc(TotalErrors); IncLabel(lblCountRepeatedChars); end;
      if (etRepeatedSubtitle     in ErrorsTypes) then begin AddInfoError(Node.Index + 1, etError, deRepeatedSubtitle); Inc(TotalErrors); IncLabel(lblCountRepeatedSubs); end;
      if (etOCRErrors            in ErrorsTypes) then begin AddInfoError(Node.Index + 1, etError, deOCRError); Inc(TotalErrors); IncLabel(lblCountOCRErrors); end;
      if (etOpnDlgSubsOneLine    in ErrorsTypes) then begin AddInfoError(Node.Index + 1, etError, deOpnDlgSubsOneLine); Inc(TotalErrors); IncLabel(lblCountOpnDlgInSubsWithOneLine); end;
      if (etSpaceAfterCustChars  in ErrorsTypes) then begin AddInfoError(Node.Index + 1, etError, deNoSpaceAfterChar); Inc(TotalErrors); IncLabel(lblCountSpaceAfterCustomChars); end;
      if (etSpaceBeforeCustChars in ErrorsTypes) then begin AddInfoError(Node.Index + 1, etError, deNoSpaceBeforeChar); Inc(TotalErrors); IncLabel(lblCountSpaceBeforeCustomChars); end;
      if (etUnnecessarySpaces    in ErrorsTypes) then begin AddInfoError(Node.Index + 1, etError, deUnnecessarySpaces); Inc(TotalErrors); IncLabel(lblCountUnnecessarySpaces); end;
      if (etUnnecessaryTags      in ErrorsTypes) then begin AddInfoError(Node.Index + 1, etError, deUnnecessaryTags); Inc(TotalErrors); IncLabel(lblCountUnnecessaryTags); end; //added by adenry
      if (etDashOnFirstLine      in ErrorsTypes) then begin AddInfoError(Node.Index + 1, etError, deDashOnFirstLine); Inc(TotalErrors); IncLabel(lblCountDashOnFirstLine); end; //added by adenry
      if (etTooMuchCPS           in ErrorsTypes) then begin AddInfoError(Node.Index + 1, etWarning, deTooMuchCPS); Inc(TotalErrors); IncLabel(lblCountTooMuchCPS); end; //added by adenry
      if (etTooShortPause        in ErrorsTypes) then begin AddInfoError(Node.Index + 1, etWarning, deTooShortPause); Inc(TotalErrors); IncLabel(lblCountTooShortPause); end; //added by adenry
      if (etDialogueOnOneLine    in ErrorsTypes) then begin AddInfoError(Node.Index + 1, etError, deDialogueOnOneLine); Inc(TotalErrors); IncLabel(lblCountDialogueOnOneLine); end; //added by adenry
      if Data.Marked                             then begin AddInfoError(Node.Index + 1, etWarning, deMarkedSubtitle); Inc(TotalErrors); IncLabel(lblCountMarkedSubs); end;

      //CheckCustomInfo(Node); //added by adenry

      Node := Node.NextSibling;
    end;
    CheckCustomInfo(nil); //added by adenry

    //AddInfoError(-1, etInfo, ifTotalErrors, TotalErrors); //removed by adenry
    lblTotalErrors.Caption := Format(InfoMsgs[1], [TotalErrors]);//'Total errors: ' + IntToStr(TotalErrors); //added by adenry
    if not(Sender is TButton) then //added by adenry later
      lblFixedErrors.Visible := False; //added by adenry
    lstErrors.Sort(lstErrors.RootNode, lstErrors.Header.SortColumn, lstErrors.Header.SortDirection); //added by adenry

    lstErrors.ScrollIntoView(lstErrors.GetLast, True);
    lstSubtitles.Refresh;
  end;

  if not(TButton(Sender) = btnFixErrors) then //added by adenry later //fixed later
  begin
    btnCheck.Enabled     := True;
    btnFixErrors.Enabled := True;
    Screen.Cursor := crDefault; //added by adenry
  end;
end;

// -----------------------------------------------------------------------------

//added by adenry: begin
//procedure TfrmInfoErrors.CheckCustomInfo(NodeToCheck: PVirtualNode; CustomInfoN: Integer = -1; formName: String = 'frmInfoErrors');
function TfrmInfoErrors.CheckCustomInfo(NodeToCheck: PVirtualNode; CustomInfoN: Integer = -1; formName: String = 'frmInfoErrors'): Boolean;
var
  Node                          : PVirtualNode;
  CurrNode, FirstNode, LastNode : Integer;
  Data, PrevData                : PSubtitleItem;
  i, num1, num2                 : Integer;
  start, finish                 : Integer;
  ShouldAddInfoError            : Boolean;
  CaseSensitive                 : Boolean;
  RegExprErrMessage             : String;
  form                          : TForm;
begin
  Result := False;
  if (CustomInfosCount > 0) and (frmMain.lstSubtitles.RootNodeCount > 0) then
  begin
    //added later: begin
    if frmInfoErrors.Name = formName then
      form := frmInfoErrors else
      form := TFrmCompositeCustomInfo(frmMain.FindComponent(formName));
    if not Assigned(form) then exit; //just in case
    //added later: end

    if NodeToCheck = nil then
    begin
      FirstNode   := frmMain.lstSubtitles.GetFirst.Index;
      LastNode  := frmMain.lstSubtitles.GetLast.Index;
    end else
    begin
      FirstNode   := NodeToCheck.Index;
      LastNode  := NodeToCheck.Index;
    end;

    for CurrNode := FirstNode to LastNode do
    begin
      Node := GetNodeWithIndex(frmMain.lstSubtitles, CurrNode);
      Data := frmMain.lstSubtitles.GetNodeData(Node);
      PrevData := frmMain.lstSubtitles.GetNodeData(Node.PrevSibling);

      if CustomInfoN = -1 then
      begin
        start := 1;
        finish := CustomInfosLastNumber;
      end else
      begin
        start := CustomInfoN;
        finish := CustomInfoN;
      end;

      for i := start to finish do
      with form do //added later
      begin
        ShouldAddInfoError := False;
        if FindComponent('pnlParent' + IntToStr(i)) <> nil then
        begin
          //if TCheckBox(FindComponent('chkCaption' + IntToStr(i))).Checked then
            //7. Composite Info
            if TPanel(FindComponent('pnlParent' + IntToStr(i))).Tag = 7 then
            begin
              if TCheckbox(FindComponent('chkCaption' + IntToStr(i))).Enabled then //added later
                if CheckCompositeCustomInfo(Node, i) then ShouldAddInfoError := True;
            end else
            //6. Text
            if TPanel(FindComponent('pnlParent' + IntToStr(i))).Tag = 6 then
            begin
              if TEdit(FindComponent('edt1_' + IntToStr(i))).Text <> '' then
                //Regular Expression //added later
                if TComboBox(FindComponent('cmb' + IntToStr(i))).ItemIndex >= 4 then
                begin
                  if TCheckbox(FindComponent('chkCaption' + IntToStr(i))).Enabled then //added later
                  try
                    if TComboBox(FindComponent('cmb' + IntToStr(i))).ItemIndex = 4 then
                    begin
                      if ExecRegExpr(TEdit(FindComponent('edt1_' + IntToStr(i))).Text, Data.Text) then ShouldAddInfoError := True;
                    end else
                      if ExecRegExpr(TEdit(FindComponent('edt1_' + IntToStr(i))).Text, RemoveSWTags(Data.Text, True, True, True, True, True)) then ShouldAddInfoError := True;
                  except
                    on E: Exception do
                      //if TCheckbox(FindComponent('chkCaption' + IntToStr(i))).Enabled then
                      if formName = 'frmInfoErrors' then
                      begin
                        TCheckbox(FindComponent('chkCaption' + IntToStr(i))).Checked := False;
                        TCheckbox(FindComponent('chkCaption' + IntToStr(i))).Enabled := False; //added later
                        RegExprErrMessage := Format(ErrorMsg[21], [IntToStr(i)]);
                        if E is ERegExpr then
                          RegExprErrMessage := RegExprErrMessage + ':|' + ReplaceString(E.Message, 'TRegExpr(comp): ', '') else
                          RegExprErrMessage := RegExprErrMessage + '.';
                        RegExprErrMessage := RegExprErrMessage + '||' + Format(ErrorMsg[22], [i]);
                        MsgBox(RegExprErrMessage, BTN_OK, '', '', MB_ICONERROR, Self);
                      end else
                      begin
                        TCheckbox(frmInfoErrors.FindComponent('chkCaption' + IntToStr(form.Tag))).Checked := False;
                        TCheckbox(frmInfoErrors.FindComponent('chkCaption' + IntToStr(form.Tag))).Enabled := False;
                        RegExprErrMessage := Format(ErrorMsg[21], [IntToStr(form.Tag) + ': ' + IntToStr(i)]);
                        if E is ERegExpr then
                          RegExprErrMessage := RegExprErrMessage + ':|' + ReplaceString(E.Message, 'TRegExpr(comp): ', '') else
                          RegExprErrMessage := RegExprErrMessage + '.';
                        RegExprErrMessage := RegExprErrMessage + '||' + Format(ErrorMsg[22], [form.Tag]);
                        MsgBox(RegExprErrMessage, BTN_OK, '', '', MB_ICONERROR, Self);
                      end;
                  end;
                end else
                //Contains the text
                if TComboBox(FindComponent('cmb' + IntToStr(i))).ItemIndex < 2 then
                begin
                  if TComboBox(FindComponent('cmb' + IntToStr(i))).ItemIndex = 0 then
                    CaseSensitive := True else
                    CaseSensitive := False;
                  if SmartPos(TEdit(FindComponent('edt1_' + IntToStr(i))).Text, Data.Text, CaseSensitive) > 0 then ShouldAddInfoError := True;
                end else
                //Does not contain the text
                begin
                  if TComboBox(FindComponent('cmb' + IntToStr(i))).ItemIndex = 2 then
                    CaseSensitive := True else
                    CaseSensitive := False;
                  if SmartPos(TEdit(FindComponent('edt1_' + IntToStr(i))).Text, Data.Text, CaseSensitive) = 0 then ShouldAddInfoError := True;
                end;
            end else
            //1, 2, 3, 4, 5: edt2_ is empty
            if (TEdit(FindComponent('edt1_' + IntToStr(i))).Text <> '') and (TEdit(FindComponent('edt2_' + IntToStr(i))).Text = '') then
            begin
              num1 := StrToInt(TEdit(FindComponent('edt1_' + IntToStr(i))).Text);
              case TPanel(FindComponent('pnlParent' + IntToStr(i))).Tag of
                {Duration}      1: if Data.FinalTime - Data.InitialTime > num1 then ShouldAddInfoError := True;
                {Lines length}  2: if HasTooLongLine(Data.Text, num1 + 1) then ShouldAddInfoError := True;
                {Lines count}   3: if CountLines(Data.Text) > num1 then ShouldAddInfoError := True;
                {Pause length}  4: if Node <> frmMain.lstSubtitles.GetFirst then
                                     if Data.InitialTime - num1 > PrevData.FinalTime then ShouldAddInfoError := True;
                {CPS}           5: if HasTooMuchCPS(RemoveSWTags(Data.Text,True,True,True,True), Data.FinalTime - Data.InitialTime, num1) then ShouldAddInfoError := True;
              end;
            end else
            //1, 2, 3, 4, 5: edt1_ is empty
            if (TEdit(FindComponent('edt1_' + IntToStr(i))).Text = '') and (TEdit(FindComponent('edt2_' + IntToStr(i))).Text <> '') then
            begin
              num2 := StrToInt(TEdit(FindComponent('edt2_' + IntToStr(i))).Text);
              case TPanel(FindComponent('pnlParent' + IntToStr(i))).Tag of
                {Duration}      1: if Data.FinalTime - Data.InitialTime < num2 then ShouldAddInfoError := True;
                {Lines length}  2: if not HasTooLongLine(Data.Text, num2) then ShouldAddInfoError := True;
                {Lines count}   3: if CountLines(Data.Text) < num2 then ShouldAddInfoError := True;
                {Pause length}  4: if Node <> frmMain.lstSubtitles.GetFirst then
                                     if Data.InitialTime - num2 < PrevData.FinalTime then ShouldAddInfoError := True;
                {CPS}           5: if not HasTooMuchCPS(RemoveSWTags(Data.Text,True,True,True,True), Data.FinalTime - Data.InitialTime, num2 - 1) then ShouldAddInfoError := True;
              end;
            end else
            //1, 2, 3, 4, 5: both are not empty
            if (TEdit(FindComponent('edt1_' + IntToStr(i))).Text <> '') and (TEdit(FindComponent('edt2_' + IntToStr(i))).Text <> '') then
            begin
              num1 := StrToInt(TEdit(FindComponent('edt1_' + IntToStr(i))).Text);
              num2 := StrToInt(TEdit(FindComponent('edt2_' + IntToStr(i))).Text);
              if TComboBox(FindComponent('cmb' + IntToStr(i))).ItemIndex = 0 then
              begin
              //AND
                case TPanel(FindComponent('pnlParent' + IntToStr(i))).Tag of
                  {Duration}      1: if (Data.FinalTime - Data.InitialTime > num1) and (Data.FinalTime - Data.InitialTime < num2) then ShouldAddInfoError := True;
                  {Lines length}  2: if (HasTooLongLine(Data.Text, num1 + 1)) and (not HasTooLongLine(Data.Text, num2)) then ShouldAddInfoError := True;
                  {Lines count}   3: if (CountLines(Data.Text) > num1) and (CountLines(Data.Text) < num2) then ShouldAddInfoError := True;
                  {Pause length}  4: if Node <> frmMain.lstSubtitles.GetFirst then
                                       if (Data.InitialTime - num1 > PrevData.FinalTime) and (Data.InitialTime - num2 < PrevData.FinalTime) then ShouldAddInfoError := True;
                  {CPS}           5: if (HasTooMuchCPS(RemoveSWTags(Data.Text,True,True,True,True), Data.FinalTime - Data.InitialTime, num1)) and (not HasTooMuchCPS(RemoveSWTags(Data.Text,True,True,True,True), Data.FinalTime - Data.InitialTime, num2 - 1)) then ShouldAddInfoError := True;
                end;
              end else
              //OR
                case TPanel(FindComponent('pnlParent' + IntToStr(i))).Tag of
                  {Duration}      1: if (Data.FinalTime - Data.InitialTime > num1) or (Data.FinalTime - Data.InitialTime < num2) then ShouldAddInfoError := True;
                  {Lines length}  2: if (HasTooLongLine(Data.Text, num1 + 1)) or (not HasTooLongLine(Data.Text, num2)) then ShouldAddInfoError := True;
                  {Lines count}   3: if (CountLines(Data.Text) > num1) or (CountLines(Data.Text) < num2) then ShouldAddInfoError := True;
                  {Pause length}  4: if Node <> frmMain.lstSubtitles.GetFirst then
                                       if (Data.InitialTime - num1 > PrevData.FinalTime) or (Data.InitialTime - num2 < PrevData.FinalTime) then ShouldAddInfoError := True;
                  {CPS}           5: if (HasTooMuchCPS(RemoveSWTags(Data.Text,True,True,True,True), Data.FinalTime - Data.InitialTime, num1)) or (not HasTooMuchCPS(RemoveSWTags(Data.Text,True,True,True,True), Data.FinalTime - Data.InitialTime, num2 - 1)) then ShouldAddInfoError := True;
                end;
            end;
        end;
        if ShouldAddInfoError then
        begin
          if formName = 'frmInfoErrors' then
          begin
            AddInfoError(Node.Index + 1, etCustomInfo, dCustomInfo, -1, i);
            //refresh custom info counter
            IncLabel(TLabel(FindComponent('lblCount' + IntToStr(i))));
          end;
          Result := True;
        end;
      end;
    end;
    lblDisplayed.Caption := Format(InfoMsgs[3], [lstErrors.VisibleCount]);//'Visible: ' + IntToStr(lstErrors.VisibleCount);
  end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmInfoErrors.DeleteCustomInfo(Node: PVirtualNode; CustomInfoN: Integer = -1);
var
  ErrData           : PInfoError;
  ErrNode, ErrNext  : PVirtualNode;
  i, start, finish  : Integer;
  CheckForDeletion  : Boolean;
begin
    if CustomInfoN = -1 then
    begin
      start := 1;
      finish := CustomInfosLastNumber;
    end else
    begin
      start := CustomInfoN;
      finish := CustomInfoN;
    end;

    for i := start to finish do
    begin
      ErrNode := lstErrors.GetFirst;
      while Assigned(ErrNode) do
      begin
        ErrNext := ErrNode.NextSibling;
        ErrData := lstErrors.GetNodeData(ErrNode);
        CheckForDeletion := False;
        if Node = nil then
          CheckForDeletion := True else
          if Integer(Node.Index + 1) = ErrData.Subtitle then
            CheckForDeletion := True;
        if CheckForDeletion then
          if ErrData.CustomInfoNum = i then
          begin
            lstErrors.DeleteNode(ErrNode);
            TLabel(FindComponent('lblCount' + IntToStr(i))).Caption := IntToStr(StrToInt(TLabel(FindComponent('lblCount' + IntToStr(i))).Caption) -1);
          end;
        ErrNode := ErrNext;
      end;
    end;
    lblDisplayed.Caption := Format(InfoMsgs[3], [lstErrors.VisibleCount]);//'Visible: ' + IntToStr(lstErrors.VisibleCount);
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmInfoErrors.DeleteAllCustomInfos;
var
  Node, NextNode  : PVirtualNode;
  Data            : PInfoError;
  i               : Integer;
begin
  Node := lstErrors.GetFirst;
  while Assigned(Node) do
  begin
    NextNode := Node.NextSibling;
    Data := lstErrors.GetNodeData(Node);
    if Data.ErrorClass = etCustomInfo then
      lstErrors.DeleteNode(Node);
    Node := NextNode;
  end;
  //clear all custom info counters
  for i := 1 to CustomInfosLastNumber do
    if FindComponent('lblCount' + IntToStr(i)) <> nil then
      TLabel(FindComponent('lblCount' + IntToStr(i))).Caption := '0';
  lblDisplayed.Caption := Format(InfoMsgs[3], [lstErrors.VisibleCount]);//'Visible: ' + IntToStr(lstErrors.VisibleCount);
end;
//added by adenry: end

// -----------------------------------------------------------------------------

procedure TfrmInfoErrors.btnFixErrorsClick(Sender: TObject);
var
  Data, Data2 : PSubtitleItem;
  Node        : PVirtualNode;
  Sib         : PVirtualNode;
  FixTypeSet  : TFixTypesSet;
  UndoAction  : PUndoAction;
  //FixedErrors : Integer; //moved by adenry
begin
  Screen.Cursor := crHourGlass; //added by adenry
  FixedErrors := 0;
  //lstErrors.Clear; //removed by adenry
  btnCheck.Enabled     := False;
  btnFixErrors.Enabled := False;
  //if (ErrorsToFix.eOCRErrors) and (FileExists(OCRDefFile)) then ParseOCRErrors(OCRDefFile); //removed by adenry later
  with frmMain do
  begin
    Node := lstSubtitles.GetFirst;
    while Assigned(Node) do
    begin
      Sib := Node.NextSibling;

      // Delete:
      //   ftEmptySubtitleDeleted
      //   ftRepeatedSubtitle
      //   ftSubDeletedProhibitedCharacter
      //   ftHearingImpairedDeleted

      Data := lstSubtitles.GetNodeData(Node);

      New(UndoAction);
      UndoAction^.UndoActionType := uaFullSubChange;
      UndoAction^.UndoActionName := uanInfoErrorsFix; //added by adenry
      UndoAction^.BufferSize     := SizeOf(TLineChange);
      UndoAction^.Buffer         := AllocMem(UndoAction^.BufferSize);
      UndoAction^.Node           := Node;
      UndoAction^.LineNumber     := Node.Index;
      UndoAction^.BindToNext     := True;
      PLineChange(UndoAction^.Buffer).SubtitleItem := Data^;

      FixTypeSet := FixError(Node, Node.PrevSibling, chkConfirm.Checked, Self);
      //frmMain.AutoRecheckNodeErrors(Node); //added later by adenry

      if (ftEmptySubtitleDeleted in FixTypeSet)          or
         (ftRepeatedSubtitle in FixTypeSet)              or
         (ftSubDeletedProhibitedCharacter in FixTypeSet) or
         (ftHearingImpairedDeleted in FixTypeSet)        then
      begin
        New(UndoAction);
        UndoAction^.UndoActionType                    := uaDeleteLine;
        UndoAction^.UndoActionName                    := uanInfoErrorsFix; //added by adenry
        UndoAction^.BufferSize                        := SizeOf(TLineChange);
        UndoAction^.Buffer                            := AllocMem(UndoAction^.BufferSize);
        UndoAction^.BindToNext                        := True;
        UndoAction^.LineNumber                        := Node.Index;
        PLineChange(UndoAction^.Buffer)^.SubtitleItem := Data^;
        AddUndo(UndoAction);
      end else
      begin
        Data2 := lstSubtitles.GetNodeData(Node);
        if (PLineChange(UndoAction^.Buffer).SubtitleItem.InitialTime <> Data2^.InitialTime) or
           (PLineChange(UndoAction^.Buffer).SubtitleItem.FinalTime   <> Data2^.FinalTime)   or
           (PLineChange(UndoAction^.Buffer).SubtitleItem.Text        <> Data2^.Text)        or
           (PLineChange(UndoAction^.Buffer).SubtitleItem.Translation <> Data2^.Translation) or
           (PLineChange(UndoAction^.Buffer).SubtitleItem.ErrorType   <> Data2^.ErrorType)   then
        AddUndo(UndoAction);
      end;

      if ftLinesWithoutLettersDeleted in FixTypeSet then begin AddInfoError(Node.Index + 1, etFixed, dfLinesWithoutLetters); Inc(FixedErrors); end;
      if ftEmptySubtitleDeleted in FixTypeSet then
      begin
        AddInfoError(Node.Index + 1, etFixed, dfEmptySubtitle);
        Inc(FixedErrors);
        lstSubtitles.DeleteNode(Node);
      end;
      if ftOverlapping           in FixTypeSet then begin AddInfoError(Node.Index + 1, etFixed, dfOverlapping); Inc(FixedErrors); end;
      if ftBadValues             in FixTypeSet then begin AddInfoError(Node.Index + 1, etFixed, dfBadValues); Inc(FixedErrors); end;
      if ftOverTwoLinesAdjusted  in FixTypeSet then begin AddInfoError(Node.Index + 1, etFixed, dfOverTwoLines); Inc(FixedErrors); end;
      if ftHearingImpairedDeleted in FixTypeSet then
      begin
        AddInfoError(Node.Index + 1, etFixed, dfHearingImpairedAll);
        Inc(FixedErrors);
        lstSubtitles.DeleteNode(Node);
      end;
      if ftHearingImpairedPartDeleted    in FixTypeSet then begin AddInfoError(Node.Index + 1, etFixed, dfHearingImpairedPart); Inc(FixedErrors); end;
      if ftTextBeforeColon               in FixTypeSet then begin AddInfoError(Node.Index + 1, etFixed, dfTextBeforeColon); Inc(FixedErrors); end;
      if ftUnnecessaryDots               in FixTypeSet then begin AddInfoError(Node.Index + 1, etFixed, dfUnnecessaryDots); Inc(FixedErrors); end;
      if ftSubDeletedProhibitedCharacter in FixTypeSet then
      begin
        AddInfoError(Node.Index + 1, etFixed, dfProhibitedCharacter);
        Inc(FixedErrors);
        lstSubtitles.DeleteNode(Node);
      end;
      if ftRepeatedCharacter in FixTypeSet then AddInfoError(Node.Index + 1, etFixed, dfRepeatedCharacter);
      if ftRepeatedSubtitle in FixTypeSet then
      begin
        AddInfoError(Node.Index + 1, etFixed, dfRepeatedSubtitle);
        Inc(FixedErrors);
        lstSubtitles.DeleteNode(Node);
      end;
      if ftOCRErrors               in FixTypeSet then begin AddInfoError(Node.Index + 1, etFixed, dfOCRError); Inc(FixedErrors); end;
      if ftOpnDlgOneLineSubDeleted in FixTypeSet then begin AddInfoError(Node.Index + 1, etFixed, dfOpnDlgSubsOneLine); Inc(FixedErrors); end;
      if ftSpaceAfterCustChars     in FixTypeSet then begin AddInfoError(Node.Index + 1, etFixed, dfNoSpaceAfterChar); Inc(FixedErrors); end;
      if ftSpaceBeforeCustChars    in FixTypeSet then begin AddInfoError(Node.Index + 1, etFixed, dfNoSpaceBeforeChar); Inc(FixedErrors); end;
      if ftUnnecessarySpaces       in FixTypeSet then begin AddInfoError(Node.Index + 1, etFixed, dfUnnecessarySpaces); Inc(FixedErrors); end;
      if ftUnnecessaryTags         in FixTypeSet then begin AddInfoError(Node.Index + 1, etFixed, dfUnnecessaryTags); Inc(FixedErrors); end;//added by adenry
      if ftDashOnFirstLine         in FixTypeSet then begin AddInfoError(Node.Index + 1, etFixed, dfDashOnFirstLine); Inc(FixedErrors); end;//added by adenry
      if ftTooMuchCPS              in FixTypeSet then begin AddInfoError(Node.Index + 1, etFixed, dfTooMuchCPS); Inc(FixedErrors); end;//added by adenry
      if ftTooShortPause           in FixTypeSet then begin AddInfoError(Node.Index + 1, etFixed, dfTooShortPause); Inc(FixedErrors); end;//added by adenry
      if ftDialogueOnOneLine       in FixTypeSet then begin AddInfoError(Node.Index + 1, etFixed, dfDialogueOnOneLine); Inc(FixedErrors); end;//added by adenry

      if CancelProcess then
      begin
        CancelProcess        := False;
        OrgModified          := True;
        TransModified        := True;
        //AddInfoError(-1, etInfo, ifFixedErrors, FixedErrors); //removed by adenry
        lblFixedErrors.Caption := Format(InfoMsgs[2], [FixedErrors]);//'Fixed errors: ' + IntToStr(FixedErrors); //added by adenry
        lblFixedErrors.Visible := True; //added by adenry
        lstErrors.Sort(lstErrors.RootNode, lstErrors.Header.SortColumn, lstErrors.Header.SortDirection); //added by adenry
        lstErrors.ScrollIntoView(lstErrors.GetLast, True);
        if UndoList.Count > 0 then
          PUndoAction(UndoList.Last)^.BindToNext := False;
        btnCheckClick(btnFixErrors); //added by adenry later
        AutoRecheckAllErrors; //added by adenry later
        //lstSubtitles.Refresh; //AutoRecheckAllErrors calls lstSubtitles.Refresh
        RefreshTimes;
        btnCheck.Enabled     := True;
        btnFixErrors.Enabled := True;
        Screen.Cursor := crDefault; //added by adenry later
        exit;
      end;

      Node := Sib;
    end;

    //AddInfoError(-1, etInfo, ifFixedErrors, FixedErrors); //removed by adenry
    lblFixedErrors.Caption := Format(InfoMsgs[2], [FixedErrors]);//'Fixed errors: ' + IntToStr(FixedErrors); //added by adenry
    lblFixedErrors.Visible := True; //added by adenry
    lstErrors.Sort(lstErrors.RootNode, lstErrors.Header.SortColumn, lstErrors.Header.SortDirection); //added by adenry

    lstErrors.ScrollIntoView(lstErrors.GetLast, True);

    if UndoList.Count > 0 then
      PUndoAction(UndoList.Last)^.BindToNext := False;
    //lstSubtitles.Refresh; //AutoRecheck***Errors refreshes it
    RefreshTimes;
    OrgModified   := True;
    TransModified := True;

    btnCheckClick(btnFixErrors); //added later by adenry
    AutoRecheckAllErrors; //added by adenry when making optimization
  end;

  btnCheck.Enabled     := True;
  btnFixErrors.Enabled := True;
  Screen.Cursor := crDefault; //added by adenry
end;

// -----------------------------------------------------------------------------

procedure TfrmInfoErrors.lstErrorsDblClick(Sender: TObject);
var
  Data : PInfoError;
  Node : PVirtualNode;
begin
  Data := lstErrors.GetNodeData(lstErrors.FocusedNode);
  if Assigned(Data) then
  begin
    if Data.Subtitle > 0 then
    begin
      Node := GetNodeWithIndex(frmMain.lstSubtitles, Data.Subtitle - 1);
      frmMain.lstSubtitles.ScrollIntoView(Node, True);
      frmMain.lstSubtitles.Selected[frmMain.lstSubtitles.FocusedNode] := False;
      frmMain.lstSubtitles.FocusedNode := Node;
      frmMain.lstSubtitles.Selected[Node] := True;
      frmMain.RefreshTimes;
      if (fsModal in FormState) then //added by adenry
        Close;
    end;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmInfoErrors.FormActivate(Sender: TObject);
begin
  if fsModal in FormState then //added by adenry
  begin
    Refresh;
    btnCheckClick(frmInfoErrors);
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmInfoErrors.FormCreate(Sender: TObject);
var
  Ini     : TIniFile;
begin
  SetLanguage;
  Ini := TIniFile.Create(IniRoot);
  try
    chkConfirm.Checked := Ini.ReadBool('Information and Errors', 'Confirm each deletion', True);

    //added by adenry: begin
    //FORM AND LIST PROPERTIES
    BottomAreaHeight                    := btnOk.Height + 2*pnlInfoErrorsWrapper.Top; //ClientHeight + pnlInfoErrorsWrapper.Top - btnOk.Top; //ClientHeight - pnlInfoErrorsWrapper.Top - pnlInfoErrorsWrapper.Height;
    Width                               := Ini.ReadInteger('Information and Errors', 'Width', Width-ClientWidth+btnOk.Left+btnOk.Width+btnSettings.Left);
    Height                              := Ini.ReadInteger('Information and Errors', 'Height', 550);
    Left                                := Ini.ReadInteger('Information and Errors', 'Left', (Screen.Width-Width) div 2); //added later
    Top                                 := Ini.ReadInteger('Information and Errors', 'Top', (Screen.Height-Height) div 2); //added later
    //SetWindowPos(Handle, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE + SWP_NOSIZE); //added later later
    lstErrors.Header.Columns[0].Width   := Ini.ReadInteger('Information and Errors', 'Column 1 width', 50);
    lstErrors.Header.Columns[1].Width   := Ini.ReadInteger('Information and Errors', 'Column 2 width', 80);
    lstErrors.Header.Columns[2].Width   := Ini.ReadInteger('Information and Errors', 'Column 3 width', lstErrors.ClientWidth-lstErrors.Header.Columns[0].Width-lstErrors.Header.Columns[1].Width);
    lstErrors.Header.SortColumn         := Ini.ReadInteger('Information and Errors', 'Sort column', 0); //added later
    lstErrors.Header.SortDirection      := TSortDirection(Ini.ReadInteger('Information and Errors', 'Sort direction', 0)); //added later
    //added by adenry: end

    //added by adenry: begin
    //ERROR CLASSES
    sbShowHideErrorType.Down            := Ini.ReadBool('Information and Errors', 'Error type visible', True);
    sbShowHideWarningType.Down          := Ini.ReadBool('Information and Errors', 'Warning type visible', True);
    sbShowHideFixedType.Down            := Ini.ReadBool('Information and Errors', 'Fixed type visible', True);
    sbShowHideCustomInfoType.Down       := Ini.ReadBool('Information and Errors', 'Custom info type visible', True);

    VisibleErrorClasses                 := [];
    if sbShowHideErrorType.Down         then VisibleErrorClasses := VisibleErrorClasses + [etError];
    if sbShowHideWarningType.Down       then VisibleErrorClasses := VisibleErrorClasses + [etWarning];
    if sbShowHideFixedType.Down         then VisibleErrorClasses := VisibleErrorClasses + [etFixed];
    if sbShowHideCustomInfoType.Down    then VisibleErrorClasses := VisibleErrorClasses + [etCustomInfo];
    //added by adenry: end
                                               
    //added by adenry: begin
    //ERROR TYPES
    sbErrorTypes.Down                   := Ini.ReadBool('Information and Errors error types', 'Show error types', True);
    pnlErrorTypes.Visible               := sbErrorTypes.Down;
    SetCheckedTypesFromString(Ini.ReadString('Information and Errors error types', 'Checked types', '11111111111111111111111111111111111111111111111111'), True);
    LoadErrorTypesSets;

    VisibleTypes                          := [dCustomInfo];//[];
    if chkMarkedSubs.Checked              then VisibleTypes := VisibleTypes + [deMarkedSubtitle];
    if chkLinesWithoutLetters.Checked     then VisibleTypes := VisibleTypes + [deLinesWithoutLetters] + [dfLinesWithoutLetters];
    if chkEmptySubtitles.Checked          then VisibleTypes := VisibleTypes + [deEmptySubtitle] + [dfEmptySubtitle];
    if chkOverlapping.Checked             then VisibleTypes := VisibleTypes + [deOverlapping] + [dfOverlapping];
    if chkBadValues.Checked               then VisibleTypes := VisibleTypes + [deBadValues] + [dfBadValues];
    if chkTooShortPause.Checked           then VisibleTypes := VisibleTypes + [deTooShortPause] + [dfTooShortPause];
    if chkTooLongDur.Checked              then VisibleTypes := VisibleTypes + [deTooLongDuration] {+ [dfTooLongDuration]};
    if chkTooShortDur.Checked             then VisibleTypes := VisibleTypes + [deTooShortDuration] {+ [dfTooShortDuration]};
    if chkTooLongLines.Checked            then VisibleTypes := VisibleTypes + [deTooLongLine] {+ [dfTooLongLine]};
    if chkOverTwoLines.Checked            then VisibleTypes := VisibleTypes + [deOverTwoLines] + [dfOverTwoLines];
    if chkHearingImpaired.Checked         then VisibleTypes := VisibleTypes + [deHearingImpaired] + [dfHearingImpairedAll] + [dfHearingImpairedPart];
    if chkTextBeforeColon.Checked         then VisibleTypes := VisibleTypes + [deTextBeforeColon] + [dfTextBeforeColon];
    if chkUnnecessaryDots.Checked         then VisibleTypes := VisibleTypes + [deUnnecessaryDots] + [dfUnnecessaryDots];
    if chkProhibitedChars.Checked         then VisibleTypes := VisibleTypes + [deProhibitedCharacter] + [dfProhibitedCharacter];
    if chkRepeatedChars.Checked           then VisibleTypes := VisibleTypes + [deRepeatedCharacter] + [dfRepeatedCharacter];
    if chkRepeatedSubs.Checked            then VisibleTypes := VisibleTypes + [deRepeatedSubtitle] + [dfRepeatedCharacter];
    if chkOCRErrors.Checked               then VisibleTypes := VisibleTypes + [deOCRError] + [dfOCRError];
    if chkOpnDlgInSubsWithOneLine.Checked then VisibleTypes := VisibleTypes + [deOpnDlgSubsOneLine] + [dfOpnDlgSubsOneLine];
    if chkDashOnFirstLine.Checked         then VisibleTypes := VisibleTypes + [deDashOnFirstLine] + [dfDashOnFirstLine];
    if chkDialogueOnOneLine.Checked       then VisibleTypes := VisibleTypes + [deDialogueOnOneLine] + [dfDialogueOnOneLine];
    if chkSpaceAfterCustomChars.Checked   then VisibleTypes := VisibleTypes + [deNoSpaceAfterChar] + [dfNoSpaceAfterChar];
    if chkSpaceBeforeCustomChars.Checked  then VisibleTypes := VisibleTypes + [deNoSpaceBeforeChar] + [dfNoSpaceBeforeChar];
    if chkUnnecessarySpaces.Checked       then VisibleTypes := VisibleTypes + [deUnnecessarySpaces] + [dfUnnecessarySpaces];
    if chkUnnecessaryTags.Checked         then VisibleTypes := VisibleTypes + [deUnnecessaryTags] + [dfUnnecessaryTags];
    if chkTooMuchCPS.Checked              then VisibleTypes := VisibleTypes + [deTooMuchCPS] + [dfTooMuchCPS];
    SetErrorTypesCheckboxesEnabledState;
    //added by adenry: end

    //added by adenry: begin
    //CUSTOM INFO
    CIHeight                                  := btnOk.Height;
    MaxVisibleCIs                             := 6;
    pnlInsideScrollBox.Constraints.MinHeight  := CIHeight;
    scrollboxCustomInfo.Constraints.MinHeight := CIHeight;
    //pnlInsideScrollBox.Width  := scrollboxCustomInfo.Width - GetSystemMetrics(SM_CXVSCROLL) - 4;
    //scrollboxCustomInfo.Constraints.MaxHeight := MaxVisibleCIs * CIHeight;

    sbCustomInfo.Down           := Ini.ReadBool('Information and Errors custom info', 'Show custom info', False);
    pnlCustomInfo.Visible       := sbCustomInfo.Down;
    spSplitter.Visible          := sbCustomInfo.Down;
    LastCustomInfoType          := Ini.ReadInteger('Information and Errors custom info', 'Last custom info type', 1);
    CustomInfosCount            := 0;
    CustomInfosLastNumber       := 0;
    LoadCurrentCustomInfo;
    LoadCustomInfoSets;
    CustomInfoToDelete          := 0; //moved here
    //added by adenry: end

    //spSplitter.Top := Ini.ReadInteger('Information and Errors', 'Splitter Top', spSplitter.Top); //added later
    scrollboxCustomInfo.Height := Ini.ReadInteger('Information and Errors', 'Scrollbox Height', scrollboxCustomInfo.Height);

    FormResize(Sender); //added by adenry later
    Constraints.MinHeight := Integer(pnlCustomInfo.Visible)*(pnlCustomInfo.Height + spSplitter.Height) + Integer(pnlErrorTypes.Visible)*(pnlErrorTypes.Height) + pnlInfoErrorsList.Constraints.MinHeight + pnlInfoErrorsWrapper.Top + BottomAreaHeight + (Height - ClientHeight);//added by adenry later
  finally
    Ini.Free;
  end;

  //added by adenry later:
  chkMarkedSubs.DoubleBuffered := True;
  chkLinesWithoutLetters.DoubleBuffered := True;
  chkEmptySubtitles.DoubleBuffered := True;
  chkOverlapping.DoubleBuffered := True;
  chkBadValues.DoubleBuffered := True;
  chkTooShortPause.DoubleBuffered := True;
  chkTooLongDur.DoubleBuffered := True;
  chkTooShortDur.DoubleBuffered := True;
  chkTooLongLines.DoubleBuffered := True;
  chkOverTwoLines.DoubleBuffered := True;
  chkHearingImpaired.DoubleBuffered := True;
  chkTextBeforeColon.DoubleBuffered := True;
  chkUnnecessaryDots.DoubleBuffered := True;
  chkProhibitedChars.DoubleBuffered := True;
  chkRepeatedChars.DoubleBuffered := True;
  chkRepeatedSubs.DoubleBuffered := True;
  chkOCRErrors.DoubleBuffered := True;
  chkOpnDlgInSubsWithOneLine.DoubleBuffered := True;
  chkDashOnFirstLine.DoubleBuffered := True;
  chkDialogueOnOneLine.DoubleBuffered := True;
  chkSpaceAfterCustomChars.DoubleBuffered := True;
  chkSpaceBeforeCustomChars.DoubleBuffered := True;
  chkUnnecessarySpaces.DoubleBuffered := True;
  chkUnnecessaryTags.DoubleBuffered := True;
  chkTooMuchCPS.DoubleBuffered := True;
end;

// -----------------------------------------------------------------------------

procedure TfrmInfoErrors.FormDestroy(Sender: TObject);
var
  Ini : TMemIniFile; //TIniFile replaced with TMemIniFile by adenry
  i   : Integer;
begin
  Ini := TMemIniFile.Create(IniRoot); //TIniFile replaced with TMemIniFile by adenry
  try
    Ini.WriteBool('Information and Errors', 'Confirm each deletion', chkConfirm.Checked);

    //added by adenry: begin
    //FORM AND LIST PROPERTIES
    Ini.WriteInteger('Information and Errors', 'Width', frmInfoErrors.Width);
    Ini.WriteInteger('Information and Errors', 'Height', frmInfoErrors.Height);
    Ini.WriteInteger('Information and Errors', 'Left', frmInfoErrors.Left); //added later
    Ini.WriteInteger('Information and Errors', 'Top', frmInfoErrors.Top); //added later
    Ini.WriteInteger('Information and Errors', 'Column 1 width', lstErrors.Header.Columns[0].Width);
    Ini.WriteInteger('Information and Errors', 'Column 2 width', lstErrors.Header.Columns[1].Width);
    Ini.WriteInteger('Information and Errors', 'Column 3 width', lstErrors.Header.Columns[2].Width);
    Ini.WriteInteger('Information and Errors', 'Sort column', lstErrors.Header.SortColumn); //added later
    Ini.WriteInteger('Information and Errors', 'Sort direction', Byte(lstErrors.Header.SortDirection)); //added later
    Ini.WriteInteger('Information and Errors', 'Scrollbox Height', scrollboxCustomInfo.Height); //added later later
    //added by adenry: end

    //added by adenry: begin
    //ERROR CLASSES
    Ini.WriteBool('Information and Errors', 'Error type visible', sbShowHideErrorType.Down);
    Ini.WriteBool('Information and Errors', 'Warning type visible', sbShowHideWarningType.Down);
    Ini.WriteBool('Information and Errors', 'Fixed type visible', sbShowHideFixedType.Down);
    Ini.WriteBool('Information and Errors', 'Custom info type visible', sbShowHideCustomInfoType.Down);
    //added by adenry: end

    //added by adenry: begin
    //ERROR TYPES
    for i := cmbErrorTypesSets.Items.Count to Ini.ReadInteger('Information and Errors error types', 'Error types sets count', 0) do
    begin
      Ini.DeleteKey('Information and Errors error types', 'Error types set ' + IntToStr(i) + ' name');
      Ini.DeleteKey('Information and Errors error types', 'Error types set ' + IntToStr(i));
    end;
    Ini.WriteBool('Information and Errors error types', 'Show error types', sbErrorTypes.Down);
    Ini.WriteString('Information and Errors error types', 'Checked types', GetCheckedTypesAsString);
    Ini.WriteInteger('Information and Errors error types', 'Error types sets count', cmbErrorTypesSets.Items.Count);
    for i := 0 to cmbErrorTypesSets.Items.Count - 1 do
    begin
      Ini.WriteString ('Information and Errors error types', 'Error types set ' + IntToStr(i) + ' name', cmbErrorTypesSets.Items[i]);
      Ini.WriteString ('Information and Errors error types', 'Error types set ' + IntToStr(i), ErrorTypesSets[i]);
    end;
    //added by adenry: end

    //added by adenry: begin
    //CUSTOM INFO
    Ini.WriteBool('Information and Errors custom info', 'Show custom info', sbCustomInfo.Down);
    Ini.WriteInteger('Information and Errors custom info', 'Last custom info type', LastCustomInfoType);
    Ini.EraseSection('CI sets');
    //added by adenry: end
  finally
    Ini.UpdateFile; //added by adenry
    Ini.Free;
  end;
  SaveCurrentCustomInfo;
  SaveCustomInfoSets;
end;

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmInfoErrors.FormResize(Sender: TObject);
var
  Margin : Word;
begin
  //added later: //fixes a resize bug, Anchors are not good enough...
  Margin := pnlInfoErrorsWrapper.Left;
  btnOk.Top         := ClientHeight - btnOk.Height - Margin;
  btnSettings.Top   := btnOk.Top;
  sbErrorTypes.Top  := btnOk.Top;
  sbCustomInfo.Top  := btnOk.Top;

  tbErrorTypesSets.Left := cmbErrorTypesSets.Left + cmbErrorTypesSets.Width + 3;
  tbCustomInfoSets.Left := cmbCustomInfoSets.Left + cmbCustomInfoSets.Width + 3;

  pnlInfoErrorsWrapper.Height := ClientHeight - BottomAreaHeight - pnlInfoErrorsWrapper.Top;
  pnlInfoErrorsWrapper.Width := ClientWidth - 2*Margin;

  pnlCustomInfo.Width := pnlInfoErrorsWrapper.Width;
  pnlCustomInfo.Constraints.MaxHeight := Min((scrollboxCustomInfo.Top+pnlInsideScrollBox.Height+bvlBottom2.Height),(pnlInfoErrorsWrapper.Height - spSplitter.Height - Integer(pnlErrorTypes.Visible)*(pnlErrorTypes.Height) - pnlInfoErrorsList.Constraints.MinHeight));
  pnlCustomInfo.Height := scrollboxCustomInfo.Top + scrollboxCustomInfo.Height + bvlBottom2.Height;
  pnlCustomInfo.Top := pnlInfoErrorsWrapper.Height - pnlCustomInfo.Height;
  scrollboxCustomInfo.Width := pnlCustomInfo.Width;
  pnlInsideScrollBox.Width := scrollboxCustomInfo.Width - GetSystemMetrics(SM_CXVSCROLL) - 4;

  spSplitter.Top := pnlCustomInfo.Top - spSplitter.Height;

  pnlErrorTypes.Width := pnlInfoErrorsWrapper.Width;
  pnlErrorTypesLeftCol.Width := (pnlErrorTypes.Width - 6) div 2;
  pnlErrorTypesRightCol.Width := pnlErrorTypesLeftCol.Width;
  pnlErrorTypesRightCol.Left := pnlErrorTypesLeftCol.Width + 6;
  if pnlCustomInfo.Visible then
    pnlErrorTypes.Top := spSplitter.Top - pnlErrorTypes.Height else
    pnlErrorTypes.Top := pnlInfoErrorsWrapper.Height - pnlErrorTypes.Height;

  pnlInfoErrorsList.Width := pnlInfoErrorsWrapper.Width;
  pnlInfoErrorsList.Height := pnlInfoErrorsWrapper.Height - Integer(pnlErrorTypes.Visible)*pnlErrorTypes.Height - Integer(pnlCustomInfo.Visible)*(pnlCustomInfo.Height+spSplitter.Height);

  bvlInfoErrors.Height := pnlInfoErrorsList.Height;
  bvlInfoErrors.Width  := pnlInfoErrorsList.Width;
  btnSelect.Top := bvlInfoErrors.Height - 7 - btnSelect.Height;
  btnSelectPlus.Top := btnSelect.Top;
  btnSelectMinus.Top := btnSelect.Top;
  btnFixErrors.Top := btnSelect.Top - 7 - btnFixErrors.Height;
  chkConfirm.Top := btnFixErrors.Top + 4;
  lblTotalErrors.Top := btnFixErrors.Top - 2;
  lblTotalErrors.Left := lstErrors.Left + lstErrors.Width - lblTotalErrors.Width - cmbErrorTypesSets.Width div 8;
  lblFixedErrors.Top := lblTotalErrors.Top + lblTotalErrors.Height + 3;
  lblFixedErrors.Left := lstErrors.Left + lstErrors.Width - lblFixedErrors.Width - cmbErrorTypesSets.Width div 8;
  lstErrors.Width := bvlInfoErrors.Width - 2*Margin;
  lstErrors.Height := btnFixErrors.Top - lstErrors.Top - 7;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmInfoErrors.lstErrorsHeaderClick(Sender: TVTHeader;
  HitInfo: TVTHeaderHitInfo);
begin
  if HitInfo.Column >= 0 then
  begin
    //lstErrors.BeginUpdate;
    if lstErrors.Header.SortColumn = HitInfo.Column then
    begin
      if lstErrors.Header.SortDirection = sdAscending then
        lstErrors.Header.SortDirection := sdDescending else
        lstErrors.Header.SortDirection := sdAscending;
    end else
      lstErrors.Header.SortDirection := sdAscending;
    lstErrors.Header.SortColumn := HitInfo.Column;

    lstErrors.Sort(lstErrors.RootNode, lstErrors.Header.SortColumn, lstErrors.Header.SortDirection);
    //lstErrors.EndUpdate;
  end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
//this is absolutely necessary in order to sort nodes
procedure TfrmInfoErrors.lstErrorsCompareNodes(Sender: TBaseVirtualTree;
  Node1, Node2: PVirtualNode; Column: TColumnIndex; var Result: Integer);
var
  Data1, Data2: PInfoError;
begin
  Data1 := Sender.GetNodeData(Node1);
  Data2 := Sender.GetNodeData(Node2);
  case Column of
    0: //Subtitle number
    begin
      if Data1.Subtitle < Data2.Subtitle then
        Result := -1 else
        if Data1.Subtitle > Data2.Subtitle then
          Result := 1 else
          Result := 0;
    end;
    1: //Error type: TErrorClass = (etError, etWarning, etInfo, etFixed);
    begin
      if Byte(Data1.ErrorClass) < Byte(Data2.ErrorClass) then
        Result := -1 else
        if Byte(Data1.ErrorClass) > Byte(Data2.ErrorClass) then
          Result := 1 else
          Result := 0;
    end;
    2: //Error description: TErrorDescription
    begin
      //Custom Info
      if (Data1.Description = dCustomInfo) and (Data2.Description = dCustomInfo) then
      begin
        if Data1.CustomInfoNum < Data2.CustomInfoNum then
          Result := -1 else
          if Data1.CustomInfoNum > Data2.CustomInfoNum then
            Result := 1 else
            Result := 0;
      end else
      //the rest
      if Integer(Data1.Description) < Integer(Data2.Description) then
        Result := -1 else
        if Integer(Data1.Description) > Integer(Data2.Description) then
          Result := 1 else
          Result := 0;
    end;
  end;

  //always put Info nodes and empty nodes at the end
  if Data1.Subtitle < 0 then
    if lstErrors.Header.SortDirection = sdAscending then
      Result := 1 else
      Result := -1;
  if Data2.Subtitle < 0 then
    if lstErrors.Header.SortDirection = sdAscending then
      Result := -1 else
      Result := 1;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmInfoErrors.btnOkClick(Sender: TObject);
begin
  if not(fsModal in FormState) then
    Close;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmInfoErrors.sbErrorTypesClick(Sender: TObject);
begin
  if sbErrorTypes.Down then
  begin
    pnlErrorTypes.Visible := True;
    Constraints.MinHeight := Constraints.MinHeight + pnlErrorTypes.Height;
  end else
  begin
    pnlErrorTypes.Visible := False;
    Constraints.MinHeight := Constraints.MinHeight - pnlErrorTypes.Height;
  end;
  FormResize(Sender);
end;
//added by adenry: end


// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmInfoErrors.sbCustomInfoClick(Sender: TObject);
begin
  if sbCustomInfo.Down then
  begin
    pnlCustomInfo.Visible := True;
    spSplitter.Visible    := True;
    pnlErrorTypes.Top := spSplitter.Top - pnlErrorTypes.Height;
    Constraints.MinHeight := Constraints.MinHeight + pnlCustomInfo.Height + spSplitter.Height;
  end else
  begin
    pnlCustomInfo.Visible := False;
    spSplitter.Visible    := False;
    pnlErrorTypes.Top := pnlInfoErrorsWrapper.Height - pnlErrorTypes.Height;
    Constraints.MinHeight := Constraints.MinHeight - pnlCustomInfo.Height - spSplitter.Height;
  end;
  FormResize(Sender);
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmInfoErrors.ShowHideNodes(NodeType: TErrorDescription; Visible: Boolean; CustomInfoNum: SmallInt = -2);
var
  Data : PInfoError;
  Node : PVirtualNode;
begin
  Node := lstErrors.GetFirst;
  while Assigned(Node) do
  begin
    Data := lstErrors.GetNodeData(Node);
    if Data.Description = NodeType then
      if (NodeType <> dCustomInfo) or (Data.CustomInfoNum = CustomInfoNum) then
        if Visible = False then
          lstErrors.IsVisible[Node] := False else
          if Data.ErrorClass in VisibleErrorClasses then
            lstErrors.IsVisible[Node] := True;
    Node := Node.NextSibling;
  end;
  if Visible then
    VisibleTypes := VisibleTypes + [NodeType] else
    VisibleTypes := VisibleTypes - [NodeType];
  VisibleTypes := VisibleTypes + [dCustomInfo]; //added later, fixed a bug
  //lstErrors.Sort(lstErrors.RootNode, lstErrors.Header.SortColumn, lstErrors.Header.SortDirection); //added later
  lblDisplayed.Caption := Format(InfoMsgs[3], [lstErrors.VisibleCount]);//'Visible: ' + IntToStr(lstErrors.VisibleCount);
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmInfoErrors.chkMarkedSubsClick(Sender: TObject);               begin ShowHideNodes(deMarkedSubtitle,TCheckBox(Sender).Checked);end;
procedure TfrmInfoErrors.chkLinesWithoutLettersClick(Sender: TObject);      begin ShowHideNodes(deLinesWithoutLetters,TCheckBox(Sender).Checked); ShowHideNodes(dfLinesWithoutLetters,TCheckBox(Sender).Checked);end;
procedure TfrmInfoErrors.chkEmptySubtitlesClick(Sender: TObject);           begin ShowHideNodes(deEmptySubtitle,TCheckBox(Sender).Checked);       ShowHideNodes(dfEmptySubtitle,TCheckBox(Sender).Checked);end;
procedure TfrmInfoErrors.chkOverlappingClick(Sender: TObject);              begin ShowHideNodes(deOverlapping,TCheckBox(Sender).Checked);         ShowHideNodes(dfOverlapping,TCheckBox(Sender).Checked);end;
procedure TfrmInfoErrors.chkBadValuesClick(Sender: TObject);                begin ShowHideNodes(deBadValues,TCheckBox(Sender).Checked);           ShowHideNodes(dfBadValues,TCheckBox(Sender).Checked);end;
procedure TfrmInfoErrors.chkTooShortPauseClick(Sender: TObject);            begin ShowHideNodes(deTooShortPause,TCheckBox(Sender).Checked);       ShowHideNodes(dfTooShortPause,TCheckBox(Sender).Checked);end;
procedure TfrmInfoErrors.chkTooLongDurClick(Sender: TObject);               begin ShowHideNodes(deTooLongDuration,TCheckBox(Sender).Checked);     {ShowHideNodes(dfTooLongDuration,TCheckBox(Sender).Checked);}end;
procedure TfrmInfoErrors.chkTooShortDurClick(Sender: TObject);              begin ShowHideNodes(deTooShortDuration,TCheckBox(Sender).Checked);    {ShowHideNodes(dfTooShortDuration,TCheckBox(Sender).Checked);}end;
procedure TfrmInfoErrors.chkTooLongLinesClick(Sender: TObject);             begin ShowHideNodes(deTooLongLine,TCheckBox(Sender).Checked);         {ShowHideNodes(dfTooLongLine,TCheckBox(Sender).Checked);}end;
procedure TfrmInfoErrors.chkOverTwoLinesClick(Sender: TObject);             begin ShowHideNodes(deOverTwoLines,TCheckBox(Sender).Checked);        ShowHideNodes(dfOverTwoLines,TCheckBox(Sender).Checked);end;
procedure TfrmInfoErrors.chkHearingImpairedClick(Sender: TObject);          begin ShowHideNodes(deHearingImpaired,TCheckBox(Sender).Checked);     ShowHideNodes(dfHearingImpairedAll,TCheckBox(Sender).Checked); ShowHideNodes(dfHearingImpairedPart,TCheckBox(Sender).Checked);end;
procedure TfrmInfoErrors.chkTextBeforeColonClick(Sender: TObject);          begin ShowHideNodes(deTextBeforeColon,TCheckBox(Sender).Checked);     ShowHideNodes(dfTextBeforeColon,TCheckBox(Sender).Checked);end;
procedure TfrmInfoErrors.chkUnnecessaryDotsClick(Sender: TObject);          begin ShowHideNodes(deUnnecessaryDots,TCheckBox(Sender).Checked);     ShowHideNodes(dfUnnecessaryDots,TCheckBox(Sender).Checked);end;
procedure TfrmInfoErrors.chkProhibitedCharsClick(Sender: TObject);          begin ShowHideNodes(deProhibitedCharacter,TCheckBox(Sender).Checked); ShowHideNodes(dfProhibitedCharacter,TCheckBox(Sender).Checked);end;
procedure TfrmInfoErrors.chkRepeatedCharsClick(Sender: TObject);            begin ShowHideNodes(deRepeatedCharacter,TCheckBox(Sender).Checked);   ShowHideNodes(dfRepeatedCharacter,TCheckBox(Sender).Checked);end;
procedure TfrmInfoErrors.chkRepeatedSubsClick(Sender: TObject);             begin ShowHideNodes(deRepeatedSubtitle,TCheckBox(Sender).Checked);    ShowHideNodes(dfRepeatedSubtitle,TCheckBox(Sender).Checked);end;
procedure TfrmInfoErrors.chkOCRErrorsClick(Sender: TObject);                begin ShowHideNodes(deOCRError,TCheckBox(Sender).Checked);            ShowHideNodes(dfOCRError,TCheckBox(Sender).Checked);end;
procedure TfrmInfoErrors.chkOpnDlgInSubsWithOneLineClick(Sender: TObject);  begin ShowHideNodes(deOpnDlgSubsOneLine,TCheckBox(Sender).Checked);   ShowHideNodes(dfOpnDlgSubsOneLine,TCheckBox(Sender).Checked);end;
procedure TfrmInfoErrors.chkDashOnFirstLineClick(Sender: TObject);          begin ShowHideNodes(deDashOnFirstLine,TCheckBox(Sender).Checked);     ShowHideNodes(dfDashOnFirstLine,TCheckBox(Sender).Checked);end;
procedure TfrmInfoErrors.chkDialogueOnOneLineClick(Sender: TObject);        begin ShowHideNodes(deDialogueOnOneLine,TCheckBox(Sender).Checked);   ShowHideNodes(dfDialogueOnOneLine,TCheckBox(Sender).Checked);end;
procedure TfrmInfoErrors.chkSpaceAfterCustomCharsClick(Sender: TObject);    begin ShowHideNodes(deNoSpaceAfterChar,TCheckBox(Sender).Checked);    ShowHideNodes(dfNoSpaceAfterChar,TCheckBox(Sender).Checked);end;
procedure TfrmInfoErrors.chkSpaceBeforeCustomCharsClick(Sender: TObject);   begin ShowHideNodes(deNoSpaceBeforeChar,TCheckBox(Sender).Checked);   ShowHideNodes(dfNoSpaceBeforeChar,TCheckBox(Sender).Checked);end;
procedure TfrmInfoErrors.chkUnnecessarySpacesClick(Sender: TObject);        begin ShowHideNodes(deUnnecessarySpaces,TCheckBox(Sender).Checked);   ShowHideNodes(dfUnnecessarySpaces,TCheckBox(Sender).Checked);end;
procedure TfrmInfoErrors.chkUnnecessaryTagsClick(Sender: TObject);          begin ShowHideNodes(deBadValues,TCheckBox(Sender).Checked);           ShowHideNodes(dfBadValues,TCheckBox(Sender).Checked);end;
procedure TfrmInfoErrors.chkTooMuchCPSClick(Sender: TObject);               begin ShowHideNodes(deTooMuchCPS,TCheckBox(Sender).Checked);          ShowHideNodes(dfTooMuchCPS,TCheckBox(Sender).Checked);end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmInfoErrors.CheckAllErrors(Checked: Boolean);
var
  Data : PInfoError;
  Node : PVirtualNode;
  i    : Byte;
begin
  SetCheckedState(chkMarkedSubs, Checked);
  SetCheckedState(chkLinesWithoutLetters, Checked);
  SetCheckedState(chkEmptySubtitles, Checked);
  SetCheckedState(chkOverlapping, Checked);
  SetCheckedState(chkBadValues, Checked);
  SetCheckedState(chkTooShortPause, Checked);
  SetCheckedState(chkTooLongDur, Checked);
  SetCheckedState(chkTooShortDur, Checked);
  SetCheckedState(chkTooLongLines, Checked);
  SetCheckedState(chkOverTwoLines, Checked);
  SetCheckedState(chkHearingImpaired, Checked);
  SetCheckedState(chkTextBeforeColon, Checked);
  SetCheckedState(chkUnnecessaryDots, Checked);
  SetCheckedState(chkProhibitedChars, Checked);
  SetCheckedState(chkRepeatedChars, Checked);
  SetCheckedState(chkRepeatedSubs, Checked);
  SetCheckedState(chkOCRErrors, Checked);
  SetCheckedState(chkOpnDlgInSubsWithOneLine, Checked);
  SetCheckedState(chkDashOnFirstLine, Checked);
  SetCheckedState(chkDialogueOnOneLine, Checked);
  SetCheckedState(chkSpaceAfterCustomChars, Checked);
  SetCheckedState(chkSpaceBeforeCustomChars, Checked);
  SetCheckedState(chkUnnecessarySpaces, Checked);
  SetCheckedState(chkUnnecessaryTags, Checked);
  SetCheckedState(chkTooMuchCPS, Checked);
  Node := lstErrors.GetFirst;
  while Assigned(Node) do
  begin
    Data := lstErrors.GetNodeData(Node);
      if (Data.ErrorClass = etError) or (Data.ErrorClass = etWarning) or (Data.ErrorClass = etFixed) then
        if Checked = False then
          lstErrors.IsVisible[Node] := False else
          if Data.ErrorClass in VisibleErrorClasses then
            lstErrors.IsVisible[Node] := True;
    Node := Node.NextSibling;
  end;
  VisibleTypes := [dCustomInfo];//[];
  if Checked then
    for i := 0 to Byte(High(TErrorDescription)) do
      VisibleTypes := VisibleTypes + [TErrorDescription(i)];
  VisibleTypes := VisibleTypes - [dNone] - [ifTotalErrors] - [ifFixedErrors];
  //lstErrors.Sort(lstErrors.RootNode, lstErrors.Header.SortColumn, lstErrors.Header.SortDirection); //added later
  lblDisplayed.Caption := Format(InfoMsgs[3], [lstErrors.VisibleCount]);//'Visible: ' + IntToStr(lstErrors.VisibleCount);
end;

procedure TfrmInfoErrors.btnCheckAllErrClick(Sender: TObject); begin CheckAllErrors(True); end;
procedure TfrmInfoErrors.btnCheckNoneErrClick(Sender: TObject); begin CheckAllErrors(False); end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmInfoErrors.btnCheckInverseErrClick(Sender: TObject);
begin
  if Pos('0', GetCheckedTypesAsString) = 0 then
    CheckAllErrors(False) else
  if Pos('1', GetCheckedTypesAsString) = 0 then
    CheckAllErrors(True) else
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
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmInfoErrors.btnNextClick(Sender: TObject);
var
  Node: PVirtualNode;
begin
  if lstErrors.VisibleCount > 0 then
  begin
    Node := lstErrors.GetNextVisible(lstErrors.GetFirstSelected);
    if not Assigned(Node) then Node := lstErrors.GetFirstVisible;
    lstErrors.ScrollIntoView(Node,True);
    //lstErrors.Selected[lstErrors.FocusedNode] := False;
    lstErrors.FocusedNode := Node;
    lstErrors.Selected[Node] := True;
    lstErrorsDblClick(lstErrors);
  end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmInfoErrors.btnPreviousClick(Sender: TObject);
var
  Node: PVirtualNode;
begin
  if lstErrors.VisibleCount > 0 then
  begin
    Node := lstErrors.GetPreviousVisible(lstErrors.GetFirstSelected);
    if not Assigned(Node) then Node := lstErrors.GetLastVisible;
    lstErrors.ScrollIntoView(Node,True);
    //lstErrors.Selected[lstErrors.FocusedNode] := False;
    lstErrors.FocusedNode := Node;
    lstErrors.Selected[Node] := True;
    lstErrorsDblClick(lstErrors);
  end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
{procedure TfrmInfoErrors.btnAddClick(Sender: TObject);
var
  frmTypeSelection : TForm;
  btnModalOk, btnModalCancel : TButton;
  rdoType1, rdoType2, rdoType3, rdoType4, rdoType5, rdoType6, rdoType7 : TRadioButton;
  CIData : TCustomInfoData;
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
  rdoType7                      := TRadioButton.Create(frmTypeSelection);
  rdoType7.Parent               := frmTypeSelection;
  rdoType7.Caption              := 'Composite Info';
  rdoType7.Font.Style           := [fsBold];
  rdoType7.Top                  := 104;
  rdoType7.Left                 := 8;
  rdoType7.Width                := frmTypeSelection.ClientWidth - 16;
  case LastCustomInfoType of
    1: rdoType1.Checked := True;
    2: rdoType2.Checked := True;
    3: rdoType3.Checked := True;
    4: rdoType4.Checked := True;
    5: rdoType5.Checked := True;
    6: rdoType6.Checked := True;
    7: rdoType7.Checked := True;
  else
    rdoType7.Checked := True;
  end;
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
  if rdoType1.Checked then LastCustomInfoType := 1 else
  if rdoType2.Checked then LastCustomInfoType := 2 else
  if rdoType3.Checked then LastCustomInfoType := 3 else
  if rdoType4.Checked then LastCustomInfoType := 4 else
  if rdoType5.Checked then LastCustomInfoType := 5 else
  if rdoType6.Checked then LastCustomInfoType := 6 else
  if rdoType7.Checked then LastCustomInfoType := 7;
  frmTypeSelection.Free;

  CIData.CustomInfoType := LastCustomInfoType;
  CIData.Checked := True;
  CIData.Text1 := '';
  CIData.Text2 := '';
  CIData.ItemIndex := 0;
  CIData.ANDCaption := '';
  CIData.ANDErrorTypes := '';
  CIData.ANDCustomInfo := nil;
  CreateNewCustomInfo(CIData);
end;}
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmInfoErrors.mnuCustomInfoClick(Sender: TObject);
var
  CIData : TCustomInfoData;
begin
  CIData.CustomInfoType := TComponent(Sender).Tag;
  CIData.Checked := True;
  CIData.Text1 := '';
  CIData.Text2 := '';
  CIData.ItemIndex := 0;
  CIData.ANDCaption := '';
  CIData.ANDErrorTypes := '';
  CIData.ANDCustomInfo := nil;

  CreateNewCustomInfo(CIData, Sender);
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
//procedure TfrmInfoErrors.CreateNewCustomInfo(CustomInfoType: ShortInt; Checked: Boolean; Text1, Text2: String; ItemIndex: SmallInt);
procedure TfrmInfoErrors.CreateNewCustomInfo(CIData : TCustomInfoData; Sender: TObject = nil);
var
  k : Integer;
begin
if CIData.CustomInfoType > 0 then
begin
  //if it's a Composite Info, first of all create and show the Composite Info Form, as the creation of the Composite Info can be canceled
  if CIData.CustomInfoType = 7 then
  begin
    //frmCompositeCustomInfoCreator
    frmCompositeCustomInfoCreator                 := TfrmCompositeCustomInfo.Create(frmMain);
    frmCompositeCustomInfoCreator.Name            := 'frmCompositeCustomInfo' + IntToStr(CustomInfosLastNumber + 1);
    frmCompositeCustomInfoCreator.Caption         := CustomInfoTypes[7] + ' (' + ErrorTypes[5] + ' ' + IntToStr(CustomInfosLastNumber + 1) + ')';//'Composite info (custom info ' + IntToStr(CustomInfosLastNumber + 1) + ')';
    frmCompositeCustomInfoCreator.Tag             := CustomInfosLastNumber + 1; //the .Tag stores the current custom info number
    frmCompositeCustomInfoCreator.edtCaption.Text := CIData.ANDCaption;
    if CIData.ANDErrorTypes <> '' then
      frmCompositeCustomInfoCreator.SetCheckedTypesFromString(CIData.ANDErrorTypes);
    for k := 1 to Length(CIData.ANDCustomInfo) do
      frmCompositeCustomInfoCreator.CreateNewCustomInfo(
        CIData.ANDCustomInfo[k-1].CustomInfoType,
        CIData.ANDCustomInfo[k-1].Checked,
        CIData.ANDCustomInfo[k-1].Text1,
        CIData.ANDCustomInfo[k-1].Text2,
        CIData.ANDCustomInfo[k-1].ItemIndex
      );
    if (Sender = tbtnAddCustomInfo) or (Sender = mnuCompositeCustomInfo) then
      //ButtonEditClick(TButton(FindComponent('tbtnEdit' + IntToStr(CustomInfosLastNumber + 1))));
      if TfrmCompositeCustomInfo(frmMain.FindComponent('frmCompositeCustomInfo' + IntToStr(CustomInfosLastNumber + 1))).ShowModal = mrCancel then
      begin
        TfrmCompositeCustomInfo(frmMain.FindComponent('frmCompositeCustomInfo' + IntToStr(CustomInfosLastNumber + 1))).Free;
        exit;
      end else
        CIData.ANDCaption := TfrmCompositeCustomInfo(frmMain.FindComponent('frmCompositeCustomInfo' + IntToStr(CustomInfosLastNumber + 1))).edtCaption.Text; //added later - set the caption from the form
  end;

  //restore original background color of previously created panel, if it is still blinking out
  if tmrBlink.Enabled and Assigned(pnlPanelCreator) then
  begin
    pnlPanelCreator.Color := clBtnFace;
    tmrBlink.Enabled := False;
  end;

  //CREATE THE NEW CUSTOM INFO
  //1. the parent panel
  pnlPanelCreator                   := TPanel.Create(Self);
  pnlPanelCreator.Name              := 'pnlParent' + IntToStr(CustomInfosLastNumber + 1);
  pnlPanelCreator.Parent	          := pnlInsideScrollBox;
  pnlPanelCreator.Left              := 0;
  pnlPanelCreator.Top               := CIHeight * CustomInfosCount;
  pnlPanelCreator.Height            := CIHeight;
  pnlPanelCreator.Width             := pnlInsideScrollBox.Width;
  pnlPanelCreator.BevelOuter        := bvNone;
  pnlPanelCreator.Caption           := '';
  pnlPanelCreator.Anchors           := [akLeft,akTop,akRight];
  pnlPanelCreator.Tag               := CIData.CustomInfoType; //the .Tag stores the info type
  pnlPanelCreator.Color             := scrollboxCustomInfo.Color;
  pnlPanelCreator.ParentBackground  := False;
  //2. the checkbox
  chkCheckboxCreator                := TCheckbox.Create(Self);
  chkCheckboxCreator.Name           := 'chkCaption' + IntToStr(CustomInfosLastNumber + 1);
  chkCheckboxCreator.Parent         := TPanel(FindComponent('pnlParent' + IntToStr(CustomInfosLastNumber + 1)));
  chkCheckboxCreator.Left           := 0;
  chkCheckboxCreator.Top            := CIHeight div 12;
  chkCheckboxCreator.Checked        := CIData.Checked;
  chkCheckboxCreator.TabStop        := False;
  chkCheckboxCreator.Caption        := IntToStr(CustomInfosLastNumber + 1) + '. ' + CustomInfoTypes[CIData.CustomInfoType];
  if CustomInfosLastNumber + 1 < 10 then
    chkCheckboxCreator.Caption      := '0' + chkCheckboxCreator.Caption;
  chkCheckboxCreator.Width          := cmbCustomInfoSets.Width + tbtnSaveCustomInfoSet.Width div 3;
  chkCheckboxCreator.OnClick        := chkCaptionClick;
  chkCheckboxCreator.Tag            := CustomInfosLastNumber + 1; //the .Tag stores the current custom info number
  //3. the toolbar and Del button
  tbToolBarCreator                  := TToolBar.Create(Self); //added later
  tbToolBarCreator.Name             := 'tbToolBar' + IntToStr(CustomInfosLastNumber + 1);
  tbToolBarCreator.Parent           := TPanel(FindComponent('pnlParent' + IntToStr(CustomInfosLastNumber + 1)));
  tbToolBarCreator.Align            := alNone;
  tbToolBarCreator.EdgeBorders      := [];
  tbToolBarCreator.EdgeInner        := esNone;
  tbToolBarCreator.EdgeOuter        := esNone;
  tbToolBarCreator.Flat             := True;
  tbToolBarCreator.Height           := tbtnSaveCustomInfoSet.Height;
  tbToolBarCreator.Width            := tbtnSaveCustomInfoSet.Width * 2;
  tbToolBarCreator.Indent           := tbtnSaveCustomInfoSet.Width;
  tbToolBarCreator.Left             := pnlPanelCreator.Width - tbToolBarCreator.Width;
  tbToolBarCreator.Top              := (CIHeight-tbToolBarCreator.Height) div 2;
  tbToolBarCreator.TabStop          := False;
  tbToolBarCreator.Images           := frmMain.imgLstMenu;
  tbToolBarCreator.DisabledImages   := frmMain.imgLstMenuDisabled;
  tbToolBarCreator.Tag              := CustomInfosLastNumber + 1; //the .Tag stores the current custom info number
  tbToolBarCreator.Anchors          := [akTop,akRight];
  tbtnButtonDelCreator              := TToolButton.Create(Self);
  tbtnButtonDelCreator.Name         := 'tbtnDel' + IntToStr(CustomInfosLastNumber + 1);
  tbtnButtonDelCreator.Parent       := TToolBar(FindComponent('tbToolBar' + IntToStr(CustomInfosLastNumber + 1)));
  tbtnButtonDelCreator.Height       := tbtnSaveCustomInfoSet.Height;
  tbtnButtonDelCreator.Width        := tbtnSaveCustomInfoSet.Width;
  tbtnButtonDelCreator.Left         := 0;
  tbtnButtonDelCreator.Top          := 0;
  tbtnButtonDelCreator.Hint         := CustomInfoDelete;
  tbtnButtonDelCreator.ShowHint     := True;
  tbtnButtonDelCreator.ImageIndex   := 26;
  tbtnButtonDelCreator.Tag          := CustomInfosLastNumber + 1; //the .Tag stores the current custom info number
  tbtnButtonDelCreator.OnClick      := ButtonDelClick;

  //4. the counter label
  lblLabelCountCreator              := TLabel.Create(Self);
  lblLabelCountCreator.Name         := 'lblCount' + IntToStr(CustomInfosLastNumber + 1);
  lblLabelCountCreator.Parent       := TPanel(FindComponent('pnlParent' + IntToStr(CustomInfosLastNumber + 1)));
  lblLabelCountCreator.Alignment    := taRightJustify;
  lblLabelCountCreator.AutoSize     := True;
  lblLabelCountCreator.Caption      := '0';
  lblLabelCountCreator.Font.Style   := [fsBold];
  lblLabelCountCreator.Left         := tbToolBarCreator.Left - lblLabelCountCreator.Width - 4; //btnButtonDelCreator.Left - lblLabelCountCreator.Width - 4;
  lblLabelCountCreator.Top          := CIHeight div 6;
  lblLabelCountCreator.Anchors      := [akTop,akRight];

  //Composite cutom info
  if CIData.CustomInfoType = 7 then
  begin
    //Edit button
    tbToolBarCreator.Indent           := 0;
    tbtnButtonEditCreator             := TToolButton.Create(Self);
    tbtnButtonEditCreator.Name        := 'tbtnEdit' + IntToStr(CustomInfosLastNumber + 1);
    tbtnButtonEditCreator.Parent      := TToolBar(FindComponent('tbToolBar' + IntToStr(CustomInfosLastNumber + 1)));
    tbtnButtonEditCreator.Height      := tbtnSaveCustomInfoSet.Height;
    tbtnButtonEditCreator.Width       := tbtnSaveCustomInfoSet.Width;
    tbtnButtonEditCreator.Left        := 0;
    tbtnButtonEditCreator.Top         := 0;
    tbtnButtonEditCreator.Hint        := CustomInfoEdit;
    tbtnButtonEditCreator.ShowHint    := True;
    tbtnButtonEditCreator.ImageIndex  := 44;
    tbtnButtonEditCreator.Tag         := CustomInfosLastNumber + 1; //the .Tag stores the current custom info number
    tbtnButtonEditCreator.OnClick     := ButtonEditClick;

    chkCheckboxCreator.Width          := chkCheckboxCreator.Width + cmbCustomInfoSets.Width*2 + 8;
    chkCheckboxCreator.Font.Charset   := DEFAULT_CHARSET;
    if CIData.ANDCaption <> '' then
      chkCheckboxCreator.Caption        := Copy(chkCheckboxCreator.Caption, 1, 4) + CIData.ANDCaption;
  end else
  //Text custom info
  if CIData.CustomInfoType = 6 then
  begin
    cmbComboBoxCreator              := TComboBox.Create(Self);
    cmbComboBoxCreator.Name         := 'cmb' + IntToStr(CustomInfosLastNumber + 1);
    cmbComboBoxCreator.Parent       := TPanel(FindComponent('pnlParent' + IntToStr(CustomInfosLastNumber + 1)));
    cmbComboBoxCreator.Left         := chkCheckboxCreator.Width + 4;
    cmbComboBoxCreator.Top          := 0;
    cmbComboBoxCreator.Height       := CIHeight - 4;
    cmbComboBoxCreator.Width        := cmbCustomInfoSets.Width;
    cmbComboBoxCreator.Style        := csDropDownList;
    cmbComboBoxCreator.Items.Add(CustomInfoCombos[3]);
    cmbComboBoxCreator.Items.Add(CustomInfoCombos[4]);
    cmbComboBoxCreator.Items.Add(CustomInfoCombos[5]);
    cmbComboBoxCreator.Items.Add(CustomInfoCombos[6]);
    cmbComboBoxCreator.Items.Add(CustomInfoCombos[7]); //added later
    cmbComboBoxCreator.Items.Add(CustomInfoCombos[8]); //added later
    cmbComboBoxCreator.Perform(CB_SETDROPPEDWIDTH, cmbCustomInfoSets.Left, 0);
    cmbComboBoxCreator.ItemIndex    := CIData.ItemIndex;
    cmbComboBoxCreator.OnChange     := cmbChange;
    cmbComboBoxCreator.Tag          := CustomInfosLastNumber + 1; //the .Tag stores the current custom info number
    cmbComboBoxCreator.ShowHint     := True;
    cmbComboBoxCreator.Hint         := cmbComboBoxCreator.Text;

    edtEdit1Creator                 := TEdit.Create(Self);
    edtEdit1Creator.Name            := 'edt1_' + IntToStr(CustomInfosLastNumber + 1);
    edtEdit1Creator.Parent          := TPanel(FindComponent('pnlParent' + IntToStr(CustomInfosLastNumber + 1)));
    edtEdit1Creator.Left            := cmbComboBoxCreator.Left + cmbComboBoxCreator.Width + 4;
    edtEdit1Creator.Top             := 0;
    edtEdit1Creator.Height          := cmbComboBoxCreator.Height;
    edtEdit1Creator.Width           := pnlInsideScrollBox.Width - edtEdit1Creator.Left - tbCustomInfoSets.Width*2;//cmbComboBoxCreator.Width;
    edtEdit1Creator.Text            := CIData.Text1;
    edtEdit1Creator.Font.Charset    := frmMain.OrgCharset;
    edtEdit1Creator.OnKeyPress      := EditNumKeyPress2;
    edtEdit1Creator.OnEnter         := EditNumEnter;
    edtEdit1Creator.OnExit          := EditNumExit;
    edtEdit1Creator.Tag             := CustomInfosLastNumber + 1; //the .Tag stores the current custom info number
    edtEdit1Creator.Anchors         := [akLeft,akTop,akRight];
  end else
  //Duration / Lines length / Lines count / Pause / CpS custom info
  begin
    lblLabelGreaterCreator          := TLabel.Create(Self);
    lblLabelGreaterCreator.Name     := 'lblGreater' + IntToStr(CustomInfosLastNumber + 1);
    lblLabelGreaterCreator.Parent   := TPanel(FindComponent('pnlParent' + IntToStr(CustomInfosLastNumber + 1)));
    lblLabelGreaterCreator.Caption  := '>';
    lblLabelGreaterCreator.Left     := chkCheckboxCreator.Width + 4;
    lblLabelGreaterCreator.Top      := CIHeight div 12;

    edtEdit1Creator                 := TEdit.Create(Self);
    edtEdit1Creator.Name            := 'edt1_' + IntToStr(CustomInfosLastNumber + 1);
    edtEdit1Creator.Parent          := TPanel(FindComponent('pnlParent' + IntToStr(CustomInfosLastNumber + 1)));
    edtEdit1Creator.Left            := lblLabelGreaterCreator.Left + lblLabelGreaterCreator.Width + 2;
    edtEdit1Creator.Top             := 0;
    edtEdit1Creator.Height          := CIHeight - 4;
    edtEdit1Creator.Width           := btnCheckAllCI.Left div 2;
    edtEdit1Creator.Text            := CIData.Text1;
    edtEdit1Creator.OnKeyPress      := EditNumKeyPress;
    edtEdit1Creator.OnChange        := EditNumChange;
    edtEdit1Creator.OnEnter         := EditNumEnter;
    edtEdit1Creator.OnExit          := EditNumExit;
    edtEdit1Creator.Tag             := CustomInfosLastNumber + 1; //the .Tag stores the current custom info number

    lblLabel1Creator                := TLabel.Create(Self);
    lblLabel1Creator.Name           := 'lbl1_' + IntToStr(CustomInfosLastNumber + 1);
    lblLabel1Creator.Parent         := TPanel(FindComponent('pnlParent' + IntToStr(CustomInfosLastNumber + 1)));
    lblLabel1Creator.Caption        := CustomInfoLabels[CIData.CustomInfoType];
    lblLabel1Creator.Left           := edtEdit1Creator.Left + edtEdit1Creator.Width + 4;
    lblLabel1Creator.Top            := CIHeight div 6;

    cmbComboBoxCreator              := TComboBox.Create(Self);
    cmbComboBoxCreator.Name         := 'cmb' + IntToStr(CustomInfosLastNumber + 1);
    cmbComboBoxCreator.Parent       := TPanel(FindComponent('pnlParent' + IntToStr(CustomInfosLastNumber + 1)));
    cmbComboBoxCreator.Left         := edtEdit1Creator.Left + edtEdit1Creator.Width + (btnCheckAllCI.Left div 2);
    cmbComboBoxCreator.Top          := 0;
    cmbComboBoxCreator.Height       := edtEdit1Creator.Height;
    cmbComboBoxCreator.Width        := btnCheck.Width div 2;
    cmbComboBoxCreator.Items.Add(CustomInfoCombos[1]);
    cmbComboBoxCreator.Items.Add(CustomInfoCombos[2]);
    cmbComboBoxCreator.Style        := csDropDownList;
    cmbComboBoxCreator.ItemIndex    := CIData.ItemIndex;
    cmbComboBoxCreator.OnChange     := cmbChange;
    cmbComboBoxCreator.Tag          := CustomInfosLastNumber + 1; //the .Tag stores the current custom info number

    lblLabelLessCreator             := TLabel.Create(Self);
    lblLabelLessCreator.Name        := 'lblLess' + IntToStr(CustomInfosLastNumber + 1);
    lblLabelLessCreator.Parent      := TPanel(FindComponent('pnlParent' + IntToStr(CustomInfosLastNumber + 1)));
    lblLabelLessCreator.Caption     := '<';
    lblLabelLessCreator.Left        := cmbComboBoxCreator.Left + cmbComboBoxCreator.Width + 4; //tbToolBarCreator.Left - (sbShowHideErrorType.Width * 2) - btnCheckAllCI.Left - 4 - lblLabelLessCreator.Width;
    lblLabelLessCreator.Top         := CIHeight div 12;

    edtEdit2Creator                 := TEdit.Create(Self);
    edtEdit2Creator.Name            := 'edt2_' + IntToStr(CustomInfosLastNumber + 1);
    edtEdit2Creator.Parent          := TPanel(FindComponent('pnlParent' + IntToStr(CustomInfosLastNumber + 1)));
    edtEdit2Creator.Left            := lblLabelLessCreator.Left + lblLabelLessCreator.Width + 2;//tbToolBarCreator.Left - (sbShowHideErrorType.Width * 2) - btnCheckAllCI.Left;
    edtEdit2Creator.Top             := 0;
    edtEdit2Creator.Height          := edtEdit1Creator.Height;
    edtEdit2Creator.Width           := edtEdit1Creator.Width;
    edtEdit2Creator.Text            := CIData.Text2;
    edtEdit2Creator.OnKeyPress      := EditNumKeyPress;
    edtEdit2Creator.OnChange        := EditNumChange;
    edtEdit2Creator.OnEnter         := EditNumEnter;
    edtEdit2Creator.OnExit          := EditNumExit;
    edtEdit2Creator.Tag             := CustomInfosLastNumber + 1; //the .Tag stores the current custom info number

    lblLabel2Creator                := TLabel.Create(Self);
    lblLabel2Creator.Name           := 'lbl2_' + IntToStr(CustomInfosLastNumber + 1);
    lblLabel2Creator.Parent         := TPanel(FindComponent('pnlParent' + IntToStr(CustomInfosLastNumber + 1)));
    lblLabel2Creator.Caption        := CustomInfoLabels[CIData.CustomInfoType];
    lblLabel2Creator.Left           := edtEdit2Creator.Left + edtEdit2Creator.Width + 4;
    lblLabel2Creator.Top            := CIHeight div 6;
  end;

  Inc(CustomInfosLastNumber);
  Inc(CustomInfosCount);

  //added later - check the newly added Composite custom info
  if CIData.CustomInfoType = 7 then
    if (Sender = tbtnAddCustomInfo) or (Sender = mnuCompositeCustomInfo) then
      CheckCustomInfo(nil, CustomInfosLastNumber);

  //refresh heights and positions
  if ((scrollboxCustomInfo.Height < MaxVisibleCIs * CIHeight) or (pnlInfoErrorsList.Height >= pnlInfoErrorsList.Constraints.MinHeight + CIHeight))
  and (pnlInsideScrollBox.Height = scrollboxCustomInfo.Height) //added later - increase the scrollbox height, only if its size is not decreased by using the splitter
  then
    scrollboxCustomInfo.Height := CustomInfosCount * CIHeight;
  pnlInsideScrollBox.Height := CIHeight * CustomInfosCount;

  //pnlCustomInfo.Height := scrollboxCustomInfo.Top + scrollboxCustomInfo.Height + (CIHeight div 12);
  //pnlCustomInfo.Top := pnlInfoErrorsWrapper.Height - pnlCustomInfo.Height;
  //if pnlCustomInfo.Visible then
  //  pnlErrorTypes.Top := spSplitter.Top - pnlErrorTypes.Height;
  FormResize(scrollboxCustomInfo);
  if scrollboxCustomInfo.Top + scrollboxCustomInfo.Height > bvlBottom2.Top then
    Height := Height + CIHeight;
  Constraints.MinHeight := Integer(pnlCustomInfo.Visible)*(pnlCustomInfo.Height + spSplitter.Height) + Integer(pnlErrorTypes.Visible)*(pnlErrorTypes.Height) + pnlInfoErrorsList.Constraints.MinHeight + pnlInfoErrorsWrapper.Top + BottomAreaHeight + (Height - ClientHeight);//added by adenry later

  //added later:
  if Visible then
  begin
    //scroll new custom info into view:
    if scrollboxCustomInfo.Height < pnlInsideScrollBox.Height then
      scrollboxCustomInfo.ScrollInView(pnlPanelCreator);
    //blink the new CI background to indicate it:
    pnlPanelCreator.Color := clWhite;
    tmrBlinkVal := 100;
    tmrBlink.Enabled := True;
  end;
end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmInfoErrors.tmrDeleteCustomInfoTimer(Sender: TObject);
var
  i : Integer;
begin
  if CustomInfoToDelete > 0 then
  begin
    if CustomInfoToDelete = CustomInfosLastNumber then tmrBlink.Enabled := False; //added later - stop the blinking out
    DeleteCustomInfo(nil, CustomInfoToDelete);
    if FindComponent('pnlParent' + IntToStr(CustomInfoToDelete)) <> nil then
    begin
      FreeCustomInfoComponents(IntToStr(CustomInfoToDelete));
      Dec(CustomInfosCount);
      if CustomInfosCount = 0 then
        CustomInfosLastNumber := 0;

      //refresh heights and positions
      for i := CustomInfoToDelete + 1 to CustomInfosLastNumber do
        if FindComponent('pnlParent' + IntToStr(i)) <> nil then
          TPanel(FindComponent('pnlParent' + IntToStr(i))).Top := TPanel(FindComponent('pnlParent' + IntToStr(i))).Top - CIHeight;
      pnlInsideScrollBox.Height := CIHeight * CustomInfosCount;
      if pnlInsideScrollBox.Height < scrollboxCustomInfo.Height then //if CustomInfosCount < MaxVisibleCIs then
      begin
        scrollboxCustomInfo.Height := CIHeight * CustomInfosCount;
        //pnlCustomInfo.Height := scrollboxCustomInfo.Top + scrollboxCustomInfo.Height + (CIHeight div 12);
        //pnlCustomInfo.Top := pnlInfoErrorsWrapper.Height - pnlCustomInfo.Height;
        //spSplitter.Top := scrollboxCustomInfo - spSplitter.Height;
        //pnlErrorTypes.Top := spSplitter.Top - pnlErrorTypes.Height;
        FormResize(scrollboxCustomInfo);
        Constraints.MinHeight := Integer(pnlCustomInfo.Visible)*(pnlCustomInfo.Height + spSplitter.Height) + Integer(pnlErrorTypes.Visible)*(pnlErrorTypes.Height) + pnlInfoErrorsList.Constraints.MinHeight + pnlInfoErrorsWrapper.Top + BottomAreaHeight + (Height - ClientHeight);//added by adenry later
      end;
    end;
  end;
  CustomInfoToDelete := 0;
  tmrDeleteCustomInfo.Enabled := False;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmInfoErrors.ButtonDelClick(Sender: TObject);
begin
  if tmrDeleteCustomInfo.Enabled then exit; //in case the timer is currently deleting
  CustomInfoToDelete := TButton(Sender).Tag;
  tmrDeleteCustomInfo.Enabled := True;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmInfoErrors.ButtonEditClick(Sender: TObject);
begin
  //show the CompositeCustomInfo form
  if frmMain.FindComponent('frmCompositeCustomInfo' + IntToStr(TButton(Sender).Tag)) <> nil then
    TfrmCompositeCustomInfo(frmMain.FindComponent('frmCompositeCustomInfo' + IntToStr(TButton(Sender).Tag))).ShowModal;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmInfoErrors.EditNumKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    '0'..'9', #8  : ;
    #13           : begin
                      Key:=#0;
                      TEdit(Sender).SelectAll;
                      EditNumEnterValue := TEdit(Sender).Text;
                      DeleteCustomInfo(nil, TEdit(Sender).Tag);
                      CheckCustomInfo(nil, TEdit(Sender).Tag);
                      lstErrors.Sort(lstErrors.RootNode, lstErrors.Header.SortColumn, lstErrors.Header.SortDirection);
                    end;
  else
    Key:=#0;
  end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmInfoErrors.EditNumChange(Sender: TObject);
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
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmInfoErrors.EditNumKeyPress2(Sender: TObject; var Key: Char);
begin
  case Key of
    #13           : begin
                      Key:=#0;
                      TEdit(Sender).SelectAll;
                      EditNumEnterValue := TEdit(Sender).Text;
                      DeleteCustomInfo(nil, TEdit(Sender).Tag);
                      TCheckbox(FindComponent('chkCaption' + IntToStr(TEdit(Sender).Tag))).Enabled := True; //added later
                      CheckCustomInfo(nil, TEdit(Sender).Tag);
                      lstErrors.Sort(lstErrors.RootNode, lstErrors.Header.SortColumn, lstErrors.Header.SortDirection);
                    end;
  end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmInfoErrors.EditNumEnter(Sender: TObject);
begin
  EditNumEnterValue := TEdit(Sender).Text;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmInfoErrors.EditNumExit(Sender: TObject);
begin
  if TEdit(Sender).Text <> EditNumEnterValue then
  begin
    DeleteCustomInfo(nil, TEdit(Sender).Tag);
    TCheckbox(FindComponent('chkCaption' + IntToStr(TEdit(Sender).Tag))).Enabled := True; //added later
    CheckCustomInfo(nil, TEdit(Sender).Tag);
    lstErrors.Sort(lstErrors.RootNode, lstErrors.Header.SortColumn, lstErrors.Header.SortDirection);
  end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmInfoErrors.cmbChange(Sender: TObject);
begin
  if FindComponent('edt2_' + IntToStr(TComboBox(Sender).Tag)) = nil then //it's a Text custom info
  begin
    TComboBox(Sender).Hint := TComboBox(Sender).Text; //added later
    DeleteCustomInfo(nil, TComboBox(Sender).Tag);
    TCheckbox(FindComponent('chkCaption' + IntToStr(TComboBox(Sender).Tag))).Enabled := True; //added later
    CheckCustomInfo(nil, TComboBox(Sender).Tag);
    lstErrors.Sort(lstErrors.RootNode, lstErrors.Header.SortColumn, lstErrors.Header.SortDirection);
  end else
  if (TEdit(FindComponent('edt1_' + IntToStr(TComboBox(Sender).Tag))).Text <> '') and (TEdit(FindComponent('edt2_' + IntToStr(TComboBox(Sender).Tag))).Text <> '') then
  begin
    DeleteCustomInfo(nil, TComboBox(Sender).Tag);
    CheckCustomInfo(nil, TComboBox(Sender).Tag);
    lstErrors.Sort(lstErrors.RootNode, lstErrors.Header.SortColumn, lstErrors.Header.SortDirection);
  end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmInfoErrors.chkCaptionClick(Sender: TObject);
begin
  ShowHideNodes(dCustomInfo, TCheckBox(Sender).Checked, TCheckBox(Sender).Tag);
  TCheckBox(Sender).Font.Charset := frmMain.Font.Charset;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmInfoErrors.FormShow(Sender: TObject);
var
  Ini : TIniFile;
begin
  Ini := TIniFile.Create(IniRoot);
  try
    Ini.WriteBool('General', 'Info and errors form opened', True);
  finally
    Ini.Free;
  end;

  frmMain.tbInfoErrors.Down := True; //added later
  Refresh;
  btnCheckClick(frmInfoErrors);
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmInfoErrors.ShowHideType(ErrorClass: TErrorClass; Visible: Boolean);
var
  Data : PInfoError;
  Node : PVirtualNode;
begin
  Node := lstErrors.GetFirst;
  while Assigned(Node) do
  begin
    Data := lstErrors.GetNodeData(Node);
    if Data.ErrorClass = ErrorClass then
      if Visible = False then
        lstErrors.IsVisible[Node] := False else
        //added later: begin (bug fix)
        if ErrorClass = etCustomInfo then
        begin
          if TCheckbox(FindComponent('chkCaption' + IntToStr(Data.CustomInfoNum))).Checked then
            lstErrors.IsVisible[Node] := True;
        end else
        //added later: end
        if Data.Description in VisibleTypes then
          lstErrors.IsVisible[Node] := True;
    Node := Node.NextSibling;
  end;
  if Visible then
    VisibleErrorClasses := VisibleErrorClasses + [ErrorClass] else
    VisibleErrorClasses := VisibleErrorClasses - [ErrorClass];
  lblDisplayed.Caption := Format(InfoMsgs[3], [lstErrors.VisibleCount]);//'Visible: ' + IntToStr(lstErrors.VisibleCount);
end;

procedure TfrmInfoErrors.sbShowHideErrorTypeClick(Sender: TObject); begin ShowHideType(etError, sbShowHideErrorType.Down); end;
procedure TfrmInfoErrors.sbShowHideWarningTypeClick(Sender: TObject); begin ShowHideType(etWarning, sbShowHideWarningType.Down); end;
procedure TfrmInfoErrors.sbShowHideFixedTypeClick(Sender: TObject); begin ShowHideType(etFixed, sbShowHideFixedType.Down); end;
procedure TfrmInfoErrors.sbShowHideCustomInfoTypeClick(Sender: TObject); begin ShowHideType(etCustomInfo, sbShowHideCustomInfoType.Down); end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
function TfrmInfoErrors.GetCheckedTypesAsString: String;
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
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmInfoErrors.SetCheckedTypesFromString(CheckedTypes: String; DontFireOnClickEvent: Boolean = False);
begin
  if DontFireOnClickEvent then
  begin
    SetCheckedState(chkMarkedSubs,              StrToBool(Copy(CheckedTypes,1,1)));
    SetCheckedState(chkLinesWithoutLetters,     StrToBool(Copy(CheckedTypes,2,1)));
    SetCheckedState(chkEmptySubtitles,          StrToBool(Copy(CheckedTypes,3,1)));
    SetCheckedState(chkOverlapping,             StrToBool(Copy(CheckedTypes,4,1)));
    SetCheckedState(chkBadValues,               StrToBool(Copy(CheckedTypes,5,1)));
    SetCheckedState(chkTooShortPause,           StrToBool(Copy(CheckedTypes,6,1)));
    SetCheckedState(chkTooLongDur,              StrToBool(Copy(CheckedTypes,7,1)));
    SetCheckedState(chkTooShortDur,             StrToBool(Copy(CheckedTypes,8,1)));
    SetCheckedState(chkTooLongLines,            StrToBool(Copy(CheckedTypes,9,1)));
    SetCheckedState(chkOverTwoLines,            StrToBool(Copy(CheckedTypes,10,1)));
    SetCheckedState(chkHearingImpaired,         StrToBool(Copy(CheckedTypes,11,1)));
    SetCheckedState(chkTextBeforeColon,         StrToBool(Copy(CheckedTypes,12,1)));
    SetCheckedState(chkUnnecessaryDots,         StrToBool(Copy(CheckedTypes,13,1)));
    SetCheckedState(chkProhibitedChars,         StrToBool(Copy(CheckedTypes,14,1)));
    SetCheckedState(chkRepeatedChars,           StrToBool(Copy(CheckedTypes,15,1)));
    SetCheckedState(chkRepeatedSubs,            StrToBool(Copy(CheckedTypes,16,1)));
    SetCheckedState(chkOCRErrors,               StrToBool(Copy(CheckedTypes,17,1)));
    SetCheckedState(chkOpnDlgInSubsWithOneLine, StrToBool(Copy(CheckedTypes,18,1)));
    SetCheckedState(chkDashOnFirstLine,         StrToBool(Copy(CheckedTypes,19,1)));
    SetCheckedState(chkDialogueOnOneLine,       StrToBool(Copy(CheckedTypes,20,1)));
    SetCheckedState(chkSpaceAfterCustomChars,   StrToBool(Copy(CheckedTypes,21,1)));
    SetCheckedState(chkSpaceBeforeCustomChars,  StrToBool(Copy(CheckedTypes,22,1)));
    SetCheckedState(chkUnnecessarySpaces,       StrToBool(Copy(CheckedTypes,23,1)));
    SetCheckedState(chkUnnecessaryTags,         StrToBool(Copy(CheckedTypes,24,1)));
    SetCheckedState(chkTooMuchCPS,              StrToBool(Copy(CheckedTypes,25,1)));
  end else
    if Pos('0', CheckedTypes) = 0 then
      CheckAllErrors(True) else
    if Pos('1', CheckedTypes) = 0 then
      CheckAllErrors(False) else
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
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmInfoErrors.cmbErrorTypesSetsSelect(Sender: TObject);
begin
  SetCheckedTypesFromString(ErrorTypesSets[cmbErrorTypesSets.ItemIndex]);
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmInfoErrors.cmbErrorTypesSetsKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    #13 : begin
            Key:=#0;
            cmbErrorTypesSets.SelectAll;
            tbtnSaveErrorTypesSetClick(cmbErrorTypesSets);
          end;
  end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmInfoErrors.tbtnSaveErrorTypesSetClick(Sender: TObject);
var
  i, Index : SmallInt;
begin
  if cmbErrorTypesSets.Text <> '' then
  begin
    Index := cmbErrorTypesSets.Items.Count;
    if cmbErrorTypesSets.Items.Count > 0 then
      for i := 0 to cmbErrorTypesSets.Items.Count - 1 do
        if cmbErrorTypesSets.Items[i] = cmbErrorTypesSets.Text then
          Index := i;
    if Index = cmbErrorTypesSets.Items.Count then //if this is a new set
    begin
      SetLength(ErrorTypesSets, Index+1);            
      cmbErrorTypesSets.Items.Add(cmbErrorTypesSets.Text);
      cmbErrorTypesSets.ItemIndex := Index;
    end;
    ErrorTypesSets[Index] := GetCheckedTypesAsString;
  end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmInfoErrors.tbtnDeleteErrorTypesSetClick(Sender: TObject);
var
  i : Integer;
begin
  if cmbErrorTypesSets.ItemIndex > -1 then
  begin
    for i := cmbErrorTypesSets.ItemIndex to cmbErrorTypesSets.Items.Count - 2 do
      ErrorTypesSets[i] := ErrorTypesSets[i+1];
    SetLength(ErrorTypesSets, Length(ErrorTypesSets)-1);
    cmbErrorTypesSets.Items.Delete(cmbErrorTypesSets.ItemIndex);
    cmbErrorTypesSets.Text := '';
    cmbErrorTypesSets.ItemIndex := -1;
  end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmInfoErrors.FormClose(Sender: TObject; var Action: TCloseAction);
var
  Ini : TIniFile;
begin
  Ini := TIniFile.Create(IniRoot);
  try
    Ini.WriteBool('General', 'Info and errors form opened', False);
  finally
    Ini.Free;
  end;
  frmMain.tbInfoErrors.Down := False; //added later
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmInfoErrors.cmbCustomInfoSetsKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    #13 : begin
            Key:=#0;
            cmbCustomInfoSets.SelectAll;
            tbtnSaveCustomInfoSetClick(cmbCustomInfoSets);
          end;
  end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmInfoErrors.cmbCustomInfoSetsSelect(Sender: TObject);
var
  i, j  : SmallInt;
begin
  //delete current custom infos
  for i := 1 to CustomInfosLastNumber do
    if FindComponent('pnlParent' + IntToStr(i)) <> nil then
      FreeCustomInfoComponents(IntToStr(i));
  CustomInfosCount      := 0;
  CustomInfosLastNumber := 0;
  pnlInsideScrollBox.Height := pnlInsideScrollBox.Constraints.MinHeight; //added later
  scrollboxCustomInfo.Height := scrollboxCustomInfo.Constraints.MinHeight; //added later

  //load saved custom infos
  i := cmbCustomInfoSets.ItemIndex;
  for j := 0 to Length(CustomInfoSets[i]) - 1 do
    CreateNewCustomInfo(CustomInfoSets[i][j]);

  DeleteAllCustomInfos; //added later
  CheckCustomInfo(nil); //added later
  lstErrors.Sort(lstErrors.RootNode, lstErrors.Header.SortColumn, lstErrors.Header.SortDirection); //added later
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmInfoErrors.tbtnSaveCustomInfoSetClick(Sender: TObject);
var
  {Ini         : TIniFile;}
  SetIndex    : SmallInt;
  j, k        : SmallInt;
  counter     : SmallInt;
  ANDcounter  : SmallInt;
  ANDform     : TfrmCompositeCustomInfo;
begin
  if cmbCustomInfoSets.Text <> '' then
  begin
    {Ini := TIniFile.Create(IniRoot);
    try}
      //Determine Set Index
      SetIndex := cmbCustomInfoSets.Items.Count;
      if cmbCustomInfoSets.Items.Count > 0 then
        for j := 0 to cmbCustomInfoSets.Items.Count - 1 do
          if cmbCustomInfoSets.Items[j] = cmbCustomInfoSets.Text then
            SetIndex := j;
      if SetIndex = cmbCustomInfoSets.Items.Count then //a new set
      begin
        SetLength(CustomInfoSets, SetIndex + 1);
        cmbCustomInfoSets.Items.Add(cmbCustomInfoSets.Text);
        cmbCustomInfoSets.ItemIndex := SetIndex;
      end;
      //Save data
      SetLength(CustomInfoSets[SetIndex], CustomInfosCount);
      counter := 0;
      for j := 1 to CustomInfosLastNumber do
        if FindComponent('pnlParent' + IntToStr(j)) <> nil then
        begin
          CustomInfoSets[SetIndex][counter].CustomInfoType  := TPanel(FindComponent('pnlParent' + IntToStr(j))).Tag;
          CustomInfoSets[SetIndex][counter].Checked         := TCheckBox(FindComponent('chkCaption' + IntToStr(j))).Checked;
          if CustomInfoSets[SetIndex][counter].CustomInfoType < 6 then
            CustomInfoSets[SetIndex][counter].Text2           := TEdit(FindComponent('edt2_' + IntToStr(j))).Text else
            CustomInfoSets[SetIndex][counter].Text2           := '';
          if CustomInfoSets[SetIndex][counter].CustomInfoType < 7 then
          begin
            CustomInfoSets[SetIndex][counter].Text1           := TEdit(FindComponent('edt1_' + IntToStr(j))).Text;
            CustomInfoSets[SetIndex][counter].ItemIndex       := TComboBox(FindComponent('cmb' + IntToStr(j))).ItemIndex;
            CustomInfoSets[SetIndex][counter].ANDCaption      := '';
            CustomInfoSets[SetIndex][counter].ANDErrorTypes   := '';
            SetLength(CustomInfoSets[SetIndex][counter].ANDCustomInfo, 0);
          end else
          //if CustomInfoSets[SetIndex][counter].CustomInfoType = 7 then
          begin
            CustomInfoSets[SetIndex][counter].Text1           := '';
            CustomInfoSets[SetIndex][counter].ItemIndex       := 0;
            ANDform := TfrmCompositeCustomInfo(frmMain.FindComponent('frmCompositeCustomInfo' + IntToStr(j)));
            CustomInfoSets[SetIndex][counter].ANDCaption      := ANDform.edtCaption.Text;
            CustomInfoSets[SetIndex][counter].ANDErrorTypes   := ANDform.GetCheckedTypesAsString;
            SetLength(CustomInfoSets[SetIndex][counter].ANDCustomInfo, ANDform.CustomInfosCount);
            ANDcounter := 0;
            for k := 1 to ANDform.CustomInfosLastNumber do
              if ANDform.FindComponent('pnlParent' + IntToStr(k)) <> nil then
              begin
                CustomInfoSets[SetIndex][counter].ANDCustomInfo[ANDcounter].CustomInfoType  := TPanel(ANDform.FindComponent('pnlParent' + IntToStr(k))).Tag;
                CustomInfoSets[SetIndex][counter].ANDCustomInfo[ANDcounter].Checked         := TCheckbox(ANDform.FindComponent('chkCaption' + IntToStr(k))).Checked;
                CustomInfoSets[SetIndex][counter].ANDCustomInfo[ANDcounter].Text1           := TEdit(ANDform.FindComponent('edt1_' + IntToStr(k))).Text;
                CustomInfoSets[SetIndex][counter].ANDCustomInfo[ANDcounter].ItemIndex       := TComboBox(ANDform.FindComponent('cmb' + IntToStr(k))).ItemIndex;
                if CustomInfoSets[SetIndex][counter].ANDCustomInfo[ANDcounter].CustomInfoType < 6 then
                  CustomInfoSets[SetIndex][counter].ANDCustomInfo[ANDcounter].Text2         := TEdit(ANDform.FindComponent('edt2_' + IntToStr(k))).Text else
                  CustomInfoSets[SetIndex][counter].ANDCustomInfo[ANDcounter].Text2         := '';
                Inc(ANDcounter);
              end;
          end;
          Inc(counter);
        end;
    {finally
      Ini.Free;
    end;}
  end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmInfoErrors.FreeCustomInfoComponents(Index: String);
begin
  if TPanel(FindComponent('pnlParent' + Index)).Tag < 6 then
  begin
    TLabel(FindComponent('lbl2_' + Index)).Free;
    TEdit(FindComponent('edt2_' + Index)).Free;
    TLabel(FindComponent('lblLess' + Index)).Free;
    TLabel(FindComponent('lbl1_' + Index)).Free;
    TLabel(FindComponent('lblGreater' + Index)).Free;
  end;
  if TPanel(FindComponent('pnlParent' + Index)).Tag < 7 then
  begin
    TComboBox(FindComponent('cmb' + Index)).Free;
    TEdit(FindComponent('edt1_' + Index)).Free;
  end;
  if TPanel(FindComponent('pnlParent' + Index)).Tag = 7 then
  begin
    TFrmCompositeCustomInfo(frmMain.FindComponent('frmCompositeCustomInfo' + Index)).Free;
    //TButton(FindComponent('btnEdit' + Index)).Free; //removed later
    TToolButton(FindComponent('tbtnEdit' + Index)).Free; //added later
  end;
  TLabel(FindComponent('lblCount' + Index)).Free;
  //TButton(FindComponent('btnDel' + Index)).Free; //removed later
  TToolButton(FindComponent('tbtnDel' + Index)).Free; //added later
  TToolBar(FindComponent('tbToolBar' + Index)).Free;
  TCheckbox(FindComponent('chkCaption' + Index)).Free;
  TPanel(FindComponent('pnlParent' + Index)).Free;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmInfoErrors.tbtnDeleteCustomInfoSetClick(Sender: TObject);
var
  SetIndex      : Integer;
  SetItemIndex  : Integer;
  ANDItemIndex  : Integer;
begin
  if cmbCustomInfoSets.ItemIndex > -1 then
  begin
    //SHIFT UP THE REST OF THE SETS
    for SetIndex := cmbCustomInfoSets.ItemIndex to cmbCustomInfoSets.Items.Count - 2 do
    begin
      SetLength(CustomInfoSets[SetIndex], Length(CustomInfoSets[SetIndex+1]));
      for SetItemIndex := 0 to Length(CustomInfoSets[SetIndex+1]) - 1 do
      begin
        CustomInfoSets[SetIndex][SetItemIndex].CustomInfoType := CustomInfoSets[SetIndex+1][SetItemIndex].CustomInfoType;
        CustomInfoSets[SetIndex][SetItemIndex].Checked        := CustomInfoSets[SetIndex+1][SetItemIndex].Checked;
        CustomInfoSets[SetIndex][SetItemIndex].Text1          := CustomInfoSets[SetIndex+1][SetItemIndex].Text1;
        CustomInfoSets[SetIndex][SetItemIndex].ItemIndex      := CustomInfoSets[SetIndex+1][SetItemIndex].ItemIndex;
        CustomInfoSets[SetIndex][SetItemIndex].Text2          := CustomInfoSets[SetIndex+1][SetItemIndex].Text2;
        CustomInfoSets[SetIndex][SetItemIndex].ANDCaption     := CustomInfoSets[SetIndex+1][SetItemIndex].ANDCaption;
        CustomInfoSets[SetIndex][SetItemIndex].ANDErrorTypes  := CustomInfoSets[SetIndex+1][SetItemIndex].ANDErrorTypes;
        SetLength(CustomInfoSets[SetIndex][SetItemIndex].ANDCustomInfo, Length(CustomInfoSets[SetIndex+1][SetItemIndex].ANDCustomInfo));
        for ANDItemIndex := 0 to Length(CustomInfoSets[SetIndex+1][SetItemIndex].ANDCustomInfo) - 1 do
        begin
          CustomInfoSets[SetIndex][SetItemIndex].ANDCustomInfo[ANDItemIndex].CustomInfoType := CustomInfoSets[SetIndex+1][SetItemIndex].ANDCustomInfo[ANDItemIndex].CustomInfoType;
          CustomInfoSets[SetIndex][SetItemIndex].ANDCustomInfo[ANDItemIndex].Checked        := CustomInfoSets[SetIndex+1][SetItemIndex].ANDCustomInfo[ANDItemIndex].Checked;
          CustomInfoSets[SetIndex][SetItemIndex].ANDCustomInfo[ANDItemIndex].Text1          := CustomInfoSets[SetIndex+1][SetItemIndex].ANDCustomInfo[ANDItemIndex].Text1;
          CustomInfoSets[SetIndex][SetItemIndex].ANDCustomInfo[ANDItemIndex].ItemIndex      := CustomInfoSets[SetIndex+1][SetItemIndex].ANDCustomInfo[ANDItemIndex].ItemIndex;
          CustomInfoSets[SetIndex][SetItemIndex].ANDCustomInfo[ANDItemIndex].Text2          := CustomInfoSets[SetIndex+1][SetItemIndex].ANDCustomInfo[ANDItemIndex].Text2;
        end;
      end;
    end;
    //NOW DELETE THE LAST SAVED SET
    SetLength(CustomInfoSets, Length(CustomInfoSets)-1);

    cmbCustomInfoSets.Items.Delete(cmbCustomInfoSets.ItemIndex);
    cmbCustomInfoSets.Text := '';
    cmbCustomInfoSets.ItemIndex := -1;
  end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmInfoErrors.LoadErrorTypesSets;
var
  Ini : TIniFile;
  i   : Integer;
begin
  Ini := TIniFile.Create(IniRoot);
  try
    SetLength(ErrorTypesSets, Ini.ReadInteger('Information and Errors error types', 'Error types sets count', 0));
    for i := 0 to Length(ErrorTypesSets) - 1 do
    begin
      ErrorTypesSets[i] := Ini.ReadString('Information and Errors error types', 'Error types set ' + IntToStr(i), GetCheckedTypesAsString);
      cmbErrorTypesSets.Items.Add(Ini.ReadString('Information and Errors error types', 'Error types set ' + IntToStr(i) + ' name', IntToStr(i)));
      if ErrorTypesSets[i] = GetCheckedTypesAsString then
        cmbErrorTypesSets.ItemIndex := i;
    end;
  finally
    Ini.Free;
  end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmInfoErrors.LoadCurrentCustomInfo;
var
  Ini     : TIniFile;
  j, k    : Integer;
  CIData  : TCustomInfoData;
begin
  Ini := TIniFile.Create(IniRoot);
  try
    for j := 1 to                                    Ini.ReadInteger('CI sets', 'SCur CICnt', 0) do
    begin
      CIData.CustomInfoType                       := Ini.ReadInteger('CI sets', 'SCur CI' + IntToStr(j) + ' Type', -1);
      CIData.Checked                              := Ini.ReadBool   ('CI sets', 'SCur CI' + IntToStr(j) + ' Chk', True);
      CIData.Text1                                := Ini.ReadString ('CI sets', 'SCur CI' + IntToStr(j) + ' Txt1', '');
      CIData.Text2                                := Ini.ReadString ('CI sets', 'SCur CI' + IntToStr(j) + ' Txt2', '');
      CIData.ItemIndex                            := Ini.ReadInteger('CI sets', 'SCur CI' + IntToStr(j) + ' IIdx', 0);
      CIData.ANDCaption                           := Ini.ReadString ('CI sets', 'SCur CI' + IntToStr(j) + ' AndCap', '');
      CIData.ANDErrorTypes                        := Ini.ReadString ('CI sets', 'SCur CI' + IntToStr(j) + ' AndErr', '');
      SetLength(CIData.ANDCustomInfo,                Ini.ReadInteger('CI sets', 'SCur CI' + IntToStr(j) + ' AndCICnt', 0));
      for k := 1 to Length(CIData.ANDCustomInfo) do
      begin
        CIData.ANDCustomInfo[k-1].CustomInfoType  := Ini.ReadInteger('CI sets', 'SCur CI' + IntToStr(j) + ' AndCI' + IntToStr(k) + ' Type', -1);
        CIData.ANDCustomInfo[k-1].Checked         := Ini.ReadBool   ('CI sets', 'SCur CI' + IntToStr(j) + ' AndCI' + IntToStr(k) + ' Chk', True);
        CIData.ANDCustomInfo[k-1].Text1           := Ini.ReadString ('CI sets', 'SCur CI' + IntToStr(j) + ' AndCI' + IntToStr(k) + ' Txt1', '');
        CIData.ANDCustomInfo[k-1].ItemIndex       := Ini.ReadInteger('CI sets', 'SCur CI' + IntToStr(j) + ' AndCI' + IntToStr(k) + ' IIdx', 0);
        CIData.ANDCustomInfo[k-1].Text2           := Ini.ReadString ('CI sets', 'SCur CI' + IntToStr(j) + ' AndCI' + IntToStr(k) + ' Txt2', '');
      end;
      CreateNewCustomInfo(CIData);
    end;
  finally
    Ini.Free;
  end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmInfoErrors.LoadCustomInfoSets;
var
  Ini     : TIniFile;
  i, j, k : Integer;
begin
  Ini := TIniFile.Create(IniRoot);
  try
    SetLength(CustomInfoSets,                                          Ini.ReadInteger('CI sets', 'Sets count', 0));
    for i := 0 to Length(CustomInfoSets) - 1 do
    begin
      SetLength(CustomInfoSets[i],                                     Ini.ReadInteger('CI sets', 'S' + IntToStr(i) + ' CICnt', 0));
      for j := 1 to Length(CustomInfoSets[i]) do
      begin
        CustomInfoSets[i][j-1].CustomInfoType                       := Ini.ReadInteger('CI sets', 'S' + IntToStr(i) + ' CI' + IntToStr(j) + ' Type', 0);
        CustomInfoSets[i][j-1].Checked                              := Ini.ReadBool   ('CI sets', 'S' + IntToStr(i) + ' CI' + IntToStr(j) + ' Chk', True);
        CustomInfoSets[i][j-1].Text1                                := Ini.ReadString ('CI sets', 'S' + IntToStr(i) + ' CI' + IntToStr(j) + ' Txt1', '');
        CustomInfoSets[i][j-1].ItemIndex                            := Ini.ReadInteger('CI sets', 'S' + IntToStr(i) + ' CI' + IntToStr(j) + ' IIdx', 0);
        CustomInfoSets[i][j-1].Text2                                := Ini.ReadString ('CI sets', 'S' + IntToStr(i) + ' CI' + IntToStr(j) + ' Txt2', '');
        CustomInfoSets[i][j-1].ANDCaption                           := Ini.ReadString ('CI sets', 'S' + IntToStr(i) + ' CI' + IntToStr(j) + ' AndCap', '');
        CustomInfoSets[i][j-1].ANDErrorTypes                        := Ini.ReadString ('CI sets', 'S' + IntToStr(i) + ' CI' + IntToStr(j) + ' AndErr', '');

        SetLength(CustomInfoSets[i][j-1].ANDCustomInfo,                Ini.ReadInteger('CI sets', 'S' + IntToStr(i) + ' CI' + IntToStr(j) + ' AndCICnt', 0));
        for k := 1 to Length(CustomInfoSets[i][j-1].ANDCustomInfo) do
        begin
          CustomInfoSets[i][j-1].ANDCustomInfo[k-1].CustomInfoType  := Ini.ReadInteger('CI sets', 'S' + IntToStr(i) + ' CI' + IntToStr(j) + ' AndCI' + IntToStr(k) + ' Type', -1);
          CustomInfoSets[i][j-1].ANDCustomInfo[k-1].Checked         := Ini.ReadBool   ('CI sets', 'S' + IntToStr(i) + ' CI' + IntToStr(j) + ' AndCI' + IntToStr(k) + ' Chk', True);
          CustomInfoSets[i][j-1].ANDCustomInfo[k-1].Text1           := Ini.ReadString ('CI sets', 'S' + IntToStr(i) + ' CI' + IntToStr(j) + ' AndCI' + IntToStr(k) + ' Txt1', '');
          CustomInfoSets[i][j-1].ANDCustomInfo[k-1].ItemIndex       := Ini.ReadInteger('CI sets', 'S' + IntToStr(i) + ' CI' + IntToStr(j) + ' AndCI' + IntToStr(k) + ' IIdx', 0);
          CustomInfoSets[i][j-1].ANDCustomInfo[k-1].Text2           := Ini.ReadString ('CI sets', 'S' + IntToStr(i) + ' CI' + IntToStr(j) + ' AndCI' + IntToStr(k) + ' Txt2', '');
        end;
      end;
      cmbCustomInfoSets.Items.Add(                                     Ini.ReadString ('CI sets', 'S' + IntToStr(i) + ' Name', IntToStr(i+1)));
    end;
  finally
    Ini.Free;
  end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmInfoErrors.SaveCurrentCustomInfo;
var
  Ini           : TMemIniFile; //TIniFile replaced with TMemIniFile by adenry
  j, counter    : Integer;
  k, ANDcounter : Integer;
  form          : TfrmCompositeCustomInfo;
begin
  Ini := TMemIniFile.Create(IniRoot); //TIniFile replaced with TMemIniFile by adenry
  try
    Ini.WriteInteger            ('CI sets', 'SCur CICnt', CustomInfosCount);
    counter := 0;
    for j := 1 to CustomInfosLastNumber do
      if FindComponent('pnlParent' + IntToStr(j)) <> nil then
      begin
        Inc(counter);
        Ini.WriteInteger        ('CI sets', 'SCur CI' + IntToStr(counter) + ' Type',      TPanel(FindComponent('pnlParent' + IntToStr(j))).Tag);
        Ini.WriteBool           ('CI sets', 'SCur CI' + IntToStr(counter) + ' Chk',       TCheckbox(FindComponent('chkCaption' + IntToStr(j))).Checked);
        if TPanel(FindComponent('pnlParent' + IntToStr(j))).Tag < 6 then
          Ini.WriteString       ('CI sets', 'SCur CI' + IntToStr(counter) + ' Txt2',      TEdit(FindComponent('edt2_' + IntToStr(j))).Text);
        if TPanel(FindComponent('pnlParent' + IntToStr(j))).Tag < 7 then
        begin
          Ini.WriteString       ('CI sets', 'SCur CI' + IntToStr(counter) + ' Txt1',      TEdit(FindComponent('edt1_' + IntToStr(j))).Text);
          Ini.WriteInteger      ('CI sets', 'SCur CI' + IntToStr(counter) + ' IIdx',      TComboBox(FindComponent('cmb' + IntToStr(j))).ItemIndex);
        end else
        //if TPanel(FindComponent('pnlParent' + IntToStr(j))).Tag = 7 then
        begin
          form := TFrmCompositeCustomInfo(frmMain.FindComponent('frmCompositeCustomInfo'  + IntToStr(j)));
          Ini.WriteString       ('CI sets', 'SCur CI' + IntToStr(counter) + ' AndCap',    form.edtCaption.Text);
          Ini.WriteString       ('CI sets', 'SCur CI' + IntToStr(counter) + ' AndErr',    form.GetCheckedTypesAsString);
          Ini.WriteInteger      ('CI sets', 'SCur CI' + IntToStr(counter) + ' AndCICnt',  form.CustomInfosCount);
          ANDcounter := 0;
          for k := 1 to form.CustomInfosLastNumber do
            if form.FindComponent('pnlParent' + IntToStr(k)) <> nil then
            begin
              Inc(ANDcounter);
              Ini.WriteInteger  ('CI sets', 'SCur CI' + IntToStr(counter) + ' AndCI' + IntToStr(ANDcounter) + ' Type',  TPanel    (form.FindComponent('pnlParent' + IntToStr(k))).Tag);
              Ini.WriteBool     ('CI sets', 'SCur CI' + IntToStr(counter) + ' AndCI' + IntToStr(ANDcounter) + ' Chk',   TCheckbox (form.FindComponent('chkCaption' + IntToStr(k))).Checked);
              Ini.WriteString   ('CI sets', 'SCur CI' + IntToStr(counter) + ' AndCI' + IntToStr(ANDcounter) + ' Txt1',  TEdit     (form.FindComponent('edt1_' + IntToStr(k))).Text);
              Ini.WriteInteger  ('CI sets', 'SCur CI' + IntToStr(counter) + ' AndCI' + IntToStr(ANDcounter) + ' IIdx',  TComboBox (form.FindComponent('cmb' + IntToStr(k))).ItemIndex);
              if TPanel(form.FindComponent('pnlParent' + IntToStr(k))).Tag < 6 then
                Ini.WriteString ('CI sets', 'SCur CI' + IntToStr(counter) + ' AndCI' + IntToStr(ANDcounter) + ' Txt2',  TEdit     (form.FindComponent('edt2_' + IntToStr(k))).Text);
            end;
        end;
      end;
  finally
    Ini.UpdateFile; //added by adenry
    Ini.Free;
  end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmInfoErrors.SaveCustomInfoSets;
var
  Ini     : TMemIniFile; //TIniFile replaced with TMemIniFile by adenry
  i, j, k : Integer;
begin
  Ini := TMemIniFile.Create(IniRoot); //TIniFile replaced with TMemIniFile by adenry
  try
    for i := 0 to cmbCustomInfoSets.Items.Count - 1 do
    begin
      Ini.WriteString         ('CI sets', 'S' + IntToStr(i) + ' Name', cmbCustomInfoSets.Items[i]);
      Ini.WriteInteger        ('CI sets', 'S' + IntToStr(i) + ' CICnt', Length(CustomInfoSets[i]));
      for j := 1 to Length(CustomInfoSets[i]) do
      begin
        Ini.WriteInteger      ('CI sets', 'S' + IntToStr(i) + ' CI' + IntToStr(j) + ' Type',      CustomInfoSets[i][j-1].CustomInfoType);
        Ini.WriteBool         ('CI sets', 'S' + IntToStr(i) + ' CI' + IntToStr(j) + ' Chk',       CustomInfoSets[i][j-1].Checked);
        if CustomInfoSets[i][j-1].CustomInfoType < 6 then
          Ini.WriteString     ('CI sets', 'S' + IntToStr(i) + ' CI' + IntToStr(j) + ' Txt2',      CustomInfoSets[i][j-1].Text2);
        if CustomInfoSets[i][j-1].CustomInfoType < 7 then
        begin
          Ini.WriteString     ('CI sets', 'S' + IntToStr(i) + ' CI' + IntToStr(j) + ' Txt1',      CustomInfoSets[i][j-1].Text1);
          Ini.WriteInteger    ('CI sets', 'S' + IntToStr(i) + ' CI' + IntToStr(j) + ' IIdx',      CustomInfoSets[i][j-1].ItemIndex);
        end else
        //if CustomInfoSets[i][j-1].CustomInfoType = 7 then
        begin
          Ini.WriteString     ('CI sets', 'S' + IntToStr(i) + ' CI' + IntToStr(j) + ' AndCap',    CustomInfoSets[i][j-1].ANDCaption);
          Ini.WriteString     ('CI sets', 'S' + IntToStr(i) + ' CI' + IntToStr(j) + ' AndErr',    CustomInfoSets[i][j-1].ANDErrorTypes);
          Ini.WriteInteger    ('CI sets', 'S' + IntToStr(i) + ' CI' + IntToStr(j) + ' AndCICnt',  Length(CustomInfoSets[i][j-1].ANDCustomInfo));
          for k := 1 to Length(CustomInfoSets[i][j-1].ANDCustomInfo) do
          begin
            Ini.WriteInteger  ('CI sets', 'S' + IntToStr(i) + ' CI' + IntToStr(j) + ' AndCI' + IntToStr(k) + ' Type', CustomInfoSets[i][j-1].ANDCustomInfo[k-1].CustomInfoType);
            Ini.WriteBool     ('CI sets', 'S' + IntToStr(i) + ' CI' + IntToStr(j) + ' AndCI' + IntToStr(k) + ' Chk',  CustomInfoSets[i][j-1].ANDCustomInfo[k-1].Checked);
            Ini.WriteString   ('CI sets', 'S' + IntToStr(i) + ' CI' + IntToStr(j) + ' AndCI' + IntToStr(k) + ' Txt1', CustomInfoSets[i][j-1].ANDCustomInfo[k-1].Text1);
            Ini.WriteInteger  ('CI sets', 'S' + IntToStr(i) + ' CI' + IntToStr(j) + ' AndCI' + IntToStr(k) + ' IIdx', CustomInfoSets[i][j-1].ANDCustomInfo[k-1].ItemIndex);
            if CustomInfoSets[i][j-1].ANDCustomInfo[k-1].CustomInfoType < 6 then
              Ini.WriteString ('CI sets', 'S' + IntToStr(i) + ' CI' + IntToStr(j) + ' AndCI' + IntToStr(k) + ' Txt2', CustomInfoSets[i][j-1].ANDCustomInfo[k-1].Text2);
          end;
        end;
      end;
    end;
    Ini.WriteInteger('CI sets', 'Sets count', cmbCustomInfoSets.Items.Count);
  finally
    Ini.UpdateFile; //added by adenry
    Ini.Free;
  end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmInfoErrors.SelectSubtitles(Selected: Boolean);
var
  ErrNode : PVirtualNode;
  ErrData : PInfoError;
begin
  ErrNode := lstErrors.GetFirstVisible;
  while Assigned(ErrNode) do
  begin
    ErrData := lstErrors.GetNodeData(ErrNode);
    frmMain.lstSubtitles.Selected[GetNodeWithIndex(frmMain.lstSubtitles, ErrData.Subtitle - 1)] := Selected;
    ErrNode := lstErrors.GetNextVisible(ErrNode);
  end;
  frmMain.RefreshTimes; //added later
end;

procedure TfrmInfoErrors.btnSelectClick(Sender: TObject);
begin
  frmMain.lstSubtitles.ClearSelection;
  SelectSubtitles(True);
end;

procedure TfrmInfoErrors.btnSelectPlusClick(Sender: TObject);
begin
  SelectSubtitles(True);
end;

procedure TfrmInfoErrors.btnSelectMinusClick(Sender: TObject);
begin
  SelectSubtitles(False);
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmInfoErrors.CallSetLanguage;
begin
  SetLanguage;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmInfoErrors.SetErrorTypesCheckboxesEnabledState;
begin
  chkLinesWithoutLetters.Enabled     :=  ErrorsToCheck.eLinesWithoutLetters   ; lblCountLinesWithoutLetters.Enabled 		:= ErrorsToCheck.eLinesWithoutLetters   ;
  chkEmptySubtitles.Enabled          :=  ErrorsToCheck.eEmptySubtitle         ; lblCountEmptySubtitles.Enabled 					:= ErrorsToCheck.eEmptySubtitle         ;
  chkOverlapping.Enabled             :=  ErrorsToCheck.eOverlapping           ; lblCountOverlapping.Enabled 						:= ErrorsToCheck.eOverlapping           ;
  chkBadValues.Enabled               :=  ErrorsToCheck.eBadValues             ; lblCountBadValues.Enabled 							:= ErrorsToCheck.eBadValues             ;
  chkTooShortPause.Enabled           :=  ErrorsToCheck.eTooShortPause         ; lblCountTooShortPause.Enabled 					:= ErrorsToCheck.eTooShortPause         ;
  chkTooLongDur.Enabled              :=  ErrorsToCheck.eTooLongDurations      ; lblCountTooLongDur.Enabled 							:= ErrorsToCheck.eTooLongDurations      ;
  chkTooShortDur.Enabled             :=  ErrorsToCheck.eTooShortDurations     ; lblCountTooShortDur.Enabled 						:= ErrorsToCheck.eTooShortDurations     ;
  chkTooLongLines.Enabled            :=  ErrorsToCheck.eTooLongLines          ; lblCountTooLongLines.Enabled 						:= ErrorsToCheck.eTooLongLines          ;
  chkOverTwoLines.Enabled            :=  ErrorsToCheck.eOverTwoLines          ; lblCountOverTwoLines.Enabled 						:= ErrorsToCheck.eOverTwoLines          ;
  chkHearingImpaired.Enabled         :=  ErrorsToCheck.eHearingImpaired       ; lblCountHearingImpaired.Enabled 				:= ErrorsToCheck.eHearingImpaired       ;
  chkTextBeforeColon.Enabled         :=  ErrorsToCheck.eTextBeforeColon       ; lblCountTextBeforeColon.Enabled 				:= ErrorsToCheck.eTextBeforeColon       ;
  chkUnnecessaryDots.Enabled         :=  ErrorsToCheck.eUnnecessaryDots       ; lblCountUnnecessaryDots.Enabled 				:= ErrorsToCheck.eUnnecessaryDots       ;
  chkProhibitedChars.Enabled         :=  ErrorsToCheck.eProhibitedCharacter   ; lblCountProhibitedChars.Enabled 				:= ErrorsToCheck.eProhibitedCharacter   ;
  chkRepeatedChars.Enabled           :=  ErrorsToCheck.eRepeatedCharacter     ; lblCountRepeatedChars.Enabled 					:= ErrorsToCheck.eRepeatedCharacter     ;
  chkRepeatedSubs.Enabled            :=  ErrorsToCheck.eRepeatedSubtitle      ; lblCountRepeatedSubs.Enabled 						:= ErrorsToCheck.eRepeatedSubtitle      ;
  chkOCRErrors.Enabled               :=  ErrorsToCheck.eOCRErrors             ; lblCountOCRErrors.Enabled 							:= ErrorsToCheck.eOCRErrors             ;
  chkOpnDlgInSubsWithOneLine.Enabled :=  ErrorsToCheck.eOpnDlgSubsOneLine     ; lblCountOpnDlgInSubsWithOneLine.Enabled := ErrorsToCheck.eOpnDlgSubsOneLine     ;
  chkDashOnFirstLine.Enabled         :=  ErrorsToCheck.eDashOnFirstLine       ; lblCountDashOnFirstLine.Enabled 				:= ErrorsToCheck.eDashOnFirstLine       ;
  chkDialogueOnOneLine.Enabled       :=  ErrorsToCheck.eDialogueOnOneLine     ; lblCountDialogueOnOneLine.Enabled 			:= ErrorsToCheck.eDialogueOnOneLine     ;
  chkSpaceAfterCustomChars.Enabled   :=  ErrorsToCheck.eSpaceAfterCustChars   ; lblCountSpaceAfterCustomChars.Enabled 	:= ErrorsToCheck.eSpaceAfterCustChars   ;
  chkSpaceBeforeCustomChars.Enabled  :=  ErrorsToCheck.eSpaceBeforeCustChars  ; lblCountSpaceBeforeCustomChars.Enabled 	:= ErrorsToCheck.eSpaceBeforeCustChars  ;
  chkUnnecessarySpaces.Enabled       :=  ErrorsToCheck.eUnnecessarySpaces     ; lblCountUnnecessarySpaces.Enabled 			:= ErrorsToCheck.eUnnecessarySpaces     ;
  chkUnnecessaryTags.Enabled         :=  ErrorsToCheck.eUnnecessaryTags       ; lblCountUnnecessaryTags.Enabled 				:= ErrorsToCheck.eUnnecessaryTags       ;
  chkTooMuchCPS.Enabled              :=  ErrorsToCheck.eTooMuchCPS            ; lblCountTooMuchCPS.Enabled 							:= ErrorsToCheck.eTooMuchCPS            ;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
function TfrmInfoErrors.CheckCompositeCustomInfo(Node: PVirtualNode; CustomInfoN: Integer): Boolean;
var
  Data                      : PSubtitleItem;
  j                         : Integer;
  frmCompositeCustomInfoCur : TFrmCompositeCustomInfo;
  CanSetTrue                : Boolean;
begin
  Result := False;
  if (CustomInfosCount > 0) and (frmMain.lstSubtitles.RootNodeCount > 0) then
  begin
    Data := frmMain.lstSubtitles.GetNodeData(Node);
    if frmMain.FindComponent('frmCompositeCustomInfo' + IntToStr(CustomInfoN)) <> nil then
      begin
        frmCompositeCustomInfoCur := TFrmCompositeCustomInfo(frmMain.FindComponent('frmCompositeCustomInfo' + IntToStr(CustomInfoN)));
        CanSetTrue := False;
        //check errors
        if frmCompositeCustomInfoCur.chkMarkedSubs.Checked              then begin CanSetTrue := True; if not Data.Marked then exit; end;
        if frmCompositeCustomInfoCur.chkLinesWithoutLetters.Checked     then begin CanSetTrue := True; if not (etLinesWithoutLetters   in Data.ErrorType) then exit; end;
        if frmCompositeCustomInfoCur.chkEmptySubtitles.Checked          then begin CanSetTrue := True; if not (etEmptySubtitle         in Data.ErrorType) then exit; end;
        if frmCompositeCustomInfoCur.chkOverlapping.Checked             then begin CanSetTrue := True; if not (etOverlapping           in Data.ErrorType) then exit; end;
        if frmCompositeCustomInfoCur.chkBadValues.Checked               then begin CanSetTrue := True; if not (etBadValues             in Data.ErrorType) then exit; end;
        if frmCompositeCustomInfoCur.chkTooShortPause.Checked           then begin CanSetTrue := True; if not (etTooShortPause         in Data.ErrorType) then exit; end;
        if frmCompositeCustomInfoCur.chkTooLongDur.Checked              then begin CanSetTrue := True; if not (etTooLongDuration       in Data.ErrorType) then exit; end;
        if frmCompositeCustomInfoCur.chkTooShortDur.Checked             then begin CanSetTrue := True; if not (etTooShortDuration      in Data.ErrorType) then exit; end;
        if frmCompositeCustomInfoCur.chkTooLongLines.Checked            then begin CanSetTrue := True; if not (etTooLongLine           in Data.ErrorType) then exit; end;
        if frmCompositeCustomInfoCur.chkOverTwoLines.Checked            then begin CanSetTrue := True; if not (etOverTwoLines          in Data.ErrorType) then exit; end;
        if frmCompositeCustomInfoCur.chkHearingImpaired.Checked         then begin CanSetTrue := True; if not (etHearingImpaired       in Data.ErrorType) then exit; end;
        if frmCompositeCustomInfoCur.chkTextBeforeColon.Checked         then begin CanSetTrue := True; if not (etTextBeforeColon       in Data.ErrorType) then exit; end;
        if frmCompositeCustomInfoCur.chkUnnecessaryDots.Checked         then begin CanSetTrue := True; if not (etUnnecessaryDots       in Data.ErrorType) then exit; end;
        if frmCompositeCustomInfoCur.chkProhibitedChars.Checked         then begin CanSetTrue := True; if not (etProhibitedCharacter   in Data.ErrorType) then exit; end;
        if frmCompositeCustomInfoCur.chkRepeatedChars.Checked           then begin CanSetTrue := True; if not (etRepeatedCharacter     in Data.ErrorType) then exit; end;
        if frmCompositeCustomInfoCur.chkRepeatedSubs.Checked            then begin CanSetTrue := True; if not (etRepeatedSubtitle      in Data.ErrorType) then exit; end;
        if frmCompositeCustomInfoCur.chkOCRErrors.Checked               then begin CanSetTrue := True; if not (etOCRErrors             in Data.ErrorType) then exit; end;
        if frmCompositeCustomInfoCur.chkOpnDlgInSubsWithOneLine.Checked then begin CanSetTrue := True; if not (etOpnDlgSubsOneLine     in Data.ErrorType) then exit; end;
        if frmCompositeCustomInfoCur.chkDashOnFirstLine.Checked         then begin CanSetTrue := True; if not (etDashOnFirstLine       in Data.ErrorType) then exit; end;
        if frmCompositeCustomInfoCur.chkDialogueOnOneLine.Checked       then begin CanSetTrue := True; if not (etDialogueOnOneLine     in Data.ErrorType) then exit; end;
        if frmCompositeCustomInfoCur.chkSpaceAfterCustomChars.Checked   then begin CanSetTrue := True; if not (etSpaceAfterCustChars   in Data.ErrorType) then exit; end;
        if frmCompositeCustomInfoCur.chkSpaceBeforeCustomChars.Checked  then begin CanSetTrue := True; if not (etSpaceBeforeCustChars  in Data.ErrorType) then exit; end;
        if frmCompositeCustomInfoCur.chkUnnecessarySpaces.Checked       then begin CanSetTrue := True; if not (etUnnecessarySpaces     in Data.ErrorType) then exit; end;
        if frmCompositeCustomInfoCur.chkUnnecessaryTags.Checked         then begin CanSetTrue := True; if not (etUnnecessaryTags       in Data.ErrorType) then exit; end;
        if frmCompositeCustomInfoCur.chkTooMuchCPS.Checked              then begin CanSetTrue := True; if not (etTooMuchCPS            in Data.ErrorType) then exit; end;
        //check custom info
        for j := 1 to frmCompositeCustomInfoCur.CustomInfosLastNumber do
          if frmCompositeCustomInfoCur.FindComponent('pnlParent' + IntToStr(j)) <> nil then
            if TCheckbox(frmCompositeCustomInfoCur.FindComponent('chkCaption' + IntToStr(j))).Checked then
            begin
              CanSetTrue := True;
              if not CheckCustomInfo(Node, j, frmCompositeCustomInfoCur.Name) then exit;
            end;
        //if we are here, then the subtitle matches all checked conditions!
        if CanSetTrue then //if there were any conditions (if there were no conditions at all, any subtitle will match this custom info, we don't want that)
          Result := True;
      end;
  end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmInfoErrors.CheckAllCI(Checked: Boolean);
var
  i: Integer;
begin
  for i := 1 to CustomInfosLastNumber do
    if FindComponent('chkCaption' + IntToStr(i)) <> nil then
      TCheckbox(FindComponent('chkCaption' + IntToStr(i))).Checked := Checked;
end;

procedure TfrmInfoErrors.btnCheckAllCIClick(Sender: TObject); begin CheckAllCI(True); end;
procedure TfrmInfoErrors.btnCheckNoneCIClick(Sender: TObject); begin CheckAllCI(False); end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmInfoErrors.btnCheckInverseCIClick(Sender: TObject);
var
  i: Integer;
begin
  for i := 1 to CustomInfosLastNumber do
    if FindComponent('chkCaption' + IntToStr(i)) <> nil then
      TCheckbox(FindComponent('chkCaption' + IntToStr(i))).Checked := not TCheckbox(FindComponent('chkCaption' + IntToStr(i))).Checked;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmInfoErrors.spSplitterMoved(Sender: TObject);
begin
  scrollboxCustomInfo.Height := pnlCustomInfo.Height - scrollboxCustomInfo.Top - bvlBottom2.Height;
  Constraints.MinHeight := pnlCustomInfo.Height + spSplitter.Height + Integer(pnlErrorTypes.Visible)*(pnlErrorTypes.Height) + pnlInfoErrorsList.Constraints.MinHeight + pnlInfoErrorsWrapper.Top + BottomAreaHeight + (Height - ClientHeight);
  //Notice: if we set an akRight Anchor to pnlInsideScrollBox, its with will automatically change when the vertical scroll of scrollboxCustomInfo appears and disappears.
end;

procedure TfrmInfoErrors.spSplitterCanResize(Sender: TObject; var NewSize: Integer; var Accept: Boolean);
begin
  if (pnlInsideScrollBox.Height <= scrollboxCustomInfo.Height) and (NewSize > pnlCustomInfo.Height) then
    NewSize := pnlCustomInfo.Height;
  if (NewSize > pnlCustomInfo.Constraints.MaxHeight) then
    NewSize := pnlCustomInfo.Constraints.MaxHeight;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//Export to file by BDZL
procedure TfrmInfoErrors.btnExportToFileClick(Sender: TObject);
  //----------------------------------------
  procedure GetColWidths(var w1, w2 : Integer);
  var
    i : Integer;
  begin
    w1 := Max(5, length(lstErrors.Header.Columns[0].Text));   // let's assume there are no more than 99999 subtitles

    w2 := length(lstErrors.Header.Columns[1].Text);
    for i := Low(ErrorTypes) to High(ErrorTypes) do
      if length(ErrorTypes[i]) > w2 then
        w2 := length(ErrorTypes[i]);
  end;
  //----------------------------------------
  function FillWithSpaces(Text: String; NewLength: Integer): String;
  begin
    if length(Text) >= NewLength then
      Result := Text
    else begin
      Result := Text + DupeString(' ', NewLength - length(Text));
    end;
  end;
  //----------------------------------------
  procedure SaveReport(fn : String);
  const
    SPACES = 1;
  var
    f    : TextFile;
    Node : PVirtualNode;
    Data : WideString;
    Msg  : String;
    w1, w2 : Integer;
  begin
    GetColWidths(w1, w2);

    try
      try
        AssignFile(f, fn);
        ReWrite(f);

        Msg := FillWithSpaces(lstErrors.Header.Columns[0].Text, w1+SPACES) +
               FillWithSpaces(lstErrors.Header.Columns[1].Text, w2+SPACES) +
               lstErrors.Header.Columns[2].Text;
        WriteLn(f, Msg);

        Node := lstErrors.GetFirst;
        while Assigned(Node) do
        begin
          lstErrorsGetText(lstErrors, Node, 0, ttStatic, Data);
          Msg := FillWithSpaces(Data, w1+SPACES);
          lstErrorsGetText(lstErrors, Node, 1, ttStatic, Data);
          Msg := Msg + FillWithSpaces(Data, w2+SPACES);
          lstErrorsGetText(lstErrors, Node, 2, ttStatic, Data);
          Msg := Msg + Data;

          WriteLn(f, Msg);

          Node := Node.NextSibling;
        end;

      except on E:Exception do
        begin
          MsgBox(Format(InfoMsg[12], [E.Message]), BTN_OK, '', '', MB_ICONWARNING, frmMain);
        end;
      end;
    finally
      CloseFile(f);
    end;
  end;
  //----------------------------------------
var
  fname : String;
  code  : Integer;
begin
  AddInfoError(-1, etInfo, ifTotalErrors, TotalErrors); //added by adenry
  if (dlgSave.Execute) and (dlgSave.FileName <> '') then
  begin
    if AnsiLowerCase(ExtractFileExt(dlgSave.FileName)) = '.txt' then
      fname := dlgSave.FileName else
      fname := dlgSave.FileName + '.txt';

    if FileExists(fname) = False then begin
      SaveReport(fname);
      exit;
    end;

    code := MsgBox(Format(QuestionMsg[02], [fname]), BTN_YES, BTN_NO, '', MB_ICONWARNING, frmMain);
    if code <> 1 then exit;

    if FileIsReadOnly(fname) = False then begin
      SaveReport(fname);
      exit;
    end;

    code := MsgBox(Format(QuestionMsg[09], [fname]), BTN_YES, BTN_NO, '', MB_ICONWARNING, frmMain);
    if code <> 1 then exit;

    if FileSetReadOnly(fname, False) then begin
      SaveReport(fname);
      exit;
    end;

    MsgBox(Format(ErrorMsg[12], [fname]), BTN_OK, '', '', MB_ICONERROR, frmMain);
  end;
  lstErrors.DeleteNode(lstErrors.GetLast); //added by adenry
end;

// -----------------------------------------------------------------------------

//Set custom infos language when changing SW interface language
procedure TfrmInfoErrors.SetCustomInfosLanguage;
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
        if CIType <> 7 then //Composite Custom Infos have a Caption field, don't change their caption
        begin
          //Change the Custom Info Caption
          TLabel(Component).Caption := IntToStr(i) + '. ' + CustomInfoTypes[CIType];
          if i < 10 then TLabel(Component).Caption := '0' + TLabel(Component).Caption;
        end;
        //Change Custom Info DELETE button Hint text
        Component := FindComponent('tbtnDel' + IntToStr(i));
        TToolButton(Component).Hint := CustomInfoDelete;
        //Change strings in Composite Custom Info type
        if CIType = 7 then
        begin
          //Change EDIT button Hint text
          Component := FindComponent('tbtnEdit' + IntToStr(i));
          TToolButton(Component).Hint := CustomInfoEdit;
        end else
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

// -----------------------------------------------------------------------------

//added by adenry: begin
//Set custom infos language when changing SW interface language
procedure TfrmInfoErrors.SetCustomInfosCharsets;
var
  i         : Integer;
  CIType    : SmallInt;
begin
  for i := 1 to CustomInfosLastNumber do
    if FindComponent('pnlParent' + IntToStr(i)) <> nil then
    begin
      CIType := TPanel(FindComponent('pnlParent' + IntToStr(i))).Tag; //Get Custom Info type
      if CIType = 6 then
        TEdit(FindComponent('edt1_' + IntToStr(i))).Font.Charset := frmMain.OrgCharset;
    end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmInfoErrors.tmrBlinkTimer(Sender: TObject);
begin
  Dec(tmrBlinkVal);
  pnlPanelCreator.Color := MixColors(clWhite, clBtnFace, tmrBlinkVal);
  if tmrBlinkVal = 0 then
  begin
    tmrBlink.Enabled := False;
    tmrBlinkVal := 100;
  end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

end.
