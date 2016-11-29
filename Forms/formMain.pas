// This file is part of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle Workshop's copyright information
// File Description: Main form

unit formMain;

{$WARN UNIT_PLATFORM OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, ExtCtrls, Menus, ComCtrls, IniFiles, ImgList,
    ShellAPI, ClipBrd, URLMon, FileCtrl, Grids, ToolWin, Mask, Math, {XPMan,} RichEdit, SymbolDlg, //Math, RichEdit, XPMan added by adenry
  VirtualTrees, MiMenu, MiSubtitulo, {MiHint,} {NFormSizing,} SWSeekBar, SWButton, USSpeller, SWTimeCounter, TimeMaskEdit, //MiHint, NFormSizing removed by adenry
    IFPS3CompExec, ifpsComp, ifps3,
    ifpii_controls, ifpii_std, ifpii_classes, ifpii_graphics, ifpii_forms, ifpii_stdctrls, ifpii_extctrls, ifpii_menus, ifpidateutils,
    ifpiir_controls, ifpiir_std, ifpiir_classes, ifpiir_graphics, ifpiir_forms, ifpiir_stdctrls, ifpiir_extctrls, ifpiir_menus, ifpidateutilsr,
  StrMan, FastStrings, WinShell, //DirectShow9, //WinShell added by adenry, DirectShow9 removed by adenry
  CommonTypes;

type
  TfrmMain = class(TForm)
    mnuMain: TMainMenu;
    mnuFile: TMenuItem;
    mnuNewSubtitle: TMenuItem;
    mnuLoad: TMenuItem;
    mnuLoadOriginal: TMenuItem;
    mnuLoadTranslated: TMenuItem;
    mnuLoadSubtitle: TMenuItem;
    mnuRecent: TMenuItem;
    N10: TMenuItem;
    mnuClearList: TMenuItem;
    N5: TMenuItem;
    mnuTranslatorSave: TMenuItem;
    mnuSaveOriginal: TMenuItem;
    mnuSaveTranslated: TMenuItem;
    N12: TMenuItem;
    mnuSaveOriginalAs: TMenuItem;
    mnuSaveTranslatedAs: TMenuItem;
    mnuSaveFile: TMenuItem;
    mnuSaveFileAs: TMenuItem;
    N1: TMenuItem;
    mnuClose: TMenuItem;
    mnuExit: TMenuItem;
    mnuEdit: TMenuItem;
    mnuInsertSubtitle: TMenuItem;
    mnuRemoveSelected: TMenuItem;
    N18: TMenuItem;
    mnuCut: TMenuItem;
    mnuCopy: TMenuItem;
    mnuPaste: TMenuItem;
    N3: TMenuItem;
    mnuSelectAll: TMenuItem;
    N13: TMenuItem;
    mnuTimings: TMenuItem;
    mnuSetDurationLimits: TMenuItem;
    mnuSetDelay: TMenuItem;
    mnuAdjustSubtitles: TMenuItem;
    N16: TMenuItem;
    mnuReverseText: TMenuItem;
    mnuSort: TMenuItem;
    mnuTranslatorMode: TMenuItem;
    mnuSearch: TMenuItem;
    mnuSubSearch: TMenuItem;
    mnuFindNext: TMenuItem;
    mnuSearchAndReplace: TMenuItem;
    N6: TMenuItem;
    mnuGoToLineNumber: TMenuItem;
    mnuTools: TMenuItem;
    mnuBatchConvert: TMenuItem;
    N2: TMenuItem;
    mnuSplitSubtitle: TMenuItem;
    mnuJoinSubtitle: TMenuItem;
    N11: TMenuItem;
    mnuInformationAndErrors: TMenuItem;
    mnuAddFPSfromAVI: TMenuItem;
    N7: TMenuItem;
    mnuExternalPreview: TMenuItem;
    mnuZeroFunction: TMenuItem;
    mnuMovie: TMenuItem;
    mnuOpenMovie: TMenuItem;
    mnuCloseMovie: TMenuItem;
    N14: TMenuItem;
    mnuVideoPreviewMode: TMenuItem;
    N9: TMenuItem;
    mnuPlayPause: TMenuItem;
    mnuStop: TMenuItem;
    N15: TMenuItem;
    mnuBack5Sec: TMenuItem;
    mnuFwd5Sec: TMenuItem;
    mnuSettings: TMenuItem;
    mnuSubSettings: TMenuItem;
    mnuOutputSettings: TMenuItem;
    N4: TMenuItem;
    mnuLanguage: TMenuItem;
    mnuHelp: TMenuItem;
    mnuHelpOfProgram: TMenuItem;
    mnuAboutSubtitleWorkshop: TMenuItem;
    N8: TMenuItem;
    mnuCheckForNewVersion: TMenuItem;
    pnlControl: TPanel;
    lblMode: TLabel;
    lblFPS: TLabel;
    lblInputFPS: TLabel;
    lblWorkWith: TLabel;
    cmbFPS: TComboBox;
    cmbInputFPS: TComboBox;
    rdoDuration: TRadioButton;
    rdoFinalTime: TRadioButton;
    rdoBoth: TRadioButton;
    MiMenu: TMiMenu;
    dlgLoadFile: TOpenDialog;
    tmrVideo: TTimer;
    N17: TMenuItem;
    mnuSubtitleToDisplay: TMenuItem;
    mnuDisplayOriginal: TMenuItem;
    mnuDisplayTranslation: TMenuItem;
    mnuPlayback: TMenuItem;
    mnuVidSubtitles: TMenuItem;
    mnuSetShowTime: TMenuItem;
    mnuSetHideTime: TMenuItem;
    N19: TMenuItem;
    mnuStartSubtitle: TMenuItem;
    mnuEndSubtitle: TMenuItem;
    mnuSubtitles: TMenuItem;
    mnuCombineSubtitles: TMenuItem;
    mnuFastSmartLineAdjust: TMenuItem;
    cmbOrgCharset: TComboBox;
    cmbTransCharset: TComboBox;
    mnuAddSyncPoint: TMenuItem;
    mnuLoadProject: TMenuItem;
    N20: TMenuItem;
    mnuSaveProject: TMenuItem;
    N21: TMenuItem;
    mnuTranslation: TMenuItem;
    N22: TMenuItem;
    mnuSwap: TMenuItem;
    N23: TMenuItem;
    mnuExtendLength: TMenuItem;
    mnuStylePopup: TPopupMenu;
    mnuBoldPopup: TMenuItem;
    mnuItalicPopup: TMenuItem;
    mnuUnderlinePopup: TMenuItem;
    mnuTexts: TMenuItem;
    mnuConvertCase: TMenuItem;
    N24: TMenuItem;
    mnuFastUnbreakSubtitles: TMenuItem;
    N25: TMenuItem;
    mnuSetColorPopup: TMenuItem;
    dlgColor: TColorDialog;
    mnuRemoveColorTagsPopup: TMenuItem;
    tmrSaveWork: TTimer;
    N26: TMenuItem;
    mnuReadTimesFromFile: TMenuItem;
    N27: TMenuItem;
    mnuReadTextsFromFile: TMenuItem;
    mnuAdjustToSyncSubs: TMenuItem;
    mnuRightToLeft: TMenuItem;
    mnuFixPunctuation: TMenuItem;
    mnuAdjust: TMenuItem;
    mnuTimeExpanderReducer: TMenuItem;
    mnuPlaybackRate: TMenuItem;
    mnu50P: TMenuItem;
    mnu60P: TMenuItem;
    mnu70P: TMenuItem;
    mnu80P: TMenuItem;
    mnu90P: TMenuItem;
    mnu100P: TMenuItem;
    imgLstMenu: TImageList;
    mnuInfoErrors: TMenuItem;
    N28: TMenuItem;
    mnuRecheckErrors: TMenuItem;
    mnuFixAllErrors: TMenuItem;
    N29: TMenuItem;
    mnuJumpToNextError: TMenuItem;
    mnuInfoErrorsSettings: TMenuItem;
    N30: TMenuItem;
    mnuDeleteUnnecessaryLinks: TMenuItem;
    mnuDivideLines: TMenuItem;
    mnuRewind: TMenuItem;
    N31: TMenuItem;
    mnuForward: TMenuItem;
    mnuSpellCheck: TMenuItem;
    N32: TMenuItem;
    USSpellCheck: TUSSpell;
    mnuSetMaxLineLength: TMenuItem;
    mnuInsertBefore: TMenuItem;
    N33: TMenuItem;
    mnuMarkSelectedSubs: TMenuItem;
    mnuUnMarkSelectedSubs: TMenuItem;
    mnuFixErrorsInSelSubs: TMenuItem;
    mnuAutomaticDurations: TMenuItem;
    mnuSAMILangExtractor: TMenuItem;
    N35: TMenuItem;
    N36: TMenuItem;
    mnuMoveSubtitle: TMenuItem;
    mnuVariousInformation: TMenuItem;
    mnuSubDblClick: TMenuItem;
    mnuJumpToNextLine: TMenuItem;
    mnuJumpToPrevLine: TMenuItem;
    mnuShowLeftPanel: TMenuItem;
    pnlParent2: TPanel;
    pnlParent1: TPanel;
    spSplitter: TSplitter;
    pnlVideo: TPanel;
    pnlVideoControls: TPanel;
    sbSeekBar: TSWSeekBar;
    btnPause: TSWButton;
    btnPlay: TSWButton;
    btnStop: TSWButton;
    btnRew: TSWButton;
    btnForward: TSWButton;
    btnAlterPlaybackRate: TSWButton;
    btnSetShowTime: TSWButton;
    btnSetHideTime: TSWButton;
    btnStartSubtitle: TSWButton;
    btnEndSubtitle: TSWButton;
    btnAddSyncPoint: TSWButton;
    btnScrollList: TSWButton;
    btnPrevSub: TSWButton;
    btnNextSub: TSWButton;
    tcTimeCounter: TSWTimeCounter;
    btnMoveSubtitle: TSWButton;
    pnlVideoDisplay: TPanel;
    subSubtitle: TMiSubtitulo;
    lstSubtitles: TVirtualStringTree;
    mnuEffects: TMenuItem;
    mnuTypeEffect: TMenuItem;
    mnuFlash: TMenuItem;
    mnuFastFlash: TMenuItem;
    mnuMediumFlash: TMenuItem;
    mnuSlowFlash: TMenuItem;
    N37: TMenuItem;
    mnuShowTimeControls: TMenuItem;
    mnuOCRScripts: TMenuItem;
    mnuShiftPlusMS: TMenuItem;
    mnuShiftLessMS: TMenuItem;
    mnuMovieInfo: TMenuItem;
    mnuFastDivideLines: TMenuItem;
    mnuSaveMediaStartupFile: TMenuItem;
    mnuSaveASX: TMenuItem;
    mnuSaveSMIL: TMenuItem;
    N34: TMenuItem;
    mnuUndo: TMenuItem;
    mnuRedo: TMenuItem;
    mnuPascalScripts: TMenuItem;
    psCompExec: TIFPS3CompExec;
    mnu40P: TMenuItem;
    mnu30P: TMenuItem;
    mnu20P: TMenuItem;
    mnu10P: TMenuItem;
    btnSyncPoint1: TSWButton;
    btnSyncPoint2: TSWButton;
    mnuSynchronization: TMenuItem;
    N38: TMenuItem;
    mnuFirstSyncPoint: TMenuItem;
    mnuLastSyncPoint: TMenuItem;
    cmbOCRScripts: TComboBox;
    mnuShowInMainForm: TMenuItem;
    N39: TMenuItem;
    mnuUseInPlaceEdition: TMenuItem;
    mnuShowSubtitles: TMenuItem;
    mnu150P: TMenuItem;
    mnu200P: TMenuItem;
    mnu400P: TMenuItem;
    mnu300P: TMenuItem;
    mnuJumpToNextSub: TMenuItem;
    mnuJumpToPrevSub: TMenuItem;
    mnuShowLinesCount: TMenuItem;
    tmrMouseHide: TTimer;
    sbVolume: TSWSeekBar;
    btnMute: TSWButton;
    btnMute075: TSWButton;
    btnMute050: TSWButton;
    btnMute025: TSWButton;
    btnMute000: TSWButton;
    btnMute100: TSWButton;
    pnlModeRadios: TPanel;
    rdoModeFrames: TRadioButton;
    rdoModeTime: TRadioButton;
    mnuAudioStream: TMenuItem;
    mnuJumpToNextMarked: TMenuItem;
    mnuSaveMarking: TMenuItem;
    mnuJumpToPrevMarked: TMenuItem;
    mnuJumpToPrevError: TMenuItem;
    N40: TMenuItem;
    mnuRemoveAllTagsPopup: TMenuItem;
    N41: TMenuItem;
    mnuShowCPSHintBoxes: TMenuItem;
    mmoNotes: TMemo;
    lblNotes: TLabel;
    mnuShowNotesInLeftPanel: TMenuItem;
    tmrPascalScriptRestoreCursor: TTimer;
    mnuExtendLength2: TMenuItem;
    mnuColumnsPopup: TPopupMenu;
    mnuColNumPopup: TMenuItem;
    mnuColShowPopup: TMenuItem;
    mnuColDurationPopup: TMenuItem;
    mnuColPausePopup: TMenuItem;
    mnuColTextPopup: TMenuItem;
    mnuColTranslationPopup: TMenuItem;
    mnuColHidePopup: TMenuItem;
    N43: TMenuItem;
    mnuDeleteDotsAtBeginning: TMenuItem;
    N44: TMenuItem;
    mnuSetPauses: TMenuItem;
    mnuUnbreakSubtitles: TMenuItem;
    mnuSmartLineAdjust: TMenuItem;
    mnuAutoCombineSubtitles: TMenuItem;
    mnuView: TMenuItem;
    mnuToolbar: TMenuItem;
    tbMainToolBar: TToolBar;
    tbNewSubtitle: TToolButton;
    tbLoadSubtitle: TToolButton;
    tbSaveFile: TToolButton;
    tbSeparator1: TToolButton;
    tbUndo: TToolButton;
    tbRedo: TToolButton;
    tbSeoarator2: TToolButton;
    tbCut: TToolButton;
    tbCopy: TToolButton;
    tbPaste: TToolButton;
    tbSeparator3: TToolButton;
    tbSearch: TToolButton;
    tbSettings: TToolButton;
    tbSeparator6: TToolButton;
    tbSeparator7: TToolButton;
    imgLstMenuDisabled: TImageList;
    mnuUndoDropdown: TPopupMenu;
    mnuRedoDropdown: TPopupMenu;
    tbPascalScripts: TToolButton;
    mnuPascalScriptsDropdown: TPopupMenu;
    mnuRecentDropdown: TPopupMenu;
    tbTexts: TToolButton;
    tbSeparator4: TToolButton;
    tbTimings: TToolButton;
    tbSubtitles: TToolButton;
    tbSeparator5: TToolButton;
    tbTranslatorMode: TToolButton;
    {MiHint: TMiHint;}
    mnuInvertSelection: TMenuItem;
    tbInfoErrors: TToolButton;
    tbVariousInfo: TToolButton;
    tbInfoErrorsSettings: TToolButton;
    tbSeparator8: TToolButton;
    tbVideoPreviewMode: TToolButton;
    mnuTextStyleBars: TMenuItem;
    sbStatusbar: TStatusBar;
    mnuStatusbar: TMenuItem;
    N45: TMenuItem;
    tbSpellCheck: TToolButton;
    tmrSeekbarMouseOver: TTimer;
    pnlEditingControls: TPanel;
    pnlTimingControls: TPanel;
    lblDuration: TLabel;
    lblHide: TLabel;
    lblShow: TLabel;
    lblPause: TLabel;
    tmeShow: TTimeMaskEdit;
    tmeHide: TTimeMaskEdit;
    tmeDuration: TTimeMaskEdit;
    tmePause: TTimeMaskEdit;
    pnlTextControls: TPanel;
    spSplitterEditingControls: TSplitter;
    mmoSubtitleTextOld: TMemo;
    mmoSubtitleText: TRichEdit; //TMemo changed to TRichEdit
    mmoTranslationOld: TMemo;
    mmoTranslation: TRichEdit; //TMemo changed to TRichEdit
    tbTextStyle: TToolBar;
    tbBold: TToolButton;
    tbItalic: TToolButton;
    tbUnderline: TToolButton;
    tbSetColor: TToolButton;
    tbRemoveAllTags: TToolButton;
    tbTransStyle: TToolBar;
    tbBoldTrans: TToolButton;
    tbItalicTrans: TToolButton;
    tbUnderlineTrans: TToolButton;
    tbSetColorTrans: TToolButton;
    tbRemoveAllTagsTrans: TToolButton;
    lblText: TLabel;
    lblTranslation: TLabel;
    lblLines1: TLabel;
    lblTextLines: TLabel;
    lblTranslationLines: TLabel;
    lblLines2: TLabel;
    mnuShowTimeControlButtons: TMenuItem;
    tbShowSnap: TToolBar;
    tbtnShowSnap: TToolButton;
    tbHideSnap: TToolBar;
    tbtnHideSnap: TToolButton;
    tbPauseSet: TToolBar;
    tbtnPauseSet: TToolButton;
    tbDurationSet: TToolBar;
    tbtnDurationSet: TToolButton;
    mnuShiftToNext: TMenuItem;
    mnuShiftToPrevious: TMenuItem;
    mnuInsertSubtitlePopup: TMenuItem;
    mnuInsertBeforePopup: TMenuItem;
    mnuRemoveSelectedPopup: TMenuItem;
    sdSymbolDialogue: TSymbolDlg;
    N42: TMenuItem;
    mnuInsertSymbol: TMenuItem;
    tmrFastTypingUndoBind: TTimer;
    N46: TMenuItem;
    mnuRoundTimeValues: TMenuItem;
    mnuVideoPopup: TPopupMenu;
    mnuToggleFullscreen: TMenuItem;
    mnuResetSubVerticalPos: TMenuItem;
    mnuOpenMoviePopup: TMenuItem;
    mnuCloseMoviePopup: TMenuItem;
    N47: TMenuItem;
    N48: TMenuItem;
    mnuZoomTo100percent: TMenuItem;
    N49: TMenuItem;
    mnuMovieInfoPopup: TMenuItem;
    mnuShowSubtitlesPopup: TMenuItem;
    mnuZoomTo50percent: TMenuItem;
    mnuZoomTo150percent: TMenuItem;
    mnuZoomTo200percent: TMenuItem;
    mnuZoomTo25percent: TMenuItem;
    mnuZoomTo75percent: TMenuItem;
    N50: TMenuItem;
    mnuColumns: TMenuItem;
    mnuColNum: TMenuItem;
    mnuColPause: TMenuItem;
    mnuColShow: TMenuItem;
    mnuColHide: TMenuItem;
    mnuColText: TMenuItem;
    mnuColTranslation: TMenuItem;
    N51: TMenuItem;
    mnuColDuration: TMenuItem;
    N54: TMenuItem;
    pnlCaret: TPanel;
    N52: TMenuItem;
    mnuAudioStreamPopup: TMenuItem;
    N53: TMenuItem;
    N55: TMenuItem;
    N56: TMenuItem;
    mnuVisualSubRepr: TMenuItem;
    tmrTimesMouseWheelUndoBind: TTimer;
    mnuTextTransPopup: TPopupMenu;
    mnuCutPopup: TMenuItem;
    mnuCopyPopup: TMenuItem;
    mnuPastePopup: TMenuItem;
    MenuItem4: TMenuItem;
    mnuItalicPopup2: TMenuItem;
    mnuBoldPopup2: TMenuItem;
    mnuUnderlinePopup2: TMenuItem;
    mnuSetColorPopup2: TMenuItem;
    mnuRemoveColorTagsPopup2: TMenuItem;
    mnuRemoveAllTagsPopup2: TMenuItem;
    mnuDeletePopup: TMenuItem;
    N57: TMenuItem;
    mnuSelectAllPopup: TMenuItem;
    N58: TMenuItem;
    mnuStyle: TMenuItem;
    mnuItalic: TMenuItem;
    mnuBold: TMenuItem;
    mnuUnderline: TMenuItem;
    mnuSetColor: TMenuItem;
    mnuRemoveColorTags: TMenuItem;
    mnuRemoveAllTags: TMenuItem;
    mnuVideoRenderer: TMenuItem;
    mnuDefaultVidRend: TMenuItem;
    mnuVMR9VidRend: TMenuItem;
    mnuVideoRendererPopup: TMenuItem;
    mnuDefaultVidRendPopup: TMenuItem;
    mnuVMR9VidRendPopup: TMenuItem;
    mnuRefreshLanguageFiles: TMenuItem;
    N59: TMenuItem;
    chkOCRScripts: TCheckBox;
    mnuAspectRatio: TMenuItem;
    mnuAROriginal: TMenuItem;
    mnuAR4_3: TMenuItem;
    mnuAR16_9: TMenuItem;
    N60: TMenuItem;
    mnuAR235_1: TMenuItem;
    mnuAR185_1: TMenuItem;
    N61: TMenuItem;
    N62: TMenuItem;
    mnuSubtitleToDisplayPopup: TMenuItem;
    mnuDisplayOriginalPopup: TMenuItem;
    mnuDisplayTranslationPopup: TMenuItem;
    edtPlayerShortcuts: TEdit;
    procedure lstSubtitlesInitNode(Sender: TBaseVirtualTree; ParentNode,
      Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);
    procedure lstSubtitlesFreeNode(Sender: TBaseVirtualTree;
      Node: PVirtualNode);
    procedure lstSubtitlesGetNodeDataSize(Sender: TBaseVirtualTree;
      var NodeDataSize: Integer);
    procedure lstSubtitlesGetText(Sender: TBaseVirtualTree;
      Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
      var CellText: WideString);
    procedure FormCreate(Sender: TObject);
    procedure spSplitterMoved(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure mnuVideoPreviewModeClick(Sender: TObject);
    procedure mnuCloseClick(Sender: TObject);
    procedure mnuLoadSubtitleClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure mnuFileClick(Sender: TObject);
    procedure mnuExitClick(Sender: TObject);
    procedure mnuClearListClick(Sender: TObject);
    procedure lstSubtitlesFocusChanged(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex);
    procedure lstSubtitlesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure mnuOpenMovieClick(Sender: TObject);
    procedure mnuCloseMovieClick(Sender: TObject);
    procedure tmrVideoTimer(Sender: TObject);
    procedure btnPlayClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure mnuPlayPauseClick(Sender: TObject);
    procedure mnuStopClick(Sender: TObject);
    procedure mnuMovieClick(Sender: TObject);
    procedure mnuSubSettingsClick(Sender: TObject);
    procedure rdoDurationClick(Sender: TObject);
    procedure rdoFinalTimeClick(Sender: TObject);
    procedure rdoBothClick(Sender: TObject);
    procedure mnuSaveFileClick(Sender: TObject);
    procedure mnuGoToLineNumberClick(Sender: TObject);
    procedure mnuTranslatorModeClick(Sender: TObject);
    procedure mnuLoadTranslatedClick(Sender: TObject);
    procedure mnuSaveTranslatedClick(Sender: TObject);
    procedure mnuSaveFileAsClick(Sender: TObject);
    procedure mnuSaveTranslatedAsClick(Sender: TObject);
    procedure mmoTransChange(Sender: TObject);
    procedure mmoSubTextChange(Sender: TObject);
    procedure lstSubtitlesDblClick(Sender: TObject);
    procedure mnuDisplayOriginalClick(Sender: TObject);
    procedure mnuDisplayTranslationClick(Sender: TObject);
    procedure lstSubtitlesPaintText(Sender: TBaseVirtualTree; const TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType);
    procedure btnSetShowTimeClick(Sender: TObject);
    procedure btnSetHideTimeClick(Sender: TObject);
    procedure btnStartSubtitleClick(Sender: TObject);
    procedure btnEndSubtitleClick(Sender: TObject);
    procedure mnuInsertSubtitleClick(Sender: TObject);
    procedure mnuRemoveSelectedClick(Sender: TObject);
    procedure lstSubtitlesKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure lstSubtitlesMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure mnuCutClick(Sender: TObject);
    procedure mnuCopyClick(Sender: TObject);
    procedure mnuPasteClick(Sender: TObject);
    procedure mnuZeroFunctionClick(Sender: TObject);
    procedure mnuSortClick(Sender: TObject);
    procedure mnuReverseTextClick(Sender: TObject);
    procedure mnuSetShowTimeClick(Sender: TObject);
    procedure mnuSetHideTimeClick(Sender: TObject);
    procedure mnuStartSubtitleClick(Sender: TObject);
    procedure mnuEndSubtitleClick(Sender: TObject);
    procedure mnuCombineSubtitlesClick(Sender: TObject);
    procedure mnuFastSmartLineAdjustClick(Sender: TObject);
    procedure mnuNewSubtitleClick(Sender: TObject);
    procedure btnAddSyncPointClick(Sender: TObject);
    procedure mnuSelectAllClick(Sender: TObject);
    procedure mnuBack5SecClick(Sender: TObject);
    procedure mnuFwd5SecClick(Sender: TObject);
    procedure mnuSetDurationLimitsClick(Sender: TObject);
    procedure mnuEditClick(Sender: TObject);
    procedure mnuSetDelayClick(Sender: TObject);
    procedure mnuAdjustSubtitlesClick(Sender: TObject);
    procedure mnuSubSearchClick(Sender: TObject);
    procedure mnuSearchClick(Sender: TObject);
    procedure mnuFindNextClick(Sender: TObject);
    procedure mnuSearchAndReplaceClick(Sender: TObject);
    procedure mnuLoadProjectClick(Sender: TObject);
    procedure mnuSaveProjectClick(Sender: TObject);
    procedure mnuBatchConvertClick(Sender: TObject);
    procedure mnuSwapClick(Sender: TObject);
    procedure mnuExtendLengthClick(Sender: TObject);
    procedure mnuSplitSubtitleClick(Sender: TObject);
    procedure mnuBoldClick(Sender: TObject);
    procedure mnuItalicClick(Sender: TObject);
    procedure mnuUnderlineClick(Sender: TObject);
    procedure mnuStylePopupPopup(Sender: TObject);
    procedure mnuConvertCaseClick(Sender: TObject);
    procedure mnuFastUnbreakSubtitlesClick(Sender: TObject);
    procedure mnuSetColorClick(Sender: TObject);
    procedure mnuRemoveColorTagsClick(Sender: TObject);
    procedure mnuToolsClick(Sender: TObject);
    procedure mnuJoinSubtitleClick(Sender: TObject);
    procedure mnuAddFPSfromAVIClick(Sender: TObject);
    procedure mnuInformationAndErrorsClick(Sender: TObject);
    procedure tmrSaveWorkTimer(Sender: TObject);
    procedure cmbInputFPSKeyPress(Sender: TObject; var Key: Char);
    procedure cmbFPSKeyPress(Sender: TObject; var Key: Char);
    procedure mnuReadTimesFromFileClick(Sender: TObject);
    procedure mnuReadTextsFromFileClick(Sender: TObject);
    procedure mnuAdjustToSyncSubsClick(Sender: TObject);
//  procedure lstSubtitlesGetHint(Sender: TBaseVirtualTree;      Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;      var CellText: WideString);  // removed by BDZL
    procedure lstSubtitlesGetHint(Sender: TBaseVirtualTree;      Node: PVirtualNode; Column: TColumnIndex;          var LineBreakStyle: TVTTooltipLineBreakStyle;      var HintText: WideString);
    procedure mnuFixPunctuationClick(Sender: TObject);
    procedure mnuTimeExpanderReducerClick(Sender: TObject);
    procedure mnuAboutSubtitleWorkshopClick(Sender: TObject);
    procedure mnuExternalPreviewClick(Sender: TObject);
    procedure mnuOutputSettingsClick(Sender: TObject);
    procedure pnlVideoDisplayClick(Sender: TObject);
    procedure mnu10PClick(Sender: TObject);
    procedure mnu20PClick(Sender: TObject);
    procedure mnu30PClick(Sender: TObject);
    procedure mnu40PClick(Sender: TObject);
    procedure mnu50PClick(Sender: TObject);
    procedure mnu60PClick(Sender: TObject);
    procedure mnu70PClick(Sender: TObject);
    procedure mnu80PClick(Sender: TObject);
    procedure mnu90PClick(Sender: TObject);
    procedure mnu100PClick(Sender: TObject);
    procedure mnuRecheckErrorsClick(Sender: TObject);
    procedure mnuJumpToNextErrorClick(Sender: TObject);
    procedure mnuFixAllErrorsClick(Sender: TObject);
    procedure mnuInfoErrorsSettingsClick(Sender: TObject);
    procedure cmbOrgCharsetSelect(Sender: TObject);
    procedure cmbTransCharsetSelect(Sender: TObject);
    procedure cmbInputFPSSelect(Sender: TObject);
    procedure cmbFPSSelect(Sender: TObject);
    procedure mnuDeleteUnnecessaryLinksClick(Sender: TObject);
    procedure mnuCheckForNewVersionClick(Sender: TObject);
    procedure mnuDivideLinesClick(Sender: TObject);
    procedure sbSeekBarMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sbSeekBarMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sbSeekBarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btnAlterPlaybackRateClick(Sender: TObject);
    procedure mnuRewindClick(Sender: TObject);
    procedure mnuForwardClick(Sender: TObject);
    procedure btnScrollListClick(Sender: TObject);
    procedure mnuSpellCheckClick(Sender: TObject);
    procedure btnRewMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnForwardMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure mnuHelpOfProgramClick(Sender: TObject);
    procedure tmrSeekRewFFTimer(Sender: TObject);
    procedure btnRewMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnForwardMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure mnuSetMaxLineLengthClick(Sender: TObject);
    procedure mnuInsertBeforeClick(Sender: TObject);
    procedure MarkNode(Node: PVirtualNode; BindUndoToNext: Boolean = False); //added by adenry
    procedure mnuMarkSelectedSubsClick(Sender: TObject);
    procedure UnmarkNode(Node: PVirtualNode; BindUndoToNext: Boolean = False); //added by adenry
    procedure mnuUnMarkSelectedSubsClick(Sender: TObject);
    procedure mnuFixErrorsInSelSubsClick(Sender: TObject);
    procedure mnuAutomaticDurationsClick(Sender: TObject);
    procedure mnuSAMILangExtractorClick(Sender: TObject);
    procedure btnPrevSubClick(Sender: TObject);
    procedure btnNextSubClick(Sender: TObject);
    procedure btnMoveSubtitleClick(Sender: TObject);
    procedure mnuMoveSubtitleClick(Sender: TObject);
    procedure mnuVariousInformationClick(Sender: TObject);
    procedure mnuSubDblClickClick(Sender: TObject);
    procedure mnuJumpToNextLineClick(Sender: TObject);
    procedure mnuJumpToPrevLineClick(Sender: TObject);
    procedure mnuShowLeftPanelClick(Sender: TObject);
    procedure mnuTypeEffectClick(Sender: TObject);
    procedure mnuFastFlashClick(Sender: TObject);
    procedure mnuMediumFlashClick(Sender: TObject);
    procedure mnuSlowFlashClick(Sender: TObject);
    procedure mnuShowTimeControlsClick(Sender: TObject);
    procedure mnuShiftPlusMSClick(Sender: TObject);
    procedure mnuShiftLessMSClick(Sender: TObject);
    procedure mnuMovieInfoClick(Sender: TObject);
    procedure mnuFastDivideLinesClick(Sender: TObject);
    procedure mnuAddSyncPointClick(Sender: TObject);
    procedure tmeShowTimeChangeFromEditOnly(Sender: TObject; NewTime: Cardinal);
    procedure ChangeShowTime(Node: PVirtualNode; NewShowTime: Cardinal; BindUndoToNext: Boolean = False; BindUndoToPrev: Boolean = False; Shift: Boolean = False; UndoActionName: TUndoActionName = uanShowEdit); //added by adenry
    procedure tmeHideTimeChangeFromEditOnly(Sender: TObject; NewTime: Cardinal);
    procedure ChangeHideTime(Node: PVirtualNode; NewHideTime: Cardinal; BindUndoToNext: Boolean = False; BindUndoToPrev: Boolean = False; Shift: Boolean = False; UndoActionName: TUndoActionName = uanHideEdit); //added by adenry
    procedure tmeDurationTimeChangeFromEditOnly(Sender: TObject; NewTime: Cardinal);
    procedure ChangeDuration(Node: PVirtualNode; NewDuration: Cardinal; BindUndoToNext: Boolean = False; BindUndoToPrev: Boolean = False; Shift: Boolean = False); //added by adenry
    procedure lstSubtitlesCreateEditor(Sender: TBaseVirtualTree;
      Node: PVirtualNode; Column: TColumnIndex; out EditLink: IVTEditLink);
    procedure lstSubtitlesEditing(Sender: TBaseVirtualTree;
      Node: PVirtualNode; Column: TColumnIndex; var Allowed: Boolean);
    procedure mnuSaveASXClick(Sender: TObject);
    procedure mnuSaveSMILClick(Sender: TObject);
    procedure mnuUndoClick(Sender: TObject);
    procedure mnuRedoClick(Sender: TObject);
    procedure psCompExecCompile(Sender: TIFPS3CompExec);
    procedure psCompExecExecute(Sender: TIFPS3CompExec);
    procedure psCompExecCompImport(Sender: TObject;
      x: TIFPSPascalCompiler);
    procedure psCompExecExecImport(Sender: TObject; se: TIFPSExec;
      x: TIFPSRuntimeClassImporter);
    procedure psCompExecAfterExecute(Sender: TIFPS3CompExec);
    procedure btnSyncPoint1Click(Sender: TObject);
    procedure btnSyncPoint2Click(Sender: TObject);
    procedure mnuFirstSyncPointClick(Sender: TObject);
    procedure mnuLastSyncPointClick(Sender: TObject);
    procedure cmbOCRScriptsSelect(Sender: TObject);
    procedure mnuShowInMainFormClick(Sender: TObject);
    procedure mnuUseInPlaceEditionClick(Sender: TObject);
    procedure mnuShowSubtitlesClick(Sender: TObject);
    procedure mnu150PClick(Sender: TObject);
    procedure mnu200PClick(Sender: TObject);
    procedure mnu300PClick(Sender: TObject);
    procedure mnu400PClick(Sender: TObject);
    procedure mnuJumpToNextSubClick(Sender: TObject);
    procedure mnuJumpToPrevSubClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lstSubtitlesColumnResize(Sender: TVTHeader;
      Column: TColumnIndex);
    procedure lstSubtitlesAfterColumnWidthTracking(Sender: TVTHeader;
      Column: TColumnIndex);
    procedure lstSubtitlesBeforeColumnWidthTracking(Sender: TVTHeader;
      Column: TColumnIndex; Shift: TShiftState);
    procedure lstSubtitlesBeforeCellPaint(Sender: TBaseVirtualTree;
      TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex;
      CellPaintMode: TVTCellPaintMode; CellRect: TRect;
      var ContentRect: TRect);
    procedure tmeDurationTimeChange(Sender: TObject; NewTime: Cardinal);
    procedure mnuShowLinesCountClick(Sender: TObject);
    procedure pnlVideoDisplayDblClick(Sender: TObject);
    procedure PlayerShortcutsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PlayerShortcutsKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pnlVideoDisplayMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure pnlVideoDisplayMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure tmrMouseHideTimer(Sender: TObject);
    procedure sbVolumeMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sbVolumeMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PlayerShortcutsMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure PlayerShortcutsMouseWheelDown(Sender: TObject;
      Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
    procedure btnMuteClick(Sender: TObject);
    procedure subSubtitleMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure subSubtitleMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure subSubtitleMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure rdoModeClick(Sender: TObject);
    procedure mnuJumpToNextMarkedClick(Sender: TObject);
    procedure mnuSaveMarkingClick(Sender: TObject);
    procedure mnuJumpToPrevErrorClick(Sender: TObject);
    procedure mnuJumpToPrevMarkedClick(Sender: TObject);
    procedure tmeShowMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure tmeShowMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure tmeHideMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure tmeHideMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure tmeDurationMouseWheelDown(Sender: TObject;
      Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
    procedure tmeDurationMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure lstSubtitlesMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure mnuRemoveAllTagsClick(Sender: TObject);
    procedure lstSubtitlesAfterCellPaint(Sender: TBaseVirtualTree;
      TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex;
      CellRect: TRect);
    procedure mnuShowCPSHintBoxesClick(Sender: TObject);
    procedure mnuShowNotesInLeftPanelClick(Sender: TObject);
    procedure tmrPascalScriptRestoreCursorTimer(Sender: TObject);
    procedure mnuExtendLength2Click(Sender: TObject);
    procedure mnuColClick(Sender: TObject);
    procedure mnuColTranslationClick(Sender: TObject);
    procedure mnuDeleteDotsAtBeginningClick(Sender: TObject);
    procedure mnuSetPausesClick(Sender: TObject);
    procedure mnuUnbreakSubtitlesClick(Sender: TObject);
    procedure mnuSmartLineAdjustClick(Sender: TObject);
    procedure mnuAutoCombineSubtitlesClick(Sender: TObject);
    procedure mnuToolbarClick(Sender: TObject);
    procedure tbUndoMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tbRedoMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tbNewSubtitleMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tbLoadSubtitleMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tbSaveFileMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tbCutMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tbCopyMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tbPasteMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tbSearchMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tbSettingsMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tbPascalScriptsMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure mnuUndoDropdownPopup(Sender: TObject);
    procedure mnuUndoDropdownItemClick(Sender: TObject); //added by adenry
    procedure mnuRedoDropdownItemClick(Sender: TObject); //added by adenry
    function GetUndoActionNameString(UndoActionName: TUndoActionName): String;
    procedure mnuRedoDropdownPopup(Sender: TObject);
    procedure tbUndoMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tbRedoMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure mnuRecentDropdownPopup(Sender: TObject);
    procedure tbLoadSubtitleMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure tbTranslatorModeMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure MiHintShowHint(var HintStr: String; var CanShow: Boolean;
      var HintInfo: THintInfo);
    procedure mnuInvertSelectionClick(Sender: TObject);
    procedure tbInfoErrorsMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tbVariousInfoMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tbInfoErrorsSettingsMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure tbVideoPreviewModeMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure mnuTextStyleBarsClick(Sender: TObject);
    procedure tbBoldItalicUnderlineMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tbRemoveAllTagsMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure mmoSubTextMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure mmoSubTextKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tbSetColorMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tbBoldItalicUnderlineTransMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure mmoTransKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mmoTransMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tbSetColorTransMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tbRemoveAllTagsTransMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure mnuStatusbarClick(Sender: TObject);
    procedure sbStatusbarMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tbSpellCheckMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tmePauseTimeChange(Sender: TObject; NewTime: Cardinal);
    procedure tmePauseTimeChangeFromEditOnly(Sender: TObject;
      NewTime: Cardinal);
    procedure ChangePause(Node: PVirtualNode; NewPause: Cardinal; BindUndoToNext: Boolean = False; BindUndoToPrev: Boolean = False); //added by adenry
    procedure tmePauseMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure tmePauseMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure tbTimingsTextsSubtitlesMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tcTimeCounterMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tcTimeCounterMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tcTimeCounterMouseWheelDown(Sender: TObject;
      Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
    procedure tcTimeCounterMouseWheelUp(Sender: TObject;
      Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
    procedure tmeMouseEnter(Sender: TObject);
    procedure tmeMouseLeave(Sender: TObject);
    procedure FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure sbVolumeMouseEnter(Sender: TObject);
    procedure sbVolumeMouseLeave(Sender: TObject);
    procedure sbSeekBarMouseEnter(Sender: TObject);
    procedure sbSeekBarMouseLeave(Sender: TObject);
    procedure tmrSeekbarMouseOverTimer(Sender: TObject);
    procedure spSplitterEditingControlsMoved(Sender: TObject);
    procedure mnuShowTimeControlButtonsClick(Sender: TObject);
    procedure tbtnTimeControlButtonMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tbtnShowSnapMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tbtnPauseSetMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tbtnHideSnapMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tbtnDurationSetMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tbtnShowSnapMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure mnuShiftToNextClick(Sender: TObject);
    procedure mnuShiftToPreviousClick(Sender: TObject);
    procedure mnuInsertSymbolClick(Sender: TObject);
    procedure sdSymbolDialogueInsertSymbol(Sender: TObject; Font: TFont;
      Chr: Char);
    procedure mmoNotesEnter(Sender: TObject);
    procedure mmoSubTextEnter(Sender: TObject);
    procedure mmoTransEnter(Sender: TObject);
    procedure tmrFastTypingUndoBindTimer(Sender: TObject);
    procedure mmoTextTransKeyPress(Sender: TObject; var Key: Char);
    procedure mnuRoundTimeValuesClick(Sender: TObject);
    procedure mnuToggleFullscreenClick(Sender: TObject);
    procedure mnuResetSubVerticalPosClick(Sender: TObject);
    procedure mnuOpenMoviePopupClick(Sender: TObject);
    procedure mnuCloseMoviePopupClick(Sender: TObject);
    procedure mnuMovieInfoPopupClick(Sender: TObject);
    procedure mnuShowSubtitlesPopupClick(Sender: TObject);
    procedure mnuVideoPopupPopup(Sender: TObject);
    procedure mnuZoomTo100percentClick(Sender: TObject);
    procedure mnuZoomTo50percentClick(Sender: TObject);
    procedure mnuZoomTo150percentClick(Sender: TObject);
    procedure mnuZoomTo200percentClick(Sender: TObject);
    procedure pnlVideoDisplayMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure mnuZoomTo25percentClick(Sender: TObject);
    procedure mnuZoomTo75percentClick(Sender: TObject);
    procedure sdSymbolDialogueFormActivate(Sender: TObject);
    procedure sdSymbolDialogueFormDeactivate(Sender: TObject);
    procedure tmeEnter(Sender: TObject);
    procedure sbSeekBarRepaintSeekbar(Sender: TObject; Bitmap: TBitmap);
    procedure mnuVisualSubReprClick(Sender: TObject);
    procedure tmrTimesMouseWheelUndoBindTimer(Sender: TObject);
    procedure mnuDeletePopupClick(Sender: TObject);
    procedure mnuTextTransPopupPopup(Sender: TObject);
    procedure lstSubtitlesChange(Sender: TBaseVirtualTree;
      Node: PVirtualNode);
    procedure lstSubtitlesMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure mmoTranslationExit(Sender: TObject);

    procedure mmoDblClick(Sender: TObject);
    procedure mmoSubtitleTextExit(Sender: TObject);
    procedure mnuDefaultVidRendClick(Sender: TObject);
    procedure mnuVMR9VidRendClick(Sender: TObject);
    procedure mnuRefreshLanguageFilesClick(Sender: TObject);
    procedure chkOCRScriptsClick(Sender: TObject);
    procedure mnuAROriginalClick(Sender: TObject);
    procedure mnuAR4_3Click(Sender: TObject);
    procedure mnuAR16_9Click(Sender: TObject);
    procedure mnuAR235_1Click(Sender: TObject);
    procedure mnuAR185_1Click(Sender: TObject);
    procedure reMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure reMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure lstSubtitlesExit(Sender: TObject);
    procedure lstSubtitlesHeaderDragged(Sender: TVTHeader;
      Column: TColumnIndex; OldPosition: Integer);
    procedure lstSubtitlesHeaderClick(Sender: TVTHeader;
      HitInfo: TVTHeaderHitInfo);
    procedure lstSubtitlesEdited(Sender: TBaseVirtualTree;
      Node: PVirtualNode; Column: TColumnIndex);
    procedure lstSubtitlesEditCancelled(Sender: TBaseVirtualTree;
      Column: TColumnIndex);
  protected
    procedure CreateParams(var Params: TCreateParams); override;
  private
    procedure WMCopyData(var Msg: TWMCOPYDATA); message WM_COPYDATA;
    procedure GetLangs;
    procedure GetOCRScripts;
    procedure GetPascalScripts;
    procedure mnuLanguageClick(Sender: TObject);
    procedure mnuOCRScriptClick(Sender: TObject);
    procedure mnuPascalScriptClick(Sender: TObject);
    procedure SetLanguage(LangFile: String);
    //procedure AppException(Sender: TObject; E: Exception); //moved from here by adenry
    procedure DroppedFile(var Msg: TWMDropFiles); message WM_DROPFILES;
    function GetOrgModified(): Boolean; //by BDZL
    function GetTransModified(): Boolean; //by BDZL
    procedure SetTransModified(const Value: Boolean); //by BDZL
    procedure SetOrgModified(const Value: Boolean); //by BDZL
    procedure CMDialogKey(var AMessage: TCMDialogKey); message CM_DIALOGKEY; //added by adenry
  public
    FormatType     : (ftTime, ftFrames);
    ActualLangFile : String;
    // -----------------//
    //   Loaded files   //
    // -----------------//
    OrgFile       : String;
    OrgFormat     : Integer;
    //OrgModified   : Boolean; //turned into a property by BDZL
    OrgFileModified   : Boolean; //by BDZL
    TransFile     : String;
    TransFormat   : Integer;
    //TransModified : Boolean; //turned into a property by BDZL
    TransFileModified : Boolean; //by BDZL
    OldInputFPS   : Single;
    OldFPS        : Single;
    MovieFile     : String;
    MarkingModified : Boolean; //added by adenry
    // -------------------------//
    // Global boolean variables //
    // -------------------------//
    ConfirmDelete         : Boolean; // Confirm when deleting subtitles
    InvalidFPlainText     : Boolean; // Interpret invalid files as plain text
    AutoSearchMovie       : Boolean; // Autosearch for movie
    ForceWorkWithTime     : Boolean; // Force working in time mode
    KeepOrderOfLines      : Boolean; // Keep order of lines when reverse text
    SelTextNL             : Boolean; // Select text on jump to next line
    SelTextPL             : Boolean; // Select text on jump to previous line
    //TagsNotCounted        : Boolean; // tags still not counted as symbols //added by adenry
    //MultiTagsMode         : Boolean; // multiple tags mode //added by adenry
    //AddCloseTags          : Boolean; // add close tags to unclosed tags //added by adenry
    AskToSave             : Boolean; // Ask to save on exit program/close subtitle
    SaveAsBackup          : Boolean; // Save as backup
    AskToSaveNewSubs      : Boolean; // Ask to save new subtitles //added by adenry
    SaveEmptyLines        : Boolean; // Save empty lines with EMPTY_SUBTITLE text //added by adenry
    MarkUntransSubs       : Boolean; // Mark untranslated subtitles
    MarkUntransSubsBckgr  : Boolean; // Mark untranslated subtitles with background //added by adenry
    ApplyStyleInList      : Boolean; // Apply style to subtitles in the list
    ScrollList            : Boolean; // Scroll list to current subtitle
    // ------------------------
    RFMaxCount : Integer; // Max. number of recent files
    // --------------//
    // Video Preview //
    // --------------//
//    pnlVideoHeight  : Integer; // Height of the video panel
    BackgroundColor : Integer; // Background color of subtitles
    TransparentSubs : Boolean; // Transparent subtitles
    ForceUsingReg   : Boolean; // Force transparency using regions
    MovieFPS        : Double;  // FPS of the movie
    OnDoubleClick   : Byte;    // Action when double click in a subtitle and we are in video preview mode
    OnShiftDblClick : Byte;    // Action when shift-double click in a subtitle and we are in video preview mode
    SecsToJump1     : Byte;    // Seconds to jump on double click
    SecsToJump2     : Byte;    // Seconds to jump on shift-double click
    RewFFTime       : Integer; // Time to rewind/forward
    DefAltPlayRate  : Integer; // Default altered playback rate
    // For the Rew and FF buttons
    tmrSeekRewFF : TTimer;
    Seeking      : Boolean;
    // ----------------//
    // Synchronization //
    // ----------------//
    FirstDialogInVideo : Integer;
    LastDialogInVideo  : Integer;
    SyncPointsArray    : array of TSyncPoint;
    // -------------------//
    //  Search & Replace  //
    // -------------------//
    SearchWord      : String; // String to use with "Find next" menu
    CaseSensitive   : Boolean;
    MatchWholeWords : Boolean;
    // ---------//
    // Advanced //
    // ---------//
    TwoLinesIfLongerThan : Integer;
    ToggleBreakPoint     : Boolean;
    BreakLineAfter       : Integer;
    AdjustAutomatically  : Boolean; //moved here by adenry
    MaxLineLength        : Integer;
    ShiftTime            : Integer;
    DefaultSubDuration   : Integer; //added by adenry
    DefaultSubPause      : Integer; //added by adenry
    // ---------//
    //  Others  //
    // ---------//
    UnTransSubsColor    : Integer;
    UnTransSubsBckgr    : Integer; //added by adenry
    OrgCharset          : TFontCharset; //Integer replaced with TFontCharset by adenry
    TransCharset        : TFontCharset; //Integer replaced with TFontCharset by adenry
    NotesCharset        : TFontCharset; //added by adenry
    AdjustFormOpened    : Boolean;
    frmSaveAsExecuting  : Boolean; //added by adenry - to fix a bug
    SmartResize         : Boolean; //added by adenry
    SmartResizeColumns  : Boolean; //added by adenry
    CellResizeBegun     : Boolean; //added by adenry
    lblCreator          : TLabel; //added by adenry
    SelTransp           : Integer; //added by adenry
    SelTextColor        : Integer; //added by adenry
    AlignLeftLineWithDash:Boolean; //added by adenry
    FullScreen          : Boolean; //added by adenry
    TogglingFullScreen  : Boolean; //added by adenry
    SubFontSize         : Integer; //added by adenry
    SubBorderWidth      : Integer; //added by adenry
    SubShadowWidth      : Integer; //added by adenry
    RelativeFontSize    : Boolean; //added by adenry
    KeepSubOnVideo      : Boolean; //added by adenry
    VertVideoAlign      : Boolean; //added by adenry
    MouseCoords         : TPoint; //added by adenry
    SplitterTop         : Integer; //added by adenry
    ScrollListState     : Boolean; //added by adenry
    fsWindowStyle       : Cardinal; //added by adenry
    UnmuteValue         : Integer; //added by adenry
    subSubtitleDragging : Boolean; //added by adenry
    subSubtitleDownTop  : Integer; //added by adenry
    subSubtitleDownY    : Integer; //added by adenry
    subSubtitleTopShift : Double; //added by adenry
    WasPlaying          : Boolean; //added by adenry
    //VolumeControls      : Boolean; //added by adenry
    FullScreenOnDblClick: Boolean; //added by adenry
    PlayVideoOnLoad     : Boolean; //added by adenry
    MarkingColor                : Integer; //added by adenry
    MarkingBckgr                : Integer; //added by adenry
    MarkingWithColor            : Boolean; //added by adenry
    MarkingWithBckgr            : Boolean; //added by adenry
    MarkingColNum               : Boolean; //added by adenry
    MarkingColPause             : Boolean; //added by adenry later
    MarkingColShow              : Boolean; //added by adenry
    MarkingColHide              : Boolean; //added by adenry
    MarkingColDur               : Boolean; //added by adenry later
    MarkingColText              : Boolean; //added by adenry
    MarkingHighPriority         : Boolean; //added by adenry
    MarkingInVideoPreview       : Boolean; //added by adenry
    MarkingInVideoPreviewColor  : Integer; //added by adenry
    MarkingSave                 : Byte; //added by adenry
    MarkingAutoLoad             : Boolean; //added by adenry
    skipBecauseOfCtrl           : Boolean; //added by adenry
    LockDuration                : Boolean; //added by adenry
    ShowCPSHintBoxes            : Boolean; //added by adenry
    PressedKeyInLstSubtitles    : Byte; //added by adenry
    ColNumDisplayStyle          : Byte; //added by adenry
    ColShowDisplayStyle         : Byte; //added by adenry
    ColHideDisplayStyle         : Byte; //added by adenry
    ColDurDisplayStyle          : Byte; //added by adenry
    ColPauseDisplayStyle        : Byte; //added by adenry
    tmpShortCut                 : TShortCut; //added by adenry
    UndoRedoDropDownItems       : Byte; //added by adenry
    VisualSubReprColor          : TColor; //added by adenry
    TagsHighlightColor          : TColor; //added by adenry
    TagsHighlight               : Boolean; //added by adenry

    AutoRecheckErrors     : Boolean; //added by adenry //moved to formMain
    AutoRecheckOnScripts  : Byte; //added by adenry //moved to formMain

    KeepMinDur            : Boolean; //added by adenry
    KeepMinDurValue       : Word; //added by adenry
    KeepMinDurDontOverlap : Boolean; //added by adenry

    AutoRoundTimeVals     : Boolean; //added by adenry
    RoundingFactor        : Word; //added by adenry
    RoundOnLoad           : Boolean; //added by adenry

    TheLastActiveControl  : TWinControl; //added by adenry
    TempActiveControl     : TWinControl; //added by adenry

    ShiftShowVal          : SmallInt; //added by adenry
    ShiftHideVal          : SmallInt; //added by adenry

    VideoPanelRatio       : Single; //added by adenry
    TextTransColsRatio    : Single; //added by adenry

    ShouldRefreshTimes    : Boolean; //added by adenry
    ShouldRefreshTimes2   : Boolean; //added by adenry

    InPausedVideoPreviewMode    : Boolean; //added by adenry

    //DoNotHighlight        : Boolean; //added by adenry

    UndoNumWhenOrgSaved   : Integer; //added by adenry
    UndoNumWhenTransSaved : Integer; //added by adenry

    FormMainAlwaysOnTop   : Boolean; //added by adenry
    FormMainMaximized     : Boolean; //added by adenry
    FormMainLeft          : Integer; //added by adenry
    FormMainTop           : Integer; //added by adenry
    FormMainWidth         : Integer; //added by adenry
    FormMainHeight        : Integer; //added by adenry
    ColTextWidth          : Integer; //added by adenry
    ColTransWidth         : Integer; //added by adenry

    ClickPoint            : TPoint; //added by adenry

    CursorOverSelBar      : Boolean; //added by adenry
    DblCklickOverSelBar   : Boolean; //added by adenry

    TextTransColsSwapped  : Boolean; //added by adenry

    InterceptTabKey       : Boolean; //added by adenry

    OutputSettingsFormats : array of TOutputSettingsFormats; //added by adenry

    // ----------
    procedure AppException(Sender: TObject; E: Exception); //moved here by adenry
    procedure UpdateRFMenus;
    procedure RefreshTimes;
    procedure AddToRecent(const FileName: String);
    procedure RFMenuClick(Sender: TObject);
    procedure EnableCtrls(const Flag: boolean);
    procedure SetTranslationCtrlsPositions;
    procedure MarkLongLinesInLabel(lbl: TLabel); //added by adenry
    procedure PaintCellBackground(TargetCanvas: TCanvas; CellRect: TRect; Color: TColor); //added by adenry
    procedure UpdateLinesCounter(lbl: TLabel); //added by adenry
    procedure SetLinesLabelsPositions; //added by adenry
    procedure CallLstSubtitlesColumnResize; //added by adenry
    procedure ToggleFullScreen; //added by adenry
    procedure VolumeSet(vol: Integer); //added by adenry
    procedure AutoRecheckNodeErrors(Node: PVirtualNode; ErrorTypesToCheck: TErrorTypeSet = []; RecheckType: TRecheckTypes = rtNormal; FormOnly: Boolean = False); //added by adenry
    procedure AutoRecheckNodeErrorsAndRepaint(Node: PVirtualNode; ErrorTypesToCheck: TErrorTypeSet = []; RecheckType: TRecheckTypes = rtNormal; FormOnly: Boolean = False); //added by adenry later
    procedure AutoRecheckAllErrors(ErrorTypesToCheck: TErrorTypeSet = []); //added by adenry
    procedure RefreshFormInfoErrors; //added by adenry
    procedure RefreshFormVariousInfo; //added by adenry
    procedure ReloadVideo(ASNum: SmallInt = 0); //added by adenry
    procedure mnuAudioStreamNClick(Sender: TObject); //added by adenry
    procedure CenterListOnSelected; //added by adenry
    procedure CenterListOnLastSelected; //added by adenry
    procedure setUndoEnabled(Enabled: Boolean); //added by adenry
    procedure setRedoEnabled(Enabled: Boolean); //added by adenry
    procedure RefreshTagButtonState(openTag, closeTag: String; tb: TToolButton; mmo: TSWTextEdit); //added by adenry //TMemo changed to TSWTextEdit
    procedure SetNodeTag(Node: PVirtualNode; tag, closeTag: String; Translation: Boolean; UndoName: TUndoActionName = uanTextEdit; BindUndoToNext: Boolean = False; ForceSet: Boolean = False); //added by adenry
    procedure SetBoldItalicUnderline(Sender: TObject; mmo: TSWTextEdit); //added by adenry //TMemo changed to TSWTextEdit
    procedure SetNodeColor(Node: PVirtualNode; Color: TColor; Translation: Boolean = False; RemoveOtherColors: Boolean = False; ToggleSetRemove: Boolean = False); //added by adenry
    procedure SetColor(TextColor: Boolean = False; TransColor: Boolean = False; NoDialog: Boolean = False; RemoveOtherColors: Boolean = False; ToggleSetRemove: Boolean = False); //added by adenry
    procedure RemoveNodeTags(Node: PVirtualNode; Translation: Boolean; BindUndoToNext: Boolean = False); //added by adenry
    procedure RemoveAllTags(mmo: TSWTextEdit); //added by adenry //TMemo changed to TSWTextEdit
    procedure RefreshBIUButtons; //added by adenry
    procedure RefreshStatusbar; //added by adenry
    procedure ZoomVideo(Percent: Byte); //added by adenry
    procedure SetColumnVisibility(Col: Byte; Visible: Boolean); //added by adenry
    procedure UpdateCaretPosition; //added by adenry
    function SetHideSelection(Control: TWinControl; HideSelection: Boolean): Boolean; //added by adenry
    procedure GoToLineNumber(Line: Integer); //by BDZL
    procedure UpdateStatusbarWidths; //added by adenry
    procedure SetUntranslatedSubString; //added by adenry
    procedure SpellCheck(Language: Integer = 0); //Language added by adenry
    procedure RepositionTextTrans; //added by adenry
    procedure RestoreTopMostWindows; //added by adenry

    property OrgModified: Boolean read GetOrgModified write SetOrgModified; //by BDZL
    property TransModified: Boolean read GetTransModified write SetTransModified; //by BDZL
  end;

var
  frmMain             : TfrmMain;
  InterfaceEnabled    : Boolean;
  RFMenuItems         : array[0..20] of TMenuItem;
  RFMenuItemsDropdown : array[0..20] of TMenuItem; //added by adenry
  CurrRewOrFF         : Boolean;
  tmrRewFF            : TTimer;
  // Go to line number...
  GoToLineNum  : String;
  EnterLineNum : String;
  // Language strings
  LabelText         : String;
  LabelTranslation  : String;
  TransLeftLines    : String;
  TextOrTransLength : String;
  VolumeHint        : String; //added by adenry
  EnterFullScreen   : String; //added by adenry
  ExitFullScreen    : String; //added by adenry
  NoneAudioStream   : String; //added by adenry
  CustomInfoDelete  : String; //added by adenry
  CustomInfoEdit    : String; //added by adenry
  NSelectedSubtitles: String; //added by adenry
  NSelectedSubtitle : String; //added by adenry
  CharString        : String; //added by adenry
  SecString         : String; //added by adenry
  FrString          : String; //added by adenry
  CPSString         : String; //added by adenry
  FilesRefreshedStr : String; //added by adenry
  KeysStr           : String; //added by adenry
  ManualFile        : String;
  SelectOutputDir   : String;
  ID_PLAINTEXT      : String;
  ID_STPROJECT      : String;
  ID_SRF            : String;
  ShiftMS           : String;
  // Recent files
  RecentFiles       : TStringList;
  // Translator mode
  UntranslatedSub   : String;
  CurrLangUntranslatedSub : String; //added by adenry
  // ---------------
  SyncPoint         : TClassicSyncPoints;

const
  SWindowClassName    = 'SubtitleWorkshop';    //added by adenry
  SJustRestoreSWParam = 'JustRestoreMainForm'; //added by adenry

// -----------------------------------------------------------------------------

implementation

uses
  General, Functions, TreeViewHandle, USubtitlesFunctions, USubtitleAPI, VideoPreview, FileTypes, InfoErrorsFunctions, Undo, ShortCuts, VTInPlaceEdition, PascalScriptsFunctions, OCRScripts,
  formSettings, formSaveAs, formDurationLimits, formAdjustSubtitles, formSetDelay, formSearchAndReplace, formBatchConvert, formSplit, formConvertCase,
    formJoin, formTimeExpanderReducer, formAbout, formOutputSettings, formInfoErrors, formInfoErrorsSettings, formDivideLines, formAutomaticDurations,
    formSAMILangExtractor, formVariousInfo, formSetPauses, formUnbreakSubtitles, formSmartLineAdjust, formCombineSubtitles, formRoundTimeValues;

{$R *.dfm}

// -----------------------------------------------------------------------------

procedure TfrmMain.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  Params.WinClassName := SWindowClassName;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.WMCopyData(var Msg: TWMCOPYDATA);
var
  Arg: String; //added by adenry
begin
  //added by adenry: begin
  //show current instance
  Application.Restore;
  Application.BringToFront;
  //process sent parameters
  if PChar(Msg.CopyDataStruct.lpData) <> SJustRestoreSWParam then
  begin
    SetString(Arg, PChar(Msg.CopyDataStruct.lpData), (Msg.CopyDataStruct.cbData div SizeOf(Char))-1);
    CommandLineProcess(Arg);
  end;
  //added by adenry: end

  //removed by adenry: begin
  //CommandLineProcess(PChar(String(Msg.CopyDataStruct.lpData)));
  //if IsIconic(Application.Handle) = True then
  //  Application.Restore else
  //  Application.BringToFront;
  //removed by adenry: end
end;

// ---------------------------------------------------------------------------//
//                                                                            //
//                      VirtualTreeView Handle Functions                      //
//                                                                            //
// ---------------------------------------------------------------------------//

procedure TfrmMain.lstSubtitlesInitNode(Sender: TBaseVirtualTree; ParentNode,
  Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);
var
  Data: PSubtitleItem;
begin
  if Assigned(Node) then
  begin
    Data             := Sender.GetNodeData(Node);
    Data.InitialTime := 0;
    Data.FinalTime   := 0;
    Data.Text        := '';
    Data.Translation := '';
    Data.ErrorType   := [];
  end;

  //added by adenry: begin
  tbSaveFile.Enabled  := True;
  tbSearch.Enabled    := True;
  tbTimings.Enabled   := True;
  tbTexts.Enabled     := True;
  tbSubtitles.Enabled := True;
  //added by adenry: end
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.lstSubtitlesFreeNode(Sender: TBaseVirtualTree;
  Node: PVirtualNode);
var
  Data: PSubtitleItem;
begin
  Data             := Sender.GetNodeData(Node);
  Data.InitialTime := 0;
  Data.FinalTime   := 0;
  Data.Text        := '';
  Data.Translation := '';
  Data.Marked      := False;
  Data.ErrorType   := [];

  //added by adenry: begin
  if lstSubtitles.TotalCount = 0 then
  begin
    tbSaveFile.Enabled  := False;
    tbSearch.Enabled    := False;
    tbTimings.Enabled   := False;
    tbTexts.Enabled     := False;
    tbSubtitles.Enabled := False;
  end;
  //added by adenry: end
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.lstSubtitlesGetNodeDataSize(Sender: TBaseVirtualTree;
  var NodeDataSize: Integer);
begin
  NodeDataSize := SizeOf(TSubtitleItem);
end;

// -----------------------------------------------------------------------------

//Get subtitles list cell text
procedure TfrmMain.lstSubtitlesGetText(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
  var CellText: WideString);
var
  Data: PSubtitleItem;
  PrevData: PSubtitleItem; //added by adenry
begin
  Data := Sender.GetNodeData(Node);
  if Assigned(Data) then
  begin
    case Column of
      //0: CellText := IntToStr(Node.Index+1); //removed by adenry
      //added by adenry: begin
      //NUM column
      0:
        begin
          CellText := IntToStr(Node.Index+1);
          if ColNumDisplayStyle = 0 then
            while Length(CellText) < Length(IntToStr(lstSubtitles.RootNodeCount)) do
              CellText := '0' + CellText;
        end;
      //added by adenry: end
      //SHOW column
      1:
        begin
          if frmMain.FormatType = ftTime then
          begin
            CellText := TimeToString(Data.InitialTime);
            if ColShowDisplayStyle = 1 then
              CellText := TrimTimeString(CellText);
          end else
            CellText := IntToStr(TimeToFrames(Data.InitialTime, GetInputFPS));

        end;
      //HIDE column
      2:
        begin
          if frmMain.FormatType = ftTime then
          begin
            CellText := TimeToString(Data.FinalTime);
            if ColHideDisplayStyle = 1 then
              CellText := TrimTimeString(CellText);
          end else
            CellText := IntToStr(TimeToFrames(Data.FinalTime, GetInputFPS));
        end;
      //TEXT column
      3: //CellText := StringToWideStringEx(ReplaceEnters(Data.Text, '|'), CharsetToCodePage(OrgCharset)); //removed by adenry
        CellText := StringToWideStringEx(ReplaceEnters(Data.Text, '|'), CharsetToCodePage(OrgCharset)); //added by adenry
      //TRANSLATION column
      4: //CellText := StringToWideStringEx(ReplaceEnters(Data.Translation, '|'), CharsetToCodePage(TransCharset)); //removed by adenry
        CellText := StringToWideStringEx(ReplaceEnters(Data.Translation, '|'), CharsetToCodePage(TransCharset)); //added by adenry: begin
      //added by adenry: begin
      //DURATION column
      5:
        begin
          if frmMain.FormatType = ftTime then
          begin
            CellText := TimeToString(Data.FinalTime - Data.InitialTime);
            if ColDurDisplayStyle = 1 then
              CellText := TrimTimeString(CellText);
          end else
            CellText := IntToStr(TimeToFrames(Data.FinalTime - Data.InitialTime, GetInputFPS));
        end;
      //PAUSE column
      6:
        begin
          PrevData := Sender.GetNodeData(Node.PrevSibling);
          if Assigned(PrevData) then
            if frmMain.FormatType = ftTime then
            begin
              CellText := TimeToString(Data.InitialTime - PrevData.FinalTime);
              if ColPauseDisplayStyle = 1 then
                CellText := TrimTimeString(CellText);
            end else
              CellText := IntToStr(TimeToFrames(Data.InitialTime - PrevData.FinalTime, GetInputFPS));
        end;
      //added by adenry: end
    end;
  end;
end;

// ---------------------------------------------------------------------------//
//                                                                            //
//                             Handle exceptions                              //
//                                                                            //
// ---------------------------------------------------------------------------//

procedure TfrmMain.AppException(Sender: TObject; E: Exception);
begin
  if MsgBox(Format(ErrorMsg[02],[E.ClassName, Sender.ClassName, (Sender as TComponent).Name, E.Message, ID_EMAIL]), BTN_OK, BTN_CANCEL, '', MB_ICONERROR, frmMain) = 2 then
    Application.Terminate;
end;

// ---------------------------------------------------------------------------//
//                                                                            //
//                      Language file related procedures                      //
//                                                                            //
// ---------------------------------------------------------------------------//

//added by adenry: begin
procedure TfrmMain.SetUntranslatedSubString;
var
  OldUntranslatedSub : String;
  Node               : PVirtualNode;
  Data               : PSubtitleItem;
begin
      //set the actual text - either the current language's unstranslated subtitle string, or the english one
      OldUntranslatedSub := UntranslatedSub; //added by adenry
      if (frmMain.Font.Charset = TransCharset) or
        ((frmMain.Font.Charset = ActualDefaultCharset) and (TransCharset = DEFAULT_CHARSET))
      then
        UntranslatedSub := CurrLangUntranslatedSub else
        UntranslatedSub := UNTRANSLATED_SUBTITLE;
      //change the text in all untranslated subtitles
      if OldUntranslatedSub <> '' then
      begin
        Node := lstSubtitles.GetFirst;
        while Assigned(Node) do
        begin
          Data := lstSubtitles.GetNodeData(Node);
          if Data.Translation = OldUntranslatedSub then
            Data.Translation := UntranslatedSub;
          Node := Node.NextSibling;
        end;
        if lstSubtitles.SelectedCount = 1 then
          begin
            Data := lstSubtitles.GetNodeData(lstSubtitles.GetFirstSelected);
            if (Data.Translation = UntranslatedSub) then
              SetSWTextEditText(mmoTranslation, UntranslatedSub);
          end;
      end;
end;
//added by adenry: end

// ---------------------------------------------------------------------------//

procedure TfrmMain.SetLanguage(LangFile: String);
var
  LF                  : TIniFile;
  tmp                 :  String;
  captions            : array[0..10] of String; //added by adenry
begin
  ActualLangFile := LangFile;
  if ExtractFileExt(ActualLangFile) <> '.lng' then
    ActualLangFile := ActualLangFile + '.lng';
  ActualLangFile := ExtractFilePath(Application.ExeName) + 'Langs\' + ActualLangFile;

  LF := TIniFile.Create(ActualLangFile);

  try
    With LF do
    begin
      frmMain.Font.Charset      := ReadInteger('General', 'Font charset', 0);
      tcTimeCounter.FontCharset := frmMain.Font.Charset;
      tcTimeCounter.Text4       := ReadString('General', 'FPS', 'FPS');
      ID_PLAINTEXT              := ReadString('General', 'PlainText', 'Plain Text') + ' (*.txt)|*.txt';
      ID_STPROJECT              := ReadString('General', 'STP', 'Subtitle Translation Project');
      ID_SRF                    := ReadString('General', 'SRF', 'Subtitle Report File') + ' (*.srf)|*.srf';

      //Standart buttons
      BTN_OK     := ReadString('Standard buttons', '01', '&OK');
      BTN_CANCEL := ReadString('Standard buttons', '02', '&Cancel');
      BTN_BROWSE := ReadString('Standard buttons', '03', '&Browse');
      BTN_APPLY  := ReadString('Standard buttons', '04', '&Apply');
      BTN_EXIT   := ReadString('Standard buttons', '05', '&Exit');
      BTN_YES    := ReadString('Standard buttons', '06', '&Yes');
      BTN_NO     := ReadString('Standard buttons', '07', '&No');

      // Go to line...
      GoToLineNum  := ReadString('Go to line', '01', 'Go to line number');
      EnterLineNum := ReadString('Go to line', '02', 'Enter line number:');

      // Standard String
      AllSupportedFiles := ReadString('General', 'AllFiles', 'All supported files');
      AllFiles          := ReadString('General', 'AllTheFiles', 'All files');

      lblMode.Caption := ReadString('Main Form', '01', 'Mode:');
      //added by adenry: begin
      rdoModeTime.Caption := ReadString('Main Form', '02', 'Time (recommended)');
      rdoModeTime.Font.Charset := frmMain.Font.Charset;
      rdoModeFrames.Caption := ReadString('Main Form', '03', 'Frames');
      rdoModeFrames.Font.Charset := frmMain.Font.Charset;
      //added by adenry: end

      lblInputFPS.Caption := ReadString('Main Form', '04', 'Input FPS:');
      lblFPS.Caption      := ReadString('Main Form', '05', 'FPS:');
      lblWorkWith.Caption := ReadString('Main Form', '06', 'Work with:');
      tmp                 := ReadString('Main Form', '07', 'Duration|Hide time|Both');
      rdoDuration.Caption   := Copy(tmp, 1, Pos('|', tmp) - 1);
      rdoFinalTime.Caption  := Copy(tmp, Pos('|', tmp) + 1, SmartPos('|', tmp, True, Pos('|', tmp) + 1) - (Pos('|', tmp) + 1));
      rdoBoth.Caption       := Copy(tmp, SmartPos('|', tmp, True, Pos('|', tmp) + 1) + 1, Length(tmp));

      lstSubtitles.Header.Columns[0].Text := StringToWideStringEx(ReadString('Main Form', '08', 'Num'), CharSetToCodePage(frmMain.Font.Charset));
      lstSubtitles.Header.Columns[1].Text := StringToWideStringEx(ReadString('Main Form', '09', 'Show'), CharSetToCodePage(frmMain.Font.Charset));
      lblShow.Caption                     := ReadString('Main Form', '09', 'Show') + ':';
      lstSubtitles.Header.Columns[2].Text := StringToWideStringEx(ReadString('Main Form', '10', 'Hide'), CharSetToCodePage(frmMain.Font.Charset));
      lblHide.Caption                     := ReadString('Main Form', '10', 'Hide') + ':';
      LabelText                           := ReadString('Main Form', '11', 'Text');
      LabelTranslation                    := ReadString('Main Form', '12', 'Translation');
      TransLeftLines                      := ReadString('Main Form', '13', '%d untranslated lines');
      lblDuration.Caption                 := ReplaceString(ReadString('Main Form', '14', 'Duration'), ':', '') + ':';
      lstSubtitles.Header.Columns[5].Text := StringToWideStringEx(ReadString('Main Form', '14', 'Duration'), CharSetToCodePage(frmMain.Font.Charset));
      //added by adenry: begin
      lblPause.Caption                    := ReadString('Main Form', '19', 'Pause') + ':';
      lstSubtitles.Header.Columns[6].Text := StringToWideStringEx(ReadString('Main Form', '19', 'Pause'), CharSetToCodePage(frmMain.Font.Charset));
      //added by adenry: end
      TextOrTransLength                   := ReadString('Main Form', '15', '%s (%s characters):');
      //UntranslatedSub                     := ReadString('Main Form', '16', UNTRANSLATED_SUBTITLE); //removed by adenry
      CurrLangUntranslatedSub             := ReadString('Main Form', '16', UNTRANSLATED_SUBTITLE); //added by adenry
      //added by adenry: begin
      lblLines1.Caption                   := ReadString('Main Form', '17', 'Lines:');
      lblLines2.Caption := lblLines1.Caption;
      lblNotes.Caption                    := ReadString('Main Form', '18', 'Notes:');
      NSelectedSubtitles                  := ReadString('Main Form', '20', '%d subtitles selected');
      NSelectedSubtitle                   := ReadString('Main Form', '21', '%d / %d');
      //added by adenry: end
      lstSubtitles.Header.Columns[3].Text := StringToWideStringEx(LabelText, CharSetToCodePage(frmMain.Font.Charset));
      lstSubtitles.Header.Columns[4].Text := StringToWideStringEx(LabelTranslation, CharSetToCodePage(frmMain.Font.Charset));
      //added by adenry: begin
      mnuColNum.Caption                   := ReadString('Main Form', '08', 'Num');
      mnuColNumPopup.Caption              := mnuColNum.Caption;
      mnuColShow.Caption                  := ReadString('Main Form', '09', 'Show');
      mnuColShowPopup.Caption             := mnuColShow.Caption;
      mnuColHide.Caption                  := ReadString('Main Form', '10', 'Hide');
      mnuColHidePopup.Caption             := mnuColHide.Caption;
      mnuColText.Caption                  := ReadString('Main Form', '11', 'Text');
      mnuColTextPopup.Caption             := mnuColText.Caption;
      mnuColTranslation.Caption           := ReadString('Main Form', '12', 'Translation');
      mnuColTranslationPopup.Caption      := mnuColTranslation.Caption;
      mnuColDuration.Caption              := ReplaceString(ReadString('Main Form', '14', 'Duration'), ':', '');
      mnuColDurationPopup.Caption         := mnuColDuration.Caption;
      mnuColPause.Caption                 := ReadString('Main Form', '19', 'Pause');
      mnuColPausePopup.Caption            := mnuColPause.Caption;
      CharString                          := ReadString('Information and errors', '96', 'char');
      SecString                           := ReadString('Information and errors', '97', 'sec');
      FrString                            := ReadString('Information and errors', '98', 'fr');
      CPSString                           := ReadString('Information and errors', '99', 'cps');
      //added by adenry: end

      //refresh text labels:
      if Assigned(lstSubtitles.FocusedNode) then
        mmoSubTextChange(frmMain as TObject) else
        begin
          lblText.Caption := LabelText + ':';
          MarkLongLinesInLabel(lblText); //added by adenry
        end;
        if (mnuTranslatorMode.Checked) then
      //refresh translation labels:
      if (mnuTranslatorMode.Checked) then
        if Assigned(lstSubtitles.FocusedNode) then
          mmoTransChange(frmMain as TObject) else
          begin
            lblTranslation.Caption := LabelTranslation + ':';
            MarkLongLinesInLabel(lblTranslation); //added by adenry
          end;

      SetUntranslatedSubString; //added by adenry - change the UNTRANSLATED SUBTITLE string
      UpdateSubSubtitleTextAndVisibility; //added by adenry

      // --------------- //
      //    Main Menu    //
      // --------------- //

      // Header
      captions[0] := ReadString('Main menu header', '01', 'File'); //mnuFile.Caption replaced with captions[0] by adenry
      captions[1] := ReadString('Main menu header', '02', 'Edit'); //mnuEdit.Caption replaced with captions[1] by adenry
      captions[2] := ReadString('Main menu header', '03', 'Search'); //mnuSearch.Caption replaced with captions[2] by adenry
      captions[3] := ReadString('Main menu header', '04', 'Tools'); //mnuTools.Caption replaced with captions[3] by adenry
      captions[4] := ReadString('Main menu header', '05', 'Movie'); //mnuMovie.Caption replaced with captions[4] by adenry
      captions[5] := ReadString('Main menu header', '06', 'Settings'); //mnuSettings.Caption replaced with captions[5] by adenry
      captions[6] := ReadString('Main menu header', '07', 'Help'); //mnuHelp.Caption replaced with captions[6] by adenry
      captions[7] := ReadString('Main menu header', '08', 'View'); //added by adenry

      // --------- //
      // File menu //
      // --------- //
      mnuNewSubtitle.Caption  := ReadString('Main menu/File', '01', 'New subtitle...');
      mnuLoadSubtitle.Caption := ReadString('Main menu/File', '02', 'Load subtitle...');
      mnuRecent.Caption       := ReadString('Main menu/File', '03', 'Recent files');
      mnuClearList.Caption    := ReadString('Main menu/File', '04', 'Clear list');
      //added by adenry: begin
      if Assigned(FindComponent('mnuClearRecemtListDropdown')) then
        TMenuItem(FindComponent('mnuClearRecemtListDropdown')).Caption := mnuClearList.Caption;
      //added by adenry: end
      // Translator mode
      mnuLoad.Caption             := ReadString('Main menu/File', '05', 'Load');
      mnuLoadProject.Caption      := ReadString('Main menu/File', '06', 'Project...');
      mnuLoadOriginal.Caption     := ReadString('Main menu/File', '07', 'Original');
      mnuLoadTranslated.Caption   := ReadString('Main menu/File', '08', 'Translated');
      mnuTranslatorSave.Caption   := ReadString('Main menu/File', '09', 'Save');
      mnuSaveProject.Caption      := mnuLoadProject.Caption;
      mnuSaveOriginal.Caption     := mnuLoadOriginal.Caption;
      mnuSaveTranslated.Caption   := mnuLoadTranslated.Caption;
      mnuSaveOriginalAs.Caption   := ReadString('Main menu/File', '10', 'Original as...');
      mnuSaveTranslatedAs.Caption := ReadString('Main menu/File', '11', 'Translated as...');
      // ------
      mnuSaveFile.Caption   := mnuTranslatorSave.Caption;
      mnuSaveFileAs.Caption := ReadString('Main menu/File', '12', 'Save as...');
      mnuClose.Caption      := ReadString('Main menu/File', '13', 'Close');
      mnuExit.Caption       := ReadString('Main menu/File', '14', 'Exit');
      mnuSaveMarking.Caption:= ReadString('Main menu/File', '15', 'Save marking'); //added by adenry

      // --------- //
      // Edit menu //
      // --------- //
      mnuUndo.Caption           := ReadString('Main menu/Edit', '01', 'Undo');
      mnuRedo.Caption           := ReadString('Main menu/Edit', '02', 'Redo');
      mnuInsertSubtitle.Caption := ReadString('Main menu/Edit', '03', 'Insert subtitle');
      mnuInsertBefore.Caption   := ReadString('Main menu/Edit', '04', 'Insert before');
      mnuRemoveSelected.Caption := ReadString('Main menu/Edit', '05', 'Remove selected');
      mnuCut.Caption            := ReadString('Main menu/Edit', '06', 'Cut');
      mnuCopy.Caption           := ReadString('Main menu/Edit', '07', 'Copy');
      mnuPaste.Caption          := ReadString('Main menu/Edit', '08', 'Paste');
      mnuSelectAll.Caption      := ReadString('Main menu/Edit', '09', 'Select all');
      mnuInvertSelection.Caption:= ReadString('Main menu/Edit', '10', 'Invert selection');
      mnuInsertSymbol.Caption   := ReadString('Main menu/Edit', '11', 'Insert symbol');

      //added by adenry: begin
      // ------------ //
      // Edit/Style //
      // ------------ //
      mnuStyle.Caption           := ReadString('Popup Menu', '08', 'Style');
      mnuItalic.Caption          := ReadString('Popup Menu', '01', 'Italic');
      mnuBold.Caption            := ReadString('Popup Menu', '02', 'Bold');
      mnuUnderline.Caption       := ReadString('Popup Menu', '03', 'Underline');
      mnuSetColor.Caption        := ReadString('Popup Menu', '04', 'Set color');
      mnuRemoveColorTags.Caption := ReadString('Popup Menu', '05', 'Remove color tags');
      mnuRemoveAllTags.Caption   := ReadString('Popup Menu', '06', 'Remove all tags');
      //added by adenry: end

      // ------------ //
      // Edit/Timings //
      // ------------ //
      mnuTimings.Caption             := ReadString('Main menu/Edit/Timings', '01', 'Timings');
      mnuSetDurationLimits.Caption   := ReadString('Main menu/Edit/Timings', '02', 'Set duration limits...');
      mnuSetDelay.Caption            := ReadString('Main menu/Edit/Timings', '03', 'Set delay...');
      mnuAdjust.Caption              := ReadString('Main menu/Edit/Timings', '04', 'Adjust');
      mnuAdjustSubtitles.Caption     := ReadString('Main menu/Edit/Timings', '05', 'Adjust subtitles...');
      mnuAdjustToSyncSubs.Caption    := ReadString('Main menu/Edit/Timings', '06', 'Adjust to synchronized subtitles');
      mnuTimeExpanderReducer.Caption := ReadString('Main menu/Edit/Timings', '07', 'Duration expander/reducer...');
      mnuExtendLength.Caption        := ReadString('Main menu/Edit/Timings', '08', 'Extend length to next');
      mnuAutomaticDurations.Caption  := ReadString('Main menu/Edit/Timings', '09', 'Automatic durations...');
      mnuReadTimesFromFile.Caption   := ReadString('Main menu/Edit/Timings', '10', 'Read timings from file');
      ShiftMS                        := ReadString('Main menu/Edit/Timings', '11', 'Shift %s milliseconds');
      //added by adenry: begin
      mnuExtendLength2.Caption       := ReadString('Main menu/Edit/Timings', '12', 'Extend length to previous');
      mnuSetPauses.Caption           := ReadString('Main menu/Edit/Timings', '13', 'Set Pauses...');
      mnuShiftToNext.Caption         := ReadString('Main menu/Edit/Timings', '14', 'Shift to next');
      mnuShiftToPrevious.Caption     := ReadString('Main menu/Edit/Timings', '15', 'Shift to previous');
      mnuRoundTimeValues.Caption     := ReadString('Main menu/Edit/Timings', '16', 'Round time values...');
      //added by adenry: end

      // ---------- //
      // Edit/Texts //
      // ---------- //
      mnuTexts.Caption                := ReadString('Main menu/Edit/Texts', '01', 'Texts');
      mnuSmartLineAdjust.Caption      := ReadString('Main menu/Edit/Texts', '02', 'Smart line adjust...');
      mnuConvertCase.Caption          := ReadString('Main menu/Edit/Texts', '03', 'Convert case...');
      mnuUnbreakSubtitles.Caption     := ReadString('Main menu/Edit/Texts', '04', 'Unbreak subtitles...');
      mnuDivideLines.Caption          := ReadString('Main menu/Edit/Texts', '05', 'Divide lines...');
      mnuFastDivideLines.Caption      := ReadString('Main menu/Edit/Texts', '06', 'Fast divide lines');
      mnuSetMaxLineLength.Caption     := ReadString('Main menu/Edit/Texts', '07', 'Set maximum line length');
      mnuReadTextsFromFile.Caption    := ReadString('Main menu/Edit/Texts', '08', 'Read texts from file');
      //added by adenry: begin
      mnuFastSmartLineAdjust.Caption  := ReadString('Main menu/Edit/Texts', '09', 'Fast smart line adjust');
      mnuFastUnbreakSubtitles.Caption := ReadString('Main menu/Edit/Texts', '10', 'Fast unbreak subtitles');
      //added by adenry: end

      // -------------- //
      // Edit/Subtitles //
      // -------------- //
      mnuSubtitles.Caption              := ReadString('Main menu/Edit/Subtitles', '01', 'Subtitles');
      mnuCombineSubtitles.Caption       := ReadString('Main menu/Edit/Subtitles', '02', 'Combine subtitles');
      // ---
      mnuEffects.Caption     := ReadString('Main menu/Edit/Subtitles', '03', 'Effects');
      mnuTypeEffect.Caption  := ReadString('Main menu/Edit/Subtitles', '04', 'Type effect');
      mnuFlash.Caption       := ReadString('Main menu/Edit/Subtitles', '05', 'Flash');
      mnuFastFlash.Caption   := ReadString('Main menu/Edit/Subtitles', '06', 'Fast flash');
      mnuMediumFlash.Caption := ReadString('Main menu/Edit/Subtitles', '07', 'Medium flash');
      mnuSlowFlash.Caption   := ReadString('Main menu/Edit/Subtitles', '08', 'Slow flash');
      // ---
      mnuRightToLeft.Caption            := ReadString('Main menu/Edit/Subtitles', '09', 'Right-to-Left');
      mnuReverseText.Caption            := ReadString('Main menu/Edit/Subtitles', '10', 'Reverse text');
      mnuFixPunctuation.Caption         := ReadString('Main menu/Edit/Subtitles', '11', 'Fix punctuation');
      mnuSort.Caption                   := ReadString('Main menu/Edit/Subtitles', '12', 'Sort');
      mnuDeleteUnnecessaryLinks.Caption := ReadString('Main menu/Edit/Subtitles', '13', 'Delete unnecessary links');
      mnuMarkSelectedSubs.Caption       := ReadString('Main menu/Edit/Subtitles', '14', 'Mark selected subtitles');
      mnuUnmarkSelectedSubs.Caption     := ReadString('Main menu/Edit/Subtitles', '15', 'Unmark selected subtitles');
      //added by adenry: begin
      mnuAutoCombineSubtitles.Caption   := ReadString('Main menu/Edit/Subtitles', '16', 'Auto combine subtitles...');
      mnuDeleteDotsAtBeginning.Caption  := ReadString('Main menu/Edit/Subtitles', '17', 'Delete dots at the beginning');
      mnuJumpToNextMarked.Caption       := ReadString('Main menu/Edit/Subtitles', '18', 'Jump to next marked');
      mnuJumpToPrevMarked.Caption       := ReadString('Main menu/Edit/Subtitles', '19', 'Jump to previous marked');
      //added by adenry: end

      // ---------------- //
      // Edit/Translation //
      // ---------------- //
      mnuTranslation.Caption    := ReadString('Main menu/Edit/Translation', '01', 'Translation');
      mnuTranslatorMode.Caption := ReadString('Main menu/Edit/Translation', '02', 'Translator mode');
      mnuSwap.Caption           := ReadString('Main menu/Edit/Translation', '03', 'Swap');

      // --------- //
      // View menu //
      // --------- //
      mnuShowLeftPanel.Caption          := ReadString('Main menu/Settings', '03', 'Show left panel');
      mnuShowTimeControls.Caption       := ReadString('Main menu/Settings', '04', 'Show time controls');
      //added by adenry: begin
      mnuToolbar.Caption                := ReadString('Main menu/View', '01', 'Toolbar');
      mnuTextStyleBars.Caption          := ReadString('Main menu/View', '02', 'Text style bars');
      mnuStatusbar.Caption              := ReadString('Main menu/View', '03', 'Statusbar');
      mnuColumns.Caption                := ReadString('Main menu/View', '04', 'Columns');
      mnuShowNotesInLeftPanel.Caption   := ReadString('Main menu/View', '05', 'Show notes in left panel');
      mnuShowTimeControlButtons.Caption := ReadString('Main menu/View', '06', 'Show time control buttons');
      mnuShowLinesCount.Caption         := ReadString('Main menu/View', '07', 'Show lines count');
      mnuShowLinesCount.Caption         := ReadString('Main menu/View', '07', 'Show lines count');
      mnuVisualSubRepr.Caption          := ReadString('Main menu/View', '08', 'Visual subtitle representation');
      //added by adenry: end

      // ----------- //
      // Search menu //
      // ----------- //
      mnuSubSearch.Caption        := ReadString('Main menu/Search', '01', 'Search...');
      mnuFindNext.Caption         := ReadString('Main menu/Search', '02', 'Find next');
      mnuSearchAndReplace.Caption := ReadString('Main menu/Search', '03', 'Search && Replace...');
      mnuGoToLineNumber.Caption   := ReadString('Main menu/Search', '04', 'Go to line number...');

      // ---------- //
      // Tools menu //
      // ---------- //
      mnuSpellCheck.Caption           := ReadString('Main menu/Tools', '01', 'Spell check');
      mnuBatchConvert.Caption         := ReadString('Main menu/Tools', '02', 'Batch convert...');
      mnuSplitSubtitle.Caption        := ReadString('Main menu/Tools', '03', 'Split subtitle...');
      mnuJoinSubtitle.Caption         := ReadString('Main menu/Tools', '04', 'Join subtitles...');
      mnuInfoErrors.Caption           := ReadString('Main menu/Tools', '05', 'Information and errors');
      mnuInformationAndErrors.Caption := ReadString('Main menu/Tools', '06', 'Information and errors...');
      mnuVariousInformation.Caption   := ReadString('Main menu/Tools', '07', 'Various information...');
      mnuOCRScripts.Caption           := ReadString('Main menu/Tools', '08', 'OCR Scripts');
      chkOCRScripts.Caption           := mnuOCRScripts.Caption; //added by adenry
      mnuShowInMainForm.Caption       := ReadString('Main menu/Tools', '09', 'Show in Main Window');
      mnuInfoErrorsSettings.Caption   := ReadString('Main menu/Tools', '10', 'Settings...');
      mnuRecheckErrors.Caption        := ReadString('Main menu/Tools', '11', 'Recheck errors');
      mnuFixAllErrors.Caption         := ReadString('Main menu/Tools', '12', 'Fix all errors');
      mnuFixErrorsInSelSubs.Caption   := ReadString('Main menu/Tools', '13', 'Fix errors (selected subtitles)');
      mnuJumpToNextError.Caption      := ReadString('Main menu/Tools', '14', 'Jump to next error');
      mnuAddFPSfromAVI.Caption        := ReadString('Main menu/Tools', '15', 'Add FPS from AVI');
      mnuExternalPreview.Caption      := ReadString('Main menu/Tools', '16', 'External preview');
      mnuSAMILangExtractor.Caption    := ReadString('Main menu/Tools', '17', 'SAMI language extractor');
      mnuPascalScripts.Caption        := ReadString('Main menu/Tools', '18', 'Pascal scripts');
      //added by adenry: begin
      mnuJumpToNextError.Caption      := ReadString('Main menu/Tools', '14', 'Jump to next error');
      mnuJumpToPrevError.Caption      := ReadString('Main menu/Tools', '19', 'Jump to previous error');
      mnuShowCPSHintBoxes.Caption     := ReadString('Main menu/Tools', '20', 'Show CPS boxes');
      //added by adenry: end

      // ---------- //
      // Movie menu //
      // ---------- //
      mnuOpenMovie.Caption            := ReadString('Main menu/Movie', '01', 'Open...');
      mnuCloseMovie.Caption           := ReadString('Main menu/Movie', '02', 'Close');
      mnuMovieInfo.Caption            := ReadString('Main menu/Movie', '03', 'Information...');
      mnuVideoPreviewMode.Caption     := ReadString('Main menu/Movie', '04', 'Video preview mode');
      mnuShowSubtitles.Caption        := ReadString('Main menu/Movie', '05', 'Show subtitles');
      mnuSaveMediaStartupFile.Caption := ReadString('Main menu/Movie', '06', 'Save media startup file');
      mnuAudioStream.Caption          := ReadString('Main menu/Movie', '07', 'Audio stream'); //added by adenry
      NoneAudioStream                 := ReadString('Main menu/Movie', '08', 'None'); //added by adenry
      mnuVideoRenderer.Caption        := ReadString('Main menu/Movie', '09', 'Video renderer'); //added by adenry
      mnuDefaultVidRend.Caption       := ReadString('Main menu/Movie', '10', 'Default'); //added by adenry
      mnuVMR9VidRend.Caption          := ReadString('Main menu/Movie', '11', 'VMR9'); //added by adenry

      // -------------- //
      // Movie/Playback //
      // -------------- //
      mnuPlayback.Caption     := ReadString('Main menu/Movie/Playback', '01', 'Playback');
      mnuPlayPause.Caption    := ReadString('Main menu/Movie/Playback', '02', 'Play/Pause');
      mnuStop.Caption         := ReadString('Main menu/Movie/Playback', '03', 'Stop');
      mnuRewind.Caption       := ReadString('Main menu/Movie/Playback', '04', 'Backward');
      mnuForward.Caption      := ReadString('Main menu/Movie/Playback', '05', 'Forward');
      mnuBack5Sec.Caption     := ReadString('Main menu/Movie/Playback', '06', 'Backward 5 seconds');
      mnuFwd5Sec.Caption      := ReadString('Main menu/Movie/Playback', '07', 'Forward 5 seconds');
      mnuPlaybackRate.Caption := ReadString('Main menu/Movie/Playback', '08', 'Playback rate');

      // --------------- //
      // Movie/Subtitles //
      // --------------- //
      mnuVidSubtitles.Caption  := ReadString('Main menu/Movie/Subtitles', '01', 'Subtitles');
      mnuMoveSubtitle.Caption  := ReadString('Main menu/Movie/Subtitles', '02', 'Move subtitle');
      mnuSetShowTime.Caption  := ReadString('Main menu/Movie/Subtitles', '03', 'Set show time');
      mnuSetHideTime.Caption  := ReadString('Main menu/Movie/Subtitles', '04', 'Set hide time');
      mnuStartSubtitle.Caption := ReadString('Main menu/Movie/Subtitles', '05', 'Start subtitle');
      mnuEndSubtitle.Caption   := ReadString('Main menu/Movie/Subtitles', '06', 'End subtitle');

      // --------------------- //
      // Movie/Synchronization //
      // --------------------- //
      mnuSynchronization.Caption := ReadString('Main menu/Movie/Synchronization', '01', 'Synchronization');
      mnuFirstSyncPoint.Caption  := ReadString('Main menu/Movie/Synchronization', '02', 'First sync point');
      mnuLastSyncPoint.Caption   := ReadString('Main menu/Movie/Synchronization', '03', 'Last sync point');
      mnuAddSyncPoint.Caption    := ReadString('Main menu/Movie/Synchronization', '04', 'Add synchronization point');

      // ------------- //
      // Movie/Display //
      // ------------- //
      mnuSubtitleToDisplay.Caption  := ReadString('Main menu/Movie/Display', '01', 'Display');
      mnuDisplayOriginal.Caption    := ReadString('Main menu/Movie/Display', '02', 'Original');
      mnuDisplayTranslation.Caption := ReadString('Main menu/Movie/Display', '03', 'Translation');

      // ------------- //
      // Settings menu //
      // ------------- //
      mnuSubSettings.Caption          := mnuInfoErrorsSettings.Caption;
      mnuOutputSettings.Caption       := ReadString('Main menu/Settings', '01', 'Output settings...');
      mnuLanguage.Caption             := ReadString('Main menu/Settings', '02', 'Language');
      mnuUseInPlaceEdition.Caption    := ReadString('Main menu/Settings', '05', 'Use in-place edition');
      mnuRefreshLanguageFiles.Caption := ReadString('Main menu/Settings', '06', 'Refresh language files'); //added by adenry
      FilesRefreshedStr               := ReadString('Main menu/Settings', '07', 'Files refreshed'); //added by adenry
      KeysStr                         := ReadString('Main menu/Settings', '08', 'keys'); //added by adenry
      // --------- //
      // Help menu //
      // --------- //
      mnuHelpOfProgram.Caption         := captions[6];
      mnuAboutSubtitleWorkshop.Caption := Format(ReadString('Main menu/Help', '01', 'About %s...'), [ID_PROGRAM]);
      mnuCheckForNewVersion.Caption    := ReadString('Main menu/Help', '02', 'Check for new version');

      //added by adenry: begin
      // --------------- //
      //  Toolbar Hints  //
      // --------------- //
      tbNewSubtitle.Hint        := mnuNewSubtitle.Caption;
      tbLoadSubtitle.Hint       := mnuLoadSubtitle.Caption;
      tbSaveFile.Hint           := mnuTranslatorSave.Caption;
      tbUndo.Hint               := mnuUndo.Caption;
      tbRedo.Hint               := mnuRedo.Caption;
      tbCut.Hint                := mnuCut.Caption;
      tbCopy.Hint               := mnuCopy.Caption;
      tbPaste.Hint              := mnuPaste.Caption;
      tbTimings.Hint            := mnuTimings.Caption;
      tbTexts.Hint              := mnuTexts.Caption;
      tbSubtitles.Hint          := mnuSubtitles.Caption;
      tbTranslatorMode.Hint     := mnuTranslatorMode.Caption;
      tbSearch.Hint             := mnuSubSearch.Caption;
      tbPascalScripts.Hint      := mnuPascalScripts.Caption;
      tbSettings.Hint           := mnuInfoErrorsSettings.Caption;
      tbInfoErrorsSettings.Hint := mnuInfoErrorsSettings.Caption + ' (' + mnuInfoErrors.Caption + ')';
      tbSpellCheck.Hint         := mnuSpellCheck.Caption;
      tbInfoErrors.Hint         := mnuInformationAndErrors.Caption;
      tbVariousInfo.Hint        := mnuVariousInformation.Caption;
      tbVideoPreviewMode.Hint   := mnuVideoPreviewMode.Caption;
      //added by adenry: end

      // ----------------------- //
      // lstSubtitles Popup menu //
      // ----------------------- //
      mnuItalicPopup.Caption          := mnuItalic.Caption; //modified by adenry
      mnuBoldPopup.Caption            := mnuBold.Caption; //modified by adenry
      mnuUnderlinePopup.Caption       := mnuUnderline.Caption; //modified by adenry
      mnuSetColorPopup.Caption        := mnuSetColor.Caption; //modified by adenry
      mnuRemoveColorTagsPopup.Caption := mnuRemoveColorTags.Caption; //modified by adenry
      //added by adenry: begin
      mnuRemoveAllTagsPopup.Caption   := mnuRemoveAllTags.Caption;
      mnuInsertSubtitlePopup.Caption  := mnuInsertSubtitle.Caption;
      mnuInsertBeforePopup.Caption    := mnuInsertBefore.Caption;
      mnuRemoveSelectedPopup.Caption  := mnuRemoveSelected.Caption;
      //added by adenry: end

      //added by adenry: begin
      // ------------------------------- //
      // Text and Translation Popup menu //
      // ------------------------------- //
      mnuCutPopup.Caption              := mnuCut.Caption;
      mnuCopyPopup.Caption             := mnuCopy.Caption;
      mnuPastePopup.Caption            := mnuPaste.Caption;
      mnuDeletePopup.Caption           := ReadString('Popup Menu', '07', 'Delete');
      mnuSelectAllPopup.Caption        := mnuSelectAll.Caption;
      mnuItalicPopup2.Caption          := mnuItalicPopup.Caption;
      mnuBoldPopup2.Caption            := mnuBoldPopup.Caption;
      mnuUnderlinePopup2.Caption       := mnuUnderlinePopup.Caption;
      mnuSetColorPopup2.Caption        := mnuSetColorPopup.Caption;
      mnuRemoveColorTagsPopup2.Caption := mnuRemoveColorTagsPopup.Caption;
      mnuRemoveAllTagsPopup2.Caption   := mnuRemoveAllTagsPopup.Caption;
      //added by adenry: end

      //added by adenry: begin
      // --------------------- //
      // Text style bars hints //
      // --------------------- //
      tbItalic.Hint                 := mnuItalicPopup.Caption;
      tbItalicTrans.Hint            := mnuItalicPopup.Caption;
      tbBold.Hint                   := mnuBoldPopup.Caption;
      tbBoldTrans.Hint              := mnuBoldPopup.Caption;
      tbUnderline.Hint              := mnuUnderlinePopup.Caption;
      tbUnderlineTrans.Hint         := mnuUnderlinePopup.Caption;
      tbSetColor.Hint               := mnuSetColorPopup.Caption;
      tbSetColorTrans.Hint          := mnuSetColorPopup.Caption;
      tbRemoveAllTags.Caption       := mnuRemoveAllTagsPopup.Caption;
      tbRemoveAllTags.Hint          := mnuRemoveAllTagsPopup.Caption;
      tbRemoveAllTagsTrans.Caption  := mnuRemoveAllTagsPopup.Caption;
      tbRemoveAllTagsTrans.Hint     := mnuRemoveAllTagsPopup.Caption;
      //added by adenry: end

      //added by adenry: begin
      // -------------------------- //
      // Time control buttons hints //
      // -------------------------- //
      tbtnShowSnap.Hint     := ReadString('Time control buttons hints', '01', 'Move to previous/Extend to previous');
      tbtnHideSnap.Hint     := ReadString('Time control buttons hints', '02', 'Move to next/Extend to next');
      tbtnPauseSet.Hint     := ReadString('Time control buttons hints', '03', 'Set default pause/Set default pause, if pause is too short');
      tbtnDurationSet.Hint  := ReadString('Time control buttons hints', '04', 'Set auto duration/Set min duration');
      //added by adenry: end

      // ------------------------ //
      //    Video Preview Hints   //
      // ------------------------ //
      btnPlay.Hint               := Format(ReadString('Video preview hints', '01', 'Play/Pause (%s)'), [ShortCutToText(mnuPlayPause.ShortCut)]);
      btnPause.Hint              := btnPlay.Hint;
      btnStop.Hint               := Format(ReadString('Video preview hints', '02', 'Stop (%s)'), [ShortCutToText(mnuStop.ShortCut)]);
      btnScrollList.Hint         := ReadString('Video preview hints', '03', 'Toggle scroll list');
      btnPrevSub.Hint            := ReadString('Video preview hints', '04', 'Jump to previous subtitle');
      btnNextSub.Hint            := ReadString('Video preview hints', '05', 'Jump to next subtitle');
      btnRew.Hint                := Format(ReadString('Video preview hints', '06', 'Backward (%s)'), [ShortCutToText(mnuRewind.ShortCut)]);
      btnForward.Hint            := Format(ReadString('Video preview hints', '07', 'Forward (%s)'), [ShortCutToText(mnuForward.ShortCut)]);
      btnAlterPlaybackRate.Hint  := ReadString('Video preview hints', '08', 'Alter playback rate');
      btnMoveSubtitle.Hint       := Format(ReadString('Video preview hints', '09', 'Move subtitle (%s)'), [ShortCutToText(mnuMoveSubtitle.ShortCut)]);
      btnSetShowTime.Hint        := Format(ReadString('Video preview hints', '10', 'Set show time (%s)'), [ShortCutToText(mnuSetShowTime.ShortCut)]);
      btnSetHideTime.Hint        := Format(ReadString('Video preview hints', '11', 'Set hide time (%s)'), [ShortCutToText(mnuSetHideTime.ShortCut)]);
      btnStartSubtitle.Hint      := Format(ReadString('Video preview hints', '12', 'Start subtitle (%s)'), [ShortCutToText(mnuStartSubtitle.ShortCut)]);
      btnEndSubtitle.Hint        := Format(ReadString('Video preview hints', '13', 'End subtitle (%s)'), [ShortCutToText(mnuEndSubtitle.ShortCut)]);
      btnSyncPoint1.Hint         := Format(ReadString('Video preview hints', '14', 'Mark as first sync point (%s)'), [ShortCutToText(mnuFirstSyncPoint.ShortCut)]);
      btnSyncPoint2.Hint         := Format(ReadString('Video preview hints', '15', 'Mark as last sync point (%s)'), [ShortCutToText(mnuLastSyncPoint.ShortCut)]);
      btnAddSyncPoint.Hint       := Format(ReadString('Video preview hints', '16', 'Add subtitle/video synchronization point (%s)'), [ShortCutToText(mnuAddSyncPoint.ShortCut)]);
      //added by adenry:begin
      VolumeHint                 := ReadString('Video preview hints', '17', 'Volume: %d%%');
      sbVolume.Hint              := Format(VolumeHint, [sbVolume.Position]);
      btnMute.Hint               := ReadString('Video preview hints', '18', 'Mute/Unmute');
      // Help file
      HelpFile := ReadString('General', 'Help', 'Manual.html');

      SelectOutputDir := ReadString('Split','19','Output directory:');

      //added by adenry: begin
      // ---------------- //
      // Video popup menu //
      // ---------------- //
      mnuZoomTo25percent.Caption          := Format(ReadString('Video Popup Menu', '03', 'Zoom to %d%%'), [25]);
      mnuZoomTo50percent.Caption          := Format(ReadString('Video Popup Menu', '03', 'Zoom to %d%%'), [50]);
      mnuZoomTo75percent.Caption          := Format(ReadString('Video Popup Menu', '03', 'Zoom to %d%%'), [75]);
      mnuZoomTo100percent.Caption         := Format(ReadString('Video Popup Menu', '03', 'Zoom to %d%%'), [100]);
      mnuZoomTo150percent.Caption         := Format(ReadString('Video Popup Menu', '03', 'Zoom to %d%%'), [150]);
      mnuZoomTo200percent.Caption         := Format(ReadString('Video Popup Menu', '03', 'Zoom to %d%%'), [200]);
      EnterFullScreen                     := ReadString('Video Popup Menu', '01', 'Enter full screen');
      mnuToggleFullscreen.Caption         := EnterFullScreen;
      ExitFullScreen                      := ReadString('Video Popup Menu', '02', 'Exit full screen');
      mnuAspectRatio.Caption              := ReadString('Video Popup Menu', '05', 'Aspect ratio');
      mnuAROriginal.Caption               := ReadString('Video Popup Menu', '06', 'Original');
      mnuAudioStreamPopup.Caption         := mnuAudioStream.Caption;
      mnuVideoRendererPopup.Caption       := mnuVideoRenderer.Caption;
      mnuDefaultVidRendPopup.Caption      := mnuDefaultVidRend.Caption;
      mnuVMR9VidRendPopup.Caption         := mnuVMR9VidRend.Caption;
      mnuResetSubVerticalPos.Caption      := ReadString('Video Popup Menu', '04', 'Reset subtitle vertical position');
      mnuOpenMoviePopup.Caption           := mnuOpenMovie.Caption;
      mnuCloseMoviePopup.Caption          := mnuCloseMovie.Caption;
      mnuShowSubtitlesPopup.Caption       := mnuShowSubtitles.Caption;
      mnuSubtitleToDisplayPopup.Caption   := mnuSubtitleToDisplay.Caption;
      mnuDisplayOriginalPopup.Caption     := mnuDisplayOriginal.Caption;
      mnuDisplayTranslationPopup.Caption  := mnuDisplayTranslation.Caption;
      mnuMovieInfoPopup.Caption           := mnuMovieInfo.Caption;
      //added by adenry: end

      // ------------------------ //
      //      Error messages      //
      // ------------------------ //
      ErrorMsg[01] := ReadString('Error messages', '01', 'Could not initialize Subtitle API. Please download %s from %s and copy it to the "%s" directory.');
      ErrorMsg[02] := ReadString('Error messages', '02', 'The following error (%s) was derived from object %s (%s):||"%s"||Please write to %s informing what you were doing when this error occurred.||Press Ok to continue, and Cancel to exit the program.');
      ErrorMsg[03] := ReadString('Error messages', '03', 'The file "%s" is a bad subtitle or an unsupported format.');
      ErrorMsg[04] := ReadString('Error messages', '04', 'The file "%s" is not in %s format or is not a valid subtitle file.');
      ErrorMsg[05] := ReadString('Error messages', '05', '"%s" is not a valid video file.');
      ErrorMsg[06] := ReadString('Error messages', '06', 'Not a valid line number.');
      ErrorMsg[07] := ReadString('Error messages', '07', 'Select at least one extension to search for.');
      ErrorMsg[08] := ReadString('Error messages', '08', 'The search path does not exist.');
      ErrorMsg[09] := ReadString('Error messages', '09', 'Item number is not a valid item.');
      ErrorMsg[10] := ReadString('Error messages', '10', 'Please add two subtitles or more.');
      ErrorMsg[11] := ReadString('Error messages', '11', 'Failed to connect to server!');
      ErrorMsg[12] := ReadString('Error messages', '12', 'Couldn''t remove the read-only attribute from "%s".||Possibly on a write protected drive.');
      ErrorMsg[13] := ReadString('Error messages', '13', 'Error trying to connect to Microsoft Word!');
      ErrorMsg[14] := ReadString('Error messages', '14', 'Select the video(s) for previous part(s) first!');
      ErrorMsg[15] := ReadString('Error messages', '15', 'Select a valid output directory.');
      ErrorMsg[16] := ReadString('Error messages', '16', 'Select at least one language to extract.');
      ErrorMsg[17] := ReadString('Error messages', '17', '"%s" is not a valid SAMI file.');
      ErrorMsg[18] := ReadString('Error messages', '18', 'Select a subtitle part in the list.');
      ErrorMsg[19] := ReadString('Error messages', '19', 'If you select a movie fragment for one part of the subtitle you need to select a movie fragment for all parts of the subtitle (except the last part of course).');
      ErrorMsg[20] := ReadString('Error messages', '20', 'You need two or more points.');
      //added by adenry: begin
      ErrorMsg[21] := ReadString('Error messages', '21', 'Incorrect regular expression in Custom info %s.');
      ErrorMsg[22] := ReadString('Error messages', '22', 'Custom Info %d was disabled.|Fix the regular expression to enable it.');
      ErrorMsg[23] := ReadString('Error messages', '23', 'Subtitle duration too short!');
      ErrorMsg[24] := ReadString('Error messages', '24', 'Error: can not execute script.');
      ErrorMsg[25] := ReadString('Error messages', '25', 'Error: can not compile script.');
      ErrorMsg[26] := ReadString('Error messages', '26', 'Save the subtitles first.');
      ErrorMsg[27] := ReadString('Error messages', '27', 'The file:|%s|does not exist.');
      ErrorMsg[28] := ReadString('Error messages', '28', 'The file:|%s|is a bad srf file.');
      //added by adenry: end

      // ------------------------ //
      //    Question messages     //
      // ------------------------ //
      QuestionMsg[01] := ReadString('Question messages', '01', 'File "%s" has changed.||Do you want to save the changes?');
      QuestionMsg[02] := ReadString('Question messages', '02', 'File "%s" already exists.||Do you want to replace it?');
      QuestionMsg[03] := ReadString('Question messages', '03', 'Original file ("%s") has changed.||Do you want to save the changes?');
      QuestionMsg[04] := ReadString('Question messages', '04', 'Translated file ("%s") has changed.||Do you want to save the changes?');
      QuestionMsg[05] := ReadString('Question messages', '05', 'The selected subtitles are about to be deleted.||Do you want to proceed?');
      QuestionMsg[06] := ReadString('Question messages', '06', 'Point 1 Subtitle: %s|Point 1 Movie: %s||Point 2 Subtitle: %s|Point 2 Movie: %s||Synchronize subtitle?');
      QuestionMsg[07] := ReadString('Question messages', '07', 'The video player''s exe hasn''t been specified or doesn''t exist.||Do you want to configure external player?');
      QuestionMsg[08] := ReadString('Question messages', '08', 'A new version was found!||Do you want to see the list of changes and download it?');
      QuestionMsg[09] := ReadString('Question messages', '09', 'The file you are trying to save is read-only.||Try to save anyway?');
      QuestionMsg[10] := ReadString('Question messages', '10', 'Do you want to save the marking in a file?');

      // ------------------------ //
      //   Information messages   //
      // ------------------------ //
      InfoMsg[01] := ReadString('Information messages', '01', 'Could''t find more instances of "%s".');
      InfoMsg[02] := ReadString('Information messages', '02', 'No new version available.');
      InfoMsg[03] := ReadString('Information messages', '03', 'Spell check finished.||%d change(s) made.');
      InfoMsg[04] := ReadString('Information messages', '04', 'Too many parts. Resetting...');
      InfoMsg[05] := ReadString('Information messages', '05', 'Only one language was found.||If the file contains more languages, add the ones you wish manually opening the file in a text editor and searching for the correct class name.');
      InfoMsg[06] := ReadString('Information messages', '06', 'Couldn''t locate "STYLE" start and/or close tag!||Probably because of that reason, this file doesn''t contain more than one language.|If it does, try to add manually searching for the class name of the desired language(s).');
      InfoMsg[07] := ReadString('Information messages', '07', 'Fittest font size for playback is: %d');
      InfoMsg[08] := ReadString('Information messages', '08', 'Total replacements: %d');
      InfoMsg[09] := ReadString('Information messages', '09', 'File name: %s|Size: %s|FPS: %s|Duration: %s|Total frames: %d|Resolution: %dx%d|FourCC: %s');
      InfoMsg[10] := ReadString('Information messages', '10', 'Some of the streams of the movie could not be rendered correctly. Probably the audio or video codec is missing.');
      InfoMsg[11] := ReadString('Information messages', '11', 'It is not necessary to set the movie fragment corresponding to the last subtitle.');
      InfoMsg[12] := ReadString('Information messages', '12', 'A sudden error occured:|"%s"');

      // --------------------------------- //
      //  Information and errors messages  //
      // --------------------------------- //
      IEMsgBoxes[01] := ReadString('Information and errors messages', '01', 'Subtitle number %d is an empty subtitle and is about to be deleted.||Do you want to proceed?');
      IEMsgBoxes[02] := ReadString('Information and errors messages', '02', 'Subtitle number %d:||"%s" has a prohibited character and is about to be deleted.||Do you want to proceed?');
      IEMsgBoxes[03] := ReadString('Information and errors messages', '03', 'Subtitle number %d:||"%s" is about to be deleted.||Do you want to proceed?');
      IEMsgBoxes[04] := ReadString('Information and errors messages', '04', 'Part of subtitle number %d:||"%s" is about to be deleted, so the subtitle will be:||"%s"||Do you want to proceed?');
      IEMsgBoxes[05] := ReadString('Information and errors messages', '05', 'Subtitle number %d:||"%s" is a one-line subtitle and starts with "-".||Do you want to delete the "-" at the beginning?');

      // --------------- //
      //  Error reports  //
      // --------------- //
      ErrorReports[01] := ReadString('Information and errors', '16', 'Contains lines without letters');
      ErrorReports[02] := ReadString('Information and errors', '17', 'Empty subtitle');
      // ---
      ErrorReports[03] := ReadString('Information and errors', '18', 'Overlapping with previous subtitle');
      ErrorReports[04] := ReadString('Information and errors', '19', 'Bad values');
      ErrorReports[05] := ReadString('Information and errors', '20', 'Too long duration');
      ErrorReports[06] := ReadString('Information and errors', '21', 'Too short duration');
      ErrorReports[07] := ReadString('Information and errors', '22', 'Too long line(s)');
      ErrorReports[08] := ReadString('Information and errors', '23', 'Over two lines');
      // ---
      ErrorReports[09] := ReadString('Information and errors', '24', 'Hearing impaired');
      ErrorReports[10] := ReadString('Information and errors', '25', 'Has text before colon (":")');
      ErrorReports[11] := ReadString('Information and errors', '26', 'Unnecessary dots');
      ErrorReports[12] := ReadString('Information and errors', '27', 'Contains a prohibited character');
      ErrorReports[13] := ReadString('Information and errors', '28', 'Repeated character');
      ErrorReports[14] := ReadString('Information and errors', '29', 'Repeated subtitle');
      ErrorReports[15] := ReadString('Information and errors', '30', 'OCR error');
      // ---
      ErrorReports[16] := ReadString('Information and errors', '31', 'One line subtitle starts with "-"');
      ErrorReports[17] := ReadString('Information and errors', '32', 'No space after custom character');
      ErrorReports[18] := ReadString('Information and errors', '33', 'No space before custom character');
      ErrorReports[19] := ReadString('Information and errors', '34', 'Unnecessary spaces');
      // ---
      ErrorReports[20] := ReadString('Information and errors', '35', 'Marked subtitle');
      // ---
      ErrorReports[21] := ReadString('Information and errors', '54', 'Unnecessary tags');//added by adenry
      ErrorReports[22] := ReadString('Information and errors', '56', 'Dash on first line');//added by adenry
      ErrorReports[23] := ReadString('Information and errors', '58', 'Too many CPS');//added by adenry
      ErrorReports[24] := ReadString('Information and errors', '60', 'Too short pause');//added by adenry
      ErrorReports[25] := ReadString('Information and errors', '62', 'Dialogue on one line');//added by adenry

      //Custom info
      CustomInfoDelete := ReadString('Custom info', '33', 'Delete'); //added by adenry
      CustomInfoEdit   := ReadString('Custom info', '34', 'Edit'); //added by adenry

    end;
  finally
    LF.Free;
  end;

  LF := TIniFile.Create(ExtractFilePath(Application.ExeName) + ID_ININAME);
  try
    Font.Name := LF.ReadString('Program look', 'Font', 'Tahoma');
    Font.Size := LF.ReadInteger('Program look', 'Font size', 8);
    MiMenu.Fuente.Name            := Font.Name;
    MiMenu.Fuente.Size            := Font.Size;
    MiMenu.Fuente.Charset         := frmMain.Font.Charset;
    lstSubtitles.Header.Font.Size := Font.Size; //added by adenry
    lstSubtitles.Header.Height    := lblMode.Height + (frmMain.lblMode.Left div 2); //added by adenry
    //added by adenry: begin
    //setting the menu captions here fixes a repainting bug when the interface language is changed
    mnuFile.Caption               := captions[0];
    mnuEdit.Caption               := captions[1];
    mnuSearch.Caption             := captions[2];
    mnuTools.Caption              := captions[3];
    mnuMovie.Caption              := captions[4];
    mnuSettings.Caption           := captions[5];
    mnuHelp.Caption               := captions[6];
    mnuView.Caption               := captions[7]; //added later
    //added by adenry: end
    lstSubtitles.ParentFont       := True;
    lstSubtitles.Header.Font      := Font;
    tmeShow.ParentFont            := True;
    tmeHide.ParentFont            := True;
    tmeDuration.ParentFont        := True;
    if tmeDuration.Enabled then //added later
      tmeDurationTimeChange(tmeDuration, tmeDuration.Time); //added by adenry later - refresh tmeDuration, tmeShow, and tmeHide text color
    tmePause.ParentFont           := True; //added by adenry
    if tmePause.Enabled then //added later
      tmePauseTimeChange(tmePause, tmePause.Time); //added by adenry later - refresh tmePause text color
    mmoSubtitleText.ParentFont    := True;
    mmoTranslation.ParentFont     := True;
    mmoNotes.Font.Size            := Font.Size; //added by adenry
    tmeShow.Font.Style            := Font.Style + [fsBold];
    tmeHide.Font.Style            := Font.Style + [fsBold];
    tmeDuration.Font.Style        := Font.Style + [fsBold];
    tmePause.Font.Style           := Font.Style + [fsBold]; //added by adenry
    mmoSubtitleText.Font.Style    := Font.Style + [fsBold];
    mmoTranslation.Font.Style     := Font.Style + [fsBold];
    mmoSubtitleText.Font.Size     := Font.Size + 2;
    mmoTranslation.Font.Size      := Font.Size + 2;
    mmoSubtitleText.Font.Charset  := OrgCharset; //added by adenry to fix a bug
    mmoTranslation.Font.Charset   := TransCharset; //added by adenry to fix a bug
  finally
    LF.Free;
  end;

  //added by adenry: begin
  if Assigned(frmInfoErrors) then
  begin
    frmInfoErrors.CallSetLanguage;
    frmInfoErrors.SetCustomInfosLanguage;
  end;
  if Assigned(frmVariousInfo) then
  begin
    frmVariousInfo.CallSetLanguage;
    if frmVariousInfo.Visible then
      frmVariousInfo.btnRefreshInfoClick(frmMain);
  end;
  //added by adenry: end
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuLanguageClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass; //added by adenry
  try
    SetLanguage((Sender as TMenuItem).Caption);
    (Sender as TMenuItem).Checked := True;
  finally
    Screen.Cursor := crDefault; //added by adenry
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuOCRScriptClick(Sender: TObject);
begin
  OCRDefFile := ExtractFilePath(Application.ExeName) + 'OCRScripts\' + (Sender as TMenuItem).Caption + ID_OCREXT;
  cmbOCRScripts.ItemIndex := cmbOCRScripts.Items.IndexOf(ExtractFileName(Copy(OCRDefFile, 1, Length(OCRDefFile)-4)));
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.GetLangs;
var
  Busca : TSearchRec;
  i     : Integer;
  A     : TMenuItem;
  Langs : TStringList;
begin
  Langs := TStringList.Create;
  try
    i := FindFirst(ExtractFilePath(Application.ExeName) + 'Langs\*.lng', faAnyFile, Busca);
    while i = 0 do
    begin
      Langs.Add(Copy(Busca.Name, 1, Length(Busca.Name)-4));
      i := FindNext(Busca);
    end;
    FindClose(Busca);

    Langs.Sort;
    for i := 0 to Langs.Count-1 do
    begin
      A := TMenuItem.Create(Self);
      A.Caption := Langs[i];
      A.RadioItem := True; //added by adenry
      if Langs[i] = 'English' then A.Default := True; //added by adenry
      A.OnClick := mnuLanguageClick;
      mnuLanguage.Add(a);
    end;
  finally
    Langs.Free;
  end;

  if mnuLanguage.Count = 0 then
  begin
    mnuLanguage.Visible := False;
    N4.Visible          := False;
  end else
  begin
    mnuLanguage.Visible := True;
    N4.Visible          := True;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.GetOCRScripts;
var
  Busca   : TSearchRec;
  i       : Integer;
  A       : TMenuItem;     
  Scripts : TStringList;
begin
  Scripts := TStringList.Create;
  try
    i := FindFirst(ExtractFilePath(Application.ExeName) + 'OCRScripts\*' + ID_OCREXT, faAnyFile, Busca);
    while i = 0 do
    begin
      Scripts.Add(Copy(Busca.Name, 1, Length(Busca.Name)-4));
      i := FindNext(Busca);
    end;
    FindClose(Busca);

    Scripts.Sort;
    for i := 0 to Scripts.Count-1 do
    begin
      A := TMenuItem.Create(Self);
      A.Caption    := Scripts[i];
      A.OnClick    := mnuOCRScriptClick;
      A.RadioItem  := True;
      A.GroupIndex := 1;
      A.AutoCheck  := True;
      mnuOCRScripts.Add(A);
    end;
    cmbOCRScripts.Items.Assign(Scripts);
  finally
    Scripts.Free;
  end;

  if mnuOCRScripts.Count = 0 then
    mnuOCRScripts.Visible := False else
    mnuOCRScripts.Visible := True;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.GetPascalScripts;
var
  Busca   : TSearchRec;
  i       : Integer;
  A, B    : TMenuItem; //B added by adenry
  Scripts : TStringList;
begin
  Scripts := TStringList.Create;
  try
    i := FindFirst(ExtractFilePath(Application.ExeName) + 'PascalScripts\*.pas', faAnyFile, Busca);
    while i = 0 do
    begin
      Scripts.Add(Copy(Busca.Name, 1, Length(Busca.Name)-4));
      i := FindNext(Busca);
    end;
    FindClose(Busca);

    Scripts.Sort;
    for i := 0 to Scripts.Count-1 do
    begin
      A := TMenuItem.Create(Self);
      A.Caption    := Scripts[i];
      A.OnClick    := mnuPascalScriptClick;
      mnuPascalScripts.Add(A);
      //added by adenry: begin
      B := TMenuItem.Create(Self);
      B.Caption    := Scripts[i];
      B.OnClick    := mnuPascalScriptClick;
      mnuPascalScriptsDropdown.Items.Add(B);
      //added by adenry: end
    end;
  finally
    Scripts.Free;
  end;

  if mnuPascalScripts.Count = 0 then
    mnuPascalScripts.Visible := False else
    mnuPascalScripts.Visible := True;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.EnableCtrls(const Flag: boolean);
begin
  lblMode.Enabled         := Flag;
  rdoModeTime.Enabled     := Flag; //added by adenry
  rdoModeFrames.Enabled   := Flag; //added by adenry
  lblFPS.Enabled          := Flag;
  cmbFPS.Enabled          := Flag;
  lblWorkWith.Enabled     := Flag;
  rdoDuration.Enabled     := Flag;
  rdoFinalTime.Enabled    := Flag;
  rdoBoth.Enabled         := Flag;
  cmbOrgCharset.Enabled   := Flag;
  cmbTransCharset.Enabled := (Flag) and (mnuTranslatorMode.Checked);

  lstSubtitles.Enabled    := Flag;
  lblShow.Enabled         := Flag;
  tmeShow.Enabled         := Flag;
  lblHide.Enabled         := Flag;
  tmeHide.Enabled         := Flag;
  lblDuration.Enabled     := Flag;
  tmeDuration.Enabled     := Flag;
  lblPause.Enabled        := Flag; //added by adenry
  tmePause.Enabled        := False; //added by adenry
  lblText.Enabled         := Flag;
  mmoSubtitleText.Enabled := Flag;
  lblTextLines.Enabled    := Flag; //added by adenry
  lblLines1.Enabled       := Flag; //added by adenry

  tbtnShowSnap.Enabled      := False; //added by adenry
  tbtnHideSnap.Enabled      := Flag; //added by adenry
  tbtnPauseSet.Enabled      := False; //added by adenry
  tbtnDurationSet.Enabled   := Flag; //added by adenry

  if mnuTranslatorMode.Checked then
  begin
    mmoTranslation.Enabled      := Flag;
    lblTranslation.Enabled      := Flag;
    lblTranslationLines.Enabled := Flag; //added by adenry
    lblLines2.Enabled           := Flag; //added by adenry
  end;

  InterfaceEnabled := Flag;

  if Flag = True then
  begin
    if rdoDuration.Checked then
    begin
      lblHide.Enabled     := False;
      tmeHide.Enabled     := False;
      lblDuration.Enabled := True;
      tmeDuration.Enabled := True;
    end else
    if rdoFinalTime.Checked then
    begin
      lblHide.Enabled     := True;
      tmeHide.Enabled     := True;
      lblDuration.Enabled := False;
      tmeDuration.Enabled := False;
    end else
    if rdoBoth.Checked then
    begin
      lblHide.Enabled     := True;
      tmeHide.Enabled     := True;
      lblDuration.Enabled := True;
      tmeDuration.Enabled := True;
    end;
    if frmMain.Visible = False then
      frmMain.Show;
    lstSubtitles.SetFocus;
  end//;

  //added by adenry: begin
  else begin
    tbUndo.Enabled := Flag;
    tbRedo.Enabled := Flag;
    //tbCut.Enabled  := Flag;
    //tbCopy.Enabled := Flag;
    //tbPaste.Enabled:= Flag;
  end;
  tbSaveFile.Enabled      := Flag;
  tbSearch.Enabled        := Flag;
  //tbPascalScripts.Enabled := Flag;
  tbTimings.Enabled       := Flag;
  tbTexts.Enabled         := Flag;
  tbSubtitles.Enabled     := Flag;
  tbSpellCheck.Enabled    := Flag;
  //added by adenry: end

end;

// ---------------------------------------------------------------------------//
//                                                                            //
//                                Drag & Drop                                 //
//                                                                            //
// ---------------------------------------------------------------------------//

procedure TfrmMain.DroppedFile(var Msg: TWMDropFiles);
var
  FileName : array[0..MAX_PATH] of Char;
  Ext      : String;
  lnkInfo  : TShellLinkInfo; //added by adenry
  i        : Integer; //added by adenry
begin
  try
    if DragQueryFile(Msg.Drop, 0, FileName, MAX_PATH) > 0 then
    begin
      Ext := LowerCase(ExtractFileExt(FileName));

      //added by adenry: begin
      //check for shortcut file
      if (Ext = '.lnk') then
      begin
        GetShellLinkInfo(FileName, lnkInfo);
        FileName := '';
        for i := 0 to Length(lnkInfo.PathName)-1 do
          FileName[i] := lnkInfo.PathName[i+1];
        Ext := LowerCase(ExtractFileExt(FileName));
      end;
      //added by adenry: end

      if (Ext = ID_STPEXT) then // Subtitle translation project
        LoadProject(FileName) else
      if (Ext = ID_SRFEXT) then // URUSoft Subtitle Report file
        LoadSRF(FileName) else
      // Video/audio file
      //if (Ext = '.asf') or (Ext = '.avi') or (Ext = '.avs') or (Ext = '.divx')or (Ext = '.flv') or (Ext = '.m1v') or (Ext = '.mov') or (Ext = '.mp3') or (Ext = '.mp4') or (Ext = '.mpeg')or (Ext = '.mpg') or (Ext = '.mkv') or (Ext = '.ogg') or (Ext = '.ogm') or (Ext = '.qt')  or (Ext = '.vob') or (Ext = '.wav') or (Ext = '.wmv') then //.avs by BDZL, .mov and .flv added by adenry //removed by adenry
      if VideoAudioExts.IndexOf(Copy(Ext, 2, MaxInt)) >= 0 then //added by adenry
      begin
        //AudioStreamNum := 0; //added by adenry
        if LoadMovie(FileName) = False then
          MsgBox(Format(ErrorMsg[05], [FileName]), BTN_OK, '', '', MB_ICONERROR, frmMain) else
        begin
          if mnuVideoPreviewMode.Checked = False then
            SetVideoPreviewMode(True);
        end;
      end else
      begin // Subtitle file
        if (OrgFile = '') or (mnuTranslatorMode.Checked = False) then
          LoadSubtitle(FileName, GetInputFPS) else
          LoadSubtitle(FileName, GetFPS, 0, True);
      end;
      Msg.Result := 0;
    end;
  finally
    DragFinish(Msg.Drop);
  end;
end;

// ---------------------------------------------------------------------------//
//                                                                            //
//                       Refresh times & texts function                       //
//                                                                            //
// ---------------------------------------------------------------------------//

procedure TfrmMain.RefreshTimes;
var
  Data  : PSubtitleItem;
  Data2 : PSubtitleItem; //added by adenry
  s     : Integer;
begin
if not FullScreen then //added by adenry //this also fixes a fullscreen problem
begin
  if (lstSubtitles.SelectedCount > 0) then
  //MORE THAN 0 SUBTITLES SELECTED
  begin
    //added by adenry: begin
    tmeShow.Enabled := True;
    if rdoDuration.Checked = False then //added by adenry later
      tmeHide.Enabled := True;
    if rdoFinalTime.Checked = False then //added by adenry later
      tmeDuration.Enabled := True;
    tbtnDurationSet.Enabled := True; //adde by adenry later

    if (lstSubtitles.SelectedCount = 1)
    //and (Assigned(lstSubtitles.FocusedNode)) and (lstSubtitles.Selected[lstSubtitles.FocusedNode]) //removed by adenry
    then
    //1 SUBTITLE SELECTED
    begin
      if lstSubtitles.FocusedNode <> lstSubtitles.GetFirstSelected then //added by adenry
        lstSubtitles.FocusedNode := lstSubtitles.GetFirstSelected; //added by adenry

      mmoSubtitleText.Enabled := True;
      mmoTranslation.Enabled := True;

      Data := lstSubtitles.GetNodeData(lstSubtitles.FocusedNode);
      if Assigned(Data) then
      begin
        s := mmoSubtitleText.SelStart;
        //mmoSubtitleText.Text := Data.Text; //removed by adenry
        SetSWTextEditText(mmoSubtitleText, Data.Text); //added by adenry to properly handle RichEdit Text
        mmoSubtitleText.SelStart := s;
        if mnuTranslatorMode.Checked then
        begin
          s := mmoTranslation.SelStart;
          //mmoTranslation.Text := Data.Translation; //removed by adenry
          SetSWTextEditText(mmoTranslation, Data.Translation); //added by adenry to properly handle RichEdit Text
          mmoTranslation.SelStart := s;
        end;
        tmeShow.Time     := Data.InitialTime;
        tmeHide.Time     := Data.FinalTime;
        tmeDuration.Time := Data.FinalTime - Data.InitialTime;
      end;

      //Pause control and related stuff:
      Data2 := lstSubtitles.GetNodeData(lstSubtitles.FocusedNode.PrevSibling);
      if Assigned(Data2) then
      begin
        tmePause.Enabled := True;
        tmePause.Time := Data.InitialTime - Data2.FinalTime;
        tbtnShowSnap.Enabled      := True; //added by adenry later
        tbtnPauseSet.Enabled      := True; //added by adenry later
      end else
      begin
        tmePause.Clear;
        tmePause.Font.Color := clWindowText;
        tmePause.Color := clWindow;
        tmePause.Enabled := False;
        tbtnShowSnap.Enabled      := False; //added by adenry later
        tbtnPauseSet.Enabled      := False; //added by adenry later
      end;
      //added by adenry: end
      tbtnHideSnap.Enabled := Assigned(lstSubtitles.FocusedNode.NextSibling);
    end else
    //added by adenry: begin
    //MORE THAN 1 SUBTITLES SELECTED
    begin
      mmoSubtitleText.Clear;
      mmoSubtitleText.Enabled := False;
      mmoTranslation.Clear;
      mmoTranslation.Enabled := False;
      lblText.Caption := LabelText + ':';
      MarkLongLinesInLabel(lblText);
      lblTranslation.Caption := LabelTranslation + ':';
      MarkLongLinesInLabel(lblTranslation);
      tmePause.Enabled := True;
      tbtnShowSnap.Enabled := True;
      tbtnPauseSet.Enabled := True;
      tbtnHideSnap.Enabled := True;

      tmePause.Time := GetPause(lstSubtitles.GetFirstSelected);
      tmeShow.Time := GetStartTime(lstSubtitles.GetFirstSelected);
      tmeHide.Time := GetFinalTime(GetLastSelected);
      tmeDuration.Time := tmeHide.Time - tmeShow.Time;
    end;
    //added by adenry: end
  end else
  //0 SUBTITLES SELECTED
  begin
    //if tmeShow.Text <> '' then //added by adenry - we just deselected. clear and disable controls only this time. //removed later by adenry - it breaks controls refresh when we close a subtitle
    //begin
      tmeShow.Clear;
      tmeShow.Font.Color := clWindowText; //added by adenry later
      tmeShow.Color := clWindow;//added by adenry
      tmeHide.Clear;
      tmeHide.Font.Color := clWindowText; //added by adenry later
      tmeHide.Color := clWindow;//added by adenry
      tmeDuration.Clear;
      tmeDuration.Font.Color := clWindowText; //added by adenry later
      tmeDuration.Color := clWindow;//added by adenry
      tmePause.Clear; //added by adenry
      tmePause.Font.Color := clWindowText; //added by adenry later
      tmePause.Color := clWindow; //added by adenry
      //added by adenry: begin
      //repaint controls - necessary when using XP manifest, but breaks mouse wheel action
      //tmeShow.Hide;
      //tmeShow.Show;
      //tmeHide.Hide;
      //tmeHide.Show;
      //tmeDuration.Hide;
      //tmeDuration.Show;
      //tmePause.Hide;
      //tmePause.Show;
      //added by adenry: end

      mmoSubtitleText.Clear;
      lblText.Caption := LabelText + ':';
      MarkLongLinesInLabel(lblText); //added by adenry
      if mnuTranslatorMode.Checked then
      begin
        mmoTranslation.Clear;
        lblTranslation.Caption := LabelTranslation + ':';
        MarkLongLinesInLabel(lblTranslation); //added by adenry
      end;

      //added by adenry later: begin
      mmoSubtitleText.Enabled := False;
      mmoTranslation.Enabled  := False;
      tmeShow.Enabled         := False;
      tmeHide.Enabled         := False;
      tmeDuration.Enabled     := False;
      tmePause.Enabled        := False;
      tbtnShowSnap.Enabled    := False;
      tbtnPauseSet.Enabled    := False;
      tbtnHideSnap.Enabled    := False;
      tbtnDurationSet.Enabled := False;
      //added by adenry later: end
    //end;
  end;

  //added by adenry: begin
  //toolbar related stuff...
  {
  if lstSubtitles.SelectedCount >0 then
  begin
    tbCut.Enabled   := True;
    tbCopy.Enabled  := True;
  end else
  if tbCut.Tag = 0 then //disable the buttons unless we are in the middle of a CUT or PASTE operation!
  begin
    tbCut.Enabled   := False;
    tbCopy.Enabled  := False;
  end;
  }
  tbPaste.Enabled := (ClipBoard.HasFormat(CF_TEXT));// and (InterfaceEnabled);
  //added by adenry: end

  RefreshBIUButtons; //added by adenry - refresh text style bar buttons...
  RefreshStatusbar; //added by adenry
  if mnuVisualSubRepr.Checked then
    sbSeekbar.Repaint; //added by adenry to refresh subtitles graphical representation
end;
end;

// ---------------------------------------------------------------------------//
//                                                                            //
//                            Recent files related                            //
//                                                                            //
// ---------------------------------------------------------------------------//

procedure TfrmMain.RFMenuClick(Sender: TObject);
var
  i   : Integer;
  Ext : String;
begin
  for i := 0 to High(RFMenuItems) do
    if (RFMenuItems[i] = Sender) or (RFMenuItemsDropdown[i] = Sender) then //(RFMenuItemsDropdown[i] = Sender) added by adenry
    begin
      Ext := LowerCase(ExtractFileExt(RecentFiles[i]));
      if (Ext = ID_STPEXT) then // Subtitle Translation Project
        LoadProject(RecentFiles[i]) else
      begin
        if (mnuTranslatorMode.Checked) and (OrgFile <> '') then
          LoadSubtitle(RecentFiles[i], GetInputFPS, 0, True) else
          LoadSubtitle(RecentFiles[i], GetInputFPS);
      end;
      break;
    end;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.UpdateRFMenus;
var
  i: Integer;
begin
  for i := Low(RFMenuItems) to High(RFMenuItems) do
  begin
    with RFMenuItems[i] do
    begin
      if i < RecentFiles.Count then
      begin
        if i < RFMaxCount then
        begin
          Visible := True;
          Caption := '&' + IntToStr(i+1) + ' ' + RecentFiles[i];
        end else
        begin
          Visible := False;
          Caption := '';
        end;
      end
      else
        Visible := False;
    end;
    //added by adenry: begin
    RFMenuItemsDropdown[i].Caption := RFMenuItems[i].Caption;
    RFMenuItemsDropdown[i].Visible := RFMenuItems[i].Visible;
    //added by adenry: end
  end;
  if MiMenu.Activo then
    MiMenu.Activo := True;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.AddToRecent(const FileName: String);
var
  i: Integer;
begin
  for i := RecentFiles.Count-1 downto 0 do
    if AnsiCompareFileName(FileName, RecentFiles[i]) = 0 then
      RecentFiles.Delete(i);
  RecentFiles.Insert(0, FileName);
  UpdateRFMenus;
end;

// ---------------------------------------------------------------------------//
//                                                                            //
//           Form Create - Load all settings & initialize variables           //
//                                                                            //
// ---------------------------------------------------------------------------//

procedure TfrmMain.FormCreate(Sender: TObject);
var
  Ini       : TIniFile;
  i         : Integer;
  NewItem   : TMenuItem;
  TextAlign : TTextAlign;
  StringList: TStringList; //added by adenry
begin
  Application.OnException := AppException; // Procedure to handle exceptions
  Application.OnShowHint := MiHintShowHint; //added by adenry

  if mmoSubtitleText.ClassName = TRichEdit.ClassName then //added by adenry //if TSWTextEdit.InheritsFrom(TRichEdit) then
  begin
    TExtRichEdit(mmoSubtitleText).OnDblClick := mmoDblClick; //by BDZL
    TExtRichEdit(mmoTranslation).OnDblClick := mmoDblClick; //by BDZL
  end;

  // ---------------------------//
  //   Initialize SubtitleAPI   //
  // ---------------------------//

  Ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + '\' + ID_ININAME);
  try
    GetLangs;
    GetPascalScripts;
    GetOCRScripts;
    SetLanguage(Ini.ReadString('Language', 'Language', 'English'));
    //added by adenry: begin
    for i := 0 to mnuLanguage.Count - 1 do
      if mnuLanguage.Items[i].Caption = Copy(ExtractFileName(ActualLangFile), 0, Length(ExtractFileName(ActualLangFile))-4) then
      begin
        mnuLanguage.Items[i].Checked := True;
        break;
      end;
    //added by adenry: end

    ReadSetShortcuts;

    // ---------------------------------//
    //    Initialize SubtitleAPI DLL    //
    // ---------------------------------//
    SubtitleAPI := TSubtitleAPI.Create(ExtractFilePath(Application.ExeName) + ID_DLLDIR + '\' +ID_DLLNAME);

    if SubtitleAPI.Initialized = False then
    begin
      MsgBox(Format(ErrorMsg[01], [ID_DLLNAME, ID_WEBPAGE, ExtractFilePath(Application.ExeName) + ID_DLLDIR]), BTN_EXIT, '', '', MB_ICONERROR, Self);
      SubtitleAPI.Free;
      Ini.Free;
      ExitProcess(0);
    end;

    // ---------------------------//
    //    Initialize variables    //
    // ---------------------------//
    Caption               := ID_PROGRAM;
    DecimalSeparator      := ',';
    OrgFile               := '';
    TransFile             := '';
    MovieFile             := '';
    SearchWord            := '';
    OldInputFPS           := 0;
    OldFPS                := 0;
    IniRoot               := ExtractFilePath(Application.ExeName) + '\' + ID_ININAME;
    FormatType            := ftTime;
    RecentFiles           := TStringList.Create;
    FirstDialogInVideo    := -1;
    LastDialogInVideo     := -1;
    sbSeekBar.Position    := 0;
    dlgLoadFile.Filter    := SubtitleAPI.FillDialogFilter(AllSupportedFiles) + ID_SRF + '|' + ID_PLAINTEXT;
    AdjustFormOpened      := False;
    SetLength(frmMain.SyncPointsArray, 0);
    EnableCtrls(False);
    AddFPS(cmbInputFPS);
    AddFPS(cmbFPS);
    // Edit boxes FPS
    OldFPS          := GetFPS;
    tmeShow.FPS     := OldFPS;
    tmeHide.FPS     := OldFPS;
    tmeDuration.FPS := OldFPS;
    tmePause.FPS    := OldFPS; //added by adenry

    //added by adenry: begin
    //Video and Audio extensions lists:
    StringList      := TStringList.Create;
    VideoExts       := TStringList.Create;
    AudioExts       := TStringList.Create;
    VideoAudioExts  := TStringList.Create;
    for i := 1 to Length(VideoExtsGroups) do
    begin
      SplitDelimitedString(',', VideoExtsGroups[i][2], StringList);
      VideoExts.AddStrings(StringList);
      VideoAudioExts.AddStrings(StringList);
    end;
    for i := 1 to Length(AudioExtsGroups) do
    begin
      SplitDelimitedString(',', AudioExtsGroups[i][2], StringList);
      AudioExts.AddStrings(StringList);
      VideoAudioExts.AddStrings(StringList);
    end;
    StringList.Free;
    //added by adenry: end

    AddCharsets(cmbOrgCharset);
    AddCharsets(cmbTransCharset);

    tmeShow.Clear;
    tmeHide.Clear;
    tmeDuration.Clear;
    tmePause.Clear; //added by adenry

    pnlVideoDisplay.ParentBackground := False; //added by adenry
    pnlCaret.ParentBackground := False; //added by adenry

    rdoModeTime.Checked := True; //added by adenry

    // Undo and redo lists
    UndoList        := TList.Create;
    RedoList        := TList.Create;
    setUndoEnabled(False);//modified by adenry //mnuUndo.Enabled := False;
    setRedoEnabled(False); //modified by adenry //mnuRedo.Enabled := False;

    mnuShowInMainForm.Checked := Ini.ReadBool('General', 'Show OCR Scripts in main form', True);
    mnuShowInMainFormClick(Sender); //added by adenry
    chkOCRScripts.Checked     := Ini.ReadBool('General', 'Enable OCR Scripts', True); //added by adenry

    frmSaveAsExecuting  := False; //added by adenry
    CellResizeBegun     := False; //added by adenry
    FullScreen          := False; //added by adenry
    TogglingFullScreen  := False; //added by adenry

    InPausedVideoPreviewMode  := False; //added by adenry

    ShouldRefreshTimes  := False; //added by adenry
    ShouldRefreshTimes2 := False; //added by adenry

    InterceptTabKey     := False; //added by adenry

    //DoNotHighlight      := False; //added by adenry

    UndoNumWhenOrgSaved      := 0; //added by adenry
    UndoNumWhenTransSaved    := 0; //added by adenry

    PressedKeyInLstSubtitles := 0; //added by adenry

    CursorOverSelBar := False; //added by adenry
    DblCklickOverSelBar := False; //added by adenry

    Screen.Cursors[crHandPoint]:= LoadCursor(0, IDC_HAND); //added by adenry - use Windows' hand cursor instead of Delphi's

    // --------------------------------- //
    //            Recent Files           //
    // --------------------------------- //

    // We read the maximum, default value is 10
    RFMaxCount := Ini.ReadInteger('Settings','MaxRF',10);
    // Create all the menus
    for i := High(RFMenuItems) downto 0 do
    begin
      NewItem         := TMenuItem.Create(Self);
      NewItem.OnClick := RFMenuClick;
      mnuRecent.Insert(0,NewItem);
      RFMenuItems[i]  := NewItem;
      //added by adenry: begin
      //Toolbar button dropdown list items
      NewItem         := TMenuItem.Create(Self);
      NewItem.OnClick := RFMenuClick;
      mnuRecentDropdown.Items.Add(NewItem);
      RFMenuItemsDropdown[High(RFMenuItems)-i] := NewItem;
      //added by adenry: end
    end;
    //added by adenry: begin
    //Toolbar button dropdown list items
    NewItem := TMenuItem.Create(Self);
    NewItem.Caption := '-';
    mnuRecentDropdown.Items.Add(NewItem);
    NewItem := TMenuItem.Create(Self);
    NewItem.Caption := mnuClearList.Caption;
    NewItem.OnClick := mnuClearList.OnClick;
    NewItem.Name    := 'mnuClearRecemtListDropdown';
    NewItem.Default := True;
    mnuRecentDropdown.Items.Add(NewItem);
    //added by adenry: end

    // Add recent files from ini to the TStringList
    AddRecentFiles;
    UpdateRFMenus;

    // --------------------------------- //
    //      Window position & size       //
    // --------------------------------- //
    Position := poDesigned;
    Left     := Ini.ReadInteger('Main Window', 'Left', (Screen.Width div 2) - (frmMain.Width div 2));
    Top      := Ini.ReadInteger('Main Window','Top', (Screen.Height div 2) - (frmMain.Height div 2));
    Width    := Ini.ReadInteger('Main Window','Width', 724);
    Height   := Ini.ReadInteger('Main Window','Height', 605); //405 changed to 605 by adenry
    if Ini.ReadBool('Main Window', 'Maximized', False) then //True changed to False by adenry
      WindowState := wsMaximized else
      WindowState := wsNormal;
    //added by adenry: begin
    VideoPanelRatio := Ini.ReadFloat('Main Window','VPRatio', 0.5);
    //added by adenry: end

    // --------------------------------- //
    //              General              //
    // --------------------------------- //

    // Read last folder
    dlgLoadFile.InitialDir := Ini.ReadString('General', 'Last folder', '');

    if Ini.ReadBool('Settings','Always on top',False) then
    begin
      SetWindowPos(frmMain.Handle, HWND_TOPMOST, frmMain.Left, frmMain.Top, frmMain.Width, frmMain.Height, SWP_NOMOVE + SWP_NOSIZE);
      FormMainAlwaysOnTop := True; //added by adenry
    end else //; replaced with else by adenry - bug fix
    begin
      SetWindowPos(frmMain.Handle, HWND_NOTOPMOST, frmMain.Left, frmMain.Top, frmMain.Width, frmMain.Height, SWP_NOMOVE + SWP_NOSIZE);
      FormMainAlwaysOnTop := False; //added by adenry
    end;

    case Ini.ReadInteger('General', 'Work with', 3) of
      1: rdoDuration.Checked := True;
      2: rdoFinalTime.Checked := True else
      rdoBoth.Checked := True;
    end;

    // --------------------------------- //
    //              Charsets             //
    // --------------------------------- //
    cmbOrgCharset.ItemIndex       := Ini.ReadInteger('General', 'Original charset', 1); //0 changed to 1 by adenry - DEFAULT instead of ANSI
    cmbTransCharset.ItemIndex     := Ini.ReadInteger('General', 'Translated charset', 1); //0 changed to 1 by adenry - DEFAULT instead of ANSI
    OrgCharset                    := StrCharsetToInt(cmbOrgCharset.Items[cmbOrgCharset.ItemIndex]);
    TransCharset                  := StrCharsetToInt(cmbTransCharset.Items[cmbTransCharset.ItemIndex]);
    mmoSubtitleText.Font.Charset  := OrgCharset;
    mmoTranslation.Font.Charset   := TransCharset;
    if Ini.ReadBool('Settings', 'Show charsets in main form', True) then
    begin
      //frmMain.cmbOCRScripts.Top := 288; //removed by adenry
      chkOCRScripts.Top := cmbTransCharset.Top + cmbTransCharset.Height + 3; //added by adenry
      cmbOrgCharset.Show;
      cmbTransCharset.Show;
    end else
    begin
      //frmMain.cmbOCRScripts.Top := frmMain.cmbOrgCharset.Top; //removed by adenry
      chkOCRScripts.Top := cmbOrgCharset.Top; //added by adenry
      cmbOrgCharset.Hide;
      cmbTransCharset.Hide;
    end;
    cmbOCRScripts.Top := chkOCRScripts.Top + chkOCRScripts.Height; //added by adenry
    SendMessage(cmbOCRScripts.Handle, CB_SETDROPPEDWIDTH, pnlParent2.Left, 0); //widen the dropdown size a bit //added by adenry

    //added by adenry: begin
    ActualDefaultCharset := GetActualDefaultCharset;
    DashCharsets1 := [ANSI_CHARSET, GREEK_CHARSET, TURKISH_CHARSET, VIETNAMESE_CHARSET, HEBREW_CHARSET, ARABIC_CHARSET, BALTIC_CHARSET, RUSSIAN_CHARSET, EASTEUROPE_CHARSET, THAI_CHARSET]; //contain a dash in #150, and #151
    if ActualDefaultCharset in DashCharsets1 then DashCharsets1 := DashCharsets1 + [DEFAULT_CHARSET];
    DashCharsets2 := [ANSI_CHARSET, GREEK_CHARSET, TURKISH_CHARSET, VIETNAMESE_CHARSET, HEBREW_CHARSET, ARABIC_CHARSET, BALTIC_CHARSET, RUSSIAN_CHARSET, EASTEUROPE_CHARSET]; //contain a dash in #150, #151, and #173
    if ActualDefaultCharset in DashCharsets2 then DashCharsets2 := DashCharsets2 + [DEFAULT_CHARSET];
    Dashes := SetDashes(OrgCharset);

    NotesCharset          := StrCharsetToInt(cmbOrgCharset.Items[Ini.ReadInteger('General', 'Notes charset', 1)]); //0 changed to 1 later
    mmoNotes.Font.Charset := NotesCharset;
    mmoNotes.Text         := ReplaceString(Ini.ReadString('General', 'Notes', ''), '|', #13#10);
    dlgColor.Color        := Ini.ReadInteger('General', 'Tag Color', $0000DFDF); //default is yellow
    //added by adenry: end

    // --------------------------------- //
    //        Particular settings        //
    // --------------------------------- //
    ConfirmDelete        := Ini.ReadBool('Settings', 'Confirm when deleting a subtitle', False);
    InvalidFPlainText    := Ini.ReadBool('Settings', 'Interpret invalid files as plain text', False);
    AutoSearchMovie      := Ini.ReadBool('Settings', 'Autosearch for movie', True);
    ForceWorkWithTime    := Ini.ReadBool('Settings', 'Force working in time mode', False);
    KeepOrderOfLines     := Ini.ReadBool('Settings', 'Keep order of lines when reverse text', True);
    SelTextNL            := Ini.ReadBool('Settings', 'Select text on jump to next line', True);
    SelTextPL            := Ini.ReadBool('Settings', 'Select text on jump to previous line', True);
    RFMaxCount           := Ini.ReadInteger('Settings', 'MaxRF', 10);

    // Tags settings
    //SubtitleAPI.WorkWithTags          := Ini.ReadBool('Settings', 'Work with style tags', True); //removed by adenry
    //added by adenry: begin
    SubtitleAPI.NoInteractionWithTags := Ini.ReadInteger('Settings', 'Tags mode', 2) = 1;
    SubtitleAPI.MultiTagsMode         := Ini.ReadInteger('Settings', 'Tags mode', 2) = 2;
    SubtitleAPI.SingleTagsMode        := Ini.ReadInteger('Settings', 'Tags mode', 2) = 3;
    SubtitleAPI.WorkWithTags          := SubtitleAPI.MultiTagsMode or SubtitleAPI.SingleTagsMode; //added by adenry
    //added by adenry: end

    // ------------ //
    //   Advanced   //
    // ------------ //
    TwoLinesIfLongerThan    := Ini.ReadInteger('Advanced', 'Two lines if longer than', 40);
    ToggleBreakPoint        := Ini.ReadBool('Advanced', 'Toggle breakpoint', False);
    BreakLineAfter          := Ini.ReadInteger('Advanced', 'Break line after', 40);
    AdjustAutomatically     := Ini.ReadBool('Advanced', 'Smart line adjust automatically', True);
    MaxLineLength           := Ini.ReadInteger('Advanced', 'Maximum line length', 45);
    ShiftTime               := Ini.ReadInteger('Advanced', 'Shift time', 100);
    //added by adenry: begin
    DefaultSubDuration      := Ini.ReadInteger('Advanced', 'Default subtitle duration', 1000);
    DefaultSubPause         := Ini.ReadInteger('Advanced', 'Default subtitle pause', 200);
    //added by adenry: end
    //added by adenry: begin
    tmeShow.TimeStep        := Ini.ReadInteger('Advanced', 'Increase step time', 100);
    tmeHide.TimeStep        := tmeShow.TimeStep;
    tmeDuration.TimeStep    := tmeShow.TimeStep;
    tmePause.TimeStep    := tmeShow.TimeStep; //added later
    tmeShow.FramesStep      := Ini.ReadInteger('Advanced', 'Increase step frames', 1);
    tmeHide.FramesStep      := tmeShow.FramesStep;
    tmeDuration.FramesStep  := tmeShow.FramesStep;
    tmePause.FramesStep  := tmeShow.FramesStep; //added later
    //added by adenry: end
    KeepMinDur              := Ini.ReadBool('Advanced', 'Keep min duration', False); //added by adenry
    KeepMinDurValue         := Ini.ReadInteger('Advanced', 'Keep min duration value', 1000); //added by adenry
    KeepMinDurDontOverlap   := Ini.ReadBool('Advanced', 'Keep min duration but do not overlap', True); //added by adenry
    //added by adenry: begin
    AutoRoundTimeVals       := Ini.ReadBool('Advanced', 'Auto round time values', False);
    RoundingFactor          := Ini.ReadInteger('Advanced', 'Auto rounding factor', 100);
    RoundOnLoad             := Ini.ReadBool('Advanced', 'Round time values on subtitle load', False);
    //added by adenry: end

    // --------------------------------- //
    //            Save related           //
    // --------------------------------- //
    AskToSave            := Ini.ReadBool('Save', 'Ask to save', True);
    tmrSaveWork.Enabled  := Ini.ReadBool('Save', 'Save work automatically', False);
    tmrSaveWork.Interval := Ini.ReadInteger('Save', 'Time interval', 60000);
    SaveAsBackup         := Ini.ReadBool('Save', 'Save as backup', True);
    AskToSaveNewSubs     := Ini.ReadBool('Save', 'Ask to save new subtitles', True); //added by adenry
    SaveEmptyLines       := Ini.ReadBool('Save', 'Save empty lines', False); //added by adenry

    // --------------------------------- //
    //           Video Preview           //
    // --------------------------------- //
    //pnlVideoHeight  := Ini.ReadInteger('Video preview', 'Video panel height', (pnlParent.Height div 2) - (spSplitter.Height div 2));
    OnDoubleClick   := Ini.ReadInteger('Video preview', 'Double click in a subtitle', 1);
    OnShiftDblClick := Ini.ReadInteger('Video preview', 'Shift-double click in a subtitle', 2);
    SecsToJump1     := Ini.ReadInteger('Video preview', 'Seconds to jump 1', 1);
    SecsToJump2     := Ini.ReadInteger('Video preview', 'Seconds to jump 2', 1);
    case Ini.ReadInteger('Video preview', 'Playback rate', 0) of
      0: mnu100P.Checked := True;
      1: mnu10P.Checked  := True;
      2: mnu20P.Checked  := True;
      3: mnu30P.Checked  := True;
      4: mnu40P.Checked  := True;
      5: mnu50P.Checked  := True;
      6: mnu60P.Checked := True;
      7: mnu70P.Checked := True;
      8: mnu80P.Checked := True;
      9: mnu90P.Checked := True;
      10: mnu200P.Checked := True;
      11: mnu300P.Checked := True;
      12: mnu400P.Checked := True;
    end;
    RewFFTime := StrSecToMS(Ini.ReadString('Video preview', 'Rewind and forward', '0,500'));
    DefAltPlayRate := Ini.ReadInteger('Video preview', 'Default altered playback rate', 0) + 1;
    SetDefaultShortCut;
    ScrollList := Ini.ReadBool('Video preview', 'Scroll list', False);
    mnuDisplayOriginal.Checked := Ini.ReadBool('Video preview', 'Displaying original', True);
    mnuDisplayTranslation.Checked := not mnuDisplayOriginal.Checked;
    mnuShowSubtitles.Checked := Ini.ReadBool('Video preview', 'Show subtitles', True);
    VertVideoAlign           := Ini.ReadBool('Video preview', 'Vertical video align', True); //added by adenry

    mnuVMR9VidRend.Checked   := Ini.ReadBool('Video preview', 'Use VMR9', False); //added by adenry
    mnuDefaultVidRend.Checked:= not mnuVMR9VidRend.Checked; //added by adenry

    VolumeSet(Ini.ReadInteger('Video preview', 'Volume', 100)); //added by adenry
    UnmuteValue := sbVolume.Position; //added by adenry
    //added by adenry: begin
    edtPlayerShortcuts.SendToBack;
    edtPlayerShortcuts.Height := 0;
    edtPlayerShortcuts.Width := 0;
    //added by adenry: end
    //VolumeControls := Ini.ReadBool('Video preview', 'Show volume controls', True); //added by adenry
    //ShowVolumeControls(VolumeControls); //added by adenry
    FullScreenOnDblClick := Ini.ReadBool('Video preview', 'Full screen on double click', True); //added by adenry
    PlayVideoOnLoad      := Ini.ReadBool('Video preview', 'Play video on load', True); //added by adenry
    //added by adenry: begin
    VideoAspectRatio     := Ini.ReadFloat('Video preview', 'Video Aspect Ratio', -1.0);
    if SameValue(VideoAspectRatio, 4/3, EPSILON)   then mnuAR4_3.Checked   := True else
    if SameValue(VideoAspectRatio, 16/9, EPSILON)  then mnuAR16_9.Checked  := True else
    if SameValue(VideoAspectRatio, 1.85)           then mnuAR185_1.Checked := True else
    if SameValue(VideoAspectRatio, 2.35)           then mnuAR235_1.Checked := True;
    //added by adenry: end
    //added by adenry: begin
    ShiftShowVal      := Ini.ReadInteger('Video preview', 'Shift Show value', 0);
    ShiftHideVal      := Ini.ReadInteger('Video preview', 'Shift Hide value', 0);
    //added by adenry: end

    // --------------------------------- //
    //      Video Preview subtitles      //
    // --------------------------------- //
    subSubtitle.Border      := Ini.ReadBool('Video preview subtitles','Draw border', True);
    subSubtitle.Shadow      := Ini.ReadBool('Video preview subtitles','Draw shadow', True);
    TransparentSubs         := Ini.ReadBool('Video preview subtitles','Transparent', True);
    ForceUsingReg           := Ini.ReadBool('Video preview subtitles','Force using regions', False) AND TransparentSubs; //AND TransparentSubs added by adenry
    subSubtitle.Font.Name   := Ini.ReadString('Video preview subtitles', 'Font name', 'Tahoma');
    subSubtitle.Font.Size   := Ini.ReadInteger('Video preview subtitles', 'Font size', 14);
    SubFontSize             := subSubtitle.Font.Size; //added by adenry
    subSubtitle.TextColor   := Ini.ReadInteger('Video preview subtitles', 'Font color', clWhite);
    subSubtitle.Font.Color  := subSubtitle.TextColor; //added by adenry //subSubtitle.Font.Color stores the color for marking
    BackgroundColor         := Ini.ReadInteger('Video preview subtitles', 'Background color', clBtnFace);
    subSubtitle.BorderWidth := Ini.ReadInteger('Video preview subtitles', 'Border width', 1);
    subSubtitle.ShadowWidth := Ini.ReadInteger('Video preview subtitles', 'Shadow width', 1);
    SubBorderWidth          := subSubtitle.BorderWidth; //added by adenry
    SubShadowWidth          := subSubtitle.ShadowWidth; //added by adenry
    subSubtitle.BorderColor := Ini.ReadInteger('Video preview subtitles', 'Border color', clBlack); //added by adenry
    subSubtitle.ShadowColor := Ini.ReadInteger('Video preview subtitles', 'Shadow color', clBlack); //added by adenry
    AlignLeftLineWithDash   := Ini.ReadBool('Video preview subtitles', 'Align left new line with dash', True); //added by adenry
    RelativeFontSize        := Ini.ReadBool('Video preview subtitles', 'Relative font size', True); //added by adenry
    KeepSubOnVideo          := Ini.ReadBool('Video preview subtitles', 'Keep subtitle on video', True); //added by adenry
    subSubtitleTopShift     := Ini.ReadFloat('Video preview subtitles', 'Subtitle top shift', 0.0); //added by adenry
    subSubtitle.Antialiased := Ini.ReadBool('Video preview subtitles', 'Try antialiasing', not ForceUsingReg or not TransparentSubs); //added by adenry
    subSubtitle.Font.Style  := [];
    if Ini.ReadBool('Video preview subtitles', 'Bold', False) then
      subSubtitle.Font.Style := subSubtitle.Font.Style + [fsBold];
    if Ini.ReadBool('Video preview subtitles', 'Italic', False) then
      subSubtitle.Font.Style := subSubtitle.Font.Style + [fsItalic];
    if Ini.ReadBool('Video preview subtitles', 'Underline', False) then
      subSubtitle.Font.Style := subSubtitle.Font.Style + [fsUnderline];

    // -------------------------------- //
    //      Information and Errors      //
    // -------------------------------- //

    //added by adenry: begin
    frmInfoErrorsSettings := TfrmInfoErrorsSettings.Create(Application);
    with frmInfoErrorsSettings do
    begin
    //added by adenry: end

    ShowConfMainForm            := Ini.ReadBool('Information and Errors', 'Show confirmations in main form on fix', False);
    AdvancedErrorMarking        := Ini.ReadBool('Information and Errors', 'Mark errors in main form''s list', True); //added by adenry
    //MarkErrorsInList            := Ini.ReadBool('Information and Errors', 'Mark errors in main form''s list', True);
    //MarkWithColor               := Ini.ReadInteger('Information and Errors', 'Mark with color', pnlMarkErrorsInListColor.Font.Color);
    //MarkWithBackground          := Ini.ReadInteger('Information and Errors', 'Mark with background', pnlMarkErrorsInListBackground.Font.Color); //added by adenry
    //MarkBold                    := Ini.ReadBool('Information and Errors', 'Bold', True);
    //MarkItalic                  := Ini.ReadBool('Information and Errors', 'Italic', False);
    //MarkUnderline               := Ini.ReadBool('Information and Errors', 'Underline', False);
    //UseOriginalTextColor        := Ini.ReadBool('Information and Errors', 'Use original text color', False); //added by adenry
    //OnlyIfThereIsAColorTag      := Ini.ReadBool('Information and Errors', 'Only if there is a color tag', True); //added by adenry
    //UseOriginalBackground       := Ini.ReadBool('Information and Errors', 'Use original background', False); //added by adenry
    //UseOriginalTextStyle        := Ini.ReadBool('Information and Errors', 'Use original text style', True); //added by adenry
    MarkOnLoad                  := Ini.ReadBool('Information and Errors', 'Mark errors on load subtitle', False);
    AutoRecheckErrors           := Ini.ReadBool('Information and Errors', 'Automatically recheck errors', True); //added by adenry
    AutoRecheckOnScripts        := Ini.ReadInteger('Information and Errors', 'Recheck on scripts', 1); //added by adenry
    FixOneUnitOverlap           := Ini.ReadBool('Information and Errors', 'Fix one unit overlap at load', False);
    FixOnLoad                   := Ini.ReadBool('Information and Errors', 'Fix errors on load subtitle', False);
    OCRDefFile                  := Ini.ReadString('Information and Errors', 'OCR Definitions file', ExtractFilePath(Application.ExeName) + 'OCRScripts\Default' + ID_OCREXT);
    IndicTooLongLines           := Ini.ReadBool('Information and Errors', 'Indicate too long lines', True); //added by adenry
    TooLongLinesColor           := Ini.ReadInteger('Information and Errors', 'Indicate too long lines color', pnlIndicTooLongLinesColor.Font.Color); //added by adenry
    TooLongLinesBackground      := Ini.ReadInteger('Information and Errors', 'Indicate too long lines background', pnlIndicTooLongLinesBackground.Font.Color); //added by adenry
    IndicTooShortDuration       := Ini.ReadBool('Information and Errors', 'Indicate too short duration', True); //added by adenry
    TooShortDurationColor       := Ini.ReadInteger('Information and Errors', 'Indicate too short duration color', pnlIndicTooShortDurationColor.Font.Color); //added by adenry
    TooShortDurationBackground  := Ini.ReadInteger('Information and Errors', 'Indicate too short duration background', pnlIndicTooShortDurationBackground.Font.Color); //added by adenry
    IndicTooLongDuration        := Ini.ReadBool('Information and Errors', 'Indicate too long duration', True); //added by adenry
    TooLongDurationColor        := Ini.ReadInteger('Information and Errors', 'Indicate too long duration color', pnlIndicTooLongDurationColor.Font.Color); //added by adenry
    TooLongDurationBackground   := Ini.ReadInteger('Information and Errors', 'Indicate too long duration background', pnlIndicTooLongDurationBackground.Font.Color); //added by adenry
    IndicTooShortPause          := Ini.ReadBool('Information and Errors', 'Indicate too short pause', True); //added by adenry
    TooShortPauseColor          := Ini.ReadInteger('Information and Errors', 'Indicate too short pause color', pnlIndicTooShortPauseColor.Font.Color); //added by adenry
    TooShortPauseBackground     := Ini.ReadInteger('Information and Errors', 'Indicate too short pause background', pnlIndicTooShortPauseBackground.Font.Color); //added by adenry

    IndicOverlapping            := Ini.ReadBool('Information and Errors', 'Indicate overlapping', True); //added by adenry
    OverlappingColor            := Ini.ReadInteger('Information and Errors', 'Indicate overlapping color', pnlIndicOverlappingColor.Font.Color); //added by adenry
    OverlappingBackground       := Ini.ReadInteger('Information and Errors', 'Indicate overlapping background', pnlIndicOverlappingBackground.Font.Color); //added by adenry

    IndicBadValues              := Ini.ReadBool('Information and Errors', 'Indicate bad values', True); //added by adenry
    BadValuesColor              := Ini.ReadInteger('Information and Errors', 'Indicate bad values color', pnlIndicBadValuesColor.Font.Color); //added by adenry
    BadValuesBackground         := Ini.ReadInteger('Information and Errors', 'Indicate bad values background', pnlIndicBadValuesBackground.Font.Color); //added by adenry
    IndicOverTwoLines           := Ini.ReadBool('Information and Errors', 'Indicate over two lines', True); //added by adenry
    OverTwoLinesColor           := Ini.ReadInteger('Information and Errors', 'Indicate over two lines color', pnlIndicOverTwoLinesColor.Font.Color); //added by adenry
    OverTwoLinesBackground      := Ini.ReadInteger('Information and Errors', 'Indicate over two lines background', pnlIndicOverTwoLinesBackground.Font.Color); //added by adenry

    //added by adenry: begin
    // -------------- //
    // Errors to mark //
    // -------------- //
    //AdvancedErrorMarking := Ini.ReadBool('Errors to mark', 'Enabled', True); //added by adenry
    //MarkDisableStandard := Ini.ReadBool('Errors to mark', 'Disable standard marking', True); //added by adenry
    if Ini.SectionExists('Errors to mark') then
    begin
      for i := 0 to Integer(High(TErrorType))+1 do
      begin
        MarkFlags[i] := TMarkFlags(Word(Ini.ReadInteger('Errors to mark', 'Mark flags ' + IntToStr(i), Word(GetDefaultMarkFlags(i)))));
        MarkColors[i] := Ini.ReadInteger('Errors to mark', 'Mark color ' + IntToStr(i), TPanel(FindComponent('pnlMarkColor_'+IntToStr(i))).Font.Color);
        MarkBackgrounds[i] := Ini.ReadInteger('Errors to mark', 'Mark background ' + IntToStr(i), TPanel(FindComponent('pnlMarkBckgr_'+IntToStr(i))).Font.Color);
      end;
    end else
      SetDefaultStyles(True);
    MarkCPSHintBox       := Ini.ReadBool('Information and Errors', 'Display CPS hint box', True);//added by adenry
    //added by adenry: end

    for i := 0 to mnuOCRScripts.Count-1 do
      if mnuOCRScripts.Items[i].Caption = ExtractFileName(Copy(OCRDefFile, 1, Length(OCRDefFile)-4)) then
        mnuOCRScripts.Items[i].Checked := True;
    cmbOCRScripts.ItemIndex := cmbOCRScripts.Items.IndexOf(ExtractFileName(Copy(OCRDefFile, 1, Length(OCRDefFile)-4)));

    // ----------------------------- //
    //            Advanced           //
    // ----------------------------- //
    RepeatableChars         := Ini.ReadString('Information and Errors', 'Repeatable chars', '-¡!¿?";\/_[]=');
    ProhibitedChars         := Ini.ReadString('Information and Errors', 'Prohibited chars', '@#*');
    ToleranceForRepeated    := Ini.ReadInteger('Information and Errors', 'Tolerance for repeated subtitles', 100);
    SpaceAfterChars         := Ini.ReadString('Information and Errors', 'Space after characters', '-');
    SpaceBeforeChars        := Ini.ReadString('Information and Errors', 'Space before characters', '');
    TooLongDuration         := Ini.ReadInteger('Information and Errors', 'Too long duration', 7000);
    TooShortDuration        := Ini.ReadInteger('Information and Errors', 'Too short duration', 1000);
    TooLongLine             := Ini.ReadInteger('Information and Errors', 'Too long line', 45);
    TooShortPause           := Ini.ReadInteger('Information and Errors', 'Too short pause', 200);//added by adenry
    TooMuchCPS              := Ini.ReadInteger('Information and Errors', 'Too much CPS', 20);//added by adenry
    NormalCPSColor          := Ini.ReadInteger('Information and Errors', 'Normal CPS Color', pnlNormalCPSColor.Font.Color); //added by adenry
    NormalCPSBckgr          := Ini.ReadInteger('Information and Errors', 'Normal CPS Background', pnlNormalCPSBckgr.Font.Color); //added by adenry
    TooMuchCPSColor         := Ini.ReadInteger('Information and Errors', 'Too much CPS Color', pnlTooMuchCPSColor.Font.Color); //added by adenry
    TooMuchCPSBckgr         := Ini.ReadInteger('Information and Errors', 'Too much CPS Background', pnlTooMuchCPSBckgr.Font.Color); //added by adenry
    PercentageInCPSHintBox  := Ini.ReadBool('Information and Errors', 'Percantage in CPS hint box', True); //added by adenry
    CurCPSInCPSHintBox      := Ini.ReadBool('Information and Errors', 'Current CPS in CPS hint box', False); //added by adenry
    MinTimeInCPSHintBox     := Ini.ReadBool('Information and Errors', 'Minimum time in CPS hint box', True); //added by adenry
    MaxCharInCPSHintBox     := Ini.ReadBool('Information and Errors', 'Maximum characters in CPS hint box', True); //added by adenry

    //added by adenry: begin
    end;
    frmInfoErrorsSettings.Free;
    //added by adenry: end

    // ----------------------------- //
    //      Errors to check for      //
    // ----------------------------- //
    ErrorsToCheck.eLinesWithoutLetters      := Ini.ReadBool('Errors to check for', 'Lines without letters',                   True);
    ErrorsToCheck.eEmptySubtitle            := Ini.ReadBool('Errors to check for', 'Empty subtitles',                         True);
    ErrorsToCheck.eOverlapping              := Ini.ReadBool('Errors to check for', 'Overlapping subtitles',                   True);
    ErrorsToCheck.eBadValues                := Ini.ReadBool('Errors to check for', 'Bad values',                              True);
    ErrorsToCheck.eTooShortPause            := Ini.ReadBool('Errors to check for', 'Too short pause',                         True);//added by adenry
    ErrorsToCheck.eTooLongDurations         := Ini.ReadBool('Errors to check for', 'Too long durations',                      True);
    ErrorsToCheck.eTooShortDurations        := Ini.ReadBool('Errors to check for', 'Too short durations',                     True);
    ErrorsToCheck.eTooLongLines             := Ini.ReadBool('Errors to check for', 'Too long lines',                          True);
    ErrorsToCheck.eOverTwoLines             := Ini.ReadBool('Errors to check for', 'Subtitles over two lines',                True);
    ErrorsToCheck.eHearingImpaired          := Ini.ReadBool('Errors to check for', 'Hearing impaired subtitles',              True);
    ErrorsToCheck.eTextBeforeColon          := Ini.ReadBool('Errors to check for', 'Text before colon (":")',                 True);
    ErrorsToCheck.eOnlyIfCapitalLetters     := Ini.ReadBool('Errors to check for', 'Only if text is in capital letters',      True);
    ErrorsToCheck.eUnnecessaryDots          := Ini.ReadBool('Errors to check for', 'Unnecessary dots',                        True);
    ErrorsToCheck.eProhibitedCharacter      := Ini.ReadBool('Errors to check for', 'Prohibited characters',                   False);
    ErrorsToCheck.eRepeatedCharacter        := Ini.ReadBool('Errors to check for', 'Repeated characters',                     True);
    ErrorsToCheck.eRepeatedSubtitle         := Ini.ReadBool('Errors to check for', 'Repeated subtitles',                      True);
    ErrorsToCheck.eOCRErrors                := Ini.ReadBool('Errors to check for', 'OCR Errors',                              True);
    ErrorsToCheck.eOpnDlgSubsOneLine        := Ini.ReadBool('Errors to check for', '"- " in subtitles with one line',         True);
    ErrorsToCheck.eDashOnFirstLine          := Ini.ReadBool('Errors to check for', '"- " on first line',                      True);//added by adenry
    ErrorsToCheck.eOnlyIfNoDashOnSecondLine := Ini.ReadBool('Errors to check for', 'Only if there is no "- " on second line', True);//added by adenry
    ErrorsToCheck.eDialogueOnOneLine        := Ini.ReadBool('Errors to check for', 'Dialogue on one line',                    True);//added by adenry
    ErrorsToCheck.eSpaceAfterCustChars      := Ini.ReadBool('Errors to check for', 'Space after custom characters',           True);
    ErrorsToCheck.eSpaceBeforeCustChars     := Ini.ReadBool('Errors to check for', 'Space before custom characters',          False);
    ErrorsToCheck.eUnnecessarySpaces        := Ini.ReadBool('Errors to check for', 'Unnecessary spaces',                      True);
    ErrorsToCheck.eUnnecessaryTags          := Ini.ReadBool('Errors to check for', 'Unnecessary tags',                        True);//added by adenry
    ErrorsToCheck.eTooMuchCPS               := Ini.ReadBool('Errors to check for', 'Too much CPS',                            True);//added by adenry
    ErrorsToCheck.eWhatUnnecessarySpaces    := [];
    if Ini.ReadBool('Unnecessary spaces to check for', 'Enters and spaces at the beginning and end', True) then
      ErrorsToCheck.eWhatUnnecessarySpaces := ErrorsToCheck.eWhatUnnecessarySpaces + [EntersAndSpacesBeginningEnd];
    if Ini.ReadBool('Unnecessary spaces to check for', 'Spaces between enters (left and right)', True) then
      ErrorsToCheck.eWhatUnnecessarySpaces := ErrorsToCheck.eWhatUnnecessarySpaces + [SpacesBetweenEnters];
    if Ini.ReadBool('Unnecessary spaces to check for', 'Double spaces and enters', True) then
      ErrorsToCheck.eWhatUnnecessarySpaces := ErrorsToCheck.eWhatUnnecessarySpaces + [DoubleSpacesAndEnters];
    if Ini.ReadBool('Unnecessary spaces to check for', 'Spaces in front of punctuation marks', True) then
      ErrorsToCheck.eWhatUnnecessarySpaces := ErrorsToCheck.eWhatUnnecessarySpaces + [SpacesFrontPunctuation];
    if Ini.ReadBool('Unnecessary spaces to check for', 'Spaces after "¿" and "¡"', True) then
      ErrorsToCheck.eWhatUnnecessarySpaces := ErrorsToCheck.eWhatUnnecessarySpaces + [SpacesAfterQuestionAndExclamation];
    if Ini.ReadBool('Unnecessary spaces to check for', 'Spaces before "?" and  "!"', True) then
      ErrorsToCheck.eWhatUnnecessarySpaces := ErrorsToCheck.eWhatUnnecessarySpaces + [SpacesBeforeQuestionAndExclamation];
    if Ini.ReadBool('Unnecessary spaces to check for', 'Spaces between numbers', True) then
      ErrorsToCheck.eWhatUnnecessarySpaces := ErrorsToCheck.eWhatUnnecessarySpaces + [SpacesBetweenNumbers];

    // ----------------------- //
    //      Errors to fix      //
    // ----------------------- //
    ErrorsToFix.eLinesWithoutLetters      := Ini.ReadBool('Errors to fix', 'Lines without letters',                   True);
    ErrorsToFix.eEmptySubtitle            := Ini.ReadBool('Errors to fix', 'Empty subtitles',                         True);
    ErrorsToFix.eOverlapping              := Ini.ReadBool('Errors to fix', 'Overlapping subtitles',                   True);
    ErrorsToFix.eBadValues                := Ini.ReadBool('Errors to fix', 'Bad values',                              True);
    ErrorsToFix.eTooShortPause            := Ini.ReadBool('Errors to fix', 'Too short pause',                         True);//added by adenry
    ErrorsToFix.eOverTwoLines             := Ini.ReadBool('Errors to fix', 'Subtitles over two lines',                True);
    ErrorsToFix.eHearingImpaired          := Ini.ReadBool('Errors to fix', 'Hearing impaired subtitles',              True);
    ErrorsToFix.eTextBeforeColon          := Ini.ReadBool('Errors to fix', 'Text before colon (":")',                 True);
    ErrorsToFix.eOnlyIfCapitalLetters     := Ini.ReadBool('Errors to fix', 'Only if text is in capital letters',      True);
    ErrorsToFix.eUnnecessaryDots          := Ini.ReadBool('Errors to fix', 'Unnecessary dots',                        True);
    ErrorsToFix.eProhibitedCharacter      := Ini.ReadBool('Errors to fix', 'Prohibited characters',                   False);
    ErrorsToFix.eRepeatedCharacter        := Ini.ReadBool('Errors to fix', 'Repeated characters',                     True);
    ErrorsToFix.eRepeatedSubtitle         := Ini.ReadBool('Errors to fix', 'Repeated subtitles',                      True);
    ErrorsToFix.eOCRErrors                := Ini.ReadBool('Errors to fix', 'OCR Errors',                              True);
    ErrorsToFix.eOpnDlgSubsOneLine        := Ini.ReadBool('Errors to fix', '"-" in subtitles with one line',          False);
    ErrorsToFix.eDashOnFirstLine          := Ini.ReadBool('Errors to fix', '"- " on first line',                      True);//added by adenry
    ErrorsToFix.eOnlyIfNoDashOnSecondLine := Ini.ReadBool('Errors to fix', 'Only if there is no "- " on second line', True);//added by adenry
    ErrorsToFix.eDialogueOnOneLine        := Ini.ReadBool('Errors to fix', 'Dialogue on one line',                    True);//added by adenry
    ErrorsToFix.eSpaceAfterCustChars      := Ini.ReadBool('Errors to fix', 'Space after custom characters',           True);
    ErrorsToFix.eSpaceBeforeCustChars     := Ini.ReadBool('Errors to fix', 'Space before custom characters',          False);
    ErrorsToFix.eUnnecessarySpaces        := Ini.ReadBool('Errors to fix', 'Unnecessary spaces',                      True);
    ErrorsToFix.eUnnecessaryTags          := Ini.ReadBool('Errors to fix', 'Unnecessary tags',                        True);//added by adenry
    ErrorsToFix.eTooMuchCPS               := Ini.ReadBool('Errors to fix', 'Too much CPS',                            True);//added by adenry
    ErrorsToFix.eWhatUnnecessarySpaces    := [];
    if Ini.ReadBool('Unnecessary spaces to fix', 'Enters and spaces at the beginning and end', True) then
      ErrorsToFix.eWhatUnnecessarySpaces := ErrorsToFix.eWhatUnnecessarySpaces + [EntersAndSpacesBeginningEnd];
    if Ini.ReadBool('Unnecessary spaces to fix', 'Spaces between enters (left and right)', True) then
      ErrorsToFix.eWhatUnnecessarySpaces := ErrorsToFix.eWhatUnnecessarySpaces + [SpacesBetweenEnters];
    if Ini.ReadBool('Unnecessary spaces to fix', 'Double spaces and enters', True) then
      ErrorsToFix.eWhatUnnecessarySpaces := ErrorsToFix.eWhatUnnecessarySpaces + [DoubleSpacesAndEnters];
    if Ini.ReadBool('Unnecessary spaces to fix', 'Spaces in front of punctuation marks', True) then
      ErrorsToFix.eWhatUnnecessarySpaces := ErrorsToFix.eWhatUnnecessarySpaces + [SpacesFrontPunctuation];
    if Ini.ReadBool('Unnecessary spaces to fix', 'Spaces after "¿" and "¡"', True) then
      ErrorsToFix.eWhatUnnecessarySpaces := ErrorsToFix.eWhatUnnecessarySpaces + [SpacesAfterQuestionAndExclamation];
    if Ini.ReadBool('Unnecessary spaces to fix', 'Spaces before "?" and  "!"', True) then
      ErrorsToFix.eWhatUnnecessarySpaces := ErrorsToFix.eWhatUnnecessarySpaces + [SpacesBeforeQuestionAndExclamation];
    if Ini.ReadBool('Unnecessary spaces to fix', 'Spaces between numbers', True) then
      ErrorsToFix.eWhatUnnecessarySpaces := ErrorsToFix.eWhatUnnecessarySpaces + [SpacesBetweenNumbers];

    //added by adenry later:
    if ((ErrorsToCheck.eOCRErrors) or (ErrorsToFix.eOCRErrors)) and (FileExists(OCRDefFile)) then
      ParseOCRErrors(OCRDefFile);

    // --------------------------------- //
    //             File Types            //
    // --------------------------------- //

    if Ini.ReadBool('File types', 'Register extensions on start', False) then
      AssociateExtensions(Ini.ReadString('File types', 'Associated extensions', ''), True);
    //added by adenry: begin
    //associated .srf and .stp extensions, if nothing else is associated with them
    //else
    //  if Ini.ReadString('File types', 'Associated extensions', '*.srf;*.stp') = '*.srf;*.stp' then
    //    AssociateExtensions('*.srf;*.stp', True, True);
    //added by adenry: end

    //added by adenry: begin
    frmSettings := TfrmSettings.Create(Application);
    with frmSettings do
    begin
    //added by adenry: end

    // --------------------------------- //
    //           Program Look            //
    // --------------------------------- //
    //removed by adenry
    {case Ini.ReadInteger('Program look', '"Text" and "Translation" fields align', 2) of
      0: begin mmoSubtitleText.Alignment := taLeftJustify; mmoTranslation.Alignment := taLeftJustify; end;
      1: begin mmoSubtitleText.Alignment := taRightJustify; mmoTranslation.Alignment := taRightJustify; end else
      begin mmoSubtitleText.Alignment := Classes.taCenter; mmoTranslation.Alignment := Classes.taCenter; end;
    end;}
    //removed by adenry: end
    mmoSubtitleText.Alignment := SetObjectAlignment(Ini.ReadInteger('Program look', '"Text" and "Translation" fields align', 2)); //added by adenry
    mmoTranslation.Alignment  := SetObjectAlignment(Ini.ReadInteger('Program look', '"Text" and "Translation" fields align', 2)); //added by adenry
    if TSWTextEdit.ClassName = TRichEdit.ClassName then //if TSWTextEdit.InheritsFrom(TRichEdit) then
    begin
      mmoSubtitleText.Paragraph.Alignment := mmoSubtitleText.Alignment;
      mmoTranslation.Paragraph.Alignment  := mmoTranslation.Alignment;
    end;
    TagsHighlight             := Ini.ReadBool('Program look', 'Highlight tags', True); //added by adenry
    TagsHighlightColor        := Ini.ReadInteger('Program look', 'Tags highlight color', pnlTagsHighlightColor.Font.Color); //added by adenry
    SmartResize               := Ini.ReadBool('Program look', 'Smart resize', True); //added by adenry
    SmartResizeColumns        := Ini.ReadBool('Program look', 'Smart resize columns', True); //added by adenry
    MiMenu.Activo             := Ini.ReadBool('Menu look', 'Use Office XP Style menu', True);
    MiMenu.Degradado          := Ini.ReadBool('Menu look', 'Use gradient menu', True);

    // --------------------------------- //
    //             List Look             //
    // --------------------------------- //

    VisualSubReprColor := Ini.ReadInteger('Video preview', 'Visual sub repres color', pnlVisSubReprColor.Font.Color); //added by adenry

    if Ini.ReadBool('List look', 'Show grid lines', True) then
      lstSubtitles.TreeOptions.PaintOptions := [toShowHorzGridLines, toShowVertGridLines, toShowButtons, toShowDropmark, toShowTreeLines,toThemeAware,toUseBlendedImages,toAlwaysHideSelection] else //,toAlwaysHideSelection added by adenry
      lstSubtitles.TreeOptions.PaintOptions := [toShowButtons, toShowDropmark, toShowTreeLines,toThemeAware,toUseBlendedImages,toAlwaysHideSelection]; //,toAlwaysHideSelection added by adenry
    ApplyStyleInList := Ini.ReadBool('List look', 'Apply style to subtitles', True);
    MarkUnTransSubs  := Ini.ReadBool('List look', 'Mark untranslated subtitles', True);
    UnTransSubsColor := Ini.ReadInteger('List look', 'Untranslated subtitles color', pnlUnTransColor.Font.Color); //clRed changed to pnlUnTransColor.Font.Color by adenry
    MarkUnTransSubsBckgr  := Ini.ReadBool('List look', 'Mark untranslated subtitles with background', True); //added by adenry
    UnTransSubsBckgr := Ini.ReadInteger('List look', 'Untranslated subtitles background', pnlUnTransBckgr.Font.Color); //added by adenry
    if Ini.ReadBool('List look', 'Show horizontal scrollbar', True) = False then
      lstSubtitles.ScrollBarOptions.ScrollBars := ssVertical else
      lstSubtitles.ScrollBarOptions.ScrollBars := ssBoth;
    //added by adenry: begin
    if Ini.ReadBool('List look', 'Right click selection', True) then
      lstSubtitles.TreeOptions.SelectionOptions := lstSubtitles.TreeOptions.SelectionOptions + [toRightClickSelect] else
      lstSubtitles.TreeOptions.SelectionOptions := lstSubtitles.TreeOptions.SelectionOptions - [toRightClickSelect];
    //hidden (for now) option to disable rectangle selection
    if Ini.ReadBool('List look', 'Disable rectangle selection', False) then
      lstSubtitles.TreeOptions.SelectionOptions := lstSubtitles.TreeOptions.SelectionOptions + [toDisableDrawSelection];
    //added by adenry: end
    lstSubtitles.DefaultNodeHeight := Ini.ReadInteger('List look', 'Row height', 18); //added by adenry
    lstSubtitles.TextMargin        := Ini.ReadInteger('List look', 'Text margin', 6); //added by adenry

    lstSubtitles.Colors.FocusedSelectionColor := Ini.ReadInteger('List look', 'Selection color', pnlSelColor.Font.Color); //added by adenry
    lstSubtitles.Colors.FocusedSelectionBorderColor := Ini.ReadInteger('List look', 'Selection color', pnlSelColor.Font.Color); //added by adenry
    lstSubtitles.Colors.UnfocusedSelectionColor := MixColors(lstSubtitles.Colors.FocusedSelectionColor,clWhite,45); //added by adenry
    lstSubtitles.Colors.UnfocusedSelectionBorderColor := MixColors(lstSubtitles.Colors.FocusedSelectionBorderColor,clWhite,45); //added by adenry
    SelTransp := Ini.ReadInteger('List look', 'Selection transparency', 50); //added by adenry
    SelTextColor := Ini.ReadInteger('List look', 'Selection text color', pnlSelTextColor.Font.Color); //added by adenry

    //added by adenry: begin
    lstSubtitles.Header.Columns[0].Alignment := SetObjectAlignment(Ini.ReadInteger('List look', 'Num column align', 2));
    lstSubtitles.Header.Columns[1].Alignment := SetObjectAlignment(Ini.ReadInteger('List look', 'Show column align', 2));
    lstSubtitles.Header.Columns[2].Alignment := SetObjectAlignment(Ini.ReadInteger('List look', 'Hide column align', 2));
    lstSubtitles.Header.Columns[3].Alignment := SetObjectAlignment(Ini.ReadInteger('List look', 'Text column align', 0));
    lstSubtitles.Header.Columns[4].Alignment := SetObjectAlignment(Ini.ReadInteger('List look', 'Translation column align', 0));
    //added by adenry: end
    //added by adenry: begin
    lstSubtitles.Header.Columns[5].Alignment := SetObjectAlignment(Ini.ReadInteger('List look', 'Duration column align', 1));
    lstSubtitles.Header.Columns[6].Alignment := SetObjectAlignment(Ini.ReadInteger('List look', 'Pause column align', 1));
    ColNumDisplayStyle                       := Ini.ReadInteger('List look', 'Num column display style', 1);
    ColShowDisplayStyle                      := Ini.ReadInteger('List look', 'Show column display style', 0);
    ColHideDisplayStyle                      := Ini.ReadInteger('List look', 'Hide column display style', 0);
    ColDurDisplayStyle                       := Ini.ReadInteger('List look', 'Duration column display style', 1);
    ColPauseDisplayStyle                     := Ini.ReadInteger('List look', 'Pause column display style', 1);
    //added by adenry: end

    //added by adenry: begin
    // --------------------------------- //
    //             Marking Look          //
    // --------------------------------- //
    MarkingWithColor            := Ini.ReadBool('Marking look', 'Marking with color', True);
    MarkingColor                := Ini.ReadInteger('Marking look', 'Marking color', pnlMarkingColor.Font.Color);
    MarkingWithBckgr            := Ini.ReadBool('Marking look', 'Marking with background', True);
    MarkingBckgr                := Ini.ReadInteger('Marking look', 'Marking background', pnlMarkingBckgr.Font.Color);
    MarkingColNum               := Ini.ReadBool('Marking look', 'Mark column 1', True);
    MarkingColPause             := Ini.ReadBool('Marking look', 'Mark column 6', False);
    MarkingColShow              := Ini.ReadBool('Marking look', 'Mark column 2', False);
    MarkingColHide              := Ini.ReadBool('Marking look', 'Mark column 3', False);
    MarkingColDur               := Ini.ReadBool('Marking look', 'Mark column 5', False);
    MarkingColText              := Ini.ReadBool('Marking look', 'Mark column 4', False);
    MarkingHighPriority         := Ini.ReadBool('Marking look', 'Marking high priority', True);
    MarkingInVideoPreview       := Ini.ReadBool('Marking look', 'Marking in video preview', True);
    MarkingInVideoPreviewColor  := Ini.ReadInteger('Marking look', 'Marking color in video preview', pnlMarkingColorVideoPreview.Font.Color);
    MarkingSave                 := Ini.ReadInteger('Marking look', 'Marking save', 0);
    MarkingAutoLoad             := Ini.ReadBool('Marking look', 'Marking auto load', True);
    //added by adenry: end

    //added by adenry: begin
    end;
    frmSettings.Free;
    //added by adenry: end

    // --------------------------------- //
    //             Interfaces            //
    // --------------------------------- //

    mnuShowLeftPanel.Checked := Ini.ReadBool('Interface', 'Show left panel', True);
    if Ini.ReadBool('Interface', 'Show time controls', True) then
      mnuShowTimeControls.Checked := True else
    begin
      mnuShowTimeControls.Checked := False;
      mnuShowTimeControlsClick(Sender);
    end;
    if Ini.ReadBool('Interface', 'Use in-place edition', False) then
    begin
      mnuUseInPlaceEdition.Checked := True;
      lstSubtitles.TreeOptions.MiscOptions := lstSubtitles.TreeOptions.MiscOptions + [toEditable];
    end else
    begin
      mnuUseInPlaceEdition.Checked := False;
      lstSubtitles.TreeOptions.MiscOptions := lstSubtitles.TreeOptions.MiscOptions - [toEditable];
    end;

    SetVideoPreviewMode(Ini.ReadBool('Interface', 'Video Preview Mode', True)); //False changed to True by adenry
    //added by adenry: begin
    mnuColNum.Checked := Ini.ReadBool('Interface', 'Col Num visible', True);
    mnuColNumPopup.Checked := mnuColNum.Checked;
    if mnuColNum.Checked = False then
      lstSubtitles.Header.Columns[0].Options := lstSubtitles.Header.Columns[0].Options - [coVisible];
    mnuColShow.Checked := Ini.ReadBool('Interface', 'Col Show visible', True);
    mnuColShowPopup.Checked := mnuColShow.Checked;
    if mnuColShow.Checked = False then
      lstSubtitles.Header.Columns[1].Options := lstSubtitles.Header.Columns[1].Options - [coVisible];
    mnuColHide.Checked := Ini.ReadBool('Interface', 'Col Hide visible', True);
    mnuColHidePopup.Checked := mnuColHide.Checked;
    if mnuColHide.Checked = False then
      lstSubtitles.Header.Columns[2].Options := lstSubtitles.Header.Columns[2].Options - [coVisible];
    mnuColText.Checked := Ini.ReadBool('Interface', 'Col Text visible', True);
    mnuColTextPopup.Checked := mnuColText.Checked;
    if mnuColText.Checked = False then
      lstSubtitles.Header.Columns[3].Options := lstSubtitles.Header.Columns[3].Options - [coVisible];
    mnuColDuration.Checked := Ini.ReadBool('Interface', 'Col Duration visible', True);
    mnuColDurationPopup.Checked := mnuColDuration.Checked;
    if mnuColDuration.Checked = False then
      lstSubtitles.Header.Columns[5].Options := lstSubtitles.Header.Columns[5].Options - [coVisible];
    mnuColPause.Checked := Ini.ReadBool('Interface', 'Col Pause visible', True);
    mnuColPausePopup.Checked := mnuColPause.Checked;
    if mnuColPause.Checked = False then
      lstSubtitles.Header.Columns[6].Options := lstSubtitles.Header.Columns[6].Options - [coVisible];
    //added by adenry: end

    SetTranslatorMode(Ini.ReadBool('Interface', 'Translator mode', False), False);
    EnableVPCtrls(False);

    //added by adenry: begin
    lstSubtitles.Header.Columns[0].Position := StrToInt(Copy(Ini.ReadString('Interface', 'Cols positions','0,2,3,5,6,4,1'), 1, 1));
    lstSubtitles.Header.Columns[1].Position := StrToInt(Copy(Ini.ReadString('Interface', 'Cols positions','0,2,3,5,6,4,1'), 3, 1));
    lstSubtitles.Header.Columns[2].Position := StrToInt(Copy(Ini.ReadString('Interface', 'Cols positions','0,2,3,5,6,4,1'), 5, 1));
    lstSubtitles.Header.Columns[3].Position := StrToInt(Copy(Ini.ReadString('Interface', 'Cols positions','0,2,3,5,6,4,1'), 7, 1));
    lstSubtitles.Header.Columns[4].Position := StrToInt(Copy(Ini.ReadString('Interface', 'Cols positions','0,2,3,5,6,4,1'), 9, 1));
    lstSubtitles.Header.Columns[5].Position := StrToInt(Copy(Ini.ReadString('Interface', 'Cols positions','0,2,3,5,6,4,1'), 11, 1));
    lstSubtitles.Header.Columns[6].Position := StrToInt(Copy(Ini.ReadString('Interface', 'Cols positions','0,2,3,5,6,4,1'), 13, 1));
    TextTransColsSwapped := False;
    RepositionTextTrans;
    //added by adenry: end

    //added by adenry: begin
    if Ini.ReadBool('Interface', 'Show lines count', True) then
      mnuShowLinesCount.Checked := True else
    begin
      mnuShowLinesCount.Checked := False;
      mnuShowLinesCountClick(Sender);
    end;
    //added by adenry: end

    //added by adenry: begin
    mnuShowNotesInLeftPanel.Checked := Ini.ReadBool('Interface', 'Show notes in left panel', True);
    mnuShowNotesInLeftPanelClick(Sender);
    //added by adenry: end

    //added by adenry: begin
    mnuShowCPSHintBoxes.Checked := Ini.ReadBool('Interface', 'Show CPS hint boxes', False);
    ShowCPSHintBoxes := mnuShowCPSHintBoxes.Checked;
    //added by adenry: end

    //added by adenry: begin
    mnuShowTimeControlButtons.Checked := Ini.ReadBool('Interface', 'Show time control buttons', True);
    if mnuShowTimeControlButtons.Checked = False then
      mnuShowTimeControlButtonsClick(Sender);
    pnlTimingControls.Width := Ini.ReadInteger('Main Window', 'Timing Controls Width', 259);
    pnlTextControls.Width := pnlEditingControls.Width - pnlTimingControls.Width - spSplitterEditingControls.Width; //we set it by hand here, as it's not automatically set when SW is maximized
    spSplitterEditingControlsMoved(Sender);
    //added by adenry: end

    //added by adenry: begin
    // ---------------- //
    //        View      //
    // ---------------- //
    mnuToolbar.Checked := Ini.ReadBool('View', 'Toolbar', True);
    if mnuToolbar.Checked = False then
      mnuToolbarClick(Sender);
    UndoRedoDropDownItems := 20;
    mnuTextStyleBars.Checked := Ini.ReadBool('View', 'Style Bars', True);
    if mnuTextStyleBars.Checked then
      mnuTextStyleBarsClick(Sender);
    mnuStatusbar.Checked := Ini.ReadBool('View', 'Statusbar', True);
    if mnuStatusbar.Checked = False then
      mnuStatusbarClick(Sender);
    mnuVisualSubRepr.Checked := Ini.ReadBool('View', 'Visual sub representation', True); //added later
    //added by adenry: end

    // Opened forms //
    if Ini.ReadBool('General', 'Info and errors form opened', False) then mnuInformationAndErrorsClick(frmMain); //added by adenry
    if Ini.ReadBool('Various info', 'Various info form opened', False) then mnuVariousInformationClick(frmMain); //added by adenry

    //added by adenry: begin
    //Always Show Output Settings when saving
    SetLength(OutputSettingsFormats, 9);
    OutputSettingsFormats[0].FormatName := 'Advanced SubStation Alpha';
    OutputSettingsFormats[0].AlwaysShow := Ini.ReadBool('Output Settings', 'Always show '+OutputSettingsFormats[0].FormatName, True);
    OutputSettingsFormats[1].FormatName := 'Advanced Subtitles';
    OutputSettingsFormats[1].AlwaysShow := Ini.ReadBool('Output Settings', 'Always show '+OutputSettingsFormats[1].FormatName, True);
    OutputSettingsFormats[2].FormatName := 'DVDSubtitle';
    OutputSettingsFormats[2].AlwaysShow := Ini.ReadBool('Output Settings', 'Always show '+OutputSettingsFormats[2].FormatName, True);
    OutputSettingsFormats[3].FormatName := 'SAMI Captioning';
    OutputSettingsFormats[3].AlwaysShow := Ini.ReadBool('Output Settings', 'Always show '+OutputSettingsFormats[3].FormatName, True);
    OutputSettingsFormats[4].FormatName := 'Sonic Scenarist';
    OutputSettingsFormats[4].AlwaysShow := Ini.ReadBool('Output Settings', 'Always show '+OutputSettingsFormats[4].FormatName, True);
    OutputSettingsFormats[5].FormatName := 'SubStation Alpha';
    OutputSettingsFormats[5].AlwaysShow := Ini.ReadBool('Output Settings', 'Always show '+OutputSettingsFormats[5].FormatName, True);
    OutputSettingsFormats[6].FormatName := 'SubViewer 1.0';
    OutputSettingsFormats[6].AlwaysShow := Ini.ReadBool('Output Settings', 'Always show '+OutputSettingsFormats[6].FormatName, True);
    OutputSettingsFormats[7].FormatName := 'SubViewer 2.0';
    OutputSettingsFormats[7].AlwaysShow := Ini.ReadBool('Output Settings', 'Always show '+OutputSettingsFormats[7].FormatName, True);
    OutputSettingsFormats[8].FormatName := 'TMPlayer';
    OutputSettingsFormats[8].AlwaysShow := Ini.ReadBool('Output Settings', 'Always show '+OutputSettingsFormats[8].FormatName, True);
    //added by adenry: end

    // Command line parameters reading was here. Moved by adenry AFTER setting the Output Settings

  finally
    Ini.Free;
  end;

  // ------------------------------------------------------------------------ //
  //                            Set Output settings                           //
  // ------------------------------------------------------------------------ //
  
  Ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Output.ini');
  try
    //added by adenry: begin
    // --------------------------- //
    //  Advanced SubStation Alpha  //
    // --------------------------- //
    SubtitleAPI.SetOutputSettingsAdvancedSubStationAlpha(
      True,
      Ini.ReadString  ('ASS', 'Title', '<untitled>'),
      Ini.ReadString  ('ASS', 'Script', '<unknown>'),
      Ini.ReadString  ('ASS', 'Collisions', 'Normal'),
      Ini.ReadInteger ('ASS', 'PlayResX', 0),
      Ini.ReadInteger ('ASS', 'PlayResY', 0),
      Ini.ReadString  ('ASS', 'Timer', '100.0000'),
      Ini.ReadString  ('ASS', 'Font name', 'Tahoma'),
      Ini.ReadInteger ('ASS', 'Font size', 24),
      Ini.ReadBool    ('ASS', 'Bold', True),
      Ini.ReadBool    ('ASS', 'Italic', False),
      Ini.ReadInteger ('ASS', 'BorderStyle', 1),
      Ini.ReadInteger ('ASS', 'Primary Color', 16777215),
      Ini.ReadInteger ('ASS', 'Secondary Color', 16777215),
      Ini.ReadInteger ('ASS', 'Tertiary Color', 16777215),
      Ini.ReadInteger ('ASS', 'Shadow Color', 12632256),
      Ini.ReadInteger ('ASS', 'Outline', 1),
      Ini.ReadInteger ('ASS', 'Shadow', 1),
      (Ini.ReadInteger('ASS', 'Alignment', 2) or (Ini.ReadInteger('ASS', 'Type of subtitles', 1) shl 2)),
      Ini.ReadInteger ('ASS', 'Left margin', 30),
      Ini.ReadInteger ('ASS', 'Right margin', 30),
      Ini.ReadInteger ('ASS', 'Vertical margin', 415),
      Ini.ReadInteger ('ASS', 'Encoding', 1),
      Ini.ReadBool    ('ASS', 'Underline', False),
      Ini.ReadBool    ('ASS', 'StrikeOut', False),
      Ini.ReadInteger ('ASS', 'ScaleX', 100),
      Ini.ReadInteger ('ASS', 'ScaleY', 100),
      Ini.ReadInteger ('ASS', 'Spacing', 0),
      Ini.ReadString  ('ASS', 'Angle', '0.00')
    );
    //added by adenry: end

    //added by adenry: begin
    // ------------------------ //
    //  Advanced Subtitles XAS  //
    // ------------------------ //

    SubtitleAPI.SetOutputSettingsXAS(
      True,
      Ini.ReadString  ('XAS', 'Font Name',            'arialbd.ttf'),
      Ini.ReadInteger ('XAS', 'Font Size',            60),
      Ini.ReadBool    ('XAS', 'Font Size In Percent', False),
      Ini.ReadInteger ('XAS', 'Text Color',           clWhite),
      Ini.ReadBool    ('XAS', 'Shadow',               True),
      Ini.ReadInteger ('XAS', 'Shadow Color',         clBlack),
      Ini.ReadInteger ('XAS', 'Transparency',         255),
      //Position
      Ini.ReadInteger ('XAS', 'X',                    10),
      Ini.ReadInteger ('XAS', 'Y',                    89),
      Ini.ReadInteger ('XAS', 'Width',                80),
      Ini.ReadInteger ('XAS', 'Height',               11),
      Ini.ReadBool    ('XAS', 'X in Percent',         False),
      Ini.ReadBool    ('XAS', 'Y in Percent',         False),
      Ini.ReadBool    ('XAS', 'Width in Percent',     False),
      Ini.ReadBool    ('XAS', 'Height in Percent',    False),
      Ini.ReadInteger ('XAS', 'Alignment',            0),
      //Language
      Ini.ReadString  ('XAS', 'Encoding',             'windows-1252'),
      Ini.ReadString  ('XAS', 'Language',             'en'),
      //Join
      Ini.ReadBool    ('XAS', 'Join Short Lines',     True),
      Ini.ReadBool    ('XAS', 'Wrap Lines',           False),
      Ini.ReadInteger ('XAS', 'Wrap Lines Value',     50)
    );
    //added by adenry: end

    // ------------------------ //
    //       DVD Subtitle       //
    // ------------------------ //
    SubtitleAPI.SetOutputSettingsDVDSubtitle(
      True,
      Ini.ReadString  ('DVD Subtitle', 'Disk ID',   ''),
      Ini.ReadString  ('DVD Subtitle', 'DVD Title', ''),
      Ini.ReadString  ('DVD Subtitle', 'Language',  'EN'),
      Ini.ReadString  ('DVD Subtitle', 'Author',    ''),
      Ini.ReadString  ('DVD Subtitle', 'Web',       ''),
      Ini.ReadString  ('DVD Subtitle', 'Info',      ''),
      Ini.ReadString  ('DVD Subtitle', 'License',   '')
    );

    // ------------------------ //
    //           SAMI           //
    // ------------------------ //
    if Ini.ReadString ('SAMI', 'Align', 'Center') = 'Left' then
      TextAlign := taLeft else
    if Ini.ReadString ('SAMI', 'Align', 'Center') = 'Right' then
      TextAlign := taRight else
      TextAlign := taCenter;
    SubtitleAPI.SetOutputSettingsSAMI(
      True,
      Ini.ReadString  ('SAMI', 'Font',              'Tahoma'),
      Ini.ReadInteger ('SAMI', 'Size',              24),
      Ini.ReadBool    ('SAMI', 'Bold',              True),
      Ini.ReadBool    ('SAMI', 'Italic',            False),
      Ini.ReadBool    ('SAMI', 'Underline',         False),
      Ini.ReadInteger ('SAMI', 'Subtitle color',    clWhite),
      Ini.ReadInteger ('SAMI', 'Background color',  clBlack),
      TextAlign
    );

    // ------------------------ //
    //      Sonic Scenarist     //
    // ------------------------ //
    SubtitleAPI.SetOutputSettingsSonicScenarist(
      True,
      Ini.ReadBool    ('Scenarist', 'PAL',        True),
      Ini.ReadBool    ('Scenarist', 'Drop frame', False),
      Ini.ReadInteger ('Scenarist', 'Color0',     3),
      Ini.ReadInteger ('Scenarist', 'Color1',     4),
      Ini.ReadInteger ('Scenarist', 'Color2',     3),
      Ini.ReadInteger ('Scenarist', 'Color3',     9),
      Ini.ReadInteger ('Scenarist', 'Contrast0',  0),
      Ini.ReadInteger ('Scenarist', 'Contrast1',  15),
      Ini.ReadInteger ('Scenarist', 'Contrast2',  15),
      Ini.ReadInteger ('Scenarist', 'Contrast3',  15)
    );

    // ------------------------ //
    //         SubViewer        //
    // ------------------------ //
    SubtitleAPI.SetOutputSettingsSubViewer1(
      True,
      Ini.ReadString  ('SubViewer', 'Title',   ''),
      Ini.ReadString  ('SubViewer', 'Author',  ''),
      Ini.ReadString  ('SubViewer', 'Source',  ''),
      Ini.ReadString  ('SubViewer', 'Program', ''),
      Ini.ReadString  ('SubViewer', 'Path',    ''),
      Ini.ReadInteger ('SubViewer', 'Delay',   0)
    );

    // ------------------------ //
    //        SubViewer 2       //
    // ------------------------ //
    SubtitleAPI.SetOutputSettingsSubViewer2(
      True,
      Ini.ReadString  ('SubViewer 2', 'Title',     ''),
      Ini.ReadString  ('SubViewer 2', 'Author',    ''),
      Ini.ReadString  ('SubViewer 2', 'Source',    ''),
      Ini.ReadString  ('SubViewer 2', 'Program',   ''),
      Ini.ReadString  ('SubViewer 2', 'Path',      ''),
      Ini.ReadInteger ('SubViewer 2', 'Delay',     0),
      Ini.ReadInteger ('SubViewer 2', 'CD-Track',  0),
      Ini.ReadString  ('SubViewer 2', 'Comment',   ''),
      Ini.ReadString  ('SubViewer 2', 'Font Name', 'Tahoma'),
      Ini.ReadInteger ('SubViewer 2', 'Font Size', 24),
      Ini.ReadInteger ('SubViewer 2', 'Color',     clWhite),
      Ini.ReadBool    ('SubViewer 2', 'Bold',      True),
      Ini.ReadBool    ('SubViewer 2', 'Italic',    False),
      Ini.ReadBool    ('SubViewer 2', 'Underline', False),
      Ini.ReadBool    ('SubViewer 2', 'Strikeout', False)
    );

    // ------------------------ //
    //     SubStation Alpha     //
    // ------------------------ //
    SubtitleAPI.SetOutputSettingsSubStationAlpha(
      True,
      Ini.ReadString  ('SSA', 'Title', '<untitled>'),
      Ini.ReadString  ('SSA', 'Script', '<unknown>'),
      Ini.ReadString  ('SSA', 'Collisions', 'Normal'), //added by adenry
      Ini.ReadInteger ('SSA', 'PlayResX', 0),         //added by adenry
      Ini.ReadInteger ('SSA', 'PlayResY', 0),         //added by adenry
      Ini.ReadString  ('SSA', 'Timer', '100.0000'),    //added by adenry
      Ini.ReadString  ('SSA', 'Font name', 'Tahoma'),
      Ini.ReadInteger ('SSA', 'Font size', 24),
      Ini.ReadBool    ('SSA', 'Bold', True),
      Ini.ReadBool    ('SSA', 'Italic', False),
      Ini.ReadInteger ('SSA', 'BorderStyle', 1),
      Ini.ReadInteger ('SSA', 'Primary Color', 16777215),
      Ini.ReadInteger ('SSA', 'Secondary Color', 16777215),
      Ini.ReadInteger ('SSA', 'Tertiary Color', 16777215),
      Ini.ReadInteger ('SSA', 'Shadow Color', 12632256),
      Ini.ReadInteger ('SSA', 'Outline', 1),
      Ini.ReadInteger ('SSA', 'Shadow', 1),
      (Ini.ReadInteger('SSA', 'Alignment', 2) or (Ini.ReadInteger('SSA', 'Type of subtitles', 1) shl 2)),
      Ini.ReadInteger ('SSA', 'Left margin', 30),
      Ini.ReadInteger ('SSA', 'Right margin', 30),
      Ini.ReadInteger ('SSA', 'Vertical margin', 415),
      Ini.ReadInteger ('SSA', 'Encoding', 1) //0 changed to 1 by adenry
    );

    // ------------------------ //
    //          TMPlayer        //
    // ------------------------ //
    case Ini.ReadInteger('TMPlayer', 'Format', 0) of
      1: SubtitleAPI.SetOutputSettingsTMPlayer(True, tfTimeStruct1);
      2: SubtitleAPI.SetOutputSettingsTMPlayer(True, tfTimeStruct2);
      3: SubtitleAPI.SetOutputSettingsTMPlayer(True, tfPlusTimeStruct1);
      4: SubtitleAPI.SetOutputSettingsTMPlayer(True, tfPlusTimeStruct2) else
      SubtitleAPI.SetOutputSettingsTMPlayer(True, tfMultiline);
    end;

  finally
    Ini.Free;
  end;

  // --------------------------------------//
  //    Command line parameters reading    // moved here by adenry
  // --------------------------------------//
  for i := 1 to ParamCount do
    CommandLineProcess(ParamStr(i));


  DragAcceptFiles(frmMain.Handle, True); // For drag & drop

  //added by adenry: begin
  //REDUCE FLICKERING WHEN RESIZING MAIN FORM
  //self.DoubleBuffered := True;
  pnlVideoControls.DoubleBuffered := True;
  sbSeekBar.DoubleBuffered := True;
  btnPlay.DoubleBuffered := True;
  btnStop.DoubleBuffered := True;
  btnScrollList.DoubleBuffered := True;
  btnPrevSub.DoubleBuffered := True;
  btnNextSub.DoubleBuffered := True;
  btnRew.DoubleBuffered := True;
  btnForward.DoubleBuffered := True;
  btnAlterPlaybackRate.DoubleBuffered := True;
  btnMoveSubtitle.DoubleBuffered := True;
  btnSetShowTime.DoubleBuffered := True;
  btnSetHideTime.DoubleBuffered := True;
  btnStartSubtitle.DoubleBuffered := True;
  btnEndSubtitle.DoubleBuffered := True;
  btnSyncPoint1.DoubleBuffered := True;
  btnSyncPoint2.DoubleBuffered := True;
  btnAddSyncPoint.DoubleBuffered := True;
  btnMute.DoubleBuffered := True;
  sbVolume.DoubleBuffered := True;
  tcTimeCounter.DoubleBuffered := True;
  pnlControl.DoubleBuffered := True;
  subSubtitle.DoubleBuffered := True;
  //mmoSubtitleText.DoubleBuffered := True;
  //mmoTranslation.DoubleBuffered := True;
  mmoNotes.DoubleBuffered := True;
  sbStatusbar.DoubleBuffered := True;
  //added by adenry: end
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.spSplitterMoved(Sender: TObject);
begin
  lstSubtitles.Top    := spSplitter.Top + spSplitter.Height;
  lstSubtitles.Height := pnlParent1.Height - spSplitter.top - spSplitter.Height;
  VideoPanelRatio := pnlVideo.Height / pnlParent2.Height; //added by adenry
  if VideoPanelRatio > 0.9 then
    VideoPanelRatio := 0.9;
  UpdateSubtitlesPos;
  UpdateVideoPos;
end;

// -----------------------------------------------------------------------------

//resize main form (and smart resize of subtitle list columns)
procedure TfrmMain.FormResize(Sender: TObject);
var
  scrollWidth: Integer; //added by adenry
begin
  pnlParent2.Height := pnlEditingControls.Top - pnlParent2.Top -1; //pnlParent2.Height := lblText.Top - pnlParent2.Top - 7; //added by adenry: fixes a bug appearing in win7 for unknown reasons (the subtitiles list expands all the way to the bottom and hides the text and time controls)
  lstSubtitles.Width := pnlParent1.Width;
  if (mnuVideoPreviewMode.Checked) then
  begin
    SetVideoPreviewMode(True);
    UpdateSubtitlesPos;
    UpdateVideoPos;
    if Player.Initialized then
      SetTimeCounter(GetCurrentPos) else
      tcTimeCounter.Hide;
  end;
  SetTranslationCtrlsPositions;
  //cmbOCRScripts.Visible := (mnuShowInMainForm.Checked) and (pnlControl.Height > (cmbOCRScripts.Height + cmbOCRScripts.Top + 3)); //removed by adenry
  //chkOCRScripts.Visible := cmbOCRScripts.Visible; //added by adenry //removed by adenry
  //added by adenry: begin
  if (SmartResizeColumns) and (not CellResizeBegun) then
  begin
    scrollWidth := GetSystemMetrics(SM_CXVSCROLL) + 2 * ((2*Integer(lstSubtitles.BorderStyle))+lstSubtitles.BorderWidth);
    if mnuTranslatorMode.Checked then
    begin
      lstSubtitles.Header.Columns[3].Width :=
        Rnd(
        (
          lstSubtitles.Width -
          scrollWidth -
          lstSubtitles.Header.Columns[0].Width * Integer(mnuColNum.Checked) -
          lstSubtitles.Header.Columns[1].Width * Integer(mnuColShow.Checked) -
          lstSubtitles.Header.Columns[2].Width * Integer(mnuColHide.Checked) -
          lstSubtitles.Header.Columns[5].Width * Integer(mnuColDuration.Checked) -
          lstSubtitles.Header.Columns[6].Width * Integer(mnuColPause.Checked)
        ) * TextTransColsRatio); //was div 2
      lstSubtitles.Header.Columns[4].Width :=
        lstSubtitles.Width -
        scrollWidth -
        lstSubtitles.Header.Columns[0].Width * Integer(mnuColNum.Checked) -
        lstSubtitles.Header.Columns[1].Width * Integer(mnuColShow.Checked)-
        lstSubtitles.Header.Columns[2].Width * Integer(mnuColHide.Checked)-
        lstSubtitles.Header.Columns[3].Width * Integer(mnuColText.Checked)-
        lstSubtitles.Header.Columns[5].Width * Integer(mnuColDuration.Checked)-
        lstSubtitles.Header.Columns[6].Width * Integer(mnuColPause.Checked);
    end else
    begin
      lstSubtitles.Header.Columns[3].Width :=
        lstSubtitles.Width -
        scrollWidth -
        lstSubtitles.Header.Columns[0].Width * Integer(mnuColNum.Checked) -
        lstSubtitles.Header.Columns[1].Width * Integer(mnuColShow.Checked) -
        lstSubtitles.Header.Columns[2].Width * Integer(mnuColHide.Checked) -
        lstSubtitles.Header.Columns[5].Width * Integer(mnuColDuration.Checked) -
        lstSubtitles.Header.Columns[6].Width * Integer(mnuColPause.Checked);
    end;
    UpdateStatusbarWidths; //added later
  end;
  //added by adenry: end
  //added by adenry: begin
  if mnuShowLeftPanel.Checked then
    ShowVolumeControls(True);//ShowVolumeControls(VolumeControls);
  //added by adenry: end
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuVideoPreviewModeClick(Sender: TObject);
begin
  SetVideoPreviewMode(not mnuVideoPreviewMode.Checked);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuCloseClick(Sender: TObject);
begin
  CloseSub;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuLoadSubtitleClick(Sender: TObject);
begin
  if (dlgLoadFile.Execute) and (dlgLoadFile.FileName <> '') then
  begin
    if (dlgLoadFile.FilterIndex) <= (SubtitleAPI.FormatsCount+1) then
      LoadSubtitle(dlgLoadFile.FileName, GetInputFPS, dlgLoadFile.FilterIndex) else
    begin
      if (dlgLoadFile.FilterIndex) = (SubtitleAPI.FormatsCount+2) then
        LoadSRF(dlgLoadFile.FileName) else
        LoadPlainText(dlgLoadFile.FileName);
    end;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.FormDestroy(Sender: TObject);
var
  Ini : TMemIniFile; //TIniFile replaced with TMemIniFile by adenry
  a   : Integer;
begin
  SubtitleAPI.Free;
  SaveFPS(cmbInputFPS);

  Ini := TMemIniFile.Create(IniRoot); //TIniFile replaced with TMemIniFile by adenry
  try
    // Save current language...
    Ini.WriteString('Language', 'Language', Copy(ExtractFileName(ActualLangFile), 0, Length(ExtractFileName(ActualLangFile))-4));
    // Save recent files...
    SaveRecentFiles(Ini);
    // Free recent files TStringList...
    RecentFiles.Free;
    // Current OCR Script...
    Ini.WriteString('Information and Errors', 'OCR Definitions file', OCRDefFile);
    Ini.WriteBool('General', 'Show OCR Scripts in main form', mnuShowInMainForm.Checked);
    Ini.WriteBool('General', 'Enable OCR Scripts', chkOCRScripts.Checked); //added by adenry

    // Work with...
    if rdoDuration.Checked then
      Ini.WriteInteger('General','Work with', 1) else
    if rdoFinalTime.Checked then
      Ini.WriteInteger('General','Work with', 2) else
    if rdoBoth.Checked then
      Ini.WriteInteger('General','Work with', 3);

    // Save last folder
    Ini.WriteString('General', 'Last folder', dlgLoadFile.InitialDir);

    // Charsets...
    Ini.WriteInteger('General', 'Original charset', cmbOrgCharset.ItemIndex);
    Ini.WriteInteger('General', 'Translated charset', cmbTransCharset.ItemIndex);

    // Notes content:
    Ini.WriteString('General', 'Notes', ReplaceString(mmoNotes.Text, #13#10, '|')); //added by adenry

    // Save color of Color tag dialogue
    Ini.WriteInteger('General', 'Tag Color', dlgColor.Color); //added by adenry
    

    if mnuTranslatorMode.Checked = False then
    begin
      // Columns width for normal mode
      Ini.WriteInteger('Columns width (normal mode)', '1', lstSubtitles.Header.Columns[0].Width);
      Ini.WriteInteger('Columns width (normal mode)', '2', lstSubtitles.Header.Columns[1].Width);
      Ini.WriteInteger('Columns width (normal mode)', '3', lstSubtitles.Header.Columns[2].Width);
      if not FullScreen then  //added by adenry
        Ini.WriteInteger('Columns width (normal mode)', '4', lstSubtitles.Header.Columns[3].Width) else
        Ini.WriteInteger('Columns width (normal mode)', '4', ColTextWidth); //added by adenry
      Ini.WriteInteger('Columns width (normal mode)', '6', lstSubtitles.Header.Columns[5].Width); //added by adenry
      Ini.WriteInteger('Columns width (normal mode)', '7', lstSubtitles.Header.Columns[6].Width); //added by adenry
    end else
    begin
      // Columns width for translator mode
      Ini.WriteInteger('Columns width (translator mode)', '1', lstSubtitles.Header.Columns[0].Width);
      Ini.WriteInteger('Columns width (translator mode)', '2', lstSubtitles.Header.Columns[1].Width);
      Ini.WriteInteger('Columns width (translator mode)', '3', lstSubtitles.Header.Columns[2].Width);
      if not FullScreen then  //added by adenry
      begin
        Ini.WriteInteger('Columns width (translator mode)', '4', lstSubtitles.Header.Columns[3].Width);
        Ini.WriteInteger('Columns width (translator mode)', '5', lstSubtitles.Header.Columns[4].Width);
      end else
      begin
        Ini.WriteInteger('Columns width (translator mode)', '4', ColTextWidth);
        Ini.WriteInteger('Columns width (translator mode)', '5', ColTransWidth);
      end;
      Ini.WriteInteger('Columns width (translator mode)', '6', lstSubtitles.Header.Columns[5].Width); //added by adenry
      Ini.WriteInteger('Columns width (translator mode)', '7', lstSubtitles.Header.Columns[6].Width); //added by adenry
    end;

    // --------------------------------- //
    //          WINDOW POSITION          //
    // --------------------------------- //
    if not FullScreen then  //added by adenry
    begin
      if WindowState = wsMaximized then
      begin
        Ini.WriteBool('Main Window', 'Maximized', True);
      end else
      begin
        Ini.WriteInteger('Main Window', 'Left', Left);
        Ini.WriteInteger('Main Window', 'Top', Top);
        Ini.WriteInteger('Main Window', 'Width', Width);
        Ini.WriteInteger('Main Window', 'Height', Height);
        Ini.WriteBool   ('Main Window', 'Maximized', False);
      end;
    end
    //added by adenry: begin
    else
    begin
      if FormMainMaximized then
      begin
        Ini.WriteBool('Main Window', 'Maximized', True);
      end else
      begin
        Ini.WriteInteger('Main Window', 'Left', FormMainLeft);
        Ini.WriteInteger('Main Window', 'Top', FormMainTop);
        Ini.WriteInteger('Main Window', 'Width', FormMainWidth);
        Ini.WriteInteger('Main Window', 'Height', FormMainHeight);
        Ini.WriteBool   ('Main Window', 'Maximized', False);
      end;
    end;
    //added by adenry: end
    Ini.WriteFloat('Main Window', 'VPRatio', VideoPanelRatio); //added by adenry
    Ini.WriteInteger('Main Window', 'Timing Controls Width', pnlTimingControls.Width); //added by adenry

    // ----------------- //
    //   Video preview   //
    // ----------------- //
    Ini.WriteInteger('Video preview', 'Video panel height', pnlVideo.Height);
    if mnu10P.Checked then a := 1 else
    if mnu20P.Checked then a := 2 else
    if mnu30P.Checked then a := 3 else
    if mnu40P.Checked then a := 4 else
    if mnu50P.Checked then a := 5 else
    if mnu60P.Checked then a := 6 else
    if mnu70P.Checked then a := 7 else
    if mnu80P.Checked then a := 8 else
    if mnu90P.Checked then a := 9 else
    if mnu200P.Checked then a := 10 else
    if mnu300P.Checked then a := 11 else
    if mnu400P.Checked then a := 12 else
      a := 0;
    Ini.WriteInteger('Video preview', 'Playback rate', a);
    if FullScreen and not ScrollListState then ScrollList := False; //added by adenry
    Ini.WriteBool   ('Video preview', 'Scroll list', ScrollList);
    Ini.WriteBool   ('Video preview', 'Displaying original', mnuDisplayOriginal.Checked);
    Ini.WriteBool   ('Video preview', 'Show subtitles', mnuShowSubtitles.Checked);
    Ini.WriteInteger('Video preview', 'Volume', sbVolume.Position); //added by adenry
    Ini.WriteFloat  ('Video preview subtitles', 'Subtitle top shift', subSubtitleTopShift); //added by adenry
    Ini.WriteBool   ('Video preview', 'Use VMR9', mnuVMR9VidRend.Checked); //added by adenry
    Ini.WriteFloat  ('Video preview', 'Video Aspect Ratio', VideoAspectRatio); //added by adenry

    // ---------------- //
    //     Interfaces   //
    // ---------------- //
    Ini.WriteBool('Interface', 'Translator mode', mnuTranslatorMode.Checked);
    //added by adenry: begin
    Ini.WriteBool('Interface', 'Col Num visible',       mnuColNum.Checked);
    Ini.WriteBool('Interface', 'Col Show visible',      mnuColShow.Checked);
    Ini.WriteBool('Interface', 'Col Hide visible',      mnuColHide.Checked);
    Ini.WriteBool('Interface', 'Col Text visible',      mnuColText.Checked);
    Ini.WriteBool('Interface', 'Col Duration visible',  mnuColDuration.Checked);
    Ini.WriteBool('Interface', 'Col Pause visible',     mnuColPause.Checked);
    //added by adenry: end
    //added by adenry: begin
    Ini.WriteString('Interface', 'Cols positions',
      IntToStr(lstSubtitles.Header.Columns[0].Position) + ',' +
      IntToStr(lstSubtitles.Header.Columns[1].Position) + ',' +
      IntToStr(lstSubtitles.Header.Columns[2].Position) + ',' +
      IntToStr(lstSubtitles.Header.Columns[3].Position) + ',' +
      IntToStr(lstSubtitles.Header.Columns[4].Position) + ',' +
      IntToStr(lstSubtitles.Header.Columns[5].Position) + ',' +
      IntToStr(lstSubtitles.Header.Columns[6].Position) + ','
    );
    //added by adenry: end
    Ini.WriteBool('Interface', 'Video Preview Mode', mnuVideoPreviewMode.Checked);
    Ini.WriteBool('Interface', 'Show left panel', mnuShowLeftPanel.Checked);
    Ini.WriteBool('Interface', 'Show time controls', mnuShowTimeControls.Checked);
    Ini.WriteBool('Interface', 'Use in-place edition', mnuUseInPlaceEdition.Checked);
    Ini.WriteBool('Interface', 'Show lines count', mnuShowLinesCount.Checked); //added by adenry
    Ini.WriteBool('Interface', 'Show notes in left panel', mnuShowNotesInLeftPanel.Checked); //added by adenry
    Ini.WriteBool('Interface', 'Show CPS hint boxes', mnuShowCPSHintBoxes.Checked); //added by adenry
    Ini.WriteBool('Interface', 'Show time control buttons', mnuShowTimeControlButtons.Checked); //added by adenry

    // ---------------- //
    //        View      //
    // ---------------- //
    Ini.WriteBool('View', 'Toolbar', mnuToolbar.Checked);
    Ini.WriteBool('View', 'Style Bars', mnuTextStyleBars.Checked);
    Ini.WriteBool('View', 'Statusbar', mnuStatusbar.Checked);
    Ini.WriteBool('View', 'Visual sub representation', mnuVisualSubRepr.Checked);
    // ---------------- //

    ClearUndoList(UndoList);
    ClearUndoList(RedoList);

    //added by adenry: begin
    //free created labels
    for a := 1 to lblText.Tag do
      TLabel(FindComponent('lblText'+IntToStr(a))).Free;
    for a := 1 to lblTranslation.Tag do
      TLabel(FindComponent('lblTranslation'+IntToStr(a))).Free;
    //lblCreator.Free;
    //added by adenry: end

    VideoExts.Free;  //added by adenry
    AudioExts.Free;  //added by adenry
    VideoAudioExts.Free;  //added by adenry
  finally
    Ini.UpdateFile; //added by adenry
    Ini.Free;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuFileClick(Sender: TObject);
begin
  mnuRecent.Visible           := (RecentFiles.Count > 0) and (RFMaxCount > 0);
  mnuLoadSubtitle.Enabled     := mnuTranslatorMode.Checked = False;
  mnuSaveFile.Enabled         := (lstSubtitles.RootNodeCount > 0);
  mnuSaveFileAs.Enabled       := (lstSubtitles.RootNodeCount > 0);
  mnuTranslatorSave.Enabled   := (lstSubtitles.RootNodeCount > 0);
  mnuSaveProject.Enabled      := (lstSubtitles.RootNodeCount > 0);
  mnuSaveOriginal.Enabled     := (lstSubtitles.RootNodeCount > 0);
  mnuSaveTranslated.Enabled   := (lstSubtitles.RootNodeCount > 0);
  mnuSaveOriginalAs.Enabled   := (lstSubtitles.RootNodeCount > 0) and (mnuTranslatorMode.Checked);
  mnuSaveTranslatedAs.Enabled := (lstSubtitles.RootNodeCount > 0) and (mnuTranslatorMode.Checked);
  mnuLoadTranslated.Enabled   := (OrgFile <> '');
  mnuSaveMarking.Enabled      := lstSubtitles.RootNodeCount > 0; //added by adenry
  mnuClose.Enabled            := lstSubtitles.RootNodeCount > 0;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuEditClick(Sender: TObject);
begin
  mnuInsertSubtitle.Enabled    := InterfaceEnabled;
  mnuInsertBefore.Enabled      := InterfaceEnabled;
  mnuRemoveSelected.Enabled    := lstSubtitles.SelectedCount > 0;
  mnuInsertSymbol.Enabled      := (ActiveControl = mmoSubtitleText) or (ActiveControl = mmoTranslation) or (ActiveControl = mmoNotes);
  //removed by adenry: begin
  //mnuCut.Enabled               := (lstSubtitles.Focused and (lstSubtitles.SelectedCount > 0)) or mmoSubtitleText.Focused or mmoTranslation.Focused or mmoNotes.Focused; //all Focused checks added by adenry
  //mnuCopy.Enabled              := mnuCut.Enabled or tmeShow.Focused or tmeHide.Focused or tmeDuration.Focused or tmePause.Focused; //all Focused checks added by adenry. Old: //mnuCut.Enabled; //lstSubtitles.SelectedCount > 0; //modified by adenry
  mnuPaste.Enabled             := (ClipBoard.HasFormat(CF_TEXT));// and (InterfaceEnabled) and (lstSubtitles.Focused or mmoSubtitleText.Focused or mmoTranslation.Focused or tmeShow.Focused or tmeHide.Focused or tmeDuration.Focused or tmePause.Focused or mmoNotes.Focused); //all Focused checks added by adenry
  //mnuSelectAll.Enabled         := (lstSubtitles.RootNodeCount > 0) or mmoSubtitleText.Focused or mmoTranslation.Focused or mmoNotes.Focused;//or mmoSubtitleText.Focused or mmoTranslation.Focused or mmoNotes.Focused added by adenry
  //removed by adenry: end
  mnuInvertSelection.Enabled   := lstSubtitles.RootNodeCount > 0;
  // -------
  mnuTimings.Enabled           := lstSubtitles.RootNodeCount > 0;
  mnuShiftPlusMS.Caption       := Format(ShiftMS, ['+' + IntToStr(ShiftTime)]);
  mnuShiftLessMS.Caption       := Format(ShiftMS, ['-' + IntToStr(ShiftTime)]);
  mnuTexts.Enabled             := lstSubtitles.RootNodeCount > 0;
  mnuDivideLines.Enabled       := (lstSubtitles.RootNodeCount > 0) and (lstSubtitles.SelectedCount = 1) and (Assigned(lstSubtitles.FocusedNode)) and ((Length(RemoveSWTags(GetSubText(lstSubtitles.FocusedNode),True,True,True,True)) > BreakLineAfter) or (Pos(#13#10, GetSubText(lstSubtitles.FocusedNode)) > 0));
  mnuFastDivideLines.Enabled   := mnuDivideLines.Enabled or (lstSubtitles.RootNodeCount > 0) and (lstSubtitles.SelectedCount > 1); // or.... added by adenry
  mnuSubtitles.Enabled         := lstSubtitles.RootNodeCount > 0;
  mnuEffects.Enabled           := GetSubText(frmMain.lstSubtitles.FocusedNode) <> '';
  mnuCombineSubtitles.Enabled  := lstSubtitles.SelectedCount > 1;
  mnuSort.Enabled              := lstSubtitles.RootNodeCount > 1;
  // -------
  mnuSwap.Enabled := (mnuTranslatorMode.Checked) and (InterfaceEnabled);
  //added by adenry: begin
  mnuShiftPlusMS.Enabled          := lstSubtitles.SelectedCount > 0;
  mnuShiftLessMS.Enabled          := lstSubtitles.SelectedCount > 0;
  mnuExtendLength.Enabled         := (lstSubtitles.SelectedCount>0) and ((lstSubtitles.SelectedCount > 1) or (lstSubtitles.GetFirstSelected<>lstSubtitles.GetLast));
  mnuExtendLength2.Enabled        := (lstSubtitles.SelectedCount>0) and ((lstSubtitles.SelectedCount > 1) or (lstSubtitles.GetFirstSelected<>lstSubtitles.GetFirst));
  mnuShiftToNext.Enabled          := (lstSubtitles.SelectedCount>0) and (GetLastSelected<>lstSubtitles.GetLast);
  mnuShiftToPrevious.Enabled      := (lstSubtitles.SelectedCount>0) and (lstSubtitles.GetFirstSelected<>lstSubtitles.GetFirst);
  mnuFastSmartLineAdjust.Enabled  := lstSubtitles.SelectedCount > 0;
  mnuFastUnbreakSubtitles.Enabled := lstSubtitles.SelectedCount > 0;
  mnuMarkSelectedSubs.Enabled     := lstSubtitles.SelectedCount > 0;
  mnuUnMarkSelectedSubs.Enabled   := lstSubtitles.SelectedCount > 0;
  //added by adenry: end
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuSearchClick(Sender: TObject);
begin
  mnuSubSearch.Enabled        := lstSubtitles.RootNodeCount > 0;
  mnuFindNext.Enabled         := (lstSubtitles.RootNodeCount > 0) and (SearchWord <> '');
  mnuSearchAndReplace.Enabled := lstSubtitles.RootNodeCount > 0;
  mnuGoToLineNumber.Enabled   := lstSubtitles.RootNodeCount > 0;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuToolsClick(Sender: TObject);
begin
  mnuSpellCheck.Enabled           := lstSubtitles.RootNodeCount > 0;
  mnuSplitSubtitle.Enabled        := lstSubtitles.RootNodeCount > 1;
  //mnuInformationAndErrors.Enabled := lstSubtitles.RootNodeCount > 0; //removed by adenry
  //mnuVariousInformation.Enabled   := InterfaceEnabled;
  mnuRecheckErrors.Enabled        := (lstSubtitles.RootNodeCount > 0) and (AdvancedErrorMarking); //MarkErrorsInList replaced with AdvancedErrorMarking by adenry
  mnuFixAllErrors.Enabled         := lstSubtitles.RootNodeCount > 0;
  mnuFixErrorsInSelSubs.Enabled   := lstSubtitles.SelectedCount > 0;
  mnuJumpToNextError.Enabled      := lstSubtitles.RootNodeCount > 0;
  mnuJumpToPrevError.Enabled      := lstSubtitles.RootNodeCount > 0; //added by adenry
  mnuExternalPreview.Enabled      := lstSubtitles.RootNodeCount > 0;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuExitClick(Sender: TObject);
begin
  frmMain.Close;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuClearListClick(Sender: TObject);
begin
  RecentFiles.Clear;
  UpdateRFMenus;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.lstSubtitlesFocusChanged(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex);
begin
  //RefreshTimes; //removed by adenry - OnChange event handler handles it now

  //added by adenry
  if (Column in [1..6]) then //4 changed to 6 so that Duration and Pause could also be edited "in-place"
    lstSubtitles.Header.MainColumn := Column; //so that the columns could be edited "in-place" - bug fix!

  //added by adenry later to fix a selection/deselection bug:
  if lstSubtitles.SelectedCount > 1 then
    lstSubtitles.Header.MainColumn := -1;

  tmrFastTypingUndoBind.Enabled := False; //node changed, don't bind next text change undo
  tmrTimesMouseWheelUndoBind.Enabled := False; //node changed, don't bind next time change undo
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.lstSubtitlesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
//removed by adenry: begin
{begin
  if Key = VK_DELETE then
    DeleteSelectedNodes;
end;}
//removed by adenry: end

//added by adenry: begin
var
  Node, StartNode, LastSelNode  : PVirtualNode;
  Data                          : PSubtitleItem;
  VisibleNodesCount             : Integer;
  CheckToSelStartNode           : Boolean;
begin
  ShouldRefreshTimes := True; //added by adenry to refresh time and text controls after key down
  case Key of
    // Add support for SHIFT+PgUp and SHIFT+PgDown selection, as the current version of VirtualTrees does not support it
    VK_NEXT, VK_PRIOR :
      if lstSubtitles.TotalCount > 0 then
      if ssShift in Shift then
      begin
        ShouldRefreshTimes := False; //added later
        VisibleNodesCount := Ceil( lstSubtitles.ClientHeight / lstSubtitles.DefaultNodeHeight );
        Node := lstSubtitles.FocusedNode;
        if not Assigned(Node) then Node := lstSubtitles.GetFirst;
        StartNode := Node;
        lstSubtitles.Selected[StartNode] := False;
        if Key = VK_NEXT then
          LastSelNode := GetLastSelected else
          LastSelNode := lstSubtitles.GetFirstSelected;
        CheckToSelStartNode := True;
        while VisibleNodesCount > 0 do
        begin
          if Key = VK_NEXT then
            Node := Node.NextSibling else
            Node := Node.PrevSibling;
          if not Assigned(Node) then break;
          lstSubtitles.Selected[Node] := not lstSubtitles.Selected[Node];
          lstSubtitles.FocusedNode := Node;
          if Node = LastSelNode then
          begin
            CheckToSelStartNode := False;
            if lstSubtitles.Selected[StartNode] = False then
              lstSubtitles.Selected[LastSelNode] := True;
          end;
          if lstSubtitles.Selected[Node] and CheckToSelStartNode then
            lstSubtitles.Selected[StartNode] := True;
          Dec(VisibleNodesCount);
        end;
        lstSubtitles.Selected[lstSubtitles.FocusedNode] := True;
        RefreshTimes; //added later
        //disallow column focus change
        Key := 0;
      end;
    VK_DELETE : //Delete selected subtitles
      DeleteSelectedNodes;
    VK_SPACE  : //Mark/Unmark selected subtitles
      begin
        Node := lstSubtitles.GetFirstSelected;
        while Assigned(Node) do
        begin
          Data := lstSubtitles.GetNodeData(Node);
          if not Data.Marked then //if even one subtitle is not marked, mark all
          begin
            mnuMarkSelectedSubsClick(Sender);
            exit;
          end;
          Node := lstSubtitles.GetNextSelected(Node);
        end;
        //all subtitles are marked, so unmark them all
        mnuUnMarkSelectedSubsClick(Sender);
      end;
    //added by adenry later: enable Show Time and Hide Time editing through S/E/D + Mouse Wheel Up/Down
    Ord('S'):
    begin
      if PressedKeyInLstSubtitles = 0 then PressedKeyInLstSubtitles := 1;
      tmeShow.Font.Style := tmeShow.Font.Style + [fsUnderline];
      tmeHide.Font.Style := tmeHide.Font.Style - [fsUnderline];
      tmePause.Font.Style := tmePause.Font.Style - [fsUnderline];
      tmeDuration.Font.Style := tmeDuration.Font.Style - [fsUnderline];
    end;
    Ord('E'):
    begin
      if PressedKeyInLstSubtitles = 0 then PressedKeyInLstSubtitles := 2;
      tmeHide.Font.Style := tmeHide.Font.Style + [fsUnderline];
      tmeShow.Font.Style := tmeShow.Font.Style - [fsUnderline];
      tmePause.Font.Style := tmePause.Font.Style - [fsUnderline];
      tmeDuration.Font.Style := tmeDuration.Font.Style - [fsUnderline];
    end;
    Ord('D'):
    begin
      if PressedKeyInLstSubtitles = 0 then PressedKeyInLstSubtitles := 3;
      tmeHide.Font.Style := tmeHide.Font.Style + [fsUnderline];
      tmeShow.Font.Style := tmeShow.Font.Style - [fsUnderline];
      tmePause.Font.Style := tmePause.Font.Style - [fsUnderline];
      tmeDuration.Font.Style := tmeDuration.Font.Style - [fsUnderline];      
    end;
    //added by adenry later: Enable setting and removing style and color tags
    Ord('B'), Ord('O'):
      mnuBold.Click;
    Ord('I'):
      mnuItalic.Click;
    Ord('U'):
      mnuUnderline.Click;
    Ord('C'), Ord('Y'):
      SetColor(False, False, True, True, True);
    VK_BACK:
    begin
      mnuRemoveAllTags.Click;
      Key := 0;
    end;
    //added by adenry later: Enable entering In-Place Edition mode and changing the focused column
    VK_RETURN:
    begin
      SetVideoPos(GetStartTime(lstSubtitles.FocusedNode));
      if (lstSubtitles.SelectedCount = 1) then
        lstSubtitles.EditNode(lstSubtitles.FocusedNode, lstSubtitles.FocusedColumn);
    end;
    VK_LEFT:
      lstSubtitles.FocusedColumn := GetTreePrevColumn(lstSubtitles, lstSubtitles.FocusedColumn);
    VK_RIGHT:
      lstSubtitles.FocusedColumn := GetTreeNextColumn(lstSubtitles, lstSubtitles.FocusedColumn);
    //added by adenry later: Select only the focused subtitle (previously done by the component with BACKSPACE, but now BACKSPACE removes all tags)
    VK_ESCAPE:
    begin
      if lstSubtitles.SelectedCount <> 1 then
      begin
        Node := lstSubtitles.FocusedNode;
        UnSelectAll(lstSubtitles);
        lstSubtitles.Selected[Node] := True;
      end;
    end;
  end;

end;
//added by adenry: end

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuOpenMovieClick(Sender: TObject);
begin
  //dlgLoadFile.Filter := AllSupportedFiles + '|*.asf;*.avi;*.mp4;*.mkv;*.divx;*.mp3;*.mpg;*.mpeg;*.m1v;*.ogm;*.ogg;*.qt;*.vob;*.wav;*.wmv|' + 'ASF (*.asf)|*.asf|AVI (*.avi)|*.avi|OGM (*.ogm)|*.ogm|OGG (*.ogg)|*.ogg|Matroska (*.mkv)|*.mkv|DivX (*.mp4; *.divx)|*.mp4; ' + '*.divx|MP3 (*.mp3)|*.mp3|MPEG (*.mpg; *.mpeg; *.m1v)|*.mpg; *.mpeg; *.m1v|QuickTime (*.qt)|*.qt|VOB (*.vob)|*.vob|WAV (*.wav)|*.wmv|WMV (*.wmv)|*.wmv'; //removed by adenry
  dlgLoadFile.Filter := GetVideoFilesFilterString; //added by adenry
  if (dlgLoadFile.Execute) and (dlgLoadFile.FileName <> '') then
  begin
    //AudioStreamNum := 0; //added by adenry
    if LoadMovie(dlgLoadFile.FileName) = False then
      MsgBox(Format(ErrorMsg[05], [dlgLoadFile.FileName]), BTN_OK, '', '', MB_ICONERROR, frmMain) else
    begin
      if mnuVideoPreviewMode.Checked = False then
        SetVideoPreviewMode(True);
    end;
  end;
  dlgLoadFile.Filter := SubtitleAPI.FillDialogFilter(AllSupportedFiles) + ID_SRF + '|' + ID_PLAINTEXT;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuCloseMovieClick(Sender: TObject);
begin
  if FullScreen then ToggleFullScreen; //added by adenry
  FreeFile;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.tmrVideoTimer(Sender: TObject);
var
  //removed by adenry
  {Node         : PVirtualNode;
  Data         : PSubtitleItem;
  LastNodeData : PSubtitleItem;
  SubtitleText : String;
  CurrTime     : Integer;}
  CurrentPos   : Int64;
begin
  if (Player.Initialized) and (mnuVideoPreviewMode.Checked = True) then
  begin
    //added by adenry: begin
    CurrentPos := GetCurrentPos;
    // Display subtitle
    UpdateSubSubtitleTextAndVisibility; //added by adenry
    // Refresh seekbar, timecounter, and Play/Pause buttons
    if VideoDuration > 0 then
    if Playing then //added by adenry - when not playing we need the seekbar and timecounter unchanged because of the video preview when paused. Also, we don't want the video to jump to the beginning when seeked to the end of the video when paused
    begin
      if CurrentPos >= VideoDuration then //= replaced with >= by adenry
      begin
        SetVideoPos(VideoDuration);
        Player.MediaControl.Pause; //Stop changed to Pause by adenry
        Playing := False;
        tmrVideo.Enabled := False;
      end else
      begin
        sbSeekBar.Position := CurrentPos;
        SetTimeCounter(CurrentPos);
      end;
    end;
    //added by adenry: end
    
    //removed by adenry: begin
    {
    Player.MediaSeeking.GetCurrentPosition(CurrentPos);
    CurrTime := CurrentPos div 10000;
    // Display subtitle
    if lstSubtitles.RootNodeCount > 0 then
    begin
      Node := lstSubtitles.GetFirst;
      LastNodeData := lstSubtitles.GetNodeData(lstSubtitles.GetLast);
      while Assigned(Node) do
      begin
        Data := lstSubtitles.GetNodeData(Node);
        if (CurrTime >= Data.InitialTime) and (CurrTime <= Data.FinalTime) then
        begin
          if mnuTranslatorMode.Checked then
          begin
            if mnuDisplayOriginal.Checked then
              SubtitleText := Data.Text else
              SubtitleText := Data.Translation;
          end else
            SubtitleText := Data.Text;

          //added by adenry: begin
          if MarkingInVideoPreview then
            if Data.Marked then
              subSubtitle.Font.Color := MarkingInVideoPreviewColor else
              subSubtitle.Font.Color := subSubtitle.TextColor; //subSubtitle.Font.Color stores the color for marking
          //added by adenry: end

          if subSubtitle.Text <> SubtitleText then
          begin
            subSubtitle.Hide;
            subSubtitle.Font.Charset := OrgCharset;
            subSubtitle.Text := SubtitleText;
            //added by adenry: begin
            if AlignLeftLineWithDash and (
            (Pos(#13#10+'-',RemoveSWTags(SubtitleText,True,True,True,True,True)) > 0) or
            ((OrgCharset in DashCharsets1)and(Pos(#13#10+#150,RemoveSWTags(SubtitleText,True,True,True,True,True)) > 0)) or
            ((OrgCharset in DashCharsets1)and(Pos(#13#10+#151,RemoveSWTags(SubtitleText,True,True,True,True,True)) > 0)) or
            ((OrgCharset in DashCharsets2)and(Pos(#13#10+#173,RemoveSWTags(SubtitleText,True,True,True,True,True)) > 0)) ) then
              subSubtitle.Alignment := taLeftJustify else
              subSubtitle.Alignment := Classes.taCenter;
            //added by adenry: end
            UpdateSubtitlesPos;
            if ScrollList then
            begin
              UnSelectAll(lstSubtitles);
              lstSubtitles.ScrollIntoView(Node, True);
              lstSubtitles.Selected[Node] := True;
              lstSubtitles.FocusedNode    := Node;
              RefreshTimes; //added by adenry
            end;
            if mnuShowSubtitles.Checked then
              subSubtitle.Show;
          end;
          Break;
        end
        else if (CurrTime < Data.FinalTime) or (CurrTime > LastNodeData.FinalTime) then
        begin
          subSubtitle.Visible := False;
          subSubtitle.Text := '';
          Break;
        end;
        Node := Node.NextSibling;
      end;
    end;
    // Refresh seekbar, timecounter, and Play/Pause buttons
    if VideoDuration > 0 then
    if Playing then //added by adenry - when not playing we need the seekbar and timecounter unchanged because of the video preview when paused. Also, we don't want the video to jump to the beginning when seeked to the end of the video when paused
    begin
      if CurrentPos >= (VideoDuration * 10000) then //= replaced with >= by adenry
      begin
        //CurrentPos := 0; //removed by adenry
        CurrentPos := VideoDuration * 10000; //added by adenry
        Player.MediaSeeking.SetPositions(CurrentPos, AM_SEEKING_ABSOLUTEPOSITIONING, CurrentPos, AM_SEEKING_NOPOSITIONING);
        Player.MediaControl.Pause; //Stop changed to Pause by adenry
        Playing := False;
        tmrVideo.Enabled := False;
        btnPlay.Show;
        btnPause.Hide;
        //sbSeekBar.Position := 0; //removed by adenry
        sbSeekBar.Position := VideoDuration; //added by adenry
        SetTimeCounter(VideoDuration); //added by adenry
      end else
      begin
        sbSeekBar.Position := CurrentPos div 10000;
        SetTimeCounter(CurrentPos div 10000);
      end;
    end;
    }
    //removed by adenry: end
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.btnPlayClick(Sender: TObject);
begin
  Pause;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuPlayPauseClick(Sender: TObject);
begin
  Pause;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.btnStopClick(Sender: TObject);
begin
  Stop;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.tmrSeekRewFFTimer(Sender: TObject);
begin
  //while (Seeking) do //removed by adenry
  if Seeking then //added by adenry
  begin
    Application.ProcessMessages;
    if btnRew.State = sPressed then
      SetVideoPos(GetCurrentPos - RewFFTime) else
    if btnForward.State = sPressed then
      SetVideoPos(GetCurrentPos + RewFFTime);
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.btnRewMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  SetVideoPos(GetCurrentPos - RewFFTime);
  Seeking := True;
  tmrSeekRewFF          := TTimer.Create(Application);
  tmrSeekRewFF.Interval := 50; //500 changed to 50 by adenry
  tmrSeekRewFF.OnTimer  := tmrSeekRewFFTimer;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.btnRewMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Seeking := False;
  tmrSeekRewFF.Enabled := False;
  tmrSeekRewFF.Free;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.btnForwardMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  SetVideoPos(GetCurrentPos + RewFFTime);
  Seeking := True;
  tmrSeekRewFF          := TTimer.Create(Application);
  tmrSeekRewFF.Interval := 50; //500 changed to 50 by adenry
  tmrSeekRewFF.OnTimer  := tmrSeekRewFFTimer;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.btnForwardMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Seeking := False;
  tmrSeekRewFF.Enabled := False;
  tmrSeekRewFF.Free;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuStopClick(Sender: TObject);
begin
  Stop;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuMovieClick(Sender: TObject);
begin
  mnuCloseMovie.Enabled := Player.Initialized;
  mnuMovieInfo.Enabled  := Player.Initialized;
  //added by adenry: begin
  mnuAudioStream.Enabled:= Player.Initialized;
  mnuAudioStreamPopup.Enabled := mnuAudioStream.Enabled;
  if mnuAudioStream.Count = 0 then
  begin
    mnuAudioStream.Enabled := False;
    mnuAudioStreamPopup.Enabled := False;
  end;
  
  //added by adenry: end
  // ------
  mnuPlayback.Enabled   := Player.Initialized;
  mnuPlayPause.Enabled  := Player.Initialized;
  mnuStop.Enabled       := Player.Initialized;
  mnuBack5Sec.Enabled   := Player.Initialized;
  mnuFwd5Sec.Enabled    := Player.Initialized;
  // ------
  mnuPlaybackRate.Enabled := Player.Initialized;
  mnu50P.Enabled          := Player.Initialized;
  mnu60P.Enabled          := Player.Initialized;
  mnu70P.Enabled          := Player.Initialized;
  mnu80P.Enabled          := Player.Initialized;
  mnu90P.Enabled          := Player.Initialized;
  mnu100P.Enabled         := Player.Initialized;
  // ------
  mnuVidSubtitles.Enabled  := Player.Initialized;
  mnuSetShowTime.Enabled   := Player.Initialized;
  mnuSetHideTime.Enabled   := Player.Initialized;
  mnuStartSubtitle.Enabled := Player.Initialized;
  mnuEndSubtitle.Enabled   := Player.Initialized;
  // ------
  mnuSynchronization.Enabled := (Player.Initialized) and (lstSubtitles.RootNodeCount > 0);
  mnuFirstSyncPoint.Enabled  := (Player.Initialized) and (lstSubtitles.RootNodeCount > 0);
  mnuLastSyncPoint.Enabled   := (Player.Initialized) and (lstSubtitles.RootNodeCount > 0);
  mnuAddSyncPoint.Enabled    := (Player.Initialized) and (lstSubtitles.RootNodeCount > 0);
  // ------
  mnuSubtitleToDisplay.Visible    := mnuTranslatorMode.Checked;
  mnuSaveMediaStartupFile.Enabled := (OrgFile <> '') and (MovieFile <> '');
  mnuSaveASX.Enabled              := (OrgFile <> '') and (MovieFile <> '');
  mnuSaveSMIL.Enabled             := (OrgFile <> '') and (MovieFile <> '');
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuSubSettingsClick(Sender: TObject);
begin
  frmSettings := TfrmSettings.Create(Application);
  frmSettings.ShowModal;
  // Apply always on top
  if frmSettings.chkAlwaysOnTop.Checked then
    SetWindowPos(frmMain.Handle, HWND_TOPMOST, frmMain.Left, frmMain.Top, frmMain.Width, frmMain.Height, SWP_NOMOVE + SWP_NOSIZE) else
  begin
    SetWindowPos(frmMain.Handle, HWND_NOTOPMOST, frmMain.Left, frmMain.Top, frmMain.Width, frmMain.Height, SWP_NOMOVE + SWP_NOSIZE);
    RestoreTopMostWindows; //added by adenry
  end;
  frmSettings.Free;
  FormResize(frmMain); //added later
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuOutputSettingsClick(Sender: TObject);
begin
  frmOutputSettings := TfrmOutputSettings.Create(Application);
  frmOutputSettings.ShowModal;
  frmOutputSettings.Free;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.rdoDurationClick(Sender: TObject);
begin
  if InterfaceEnabled then
  begin
    lblHide.Enabled     := False;
    tmeHide.Enabled     := False;
    lblDuration.Enabled := True;
    tmeDuration.Enabled := True;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.rdoFinalTimeClick(Sender: TObject);
begin
  if InterfaceEnabled then
  begin
    lblHide.Enabled     := True;
    tmeHide.Enabled     := True;
    lblDuration.Enabled := False;
    tmeDuration.Enabled := False;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.rdoBothClick(Sender: TObject);
begin
  if InterfaceEnabled then
  begin
    lblHide.Enabled     := True;
    tmeHide.Enabled     := True;
    lblDuration.Enabled := True;
    tmeDuration.Enabled := True;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.tmeShowTimeChangeFromEditOnly(Sender: TObject; NewTime: Cardinal);
var
  Node, NextSelNode: PVirtualNode; //added by adenry
begin
  //if (lstSubtitles.SelectedCount = 1) then
  //added by adenry: begin
  Node := lstSubtitles.GetFirstSelected;
  while Assigned(Node) do
  begin
    NextSelNode := lstSubtitles.GetNextSelected(Node);
    ChangeShowTime(Node, NewTime, Assigned(NextSelNode)); //most of tmeShowTimeChangeFromEditOnly went in ChangeShowTime
    Node := NextSelNode;
  end;
  //added by adenry: end
end;

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.ChangeShowTime(Node: PVirtualNode; NewShowTime: Cardinal; BindUndoToNext: Boolean = False; BindUndoToPrev: Boolean = False; Shift: Boolean = False; UndoActionName: TUndoActionName = uanShowEdit);
var
  UndoAction: PUndoAction;
  ShowTime, HideTime, NewHideTime: Integer; //added by adenry
begin
  ShowTime := GetStartTime(Node);
  HideTime := GetFinalTime(Node);
  if NewShowTime > MAX_TIME then NewShowTime := 0; //added later
  if NewShowTime <> ShowTime then
  begin
    //added by adenry: bind to previous when fast scrolling
    if BindUndoToPrev and (UndoList.Count > 0) then
      if PUndoAction(UndoList.Items[UndoList.Count-1])^.UndoActionName = uanShowEdit then //don't bind to other time modifications
        PUndoAction(UndoList.Items[UndoList.Count-1])^.BindToNext := True;

    New(UndoAction);
    UndoAction^.UndoActionType                 := uaTimeChange;
    UndoAction^.UndoActionName                 := UndoActionName; //added by adenry
    UndoAction^.BufferSize                     := SizeOf(TTimeChange);
    UndoAction^.Buffer                         := AllocMem(UndoAction^.BufferSize);
    UndoAction^.Node                           := Node; //lstSubtitles.FocusedNode; //modified by adenry
    UndoAction^.LineNumber                     := UndoAction^.Node.Index;
    UndoAction^.BindToNext                     := BindUndoToNext; //False;
    PTimeChange(UndoAction^.Buffer)^.StartTime := ShowTime;
    PTimeChange(UndoAction^.Buffer)^.FinalTime := -1;
    //added by adenry: begin
    if (GetKeyState(VK_SHIFT) < 0) or Shift then //Shift subtitle - change both SHOW and HIDE values with the same amount
    begin
      PTimeChange(UndoAction^.Buffer)^.FinalTime := HideTime;
      SetFinalTime(Node, NewShowTime + (HideTime - ShowTime)); //lstSubtitles.FocusedNode; //modified by adenry
      AutoRecheckNodeErrorsAndRepaint(Node.NextSibling, PauseErrors); //lstSubtitles.FocusedNode; //modified by adenry
    end else
    //Keep minimum duration
    if KeepMinDur and (lstSubtitles.SelectedCount = 1) then
    begin
      if ((HideTime - NewShowTime < KeepMinDurValue) OR (HideTime < NewShowTime)) then
      begin
        NewHideTime := NewShowTime + KeepMinDurValue;
        //Check for overlaping with next subtitle
        if (KeepMinDurDontOverlap) and (Node <> lstSubtitles.GetLast) then
        begin
          if GetStartTime(Node.NextSibling) - NewHideTime < TooShortPause then
          begin
            NewHideTime := GetStartTime(Node.NextSibling) - TooShortPause;
            if NewHideTime < HideTime then
              NewHideTime := HideTime;
          end;
        end;
        //set new Hide time:
        if NewHideTime <> HideTime then
        begin
          PTimeChange(UndoAction^.Buffer)^.FinalTime := HideTime;
          SetFinalTime(Node, NewHideTime); //lstSubtitles.FocusedNode; //modified by adenry
          AutoRecheckNodeErrorsAndRepaint(Node.NextSibling, PauseErrors); //lstSubtitles.FocusedNode; //modified by adenry
        end;
      end;
    end;
    //added by adenry: end
    AddUndo(UndoAction);

    SetStartTime(Node, NewShowTime); //lstSubtitles.FocusedNode; //modified by adenry
    RefreshTimes;
    AutoRecheckNodeErrors(Node, TimeErrors); //added by adenry //lstSubtitles.FocusedNode; //modified by adenry
    lstSubtitles.RepaintNode(Node); //lstSubtitles.FocusedNode; //modified by adenry
  end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

procedure TfrmMain.tmeHideTimeChangeFromEditOnly(Sender: TObject; NewTime: Cardinal);
var
  Node, NextSelNode: PVirtualNode; //added by adenry
begin
  //if (lstSubtitles.SelectedCount = 1) then
  //added by adenry: begin
  Node := lstSubtitles.GetFirstSelected;
  while Assigned(Node) do
  begin
    NextSelNode := lstSubtitles.GetNextSelected(Node);
    ChangeHideTime(Node, NewTime, Assigned(NextSelNode)); //most of tmeHideTimeChangeFromEditOnly went in this procedure
    Node := NextSelNode;
  end;
  //added by adenry: end
end;

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.ChangeHideTime(Node: PVirtualNode; NewHideTime: Cardinal; BindUndoToNext: Boolean = False; BindUndoToPrev: Boolean = False; Shift: Boolean = False; UndoActionName: TUndoActionName = uanHideEdit);
var
  UndoAction: PUndoAction;
  ShowTime, HideTime, NewShowTime: Integer; //added by adenry
begin
  ShowTime := GetStartTime(Node);
  HideTime := GetFinalTime(Node);
  if NewHideTime > MAX_TIME then NewHideTime := 0; //added later
  if NewHideTime <> HideTime then
  begin
    //added by adenry: bind to previous when fast scrolling
    if BindUndoToPrev and (UndoList.Count > 0) then
      if PUndoAction(UndoList.Items[UndoList.Count-1])^.UndoActionName = uanHideEdit then //don't bind to other time modifications
        PUndoAction(UndoList.Items[UndoList.Count-1])^.BindToNext := True;

    New(UndoAction);
    UndoAction^.UndoActionType                 := uaTimeChange;
    UndoAction^.UndoActionName                 := UndoActionName; //added by adenry
    UndoAction^.BufferSize                     := SizeOf(TTimeChange);
    UndoAction^.Buffer                         := AllocMem(UndoAction^.BufferSize);
    UndoAction^.Node                           := Node; //lstSubtitles.FocusedNode; //modified by adenry
    UndoAction^.LineNumber                     := UndoAction^.Node.Index;
    UndoAction^.BindToNext                     := BindUndoToNext; //False; //modified by adenry
    PTimeChange(UndoAction^.Buffer)^.StartTime := -1;
    PTimeChange(UndoAction^.Buffer)^.FinalTime := HideTime; //lstSubtitles.FocusedNode; //modified by adenry
    //added by adenry: begin
    if (GetKeyState(VK_SHIFT) < 0) or Shift then //Shift subtitle - change both SHOW and HIDE values with the same amount
    begin
      PTimeChange(UndoAction^.Buffer)^.StartTime := ShowTime; //lstSubtitles.FocusedNode; //modified by adenry
      SetStartTime(Node, NewHideTime - (HideTime - ShowTime)); //lstSubtitles.FocusedNode; //modified by adenry
    end else
    //keep minimum duration
    if KeepMinDur and (lstSubtitles.SelectedCount = 1) then
    begin
      if ((NewHideTime - ShowTime < KeepMinDurValue) OR (NewHideTime < ShowTime)) then
      begin
        NewShowTime := NewHideTime - KeepMinDurValue;
        if NewShowTime < 0 then NewShowTime := 0; //added later
        //Check for overlaping with previous subtitle
        if (KeepMinDurDontOverlap) and (Node <> lstSubtitles.GetFirst) then
        begin
          if NewShowTime - GetFinalTime(Node.PrevSibling) < TooShortPause then
          begin
            NewShowTime := GetFinalTime(Node.PrevSibling) + TooShortPause;
            if NewShowTime > ShowTime then
              NewShowTime := ShowTime;
          end;
        end;
        //set new Show time
        if NewShowTime <> ShowTime then
        begin
          PTimeChange(UndoAction^.Buffer)^.StartTime := ShowTime;
          SetStartTime(Node, NewShowTime); //lstSubtitles.FocusedNode;
        end;
      end;
    end;
    //added by adenry: end
    AddUndo(UndoAction);

    SetFinalTime(Node, NewHideTime); //lstSubtitles.FocusedNode;
    if BindUndoToNext = False then //added by adenry later
      RefreshTimes;
    AutoRecheckNodeErrors(Node, TimeErrors); //added by adenry //lstSubtitles.FocusedNode;
    lstSubtitles.RepaintNode(Node); //lstSubtitles.FocusedNode;
    AutoRecheckNodeErrorsAndRepaint(Node.NextSibling, PauseErrors); //added by adenry //lstSubtitles.FocusedNode;
  end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

procedure TfrmMain.tmeDurationTimeChangeFromEditOnly(Sender: TObject; NewTime: Cardinal);
var
  Node, NextSelNode: PVirtualNode; //added by adenry
begin
  //if (lstSubtitles.SelectedCount = 1) then //removed by adenry
  //added by adenry: begin
  Node := lstSubtitles.GetFirstSelected;
  while Assigned(Node) do
  begin
    NextSelNode := lstSubtitles.GetNextSelected(Node);
    ChangeDuration(Node, NewTime, Assigned(NextSelNode)); //most of tmeDurationTimeChangeFromEditOnly went in ChangeDuration
    Node := NextSelNode;
  end;
  //added by adenry: end
end;

// -----------------------------------------------------------------------------

//added by adenry: begin
//most of tmeDurationTimeChangeFromEditOnly is now here, however here we have additional parameters (Node and BinUndoToNext):
procedure TfrmMain.ChangeDuration(Node: PVirtualNode; NewDuration: Cardinal; BindUndoToNext: Boolean = False; BindUndoToPrev: Boolean = False; Shift: Boolean = False);
var
  UndoAction      : PUndoAction;
  oldStartTime    : Integer; //added by adenry
  durationIncrease: Integer; //added by adenry
begin
  oldStartTime := GetStartTime(Node); //added by adenry //was lstSubtitles.FocusedNode
  durationIncrease := NewDuration - (GetFinalTime(Node) - oldStartTime); //added by adenry //was lstSubtitles.FocusedNode

  if durationIncrease <> 0 then //added by adenry
  begin
    //added by adenry: bind to previous when fast scrolling
    if BindUndoToPrev and (UndoList.Count > 0) then
      if PUndoAction(UndoList.Items[UndoList.Count-1])^.UndoActionName = uanDurEdit then //don't bind to other time modifications
        PUndoAction(UndoList.Items[UndoList.Count-1])^.BindToNext := True;

    New(UndoAction);
    UndoAction^.UndoActionType                 := uaTimeChange;
    UndoAction^.UndoActionName                 := uanDurEdit; //added by adenry
    UndoAction^.BufferSize                     := SizeOf(TTimeChange);
    UndoAction^.Buffer                         := AllocMem(UndoAction^.BufferSize);
    UndoAction^.Node                           := Node; //lstSubtitles.FocusedNode; //modified by adenry
    UndoAction^.LineNumber                     := UndoAction^.Node.Index;
    UndoAction^.BindToNext                     := BindUndoToNext;//False; //modified by adenry
    PTimeChange(UndoAction^.Buffer)^.StartTime := -1;
    PTimeChange(UndoAction^.Buffer)^.FinalTime := GetFinalTime(Node); //lstSubtitles.FocusedNode //modified by adenry
    //added by adenry: begin
    if (GetKeyState(VK_SHIFT) < 0) or Shift then
    begin
      if oldStartTime + durationIncrease < 0 then
      begin
        if lstSubtitles.SelectedCount = 1 then //added by adenry
          tmeDuration.Time := NewDuration - durationIncrease;
        exit;
      end;
      PTimeChange(UndoAction^.Buffer)^.StartTime := oldStartTime;
      SetStartTime(Node, oldStartTime + durationIncrease); //lstSubtitles.FocusedNode //modified by adenry
    end;
    //added by adenry: end
    AddUndo(UndoAction);

    SetFinalTime(Node, Cardinal(oldStartTime) + NewDuration); //added by adenry //lstSubtitles.FocusedNode
    //SetFinalTime(lstSubtitles.FocusedNode, Cardinal(GetStartTime(lstSubtitles.FocusedNode)) + NewDuration); //removed by adenry
    if BindUndoToNext = False then //added by adenry later
      RefreshTimes;
    AutoRecheckNodeErrors(Node, TimeErrors); //added by adenry //lstSubtitles.FocusedNode
    lstSubtitles.RepaintNode(Node); //lstSubtitles.FocusedNode //modified by adenry
    if Assigned(Node.NextSibling) then //added by adenry later
      AutoRecheckNodeErrorsAndRepaint(Node.NextSibling, PauseErrors); //added by adenry //lstSubtitles.FocusedNode
  end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
//Set subtitle pause
procedure TfrmMain.tmePauseTimeChangeFromEditOnly(Sender: TObject; NewTime: Cardinal);
var
  Node, NextSelNode: PVirtualNode; //added by adenry
begin
  //if (lstSubtitles.SelectedCount = 1) then //removed by adenry
  //added by adenry: begin
  Node := lstSubtitles.GetFirstSelected;
  while Assigned(Node) do
  begin
    NextSelNode := lstSubtitles.GetNextSelected(Node);
    ChangePause(Node, NewTime, Assigned(NextSelNode)); //most of tmePauseTimeChangeFromEditOnly went in ChangePause
    Node := NextSelNode;
  end;
  //added by adenry: end
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.ChangePause(Node: PVirtualNode; NewPause: Cardinal; BindUndoToNext: Boolean = False; BindUndoToPrev: Boolean = False);
var
  UndoAction: PUndoAction;
  NewShowTime, NewHideTime, ShowTime, HideTime: Integer; //added later
begin
  if Node <> lstSubtitles.GetFirst then
  if NewPause <> GetStartTime(Node) - GetFinalTime(Node.PrevSibling) then
  begin
    //added by adenry: bind to previous when fast scrolling
    if BindUndoToPrev and (UndoList.Count > 0) then
      if PUndoAction(UndoList.Items[UndoList.Count-1])^.UndoActionName = uanPauseEdit then //don't bind to other time modifications
        PUndoAction(UndoList.Items[UndoList.Count-1])^.BindToNext := True;

    ShowTime := GetStartTime(Node);
    HideTime := GetFinalTime(Node);
    NewShowTime := GetFinalTime(Node.PrevSibling) + NewPause;

    New(UndoAction);
    UndoAction^.UndoActionType                 := uaTimeChange;
    UndoAction^.UndoActionName                 := uanPauseEdit; //added by adenry
    UndoAction^.BufferSize                     := SizeOf(TTimeChange);
    UndoAction^.Buffer                         := AllocMem(UndoAction^.BufferSize);
    UndoAction^.Node                           := Node; //lstSubtitles.FocusedNode; //modified by adenry
    UndoAction^.LineNumber                     := UndoAction^.Node.Index;
    UndoAction^.BindToNext                     := Assigned(lstSubtitles.GetNextSelected(Node));//False; //modified by adenry
    PTimeChange(UndoAction^.Buffer)^.StartTime := ShowTime; //lstSubtitles.FocusedNode //modified by adenry
    PTimeChange(UndoAction^.Buffer)^.FinalTime := -1;
    //added by adenry: begin
    if GetKeyState(VK_SHIFT) < 0 then //Shift subtitle - change both SHOW and HIDE values with the same amount
    begin
      PTimeChange(UndoAction^.Buffer)^.FinalTime := HideTime; //lstSubtitles.FocusedNode //modified by adenry
      SetFinalTime(Node, NewShowTime + (HideTime - ShowTime)); //lstSubtitles.FocusedNode //modified by adenry
      AutoRecheckNodeErrorsAndRepaint(Node.NextSibling, PauseErrors); //lstSubtitles.FocusedNode //modified by adenry
    end else
    //keep minimum duration
    if KeepMinDur and (lstSubtitles.SelectedCount = 1) then
    begin
      if ((HideTime - NewShowTime < KeepMinDurValue) OR (HideTime < NewShowTime)) then //lstSubtitles.FocusedNode //modified by adenry
      begin
        NewHideTime := NewShowTime + KeepMinDurValue;
        //Check for overlaping with next subtitle
        if (KeepMinDurDontOverlap) and (Node <> lstSubtitles.GetLast) then
        begin
          if GetStartTime(Node.NextSibling) - NewHideTime < TooShortPause then
          begin
            NewHideTime := GetStartTime(Node.NextSibling) - TooShortPause;
            if NewHideTime < HideTime then
              NewHideTime := HideTime;
          end;
        end;
        //set new Hide time:
        if NewHideTime <> HideTIme then
        begin
          PTimeChange(UndoAction^.Buffer)^.FinalTime := HideTime; //lstSubtitles.FocusedNode //modified by adenry
          SetFinalTime(Node, NewHideTime); //lstSubtitles.FocusedNode //modified by adenry
          AutoRecheckNodeErrorsAndRepaint(Node.NextSibling, PauseErrors); //lstSubtitles.FocusedNode //modified by adenry
        end;
      end;
    end;
    //added by adenry: end
    
    AddUndo(UndoAction);

    SetStartTime(Node, NewShowTime); //lstSubtitles.FocusedNode //modified by adenry
    if BindUndoToNext = False then //added by adenry later
      RefreshTimes;
    AutoRecheckNodeErrors(Node, TimeErrors); //added by adenry //lstSubtitles.FocusedNode //modified by adenry
    lstSubtitles.RepaintNode(Node); //lstSubtitles.FocusedNode //modified by adenry
  end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuSaveProjectClick(Sender: TObject);
var
  dlgSaveProject : TSaveDialog;
  Ini            : TIniFile;
  OriginalFile   : String;
  TranslatedFile : String;
  MMovieFile     : String;
begin
  dlgSaveProject := TSaveDialog.Create(Application);
  try
    if OrgFile <> '' then
    begin
      UpdateArray(OrgFormat); //format index added by adenry
      if SaveFile(OrgFile, OrgFormat, GetFPS) then  // We save original file in it's original format
      begin
        OrgModified := False;
        UndoNumWhenOrgSaved := UndoList.Count; //added by adenry
      end;
      SubtitleAPI.ClearSubtitles;
    end else
      mnuSaveFileAsClick(Sender);

    if TransFile <> '' then
    begin
      UpdateArray(TransFormat, True); //format index added by adenry
      if SaveFile(TransFile, TransFormat, GetFPS) then // We save translated file in it's original format
      begin
        TransModified := False;
        UndoNumWhenTransSaved := UndoList.Count; //added by adenry
      end;
      SubtitleAPI.ClearSubtitles;
    end else // If file doesn't exist then, save as...
      mnuSaveTranslatedAsClick(Sender);

    if (OrgFile <> '') and (TransFile <> '') then
    begin
      dlgSaveProject.Filter := ID_STPROJECT + ' (*' + ID_STPEXT + ')|*' + ID_STPEXT;
      if (dlgSaveProject.Execute) and (dlgSaveProject.FileName <> '') then
      begin
        if ExtractFileExt(dlgSaveProject.FileName) = '' then
          dlgSaveProject.FileName := dlgSaveProject.FileName + ID_STPEXT;
        if (ExtractFilePath(OrgFile) = ExtractFilePath(TransFile)) and
           (ExtractFilePath(OrgFile) = ExtractFilePath(dlgSaveProject.FileName)) then
        begin
          OriginalFile   := ExtractFileName(OrgFile);
          TranslatedFile := ExtractFileName(TransFile);
        end else
        begin
          OriginalFile   := OrgFile;
          TranslatedFile := TransFile;
        end;
        if (ExtractFilePath(dlgSaveProject.FileName)) = (ExtractFilePath(MovieFile)) then
          MMovieFile := ExtractFileName(MovieFile) else
          MMovieFile := MovieFile;

        Ini := TIniFile.Create(dlgSaveProject.FileName);
        try
          Ini.WriteString('Subtitle files', 'Original', OriginalFile);
          Ini.WriteString('Subtitle files', 'Translated', TranslatedFile);
          Ini.WriteString('Movie file', 'Movie', MMovieFile);
          Ini.WriteInteger('Other', 'Focused node', lstSubtitles.FocusedNode.Index);
          Ini.WriteInteger('Movie file', 'Position', GetCurrentPos);
        finally
          Ini.Free;
        end;
      end;
    end;
  finally
    dlgSaveProject.Free;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuSaveFileClick(Sender: TObject);
begin
  if OrgFile <> '' then
  begin
    UpdateArray(OrgFormat); //format index added by adenry
    if SaveFile(OrgFile, OrgFormat, GetFPS) then  // We save original file in it's original format
    begin
      OrgModified := False;
      UndoNumWhenOrgSaved := UndoList.Count; //added by adenry      
    end;
    SubtitleAPI.ClearSubtitles;
  end else
    mnuSaveFileAsClick(Sender);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.SetTranslationCtrlsPositions;
begin
  if mnuShowLeftPanel.Checked then
  begin
    pnlControl.Visible := True;
    pnlParent2.Left    := pnlControl.Left + pnlControl.Width + 7;
    pnlParent2.Width   := frmMain.ClientWidth - (pnlControl.Left + pnlControl.Width) - 15;
  end else
  begin
    pnlControl.Visible := False;
    pnlParent2.Left    := pnlControl.Left;
    pnlParent2.Width   := frmMain.ClientWidth - 16;
  end;

  //left properties moved here, outside the if, by adenry
  //removed by adenry:
  {lblShow.Left      := pnlParent2.Left;
  tmeShow.Left      := pnlParent2.Left;

  lblHide.Left      := tmeShow.Left + tmeShow.Width + 7;
  tmeHide.Left      := lblHide.Left;

  lblDuration.Left  := tmeHide.Left;
  tmeDuration.Left  := tmeHide.Left;

  lblPause.Left     := pnlParent2.Left; //added by adenry
  tmePause.Left     := pnlParent2.Left; //added by adenry}

  //added by adenry:
  pnlEditingControls.Left := pnlParent2.Left;
  pnlEditingControls.Width := pnlParent2.Width;

  ShowVolumeControls(True); //ShowVolumeControls(VolumeControls); //added by adenry
  if mnuShowTimeControls.Checked then
  //removed by adenry:
    {mmoSubtitleText.Left := tmeHide.Left + tmeHide.Width + 8 else
    mmoSubtitleText.Left := tmeShow.Left;}
  //added by adenry:
  begin
    spSplitterEditingControls.Show;
    pnlTimingControls.Show;
  end else
  begin
    pnlTimingControls.Hide;
    spSplitterEditingControls.Hide;
  end;

  if mnuTranslatorMode.Checked then
  //removed by adenry:
  {begin
    mmoSubtitleText.Width := ((frmMain.ClientWidth - mmoSubtitleText.Left) div 2) - 7;
    mmoTranslation.Width  := mmoSubtitleText.Width;
    mmoTranslation.Left   := mmoSubtitleText.Left + mmoSubtitleText.Width + 7;
    mmoTranslation.Height := mmoSubtitleText.Height;
  end else
    mmoSubtitleText.Width := (frmMain.ClientWidth - mmoSubtitleText.Left) - 8;}
  //added by adenry:
  begin
    if TextTransColsSwapped = False then
    begin
      mmoSubtitleText.Width := (pnlTextControls.Width - 7) div 2;
      mmoTranslation.Width := pnlTextControls.Width - 7 - mmoSubtitleText.Width;
      mmoTranslation.Left := mmoSubtitleText.Width + 7;
    end else
    begin
      mmoTranslation.Width := (pnlTextControls.Width - 7) div 2;
      mmoSubtitleText.Width := pnlTextControls.Width - 7 - mmoTranslation.Width;
      mmoSubtitleText.Left := mmoTranslation.Width + 7;
    end;
  end else
    mmoSubtitleText.Width := pnlTextControls.Width;

  //mmoSubtitleText.Top := tmeHide.Top; //removed by adenry
  //mmoTranslation.Top  := mmoSubtitleText.Top; //removed by adenry
  // Label...
  lblText.Left        := mmoSubtitleText.Left + (Integer(tbTextStyle.Visible) * tbTextStyle.Width);
  lblTranslation.Top  := lblText.Top;
  lblTranslation.Left := mmoTranslation.Left + (Integer(tbTransStyle.Visible) * tbTransStyle.Width);

  tbTextStyle.Left    := mmoSubtitleText.Left; //added by adenry
  //tbTextStyle.Top     := mmoSubtitleText.Top - tbTextStyle.Height; //added by adenry later  //removed by adenry
  tbTransStyle.Left   := mmoTranslation.Left; //added by adenry
  //tbTransStyle.Top    := mmoTranslation.Top - tbTransStyle.Height; //added by adenry later  //removed by adenry
  MarkLongLinesInLabel(lblText); //added by adenry
  MarkLongLinesInLabel(lblTranslation); //added by adenry
  SetLinesLabelsPositions; //added by adenry
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuTranslatorModeClick(Sender: TObject);
begin
  SetTranslatorMode(not mnuTranslatorMode.Checked);
end;
// -----------------------------------------------------------------------------

procedure TfrmMain.mnuLoadProjectClick(Sender: TObject);
begin                 
  dlgLoadFile.Filter := ID_STPROJECT + ' (*' + ID_STPEXT + ')|*.stp';
  if (dlgLoadFile.Execute) and (dlgLoadFile.FileName <> '') then
    LoadProject(dlgLoadFile.FileName);
  dlgLoadFile.Filter := SubtitleAPI.FillDialogFilter(AllSupportedFiles) + ID_SRF + '|' + ID_PLAINTEXT;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuLoadTranslatedClick(Sender: TObject);
begin
  //removed by adenry
  //if (dlgLoadFile.Execute) and (dlgLoadFile.FileName <> '') then
  //  LoadSubtitle(dlgLoadFile.FileName, GetInputFPS, dlgLoadFile.FilterIndex, True);

  //added by adenry: begin
  if (dlgLoadFile.Execute) and (dlgLoadFile.FileName <> '') then
  begin
    if (dlgLoadFile.FilterIndex) <= (SubtitleAPI.FormatsCount+1) then
      LoadSubtitle(dlgLoadFile.FileName, GetInputFPS, dlgLoadFile.FilterIndex, True) else
    begin
      if (dlgLoadFile.FilterIndex) = (SubtitleAPI.FormatsCount+2) then
        LoadSRF(dlgLoadFile.FileName, True) else
        LoadPlainText(dlgLoadFile.FileName, True);
    end;
  end;
  //added by adenry: end
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuSaveTranslatedClick(Sender: TObject);
begin
  if TransFile <> '' then
  begin
    UpdateArray(TransFormat, True); //format index added by adenry
    if SaveFile(TransFile, TransFormat, GetFPS) then // We save translated file in it's original format
    begin
      TransModified := False;
      UndoNumWhenTransSaved := UndoList.Count; //added by adenry
    end;
    SubtitleAPI.ClearSubtitles
  end else // If file doesn't exist then, save as...
    mnuSaveTranslatedAsClick(Sender);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuSaveFileAsClick(Sender: TObject);
begin
  frmSaveAs := TfrmSaveAs.Create(Application);
  frmSaveAs.SaveTranslation := False;
  frmSaveAs.ShowModal;
  frmSaveAs.Free;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuSaveTranslatedAsClick(Sender: TObject);
begin
  frmSaveAs := TfrmSaveAs.Create(Application);
  frmSaveAs.SaveTranslation := True;
  frmSaveAs.ShowModal;
  frmSaveAs.Free;
  SubtitleAPI.ClearSubtitles;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mmoSubTextChange(Sender: TObject);
var
  OldString: String;
  NewString: String; //added by adenry
begin
  NewString := GetSWTextEditText(mmoSubtitleText); //added by adenry - properly convert the Unicode text of the RichEdit to ANSI - WITH THE PROPER ENCODING!
  IF (lstSubtitles.SelectedCount = 1) and (NewString <> GetSubText(lstSubtitles.FocusedNode)) and (GetFocus <> lstSubtitles.Handle) then //ReplaceString(GetSubText(lstSubtitles.FocusedNode), '|', #13#10) modified to GetSubText(lstSubtitles.FocusedNode) - TEXT IS NOT SAVED WITH | INSTEAD OF #13#10! //mmoSubtitleText.Text changed to NewString by adenry
  begin
    OldString := GetSubText(lstSubtitles.FocusedNode);
    SetText(lstSubtitles.FocusedNode, NewString); //mmoSubtitleText.Text changed to NewString by adenry
    DetectChangesForUndo(OldString, NewString, True, tmrFastTypingUndoBind.Enabled); //GetSubText(lstSubtitles.FocusedNode) replaced with NewString by adenry
    AutoRecheckNodeErrors(lstSubtitles.FocusedNode, TextErrors);//added by adenry
    lstSubtitles.RepaintNode(lstSubtitles.FocusedNode);
    OrgModified := True;
    //added by adenry - fast typing undo actions binding:
    tmrFastTypingUndoBind.Enabled := False;
    if tmrFastTypingUndoBind.Tag = 0 then
      tmrFastTypingUndoBind.Enabled := True;
  end;
  lblText.Caption := Format(TextOrTransLength, [LabelText, GetLengthForEachLine(NewString)]); //mmoSubtitleText.Text replaced with NewString by adenry
  MarkLongLinesInLabel(lblText); //added by adenry
  if mmoSubtitleText.ClassName = TRichEdit.ClassName then //added by adenry
    HighlightTags(TRichEdit(mmoSubtitleText)); //by BDZL
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mmoTransChange(Sender: TObject);
var
  OldString: String;
  NewString: String; //added by adenry
begin
  NewString := GetSWTextEditText(mmoTranslation); //added by adenry - properly convert the Unicode text of the RichEdit to ANSI - WITH THE PROPER ENCODING!
  IF mnuTranslatorMode.Checked = True then
  begin
    if (lstSubtitles.SelectedCount = 1) and (NewString <> GetSubTranslation(lstSubtitles.FocusedNode)) and (GetFocus <> lstSubtitles.Handle) then //mmoTranslation.Text replaced with NewString by adenry
    begin
      OldString := GetSubTranslation(lstSubtitles.FocusedNode);
      SetTranslation(lstSubtitles.FocusedNode, NewString); //mmoTranslation.Text changed to NewString by adenry
      DetectChangesForUndo(OldString, NewString, False, tmrFastTypingUndoBind.Enabled); //GetSubTranslation(lstSubtitles.FocusedNode) replaced with NewString by adenry
      lstSubtitles.RepaintNode(lstSubtitles.FocusedNode);
      TransModified := True;
      //added by adenry - fast typing undo actions binding:
      tmrFastTypingUndoBind.Enabled := False;
      if tmrFastTypingUndoBind.Tag = 0 then
        tmrFastTypingUndoBind.Enabled := True;
    end;
  end;
  lblTranslation.Caption := Format(TextOrTransLength, [LabelTranslation, GetLengthForEachLine(NewString)]); //mmoTranslation.Text replaced with NewString by adenry
  MarkLongLinesInLabel(lblTranslation); //added by adenry
  if mmoTranslation.ClassName = TRichEdit.ClassName then //added by adenry
    HighlightTags(TRichEdit(mmoTranslation)); //by BDZL
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.lstSubtitlesDblClick(Sender: TObject);
begin
  if (lstSubtitles.Enabled) {and (mmoSubtitleText.Enabled) and (mmoTranslation.Enabled)} then  //and (mmoSubtitleText.Enabled) and (mmoTranslation.Enabled) removed by adenry to fix a bug... they are unnecessary anyway...
  begin
    if (Player.Initialized) and (mnuVideoPreviewMode.Checked = True) then
    begin
      if (HiWord(GetKeyState(VK_SHIFT)) <> 0) then
      begin
        //UnSelectAll(lstSubtitles); //moved from here by adenry
        case OnShiftDblClick of
          0:
            begin
              if mnuTranslatorMode.Checked then
                mmoTranslation.SetFocus else
                mmoSubtitleText.SetFocus;
            end;
          1: SetVideoPos(GetStartTime(lstSubtitles.FocusedNode));
          2: SetVideoPos(GetStartTime(lstSubtitles.FocusedNode) - (SecsToJump2 * 1000));
        end;
        //lstSubtitles.Selected[lstSubtitles.FocusedNode] := True; //moved from here by adenry
      end else
      begin
        case OnDoubleClick of
          0:
            begin
              if mnuTranslatorMode.Checked then
                mmoTranslation.SetFocus else
                mmoSubtitleText.SetFocus;
            end;
          1: SetVideoPos(GetStartTime(lstSubtitles.FocusedNode));
          2: SetVideoPos(GetStartTime(lstSubtitles.FocusedNode) - (SecsToJump1 * 1000));
        end;
      end;
    end else
    begin
      if mnuTranslatorMode.Checked then
        mmoTranslation.SetFocus else
        mmoSubtitleText.SetFocus;
    end;
    UnSelectAll(lstSubtitles); //moved here by adenry
    lstSubtitles.Selected[lstSubtitles.FocusedNode] := True; //moved here by adenry
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuDisplayOriginalClick(Sender: TObject);
begin
  mnuDisplayOriginal.Checked    := True;
  //mnuDisplayTranslation.Checked := False; //removed by adenry
  subSubtitle.Font.Charset      := OrgCharset;
  UpdateSubSubtitleTextAndVisibility; //added by adenry
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuDisplayTranslationClick(Sender: TObject);
begin
  //mnuDisplayOriginal.Checked    := False; //removed by adenry
  mnuDisplayTranslation.Checked := True;
  subSubtitle.Font.Charset      := TransCharset;
  UpdateSubSubtitleTextAndVisibility; //added by adenry
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.lstSubtitlesPaintText(Sender: TBaseVirtualTree;
  const TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex;
  TextType: TVSTTextType);
var
  Data     : PSubtitleItem;
  Color    : Integer;
  ItemText : String;
  i        : Integer; //added by adenry
begin
  Data := Sender.GetNodeData(Node);
  //set text
  if Column = 3 then
    ItemText := Data.Text else
  if Column = 4 then
    ItemText := Data.Translation;

  //marked subtitles low priority marking (not error marking!)
  if not MarkingHighPriority then
    if Data.Marked and MarkingWithColor then
      if ((Column=0) and MarkingColNum) or ((Column=1) and MarkingColShow) or ((Column=2) and MarkingColHide) or ((Column=3) and MarkingColText) or ((Column=6) and MarkingColPause) or ((Column=5) and MarkingColDur) then
        TargetCanvas.Font.Color := MarkingColor;

  //removed by adenry: begin
  //OLD ERROR MARKING:
  {if ((Data.ErrorType <> []) and (MarkErrorsInList) and (not MarkDisableStandard or not AdvancedErrorMarking))  and (Column <> 4) then
  begin
    if (Column = 1) or (Column = 2) or (Column = 3) then
    begin
      //added by adenry: begin
      if UseOriginalTextColor then
      begin
        Color := GetSubColor(ItemText);
        if OnlyIfThereIsAColorTag then
          TargetCanvas.Font.Color := MarkWithColor;
        if (ApplyStyleInList) and (Color > -1) then
          TargetCanvas.Font.Color := Color;
      end else
        TargetCanvas.Font.Color := MarkWithColor;
      if UseOriginalTextStyle then
      begin
        if ApplyStyleInList then
        begin
          if (SmartPos('<i>', ItemText, False) > 0) then
            TargetCanvas.Font.Style := TargetCanvas.Font.Style + [fsItalic];
          if (SmartPos('<b>', ItemText, False) > 0) then
            TargetCanvas.Font.Style := TargetCanvas.Font.Style + [fsBold];
          if (SmartPos('<u>', ItemText, False) > 0) then
            TargetCanvas.Font.Style := TargetCanvas.Font.Style + [fsUnderline];
        end;
      end else
      begin
        TargetCanvas.Font.Style := [];
        if MarkBold      then TargetCanvas.Font.Style := TargetCanvas.Font.Style + [fsBold];
        if MarkItalic    then TargetCanvas.Font.Style := TargetCanvas.Font.Style + [fsItalic];
        if MarkUnderline then TargetCanvas.Font.Style := TargetCanvas.Font.Style + [fsUnderline];
      end;
      //added by adenry: end

      //removed by adenry: begin
      //TargetCanvas.Font.Color := MarkWithColor;
      //TargetCanvas.Font.Style := [];
      //if MarkBold      then TargetCanvas.Font.Style := TargetCanvas.Font.Style + [fsBold];
      //if MarkItalic    then TargetCanvas.Font.Style := TargetCanvas.Font.Style + [fsItalic];
      //if MarkUnderline then TargetCanvas.Font.Style := TargetCanvas.Font.Style + [fsUnderline];
      //removed by adenry: end
    end;
  end else}
  //remoed by adenry: end

  //Apply style in list
  Color := -1; //only to avoid compiler warning later
  if (Column = 3) or (Column = 4) then
  begin
    if ApplyStyleInList then
    begin
      Color := GetSubColor(ItemText);
      if (SmartPos('<i>', ItemText, False) > 0) then  //Pos changed to SmartPos by adenry
        TargetCanvas.Font.Style := TargetCanvas.Font.Style + [fsItalic];
      if (SmartPos('<b>', ItemText, False) > 0) then  //Pos changed to SmartPos by adenry
        TargetCanvas.Font.Style := TargetCanvas.Font.Style + [fsBold];
      if (SmartPos('<u>', ItemText, False) > 0) then  //Pos changed to SmartPos by adenry
        TargetCanvas.Font.Style := TargetCanvas.Font.Style + [fsUnderline];
      if (Color > -1) then
        TargetCanvas.Font.Color := Color;
    end;
    if (mnuTranslatorMode.Checked) and (MarkUntransSubs) and (Column = 4) then
    begin
      // We mark items that are not translated...
      if (Data.Text = Data.Translation) or (Data.Translation = '') or (RemoveSWTags(Data.Translation,True,True,True,True) = UntranslatedSub) then //RemoveSWTags by adenry
        TargetCanvas.Font.Color := UnTransSubsColor;
      //removed by adenry: begin
      //else
      //begin
      //  if (ApplyStyleInList) and (Color > -1) then
      //    TargetCanvas.Font.Color := Color;
      //end;
      //removed by adenry: end
    end;
  end;

  //added by adenry: begin
  //ADVANCED ERROR MARKING (mark different errors with different color and style):
  if AdvancedErrorMarking {and MarkErrorsInList} then
  begin
    //reset subtitle text color and font style
    if Column = 3 then
    begin
      if not(not MarkingHighPriority and Data.Marked and MarkingWithColor and MarkingColText) {and not UseOriginalTextColor}  then //if Marking is not with high priority or the subtitle is not marked with text color in this column
        if ApplyStyleInList and (Color > -1) then //added later
          TargetCanvas.Font.Color := Color else //added later
          TargetCanvas.Font.Color := lstSubtitles.Font.Color;
      //if not UseOriginalTextStyle then
      //  TargetCanvas.Font.Style := [];
    end;
    //set color and style
    if (Data.ErrorType <> []) and (Column in [0..3]) then
      //default marking first (if enabled)
      if (mfEnabled in MarkFlags[0]) then
        for i := 1 to Integer(High(TErrorType))+1 do //for each type of error
          if (TErrorType(i-1) in Data.ErrorType) and (mfEnabled in MarkFlags[i]) then
          begin
            //if no marking column is set for current error type
            if not((mfColNum in MarkFlags[i])or(mfColShow in MarkFlags[i])or(mfColHide in MarkFlags[i])or(mfColText in MarkFlags[i])or(mfColPause in MarkFlags[i])or(mfColDur in MarkFlags[i])) then
              if ((Column=0) and (mfColNum in MarkFlags[0])) or ((Column=1) and (mfColShow in MarkFlags[0])) or ((Column=2) and (mfColHide in MarkFlags[0])) or ((Column=3) and (mfColText in MarkFlags[0])) or ((Column=6) and (mfColPause in MarkFlags[0])) or ((Column=5) and (mfColDur in MarkFlags[0])) then
              begin
                if (MarkColors[0] <> lstSubtitles.Font.Color) {and (not UseOriginalTextColor or (Column<>3) or (UseOriginalTextColor and OnlyIfThereIsAColorTag and (GetSubColor(ItemText) = -1)))} then
                  TargetCanvas.Font.Color := MarkColors[0];
                if (Column<>3) {or not UseOriginalTextStyle} then
                begin
                  if mfBold in MarkFlags[0] then
                    TargetCanvas.Font.Style := TargetCanvas.Font.Style + [fsBold];
                  if mfItalic in MarkFlags[0] then
                    TargetCanvas.Font.Style := TargetCanvas.Font.Style + [fsItalic];
                  if mfUnderline in MarkFlags[0] then
                    TargetCanvas.Font.Style := TargetCanvas.Font.Style + [fsUnderline];
                end;
                if mfStrikeOut in MarkFlags[0] then
                  TargetCanvas.Font.Style := TargetCanvas.Font.Style + [fsStrikeOut];
              end;
          end;
      //then the normal marking
      for i := 1 to Integer(High(TErrorType))+1 do //for each type of error
        if (TErrorType(i-1) in Data.ErrorType) and (mfEnabled in MarkFlags[i]) then
        begin
          if ((Column=0) and (mfColNum in MarkFlags[i])) or ((Column=1) and (mfColShow in MarkFlags[i])) or ((Column=2) and (mfColHide in MarkFlags[i])) or ((Column=3) and (mfColText in MarkFlags[i])) or ((Column=6) and (mfColPause in MarkFlags[i])) or ((Column=5) and (mfColDur in MarkFlags[i])) then
          begin
            if (MarkColors[i] <> lstSubtitles.Font.Color) {and (not UseOriginalTextColor or (Column<>3) or (UseOriginalTextColor and OnlyIfThereIsAColorTag and (GetSubColor(ItemText) = -1)))} then
              TargetCanvas.Font.Color := MarkColors[i];
            //if (Column<>3) or not UseOriginalTextStyle then
            //begin
              if mfBold in MarkFlags[i] then
                TargetCanvas.Font.Style := TargetCanvas.Font.Style + [fsBold];
              if mfItalic in MarkFlags[i] then
                TargetCanvas.Font.Style := TargetCanvas.Font.Style + [fsItalic];
              if mfUnderline in MarkFlags[i] then
                TargetCanvas.Font.Style := TargetCanvas.Font.Style + [fsUnderline];
            //end;
            if mfStrikeOut in MarkFlags[i] then
              TargetCanvas.Font.Style := TargetCanvas.Font.Style + [fsStrikeOut];
          end;
        end;
  end;

  //marked subtitles high priority marking (not error marking!)
  if MarkingHighPriority then
    if Data.Marked and MarkingWithColor then
      if ((Column=0) and MarkingColNum) or ((Column=1) and MarkingColShow) or ((Column=2) and MarkingColHide) or ((Column=3) and MarkingColText) or ((Column=6) and MarkingColPause) or ((Column=5) and MarkingColDur) then
        TargetCanvas.Font.Color := MarkingColor;

  //set selection text color
  if (TargetCanvas.Font.Color = frmMain.lstSubtitles.Font.Color) and (vsSelected in Node.States) then
    TargetCanvas.Font.Color := SelTextColor;
  //added by adenry: end

end;


// -----------------------------------------------------------------------------

procedure TfrmMain.btnMoveSubtitleClick(Sender: TObject);
var
  CurrTime : Integer;
  DiffTime : Integer;
begin
  if (Player.Initialized) and (mnuVideoPreviewMode.Checked) and (lstSubtitles.SelectedCount >= 1) then
  begin
    CurrTime := GetCurrentPos;
    DiffTime := CurrTime - GetStartTime(lstSubtitles.GetFirstSelected);
    if AutoRoundTimeVals then
      DiffTime := RoundTimeValue(DiffTime, RoundingFactor); //added by adenry
    SetDelay(DiffTime, True);
    RefreshTimes; //added by adenry
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.btnSetShowTimeClick(Sender: TObject);
var
  //UndoAction: PUndoAction; //removed by adenry
  Node: PVirtualNode; //added by adenry
  NewShowTime, StartTime, UndoListCount: Integer; //added by adenry
  //HideTime, NewHideTime: Integer; //added by adenry //removed by adenry
begin
  if (Player.Initialized) and (mnuVideoPreviewMode.Checked) and (Assigned(lstSubtitles.FocusedNode)) and (lstSubtitles.SelectedCount >= 1) then
  begin
    Node := lstSubtitles.GetFirstSelected;
    StartTime := GetStartTime(Node); //removed by adenry
    //HideTime := GetFinalTime(Node); //removed by adenry

    NewShowTime := GetCurrentPos + ShiftShowVal; //+ ShiftShowVal added by adenry
    //added by adenry: round time value:
    if AutoRoundTimeVals then
      NewShowTime := RoundTimeValue(NewShowTime, RoundingFactor);
    if NewShowTime < 0 then
      NewShowTime := 0;

    //added by adenry: begin
    //ONE subtitle selected
    if lstSubtitles.SelectedCount = 1 then
      ChangeShowTime(Node, NewShowTime, False, False, False, uanMovieSetStartTime) else
    //MORE THAN ONE subtitles selected - shift all selected subtitles
    if lstSubtitles.SelectedCount > 1 then
    begin
      UndoListCount := UndoList.Count;
      ChangeShowTime(Node, NewShowTime, True, False, True, uanMovieSetStartTime);

      Node := lstSubtitles.GetNextSelected(Node);
      while Assigned(Node) do
      begin
        ChangeShowTime(Node, GetStartTime(Node) + NewShowTime-StartTime, True, False, True, uanMovieSetStartTime);
        Node := lstSubtitles.GetNextSelected(Node);
      end;
      if UndoList.Count > UndoListCount then
        PUndoAction(UndoList.Items[UndoList.Count-1])^.BindToNext := False;
    end;
    //added by adenry: end

    //removed by adenry: begin
    {
    New(UndoAction);
    UndoAction^.UndoActionType := uaTimeChange;
    UndoAction^.UndoActionName := uanMovieSetStartTime; //added by adenry
    UndoAction^.BufferSize     := SizeOf(TTimeChange);
    UndoAction^.Buffer         := AllocMem(UndoAction^.BufferSize);
    UndoAction^.Node           := Node;
    UndoAction^.LineNumber     := Node.Index;
    UndoAction^.BindToNext     := False;
    PTimeChange(UndoAction^.Buffer)^.StartTime := StartTime;
    PTimeChange(UndoAction^.Buffer)^.FinalTime := -1;

    SetStartTime(Node, NewShowTime);

    //added by adenry: begin
    if lstSubtitles.SelectedCount = 1 then
    begin
      if (GetKeyState(VK_SHIFT) < 0) then
      begin

      end else
      //Keep minimum duration:
      if KeepMinDur then
      begin
        if ((HideTime - NewShowTime < KeepMinDurValue) OR (HideTime < NewShowTime)) then
        begin
          NewHideTime := NewShowTime + KeepMinDurValue;
          //Check for overlaping with next subtitle
          if (KeepMinDurDontOverlap) and (Node <> lstSubtitles.GetLast) then
          begin
            if GetStartTime(Node.NextSibling) - NewHideTime < TooShortPause then
            begin
              NewHideTime := GetStartTime(Node.NextSibling) - TooShortPause;
              if NewHideTime < HideTime then
                NewHideTime := HideTime;
            end;
          end;
          //set new Hide time:
          if NewHideTime <> HideTIme then
          begin
            PTimeChange(UndoAction^.Buffer)^.FinalTime := HideTime;
            SetFinalTime(Node, NewHideTime);
            //added later:
            if Assigned(Node.NextSibling) then
              AutoRecheckNodeErrorsAndRepaint(Node.NextSibling, PauseErrors);
          end;
        end;
      end;
      AddUndo(UndoAction);
    end;
    //added by adenry: end

    AutoRecheckNodeErrors(lstSubtitles.FocusedNode, TimeErrors); //added by adenry
    lstSubtitles.RepaintNode(lstSubtitles.FocusedNode);
    RefreshTimes;
    }
    //removed by adenry: end
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.btnSetHideTimeClick(Sender: TObject);
var
  //UndoAction  : PUndoAction; //removed by adenry
  UndoAction2 : PUndoAction;
  CurrPos     : Integer;
  //ShowTime, NewShowTime: Integer; //added by adenry
  HideTime, NewHideTime, UndoListCount: Integer; //added by adenry
  Node: PVirtualNode; //added by adenry
begin
  if (Player.Initialized) and (mnuVideoPreviewMode.Checked) and (Assigned(lstSubtitles.FocusedNode)) and (lstSubtitles.SelectedCount >= 1) then
  begin
    Node := GetLastSelected; //added by adenry
    //ShowTime := GetStartTime(Node); //removed by adenry
    HideTime := GetFinalTime(Node);

    CurrPos := GetCurrentPos;
    NewHideTime := CurrPos + ShiftHideVal; //+ShiftHideVal added by adenry
    //added by adenry: round time value:
    if AutoRoundTimeVals then
      NewHideTime := RoundTimeValue(NewHideTime, RoundingFactor);

    //added by adenry: begin
    //ONE subtitle selected
    if lstSubtitles.SelectedCount = 1 then
      ChangeHideTime(Node, NewHideTime, False, False, False, uanMovieSetFinalTime) else
    //MORE THAN ONE subtitles selected - shift all selected subtitles
    if lstSubtitles.SelectedCount > 1 then
    begin
      UndoListCount := UndoList.Count;
      ChangeHideTime(Node, NewHideTime, True, False, True, uanMovieSetFinalTime);

      Node := lstSubtitles.GetPreviousSelected(Node);
      while Assigned(Node) do
      begin
        ChangeHideTime(Node, GetFinalTime(Node) + NewHideTime-HideTime, True, False, True, uanMovieSetFinalTime);
        Node := lstSubtitles.GetPreviousSelected(Node);
      end;
      if UndoList.Count > UndoListCount then
        PUndoAction(UndoList.Items[UndoList.Count-1])^.BindToNext := False;
    end;

    {
    New(UndoAction);
    UndoAction^.UndoActionType := uaTimeChange;
    UndoAction^.UndoActionName := uanMovieSetFinalTime; //added by adenry
    UndoAction^.BufferSize     := SizeOf(TTimeChange);
    UndoAction^.Buffer         := AllocMem(UndoAction^.BufferSize);
    UndoAction^.Node           := lstSubtitles.FocusedNode;
    UndoAction^.LineNumber     := lstSubtitles.FocusedNode.Index;
    UndoAction^.BindToNext     := False;
    PTimeChange(UndoAction^.Buffer)^.StartTime := -1;
    PTimeChange(UndoAction^.Buffer)^.FinalTime := HideTime;

    SetFinalTime(lstSubtitles.FocusedNode, NewHideTime);

    //added by adenry: begin
    //keep minimum duration
    if KeepMinDur then
    begin
      if ((NewHideTime - ShowTime < KeepMinDurValue) OR (NewHideTime < ShowTime)) then
      begin
        NewShowTime := NewHideTime - KeepMinDurValue;
        //Check for overlaping with next subtitle
        if (KeepMinDurDontOverlap) and (lstSubtitles.FocusedNode <> lstSubtitles.GetFirst) then
        begin
          if NewShowTime - GetFinalTime(lstSubtitles.FocusedNode.PrevSibling) < TooShortPause then
          begin
            NewShowTime := GetFinalTime(lstSubtitles.FocusedNode.PrevSibling) + TooShortPause;
            if NewShowTime > ShowTime then
              NewShowTime := ShowTime;
          end;
        end;
        //set new Show time
        if NewShowTime <> ShowTime then
        begin
          PTimeChange(UndoAction^.Buffer)^.StartTime := ShowTime;
          SetStartTime(lstSubtitles.FocusedNode, NewShowTime);
        end;
      end;
    end;
    //added by adenry: end

    AddUndo(UndoAction);
    } 

    //Fix overlapping and move selection to the next subtitle
    Node := GetLastSelected; //added by adenry
    if Assigned(Node.NextSibling) then
    begin
      //Fix overlapping
      //if GetStartTime(lstSubtitles.FocusedNode.NextSibling) <= CurrPos then //removed by adenry
      if GetStartTime(Node.NextSibling) < NewHideTime + DefaultSubPause then //added by adenry
      begin
        PUndoAction(UndoList.Last)^.BindToNext := True;

        New(UndoAction2);
        UndoAction2^.UndoActionType := uaTimeChange;
        UndoAction2^.UndoActionName := uanMovieSetFinalTime; //added by adenry
        UndoAction2^.BufferSize     := SizeOf(TTimeChange);
        UndoAction2^.Buffer         := AllocMem(UndoAction2^.BufferSize);
        UndoAction2^.Node           := Node.NextSibling;
        UndoAction2^.LineNumber     := Node.NextSibling.Index;
        UndoAction2^.BindToNext     := False;
        PTimeChange(UndoAction2^.Buffer)^.StartTime := GetStartTime(Node.NextSibling);
        PTimeChange(UndoAction2^.Buffer)^.FinalTime := -1;
        AddUndo(UndoAction2);

        //removed by adenry: begin
        //if FormatType = ftTime then
        //  SetStartTime(Node.NextSibling, CurrPos + ID_TIMEOVERLAPPRECISION) else
        //  SetStartTime(Node.NextSibling, CurrPos + Round(GetFPS));
        //removed by adenry: end
        SetStartTime(Node.NextSibling, NewHideTime + DefaultSubPause); //added by adenry //CurrPos replaced with GetFinalTime(Node) later
        AutoRecheckNodeErrorsAndRepaint(Node.NextSibling, TimeErrors); //added by adenry
      end;

      //Move selection to the next subtitle
      if lstSubtitles.SelectedCount = 1 then
      begin
        lstSubtitles.Selected[Node] := False;
        lstSubtitles.FocusedNode := Node.NextSibling;
        lstSubtitles.Selected[lstSubtitles.FocusedNode] := True;
        RefreshTimes;
      end;

    end;

  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.btnStartSubtitleClick(Sender: TObject);
begin
  if (Player.Initialized) then
    StartSubTime := GetCurrentPos;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.btnEndSubtitleClick(Sender: TObject);
var
  Node       : PVirtualNode;
  UndoAction : PUndoAction;
begin
  if (Player.Initialized) and (StartSubTime <> -1) and (lstSubtitles.Enabled) then
  begin
    Node := InsertNode;
    if Assigned(lstSubtitles.FocusedNode) then
      lstSubtitles.Selected[lstSubtitles.FocusedNode] := False;
    lstSubtitles.FocusedNode := Node;
    lstSubtitles.Selected[Node] := True;
    SetStartTime(Node, StartSubtime);
    SetFinalTime(Node, GetCurrentPos);

    New(UndoAction);
    UndoAction^.UndoActionType := uaInsertLine;
    UndoAction^.UndoActionName := uanMovieStartEndSubTime; //added by adenry
    UndoAction^.LineNumber     := lstSubtitles.FocusedNode.Index;
    UndoAction^.Node           := lstSubtitles.FocusedNode;
    UndoAction^.BindToNext     := False;
    UndoAction^.Buffer         := nil;
    UndoAction^.BufferSize     := 0;
    AddUndo(UndoAction);

    RefreshTimes;
    mmoSubtitleText.SetFocus; //moved after RefreshTimes by adenry - fixes a bug
    AutoRecheckNodeErrorsAndRepaint(lstSubtitles.FocusedNode); //added by adenry
    AutoRecheckNodeErrorsAndRepaint(lstSubtitles.FocusedNode.NextSibling, PauseErrors); //added by adenry
  end;  
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuInsertSubtitleClick(Sender: TObject);
var
  UndoAction: PUndoAction;
begin
  InsertNode;
  MarkLongLinesInLabel(lblText); //added by adenry
  MarkLongLinesInLabel(lblTranslation); //added by adenry
  lstSubtitles.Refresh; //todo: is this really necessary?
  RefreshTimes;

  New(UndoAction);
  UndoAction^.UndoActionType := uaInsertLine;
  UndoAction^.UndoActionName := uanInsert; //added by adenry
  UndoAction^.LineNumber     := lstSubtitles.FocusedNode.Index;
  UndoAction^.Node           := lstSubtitles.FocusedNode;
  UndoAction^.BindToNext     := False;
  UndoAction^.Buffer         := nil;
  UndoAction^.BufferSize     := 0;
  AddUndo(UndoAction);

  AutoRecheckNodeErrorsAndRepaint(lstSubtitles.FocusedNode, [], rtSubAdded); //added by adenry //rtSubAdded added later
  AutoRecheckNodeErrorsAndRepaint(lstSubtitles.FocusedNode.NextSibling, PauseErrors); //added by adenry
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuInsertBeforeClick(Sender: TObject);
var
  UndoAction: PUndoAction;
begin
  InsertNode(False);
  MarkLongLinesInLabel(lblText); //added by adenry
  MarkLongLinesInLabel(lblTranslation); //added by adenry
  lstSubtitles.Refresh; //the node structure changed, repaint it
  RefreshTimes;

  New(UndoAction);
  UndoAction^.UndoActionType := uaInsertLine;
  UndoAction^.UndoActionName := uanInsertBefore; //added by adenry
  UndoAction^.LineNumber     := lstSubtitles.FocusedNode.Index;
  UndoAction^.Node           := lstSubtitles.FocusedNode;
  UndoAction^.BindToNext     := False;
  UndoAction^.Buffer         := nil;
  UndoAction^.BufferSize     := 0;
  AddUndo(UndoAction);

  AutoRecheckNodeErrorsAndRepaint(lstSubtitles.FocusedNode, [], rtSubAdded); //added by adenry //rtSubAdded added later
  AutoRecheckNodeErrorsAndRepaint(lstSubtitles.FocusedNode.NextSibling, TimeErrors); //added by adenry
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuRemoveSelectedClick(Sender: TObject);
begin
  DeleteSelectedNodes;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.lstSubtitlesKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  ShouldRefreshTimes := False; //added by adenry
  //RefreshTimes; //removed by adenry - OnChange event handler handles it now
  //added by adenry: begin
  case Key of
    Ord('S'):
    begin
      if PressedKeyInLstSubtitles = 1 then PressedKeyInLstSubtitles := 0;
      tmeShow.Font.Style := tmeShow.Font.Style - [fsUnderline];
      if TempActiveControl <> nil then
        TTimeMaskEdit(TempActiveControl).Font.Style := TTimeMaskEdit(TempActiveControl).Font.Style + [fsUnderline];
    end;
    Ord('E'):
    begin
      if PressedKeyInLstSubtitles = 2 then PressedKeyInLstSubtitles := 0;
      tmeHide.Font.Style := tmeHide.Font.Style - [fsUnderline];
      if TempActiveControl <> nil then
        TTimeMaskEdit(TempActiveControl).Font.Style := TTimeMaskEdit(TempActiveControl).Font.Style + [fsUnderline];
    end;
    Ord('D'):
    begin
      if PressedKeyInLstSubtitles = 3 then PressedKeyInLstSubtitles := 0;
      tmeHide.Font.Style := tmeHide.Font.Style - [fsUnderline];
      if TempActiveControl <> nil then
        TTimeMaskEdit(TempActiveControl).Font.Style := TTimeMaskEdit(TempActiveControl).Font.Style + [fsUnderline];
    end;
  end;
  //added by adenry: end
end;

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.lstSubtitlesMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ClickPoint := lstSubtitles.ClientToScreen(Point(X,Y)); //added later
  ShouldRefreshTimes := True;
  ShouldRefreshTimes2 := True;
  //if (lstSubtitles.SelectedCount > 1) or not Assigned(lstSubtitles.GetNodeAt(X, Y)) then
  //  ShouldRefreshTimes2 := True else
  //  ShouldRefreshTimes2 := False;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

procedure TfrmMain.lstSubtitlesMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  //RefreshTimes; //removed by adenry - OnChange event handler handles it now
  //added by adenry: begin
  ShouldRefreshTimes := False;
  ShouldRefreshTimes2 := False;
  //repaint focused node when deselecting it with ctrl+click
  if Assigned(lstSubtitles.GetNodeAt(X, Y)) then
    if (lstSubtitles.GetNodeAt(X, Y) = lstSubtitles.FocusedNode) and (ssCtrl in Shift)
    and(not (vsSelected in lstSubtitles.GetNodeAt(X, Y).States)) then
      lstSubtitles.RepaintNode(lstSubtitles.GetNodeAt(X, Y));
  //added by adenry: end
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if AskToSaveFile = False then
    CanClose := False else
    CanClose := True;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuCutClick(Sender: TObject);
begin
  tmrFastTypingUndoBind.Enabled := False; //added by adenry
  //added by adenry: begin
  if Screen.ActiveControl.ClassName = 'TRichEdit' then
    TRichEdit(Screen.ActiveControl).CutToClipboard else
  if Screen.ActiveControl.ClassName = 'TMemo' then
    TMemo(Screen.ActiveControl).CutToClipboard else
  if Screen.ActiveControl.ClassName = 'TEdit' then
    TEdit(Screen.ActiveControl).CutToClipboard else
  if Screen.ActiveControl.ClassName = 'TComboBox' then
  begin
    Clipboard.AsText := TComboBox(Screen.ActiveControl).Text;
    TComboBox(Screen.ActiveControl).Text := '';
  end else
  if Screen.ActiveControl.ClassName = 'TTimeMaskEdit' then
    TTimeMaskEdit(Screen.ActiveControl).CutToClipboard else
  //added by adenry: end
  begin
    CopyNodesToClipBoard;
    DeleteSelectedNodes;
  end;
  tmrFastTypingUndoBind.Enabled := False; //added by adenry
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuCopyClick(Sender: TObject);
begin
  //added by adenry: begin
  if Screen.ActiveControl.ClassName = 'TRichEdit' then
    TRichEdit(Screen.ActiveControl).CopyToClipboard else
  if Screen.ActiveControl.ClassName = 'TMemo' then
    TMemo(Screen.ActiveControl).CopyToClipboard else
  if Screen.ActiveControl.ClassName = 'TEdit' then
    TEdit(Screen.ActiveControl).CopyToClipboard else
  if Screen.ActiveControl.ClassName = 'TComboBox' then
    Clipboard.AsText := TComboBox(Screen.ActiveControl).Text else
  if Screen.ActiveControl.ClassName = 'TTimeMaskEdit' then
    TTimeMaskEdit(Screen.ActiveControl).CopyToClipboard else
  //added by adenry: end
    CopyNodesToClipBoard;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuPasteClick(Sender: TObject);
var
  Text          : String;
  WText         : WideString; //added by adenry
  Time          : Integer;
  ActiveControl : TWinControl;
begin
  tmrFastTypingUndoBind.Enabled := False; //added by adenry

  ActiveControl := Screen.ActiveControl;
  if ActiveControl.Name = 'lstSubtitles' then
    PasteNodesFromClipBoard else

  if Clipboard.HasFormat(CF_TEXT) then
  begin
    //added by adenry: begin
    if Clipboard.HasFormat(CF_UNICODETEXT) then
    begin
      //Get Clipboard Unicode text
      WText := GetUnicodeTextFromClipboard;
      //Convert the Clipboard Unicode text to ANSI text with the Charset of the ActiveControl
      Text := WideStringToStringEx(WText, CharsetToCodePage(TExtWinControl(ActiveControl).Font.Charset));
    end else
      Text := Clipboard.AsText;

    if (ActiveControl = mmoSubtitleText) or (ActiveControl = mmoTranslation)
    or ((Assigned(frmDivideLines)) and ((ActiveControl = frmDivideLines.mmoSub1) or (ActiveControl = frmDivideLines.mmoSub2))) then
      SetSWTextEditSelText(TSWTextEdit(ActiveControl), Text) else //paste plain text, we don't want any formatting //TMemo changed to TSWTextEdit
    if ActiveControl.ClassName = 'TRichEdit' then
      TRichEdit(ActiveControl).PasteFromClipboard else  //PasteFromClipboard works okay for TRichEdit, as TRichEdit uses Unicode internally
    if ActiveControl.ClassName = 'TMemo' then
      TMemo(ActiveControl).SelText := Text else         //PasteFromClipboard doesn't convert to ANSI with proper Charset
    if ActiveControl.ClassName = 'TEdit' then
      TEdit(ActiveControl).SelText := Text else         //PasteFromClipboard doesn't convert to ANSI with proper Charset
    if ActiveControl.ClassName = 'TLabeledEdit' then
      TLabeledEdit(ActiveControl).SelText := Text else  //PasteFromClipboard doesn't convert to ANSI with proper Charset
    if ActiveControl.ClassName = 'TComboBox' then
      TComboBox(ActiveControl).SelText := Text else
    //added by adenry: end

    if ActiveControl.ClassName = 'TTimeMaskEdit' then //modified by adenry
    begin
      //Text := Clipboard.AsText; //removed by adenry
      if Text <> '' then
      begin
        if IsInteger(Text) then
          Time := FramesToTime(StrToInt(Text), GetFPS) else
          Time := StringToTime(Text);
        if Time = -1 then
          exit;

        //modified by adenry: begin
        if ActiveControl.Name = 'tmeShow' then
          tmeShowTimeChangeFromEditOnly(Sender, Time); //SetStartTime(lstSubtitles.FocusedNode, Time) else
        if ActiveControl.Name = 'tmeHide' then
          tmeHideTimeChangeFromEditOnly(Sender, Time); //SetFinalTime(lstSubtitles.FocusedNode, Time) else
        if ActiveControl.Name = 'tmeDuration' then
          tmeDurationTimeChangeFromEditOnly(Sender, Time);//SetFinalTime(lstSubtitles.FocusedNode, GetStartTime(lstSubtitles.FocusedNode) + Time) else
        if ActiveControl.Name = 'tmePause' then
          tmePauseTimeChangeFromEditOnly(Sender, Time) else
          TTimeMaskEdit(Screen.ActiveControl).Time := Time;

        if (ActiveControl.Name = 'tmeShow') or (ActiveControl.Name = 'tmeHide') or (ActiveControl.Name = 'tmeDuration') or (ActiveControl.Name = 'tmePause') then
        begin
          lstSubtitles.RepaintNode(lstSubtitles.FocusedNode);
          RefreshTimes;
        end;

      end;
    end else
      PasteNodesFromClipBoard;
        //modified by adenry: end
  end;

  tmrFastTypingUndoBind.Enabled := False; //added by adenry  
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuJumpToNextLineClick(Sender: TObject);
var
  a: HWND;
  i: Integer;
begin
  a := GetFocus;
  if (mnuTranslatorMode.Checked) and (a = mmoTranslation.Handle) then
    MemoKeyPress(mmoTranslation, lstSubtitles, True) else
  if (a = mmoSubtitleText.Handle) or (a = lstSubtitles.Handle) then
    MemoKeyPress(mmoSubtitleText, lstSubtitles, True) else
  if a = tmeShow.Handle then
  begin
    i := tmeShow.SelStart;
    MemoKeyPress(tmeShow, lstSubtitles, True);
    if tmeShow.SelStart <> i then
      tmeShow.SelStart := i;
  end else
  if a = tmeHide.Handle then
  begin
    i := tmeHide.SelStart;
    MemoKeyPress(tmeHide, lstSubtitles, True);
    if tmeHide.SelStart <> i then
      tmeHide.SelStart := i;
  end else
  if a = tmeDuration.Handle then
  begin
    i := tmeDuration.SelStart;
    MemoKeyPress(tmeDuration, lstSubtitles, True);
    if tmeDuration.SelStart <> i then
      tmeDuration.SelStart := i;
  end else
  //added by adenry:
  if a = tmePause.Handle then
  begin
    i := tmePause.SelStart;
    MemoKeyPress(tmePause, lstSubtitles, True);
    if tmePause.SelStart <> i then
      tmePause.SelStart := i;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuJumpToPrevLineClick(Sender: TObject);
var
  a: HWND;
  i: Integer;
begin
  a := GetFocus;
  if (mnuTranslatorMode.Checked) and (a = mmoTranslation.Handle) then
    MemoKeyPress(mmoTranslation, lstSubtitles, False) else
  if (a = mmoSubtitleText.Handle) or (a = lstSubtitles.Handle) then
    MemoKeyPress(mmoSubtitleText, lstSubtitles, False) else
  if a = tmeShow.Handle then
  begin
    i := tmeShow.SelStart;
    MemoKeyPress(tmeShow, lstSubtitles, False);
    if tmeShow.SelStart <> i then
      tmeShow.SelStart := i;
  end else
  if a = tmeHide.Handle then
  begin
    i := tmeHide.SelStart;
    MemoKeyPress(tmeHide, lstSubtitles, False);
    if tmeHide.SelStart <> i then
      tmeHide.SelStart := i;
  end else
  if a = tmeDuration.Handle then
  begin
    i := tmeDuration.SelStart;
    MemoKeyPress(tmeDuration, lstSubtitles, False);
    if tmeDuration.SelStart <> i then
      tmeDuration.SelStart := i;
  end else
  //added by adenry:
  if a = tmePause.Handle then
  begin
    i := tmePause.SelStart;
    MemoKeyPress(tmePause, lstSubtitles, False);
    if tmePause.SelStart <> i then
      tmePause.SelStart := i;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuJumpToNextSubClick(Sender: TObject);
begin
  btnNextSub.OnClick(Sender);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuJumpToPrevSubClick(Sender: TObject);
begin
  btnPrevSub.OnClick(Sender);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuZeroFunctionClick(Sender: TObject);
begin
  // removed by adenry: this doesn't work because of tags highlighting. There is NO explaination why!!!!!
  //if (GetFocus = mmoSubtitleText.Handle) then
  //  mmoSubtitleText.Undo else
  //if (mnuTranslatorMode.Checked) and (GetFocus = mmoTranslation.Handle) then
  //  mmoTranslation.Undo else
    ZeroFunction;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuSubDblClickClick(Sender: TObject);
begin
  lstSubtitlesDblClick(Sender);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuSortClick(Sender: TObject);
begin
  SortSubtitles;
  lstSubtitles.Refresh;
  RefreshTimes;
  UpdateSubSubtitleTextAndVisibility; //added by adenry
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuReverseTextClick(Sender: TObject);
begin
  TreeViewHandle.ReverseText(KeepOrderOfLines);
  lstSubtitles.Refresh;
  RefreshTimes;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuFixPunctuationClick(Sender: TObject);
var
  Node       : PVirtualNode;
  UndoAction : PUndoAction;
begin
  Node := lstSubtitles.GetFirstSelected;
  while Assigned(Node) do
  begin
    New(UndoAction);
    UndoAction^.UndoActionType := uaRTLFix;
    UndoAction^.UndoActionName := uanRTLFixPunctuation; //added by adenry
    UndoAction^.Node           := Node;
    UndoAction^.LineNumber     := Node.Index;
    UndoAction^.BufferSize     := SizeOf(TRTLFix);
    UndoAction^.Buffer         := AllocMem(UndoAction^.BufferSize);
    PRTLFix(UndoAction^.Buffer)^.ReverseText    := False;
    PRTLFix(UndoAction^.Buffer)^.FixPunctuation := True;
    PRTLFix(UndoAction^.Buffer)^.Original       := True;
      
    if mnuTranslatorMode.Checked then
    begin
      PRTLFix(UndoAction^.Buffer)^.Original := False;
      if RemoveSWTags(GetSubTranslation(Node),True,True,True,True) <> UntranslatedSub then //RemoveSWTags by adenry
        SetTranslation(Node, FixRTLPunctuation(GetSubTranslation(Node)));
    end else
      SetText(Node, FixRTLPunctuation(GetSubText(Node)));

    AutoRecheckNodeErrors(Node, TextErrors); //added by adenry
    Node := lstSubtitles.GetNextSelected(Node);
    UndoAction^.BindToNext := Assigned(Node);
    AddUndo(UndoAction);
  end;

  lstSubtitles.Refresh;
  RefreshTimes;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuMoveSubtitleClick(Sender: TObject);
begin
  btnMoveSubtitleClick(Sender);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuSetShowTimeClick(Sender: TObject);
begin
  btnSetShowTimeClick(Sender);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuSetHideTimeClick(Sender: TObject);
begin
  btnSetHideTimeClick(Sender);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuStartSubtitleClick(Sender: TObject);
begin
  btnStartSubtitleClick(Sender);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuEndSubtitleClick(Sender: TObject);
begin
  btnEndSubtitleClick(Sender);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuCombineSubtitlesClick(Sender: TObject);
var
  UpdNode         : PVirtualNode;
  Node            : PVirtualNode;
  FinalTime       : Integer;
  NewText         : String;
  NewTrans        : String;
  UndoAction      : PUndoAction;
  Data            : PSubtitleItem; //added by adenry
begin
  if lstSubtitles.SelectedCount > 1 then
  begin
    UpdNode := lstSubtitles.GetFirstSelected;
    FinalTime := GetFinalTime(UpdNode);
    NewText  := GetSubText(UpdNode);
    NewTrans := GetSubTranslation(UpdNode);

    //removed by adenry: begin
    {New(UndoAction);
    UndoAction^.UndoActionType := uaFullTextChange;
    UndoAction^.Node           := UpdNode;
    UndoAction^.LineNumber     := UpdNode.Index;
    UndoAction^.BindToNext     := True;
    UndoAction^.BufferSize     := SizeOf(TFullTextChange);
    UndoAction^.Buffer         := AllocMem(UndoAction^.BufferSize);
    PFullTextChange(UndoAction^.Buffer)^.OriginalOnly := False;
    PFullTextChange(UndoAction^.Buffer)^.OldText := NewText;
    PFullTextChange(UndoAction^.Buffer)^.OldTrans := NewTrans;
    AddUndo(UndoAction);}
    //removed by adenry: end

    //added by adenry: begin
    //undo type needs to be uaFullSubChange in order to save the final time - bug fix
    Data := lstSubtitles.GetNodeData(UpdNode);
    New(UndoAction);
    UndoAction^.UndoActionType := uaFullSubChange;
    UndoAction^.UndoActionName := uanCombineSubs; //added by adenry
    UndoAction^.BufferSize     := SizeOf(TLineChange);
    UndoAction^.Buffer         := AllocMem(UndoAction^.BufferSize);
    UndoAction^.Node           := UpdNode;
    UndoAction^.LineNumber     := UpdNode.Index;
    UndoAction^.BindToNext     := True;
    PLineChange(UndoAction^.Buffer).SubtitleItem := Data^;
    AddUndo(UndoAction);
    //added by adenry: end

    Node := lstSubtitles.GetNextSelected(UpdNode);
    while Assigned(Node) do
    begin
      FinalTime := GetFinalTime(Node);
      if GetSubText(Node) <> '' then
        NewText := NewText + #13#10 + GetSubText(Node);
      if GetSubTranslation(Node) <> '' then
        //NewTrans := NewTrans + #13#10 + GetSubTranslation(Node); //removed by adenry
      //added by adenry: begin
        if GetSubTranslation(Node) <> UntranslatedSub then
          if NewTrans <> UntranslatedSub then
            NewTrans := NewTrans + #13#10 + GetSubTranslation(Node) else
            NewTrans := GetSubTranslation(Node);
      //added by adenry: end
      Node := lstSubtitles.GetNextSelected(Node);
    end;

    //added by adenry: begin
    if SubtitleAPI.SingleTagsMode then
    begin
      NewText := SetSingleTagsModeFontStyles(NewText, GetSingleTagsModeFontStyles(NewText), True);
      NewTrans := SetSingleTagsModeFontStyles(NewTrans, GetSingleTagsModeFontStyles(NewTrans), True);
    end;
    //added by adenry: end

    //adenry moved these before the deletion for proper error auto recheck
    SetFinalTime(UpdNode, FinalTime);
    SetText(UpdNode, NewText);
    SetTranslation(UpdNode, NewTrans);

    lstSubtitles.Selected[UpdNode] := False;
    DeleteSelectedWithUndo;
    PUndoAction(UndoList.Last)^.UndoActionName := uanCombineSubs; //added by adenry
    lstSubtitles.FocusedNode := UpdNode;
    lstSubtitles.Selected[UpdNode] := True;

    RefreshTimes;
    AutoRecheckNodeErrorsAndRepaint(lstSubtitles.FocusedNode); //added by adenry
    UpdateSubSubtitleVisibilityAfterNodeChange(UpdNode, -1, -1, GetStartTime(UpdNode), FinalTime); //added by adenry
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuFastSmartLineAdjustClick(Sender: TObject);
var
  Node       : PVirtualNode;
  tmp        : String;
  tmp2       : String; //added by adenry
  //adj1       : String; //moved to the FastSmartLineAdjust function by adenry
  //adj2       : String; //moved to the FastSmartLineAdjust function by adenry
  //adj3       : String; //moved to the FastSmartLineAdjust function by adenry
  UndoAction : PUndoAction;
begin
  Node := lstSubtitles.GetFirstSelected;
  while Assigned(Node) do
  begin
    tmp := GetSubText(Node); //moved to the subprocedure by adenry

    New(UndoAction);
    UndoAction^.UndoActionType := uaFullTextChange;
    UndoAction^.UndoActionName := uanFastSmartLineAdj; //added by adenry
    UndoAction^.BufferSize     := SizeOf(TFullTextChange);
    UndoAction^.Buffer         := AllocMem(UndoAction^.BufferSize);
    UndoAction^.Node           := Node;
    UndoAction^.LineNumber     := Node.Index;
    PFullTextChange(UndoAction^.Buffer)^.OriginalOnly := True;
    PFullTextChange(UndoAction^.Buffer)^.OldText := tmp;
    UndoAction^.BindToNext     := True; //added by adenry

    //removed by adenry: begin
    {adj1 := AdjustLines(tmp, True, True); //shortest
    adj2 := AdjustLines(tmp, True, False); //forward ' '
    adj3 := AdjustLines(tmp, False, False); //backward ' '

    if ToggleBreakPoint then
    begin
      if (tmp = adj2) or (tmp = adj3) then
      begin
        if tmp = adj2 then
          SetText(Node, adj3) else
          if tmp = adj3 then
            SetText(Node, adj2)
      end else
        SetText(Node, adj1);
    end else
      SetText(Node, adj1);}
    //removed by adenry: end

    //added by adenry: begin
    if (mmoSubtitleText.Focused) or ((lstSubtitles.Focused) and (lstSubtitles.FocusedColumn=3)) then
    begin
      tmp := FastSmartLineAdjust(tmp, OrgCharset);
      tmp := FixTagsPositions(tmp);
      tmp := DeleteEmptyLines(tmp);
      if tmp <> PFullTextChange(UndoAction^.Buffer)^.OldText then
      begin
        SetText(Node, tmp);
        AutoRecheckNodeErrors(Node, TextErrors); //added by adenry
      end;
    end;
    //added by adenry: end

    //if mnuTranslatorMode.Checked then //removed by adenry
    if (mnuTranslatorMode.Checked) and ((mmoTranslation.Focused) or ((lstSubtitles.Focused) and (lstSubtitles.FocusedColumn=4)) or (lstSubtitles.SelectedCount>1)) then //added by adenry
    begin
      tmp := GetSubTranslation(Node); //moved to the subprocedure by adenry
      if RemoveSWTags(Tmp,True,True,True,True) <> UntranslatedSub then  //RemoveSWTags by adenry
      begin
        //added by adenry: begin
        tmp2 := tmp;
        tmp2 := FastSmartLineAdjust(tmp2, TransCharset);
        tmp2 := FixTagsPositions(tmp2);
        tmp2 := DeleteEmptyLines(tmp2);
        if tmp2 <> tmp then
        begin
          SetTranslation(Node, tmp2);
        //added by adenry: end
          PFullTextChange(UndoAction^.Buffer)^.OldTrans := tmp;
          PFullTextChange(UndoAction^.Buffer)^.OriginalOnly := False;
        end;

        //removed by adenry: begin
        {adj1 := AdjustLines(tmp, True, True);
        adj2 := AdjustLines(tmp, True, False);
        adj3 := AdjustLines(tmp, False, False);

        if ToggleBreakPoint then
        begin
          if (tmp = adj2) or (tmp = adj3) then
          begin
            if tmp = adj2 then
              SetTranslation(Node, adj3) else
              if tmp = adj3 then
                SetTranslation(Node, adj2)
          end else
            SetTranslation(Node, adj1);
        end else
          SetTranslation(Node, adj1);}
        //removed by adenry: end

      end;
    end;

    if ((GetSubText(Node) <> PFullTextChange(UndoAction^.Buffer)^.OldText)) or
    //   ((mnuTranslatorMode.Checked) and (GetSubTranslation(Node) <> PFullTextChange(UndoAction^.Buffer)^.OldTrans)) then //removed by adenry
       (PFullTextChange(UndoAction^.Buffer)^.OriginalOnly = False) then //added by adenry
      AddUndo(UndoAction);

    Node := lstSubtitles.GetNextSelected(Node);
    //UndoAction^.BindToNext := Assigned(Node); //removed by adenry
  end;

  if UndoList.Count > 0 then //added by adenry later
    PUndoAction(UndoList.Last)^.BindToNext := False; //added by adenry later
  lstSubtitles.Refresh;
  RefreshTimes;
  //frmMain.OrgModified := True; //removed by adenry - MODIFIED bug fix - SetText/SetTranslation/SetStartTime/SetFinalTime handle the MODIFIED flags
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuConvertCaseClick(Sender: TObject);
begin
  frmConvertCase := TfrmConvertCase.Create(Application);
  frmConvertCase.ShowModal;
  frmConvertCase.Free;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuFastUnbreakSubtitlesClick(Sender: TObject);
var
  Node       : PVirtualNode;
  UndoAction : PUndoAction;
  NewText    : String; //added by adenry
  OldText    : String; //added by adenry
  NewTrans   : String; //added by adenry
  OldTrans   : String; //added by adenry
begin
  Node := lstSubtitles.GetFirstSelected;
  while Assigned(Node) do
  begin
    OldText := GetSubText(Node);

    New(UndoAction);
    UndoAction^.UndoActionType := uaFullTextChange;
    UndoAction^.UndoActionName := uanFastUnbreakSubs; //added by adenry
    UndoAction^.BufferSize     := SizeOf(TFullTextChange);
    UndoAction^.Buffer         := AllocMem(UndoAction^.BufferSize);
    UndoAction^.Node           := Node;
    UndoAction^.LineNumber     := Node.Index;
    PFullTextChange(UndoAction^.Buffer)^.OriginalOnly := True; //not mnuTranslatorMode.Checked; //the NOT was added by adenry - bug fix //modified by adenry to True
    PFullTextChange(UndoAction^.Buffer)^.OldText := OldText;
    UndoAction^.BindToNext     := True; //added by adenry

    NewText := ReplaceEnters(OldText, ' ');
    if NewText <> OldText then
    begin
      SetText(Node, NewText);
      AutoRecheckNodeErrors(Node, TextErrors); //added by adenry
    end;

    if mnuTranslatorMode.Checked then
    begin
      OldTrans := GetSubTranslation(Node);
      NewTrans := ReplaceEnters(OldTrans, ' ');
      if NewTrans <> OldTrans then
      begin
        SetTranslation(Node, NewTrans);
        PFullTextChange(UndoAction^.Buffer)^.OldTrans := OldTrans;
        PFullTextChange(UndoAction^.Buffer)^.OriginalOnly := False;
      end;
    end;

    Node := lstSubtitles.GetNextSelected(Node);
    //UndoAction^.BindToNext := Assigned(Node); //removed by adenry

    if (NewText <> OldText) or (NewTrans <> OldTrans) then //added by adenry
      AddUndo(UndoAction);
  end;

  if UndoList.Count > 0 then //added by adenry
    PUndoAction(UndoList.Last)^.BindToNext := False; //added by adenry
  lstSubtitles.Refresh;
  RefreshTimes;
  //frmMain.OrgModified := True; //removed by adenry - unnecessary - SetText already set it
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuDivideLinesClick(Sender: TObject);
begin
  //added by adenry: begin
  //check for too short duration:
  if GetFinalTime(lstSubtitles.FocusedNode) - GetStartTime(lstSubtitles.FocusedNode) < DefaultSubPause + 2*Max(1,RoundingFactor*Integer(AutoRoundTimeVals)) then
    MsgBox(ErrorMsg[23], BTN_OK, '', '', MB_ICONERROR, frmMain) else
  //added by adenry: end
  begin
    frmDivideLines := TfrmDivideLines.Create(Application);
    frmDivideLines.ShowModal;
    frmDivideLines.Free;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuFastDivideLinesClick(Sender: TObject);
var
  //Ini                 : TIniFile; //removed by adenry
  BreaksArray         : TOpenIntegerArray;
  //AdjustAutomatically : Boolean; //moved from here by adenry
  Part1, Part2        : String;
  ExtraVar            : Integer;
  Data1               : PSubtitleItem;
  //Data2               : PSubtitleItem; //removed by adenry
  Duration1           : Integer;
  //DurPerChar          : Single; //removed by adenry
  UndoAction          : PUndoAction;
  //TotalLength         : Integer; //added by adenry
  Node, NextSelNode   : PVirtualNode; //added by adenry
begin
  //added by adenry: begin
  //check for too short duration:
  if lstSubtitles.SelectedCount = 1 then
    if GetFinalTime(lstSubtitles.FocusedNode) - GetStartTime(lstSubtitles.FocusedNode) < DefaultSubPause + 2*Max(1,RoundingFactor*Integer(AutoRoundTimeVals)) then
      MsgBox(ErrorMsg[23], BTN_OK, '', '', MB_ICONERROR, frmMain);
  //added by adenry: end

  //removed by adenry: begin - AdjustAutomatically is now set on form create and on settings btnOK
  //Ini := TIniFile.Create(IniRoot);
  //try
  //  AdjustAutomatically := Ini.ReadBool('Advanced', 'Smart line adjust automatically', True);
  //finally
  //  Ini.Free;
  //end;
  //removed by adenry: end

  Node := lstSubtitles.GetFirstSelected; //added by adenry
  while Assigned(Node) do //added by adenry
  begin
    NextSelNode := lstSubtitles.GetNextSelected(Node); //added by adenry
    if ((Length(RemoveSWTags(GetSubText(Node),True,True,True,True)) > BreakLineAfter) or (Pos(#13#10, GetSubText(Node)) > 0)) then //added by adenry
    begin
      Data1 := lstSubtitles.GetNodeData(Node);

      New(UndoAction);
      UndoAction^.UndoActionType := uaFullTextChange;
      UndoAction^.UndoActionName := uanFastDivideLines; //added by adenry
      UndoAction^.Node           := Node;
      UndoAction^.LineNumber     := Node.Index;
      UndoAction^.BindToNext     := True;
      UndoAction^.BufferSize     := SizeOf(TFullTextChange);
      UndoAction^.Buffer         := AllocMem(UndoAction^.BufferSize);
      PFullTextChange(UndoAction^.Buffer)^.OriginalOnly := True;
      PFullTextChange(UndoAction^.Buffer)^.OldText := Data1.Text;
      AddUndo(UndoAction);

      DivideSubText(Data1.Text, BreaksArray, AdjustAutomatically, Part1, Part2, ExtraVar); //ProcessStringToDivide replaced with DivideSubText by adenry

      //added by adenry: begin
      //don't create an empty subtitle
      if Part2 = '' then
      begin
        if Part1 <> Data1.Text then
        begin
          SetText(Node, Part1);
          AutoRecheckNodeErrors(Node, TextErrors);
        end;
      end else
      //added by adenry: end
      begin

        lstSubtitles.InsertNode(Node, amInsertAfter);

        New(UndoAction);
        UndoAction^.UndoActionType := uaTimeChange;
        UndoAction^.UndoActionName := uanFastDivideLines; //added by adenry
        UndoAction^.Node           := Node;
        UndoAction^.LineNumber     := Node.Index;
        UndoAction^.BindToNext     := True;
        UndoAction^.BufferSize     := SizeOf(TTimeChange);
        UndoAction^.Buffer         := AllocMem(UndoAction^.BufferSize);
        PTimeChange(UndoAction^.Buffer)^.StartTime := Data1.InitialTime;
        PTimeChange(UndoAction^.Buffer)^.FinalTime := Data1.FinalTime;
        AddUndo(UndoAction);

        New(UndoAction);
        UndoAction^.UndoActionType := uaInsertLine;
        UndoAction^.UndoActionName := uanFastDivideLines; //added by adenry
        UndoAction^.Node           := lstSubtitles.GetNextSibling(Node);
        UndoAction^.LineNumber     := UndoAction^.Node.Index;
        UndoAction^.BindToNext     := True; //False changed to True by adenry
        UndoAction^.Buffer         := nil;
        UndoAction^.BufferSize     := 0;
        AddUndo(UndoAction);

        //removed by adenry
        //TotalLength := Length(RemoveSWTags(Part1+Part2,True,True,True,True)) - StringCount(#13#10, Part1+Part2)*2;
        //if TotalLength > 0 then
        //  DurPerChar := ( Data1.FinalTime - Data1.InitialTime - DefaultSubPause ) / TotalLength else // Milliseconds //DefaultSubPause added by adenry //RemoveSWTags added by adenry
        //  DurPerChar := 0;
        //Duration1 := Rnd(DurPerChar * Length(RemoveSWTags(Part1,True,True,True,True)));

        //added by adenry:
        Duration1 := DivideSubDuration(Node, Part1, 1, 1, DefaultSubPause, True);

        //removed by adenry: begin
        //Data2 := lstSubtitles.GetNodeData(lstSubtitles.GetNextSibling(Node));
        //Data1.Text        := Part1;
        //Data2.Text        := Part2;
        //Data2.FinalTime   := Data1.FinalTime;
        //Data1.FinalTime   := Data1.InitialTime + Duration1;
        //Data2.InitialTime := Data1.FinalTime + DefaultSubPause; // + 1 replced with + DefaultSubPause by adenry
        //removed by adenry: end

        //added by adenry: begin
        SetText(Node, Part1);
        SetText(lstSubtitles.GetNextSibling(Node), Part2);
        SetFinalTime(lstSubtitles.GetNextSibling(Node), Data1.FinalTime);
        SetFinalTime(Node, Data1.InitialTime + Duration1);
        SetStartTime(lstSubtitles.GetNextSibling(Node), Data1.FinalTime + DefaultSubPause);
        //added by adenry: end

        lstSubtitles.Selected[Node] := False;
        lstSubtitles.FocusedNode := Node.NextSibling;
        lstSubtitles.Selected[Node.NextSibling] := True;

        AutoRecheckNodeErrors(Node); //added by adenry
        AutoRecheckNodeErrors(Node.NextSibling); //added by adenry
      end;

    end;
    Node := NextSelNode; //added by adenry
  end;

  if UndoList.Count > 0 then
    PUndoAction(UndoList.Last)^.BindToNext := False;
  RefreshTimes;
  lstSubtitles.Refresh;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuSetMaxLineLengthClick(Sender: TObject);
  function BreakInLines(Text: String; MaximumLineLength: Integer): String;
  var
    i: Integer;
    // Tags
    Bold        : Boolean;
    Italic      : Boolean;
    Underline   : Boolean;
    Color       : Integer;
  begin
    Bold      := Pos('<b>', Text) > 0;
    Italic    := Pos('<i>', Text) > 0;
    Underline := Pos('<u>', Text) > 0;
    Color     := GetSubColor(Text);
    // Remove tags
    if SubtitleApi.SingleTagsMode then //added by adenry
      Text := RemoveSWTags(Text, True, True, True, True);

    Text := WrapText(ReplaceEnters(Text, ' '), MaximumLineLength);

    i := Pos(' ' + #13#10, Text);
    while i > 0 do
    begin
      Delete(Text, i, 1);
      i := Pos(' ' + #13#10, Text);
    end;  

    if SubtitleApi.SingleTagsMode then //added by adenry
    begin
      // Restore tags
      if Underline = True then Text := '<u>' + Text;
      if Bold      = True then Text := '<b>' + Text;
      if Italic    = True then Text := '<i>' + Text;
      if Color > -1 then
        Text := SetColorTag(Text, Color);
    end;

    Result := Text;
  end;
var
  Node       : PVirtualNode;
  OldText    : String;
  NewText    : String;
  OldTrans   : String;
  NewTrans   : String;
  UndoAction : PUndoAction;
begin
  Node := lstSubtitles.GetFirstSelected;
  while Assigned(Node) do
  begin
    OldText := GetSubText(Node);
    NewText := BreakInLines(OldText, MaxLineLength);

    New(UndoAction);
    UndoAction^.UndoActionType := uaFullTextChange;
    UndoAction^.UndoActionName := uanSetMaxLineLength; //added by adenry
    UndoAction^.Node           := Node;
    UndoAction^.LineNumber     := Node.Index;
    UndoAction^.BufferSize     := SizeOf(TFullTextChange);
    UndoAction^.Buffer         := AllocMem(UndoAction^.BufferSize);
    PFullTextChange(UndoAction^.Buffer)^.OriginalOnly := True;
    PFullTextChange(UndoAction^.Buffer)^.OldText := OldText;
    UndoAction^.BindToNext     := True; //added by adenry

    if NewText <> OldText then //added by adenry
    begin
      SetText(Node, NewText);
      AutoRecheckNodeErrors(Node, TextErrors); //added by adenry
    end;

    if mnuTranslatorMode.Checked then
    begin
      OldTrans := GetSubTranslation(Node);
      NewTrans := BreakInLines(OldTrans, MaxLineLength);

      if NewTrans <> OldTrans then //added by adenry
      begin
        PFullTextChange(UndoAction^.Buffer)^.OriginalOnly := False; //True fixed to False by adnery - bug fix
        PFullTextChange(UndoAction^.Buffer)^.OldTrans := OldTrans;
        SetTranslation(Node, NewTrans);
      end;
    end;

    Node := lstSubtitles.GetNextSelected(Node);
    //UndoAction^.BindToNext := Assigned(Node); //removed by adenry later

    if ({(mnuTranslatorMode.Checked = False) and} (OldText <> NewText)) or //modified by adenry - bug fix
       ({(mnuTranslatorMode.Checked = True) and} (OldTrans <> NewTrans)) then //modified by adenry - bug fix
      AddUndo(UndoAction);
  end;

  if UndoList.Count > 0 then //added by adenry later
    PUndoAction(UndoList.Last)^.BindToNext := False; //added by adenry later
  lstSubtitles.Refresh;
  RefreshTimes;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.cmbOrgCharsetSelect(Sender: TObject);
begin
  if cmbOrgCharset.ItemIndex <> -1 then
  begin
    OrgCharset := StrCharsetToInt(cmbOrgCharset.Items[cmbOrgCharset.ItemIndex]);
    mmoSubtitleText.Font.Charset := OrgCharset;
    if lstSubtitles.SelectedCount = 1 then RefreshTimes; //added by adenry - refresh mmoSubtitleText's text
    lstSubtitles.Refresh; //repaint texts in lstSubtitles
    if (Player.Initialized) and (mnuDisplayOriginal.Checked) then
      subSubtitle.Font.Charset := OrgCharset;
    if Assigned(frmInfoErrors) then frmInfoErrors.SetCustomInfosCharsets; //added later
    Dashes := SetDashes(OrgCharset); //added by adenry - refresh dashes list (not all charsets support all dashes characters)
    AutoRecheckAllErrors(TextErrors); //added by adenry - dashes may have changed, so dash-related errors may have changed
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.cmbTransCharsetSelect(Sender: TObject);
begin
  if cmbTransCharset.ItemIndex <> -1 then
  begin
    //set new charset:
    TransCharset := StrCharsetToInt(cmbTransCharset.Items[cmbTransCharset.ItemIndex]);
    mmoTranslation.Font.Charset := TransCharset;
    if lstSubtitles.SelectedCount = 1 then RefreshTimes; //added by adenry - refresh mmoTranslation's text
    SetUntranslatedSubString; //added by adenry - refresh the - Untranslated subtitle - string
    lstSubtitles.Refresh; //repaint texts in lstSubtitles
    if (Player.Initialized) and (mnuDisplayTranslation.Checked) then
      subSubtitle.Font.Charset := TransCharset;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuNewSubtitleClick(Sender: TObject);
begin
  if CloseSub then
  begin
    SubtitleAPI.CreateNewSubtitle;
    EnableCtrls(True);
    InsertNode;
    RefreshTimes;
    AutoRecheckNodeErrorsAndRepaint(lstSubtitles.GetFirst); //added by adenry
    OrgModified     := False;
    TransModified   := False;
    MarkingModified := False; //added by adenry
    OldInputFPS := GetInputFPS; //added by adenry
    OldFPS      := GetFPS; //added by adenry
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuFirstSyncPointClick(Sender: TObject);
begin
  btnSyncPoint1Click(Sender);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuLastSyncPointClick(Sender: TObject);
begin
  btnSyncPoint2Click(Sender);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuAddSyncPointClick(Sender: TObject);
begin
  btnAddSyncPointClick(Sender);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.btnSyncPoint1Click(Sender: TObject);
begin
  if (Player.Initialized) and (lstSubtitles.RootNodeCount > 1) and (lstSubtitles.Enabled) then
  begin
    SyncPoint.Point1Sub   := GetStartTime(lstSubtitles.GetFirstSelected);
    SyncPoint.Point1Movie := GetCurrentPos;
  end;  
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.btnSyncPoint2Click(Sender: TObject);
begin
  if (Player.Initialized) and (SyncPoint.Point1Sub <> -1) and (SyncPoint.Point1Movie <> -1) and (lstSubtitles.RootNodeCount > 1) and (lstSubtitles.Enabled) then
  begin
    SyncPoint.Point2Sub   := GetStartTime(lstSubtitles.GetFirstSelected);
    SyncPoint.Point2Movie := GetCurrentPos;

    if MsgBox(Format(QuestionMsg[06], [TimeToString(SyncPoint.Point1Sub),
                                      TimeToString(SyncPoint.Point1Movie),
                                      TimeToString(SyncPoint.Point2Sub),
                                      TimeToString(SyncPoint.Point2Movie)]),
              BTN_YES, BTN_NO, '', MB_ICONQUESTION, frmMain) = mrOk then
    begin
      AdjustSubtitles(SyncPoint, 2);
      SyncPoint.Point1Sub   := -1;
      SyncPoint.Point1Movie := -1;
      SyncPoint.Point2Sub   := -1;
      SyncPoint.Point2Movie := -1;
    end;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.btnAddSyncPointClick(Sender: TObject);
begin
  if (lstSubtitles.RootNodeCount > 1) and (Assigned(lstSubtitles.FocusedNode)) and (lstSubtitles.SelectedCount = 1) then
  begin
    if AdjustFormOpened = False then
    begin
      frmAdjustSubtitles := TfrmAdjustSubtitles.Create(Application);
      frmAdjustSubtitles.pgeMode.ActivePageIndex := 1;
      frmAdjustSubtitles.Show;
      AdjustFormOpened := True;
    end else
      frmAdjustSubtitles.BringToFront;
    frmAdjustSubtitles.AddSyncPoint(GetStartTime(lstSubtitles.GetFirstSelected), GetCurrentPos, lstSubtitles.GetFirstSelected.Index + 1);
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuSelectAllClick(Sender: TObject);
begin
  //added by adenry: begin
  if Screen.ActiveControl.ClassName = 'TRichEdit' then
    TRichEdit(Screen.ActiveControl).SelectAll else
  if Screen.ActiveControl.ClassName = 'TMemo' then
    TMemo(Screen.ActiveControl).SelectAll else
  if Screen.ActiveControl.ClassName = 'TEdit' then
    TEdit(Screen.ActiveControl).SelectAll else
  if Screen.ActiveControl.ClassName = 'TComboBox' then
    TComboBox(Screen.ActiveControl).SelectAll else
  if Screen.ActiveControl.ClassName = 'TTimeMaskEdit' then
    TTimeMaskEdit(Screen.ActiveControl).SelectAll else
  //added by adenry: end
    begin
      lstSubtitles.SelectAll(False);
      RefreshTimes; //added by adenry later //was RefreshStatusbar before
    end;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuBack5SecClick(Sender: TObject);
begin
  SetVideoPos(GetCurrentPos - 5000);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuFwd5SecClick(Sender: TObject);
begin
  SetVideoPos(GetCurrentPos + 5000);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuSetDurationLimitsClick(Sender: TObject);
begin
  frmDurationLimits := TfrmDurationLimits.Create(Application);
  frmDurationLimits.ShowModal;
  frmDurationLimits.Free;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuSetDelayClick(Sender: TObject);
begin
  frmSetDelay := TfrmSetDelay.Create(Application);
  frmSetDelay.ShowModal;
  frmSetDelay.Free;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuAdjustSubtitlesClick(Sender: TObject);
begin
  if AdjustFormOpened = False then
  begin
    frmAdjustSubtitles := TfrmAdjustSubtitles.Create(Application);
    frmAdjustSubtitles.pgeMode.ActivePageIndex := 0;    
    frmAdjustSubtitles.Show;
    AdjustFormOpened := True;
  end else
    frmAdjustSubtitles.BringToFront;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuSubSearchClick(Sender: TObject);
begin
  frmSearchAndReplace := TfrmSearchAndReplace.Create(Application);
  frmSearchAndReplace.pgeCtrl.ActivePageIndex := 0;
  frmSearchAndReplace.ShowModal;
  frmSearchAndReplace.Free;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuFindNextClick(Sender: TObject);
begin
  if FindInNode(SearchWord, CaseSensitive, MatchWholeWords, True) = nil then
    MsgBox(Format(InfoMsg[01], [SearchWord]), BTN_OK, '', '', MB_ICONINFORMATION, frmMain) else
    RefreshTimes;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuSearchAndReplaceClick(Sender: TObject);
begin
  frmSearchAndReplace := TfrmSearchAndReplace.Create(Application);
  frmSearchAndReplace.pgeCtrl.ActivePageIndex := 1;
  frmSearchAndReplace.ShowModal;
  frmSearchAndReplace.Free;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.GoToLineNumber(Line: Integer);
var
  Node : PVirtualNode;
  RootNodeCount: Integer;
begin
  dec(Line);
  RootNodeCount := lstSubtitles.RootNodeCount;

  if Line < 0 then
    Line := 0;
  if Line >= RootNodeCount then   // was Line > RootNodeCount
    Line := RootNodeCount-1;

  Node := GetNodeWithIndex(lstSubtitles, Line);
  UnSelectAll(lstSubtitles);
  lstSubtitles.ScrollIntoView(Node, True);
  lstSubtitles.Selected[Node] := True;
  lstSubtitles.FocusedNode    := Node;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuGoToLineNumberClick(Sender: TObject);
var
  S    : String;
begin
  S := '';
  if QueryInput(GoToLineNum, EnterLineNum, S, frmMain) = mrOk then
  begin
    if (IsInteger(S) = False) or (Length(S) > 8) then
      MsgBox(ErrorMsg[06], BTN_OK, '', '', MB_ICONERROR, frmMain)
    else
      GoToLineNumber(StrToInt(S));
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuBatchConvertClick(Sender: TObject);
begin
  frmBatchConvert := TfrmBatchConvert.Create(Application);
  frmBatchConvert.ShowModal;
  frmBatchConvert.Free; 
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuSwapClick(Sender: TObject);
begin
  SwapOrgTrans(Sender);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuExtendLengthClick(Sender: TObject);
var
  Node          : PVirtualNode;
  NewFinalTime  : Integer; //added by adenry
  //OldFinalTime  : Integer; //removed by adenry
  UndoAction    : PUndoAction;
begin
  Node := lstSubtitles.GetFirstSelected;
  while Assigned(Node) do
  begin
    //OldFinalTime := GetFinalTime(Node); //removed by adenry
    New(UndoAction);
    UndoAction^.UndoActionType                 := uaTimeChange;
    UndoAction^.UndoActionName                 := uanExtLen; //added by adenry
    UndoAction^.BufferSize                     := SizeOf(TTimeChange);
    UndoAction^.Buffer                         := AllocMem(UndoAction^.BufferSize);
    UndoAction^.Node                           := Node;
    UndoAction^.LineNumber                     := Node.Index;
    PTimeChange(UndoAction^.Buffer)^.StartTime := -1;
    PTimeChange(UndoAction^.Buffer)^.FinalTime := GetFinalTime(Node); //OldFinalTime //changed by adenry
    UndoAction^.BindToNext                     := True; //added by adenry

    if Node <> lstSubtitles.GetLast then
      NewFinalTime := GetStartTime(Node.NextSibling) - DefaultSubPause else //added by adenry
      NewFinalTime := GetFinalTime(Node); //added by adenry
      //SetFinalTime(Node, GetStartTime(Node.NextSibling)-DefaultSubPause); //-1 replaced with DefaultSubPause by adenry

    if NewFinalTime <> GetFinalTime(Node) then //if OldFinalTime <> GetFinalTime(Node) then //changed by adenry
    begin
      //UndoAction^.BindToNext := Assigned(lstSubtitles.GetNextSelected(Node)); //removed by adenry
      SetFinalTime(Node, NewFinalTime); //added by adenry
      AddUndo(UndoAction);
    end;

    AutoRecheckNodeErrors(Node, TimeErrors); //added by adenry
    AutoRecheckNodeErrors(Node.NextSibling, PauseErrors); //added by adenry
    Node := lstSubtitles.GetNextSelected(Node);
  end;

  if UndoList.Count > 0 then
    PUndoAction(UndoList.Last)^.BindToNext := False;
  lstSubtitles.Refresh;
  RefreshTimes;
end;

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.mnuExtendLength2Click(Sender: TObject);
var
  Node          : PVirtualNode;
  NewStartTime  : Integer;
  UndoAction    : PUndoAction;
begin
  Node := lstSubtitles.GetFirstSelected;
  while Assigned(Node) do
  begin
    New(UndoAction);
    UndoAction^.UndoActionType                 := uaTimeChange;
    UndoAction^.UndoActionName                 := uanExtLen2; //added by adenry
    UndoAction^.BufferSize                     := SizeOf(TTimeChange);
    UndoAction^.Buffer                         := AllocMem(UndoAction^.BufferSize);
    UndoAction^.Node                           := Node;
    UndoAction^.LineNumber                     := Node.Index;
    PTimeChange(UndoAction^.Buffer)^.StartTime := GetStartTime(Node);
    PTimeChange(UndoAction^.Buffer)^.FinalTime := -1;
    UndoAction^.BindToNext                     := True;

    if Node <> lstSubtitles.GetFirst then
      NewStartTime := GetFinalTime(Node.PrevSibling)+DefaultSubPause else
      NewStartTime := GetStartTime(Node);

    if NewStartTime <> GetStartTime(Node) then
    begin
      AddUndo(UndoAction);
      SetStartTime(Node, NewStartTime);
    end;

    AutoRecheckNodeErrors(Node, TimeErrors); //added by adenry
    //AutoRecheckNodeErrors(Node.NextSibling, PauseErrors); //added by adenry
    Node := lstSubtitles.GetNextSelected(Node);
  end;

  if UndoList.Count > 0 then //added by adenry later
    PUndoAction(UndoList.Last)^.BindToNext := False; //added by adenry later
  lstSubtitles.Refresh;
  RefreshTimes;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuAutomaticDurationsClick(Sender: TObject);
begin
  frmAutomaticDurations := TfrmAutomaticDurations.Create(Application);
  frmAutomaticDurations.ShowModal;
  frmAutomaticDurations.Free;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuSplitSubtitleClick(Sender: TObject);
begin
  frmSplit := TfrmSplit.Create(Application);
  frmSplit.ShowModal;
  frmSplit.Free;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuJoinSubtitleClick(Sender: TObject);
begin
  frmJoin := TfrmJoin.Create(Application);
  frmJoin.ShowModal;
  frmJoin.Free;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuInformationAndErrorsClick(Sender: TObject);
begin
  if not Assigned(frmInfoErrors) then //added by adenry
    frmInfoErrors := TfrmInfoErrors.Create(Application);
  frmInfoErrors.Show;//added by adenry
  //frmInfoErrors.ShowModal; //removed by adenry
  //frmInfoErrors.Free; //removed by adenry
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuVariousInformationClick(Sender: TObject);
begin
  if not Assigned(frmVariousInfo) then //added by adenry
    frmVariousInfo := TfrmVariousInfo.Create(Application);
  frmVariousInfo.Show; //added by adenry
  //frmVariousInfo.ShowModal; //removed by adenry
  //frmVariousInfo.Free; //removed by adenry
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuAddFPSfromAVIClick(Sender: TObject);
var
  FPS      : Single;
  Duration : Integer;
begin
  dlgLoadFile.Filter := 'AVI Files (*.avi)|*.avi';
  if (dlgLoadFile.Execute) and (dlgLoadFile.FileName <> '') then
  begin
    if GetVideoInfo(dlgLoadFile.FileName, FPS, Duration) = True then
      AddFPSItem(FPS, False, True, False) else
      MsgBox(Format(ErrorMsg[05], [dlgLoadFile.FileName]), BTN_OK, '', '', MB_ICONERROR, frmMain);
  end;
  dlgLoadFile.Filter := SubtitleAPI.FillDialogFilter(AllSupportedFiles) + ID_SRF + '|' + ID_PLAINTEXT;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuItalicClick(Sender: TObject);
//added by adenry: begin
begin
  if (lstSubtitles.FocusedColumn = 4) or (mmoTranslation.Focused) then
  begin
    tbItalicTrans.Down := not tbItalicTrans.Down; //simulate toolbar button click
    SetBoldItalicUnderline(tbItalicTrans, mmoTranslation);
  end else
  begin
    tbItalic.Down := not tbItalic.Down; //simulate toolbar button click
    SetBoldItalicUnderline(tbItalic, mmoSubtitleText);
  end;
end;
//added by adenry: end
//removed by adenry: begin
{var
  Text         : String;
  Node         : PVirtualNode;
  UndoAction   : PUndoAction;
  OriginalOnly : Boolean; // True for original, false for both (translation and original)
begin
  Node := lstSubtitles.GetFirstSelected;
  while Assigned(Node) do
  begin
    New(UndoAction);
    UndoAction^.UndoActionType := uaFullTextChange;
    UndoAction^.UndoActionName := uanItalic; //added by adenry
    UndoAction^.BufferSize     := SizeOf(TFullTextChange);
    UndoAction^.Buffer         := AllocMem(UndoAction^.BufferSize);
    UndoAction^.Node           := Node;
    UndoAction^.LineNumber     := UndoAction^.Node.Index;
    UndoAction^.BindToNext     := lstSubtitles.SelectedCount > 1;

    Text := GetSubText(Node);
    PFullTextChange(UndoAction^.Buffer)^.OldText := Text;

    if mnuItalicPopup.Checked = False then
    begin
      if Pos('<i>', Text) = 0 then
        Text := '<i>' + Text;
    end else
      Text := RemoveSWTags(Text, False, True, False, False, True);
    SetText(Node, Text);

    if mnuTranslatorMode.Checked then
    begin
      OriginalOnly := False;

      Text := GetSubTranslation(Node);
      PFullTextChange(UndoAction^.Buffer)^.OldTrans := Text;
            
      if mnuItalicPopup.Checked = False then
      begin
        if Pos('<i>', Text) = 0 then
          Text := '<i>' + Text;
      end else
        Text := RemoveSWTags(Text, False, True, False, False, True);
      SetTranslation(Node, Text);
    end else
      OriginalOnly := True;

    PFullTextChange(UndoAction^.Buffer)^.OriginalOnly := OriginalOnly;

    AutoRecheckNodeErrors(Node, TextErrors); //added by adenry
    Node := lstSubtitles.GetNextSelected(Node);

    if Assigned(Node) = False then UndoAction^.BindToNext := False;

    AddUndo(UndoAction);
  end;
  
  lstSubtitles.Refresh;
  RefreshTimes;
end;}
//removed by adenry: end

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuBoldClick(Sender: TObject);
//added by adenry: begin
begin
  if (lstSubtitles.FocusedColumn = 4) or (mmoTranslation.Focused) then
  begin
    tbBoldTrans.Down := not tbBoldTrans.Down; //simulate toolbar button click
    SetBoldItalicUnderline(tbBoldTrans, mmoTranslation);
  end else
  begin
    tbBold.Down := not tbBold.Down; //simulate toolbar button click
    SetBoldItalicUnderline(tbBold, mmoSubtitleText);
  end;
end;
//added by adenry: end
//removed by adenry: begin
{var
  Text         : String;
  Node         : PVirtualNode;
  UndoAction   : PUndoAction;
  OriginalOnly : Boolean; // True for original, false for both (translation and original)
begin
  Node := lstSubtitles.GetFirstSelected;
  while Assigned(Node) do
  begin
    New(UndoAction);
    UndoAction^.UndoActionType := uaFullTextChange;
    UndoAction^.UndoActionName := uanBold; //added by adenry
    UndoAction^.BufferSize     := SizeOf(TFullTextChange);
    UndoAction^.Buffer         := AllocMem(UndoAction^.BufferSize);
    UndoAction^.Node           := Node;
    UndoAction^.LineNumber     := UndoAction^.Node.Index;
    UndoAction^.BindToNext     := lstSubtitles.SelectedCount > 1;
    
    Text := GetSubText(Node);
    PFullTextChange(UndoAction^.Buffer)^.OldText := Text;

    if mnuBoldPopup.Checked = False then
    begin
      if Pos('<b>', Text) = 0 then
        Text := '<b>' + Text;
    end else
      Text := RemoveSWTags(Text, True, False, False, False, True); //flags fixed by adenry
    SetText(Node, Text);

    if mnuTranslatorMode.Checked then
    begin
      OriginalOnly := False;
      Text := GetSubTranslation(Node);
      PFullTextChange(UndoAction^.Buffer)^.OldTrans := Text;
      if mnuBoldPopup.Checked = False then
      begin
        if Pos('<b>', Text) = 0 then
          Text := '<b>' + Text;
      end else
        Text := RemoveSWTags(Text, True, False, False, False, True); //flags fixed by adenry
      SetTranslation(Node, Text);
    end else
      OriginalOnly := True;

    PFullTextChange(UndoAction^.Buffer)^.OriginalOnly := OriginalOnly;

    AutoRecheckNodeErrors(Node, TextErrors); //added by adenry
    Node := lstSubtitles.GetNextSelected(Node);

    if Assigned(Node) = False then UndoAction^.BindToNext := False;

    AddUndo(UndoAction);
  end;
  lstSubtitles.Refresh;
  RefreshTimes;
end;}
//removed by adenry: end

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuUnderlineClick(Sender: TObject);
//added by adenry: begin
begin
  if (lstSubtitles.FocusedColumn = 4) or (mmoTranslation.Focused) then
  begin
    tbUnderlineTrans.Down := not tbUnderlineTrans.Down; //simulate toolbar button click
    SetBoldItalicUnderline(tbUnderlineTrans, mmoTranslation);
  end else
  begin
    tbUnderline.Down := not tbUnderline.Down; //simulate toolbar button click
    SetBoldItalicUnderline(tbUnderline, mmoSubtitleText);
  end;
end;
//added by adenry: end
//removed by adenry: begin
{var
  Text         : String;
  Node         : PVirtualNode;
  UndoAction   : PUndoAction;
  OriginalOnly : Boolean; // True for original, false for both (translation and original)
begin
  Node := lstSubtitles.GetFirstSelected;
  while Assigned(Node) do
  begin
    New(UndoAction);
    UndoAction^.UndoActionType := uaFullTextChange;
    UndoAction^.UndoActionName := uanUnderline; //added by adenry
    UndoAction^.BufferSize     := SizeOf(TFullTextChange);
    UndoAction^.Buffer         := AllocMem(UndoAction^.BufferSize);
    UndoAction^.Node           := Node;
    UndoAction^.LineNumber     := UndoAction^.Node.Index;
    UndoAction^.BindToNext     := lstSubtitles.SelectedCount > 1;

    Text := GetSubText(Node);
    PFullTextChange(UndoAction^.Buffer)^.OldText := Text;

    if mnuUnderlinePopup.Checked = False then
    begin
      if Pos('<u>', Text) = 0 then
        Text := '<u>' + Text;
    end else
      Text := RemoveSWTags(Text, False, False, True, False, True); //flags fixed by adenry
    SetText(Node, Text);

    if mnuTranslatorMode.Checked then
    begin
      OriginalOnly := False;
      Text := GetSubTranslation(Node);
      PFullTextChange(UndoAction^.Buffer)^.OldTrans := Text;
      if mnuUnderlinePopup.Checked = False then
      begin
        if Pos('<u>', Text) = 0 then
          Text := '<u>' + Text;
      end else
        Text := RemoveSWTags(Text, False, False, True, False, True); //flags fixed by adenry
      SetTranslation(Node, Text);
    end else
      OriginalOnly := True;

    PFullTextChange(UndoAction^.Buffer)^.OriginalOnly := OriginalOnly;

    AutoRecheckNodeErrors(Node, TextErrors); //added by adenry
    Node := lstSubtitles.GetNextSelected(Node);

    if Assigned(Node) = False then UndoAction^.BindToNext := False;

    AddUndo(UndoAction);
  end;

  lstSubtitles.Refresh;
  RefreshTimes;
end;}
//removed by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.SetNodeColor(Node: PVirtualNode; Color: TColor; Translation: Boolean = False; RemoveOtherColors: Boolean = False; ToggleSetRemove: Boolean = False);
var
  Text       : String;
  UndoAction : PUndoAction;
  mmo        : TSWTextEdit;  //TMemo changed to TSWTextEdit
begin
  New(UndoAction);
  UndoAction^.UndoActionType := uaFullTextChange;
  UndoAction^.UndoActionName := uanColor;
  UndoAction^.BufferSize     := SizeOf(TFullTextChange);
  UndoAction^.Buffer   := AllocMem(UndoAction^.BufferSize);
  UndoAction^.Node     := Node;
  UndoAction^.LineNumber     := UndoAction^.Node.Index;
  UndoAction^.BindToNext     := Assigned(lstSubtitles.GetNextSelected(Node));
  if Translation = False then
  begin
    Text := GetSubText(Node);
    PFullTextChange(UndoAction^.Buffer)^.OldText := Text;
    PFullTextChange(UndoAction^.Buffer)^.OriginalOnly := True;
  end else
  begin
    Text := GetSubTranslation(Node);
    PFullTextChange(UndoAction^.Buffer)^.OriginalOnly := False;
    PFullTextChange(UndoAction^.Buffer)^.OldTrans := Text;
  end;
  AddUndo(UndoAction);
  
  if ToggleSetRemove and (GetSubColor(RemoveSWTags(Text, True, True, True, False), True) = Color) then
  begin
    Text := RemoveSWTags(Text, False, False, False, True);
  end else
  begin
    if Translation then
      mmo := mmoTranslation else
      mmo := mmoSubtitleText;

    if SubtitleAPI.MultiTagsMode and (mmo.SelLength > 0) and (frmMain.ActiveControl = mmo) then
    begin
      //Insert('</font>', Text, mmo.SelStart+1+mmo.SelLength);
      //Insert('<font color=#'+ColorToHTML(Color)+'>', Text, mmo.SelStart+1);
      Insert('</c>', Text, mmo.SelStart+1+mmo.SelLength);
      Insert('<c:#'+ColorToHTML(Color)+'>', Text, mmo.SelStart+1);
    end else
    begin
      if RemoveOtherColors then
        Text := RemoveSWTags(Text, False, False, False, True);
      Text := SetColorTag(Text, Color);
    end;
  end;

  if Translation = False then
    SetText(Node, Text) else
    SetTranslation(Node, Text);

  AutoRecheckNodeErrors(Node, TextErrors); //added by adenry
end;
//removed by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.SetColor(TextColor: Boolean = False; TransColor: Boolean = False; NoDialog: Boolean = False; RemoveOtherColors: Boolean = False; ToggleSetRemove: Boolean = False);

  procedure SetTheColor(Translation: Boolean);
  var
    Node         : PVirtualNode;
  begin
    if NoDialog or (dlgColor.Execute) then
    begin
      Node := lstSubtitles.GetFirstSelected;
      while Assigned(Node) do
      begin
        SetNodeColor(Node, dlgColor.Color, Translation, RemoveOtherColors, ToggleSetRemove);
        Node := lstSubtitles.GetNextSelected(Node);
      end;
      lstSubtitles.Refresh;
      RefreshTimes;
    end;
  end;

begin
  if TextColor then
    SetTheColor(False) else
  if TransColor then
    SetTheColor(True) else
  if (lstSubtitles.FocusedColumn = 4) or (mmoTranslation.Focused) then
    SetTheColor(True) else
    SetTheColor(False);
end;
//added by adenry: end

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuSetColorClick(Sender: TObject);
//added by adenry: begin
begin
  SetColor;
end;
//added by adenry: end
//removed by adenry: begin
{var
  Node         : PVirtualNode;
  Text         : String;
  UndoAction   : PUndoAction;
  OriginalOnly : Boolean; // True for original, false for both (translation and original)
begin
  if (dlgColor.Execute) then
  begin
    Node := lstSubtitles.GetFirstSelected;
    while Assigned(Node) do
    begin
      New(UndoAction);
      UndoAction^.UndoActionType := uaFullTextChange;
      UndoAction^.UndoActionName := uanColor; //added by adenry
      UndoAction^.BufferSize     := SizeOf(TFullTextChange);
      UndoAction^.Buffer         := AllocMem(UndoAction^.BufferSize);
      UndoAction^.Node           := Node;
      UndoAction^.LineNumber     := UndoAction^.Node.Index;
      UndoAction^.BindToNext     := lstSubtitles.SelectedCount > 1;

      Text := GetSubText(Node);
      PFullTextChange(UndoAction^.Buffer)^.OldText := Text;

      //added by adenry: begin
      if SubtitleApi.MultiTagsMode and (mmo.SelLength > 0) then
      begin
        Insert('</font>', Text, mmo.SelStart+1+mmo.SelLength);
        Insert('<font color=#'+ColorToHTML(dlgColor.Color)+'>', Text, mmo.SelStart+1);
        SetText(Node, Text);
      end else
      //added by adenry: end
        SetText(Node, SetColorTag(Text, dlgColor.Color));

      if mnuTranslatorMode.Checked then
      begin
        OriginalOnly := False;
        Text := GetSubTranslation(Node);
        PFullTextChange(UndoAction^.Buffer)^.OldTrans := Text;
        SetTranslation(Node, SetColorTag(Text, dlgColor.Color));
      end else
        OriginalOnly := True;

      PFullTextChange(UndoAction^.Buffer)^.OriginalOnly := OriginalOnly;

      AutoRecheckNodeErrors(Node, TextErrors); //added by adenry
      Node := lstSubtitles.GetNextSelected(Node);

      if Assigned(Node) = False then UndoAction^.BindToNext := False;

      AddUndo(UndoAction);
    end;

    lstSubtitles.Refresh;
    RefreshTimes;
  end;
end;}
//removed by adenry: end

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuRemoveColorTagsClick(Sender: TObject);
var
  Node         : PVirtualNode;
  Text         : String;
  UndoAction   : PUndoAction;
  OriginalOnly : Boolean; // True for original, false for both (translation and original)
begin
  Node := lstSubtitles.GetFirstSelected;
  while Assigned(Node) do
  begin
    New(UndoAction);
    UndoAction^.UndoActionType := uaFullTextChange;
    UndoAction^.UndoActionName := uanRemoveColor; //added by adenry
    UndoAction^.BufferSize     := SizeOf(TFullTextChange);
    UndoAction^.Buffer         := AllocMem(UndoAction^.BufferSize);
    UndoAction^.Node           := Node;
    UndoAction^.LineNumber     := UndoAction^.Node.Index;
    UndoAction^.BindToNext     := lstSubtitles.SelectedCount > 1;

    Text := GetSubText(Node);
    PFullTextChange(UndoAction^.Buffer)^.OldText := Text;

    //SetText(Node, RemoveSWTags(Text, False, False, False, True)); //moved from her by adenry

    //if mnuTranslatorMode.Checked then //removed by adenry
    if (lstSubtitles.FocusedColumn = 4) or (mmoTranslation.Focused) then //added by adenry
    begin
      OriginalOnly := False;
      Text := GetSubTranslation(Node);
      PFullTextChange(UndoAction^.Buffer)^.OldTrans := Text;
      SetTranslation(Node, RemoveSWTags(Text, False, False, False, True, True));
    end else
    begin
      SetText(Node, RemoveSWTags(Text, False, False, False, True, True)); //moved her by adenry
      OriginalOnly := True;
    end;

    PFullTextChange(UndoAction^.Buffer)^.OriginalOnly := OriginalOnly;

    AutoRecheckNodeErrors(Node, TextErrors); //added by adenry
    Node := lstSubtitles.GetNextSelected(Node);

    if Assigned(Node) = False then UndoAction^.BindToNext := False;

    AddUndo(UndoAction);
  end;

  lstSubtitles.Refresh;
  RefreshTimes;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuStylePopupPopup(Sender: TObject);
begin
  //added by adenry: begin
  //if SubtitleApi.MultiTagsMode then
  //begin
    if lstSubtitles.FocusedColumn = 3 then
    begin
      mnuBoldPopup.Checked := tbBold.Down;
      mnuItalicPopup.Checked := tbItalic.Down;
      mnuUnderlinePopup.Checked := tbUnderline.Down;
    end else
    if lstSubtitles.FocusedColumn = 4 then
    begin
      mnuBoldPopup.Checked := tbBoldTrans.Down;
      mnuItalicPopup.Checked := tbItalicTrans.Down;
      mnuUnderlinePopup.Checked := tbUnderlineTrans.Down;
    end else
    begin
      mnuBoldPopup.Checked := tbBold.Down and tbBoldTrans.Down;
      mnuItalicPopup.Checked := tbItalic.Down and tbItalicTrans.Down;
      mnuUnderlinePopup.Checked := tbUnderline.Down and tbUnderlineTrans.Down;
    end;
  //end; else
  //added by adenry: end
  //removed by adenry: begin
  {begin
    mnuBoldPopup.Checked      := Pos('<b>', GetSubText(lstSubtitles.FocusedNode)) > 0;
    mnuItalicPopup.Checked    := Pos('<i>', GetSubText(lstSubtitles.FocusedNode)) > 0;
    mnuUnderlinePopup.Checked := Pos('<u>', GetSubText(lstSubtitles.FocusedNode)) > 0;
  end;}
  //removed by adenry: end
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.tmrSaveWorkTimer(Sender: TObject);
begin
  if lstSubtitles.RootNodeCount > 0 then
  if not Assigned(frmSaveAs) then //added by adenry - because saving the backup just prior to saving a file results in not saving the file!
  begin
    // ------------------ //
    //    Save original   //
    // ------------------ //
    if OrgFile <> '' then
    begin
      UpdateArray(OrgFormat);  //format index added by adenry
      if SaveAsBackup = False then
      begin
        if SaveFile(OrgFile, OrgFormat, GetFPS) then // We save original file in it's original format
        begin
          OrgModified := False;
          UndoNumWhenOrgSaved := UndoList.Count; //added by adenry
        end;
      end else
        SaveFile(OrgFile + '.bak', OrgFormat, GetFPS);
      SubtitleAPI.ClearSubtitles;
    end else
      if (frmSaveAsExecuting=False) and (AskToSaveNewSubs) then //added by adenry
        mnuSaveFileAsClick(Sender);

    // -------------------- //
    //    Save translated   //
    // -------------------- //
    if (mnuTranslatorMode.Checked) then
    begin
      if (TransFile <> '') then
      begin
        UpdateArray(TransFormat, True); //added by adenry  //format index added by adenry
        if SaveAsBackup = False then
        begin
          //UpdateArray(True); //removed by adenry - moved up
          if SaveFile(TransFile, TransFormat, GetFPS) then // We save translated file in it's original format
          begin
            TransModified := False;
            UndoNumWhenTransSaved := UndoList.Count; //added by adenry
          end;
        end else
          SaveFile(TransFile + '.bak', TransFormat, GetFPS);
        SubtitleAPI.ClearSubtitles;
      end else
        if (frmSaveAsExecuting=False) and (AskToSaveNewSubs) then //added by adenry
          mnuSaveTranslatedAsClick(Sender);
    end;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.cmbInputFPSKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = Chr(VK_RETURN)) and (IsFloat(cmbInputFPS.Text)) then
    AddFPSItem(StrToFloat(cmbInputFPS.Text), True, True, True) else
  if (Key in ['0'..'9', DecimalSeparator, Chr(VK_RETURN), Chr(VK_BACK)]) = False then
    Key := #0;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.cmbFPSKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = Chr(VK_RETURN)) and (IsFloat(cmbFPS.Text)) then
    AddFPSItem(StrToFloat(cmbFPS.Text), False, True, False) else
  if (Key in ['0'..'9', DecimalSeparator, Chr(VK_RETURN), Chr(VK_BACK)]) = False then
    Key := #0;
end;


// -----------------------------------------------------------------------------

procedure TfrmMain.mnuAdjustToSyncSubsClick(Sender: TObject);
var
  Sync: TClassicSyncPoints;
begin
  dlgLoadFile.Filter := SubtitleAPI.FillDialogFilter(AllSupportedFiles);
  if (dlgLoadFile.Execute) and (dlgLoadFile.FileName <> '') then
  begin
    if SubtitleAPI.LoadSubtitle(dlgLoadFile.FileName, GetInputFPS, dlgLoadFile.FilterIndex - 1) then
    begin
      Sync.Point1Sub   := GetStartTime(lstSubtitles.GetFirst);
      Sync.Point2Sub   := GetStartTime(lstSubtitles.GetLast);
      Sync.Point1Movie := SubtitleAPI.GetInitialTime(0);
      Sync.Point2Movie := SubtitleAPI.GetInitialTime(SubtitleAPI.SubtitleCount-1);
      AdjustSubtitles(Sync, 3);
    end else
    begin
      if ((dlgLoadFile.FilterIndex - 1) = 0) then
        MsgBox(Format(ErrorMsg[03],[dlgLoadFile.FileName]), BTN_OK, '', '', MB_ICONERROR, frmMain) else
        MsgBox(Format(ErrorMsg[04],[dlgLoadFile.FileName, SubtitleAPI.GetFormatName(dlgLoadFile.FilterIndex - 1)]), BTN_OK, '', '', MB_ICONERROR, frmMain);
    end;
  end;
  dlgLoadFile.Filter := SubtitleAPI.FillDialogFilter(AllSupportedFiles) + ID_SRF + '|' + ID_PLAINTEXT;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuTimeExpanderReducerClick(Sender: TObject);
begin
  frmTimeExpanderReducer := TfrmTimeExpanderReducer.Create(Application);
  frmTimeExpanderReducer.ShowModal;
  frmTimeExpanderReducer.Free;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuReadTimesFromFileClick(Sender: TObject);
begin
  dlgLoadFile.Filter := SubtitleAPI.FillDialogFilter(AllSupportedFiles);
  if (dlgLoadFile.Execute) and (dlgLoadFile.FileName <> '') then
    ReadTextsAndTimesFromFile(dlgLoadFile.FileName, dlgLoadFile.FilterIndex - 1, True, False);
  dlgLoadFile.Filter := SubtitleAPI.FillDialogFilter(AllSupportedFiles) + ID_SRF + '|' + ID_PLAINTEXT;
  AutoRecheckAllErrors(TimeErrors); //added by adenry
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuReadTextsFromFileClick(Sender: TObject);
begin
  dlgLoadFile.Filter := SubtitleAPI.FillDialogFilter(AllSupportedFiles);
  if (dlgLoadFile.Execute) and (dlgLoadFile.FileName <> '') then
    ReadTextsAndTimesFromFile(dlgLoadFile.FileName, dlgLoadFile.FilterIndex -1, False, True);
  dlgLoadFile.Filter := SubtitleAPI.FillDialogFilter(AllSupportedFiles) + ID_SRF + '|' + ID_PLAINTEXT;
  AutoRecheckAllErrors(TextErrors); //added by adenry
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.cmbInputFPSSelect(Sender: TObject);
var
  Node: PVirtualNode;
  Time1, Time2: Integer;
  UndoAction: PUndoAction;
begin
  if InterfaceEnabled = False then
    cmbFPS.ItemIndex := cmbInputFPS.ItemIndex;
  if SubtitleAPI.IsFrameBased(OrgFormat) = False then
  begin
    //Undo method was changed by adenry in order to preserve the exact time values
    Node := lstSubtitles.GetFirst;
    while Assigned(Node) do
    begin
      //added by adenry: begin
      New(UndoAction);
      UndoAction^.UndoActionType := uaTimeChange;
      UndoAction^.UndoActionName := uanInputFPSEdit; //added by adenry
      UndoAction^.BufferSize     := SizeOf(TTimeChange);
      UndoAction^.Buffer         := AllocMem(UndoAction^.BufferSize);
      UndoAction^.Node           := Node;
      UndoAction^.LineNumber     := Node.Index;
      //added by adenry: end

      // ------------ //
      // Initial time //
      // ------------ //
      PTimeChange(UndoAction^.Buffer)^.StartTime := GetStartTime(Node); //added by adenry
      Time1 := TimeToFrames(GetStartTime(Node), GetInputFPS);
      SetStartTime(Node, FramesToTime(Time1, OldInputFPS));

      // ---------- //
      // Final time //
      // ---------- //
      PTimeChange(UndoAction^.Buffer)^.FinalTime := GetFinalTime(Node); //added by adenry
      Time2 := TimeToFrames(GetFinalTime(Node), GetInputFPS);
      SetFinalTime(Node, FramesToTime(Time2, OldInputFPS));

      Node := Node.NextSibling;
      UndoAction^.BindToNext := True; //the last one is bound to the uaFPSChange //added by adenry
      AddUndo(UndoAction); //added by adenry
    end;

    New(UndoAction);
    UndoAction^.UndoActionType                 := uaFPSChange;
    UndoAction^.UndoActionName                 := uanInputFPSEdit; //added by adenry
    UndoAction^.BindToNext                     := False;
    UndoAction^.BufferSize                     := SizeOf(TFPSChange);
    UndoAction^.Buffer                         := AllocMem(UndoAction^.BufferSize);
    PFPSChange(UndoAction^.Buffer)^.InputOrFPS := True;
    PFPSChange(UndoAction^.Buffer)^.OldValue   := OldInputFPS;
    AddUndo(UndoAction);

    OldInputFPS := GetInputFPS;
    //lstSubtitles.Refresh; //AutoRecheck***Errors refreshes it
    RefreshTimes;
    AutoRecheckAllErrors(TimeErrors); //added by adenry
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.cmbFPSSelect(Sender: TObject);
var
  Node: PVirtualNode;
  Time1, Time2: Integer;
  UndoAction: PUndoAction;
begin
  //Undo method was changed by adenry in order to preserve the exact time values
  Node := lstSubtitles.GetFirst;
  while Assigned(Node) do
  begin
    //added by adenry: begin
    New(UndoAction);
    UndoAction^.UndoActionType := uaTimeChange;
    UndoAction^.UndoActionName := uanFPSEdit; //added by adenry
    UndoAction^.BufferSize     := SizeOf(TTimeChange);
    UndoAction^.Buffer         := AllocMem(UndoAction^.BufferSize);
    UndoAction^.Node           := Node;
    UndoAction^.LineNumber     := Node.Index;
    //added by adenry: end

    // ------------ //
    // Initial time //
    // ------------ //
    PTimeChange(UndoAction^.Buffer)^.StartTime := GetStartTime(Node); //added by adenry
    Time1 := TimeToFrames(GetStartTime(Node), OldFPS);
    SetStartTime(Node, FramesToTime(Time1, GetFPS));

    // ---------- //
    // Final time //
    // ---------- //
    PTimeChange(UndoAction^.Buffer)^.FinalTime := GetFinalTime(Node); //added by adenry
    Time2 := TimeToFrames(GetFinalTime(Node), OldFPS);
    SetFinalTime(Node, FramesToTime(Time2, GetFPS));

    Node := Node.NextSibling;
    UndoAction^.BindToNext := True; //the last one is bound to the uaFPSChange //added by adenry
    AddUndo(UndoAction); //added by adenry
  end;

  New(UndoAction);
  UndoAction^.UndoActionType                 := uaFPSChange;
  UndoAction^.UndoActionName                 := uanFPSEdit; //added by adenry
  UndoAction^.BindToNext                     := False;
  UndoAction^.BufferSize                     := SizeOf(TFPSChange);
  UndoAction^.Buffer                         := AllocMem(UndoAction^.BufferSize);
  PFPSChange(UndoAction^.Buffer)^.InputOrFPS := False;
  PFPSChange(UndoAction^.Buffer)^.OldValue   := OldFPS;
  AddUndo(UndoAction);

  OldFPS          := GetFPS;
  tmeShow.FPS     := OldFPS;
  tmeHide.FPS     := OldFPS;
  tmeDuration.FPS := OldFPS;
  tmePause.FPS    := OldFPS; //added by adenry
  //lstSubtitles.Refresh; //AutoRecheck***Errors refreshes it
  RefreshTimes;
  AutoRecheckAllErrors(TimeErrors); //added by adenry
end;

// -----------------------------------------------------------------------------

  // removed by BDZL
{
  procedure TfrmMain.lstSubtitlesGetHint(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
  var CellText: WideString);

  function CountUnTranslated: Integer;
  var
    Node  : PVirtualNode;
    Text  : String;
    Trans : String;
  begin
    Result := 0;
    Node := lstSubtitles.GetFirst;
    while Assigned(Node) do
    begin
      Text  := GetSubText(Node);
      Trans := GetSubTranslation(Node);
      if (Text = Trans) or (Trans = '') or (Trans = UntranslatedSub) then
        Inc(Result);
      Node := Node.NextSibling;
    end;
  end;

var
  Data: PSubtitleItem;
begin
  Data     := lstSubtitles.GetNodeData(Node);
  CellText := '';

  if Data.ErrorType = [] then
  begin
    if Data.Marked = True then
      CellText := ErrorReports[20] else
      CellText := '';
  end;

  if etLinesWithoutLetters  in Data.ErrorType then  CellText := CellText + #13#10 + ErrorReports[01];
  if etEmptySubtitle        in Data.ErrorType then  CellText := CellText + #13#10 + ErrorReports[02];
  // ---
  if etOverlapping          in Data.ErrorType then  CellText := CellText + #13#10 + ErrorReports[03];
  if etBadValues            in Data.ErrorType then  CellText := CellText + #13#10 + ErrorReports[04];
  if etTooLongDuration      in Data.ErrorType then  CellText := CellText + #13#10 + ErrorReports[05];
  if etTooShortDuration     in Data.ErrorType then  CellText := CellText + #13#10 + ErrorReports[06];
  if etTooLongLine          in Data.ErrorType then  CellText := CellText + #13#10 + ErrorReports[07];
  if etOverTwoLines         in Data.ErrorType then  CellText := CellText + #13#10 + ErrorReports[08];
  // ---
  if etHearingImpaired      in Data.ErrorType then  CellText := CellText + #13#10 + ErrorReports[09];
  if etTextBeforeColon      in Data.ErrorType then  CellText := CellText + #13#10 + ErrorReports[10];
  if etUnnecessaryDots      in Data.ErrorType then  CellText := CellText + #13#10 + ErrorReports[11];
  if etProhibitedCharacter  in Data.ErrorType then  CellText := CellText + #13#10 + ErrorReports[12];
  if etRepeatedCharacter    in Data.ErrorType then  CellText := CellText + #13#10 + ErrorReports[13];
  if etRepeatedSubtitle     in Data.ErrorType then  CellText := CellText + #13#10 + ErrorReports[14];
  if etOCRErrors            in Data.ErrorType then  CellText := CellText + #13#10 + ErrorReports[15];
  // ---
  if etOpnDlgSubsOneLine    in Data.ErrorType then  CellText := CellText + #13#10 + ErrorReports[16];
  if etSpaceAfterCustChars  in Data.ErrorType then  CellText := CellText + #13#10 + ErrorReports[17];
  if etSpaceBeforeCustChars in Data.ErrorType then  CellText := CellText + #13#10 + ErrorReports[18];
  if etUnnecessarySpaces    in Data.ErrorType then  CellText := CellText + #13#10 + ErrorReports[19];

  if (Data.ErrorType = []) and (Data.Marked = False) then
  begin
    if mnuTranslatorMode.Checked then
      CellText := Format(TransLeftLines, [CountUnTranslated]) else
      lstSubtitles.Hint := '';
  end;
  CellText := StringToWideStringEx(Trim(CellText), CharsetToCodePage(frmMain.Font.Charset));
end;
}

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuAboutSubtitleWorkshopClick(Sender: TObject);
begin
  frmAbout := TfrmAbout.Create(Application);
  frmAbout.ShowModal;
  frmAbout.Free;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuExternalPreviewClick(Sender: TObject);
var
  Ini      : TIniFile;
  Params   : String;
  Video    : String;
  Ext      : String;
  FileName : String;
  Temp     : array[0..MAX_PATH]of Char;
  Format   : Integer;
begin
  Ini := TIniFile.Create(IniRoot);
  try
    if (FileExists(Ini.ReadString('External Preview','Video player', '')) = False) then
    begin
      if MsgBox(QuestionMsg[07], BTN_YES, BTN_NO, '', MB_ICONWARNING, frmMain) = 1 then
      begin
        frmSettings := TfrmSettings.Create(Application);
        frmSettings.pgeCtrl.ActivePage:= frmSettings.pgeExternalPreviewGeneral;
        frmSettings.tvSettings.Items[9].Selected := True;
        frmSettings.ShowModal;
        frmSettings.Free;
      end;
      exit
    end;

    Params := Ini.ReadString('External Preview','Parameter','');

    if Ini.ReadBool('External Preview','Ask for different video',True) then
    begin
      //dlgLoadFile.Filter := AllSupportedFiles + '|*.asf;*.avi;*.mp4;*.divx;*.mpg;*.mpeg;*.m1v;*.qt;*.wmv|ASF (*.asf)|*.asf|AVI (*.avi)|*.avi|DivX (*.mp4; *.divx)|*.mp4; *.divx|MPEG (*.mpg; *.mpeg; *.m1v)|*.mpg; *.mpeg; *.m1v|QuickTime 2.0 (*.qt)|*.qt|WMV (*.wmv)|*.wmv'; //removed by adenry
      dlgLoadFile.Filter := GetVideoFilesFilterString; //added by adenry
      if (dlgLoadFile.Execute) and (dlgLoadFile.FileName <> '') then
        Video := dlgLoadFile.FileName;
      dlgLoadFile.Filter := SubtitleAPI.FillDialogFilter(AllSupportedFiles) + ID_SRF + '|' + ID_PLAINTEXT;
    end else
      Video := Ini.ReadString('External Preview','Video to test','');

    if Video = '' then exit;
    Params := ReplaceString(Params, 'VIDEO_FILE', Video);

    if Ini.ReadBool('External Preview', 'Save in original format', True) then
      Format := OrgFormat else
      Format := SubtitleAPI.GetFormatIndex(Ini.ReadString('External Preview', 'Custom format', 'SubRip'));

    Ext := GetFormatExt(Format);

    GetTempPath(MAX_PATH, Temp);

    if mnuTranslatorMode.Checked = False then
      FileName := ExtractFileName(OrgFile) else
      FileName := ExtractFileName(TransFile);
    if FileName = '' then
      FileName := 'TmpSubFile' + Ext else
      FileName := Copy(FileName, 1, LastDelimiter('.', ExtractFileName(FileName))-1) + Ext;

    UpdateArray(Format, mnuTranslatorMode.Checked); //format index added by adenry
    SubtitleAPI.SaveSubtitle(String(Temp) + FileName, Format, GetFPS);
    SubtitleAPI.ClearSubtitles;

    Params := ReplaceString(Params, 'SUBT_FILE', String(Temp) + FileName);
    ShellExecute(handle,'open', PChar(Ini.ReadString('External Preview','Video player','')), PCHar(Params), nil, SW_SHOW);

  finally
    Ini.Free;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuSAMILangExtractorClick(Sender: TObject);
begin
  frmSAMILangExtractor := TfrmSAMILangExtractor.Create(Application);
  frmSAMILangExtractor.ShowModal;
  frmSAMILangExtractor.Free;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.pnlVideoDisplayClick(Sender: TObject);
begin
  Pause;
  //if (Player.Initialized) and (mnuVideoPreviewMode.Checked) then
    //edtPlayerShortcuts.SetFocus;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnu10PClick(Sender: TObject);
begin
  (Sender as TMenuItem).Checked := True;
  SetPlayBackRate(0.10, True);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnu20PClick(Sender: TObject);
begin
  (Sender as TMenuItem).Checked := True;
  SetPlayBackRate(0.20, True);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnu30PClick(Sender: TObject);
begin
  (Sender as TMenuItem).Checked := True;
  SetPlayBackRate(0.30, True);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnu40PClick(Sender: TObject);
begin
  (Sender as TMenuItem).Checked := True;
  SetPlayBackRate(0.40, True);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnu50PClick(Sender: TObject);
begin
  (Sender as TMenuItem).Checked := True;
  SetPlayBackRate(0.50, True);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnu60PClick(Sender: TObject);
begin
  (Sender as TMenuItem).Checked := True;
  SetPlayBackRate(0.60, True);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnu70PClick(Sender: TObject);
begin
  (Sender as TMenuItem).Checked := True;
  SetPlayBackRate(0.70, True);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnu80PClick(Sender: TObject);
begin
  (Sender as TMenuItem).Checked := True;
  SetPlayBackRate(0.80, True);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnu90PClick(Sender: TObject);
begin
  (Sender as TMenuItem).Checked := True;
  SetPlayBackRate(0.90, True);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnu100PClick(Sender: TObject);
begin
  (Sender as TMenuItem).Checked := True;
  SetPlayBackRate(1, True);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnu150PClick(Sender: TObject);
begin
  (Sender as TMenuItem).Checked := True;
  SetPlayBackRate(1.50, True);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnu200PClick(Sender: TObject);
begin
  (Sender as TMenuItem).Checked := True;
  SetPlayBackRate(2, True);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnu300PClick(Sender: TObject);
begin
  (Sender as TMenuItem).Checked := True;
  SetPlayBackRate(3, True);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnu400PClick(Sender: TObject);
begin
  (Sender as TMenuItem).Checked := True;
  SetPlayBackRate(4, True);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuRecheckErrorsClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass; //added by adenry
  try
    CheckMarkErrors;
    RefreshFormInfoErrors; //added by adenry
  finally
    Screen.Cursor := crDefault; //added by adenry
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuFixAllErrorsClick(Sender: TObject);
begin
  FixErrors;
  //AutoRecheckAllErrors; //added by adenry //not need now, auto recheck is done in FixError
  AutoRecheckAllErrors; //added back by adenry when making optimization
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuFixErrorsInSelSubsClick(Sender: TObject);
begin
  FixErrors(True);
  AutoRecheckAllErrors; //added by adenry when making optimization
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuJumpToNextErrorClick(Sender: TObject);
var
  Node, InitNode : PVirtualNode;
  Data           : PSubtitleItem;
begin
  if (Assigned(lstSubtitles.FocusedNode)) and (lstSubtitles.FocusedNode <> lstSubtitles.GetLast) then
    Node := lstSubtitles.FocusedNode.NextSibling else
    Node := lstSubtitles.GetFirst;
  InitNode := Node; //to prevent infinite loop
  while Assigned(Node) do
  begin
    Data := lstSubtitles.GetNodeData(Node);
    if Data.ErrorType <> [] then
    begin
      lstSubtitles.ScrollIntoView(Node, True);
      //lstSubtitles.Selected[lstSubtitles.FocusedNode] := False; //removed by adenry
      UnSelectAll(lstSubtitles); //added by adenry
      lstSubtitles.FocusedNode := Node;
      lstSubtitles.Selected[Node] := True;
      RefreshTimes;
      Break;
    end;
    if Node = lstSubtitles.GetLast then
      Node := lstSubtitles.GetFirst else
      Node := Node.NextSibling;
    if Node = InitNode then break; //to prevent infinite loop
  end;
end;

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.mnuJumpToPrevErrorClick(Sender: TObject);
var
  Node, InitNode : PVirtualNode;
  Data           : PSubtitleItem;
begin
  if (Assigned(lstSubtitles.FocusedNode)) and (lstSubtitles.FocusedNode <> lstSubtitles.GetFirst) then
    Node := lstSubtitles.FocusedNode.PrevSibling else
    Node := lstSubtitles.GetLast;
  InitNode := Node; //to prevent infinite loop
  while Assigned(Node) do
  begin
    Data := lstSubtitles.GetNodeData(Node);
    if Data.ErrorType <> [] then
    begin
      lstSubtitles.ScrollIntoView(Node, True);
      //lstSubtitles.Selected[lstSubtitles.FocusedNode] := False; //removed by adenry
      UnSelectAll(lstSubtitles); //added by adenry
      lstSubtitles.FocusedNode := Node;
      lstSubtitles.Selected[Node] := True;
      RefreshTimes;
      Break;
    end;
    if Node = lstSubtitles.GetFirst then
      Node := lstSubtitles.GetLast else
      Node := Node.PrevSibling;
    if Node = InitNode then break; //to prevent infinite loop
  end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuInfoErrorsSettingsClick(Sender: TObject);
begin
  frmInfoErrorsSettings := TfrmInfoErrorsSettings.Create(Application);
  frmInfoErrorsSettings.ShowModal;
  frmInfoErrorsSettings.Free;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuDeleteUnnecessaryLinksClick(Sender: TObject);
//added by adenry: begin
var
  Node        : PVirtualNode;
  Text1       : String;
  Text2       : String;
  tmpText1    : String;
  tmpText2    : String;
  DotPos      : Integer;
  UndoAction1 : PUndoAction;
  UndoAction2 : PUndoAction;
  MustAddUndo : Boolean; //added later
begin
  Node := lstSubtitles.GetFirst.NextSibling;
  while Assigned(Node) do
  begin
    Text1 := GetSubText(Node.PrevSibling);
    Text2 := GetSubText(Node);

    New(UndoAction1);
    UndoAction1^.UndoActionType := uaFullTextChange;
    UndoAction1^.UndoActionName := uanDelUnnecessaryLinks; //added by adenry
    UndoAction1^.BufferSize     := SizeOf(TFullTextChange);
    UndoAction1^.Buffer         := AllocMem(UndoAction1^.BufferSize);
    UndoAction1^.Node           := Node.PrevSibling;
    UndoAction1^.LineNumber     := Node.PrevSibling.Index;
    UndoAction1^.BindToNext     := True;
    PFullTextChange(UndoAction1^.Buffer)^.OriginalOnly := True;
    PFullTextChange(UndoAction1^.Buffer)^.OldText := Text1;

    New(UndoAction2);
    UndoAction2^.UndoActionType := uaFullTextChange;
    UndoAction2^.UndoActionName := uanDelUnnecessaryLinks; //added by adenry
    UndoAction2^.BufferSize     := SizeOf(TFullTextChange);
    UndoAction2^.Buffer         := AllocMem(UndoAction2^.BufferSize);
    UndoAction2^.Node           := Node;
    UndoAction2^.LineNumber     := Node.Index;
    UndoAction2^.BindToNext     := True;
    PFullTextChange(UndoAction2^.Buffer)^.OriginalOnly := True;
    PFullTextChange(UndoAction2^.Buffer)^.OldText := Text2;

    MustAddUndo := False;

    tmpText1 := ReplaceString(RemoveSWTags(Text1,True,True,True,True), ' ', '');
    tmpText2 := ReplaceString(RemoveSWTags(Text2,True,True,True,True), ' ', '');
    if (Copy(tmpText1, Length(tmpText1)-1, 2) = '..') and
       ( (Copy(tmpText2, 1, 2) = '..') or (Copy(tmpText2, 1, 3) = '-..') or
        ((OrgCharset in DashCharsets1)and(Copy(tmpText2, 1, 3) = #150'..')) or
        ((OrgCharset in DashCharsets1)and(Copy(tmpText2, 1, 3) = #151'..')) or
        ((OrgCharset in DashCharsets2)and(Copy(tmpText2, 1, 3) = #173'..'))
       ) then
    begin
      //delete dots at the end of Text1
      DotPos := SmartPos('.', Text1, False, Length(Text1), False);
      while (Copy(Text1, DotPos, 1) = '.') or (Copy(Text1, DotPos, 1) = ' ') do
      begin
        Delete(Text1, DotPos, 1);
        Dec(DotPos);
      end;

      //delete dots at the beginning of Text2
      DotPos := Pos('.', Text2);
      while (Copy(Text2, DotPos, 1) = '.') or (Copy(Text2, DotPos, 1) = ' ') do
        Delete(Text2, DotPos, 1);

      SetText(Node.PrevSibling, Text1);
      SetText(Node, Text2);

      MustAddUndo := True;
    end;

    if mnuTranslatorMode.Checked then
    begin
      Text1 := GetSubTranslation(Node.PrevSibling);
      Text2 := GetSubTranslation(Node);

      tmpText1 := ReplaceString(RemoveSWTags(Text1,True,True,True,True), ' ', '');
      tmpText2 := ReplaceString(RemoveSWTags(Text2,True,True,True,True), ' ', '');
      if (Copy(tmpText1, Length(tmpText1)-1, 2) = '..') and
         ( (Copy(tmpText2, 1, 2) = '..') or (Copy(tmpText2, 1, 3) = '-..') or
          ((OrgCharset in DashCharsets1)and(Copy(tmpText2, 1, 3) = #150'..')) or
          ((OrgCharset in DashCharsets1)and(Copy(tmpText2, 1, 3) = #151'..')) or
          ((OrgCharset in DashCharsets2)and(Copy(tmpText2, 1, 3) = #173'..'))
         ) then
      begin
        PFullTextChange(UndoAction1^.Buffer)^.OriginalOnly := False;
        PFullTextChange(UndoAction1^.Buffer)^.OldTrans     := Text1;
        PFullTextChange(UndoAction2^.Buffer)^.OriginalOnly := False;
        PFullTextChange(UndoAction2^.Buffer)^.OldTrans     := Text2;

        //delete dots at the end of Text1
        DotPos := SmartPos('.', Text1, False, Length(Text1), False);
        while (Copy(Text1, DotPos, 1) = '.') or (Copy(Text1, DotPos, 1) = ' ') do
        begin
          Delete(Text1, DotPos, 1);
          Dec(DotPos);
        end;

        //delete dots at the beginning of Text2
        DotPos := Pos('.', Text2);
        while (Copy(Text2, DotPos, 1) = '.') or (Copy(Text2, DotPos, 1) = ' ') do
          Delete(Text2, DotPos, 1);

        MustAddUndo := True;

        SetTranslation(Node.PrevSibling, Text1);
        SetTranslation(Node, Text2);
      end;
    end;

    if MustAddUndo then
    begin
      AddUndo(UndoAction1);
      AddUndo(UndoAction2);
    end;

    Node := Node.NextSibling;
  end;

  if UndoList.Count > 0 then
    PUndoAction(UndoList.Last)^.BindToNext := False;
  //lstSubtitles.Refresh; //AutoRecheck***Errors refreshes it
  RefreshTimes;
  AutoRecheckAllErrors(TextErrors); //added by adenry
end;
//added by adenry: end

//removed by adenry: begin
{var
  Node       : PVirtualNode;
  Text1      : String;
  Text2      : String;
  // Tags in first & second text
  Bold1      : Boolean;
  Italic1    : Boolean;
  Underline1 : Boolean;
  Color1     : Integer;
  // --
  Bold2       : Boolean;
  Italic2     : Boolean;
  Underline2  : Boolean;
  Color2      : Integer;
  UndoAction1 : PUndoAction;
  UndoAction2 : PUndoAction;
begin
  Node := lstSubtitles.GetFirst.NextSibling;
  while Assigned(Node) do
  begin
    Text1 := GetSubText(Node.PrevSibling);
    Text2 := GetSubText(Node);

    New(UndoAction1);
    UndoAction1^.UndoActionType := uaFullTextChange;
    UndoAction1^.BufferSize     := SizeOf(TFullTextChange);
    UndoAction1^.Buffer         := AllocMem(UndoAction1^.BufferSize);
    UndoAction1^.Node           := Node.PrevSibling;
    UndoAction1^.LineNumber     := Node.PrevSibling.Index;
    UndoAction1^.BindToNext     := True;
    PFullTextChange(UndoAction1^.Buffer)^.OriginalOnly := True;
    PFullTextChange(UndoAction1^.Buffer)^.OldText := Text1;

    New(UndoAction2);
    UndoAction2^.UndoActionType := uaFullTextChange;
    UndoAction2^.BufferSize     := SizeOf(TFullTextChange);
    UndoAction2^.Buffer         := AllocMem(UndoAction2^.BufferSize);
    UndoAction2^.Node           := Node;
    UndoAction2^.LineNumber     := Node.Index;
    UndoAction2^.BindToNext     := True;
    PFullTextChange(UndoAction2^.Buffer)^.OriginalOnly := True;
    PFullTextChange(UndoAction2^.Buffer)^.OldText := Text2;

    Bold1      := Pos('<b>', Text1) > 0;
    Italic1    := Pos('<i>', Text1) > 0;
    Underline1 := Pos('<u>', Text1) > 0;
    Color1     := GetSubColor(Text1);
    Text1      := RemoveSWTags(Text1, True, True, True, True);

    Bold2      := Pos('<b>', Text2) > 0;
    Italic2    := Pos('<i>', Text2) > 0;
    Underline2 := Pos('<u>', Text2) > 0;
    Color2     := GetSubColor(Text2);
    Text2      := RemoveSWTags(Text2, True, True, True, True);

    if (Copy(Text1, Length(Text1)-2, 3) = '...') and
       (
       (Pos('...', Text2) = 1) or
       (Pos('-...', Text2) = 1) or
       (Pos('- ...', Text2) = 1)
       ) then
    begin
      Text1 := Copy(Text1, 1, Length(Text1)-3);
      if (Pos('...', Text2) = 1) then
        Text2 := Trim(Copy(Text2, 4, Length(Text2))) else
      if (Pos('-...', Text2) = 1) then
        Text2 := Trim(Copy(Text2, 5, Length(Text2))) else
      if (Pos('- ...', Text2) = 1) then
        Text2 := Trim(Copy(Text2, 6, Length(Text2)));

      if SubtitleAPI.NoInteractionWithTags = False then
      begin
        // Restore tags
        if Underline1 = True then Text1 := '<u>' + Text1;
        if Bold1      = True then Text1 := '<b>' + Text1;
        if Italic1    = True then Text1 := '<i>' + Text1;
        if Color1 > -1 then
          Text1 := SetColorTag(Text1, Color);

        // Restore tags
        if Underline2 = True then Text2 := '<u>' + Text2;
        if Bold2      = True then Text2 := '<b>' + Text2;
        if Italic2    = True then Text2 := '<i>' + Text2;
        if Color2 > -1 then
          Text2 := SetColorTag(Text2, Color);
      end;

      if mnuTranslatorMode.Checked = False then
      begin
        AddUndo(UndoAction1);
        AddUndo(UndoAction2);
      end;
      SetText(Node.PrevSibling, Text1);
      SetText(Node, Text2);
    end;
    if mnuTranslatorMode.Checked then
    begin
      Text1 := GetSubTranslation(Node.PrevSibling);
      Text2 := GetSubTranslation(Node);

      PFullTextChange(UndoAction1^.Buffer)^.OriginalOnly := False;
      PFullTextChange(UndoAction1^.Buffer)^.OldTrans     := Text1;
      PFullTextChange(UndoAction2^.Buffer)^.OriginalOnly := False;
      PFullTextChange(UndoAction2^.Buffer)^.OldTrans     := Text2;

      Bold1      := Pos('<b>', Text1) > 0;
      Italic1    := Pos('<i>', Text1) > 0;
      Underline1 := Pos('<u>', Text1) > 0;
      Color1     := GetSubColor(Text1);
      Text1      := RemoveSWTags(Text1, True, True, True, True);

      Bold2      := Pos('<b>', Text2) > 0;
      Italic2    := Pos('<i>', Text2) > 0;
      Underline2 := Pos('<u>', Text2) > 0;
      Color2     := GetSubColor(Text2);
      Text2      := RemoveSWTags(Text2, True, True, True, True);

      if (Copy(Text1, Length(Text1)-2, 3) = '...') and
         (
         (Pos('...', Text2) = 1) or
         (Pos('-...', Text2) = 1) or
         (Pos('- ...', Text2) = 1)
         ) then
      begin
        Text1 := Copy(Text1, 1, Length(Text1)-3);
        if (Pos('...', Text2) = 1) then
          Text2 := Trim(Copy(Text2, 4, Length(Text2))) else
        if (Pos('-...', Text2) = 1) then
          Text2 := Trim(Copy(Text2, 5, Length(Text2))) else
        if (Pos('- ...', Text2) = 1) then
          Text2 := Trim(Copy(Text2, 6, Length(Text2)));

        if SubtitleAPI.NoInteractionWithTags = False then
        begin
          // Restore tags
          if Underline1 = True then Text1 := '<u>' + Text1;
          if Bold1      = True then Text1 := '<b>' + Text1;
          if Italic1    = True then Text1 := '<i>' + Text1;
          if Color1 > -1 then
            Text1 := SetColorTag(Text1, Color);

          // Restore tags
          if Underline2 = True then Text2 := '<u>' + Text2;
          if Bold2      = True then Text2 := '<b>' + Text2;
          if Italic2    = True then Text2 := '<i>' + Text2;
          if Color2 > -1 then
            Text2 := SetColorTag(Text2, Color);
        end;

        AddUndo(UndoAction1);
        AddUndo(UndoAction2);

        SetTranslation(Node.PrevSibling, Text1);
        SetTranslation(Node, Text2);
      end;
    end;
    Node := Node.NextSibling;
  end;

  if UndoList.Count > 0 then
    PUndoAction(UndoList.Last)^.BindToNext := False;

  //lstSubtitles.Refresh; //AutoRecheck***Errors refreshes it
  RefreshTimes;
  AutoRecheckAllErrors(TextErrors); //added by adenry
end;}
//removed by adenry: end

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuCheckForNewVersionClick(Sender: TObject);
  function GetTempDir: String;
  var
    Temp: array[0..MAX_PATH] of Char;
  begin
    GetTempPath(MAX_PATH,Temp);
    Result := String(Temp);
  end;

  function DownloadFile(Source, Dest: String): Boolean;
  begin
    try
      Result := UrlDownloadToFile(nil, PChar(Source), PChar(Dest), 0, nil) = 0;
    except
      Result := False;
    end;
  end;
var
  Dir      : String;
  URL      : String;
  Language : String;
  Ini      : TIniFile;
  NewVer   : String; //by BDZL
  NewBuild : String; //added by adenry
begin
  Language := ExtractFileName(frmMain.ActualLangFile);
  Language := Copy(Language, 1, LastDelimiter('.', Language)-1);
  Dir      := GetTempDir + Copy(ID_UPDATEINI, LastDelimiter('/', ID_UPDATEINI)+1, Length(ID_UPDATEINI));
    
  if DownloadFile(ID_UPDATEINI, Dir) Then
  begin
    Ini := TIniFile.Create(Dir);
    try
      NewVer   := Ini.ReadString('Update', 'CurrVer', ID_VERSION); //by BDZL
      NewBuild := Ini.ReadString('Update', 'CurrBuild', ID_BUILD); //added by adenry
      //if NewVer <> ID_FULLVERSION Then               //removed by adenry
      if StrToInt(NewBuild) > StrToInt(ID_BUILD) then  //added by adenry
      begin // New version!
        if MsgBox(Format(QuestionMsg[08], [NewVer+' (build '+NewBuild+')']), BTN_YES, BTN_NO, '', MB_ICONQUESTION, frmMain) = 1 Then //modified by adenry
        begin
          if Ini.ValueExists('Update', Language) then
            URL := Ini.ReadString('Update', Language, ID_WEBPAGE) else
            URL := Ini.ReadString('Update', 'English', ID_WEBPAGE);
          ShellExecute(GetDesktopWindow, 'open', PChar(URL), nil, nil, SW_SHOWNORMAL);
        end;
      end else // No new version available...
        MsgBox(InfoMsg[02], BTN_OK, '', '', MB_ICONINFORMATION, frmMain);
    finally
      Ini.Free;
      DeleteFile(Dir + ExtractFileName(ID_UPDATEINI));
    end;
  end else // Error!
    MsgBox(ErrorMsg[11], BTN_OK, '', '', MB_ICONERROR, frmMain);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.sbSeekBarMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if (Player.Initialized) and (mnuVideoPreviewMode.Checked) and (Button = mbLeft) then
    tmrVideo.Enabled := False;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.sbSeekBarMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if (Player.Initialized) and (mnuVideoPreviewMode.Checked) and (Button = mbLeft) then
  begin
    SetVideoPos(sbSeekBar.Position);
    if Playing = True then
      tmrVideo.Enabled := True;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.sbSeekBarMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var
  i: Integer;
begin
  if ssLeft in Shift then
    SetTimeCounter(sbSeekBar.Position);

  //added by adenry: Video thumbnail preview:
  {i := Round(X /(sbSeekBar.Width / 100));
  if (i < 1) then i := 1;
  if (i > 100) then i := 100;
  imgVideoPreview.Picture.Assign(PreviewThumbs[i]);}

  //added by adenry: Enter Time counter preview mode:
  i := ((X - (sbSeekBar.Normal.Width div 2)) * sbSeekBar.Max) div (sbSeekBar.Width-(sbSeekBar.Normal.Width));
  if (i < 0) then i := 0;
  if (i > sbSeekBar.Max) then i := sbSeekBar.Max;
  if FormatType = ftTime then
    tcTimeCounter.Text2 := TimeToString(i) else
    tcTimeCounter.Text2 := IntToStr(TimeToFrames(i, MovieFPS));
  tcTimeCOunter.Text2Color := $005B5B5B;
  //Enter Video preview mode when video is paused:
  if btnPlay.Visible then
    SetVideoPos(i, False);

  tmrSeekbarMouseOver.Enabled := True;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.btnAlterPlaybackRateClick(Sender: TObject);
begin
  if Player.Initialized then
  begin
    if GetPlaybackRate = 1 then
    begin
      mnu100P.Checked := False;
      //SetPlaybackRate(DefAltPlayRate / 10); //bug fix - we set playback rate below:
      case DefAltPlayRate of
        1:  begin mnu10P.Checked := True; SetPlaybackRate(0.1); end;
        2:  begin mnu20P.Checked := True; SetPlaybackRate(0.2); end;
        3:  begin mnu30P.Checked := True; SetPlaybackRate(0.3); end;
        4:  begin mnu40P.Checked := True; SetPlaybackRate(0.4); end;
        5:  begin mnu50P.Checked := True; SetPlaybackRate(0.5); end;
        6:  begin mnu60P.Checked := True; SetPlaybackRate(0.6); end;
        7:  begin mnu70P.Checked := True; SetPlaybackRate(0.7); end;
        8:  begin mnu80P.Checked := True; SetPlaybackRate(0.8); end;
        9:  begin mnu90P.Checked := True; SetPlaybackRate(0.9); end;
        10: begin mnu150P.Checked := True; SetPlaybackRate(1.5); end;
        11: begin mnu200P.Checked := True; SetPlaybackRate(2); end;
        12: begin mnu300P.Checked := True; SetPlaybackRate(3); end;
        13: begin mnu400P.Checked := True; SetPlaybackRate(4); end else
            begin mnu100P.Checked := True; SetPlaybackRate(1); end;
      end;
    end else
    begin
      SetPlaybackRate(1);
      mnu100P.Checked := True;
    end;
  end;   
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuRewindClick(Sender: TObject);
begin
  SetVideoPos(GetCurrentPos - RewFFTime);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuForwardClick(Sender: TObject);
begin
  SetVideoPos(GetCurrentPos + RewFFTime);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.btnScrollListClick(Sender: TObject);
begin
  ScrollList := not ScrollList;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuSpellCheckClick(Sender: TObject);
begin
  SpellCheck;
end;

procedure TfrmMain.SpellCheck(Language: Integer = 0); //Language added by adenry
var
  Node          : PVirtualNode;
  StringToCheck : TStringList;
  TextStrList   : TStringList;
  i, c          : Integer;
  Text          : String;
  UndoAction    : PUndoAction;
begin
  Screen.Cursor := crHourglass; //added by adenry
  try
    USSpellCheck.Connect;
    USSpellCheck.CheckGrammarWithSpelling := False;
    USSpellCheck.Language := Language; //added by adenry //TODO: Instead of this, get a list of all installed spellcheck languages and offer the user to choose from them...
  finally
    Screen.Cursor := crDefault; //added by adenry
  end;
  try
    if USSpellCheck.Connected = True then
    begin
      StringToCheck := TStringList.Create;
      try
        Node := lstSubtitles.GetFirst;
        while Assigned(Node) do
        begin
          StringToCheck.Add(GetSubText(Node));
          StringToCheck.Add('');
          Node := Node.NextSibling;
        end;
        // Check spelling of the big string
        USSpellCheck.CheckSpelling(StringToCheck.Text);
        if Trim(USSpellCheck.ChangedText) <> '' then
        begin
          StringToCheck.Text := Trim(USSpellCheck.ChangedText);
          TextStrList := TStringList.Create;
          try
            for i := 0 to StringToCheck.Count-1 do
            begin
              if (StringToCheck[i] <> '') then
              begin
                Text := StringToCheck[i];
                if (i = 0) or ((i > 0) and (StringToCheck[i-1] = '')) then // Avoid lots of problems with subtitles that are more than one line
                begin
                  c := 1;
                  while (i+c < StringToCheck.Count) and (StringToCheck[i+c] <> '') do
                  begin
                    if (StringToCheck[i+c] <> '') then
                    begin
                      if Text <> '' then
                        Text := Text + #13#10 + StringToCheck[i+c] else
                        Text := StringToCheck[i+c];
                      Inc(c);
                    end else
                      break;
                  end;
                  if (Text <> '') then
                    TextStrList.Add(Text);
                end;
              end;
            end;

            // Update every node
            Node := lstSubtitles.GetFirst;
            while Assigned(Node) do
            begin
              if TextStrList[Node.Index] <> GetSubText(Node) then
              begin
                New(UndoAction);
                UndoAction^.UndoActionType := uaFullTextChange;
                UndoAction^.UndoActionName := uanSpellCheck; //added by adenry
                UndoAction^.BufferSize     := SizeOf(TFullTextChange);
                UndoAction^.Buffer         := AllocMem(UndoAction^.BufferSize);
                UndoAction^.BindToNext     := True;
                PFullTextChange(UndoAction^.Buffer).OriginalOnly := True;
                UndoAction^.Node       := Node;
                UndoAction^.LineNumber := Node.Index;
                PFullTextChange(UndoAction^.Buffer)^.OldText := GetSubText(Node);
                SetText(Node, TextStrList[Node.Index]);
                AddUndo(UndoAction);
              end;
              Node := Node.NextSibling;
            end;
            //lstSubtitles.Refresh; //AutoRecheck***Errors refreshes it
            RefreshTimes;
          finally
            TextStrList.Free;
          end;
        end;
      finally
        AutoRecheckAllErrors(TextErrors); //added by adenry
        MsgBox(Format(InfoMsg[03], [USSpellCheck.NumChanges]), BTN_OK, '', '', MB_ICONINFORMATION, frmMain);
        StringToCheck.Free;
      end;
    end else
      MsgBox(ErrorMsg[13], BTN_OK, '', '', MB_ICONERROR, frmMain);
  finally
    if UndoList.Count > 0 then
      PUndoAction(UndoList.Last)^.BindToNext := False;
    Screen.Cursor := crHourglass; //added by adenry
    try
      USSpellCheck.Disconnect;
    finally
      Screen.Cursor := crDefault; //added by adenry
    end;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuHelpOfProgramClick(Sender: TObject);
var
  ManualFile: String;
begin
  ManualFile := ExtractFilePath(Application.ExeName) + 'Help\' + HelpFile;
  if FileExists(ManualFile) then
    ShellExecute(Handle, 'open', PChar(ManualFile), nil, nil, SW_MAXIMIZE) else
    ShellExecute(Handle, 'open', PChar(ExtractFilePath(Application.ExeName) + 'Help\Manual.html'), nil, nil, SW_MAXIMIZE);
end;

// -----------------------------------------------------------------------------

//added by adenry: begin
//Mark node - code was in mnuMarkSelectedSubsClick before
procedure TfrmMain.MarkNode(Node: PVirtualNode; BindUndoToNext: Boolean = False);
var
  Data       : PSubtitleItem;
  UndoAction : PUndoAction;
begin
  Data := lstSubtitles.GetNodeData(Node);
  if Data.Marked <> True then
  begin
    Data.Marked := True;
    New(UndoAction);
    UndoAction^.UndoActionType := uaMarkSubtitle;
    UndoAction^.UndoActionName := uanMark; //added by adenry
    UndoAction^.Node           := Node;
    UndoAction^.LineNumber     := Node.Index;
    UndoAction^.BufferSize     := 0;
    UndoAction^.Buffer         := nil;
    UndoAction^.BindToNext     := BindUndoToNext;
    AddUndo(UndoAction);
  end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuMarkSelectedSubsClick(Sender: TObject);
var
  Node : PVirtualNode;
begin
  Node := lstSubtitles.GetFirstSelected;
  while Assigned(Node) do
  begin
    MarkNode(Node, Assigned(lstSubtitles.GetNextSelected(Node)));
    AutoRecheckNodeErrors(Node, [], rtNormal, True);//refresh info&errors form only //added by adenry
    Node := lstSubtitles.GetNextSelected(Node);
  end;
  MarkingModified := True; //added by adenry
  lstSubtitles.Refresh;
end;

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.UnmarkNode(Node: PVirtualNode; BindUndoToNext: Boolean = False);
var
  Data       : PSubtitleItem;
  UndoAction : PUndoAction;
begin
  Data        := lstSubtitles.GetNodeData(Node);
  if Data.Marked <> False then
  begin
    Data.Marked := False;
    New(UndoAction);
    UndoAction^.UndoActionType := uaMarkSubtitle;
    UndoAction^.UndoActionName := uanUnmark; //added by adenry
    UndoAction^.Node           := Node;
    UndoAction^.LineNumber     := Node.Index;
    UndoAction^.BufferSize     := 0;
    UndoAction^.Buffer         := nil;
    UndoAction^.BindToNext     := BindUndoToNext;
    AddUndo(UndoAction);
  end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuUnMarkSelectedSubsClick(Sender: TObject);
var
  Node : PVirtualNode;
begin
  Node := lstSubtitles.GetFirstSelected;
  while Assigned(Node) do
  begin
    UnmarkNode(Node, Assigned(lstSubtitles.GetNextSelected(Node)));
    AutoRecheckNodeErrors(Node, [], rtNormal, True);//refresh info&errors form only //added by adenry
    Node := lstSubtitles.GetNextSelected(Node);
  end;
  MarkingModified := True; //added by adenry
  lstSubtitles.Refresh;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.btnPrevSubClick(Sender: TObject);
var
  Node     : PVirtualNode;
  CurrTime : Integer;
begin
  CurrTime := GetCurrentPos;
  Node := lstSubtitles.GetFirst;
  while Assigned(Node) do
  begin
    if GetStartTime(Node) > CurrTime then
    begin
      if Node <> lstSubtitles.GetFirst then
        SetVideoPos(GetStartTime(Node.PrevSibling.PrevSibling));
      exit;
    end;
    if Node = lstSubtitles.GetLast then
    begin
      if (CurrTime >= GetStartTime(Node)) and (CurrTime <= GetFinalTime(Node)) then
        SetVideoPos(GetStartTime(Node.PrevSibling)) else
        SetVideoPos(GetStartTime(Node));        
    end;
    Node := Node.NextSibling;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.btnNextSubClick(Sender: TObject);
var
  Node     : PVirtualNode;
  CurrTime : Integer;
begin
  CurrTime := GetCurrentPos;
  Node := lstSubtitles.GetFirst;
  while Assigned(Node) do
  begin
    if GetStartTime(Node) > CurrTime then
    begin
      SetVideoPos(GetStartTime(Node));
      exit;
    end;
    Node := Node.NextSibling;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuShowLeftPanelClick(Sender: TObject);
begin
  SetTranslationCtrlsPositions;
  UpdateVideoPos;
  CallLstSubtitlesColumnResize; //added by adenry

  //added by adenry
  if {(WindowState = wsMaximized) and} SmartResize then
    FormResize(frmMain);

  frmMain.Refresh;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuShowTimeControlsClick(Sender: TObject);
begin
  //removed by adenry: simply unnecessary now:
  {if mnuShowTimeControls.Checked then
  begin
    lblShow.Show;
    tmeShow.Show;
    lblHide.Show;
    tmeHide.Show;
    lblDuration.Show;
    tmeDuration.Show;
    lblPause.Show;
    tmePause.Show;
  end else
  begin
    lblShow.Hide;
    tmeShow.Hide;
    lblHide.Hide;
    tmeHide.Hide;
    lblDuration.Hide;
    tmeDuration.Hide;
    lblPause.Hide;
    tmePause.Hide;
  end;}
  SetTranslationCtrlsPositions;
  UpdateStatusbarWidths; //added by adenry
  frmMain.Refresh;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuUseInPlaceEditionClick(Sender: TObject);
begin
  if mnuUseInPlaceEdition.Checked = False then
    lstSubtitles.TreeOptions.MiscOptions := lstSubtitles.TreeOptions.MiscOptions - [toEditable] else
    lstSubtitles.TreeOptions.MiscOptions := lstSubtitles.TreeOptions.MiscOptions + [toEditable];    
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuTypeEffectClick(Sender: TObject);
begin
  TextEffect(EffectType, 0, 0);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuFastFlashClick(Sender: TObject);
begin
  TextEffect(EffectFlash, 250, 100);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuMediumFlashClick(Sender: TObject);
begin
  TextEffect(EffectFlash, 500, 500);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuSlowFlashClick(Sender: TObject);
begin
  TextEffect(EffectFlash, 1000, 1000);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuShiftPlusMSClick(Sender: TObject);
var
  Node       : PVirtualNode;
  UndoAction : PUndoAction;
  StartTime  : Integer;
  FinalTime  : Integer;
begin
  Node := lstSubtitles.GetFirstSelected;
  while Assigned(Node) do
  begin
    New(UndoAction);
    UndoAction^.UndoActionType := uaTimeChange;
    UndoAction^.UndoActionName := uanShiftPlus; //added by adenry
    UndoAction^.BufferSize     := SizeOf(TTimeChange);
    UndoAction^.Buffer         := AllocMem(UndoAction^.BufferSize);
    UndoAction^.Node           := Node;
    UndoAction^.LineNumber     := Node.Index;

    StartTime := GetStartTime(Node);
    FinalTime := GetFinalTime(Node);
    PTimeChange(UndoAction^.Buffer)^.StartTime := StartTime;
    PTimeChange(UndoAction^.Buffer)^.FinalTime := FinalTime;
    SetStartTime(Node, StartTime + ShiftTime);
    SetFinalTime(Node, FinalTime + ShiftTime);

    if not lstSubtitles.Selected[Node.PrevSibling] then //added by adenry later
      AutoRecheckNodeErrors(Node, PauseErrors); //added by adenry
    if not lstSubtitles.Selected[Node.NextSibling] then //added by adenry later
      AutoRecheckNodeErrors(Node.NextSibling, PauseErrors); //added by adenry
    Node := lstSubtitles.GetNextSelected(Node);
    UndoAction^.BindToNext := True;//Assigned(Node); //modified by adenry later
    AddUndo(UndoAction);
  end;

  if UndoList.Count > 0 then //added by adenry later
    PUndoAction(UndoList.Last)^.BindToNext := False; //added by adenry later
  lstSubtitles.Refresh;
  RefreshTimes;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuShiftLessMSClick(Sender: TObject);
var
  Node       : PVirtualNode;
  UndoAction : PUndoAction;
  StartTime  : Integer;
  FinalTime  : Integer;
begin
  Node := lstSubtitles.GetFirstSelected;
  while Assigned(Node) do
  begin
    StartTime := GetStartTime(Node);
    FinalTime := GetFinalTime(Node);

    if (StartTime - ShiftTime) >= 0 then
    begin
      New(UndoAction);
      UndoAction^.UndoActionType := uaTimeChange;
      UndoAction^.UndoActionName := uanShiftMinus; //added by adenry
      UndoAction^.BufferSize     := SizeOf(TTimeChange);
      UndoAction^.Buffer         := AllocMem(UndoAction^.BufferSize);
      UndoAction^.Node           := Node;
      UndoAction^.LineNumber     := Node.Index;
      UndoAction^.BindToNext     := True; //added by adenry
      AddUndo(UndoAction); //added by adenry

      PTimeChange(UndoAction^.Buffer)^.StartTime := StartTime;
      PTimeChange(UndoAction^.Buffer)^.FinalTime := FinalTime;

      SetStartTime(Node, StartTime - ShiftTime);
      SetFinalTime(Node, FinalTime - ShiftTime);

      if not lstSubtitles.Selected[Node.PrevSibling] then //added by adenry later
        AutoRecheckNodeErrors(Node, PauseErrors); //added by adenry
      if not lstSubtitles.Selected[Node.NextSibling] then //added by adenry later
        AutoRecheckNodeErrors(Node.NextSibling, PauseErrors); //added by adenry
    end;

    Node := lstSubtitles.GetNextSelected(Node);
    //UndoAction^.BindToNext := Assigned(Node); //removed by adenry later
    //if (StartTime - ShiftTime) >= 0 then AddUndo(UndoAction); //removed by adenry later
  end;

  if UndoList.Count > 0 then //added by adenry later
    PUndoAction(UndoList.Last)^.BindToNext := False; //added by adenry later
  lstSubtitles.Refresh;
  RefreshTimes;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuMovieInfoClick(Sender: TObject);
const
  AviHeaderStart = 32; // Needed for positioning in the avi file
var
  f : File;
  // Temporary values
  AviHeaderSize  : Integer;
  TempFormatTest : array[0..2] of Char; // should be "AVI"
  TempVideoCodec : array[0..4] of Char;
  TempMicroSec   : Integer;
  VHeaderStart   : Integer;
  // -------------
  Size           : Double;
  LengthInFrames : Integer;
begin
  if (Player.Initialized) and (FileExists(MovieFile)) then
  begin
    Size := 0;
    FileMode := fmOpenRead;
    AssignFile(f, MovieFile);
    try
      {$I-}
      Reset(f, 1);
      {$I+}

      if IOResult = 0 then
      begin
        // Get file size...
        Size := FileSize(f) / 1024 / 1024;
        Seek(f, 8);
        BlockRead(f, TempFormatTest, SizeOf(TempFormatTest));
      
        if TempFormatTest = 'AVI' then
        begin
          Seek(f, AviHeaderStart);
          BlockRead(f, TempMicroSec, 4);

          // AVI header size (needed to locate audio part)
          Seek(f, 28);
          BlockRead(f, AviHeaderSize, 4);

          // Length of movie in frames
          Seek(f, AviHeaderStart + 16);
          BlockRead(f, LengthInFrames, 4);

          VHeaderStart := AviHeaderStart + AviHeaderSize + 20;

          // Video codec
          Seek(f, VHeaderStart + 4);
          BlockRead(f, TempVideoCodec, SizeOf(TempVideoCodec));

        end else
        begin
          LengthInFrames := TimeToFrames(VideoDuration, MovieFPS);
          TempVideoCodec := '-';
        end;
                   
      end;
    finally
      CloseFile(f);
    end;

    MsgBox(Format(InfoMsg[09],
                  [
                  MovieFile,                      // File name
                  FormatFloat('0.## MB', Size),   // File size
                  FormatFloat('#.###', MovieFPS), // FPS
                  TimeToString(VideoDuration),    // Duration
                  LengthInFrames,                 // Total frames
                  Player.VideoWidth,              // Resolution (width)
                  Player.VideoHeight,             // Resolution (height)
                  TempVideoCodec                  // FourCC
                  ]),
           BTN_OK,
           '',
           '',
           MB_ICONINFORMATION,
           frmMain);
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.lstSubtitlesCreateEditor(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex; out EditLink: IVTEditLink);
begin
  EditLink := TTreeEditLink.Create;
  //EditLink := TStringEditLink.Create;
  RefreshTimes; //added by adenry
  InterceptTabKey := True; //added by adenry
end;

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.lstSubtitlesEdited(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex);
begin
  InterceptTabKey := False;
end;

procedure TfrmMain.lstSubtitlesEditCancelled(Sender: TBaseVirtualTree; Column: TColumnIndex);
begin
  InterceptTabKey := False;
end;
//added by adenry: begin

// -----------------------------------------------------------------------------

procedure TfrmMain.lstSubtitlesEditing(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex; var Allowed: Boolean);
begin
  Allowed := (Column <> 0) and (toEditable in lstSubtitles.TreeOptions.MiscOptions);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuSaveASXClick(Sender: TObject);
var
  Dir : String;
  FN  : String;
  ASX : TStringList;
begin
  if (OrgFile <> '') and (MovieFile <> '') then
  begin
    if SelectDirectory(SelectOutputDir, '', Dir) then
    begin
      FN := Copy(ExtractFileName(OrgFile), 1, LastDelimiter('.', ExtractFileName(OrgFile))-1);

      UpdateArray(SubtitleAPI.GetFormatIndex('SAMI Captioning')); //format index added by adenry
      SaveFile(Dir + '\' + FN + '.smi', SubtitleAPI.GetFormatIndex('SAMI Captioning'), GetFPS);
      SubtitleAPI.ClearSubtitles;

      ASX := TStringList.Create;
      try
        ASX.Add('<ASX version ="3.0">');
        ASX.Add(Format('<Title>%s</Title>', [FN]));
        ASX.Add('  <Entry>');
        ASX.Add('    ' + Format('<Ref href="%s?sami=%s"/>', [MovieFile, Dir + '\' + FN + '.smi']));
        ASX.Add('  </Entry>');
        ASX.Add('</ASX>');

        ASX.SaveToFile(Dir + '\' + FN + '.asx');
      finally
        ASX.Free;
      end;
    end;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuSaveSMILClick(Sender: TObject);
var
  Dir  : String;
  FN   : String;
  SMIL : TStringList;
begin
  if (OrgFile <> '') and (MovieFile <> '') then
  begin
    if SelectDirectory(SelectOutputDir, '', Dir) then
    begin
      FN := Copy(ExtractFileName(OrgFile), 1, LastDelimiter('.', ExtractFileName(OrgFile))-1);

      UpdateArray(SubtitleAPI.GetFormatIndex('RealTime')); //format index added by adenry
      SaveFile(Dir + '\' + FN + '.rt', SubtitleAPI.GetFormatIndex('RealTime'), GetFPS);
      SubtitleAPI.ClearSubtitles;

      SMIL := TStringList.Create;
      try
        SMIL.Add('<smil>');
        SMIL.Add('  <head>');
        SMIL.Add('    <layout>');
        SMIL.Add('      <root-layout width="1080" height="350"/>');
        SMIL.Add('      <region id="video_left" width="480" height="304" left="0" top="0"/>');
        SMIL.Add('      <region id="video_center" width="480" height="304" left="480" top="0"/>');
        SMIL.Add('      <region id="video_right" width="480" height="304" left="960" top="0"/>');
        SMIL.Add('      <region id="text_subtitle" width="560" height="100" left="260" top="250"/>');
        SMIL.Add('    </layout>');
        SMIL.Add('  </head>');
        SMIL.Add('  <body>');
        SMIL.Add('    <par dur="7200">');
        SMIL.Add('      ' + Format('<video src="%s" begin="1s" clip-begin="0s" region="video_center"/>', [MovieFile]));
        SMIL.Add('      ' + Format('<textstream src="%s" region="text_subtitle"/>', [Dir + '\' + FN + '.rt']));
        SMIL.Add('    </par>');
        SMIL.Add('  </body>');
        SMIL.Add('</smil>');

        SMIL.SaveToFile(Dir + '\' + FN + '.smil');
      finally
        SMIL.Free;
      end;
    end;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuUndoClick(Sender: TObject);
begin
  if UndoList.Count > 0 then
  begin
    Screen.Cursor := crHourGlass; //added by adenry
    try
      UndoActionSet(UndoList, RedoList);
    finally
      Screen.Cursor := crDefault; //added by adenry
    end;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuRedoClick(Sender: TObject);
begin
  if RedoList.Count > 0 then
  begin
    Screen.Cursor := crHourGlass; //added by adenry
    try
      UndoActionSet(RedoList, UndoList);
    finally
      Screen.Cursor := crDefault; //added by adenry
    end;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuPascalScriptClick(Sender: TObject);
  procedure OutputMsg(s: String);
  var
    l          : LongInt;
    ErrorsText : String;
  begin
    ErrorsText := '';
    for l := 0 to psCompExec.CompilerMessageCount - 1 do
    begin
      ErrorsText := ErrorsText + #13#10 + psCompExec.CompilerErrorToStr(l);
    end;
    MsgBox(s + #13#10#13#10 + ErrorsText, BTN_OK, '', '', MB_ICONERROR, Self);
  end;
begin
  Screen.Cursor := crHourGlass; //added by adenry
  try
    frmMain.tmrPascalScriptRestoreCursor.Enabled := True; //added by adenry
    psCompExec.Script.LoadFromFile(ExtractFilePath(Application.ExeName) + 'PascalScripts\' + (Sender as TMenuItem).Caption + '.pas'); //StripHotKey added by adenry for toolbar button fix

    if psCompExec.Compile then
    begin
      if not psCompExec.Execute then
        OutputMsg(ErrorMsg[24]) else
      begin
        if AutoRecheckOnScripts = 1 then
          AutoRecheckAllErrors; //added by adenry
      end;
    end else
      OutputMsg(ErrorMsg[25]);

    RefreshTimes;
    lstSubtitles.Refresh;
  finally
    Screen.Cursor := crDefault; //added by adenry
  end;
end;

// -----------------------------------------------------------------------------
// PASCAL SCRIPT FUNCTIONS WERE HERE
// -----------------------------------------------------------------------------

procedure TfrmMain.psCompExecCompile(Sender: TIFPS3CompExec);
begin
  CompExecCompile(Sender);
end;

procedure TfrmMain.psCompExecExecute(Sender: TIFPS3CompExec);
begin
  psCompExec.SetVarToInstance('Application', Application);
  //psCompExec.SetVarToInstance('Self', Self);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.psCompExecCompImport(Sender: TObject;
  x: TIFPSPascalCompiler);
begin
  SIRegister_Std(x);
  SIRegister_Classes(x, true);
  SIRegister_Graphics(x);
  SIRegister_Controls(x);
  SIRegister_stdctrls(x);
  SIRegister_extctrls(x);
  SIRegister_Forms(x);
  SIRegister_menus(x);
  RegisterDateTimeLibrary_C(x);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.psCompExecExecImport(Sender: TObject; se: TIFPSExec;
  x: TIFPSRuntimeClassImporter);
begin
  RIRegister_Std(x);
  RIRegister_Classes(x, true);
  RIRegister_Graphics(x);
  RIRegister_Controls(x);
  RIRegister_stdctrls(x);
  RIRegister_extctrls(x);
  RIRegister_Forms(x);
  RIRegister_menus(x);
  RegisterDateTimeLibrary_R(se);
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.psCompExecAfterExecute(Sender: TIFPS3CompExec);
begin
  if UndoList.Count > 0 then
    PUndoAction(UndoList.Last)^.BindToNext := False;
end;

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.chkOCRScriptsClick(Sender: TObject);
begin
  AutoRecheckAllErrors([etOCRErrors]);
end;
//added by adenry: end

// -----------------------------------------------------------------------------

procedure TfrmMain.cmbOCRScriptsSelect(Sender: TObject);
begin
  OCRDefFile := ExtractFilePath(Application.ExeName) + 'OCRScripts\' + cmbOCRScripts.Items[cmbOCRScripts.ItemIndex] + ID_OCREXT;
  //added by adenry later:
  if ((ErrorsToCheck.eOCRErrors) or (ErrorsToFix.eOCRErrors)) and (FileExists(OCRDefFile)) then
  begin
    ParseOCRErrors(OCRDefFile);
    AutoRecheckAllErrors([etOCRErrors]);
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuShowInMainFormClick(Sender: TObject);
begin
  cmbOCRScripts.Visible := mnuShowInMainForm.Checked;
  //added by adenry: begin
  chkOCRScripts.Visible := mnuShowInMainForm.Checked;
  if cmbOCRScripts.Visible then
    lblNotes.Top := cmbOCRScripts.Top + cmbOCRScripts.Height + 11 else
    lblNotes.Top := cmbOCRScripts.Top;
  mmoNotes.Top := lblNotes.Top + lblNotes.Height + 3;
  mmoNotes.Height := pnlControl.ClientHeight - mmoNotes.Top;
  //added by adenry: end
  //OnResize(Sender); //removed by adenry
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.mnuShowSubtitlesClick(Sender: TObject);
begin
  subSubtitle.Visible := mnuShowSubtitles.Checked; //False replaced with mnuShowSubtitles.Checked by adenry - bug fix
end;

// -----------------------------------------------------------------------------

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // added by Bdzl
  if Assigned(UndoList) then
  begin
    ClearUndoList(UndoList);
    FreeAndNil(UndoList);
  end;
  if Assigned(RedoList) then
  begin
    ClearUndoList(RedoList);
    FreeAndNil(RedoList);
  end;
  // added by Bdzl

  if MovieFile <> '' then
    FreeFile;
end;
// -----------------------------------------------------------------------------

procedure TfrmMain.lstSubtitlesGetHint(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; var LineBreakStyle: TVTTooltipLineBreakStyle; var HintText: WideString);

//  procedure TfrmMain.lstSubtitlesGetHint(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: WideString);

  function CountUnTranslated: Integer;
  var
    Node  : PVirtualNode;
    Text  : String;
    Trans : String;
  begin
    Result := 0;
    Node := lstSubtitles.GetFirst;
    while Assigned(Node) do
    begin
      Text  := GetSubText(Node);
      Trans := GetSubTranslation(Node);
      if (Text = Trans) or (Trans = '') or (RemoveSWTags(Trans,True,True,True,True) = UntranslatedSub) then //RemoveSWTags added by adenry
        Inc(Result);
      Node := Node.NextSibling;
    end;
  end;

var
  Data: PSubtitleItem;
begin
  Data     := lstSubtitles.GetNodeData(Node);
  HintText := '';

  if Data.ErrorType = [] then
  begin
    if Data.Marked = True then
      HintText := ErrorReports[20] else
      HintText := '';
  end;

  if etLinesWithoutLetters  in Data.ErrorType then  HintText := HintText + #13#10 + ErrorReports[01];
  if etEmptySubtitle        in Data.ErrorType then  HintText := HintText + #13#10 + ErrorReports[02];
  // ---
  if etOverlapping          in Data.ErrorType then  HintText := HintText + #13#10 + ErrorReports[03];
  if etBadValues            in Data.ErrorType then  HintText := HintText + #13#10 + ErrorReports[04];
  if etTooLongDuration      in Data.ErrorType then  HintText := HintText + #13#10 + ErrorReports[05];
  if etTooShortDuration     in Data.ErrorType then  HintText := HintText + #13#10 + ErrorReports[06];
  if etTooLongLine          in Data.ErrorType then  HintText := HintText + #13#10 + ErrorReports[07];
  if etOverTwoLines         in Data.ErrorType then  HintText := HintText + #13#10 + ErrorReports[08];
  // ---
  if etHearingImpaired      in Data.ErrorType then  HintText := HintText + #13#10 + ErrorReports[09];
  if etTextBeforeColon      in Data.ErrorType then  HintText := HintText + #13#10 + ErrorReports[10];
  if etUnnecessaryDots      in Data.ErrorType then  HintText := HintText + #13#10 + ErrorReports[11];
  if etProhibitedCharacter  in Data.ErrorType then  HintText := HintText + #13#10 + ErrorReports[12];
  if etRepeatedCharacter    in Data.ErrorType then  HintText := HintText + #13#10 + ErrorReports[13];
  if etRepeatedSubtitle     in Data.ErrorType then  HintText := HintText + #13#10 + ErrorReports[14];
  if etOCRErrors            in Data.ErrorType then  HintText := HintText + #13#10 + ErrorReports[15];
  // ---
  if etOpnDlgSubsOneLine    in Data.ErrorType then  HintText := HintText + #13#10 + ErrorReports[16];
  if etSpaceAfterCustChars  in Data.ErrorType then  HintText := HintText + #13#10 + ErrorReports[17];
  if etSpaceBeforeCustChars in Data.ErrorType then  HintText := HintText + #13#10 + ErrorReports[18];
  if etUnnecessarySpaces    in Data.ErrorType then  HintText := HintText + #13#10 + ErrorReports[19];
  // ---
  if etUnnecessaryTags      in Data.ErrorType then  HintText := HintText + #13#10 + ErrorReports[21];//added by adenry
  if etDashOnFirstLine      in Data.ErrorType then  HintText := HintText + #13#10 + ErrorReports[22];//added by adenry
  if etTooMuchCPS           in Data.ErrorType then  HintText := HintText + #13#10 + ErrorReports[23];//added by adenry
  if etTooShortPause        in Data.ErrorType then  HintText := HintText + #13#10 + ErrorReports[24];//added by adenry
  if etDialogueOnOneLine    in Data.ErrorType then  HintText := HintText + #13#10 + ErrorReports[25];//added by adenry

  if (Data.ErrorType = []) and (Data.Marked = False) then
  begin
    if mnuTranslatorMode.Checked then
      HintText := Format(TransLeftLines, [CountUnTranslated]) else
      lstSubtitles.Hint := '';
  end;
  HintText := StringToWideStringEx(Trim(HintText), CharsetToCodePage(frmMain.Font.Charset));
end;

// -----------------------------------------------------------------------------

//added by adenry: begin
//mark too long lines in text and translation labels
procedure TfrmMain.MarkLongLinesInLabel(lbl: TLabel);
var
  LabelOriginalText     : String;
  num                   : String;
  LengthOfEachLineText  : String;
  i                     : Integer;
  mmo                   : TSWTextEdit; //added later //TMemo changed to TSWTextEdit
begin
  UpdateLinesCounter(lbl);

  if IndicTooLongLines then
  begin
    //delete all existing "red" labels
    for i := 1 to lbl.Tag do //the Tag property is used to count the number of red labels
      TLabel(FindComponent(lbl.Name+IntToStr(i))).Free;

    lbl.Tag := 0;
    if lbl.Name = lblText.Name then  //added later
      mmo := mmoSubtitleText else    //added later
      mmo := mmoTranslation;         //added later
    LengthOfEachLineText := GetLengthForEachLine(GetSWTextEditText(mmo)); //added later //mmo.Text

    if (Pos(LengthOfEachLineText, lbl.Caption) > 0) and (lbl.Visible) then
    begin
      LabelOriginalText := lbl.Caption; //to restore lbl.Caption later
      lbl.Caption := Copy(lbl.Caption, 1, Pos(LengthOfEachLineText, lbl.Caption)-1); //this will later be used to define the new red label .Left property
      LengthOfEachLineText := LengthOfEachLineText + '='; //to end the while loop when there is only one line
      while(True) do
      begin
        num := '';
        i := 1;
        while ((LengthOfEachLineText[i]<>'/') and (LengthOfEachLineText[i]<>'=')) do
        begin
          num := num + LengthOfEachLineText[i];
          i := i + 1;
        end;
        if(StrToInt(num)>=TooLongLine) then
        begin
          lbl.Tag := lbl.Tag + 1;
          lblCreator            := TLabel.Create(frmMain);
		      lblCreator.Name       := lbl.Name + IntToStr(lbl.Tag);
          lblCreator.Parent			:= pnlTextControls;
          lblCreator.ParentFont := False;
          lblCreator.Font.Size  := lbl.Font.Size;
          lblCreator.Font.Name  := lbl.Font.Name;
          lblCreator.AutoSize   := True;
          lblCreator.Font.Color := TooLongLinesColor;
          lblCreator.Color      := TooLongLinesBackground;
          lblCreator.Caption    := num;
          lblCreator.Left       := lbl.Left + lbl.Width;
          lblCreator.Top        := lbl.Top;
          lblCreator.Height     := lbl.Height;
          lblCreator.Visible    := True;
        end;
        if LengthOfEachLineText[i] = '=' then
          break;
        lbl.Caption := lbl.Caption + Copy(LengthOfEachLineText, 1, i);
        Delete(LengthOfEachLineText, 1, i); //delete the processed numbers plus the following '/'
      end;
      lbl.Caption := LabelOriginalText; //restore the label
    end;
  end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.lstSubtitlesColumnResize(Sender: TVTHeader; Column: TColumnIndex);
var
  w: Integer;
begin
  if SmartResize and CellResizeBegun then
  begin
    if WindowState <> wsMaximized then
    begin
      w :=
        (pnlParent2.Left - pnlControl.Left) * Integer(mnuShowLeftPanel.Checked) +
        lstSubtitles.Header.Columns[0].Width * Integer(mnuColNum.Checked) +
        lstSubtitles.Header.Columns[1].Width * Integer(mnuColShow.Checked) +
        lstSubtitles.Header.Columns[2].Width * Integer(mnuColHide.Checked) +
        lstSubtitles.Header.Columns[3].Width * Integer(mnuColText.Checked) +
        lstSubtitles.Header.Columns[4].Width * Integer(mnuColTranslation.Checked) +
        lstSubtitles.Header.Columns[5].Width * Integer(mnuColDuration.Checked) +
        lstSubtitles.Header.Columns[6].Width * Integer(mnuColPause.Checked) +
        GetSystemMetrics(SM_CXVSCROLL) +
        2 * ((2*Integer(lstSubtitles.BorderStyle))+lstSubtitles.BorderWidth) +
        2 * pnlControl.Left;

        ClientWidth := w;
    end else
    begin
        w :=
          lstSubtitles.Width -
          lstSubtitles.Header.Columns[0].Width * Integer(mnuColNum.Checked) -
          lstSubtitles.Header.Columns[1].Width * Integer(mnuColShow.Checked) -
          lstSubtitles.Header.Columns[2].Width * Integer(mnuColHide.Checked) -
          lstSubtitles.Header.Columns[5].Width * Integer(mnuColDuration.Checked) -
          lstSubtitles.Header.Columns[6].Width * Integer(mnuColPause.Checked) -
          GetSystemMetrics(SM_CXVSCROLL) -
          2 * ((2*Integer(lstSubtitles.BorderStyle))+lstSubtitles.BorderWidth);
        if mnuTranslatorMode.Checked then
        begin
          if Column = 3 then
            lstSubtitles.Header.Columns[4].Width := w - lstSubtitles.Header.Columns[3].Width else
          if Column = 4 then
            lstSubtitles.Header.Columns[3].Width := w - lstSubtitles.Header.Columns[4].Width else
          begin
            lstSubtitles.Header.Columns[3].Width := w div 2;
            lstSubtitles.Header.Columns[4].Width := w - (w div 2);
          end;
        end else
        if Column <> 3 then
          lstSubtitles.Header.Columns[3].Width := w;

    end;
    UpdateStatusbarWidths; //added later
  end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.lstSubtitlesAfterColumnWidthTracking(Sender: TVTHeader; Column: TColumnIndex);
var
  Ini: TIniFile;
begin
  if SmartResize then
  begin
    Ini := TIniFile.Create(IniRoot);
    try
      if Ini.ReadBool('List look', 'Show horizontal scrollbar', True) = False then
        lstSubtitles.ScrollBarOptions.ScrollBars := ssVertical else
        lstSubtitles.ScrollBarOptions.ScrollBars := ssBoth;
    finally
      Ini.Free;
    end;
  end;
  CellResizeBegun := False;
  if mnuTranslatorMode.Checked then
    TextTransColsRatio := lstSubtitles.Header.Columns[3].Width / (lstSubtitles.Header.Columns[3].Width + lstSubtitles.Header.Columns[4].Width);
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.lstSubtitlesBeforeColumnWidthTracking(Sender: TVTHeader; Column: TColumnIndex; Shift: TShiftState);
begin
  if SmartResize then
  begin
    lstSubtitles.ScrollBarOptions.ScrollBars := ssVertical;
    CallLstSubtitlesColumnResize; //resize the moment the column separator is clicked
    CellResizeBegun := True;
  end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.lstSubtitlesBeforeCellPaint(Sender: TBaseVirtualTree;
  TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex;
  CellPaintMode: TVTCellPaintMode; CellRect: TRect;
  var ContentRect: TRect);
var
  Data: PSubtitleItem;
  selColor: TColor;
  i: Integer;
begin
  //selection is not painted (toAlwaysHideSelection is True) so selection is painted manually here
  if lstSubtitles.Focused then
    selColor := lstSubtitles.Colors.FocusedSelectionColor else
    selColor := lstSubtitles.Colors.UnfocusedSelectionColor;
  if vsSelected in Node.States then
    PaintCellBackground(TargetCanvas,CellRect,MixColors(selColor,lstSubtitles.Color,130-SelTransp)) else
    PaintCellBackground(TargetCanvas,CellRect,lstSubtitles.Color);

  Data := Sender.GetNodeData(Node);
  //marked subtitles low priority marking (not error marking!)
  if not MarkingHighPriority then
    if Data.Marked and MarkingWithBckgr then
      if ((Column=0) and MarkingColNum) or ((Column=1) and MarkingColShow) or ((Column=2) and MarkingColHide) or ((Column=3) and MarkingColText) or ((Column=6) and MarkingColPause) or ((Column=5) and MarkingColDur) then
        if vsSelected in Node.States then
          PaintCellBackground(TargetCanvas,CellRect,MixColors(MarkingBckgr,lstSubtitles.Color,100-SelTransp)) else
          PaintCellBackground(TargetCanvas,CellRect,MarkingBckgr);

  //ERROR MARKING
  if (Data.ErrorType <> []) and (Column in [0,1,2,3,5,6]) {and (not UseOriginalBackground)} then
  begin
    //OLD error marking
    {if (Column <> 0) and MarkErrorsInList and (not MarkDisableStandard or not AdvancedErrorMarking) then
    begin
      PaintCellBackground(TargetCanvas,CellRect,MarkWithBackground);
      if vsSelected in Node.States then
        PaintCellBackground(TargetCanvas,CellRect,MixColors(selColor,MarkWithBackground,100-SelTransp));
    end;}
    //ADVANCED ERROR MARKING (mark different errors with different background):
    if AdvancedErrorMarking {and MarkErrorsInList} then
    begin
      //default error marking first (if enabled)
      if (mfEnabled in MarkFlags[0]) then
        for i := 1 to Integer(High(TErrorType))+1 do //for each type of error
          if (TErrorType(i-1) in Data.ErrorType) and (mfEnabled in MarkFlags[i]) then
          begin
            //if no marking column is set for current error type
            if not((mfColNum in MarkFlags[i])or(mfColShow in MarkFlags[i])or(mfColHide in MarkFlags[i])or(mfColText in MarkFlags[i])or(mfColPause in MarkFlags[i])or(mfColDur in MarkFlags[i])) then
              if ((Column=0) and (mfColNum in MarkFlags[0])) or ((Column=1) and (mfColShow in MarkFlags[0])) or ((Column=2) and (mfColHide in MarkFlags[0])) or ((Column=3) and (mfColText in MarkFlags[0])) or ((Column=6) and (mfColPause in MarkFlags[0])) or ((Column=5) and (mfColDur in MarkFlags[0])) then
              begin
                if (MarkBackgrounds[0] <> lstSubtitles.Color) then
                  if vsSelected in Node.States then
                    PaintCellBackground(TargetCanvas,CellRect,MixColors(selColor,MarkBackgrounds[0],100-SelTransp)) else
                    PaintCellBackground(TargetCanvas,CellRect,MarkBackgrounds[0]);
              end;
          end;
      //then the normal error marking
      for i := 1 to Integer(High(TErrorType))+1 do //for each type of error
        if (TErrorType(i-1) in Data.ErrorType) and (mfEnabled in MarkFlags[i]) then
        begin
          //if the current column is to be marked
          if ((Column=0) and (mfColNum in MarkFlags[i])) or ((Column=1) and (mfColShow in MarkFlags[i])) or ((Column=2) and (mfColHide in MarkFlags[i])) or ((Column=3) and (mfColText in MarkFlags[i])) or ((Column=6) and (mfColPause in MarkFlags[i])) or ((Column=5) and (mfColDur in MarkFlags[i])) then
          begin
            if (MarkBackgrounds[i] <> lstSubtitles.Color) then
              if vsSelected in Node.States then
                PaintCellBackground(TargetCanvas,CellRect,MixColors(selColor,MarkBackgrounds[i],100-SelTransp)) else
                PaintCellBackground(TargetCanvas,CellRect,MarkBackgrounds[i]);
          end; {else
            if vsSelected in Node.States then
              PaintCellBackground(TargetCanvas,CellRect,MixColors(selColor,lstSubtitles.Color,130-SelTransp)) else
              PaintCellBackground(TargetCanvas,CellRect,lstSubtitles.Color);}
        end;
    end;
  end
  //UNTRANSLATED SUBS MARKING
  else if (MarkUnTransSubsBckgr) and (Column=4) then
  begin
    if (Data.Text = Data.Translation) or (Data.Translation = '') or (RemoveSWTags(Data.Translation,True,True,True,True) = UntranslatedSub) then //RemoveSWTags added by adenry
    begin
      PaintCellBackground(TargetCanvas,CellRect,UnTransSubsBckgr);
      if vsSelected in Node.States then
        PaintCellBackground(TargetCanvas,CellRect,MixColors(selColor,UnTransSubsBckgr,100-SelTransp));
    end;
  end;

  //marked subtitles high priority marking (not error marking!)
  if MarkingHighPriority then
    if Data.Marked and MarkingWithBckgr then
      if ((Column=0) and MarkingColNum) or ((Column=1) and MarkingColShow) or ((Column=2) and MarkingColHide) or ((Column=3) and MarkingColText) or ((Column=6) and MarkingColPause) or ((Column=5) and MarkingColDur) then
        if vsSelected in Node.States then
          PaintCellBackground(TargetCanvas,CellRect,MixColors(MarkingBckgr,lstSubtitles.Color,100-SelTransp)) else
          PaintCellBackground(TargetCanvas,CellRect,MarkingBckgr);
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.PaintCellBackground(TargetCanvas: TCanvas; CellRect: TRect; Color: TColor);
var
  tmpStyle : TPenStyle;
  tmpColor : TColor;
begin
  tmpColor := TargetCanvas.Brush.Color;
  TargetCanvas.Brush.Color := Color;
  tmpStyle:=TargetCanvas.Pen.Style;
  TargetCanvas.Pen.Style := psClear;
  TargetCanvas.FillRect(CellRect);
  TargetCanvas.Pen.Style:=tmpStyle;
  TargetCanvas.Brush.Color := tmpColor;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
//Mark too long duration, too short duration and bad values in time controls
procedure TfrmMain.tmeDurationTimeChange(Sender: TObject; NewTime: Cardinal);
begin
if lstSubtitles.SelectedCount > 0 then
begin
  if lstSubtitles.SelectedCount > 1 then
  begin
    //set multiple subtitles selected colors:
    tmeDuration.Font.Color := clGray;
    tmeDuration.Color := $00D8D8D8;
    tmeShow.Font.Color := clGray;
    tmeShow.Color := $00D8D8D8;
    tmeHide.Font.Color := clGray;
    tmeHide.Color := $00D8D8D8;
  end else
  begin
    //mark too short duration
    if ((NewTime < Cardinal(TooShortDuration)) or (NewTime > MAX_TIME)) and (IndicTooShortDuration) then //Cardinal cast added by adenry
    begin
      tmeDuration.Font.Color := TooShortDurationColor;
      tmeDuration.Color := TooShortDurationBackground;
    end else
    //mark too long duration
    if (NewTime > Cardinal(TooLongDuration)) and (IndicTooLongDuration) then //Cardinal cast added by adenry
    begin
      tmeDuration.Font.Color := TooLongDurationColor;
      tmeDuration.Color := TooLongDurationBackground;
    end else
    //clear marking
    begin
      tmeDuration.Font.Color := clWindowText;
      tmeDuration.Color := clWindow;
    end;

    //mark bad values
    if (tmeShow.Time > tmeHide.Time) and (IndicBadValues) then
    begin
      //tmeDuration.Font.Color := BadValuesColor;
      //tmeDuration.Color := BadValuesBackground;
      tmeShow.Font.Color := BadValuesColor;
      tmeShow.Color := BadValuesBackground;
      tmeHide.Font.Color := BadValuesColor;
      tmeHide.Color := BadValuesBackground;
    end else
    //clear bad values marking
    begin
      tmeShow.Font.Color := clWindowText;
      tmeShow.Color := clWindow;
      tmeHide.Font.Color := clWindowText;
      tmeHide.Color := clWindow;
    end;

    //Work with Duration is selected
    //if tmeHide.Enabled = False then
    //  tmeHide.Font.Color := clGray else
    //Work with Hide Time is selected
    //if tmeDuration.Enabled = False then
    //  tmeDuration.Font.Color := clGray;
  end;
  //repaint controls - necessary when using XP manifest, but breaks mouse wheel action
  //tmeDuration.Hide;
  //tmeDuration.Show;
  //tmeShow.Hide;
  //tmeShow.Show;
  //tmeHide.Hide;
  //tmeHide.Show;

  //added later by adenry: show bad values duration as 00:00:00,000
  if (tmeDuration.Time > MAX_TIME) and (FormatType = ftTime) then
    tmeDuration.Time := 0; //the Show or Hide values of the subtitle are not changed, this is just for viewing and editing convenience
end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.tmePauseTimeChange(Sender: TObject; NewTime: Cardinal);
begin
if lstSubtitles.SelectedCount > 0 then
begin
  if lstSubtitles.SelectedCount > 1 then
  begin
    //set multiple subtitles selected colors:
    tmePause.Font.Color := clGray;
    tmePause.Color := $00D8D8D8;
  end else
  begin
    //mark overlapping
    if ((NewTime <= 0) or (NewTime > MAX_TIME)) and IndicOverlapping then
    begin
      tmePause.Font.Color := OverlappingColor;
      tmePause.Color := OverlappingBackground;
    end else
    //mark too short pause
    if (NewTime < TooShortPause) and IndicTooShortPause then
    begin
      tmePause.Font.Color := TooShortPauseColor;
      tmePause.Color := TooShortPauseBackground;
    end else
    begin
      tmePause.Font.Color := clWindowText;
      tmePause.Color := clWindow;
    end;
  end;
  //repaint control - necessary when using XP manifest, but breaks mouse wheel action
  //tmePause.Hide;
  //tmePause.Show;

  //show negative pause as 00:00:00,000
  if (tmePause.Time > MAX_TIME) and (FormatType = ftTime) then
    tmePause.Time := 0;
end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.UpdateLinesCounter(lbl: TLabel);
var
  lines: Integer;
  tmpLabel: TLabel;
begin
  if mnuShowLinesCount.Checked then
  begin
    //tmpLabel := TLabel.Create(Application);
    tmpLabel := TLabel(FindComponent(lbl.Name+'Lines'));
    lines:=0;
    if (Pos('(',lbl.Caption)>0) then
    begin
      lines:=1+Length(lbl.Caption)-Length(ReplaceString(lbl.Caption,'/',''));
      if (lines > 2) and (IndicOverTwoLines) then
      begin
        tmpLabel.Font.Color := OverTwoLinesColor;
        tmpLabel.Color      := OverTwoLinesBackground;
      end else
      begin
        tmpLabel.Font.Color := clWindowText;
        tmpLabel.Color      := clBtnFace;
      end;
    end;
    if (lines > 0)
    and((tmpLabel <> lblTranslationLines) or (mnuTranslatorMode.Checked)) then //added later
      tmpLabel.Visible := True else
      tmpLabel.Visible := False;
    tmpLabel.Caption:=IntToStr(lines);
    SetLinesLabelsPositions;
  end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.SetLinesLabelsPositions;
begin
  {lblTextLines.Top          := lblText.Top;
  lblTranslationLines.Top   := lblText.Top;
  lblLines1.Top             := lblText.Top;
  lblLines2.Top             := lblText.Top;}
  lblTextLines.Left         := mmoSubtitleText.Left + mmoSubtitleText.Width - lblTextLines.Width;
  lblTranslationLines.Left  := mmoTranslation.Left + mmoTranslation.Width - lblTranslationLines.Width;
  lblLines1.Left            := lblTextLines.Left - lblLines1.Width;
  lblLines2.Left            := lblTranslationLines.Left - lblLines2.Width;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.mnuShowLinesCountClick(Sender: TObject);
begin
  if mnuShowLinesCount.Checked then
  begin
    UpdateLinesCounter(lblText);
    UpdateLinesCounter(lblTranslation);
    if StrToInt(lblTextLines.Caption)>0 then
      lblTextLines.Visible        := True;
    if StrToInt(lblTranslationLines.Caption)>0 then
      lblTranslationLines.Visible := True;
    lblLines1.Visible             := True;
    lblLines2.Visible             := True;
  end else
  begin
    lblTextLines.Visible          := False;
    lblTranslationLines.Visible   := False;
    lblLines1.Visible             := False;
    lblLines2.Visible             := False;
  end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.CallLstSubtitlesColumnResize;
begin
  CellResizeBegun := True;
  lstSubtitlesColumnResize(lstSubtitles.Header, 0);
  CellResizeBegun := False;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
//TODO: make fullscreen with put_FullScreenMode - currently I don't know how to put a control (subSubtitle) OVER the fullscreen video...
procedure TfrmMain.ToggleFullScreen;
var
  //H: Integer;
  pwi: tagWINDOWINFO;
begin
  if (Player.Initialized) and (mnuVideoPreviewMode.Checked) then
  begin
    TogglingFullScreen := True;
    subSubtitle.Visible := False;

    if FullScreen then
    //EXIT FULLSCREEN
    begin
      //restore cursor
      pnlVideoDisplay.Cursor := crArrow;
      subSubtitle.Cursor := crDefault;
      Player.VideoWindow.HideCursor(False);

      //RESIZE START

      //restore form's dimensions / maximized state
      Left     := FormMainLeft;
      Top      := FormMainTop;
      Width    := FormMainWidth;
      Height   := FormMainHeight;
      if FormMainMaximized then
        WindowState := wsMaximized else
        WindowState := wsNormal;

      //restore form's border style
      SetWindowLong(frmMain.Handle, GWL_STYLE, fsWindowStyle);
      if FormMainAlwaysOnTop then
        SetWindowPos(frmMain.Handle, HWND_TOPMOST, frmMain.Left, frmMain.Top, frmMain.Width, frmMain.Height, SWP_NOMOVE + SWP_NOSIZE + SWP_FRAMECHANGED) else
        SetWindowPos(frmMain.Handle, HWND_NOTOPMOST, frmMain.Left, frmMain.Top, frmMain.Width, frmMain.Height, SWP_NOMOVE + SWP_NOSIZE + SWP_FRAMECHANGED);

      Menu := mnuMain; //show menu
      //Application.RestoreTopMosts; //restore other windows' TopMost state
      RestoreTopMostWindows;

      //restore panels positions and size
      pnlParent2.Top := pnlControl.Left*2 + (pnlControl.Left*2 * Integer(tbMainToolBar.Visible));
      pnlParent2.Height := pnlEditingControls.Top - pnlParent2.Top -1; //pnlParent2.Height := lblText.Top - pnlParent2.Top - 7;
      pnlVideoControls.Visible := True;
      //restore splitter position
      pnlVideo.Height := SplitterTop;
      spSplitter.Top := SplitterTop;
      spSplitterMoved(spSplitter);

      //RESIZE END

      TogglingFullScreen := False;
      FullScreen := False; //must be before UpdateSubtitlesPos

      //update Player and subSubtitle positions and size
      UpdateVideoPos;
      UpdateSubtitlesPos;

      subSubtitle.Visible := mnuShowSubtitles.Checked;

      //refresh labels!
      RefreshTimes;

      //Center list on selected - should be after RefreshTimes!
      if ScrollList then
        CenterListOnSelected;

      //restore ScrollList state
      if not ScrollListState then
      begin
        ScrollList := False;
        btnScrollList.Down := False;
      end;

      mnuToggleFullscreen.Caption := EnterFullScreen;

      TheLastActiveControl.SetFocus;

    end else
    //ENTER FULLSCREEN
    begin
      ScrollListState := ScrollList; //save ScrollList state

      //RESIZE START

      SplitterTop := spSplitter.Top; //save splitter position
      //save form's dimensions / maximized state
      if WindowState = wsMaximized then
      begin
        FormMainMaximized := True;
      end else
      begin
        FormMainMaximized := False;
        FormMainLeft := Left;
        FormMainTop := Top;
        FormMainWidth := Width;
        FormMainHeight := Height;
      end;
      ColTextWidth  := lstSubtitles.Header.Columns[3].Width;
      ColTransWidth := lstSubtitles.Header.Columns[4].Width;

      Menu := nil; //hide menu

      //Application.NormalizeTopMosts; //all TopMost windows are now non-topmost

      //save form's border style
      pwi.cbSize := sizeof(PWindowInfo);
      GetWindowInfo(frmMain.Handle,pwi);
      fsWindowStyle := pwi.dwStyle;

      //remove border and fill the entire window
      SetWindowLong(frmMain.Handle, GWL_STYLE, WS_VISIBLE);
      SetWindowPos(frmMain.Handle, HWND_TOPMOST, 0, 0, Screen.Width, Screen.Height, SWP_FRAMECHANGED);

      //set panels positions and size
      pnlParent2.Top := 0;
      pnlParent2.Left := 0;
      pnlParent2.Width := Width;
      pnlParent2.Height := Height;
      pnlParent2.BringToFront;
      pnlVideo.Height := Height;
      pnlVideo.BringToFront;
      pnlVideoControls.Visible := False;

      //RESIZE END

      TogglingFullScreen := False;
      FullScreen := True;

      //update Player and subSubtitle positions and size
      UpdateVideoPos;
      UpdateSubtitlesPos;

      subSubtitle.Visible := mnuShowSubtitles.Checked;

      //set the VideoWindow in the middle vertically
      //Player.VideoWindow.get_Height(H);
      //Player.VideoWindow.put_Top((Height-H) div 2);

      //start mouse autohide
      MouseCoords := Mouse.CursorPos;
      tmrMouseHide.Enabled := True;

      //set ScrollList
      if not ScrollListState then
      begin
        ScrollList := True;
        btnScrollList.Down := True;
      end;

      //refresh the form - important!
      frmMain.Refresh;

      mnuToggleFullscreen.Caption := ExitFullScreen;

      TheLastActiveControl := Screen.ActiveControl;

      edtPlayerShortcuts.SetFocus;
    end;

    //edtPlayerShortcuts.SetFocus; //enable player special shortcuts
  end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.PlayerShortcutsKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  Data: PSubtitleItem;
  Node: PVirtualNode;
begin
  if ShortCut(Key, Shift) = mnuStop.ShortCut then mnuStopClick(Sender) else
  if ShortCut(Key, Shift) = mnuRewind.ShortCut then mnuRewindClick(Sender) else
  if ShortCut(Key, Shift) = mnuForward.ShortCut then mnuForwardClick(Sender) else
  if ShortCut(Key, Shift) = mnuBack5Sec.ShortCut then mnuBack5SecClick(Sender) else
  if ShortCut(Key, Shift) = mnuFwd5Sec.ShortCut then mnuFwd5SecClick(Sender) else
  if ShortCut(Key, Shift) = DefAltPlayRateShortcut then btnAlterPlaybackRateClick(Sender) else

  begin
    Node := GetNodeWithIndex(lstSubtitles,subSubtitle.SubtitleNum-1);
    case Key of
      VK_ESCAPE   : if FullScreen then ToggleFullScreen;
      VK_RETURN   : ToggleFullScreen;
      VK_LEFT     : if not((ssAlt in Shift)or(ssCtrl in Shift)or(ssShift in Shift))and not btnRew.Down then begin btnRew.Down := True; btnRewMouseDown(Sender,mbLeft,Shift,0,0); end;
      VK_RIGHT    : if not((ssAlt in Shift)or(ssCtrl in Shift)or(ssShift in Shift))and not btnForward.Down then begin btnForward.Down := True; btnForwardMouseDown(Sender,mbLeft,Shift,0,0); end;
      VK_UP       : VolumeSet(sbVolume.Position+5);
      VK_DOWN     : VolumeSet(sbVolume.Position-5);

      VK_SPACE    : if not ((ssShift in Shift)or(ssAlt in Shift)or(ssCtrl in Shift)) then
                    begin
                      if Assigned(Node) and subSubtitle.Visible then
                      begin
                        Data := lstSubtitles.GetNodeData(Node);
                        if Data.Marked then
                          UnmarkNode(Node) else
                          MarkNode(Node);
                      end;
                    end else
                      Pause;
      Ord('B'),
      Ord('O')	  : if Assigned(Node) and subSubtitle.Visible and (subSubtitle.Text <> '') then
                      SetNodeTag(Node, '<b>', '</b>', mnuTranslatorMode.Checked and mnuDisplayTranslation.Checked);
      Ord('I')	  : if Assigned(Node) and subSubtitle.Visible and (subSubtitle.Text <> '') then
                      SetNodeTag(Node, '<i>', '</i>', mnuTranslatorMode.Checked and mnuDisplayTranslation.Checked);
      Ord('U')	  : if Assigned(Node) and subSubtitle.Visible and (subSubtitle.Text <> '') then
                      SetNodeTag(Node, '<u>', '</u>', mnuTranslatorMode.Checked and mnuDisplayTranslation.Checked);
      Ord('C'),
      Ord('Y')    : if Assigned(Node) and subSubtitle.Visible and (subSubtitle.Text <> '') then
                      SetNodeColor(Node, dlgColor.Color, mnuTranslatorMode.Checked and mnuDisplayTranslation.Checked, True, True);
      VK_BACK     : if Assigned(Node) and subSubtitle.Visible and (subSubtitle.Text <> '') then
                      RemoveNodeTags(Node, mnuTranslatorMode.Checked and mnuDisplayTranslation.Checked);
    end;
  end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.PlayerShortcutsKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_LEFT   : if btnRew.Down then begin btnRewMouseUp(Sender,mbLeft,Shift,0,0); btnRew.Down := False; end;
    VK_RIGHT  : if btnForward.Down then begin btnForwardMouseUp(Sender,mbLeft,Shift,0,0); btnForward.Down := False; end;
  end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.PlayerShortcutsMouseWheelUp(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
  if TempActiveControl = nil then
    VolumeSet(sbVolume.Position + 5)
  else
    FormMouseWheelUp(Sender, Shift, MousePos, Handled);
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.PlayerShortcutsMouseWheelDown(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
  if TempActiveControl = nil then
    VolumeSet(sbVolume.Position - 5)
  else
    FormMouseWheelDown(Sender, Shift, MousePos, Handled);
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.pnlVideoDisplayDblClick(Sender: TObject);
begin
  //Playing := not Playing; //a double click is always preceeded by a click that calls Pause; //this is for old fullscreen version
  Pause; //a double click is always preceeded by a click that calls Pause; So we unpause
  if FullScreenOnDblClick then //added by adenry later
    ToggleFullScreen;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.pnlVideoDisplayMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbMiddle then
    ToggleFullScreen
  {else if Button = mbRight then
  begin
    subSubtitleTopShift := 0.0;
    UpdateSubtitlesPos;
  end};
  //if (Player.Initialized) and (mnuVideoPreviewMode.Checked) then
    //edtPlayerShortcuts.SetFocus;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.pnlVideoDisplayMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if FullScreen and ((Mouse.CursorPos.X <> MouseCoords.X) or (Mouse.CursorPos.Y <> MouseCoords.Y)) then
  begin
    pnlVideoDisplay.Cursor := crArrow;
    subSubtitle.Cursor := crArrow;
    Player.VideoWindow.HideCursor(False);
    if Mouse.CursorPos.Y > Height - pnlVideoControls.Height then
    begin
      pnlVideoControls.Visible := True;
      tmrMouseHide.Enabled := False;
    end else
    begin
      pnlVideoControls.Visible := False;
      MouseCoords := Mouse.CursorPos;
      tmrMouseHide.Enabled := True;
    end;
  end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.tmrMouseHideTimer(Sender: TObject);
begin
  if FullScreen then
  begin
    pnlVideoDisplay.Cursor := crNone;
    subSubtitle.Cursor := crNone;
    Player.VideoWindow.HideCursor(True);
  end;
  tmrMouseHide.Enabled := False;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.VolumeSet(vol: Integer);
var
  i :Integer;
  r : Real;
  tmpSWButton: TSWButton;
begin
  if vol > 100 then vol := 100;
  if vol < 0 then
    sbVolume.Position := 0 else
    sbVolume.Position := vol;
  if (Player.Initialized) and (mnuVideoPreviewMode.Checked) then
  begin
    //i := -10000 + sbVolume.Position * 100; //nonlinear
    if vol > 0 then
      r := 25 * log10(vol/100) * 100 else //20 or 10 is correct, but with 25 sounds smoother
      r := -10000;
    i := Round(r);
    if Assigned(Player.BasicAudio) then
      Player.BasicAudio.put_Volume(i);
  end;
  if vol > 75 then tmpSWButton := btnMute100 else
  if vol > 50 then tmpSWButton := btnMute075 else
  if vol > 25 then tmpSWButton := btnMute050 else
  if vol > 0 then tmpSWButton := btnMute025 else
  tmpSWButton := btnMute000;
  if btnMute.MouseOver <> tmpSWButton.MouseOver then btnMute.MouseOver := tmpSWButton.MouseOver;
  if btnMute.Disabled <> tmpSWButton.Disabled then btnMute.Disabled := tmpSWButton.Disabled;
  if btnMute.Normal <> tmpSWButton.Normal then btnMute.Normal := tmpSWButton.Normal;
  if btnMute.Pressed <> tmpSWButton.Pressed then btnMute.Pressed := tmpSWButton.Pressed;

  sbVolume.Hint := Format(VolumeHint, [sbVolume.Position]);
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.sbVolumeMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if ssLeft in Shift then
    VolumeSet(sbVolume.Position);
  Application.ActivateHint(Mouse.CursorPos);
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.sbVolumeMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
    VolumeSet(sbVolume.Position);
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.btnMuteClick(Sender: TObject);
begin
  if sbVolume.Position > 0 then
  begin
    UnmuteValue := sbVolume.Position;
    VolumeSet(0);
  end else
    VolumeSet(UnmuteValue);
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.subSubtitleMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if (Button = mbLeft) and not(ssDouble in Shift) then
  begin
    subSubtitleDragging := True;
    subSubtitleDownY    := Y;
    subSubtitleDownTop  := subSubtitle.Top;
    if Playing then
      WasPlaying := True else
      WasPlaying := False;
  end else
  {if Button = mbRight then
  begin
    subSubtitleTopShift := 0.0;
    UpdateSubtitlesPos;
  end else}
  if Button = mbMiddle then
    ToggleFullScreen;
  //if (Player.Initialized) and (mnuVideoPreviewMode.Checked) then
  //  edtPlayerShortcuts.SetFocus;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.subSubtitleMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if subSubtitleDragging and (Y <> subSubtitleDownY) then
  begin
    if Playing then
      Pause;
    subSubtitle.Top := subSubtitle.Top + (Y-subSubtitleDownY);
  end else
  //added by adenry later:
  if FullScreen and ((Mouse.CursorPos.X <> MouseCoords.X) or (Mouse.CursorPos.Y <> MouseCoords.Y)) and not subSubtitleDragging then
  begin
    pnlVideoDisplay.Cursor := crArrow;
    subSubtitle.Cursor := crArrow;
    Player.VideoWindow.HideCursor(False);
    if Mouse.CursorPos.Y > Height - pnlVideoControls.Height then
    begin
      pnlVideoControls.Visible := True;
      tmrMouseHide.Enabled := False;
    end else
    begin
      pnlVideoControls.Visible := False;
      MouseCoords := Mouse.CursorPos;
      tmrMouseHide.Enabled := True;
    end;
  end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.subSubtitleMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  H: Integer;
begin
  if Button = mbLeft then
  begin
    if subSubtitleDragging {and (subSubtitle.Top <> subSubtitleDownTop)} then
    begin
      Player.VideoWindow.get_Height(H);
      //subSubtitleTopShift := subSubtitleTopShift + ((subSubtitle.Top - subSubtitleDownTop) / H);
      if KeepSubOnVideo then
        subSubtitleTopShift := (subSubtitle.Top + subSubtitle.Height - ((pnlVideoDisplay.Height - H) div 2))/ H else
        subSubtitleTopShift := (pnlVideoDisplay.Height - subSubtitle.Top - subSubtitle.Height) / H;
      if WasPlaying and (not Playing) then
        Play;
    end;
    if subSubtitle.Top = subSubtitleDownTop then
    begin
      Pause;
    end;
    subSubtitleDragging := False;
  end else
  if Button = mbRight then
    mnuVideoPopup.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.rdoModeClick(Sender: TObject);
begin
  if rdoModeTime.Checked then
    FormatType := ftTime else
    FormatType := ftFrames;

  //this bit was moved here from RefreshTimes:
  if FormatType = ftTime then
  begin
    tmeShow.TimeMode     := tmTime;
    tmeHide.TimeMode     := tmTime;
    tmeDuration.TimeMode := tmTime;
    tmePause.TimeMode    := tmTime; //added by adenry
  end else
  begin
    tmeShow.TimeMode     := tmFrames;
    tmeHide.TimeMode     := tmFrames;
    tmeDuration.TimeMode := tmFrames;
    tmePause.TimeMode    := tmFrames; //added by adenry
  end;

  lstSubtitles.Refresh;
  InitializeTimeCounter; //added later
  SetTimeCounter(sbSeekBar.Position); //added later
  RefreshTimes;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.AutoRecheckNodeErrors(Node: PVirtualNode; ErrorTypesToCheck: TErrorTypeSet = []; RecheckType: TRecheckTypes = rtNormal; FormOnly: Boolean = False);
begin
  if AutoRecheckErrors then
  begin
    if FormOnly = False then //we recheck only the Info&Errors form when: 1. The Node's marking was changed; 2. The Node was deleted; 3. The Node's Data.ErrorType was restored by Undo
      SingleCheckMarkErrors(Node, ErrorTypesToCheck);
    //refresh the Information & Errors form
    if Assigned(frmInfoErrors) and Assigned(Node) then
      if frmInfoErrors.Visible then
        frmInfoErrors.RecheckNodeErrors(Node.Index, RecheckType);
  end;
end;

//added later:
procedure TfrmMain.AutoRecheckNodeErrorsAndRepaint(Node: PVirtualNode; ErrorTypesToCheck: TErrorTypeSet = []; RecheckType: TRecheckTypes = rtNormal; FormOnly: Boolean = False);
begin
  AutoRecheckNodeErrors(Node, ErrorTypesToCheck, RecheckType, FormOnly);
  if AutoRecheckErrors and not FormOnly then
    lstSubtitles.RepaintNode(Node);
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.AutoRecheckAllErrors(ErrorTypesToCheck: TErrorTypeSet = []);
begin
  if AutoRecheckErrors then
  begin
    Screen.Cursor := crHourGlass;
    try
      CheckMarkErrors(ErrorTypesToCheck);
      RefreshFormInfoErrors;
    finally
      Screen.Cursor := crDefault;
    end;
  end
  else lstSubtitles.Refresh; //added by adenry later
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.RefreshFormInfoErrors;
begin
  if Assigned(frmInfoErrors) then
    if frmInfoErrors.Visible then
      if frmInfoErrors.btnCheck.Enabled then //added later
        frmInfoErrors.btnCheckClick(frmMain);
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.RefreshFormVariousInfo;
begin
  if Assigned(frmVariousInfo) then
    if frmVariousInfo.Visible then
      frmVariousInfo.btnRefreshInfoClick(frmMain);
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.ReloadVideo(ASNum: SmallInt = 0);
var
  tmpPaused : Boolean;
  sbSeekBarPosition: Int64;
begin
  if Playing then
    tmpPaused := False else
    tmpPaused := True;
  sbSeekBarPosition := sbSeekBar.Position;
  Stop;

  //SelectAudioStream(Player.GraphBuilder,ASNum); //if this function could restore disconnected audio streams, we wouldn't have to reaload the entire video to change the audio stream

  //reload entire video, but with selected audio stream:
  if LoadMovie(MovieFile, ASNum, tmpPaused, sbSeekBarPosition) = False then
  begin
    MsgBox(Format(ErrorMsg[05], [dlgLoadFile.FileName]), BTN_OK, '', '', MB_ICONERROR, frmMain);
    exit;
  end;

  //sbSeekBar.Position := sbSeekBarPosition;
  //SetVideoPos(sbSeekBar.Position);
  //if not tmpPaused then
  //  Play;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.mnuAudioStreamNClick (Sender: TObject);
begin
  ReloadVideo(SmallInt((Sender as TMenuItem).Tag));
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.mnuDefaultVidRendClick(Sender: TObject);
begin
  mnuDefaultVidRend.Checked := True;
  if Player.Initialized then
    ReloadVideo;
end;

procedure TfrmMain.mnuVMR9VidRendClick(Sender: TObject);
begin
  mnuVMR9VidRend.Checked := True;
  if Player.Initialized then
    ReloadVideo;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.CenterListOnSelected;
begin
  if lstSubtitles.Enabled then //added later
    lstSubtitles.ScrollIntoView(lstSubtitles.GetFirstSelected, True);
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.CenterListOnLastSelected;
begin
  if lstSubtitles.Enabled then //added later
    lstSubtitles.ScrollIntoView(GetLastSelected, True);
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.mnuJumpToNextMarkedClick(Sender: TObject);
var
  Node, InitNode : PVirtualNode;
  Data           : PSubtitleItem;
begin
  if (Assigned(lstSubtitles.FocusedNode)) and (lstSubtitles.FocusedNode <> lstSubtitles.GetLast) then
    Node := lstSubtitles.FocusedNode.NextSibling else
    Node := lstSubtitles.GetFirst;
    InitNode := Node; //to prevent infinite loop
  while Assigned(Node) do
  begin
    Data := lstSubtitles.GetNodeData(Node);
    if Data.Marked then
    begin
      lstSubtitles.ScrollIntoView(Node, True);
      UnSelectAll(lstSubtitles);
      lstSubtitles.FocusedNode := Node;
      lstSubtitles.Selected[Node] := True;
      RefreshTimes;
      Break;
    end;
    if Node = lstSubtitles.GetLast then
      Node := lstSubtitles.GetFirst else
      Node := Node.NextSibling;
    if Node = InitNode then break; //to prevent infinite loop
  end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.mnuJumpToPrevMarkedClick(Sender: TObject);
var
  Node, InitNode : PVirtualNode;
  Data           : PSubtitleItem;
begin
  if (Assigned(lstSubtitles.FocusedNode)) and (lstSubtitles.FocusedNode <> lstSubtitles.GetFirst) then
    Node := lstSubtitles.FocusedNode.PrevSibling else
    Node := lstSubtitles.GetLast;
    InitNode := Node; //to prevent infinite loop
  while Assigned(Node) do
  begin
    Data := lstSubtitles.GetNodeData(Node);
    if Data.Marked then
    begin
      lstSubtitles.ScrollIntoView(Node, True);
      UnSelectAll(lstSubtitles);
      lstSubtitles.FocusedNode := Node;
      lstSubtitles.Selected[Node] := True;
      RefreshTimes;
      Break;
    end;
    if Node = lstSubtitles.GetFirst then
      Node := lstSubtitles.GetLast else
      Node := Node.PrevSibling;
    if Node = InitNode then break; //to prevent infinite loop
  end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.mnuSaveMarkingClick(Sender: TObject);
begin
  if frmMain.OrgFile <> '' then
    SaveMarking(frmMain.OrgFile+ID_SRFEXT, frmMain.OrgFile);
  if frmMain.TransFile <> '' then
    SaveMarking(frmMain.TransFile+ID_SRFEXT, frmMain.TransFile);
  if (frmMain.OrgFile = '') and (frmMain.TransFile = '') then
    MsgBox(ErrorMsg[26], BTN_OK, '', '', MB_ICONERROR, frmMain);
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.tmrTimesMouseWheelUndoBindTimer(Sender: TObject);
begin
  tmrTimesMouseWheelUndoBind.Enabled := False;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.tmeShowMouseWheelDown(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
var
  step              : Cardinal;
  Node, NextSelNode : PVirtualNode; //added later
begin
  if FormatType = ftTime then
    step := TTimeMaskEdit(Sender).TimeStep else
    step := Round((1000 * TTimeMaskEdit(Sender).FramesStep)/GetFPS);
  if ssAlt in Shift then
    step := Round(step / 2);
  if ssCtrl in Shift then
     step := step * 10;

  Node := lstSubtitles.GetFirstSelected;
  while Assigned(Node) do
  begin
    NextSelNode := lstSubtitles.GetNextSelected(Node);
    ChangeShowTime(Node, GetStartTime(Node) - step, Assigned(NextSelNode), tmrTimesMouseWheelUndoBind.Enabled);
    Node := NextSelNode;
  end;
  tmrTimesMouseWheelUndoBind.Enabled := False;
  tmrTimesMouseWheelUndoBind.Enabled := True;

  if lstSubtitles.SelectedCount = 1 then //added later
  begin
    if Sender <> tmeShow then TTimeMaskEdit(Sender).Time := GetStartTime(lstSubtitles.GetFirstSelected); //added later
    TTimeMaskEdit(Sender).SelStart := 7;
    TTimeMaskEdit(Sender).SelLength := 0;
  end;
  Handled := True;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.tmeShowMouseWheelUp(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
var
  step              : Cardinal;
  Node, NextSelNode : PVirtualNode; //added later
begin
  if FormatType = ftTime then
    step := TTimeMaskEdit(Sender).TimeStep else
    step := Round((1000 * TTimeMaskEdit(Sender).FramesStep)/GetFPS);
  if ssAlt in Shift then
    step := Round(step / 2);
  if ssCtrl in Shift then
    step := step * 10;

  Node := lstSubtitles.GetFirstSelected;
  while Assigned(Node) do
  begin
    NextSelNode := lstSubtitles.GetNextSelected(Node);
    ChangeShowTime(Node, GetStartTime(Node) + step, Assigned(NextSelNode), tmrTimesMouseWheelUndoBind.Enabled);
    Node := NextSelNode;
  end;
  tmrTimesMouseWheelUndoBind.Enabled := False;
  tmrTimesMouseWheelUndoBind.Enabled := True;

  if lstSubtitles.SelectedCount = 1 then //added later
  begin
    if Sender <> tmeShow then TTimeMaskEdit(Sender).Time := GetStartTime(lstSubtitles.GetFirstSelected); //added later
    TTimeMaskEdit(Sender).SelStart := 7;
    TTimeMaskEdit(Sender).SelLength := 0;
  end;

  //if Sender = tmeShow then tmeShow.SetFocus;

  Handled := True;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.tmeHideMouseWheelDown(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
var
  step              : Cardinal;
  Node, NextSelNode : PVirtualNode; //added later
begin
  if FormatType = ftTime then
    step := TTimeMaskEdit(Sender).TimeStep else
    step := Round((1000 * TTimeMaskEdit(Sender).FramesStep)/GetFPS);
  if ssAlt in Shift then
    step := Round(step / 2);
  if ssCtrl in Shift then
     step := step * 10;

  Node := lstSubtitles.GetFirstSelected;
  while Assigned(Node) do
  begin
    NextSelNode := lstSubtitles.GetNextSelected(Node);
    ChangeHideTime(Node, GetFinalTime(Node) - step, Assigned(NextSelNode), tmrTimesMouseWheelUndoBind.Enabled);
    Node := NextSelNode;
  end;
  tmrTimesMouseWheelUndoBind.Enabled := False;
  tmrTimesMouseWheelUndoBind.Enabled := True;

  if lstSubtitles.SelectedCount = 1 then //added later
  begin
    if Sender <> tmeHide then TTimeMaskEdit(Sender).Time := GetFinalTime(lstSubtitles.GetFirstSelected); //added later
    TTimeMaskEdit(Sender).SelStart := 7;
    TTimeMaskEdit(Sender).SelLength := 0;
  end;
  Handled := True;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.tmeHideMouseWheelUp(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
var
  step              : Cardinal;
  Node, NextSelNode : PVirtualNode; //added later
begin
  if FormatType = ftTime then
    step := TTimeMaskEdit(Sender).TimeStep else
    step := Round((1000 * TTimeMaskEdit(Sender).FramesStep)/GetFPS);
  if ssAlt in Shift then
    step := Round(step / 2);
  if ssCtrl in Shift then
    step := step * 10;

  Node := lstSubtitles.GetFirstSelected;
  while Assigned(Node) do
  begin
    NextSelNode := lstSubtitles.GetNextSelected(Node);
    ChangeHideTime(Node, GetFinalTime(Node) + step, Assigned(NextSelNode), tmrTimesMouseWheelUndoBind.Enabled);
    Node := NextSelNode;
  end;
  tmrTimesMouseWheelUndoBind.Enabled := False;
  tmrTimesMouseWheelUndoBind.Enabled := True;

  if lstSubtitles.SelectedCount = 1 then //added later
  begin
    if Sender <> tmeHide then TTimeMaskEdit(Sender).Time := GetFinalTime(lstSubtitles.GetFirstSelected); //added later
    TTimeMaskEdit(Sender).SelStart := 7;
    TTimeMaskEdit(Sender).SelLength := 0;
  end;
  Handled := True;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.tmeDurationMouseWheelDown(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
var
  step              : Cardinal;
  Duration          : Cardinal; //added later
  Node, NextSelNode : PVirtualNode; //added later
begin
  //Set the duration change step:
  if FormatType = ftTime then
    step := TTimeMaskEdit(Sender).TimeStep else
    step := Round((1000 * TTimeMaskEdit(Sender).FramesStep)/GetFPS);
  if ssAlt in Shift then
    step := Round(step / 2);
  if ssCtrl in Shift then
    step := step * 10;

  Node := lstSubtitles.GetFirstSelected;
  while Assigned(Node) do
  begin
    NextSelNode := lstSubtitles.GetNextSelected(Node);
    Duration := GetFinalTime(Node) - GetStartTime(Node);
    if Duration >= step then //avoid setting negative duration
      ChangeDuration(Node, Duration - step, Assigned(NextSelNode), tmrTimesMouseWheelUndoBind.Enabled) else
      ChangeDuration(Node, 0, Assigned(NextSelNode), tmrTimesMouseWheelUndoBind.Enabled);
    Node := NextSelNode;
  end;
  tmrTimesMouseWheelUndoBind.Enabled := False;
  tmrTimesMouseWheelUndoBind.Enabled := True;

  if lstSubtitles.SelectedCount = 1 then //added later
  begin
    if Sender <> tmeDuration then TTimeMaskEdit(Sender).Time := GetFinalTime(lstSubtitles.GetFirstSelected) - GetStartTime(lstSubtitles.GetFirstSelected); //added later
    TTimeMaskEdit(Sender).SelStart := 7;
    TTimeMaskEdit(Sender).SelLength := 0;
  end;

  Handled := True;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.tmeDurationMouseWheelUp(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
var
  step              : Cardinal;
  Duration          : Cardinal; //added later
  Node, NextSelNode : PVirtualNode; //added later
begin
  if FormatType = ftTime then
    step := TTimeMaskEdit(Sender).TimeStep else
    step := Round((1000 * TTimeMaskEdit(Sender).FramesStep)/GetFPS);
  if ssAlt in Shift then
    step := Round(step / 2);
  if ssCtrl in Shift then
    step := step * 10;

  Node := lstSubtitles.GetFirstSelected;
  while Assigned(Node) do
  begin
    NextSelNode := lstSubtitles.GetNextSelected(Node);
    Duration := GetFinalTime(Node) - GetStartTime(Node);
    ChangeDuration(Node, Duration + step, Assigned(NextSelNode), tmrTimesMouseWheelUndoBind.Enabled);
    Node := NextSelNode;
  end;
  tmrTimesMouseWheelUndoBind.Enabled := False;
  tmrTimesMouseWheelUndoBind.Enabled := True;

  if lstSubtitles.SelectedCount = 1 then //added later
  begin
    if Sender <> tmeDuration then TTimeMaskEdit(Sender).Time := GetFinalTime(lstSubtitles.GetFirstSelected) - GetStartTime(lstSubtitles.GetFirstSelected); //added later
    TTimeMaskEdit(Sender).SelStart := 7;
    TTimeMaskEdit(Sender).SelLength := 0;
  end;

  Handled := True;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.tmePauseMouseWheelDown(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
var
  step              : Cardinal;
  Pause             : Cardinal; //added later
  Node, NextSelNode : PVirtualNode; //added later
begin
  if FormatType = ftTime then
    step := TTimeMaskEdit(Sender).TimeStep else
    step := Round((1000 * TTimeMaskEdit(Sender).FramesStep)/GetFPS);
  if ssAlt in Shift then
    step := Round(step / 2);
  if ssCtrl in Shift then
    step := step * 10;

  Node := lstSubtitles.GetFirstSelected;
  while Assigned(Node) do
  begin
    NextSelNode := lstSubtitles.GetNextSelected(Node);
    Pause := GetStartTime(Node) - GetFinalTime(Node.PrevSibling);
    if Pause >= step then //avoid setting a negative pause
      ChangePause(Node, Pause - step, Assigned(NextSelNode), tmrTimesMouseWheelUndoBind.Enabled) else
      ChangePause(Node, 0, Assigned(NextSelNode), tmrTimesMouseWheelUndoBind.Enabled);
    Node := NextSelNode;
  end;
  tmrTimesMouseWheelUndoBind.Enabled := False;
  tmrTimesMouseWheelUndoBind.Enabled := True;

  if lstSubtitles.SelectedCount = 1 then //added later
  begin
    if Sender <> tmePause then TTimeMaskEdit(Sender).Time := GetPause(lstSubtitles.GetFirstSelected); //added later
    TTimeMaskEdit(Sender).SelStart := 7;
    TTimeMaskEdit(Sender).SelLength := 0;
  end;
  Handled := True;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.tmePauseMouseWheelUp(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
var
  step              : Cardinal;
  Pause             : Integer; //added later
  Node, NextSelNode : PVirtualNode; //added later
begin
  if FormatType = ftTime then
    step := TTimeMaskEdit(Sender).TimeStep else
    step := Round((1000 * TTimeMaskEdit(Sender).FramesStep)/GetFPS);
  if ssAlt in Shift then
    step := Round(step / 2);
  if ssCtrl in Shift then
    step := step * 10;

  Node := lstSubtitles.GetFirstSelected;
  while Assigned(Node) do
  begin
    NextSelNode := lstSubtitles.GetNextSelected(Node);
    Pause := GetStartTime(Node) - GetFinalTime(Node.PrevSibling);
    if Pause > 0 then
      ChangePause(Node, Pause + step, Assigned(NextSelNode), tmrTimesMouseWheelUndoBind.Enabled) else
      ChangePause(Node, step, Assigned(NextSelNode), tmrTimesMouseWheelUndoBind.Enabled);
    Node := NextSelNode;
  end;
  tmrTimesMouseWheelUndoBind.Enabled := False;
  tmrTimesMouseWheelUndoBind.Enabled := True;

  if lstSubtitles.SelectedCount = 1 then //added later
  begin
    if Sender <> tmePause then TTimeMaskEdit(Sender).Time := GetPause(lstSubtitles.GetFirstSelected); //added later
    TTimeMaskEdit(Sender).SelStart := 7;
    TTimeMaskEdit(Sender).SelLength := 0;
  end;
  Handled := True;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.lstSubtitlesMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin
  //added later: begin
  if PressedKeyInLstSubtitles in [1..3] then
  begin
    if WheelDelta > 0 then
    begin //WHEEL UP
      if PressedKeyInLstSubtitles = 1 then tmeShowMouseWheelUp(tmeShow, Shift, MousePos, Handled);
      if PressedKeyInLstSubtitles = 2 then tmeHideMouseWheelUp(tmeHide, Shift, MousePos, Handled);
      if PressedKeyInLstSubtitles = 3 then tmeDurationMouseWheelUp(tmeDuration, Shift, MousePos, Handled);
    end else
    begin //WHEEL DOWN
      if PressedKeyInLstSubtitles = 1 then tmeShowMouseWheelDown(tmeShow, Shift, MousePos, Handled);
      if PressedKeyInLstSubtitles = 2 then tmeHideMouseWheelDown(tmeHide, Shift, MousePos, Handled);
      if PressedKeyInLstSubtitles = 3 then tmeDurationMouseWheelDown(tmeDuration, Shift, MousePos, Handled);
    end;
    Handled := True; //don't scroll the list in these cases!
  end else
  if (ssLeft in Shift) and Assigned(lstSubtitles.FocusedNode) and (lstSubtitles.SelectedCount = 1) and (((MousePos.X = ClickPoint.X)and(MousePos.Y = ClickPoint.Y)) or (toDisableDrawSelection in lstSubtitles.TreeOptions.SelectionOptions)) then
  begin
    if WheelDelta > 0 then
    begin //WHEEL UP
      if lstSubtitles.FocusedColumn = 1 then tmeShowMouseWheelUp(tmeShow, Shift, MousePos, Handled);
      if lstSubtitles.FocusedColumn = 2 then tmeHideMouseWheelUp(tmeHide, Shift, MousePos, Handled);
      if lstSubtitles.FocusedColumn = 5 then tmeDurationMouseWheelUp(tmeDuration, Shift, MousePos, Handled);
      if lstSubtitles.FocusedColumn = 6 then tmePauseMouseWheelUp(tmePause, Shift, MousePos, Handled);
    end else
    begin //WHEEL DOWN
      if lstSubtitles.FocusedColumn = 1 then tmeShowMouseWheelDown(tmeShow, Shift, MousePos, Handled);
      if lstSubtitles.FocusedColumn = 2 then tmeHideMouseWheelDown(tmeHide, Shift, MousePos, Handled);
      if lstSubtitles.FocusedColumn = 5 then tmeDurationMouseWheelDown(tmeDuration, Shift, MousePos, Handled);
      if lstSubtitles.FocusedColumn = 6 then tmePauseMouseWheelDown(tmePause, Shift, MousePos, Handled);
    end;
  end else
  //added later: end
  if ssShift in Shift then
    if WheelDelta > 0 then
      tmeDurationMouseWheelUp(tmeDuration, Shift, MousePos, Handled) else
      tmeDurationMouseWheelDown(tmeDuration, Shift, MousePos, Handled);
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.RemoveNodeTags(Node: PVirtualNode; Translation: Boolean; BindUndoToNext: Boolean = False);
var
  UndoAction : PUndoAction;
  OldText    : String;
  NewText    : String;
  OldTrans   : String;
  NewTrans   : String;
begin
    New(UndoAction);
    UndoAction^.UndoActionType := uaFullTextChange;
    UndoAction^.UndoActionName := uanRemoveAllTags; //added by adenry
    UndoAction^.Node           := Node;
    UndoAction^.LineNumber     := Node.Index;
    UndoAction^.BufferSize     := SizeOf(TFullTextChange);
    UndoAction^.Buffer         := AllocMem(UndoAction^.BufferSize);
    UndoAction^.BindToNext     := BindUndoToNext;
    OldText := GetSubText(Node);
    PFullTextChange(UndoAction^.Buffer)^.OldText := OldText;

    if Translation = False then
    begin
      NewText := RemoveSWTags(OldText,True,True,True,True,True);
      PFullTextChange(UndoAction^.Buffer)^.OriginalOnly := True;
      SetText(Node, NewText);
    end else
    begin
      NewText := OldText;
      OldTrans := GetSubTranslation(Node);
      NewTrans := RemoveSWTags(OldTrans,True,True,True,True,True);

      PFullTextChange(UndoAction^.Buffer)^.OriginalOnly := False;
      PFullTextChange(UndoAction^.Buffer)^.OldTrans := OldTrans;
      SetTranslation(Node, NewTrans);
    end;

    AutoRecheckNodeErrors(Node, TextErrors); //added by adenry

    if (OldText <> NewText) or (OldTrans <> NewTrans) then
      AddUndo(UndoAction);
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.RemoveAllTags(mmo: TSWTextEdit); //TMemo changed to TSWTextEdit
var
  Node       : PVirtualNode;
  {OldText    : String;
  NewText    : String;
  OldTrans   : String;
  NewTrans   : String;
  UndoAction : PUndoAction;}
begin
  Node := lstSubtitles.GetFirstSelected;
  while Assigned(Node) do
  begin
    RemoveNodeTags(Node, mmo=mmoTranslation, Assigned(lstSubtitles.GetNextSelected(Node)));
    Node := lstSubtitles.GetNextSelected(Node);
    {
    New(UndoAction);
    UndoAction^.UndoActionType := uaFullTextChange;
    UndoAction^.UndoActionName := uanRemoveAllTags; //added by adenry
    UndoAction^.Node           := Node;
    UndoAction^.LineNumber     := Node.Index;
    UndoAction^.BufferSize     := SizeOf(TFullTextChange);
    UndoAction^.Buffer         := AllocMem(UndoAction^.BufferSize);
    OldText := GetSubText(Node);
    PFullTextChange(UndoAction^.Buffer)^.OldText := OldText;

    if mmo = mmoSubtitleText then
    begin
      NewText := RemoveSWTags(OldText,True,True,True,True,True);
      PFullTextChange(UndoAction^.Buffer)^.OriginalOnly := True;
      SetText(Node, NewText);
    end else
    begin
      NewText := OldText;
      OldTrans := GetSubTranslation(Node);
      NewTrans := RemoveSWTags(OldTrans,True,True,True,True,True);

      PFullTextChange(UndoAction^.Buffer)^.OriginalOnly := False;
      PFullTextChange(UndoAction^.Buffer)^.OldTrans := OldTrans;
      SetTranslation(Node, NewTrans);
    end;

    AutoRecheckNodeErrors(Node, TextErrors); //added by adenry
    Node := lstSubtitles.GetNextSelected(Node);
    UndoAction^.BindToNext := Assigned(Node);

    if (OldText <> NewText) or (OldTrans <> NewTrans) then
      AddUndo(UndoAction);
    }
  end;
  //added by adenry: begin
  //text style bar related stuf...
  if mmo = mmoSubtitleText then
  begin
    tbBold.Down := False;
    tbItalic.Down := False;
    tbUnderline.Down := False;
  end else
  begin
    tbBoldTrans.Down := False;
    tbItalicTrans.Down := False;
    tbUnderlineTrans.Down := False;
  end;
  //added by adenry: end

  lstSubtitles.Refresh;
  RefreshTimes;
end;
//added by adenry: end

// -----------------------------------------------------------------------------


//added by adenry: begin
procedure TfrmMain.mnuRemoveAllTagsClick(Sender: TObject);
begin
  if Sender = tbRemoveAllTags then
    RemoveAllTags(mmoSubtitleText) else
  if Sender = tbRemoveAllTagsTrans then
    RemoveAllTags(mmoTranslation) else
  if (lstSubtitles.FocusedColumn = 4) or (mmoTranslation.Focused) then
    RemoveAllTags(mmoTranslation) else
    RemoveAllTags(mmoSubtitleText);
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.lstSubtitlesAfterCellPaint(Sender: TBaseVirtualTree;
  TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex;
  CellRect: TRect);
var
  Data        : PSubtitleItem;
  Text, tmp   : String;
  SubText     : String;
  R           : TRect;
  GoodTime    : Integer;
  GoodFrames  : Integer;
  GoodChars   : Integer;
  CurCPS      : Integer;
  CurCPSDouble: Double; //added later
  CurPercent  : Integer;
begin
  //CPS HINT BOXES
  Data := Sender.GetNodeData(Node);
  if (Column=3) or (Column=4) then
    if ShowCPSHintBoxes or (AdvancedErrorMarking {and MarkErrorsInList} and (etTooMuchCPS in Data.ErrorType) and MarkCPSHintBox and (Column=3)) then
    begin
      if Column=3 then
        SubText := Data.Text else
        SubText := Data.Translation;
      //calculate current CPS
      if Data.FinalTime > Data.InitialTime then
      begin
        CurCPSDouble := GetSubCPS(Node);//(Length(ReplaceString(RemoveSWTags(SubText,True,True,True,True),#13#10,'')))/((Data.FinalTime-Data.InitialTime)/1000);
        CurCPS := Math.Ceil(CurCPSDouble);
      end else
      begin
        CurCPSDouble := -1.0;
        CurCPS := -1;
      end;

      //FORM THE HINT TEXT
      //characters
      Text := '';
      if MaxCharInCPSHintBox then
      begin
        GoodChars := Math.Floor( (TooMuchCPS*(Data.FinalTime-Data.InitialTime)/1000 ));
        if GoodChars < 0 then
          Text := '     ' + CharString else
          begin
            Text := IntToStr(GoodChars) + ' ' + CharString;
            if GoodChars < 10 then Text := '  ' + Text;
          end;
      end;
      //time/frames
      if MinTimeInCPSHintBox then
      begin
        GoodTime := Trunc(Math.SimpleRoundTo( (Length(ReplaceString(RemoveSWTags(SubText,True,True,True,True),#13#10,''))/TooMuchCPS), -3 )*1000);
        if Text <> '' then
          Text := ' / ' + Text;
        if FormatType = ftTime then
        begin
          tmp := IntToStr(GoodTime);
          while Length(tmp) < 4 do tmp := '0' + tmp;
          Insert(',', tmp, Length(tmp)-2);
          Text := tmp + ' ' + SecString + Text;
        end else
        begin
          GoodFrames := Math.Ceil((GoodTime*GetFPS)/1000);
          Text := IntToStr(GoodFrames) + ' ' + FrString + Text;
          if GoodFrames < 100 then Text := '  ' + Text;
          if GoodFrames < 10  then Text := '  ' + Text;
        end;
      end;
      //current CPS
      if CurCPSInCPSHintBox then
      begin
        if Text <> '' then
          Text := ' | ' + Text;
        if CurCPS < 0 then
          Text := '     ' + CPSString + Text else
          begin
            Text := IntToStr(CurCPS) + ' ' + CPSString + Text;
            if CurCPS < 10 then Text := '  ' + Text;
          end;
      end;
      //percentage
      if PercentageInCPSHintBox then
      begin
        if Text <> '' then
          Text := ' | ' + Text;
        if CurCPS < 0 then
          Text := '      %' + Text else
          begin
            //CurPercent := rnd((CurCPS*100)/TooMuchCPS){-100};
            CurPercent := Math.Ceil(100*(CurCPSDouble/TooMuchCPS)); //fixed later
            Text := IntToStr(CurPercent) + '%' + Text;
            if CurPercent < 100 then Text := '  ' + Text;
            if CurPercent < 10  then Text := '  ' + Text;
          end;
      end;
      //don't allow empty text
      if Text = '' then Text := '  ';

      //CALCULATE RECTANGLE
      R := Rect(0, 0, 0, 0);
      TargetCanvas.Font.Style := [];
      DrawText(TargetCanvas.Handle, PChar(Text), -1, R, DT_CALCRECT);
      R.Top := R.Top+Round((lstSubtitles.DefaultNodeHeight-R.Bottom)/2);
      R.Bottom := R.Bottom+Round((lstSubtitles.DefaultNodeHeight-R.Bottom)/2);
      R.Left := CellRect.Right-(R.Right-R.Left)-4;
      R.Right := CellRect.Right-4;

      //DRAW RECTANGLE AND TEXT
      //set colors
      if ((etTooMuchCPS in Data.ErrorType) and MarkCPSHintBox and (Column=3)) or ((Column=4)and(CurCPS>TooMuchCPS)) then
      begin
        TargetCanvas.Brush.Color := TooMuchCPSBckgr; //rectangle background color
        TargetCanvas.Font.Color := TooMuchCPSColor; //text color
      end else
      begin
        TargetCanvas.Brush.Color := NormalCPSBckgr; //rectangle background color
        TargetCanvas.Font.Color := NormalCPSColor; //text color
      end;
      TargetCanvas.Pen.Color := clBlack; //rectangle border color
      //draw
      TargetCanvas.Rectangle(R.Left-3,R.Top-1,R.Right+3,R.Bottom+1);
      DrawText(TargetCanvas.Handle, PChar(Text), -1, R, DT_CENTER);
    end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.mnuShowCPSHintBoxesClick(Sender: TObject);
begin
  ShowCPSHintBoxes := mnuShowCPSHintBoxes.Checked;
  lstSubtitles.Refresh;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.mnuShowNotesInLeftPanelClick(Sender: TObject);
begin
  lblNotes.Visible := mnuShowNotesInLeftPanel.Checked;
  mmoNotes.Visible := mnuShowNotesInLeftPanel.Checked;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.tmrPascalScriptRestoreCursorTimer(Sender: TObject);
begin
  Screen.Cursor := crDefault;
  tmrPascalScriptRestoreCursor.Enabled := False;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
//subtitle list columns context menu items click event handler
procedure TfrmMain.mnuColClick(Sender: TObject);
begin
  SetColumnVisibility(TMenuItem(Sender).Tag, TMenuItem(Sender).Checked);
end;

procedure TfrmMain.SetColumnVisibility(Col: Byte; Visible: Boolean);
begin
  if Visible then
    lstSubtitles.Header.Columns[Col].Options := lstSubtitles.Header.Columns[Col].Options + [coVisible] else
    lstSubtitles.Header.Columns[Col].Options := lstSubtitles.Header.Columns[Col].Options - [coVisible];
  case Col of
    0: begin mnuColNum.Checked := Visible; mnuColNumPopup.Checked := Visible; end;
    1: begin mnuColShow.Checked := Visible; mnuColShowPopup.Checked := Visible; end;
    2: begin mnuColHide.Checked := Visible; mnuColPausePopup.Checked := Visible; end;
    3: begin mnuColText.Checked := Visible; mnuColTextPopup.Checked := Visible; end;
    5: begin mnuColDuration.Checked := Visible; mnuColDurationPopup.Checked := Visible; end;
    6: begin mnuColPause.Checked := Visible; mnuColPausePopup.Checked := Visible; end;
  end;
  FormResize(nil);
end;

procedure TfrmMain.mnuColTranslationClick(Sender: TObject);
begin
  SetTranslatorMode(not mnuColTranslation.Checked);
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.mnuDeleteDotsAtBeginningClick(Sender: TObject);
var
  Node        : PVirtualNode;
  Text        : String;
  tempText    : String;
  UndoAction  : PUndoAction;
  DotPos      : Integer;
  MustAddUndo : Boolean; //added later
begin
  Node := lstSubtitles.GetFirst;
  while Assigned(Node) do
  begin
    Text := GetSubText(Node);

    New(UndoAction);
    UndoAction^.UndoActionType := uaFullTextChange;
    UndoAction^.UndoActionName := uanDelDotsAtBeginning; //added by adenry
    UndoAction^.BufferSize     := SizeOf(TFullTextChange);
    UndoAction^.Buffer         := AllocMem(UndoAction^.BufferSize);
    UndoAction^.Node           := Node;
    UndoAction^.LineNumber     := Node.Index;
    UndoAction^.BindToNext     := True;
    PFullTextChange(UndoAction^.Buffer)^.OriginalOnly := True;
    PFullTextChange(UndoAction^.Buffer)^.OldText := Text;

    MustAddUndo := False;

    //Remove dots at the begining of Text
    tempText := ReplaceString(RemoveSWTags(Text,True,True,True,True),' ','');
    if (Copy(tempText, 1, 2) = '..') or (Copy(tempText, 1, 3) = '-..') or
      ((OrgCharset in DashCharsets1)and(Copy(tempText, 1, 3) = #150'..')) or
      ((OrgCharset in DashCharsets1)and(Copy(tempText, 1, 3) = #151'..')) or
      ((OrgCharset in DashCharsets2)and(Copy(tempText, 1, 3) = #173'..')) then
    begin
      DotPos := Pos('.', Text);
      while (Copy(Text, DotPos, 1) = '.') or (Copy(Text, DotPos, 1) = ' ') do
        Delete(Text, DotPos, 1);

      SetText(Node, Text);

      MustAddUndo := True;
    end;

    //Remove dots at the begining of Translation
    if mnuTranslatorMode.Checked then
    begin
      Text := GetSubTranslation(Node);

      tempText := ReplaceString(RemoveSWTags(Text,True,True,True,True),' ','');
      if (Copy(tempText, 1, 2) = '..') or (Copy(tempText, 1, 3) = '-..') or
        ((OrgCharset in DashCharsets1)and(Copy(tempText, 1, 3) = #150'..')) or
        ((OrgCharset in DashCharsets1)and(Copy(tempText, 1, 3) = #151'..')) or
        ((OrgCharset in DashCharsets2)and(Copy(tempText, 1, 3) = #173'..')) then
      begin
        PFullTextChange(UndoAction^.Buffer)^.OriginalOnly := False;
        PFullTextChange(UndoAction^.Buffer)^.OldTrans     := Text;
        
        DotPos := Pos('.', Text);
        while (Copy(Text, DotPos, 1) = '.') or (Copy(Text, DotPos, 1) = ' ') do
          Delete(Text, DotPos, 1);

        SetTranslation(Node, Text);

        MustAddUndo := True;
      end;
    end;

    if MustAddUndo then
      AddUndo(UndoAction);

    Node := Node.NextSibling;
  end;

  if UndoList.Count > 0 then
    PUndoAction(UndoList.Last)^.BindToNext := False;
  //lstSubtitles.Refresh; //AutoRecheck***Errors refreshes it
  RefreshTimes;
  AutoRecheckAllErrors(TextErrors);
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.mnuSetPausesClick(Sender: TObject);
begin
  frmSetPauses := TfrmSetPauses.Create(Application);
  frmSetPauses.ShowModal;
  frmSetPauses.Free;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.mnuUnbreakSubtitlesClick(Sender: TObject);
begin
  frmUnbreakSubtitles := TfrmUnbreakSubtitles.Create(Application);
  frmUnbreakSubtitles.ShowModal;
  frmUnbreakSubtitles.Free;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.mnuSmartLineAdjustClick(Sender: TObject);
begin
  frmSmartLineAdjust := TfrmSmartLineAdjust.Create(Application);
  frmSmartLineAdjust.ShowModal;
  frmSmartLineAdjust.Free;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.mnuAutoCombineSubtitlesClick(Sender: TObject);
begin
  frmCombineSubtitles := TfrmCombineSubtitles.Create(Application);
  frmCombineSubtitles.ShowModal;
  frmCombineSubtitles.Free;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
//show/hide toolbar
procedure TfrmMain.mnuToolbarClick(Sender: TObject);
var
  dif: Byte;
begin
  dif := pnlControl.Left * 2;
  tbMainToolbar.Visible := mnuToolbar.Checked;
  if tbMainToolbar.Visible then
  begin
    pnlControl.Top := pnlControl.Top + dif;
    pnlControl.Height := pnlControl.Height - dif;
    pnlParent2.Top := pnlParent2.Top + dif;
    pnlParent2.Height := pnlParent2.Height - dif;
  end else
  begin
    pnlControl.Top := pnlControl.Top - dif;
    pnlControl.Height := pnlControl.Height + dif;
    pnlParent2.Top := pnlParent2.Top - dif;
    pnlParent2.Height := pnlParent2.Height + dif;
  end;
end;
//added by adenry: end 

// -----------------------------------------------------------------------------

//added by adenry: begin
//show/hide text style bars
procedure TfrmMain.mnuTextStyleBarsClick(Sender: TObject);
begin
  tbTextStyle.Visible   := mnuTextStyleBars.Checked;
  tbTransStyle.Visible  := mnuTextStyleBars.Checked and mnuTranslatorMode.Checked; //and mnuTranslatorMode.Checked added later
  lblText.Left          := mmoSubtitleText.Left + (Integer(tbTextStyle.Visible) * tbTextStyle.Width);
  lblTranslation.Left   := mmoTranslation.Left + (Integer(tbTransStyle.Visible) * tbTransStyle.Width);
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
//show/hide statusbar
procedure TfrmMain.mnuStatusbarClick(Sender: TObject);
var
  x: Integer;
begin
  sbStatusbar.Visible := mnuStatusbar.Checked;
  x := sbStatusbar.Height - pnlControl.Left;
  if sbStatusbar.Visible then
    x := -x;

  pnlControl.Height := pnlControl.Height + x;
  pnlParent2.Height := pnlParent2.Height + x;
  pnlEditingControls.Top := pnlEditingControls.Top + x;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
// TOOLBAR BUTTONS // MenuItem assignment calls the menus on mousedown, but I want them on mouseup
procedure TfrmMain.tbNewSubtitleMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  mnuNewSubtitleClick(mnuNewSubtitle);
end;

procedure TfrmMain.tbLoadSubtitleMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if tbLoadSubtitle.Tag = 0 then
    mnuLoadSubtitleClick(mnuLoadSubtitle) else
    tbLoadSubtitle.Tag := 0;
end;

procedure TfrmMain.tbSaveFileMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  mnuSaveFileClick(mnuSaveFile);
end;

procedure TfrmMain.tbUndoMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if tbUndo.Tag = 0 then //for proper button behaviour! Don't perform click if we are just hiding the dropdown!
    mnuUndoClick(mnuUndo) else
    tbUndo.Tag := 0;
end;

procedure TfrmMain.tbRedoMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if tbRedo.Tag = 0 then //for proper button behaviour! Don't perform click if we are just hiding the dropdown!
    mnuRedoClick(mnuRedo) else
    tbRedo.Tag := 0;
end;

procedure TfrmMain.tbCutMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  //tbCut.Tag := 1; //so that Cut and Copy buttons would not be disabled during the Cut!
  mnuCutClick(mnuCut);
  //tbCut.Tag := 0;
  tbPaste.Enabled := (ClipBoard.HasFormat(CF_TEXT));// and (InterfaceEnabled);
  RefreshTimes;
end;

procedure TfrmMain.tbCopyMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  mnuCopyClick(mnuCopy);
  tbPaste.Enabled := (ClipBoard.HasFormat(CF_TEXT));// and (InterfaceEnabled);
end;

procedure TfrmMain.tbPasteMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  //tbCut.Tag := 1; //so that Cut and Copy buttons would not be disabled during the Paste!
  mnuPasteClick(mnuPaste);
  //tbCut.Tag := 0;
  RefreshTimes;
end;

procedure TfrmMain.tbSearchMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  mnuSubSearchClick(mnuSubSearch);
end;

procedure TfrmMain.tbSettingsMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  mnuSubSettingsClick(mnuSubSettings);
end;

procedure TfrmMain.tbPascalScriptsMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  mnuPascalScriptClick(mnuPascalScripts);
end;

procedure TfrmMain.tbTranslatorModeMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  mnuTranslatorModeClick(mnuTranslatorMode);
end;

procedure TfrmMain.tbInfoErrorsMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if not Assigned(frmInfoErrors) then
    frmInfoErrors := TfrmInfoErrors.Create(Application);
  if frmInfoErrors.Visible then
    frmInfoErrors.Close else
    frmInfoErrors.Show;
end;
procedure TfrmMain.tbVariousInfoMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if not Assigned(frmVariousInfo) then
    frmVariousInfo := TfrmVariousInfo.Create(Application);
  if frmVariousInfo.Visible then
    frmVariousInfo.Close else
    frmVariousInfo.Show;
end;

procedure TfrmMain.tbInfoErrorsSettingsMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  mnuInfoErrorsSettingsClick(mnuInfoErrorsSettings);
end;

procedure TfrmMain.tbVideoPreviewModeMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  mnuVideoPreviewModeClick(mnuVideoPreviewMode);
end;

procedure TfrmMain.tbSpellCheckMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbRight then
    SpellCheck($00000409) else //US English
    SpellCheck; //Default
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
//refresh menus .Enabled state when the tbTimings, tbTexts and tbSubtitles buttons are clicked
procedure TfrmMain.tbTimingsTextsSubtitlesMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  mnuEditClick(mnuEdit);
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.setUndoEnabled(Enabled: Boolean);
begin
  mnuUndo.Enabled := Enabled;
  tbUndo.Enabled  := Enabled;
  //added by adenry: if there are no more Undo actions, then the files are unmodified
  //if Enabled = False then
  //begin //on FormCreate, LoadSubtitle, CloseSub, MyEnableWorkArea (pascal script), and UndoActionSet (when no more undo actions are available)
  //  OrgModified := False;
  //  TransModified := False;
  //end;
end;

procedure TfrmMain.setRedoEnabled(Enabled: Boolean);
begin
  mnuRedo.Enabled := Enabled;
  tbRedo.Enabled  := Enabled;

  //added later:
  //We are clearing the Redo list. If we passed the UNDO action to return the file to unmodified status, we can never set it as unmodified again (until next file save of course).
  if Enabled = False then
  begin
    if UndoList.Count < UndoNumWhenOrgSaved then UndoNumWhenOrgSaved := -1;
    if UndoList.Count < UndoNumWhenTransSaved then UndoNumWhenTransSaved := -1;
  end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
function TfrmMain.GetUndoActionNameString(UndoActionName: TUndoActionName): String;
begin
  Result := '?';
    case UndoActionName of
      //Base subtitle edit
			uanTextEdit: Result := lstSubtitles.Header.Columns[3].CaptionText;
      uanTransEdit: Result := lstSubtitles.Header.Columns[4].CaptionText;
      uanShowEdit: Result := lstSubtitles.Header.Columns[1].CaptionText;
      uanHideEdit: Result := lstSubtitles.Header.Columns[2].CaptionText;
      uanPauseEdit: Result := lstSubtitles.Header.Columns[6].CaptionText;
      uanDurEdit: Result := lstSubtitles.Header.Columns[5].CaptionText;
      //FPS edit
      uanInputFPSEdit: Result := ReplaceString(lblInputFPS.Caption, ':', '');
      uanFPSEdit: Result := ReplaceString(lblFPS.Caption, ':', '');
      //Text style edit
      uanItalic: Result := mnuItalicPopup.Caption;
      uanBold: Result := mnuBoldPopup.Caption;
      uanUnderline: Result := mnuUnderlinePopup.Caption;
      uanColor: Result := mnuSetColorPopup.Caption;
      uanRemoveColor: Result := mnuRemoveColorTagsPopup.Caption;
      uanRemoveAllTags: Result := mnuRemoveAllTagsPopup.Caption;
      //Edit menu
      uanInsert: Result := mnuInsertSubtitle.Caption;
      uanInsertBefore: Result := mnuInsertBefore.Caption;
      uanRemoveSelected: Result := mnuRemoveSelected.Caption;
      uanCut: Result := mnuCut.Caption;
      uanPaste: Result := mnuPaste.Caption;
      uanSwap: Result := mnuSwap.Caption;
      //Edit menu -> Timings
      uanSetDurLimits: Result := mnuSetDurationLimits.Caption;
      uanSetDelay: Result := mnuSetDelay.Caption;
      uanAdjustSubs: Result := mnuAdjustSubtitles.Caption;
      uanAdjustToSynchSubs: Result := mnuAdjustToSyncSubs.Caption;
      uanTimeExpRed: Result := mnuTimeExpanderReducer.Caption;
      uanExtLen: Result := mnuExtendLength.Caption;
      uanExtLen2: Result := mnuExtendLength2.Caption;
      uanAutoDur: Result := mnuAutomaticDurations.Caption;
      uanReadTimeFromFile: Result := mnuReadTimesFromFile.Caption;
      uanSetPauses: Result := mnuSetPauses.Caption;
      uanRoundTimeValues : Result := mnuRoundTimeValues.Caption;
      uanShiftPlus: Result := mnuShiftPlusMS.Caption;
      uanShiftMinus: Result := mnuShiftLessMS.Caption;
      uanShiftToNext: Result := mnuShiftToNext.Caption; //added later
      uanShiftToPrev: Result := mnuShiftToPrevious.Caption; //added later
      //Edit menu -> Texts
      uanSmartLineAdjust: Result := mnuSmartLineAdjust.Caption;
      uanFastSmartLineAdj: Result := mnuFastSmartLineAdjust.Caption;
      uanConvertCase: Result := mnuConvertCase.Caption;
      uanUnbreakSubs: Result := mnuUnbreakSubtitles.Caption;
      uanFastUnbreakSubs: Result := mnuFastUnbreakSubtitles.Caption;
      uanDivideLines: Result := mnuDivideLines.Caption;
      uanFastDivideLines: Result := mnuFastDivideLines.Caption;
      uanSetMaxLineLength: Result := mnuSetMaxLineLength.Caption;
      uanReadTextsFromFile: Result := mnuReadTextsFromFile.Caption;
      //Edit menu -> Subtitles
      uanAutoCombineSubs: Result := mnuAutoCombineSubtitles.Caption;
      uanCombineSubs: Result := mnuCombineSubtitles.Caption;
      uanTypeEffect: Result := mnuTypeEffect.Caption;
      uanFlashEffect: Result := mnuFlash.Caption;
      uanRTLReverseText: Result := mnuReverseText.Caption;
      uanRTLFixPunctuation: Result := mnuFixPunctuation.Caption;
      uanSort: Result := mnuSort.Caption;
      uanDelUnnecessaryLinks: Result := mnuDeleteUnnecessaryLinks.Caption;
      uanDelDotsAtBeginning: Result := mnuDeleteDotsAtBeginning.Caption;
      uanMark: Result := mnuMarkSelectedSubs.Caption;
      uanUnmark: Result := mnuUnMarkSelectedSubs.Caption;
      //Search menu & Tools menu
      uanSearchAndReplace: Result := mnuSearchAndReplace.Caption;
      uanSpellCheck: Result := mnuSpellCheck.Caption;
      uanInfoErrorsFix: Result := mnuFixAllErrors.Caption;
      uanFixAllErrors: Result := mnuFixAllErrors.Caption;
      uanFixErrorsSelSubs: Result := mnuFixErrorsInSelSubs.Caption;
      uaPascalScript: Result := mnuPascalScripts.Caption;
      //Movie menu
      uanMovieMoveSubtitle: Result := mnuMoveSubtitle.Caption;
      uanMovieSetStartTime: Result := mnuSetShowTime.Caption;
      uanMovieSetFinalTime: Result := mnuSetHideTime.Caption;
      uanMovieStartEndSubTime: Result := mnuEndSubtitle.Caption;
      uanAdjustSubsSyncPoints: Result := mnuLastSyncPoint.Caption;
    end;
  Result := StripHotKey(Result);
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
//Undo dropdown menu item click event handle
procedure TfrmMain.mnuUndoDropdownItemClick(Sender: TObject);
var
  i: Byte;
begin
  for i := 1 to mnuUndoDropdown.Items.IndexOf(Sender as TMenuItem) + 1 do
    mnuUndoClick(mnuUndo);
end;

//Redo dropdown menu item click event handle
procedure TfrmMain.mnuRedoDropdownItemClick(Sender: TObject);
var
  i: Byte;
begin
  for i := 1 to mnuRedoDropdown.Items.IndexOf(Sender as TMenuItem) + 1 do
    mnuRedoClick(mnuRedo);
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
//Creates the list of the last undo actions that show when the arrow next to the Undo toolbar button is pressed
procedure TfrmMain.mnuUndoDropdownPopup(Sender: TObject);
var
  i: Byte;
  j: Integer;
  TMI: TMenuItem;
  UndoAction: PUndoAction;
begin
  tbUndo.Tag := 1; //for proper button behaviour! Next MouseUp on the button should not click it, just hide the dropdown!
  mnuUndoDropdown.Items.Clear;
  j := 1;
  i := 1;
  UndoAction := UndoList.Last; //Just so that the compiler does not complain :)
  while i <= UndoRedoDropDownItems do
  begin
    while True do
    begin
      if j > UndoList.Count then
      begin
        if MiMenu.Activo then MiMenu.Activo := True; //refresh the XP style
        exit;
      end;
      UndoAction := UndoList.Items[UndoList.Count - j];
      j := j + 1;
      if UndoAction^.BindToNext = False then break;
    end;
    TMI := TMenuItem.Create(Self);
    TMI.Caption := GetUndoActionNameString(UndoAction^.UndoActionName);
    TMI.OnClick := mnuUndoDropdownItemClick;
    mnuUndoDropdown.Items.Add(TMI);
    i := i + 1;
  end;
  if MiMenu.Activo then MiMenu.Activo := True; //refresh the XP style
end;

//Creates the list of the last redo actions that show when the arrow next to the Redo toolbar button is pressed
procedure TfrmMain.mnuRedoDropdownPopup(Sender: TObject);
var
  i: Byte;
  j: Integer;
  TMI: TMenuItem;
  UndoAction: PUndoAction;
begin
  tbRedo.Tag := 1; //for proper button behaviour! Next MouseUp on the button should not click it, just hide the dropdown!
  mnuRedoDropdown.Items.Clear;
  j := 1;
  i := 1;
  UndoAction := RedoList.Last; //Just so that the compiler does not complain :)
  while i <= UndoRedoDropDownItems do
  begin
    while True do
    begin
      if j > RedoList.Count then
      begin
        if MiMenu.Activo then
          MiMenu.Activo := True;
        exit;
      end;
      UndoAction := RedoList.Items[RedoList.Count - j];
      j := j + 1;
      if UndoAction^.BindToNext = False then break;
    end;
    TMI := TMenuItem.Create(Self);
    TMI.Caption := GetUndoActionNameString(UndoAction^.UndoActionName);
    TMI.OnClick := mnuRedoDropdownItemClick;
    mnuRedoDropdown.Items.Add(TMI);
    i := i + 1;
  end;
  if MiMenu.Activo then MiMenu.Activo := True; //refresh the XP style
end;

procedure TfrmMain.mnuRecentDropdownPopup(Sender: TObject);
begin
  tbLoadSubtitle.Tag := 1;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
//for proper button behaviour!
procedure TfrmMain.tbUndoMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  tbUndo.Tag := 0;
end;

procedure TfrmMain.tbRedoMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  tbRedo.Tag := 0;
end;

procedure TfrmMain.tbLoadSubtitleMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  tbLoadSubtitle.Tag := 0;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.MiHintShowHint(var HintStr: String; var CanShow: Boolean; var HintInfo: THintInfo);
var
  UndoAction: PUndoAction;
begin
  if (TToolButton(HintInfo.HintControl) = tbUndo) and (UndoList.Count > 0) then
  begin
    UndoAction := UndoList.Last;
    if Assigned(UndoAction) then
      HintStr := HintStr + ' (' + GetUndoActionNameString(UndoAction^.UndoActionName) + ')';
  end;
  if (TToolButton(HintInfo.HintControl) = tbRedo) and (RedoList.Count > 0) then
  begin
    UndoAction := RedoList.Last;
    if Assigned(UndoAction) then
      HintStr := HintStr + ' (' + GetUndoActionNameString(UndoAction^.UndoActionName) + ')';
  end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.mnuInvertSelectionClick(Sender: TObject);
var
  Node : PVirtualNode;
begin
  Node := lstSubtitles.GetFirst;
  while Assigned(Node) do
  begin
    lstSubtitles.Selected[Node] := not lstSubtitles.Selected[Node];
    Node := Node.NextSibling;
  end;
  RefreshTimes; //added by adenry later //was RefreshStatusbar before
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.SetNodeTag(Node: PVirtualNode; tag, closeTag: String; Translation: Boolean; UndoName: TUndoActionName = uanTextEdit; BindUndoToNext: Boolean = False; ForceSet: Boolean = False);
var
  UndoAction: PUndoAction;
  OriginalText: String;
begin
  if tag = '<b>' then UndoName := uanBold else
  if tag = '<i>' then UndoName := uanItalic else
  if tag = '<u>' then UndoName := uanUnderline else
  if Pos('<c:#', tag)>0 then UndoName := uanColor else
  if Translation and (UndoName = uanTextEdit) then UndoName := uanTransEdit;

  New(UndoAction);
  UndoAction^.UndoActionType := uaFullTextChange;
  UndoAction^.UndoActionName := UndoName;
  UndoAction^.BufferSize     := SizeOf(TFullTextChange);
  UndoAction^.Buffer         := AllocMem(UndoAction^.BufferSize);
  UndoAction^.Node           := Node;
  UndoAction^.LineNumber     := UndoAction^.Node.Index;
  UndoAction^.BindToNext     := BindUndoToNext;
  if Translation = False then
  begin
    Text := GetSubText(Node);
    PFullTextChange(UndoAction^.Buffer)^.OldText := Text;
    PFullTextChange(UndoAction^.Buffer)^.OriginalOnly := True;
  end else
  begin
    Text := GetSubTranslation(Node);
    PFullTextChange(UndoAction^.Buffer)^.OldText := GetSubText(Node);
    PFullTextChange(UndoAction^.Buffer)^.OriginalOnly := False;
    PFullTextChange(UndoAction^.Buffer)^.OldTrans := Text;
  end;
  AddUndo(UndoAction);

  OriginalText := Text;
  Text := RemoveSWTags(Text, tag = '<b>', tag = '<i>', tag = '<u>', Pos('<c:#', tag)>0, True);
  if (TextHasFullTag(OriginalText, tag = '<b>', tag = '<i>', tag = '<u>', Pos('<c:#', tag)>0) = False) or ForceSet then
  begin
    Text := tag + Text;
    if SubtitleApi.MultiTagsMode then
      Text := Text + closeTag;
  end;
  if Translation = False then
    SetText(Node, Text) else
    SetTranslation(Node, Text);

  AutoRecheckNodeErrors(Node, TextErrors);
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.SetBoldItalicUnderline(Sender: TObject; mmo: TSWTextEdit); //TMemo changed to TSWTextEdit
var
  tag, closeTag: String;
  tbButton: TToolButton;
  Node: PVirtualNode;
  UndoAction: PUndoAction;
  Text, TextEnd: String;
  UndoName : TUndoActionName;
  insertTag, insertCloseTag: Boolean;
  tagPos, closeTagPos: Integer;
begin
  if lstSubtitles.SelectedCount > 0 then
  begin
    tbButton := TToolButton(Sender);
    UndoName := uanBold; //initialize to avoid compiler warning
    if (tbButton = tbBold) or (tbButton = tbBoldTrans) then
    begin
      tag := '<b>';
      closeTag := '</b>';
      UndoName := uanBold;
    end else
    if (tbButton = tbItalic) or (tbButton = tbItalicTrans) then
    begin
      tag := '<i>';
      closeTag := '</i>';
      UndoName := uanItalic;
    end else
    if (tbButton = tbUnderline) or (tbButton = tbUnderlineTrans) then
    begin
      tag := '<u>';
      closeTag := '</u>';
      UndoName := uanUnderline;
    end;

    if SubtitleApi.MultiTagsMode and (lstSubtitles.SelectedCount = 1) and (mmo.SelLength > 0) then
    //multiple tags allowed, only one subtitle selected, and selection length in the memo > 0
    begin
      Node := lstSubtitles.GetFirstSelected;
      Text := GetSWTextEditText(mmo);
      if mmo.SelStart + mmo.SelLength > Length(Text) then mmo.SelLength := Length(Text) - mmo.SelStart; //added later - fix RichEdit selection
      //remove trailing new lines from selection:
      TextEnd := Copy(Text, mmo.SelLength-1, 2);
      while TextEnd = #13#10 do
      begin
        mmo.SelLength := mmo.SelLength - 2;
        TextEnd := Copy(Text, mmo.SelLength-1, 2);
      end;

      New(UndoAction);
      UndoAction^.UndoActionType := uaFullTextChange;
      UndoAction^.UndoActionName := UndoName;
      UndoAction^.BufferSize     := SizeOf(TFullTextChange);
      UndoAction^.Buffer         := AllocMem(UndoAction^.BufferSize);
      UndoAction^.Node           := Node;
      UndoAction^.LineNumber     := UndoAction^.Node.Index;
      UndoAction^.BindToNext     := False;
      if mmo = mmoSubtitleText then
      begin
        PFullTextChange(UndoAction^.Buffer)^.OldText := Text;
        PFullTextChange(UndoAction^.Buffer)^.OriginalOnly := True;
      end else
      begin
        PFullTextChange(UndoAction^.Buffer)^.OriginalOnly := False;
        PFullTextChange(UndoAction^.Buffer)^.OldTrans := Text;
      end;
      AddUndo(UndoAction);

      if tbButton.Down then
      //make bold/italic/underline
      begin
        //check tags before selection
        if mmo.SelStart > 0 then
        begin
          tagPos := SmartPos(tag, Text, False, mmo.SelStart, False);
          closeTagPos := SmartPos(closeTag, Text, False, mmo.SelStart, False);
        end else
        begin
          tagPos := 0;
          closeTagPos := 0;
        end;
        if (tagPos > 0) and ((tagPos>closeTagPos) or (closeTagPos=0)) then
          insertTag := False else
          insertTag := True;
        //check tags after selection
        tagPos := SmartPos(tag, Text, False, mmo.SelStart+mmo.SelLength+2-Length(closeTag));
        closeTagPos := SmartPos(closeTag, Text, False, mmo.SelStart+mmo.SelLength+2-Length(closeTag));
        if (closeTagPos > 0) and ((closeTagPos<tagPos) or (tagPos=0)) then
          insertCloseTag := False else
          insertCloseTag := True;

        //insert close tag
        if insertCloseTag then Insert(closeTag, Text, mmo.SelStart + mmo.SelLength + 1);
        //delete all tags of the same type inside the selection
        Delete(Text, mmo.SelStart+1, mmo.SelLength);
        Insert(RemoveSWTags(mmo.SelText, tag = '<b>', tag = '<i>', tag = '<u>', False, True), Text, mmo.SelStart+1);
        //insert open tag
        if insertTag then Insert(tag, Text, mmo.SelStart + 1);
      end else

      //make not bold/italic/underline
      begin
        //removed later
        {closeTagPos := SmartPos(closeTag, Text, False, mmo.SelStart+mmo.SelLength+1);
        if closeTagPos = mmo.SelStart+mmo.SelLength+1 then
          Delete(Text, mmo.SelStart+mmo.SelLength+1, Length(closeTag)) else}
          Insert(tag, Text, mmo.SelStart+mmo.SelLength+1);
        //removed later
        {tagPos := SmartPos(tag, Text, False, mmo.SelStart, False);
        if tagPos = mmo.SelStart+1-Length(tag) then
          Delete(Text, mmo.SelStart+1-Length(tag), Length(tag)) else}
          Insert(closeTag, Text, mmo.SelStart+1);
      end;
      Text := RemoveUnnecessaryTags(Text); //added later

      if mmo = mmoSubtitleText then
        SetText(Node, Text) else
        SetTranslation(Node, Text);
      AutoRecheckNodeErrorsAndRepaint(Node, TextErrors);
    end else

    //multiple tags NOT allowed, or more than 1 sub selected, or length of selection in memo = 0
    begin
      Node := lstSubtitles.GetFirstSelected;
      while Assigned(Node) do
      begin
        SetNodeTag(Node, tag, closeTag, mmo=mmoTranslation, UndoName, Assigned(lstSubtitles.GetNextSelected(Node)), tbButton.Down);
        {
        New(UndoAction);
        UndoAction^.UndoActionType := uaFullTextChange;
        UndoAction^.UndoActionName := UndoName;
        UndoAction^.BufferSize     := SizeOf(TFullTextChange);
        UndoAction^.Buffer         := AllocMem(UndoAction^.BufferSize);
        UndoAction^.Node           := Node;
        UndoAction^.LineNumber     := UndoAction^.Node.Index;
        UndoAction^.BindToNext     := Assigned(lstSubtitles.GetNextSelected(Node));
        if mmo = mmoSubtitleText then
        begin
          Text := GetSubText(Node);
          PFullTextChange(UndoAction^.Buffer)^.OldText := Text;
          PFullTextChange(UndoAction^.Buffer)^.OriginalOnly := True;
        end else
        begin
          Text := GetSubTranslation(Node);
          PFullTextChange(UndoAction^.Buffer)^.OldText := GetSubText(Node);
          PFullTextChange(UndoAction^.Buffer)^.OriginalOnly := False;
          PFullTextChange(UndoAction^.Buffer)^.OldTrans := Text;
        end;
        AddUndo(UndoAction);

        Text := RemoveSWTags(Text, tag = '<b>', tag = '<i>', tag = '<u>', False, True);
        if tbButton.Down then
        begin
          Text := tag + Text;
          if SubtitleApi.MultiTagsMode then
            Text := Text + closeTag;
        end;
        if mmo = mmoSubtitleText then
          SetText(Node, Text) else
          SetTranslation(Node, Text);

        AutoRecheckNodeErrors(Node, TextErrors);
        }
        Node := lstSubtitles.GetNextSelected(Node);
      end;
      lstSubtitles.Refresh;
    end;
    RefreshTimes;
  end;
end;

procedure TfrmMain.tbBoldItalicUnderlineMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  SetBoldItalicUnderline(Sender, mmoSubtitleText);
end;

procedure TfrmMain.tbBoldItalicUnderlineTransMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  SetBoldItalicUnderline(Sender, mmoTranslation);
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.tbSetColorMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  SetColor(True, False, False, True);
end;

procedure TfrmMain.tbRemoveAllTagsMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  mnuRemoveAllTagsClick(tbRemoveAllTags);
end;

procedure TfrmMain.tbSetColorTransMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  SetColor(False, True, False, True);
end;

procedure TfrmMain.tbRemoveAllTagsTransMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  mnuRemoveAllTagsClick(tbRemoveAllTagsTrans);
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
//these refresh the tags buttons .DOWN property depending on where the cursor is currently
procedure TfrmMain.RefreshTagButtonState(openTag, closeTag: String; tb: TToolButton; mmo: TSWTextEdit); //TMemo changed to TSWTextEdit
var
  posOpenTag, posCloseTag: Integer;
  posOpenTag2, posCloseTag2: Integer;
  tagInSelText: Boolean;
begin
  if mmo.SelLength = 0 then
  begin
    posOpenTag := SmartPos(openTag, mmo.Text, False, mmo.SelStart, False);
    posCloseTag := SmartPos(closeTag, mmo.Text, False, mmo.SelStart, False);
    if (posOpenTag > 0) and (posOpenTag > posCloseTag) then
      tb.Down := True else
      tb.Down := False;
  end else
  begin
    posOpenTag := SmartPos(openTag, mmo.Text, False, mmo.SelStart + 1, False);
    posCloseTag := SmartPos(closeTag, mmo.Text, False, mmo.SelStart + 1, False);
    posCloseTag2 := SmartPos(closeTag, mmo.Text, False, mmo.SelStart + mmo.SelLength);
    posOpenTag2 := SmartPos(openTag, mmo.Text, False, mmo.SelStart + mmo.SelLength);
    tagInSelText := (SmartPos(closeTag, mmo.SelText, False) > 0) or (SmartPos(openTag, mmo.SelText, False) > 0);
    if (posOpenTag > posCloseTag) and ((posCloseTag2 < posOpenTag2) or (posOpenTag2 = 0)) and not tagInSelText then
      tb.Down := True else
      tb.Down := False;
  end;
end;

procedure TfrmMain.mmoSubTextMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  RefreshTagButtonState('<b>', '</b>', tbBold, mmoSubtitleText);
  RefreshTagButtonState('<i>', '</i>', tbItalic, mmoSubtitleText);
  RefreshTagButtonState('<u>', '</u>', tbUnderline, mmoSubtitleText);
  if (GetCursor <> Screen.Cursors[crDefault]) then SetCursor(Screen.Cursors[crIBeam]);
end;

procedure TfrmMain.mmoSubTextKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  RefreshTagButtonState('<b>', '</b>', tbBold, mmoSubtitleText);
  RefreshTagButtonState('<i>', '</i>', tbItalic, mmoSubtitleText);
  RefreshTagButtonState('<u>', '</u>', tbUnderline, mmoSubtitleText);
end;

procedure TfrmMain.mmoTransMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  RefreshTagButtonState('<b>', '</b>', tbBoldTrans, mmoTranslation);
  RefreshTagButtonState('<i>', '</i>', tbItalicTrans, mmoTranslation);
  RefreshTagButtonState('<u>', '</u>', tbUnderlineTrans, mmoTranslation);
  if (GetCursor <> Screen.Cursors[crDefault]) then SetCursor(Screen.Cursors[crIBeam]);
end;

procedure TfrmMain.mmoTransKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  RefreshTagButtonState('<b>', '</b>', tbBoldTrans, mmoTranslation);
  RefreshTagButtonState('<i>', '</i>', tbItalicTrans, mmoTranslation);
  RefreshTagButtonState('<u>', '</u>', tbUnderlineTrans, mmoTranslation);
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
//disable TRichEdit's selection bar
procedure TfrmMain.reMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  if TSWTextEdit.ClassName = TRichEdit.ClassName then
    if (GetCursor <> Screen.Cursors[crDefault]) and
       (GetCursor <> Screen.Cursors[crIBeam]) then
    begin
      SetCursor(Screen.Cursors[crIBeam]);
      CursorOverSelBar := True;
    end else
      CursorOverSelBar := False;
end;

procedure TfrmMain.reMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  p: Integer;
  Text: String;
begin
  if TSWTextEdit.ClassName = TRichEdit.ClassName then
    if CursorOverSelBar then
      if DblCklickOverSelBar then
        DblCklickOverSelBar := False else
      begin
        SetCursor(Screen.Cursors[crIBeam]);
        Text := TSWTextEdit(Sender).SelText;
        p := Pos(#13#10, Text);
        if (p = 0) or (p = Length(Text)-1) then
          TSWTextEdit(Sender).SelLength := 0;
      end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
//modify the double click selection - deselect special characters and tags
procedure TfrmMain.mmoDblClick(Sender: TObject);
var
  len: Integer;
  mmo: TSWTextEdit; //TMemo changed to TSWTextEdit
begin
  mmo := TSWTextEdit(Sender); //TMemo changed to TSWTextEdit
  //double click over TRichEdit's selection bar
  if CursorOverSelBar then
  begin
    SetCursor(Screen.Cursors[crIBeam]);
    DblCklickOverSelBar := True;
  end else
  //regular double click
  if mmo.SelLength > 0 then
  begin
    while (mmo.SelText[1] in SpecialChars) or (isTagPart(mmo.Text, mmo.SelStart+1)) do
    begin
      len := mmo.SelLength;
      mmo.SelStart := mmo.SelStart + 1;
      mmo.SelLength := len - 1;
      if mmo.SelLength = 0 then
        exit;
    end;
    while (mmo.SelText[mmo.SelLength] in SpecialChars) or (isTagPart(mmo.Text, mmo.SelStart+mmo.SelLength)) do
    begin
      mmo.SelLength := mmo.SelLength - 1;
      if mmo.SelLength = 0 then
        exit;
    end;
  end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.RefreshBIUButtons;
var
  Node : PVirtualNode; //added by adenry
  //str: String;
begin
  if lstSubtitles.SelectedCount > 0 then
  begin
    tbBold.Enabled          := True;
    tbItalic.Enabled        := True;
    tbUnderline.Enabled     := True;
    tbSetColor.Enabled      := True;
    tbRemoveAllTags.Enabled := True;

    if (not mmoSubtitleText.Focused)
    //and (not mmoTranslation.Focused) //removed later
    then
    begin
      //check all selected texts for tags
      tbBold.Down := True;
      tbItalic.Down := True;
      tbUnderline.Down := True;
      Node := lstSubtitles.GetFirstSelected;
      while Assigned(Node) do
      begin
        if TextHasFullTag(GetSubText(Node), True, False, False, False) = False then tbBold.Down := False;
        //str := RemoveSWTags(GetSubText(Node), False, True, True, True, True);
        //if (SmartPos('<b>', str, False) <> 1) or ((SmartPos('</b>', str, False) > 0)and(SmartPos('</b>', str, False) < Length(str)-3)) then tbBold.Down := False;
        if TextHasFullTag(GetSubText(Node), False, True, False, False) = False then tbItalic.Down := False;
        //str := RemoveSWTags(GetSubText(Node), True, False, True, True, True);
        //if (SmartPos('<i>', str, False) <> 1) or ((SmartPos('</i>', str, False) > 0)and(SmartPos('</i>', str, False) < Length(str)-3)) then tbItalic.Down := False;
        if TextHasFullTag(GetSubText(Node), False, False, True, False) = False then tbUnderline.Down := False;
        //str := RemoveSWTags(GetSubText(Node), True, True, False, True, True);
        //if (SmartPos('<u>', str, False) <> 1) or ((SmartPos('</u>', str, False) > 0)and(SmartPos('</u>', str, False) < Length(str)-3)) then tbUnderline.Down := False;
        if (tbBold.Down = False) and (tbItalic.Down = False) and (tbUnderline.Down = False) then break;
        Node := lstSubtitles.GetNextSelected(Node);
      end;
    end;

    if mnuTranslatorMode.Checked then
    begin
      tbBoldTrans.Enabled          := True;
      tbItalicTrans.Enabled        := True;
      tbUnderlineTrans.Enabled     := True;
      tbSetColorTrans.Enabled      := True;
      tbRemoveAllTagsTrans.Enabled := True;

      if (not mmoTranslation.Focused)
      //and (not mmoSubtitleText.Focused) //removed later
      then
      begin
        //check all selected translations for tags
        tbBoldTrans.Down := True;
        tbItalicTrans.Down := True;
        tbUnderlineTrans.Down := True;
        Node := lstSubtitles.GetFirstSelected;
        while Assigned(Node) do
        begin
          if TextHasFullTag(GetSubTranslation(Node), True, False, False, False) = False then tbBoldTrans.Down := False;
          //str := RemoveSWTags(GetSubTranslation(Node), False, True, True, True, True);
          //if (SmartPos('<b>', str, False) <> 1) or ((SmartPos('</b>', str, False) > 0)and(SmartPos('</b>', str, False) < Length(str)-3)) then tbBoldTrans.Down := False;
          if TextHasFullTag(GetSubTranslation(Node), False, True, False, False) = False then tbItalicTrans.Down := False;
          //str := RemoveSWTags(GetSubTranslation(Node), True, False, True, True, True);
          //if (SmartPos('<i>', str, False) <> 1) or ((SmartPos('</i>', str, False) > 0)and(SmartPos('</i>', str, False) < Length(str)-3)) then tbItalicTrans.Down := False;
          if TextHasFullTag(GetSubTranslation(Node), False, False, True, False) = False then tbUnderlineTrans.Down := False;
          //str := RemoveSWTags(GetSubTranslation(Node), True, True, False, True, True);
          //if (SmartPos('<u>', str, False) <> 1) or ((SmartPos('</u>', str, False) > 0)and(SmartPos('</u>', str, False) < Length(str)-3)) then tbUnderlineTrans.Down := False;
          if (tbBoldTrans.Down = False) and (tbItalicTrans.Down = False) and (tbUnderlineTrans.Down = False) then break;
          Node := lstSubtitles.GetNextSelected(Node);
        end;
      end;
    end;

  end else
  begin
    tbBold.Enabled          := False;
    tbItalic.Enabled        := False;
    tbUnderline.Enabled     := False;
    tbSetColor.Enabled      := False;
    tbRemoveAllTags.Enabled := False;
    tbBold.Down             := False;
    tbItalic.Down           := False;
    tbUnderline.Down        := False;

    if mnuTranslatorMode.Checked then
    begin
      tbBoldTrans.Enabled          := False;
      tbItalicTrans.Enabled        := False;
      tbUnderlineTrans.Enabled     := False;
      tbSetColorTrans.Enabled      := False;
      tbRemoveAllTagsTrans.Enabled := False;
      tbBoldTrans.Down             := False;
      tbItalicTrans.Down           := False;
      tbUnderlineTrans.Down        := False;
    end;
  end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
//Refresh the statusbar information
procedure TfrmMain.RefreshStatusbar;
var
  Text: String;
begin
  if sbStatusBar.Visible then
  begin
    Text := '';
    if lstSubtitles.Enabled then
    begin
      if lstSubtitles.SelectedCount <> 1 then
        Text := Format(NSelectedSubtitles, [lstSubtitles.SelectedCount, lstSubtitles.TotalCount]) else
        if lstSubtitles.GetFirstSelected <> nil then //added later to fix a bug when deleting a subtitle
          Text := Format(NSelectedSubtitle, [lstSubtitles.GetFirstSelected.Index+1, lstSubtitles.TotalCount]) else
          Text := IntToStr(lstSubtitles.TotalCount);
    end;
    sbStatusBar.Panels[0].Text := Text;
    if TextTransColsSwapped = False then
    begin
      sbStatusBar.Panels[1].Text := SubtitleAPI.GetFormatName(frmMain.OrgFormat);
      sbStatusBar.Panels[2].Text := SubtitleAPI.GetFormatName(frmMain.TransFormat);
    end else
    begin
      sbStatusBar.Panels[2].Text := SubtitleAPI.GetFormatName(frmMain.OrgFormat);
      sbStatusBar.Panels[1].Text := SubtitleAPI.GetFormatName(frmMain.TransFormat);
    end;
  end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
//center subtitles list on the currently selected subtitle
procedure TfrmMain.sbStatusbarMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if X <= sbStatusbar.Panels[0].Width then
    if Button = mbRight then
      CenterListOnLastSelected else
      CenterListOnSelected;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
//Set Show/Hide times by clicking on the time counter
procedure TfrmMain.tcTimeCounterMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TheLastActiveControl := Screen.ActiveControl;
  tcTimeCounter.SetFocus;
  TempActiveControl := tcTimeCounter;
  if Button = mbLeft then
  begin
    btnSetShowTimeClick(tcTimeCounter);
    tmeShow.Font.Style := tmeShow.Font.Style + [fsUnderline];
  end else
  if Button = mbRight then
  begin
    btnSetHideTimeClick(tcTimeCounter);
    tmeHide.Font.Style := tmeHide.Font.Style + [fsUnderline];
  end;
end;

procedure TfrmMain.tcTimeCounterMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TheLastActiveControl.SetFocus;
  TempActiveControl := nil;
  tmeShow.Font.Style := tmeShow.Font.Style - [fsUnderline];
  tmeHide.Font.Style := tmeHide.Font.Style - [fsUnderline];
end;

procedure TfrmMain.tcTimeCounterMouseWheelDown(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
  if ssLeft in Shift then
  begin
    tmeShowMouseWheelDown(tmeShow, Shift, MousePos, Handled);
  end else
  if ssRight in Shift then
  begin
    tmeHideMouseWheelDown(tmeHide, Shift, MousePos, Handled);
  end;
  Handled := True; //bug fix. scrolls six times otherwise...
end;

procedure TfrmMain.tcTimeCounterMouseWheelUp(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
  if ssLeft in Shift then
  begin
    tmeShowMouseWheelUp(tmeShow, Shift, MousePos, Handled);
  end else
  if ssRight in Shift then
  begin
    tmeHideMouseWheelUp(tmeHide, Shift, MousePos, Handled);
  end;
  Handled := True; //bug fix. scrolls six times otherwise...
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
//TEMP Semi-active time controls on MouseOver - we activate the SCROLL WHEEL function of the semi-active controls
procedure TfrmMain.tmeMouseEnter(Sender: TObject);
begin
  if Application.Active then
  if (TempActiveControl <> tcTimeCounter) and (Screen.ActiveControl.ClassName <> 'TTimeMaskEdit') and (PressedKeyInLstSubtitles = 0) then //if we haven't clicked on tcTimeCounter and another TTimeMaskEdit is not currently active
  begin
    TempActiveControl := TWinControl(Sender);
    TTimeMaskEdit(Sender).Font.Style := TTimeMaskEdit(Sender).Font.Style + [fsUnderline];
  end;
end;

procedure TfrmMain.tmeMouseLeave(Sender: TObject);
begin
  if Application.Active then
  if (TempActiveControl <> tcTimeCounter) and (TempActiveControl = TTimeMaskEdit(Sender)) then
  begin
    TempActiveControl := nil;
    TTimeMaskEdit(Sender).Font.Style := TTimeMaskEdit(Sender).Font.Style - [fsUnderline];
  end;
end;

procedure TfrmMain.tmeEnter(Sender: TObject);
begin
  TempActiveControl := nil;
  tmeShow.Font.Style := tmeShow.Font.Style - [fsUnderline];
  tmeHide.Font.Style := tmeHide.Font.Style - [fsUnderline];
  tmeDuration.Font.Style := tmeDuration.Font.Style - [fsUnderline];
  tmePause.Font.Style := tmePause.Font.Style - [fsUnderline];
end;

procedure TfrmMain.FormMouseWheelUp(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
  if TempActiveControl <> nil then
  begin
         if TempActiveControl = tmeHide     then begin tmeHideMouseWheelUp(tmeHide, Shift, MousePos, Handled); Handled := True; end
    else if TempActiveControl = tmeShow     then begin tmeShowMouseWheelUp(tmeShow, Shift, MousePos, Handled); Handled := True; end
    else if TempActiveControl = tmeDuration then begin tmeDurationMouseWheelUp(tmeDuration, Shift, MousePos, Handled); Handled := True; end
    else if TempActiveControl = tmePause    then begin tmePauseMouseWheelUp(tmePause, Shift, MousePos, Handled); Handled := True; end
    else if TempActiveControl = sbVolume    then begin VolumeSet(sbVolume.Position + 5); Application.ActivateHint(Mouse.CursorPos); Handled := True; end;
  end else
  //added later: set volume if mouse is over the video panel
  if (Mouse.CursorPos.X > pnlVideo.ClientToScreen(Point(0,0)).X) and
     (Mouse.CursorPos.X < pnlVideo.ClientToScreen(Point(0,0)).X + pnlVideo.Width) and
     (Mouse.CursorPos.Y > pnlVideo.ClientToScreen(Point(0,0)).Y) and
     (Mouse.CursorPos.Y < pnlVideo.ClientToScreen(Point(0,0)).Y + pnlVideo.Height) then
  begin
    VolumeSet(sbVolume.Position + 5);
    Handled := True;
  end;
end;

procedure TfrmMain.FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
  if TempActiveControl <> nil then
  begin
    if TempActiveControl =   tmeHide     then begin tmeHideMouseWheelDown(tmeHide, Shift, MousePos, Handled); Handled := True; end
    else if TempActiveControl =  tmeShow     then begin tmeShowMouseWheelDown(tmeShow, Shift, MousePos, Handled); Handled := True; end
    else if TempActiveControl =  tmeDuration then begin tmeDurationMouseWheelDown(tmeDuration, Shift, MousePos, Handled); Handled := True; end
    else if TempActiveControl =  tmePause    then begin tmePauseMouseWheelDown(tmePause, Shift, MousePos, Handled); Handled := True; end
    else if TempActiveControl =  sbVolume    then begin VolumeSet(sbVolume.Position - 5); Application.ActivateHint(Mouse.CursorPos); Handled := True; end;
  end else
  //added later: set volume if mouse is over the video panel
  if (Mouse.CursorPos.X > pnlVideo.ClientToScreen(Point(0,0)).X) and
     (Mouse.CursorPos.X < pnlVideo.ClientToScreen(Point(0,0)).X + pnlVideo.Width) and
     (Mouse.CursorPos.Y > pnlVideo.ClientToScreen(Point(0,0)).Y) and
     (Mouse.CursorPos.Y < pnlVideo.ClientToScreen(Point(0,0)).Y + pnlVideo.Height) then
  begin
    VolumeSet(sbVolume.Position - 5);
    Handled := True;
  end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.sbVolumeMouseEnter(Sender: TObject);
begin
  Application.HintPause := 0;
  Application.HintHidePause := 99999999;
  Application.ActivateHint(Mouse.CursorPos);
  tmeMouseEnter(Sender);
end;

procedure TfrmMain.sbVolumeMouseLeave(Sender: TObject);
begin
  Application.HintPause := 500;
  Application.HintHidePause := 2500;
  tmeMouseLeave(Sender);
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.sbSeekBarMouseEnter(Sender: TObject);
{var
  Bitmap: TBitmap;
  tmp: Integer;}
begin
  {if btnPlay.Visible then
  begin
    Player.VideoWindow.get_Width(tmp);
    imgVideoPausedFrame.Width := tmp;//Player.VideoWidth;
    Player.VideoWindow.get_Height(tmp);
    imgVideoPausedFrame.Height := tmp;//Player.VideoHeight;
    imgVideoPausedFrame.Left := (pnlVideoDisplay.Width - imgVideoPausedFrame.Width) div 2;
    imgVideoPausedFrame.Top := (pnlVideoDisplay.Height - imgVideoPausedFrame.Height) div 2;
    Bitmap := TBitmap.Create;
    imgVideoPausedFrame.Picture.Assign(TakeScreengrab(Bitmap,imgVideoPausedFrame.Width,imgVideoPausedFrame.Height));
    Bitmap.Free;
    imgVideoPausedFrame.Visible := True;
    subSubtitle.Visible := False;

    Player.VideoWindow.put_Owner(pnlVideoPreview.Handle);
    Player.VideoWindow.put_MessageDrain(pnlVideoPreview.Handle);
    pnlVideoPreview.Visible := True;
  end;}
  InPausedVideoPreviewMode := True;
end;

procedure TfrmMain.sbSeekBarMouseLeave(Sender: TObject);
begin
  {if btnPlay.Visible then
  begin
    pnlVideoPreview.Visible := False;
    Player.VideoWindow.put_Owner(pnlVideoDisplay.Handle);
    Player.VideoWindow.put_MessageDrain(pnlVideoDisplay.Handle);
    imgVideoPausedFrame.Visible := False;
    SetVideoPos(sbSeekBar.Position, False);
    subSubtitle.Visible := True;
  end;}

  //exit video preview mode:
  InPausedVideoPreviewMode := False;
  if btnPlay.Visible then
    SetVideoPos(sbSeekbar.Position);
  //Exit Time counter preview mode:
  if FormatType = ftTime then
    tcTimeCounter.Text2 := TimeToString(VideoDuration) else
    tcTimeCounter.Text2 := IntToStr(TimeToFrames(VideoDuration, MovieFPS));
  tcTimeCounter.Text2Color := clWindowText;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
//This is necessary as with a quick mouse move over the seekbar the MouseLeave event might not be triggered
procedure TfrmMain.tmrSeekbarMouseOverTimer(Sender: TObject);
var
  p: TPoint;
begin
  if btnPlay.Visible then
  begin
    //Check if the mouse is not over the seekbar:
    p.X := 0;
    p.Y := 0;
    if (Mouse.CursorPos.X < sbSeekBar.ClientToScreen(p).X)
    or (Mouse.CursorPos.X > sbSeekBar.ClientToScreen(p).X + sbSeekBar.Width)
    or (Mouse.CursorPos.Y < sbSeekBar.ClientToScreen(p).Y)
    or (Mouse.CursorPos.Y > sbSeekBar.ClientToScreen(p).Y + sbSeekBar.Height) then
    if tcTimeCounter.Text2Color <> clWindowText then //check if MouseLeave wasn't already triggered
      sbSeekBarMouseLeave(Sender);
  end;
  tmrSeekbarMouseOver.Enabled := False;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.spSplitterEditingControlsMoved(Sender: TObject);
begin
  //Resize time controls:
  tmeShow.Width := (pnlTimingControls.Width - 7 - Integer(mnuShowTimeControlButtons.Checked)*(2*tbHideSnap.Width+2*6)) div 2;
  tmeShow.Left := (tbtnShowSnap.Width + 6) * Integer(frmMain.mnuShowTimeControlButtons.Checked);
  tmePause.Width := tmeShow.Width;
  tmePause.Left := tmeShow.Left;
  lblShow.Left := tmeShow.Left;
  lblPause.Left := tmePause.Left;
  tbShowSnap.Top := tmeShow.Top + (tmeShow.Height - tbShowSnap.Height) div 2;
  tbPauseSet.Top := tmePause.Top + (tmePause.Height - tbPauseSet.Height) div 2;
  tmeHide.Width := tmeShow.Width;
  tmeHide.Left := tmeShow.Left + tmeShow.Width + 7;
  tmeDuration.Width := tmeShow.Width;
  tmeDuration.Left := tmeHide.Left;
  lblHide.Left := tmeHide.Left;
  lblDuration.Left := tmeDuration.Left;
  tbHideSnap.Left := pnlTimingControls.Width - tbHideSnap.Width;
  tbHideSnap.Top := tbShowSnap.Top;
  tbDurationSet.Left := tbHideSnap.Left;
  tbDurationSet.Top := tbPauseSet.Top;
  //Resize text controls:
  tbTextStyle.Top := (mmoSubtitleText.Top - tbTextStyle.Height) div 2;
  tbTransStyle.Top := tbTextStyle.Top;
  if mnuTranslatorMode.Checked then
  begin
    if TextTransColsSwapped = False then
    begin
      mmoSubtitleText.Width := (pnlTextControls.Width - 7) div 2;
      mmoTranslation.Width := pnlTextControls.Width - 7 - mmoSubtitleText.Width;
      mmoTranslation.Left := mmoSubtitleText.Width + 7;
    end else
    begin
      mmoTranslation.Width := (pnlTextControls.Width - 7) div 2;
      mmoSubtitleText.Width := pnlTextControls.Width - 7 - mmoTranslation.Width;
      mmoSubtitleText.Left := mmoTranslation.Width + 7;
    end;
    lblTextLines.Left := mmoSubtitleText.Left + mmoSubtitleText.Width - lblTextLines.Width;
    lblLines1.Left := lblTextLines.Left - lblLines1.Width;
    tbTransStyle.Left := mmoTranslation.Left;
    lblTranslation.Left := mmoTranslation.Left + (Integer(tbTransStyle.Visible) * tbTransStyle.Width);
  end else
    mmoSubtitleText.Width := pnlTextControls.Width;

  UpdateStatusbarWidths; //added later
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.mnuShowTimeControlButtonsClick(Sender: TObject);
begin
  if mnuShowTimeControlButtons.Checked then
  begin
    tbShowSnap.Show;
    tbHideSnap.Show;
    tbPauseSet.Show;
    tbDurationSet.Show;
    lblShow.Left := tbHideSnap.Width + 6;
    pnlTimingControls.Constraints.MinWidth := 259;
    pnlTimingControls.Constraints.MaxWidth := 359;
    //pnlTextControls.Constraints.MinWidth := 312;
  end else
  begin
    tbShowSnap.Hide;
    tbHideSnap.Hide;
    tbPauseSet.Hide;
    tbDurationSet.Hide;
    lblShow.Left := 0;
    pnlTimingControls.Constraints.MinWidth := 201;
    pnlTimingControls.Constraints.MaxWidth := 301;
    //pnlTextControls.Constraints.MinWidth := 370;
  end;

  tmeShow.Left := lblShow.Left;
  lblPause.Left := lblShow.Left;
  tmePause.Left := lblShow.Left;
  lblHide.Left := tmeShow.Left + tmeShow.Width + 7;
  tmeHide.Left := lblHide.Left;
  lblDuration.Left := lblHide.Left;
  tmeDuration.Left := lblHide.Left;

  tbHideSnap.Left := tmeHide.Left + tmeHide.Width + 6;
  tbDurationSet.Left := tbHideSnap.Left;

  pnlTimingControls.Width := tmeHide.Left + tmeHide.Width + Integer(mnuShowTimeControlButtons.Checked)*(tbHideSnap.Width + 6);

  UpdateStatusbarWidths; //added later
  SetTranslationCtrlsPositions;
  frmMain.Refresh;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
//TIME CONTROL BUTTONS:
procedure TfrmMain.tbtnTimeControlButtonMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TToolButton(Sender).Down := True;
end;

procedure TfrmMain.tbtnShowSnapMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  TToolButton(Sender).Down := False;
end;

procedure TfrmMain.tbtnShowSnapMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
  begin
    //Shift subtitle to previous subtitle
    mnuShiftToPreviousClick(Sender);
  end else
  if Button = mbRight then
  begin
    //Snap Show time (only) to previous subtitle
    mnuExtendLength2Click(Sender);
  end;
  TToolButton(Sender).Down := False;
end;

procedure TfrmMain.tbtnHideSnapMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
  begin
    //Shift subtitle to next subtitle
    mnuShiftToNextClick(Sender);
  end else
  if Button = mbRight then
  begin
    //Snap Hide time (only) to next subtitle
    mnuExtendLengthClick(Sender);
  end;
  TToolButton(Sender).Down := False;
end;

procedure TfrmMain.tbtnPauseSetMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Node, NextSelNode : PVirtualNode;
  Pause             : Cardinal;
begin
  if Button = mbLeft then
  begin
    //Set Default Pause
    tmePauseTimeChangeFromEditOnly(Sender, DefaultSubPause);
  end else
  if Button = mbRight then
  begin
    //Set Default Pause, if Pause is too short
    Node := lstSubtitles.GetFirstSelected;
    while Assigned(Node) do
    begin
      NextSelNode := lstSubtitles.GetNextSelected(Node);
      Pause := GetStartTime(Node) - GetFinalTime(Node.PrevSibling);
      if Pause < TooShortPause then
        ChangePause(Node, DefaultSubPause, Assigned(NextSelNode));
      Node := NextSelNode;
    end;
  end;
  TToolButton(Sender).Down := False;
end;

procedure TfrmMain.tbtnDurationSetMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  MethodIsCPS       : Boolean;
  SelectedSubsOnly  : Boolean;
  ApplyMethod       : Byte;
  CPS               : Word;
  IncreaseAtStart   : Boolean;
  MaxIncreaseAtStart: Word;
begin
  if Button = mbLeft then
  begin
  //Set auto duration (based on CPS)
    frmAutomaticDurations := TfrmAutomaticDurations.Create(Application);
    with frmAutomaticDurations do
    begin
      //Save original settings
      MethodIsCPS       := rdoCharacters.Checked;
      SelectedSubsOnly  := rdoSelectedSubs.Checked;
      ApplyMethod := 0;
      if rdoAllCases.Checked then
        ApplyMethod     := 1 else
      if rdoNewDurGreaterOrg.Checked then
        ApplyMethod     := 2 else
      if rdoNewDurSmallerOrg.Checked then
        ApplyMethod     := 3;
      CPS               := udCPS.Position;
      IncreaseAtStart   := chkIncreaseAtStart.Checked;
      MaxIncreaseAtStart:= udMaxIncrease.Position;

      //Set new settings:
      rdoCharacters.Checked       := True;
      rdoSelectedSubs.Checked     := True;
      rdoAllCases.Checked         := True;
      udCPS.Position              := TooMuchCPS;
      chkIncreaseAtStart.Checked  := True;
      udMaxIncrease.Position      := 1000;

      //Apply Automatic Duration
      btnApplyClick(Sender);

      //Restore original settings:
      if MethodIsCPS then
        rdoCharacters.Checked     := True else
        rdoMilliseconds.Checked   := True;
      if SelectedSubsOnly then
        rdoSelectedSubs.Checked   := True else
        rdoAllSubs.Checked        := True;
      if ApplyMethod = 1 then
        rdoAllCases.Checked := True else
      if ApplyMethod = 2 then
        rdoNewDurGreaterOrg.Checked := True else
      if ApplyMethod = 3 then
        rdoNewDurSmallerOrg.Checked := True;
      udCPS.Position              := CPS;
      chkIncreaseAtStart.Checked  := IncreaseAtStart;
      udMaxIncrease.Position      := MaxIncreaseAtStart;

      Free;
    end;
  end else
  if Button = mbRight then
  begin
    //Set min duration
    tmeDurationTimeChangeFromEditOnly(Sender, TooShortDuration);
  end;
  TToolButton(Sender).Down := False;  
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.mnuShiftToNextClick(Sender: TObject);
var
  Node          : PVirtualNode;
  UndoAction    : PUndoAction;
  ShiftValue    : Cardinal;
begin
  Node := GetLastSelected;
  if Assigned(Node) and Assigned(Node.NextSibling) then
  if (GetFinalTime(Node) + DefaultSubPause < GetStartTime(Node.NextSibling)) then
  begin
    ShiftValue := 0; //only to avoid compiler warnings

    while Assigned(Node) do
    begin
      New(UndoAction);
      UndoAction^.UndoActionType                 := uaTimeChange;
      UndoAction^.UndoActionName                 := uanShiftToNext;
      UndoAction^.BufferSize                     := SizeOf(TTimeChange);
      UndoAction^.Buffer                         := AllocMem(UndoAction^.BufferSize);
      UndoAction^.Node                           := Node;
      UndoAction^.LineNumber                     := Node.Index;
      PTimeChange(UndoAction^.Buffer)^.StartTime := GetStartTime(Node);
      PTimeChange(UndoAction^.Buffer)^.FinalTime := GetFinalTime(Node);
      UndoAction^.BindToNext                     := True;

      if lstSubtitles.Selected[Node.NextSibling] = False then
        ShiftValue := GetStartTime(Node.NextSibling) - GetFinalTime(Node) - DefaultSubPause;

      if ShiftValue > 0 then
      begin
        SetStartTime(Node, GetStartTime(Node) + ShiftValue);
        SetFinalTime(Node, GetFinalTime(Node) + ShiftValue);

        AddUndo(UndoAction);

        AutoRecheckNodeErrors(Node, TimeErrors);
        AutoRecheckNodeErrors(Node.NextSibling, PauseErrors);
      end;

      Node := lstSubtitles.GetPreviousSelected(Node);
    end;

    if UndoList.Count > 0 then
      PUndoAction(UndoList.Last)^.BindToNext := False;
    lstSubtitles.Refresh;
    RefreshTimes;

  end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.mnuShiftToPreviousClick(Sender: TObject);
var
  Node          : PVirtualNode;
  UndoAction    : PUndoAction;
  ShiftValue    : Cardinal;
begin
  //Get First selected:
  Node := lstSubtitles.GetFirstSelected;

  if Assigned(Node) and Assigned(Node.PrevSibling) then
  if (GetFinalTime(Node.PrevSibling) + DefaultSubPause < GetStartTime(Node)) then
  begin
    ShiftValue := 0; //only to avoid compiler warnings

    while Assigned(Node) do
    begin
      New(UndoAction);
      UndoAction^.UndoActionType                 := uaTimeChange;
      UndoAction^.UndoActionName                 := uanShiftToPrev;
      UndoAction^.BufferSize                     := SizeOf(TTimeChange);
      UndoAction^.Buffer                         := AllocMem(UndoAction^.BufferSize);
      UndoAction^.Node                           := Node;
      UndoAction^.LineNumber                     := Node.Index;
      PTimeChange(UndoAction^.Buffer)^.StartTime := GetStartTime(Node);
      PTimeChange(UndoAction^.Buffer)^.FinalTime := GetFinalTime(Node);
      UndoAction^.BindToNext                     := True;

      if lstSubtitles.Selected[Node.PrevSibling] = False then
        ShiftValue := GetStartTime(Node) - GetFinalTime(Node.PrevSibling) - DefaultSubPause;

      if ShiftValue > 0 then
      begin
        SetStartTime(Node, GetStartTime(Node) - ShiftValue);
        SetFinalTime(Node, GetFinalTime(Node) - ShiftValue);

        AddUndo(UndoAction);

        AutoRecheckNodeErrors(Node, TimeErrors);
        AutoRecheckNodeErrors(Node.NextSibling, PauseErrors);
      end;

      Node := lstSubtitles.GetNextSelected(Node);
    end;

    if UndoList.Count > 0 then
      PUndoAction(UndoList.Last)^.BindToNext := False;
    lstSubtitles.Refresh;
    RefreshTimes;
  end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
//Inser Symbol:
procedure TfrmMain.mnuInsertSymbolClick(Sender: TObject);
begin
  sdSymbolDialogue.Font.Name := subSubtitle.Font.Name;
  sdSymbolDialogue.Font.Size := 10;
  sdSymbolDialogue.Execute;
end;

procedure TfrmMain.UpdateCaretPosition;
var
  APoint: TPoint;
begin
  GetCaretPos(APoint);
  if frmMain.ActiveControl = mmoSubtitleText then
  begin
    APoint := mmoSubtitleText.ClientToParent(APoint, frmMain);
    pnlCaret.Height := Abs(mmoSubtitleText.Font.Height + mmoSubtitleText.Font.Height div 4);
  end else
  if frmMain.ActiveControl = mmoTranslation then
  begin
    APoint := mmoTranslation.ClientToParent(APoint, frmMain);
    pnlCaret.Height := Abs(mmoTranslation.Font.Height + mmoTranslation.Font.Height div 4);
  end else
  if frmMain.ActiveControl = mmoNotes then
  begin
    APoint := mmoNotes.ClientToParent(APoint, frmMain);
    pnlCaret.Height := Abs(mmoNotes.Font.Height + mmoNotes.Font.Height div 4);
  end;
  pnlCaret.Width := 1;

  pnlCaret.Left := APoint.X+2;
  pnlCaret.Top := APoint.Y+2;
end;

function TfrmMain.SetHideSelection(Control: TWinControl; HideSelection: Boolean): Boolean;
//var SelStart, SelLength: Integer;
begin
  Result := False;

  if (Control is TRichEdit) then
  begin
    if (HideSelection = False) and (TRichEdit(Control).SelLength = 0) then exit;
    TRichEdit(Control).HideSelection := HideSelection;
  end else
  if (Control is TMemo) then
  begin
    exit;
    //if (HideSelection = False) and (TMemo(Control).SelLength = 0) then exit;
    //SelStart := TMemo(Control).SelStart;
    //SelLength := TMemo(Control).SelLength;
    //TMemo(Control).HideSelection := HideSelection;
    //TMemo(Control).SelStart := SelStart;
    //TMemo(Control).SelLength := SelLength;
  end;

  Result := True;
end;

procedure TfrmMain.sdSymbolDialogueInsertSymbol(Sender: TObject; Font: TFont; Chr: Char);
begin
  if frmMain.ActiveControl = mmoSubtitleText then
  begin
    //mmoSubtitleText.SelText := Chr;
    SetSWTextEditSelText(mmoSubtitleText, Chr);
    mmoSubtitleText.SetFocus;
  end else
  if frmMain.ActiveControl = mmoTranslation then
  begin
    //mmoTranslation.SelText := Chr;
    SetSWTextEditSelText(mmoTranslation, Chr);
    mmoTranslation.SetFocus;
  end else
  if frmMain.ActiveControl = mmoNotes then
  begin
    mmoNotes.SelText := Chr;
    mmoNotes.SetFocus;
  end;
  //UpdateCaretPosition;
  sdSymbolDialogue.SetFocus;
end;

procedure TfrmMain.sdSymbolDialogueFormActivate(Sender: TObject);
begin
  UpdateCaretPosition;
  if SetHideSelection(frmMain.ActiveControl, False) = False then
    pnlCaret.Visible := True;
end;

procedure TfrmMain.sdSymbolDialogueFormDeactivate(Sender: TObject);

begin
  SetHideSelection(frmMain.ActiveControl, True);
  pnlCaret.Visible := False;
end;

procedure TfrmMain.mmoSubTextEnter(Sender: TObject);
var
  TheFont: TFont;
begin
  //sdSymbolDialogue.Font.Charset := mmoSubtitleText.Font.Charset; //can't do it directly like that - the TSymbolDialogue SetFont is not called this way...
  TheFont := sdSymbolDialogue.Font;
  TheFont.Charset := mmoSubtitleText.Font.Charset;
  sdSymbolDialogue.Font := TheFont;
end;

procedure TfrmMain.mmoTransEnter(Sender: TObject);
var
  TheFont: TFont;
begin
  TheFont := sdSymbolDialogue.Font;
  TheFont.Charset := mmoTranslation.Font.Charset;
  sdSymbolDialogue.Font := TheFont;
  //TODO: Make the mmoTranslation Text empty, if the Text is the UntranslatedSub text!
end;

procedure TfrmMain.mmoNotesEnter(Sender: TObject);
var
  TheFont: TFont;
begin
  TheFont := sdSymbolDialogue.Font;
  TheFont.Charset := NotesCharset;
  sdSymbolDialogue.Font := TheFont;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.mmoTranslationExit(Sender: TObject);
begin
  //TODO: Restore the UntranslatedSub text if the mmoTranslation Text is empty!
  RefreshBIUButtons;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.mmoSubtitleTextExit(Sender: TObject);
begin
  RefreshBIUButtons;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
//Binding Undo actions when typing relatively fast:
procedure TfrmMain.tmrFastTypingUndoBindTimer(Sender: TObject);
begin
  tmrFastTypingUndoBind.Enabled := False;
end;

procedure TfrmMain.mmoTextTransKeyPress(Sender: TObject; var Key: Char);
begin
  if Key in SpecialChars then //a special character means a word's end, so we stop binding undo actions
    tmrFastTypingUndoBind.Enabled := False;
  if Key = #13 then //don't bind anything after typing a new line
    tmrFastTypingUndoBind.Tag := 1 else
    tmrFastTypingUndoBind.Tag := 0;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.mnuRoundTimeValuesClick(Sender: TObject);
begin
  frmRoundTimeValues := TfrmRoundTimeValues.Create(Application);
  frmRoundTimeValues.ShowModal;
  frmRoundTimeValues.Free;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
//Video Popup menu:
procedure TfrmMain.pnlVideoDisplayMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  //Popup menu is displayed this way, because assigning a PopupMenu value doesn't work correctly with the video. Don't change it.
  if Button = mbRight then
    mnuVideoPopup.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

procedure TfrmMain.mnuVideoPopupPopup(Sender: TObject);
begin
  mnuShowSubtitlesPopup.Checked := mnuShowSubtitles.Checked;
  mnuDefaultVidRendPopup.Checked:= mnuDefaultVidRend.Checked;
  mnuVMR9VidRendPopup.Checked   := mnuVMR9VidRend.Checked;

  mnuSubtitleToDisplayPopup.Visible  := mnuTranslatorMode.Checked;
  mnuDisplayOriginalPopup.Checked    := mnuDisplayOriginal.Checked;
  mnuDisplayTranslationPopup.Checked := mnuDisplayTranslation.Checked; 

  mnuCloseMoviePopup.Enabled    := Player.Initialized;
  mnuMovieInfoPopup.Enabled     := Player.Initialized;
  mnuToggleFullscreen.Enabled   := Player.Initialized;
  mnuZoomTo25percent.Enabled    := Player.Initialized;
  mnuZoomTo50percent.Enabled    := Player.Initialized;
  mnuZoomTo75percent.Enabled    := Player.Initialized;
  mnuZoomTo100percent.Enabled   := Player.Initialized;
  mnuZoomTo150percent.Enabled   := Player.Initialized;
  mnuZoomTo200percent.Enabled   := Player.Initialized;
  mnuAspectRatio.Enabled        := Player.Initialized;
  mnuResetSubVerticalPos.Enabled:= Player.Initialized;
  mnuAudioStreamPopup.Enabled   := Player.Initialized;
end;

procedure TfrmMain.mnuToggleFullscreenClick(Sender: TObject);
begin
  ToggleFullscreen;
end;

procedure TfrmMain.mnuResetSubVerticalPosClick(Sender: TObject);
begin
  subSubtitleTopShift := 0.0;
  UpdateSubtitlesPos;
end;

procedure TfrmMain.mnuOpenMoviePopupClick(Sender: TObject);
begin
  mnuOpenMovieClick(Sender);
end;

procedure TfrmMain.mnuCloseMoviePopupClick(Sender: TObject);
begin
  mnuCloseMovieClick(Sender);
end;

procedure TfrmMain.mnuMovieInfoPopupClick(Sender: TObject);
begin
  mnuMovieInfoClick(Sender);
end;

procedure TfrmMain.mnuShowSubtitlesPopupClick(Sender: TObject);
begin
  mnuShowSubtitles.Checked := mnuShowSubtitlesPopup.Checked;
  mnuShowSubtitlesClick(Sender);
end;

procedure TfrmMain.ZoomVideo(Percent: Byte);
var
  NewWidth, NewHeight: Integer;
  FormHeightDiff, FormWidthDiff: Integer;
  Proportion: Real;
begin
  Proportion := Player.VideoWidth / Player.VideoHeight;
  NewWidth := Rnd((Player.VideoWidth * Percent) / 100);
  NewHeight := Rnd(((Player.VideoWidth * Percent) / 100) / Proportion);

  if WindowState = wsMaximized then
  begin
    if (NewWidth <= pnlVideoDisplay.Width) and (NewHeight <= pnlParent2.Height - spSplitter.MinSize - pnlVideoControls.Height - spSplitter.Height) then
    begin
      VideoPanelRatio := (NewHeight + pnlVideoControls.Height) / pnlParent2.Height;

      if FullScreen then
        ToggleFullscreen;
      pnlVideo.Height := pnlVideoControls.Height + NewHeight;
      spSplitter.Top := pnlVideo.Height;
      spSplitterMoved(spSplitter);
      UpdateSubtitlesPos;
    end;
  end else
  begin
    FormHeightDiff := (NewHeight - pnlVideoDisplay.Height) - (lstSubtitles.Height - spSplitter.MinSize);
    FormWidthDiff := (NewWidth - pnlVideo.Width);

    if (Height + FormHeightDiff <= Screen.Height) and (Width + FormWidthDiff <= Screen.Width) then
    begin
      VideoPanelRatio := (NewHeight + pnlVideoControls.Height) / Max(pnlParent2.Height, pnlParent2.Height + FormHeightDiff);

      if FormHeightDiff > 0 then
        Height := Height + FormHeightDiff;
      if FormWidthDiff > 0 then
        Width := Width + FormWidthDiff;

      if FullScreen then
        ToggleFullscreen;
      pnlVideo.Height := pnlVideoControls.Height + NewHeight;
      spSplitter.Top := pnlVideo.Height;
      spSplitterMoved(spSplitter);
      UpdateSubtitlesPos;
    end;
  end;
end;
procedure TfrmMain.mnuZoomTo25percentClick(Sender: TObject); begin ZoomVideo(25); end;
procedure TfrmMain.mnuZoomTo50percentClick(Sender: TObject); begin ZoomVideo(50); end;
procedure TfrmMain.mnuZoomTo75percentClick(Sender: TObject); begin ZoomVideo(75); end;
procedure TfrmMain.mnuZoomTo100percentClick(Sender: TObject); begin ZoomVideo(100); end;
procedure TfrmMain.mnuZoomTo150percentClick(Sender: TObject); begin ZoomVideo(150); end;
procedure TfrmMain.mnuZoomTo200percentClick(Sender: TObject); begin ZoomVideo(200); end;
//added by adenry: end

// -----------------------------------------------------------------------------

//Original or Translated modified by BDZL:
procedure TfrmMain.SetOrgModified(const Value: Boolean);
begin
  OrgFileModified := Value;
  SetFormCaption;   // add asterisk in form caption if Original changed
end;

procedure TfrmMain.SetTransModified(const Value: Boolean);
begin
  TransFileModified := Value;
  SetFormCaption;   // add asterisk in form caption if Trans changed
end;

function TfrmMain.GetOrgModified(): Boolean;
begin
  Result := OrgFileModified;
end;

function TfrmMain.GetTransModified(): Boolean;
begin
  Result := TransFileModified;
end;

// -----------------------------------------------------------------------------

//added by adenry: begin
//Subtitles graphic representation in the seekbar
procedure TfrmMain.sbSeekBarRepaintSeekbar(Sender: TObject; Bitmap: TBitmap);
var
  x, w        : Integer;
  InitialTime : Integer;
  Duration    : Integer;
  Node        : PVirtualNode;
  mult        : Real;
begin
  //set size:
  Bitmap.Width := sbSeekBar.Width - sbSeekBar.Normal.Width;
  Bitmap.Height := sbSeekBar.MainBar.Height-2;
  //set transparent background:
  Bitmap.Canvas.Brush.Color := clFuchsia;
  Bitmap.Canvas.FillRect(Rect(0, 0, Bitmap.Width, Bitmap.Height));

  if mnuVisualSubRepr.Checked then
  begin
    //draw subtitles graphic representation (by BDZL):
    if Player.Initialized then
    begin
      mult := VideoDuration / Bitmap.Width;
      Node := lstSubtitles.GetFirst;
      while Assigned(Node) do
      begin
        InitialTime := GetStartTime(Node);
        Duration    := GetFinalTime(Node) - InitialTime;
        x := Trunc(InitialTime / mult); //Round replaced with Trunc by adenry
        w := Max(1, rnd(Duration / mult)); //Max added by adenry, Round replaced with rnd by adenry
        Bitmap.Canvas.Brush.Color := VisualSubReprColor;
        Bitmap.Canvas.FillRect(Bounds(x, 0, w, Bitmap.Height));
        Node := Node.NextSibling;
      end;
    end;
  end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.mnuVisualSubReprClick(Sender: TObject);
begin
  sbSeekbar.Repaint;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
//Text and Translation popup menu
procedure TfrmMain.mnuTextTransPopupPopup(Sender: TObject);
begin
  if mnuTextTransPopup.PopupComponent = mmoSubtitleText then
  begin
    mnuBoldPopup2.Checked := tbBold.Down;
    mnuItalicPopup2.Checked := tbItalic.Down;
    mnuUnderlinePopup2.Checked := tbUnderline.Down;
  end else
  if  mnuTextTransPopup.PopupComponent = mmoTranslation then
  begin
    mnuBoldPopup2.Checked := tbBoldTrans.Down;
    mnuItalicPopup2.Checked := tbItalicTrans.Down;
    mnuUnderlinePopup2.Checked := tbUnderlineTrans.Down;
  end;
  mnuCutPopup.Enabled := TSWTextEdit(mnuTextTransPopup.PopupComponent).SelLength > 0; //TMemo changed to TSWTextEdit
  mnuCopyPopup.Enabled := TSWTextEdit(mnuTextTransPopup.PopupComponent).SelLength > 0; //TMemo changed to TSWTextEdit
  mnuPastePopup.Enabled := mnuPaste.Enabled;
  mnuDeletePopup.Enabled := TSWTextEdit(mnuTextTransPopup.PopupComponent).SelLength > 0; //TMemo changed to TSWTextEdit
  mnuSelectAllPopup.Enabled := TSWTextEdit(mnuTextTransPopup.PopupComponent).Text <> ''; //TMemo changed to TSWTextEdit
end;

procedure TfrmMain.mnuDeletePopupClick(Sender: TObject);
begin
  TSWTextEdit(TPopupMenu(TMenuItem(Sender).GetParentMenu).PopupComponent).SelText := ''; //TMemo changed to TSWTextEdit
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
//Called when a node's selection state has changed.
procedure TfrmMain.lstSubtitlesChange(Sender: TBaseVirtualTree; Node: PVirtualNode);
begin
  if ShouldRefreshTimes then
    if Assigned(Node) //regular selection
    or (GetKeyState(VK_SHIFT) < 0) //Shift key is held - SHIFT+HOME, SHIFT+END, etc.
    //or ((lstSubtitles.SelectedCount = 1) and (ShouldRefreshTimes2)) //selection of one node with the mouse after multiple nodes were selected
    //or ((lstSubtitles.SelectedCount = 0) and (ShouldRefreshTimes2)) //deselect all nodes (click in empty space)
    or ShouldRefreshTimes2 //the mouse is down
    then
      RefreshTimes;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.UpdateStatusbarWidths;
begin
  if mnuShowTimeControls.Checked then
  begin
    sbStatusbar.Panels[0].Width := pnlEditingControls.Left + pnlTimingControls.Width + 4;
    sbStatusbar.Panels[1].Width := mmoSubtitleText.Width + 4 + 4*Integer(mnuTranslatorMode.Checked=False);
  end else
  begin
    sbStatusbar.Panels[0].Width := 213;
    sbStatusbar.Panels[1].Width := mmoSubtitleText.Width - sbStatusbar.Panels[0].Width + (pnlControl.Width+pnlControl.Left)*Integer(mnuShowLeftPanel.Checked) + 8 + 4*Integer(mnuTranslatorMode.Checked=False);
  end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.mnuRefreshLanguageFilesClick(Sender: TObject);
var
  i, ini, sec, key: Integer;
  eng, lang: TMemIniFile;
  SectionsEng: TStringList;
  KeysEng: array of TStringList;
  ValuesEng: array of TStringList;
  ChangesCount: array of Cardinal;
  Changes: String;
begin
  if mnuLanguage.Count > 3 then
  begin
    for i := 2 to mnuLanguage.Count - 1 do
      if mnuLanguage.Items[i].Caption = 'English' then
      begin
        Screen.Cursor := crHourglass;
        eng := TMemIniFile.Create('Langs\English.lng');
        try
          //Initialize Report info:
          SetLength(ChangesCount, mnuLanguage.Count);
          Changes := FilesRefreshedStr + ':' + #13#10#13#10;
          //read all SECTION names from the English.lng file
          SectionsEng := TStringList.Create;
          eng.ReadSections(SectionsEng);
          //read all KEYS and VALUES from all sections of the English.lng file
          SetLength(KeysEng, SectionsEng.Count);
          SetLength(ValuesEng, SectionsEng.Count);
          for sec := 0 to SectionsEng.Count-1 do
          begin
            KeysEng[sec] := TStringList.Create;
            eng.ReadSection(SectionsEng[sec], KeysEng[sec]);
            ValuesEng[sec] := TStringList.Create;
            eng.ReadSectionValues(SectionsEng[sec], ValuesEng[sec]);
          end;
          //Compare the English.lng file with all the other language files
          for ini := 2 to mnuLanguage.Count - 1 do
            if mnuLanguage.Items[ini].Caption <> 'English' then
            begin
              ChangesCount[ini] := 0; //Report info
              lang := TMemIniFile.Create('Langs\' + mnuLanguage.Items[ini].Caption + '.lng');
              try
                //Refresh lang file with missing strings
                for sec := 0 to SectionsEng.Count-1 do //check all sections
                  if lang.SectionExists(SectionsEng[sec]) then
                  //Section exists
                  begin
                    for key := 0 to KeysEng[sec].Count-1 do //check all keys in the section
                      if lang.ValueExists(SectionsEng[sec], KeysEng[sec][key]) = False then
                      //Key does not exist, so we add it along with its english value
                      begin
                        lang.WriteString(SectionsEng[sec], KeysEng[sec][key], Copy(ValuesEng[sec][key],Pos('=',ValuesEng[sec][key])+1,MaxInt));
                        Inc(ChangesCount[ini]); //Report info
                      end;
                  end else
                  //Section does not exist, so we add it along with all its keys and their english values
                  begin
                    for key := 0 to KeysEng[sec].Count-1 do
                    begin
                      lang.WriteString(SectionsEng[sec], KeysEng[sec][key], Copy(ValuesEng[sec][key],Pos('=',ValuesEng[sec][key])+1,MaxInt));
                      Inc(ChangesCount[ini]); //Report info
                    end;
                  end;
                if ChangesCount[ini] > 0 then
                  lang.UpdateFile; //Update actual .lng file
              finally
                lang.Free; //Free language ini file
              end;
              Changes := Changes + mnuLanguage.Items[ini].Caption + ':' + ' ' + IntToStr(ChangesCount[ini]) + ' ' + KeysStr + #13#10; //Add report info
            end;
          //Free English file data:
          for sec := 0 to SectionsEng.Count-1 do
          begin
            KeysEng[sec].Free;
            ValuesEng[sec].Free;
          end;
          SectionsEng.Free;
          //Display report:
          MsgBox(Changes, BTN_OK, '', '', MB_ICONINFORMATION, Self);
        finally
          eng.Free; //Free English ini file
          Screen.Cursor := crDefault;
        end;
        break;
      end;
  end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.mnuAROriginalClick(Sender: TObject); begin SetAspectRatio(-1.0); end;
procedure TfrmMain.mnuAR4_3Click(Sender: TObject);      begin SetAspectRatio(4/3);  end;
procedure TfrmMain.mnuAR16_9Click(Sender: TObject);     begin SetAspectRatio(16/9); end;
procedure TfrmMain.mnuAR185_1Click(Sender: TObject);    begin SetAspectRatio(1.85); end;
procedure TfrmMain.mnuAR235_1Click(Sender: TObject);    begin SetAspectRatio(2.35); end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.lstSubtitlesExit(Sender: TObject);
var
  i: Integer;
begin
  //reset defaults in case focus was lost before keyUp or mouseUp
  ShouldRefreshTimes := False;
  ShouldRefreshTimes2 := False;
  for i := 0 to lstSubtitles.Header.Columns.Count-1 do
    lstSubtitles.Header.Columns[i].Options := lstSubtitles.Header.Columns[i].Options + [coAllowFocus];
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
//Swap the positions of the Text and Translation fields, when the Text and Translation columns positions were swapped
procedure TfrmMain.RepositionTextTrans;
var
  b: Boolean;
begin
  b := lstSubtitles.Header.Columns[4].Position < lstSubtitles.Header.Columns[3].Position;
  if TextTransColsSwapped <> b then
  begin
    TextTransColsSwapped := b;
    if mnuTranslatorMode.Checked and TextTransColsSwapped then
      mmoTranslation.Left := 0 else
      mmoSubtitleText.Left := 0;
    SetTranslationCtrlsPositions;
    RefreshStatusbar;
  end;
end;

procedure TfrmMain.lstSubtitlesHeaderDragged(Sender: TVTHeader; Column: TColumnIndex; OldPosition: Integer);
begin
  RepositionTextTrans;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.lstSubtitlesHeaderClick(Sender: TVTHeader; HitInfo: TVTHeaderHitInfo);
var
  WidthsSum: Integer;
begin
  case HitInfo.Column of
    1:
      mnuSort.Click;
    3, 4:
      if mnuTranslatorMode.Checked then
      begin
        WidthsSum := lstSubtitles.Header.Columns[3].Width + lstSubtitles.Header.Columns[4].Width;
        lstSubtitles.Header.Columns[3].Width := WidthsSum div 2;
        lstSubtitles.Header.Columns[4].Width := WidthsSum - lstSubtitles.Header.Columns[3].Width;
        TextTransColsRatio := 0.5;
      end;
  end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
//Intercept TAB key press when necessary (e.g. when in-place edition is used)
procedure TfrmMain.CMDialogKey(var AMessage: TCMDialogKey);
begin
  if (AMessage.CharCode = VK_TAB) and (InterceptTabKey = True) then
  begin
    AMessage.Result := 1;
  end else
    inherited;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TfrmMain.RestoreTopMostWindows;
  procedure RestoreTopMostWindow(form: TForm);
  begin
    if Assigned(form) then
      SetWindowPos(form.Handle, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE + SWP_NOSIZE);
  end;
begin
  RestoreTopMostWindow(frmInfoErrors);
  RestoreTopMostWindow(frmVariousInfo);
  RestoreTopMostWindow(sdSymbolDialogue.Form);
end;
//added by adenry: end

// -----------------------------------------------------------------------------

end.
