// This file is part of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle Workshop's copyright information
// File Description: Subtitles List, Subtitles List Nodes, and subtitles text and timing functionality

unit TreeViewHandle;

interface

uses
  Windows, SysUtils, Classes, ClipBrd, IniFiles, Forms, //IniFiles, Forms added by adenry
  VirtualTrees,
  FastStrings,
  CommonTypes;

// -----------------------------------------------------------------------------

// ------------------------//
//  Charset / Wide String  //
// ------------------------//
function CharSetToCodePage(ciCharset: UINT): Cardinal;
function StringToWideStringEx(const S: string; CodePage: Word): WideString;
function WideStringToStringEx(const WS: WideString; CodePage: Word): AnsiString;
// ------------------------------------------------//
//   Getting nodes and columns, nodes selection    //
// ------------------------------------------------//
function GetNodeWithIndex(Sender: TVirtualStringTree; NdIndex: Integer): PVirtualNode;
function GetLastSelected: PVirtualNode; //added by adenry
procedure UnSelectAll(Sender: TVirtualStringTree);
function GetTreePrevColumn(Tree: TVirtualStringTree; Column: Integer; Loop: Boolean = False): Integer; //added by adenry
function GetTreeNextColumn(Tree: TVirtualStringTree; Column: Integer; Loop: Boolean = False): Integer; //added by adenry
// -------------------------------------//
//   Nodes data retrieval and update    //
// -------------------------------------//
procedure AddArrayItems(Translation: Boolean = False);
procedure UpdateArray(FormatIndex: Integer; Translated: Boolean = False);
procedure DeleteSelectedNodes;
function InsertNode(After: Boolean = True; InitialTime: Integer = -1; FinalTime: Integer = -1; Text: String = ''; Translation: String = ''; Select: Boolean = True): PVirtualNode;
// ------------------
procedure SetStartTime(Node: PVirtualNode; StartTime: Integer);
procedure SetFinalTime(Node: PVirtualNode; FinalTime: Integer);
procedure SetText(Node: PVirtualNode; Text: String; SetModified: Boolean = True); //SetModified added by adenry
procedure SetTranslation(Node: PVirtualNode; Text: String; SetModified: Boolean = True); //SetModified added by adenry
procedure AddError(Node: PVirtualNode; Error: TErrorTypeSet);
// ------------------
function GetStartTime(Node: PVirtualNode): Integer;
function GetFinalTime(Node: PVirtualNode): Integer;
function GetSubText(Node: PVirtualNode): String;
function GetSubTranslation(Node: PVirtualNode): String;
// -----
function GetPause(Node: PVirtualNode): Integer; //added by adenry
function GetSubCPS(Node: PVirtualNode): Double; //added by adenry
// --------------------------------//
//   Nodes Clipboard Copy/Paste    //
// --------------------------------//
procedure CopyNodesToClipBoard;
procedure PasteNodesFromClipBoard;
// ---------------------------//
//   Operations with nodes    //
// ---------------------------//
//Timing operations
procedure SetDelay(Delay: Integer; OnlyToSelected: Boolean = False; FromFirstSelected: Boolean = False); //FromFirstSelected added by adenry
procedure SetPauses(Pause: Integer; method: Byte; OnlyToSelected: Boolean); //added by adenry
procedure ZeroFunction;
procedure SortSubtitles;
//Text operations
procedure ReverseText(KeepLinesOrder: Boolean);
procedure TextEffect(Effect: Byte; Param_1, Param_2: Integer);
procedure SwapOrgTrans(Sender: TObject; MustAddUndo: Boolean = True);

// -----------------------------------------------------------------------------

implementation

uses
  General, Functions, Undo, USubtitlesFunctions, VideoPreview, //USubtitleAPI, //VideoPreview added by adenry //USubtitleAPI removed by adenry
  formMain;

// -----------------------------------------------------------------------------

// Windows.pas doesn't declare TranslateCharsetInfo() correctly.
function TranslateCharsetInfo(lpSrc: PDWORD; var lpCs: TCharsetInfo; dwFlags: DWORD): BOOL; stdcall; external gdi32 name 'TranslateCharsetInfo';

function CharSetToCodePage(ciCharset: UINT): Cardinal;
var
  C: TCharsetInfo;
begin
  if ciCharset = DEFAULT_CHARSET then Result := GetACP else //added by adenry - IMPORTANT! - fixes a bug - Otherwise Default charset can't be used properly
  begin
    TranslateCharsetInfo(PDWORD(ciCharset), C, TCI_SRCCHARSET);
    Result := C.ciACP;
  end;
end;

// -----------------------------------------------------------------------------

//Convert an ANSI string to a Wide string
function StringToWideStringEx(const S: string; CodePage: Word): WideString;
var
  InputLength,
  OutputLength: Integer;
begin
  InputLength := Length(S);
  OutputLength := MultiByteToWideChar(CodePage, 0, PChar(S), InputLength, nil, 0);
  SetLength(Result, OutputLength);
  MultiByteToWideChar(CodePage, 0, PChar(S), InputLength, PWideChar(Result), OutputLength);
end;

// -----------------------------------------------------------------------------

//Convert an Wide string to an ANSI string
function WideStringToStringEx(const WS: WideString; CodePage: Word): AnsiString;
var
  InputLength,
  OutputLength: Integer;
begin
  InputLength := Length(WS);
  OutputLength := WideCharToMultiByte(CodePage, 0, PWideChar(WS), InputLength, nil, 0, nil, nil);
  SetLength(Result, OutputLength);
  WideCharToMultiByte(CodePage, 0, PWideChar(WS), InputLength, PAnsiChar(Result), OutputLength, nil, nil);
end;

// -----------------------------------------------------------------------------

//Update lstSubtitles nodes with the data from SubtitleAPI
procedure AddArrayItems(Translation: Boolean = False);
var
  Data      : PSubtitleItem;
  Node      : PVirtualNode;
  NdIndex   : Integer;
  RootNodes : Integer;
