// This file is part of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle Workshop's copyright information
// File Description: Subtitle Workshop main project file

program SubtitleWorkshop;


uses
  Forms,
  IniFiles,
  SysUtils,
  Windows,
  Messages,
  formAbout in 'Forms\formAbout.pas' {frmAbout},
  formAdjustSubsEnterNewSyncPoint in 'Forms\formAdjustSubsEnterNewSyncPoint.pas' {frmEnterNewSyncPoint},
  formAdjustSubtitles in 'Forms\formAdjustSubtitles.pas' {frmAdjustSubtitles},
  formAutomaticDurations in 'Forms\formAutomaticDurations.pas' {frmAutomaticDurations},
  formBatchConvert in 'Forms\formBatchConvert.pas' {frmBatchConvert},
  formConvertCase in 'Forms\formConvertCase.pas' {frmConvertCase},
  formCustomFormats in 'Forms\formCustomFormats.pas' {frmCustomFormats},
  formDivideLines in 'Forms\formDivideLines.pas' {frmDivideLines},
  formDurationLimits in 'Forms\formDurationLimits.pas' {frmDurationLimits},
  formInfoErrors in 'Forms\formInfoErrors.pas' {frmInfoErrors},
  formInfoErrorsSettings in 'Forms\formInfoErrorsSettings.pas' {frmInfoErrorsSettings},
  formJoin in 'Forms\formJoin.pas' {frmJoin},
  formMain in 'Forms\formMain.pas' {frmMain},
  formOutputSettings in 'Forms\formOutputSettings.pas' {frmOutputSettings},
  formSAMILangExtractor in 'Forms\formSAMILangExtractor.pas' {frmSAMILangExtractor},
  formSaveAs in 'Forms\formSaveAs.pas' {frmSaveAs},
  formSearchAndReplace in 'Forms\formSearchAndReplace.pas' {frmSearchAndReplace},
  formSetDelay in 'Forms\formSetDelay.pas' {frmSetDelay},
  formSetPauses in 'Forms\formSetPauses.pas' {frmSetPauses},
  formSettings in 'Forms\formSettings.pas' {frmSettings},
  formSplit in 'Forms\formSplit.pas' {frmSplit},
  formTimeExpanderReducer in 'Forms\formTimeExpanderReducer.pas' {frmTimeExpanderReducer},
  formVariousInfo in 'Forms\formVariousInfo.pas' {frmVariousInfo},
  formCompositeCustomInfo in 'Forms\formCompositeCustomInfo.pas' {frmCompositeCustomInfo},
  formUnbreakSubtitles in 'Forms\formUnbreakSubtitles.pas' {frmUnbreakSubtitles},
  formSmartLineAdjust in 'Forms\formSmartLineAdjust.pas' {frmSmartLineAdjust},
  formCombineSubtitles in 'Forms\formCombineSubtitles.pas' {frmCombineSubtitles},
  formRoundTimeValues in 'Forms\formRoundTimeValues.pas' {frmRoundTimeValues},
  formSubtitleAPIFormats in 'Forms\formSubtitleAPIFormats.pas' {frmSubtitleAPIFormats},
  FileTypes in 'Units\FileTypes.pas',
  Functions in 'Units\Functions.pas',
  General in 'Units\General.pas',
  CommonTypes in 'Units\CommonTypes.pas',
  InfoErrorsFunctions in 'Units\InfoErrorsFunctions.pas',
  OCRScripts in 'Units\OCRScripts.pas',
  PascalScriptsFunctions in 'Units\PascalScriptsFunctions.pas',
  Shortcuts in 'Units\Shortcuts.pas',
  TreeViewHandle in 'Units\TreeViewHandle.pas',
  Undo in 'Units\Undo.pas',
  USubtitleAdjust in 'Units\USubtitleAdjust.pas',
  USubtitleApi in 'Units\USubtitleApi.pas',
  USubtitlesFunctions in 'Units\USubtitlesFunctions.pas',
  VideoPreview in 'Units\VideoPreview.pas',
  VTInPlaceEdition in 'Units\VTInPlaceEdition.pas',
  DirectShow9 in 'Lib\DirectX\DirectShow9.pas',
  DirectDraw in 'Lib\DirectX\DirectDraw.pas',
  DirectSound in 'Lib\DirectX\DirectSound.pas',
  Direct3D9 in 'Lib\DirectX\Direct3D9.pas',
  DXTypes in 'Lib\DirectX\DXTypes.pas',
  FastStrings in 'Lib\FastStrings.pas',
  HTMLPars in 'Lib\HTMLPars.pas',
  RegExpr in 'Lib\RegExpr.pas',
  StrMan in 'Lib\StrMan.pas',
  WinShell in 'Lib\WinShell.pas';

{$R *.res}

// -----------------------------------------------------------------------------

var
  hWnd : THandle;
  cds  : CopyDataStruct;
  i    : Integer; //added by adenry
  Ini  : TIniFile;
begin
  //{$IFDEF DEBU}MemChk;{$ENDIF}  {added by Bdzl}
  Ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + '\SubtitleWorkshop.ini');
  if Ini.ReadBool('Settings', 'Allow more than one instance', True) = False then //False changed to True by adenry
  begin
    hWnd := FindWindow(SWindowClassName, nil);
    if (hWnd <> 0) then
    begin
      //added by adenry: begin
      //set focus to existing instance
      SetForegroundWindow(hWnd);
      //send all parameters to existing instance and show it
      FillChar(cds, Sizeof(cds), 0);
      for i := 1 to ParamCount do
      begin
        cds.dwData := 0;
        cds.cbData := (Length(ParamStr(i))+1)*SizeOf(Char);
        cds.lpData := PChar(ParamStr(i));
        SendMessage(hWnd, WM_COPYDATA, 0, Integer(@cds));
      end;
      //if there are no parameters, just show the existing instance
      if ParamCount = 0 then
      begin
        cds.dwData := 0;
        cds.cbData := (Length(SJustRestoreSWParam)+1)*SizeOf(Char);
        cds.lpData := PChar(SJustRestoreSWParam);
        SendMessage(hWnd, WM_COPYDATA, 0, Integer(@cds));
      end;
      //added by adenry: end

      //removed by adenry: begin
      //cds.dwData := 0;
      //cds.cbData := Length(ParamStr(1));
      //cds.lpData := PChar(ParamStr(1));
      //if ParamCount > 0 then
      //  SendMessage(hwnd,WM_COPYDATA, 0, Integer(@cds));
      //removed by adenry: end

      Ini.Free;
      ExitProcess(0);
    end;
  end;
  Ini.Free;

  Application.Initialize;
  Application.Title := 'Subtitle Workshop';
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;

end.

// -----------------------------------------------------------------------------

