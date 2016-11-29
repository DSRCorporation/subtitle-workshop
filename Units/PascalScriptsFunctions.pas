// This file is part of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle Workshop's copyright information
// File Description: Pascal Script functions

unit PascalScriptsFunctions; //added by adenry - all PS Functions moved here

interface

uses
  Forms, Controls, SysUtils,
  VirtualTrees, IFPS3CompExec,
  CommonTypes;

// -----------------------------------------------------------------------------
function  MyGetSubCount: Integer;
function  MyIsSelSub(const Num: Integer): Boolean;
function  MyGetSubText(const Num: Integer): String;
procedure MySetSubText(const Num: Integer; const Text: String);
function  MyGetSubTrans(const Num: Integer): String;
procedure MySetSubTrans(const Num: Integer; const Text: String);
function  MyGetSubInitialTime(const Num: Integer): Integer;
procedure MySetSubInitialTime(const Num: Integer; const InitialTime: Integer);
function  MyGetSubFinalTime(const Num: Integer): Integer;
procedure MySetSubFinalTime(const Num: Integer; const FinalTime: Integer);
procedure MyInsSub(const Pos: Integer; const InitialTime, FinalTime: Integer; const Text, Translation: String);
procedure MyDelSub(const Num: Integer);
function  MyMsgBox(const AMsg, BCap1, BCap2, BCap3: String; const IconInd: Integer): Integer;
function  MyIsOriginalLoaded: Boolean;
function  MyIsTranslatedLoaded: Boolean;
procedure MyEnableWorkArea;
procedure MyRandomize;
function  MyRandom(Range: Integer): Integer;
// Date and time functions
function  MyGetYear: Integer;
function  MyGetMonth: Integer;
function  MyGetDay: Integer;
function  MyGetHour: Integer;
function  MyGetMinute: Integer;
function  MyGetSecond: Integer;
function  MyGetDate: String;
function  MyGetTime: String;
function  MyGetDateTime: String;
// -----------------------------------------------------------------------------
//new PS functions by BDZL
procedure MyGoToLineNumber(const Line: Integer);
function  MyGetSWVersion(): String;
function  MyGetAPIVersion(): String;
function  MyGetOrgFilename(): String;
function  MyGetOrgFilepath(): String;
function  MyGetTransFilename(): String;
function  MyGetTransFilepath(): String;
function  MyGetMovieFilename(): String;
function  MyGetMovieFilepath(): String;
function  MyGetVideoPosTime(): String;
function  MyGetVideoPosFrames(): String;
// -----------------------------------------------------------------------------
procedure CompExecCompile(Sender: TIFPS3CompExec);
// -----------------------------------------------------------------------------

implementation

uses
  General, Functions, Undo, TreeViewHandle, VideoPreview, USubtitlesFunctions,
  formMain;

// -----------------------------------------------------------------------------

function MyGetSubCount: Integer;
begin
  frmMain.tmrPascalScriptRestoreCursor.Enabled := False; //added by adenry
  Screen.Cursor := crHourGlass; //added by adenry
  Result := frmMain.lstSubtitles.RootNodeCount;
  frmMain.tmrPascalScriptRestoreCursor.Enabled := True; //added by adenry
end;

// -----------------------------------------------------------------------------

function MyIsSelSub(const Num: Integer): Boolean;
begin
  frmMain.tmrPascalScriptRestoreCursor.Enabled := False; //added by adenry
  Screen.Cursor := crHourGlass; //added by adenry
  Result := frmMain.lstSubtitles.Selected[GetNodeWithIndex(frmMain.lstSubtitles, Num)];
  frmMain.tmrPascalScriptRestoreCursor.Enabled := True; //added by adenry
end;

// -----------------------------------------------------------------------------

function MyGetSubText(const Num: Integer): String;
begin
  frmMain.tmrPascalScriptRestoreCursor.Enabled := False; //added by adenry
  Screen.Cursor := crHourGlass; //added by adenry
  Result := GetSubText(GetNodeWithIndex(frmMain.lstSubtitles, Num));
  frmMain.tmrPascalScriptRestoreCursor.Enabled := True; //added by adenry
end;

// -----------------------------------------------------------------------------