begin
  frmMain.lstSubtitles.BeginUpdate;
  RootNodes := frmMain.lstSubtitles.RootNodeCount;
  if (RootNodes < SubtitleAPI.SubtitleCount) then
    frmMain.lstSubtitles.RootNodeCount := SubtitleAPI.SubtitleCount;
  Node := frmMain.lstSubtitles.GetFirst;
  while Assigned(Node) do
  begin
    Data := frmMain.lstSubtitles.GetNodeData(Node);
    if Translation then
    begin
      NdIndex := Node.Index;
      if NdIndex < SubtitleAPI.SubtitleCount then
      begin
        Data.Translation := SubtitleAPI.GetText(Node.Index);
        if (Data.InitialTime = 0) and (Data.FinalTime = 0) then
        begin
          Data.InitialTime := SubtitleAPI.GetInitialTime(Node.Index);
          Data.FinalTime   := SubtitleAPI.GetFinalTime(Node.Index);
        end;
        Data.ErrorType := [];
      end;
    end else
    begin
      SubtitleAPI.GetSubtitle(Node.Index, Data.InitialTime, Data.FinalTime, Data.Text);
      Data.ErrorType := [];
    end;
    Node := frmMain.lstSubtitles.GetNextSibling(Node);
  end;
  if (Translation = False) and (frmMain.mnuTranslatorMode.Checked) then
    SetUntranslated;
  frmMain.lstSubtitles.EndUpdate;
end;

// -----------------------------------------------------------------------------

//Update the data of SubtitleAPI with the lstSubtitles nodes
procedure UpdateArray(FormatIndex: Integer; Translated: Boolean = False);
var
  Data: PSubtitleItem;
  Node: PVirtualNode;
  saveText: String;
begin
  SubtitleAPI.CreateNewSubtitle;
  Node := frmMain.lstSubtitles.GetFirst;
  while Assigned(Node) do
  begin
    Data := frmMain.lstSubtitles.GetNodeData(Node);
    if Translated = False then
    begin
      //removed by adenry: begin
      {if Data.Text <> '' then
        SubtitleAPI.AddSubtitle(Data.InitialTime, Data.FinalTime, Data.Text);}
      //removed by adenry: end

      //added by adenry: begin
      if (Data.Text <> '') or frmMain.SaveEmptyLines then
      begin
        saveText := Data.Text;
        if saveText = '' then
          saveText := EMPTY_SUBTITLE;
        SubtitleAPI.AddSubtitle(Data.InitialTime, Data.FinalTime, saveText);
      end;
      //added by adenry: end
    end else
    begin
      //removed by adenry: begin
      {if Data.Translation <> '' then
        SubtitleAPI.AddSubtitle(Data.InitialTime, Data.FinalTime, Data.Translation);}
      //removed by adenry: end

      //added by adenry: begin
      if (Data.Translation <> '') or frmMain.SaveEmptyLines then
      begin
        saveText := Data.Translation;
        if saveText = '' then
          saveText := EMPTY_SUBTITLE;
        SubtitleAPI.AddSubtitle(Data.InitialTime, Data.FinalTime, saveText);
      end;
      //added by adenry: end
    end;
    Node := Node.NextSibling;
  end;
end;

// -----------------------------------------------------------------------------

//Delete all selected nodes in the tree
procedure DeleteSelectedNodes;
var
  Node : PVirtualNode;
  i    : Integer;
begin
  with frmMain do
  begin
    if (Assigned(lstSubtitles.FocusedNode)) and (lstSubtitles.SelectedCount >= 1) then //and (lstSubtitles.SelectedCount >= 1) added by adenry
    begin
      if ConfirmDelete = True then
      begin
        if MsgBox(QuestionMsg[05], BTN_YES, BTN_NO, '', MB_ICONWARNING, frmMain) = 2 then
          exit;
      end;

      i := lstSubtitles.GetFirstSelected.Index;
      DeleteSelectedWithUndo; //delete the nodes
      //assign selection
      Node := GetNodeWithIndex(lstSubtitles, i);
      if not Assigned(Node) and (lstSubtitles.TotalCount > 0) then
        Node := GetNodeWithIndex(lstSubtitles, i-1);
      if Assigned(Node) then
      begin
        lstSubtitles.FocusedNode := Node;
        lstSubtitles.Selected[Node] := True;
      end;
    end;
    OrgModified   := True;
    TransModified := True;
    RefreshTimes; //added by adenry
  end;
end;

// -----------------------------------------------------------------------------

//Unselect all nodes of a tree
procedure UnSelectAll(Sender: TVirtualStringTree);
var
  Node: PVirtualNode;
begin
  Node := Sender.GetFirst;
  while Assigned(Node) do
  begin
    Sender.Selected[Node] := False;
    Node := Node.NextSibling;
  end;
end;

// -----------------------------------------------------------------------------

//Get a Node by its index
function GetNodeWithIndex(Sender: TVirtualStringTree; NdIndex: Integer): PVirtualNode;
var
  Node: PVirtualNode;
  NodeIndex: Integer;
begin
  Result := nil;
  Node := Sender.GetFirst;
  while Assigned(Node) do
  begin
    NodeIndex := Node.Index;
    if NodeIndex = NdIndex then
    begin
      Result := Node;
      exit;
    end;
    Node := Node.NextSibling;
  end;
end;                                   

// -----------------------------------------------------------------------------

//Insert a new Node in the tree
function InsertNode(After: Boolean = True; InitialTime: Integer = -1; FinalTime: Integer = -1; Text: String = ''; Translation: String = ''; Select: Boolean = True): PVirtualNode;
var
  Node: PVirtualNode;
  Time: Integer;
  fix: Boolean; //added by adenry
