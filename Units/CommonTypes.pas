// This file is part of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle Workshop's copyright information
// File Description: Common type definitions

unit CommonTypes;

interface

uses
  Controls, StdCtrls, ComCtrls, ExtCtrls, Messages, Classes, Windows, RichEdit;

type

  // Adjust Subtitles sync point
  TSyncPoint = record
    LineNum : Integer;
    OldTime : Integer;
    NewTime : Integer;
  end;
  PSyncPoint = ^TSyncPoint;
  TClassicSyncPoints = record
    Point1Sub, Point1Movie: Integer;
    Point2Sub, Point2Movie: Integer;
  end;

  //added by adenry: begin
  //Interceptor classes to handle paste operations for existing controls
  TMemo = class(StdCtrls.TMemo)
  protected
    procedure WMPaste(var Msg: TWMPaste); message WM_PASTE;
  end;
  TEdit = class(StdCtrls.TEdit)
  protected
    procedure WMPaste(var Msg: TWMPaste); message WM_PASTE;
  end;
  TLabeledEdit = class(ExtCtrls.TLabeledEdit)
  protected
    procedure WMPaste(var Msg: TWMPaste); message WM_PASTE;
  end;
  TComboBox = class(StdCtrls.TComboBox)
  protected
    procedure WMPaste(var Msg: TWMPaste); message WM_PASTE;
  end;
  //added by adenry: end

  //added by adenry: begin
  //Interceptor calss for TRichEdit
  TRichEdit = Class(ComCtrls.TRichEdit)
  protected
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
  end;
  //added by adenry: end

  //Interceptor classes to extend existing controls
  TExtRichEdit = Class(TRichEdit) //by BDZL
  public
    property OnDblClick;
  end;
  TExtWinControl = Class(TWinControl) //by adenry
  published
    property Font;
  end;

  //Subtitle Workshop Memo
  TSWTextEdit = TRichEdit; //added by adenry - so that we could easily switch between TMemo and TRichEdit if we have to
  //To switch between TMemo and TRichEdit in design view:
  //1. Change TSWTextEdit above
  //2. Rename the current mmoSubtitleText and mmoTranslation controls and make them invisible
  //3. Rename the new controls to mmoSubtitleText and mmoTranslation and make them visible
  //4. Do the same for mmoSub1 and mmoSub2 in formDivideLines

  //INFORMATION AND ERRORS TYPES
  TUnnecessarySpaces = set of (EntersAndSpacesBeginningEnd,
                               SpacesBetweenEnters,
                               DoubleSpacesAndEnters,
                               SpacesFrontPunctuation,
                               SpacesAfterQuestionAndExclamation,
                               SpacesBeforeQuestionAndExclamation,
                               SpacesBetweenNumbers);
  TErrors = record
    eLinesWithoutLetters      : Boolean;
    eEmptySubtitle            : Boolean;
    // ------------------------------
    eOverlapping              : Boolean;
    eBadValues                : Boolean;
    eTooLongDurations         : Boolean;
    eTooShortDurations        : Boolean;
    eTooLongLines             : Boolean;
    eOverTwoLines             : Boolean;
    // ------------------------------
    eHearingImpaired          : Boolean;
    eTextBeforeColon          : Boolean;
     eOnlyIfCapitalLetters    : Boolean;
    eUnnecessaryDots          : Boolean;
    eProhibitedCharacter      : Boolean;
    eRepeatedCharacter        : Boolean;
    eRepeatedSubtitle         : Boolean;
    eOCRErrors                : Boolean;
    // ------------------------------
    eOpnDlgSubsOneLine        : Boolean;
    eSpaceAfterCustChars      : Boolean;
    eSpaceBeforeCustChars     : Boolean;
    eUnnecessarySpaces        : Boolean;
     eWhatUnnecessarySpaces   : TUnnecessarySpaces;
    // ------------------------------
    eUnnecessaryTags          : Boolean;//added by adenry
    eDashOnFirstLine          : Boolean;//added by adenry
     eOnlyIfNoDashOnSecondLine: Boolean;//added by adenry
    eTooMuchCPS               : Boolean;//added by adenry
    eTooShortPause            : Boolean;//added by adenry
    eDialogueOnOneLine        : Boolean;//added by adenry
  end;
  TFixTypes = (ftLinesWithoutLettersDeleted,
               ftEmptySubtitleDeleted,
               // ------------------------------
               ftOverlapping,
               ftBadValues,
               ftOverTwoLinesAdjusted,
               // ------------------------------
               ftHearingImpairedDeleted,
               ftHearingImpairedPartDeleted,
               ftTextBeforeColon,
               ftUnnecessaryDots,
               ftSubDeletedProhibitedCharacter,
               ftRepeatedCharacter,
               ftRepeatedSubtitle,
               ftOCRErrors,
               // ------------------------------
               ftOpnDlgOneLineSubDeleted,
               ftSpaceAfterCustChars,
               ftSpaceBeforeCustChars,
               ftUnnecessarySpaces,
               // ------------------------------
               {ftMarkedSubtitles,//added by adenry
               ftTooLongDurations,//added by adenry
               ftTooShortDurations,//added by adenry
               ftTooLongLines,//added by adenry}
               // ------------------------------
               ftUnnecessaryTags,//added by adenry
               ftDashOnFirstLine,//added by adenry
               ftTooMuchCPS,//added by adenry
               ftTooShortPause,//added by adenry
               ftDialogueOnOneLine//added by adenry
               );
  TFixTypesSet = set of TFixTypes;
  //added by adenry: begin
  //IMPORTANT: Do NOT rearrange the members of this type!
  TMarkFlag = (mfEnabled,
               mfColNum,
               mfColShow,
               mfColHide,
               mfColText,
               mfColTrans,
               mfBold,
               mfItalic,
               mfUnderline,
               mfStrikeOut,
               mfColPause, //added later
               mfColDur    //added later
               );
  TMarkFlags = set of TMarkFlag;
  //added by adenry: end 
  //added by adenry: begin
  TRecheckTypes = (rtNormal,
                   rtSubAdded,
                   rtSubDeleted
                   );
  //added by adenry: end
  //Error Type
  TErrorType = (etLinesWithoutLetters,
                etEmptySubtitle,
                // ----------------------
                etOverlapping,
                etBadValues,
                etTooLongDuration,
                etTooShortDuration,
                etTooLongLine,
                etOverTwoLines,
                // ----------------------
                etHearingImpaired,
                etTextBeforeColon,
                etUnnecessaryDots,
                etProhibitedCharacter,
                // ----------------------
                etRepeatedCharacter,
                etRepeatedSubtitle,
                etOCRErrors,
                // ----------------------
                etOpnDlgSubsOneLine,
                etSpaceAfterCustChars,
                etSpaceBeforeCustChars,
                etUnnecessarySpaces,
                etUnnecessaryTags,//added by adenry
                etDashOnFirstLine,//added by adenry
                etTooMuchCPS,//added by adenry
                etTooShortPause,//added by adenry
                etDialogueOnOneLine//added by adenry
                );
  TErrorTypeSet = set of TErrorType;

  //Subtitle Item
  TSubtitleItem = record
    InitialTime, FinalTime : Integer; // MILLISECONDS
    Text, Translation      : String;
    Marked                 : Boolean;
    ErrorType              : set of TErrorType;
  end;
  PSubtitleItem = ^TSubtitleItem;

  //added by adenry: begin
  //Undo Action Name
  TUndoActionName = (uanTextEdit, uanTransEdit, uanShowEdit, uanHideEdit, uanPauseEdit, uanDurEdit, uanInputFPSEdit, uanFPSEdit, //subtitle edit
                     uanItalic, uanBold, uanUnderline, uanColor, uanRemoveColor, uanRemoveAllTags, //text style
                     uanInsert, uanInsertBefore, uanRemoveSelected, uanCut, uanPaste, uanSwap, //EDIT MENU
                     uanSetDurLimits, uanSetDelay, uanAdjustSubs, uanAdjustToSynchSubs, uanTimeExpRed, uanExtLen, uanExtLen2, uanAutoDur, uanReadTimeFromFile, uanSetPauses, uanShiftPlus, uanShiftMinus, uanShiftToNext, uanShiftToPrev, uanRoundTimeValues, //EDIT -> TIMINGS MENU
                     uanSmartLineAdjust, uanFastSmartLineAdj, uanConvertCase, uanUnbreakSubs, uanFastUnbreakSubs, uanDivideLines, uanFastDivideLines, uanSetMaxLineLength, uanReadTextsFromFile, //EDIT -> TEXTS MENU
                     uanAutoCombineSubs, uanCombineSubs, uanTypeEffect, uanFlashEffect, uanRTLReverseText, uanRTLFixPunctuation, uanSort, uanDelUnnecessaryLinks, uanDelDotsAtBeginning, uanMark, uanUnmark, //EDIT -> SUBTITLES MENU
                     uanSearchAndReplace, uanSpellCheck, uanInfoErrorsFix, uanFixAllErrors, uanFixErrorsSelSubs, uaPascalScript, //SEARCH MENU, TOOLS MENU
                     uanMovieMoveSubtitle, uanMovieSetStartTime, uanMovieSetFinalTime, uanMovieStartEndSubTime, uanAdjustSubsSyncPoints //MOVIE MENU
                     );
  //added by adenry: end

  //added by adenry: begin
  TOutputSettingsFormats = record
    FormatName: String;
    AlwaysShow: Boolean;
  end;
  //added by adenry: end

// -----------------------------------------------------------------------------

implementation

uses
  formMain;

// -----------------------------------------------------------------------------

//Completely remove the auto keyboard switching feature, which RichEdit controls can turn on by itself
procedure TRichEdit.KeyDown(var Key: Word; Shift: TShiftState);
var
  i: Integer;
begin
  i := SendMessage(Handle, EM_GETLANGOPTIONS, 0, 0);    //get current lang options
  i := i and not IMF_AUTOKEYBOARD;                      //remove auto keyboard from current lang options
  SendMessage(Handle, EM_SETLANGOPTIONS, 0, LPARAM(i)); //set new lang options
  inherited;
end;

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TMemo.WMPaste(var Msg: TWMPaste);         begin frmMain.mnuPasteClick(frmMain); end;
procedure TEdit.WMPaste(var Msg: TWMPaste);         begin frmMain.mnuPasteClick(frmMain); end;
procedure TComboBox.WMPaste(var Msg: TWMPaste);     begin frmMain.mnuPasteClick(frmMain); end;
procedure TLabeledEdit.WMPaste(var Msg: TWMPaste);  begin frmMain.mnuPasteClick(frmMain); end;
//added by adenry: end

// -----------------------------------------------------------------------------

end.