procedure MySetSubText(const Num: Integer; const Text: String);
var
  Node       : PVirtualNode;
  UndoAction : PUndoAction;
begin
  frmMain.tmrPascalScriptRestoreCursor.Enabled := False; //added by adenry
  Screen.Cursor := crHourGlass; //added by adenry
  Node := GetNodeWithIndex(frmMain.lstSubtitles, Num);
  New(UndoAction);
  UndoAction^.UndoActionType := uaFullTextChange;
  UndoAction^.UndoActionName := uaPascalScript; //added by adenry
  UndoAction^.Node           := Node;
  UndoAction^.LineNumber     := Node.Index;
  UndoAction^.BindToNext     := True;
  UndoAction^.BufferSize     := SizeOf(TFullTextChange);
  UndoAction^.Buffer         := AllocMem(UndoAction^.BufferSize);
  PFullTextChange(UndoAction^.Buffer)^.OriginalOnly := True;
  PFullTextChange(UndoAction^.Buffer)^.OldText      := GetSubText(Node);
  PFullTextChange(UndoAction^.Buffer)^.OldTrans     := '';
  AddUndo(UndoAction);
  SetText(Node, Text);
  if frmMain.AutoRecheckOnScripts = 2 then       //added by adenry
    frmMain.AutoRecheckNodeErrorsAndRepaint(Node, TextErrors); //added by adenry
  frmMain.tmrPascalScriptRestoreCursor.Enabled := True; //added by adenry
end;

// -----------------------------------------------------------------------------

function MyGetSubTrans(const Num: Integer): String;
begin
  frmMain.tmrPascalScriptRestoreCursor.Enabled := False; //added by adenry
  Screen.Cursor := crHourGlass; //added by adenry
  Result := GetSubTranslation(GetNodeWithIndex(frmMain.lstSubtitles, Num));
  frmMain.tmrPascalScriptRestoreCursor.Enabled := True; //added by adenry
end;

// -----------------------------------------------------------------------------

procedure MySetSubTrans(const Num: Integer; const Text: String);
var
  Node       : PVirtualNode;
  UndoAction : PUndoAction;