begin
  Result := nil;
  with frmMain do
  begin
    if Translation = '' then
      Translation := UnTranslatedSub;
    if lstSubtitles.Enabled then
    begin
      if Assigned(lstSubtitles.FocusedNode) then
      begin
        if After then
        begin
          lstSubtitles.InsertNode(lstSubtitles.FocusedNode, amInsertAfter);
          Node := lstSubtitles.FocusedNode.NextSibling;
        end else
        begin
          //lstSubtitles.InsertNode(lstSubtitles.FocusedNode, amInsertBefore); //removed by adenry

          //added by adenry: begin
          //this is done to fix a bug - inserting a subtitle before the first one in a faile with more than 2000 lines causes scrolls not to refresh properly
          if lstSubtitles.FocusedNode = lstSubtitles.GetFirst then
          begin
            lstSubtitles.InsertNode(lstSubtitles.FocusedNode, amInsertBefore);
            lstSubtitles.InsertNode(lstSubtitles.GetFirst, amInsertAfter);
            lstSubtitles.DeleteNode(lstSubtitles.GetFirst);
          end else
            lstSubtitles.InsertNode(lstSubtitles.FocusedNode, amInsertBefore);
          //added by adenry: end

          Node := lstSubtitles.FocusedNode.PrevSibling;
        end;
        //lstSubtitles.Selected[lstSubtitles.FocusedNode] := False; //removed by adenry
        UnSelectAll(frmMain.lstSubtitles); //added by adenry
        lstSubtitles.FocusedNode := Node;
        if Select then
          lstSubtitles.Selected[Node] := True;
        if After then
        begin
          if InitialTime = -1 then
            SetStartTime(Node, GetFinalTime(Node.PrevSibling) + DefaultSubPause) else // + 1 changed to + DefaultSubPause by adenry
            SetStartTime(Node, InitialTime);
          if FinalTime = -1 then
            SetFinalTime(Node, GetStartTime(Node) + DefaultSubDuration) else // + 1000 changed to + DefaultSubDuration by adenry
            SetFinalTime(Node, FinalTime);
        end else
        begin
          if InitialTime = -1 then
          begin
            Time := GetStartTime(Node.NextSibling) - DefaultSubDuration - DefaultSubPause; // - 1001 changed to - DefaultSubDuration - DefaultSubPause by adenry
            if Time < 0 then Time := 0;
            SetStartTime(Node, Time);
          end else
            SetStartTime(Node, InitialTime);
          if FinalTime = -1 then
            SetFinalTime(Node, GetStartTime(Node) + DefaultSubDuration) else // + 1000 changed to + DefaultSubDuration by adenry
            SetFinalTime(Node, FinalTime);
        end;
      end else
      begin
        if not (vsExpanded in lstSubtitles.RootNode.Parent.States) then fix := True else fix := False;
        if fix then lstSubtitles.RootNode.Parent.States := lstSubtitles.RootNode.Parent.States + [vsExpanded]; //added by adenry to fix a bug
        lstSubtitles.InsertNode(nil, amInsertAfter);
        if fix then lstSubtitles.RootNode.Parent.States := lstSubtitles.RootNode.Parent.States - [vsExpanded]; //added by adenry to fix a bug
        Node := lstSubtitles.GetFirst;
        lstSubtitles.FocusedNode := Node;
        if Select then
          lstSubtitles.Selected[Node] := True;
        if InitialTime = -1 then
          SetStartTime(Node, 0) else
          SetStartTime(Node, InitialTime);
        if FinalTime = -1 then
          SetFinalTime(Node, DefaultSubDuration) else  // 1000 changed to DefaultSubDuration by adenry
          SetFinalTime(Node, FinalTime);
      end;

      SetText(Node, Text);
      SetTranslation(Node, Translation);

      UpdateSubSubtitleVisibilityAfterNodeChange(Node, -1, -1, GetStartTime(Node), GetFinalTime(Node)); //added by adenry

      frmMain.OrgModified   := True;
      frmMain.TransModified := True;
      Result := Node;
    end;
  end;
end;

// -----------------------------------------------------------------------------

procedure SetStartTime(Node: PVirtualNode; StartTime: Integer);
var
  Data: PSubtitleItem;
begin
  if Assigned(Node) then
  begin
    Data := frmMain.lstSubtitles.GetNodeData(Node);
    if Assigned(Data) then
    begin
      UpdateSubSubtitleVisibilityAfterNodeChange(Node, Data.InitialTime, Data.FinalTime, StartTime, Data.FinalTime); //added by adenry
      Data.InitialTime := StartTime;
      frmMain.OrgModified   := True;
      frmMain.TransModified := True;
    end;
  end;
end;

// -----------------------------------------------------------------------------

procedure SetFinalTime(Node: PVirtualNode; FinalTime: Integer);
var
  Data: PSubtitleItem;
begin
  if Assigned(Node) then
  begin
    Data := frmMain.lstSubtitles.GetNodeData(Node);
    if Assigned(Data) then
    begin
      UpdateSubSubtitleVisibilityAfterNodeChange(Node, Data.InitialTime, Data.FinalTime, Data.InitialTime, FinalTime); //added by adenry
      Data.FinalTime := FinalTime;
      frmMain.OrgModified   := True;
      frmMain.TransModified := True;
    end;
  end;
end;

// -----------------------------------------------------------------------------

procedure SetText(Node: PVirtualNode; Text: String; SetModified: Boolean = True); //SetModified added by adenry
var
  Data: PSubtitleItem;
begin
  if Assigned(Node) then
  begin
    Data := frmMain.lstSubtitles.GetNodeData(Node);
    if Assigned(Data) then
    begin
      Data.Text := Text;
      if SetModified then //added by adenry
        frmMain.OrgModified := True;
      UpdateSubSubtitleTextAfterNodeChange(Node); //added by adenry
    end;
  end;
end;

// -----------------------------------------------------------------------------

procedure SetTranslation(Node: PVirtualNode; Text: String; SetModified: Boolean = True); //SetModified added by adenry
var
  Data: PSubtitleItem;
