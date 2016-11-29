// This file is part of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle Workshop's copyright information
// File Description: Settings form

unit formSettings;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, ComCtrls, CheckLst, Registry, IniFiles, Mask, Math,
  VirtualTrees, MiSubtitulo, {NFormSizing,}
  FastStrings, WinShell, //WinShell added by adenry
  CommonTypes;

type
  TfrmSettings = class(TForm)
    pnlHeading: TPanel;
    imgDrawing: TImage;
    lblTitle: TLabel;
    lblDescription: TLabel;
    bvlSeparator: TBevel;
    tvSettings: TTreeView;
    bvlSeparate1: TBevel;
    btnOk: TButton;
    btnCancel: TButton;
    dlgBrowse: TOpenDialog;
    dlgSetColor: TColorDialog;
    dlgSetFont: TFontDialog;
    pgeCtrl: TPageControl;
    pgeGeneral: TTabSheet;
    pgeFormats: TTabSheet;
    pgeFileTypes: TTabSheet;
    pgeSave: TTabSheet;
    pgeVideoPreview: TTabSheet;
    chkAlwaysOnTop: TCheckBox;
    chkInstance: TCheckBox;
    chkConfirmDelete: TCheckBox;
    chkInterpretInvalid: TCheckBox;
    chkAutosearchMovie: TCheckBox;
    chkForceWorkingTime: TCheckBox;
    chkKeepOrderOfLines: TCheckBox;
    chkSelectTextNL: TCheckBox;
    chkSelectTextPL: TCheckBox;
    bvlSeparate2: TBevel;
    edtRFLimit: TLabeledEdit;
    udRFLimit: TUpDown;
    lblDefaultFormat: TLabel;
    cmbDefaultFormat: TComboBox;
    lblFormatsToShow: TLabel;
    chkLstFormatsToShow: TCheckListBox;
    chkShowCustomFormats: TCheckBox;
    chkRegExtOnStart: TCheckBox;
    chkAssociateExtensions: TCheckBox;
    chklstExtensions: TCheckListBox;
    btnSelectAllExt: TButton;
    btnSelectZeroExt: TButton;
    chkAskToSave: TCheckBox;
    chkSaveAutomatically: TCheckBox;
    edtMinutes: TEdit;
    updMins: TUpDown;
    lblMinutes: TLabel;
    btnOutputSettings: TButton;
    pgeVideoPreviewSubs: TTabSheet;
    pgeExternalPreviewGeneral: TTabSheet;
    pgeExternalPreviewAdvanced: TTabSheet;
    lblParamDescription: TLabel;
    edtParameter: TLabeledEdit;
    cmbFormats: TComboBox;
    rdoCustomFormat: TRadioButton;
    rdoOriginalFormat: TRadioButton;
    lblSaveTempSubInFormat: TLabel;
    edtVidPlayer: TLabeledEdit;
    btnBrowse: TButton;
    btnDetect: TButton;
    rdoAskForDifferentVideo: TRadioButton;
    rdoTestWithVideo: TRadioButton;
    edtAVIFile: TEdit;
    btnBrowse2: TButton;
    chkDrawBorder: TCheckBox;
    chkDrawShadow: TCheckBox;
    chkTransparent: TCheckBox;
    btnSubFont: TButton;
    btnSubColor: TButton;
    btnBackground: TButton;
    edtBorderWidth: TLabeledEdit;
    edtShadowWidth: TLabeledEdit;
    udShadowWidth: TUpDown;
    udBorderWidth: TUpDown;
    pnlSubSample: TPanel;
    subSample: TMiSubtitulo;
    lblDoubleClickInSub: TLabel;
    cmbDoubleClickInSub: TComboBox;
    pgeProgramLook: TTabSheet;
    lblFontToUse: TLabel;
    cmbFonts: TComboBox;
    lblFontSize: TLabel;
    edtFontSize: TEdit;
    udFontSize: TUpDown;
    lblTextAndTransFieldsAlign: TLabel;
    cmbTextAlign: TComboBox;
    pgeListLook: TTabSheet;
    chkMarkUnTransSubs: TCheckBox;
    chkApplyStyle: TCheckBox;
    chkShowGridLines: TCheckBox;
    pnlUnTransColor: TPanel;
    chkShowHorzScrollBar: TCheckBox;
    pgeCharsets: TTabSheet;
    edtSecsToJump1: TLabeledEdit;
    udSecsToJump1: TUpDown;
    cmbShiftDoubleClickInSub: TComboBox;
    lblShiftDoubleClickInSub: TLabel;
    edtSecsToJump2: TLabeledEdit;
    udSecsToJump2: TUpDown;
    btnSelectAllFormat: TButton;
    btnSelectZeroFormat: TButton;
    pgeAdvanced: TTabSheet;
    gbFastSmartLineAdjust: TGroupBox;
    edtTwoLinesIfLongerThan: TLabeledEdit;
    udTwoLinesIfLongerThan: TUpDown;
    lblCharacters1: TLabel;
    gbDivideLines: TGroupBox;
    lblCharacters2: TLabel;
    edtBreakLineAfter: TLabeledEdit;
    udBreakLineAfter: TUpDown;
    chkSLAAutomatically: TCheckBox;
    Bevel2: TBevel;
    lblSeconds: TLabel;
    lblRewindAndForward: TLabel;
    edtRewindAndForwardTime: TMaskEdit;
    lblDefaultAltPlayRate: TLabel;
    cmbDefaultAltPlayRate: TComboBox;
    edtMaxLineLength: TLabeledEdit;
    udMaxLineLength: TUpDown;
    lblCharacters3: TLabel;
    chkForceUsingRegions: TCheckBox;
    chkToggleBreakPoint: TCheckBox;
    chkSaveAsBackup: TCheckBox;
    edtShiftTime: TLabeledEdit;
    udShiftTime: TUpDown;
    lblMilliseconds: TLabel;
    edtDefaultSubDuration: TLabeledEdit;
    udDefaultSubDuration: TUpDown;
    lblMilliseconds2: TLabel;
    edtDefaultSubPause: TLabeledEdit;
    udDefaultSubPause: TUpDown;
    lblMilliseconds3: TLabel;
    chkSmartResize: TCheckBox;
    chkSmartResizeColumns: TCheckBox;
    pnlUnTransBckgr: TPanel;
    chkMarkUnTransSubsBckgr: TCheckBox;
    chkAskToSaveNewSubs: TCheckBox;
    edtRowHeight: TLabeledEdit;
    udRowHeight: TUpDown;
    gbColumnsAlign: TGroupBox;
    lblNumCol: TLabel;
    lblShowCol: TLabel;
    lblHideCol: TLabel;
    cmbNumColAlign: TComboBox;
    cmbShowColAlign: TComboBox;
    cmbHideColAlign: TComboBox;
    edtTextMargin: TLabeledEdit;
    udTextMargin: TUpDown;
    gbSelection: TGroupBox;
    edtSelTransp: TLabeledEdit;
    udSelTransp: TUpDown;
    pnlSelColor: TPanel;
    lblSelColor: TLabel;
    lblSelTranspPercent: TLabel;
    chkAlignLeftLineWithDash: TCheckBox;
    chkRelativeFontSize: TCheckBox;
    chkKeepSubOnVideo: TCheckBox;
    chkVertVideoAlign: TCheckBox;
    pnlBorderColor: TPanel;
    pnlShadowColor: TPanel;
    chkAntialiasing: TCheckBox;
    chkVolumeControls: TCheckBox;
    pnlSelTextColor: TPanel;
    lblSelTextColor: TLabel;
    pgeMarking: TTabSheet;
    chkMarkingWithColor: TCheckBox;
    chkMarkingWithBckgr: TCheckBox;
    pnlMarkingBckgr: TPanel;
    pnlMarkingColor: TPanel;
    lblColumnsToMark: TLabel;
    chkMarkingColNum: TCheckBox;
    chkMarkingColShow: TCheckBox;
    chkMarkingColHide: TCheckBox;
    chkMarkingColText: TCheckBox;
    lblMarkingPriority: TLabel;
    rdoMarkingPriorityLow: TRadioButton;
    rdoMarkingPriorityHigh: TRadioButton;
    chkMarkingInVideoPreview: TCheckBox;
    pnlMarkingColorVideoPreview: TPanel;
    gbMarkingFile: TGroupBox;
    rdoMarkingSaveDonot: TRadioButton;
    rdoMarkingSaveAsk: TRadioButton;
    rdoMarkingSaveAuto: TRadioButton;
    chkMarkingLoadAuto: TCheckBox;
    edtIncreaseStepTime: TLabeledEdit;
    udIncreaseStepTime: TUpDown;
    lblMilliseconds4: TLabel;
    edtIncreaseStepFranes: TLabeledEdit;
    udIncreaseStepFrames: TUpDown;
    lblFrames: TLabel;
    chkSaveEmptyLines: TCheckBox;
    chkAddOpenWithSWToShell: TCheckBox;
    cmbNotesCharset: TComboBox;
    lblNotesCharset: TLabel;
    gbCharsets: TGroupBox;
    cmbTransCharset: TComboBox;
    lblTransCharset: TLabel;
    cmbOrgCharset: TComboBox;
    lblOrgCharset: TLabel;
    chkShowInMainForm: TCheckBox;
    chkRightClickSel: TCheckBox;
    lblAlign: TLabel;
    cmbDurColAlign: TComboBox;
    lblDurCol: TLabel;
    cmbTransColAlign: TComboBox;
    cmbTextColAlign: TComboBox;
    lblTextCol: TLabel;
    lblTransCol: TLabel;
    cmbDurColStyle: TComboBox;
    cmbHideColStyle: TComboBox;
    cmbShowColStyle: TComboBox;
    cmbNumColStyle: TComboBox;
    lblDisplayStyle: TLabel;
    chkMarkingColPause: TCheckBox;
    chkMarkingColDur: TCheckBox;
    rdoNoInteractionWithTags: TRadioButton;
    rdoMultipleTagsMode: TRadioButton;
    rdoSingleTagsMode: TRadioButton;
    lblTagsMode: TLabel;
    chkFullScreenOnDblClick: TCheckBox;
    chkKeepMinDur: TCheckBox;
    udKeepMinDur: TUpDown;
    lblMilliseconds5: TLabel;
    edtKeepMinDur: TEdit;
    gbShowHideVals: TGroupBox;
    edtShiftHideVal: TLabeledEdit;
    udShiftHideVal: TUpDown;
    lblMilliseconds7: TLabel;
    edtShiftShowVal: TLabeledEdit;
    udShiftShowVal: TUpDown;
    lblMilliseconds6: TLabel;
    chkDontAllowOverlaps: TCheckBox;
    lblMilliseconds9: TLabel;
    udAutoRoundTimeVals: TUpDown;
    edtAutoRoundTimeVals: TEdit;
    chkAutoRoundTimeVals: TCheckBox;
    chkRoundOnSubLoad: TCheckBox;
    chkUseOfficeXPStyleMenu: TCheckBox;
    chkUseGradientMenu: TCheckBox;
    pnlTransparencyColor: TPanel;
    lblPauseCol: TLabel;
    cmbPauseColAlign: TComboBox;
    cmbPauseColStyle: TComboBox;
    chkPlayVideoOnLoad: TCheckBox;
    pnlVisSubReprColor: TPanel;
    lblVisSubReprColor: TLabel;
    chkTagsHighlight: TCheckBox;
    pnlTagsHighlightColor: TPanel;
    rdoAutoDeleteTags: TRadioButton;
    procedure FormCreate(Sender: TObject);
    procedure tvSettingsClick(Sender: TObject);
    procedure tvSettingsKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnOkClick(Sender: TObject);
    procedure btnSelectAllExtClick(Sender: TObject);
    procedure btnSelectZeroExtClick(Sender: TObject);
    procedure chkAssociateExtensionsClick(Sender: TObject);
    procedure chkSaveAutomaticallyClick(Sender: TObject);
    procedure cmbFontsDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure btnOutputSettingsClick(Sender: TObject);
    procedure tvSettingsCollapsing(Sender: TObject; Node: TTreeNode;
      var AllowCollapse: Boolean);
    procedure chkDrawBorderClick(Sender: TObject);
    procedure chkDrawShadowClick(Sender: TObject);
    procedure btnSubFontClick(Sender: TObject);
    procedure btnSubColorClick(Sender: TObject);
    procedure btnBackgroundClick(Sender: TObject);
    procedure edtShadowWidthChange(Sender: TObject);
    procedure edtBorderWidthChange(Sender: TObject);
    procedure btnBrowseClick(Sender: TObject);
    procedure btnDetectClick(Sender: TObject);
    procedure rdoAskForDifferentVideoClick(Sender: TObject);
    procedure rdoTestWithVideoClick(Sender: TObject);
    procedure btnBrowse2Click(Sender: TObject);
    procedure rdoOriginalFormatClick(Sender: TObject);
    procedure rdoCustomFormatClick(Sender: TObject);
    procedure pnlUnTransColorClick(Sender: TObject);
    procedure chkUseOfficeXPStyleMenuClick(Sender: TObject);
    procedure btnSelectAllFormatClick(Sender: TObject);
    procedure btnSelectZeroFormatClick(Sender: TObject);
    procedure chkTransparentClick(Sender: TObject);
    procedure pnlUnTransColorMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure pnlBorderColorMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure pnlShadowColorMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure pnlSubSampleMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure chkAntialiasingClick(Sender: TObject);
    procedure rdoTagsModeClick(Sender: TObject);
    procedure chkKeepMinDurClick(Sender: TObject);
    procedure chkAutoRoundTimeValsClick(Sender: TObject);
    procedure pnlTransparencyColorMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure subSampleMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    procedure SetLanguage;
    procedure UpdateSubSamplePos;
  public
    { Public declarations }
  end;

var
  frmSettings : TfrmSettings;
  AllVidFiles : String;

implementation

uses
  General, Functions, USubtitlesFunctions, FileTypes, VideoPreview, //USubtitleAPI, //USubtitleAPI removed by adenry 
  formMain, formOutputSettings, formInfoErrors, formVariousInfo; //formInfoErrors, formVariousInfo added by adenry

{$R *.dfm}

// -----------------------------------------------------------------------------

procedure TfrmSettings.SetLanguage;
var
  LF      : TIniFile;
  tmpItem : String;