begin
  frmMain.tmrPascalScriptRestoreCursor.Enabled := False; //added by adenry
  Screen.Cursor := crHourGlass; //added by adenry
  Node := GetNodeWithIndex(frmMain.lstSubtitles, Num);
  New(UndoAction);
  UndoAction^.UndoActionType := uaFullTextChange;
  UndoAction^.UndoActionName := uaPascalScript; //added by adenry
  UndoAction^.Node           := Node;
  UndoAction^.LineNumber     := Node.Index;
  UndoAction^.BindToNext     := True;
  UndoAction^.BufferSize     := SizeOf(TFullTextChange);
  UndoAction^.Buffer         := AllocMem(UndoAction^.BufferSize);
  PFullTextChange(UndoAction^.Buffer)^.OriginalOnly := False;
  PFullTextChange(UndoAction^.Buffer)^.OldText      := GetSubText(Node);
  PFullTextChange(UndoAction^.Buffer)^.OldTrans     := GetSubTranslation(Node);
  AddUndo(UndoAction);
  SetTranslation(Node, Text);
  {if frmMain.AutoRecheckOnScripts = 2 then       //added by adenry
    frmMain.AutoRecheckNodeErrorsAndRepaint(Node, TextErrors); //added by adenry}
  frmMain.tmrPascalScriptRestoreCursor.Enabled := True; //added by adenry
end;

// -----------------------------------------------------------------------------

function MyGetSubInitialTime(const Num: Integer): Integer;
begin
  frmMain.tmrPascalScriptRestoreCursor.Enabled := False; //added by adenry
  Screen.Cursor := crHourGlass; //added by adenry
  Result := GetStartTime(GetNodeWithIndex(frmMain.lstSubtitles, Num));
  frmMain.tmrPascalScriptRestoreCursor.Enabled := True; //added by adenry
end;

// -----------------------------------------------------------------------------

procedure MySetSubInitialTime(const Num: Integer; const InitialTime: Integer);
var
  Node       : PVirtualNode;
  UndoAction : PUndoAction;
begin
  frmMain.tmrPascalScriptRestoreCursor.Enabled := False; //added by adenry
  Screen.Cursor := crHourGlass; //added by adenry
  Node := GetNodeWithIndex(frmMain.lstSubtitles, Num);
  New(UndoAction);
  UndoAction^.UndoActionType                 := uaTimeChange;
  UndoAction^.UndoActionName                 := uaPascalScript; //added by adenry
  UndoAction^.BufferSize                     := SizeOf(TTimeChange);
  UndoAction^.Buffer                         := AllocMem(UndoAction^.BufferSize);
  UndoAction^.Node                           := Node;
  UndoAction^.LineNumber                     := Node.Index;
  UndoAction^.BindToNext                     := True;
  PTimeChange(UndoAction^.Buffer)^.StartTime := GetStartTime(Node);
  PTimeChange(UndoAction^.Buffer)^.FinalTime := -1;
  AddUndo(UndoAction);
  SetStartTime(Node, InitialTime);
  if frmMain.AutoRecheckOnScripts = 2 then       //added by adenry
    frmMain.AutoRecheckNodeErrorsAndRepaint(Node, TimeErrors); //added by adenry
  frmMain.tmrPascalScriptRestoreCursor.Enabled := True; //added by adenry
end;

// -----------------------------------------------------------------------------

function MyGetSubFinalTime(const Num: Integer): Integer;
begin
  frmMain.tmrPascalScriptRestoreCursor.Enabled := False; //added by adenry
  Screen.Cursor := crHourGlass; //added by adenry
  Result := GetFinalTime(GetNodeWithIndex(frmMain.lstSubtitles, Num));
  frmMain.tmrPascalScriptRestoreCursor.Enabled := True; //added by adenry
end;

// -----------------------------------------------------------------------------

procedure MySetSubFinalTime(const Num: Integer; const FinalTime: Integer);
var
  Node       : PVirtualNode;
  UndoAction : PUndoAction;
begin
  frmMain.tmrPascalScriptRestoreCursor.Enabled := False; //added by adenry
  Screen.Cursor := crHourGlass; //added by adenry
  Node := GetNodeWithIndex(frmMain.lstSubtitles, Num);
  New(UndoAction);
  UndoAction^.UndoActionType                 := uaTimeChange;
  UndoAction^.UndoActionName                 := uaPascalScript; //added by adenry
  UndoAction^.BufferSize                     := SizeOf(TTimeChange);
  UndoAction^.Buffer                         := AllocMem(UndoAction^.BufferSize);
  UndoAction^.Node                           := Node;
  UndoAction^.LineNumber                     := Node.Index;
  UndoAction^.BindToNext                     := True;
  PTimeChange(UndoAction^.Buffer)^.StartTime := -1;
  PTimeChange(UndoAction^.Buffer)^.FinalTime := GetFinalTime(Node);
  AddUndo(UndoAction);
  SetFinalTime(Node, FinalTime);
  if frmMain.AutoRecheckOnScripts = 2 then       //added by adenry
  begin
    frmMain.AutoRecheckNodeErrorsAndRepaint(Node, TimeErrors); //added by adenry
    frmMain.AutoRecheckNodeErrorsAndRepaint(Node.NextSibling, PauseErrors); //added by adenry
  end;
  frmMain.tmrPascalScriptRestoreCursor.Enabled := True; //added by adenry
end;

// -----------------------------------------------------------------------------

procedure MyInsSub(const Pos: Integer; const InitialTime, FinalTime: Integer; const Text, Translation: String);
var
  P          : Cardinal;
  Data       : PSubtitleItem;
  Node       : PVirtualNode;
  Node2      : PVirtualNode;
  UndoAction : PUndoAction;
begin
  frmMain.tmrPascalScriptRestoreCursor.Enabled := False; //added by adenry
  Screen.Cursor := crHourGlass; //added by adenry
  if Pos > Integer(frmMain.lstSubtitles.RootNodeCount) then
    P := frmMain.lstSubtitles.RootNodeCount-1 else
  if Pos < 0 then P := 0 else
    P := Pos;
    
  if (frmMain.lstSubtitles.RootNodeCount = 0) or (P = 0) then
    Node2 := frmMain.lstSubtitles.InsertNode(frmMain.lstSubtitles.RootNode, amAddChildFirst) else
  if (P = frmMain.lstSubtitles.RootNodeCount) then
    Node2 := frmMain.lstSubtitles.InsertNode(frmMain.lstSubtitles.GetLast, amInsertAfter) else
  begin
    Node := frmMain.lstSubtitles.GetFirst;
    while Node.Index < P do
      Node := Node.NextSibling;
    Node2 := frmMain.lstSubtitles.InsertNode(Node.PrevSibling, amInsertAfter);
  end;

  if not (vsInitialized in Node2.States) then Include(Node2.States, vsInitialized);

  if Assigned(Node2) then
  begin
    with frmMain do
    begin
      New(UndoAction);
      UndoAction^.UndoActionType := uaInsertLine;
      UndoAction^.UndoActionName := uaPascalScript; //added by adenry
      UndoAction^.LineNumber     := Node2.Index;
      UndoAction^.Node           := Node2;
      UndoAction^.BindToNext     := True;
      UndoAction^.Buffer         := nil;
      UndoAction^.BufferSize     := 0;
      AddUndo(UndoAction);
      if AutoRecheckOnScripts = 2 then       //added by adenry
      begin
        AutoRecheckNodeErrorsAndRepaint(Node2); //added by adenry
        AutoRecheckNodeErrorsAndRepaint(Node2.NextSibling, PauseErrors); //added by adenry
      end;
    end;

    Data := frmMain.lstSubtitles.GetNodeData(Node2);
    Data^.InitialTime := InitialTime;
    Data^.FinalTime   := FinalTime;
    Data^.Text        := Text;
    Data^.Translation := Translation;
    Data^.Marked      := False;
    Data^.ErrorType   := [];
  end;
  frmMain.tmrPascalScriptRestoreCursor.Enabled := True; //added by adenry
end;

// -----------------------------------------------------------------------------

procedure MyDelSub(const Num: Integer);
var
  Node       : PVirtualNode;
  Data       : PSubtitleItem;
  UndoAction : PUndoAction;
begin
  frmMain.tmrPascalScriptRestoreCursor.Enabled := False; //added by adenry
  Screen.Cursor := crHourGlass; //added by adenry
  Node := GetNodeWithIndex(frmMain.lstSubtitles, Num);
  Data := frmMain.lstSubtitles.GetNodeData(Node);
  New(UndoAction);
  UndoAction^.BufferSize                        := SizeOf(TLineChange);
  UndoAction^.Buffer                            := AllocMem(UndoAction^.BufferSize);
  UndoAction^.UndoActionType                    := uaDeleteLine;
  UndoAction^.UndoActionName                    := uaPascalScript; //added by adenry
  UndoAction^.BindToNext                        := True;
  UndoAction^.LineNumber                        := Node.Index;
  PLineChange(UndoAction^.Buffer)^.SubtitleItem := Data^;
  AddUndo(UndoAction);
  frmMain.lstSubtitles.DeleteNode(Node);
  if frmMain.AutoRecheckOnScripts = 2 then       //added by adenry
    frmMain.AutoRecheckNodeErrorsAndRepaint(GetNodeWithIndex(frmMain.lstSubtitles, Num), PauseErrors); //added by adenry
  frmMain.tmrPascalScriptRestoreCursor.Enabled := True; //added by adenry
end;

// -----------------------------------------------------------------------------

function MyMsgBox(const AMsg, BCap1, BCap2, BCap3: String; const IconInd: Integer): Integer;
begin
  Result := MsgBox(AMsg, BCap1, BCap2, BCap3, IconInd, frmMain, frmMain.Font.Charset);
end;

// -----------------------------------------------------------------------------

function MyIsOriginalLoaded: Boolean;
begin
  frmMain.tmrPascalScriptRestoreCursor.Enabled := False; //added by adenry
  Screen.Cursor := crHourGlass; //added by adenry
  Result := (frmMain.OrgFile <> '') or (frmMain.lstSubtitles.RootNodeCount > 0);
  frmMain.tmrPascalScriptRestoreCursor.Enabled := True; //added by adenry
end;

// -----------------------------------------------------------------------------

function MyIsTranslatedLoaded: Boolean;
begin
  frmMain.tmrPascalScriptRestoreCursor.Enabled := False; //added by adenry
  Screen.Cursor := crHourGlass; //added by adenry
  Result := (frmMain.TransFile <> '') or (frmMain.lstSubtitles.RootNodeCount > 0);
  frmMain.tmrPascalScriptRestoreCursor.Enabled := True; //added by adenry
end;

// -----------------------------------------------------------------------------

procedure MyEnableWorkArea;
begin
  frmMain.tmrPascalScriptRestoreCursor.Enabled := False; //added by adenry
  Screen.Cursor := crHourGlass; //added by adenry
  with frmMain do
  begin
    ClearUndoList(UndoList);
    ClearUndoList(RedoList);
    setUndoEnabled(False);//modified by adenry //mnuUndo.Enabled := False;
    setRedoEnabled(False); //modified by adenry //mnuRedo.Enabled := False;
    if UndoNumWhenOrgSaved <> 0 then UndoNumWhenOrgSaved := -1; //added by adenry
    if UndoNumWhenTransSaved <> 0 then UndoNumWhenTransSaved := -1; //added by adenry
    SetFormCaption;
    RefreshTimes;
    EnableCtrls(True);
  end;
  frmMain.tmrPascalScriptRestoreCursor.Enabled := True; //added by adenry
end;

// -----------------------------------------------------------------------------

procedure MyRandomize;
begin
  frmMain.tmrPascalScriptRestoreCursor.Enabled := False; //added by adenry
  Screen.Cursor := crHourGlass; //added by adenry
  Randomize;
  frmMain.tmrPascalScriptRestoreCursor.Enabled := True; //added by adenry
end;

// -----------------------------------------------------------------------------

function MyRandom(Range: Integer): Integer;
begin
  frmMain.tmrPascalScriptRestoreCursor.Enabled := False; //added by adenry
  Screen.Cursor := crHourGlass; //added by adenry
  Result := Random(Range);
  frmMain.tmrPascalScriptRestoreCursor.Enabled := True; //added by adenry
end;

// -----------------------------------------------------------------------------
// Date and time functions
// -----------------------------------------------------------------------------

function MyGetYear: Integer;
var
  YY, MM, DD: Word;
begin
  frmMain.tmrPascalScriptRestoreCursor.Enabled := False; //added by adenry
  Screen.Cursor := crHourGlass; //added by adenry
  DecodeDate(Now, YY, MM, DD);
  Result := YY;
  frmMain.tmrPascalScriptRestoreCursor.Enabled := True; //added by adenry
end;

// -----------------------------------------------------------------------------

function MyGetMonth: Integer;
var
  YY, MM, DD: Word;
begin
  frmMain.tmrPascalScriptRestoreCursor.Enabled := False; //added by adenry
  Screen.Cursor := crHourGlass; //added by adenry
  DecodeDate(Now, YY, MM, DD);
  Result := MM;
  frmMain.tmrPascalScriptRestoreCursor.Enabled := True; //added by adenry
end;

// -----------------------------------------------------------------------------

function MyGetDay: Integer;
var
  YY, MM, DD: Word;
begin
  frmMain.tmrPascalScriptRestoreCursor.Enabled := False; //added by adenry
  Screen.Cursor := crHourGlass; //added by adenry
  DecodeDate(Now, YY, MM, DD);
  Result := DD;
  frmMain.tmrPascalScriptRestoreCursor.Enabled := True; //added by adenry
end;

// -----------------------------------------------------------------------------

function MyGetHour: Integer;
var
  HH, MM, SS, MS: Word;
begin
  frmMain.tmrPascalScriptRestoreCursor.Enabled := False; //added by adenry
  Screen.Cursor := crHourGlass; //added by adenry
  DecodeTime(Time, HH, MM, SS, MS);
  Result := HH;
  frmMain.tmrPascalScriptRestoreCursor.Enabled := True; //added by adenry
end;

// -----------------------------------------------------------------------------

function MyGetMinute: Integer;
var
  HH, MM, SS, MS: Word;
begin
  frmMain.tmrPascalScriptRestoreCursor.Enabled := False; //added by adenry
  Screen.Cursor := crHourGlass; //added by adenry
  DecodeTime(Time, HH, MM, SS, MS);
  Result := MM;
  frmMain.tmrPascalScriptRestoreCursor.Enabled := True; //added by adenry
end;

// -----------------------------------------------------------------------------

function MyGetSecond: Integer;
var
  HH, MM, SS, MS: Word;
begin
  frmMain.tmrPascalScriptRestoreCursor.Enabled := False; //added by adenry
  Screen.Cursor := crHourGlass; //added by adenry
  DecodeTime(Time, HH, MM, SS, MS);
  Result := SS;
  frmMain.tmrPascalScriptRestoreCursor.Enabled := True; //added by adenry
end;

// -----------------------------------------------------------------------------

function MyGetDate: String;
begin
  frmMain.tmrPascalScriptRestoreCursor.Enabled := False; //added by adenry
  Screen.Cursor := crHourGlass; //added by adenry
  Result := FormatDateTime('YYYY-MM-DD', Now);
  frmMain.tmrPascalScriptRestoreCursor.Enabled := True; //added by adenry
end;

// -----------------------------------------------------------------------------

function MyGetTime: String;
begin
  frmMain.tmrPascalScriptRestoreCursor.Enabled := False; //added by adenry
  Screen.Cursor := crHourGlass; //added by adenry
  Result := FormatDateTime('HH:MM', Now);
  frmMain.tmrPascalScriptRestoreCursor.Enabled := True; //added by adenry
end;

// -----------------------------------------------------------------------------

function MyGetDateTime: String;
begin
  frmMain.tmrPascalScriptRestoreCursor.Enabled := False; //added by adenry
  Screen.Cursor := crHourGlass; //added by adenry
  Result := FormatDateTime('YYYY-MM-DD HH:MM', Now);
  frmMain.tmrPascalScriptRestoreCursor.Enabled := True; //added by adenry
end;

// -----------------------------------------------------------------------------
// New ps functions by BDZL
// -----------------------------------------------------------------------------

procedure MyGoToLineNumber(const Line: Integer);
begin
  frmMain.GoToLineNumber(Line);
end;

// -----------------------------------------------------------------------------

function MyGetSWVersion(): String;
begin
  result := ID_FULLVERSION;
end;

// -----------------------------------------------------------------------------

function MyGetAPIVersion(): String;
var
  s : String;
begin
  if SubtitleAPI <> nil then
  begin
    s := IntToHex(SubtitleAPI.ModuleVersion, 3);
    result := copy(s, 1, 1) + '.' + copy(s, 2, 2);
  end
  else
    result := '0';
end;

// -----------------------------------------------------------------------------

function MyGetOrgFilename(): String;
begin
  result := ExtractFileName(frmMain.OrgFile);
end;

function MyGetOrgFilepath(): String;
begin
  result := ExtractFilePath(frmMain.OrgFile);
end;

// -----------------------------------------------------------------------------

function MyGetTransFilename(): String;
begin
  result := ExtractFileName(frmMain.TransFile);
end;

function MyGetTransFilepath(): String;
begin
  result := ExtractFilePath(frmMain.TransFile);
end;

// -----------------------------------------------------------------------------

function MyGetMovieFilename(): String;
begin
  result := ExtractFileName(frmMain.MovieFile);
end;

function MyGetMovieFilepath(): String;
begin
  result := ExtractFilePath(frmMain.MovieFile);
end;

// -----------------------------------------------------------------------------

function MyGetVideoPosTime(): String;
begin
  if Player.Initialized then
    result := TimeToString(GetCurrentPos)
  else
    result := '';
end;

function MyGetVideoPosFrames(): String;
begin
  if Player.Initialized then
    result := IntToStr(TimeToFrames(GetCurrentPos, frmMain.MovieFPS))
  else
    result := '';
end;

// -----------------------------------------------------------------------------

procedure CompExecCompile(Sender: TIFPS3CompExec);
begin
  Sender.AddFunction(@MyIsOriginalLoaded,   'function IsOriginalLoaded: Boolean;');
  Sender.AddFunction(@MyIsTranslatedLoaded, 'function IsTranslatedLoaded: Boolean;');
  Sender.AddFunction(@MyEnableWorkArea,     'function EnableWorkArea: Boolean;');
  Sender.AddFunction(@MyGetSubCount,        'function GetSubtitleCount: Integer;');
  Sender.AddFunction(@MyIsSelSub,           'function IsSubtitleSelected(const Num: Integer): Boolean;');
  Sender.AddFunction(@MyGetSubText,         'function GetSubtitleText(const Num: Integer): String;');
  Sender.AddFunction(@MySetSubText,         'procedure SetSubtitleText(const Num: Integer; const Text: String);');
  Sender.AddFunction(@MyGetSubTrans,        'function GetSubtitleTrans(const Num: Integer): String;');
  Sender.AddFunction(@MySetSubTrans,        'procedure SetSubtitleTrans(const Num: Integer; const Text: String);');
  Sender.AddFunction(@MyGetSubInitialTime,  'function GetSubtitleInitialTime(const Num: Integer): Integer;');
  Sender.AddFunction(@MySetSubInitialTime,  'procedure SetSubtitleInitialTime(const Num: Integer; const InitialTime: Integer);');
  Sender.AddFunction(@MyGetSubFinalTime,    'function GetSubtitleFinalTime(const Num: Integer): Integer;');
  Sender.AddFunction(@MySetSubFinalTime,    'procedure SetSubtitleFinalTime(const Num: Integer; const FinalTime: Integer);');
  Sender.AddFunction(@MyInsSub,             'procedure InsertSubtitle(const Pos: Integer; const InitialTime, FinalTime: Integer; const Text, Translation: String);');
  Sender.AddFunction(@MyDelSub,             'procedure DeleteSubtitle(const Num: Integer);');
  Sender.AddFunction(@MyMsgBox,             'function MsgBox(const AMsg, BCap1, BCap2, BCap3: String; const IconInd: Integer): Integer;');
  Sender.AddFunction(@MyRandomize,          'procedure Randomize;');
  Sender.AddFunction(@MyRandom,             'function Random(Range: Integer): Integer;');
  // Date and time functions
  Sender.AddFunction(@MyGetYear,            'function GetYear: Integer;');
  Sender.AddFunction(@MyGetMonth,           'function GetMonth: Integer;');
  Sender.AddFunction(@MyGetDay,             'function GetDay: Integer;');
  Sender.AddFunction(@MyGetHour,            'function GetHour: Integer;');
  Sender.AddFunction(@MyGetMinute,          'function GetMinute: Integer;');
  Sender.AddFunction(@MyGetSecond,          'function GetSecond: Integer;');
  Sender.AddFunction(@MyGetDate,            'function GetDate: String;');
  Sender.AddFunction(@MyGetTime,            'function GetTime: String;');
  Sender.AddFunction(@MyGetDateTime,        'function GetDateTime: String;');
  // New ps functions by BDZL
  Sender.AddFunction(@MyGoToLineNumber,     'procedure GoToLineNumber(const Line: Integer);');
  Sender.AddFunction(@MyGetSWVersion,       'function GetSWVersion(): String;');
  Sender.AddFunction(@MyGetAPIVersion,      'function GetAPIVersion(): String;');
  Sender.AddFunction(@MyGetOrgFilename,     'function GetOrgFilename(): String;');
  Sender.AddFunction(@MyGetOrgFilepath,     'function GetOrgFilepath(): String;');
  Sender.AddFunction(@MyGetTransFilename,   'function GetTransFilename(): String;');
  Sender.AddFunction(@MyGetTransFilepath,   'function GetTransFilepath(): String;');
  Sender.AddFunction(@MyGetMovieFilename,   'function GetMovieFilename(): String;');
  Sender.AddFunction(@MyGetMovieFilepath,   'function GetMovieFilepath(): String;');
  Sender.AddFunction(@MyGetVideoPosTime,    'function GetVideoPosTime(): String;');
  Sender.AddFunction(@MyGetVideoPosFrames,  'function GetVideoPosFrames(): String;');
  // ---
  Sender.AddRegisteredVariable('Application', 'TApplication');
  //Sender.AddRegisteredVariable('Self', 'TfrmMain');
end;

// -----------------------------------------------------------------------------

end.