begin
  if Assigned(Node) then
  begin
    Data := frmMain.lstSubtitles.GetNodeData(Node);
    if Assigned(Data) then
    begin
      Data.Translation := Text;
      if SetModified then //added by adenry
        frmMain.TransModified := True;
      UpdateSubSubtitleTextAfterNodeChange(Node); //added by adenry
    end;
  end;
end;

// -----------------------------------------------------------------------------

procedure AddError(Node: PVirtualNode; Error: TErrorTypeSet);
var
  Data: PSubtitleItem;
begin
  if Assigned(Node) then
  begin
    Data := frmMain.lstSubtitles.GetNodeData(Node);
    if Assigned(Data) then
    begin
      if Error = [] then
        Data.ErrorType := [] else
        Data.ErrorType := Data.ErrorType + Error;
    end;
  end;
end;

// -----------------------------------------------------------------------------

function GetStartTime(Node: PVirtualNode): Integer;
var
  Data: PSubtitleItem;
begin
  Result := 0;
  if Assigned(Node) then
  begin
    Data := frmMain.lstSubtitles.GetNodeData(Node);
    if Assigned(Data) then
      Result := Data.InitialTime;
  end;
end;

// -----------------------------------------------------------------------------

function GetFinalTime(Node: PVirtualNode): Integer;
var
  Data: PSubtitleItem;
begin
  Result := 0;
  if Assigned(Node) then
  begin
    Data := frmMain.lstSubtitles.GetNodeData(Node);
    if Assigned(Data) then
      Result := Data.FinalTime;
  end;
end;

// -----------------------------------------------------------------------------

//added by adenry: begin
function GetPause(Node: PVirtualNode): Integer;
var
  Data, PrevData  : PSubtitleItem;
begin
  Result := -1;
  if Assigned(Node) then
    if Assigned(Node.PrevSibling) then
    begin
      Data      := frmMain.lstSubtitles.GetNodeData(Node);
      PrevData  := frmMain.lstSubtitles.GetNodeData(Node.PrevSibling);
      if Assigned(Data) and Assigned(PrevData) then
        Result := Data.InitialTime - PrevData.FinalTime;
    end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