begin
  LF := TIniFile.Create(frmMain.ActualLangFile);

  try
    With LF do
    begin
      AllVidFiles := ReadString('General','AllVidFiles','All supported video files');

      Caption                := ReadString('Settings Form','01','Settings');
      lblTitle.Caption       := ReadString('Settings Form','01','Settings');
      lblDescription.Caption := ReadString('Settings Form','02','Modify the program configuration');

      tvSettings.Items.Add(nil, ReadString('Settings Form','03', 'General'));
      tvSettings.Items[tvSettings.Items.Count-1].ImageIndex := 0;
      tvSettings.Items.AddChild(tvSettings.Items[tvSettings.Items.Count-1], ReadString('Settings Form','04', 'Advanced'));
      tvSettings.Items[tvSettings.Items.Count-1].ImageIndex := 1;
      tvSettings.Items[tvSettings.Items.Count-1].MakeVisible;
      tvSettings.Items.AddChild(tvSettings.Items[tvSettings.Items.Count-2], ReadString('Settings Form','05', 'Charsets'));
      tvSettings.Items[tvSettings.Items.Count-1].ImageIndex := 2;
      tvSettings.Items[tvSettings.Items.Count-1].MakeVisible;
      tvSettings.Items.Add(nil, ReadString('Settings Form','06', 'Formats'));
      tvSettings.Items[tvSettings.Items.Count-1].ImageIndex := 3;
      tvSettings.Items.Add(nil, ReadString('Settings Form','07', 'File types'));
      tvSettings.Items[tvSettings.Items.Count-1].ImageIndex := 4;
      tvSettings.Items.Add(nil, ReadString('Settings Form','08', 'Save'));
      tvSettings.Items[tvSettings.Items.Count-1].ImageIndex := 5;
      tvSettings.Items.Add(nil, ReadString('Settings Form','09', 'Video Preview'));
      tvSettings.Items[tvSettings.Items.Count-1].ImageIndex := 6;
      tvSettings.Items.AddChild(tvSettings.Items[tvSettings.Items.Count-1], ReadString('Settings Form','10', 'Subtitles'));
      tvSettings.Items[tvSettings.Items.Count-1].ImageIndex := 7;
      tvSettings.Items[tvSettings.Items.Count-1].MakeVisible;
      tvSettings.Items.Add(nil, ReadString('Settings Form','11', 'External Preview'));
      tvSettings.Items[tvSettings.Items.Count-1].ImageIndex := -1;
      tvSettings.Items.AddChild(tvSettings.Items[tvSettings.Items.Count-1], ReadString('Settings Form','03', 'General'));
      tvSettings.Items[tvSettings.Items.Count-1].ImageIndex := 8;
      tvSettings.Items[tvSettings.Items.Count-1].MakeVisible;
      tvSettings.Items.AddChild(tvSettings.Items[tvSettings.Items.Count-2], ReadString('Settings Form','04', 'Advanced'));
      tvSettings.Items[tvSettings.Items.Count-1].ImageIndex := 9;
      tvSettings.Items[tvSettings.Items.Count-2].MakeVisible;
      tvSettings.Items.Add(nil, ReadString('Settings Form','12', 'Look'));
      tvSettings.Items[tvSettings.Items.Count-1].ImageIndex := -1;
      tvSettings.Items.AddChild(tvSettings.Items[tvSettings.Items.Count-1], ReadString('Settings Form','13', 'Program'));
      tvSettings.Items[tvSettings.Items.Count-1].ImageIndex := 10;
      tvSettings.Items[tvSettings.Items.Count-1].MakeVisible;
      tvSettings.Items.AddChild(tvSettings.Items[tvSettings.Items.Count-2], ReadString('Settings Form','14', 'List'));
      tvSettings.Items[tvSettings.Items.Count-1].ImageIndex := 11;
      tvSettings.Items[tvSettings.Items.Count-2].MakeVisible;
      //tvSettings.Items.AddChild(tvSettings.Items[tvSettings.Items.Count-3], ReadString('Settings Form','15', 'Menu'));
      //tvSettings.Items[tvSettings.Items.Count-1].ImageIndex := 12;
      //tvSettings.Items[tvSettings.Items.Count-3].MakeVisible;
      //added by adenry: begin
      tvSettings.Items.AddChild(tvSettings.Items[tvSettings.Items.Count-3], ReadString('Settings Form','145', 'Marking'));
      tvSettings.Items[tvSettings.Items.Count-1].ImageIndex := 12;
      tvSettings.Items[tvSettings.Items.Count-4].MakeVisible;
      //added by adenry: end

      tvSettings.Items[0].Selected := True;

      // ------------------ //
      // General
      // ------------------ //
      chkAlwaysOnTop.Caption           := ReadString('Settings Form', '16', 'Always on top');
      chkInstance.Caption              := ReadString('Settings Form', '17', 'Allow more than one instance running');
      chkConfirmDelete.Caption         := ReadString('Settings Form', '18', 'Confirm when deleting subtitles');
      chkInterpretInvalid.Caption      := ReadString('Settings Form', '19', 'Interpret invalid files as plain text');
      chkAutosearchMovie.Caption       := ReadString('Settings Form', '20', 'Auto-search for movie');
      chkForceWorkingTime.Caption      := ReadString('Settings Form', '21', 'Force working in time mode');
      chkKeepOrderOfLines.Caption      := ReadString('Settings Form', '22', 'Keep order of lines when reverse text');
      chkSelectTextNL.Caption          := ReadString('Settings Form', '23', 'Select text on jump to next line');
      chkSelectTextPL.Caption          := ReadString('Settings Form', '24', 'Select text on jump to previous line');
      //chkNoInteractionWithTags.Caption := ReadString('Settings Form', '25', 'No interaction with tags');
      //chkWorkWithStyleTags.Caption     := ReadString('Settings Form', '26', 'Work with style tags');
      edtRFLimit.EditLabel.Caption     := ReadString('Settings Form', '27', 'Recent files limit:');
      //added by adenry: begin
      lblTagsMode.Caption              := ReadString('Settings Form', '91', 'Tags mode:');
      rdoNoInteractionWIthTags.Caption := ReadString('Settings Form', '25', 'No interaction with tags');
      rdoMultipleTagsMode.Caption      := ReadString('Settings Form', '92', 'Multiple tags mode');
      rdoSingleTagsMode.Caption        := ReadString('Settings Form', '93', 'Single tags mode (the old mode)');
      rdoAutoDeleteTags.Caption        := ReadString('Settings Form', '94', 'Auto delete tags');
      //added by adenry: end

      // ------------------ //
      // Advanced
      // ------------------ //
      gbFastSmartLineAdjust.Caption             := ReadString('Settings Form', '28', 'Fast smart line adjust');
      edtTwoLinesIfLongerThan.EditLabel.Caption := ReadString('Settings Form', '29', 'Two lines if longer than:');
      lblCharacters1.Caption                    := ReadString('Settings Form', '30', 'characters');
      chkToggleBreakPoint.Caption               := ReadString('Settings Form', '31', 'Toggle breakpoint');
      gbDivideLines.Caption                     := ReadString('Settings Form', '32', 'Divide lines');
      edtBreakLineAfter.EditLabel.Caption       := ReadString('Settings Form', '33', 'Break line after:');
      lblCharacters2.Caption                    := lblCharacters1.Caption;
      chkSLAAutomatically.Caption               := ReadString('Settings Form', '34', 'Smart line adjust automatically');
      edtMaxLineLength.EditLabel.Caption        := ReadString('Settings Form', '35', 'Maximum line length:');
      lblCharacters3.Caption                    := lblCharacters1.Caption;
      edtShiftTime.EditLabel.Caption            := ReadString('Settings Form', '36', 'Shift time:');
      lblMilliseconds.Caption                   := ReadString('Settings Form', '37', 'milliseconds');
      //added by adenry: begin
      lblMilliseconds2.Caption                  :=lblMilliseconds.Caption;
      lblMilliseconds3.Caption                  :=lblMilliseconds.Caption;
      lblMilliseconds4.Caption                  :=lblMilliseconds.Caption;
      lblMilliseconds5.Caption                  :=lblMilliseconds.Caption;
      lblMilliseconds9.Caption                  :=lblMilliseconds.Caption;
      edtDefaultSubDuration.EditLabel.Caption   := ReadString('Settings Form', '95', 'Default subtitle duration:');
      edtDefaultSubPause.EditLabel.Caption      := ReadString('Settings Form', '96', 'Default subtitle pause:');
      edtIncreaseStepTime.EditLabel.Caption     := ReadString('Settings Form', '97', 'Increase step (time):');
      edtIncreaseStepFranes.EditLabel.Caption   := ReadString('Settings Form', '98', 'Increase step (frames):');
      lblFrames.Caption                         := ReadString('Settings Form', '99', 'frames');
      chkKeepMinDur.Caption                     := ReadString('Settings Form', '100', 'Keep min duration of:');
      chkDontAllowOverlaps.Caption              := ReadString('Settings Form', '101', 'but don''t allow overlaps');
      chkAutoRoundTimeVals.Caption              := ReadString('Settings Form', '102', 'Automatically round time values to:');
      chkRoundOnSubLoad.Caption                 := ReadString('Settings Form', '103', 'Round time values on subtitle load');
      //added by adenry: end

      // ------------------ //
      // Charsets
      // ------------------ //
      chkShowInMainForm.Caption := ReadString('Settings Form', '38', 'Show in Main Window');
      lblOrgCharset.Caption     := ReadString('Settings Form', '39', 'Original charset:');
      lblTransCharset.Caption   := ReadString('Settings Form', '40', 'Translation charset:');
      lblNotesCharset.Caption   := ReadString('Settings Form', '104', 'Notes charset:'); //added by adenry

      // ------------------ //
      // Formats
      // ------------------ //
      lblDefaultFormat.Caption     := ReadString('Settings Form', '41', 'Default format:');
      lblFormatsToShow.Caption     := ReadString('Settings Form', '42', 'Formats to show when "Save as":');
      chkShowCustomFormats.Caption := ReadString('Settings Form', '43', 'Show custom formats');
      btnSelectAllFormat.Caption   := ReadString('Settings Form', '44', 'Select &all');
      btnSelectZeroFormat.Caption  := ReadString('Settings Form', '45', 'Select &zero');

      // ------------------ //
      // File types
      // ------------------ //
      chkRegExtOnStart.Caption       := ReadString('Settings Form', '46', 'Register extensions on start');
      chkAssociateExtensions.Caption := ReadString('Settings Form', '47', 'Associate with most supported subtitle extensions');
      btnSelectAllExt.Caption        := btnSelectAllFormat.Caption;
      btnSelectZeroExt.Caption       := btnSelectZeroFormat.Caption;
      chkAddOpenWithSWToShell.Caption:= ReadString('Settings Form', '105', 'Add "Open with Subtitle Workshop" to shell context menu'); //added by adenry

      // ------------------ //
      // Save
      // ------------------ //
      chkAskToSave.Caption         := ReadString('Settings Form', '48', 'Ask to save on exit program/close subtitle');
      chkSaveAutomatically.Caption := ReadString('Settings Form', '49', 'Save work automatically every');
      lblMinutes.Caption           := ReadString('Settings Form', '50', 'minutes.');
      chkSaveAsBackup.Caption      := ReadString('Settings Form', '51', 'Save as backup');
      btnOutputSettings.Caption    := ReadString('Settings Form', '52', 'Output settings...');
      //added by adenry: begin
      chkAskToSaveNewSubs.Caption  := ReadString('Settings Form', '106', 'Ask to save new subtitles');
      chkSaveEmptyLines.Caption    := ReadString('Settings Form', '107', 'Save empty lines');
      //added by adenry: end

      // ------------------ //
      // Video preview
      // ------------------ //
      lblDoubleClickInSub.Caption       := ReadString('Settings Form', '53', 'Double click in a subtitle:');
      edtSecsToJump1.EditLabel.Caption  := ReadString('Settings Form', '54', 'Seconds to jump:');
      lblShiftDoubleClickInSub.Caption  := ReadString('Settings Form', '55', 'Shift-double click in a subtitle:');
      edtSecsToJump2.EditLabel.Caption  := edtSecsToJump1.EditLabel.Caption;
      cmbDoubleClickInSub.Clear;
      cmbShiftDoubleClickInSub.Clear;
      cmbDoubleClickInSub.Items.Add(ReadString('Settings Form', '56', 'Focus text box'));
      cmbDoubleClickInSub.Items.Add(ReadString('Settings Form', '57', 'Go subtitle''s time in video'));
      cmbDoubleClickInSub.Items.Add(ReadString('Settings Form', '58', 'Go N second(s) before subtitle in video'));
      cmbShiftDoubleClickInSub.Items    := cmbDoubleClickInSub.Items;
      lblRewindAndForward.Caption       := ReadString('Settings Form', '59', 'Backward and forward time:');
      lblSeconds.Caption                := ReadString('Settings Form', '60', 'seconds.');
      lblDefaultAltPlayRate.Caption     := ReadString('Settings Form', '61', 'Default altered playback rate:');
      //added by adenry: begin
      lblMilliseconds6.Caption          := lblMilliseconds.Caption;
      lblMilliseconds7.Caption          := lblMilliseconds.Caption;
      chkVertVideoAlign.Caption         := ReadString('Settings Form', '108', 'Vertical video center align');
      chkFullScreenOnDblClick.Caption   := ReadString('Settings Form', '109', 'Enter full screen on double click');
      gbShowHideVals.Caption            := ' ' + ReadString('Settings Form', '110', ' Setting Show and Hide values') + ' ';
      edtShiftShowVal.EditLabel.Caption := ReadString('Settings Form', '111', 'Shift Show value:');
      edtShiftHideVal.EditLabel.Caption := ReadString('Settings Form', '112', 'Shift Hide value:');
      chkPlayVideoOnLoad.Caption        := ReadString('Settings Form', '146', 'Play video on load');
      lblVisSubReprColor.Caption        := ReadString('Settings Form', '147', 'Visual subtitle representation color:');
      //added by adenry: end

      // ------------------ //
      // Video Preview Subtitles
      // ------------------ //
      chkDrawBorder.Caption        := ReadString('Settings Form', '62', 'Draw outline');
      chkDrawShadow.Caption        := ReadString('Settings Form', '63', 'Draw shadow');
      chkTransparent.Caption       := ReadString('Settings Form', '64', 'Try transparent background');
      chkForceUsingRegions.Caption := ReadString('Settings Form', '65', 'Force using regions (may be slow)');
      btnSubFont.Caption     := ReadString('Settings Form', '66', 'Font...');
      btnSubColor.Caption    := ReadString('Settings Form', '67', 'Color...');
      btnBackground.Caption  := ReadString('Settings Form', '68', 'Background...');

      edtBorderWidth.EditLabel.Caption := ReadString('Settings Form', '69', 'Outline width:');
      edtShadowWidth.EditLabel.Caption := ReadString('Settings Form', '70', 'Shadow width:');
      subSample.Text                   := ReadString('Settings Form', '71', 'SAMPLE');

      //added by adenry: begin
      chkAlignLeftLineWithDash.Caption := ReadString('Settings Form', '113', 'Align left when subtitles contain a new line starting with "-"');
      chkRelativeFontSize.Caption      := ReadString('Settings Form', '114', 'Relative font size');
      chkKeepSubOnVideo.Caption        := ReadString('Settings Form', '115', 'Keep subtitle on video');
      chkAntialiasing.Caption          := ReadString('Settings Form', '116', 'Try antialiasing (Force using regions must be off)');
      //added by adenry: end

      // ------------------ //
      // External preview general
      // ------------------ //
      edtVidPlayer.EditLabel.Caption  := ReadString('Settings Form', '72', 'Exe of the video player:');
      btnBrowse.Caption               := BTN_BROWSE;
      btnDetect.Caption               := ReadString('Settings Form', '73', 'Detect associated program');
      rdoAskForDifferentVideo.Caption := ReadString('Settings Form', '74', 'Ask for a different video each time');
      rdoTestWithVideo.Caption        := ReadString('Settings Form', '75', 'Always test with video:');
      btnBrowse2.Caption              := BTN_BROWSE;

      // ------------------ //
      // External preview advanced
      // ------------------ //
      lblSaveTempSubInFormat.Caption  := ReadString('Settings Form', '76', 'Save temporary subtitle in format:');
      rdoOriginalFormat.Caption       := ReadString('Settings Form', '77', 'Original format');
      rdoCustomFormat.Caption         := ReadString('Settings Form', '78', 'Custom format:');
      edtParameter.EditLabel.Caption  := ReadString('Settings Form', '79', 'Parameter to send to the video player:');
      lblParamDescription.Caption     := ReplaceString(ReadString('Settings Form', '80', 'VIDEO_FILE represents the video file in which you are going to test the subtitles. SUBT_FILE is the parameter in which the temporary subtitle file will be sent to the video player. You may add other parameters, for example full screen, etc.'), '|', #13#10);

      // ------------------ //
      // Look / Program
      // ------------------ //
      lblFontToUse.Caption                := ReadString('Settings Form', '81', 'Font to use in the program:');
      lblFontSize.Caption                 := ReadString('Settings Form', '82', 'Font size:');
      lblTextAndTransFieldsAlign.Caption  := ReadString('Settings Form', '83', '"Text" and "Translation" fields align:');
      cmbTextAlign.Items.Clear;
      tmpItem := ReadString('Settings Form','84','Left|Right|Center');
      cmbTextAlign.Items.Add(Copy(tmpItem, 1, Pos('|', tmpItem) - 1));
      cmbTextAlign.Items.Add(Copy(tmpItem, Pos('|', tmpItem) + 1, SmartPos('|', tmpItem, True, Pos('|', tmpItem) + 1) - (Pos('|', tmpItem) + 1)));
      cmbTextAlign.Items.Add(Copy(tmpItem, SmartPos('|', tmpItem, True, Pos('|', tmpItem) + 1) + 1, Length(tmpItem)));
      chkTagsHighlight.Caption            := ReadString('Settings Form', '148', 'Hilight tags in "Text" and "Translation" fields:');
      //added by adenry: begin
      chkSmartResize.Caption              := ReadString('Settings Form', '117', 'Smart Main Window and Subtitles List resize');
      chkSmartResizeColumns.Caption       := ReadString('Settings Form', '118', 'Resize Subtitles List columns when resizing Main Window');
      //added by adenry: end
      chkUseOfficeXPStyleMenu.Caption     := ReadString('Settings Form', '89', 'Use Office XP style Menu');
      chkUseGradientMenu.Caption          := ReadString('Settings Form', '90', 'Use gradient menu');

      // ------------------ //
      // Look / List
      // ------------------ //
      chkShowGridLines.Caption        := ReadString('Settings Form', '85', 'Show grid lines');
      chkApplyStyle.Caption           := ReadString('Settings Form', '86', 'Apply style to subtitles');
      chkMarkUnTransSubs.Caption      := ReadString('Settings Form', '87', 'Mark untranslated subtitles with color:');
      chkShowHorzScrollBar.Caption    := ReadString('Settings Form', '88', 'Show horizontal scrollbar');
      //added by adenry: begin
      chkMarkUnTransSubsBckgr.Caption := ReadString('Settings Form', '119', 'Mark untranslated subtitles with background:');
      chkRightClickSel.Caption        := ReadString('Settings Form', '120', 'Right click selection');
      edtRowHeight.EditLabel.Caption  := ReadString('Settings Form', '121', 'Row height:');
      edtTextMargin.EditLabel.Caption := ReadString('Settings Form', '122', 'Text margin:');
      gbSelection.Caption             := ' ' + ReadString('Settings Form', '123', 'Selection') + ' ';
      lblSelTextColor.Caption         := ReadString('Settings Form', '124', 'Text:');
      lblSelColor.Caption             := ReadString('Settings Form', '125', 'Color:');
      edtSelTransp.EditLabel.Caption  := ReadString('Settings Form', '126', 'Transparency:');
      gbColumnsAlign.Caption          := ' ' + ReadString('Settings Form', '127', 'Columns') + ' ';
      lblAlign.Caption                := ReadString('Settings Form', '128', 'Align:');
      lblDisplayStyle.Caption         := ReadString('Settings Form', '129', 'Display style:');
      lblNumCol.Caption               := ReadString('Main Form', '08', 'Num');
      lblPauseCol.Caption             := ReadString('Main Form', '19', 'Pause');
      lblShowCol.Caption              := ReadString('Main Form', '09', 'Show');
      lblHideCol.Caption              := ReadString('Main Form', '10', 'Hide');
      lblDurCol.Caption               := ReadString('Main Form', '14', 'Duration');
      lblTextCol.Caption              := ReadString('Main Form', '11', 'Text');
      lblTransCol.Caption             := ReadString('Main Form', '12', 'Translation');
      //added by adenry: end
      //added by adenry: begin
      cmbNumColAlign.Items    := cmbTextAlign.Items;
      cmbShowColAlign.Items   := cmbTextAlign.Items;
      cmbHideColAlign.Items   := cmbTextAlign.Items;
      cmbTextColAlign.Items   := cmbTextAlign.Items;
      cmbTransColAlign.Items  := cmbTextAlign.Items;
      //added by adenry: end
      //added by adenry: begin
      cmbDurColAlign.Items    := cmbTextAlign.Items;
      cmbPauseColAlign.Items  := cmbTextAlign.Items;
      cmbNumColStyle.Items.Add(ReadString('Settings Form', '130', 'Full'));
      cmbNumColStyle.Items.Add(ReadString('Settings Form', '131', 'Compact'));
      cmbShowColStyle.Items   := cmbNumColStyle.Items;
      cmbHideColStyle.Items   := cmbNumColStyle.Items;
      cmbDurColStyle.Items    := cmbNumColStyle.Items;
      cmbPauseColStyle .Items := cmbNumColStyle.Items;
      //added by adenry: end

      //added by adenry: begin
      // ------------------ //
      // Look / Marking
      // ------------------ //
      chkMarkingWithColor.Caption         := ReadString('Settings Form', '132', 'Marking with color:');
      chkMarkingWithBckgr.Caption         := ReadString('Settings Form', '133', 'Marking with background:');
      lblColumnsToMark.Caption            := ReadString('Settings Form', '134', 'Columns to mark:');
      chkMarkingColNum.Caption            := Format(ReadString('Settings Form', '135', 'Mark column "%s"'), [lblNumCol.Caption]);
      chkMarkingColPause.Caption          := Format(ReadString('Settings Form', '135', 'Mark column "%s"'), [lblPauseCol.Caption]);
      chkMarkingColShow.Caption           := Format(ReadString('Settings Form', '135', 'Mark column "%s"'), [lblShowCol.Caption]);
      chkMarkingColHide.Caption           := Format(ReadString('Settings Form', '135', 'Mark column "%s"'), [lblHideCol.Caption]);
      chkMarkingColDur.Caption            := Format(ReadString('Settings Form', '135', 'Mark column "%s"'), [lblDurCol.Caption]);
      chkMarkingColText.Caption           := Format(ReadString('Settings Form', '135', 'Mark column "%s"'), [lblTextCol.Caption]);
      lblMarkingPriority.Caption          := ReadString('Settings Form', '136', 'Marking priority:');
      rdoMarkingPriorityLow.Caption       := ReadString('Settings Form', '137', 'Low (before error marking)');
      rdoMarkingPriorityHigh.Caption      := ReadString('Settings Form', '138', 'High (after error marking)');
      chkMarkingInVideoPreview.Caption    := ReadString('Settings Form', '139', 'Marked subtitle color in video preview:');
      gbMarkingFile.Caption               := ' ' + ReadString('Settings Form', '140', 'Marking file') + ' ';
      rdoMarkingSaveDonot.Caption         := ReadString('Settings Form', '141', 'Do not save marking file');
      rdoMarkingSaveAsk.Caption           := ReadString('Settings Form', '142', 'Ask each time to save marking file');
      rdoMarkingSaveAuto.Caption          := ReadString('Settings Form', '143', 'Automatically save marking file on subtitle save');
      chkMarkingLoadAuto.Caption          := ReadString('Settings Form', '144', 'Automatically load marking file');
      //added by adenry: end

      btnOk.Caption     := BTN_OK;
      btnCancel.Caption := BTN_CANCEL;

      // ------------------ //
      //      Set font      //
      // ------------------ //
      btnOk.ParentFont       := True;
      lblTitle.ParentFont    := True;
      Font                   := frmMain.Font;
      subSample.Font.Charset := Font.Charset;
      lblTitle.Font.Style    := frmMain.Font.Style + [fsBold];
      btnOk.Font.Style       := frmMain.Font.Style + [fsBold];

    end;
  finally
    LF.Free;
  end;

end;

// -----------------------------------------------------------------------------

procedure TfrmSettings.UpdateSubSamplePos;
begin
  subSample.Left := (pnlSubSample.Width div 2) - (subSample.Width div 2);
  subSample.Top  := (pnlSubSample.Height div 2) - (subSample.Height div 2);
end;

// -----------------------------------------------------------------------------

function GetProgramAssociation(Ext : string): String;
var
  Reg : TRegistry;
  s   : String;
begin
  s := '';

  Reg := TRegistry.Create;
  Reg.RootKey := HKEY_CLASSES_ROOT;

  if Reg.OpenKey('.' + Ext + '\shell\open\command', False) <> False then
  begin
    S := Reg.ReadString('');
    Reg.CloseKey;
  end else
  begin
    if Reg.OpenKey('.' + Ext, False) <> False then
    begin
      s := Reg.ReadString('');
      Reg.CloseKey;

      if s <> '' then
      begin
        if Reg.OpenKey(s + '\shell\open\command',False) <> False then
          S := Reg.ReadString('');
        reg.CloseKey;
      end;
    end;
  end;

  if Pos('%', s) > 0 then
    Delete(s, Pos('%', s), Length(s));

  if ((Length(s) > 0) and (s[1] = '"')) then
    Delete(s, 1, 1);

  if ((Length(s) > 0) and (s[Length(s)] = '"')) then
    Delete(s, Length(s), 1);

  while ((Length(s) > 0) and ((S[Length(s)] = #32) or (s[Length(s)] = '"'))) do
    Delete(s, Length(s), 1);

  Result := S;
end;

// -----------------------------------------------------------------------------

procedure TfrmSettings.tvSettingsCollapsing(Sender: TObject;
  Node: TTreeNode; var AllowCollapse: Boolean);
begin
  AllowCollapse := False;
end;

// -----------------------------------------------------------------------------

procedure TfrmSettings.btnSelectAllExtClick(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to chklstExtensions.Items.Count-1 do
    if not chklstExtensions.Checked[i] then
      chkLstExtensions.Checked[i] := True;
end;

// -----------------------------------------------------------------------------

procedure TfrmSettings.btnSelectZeroExtClick(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to chklstExtensions.Items.Count-1 do
    if chklstExtensions.Checked[i] then
      chkLstExtensions.Checked[i] := False;
end;

// -----------------------------------------------------------------------------

procedure TfrmSettings.chkAssociateExtensionsClick(Sender: TObject);
var
  i: integer;
begin
  if chkAssociateExtensions.Checked then
  begin
    chklstExtensions.Enabled := True;
    btnSelectAllExt.Enabled := True;
    btnSelectZeroExt.Enabled := True;
    for i := 0 to chklstExtensions.Items.Count-1 do
      if not chklstExtensions.Checked[i] then
        chkLstExtensions.Checked[i] := True;
  end else
  begin
    chklstExtensions.ItemIndex := -1;
    chklstExtensions.Enabled := False;
    btnSelectAllExt.Enabled := False;
    btnSelectZeroExt.Enabled := False;
    for i := 0 to chklstExtensions.Items.Count-1 do
      if chklstExtensions.Checked[i] then
        chkLstExtensions.Checked[i] := False;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmSettings.chkSaveAutomaticallyClick(Sender: TObject);
begin
  edtMinutes.Enabled      := chkSaveAutomatically.Checked;
  updMins.Enabled         := chkSaveAutomatically.Checked;
  lblMinutes.Enabled      := chkSaveAutomatically.Checked;
  chkSaveAsBackup.Enabled := chkSaveAutomatically.Checked;
end;

// -----------------------------------------------------------------------------

procedure TfrmSettings.cmbFontsDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin
  with Control as TComboBox do
  begin
     Canvas.Font.Name := Items[Index];
     Canvas.FillRect(Rect);
     Canvas.TextOut(Rect.Left + 2, Rect.Top, Items[Index]);
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmSettings.btnOutputSettingsClick(Sender: TObject);
begin
  frmOutputSettings := TfrmOutputSettings.Create(Application);
  frmOutputSettings.ShowModal;
  frmOutputSettings.Free;
end;

// -----------------------------------------------------------------------------

procedure TfrmSettings.tvSettingsClick(Sender: TObject);
begin
{  case tvSettings.Selected.ImageIndex of
    0: pgeCtrl.ActivePage := pgeGeneral;
    1: pgeCtrl.ActivePage := pgeCharsets;
    2: pgeCtrl.ActivePage := pgeFormats;
    3: pgeCtrl.ActivePage := pgeFileTypes;
    4: pgeCtrl.ActivePage := pgeSave;
    5: pgeCtrl.ActivePage := pgeVideoPreview;
    6: pgeCtrl.ActivePage := pgeVideoPreviewSubs;
    7: pgeCtrl.ActivePage := nil;
    8: pgeCtrl.ActivePage := pgeExternalPreviewGeneral;
    9: pgeCtrl.ActivePage := pgeExternalPreviewAdvanced;
    10: pgeCtrl.ActivePage := nil;
    11: pgeCtrl.ActivePage := pgeProgramLook;
    12: pgeCtrl.ActivePage := pgeListLook;
    13: pgeCtrl.ActivePage := pgeMenuLook;
  end; }
  pgeCtrl.ActivePageIndex := tvSettings.Selected.ImageIndex;
end;

// -----------------------------------------------------------------------------

procedure TfrmSettings.tvSettingsKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  {case tvSettings.Selected.ImageIndex of
    0: pgeCtrl.ActivePage := pgeGeneral;
    1: pgeCtrl.ActivePage := pgeCharsets;
    2: pgeCtrl.ActivePage := pgeFormats;
    3: pgeCtrl.ActivePage := pgeFileTypes;
    4: pgeCtrl.ActivePage := pgeSave;
    5: pgeCtrl.ActivePage := pgeVideoPreview;
    6: pgeCtrl.ActivePage := pgeVideoPreviewSubs;
    7: pgeCtrl.ActivePage := nil;
    8: pgeCtrl.ActivePage := pgeExternalPreviewGeneral;
    9: pgeCtrl.ActivePage := pgeExternalPreviewAdvanced;
    10: pgeCtrl.ActivePage := nil;
    11: pgeCtrl.ActivePage := pgeProgramLook;
    12: pgeCtrl.ActivePage := pgeListLook;
    13: pgeCtrl.ActivePage := pgeMenuLook;
  end; }
  pgeCtrl.ActivePageIndex := tvSettings.Selected.ImageIndex;
end;

// -----------------------------------------------------------------------------

procedure TfrmSettings.FormCreate(Sender: TObject);
var
  i     : Integer;
  Ini   : TIniFile;
  Reg   : TRegistry;
  Items : TStrings;
begin
  //added by adenry later: this is necessary when using themes (XPManifest)
  for i := 0 to self.ComponentCount - 1 do
    if self.Components[i] is TPanel then
      TPanel(self.Components[i]).ParentBackground := False;

  // W: 530   H: 421

  SetLanguage;
  rdoMultipleTagsMode.ParentFont := True;     //added later
  rdoMultipleTagsMode.Font.Style := [fsBold]; //added later
  pgeCtrl.ActivePage := pgeGeneral;

  Ini := TIniFile.Create(IniRoot);
  try
    // --------------------------------- //
    //              General              //
    // --------------------------------- //

    chkAlwaysOnTop.Checked           := Ini.ReadBool('Settings', 'Always on top', False);
    chkInstance.Checked              := Ini.ReadBool('Settings', 'Allow more than one instance', True); //False changed to True by adenry
    chkConfirmDelete.Checked         := Ini.ReadBool('Settings', 'Confirm when deleting a subtitle', False);
    chkInterpretInvalid.Checked      := Ini.ReadBool('Settings', 'Interpret invalid files as plain text', False);
    chkAutosearchMovie.Checked       := Ini.ReadBool('Settings', 'Autosearch for movie', True);
    chkForceWorkingTime.Checked      := Ini.ReadBool('Settings', 'Force working in time mode', False);
    chkKeepOrderOfLines.Checked      := Ini.ReadBool('Settings', 'Keep order of lines when reverse text', True);
    chkSelectTextNL.Checked          := Ini.ReadBool('Settings', 'Select text on jump to next line', True);
    chkSelectTextPL.Checked          := Ini.ReadBool('Settings', 'Select text on jump to previous line', True);
    //chkNoInteractionWithTags.Checked := Ini.ReadBool('Settings', 'No interaction with tags', False); //removed by adenry
    //added by adenry: begin
    case Ini.ReadInteger('Settings', 'Tags mode', 2) of
      1: rdoNoInteractionWIthTags.Checked := True;
      2: rdoMultipleTagsMode.Checked      := True;
      3: rdoSingleTagsMode.Checked        := True;
      4: rdoAutoDeleteTags.Checked        := True;
    else rdoMultipleTagsMode.Checked      := True;
    end;
    //added by adenry: end
    //chkWorkWithStyleTags.Checked     := Ini.ReadBool('Settings', 'Work with style tags', True); //removed by adenry
    udRFLimit.Position               := Ini.ReadInteger('Settings', 'MaxRF', 10);

    // --------------------------------- //
    //             Advanced              //
    // --------------------------------- //
    udTwoLinesIfLongerThan.Position := Ini.ReadInteger('Advanced', 'Two lines if longer than', 40);
    chkToggleBreakPoint.Checked     := Ini.ReadBool('Advanced', 'Toggle breakpoint', False);
    udBreakLineAfter.Position       := Ini.ReadInteger('Advanced', 'Break line after', 40);
    chkSLAAutomatically.Checked     := Ini.ReadBool('Advanced', 'Smart line adjust automatically', True);
    udMaxLineLength.Position        := Ini.ReadInteger('Advanced', 'Maximum line length', 45);
    udShiftTime.Position            := Ini.ReadInteger('Advanced', 'Shift time', 100);
    //added by adenry: begin
    udDefaultSubDuration.Position   := Ini.ReadInteger('Advanced', 'Default subtitle duration', 1000);
    udDefaultSubPause.Position      := Ini.ReadInteger('Advanced', 'Default subtitle pause', 200);
    //added by adenry: end
    udIncreaseStepTime.Position     := Ini.ReadInteger('Advanced', 'Increase step time', 100); //added by adenry
    udIncreaseStepFrames.Position   := Ini.ReadInteger('Advanced', 'Increase step frames', 1); //added by adenry
    chkKeepMinDur.Checked           := Ini.ReadBool('Advanced', 'Keep min duration', False); //added by adenry
    udKeepMinDur.Position           := Ini.ReadInteger('Advanced', 'Keep min duration value', 1000); //added by adenry
    chkDontAllowOverlaps.Checked    := Ini.ReadBool('Advanced', 'Keep min duration but do not overlap', True); //added by adenry
    chkDontAllowOverlaps.Enabled    := chkKeepMinDur.Checked; //added by adenry
    edtKeepMinDur.Enabled           := chkKeepMinDur.Checked; //added by adenry
    udKeepMinDur.Enabled            := chkKeepMinDur.Checked; //added by adenry
    lblMilliseconds5.Enabled        := chkKeepMinDur.Checked; //added by adenry
    //added by adenry: begin
    chkAutoRoundTimeVals.Checked    := Ini.ReadBool('Advanced', 'Auto round time values', False);
    udAutoRoundTimeVals.Position    := Ini.ReadInteger('Advanced', 'Auto rounding factor', 100);
    //edtAutoRoundTimeVals.Enabled    := chkAutoRoundTimeVals.Checked;
    //udAutoRoundTimeVals.Enabled     := chkAutoRoundTimeVals.Checked;
    //lblMilliseconds9.Enabled        := chkAutoRoundTimeVals.Checked;
    chkRoundOnSubLoad.Checked       := Ini.ReadBool('Advanced', 'Round time values on subtitle load', False);
    //added by adenry: end
    // --------------------------------- //
    //              Charsets             //
    // --------------------------------- //
    chkShowInMainForm.Checked := Ini.ReadBool('Settings', 'Show charsets in main form', True);
    AddCharsets(cmbOrgCharset);
    AddCharsets(cmbTransCharset);
    AddCharsets(cmbNotesCharset); //added by adenry
    cmbOrgCharset.ItemIndex   := frmMain.cmbOrgCharset.ItemIndex;
    cmbTransCharset.ItemIndex := frmMain.cmbTransCharset.ItemIndex;
    cmbNotesCharset.ItemIndex := Ini.ReadInteger('General', 'Notes charset', 1); //added by adenry //0 changed to 1 later

    // --------------------------------- //
    //               Formats             //
    // --------------------------------- //
    GetFormatsList(cmbDefaultFormat.Items);
    cmbDefaultFormat.ItemIndex := SubtitleAPI.GetFormatIndex(Ini.ReadString('Formats', 'Default format', 'SubRip')) - 1;
    GetFormatsList(chkLstFormatsToShow.Items);
    for i := 0 to chkLstFormatsToShow.Items.Count-1 do
      chkLstFormatsToShow.Checked[i] := Ini.ReadBool('Formats to show', SubtitleAPI.GetFormatName(i+1),True);
    chkShowCustomFormats.Checked := Ini.ReadBool('Formats', 'Show custom formats', False);

    // --------------------------------- //
    //             File types            //
    // --------------------------------- //
    chkAddOpenWithSWToShell.Checked := Ini.ReadBool('File types', 'Add Open with SW to shell', False);
    SeparateExtensions(Items, GetExtensionsList);
    Items.Add('*' + ID_STPEXT); // Subtitle Translation Project (STP file)
    Items.Add('*' + ID_SRFEXT); // URUSoft Subtitle Report File
    chkLstExtensions.Items := Items;
    chkRegExtOnStart.Checked := Ini.ReadBool('File types', 'Register extensions on start', False);
    chkAssociateExtensions.Checked := Ini.ReadBool('File types', 'Associate extensions', True);
    SeparateExtensions(Items, Ini.ReadString('File types', 'Associated extensions', ''));
    for i := 0 to chkLstExtensions.Items.Count-1 do
      chkLstExtensions.Checked[i] := False;

    for i := 0 to Items.Count-1 do
      chkLstExtensions.Checked[chkLstExtensions.Items.IndexOf(Items[i])] := True;

    // --------------------------------- //
    //                Save               //
    // --------------------------------- //
    chkAskToSave.Checked         := Ini.ReadBool('Save', 'Ask to save', True);
    chkSaveAutomatically.Checked := Ini.ReadBool('Save', 'Save work automatically', False);
    updMins.Position             := Ini.ReadInteger('Save', 'Time interval', 60000) div 60000;
    chkSaveAsBackup.Checked      := Ini.ReadBool('Save', 'Save as backup', True);
    chkAskToSaveNewSubs.Checked  := Ini.ReadBool('Save', 'Ask to save new subtitles', True); //added by adenry
    chkSaveEmptyLines.Checked    := Ini.ReadBool('Save', 'Save empty lines', False); //added by adenry

    // --------------------------------- //
    //           Video preview           //
    // --------------------------------- //
    cmbDoubleClickInSub.ItemIndex      := Ini.ReadInteger('Video preview', 'Double click in a subtitle', 1);
    cmbShiftDoubleClickInSub.ItemIndex := Ini.ReadInteger('Video preview', 'Shift-double click in a subtitle', 2);
    udSecsToJump1.Position             := Ini.ReadInteger('Video preview', 'Seconds to jump 1', 1);
    udSecsToJump2.Position             := Ini.ReadInteger('Video preview', 'Seconds to jump 2', 1);
    edtRewindAndForwardTime.Text       := Ini.ReadString ('Video preview', 'Rewind and forward', '0,500');
    cmbDefaultAltPlayRate.ItemIndex    := Ini.ReadInteger('Video preview', 'Default altered playback rate', 0);
    chkVertVideoAlign.Checked          := Ini.ReadBool   ('Video preview', 'Vertical video align', True); //added by adenry
    //chkVolumeControls.Checked          := Ini.ReadBool   ('Video preview', 'Show volume controls', True); //added by adenry
    chkFullScreenOnDblClick.Checked    := Ini.ReadBool   ('Video preview', 'Full screen on double click', True); //added by adenry
    chkPlayVideoOnLoad.Checked         := Ini.ReadBool   ('Video preview', 'Play video on load', True); //added by adenry

    //added by adenry: begin
    udShiftShowVal.Position             := Ini.ReadInteger('Video preview', 'Shift Show value', 0);
    udShiftHideVal.Position             := Ini.ReadInteger('Video preview', 'Shift Hide value', 0);
    //added by adenry: end
    pnlVisSubReprColor.Color            := Ini.ReadInteger('Video preview', 'Visual sub repres color', pnlVisSubReprColor.Font.Color); //added by adenry

    // --------------------------------- //
    //       Video preview/Subtitles     //
    // --------------------------------- //
    chkDrawBorder.Checked        := Ini.ReadBool('Video preview subtitles', 'Draw border', True);
    subSample.Border             := chkDrawBorder.Checked;
    chkDrawShadow.Checked        := Ini.ReadBool('Video preview subtitles', 'Draw shadow', True);
    subSample.Shadow             := chkDrawShadow.Checked;
    chkTransparent.Checked       := Ini.ReadBool('Video preview subtitles', 'Transparent', True);
    chkForceUsingRegions.Checked := Ini.ReadBool('Video preview subtitles', 'Force using regions', False);
    subSample.Font.Name          := Ini.ReadString('Video preview subtitles', 'Font name', 'Tahoma');
    subSample.Font.Size          := Ini.ReadInteger('Video preview subtitles', 'Font size', 14);
    subSample.TextColor          := Ini.ReadInteger('Video preview subtitles', 'Font color', clWhite);
    subSample.Font.Color         := subSample.TextColor;
    btnBackground.Font.Color     := Ini.ReadInteger('Video preview subtitles', 'Background color', clBtnFace); //we store it here
    if not chkTransparent.Checked then
      subSample.BackgroundColor    := btnBackground.Font.Color else
      subSample.BackgroundColor    := pnlSubSample.Color;
    //pnlSubSample.Color           := Ini.ReadInteger('Video preview subtitles', 'Background color', clBtnFace);
    udBorderWidth.Position       := Ini.ReadInteger('Video preview subtitles', 'Border width', 1);
    udShadowWidth.Position       := Ini.ReadInteger('Video preview subtitles', 'Shadow width', 1);
    pnlBorderColor.Color         := Ini.ReadInteger('Video preview subtitles', 'Border color', clBlack); //added by adenry
    subSample.BorderColor        := pnlBorderColor.Color; //added by adenry
    pnlShadowColor.Color         := Ini.ReadInteger('Video preview subtitles', 'Shadow color', clBlack); //added by adenry
    subSample.ShadowColor        := pnlShadowColor.Color; //added by adenry
    chkAlignLeftLineWithDash.Checked := Ini.ReadBool('Video preview subtitles', 'Align left new line with dash', True); //added by adenry
    chkRelativeFontSize.Checked  := Ini.ReadBool('Video preview subtitles', 'Relative font size', True); //added by adenry
    chkKeepSubOnVideo.Checked    := Ini.ReadBool('Video preview subtitles', 'Keep subtitle on video', True); //added by adenry
    chkAntialiasing.Checked      := Ini.ReadBool('Video preview subtitles', 'Try antialiasing', not chkForceUsingRegions.Checked or not chkTransparent.Checked); //added by adenry
    subSample.Antialiased        := chkAntialiasing.Checked; //added by adenry
    subSample.Font.Style         := [];
    if Ini.ReadBool('Video preview subtitles', 'Bold', True) then
      subSample.Font.Style := subSample.Font.Style + [fsBold];
    if Ini.ReadBool('Video preview subtitles', 'Italic', False) then
      subSample.Font.Style := subSample.Font.Style + [fsItalic];
    if Ini.ReadBool('Video preview subtitles', 'Underline', False) then
      subSample.Font.Style := subSample.Font.Style + [fsUnderline];
    UpdateSubSamplePos;
    chkForceUsingRegions.Enabled := chkTransparent.Checked;
    pnlTransparencyColor.Enabled := chkTransparent.Checked;
    
    // --------------------------------- //
    //      External preview/General     //
    // --------------------------------- //
    edtVidPlayer.Text               := Ini.ReadString('External Preview', 'Video player', '');
    rdoAskForDifferentVideo.Checked := Ini.ReadBool('External Preview', 'Ask for different video', True);
    rdoTestWithVideo.Checked        := not Ini.ReadBool('External Preview', 'Ask for different video', True);
    edtAVIFile.Text                 := Ini.ReadString('External Preview', 'Video to test', '');

    // --------------------------------- //
    //     External preview/Advanced     //
    // --------------------------------- //
    GetFormatsList(cmbFormats.Items);
    rdoOriginalFormat.Checked := Ini.ReadBool('External Preview','Save in original format',True);
    rdoCustomFormat.Checked   := not Ini.ReadBool('External Preview','Save in original format',True);
    cmbFormats.ItemIndex      := SubtitleAPI.GetFormatIndex(Ini.ReadString('External Preview', 'Custom format', 'SubRip')) - 1;
    edtParameter.Text         := Ini.ReadString('External Preview','Parameter','');

    // If ViPlay is installed we configure it automatically...
    if Ini.ReadString('External Preview', 'Video player', '') = '' then
    begin
      Reg := TRegistry.Create;
      Reg.RootKey := HKEY_CURRENT_USER;
        if Reg.KeyExists('Software\URUSoft\ViPlay') then
        begin
          Reg.OpenKey('Software\URUSoft\ViPlay',False);
          if FileExists(Reg.ReadString('Install_Dir') + '\ViPlay.exe') then
          begin
            Ini.WriteString('External Preview','Video player',Reg.ReadString('Install_Dir') + '\ViPlay.exe');
            edtVidPlayer.Text := Reg.ReadString('Install_Dir') + '\ViPlay.exe';
            if edtParameter.Text = '' then
            begin
              edtParameter.Text := '/MOVIE:"VIDEO_FILE" /SUBTITLE:"SUBT_FILE" /FS';
              Ini.WriteString('External Preview', 'Parameter', '/MOVIE:"VIDEO_FILE" /SUBTITLE:"SUBT_FILE" /FS');
            end;
          end;
        end;
      Reg.Free;
    end;

    // --------------------------------- //
    //           Look / Program          //
    // --------------------------------- //
    cmbFonts.Items                  := screen.Fonts;
    cmbFonts.ItemIndex              := cmbFonts.Items.IndexOf(Ini.ReadString('Program look', 'Font', 'Tahoma'));
    udFontSize.Position             := Ini.ReadInteger('Program look', 'Font size', 8);
    cmbTextAlign.ItemIndex          := Ini.ReadInteger('Program look', '"Text" and "Translation" fields align', 2);
    if cmbTextAlign.ItemIndex <= -1 then
      cmbTextAlign.ItemIndex := 2;
    chkTagsHighlight.Checked        := Ini.ReadBool('Program look', 'Highlight tags', True); //added by adenry
    chkTagsHighlight.Visible        := frmMain.mmoSubtitleText.ClassName = TRichEdit.ClassName; //added by adenry
    pnlTagsHighlightColor.Color     := Ini.ReadInteger('Program look', 'Tags highlight color', pnlTagsHighlightColor.Font.Color); //added by adenry
    pnlTagsHighlightColor.Visible   := chkTagsHighlight.Visible; //added by adenry

    chkSmartResize.Checked          := Ini.ReadBool('Program look', 'Smart resize', True); //added by adenry
    chkSmartResizeColumns.Checked   := Ini.ReadBool('Program look', 'Smart resize columns', True); //added by adenry

    chkUseOfficeXPStyleMenu.Checked := Ini.ReadBool('Menu look', 'Use Office XP Style menu', True);
    chkUseGradientMenu.Checked      := Ini.ReadBool('Menu look', 'Use gradient menu', True);
    chkUseGradientMenu.Enabled      := chkUseOfficeXPStyleMenu.Checked;

    // --------------------------------- //
    //             Look / List           //
    // --------------------------------- //
    chkShowGridLines.Checked        := Ini.ReadBool('List look', 'Show grid lines', True);
    chkApplyStyle.Checked           := Ini.ReadBool('List look', 'Apply style to subtitles', True);
    chkMarkUnTransSubs.Checked      := Ini.ReadBool('List look', 'Mark untranslated subtitles', True);
    pnlUnTransColor.Color           := Ini.ReadInteger('List look', 'Untranslated subtitles color', pnlUnTransColor.Font.Color); //clRed replaced with pnlUnTransColor.Font.Color by adenry
    chkMarkUnTransSubsBckgr.Checked := Ini.ReadBool('List look', 'Mark untranslated subtitles with background', True); //added by adenry
    pnlUnTransBckgr.Color           := Ini.ReadInteger('List look', 'Untranslated subtitles background', pnlUnTransBckgr.Font.Color); //added by adenry
    chkShowHorzScrollBar.Checked    := Ini.ReadBool('List look', 'Show horizontal scrollbar', True);
    chkRightClickSel.Checked        := Ini.ReadBool('List look', 'Right click selection', True); //added by adenry
    udRowHeight.Position            := Ini.ReadInteger('List look', 'Row height', 18); //added by adenry
    udTextMargin.Position           := Ini.ReadInteger('List look', 'Text margin', 6); //added by adenry
    pnlSelColor.Color               := Ini.ReadInteger('List look', 'Selection color', pnlSelColor.Font.Color); //added by adenry
    pnlSelTextColor.Color           := Ini.ReadInteger('List look', 'Selection text color', pnlSelTextColor.Font.Color); //added by adenry
    udSelTransp.Position            := Ini.ReadInteger('List look', 'Selection transparency', 50); //added by adenry
    //added by adenry: begin
    cmbNumColAlign.ItemIndex        := Ini.ReadInteger('List look', 'Num column align', 0);
    cmbShowColAlign.ItemIndex       := Ini.ReadInteger('List look', 'Show column align', 0);
    cmbHideColAlign.ItemIndex       := Ini.ReadInteger('List look', 'Hide column align', 0);
    cmbTextColAlign.ItemIndex       := Ini.ReadInteger('List look', 'Text column align', 0);
    cmbTransColAlign.ItemIndex      := Ini.ReadInteger('List look', 'Translation column align', 0);
    //added by adenry: end
    //added by adenry: begin
    cmbDurColAlign.ItemIndex        := Ini.ReadInteger('List look', 'Duration column align', 1);
    cmbPauseColAlign.ItemIndex      := Ini.ReadInteger('List look', 'Pause column align', 1);
    cmbNumColStyle.ItemIndex        := Ini.ReadInteger('List look', 'Num column display style', 1);
    cmbShowColStyle.ItemIndex       := Ini.ReadInteger('List look', 'Show column display style', 0);
    cmbHideColStyle.ItemIndex       := Ini.ReadInteger('List look', 'Hide column display style', 0);
    cmbDurColStyle.ItemIndex        := Ini.ReadInteger('List look', 'Duration column display style', 1);
    cmbPauseColStyle.ItemIndex      := Ini.ReadInteger('List look', 'Pause column display style', 1);
    //added by adenry: end



    //added by adenry: begin
    // --------------------------------- //
    //             Look / Marking        //
    // --------------------------------- //
    chkMarkingWithColor.Checked       := Ini.ReadBool('Marking look', 'Marking with color', True);
    pnlMarkingColor.Color             := Ini.ReadInteger('Marking look', 'Marking color', pnlMarkingColor.Font.Color);
    chkMarkingWithBckgr.Checked       := Ini.ReadBool('Marking look', 'Marking with background', True);
    pnlMarkingBckgr.Color             := Ini.ReadInteger('Marking look', 'Marking background', pnlMarkingBckgr.Font.Color);
    chkMarkingColNum.Checked          := Ini.ReadBool('Marking look', 'Mark column 1', True);
    chkMarkingColPause.Checked        := Ini.ReadBool('Marking look', 'Mark column 6', False);
    chkMarkingColShow.Checked         := Ini.ReadBool('Marking look', 'Mark column 2', False);
    chkMarkingColHide.Checked         := Ini.ReadBool('Marking look', 'Mark column 3', False);
    chkMarkingColDur.Checked          := Ini.ReadBool('Marking look', 'Mark column 5', False);
    chkMarkingColText.Checked         := Ini.ReadBool('Marking look', 'Mark column 4', False);
    rdoMarkingPriorityLow.Checked     := not Ini.ReadBool('Marking look', 'Marking high priority', True);
    rdoMarkingPriorityHigh.Checked    := Ini.ReadBool('Marking look', 'Marking high priority', True);
    chkMarkingInVideoPreview.Checked  := Ini.ReadBool('Marking look', 'Marking in video preview', True);
    pnlMarkingColorVideoPreview.Color := Ini.ReadInteger('Marking look', 'Marking color in video preview', pnlMarkingColorVideoPreview.Font.Color);
    if Ini.ReadInteger('Marking look', 'Marking save', 0) = 0 then
      rdoMarkingSaveDonot.Checked := True else
      if Ini.ReadInteger('Marking look', 'Marking save', 0) = 1 then
        rdoMarkingSaveAsk.Checked := True else
        rdoMarkingSaveAuto.Checked := True;
    chkMarkingLoadAuto.Checked := Ini.ReadBool('Marking look', 'Marking auto load', True);
    //added by adenry: end


  if Assigned(Items) then FreeAndNil(Items);    // added by Bdzl


  finally
    Ini.Free;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmSettings.btnOkClick(Sender: TObject);
var
  i      : Integer;
  ExtStr : String;
  Ini    : TMemIniFile; //TIniFile replaced with TMemIniFile by adenry
  Node   : PVirtualNode; //added by adenry
  SelStart, SelLength: Integer; //added by adenry
begin
  Screen.Cursor := crHourGlass; //added by adenry
  ExtStr := '';
  Ini := TMemIniFile.Create(IniRoot); //TIniFile replaced with TMemIniFile by adenry
  try
    // --------------------------------- //
    //              General              //
    // --------------------------------- //

    Ini.WriteBool('Settings', 'Always on top',chkAlwaysOnTop.Checked);
    Ini.WriteBool('Settings', 'Allow more than one instance', chkInstance.Checked);
    Ini.WriteBool('Settings', 'Confirm when deleting a subtitle',chkConfirmDelete.Checked);
    Ini.WriteBool('Settings', 'Interpret invalid files as plain text',chkInterpretInvalid.Checked);
    Ini.WriteBool('Settings', 'Autosearch for movie',chkAutosearchMovie.Checked);
    Ini.WriteBool('Settings', 'Force working in time mode',chkForceWorkingTime.Checked);
    Ini.WriteBool('Settings', 'Keep order of lines when reverse text',chkKeepOrderOfLines.Checked);
    Ini.WriteBool('Settings', 'Select text on jump to next line',chkSelectTextNL.Checked);
    Ini.WriteBool('Settings', 'Select text on jump to previous line',chkSelectTextPL.Checked);
    //Ini.WriteBool('Settings', 'No interaction with tags', chkNoInteractionWithTags.Checked); //removed by adenry
    //added by adenry: begin
    if rdoNoInteractionWithTags.Checked then
      Ini.WriteInteger('Settings', 'Tags mode', 1) else
    if rdoSingleTagsMode.Checked then
      Ini.WriteInteger('Settings', 'Tags mode', 3) else
    if rdoAutoDeleteTags.Checked then
      Ini.WriteInteger('Settings', 'Tags mode', 4) else
      Ini.WriteInteger('Settings', 'Tags mode', 2);
    //added by adenry: end
    //Ini.WriteBool('Settings', 'Work with style tags',chkWorkWithStyleTags.Checked); //removed by adenry
    Ini.WriteInteger('Settings', 'MaxRF', udRFLimit.Position); // Recent files limit...
    frmMain.ConfirmDelete     := chkConfirmDelete.Checked;
    frmMain.InvalidFPlainText := chkInterpretInvalid.Checked;
    frmMain.AutosearchMovie   := chkAutoSearchMovie.Checked;
    frmMain.ForceWorkWithTime := chkForceWorkingTime.Checked;
    frmMain.KeepOrderOfLines  := chkKeepOrderOfLines.Checked;
    frmMain.SelTextNL         := chkSelectTextNL.Checked;
    frmMain.SelTextPL         := chkSelectTextPL.Checked;
    frmMain.RFMaxCount        := udRFLimit.Position;
    frmMain.UpdateRFMenus;
    //SubtitleAPI.WorkWithTags          := chkWorkWithStyleTags.Checked; //removed by adenry
    //added by adenry: begin
    SubtitleAPI.NoInteractionWithTags := rdoNoInteractionWithTags.Checked; //added later
    SubtitleAPI.MultiTagsMode         := rdoMultipleTagsMode.Checked; //added later
    SubtitleAPI.SingleTagsMode        := rdoSingleTagsMode.Checked; //added later
    SubtitleAPI.WorkWithTags          := SubtitleAPI.MultiTagsMode or SubtitleAPI.SingleTagsMode; //added later later
    //added by adenry: end

    // --------------------------------- //
    //             Advanced              //
    // --------------------------------- //
    Ini.WriteInteger('Advanced', 'Two lines if longer than', udTwoLinesIfLongerThan.Position);
    Ini.WriteBool('Advanced', 'Toggle breakpoint', chkToggleBreakPoint.Checked);
    Ini.WriteInteger('Advanced', 'Break line after', udBreakLineAfter.Position);
    Ini.WriteBool('Advanced', 'Smart line adjust automatically', chkSLAAutomatically.Checked);
    Ini.WriteInteger('Advanced', 'Maximum line length', udMaxLineLength.Position);
    Ini.WriteInteger('Advanced', 'Shift time', udShiftTime.Position);
    //added by adenry: begin
    Ini.WriteInteger('Advanced', 'Default subtitle duration', udDefaultSubDuration.Position);
    Ini.WriteInteger('Advanced', 'Default subtitle pause', udDefaultSubPause.Position);
    //added by adenry: end
    Ini.WriteInteger('Advanced', 'Increase step time', udIncreaseStepTime.Position); //added by adenry
    Ini.WriteInteger('Advanced', 'Increase step frames', udIncreaseStepFrames.Position); //added by adenry
    Ini.WriteBool('Advanced', 'Keep min duration', chkKeepMinDur.Checked); //added by adenry
    Ini.WriteInteger('Advanced', 'Keep min duration value', udKeepMinDur.Position); //added by adenry
    Ini.WriteBool('Advanced', 'Keep min duration but do not overlap', chkDontAllowOverlaps.Checked); //added by adenry
    Ini.WriteBool('Advanced', 'Auto round time values', chkAutoRoundTimeVals.Checked); //added by adenry
    Ini.WriteInteger('Advanced', 'Auto rounding factor', udAutoRoundTimeVals.Position); //added by adenry
    Ini.WriteBool('Advanced', 'Round time values on subtitle load', chkRoundOnSubLoad.Checked); //added by adenry

    frmMain.TwoLinesIfLongerThan    := udTwoLinesIfLongerThan.Position;
    frmMain.ToggleBreakPoint        := chkToggleBreakPoint.Checked;
    frmMain.BreakLineAfter          := udBreakLineAfter.Position;
    frmMain.AdjustAutomatically     := chkSLAAutomatically.Checked; //added by adenry
    frmMain.MaxLineLength           := udMaxLineLength.Position;
    frmMain.ShiftTime               := udShiftTime.Position;
    //added by adenry: begin
    frmMain.DefaultSubDuration      := udDefaultSubDuration.Position;
    frmMain.DefaultSubPause         := udDefaultSubPause.Position;
    //added by adenry: end
    //added by adenry: begin
    frmMain.tmeShow.TimeStep        := udIncreaseStepTime.Position;
    frmMain.tmeHide.TimeStep        := udIncreaseStepTime.Position;
    frmMain.tmeDuration.TimeStep    := udIncreaseStepTime.Position;
    frmMain.tmePause.TimeStep       := udIncreaseStepTime.Position; //added later
    frmMain.tmeShow.FramesStep      := udIncreaseStepFrames.Position;
    frmMain.tmeHide.FramesStep      := udIncreaseStepFrames.Position;
    frmMain.tmeDuration.FramesStep  := udIncreaseStepFrames.Position;
    frmMain.tmePause.FramesStep     := udIncreaseStepFrames.Position; //added later
    //added by adenry: end
    frmMain.KeepMinDur              := chkKeepMinDur.Checked; //added by adenry
    frmMain.KeepMinDurValue         := udKeepMinDur.Position; //added by adenry
    frmMain.KeepMinDurDontOverlap   := chkDontAllowOverlaps.Checked; //added by adenry
    //added by adenry: begin
    frmMain.AutoRoundTimeVals       := chkAutoRoundTimeVals.Checked;
    frmMain.RoundingFactor          := udAutoRoundTimeVals.Position;
    frmMain.RoundOnLoad             := chkRoundOnSubLoad.Checked;
    //added by adenry: end

    // --------------------------------- //
    //              Charsets             //
    // --------------------------------- //
    Ini.WriteBool('Settings', 'Show charsets in main form', chkShowInMainForm.Checked);
    Ini.WriteInteger('General', 'Original charset', cmbOrgCharset.ItemIndex);
    Ini.WriteInteger('General', 'Translation charset', cmbTransCharset.ItemIndex);
    Ini.WriteInteger('General', 'Notes charset', cmbNotesCharset.ItemIndex); //added by adenry
    frmMain.cmbOrgCharset.Visible        := chkShowInMainForm.Checked;
    frmMain.cmbTransCharset.Visible      := chkShowInMainForm.Checked;
    frmMain.cmbOrgCharset.ItemIndex      := cmbOrgCharset.ItemIndex;
    frmMain.cmbTransCharset.ItemIndex    := cmbTransCharset.ItemIndex;
    frmMain.OrgCharset                   := StrCharsetToInt(cmbOrgCharset.Items[cmbOrgCharset.ItemIndex]);
    frmMain.TransCharset                 := StrCharsetToInt(cmbTransCharset.Items[cmbTransCharset.ItemIndex]);
    frmMain.NotesCharset                 := StrCharsetToInt(cmbNotesCharset.Items[cmbNotesCharset.ItemIndex]); //added by adenry
    //charsets are actually set after the parent font is modified in LOOK / PROGRAM settings
    //frmMain.mmoSubtitleText.Font.Charset := frmMain.OrgCharset;
    //frmMain.mmoTranslation.Font.Charset  := frmMain.TransCharset;
    //frmMain.mmoNotes.Font.Charset        := frmMain.NotesCharset;
    if chkShowInMainForm.Checked then
      //frmMain.cmbOCRScripts.Top := 288 else //removed by adenry
      frmMain.chkOCRScripts.Top := frmMain.cmbTransCharset.Top + frmMain.cmbTransCharset.Height + 3 else //added by adenry
      frmMain.chkOCRScripts.Top := frmMain.cmbOrgCharset.Top; //cmbOCRScripts changed to chkOCRScripts by adenry
    frmMain.cmbOCRScripts.Top := frmMain.chkOCRScripts.Top + frmMain.chkOCRScripts.Height; //added by adenry
    frmMain.mnuShowInMainFormClick(Sender); //added by adenry

    // --------------------------------- //
    //               Formats             //
    // --------------------------------- //
    Ini.WriteString('Formats','Default format', SubtitleAPI.GetFormatName(cmbDefaultFormat.ItemIndex + 1));
    for i := 0 to chkLstFormatsToShow.Items.Count-1 do
      Ini.WriteBool('Formats to show', SubtitleAPI.GetFormatName(i+1), chkLstFormatsToShow.Checked[i]);
    Ini.WriteBool('Formats','Show custom formats', chkShowCustomFormats.Checked);

    // --------------------------------- //
    //             File types            //
    // --------------------------------- //
    //added by adenry: begin
    if Ini.ReadBool('File types', 'Add Open with SW to shell', False) <> chkAddOpenWithSWToShell.Checked then
      if chkAddOpenWithSWToShell.Checked then
        add_context_menu('Open with Subtitle Workshop',ReplaceString(ReplaceString(GetExtensionsList,';',','),'*','')) else
        remove_context_menu('Open with Subtitle Workshop',ReplaceString(ReplaceString(GetExtensionsList,';',','),'*',''));
        {add_context_menu('Open with Subtitle Workshop','.srt') else
        remove_context_menu('Open with Subtitle Workshop','.srt');}
    Ini.WriteBool('File types', 'Add Open with SW to shell', chkAddOpenWithSWToShell.Checked);
    //added by adenry: end

    Ini.WriteBool('File types', 'Register extensions on start', chkRegExtOnStart.Checked);
    Ini.WriteBool('File types', 'Associate extensions', chkAssociateExtensions.Checked);
    //get a list of the selected extensions
    for i := 0 to chkLstExtensions.Items.Count-1 do
      if chkLstExtensions.Checked[i] then
        ExtStr := ExtStr + chkLstExtensions.Items[i] + ';';
    Delete(ExtStr, Length(ExtStr), 1);
    //check if the list was modified
    if(Ini.ReadString('File types', 'Associated extensions', '') <> ExtStr) then
    begin
      try
        //associate the selected extensions
        AssociateExtensions(ExtStr);
        //get a list of the extensions that are not selected
        ExtStr := '';
        for i := 0 to chkLstExtensions.Items.Count-1 do
          if chkLstExtensions.Checked[i] = False then
            ExtStr := ExtStr + chkLstExtensions.Items[i] + ';';
        Delete(ExtStr, Length(ExtStr), 1);
        //unassociate the extensions that are not selected
        AssociateExtensions(ExtStr, False);
        Ini.WriteString('File types', 'Associated extensions', ExtStr); //moved here by adenry - only save association, if it didn't fail
      except
        //continue even if association fails
        on E:Exception do
          frmMain.AppException(Self, E);
      end;
    end;

    // --------------------------------- //
    //                Save               //
    // --------------------------------- //
    Ini.WriteBool   ('Save', 'Ask to save', chkAskToSave.Checked);
    Ini.WriteBool   ('Save', 'Save work automatically', chkSaveAutomatically.Checked);
    Ini.WriteInteger('Save', 'Time interval', updMins.Position * 60000);
    Ini.WriteBool   ('Save', 'Save as backup', chkSaveAsBackup.Checked);
    Ini.WriteBool   ('Save', 'Ask to save new subtitles', chkAskToSaveNewSubs.Checked); //added by adenry
    Ini.WriteBool   ('Save', 'Save empty lines', chkSaveEmptyLines.Checked); //added by adenry
    frmMain.AskToSave            := chkAskToSave.Checked;
    frmMain.tmrSaveWork.Enabled  := chkSaveAutomatically.Checked;
    frmMain.tmrSaveWork.Interval := updMins.Position * 60000;
    frmMain.SaveAsBackup         := chkSaveAsBackup.Checked;
    frmMain.AskToSaveNewSubs     := chkAskToSaveNewSubs.Checked; //added by adenry
    frmMain.SaveEmptyLines       := chkSaveEmptyLines.Checked; //added by adenry

    // --------------------------------- //
    //           Video preview           //
    // --------------------------------- //
    Ini.WriteInteger('Video preview', 'Double click in a subtitle', cmbDoubleClickInSub.ItemIndex);
    Ini.WriteInteger('Video preview', 'Shift-double click in a subtitle', cmbShiftDoubleClickInSub.ItemIndex);
    Ini.WriteInteger('Video preview', 'Seconds to jump 1', udSecsToJump1.Position);
    Ini.WriteInteger('Video preview', 'Seconds to jump 2', udSecsToJump2.Position);
    Ini.WriteString ('Video preview', 'Rewind and forward', ReplaceString(edtRewindAndForwardTime.Text, ' ', '0'));
    Ini.WriteInteger('Video preview', 'Default altered playback rate', cmbDefaultAltPlayRate.ItemIndex);
    Ini.WriteBool   ('Video preview', 'Vertical video align', chkVertVideoAlign.Checked); //added by adenry
    //Ini.WriteBool   ('Video preview', 'Show volume controls', chkVolumeControls.Checked); //added by adenry
    Ini.WriteBool   ('Video preview', 'Full screen on double click', chkFullScreenOnDblClick.Checked); //added by adenry
    Ini.WriteBool   ('Video preview', 'Play video on load', chkPlayVideoOnLoad.Checked); //added by adenry
    Ini.WriteInteger('Video preview', 'Shift Show value', udShiftShowVal.Position); //added by adenry
    Ini.WriteInteger('Video preview', 'Shift Hide value', udShiftHideVal.Position); //added by adenry
    //added by adenry: begin //hidden parameters
    Ini.WriteInteger('Video preview', 'Visual sub repres color', pnlVisSubReprColor.Color); //added by adenry
    //added by adenry: end
    frmMain.OnDoubleClick   := cmbDoubleClickInSub.ItemIndex;
    frmMain.OnShiftDblClick := cmbShiftDoubleClickInSub.ItemIndex;
    frmMain.SecsToJump1     := udSecsToJump1.Position;
    frmMain.SecsToJump2     := udSecsToJump2.Position;
    frmMain.RewFFTime       := StrSecToMS(ReplaceString(edtRewindAndForwardTime.Text, ' ', '0')); //ReplaceString added by adenry
    frmMain.DefAltPlayRate  := cmbDefaultAltPlayRate.ItemIndex + 1;
    SetDefaultShortCut;
    frmMain.VertVideoAlign  := chkVertVideoAlign.Checked; //added by adenry
    //frmMain.VolumeControls  := chkVolumeControls.Checked; //added by adenry
    //ShowVolumeControls(frmMain.VolumeControls); //added by adenry
    frmMain.FullScreenOnDblClick := chkFullScreenOnDblClick.Checked; //added by adenry
    frmMain.PlayVideoOnLoad := chkPlayVideoOnLoad.Checked;
    //added by adenry: begin
    frmMain.ShiftShowVal := udShiftShowVal.Position; //added by adenry
    frmMain.ShiftHideVal := udShiftHideVal.Position; //added by adenry
    //added by adenry: end
    frmMain.VisualSubReprColor := pnlVisSubReprColor.Color;

    // --------------------------------- //
    //       Video preview/Subtitles     //
    // --------------------------------- //
    //added by adenry: begin
    //Make sure colors are not the same as the transparent color
    if subSample.TextColor = subSample.TransparentColor then subSample.TextColor := subSample.TextColor + $00010101;
    if pnlBorderColor.Color = subSample.TransparentColor then pnlBorderColor.Color := pnlBorderColor.Color + $00010101;
    if pnlShadowColor.Color = subSample.TransparentColor then pnlShadowColor.Color := pnlShadowColor.Color + $00010101;
    //added by adenry: end
    Ini.WriteBool('Video preview subtitles','Draw border', chkDrawBorder.Checked);
    Ini.WriteBool('Video preview subtitles','Draw shadow', chkDrawShadow.Checked);
    Ini.WriteBool('Video preview subtitles','Transparent', chkTransparent.Checked);
    Ini.WriteBool('Video preview subtitles', 'Force using regions', chkForceUsingRegions.Checked AND chkTransparent.Checked); //AND chkTransparent.Checked added by adenry
    Ini.WriteString('Video preview subtitles', 'Font name', subSample.Font.Name);
    Ini.WriteInteger('Video preview subtitles', 'Font size', subSample.Font.Size);
    Ini.WriteInteger('Video preview subtitles', 'Font color', subSample.TextColor);
    Ini.WriteInteger('Video preview subtitles', 'Background color', btnBackground.Font.Color);
    Ini.WriteInteger('Video preview subtitles', 'Border width', udBorderWidth.Position);
    Ini.WriteInteger('Video preview subtitles', 'Shadow width', udShadowWidth.Position);
    Ini.WriteInteger('Video preview subtitles', 'Border color', pnlBorderColor.Color); //added by adenry
    Ini.WriteInteger('Video preview subtitles', 'Shadow color', pnlShadowColor.Color); //added by adenry
    Ini.WriteBool('Video preview subtitles', 'Bold', fsBold in subSample.Font.Style);
    Ini.WriteBool('Video preview subtitles', 'Italic', fsItalic in subSample.Font.Style);
    Ini.WriteBool('Video preview subtitles', 'Underline', fsUnderline in subSample.Font.Style);
    Ini.WriteBool('Video preview subtitles', 'Align left new line with dash', chkAlignLeftLineWithDash.Checked); //added by adenry
    Ini.WriteBool('Video preview subtitles', 'Relative font size', chkRelativeFontSize.Checked); //added by adenry
    Ini.WriteBool('Video preview subtitles', 'Keep subtitle on video', chkKeepSubOnVideo.Checked); //added by adenry
    Ini.WriteBool('Video preview subtitles', 'Try antialiasing', chkAntialiasing.Checked); //added by adenry
    frmMain.subSubtitle.Border    := chkDrawBorder.Checked;
    frmMain.subSubtitle.Shadow    := chkDrawShadow.Checked;
    frmMain.TransparentSubs       := chkTransparent.Checked;
    frmMain.ForceUsingReg         := chkForceUsingRegions.Checked AND chkTransparent.Checked; //AND chkTransparent.Checked added by adenry
    frmMain.subSubtitle.ForceTransparency := chkForceUsingRegions.Checked;
    subSample.Font.Charset        := frmMain.subSubtitle.Font.Charset; //added by adenry later - preserve charset!
    frmMain.subSubtitle.Font      := subSample.Font;
    frmMain.subSubtitle.TextColor := subSample.TextColor;
    frmMain.subSubtitle.Font.Color  := frmMain.subSubtitle.TextColor; //added by adenry //subSubtitle.Font.Color stores the color for marking
    frmMain.BackgroundColor := subSample.BackgroundColor; //added by adenry
    if chkTransparent.Checked then
      frmMain.subSubtitle.BackgroundColor := GetColorKeyFUNC else
      frmMain.subSubtitle.BackgroundColor := subSample.BackgroundColor;
    frmMain.subSubtitle.BorderWidth := udBorderWidth.Position;
    frmMain.subSubtitle.ShadowWidth := udShadowWidth.Position;
    frmMain.subSubtitle.BorderColor := pnlBorderColor.Color; //added by adenry
    frmMain.subSubtitle.ShadowColor := pnlShadowColor.Color; //added by adenry
    frmMain.AlignLeftLineWithDash := chkAlignLeftLineWithDash.Checked; //added by adenry
    frmMain.RelativeFontSize      := chkRelativeFontSize.Checked; //added by adenry
    frmMain.SubFontSize           := subSample.Font.Size; //added by adenry
    frmMain.SubBorderWidth        := udBorderWidth.Position; //added by adenry
    frmMain.SubShadowWidth        := udShadowWidth.Position; //added by adenry
    frmMain.KeepSubOnVideo        := chkKeepSubOnVideo.Checked; //added by adenry
    frmMain.subSubtitle.Antialiased:=chkAntialiasing.Checked; //added by adenry
    //added by adenry later: begin
    //set the correct charset - bug fix
    if frmMain.mnuTranslatorMode.Checked and frmMain.mnuDisplayTranslation.Checked then
      frmMain.subSubtitle.Font.Charset := frmMain.TransCharset else
      frmMain.subSubtitle.Font.Charset := frmMain.OrgCharset;
    //added by adenry later: end
    UpdateSubtitlesPos;

    // --------------------------------- //
    //      External preview/General     //
    // --------------------------------- //
    Ini.WriteString('External Preview', 'Video player', edtVidPlayer.Text);
    Ini.WriteBool('External Preview', 'Ask for different video', rdoAskForDifferentVideo.Checked);
    Ini.WriteString('External Preview', 'Video to test', edtAVIFile.Text);

    // --------------------------------- //
    //     External preview/Advanced     //
    // --------------------------------- //
    Ini.WriteBool('External Preview', 'Save in original format', rdoOriginalFormat.Checked);
    Ini.WriteString('External Preview', 'Custom format', SubtitleAPI.GetFormatName(cmbFormats.ItemIndex + 1));
    Ini.WriteString('External Preview', 'Parameter', edtParameter.Text);

    // --------------------------------- //
    //           Look / Program          //
    // --------------------------------- //
    Ini.WriteString('Program look', 'Font', cmbFonts.Items[cmbFonts.ItemIndex]);
    Ini.WriteInteger('Program look', 'Font size', udFontSize.Position);
    with frmMain do
    begin
      frmMain.Font.Name               := cmbFonts.Items[cmbFonts.ItemIndex];
      frmMain.Font.Size               := udFontSize.Position;
      MiMenu.Fuente.Name              := Font.Name;
      MiMenu.Fuente.Size              := Font.Size;
      lstSubtitles.ParentFont         := True;
      //added by adenry: begin
      Screen.MenuFont.Size            := Font.Size;
      Screen.MenuFont.Name            := Font.Name;
      lstSubtitles.Header.Font.Size   := Font.Size;
      lstSubtitles.Header.Height      := frmMain.lblMode.Height + (frmMain.lblMode.Left div 2); //added by adenry
      if Assigned(frmInfoErrors) then
        frmInfoErrors.SetFont;
      if Assigned(frmVariousInfo) then
        frmVariousInfo.SetFont;
      //added by adenry: end
      tmeShow.ParentFont              := True;
      tmeHide.ParentFont              := True;
      tmeDuration.ParentFont          := True;
      tmePause.ParentFont             := True; //added by adenry
      mmoSubtitleText.ParentFont      := True;
      mmoTranslation.ParentFont       := True;
      mmoNotes.ParentFont             := True; //added by adenry
      tmeShow.Font.Style              := Font.Style + [fsBold];
      tmeHide.Font.Style              := Font.Style + [fsBold];
      tmeDuration.Font.Style          := Font.Style + [fsBold];
      tmePause.Font.Style             := Font.Style + [fsBold]; //added by adenry
      mmoSubtitleText.Font.Style      := Font.Style + [fsBold];
      mmoTranslation.Font.Style       := Font.Style + [fsBold];
      mmoSubtitleText.Font.Size       := Font.Size + 2;
      mmoTranslation.Font.Size        := Font.Size + 2;
      //lblLines1.ParentFont            := True; //added by adenry
      //lblLines2.ParentFont            := True; //added by adenry
      //lblTextLines.ParentFont         := True; //added by adenry
      //lblTranslationLines.ParentFont  := True; //added by adenry
      //lblLineNumber.ParentFont        := True; //added by adenry
      //added by adenry: begin
      //refresh time controls and labels:
      if frmMain.lstSubtitles.TotalCount > 0 then
      begin
        MarkLongLinesInLabel(lblText); //added by adenry
        MarkLongLinesInLabel(lblTranslation); //added by adenry
        if tmeDuration.Enabled then tmeDuration.Time  := tmeDuration.Time; //added by adenry
        if tmeShow.Enabled then     tmeShow.Time      := tmeShow.Time; //added by adenry
        if tmeHide.Enabled then     tmeHide.Time      := tmeHide.Time; //added by adenry
        if tmePause.Enabled then    tmePause.Time     := tmePause.Time; //added by adenry later
      end;
      //added by adenry: end
    end;
    Ini.WriteInteger('Program look', '"Text" and "Translation" fields align', cmbTextAlign.ItemIndex);
    //removed by adenry: begin
    {case cmbTextAlign.ItemIndex of
      0: begin frmMain.mmoSubtitleText.Alignment := taLeftJustify; frmMain.mmoTranslation.Alignment := taLeftJustify; end;
      1: begin frmMain.mmoSubtitleText.Alignment := taRightJustify; frmMain.mmoTranslation.Alignment := taRightJustify; end else
      begin frmMain.mmoSubtitleText.Alignment := Classes.taCenter; frmMain.mmoTranslation.Alignment := Classes.taCenter; end;
    end;}
    //removed by adenry: end
    frmMain.mmoSubtitleText.Alignment    := SetObjectAlignment(cmbTextAlign.ItemIndex); //added by adenry
    frmMain.mmoTranslation.Alignment     := SetObjectAlignment(cmbTextAlign.ItemIndex); //added by adenry
    if TSWTextEdit.ClassName = TRichEdit.ClassName then //if TSWTextEdit.InheritsFrom(TRichEdit) then
    begin
      frmMain.mmoSubtitleText.Paragraph.Alignment := frmMain.mmoSubtitleText.Alignment;
      frmMain.mmoTranslation.Paragraph.Alignment  := frmMain.mmoTranslation.Alignment;
    end;
    frmMain.mmoSubtitleText.Font.Charset := frmMain.OrgCharset;
    frmMain.mmoTranslation.Font.Charset  := frmMain.TransCharset;
    frmMain.mmoNotes.Font.Charset        := frmMain.NotesCharset; //added by adenry

    //added by adenry: begin
    Ini.WriteBool('Program look', 'Highlight tags', chkTagsHighlight.Checked);
    frmMain.TagsHighlight := chkTagsHighlight.Checked;
    Ini.WriteInteger('Program look', 'Tags highlight color', pnlTagsHighlightColor.Color); //added by adenry
    frmMain.TagsHighlightColor := pnlTagsHighlightColor.Color;

    if frmMain.mmoSubtitleText.ClassName = TRichEdit.ClassName then
    begin
      SelStart := frmMain.mmoSubtitleText.SelStart;
      SelLength := frmMain.mmoSubtitleText.SelLength;
      frmMain.mmoSubtitleText.SelectAll;
      TRichEdit(frmMain.mmoSubtitleText).Paragraph.Alignment := frmMain.mmoSubtitleText.Alignment;
      if frmMain.TagsHighlight = False then
        TRichEdit(frmMain.mmoSubtitleText).SelAttributes.Color := frmMain.mmoSubtitleText.Font.Color;
      frmMain.mmoSubtitleText.SelStart := SelStart;
      frmMain.mmoSubtitleText.SelLength := SelLength;


      SelStart := frmMain.mmoTranslation.SelStart;
      SelLength := frmMain.mmoTranslation.SelLength;
      frmMain.mmoTranslation.SelectAll;
      TRichEdit(frmMain.mmoTranslation).Paragraph.Alignment := frmMain.mmoTranslation.Alignment;
      if frmMain.TagsHighlight = False then
        TRichEdit(frmMain.mmoTranslation).SelAttributes.Color := frmMain.mmoTranslation.Font.Color;
      frmMain.mmoTranslation.SelStart := SelStart;
      frmMain.mmoTranslation.SelLength := SelLength;
    end;
    //added by adenry: end

    Ini.WriteBool('Program look', 'Smart resize', chkSmartResize.Checked); //added by adenry
    frmMain.SmartResize := chkSmartResize.Checked; //added by adenry
    Ini.WriteBool('Program look', 'Smart resize columns', chkSmartResizeColumns.Checked); //added by adenry
    frmMain.SmartResizeColumns := chkSmartResizeColumns.Checked; //added by adenry

    Ini.WriteBool('Menu look', 'Use Office XP Style menu', chkUseOfficeXPStyleMenu.Checked);
    Ini.WriteBool('Menu look', 'Use gradient menu', chkUseGradientMenu.Checked);
    frmMain.MiMenu.Activo    := chkUseOfficeXPStyleMenu.Checked;
    frmMain.MiMenu.Degradado := chkUseGradientMenu.Checked;

    // --------------------------------- //
    //             Look / List           //
    // --------------------------------- //
    Ini.WriteBool('List look', 'Show grid lines', chkShowGridLines.Checked);
    Ini.WriteBool('List look', 'Apply style to subtitles', chkApplyStyle.Checked);
    Ini.WriteBool('List look', 'Mark untranslated subtitles', chkMarkUnTransSubs.Checked);
    Ini.WriteInteger('List look', 'Untranslated subtitles color', pnlUnTransColor.Color);
    Ini.WriteBool('List look', 'Mark untranslated subtitles with background', chkMarkUnTransSubsBckgr.Checked);
    Ini.WriteInteger('List look', 'Untranslated subtitles background', pnlUnTransBckgr.Color);
    Ini.WriteBool('List look', 'Show horizontal scrollbar', chkShowHorzScrollBar.Checked);
    Ini.WriteBool('List look', 'Right click selection', chkRightClickSel.Checked); //added by adenry
    Ini.WriteInteger('List look', 'Row height', udRowHeight.Position); //added by adenry
    Ini.WriteInteger('List look', 'Text margin', udTextMargin.Position); //added by adenry
    Ini.WriteInteger('List look', 'Selection color', pnlSelColor.Color); //added by adenry
    Ini.WriteInteger('List look', 'Selection text color', pnlSelTextColor.Color); //added by adenry
    Ini.WriteInteger('List look', 'Selection transparency', udSelTransp.Position); //added by adenry
    //added by adenry: begin
    Ini.WriteInteger('List look', 'Num column align', cmbNumColAlign.ItemIndex);
    Ini.WriteInteger('List look', 'Show column align', cmbShowColAlign.ItemIndex);
    Ini.WriteInteger('List look', 'Hide column align', cmbHideColAlign.ItemIndex);
    Ini.WriteInteger('List look', 'Text column align', cmbTextColAlign.ItemIndex);
    Ini.WriteInteger('List look', 'Translation column align', cmbTransColAlign.ItemIndex);
    //added by adenry: end
    //added by adenry: begin
    Ini.WriteInteger('List look', 'Duration column align', cmbDurColAlign.ItemIndex);
    Ini.WriteInteger('List look', 'Pause column align', cmbPauseColAlign.ItemIndex);
    Ini.WriteInteger('List look', 'Num column display style', cmbNumColStyle.ItemIndex);
    Ini.WriteInteger('List look', 'Show column display style', cmbShowColStyle.ItemIndex);
    Ini.WriteInteger('List look', 'Hide column display style', cmbHideColStyle.ItemIndex);
    Ini.WriteInteger('List look', 'Duration column display style', cmbDurColStyle.ItemIndex);
    Ini.WriteInteger('List look', 'Pause column display style', cmbPauseColStyle.ItemIndex);
    //added by adenry: end
    if chkShowGridLines.Checked then
      frmMain.lstSubtitles.TreeOptions.PaintOptions := [toShowHorzGridLines, toShowVertGridLines, toShowButtons, toShowDropmark, toShowTreeLines,toThemeAware,toUseBlendedImages,toAlwaysHideSelection] else //,toAlwaysHideSelection added by adenry - selection background is painted manually!
      frmMain.lstSubtitles.TreeOptions.PaintOptions := [toShowButtons, toShowDropmark, toShowTreeLines,toThemeAware,toUseBlendedImages,toAlwaysHideSelection]; //,toAlwaysHideSelection added by adenry
    frmMain.MarkUntransSubs  := chkMarkUntransSubs.Checked;
    frmMain.ApplyStyleInList := chkApplyStyle.Checked;
    frmMain.UnTransSubsColor := pnlUnTransColor.Color;
    frmMain.MarkUntransSubsBckgr  := chkMarkUntransSubsBckgr.Checked; //added by adenry
    frmMain.UnTransSubsBckgr := pnlUnTransBckgr.Color; //added by adenry
    if chkShowHorzScrollBar.Checked = False then
      frmMain.lstSubtitles.ScrollBarOptions.ScrollBars := ssVertical else
      frmMain.lstSubtitles.ScrollBarOptions.ScrollBars := ssBoth;
    //added by adenry: begin
    if chkRightClickSel.Checked then
      frmMain.lstSubtitles.TreeOptions.SelectionOptions := frmMain.lstSubtitles.TreeOptions.SelectionOptions + [toRightClickSelect] else
      frmMain.lstSubtitles.TreeOptions.SelectionOptions := frmMain.lstSubtitles.TreeOptions.SelectionOptions - [toRightClickSelect];      
    //added by adenry: end
    //added by adenry: begin
    Node := frmMain.lstSubtitles.GetFirst;
    while Assigned(Node) do
    begin
      frmMain.lstSubtitles.NodeHeight[Node]:= udRowHeight.Position;
      Node := Node.NextSibling;
    end;
    frmMain.lstSubtitles.DefaultNodeHeight := udRowHeight.Position;
    //added by adenry: end
    //added by adenry: begin
    frmMain.lstSubtitles.Header.Columns[0].Alignment := SetObjectAlignment(cmbNumColAlign.ItemIndex);
    frmMain.lstSubtitles.Header.Columns[1].Alignment := SetObjectAlignment(cmbShowColAlign.ItemIndex);
    frmMain.lstSubtitles.Header.Columns[2].Alignment := SetObjectAlignment(cmbHideColAlign.ItemIndex);
    frmMain.lstSubtitles.Header.Columns[3].Alignment := SetObjectAlignment(cmbTextColAlign.ItemIndex);
    frmMain.lstSubtitles.Header.Columns[4].Alignment := SetObjectAlignment(cmbTransColAlign.ItemIndex);
    //added by adenry: end
    //added by adenry: begin
    frmMain.lstSubtitles.Header.Columns[5].Alignment := SetObjectAlignment(cmbDurColAlign.ItemIndex);
    frmMain.lstSubtitles.Header.Columns[6].Alignment := SetObjectAlignment(cmbPauseColAlign.ItemIndex);
    frmMain.ColNumDisplayStyle                       := cmbNumColStyle.ItemIndex;
    frmMain.ColShowDisplayStyle                      := cmbShowColStyle.ItemIndex;
    frmMain.ColHideDisplayStyle                      := cmbHideColStyle.ItemIndex;
    frmMain.ColDurDisplayStyle                       := cmbDurColStyle.ItemIndex;
    frmMain.ColPauseDisplayStyle                     := cmbPauseColStyle.ItemIndex;
    //added by adenry: end
    frmMain.lstSubtitles.TextMargin := udTextMargin.Position;
    frmMain.lstSubtitles.Colors.FocusedSelectionColor := pnlSelColor.Color; //added by adenry
    frmMain.lstSubtitles.Colors.FocusedSelectionBorderColor := pnlSelColor.Color; //added by adenry
    frmMain.SelTextColor := pnlSelTextColor.Color; //added by adenry
    frmMain.lstSubtitles.Colors.UnfocusedSelectionColor := MixColors(pnlSelColor.Color,clWhite,45); //added by adenry
    frmMain.lstSubtitles.Colors.UnfocusedSelectionBorderColor := MixColors(pnlSelColor.Color,clWhite,45); //added by adenry
    frmMain.SelTransp := udSelTransp.Position; //added by adenry
    frmMain.lstSubtitles.Refresh;

    //added by adenry: begin
    // --------------------------------- //
    //             Look / Marking        //
    // --------------------------------- //
    Ini.WriteBool('Marking look', 'Marking with color', chkMarkingWithColor.Checked);
    Ini.WriteInteger('Marking look', 'Marking color', pnlMarkingColor.Color);
    Ini.WriteBool('Marking look', 'Marking with background', chkMarkingWithBckgr.Checked);
    Ini.WriteInteger('Marking look', 'Marking background', pnlMarkingBckgr.Color);
    Ini.WriteBool('Marking look', 'Mark column 1', chkMarkingColNum.Checked);
    Ini.WriteBool('Marking look', 'Mark column 6', chkMarkingColPause.Checked);
    Ini.WriteBool('Marking look', 'Mark column 2', chkMarkingColShow.Checked);
    Ini.WriteBool('Marking look', 'Mark column 3', chkMarkingColHide.Checked);
    Ini.WriteBool('Marking look', 'Mark column 5', chkMarkingColDur.Checked);
    Ini.WriteBool('Marking look', 'Mark column 4', chkMarkingColText.Checked);
    Ini.WriteBool('Marking look', 'Marking high priority', rdoMarkingPriorityHigh.Checked);
    Ini.WriteBool('Marking look', 'Marking in video preview', chkMarkingInVideoPreview.Checked);
    Ini.WriteInteger('Marking look', 'Marking color in video preview', pnlMarkingColorVideoPreview.Color);
    if rdoMarkingSaveDonot.Checked then
      frmMain.MarkingSave := 0 else
      if rdoMarkingSaveAsk.Checked then
        frmMain.MarkingSave := 1 else
        frmMain.MarkingSave := 2;
    Ini.WriteInteger('Marking look', 'Marking save', frmMain.MarkingSave);
    Ini.WriteBool('Marking look', 'Marking auto load', chkMarkingLoadAuto.Checked);
    frmMain.MarkingAutoLoad             := chkMarkingLoadAuto.Checked;
    frmMain.MarkingWithColor            := chkMarkingWithColor.Checked;
    frmMain.MarkingColor                := pnlMarkingColor.Color;
    frmMain.MarkingWithBckgr            := chkMarkingWithBckgr.Checked;
    frmMain.MarkingBckgr                := pnlMarkingBckgr.Color;
    frmMain.MarkingColNum               := chkMarkingColNum.Checked;
    frmMain.MarkingColPause             := chkMarkingColPause.Checked;
    frmMain.MarkingColShow              := chkMarkingColShow.Checked;
    frmMain.MarkingColHide              := chkMarkingColHide.Checked;
    frmMain.MarkingColDur               := chkMarkingColDur.Checked;
    frmMain.MarkingColText              := chkMarkingColText.Checked;
    if rdoMarkingPriorityHigh.Checked then
      frmMain.MarkingHighPriority       := True else
      frmMain.MarkingHighPriority       := False;
    frmMain.MarkingInVideoPreview       := chkMarkingInVideoPreview.Checked;
    frmMain.MarkingInVideoPreviewColor  := pnlMarkingColorVideoPreview.Color;
    //added by adenry: end

    // --------------------------------- //

    if frmMain.OrgFile <> '' then
    begin
      frmMain.mmoSubTextChange(Sender); //added by adenry
      frmMain.mmoTransChange(Sender); //added by adenry
      frmMain.AutoRecheckAllErrors; //added by adenry
    end;
  finally
    Ini.UpdateFile; //added by adenry
    Ini.Free;
    Screen.Cursor := crDefault; //added by adenry
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmSettings.chkDrawBorderClick(Sender: TObject);
begin
  subSample.Border := chkDrawBorder.Checked;
  subSample.BorderWidth := udBorderWidth.Position; //added by adenry
  UpdateSubSamplePos;
end;

// -----------------------------------------------------------------------------

procedure TfrmSettings.chkDrawShadowClick(Sender: TObject);
begin
  subSample.Shadow := chkDrawShadow.Checked;
  subSample.ShadowWidth := udShadowWidth.Position; //added by adenry
  UpdateSubSamplePos;
end;

// -----------------------------------------------------------------------------

procedure TfrmSettings.btnSubFontClick(Sender: TObject);
begin
  dlgSetFont.Font := subSample.Font;
  if (dlgSetFont.Execute) then
  begin
    subSample.Font := dlgSetFont.Font;
    UpdateSubSamplePos;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmSettings.btnSubColorClick(Sender: TObject);
begin
  dlgSetColor.Color := subSample.TextColor;
  if (dlgSetColor.Execute) then
    subSample.TextColor := dlgSetColor.Color;
  subSample.Font.Color := subSample.TextColor;
end;

// -----------------------------------------------------------------------------

procedure TfrmSettings.btnBackgroundClick(Sender: TObject);
begin
  dlgSetColor.Color := btnBackground.Font.Color;
  if (dlgSetColor.Execute) then
  begin
    if not chkTransparent.Checked then
    begin
      subSample.BackgroundColor := dlgSetColor.Color;
      //pnlSubSample.Color        := dlgSetColor.Color;
    end;
    btnBackground.Font.Color := dlgSetColor.Color;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmSettings.edtBorderWidthChange(Sender: TObject);
begin
  subSample.BorderWidth := udBorderWidth.Position;
  UpdateSubSamplePos; //added by adenry
end;

// -----------------------------------------------------------------------------

procedure TfrmSettings.edtShadowWidthChange(Sender: TObject);
begin
  subSample.ShadowWidth := udShadowWidth.Position;
  UpdateSubSamplePos; //added by adenry
end;

// -----------------------------------------------------------------------------

procedure TfrmSettings.btnBrowseClick(Sender: TObject);
begin
  dlgBrowse.Filter := 'Exe (*.exe)|*.exe';
  if (dlgBrowse.Execute) and (dlgBrowse.FileName <> '') then
    edtVidPlayer.Text := dlgBrowse.FileName;
end;

// -----------------------------------------------------------------------------

procedure TfrmSettings.btnDetectClick(Sender: TObject);
var
  S: String;
begin
  S := AnsiLowerCase(GetProgramAssociation('avi'));
  edtVidPlayer.Text := Copy(S, 1, LastDelimiter('.', S) + 3);
end;

// -----------------------------------------------------------------------------

procedure TfrmSettings.rdoAskForDifferentVideoClick(Sender: TObject);
begin
  edtAVIFile.Enabled := False;
  btnBrowse2.Enabled := False;
end;

// -----------------------------------------------------------------------------

procedure TfrmSettings.rdoTestWithVideoClick(Sender: TObject);
begin
  edtAVIFile.Enabled := True;
  btnBrowse2.Enabled := True;
end;

// -----------------------------------------------------------------------------

procedure TfrmSettings.btnBrowse2Click(Sender: TObject);
begin
  //dlgBrowse.Filter := AllSupportedFiles + '|*.asf;*.avi;*.mp4;*.divx;*.mpg;*.mpeg;*.m1v;*.qt;*.mov;*.wmv|ASF (*.asf)|*.asf|AVI (*.avi)|*.avi|DivX (*.mp4; *.divx)|*.mp4; *.divx|MPEG (*.mpg; *.mpeg; *.m1v)|*.mpg; *.mpeg; *.m1v|QuickTime 2.0 (*.qt; *.mov)|*.qt; *.mov|WMV (*.wmv)|*.wmv'; //removed by adenry
  dlgBrowse.Filter := GetVideoFilesFilterString; //added by adenry
  if (dlgBrowse.Execute) and (dlgBrowse.FileName <> '') then
    edtAviFile.Text := dlgBrowse.FileName;
end;

// -----------------------------------------------------------------------------

procedure TfrmSettings.rdoOriginalFormatClick(Sender: TObject);
begin
  cmbFormats.Enabled := False;
end;

// -----------------------------------------------------------------------------

procedure TfrmSettings.rdoCustomFormatClick(Sender: TObject);
begin
  cmbFormats.Enabled := True;
end;

// -----------------------------------------------------------------------------

procedure TfrmSettings.pnlUnTransColorClick(Sender: TObject);
begin
  if (dlgSetColor.Execute) then
    TPanel(Sender).Color := dlgSetColor.Color;
end;

// -----------------------------------------------------------------------------

procedure TfrmSettings.chkUseOfficeXPStyleMenuClick(Sender: TObject);
begin
  chkUseGradientMenu.Enabled := chkUseOfficeXPStyleMenu.Checked;
end;

// -----------------------------------------------------------------------------

procedure TfrmSettings.btnSelectAllFormatClick(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to chkLstFormatsToShow.Items.Count-1 do
    if not chkLstFormatsToShow.Checked[i] then
      chkLstFormatsToShow.Checked[i] := True;
end;

// -----------------------------------------------------------------------------

procedure TfrmSettings.btnSelectZeroFormatClick(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to chkLstFormatsToShow.Items.Count-1 do
    if chkLstFormatsToShow.Checked[i] then
      chkLstFormatsToShow.Checked[i] := False;
end;

// -----------------------------------------------------------------------------

procedure TfrmSettings.chkTransparentClick(Sender: TObject);
begin
  chkForceUsingRegions.Enabled := chkTransparent.Checked;
  pnlTransparencyColor.Enabled := chkTransparent.Checked;
  if chkTransparent.Checked then
    subSample.BackgroundColor := pnlSubSample.Color else
    subSample.BackgroundColor := btnBackground.Font.Color;
end;

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmSettings.pnlUnTransColorMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button <> mbLeft then
    TPanel(Sender).Color := TPanel(Sender).Font.Color
  else begin
    dlgSetColor.Color := TPanel(Sender).Color;
    if (dlgSetColor.Execute) then
      TPanel(Sender).Color := dlgSetColor.Color;
  end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmSettings.pnlBorderColorMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button <> mbLeft then
  begin
    TPanel(Sender).Color := TPanel(Sender).Font.Color;
    subSample.BorderColor := TPanel(Sender).Font.Color;
  end else
  begin
    dlgSetColor.Color := TPanel(Sender).Color;
    if (dlgSetColor.Execute) then
      TPanel(Sender).Color := dlgSetColor.Color;
    subSample.BorderColor := TPanel(Sender).Color;
  end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmSettings.pnlShadowColorMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button <> mbLeft then
  begin
    TPanel(Sender).Color := TPanel(Sender).Font.Color;
    subSample.ShadowColor := TPanel(Sender).Font.Color;
  end else
  begin
    dlgSetColor.Color := TPanel(Sender).Color;
    if (dlgSetColor.Execute) then
      TPanel(Sender).Color := dlgSetColor.Color;
    subSample.ShadowColor := TPanel(Sender).Color;
  end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmSettings.pnlSubSampleMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button <> mbLeft then
  begin
    //TPanel(Sender).Color := TPanel(Sender).Font.Color;
    if chkTransparent.Checked = False then
      subSample.BackgroundColor := TPanel(Sender).Font.Color;
    btnBackground.Font.Color := TPanel(Sender).Font.Color;
  end else
    btnBackgroundClick(Sender);
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmSettings.chkAntialiasingClick(Sender: TObject);
begin
  subSample.Antialiased := chkAntialiasing.Checked;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmSettings.rdoTagsModeClick(Sender: TObject);
begin
  //chkWorkWithStyleTags.Enabled := not rdoNoInteractionWithTags.Checked;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmSettings.chkKeepMinDurClick(Sender: TObject);
begin
  chkDontAllowOverlaps.Enabled    := chkKeepMinDur.Checked;
  edtKeepMinDur.Enabled           := chkKeepMinDur.Checked;
  udKeepMinDur.Enabled            := chkKeepMinDur.Checked;
  lblMilliseconds5.Enabled        := chkKeepMinDur.Checked;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmSettings.chkAutoRoundTimeValsClick(Sender: TObject);
begin
  //edtAutoRoundTimeVals.Enabled    := chkAutoRoundTimeVals.Checked;
  //udAutoRoundTimeVals.Enabled     := chkAutoRoundTimeVals.Checked;
  //lblMilliseconds9.Enabled        := chkAutoRoundTimeVals.Checked;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmSettings.pnlTransparencyColorMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button <> mbLeft then
  begin
    TPanel(Sender).Color := TPanel(Sender).Font.Color;
    subSample.BorderColor := TPanel(Sender).Font.Color;
  end else
  begin
    dlgSetColor.Color := TPanel(Sender).Color;
    if (dlgSetColor.Execute) then
      TPanel(Sender).Color := dlgSetColor.Color;
    subSample.TransparentColor := TPanel(Sender).Color;
  end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmSettings.subSampleMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button <> mbLeft then
  begin
    subSample.TextColor := clWhite;
    subSample.Font.Color := subSample.TextColor;
  end else
    btnSubColorClick(Sender);
end;
//added by adenry: end

// -----------------------------------------------------------------------------

end.