//Calculate a subtitle's characters per second (CPS)
function GetSubCPS(Node: PVirtualNode): Double;
begin
  Result := (Length(ReplaceString(RemoveSWTags(GetSubText(Node),True,True,True,True),#13#10,'')))
            /
            ((GetFinalTime(Node)-GetStartTime(Node))/1000);
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
//Get last selected node
function GetLastSelected: PVirtualNode;
var
  Node: PVirtualNode;
begin
  //Get Last selected:
  Node := frmMain.lstSubtitles.GetFirstSelected;
  if Assigned(Node) then
    while Assigned(frmMain.lstSubtitles.GetNextSelected(Node)) do
      Node := frmMain.lstSubtitles.GetNextSelected(Node);
  Result := Node;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

function GetSubText(Node: PVirtualNode): String;
var
  Data: PSubtitleItem;
begin
  Result := '';
  if Assigned(Node) then
  begin
    Data := frmMain.lstSubtitles.GetNodeData(Node);
    if Assigned(Data) then
      Result := Data.Text;
  end;
end;

// -----------------------------------------------------------------------------

function GetSubTranslation(Node: PVirtualNode): String;
var
  Data: PSubtitleItem;
begin
  Result := '';
  if Assigned(Node) then
  begin
    Data := frmMain.lstSubtitles.GetNodeData(Node);
    if Assigned(Data) then
      Result := Data.Translation;
  end;
end;

// -----------------------------------------------------------------------------

procedure CopyNodesToClipBoard;
var
  Data : PSubtitleItem;
  Node : PVirtualNode;
  Text : String;
begin
  Text := '';
  try
    Node := frmMain.lstSubtitles.GetFirstSelected;
    Data := frmMain.lstSubtitles.GetNodeData(Node);
    Text := IntToStr(Data.InitialTime) + '||' + IntToStr(Data.FinalTime) + '||' + ReplaceEnters(Data.Text, '\~') + '||' + ReplaceEnters(Data.Translation, '\~');
    Node := frmMain.lstSubtitles.GetNextSelected(Node);
    while Assigned(Node) do
    begin
      Data := frmMain.lstSubtitles.GetNodeData(Node);
      Text := Text + #13#10 + IntToStr(Data.InitialTime) + '||' + IntToStr(Data.FinalTime) + '||' + ReplaceEnters(Data.Text, '\~') + '||' + ReplaceEnters(Data.Translation, '\~');
      Node := frmMain.lstSubtitles.GetNextSelected(Node);
    end;
  finally
    ClipBoard.AsText := Text;
  end;
end;

// -----------------------------------------------------------------------------

procedure PasteNodesFromClipBoard;
  procedure SetParams(Node: PVirtualNode; tmpText: String);
  var
    PosIt: Integer;
  begin
    Posit := Pos('||', tmpText);
    SetStartTime(Node, StrToIntDef(Copy(tmpText, 1, Posit-1), 0));
    SetFinalTime(Node, StrToIntDef(Copy(tmpText, Posit+2, SmartPos('||', tmpText, True, PosIt + 2)-(PosIt+2)), 0));
    Posit := SmartPos('||', tmpText, True, PosIt + 2);
    SetText(Node, ReplaceString(Copy(tmpText, PosIt+2, SmartPos('||', tmpText, True, PosIt + 2)-(PosIt+2)), '\~', #13#10));
    Posit := SmartPos('||', tmpText, True, PosIt + 2);
    SetTranslation(Node, ReplaceString(Copy(tmpText, PosIt+2, Length(tmpText)), '\~', #13#10));
  end;
var
  Node       : PVirtualNode;
  Text       : String;
  PosIt      : Integer;
  tmpText    : String;
  UndoAction : PUndoAction;
begin
  Node := nil;
  
  if ClipBoard.HasFormat(CF_TEXT) then
  begin
    ClipBoard.Open;
    Text := ClipBoard.AsText;
    ClipBoard.Close;

    PosIt := Pos(#13#10, Text);
    while PosIt > 0 do
    begin
      tmpText := Copy(Text, 1, PosIt - 1);
      if StringCount('||', tmpText) = 3 then
      begin
        Node := InsertNode(True, -1, -1, '', '', False);
        SetParams(Node, tmpText);

        New(UndoAction);
        UndoAction^.UndoActionType := uaInsertLine;
        UndoAction^.UndoActionName := uanPaste; //added by adenry
        UndoAction^.LineNumber     := Node.Index;
        UndoAction^.Node           := Node;
        UndoAction^.BindToNext     := True;
        UndoAction^.Buffer         := nil;
        UndoAction^.BufferSize     := 0;
        AddUndo(UndoAction);
      end;
      Text := Copy(Text, PosIt + 2, Length(Text));
      PosIt := Pos(#13#10, Text);
    end;
    if StringCount('||', Text) = 3 then
    begin
      Node := InsertNode(True, -1, -1, '', '', False);
      SetParams(Node, Text);

      New(UndoAction);
      UndoAction^.UndoActionType := uaInsertLine;
      UndoAction^.UndoActionName := uanPaste; //added by adenry
      UndoAction^.LineNumber     := Node.Index;
      UndoAction^.Node           := Node;
      UndoAction^.BindToNext     := False;
      UndoAction^.Buffer         := nil;
      UndoAction^.BufferSize     := 0;
      AddUndo(UndoAction);
    end;
    if Assigned(Node) then
    begin
      UnSelectAll(frmMain.lstSubtitles);
      frmMain.lstSubtitles.FocusedNode := Node;
      frmMain.lstSubtitles.Selected[Node] := True;
      frmMain.RefreshTimes; //added by adenry
    end;
  end;
  frmMain.AutoRecheckAllErrors; //added by adenry
end;

// -----------------------------------------------------------------------------

procedure SetDelay(Delay: Integer; OnlyToSelected: Boolean = False; FromFirstSelected: Boolean = False); //FromFirstSelected added by adenry
var
  Node       : PVirtualNode;
  StartTime  : Integer;
  FinalTime  : Integer;
  UndoAction : PUndoAction;
begin
  if Delay <> 0 then //added by adenry
  with frmMain do
  begin
    Node := lstSubtitles.GetFirst;
    while Assigned(Node) do
    begin
      if ((OnlyToSelected) and (lstSubtitles.Selected[Node] = True)) or ((OnlyToSelected = False) and (FromFirstSelected = False)) or ((FromFirstSelected) and (Node.Index>=lstSubtitles.GetFirstSelected(False).Index)) then //modified by adenry
      begin
        StartTime := GetStartTime(Node);
        FinalTime := GetFinalTime(Node);

        New(UndoAction);
        UndoAction^.UndoActionType := uaTimeChange;
        UndoAction^.UndoActionName := uanSetDelay; //added by adenry
        UndoAction^.BufferSize     := SizeOf(TTimeChange);
        UndoAction^.Buffer         := AllocMem(UndoAction^.BufferSize);
        UndoAction^.Node           := Node;
        UndoAction^.LineNumber     := Node.Index;
        UndoAction^.BindToNext     := True;
        PTimeChange(UndoAction^.Buffer)^.StartTime := StartTime;
        PTimeChange(UndoAction^.Buffer)^.FinalTime := FinalTime;
        AddUndo(UndoAction);

        if StartTime + Delay > 0 then
          StartTime := StartTime + Delay else
          StartTime := 0;
        if FinalTime + Delay > 0 then
          FinalTime := FinalTime + Delay else
          FinalTime := 0;
        SetStartTime(Node, StartTime);
        SetFinalTime(Node, FinalTime);
      end;
      Node := Node.NextSibling;
    end;
    if UndoList.Count > 0 then
      PUndoAction(UndoList.Last)^.BindToNext := False;
    //OrgModified   := True; //removed by adenry - MODIFIED bug fix - SetText/SetTranslation/SetStartTime/SetFinalTime handle the MODIFIED flags
    //TransModified := True; //removed by adenry - MODIFIED bug fix - SetText/SetTranslation/SetStartTime/SetFinalTime handle the MODIFIED flags
    //lstSubtitles.Refresh; //AutoRecheck***Errors refreshes it
    frmMain.AutoRecheckAllErrors(TimeErrors); //added by adenry
  end;
end;

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure SetPauses(Pause: Integer; Method: Byte; OnlyToSelected: Boolean);
var
  Node       : PVirtualNode;
  UndoAction : PUndoAction;
  StartTime2  : Integer;
  FinalTime1  : Integer;
begin
  with frmMain do
  begin
    if OnlyToSelected then
    begin
      Node := lstSubtitles.GetFirstSelected;
      if not Assigned(Node.PrevSibling) then
        Node := lstSubtitles.GetNextSelected(Node);
    end else
      Node := lstSubtitles.GetFirst.NextSibling;

    while Assigned(Node) do
    begin
      FinalTime1 := GetFinalTime(Node.PrevSibling);
      StartTime2 := GetStartTime(Node);
      if StartTime2 - FinalTime1 < Pause then
      begin

        case Method of
          1: SetFinalTime(Node.PrevSibling, StartTime2 - Pause);
          2: SetStartTime(Node, FinalTime1 + Pause);
          3: begin
               SetFinalTime(Node.PrevSibling, FinalTime1 - ((StartTime2 - FinalTime1) div 2));
               SetStartTime(Node, GetFinalTime(Node.PrevSibling) + Pause);
             end;
          4: if GetSubCPS(Node.PrevSibling) < GetSubCPS(Node) then
               SetFinalTime(Node.PrevSibling, StartTime2 - Pause) else
               SetStartTime(Node, FinalTime1 + Pause);
        end;

        if GetFinalTime(Node.PrevSibling) <> FinalTime1 then
        begin
          New(UndoAction);
          UndoAction^.UndoActionType := uaTimeChange;
          UndoAction^.UndoActionName := uanSetPauses; //added by adenry later
          UndoAction^.BufferSize     := SizeOf(TTimeChange);
          UndoAction^.Buffer         := AllocMem(UndoAction^.BufferSize);
          UndoAction^.Node           := Node.PrevSibling;
          UndoAction^.LineNumber     := Node.PrevSibling.Index;
          UndoAction^.BindToNext     := True;
          PTimeChange(UndoAction^.Buffer)^.StartTime := -1;
          PTimeChange(UndoAction^.Buffer)^.FinalTime := FinalTime1;
          AddUndo(UndoAction);
        end;

        if GetStartTime(Node) <> StartTime2 then
        begin
          New(UndoAction);
          UndoAction^.UndoActionType := uaTimeChange;
          UndoAction^.UndoActionName := uanSetPauses; //added by adenry later
          UndoAction^.BufferSize     := SizeOf(TTimeChange);
          UndoAction^.Buffer         := AllocMem(UndoAction^.BufferSize);
          UndoAction^.Node           := Node;
          UndoAction^.LineNumber     := Node.Index;
          UndoAction^.BindToNext     := True;
          PTimeChange(UndoAction^.Buffer)^.StartTime := StartTime2;
          PTimeChange(UndoAction^.Buffer)^.FinalTime := -1;
          AddUndo(UndoAction);
        end;

      end;
      if OnlyToSelected then
        Node := lstSubtitles.GetNextSelected(Node) else
        Node := Node.NextSibling;
    end;

    if UndoList.Count > 0 then
      PUndoAction(UndoList.Last)^.BindToNext := False;
    //OrgModified   := True; //removed by adenry - MODIFIED bug fix - SetText/SetTranslation/SetStartTime/SetFinalTime handle the MODIFIED flags
    //TransModified := True; //removed by adenry - MODIFIED bug fix - SetText/SetTranslation/SetStartTime/SetFinalTime handle the MODIFIED flags
    //lstSubtitles.Refresh; //AutoRecheck***Errors refreshes it
    frmMain.AutoRecheckAllErrors(TimeErrors);
  end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//Move all nodes in time, so that the first node's Show Time is 0
procedure ZeroFunction;
var
  Node : PVirtualNode;
begin
  with frmMain do
  begin
    Node := lstSubtitles.GetFirst;
    if (Assigned(Node)) and (lstSubtitles.SelectedCount > 1) then
      SetDelay(-GetStartTime(Node), True);
  end;
end;

// -----------------------------------------------------------------------------

procedure SortSubtitles;
var
  i,a        : Integer;
  Data       : PSubtitleItem;
  Node       : PVirtualNode;
  tmp        : TSubtitleItem;
  List       : array of TSubtitleItem;
  UndoAction : PUndoAction;
begin
  SetLength(List, frmMain.lstSubtitles.RootNodeCount);

  Node := frmMain.lstSubtitles.GetFirst;
  while Assigned(Node) do
  begin
    Data := frmMain.lstSubtitles.GetNodeData(Node);
    List[Node.Index] := Data^;
    Node := Node.NextSibling;
  end;

  for i := 0 to High(List) do
  begin
    for a := i to High(List) do
    begin
      if List[i].InitialTime > List[a].InitialTime then
      begin
        New(UndoAction);
        UndoAction^.UndoActionType                 := uaTimeChange;
        UndoAction^.UndoActionName                 := uanSort; //added by adenry
        UndoAction^.BufferSize                     := SizeOf(TTimeChange);
        UndoAction^.Buffer                         := AllocMem(UndoAction^.BufferSize);
        UndoAction^.Node                           := GetNodeWithIndex(frmMain.lstSubtitles, i);
        UndoAction^.LineNumber                     := i;
        UndoAction^.BindToNext                     := True;
        PTimeChange(UndoAction^.Buffer)^.StartTime := List[i].InitialTime;
        PTimeChange(UndoAction^.Buffer)^.FinalTime := List[i].FinalTime;
        AddUndo(UndoAction);

        New(UndoAction);
        UndoAction^.UndoActionType := uaFullTextChange;
        UndoAction^.UndoActionName := uanSort; //added by adenry
        UndoAction^.Node           := GetNodeWithIndex(frmMain.lstSubtitles, i);
        UndoAction^.LineNumber     := i;
        UndoAction^.BindToNext     := True;
        UndoAction^.BufferSize     := SizeOf(TFullTextChange);
        UndoAction^.Buffer         := AllocMem(UndoAction^.BufferSize);
        PFullTextChange(UndoAction^.Buffer)^.OriginalOnly := False;
        PFullTextChange(UndoAction^.Buffer)^.OldText      := List[i].Text;
        PFullTextChange(UndoAction^.Buffer)^.OldTrans     := List[i].Translation;
        AddUndo(UndoAction);

        New(UndoAction);
        UndoAction^.UndoActionType                 := uaTimeChange;
        UndoAction^.UndoActionName                 := uanSort; //added by adenry
        UndoAction^.BufferSize                     := SizeOf(TTimeChange);
        UndoAction^.Buffer                         := AllocMem(UndoAction^.BufferSize);
        UndoAction^.Node                           := GetNodeWithIndex(frmMain.lstSubtitles, a);
        UndoAction^.LineNumber                     := a;
        UndoAction^.BindToNext                     := True;
        PTimeChange(UndoAction^.Buffer)^.StartTime := List[a].InitialTime;
        PTimeChange(UndoAction^.Buffer)^.FinalTime := List[a].FinalTime;
        AddUndo(UndoAction);

        New(UndoAction);
        UndoAction^.UndoActionType := uaFullTextChange;
        UndoAction^.UndoActionName := uanSort; //added by adenry
        UndoAction^.Node           := GetNodeWithIndex(frmMain.lstSubtitles, a);
        UndoAction^.LineNumber     := a;
        UndoAction^.BindToNext     := True;
        UndoAction^.BufferSize     := SizeOf(TFullTextChange);
        UndoAction^.Buffer         := AllocMem(UndoAction^.BufferSize);
        PFullTextChange(UndoAction^.Buffer)^.OriginalOnly := False;
        PFullTextChange(UndoAction^.Buffer)^.OldText      := List[a].Text;
        PFullTextChange(UndoAction^.Buffer)^.OldTrans     := List[a].Translation;
        AddUndo(UndoAction);

        tmp := List[i];
        List[i] := List[a];
        List[a] := tmp;        
      end;
    end;
  end;

  if UndoList.Count > 0 then
    PUndoAction(UndoList.Last)^.BindToNext := False;
      
  Node := frmMain.lstSubtitles.GetFirst;
  while Assigned(Node) do
  begin
    Data := frmMain.lstSubtitles.GetNodeData(Node);
    Data.InitialTime := List[Node.Index].InitialTime;
    Data.FinalTime   := List[Node.Index].FinalTime;
    Data.Text        := List[Node.Index].Text;
    Data.Translation := List[Node.Index].Translation;
    Node := Node.NextSibling;
  end;

  frmMain.AutoRecheckAllErrors; //added by adenry
end;

// -----------------------------------------------------------------------------

procedure ReverseText(KeepLinesOrder: Boolean);
var
  Node       : PVirtualNode;
  UndoAction : PUndoAction;
begin
  Node := frmMain.lstSubtitles.GetFirstSelected;
  while Assigned(Node) do
  begin
    New(UndoAction);
    UndoAction^.UndoActionType := uaRTLFix;
    UndoAction^.UndoActionName := uanRTLReverseText; //added by adenry
    UndoAction^.Node           := Node;
    UndoAction^.LineNumber     := Node.Index;
    UndoAction^.BufferSize     := SizeOf(TRTLFix);
    UndoAction^.Buffer         := AllocMem(UndoAction^.BufferSize);
    PRTLFix(UndoAction^.Buffer)^.ReverseText    := True;
    PRTLFix(UndoAction^.Buffer)^.KeepLinesOrder := KeepLinesOrder;
    PRTLFix(UndoAction^.Buffer)^.FixPunctuation := False;
    PRTLFix(UndoAction^.Buffer)^.Original       := True;

    SetText(Node, USubtitlesFunctions.ReverseText(GetSubText(Node), KeepLinesOrder));

    Node := frmMain.lstSubtitles.GetNextSelected(Node);
    UndoAction^.BindToNext := Assigned(Node);
    AddUndo(UndoAction);
  end;
  frmMain.AutoRecheckAllErrors(TextErrors); //added by adenry
end;

// -----------------------------------------------------------------------------

procedure TextEffect(Effect: Byte; Param_1, Param_2: Integer);
  function TextEffect2(InitialTime: Integer; FinalTime: Integer; Text, Translation: String; Effect: Byte; Param1: Integer; Param2: Integer): PVirtualNode; //Translation added by adenry
  var
    ITime      : Integer;
    FTime      : Integer;
    CurTime    : Integer;
    CharDur    : Integer;
    Pos1       : Byte;
    //Pos2       : Byte; //removed by adenry
    SumLen     : Byte;
    s          : String;
    UndoAction : PUndoAction;
  begin
    ITime  := InitialTime;
    FTime  := FinalTime;
    Result := nil;

    case Effect of
      EffectFlash:
        begin
          repeat
            CurTime := ITime + Param1;
            if CurTime > FTime then CurTime := FTime;
            Result := InsertNode(True, ITime, CurTime, Text, Translation);

            New(UndoAction);
            UndoAction^.UndoActionType := uaInsertLine;
            UndoAction^.UndoActionName := uanFlashEffect; //added by adenry
            UndoAction^.Node           := Result;
            UndoAction^.LineNumber     := Result.Index;
            UndoAction^.BindToNext     := True;
            UndoAction^.Buffer         := nil;
            UndoAction^.BufferSize     := 0;
            AddUndo(UndoAction);

            ITime := ITime + Param1 + Param2;
          until ITime >= FTime;
          exit;
        end;
      EffectType:
        begin
          //removed by adenry: begin
          {// search for summary length of strings
          SumLen := 0;

          s    := Copy(Text, 1, Length(Text));
          Pos1 := Pos(#13, s);
          Pos2 := Pos(#10, s);

          while (Pos1 > 0) or (Pos2 > 0) do
          begin
            if Pos1 > 0 then
              SumLen := SumLen + Pos1-1 else
              SumLen := SumLen + Pos2-1;
            if Pos2 > 0 then
              s := Copy(s, Pos2+1, Length(s)) else
              s := Copy(s, Pos1+1, Length(s));
            Pos1 := Pos(#13, s);
            Pos2 := Pos(#10, s);
          end;

          SumLen := SumLen + Length(s);

          // now produce type
          CharDur := Round((Ftime - ITime)/SumLen);}
          //removed by adenry: end

          CharDur := Rnd((Ftime - ITime)/Length(RemoveSWTags(Text, True,True,True,True)));  //added by adenry
          SumLen  := Length(Text);

          Pos1 := 0;
          while (Pos1 < SumLen) do
          begin
            Pos1 := Pos1 + 1;
            if((CompareStr(Copy(Text, Pos1, 1), #13) <> 0) and
               (CompareStr(Copy(Text, Pos1, 1), #10) <> 0) and
               (CompareStr(Copy(Text, Pos1, 1), ' ') <> 0) and
               (not IsTagPart(Text,Pos1)) ) //added by adenry - handle tags properly
               or (Pos1=SumLen) //added by adenry - add everything in the last node
               then
            begin
              s := Copy(Text, 1, Pos1);
              //close unclosed tags
              if SubtitleApi.MultiTagsMode then
              begin
                s := CloseUnclosedTags(s, '<b>', '</b>');
                s := CloseUnclosedTags(s, '<i>', '</i>');
                s := CloseUnclosedTags(s, '<u>', '</u>');
                s := CloseUnclosedTags(s, '<c:#', '</c>');
                {
                s := CloseUnclosedTags(s, '<font', '</font>');
                }
              end;
              Result := InsertNode(True, ITime, ITime+CharDur, s, Translation);

              New(UndoAction);
              UndoAction^.UndoActionType := uaInsertLine;
              UndoAction^.UndoActionName := uanTypeEffect; //added by adenry
              UndoAction^.Node           := Result;
              UndoAction^.LineNumber     := Result.Index;
              UndoAction^.BindToNext     := True;
              UndoAction^.Buffer         := nil;
              UndoAction^.BufferSize     := 0;
              AddUndo(UndoAction);

              if s=Text then break; //added by adenry - avoid creating repeated subtitles

              ITime := ITime + CharDur;
            end;
          end;
          SetFinalTime(Result, FinalTime);
          exit;
        end;
    end;
  end;
var
  FocNode    : PVirtualNode;
  NewNode    : PVirtualNode;
  Data       : PSubtitleItem;
  UndoAction : PUndoAction;
begin
  if GetSubText(frmMain.lstSubtitles.FocusedNode) <> '' then
  begin
    FocNode := frmMain.lstSubtitles.FocusedNode;
    NewNode := TextEffect2(GetStartTime(FocNode),
                           GetFinalTime(FocNode),
                           GetSubText(FocNode),
                           GetSubTranslation(FocNode), //added by adenry
                           Effect,
                           Param_1,
                           Param_2);

    Data := frmMain.lstSubtitles.GetNodeData(FocNode);
    
    New(UndoAction);
    UndoAction^.UndoActionType := uaDeleteLine;
    //added by adenry: begin
    if Effect = EffectFlash then
      UndoAction^.UndoActionName := uanFlashEffect else
      UndoAction^.UndoActionName := uanTypeEffect;
    //added by adenry: end
    UndoAction^.Node           := FocNode;
    UndoAction^.LineNumber     := FocNode.Index;
    UndoAction^.BindToNext     := False;
    UndoAction^.BufferSize     := SizeOf(TLineChange);
    UndoAction^.Buffer         := AllocMem(UndoAction^.BufferSize);
    PLineChange(UndoAction^.Buffer)^.SubtitleItem := Data^;
    AddUndo(UndoAction);

    frmMain.lstSubtitles.DeleteNode(FocNode);
    if NewNode <> nil then
    begin
      frmMain.lstSubtitles.FocusedNode       := NewNode;
      frmMain.lstSubtitles.Selected[NewNode] := True;
    end;

    frmMain.lstSubtitles.SetFocus;
    frmMain.RefreshTimes;
    frmMain.AutoRecheckAllErrors; //added by adenry
  end;
end;

// -----------------------------------------------------------------------------

procedure SwapOrgTrans(Sender: TObject; MustAddUndo: Boolean = True);
var
  tmpTrans   : String;
  Node       : PVirtualNode;
  OrgII      : Integer;
  UndoAction : PUndoAction;
begin
  with frmMain do
  begin
    if MustAddUndo then
    begin
      New(UndoAction);
      UndoAction^.UndoActionType := uaSwapOrgTrans;
      UndoAction^.UndoActionName := uanSwap; //added by adenry
      UndoAction^.Node           := nil;
      UndoAction^.BufferSize     := 0;
      UndoAction^.Buffer         := nil;
      UndoAction^.BindToNext     := False;
      AddUndo(UndoAction);
    end;

    OrgII := cmbOrgCharset.ItemIndex;
    cmbOrgCharset.ItemIndex := cmbTransCharset.ItemIndex;
    cmbTransCharset.ItemIndex := OrgII;
    cmbOrgCharsetSelect(Sender);
    cmbTransCharsetSelect(Sender);
    Node := lstSubtitles.GetFirst;
    while Assigned(Node) do
    begin
      tmpTrans := GetSubTranslation(Node);
      SetTranslation(Node, GetSubText(Node));
      SetText(Node, tmpTrans);
      Node := Node.NextSibling;
    end;
    tmpTrans      := TransFile;
    TransFile     := OrgFile;
    OrgFile       := tmpTrans;
    OrgModified   := True;
    TransModified := True;

    SetFormCaption;
    RefreshTimes;
    //lstSubtitles.Refresh; //AutoRecheck***Errors refreshes it
    AutoRecheckAllErrors(TextErrors); //added by adenry
  end;
end;

// -----------------------------------------------------------------------------

//added by adenry: begin
//Get the index of the column on the left of a column
function GetTreePrevColumn(Tree: TVirtualStringTree; Column: Integer; Loop: Boolean = False): Integer;
begin
  if (Tree.Header.Columns[Column].Position = Tree.Header.Columns[Tree.Header.Columns.GetFirstVisibleColumn].Position) then
  begin
    if Loop then
      Result := Tree.Header.Columns.GetLastVisibleColumn else
      Result := Column;
  end else
    Result := Tree.Header.Columns.GetPreviousVisibleColumn(Column);
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
//Get the index of the column on the right of a column
function GetTreeNextColumn(Tree: TVirtualStringTree; Column: Integer; Loop: Boolean = False): Integer;
begin
  if (Tree.Header.Columns[Column].Position = Tree.Header.Columns[Tree.Header.Columns.GetLastVisibleColumn].Position) then
  begin
    if Loop then
      Result := Tree.Header.Columns.GetFirstVisibleColumn else
      Result := Column;
  end else
    Result := Tree.Header.Columns.GetNextVisibleColumn(Column);
end;
//added by adenry: end

// -----------------------------------------------------------------------------

end.
