// This file is part of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle Workshop's copyright information
// File Description: Undo/Redo system functionality

unit Undo;

// -----------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Forms, Classes, Controls, Math, //Controls added by adenry to use TCursor type; Math added by adenry for use in DetectChangesForUndo
  VirtualTrees,
  CommonTypes;

// -----------------------------------------------------------------------------

type
	TUndoActionType = (uaInsertLine,
                     uaDeleteLine,
                     uaTypeChar,
                     uaDeleteChar,
                     uaTimeChange,
                     uaFPSChange,
                     uaFullTextChange,
                     uaRTLFix,
                     uaSwapOrgTrans,
                     uaMarkSubtitle,
                     uaFullSubChange
                     );

	TUndoAction = record
		UndoActionType : TUndoActionType;
    Node           : PVirtualNode;
    LineNumber     : Integer;
		BindToNext     : Boolean;
		BufferSize     : Integer;
		Buffer         : Pointer; //Buffer specific to the type of the change
    UndoActionName : TUndoActionName; //added by adenry
	end;
  PUndoAction = ^TUndoAction;

  TLineChange = record // For Delete Line and Full Subtitle Change
    SubtitleItem : TSubtitleItem;
  end;
  PLineChange = ^TLineChange;

  TCharChange = record // For Delete Char or Insert Char
    CharNum   : Integer;
    Character : Char;
    Original  : Boolean; //Original or translation
  end;
  PCharChange = ^TCharChange;

  TTimeChange = record
    StartTime : Integer;
    FinalTime : Integer;
  end;
  PTimeChange = ^TTimeChange;

  TFPSChange = record
    InputOrFPS : Boolean; //True for InputFPS, false for FPS
    OldValue   : Single;
  end;
  PFPSChange = ^TFPSChange;

  TFullTextChange = record
    OldText      : String;
    OldTrans     : String;
    OriginalOnly : Boolean; // True for original, false for both (translation and original)
  end;
  PFullTextChange = ^TFullTextChange;

  TRTLFix = record
    ReverseText    : Boolean;
    KeepLinesOrder : Boolean;
    FixPunctuation : Boolean;
    Original       : Boolean;
  end;
  PRTLFix = ^TRTLFix;
  
// -----------------------------------------------------------------------------

procedure AddUndo(UndoAction: PUndoAction); //added by adenry
procedure ClearUndoList(UndoRedoList: TList);
procedure DetectChangesForUndo(const OldText, NewText: String; const Original: Boolean; BindToPrevious: Boolean = False); //BindToPrevious added by adenry
procedure DeleteSelectedWithUndo;
procedure UndoActionSet(OldList, NewList: TList);

// -----------------------------------------------------------------------------

var
  UndoList : TList;
  RedoList : TList;
  mmoSubtitleTextSelStart : Integer; //added by adenry
  mmoTranslationSelStart  : Integer; //added by adenry

// -----------------------------------------------------------------------------

implementation

uses
  General, Functions, TreeViewHandle, USubtitlesFunctions, VideoPreview, //VideoPreview added by adenry
  formMain;

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure AddUndo(UndoAction: PUndoAction);
begin
  UndoList.Add(UndoAction);
  frmMain.setUndoEnabled(True);
  ClearUndoList(RedoList);
  frmMain.setRedoEnabled(False);
end;
//added by adenry: end

// -----------------------------------------------------------------------------

procedure ClearUndoList(UndoRedoList: TList);                                 
var
  i: Integer;
begin
  if Assigned(UndoRedoList) then  // added by Bdzl
  begin
    if UndoRedoList.Count > 0 then  // added by Bdzl
      for i := UndoRedoList.Count-1 downto 0 do
      begin
        if PUndoAction(UndoRedoList.Items[i]).UndoActionType = uaDeleteLine then
          System.Finalize(PLineChange(PUndoAction(UndoRedoList.Items[i]).Buffer)^);
        if PUndoAction(UndoRedoList.Items[i]).BufferSize > 0 then
          FreeMem(PUndoAction(UndoRedoList.Items[i])^.Buffer, PUndoAction(UndoRedoList.Items[i])^.BufferSize);
          System.Dispose(UndoRedoList.Items[i]);
      end;
    UndoRedoList.Clear;
  end;
end;

// -----------------------------------------------------------------------------

procedure DeleteSelectedWithUndo;
var
  Node       : PVirtualNode;
  Node2      : PVirtualNode;
  NextNode   : PVirtualNode; //added by adenry (for AutoRecheckNodeErrors)
  Data       : PSubtitleItem;
  UndoAction : PUndoAction;
begin
  with frmMain do
  begin
    lstSubtitles.BeginUpdate;

    Node := lstSubtitles.GetFirstSelected;
    while Assigned(Node) do
    begin
      Node2 := lstSubtitles.GetNextSelected(Node);
      NextNode := lstSubtitles.GetNextSibling(Node); //added by adenry (for AutoRecheckNodeErrors)
      Data := lstSubtitles.GetNodeData(Node);
      New(UndoAction);
      UndoAction^.BufferSize                        := SizeOf(TLineChange);
      UndoAction^.Buffer                            := AllocMem(UndoAction^.BufferSize);
      UndoAction^.UndoActionType                    := uaDeleteLine;
      UndoAction^.UndoActionName                    := uanRemoveSelected; //added by adenry
      UndoAction^.BindToNext                        := True;
      UndoAction^.LineNumber                        := Node.Index;
      PLineChange(UndoAction^.Buffer)^.SubtitleItem := Data^;
      AddUndo(UndoAction);

      AutoRecheckNodeErrors(Node, [], rtSubDeleted, True);//refresh info&errors form only //added by adenry
      UpdateSubSubtitleVisibilityAfterNodeChange(Node, Data.InitialTime, Data.FinalTime, -1, -1); //added by adenry

      lstSubtitles.DeleteNode(Node); //DELETE THE NODE

      if Node2 <> NextNode then //added by adenry later
        AutoRecheckNodeErrors(NextNode, PauseErrors); //added by adenry

      Node := Node2;
    end;

    lstSubtitles.EndUpdate;

    if UndoList.Count > 0 then
      PUndoAction(UndoList.Last)^.BindToNext := False;
  end;
end;

// -----------------------------------------------------------------------------

procedure DetectChangesForUndo(const OldText, NewText: String; const Original: Boolean; BindToPrevious: Boolean = False); //BindToPrevious added by adenry
var
  L1,L2         : integer;
  iLow,iHigh    : integer;
  i             : integer;
  UndoAction    : PUndoAction;
begin
  with frmMain do
  begin
    if OldText <> NewText then
    begin
      L1 := Length(OldText);
      L2 := Length(NewText);

      if (L1 > 0) and (L2 > 0) then
      begin
        iLow  := 1; //0 changed to 1 by adenry - first character is [1], not [0]
        iHigh := 0;
        while OldText[iLow] = NewText[iLow] do Inc(iLow);
        Dec(iLow);
        while OldText[L1-iHigh] = NewText[L2-iHigh] do Inc(iHigh);

        //removed by adenry: begin
        // The following takes care of the case if there is the same letter twice
        //if (L1-iHigh) < iLow then iHigh := L1 - iLow else
        //if (L2-iHigh) < iLow then iHigh := L2 - iLow;
        //removed by adenry: end

        //added by adenry: fix of the removed code above - we can have the same symbol more than twice:
        if iLow + iHigh > Min(L1,L2) then
          iHigh := Min(L1,L2) - iLow;

      end else
      begin
        iLow  := 0;
        iHigh := 0;
      end;

      //added by adenry: bind to previous when fast typing
      //if BindToPrevious and (UndoList.Count > 0) then
      //  //if PCharChange(PUndoAction(UndoList.Items[UndoList.Count-1])^.Buffer)^.Original = Original then
      //  if (Original and (PUndoAction(UndoList.Items[UndoList.Count-1])^.UndoActionName = uanTextEdit)) or (not Original and (PUndoAction(UndoList.Items[UndoList.Count-1])^.UndoActionName = uanTransEdit)) then //don't bind text modification to translation modification or vice versa, or to anything else
      //    PUndoAction(UndoList.Items[UndoList.Count-1])^.BindToNext := True;

      //Create an Undo action for each deleted character:
      for i := L1-iHigh downto iLow+1 do
      begin
        New(UndoAction);
        UndoAction^.UndoActionType                 := uaDeleteChar;
        //added by adenry: begin
        if Original then
          UndoAction^.UndoActionName               := uanTextEdit else
          UndoAction^.UndoActionName               := uanTransEdit;
        //added by adenry: end
        UndoAction^.Node                           := lstSubtitles.FocusedNode;
        UndoAction^.LineNumber                     := UndoAction^.Node.Index;
        UndoAction^.BindToNext                     := True;
        UndoAction^.BufferSize                     := SizeOf(TCharChange);
        UndoAction^.Buffer                         := AllocMem(UndoAction^.BufferSize);
        PCharChange(UndoAction^.Buffer)^.Original  := Original;
        PCharChange(UndoAction^.Buffer)^.CharNum   := i;
        PCharChange(UndoAction^.Buffer)^.Character := OldText[i];

        //added by adenry: begin
        //bind character deletions:
        if BindToPrevious and (UndoList.Count > 0) then //if we want to bind, and if there is a previous undo action to bind to
          if (Original and (PUndoAction(UndoList.Items[UndoList.Count-1])^.UndoActionName = uanTextEdit)) //don't bind to anything except to other text modifications
          or (not Original and (PUndoAction(UndoList.Items[UndoList.Count-1])^.UndoActionName = uanTransEdit)) then //don't bind to anything except to other translation modifications
            if L1-iHigh = iLow+1 then //if exactly one characted was deleted
              if not(OldText[i] in SpecialChars) //if it was not a special character
              and (
                (
                  (PUndoAction(UndoList.Items[UndoList.Count-1])^.UndoActionType = uaDeleteChar) and //previous action was character deletion
                  (
                    (i = PCharChange(PUndoAction(UndoList.Items[UndoList.Count-1])^.Buffer)^.CharNum) or //if DELETE was used
                    (i = PCharChange(PUndoAction(UndoList.Items[UndoList.Count-1])^.Buffer)^.CharNum-1) //or if BACKSPACE was used
                  )
                ) or (
                  (PUndoAction(UndoList.Items[UndoList.Count-1])^.UndoActionType = uaTypeChar) and //previous action was typing a character
                  (i = PCharChange(PUndoAction(UndoList.Items[UndoList.Count-1])^.Buffer)^.CharNum) //it was the same character we are now deleting
                )
              ) then
                PUndoAction(UndoList.Items[UndoList.Count-1])^.BindToNext := True; //BIND TO PREVIOUS UNDO ACTION
        //added by adenry: end

        AddUndo(UndoAction);
      end;

      //Create an Undo action for each typed character:
      for i := iLow+1 to L2-iHigh do
      begin
        New(UndoAction);
        UndoAction^.UndoActionType                 := uaTypeChar;
        //added by adenry: begin
        if Original then
          UndoAction^.UndoActionName               := uanTextEdit else
          UndoAction^.UndoActionName               := uanTransEdit;
        //added by adenry: end
        UndoAction^.Node                           := lstSubtitles.FocusedNode;
        UndoAction^.LineNumber                     := UndoAction^.Node.Index;
        UndoAction^.BindToNext                     := True;
        UndoAction^.BufferSize                     := SizeOf(TCharChange);
        UndoAction^.Buffer                         := AllocMem(UndoAction^.BufferSize);
        PCharChange(UndoAction^.Buffer)^.Original  := Original;
        PCharChange(UndoAction^.Buffer)^.CharNum   := i;
        PCharChange(UndoAction^.Buffer)^.Character := NewText[i];

        //added by adenry: begin
        //bind character typings:
        if BindToPrevious and (UndoList.Count > 0) then //if we want to bind, and if there is a previous undo action to bind to
          if (Original and (PUndoAction(UndoList.Items[UndoList.Count-1])^.UndoActionName = uanTextEdit)) //don't bind to anything except to other text modifications
          or (not Original and (PUndoAction(UndoList.Items[UndoList.Count-1])^.UndoActionName = uanTransEdit)) then //don't bind to anything except to other translation modifications
            if iLow+1 = L2-iHigh then //if exactly one characted was typed
              if (
                (
                  (PUndoAction(UndoList.Items[UndoList.Count-1])^.UndoActionType = uaTypeChar) and //previous action was typing a character
                  (i = PCharChange(PUndoAction(UndoList.Items[UndoList.Count-1])^.Buffer)^.CharNum+1) //the character in the previous position was typed
                ) or (
                  (PUndoAction(UndoList.Items[UndoList.Count-1])^.UndoActionType = uaDeleteChar) and //previous action was character deletion
                  (i = PCharChange(PUndoAction(UndoList.Items[UndoList.Count-1])^.Buffer)^.CharNum) //the character in the same position we are typing in now was deleted
                )
              ) then
                PUndoAction(UndoList.Items[UndoList.Count-1])^.BindToNext := True; //BIND TO PREVIOUS UNDO ACTION
        //added by adenry: end

        AddUndo(UndoAction);
      end;

      if UndoList.Count > 0 then //added by adenry - just in case
        PUndoAction(UndoList.Items[UndoList.Count-1])^.BindToNext := False;

    end;
  end;
end;

// -----------------------------------------------------------------------------

procedure UndoActionSet(OldList, NewList: TList);

  procedure UndoSingleAction(const Bind: Boolean);
  var
    UndoAction1  : PUndoAction;
    UndoAction2  : PUndoAction;
    Node         : PVirtualNode;
    Data         : PSubtitleItem;
    tmpStr       : String;
    //Time1, Time2 : Integer; //removed by adenry
    //i            : Word; //added by adenry
    fix          : Boolean; //added by adenry
  begin
    with frmMain do
    begin
      UndoAction1 := OldList.Last;
      New(UndoAction2);
      UndoAction2^.BindToNext := Bind;
      UndoAction2^.UndoActionName := UndoAction1^.UndoActionName;//added by adenry

      case UndoAction1^.UndoActionType of
        uaInsertLine:
          begin
            if not Bind then //added by adenry - important!
              UnSelectAll(lstSubtitles);
            UndoAction2^.UndoActionType := uaDeleteLine;
            UndoAction2^.BufferSize     := SizeOf(TLineChange);
            UndoAction2^.Buffer         := AllocMem(UndoAction2^.BufferSize);
            UndoAction2^.LineNumber     := UndoAction1^.LineNumber;
            Data := lstSubtitles.GetNodeData(GetNodeWithIndex(lstSubtitles, UndoAction2^.LineNumber));
            PLineChange(UndoAction2^.Buffer)^.SubtitleItem := Data^;

            Node := GetNodeWithIndex(lstSubtitles, UndoAction2^.LineNumber);
            if Node <> lstSubtitles.GetFirst then
              lstSubtitles.FocusedNode := Node.PrevSibling else
              lstSubtitles.FocusedNode := Node.NextSibling;
            AutoRecheckNodeErrors(Node, [], rtSubDeleted, True); //refresh info&errors form only //added by adenry
            UpdateSubSubtitleVisibilityAfterNodeChange(Node, Data.InitialTime, Data.FinalTime, -1, -1); //added by adenry
            lstSubtitles.DeleteNode(Node); //DELETE THE NODE
            if not Bind then //added by adenry - important!
              lstSubtitles.Selected[lstSubtitles.FocusedNode] := True;
            if Assigned(lstSubtitles.FocusedNode) then //added by adenry
              AutoRecheckNodeErrors(lstSubtitles.FocusedNode.NextSibling, PauseErrors); //added by adenry
          end;
        uaDeleteLine:
          begin
            if not Bind then //added by adenry - important!
              UnSelectAll(lstSubtitles);
            UndoAction2^.UndoActionType := uaInsertLine;
            UndoAction2^.Buffer         := nil;
            UndoAction2^.BufferSize     := 0;

            //removed by adenry: begin
            {if (lstSubtitles.RootNodeCount = 0) or (UndoAction1.LineNumber = 0) then
              UndoAction2^.Node := lstSubtitles.InsertNode(lstSubtitles.RootNode, amAddChildFirst) else}
            //removed by adenry: end

            //added by adenry: begin
            //this was done to remove a nasty bug - lstSubtitles scrolls don't refresh properly after deleting the first subtitle (or first and more)
            if (lstSubtitles.RootNodeCount = 0) then
            begin
              if not (vsExpanded in lstSubtitles.RootNode.Parent.States) then fix := True else fix := False;
              if fix then lstSubtitles.RootNode.Parent.States := lstSubtitles.RootNode.Parent.States + [vsExpanded];
              lstSubtitles.InsertNode(nil, amInsertBefore);
              if fix then lstSubtitles.RootNode.Parent.States := lstSubtitles.RootNode.Parent.States - [vsExpanded];
              UndoAction2^.Node := lstSubtitles.GetFirst;
            end else
            if (UndoAction1.LineNumber = 0) then
              UndoAction2^.Node := lstSubtitles.InsertNode(lstSubtitles.GetFirst, amInsertBefore) else
            //added by adenry: end
            begin
              Node := lstSubtitles.GetFirst;
              while Node.Index < Cardinal(UndoAction1^.LineNumber-1) do
                Node := Node.NextSibling;
              //for i := 1 to UndoAction1^.LineNumber-1 do Node := Node.NextSibling; //added by adenry: faster version?
              UndoAction2^.Node := lstSubtitles.InsertNode(Node, amInsertAfter);
              //UndoAction2^.Node := lstSubtitles.InsertNode(lstSubtitles.GetNodeAt(1,lstSubtitles.DefaultNodeHeight*UndoAction1^.LineNumber), amInsertAfter); //added by adenry: faster version 2?
            end;

            UndoAction2^.LineNumber := UndoAction2^.Node.Index;
            lstSubtitles.InvalidateNode(UndoAction2^.Node);

            Data := lstSubtitles.GetNodeData(UndoAction2^.Node);
            Data^.InitialTime := PSubtitleItem(UndoAction1^.Buffer)^.InitialTime;
            Data^.FinalTime   := PSubtitleItem(UndoAction1^.Buffer)^.FinalTime;
            Data^.Text        := PSubtitleItem(UndoAction1^.Buffer)^.Text;
            Data^.Translation := PSubtitleItem(UndoAction1^.Buffer)^.Translation;
            Data^.Marked      := PSubtitleItem(UndoAction1^.Buffer)^.Marked;
            Data^.ErrorType   := PSubtitleItem(UndoAction1^.Buffer)^.ErrorType;

            System.Finalize(PLineChange(UndoAction1^.Buffer)^);

            lstSubtitles.FocusedNode := UndoAction2^.Node;
            if not Bind then //added by adenry - important!
              lstSubtitles.Selected[lstSubtitles.FocusedNode] := True;

            UpdateSubSubtitleVisibilityAfterNodeChange(UndoAction2^.Node, -1, -1, Data^.InitialTime, Data^.FinalTime); //added by adenry

            //AutoRecheckNodeErrors(lstSubtitles.FocusedNode); //added by adenry - not needed because we restore the errors too with Data^.ErrorType   := PSubtitleItem(UndoAction1^.Buffer)^.ErrorType;

            AutoRecheckNodeErrors(lstSubtitles.FocusedNode, [], rtSubAdded, True); //refresh info&errors form only //added by adenry
            AutoRecheckNodeErrors(lstSubtitles.FocusedNode.NextSibling, PauseErrors); //added by adenry
          end;
        uaTypeChar:
          begin
            UndoAction2^.UndoActionType                 := uaDeleteChar;
            UndoAction2^.BufferSize                     := SizeOf(TCharChange);
            UndoAction2^.Buffer                         := AllocMem(UndoAction2^.BufferSize);
            UndoAction2^.LineNumber                     := UndoAction1^.LineNumber;
            UndoAction2^.Node                           := GetNodeWithIndex(lstSubtitles, UndoAction2^.LineNumber);
            PCharChange(UndoAction2^.Buffer)^.CharNum   := PCharChange(UndoAction1^.Buffer)^.CharNum;
            PCharChange(UndoAction2^.Buffer)^.Character := PCharChange(UndoAction1^.Buffer)^.Character;
            PCharChange(UndoAction2^.Buffer)^.Original  := PCharChange(UndoAction1^.Buffer)^.Original;
            if PCharChange(UndoAction2^.Buffer)^.Original then
            begin
              tmpStr := GetSubText(UndoAction2^.Node);
              Delete(tmpStr, PCharChange(UndoAction2^.Buffer)^.CharNum, 1);
              SetText(UndoAction2^.Node, tmpStr);
            end else
            begin
              tmpStr := GetSubTranslation(UndoAction2^.Node);
              Delete(tmpStr,PCharChange(UndoAction2^.Buffer)^.CharNum, 1);
              SetTranslation(UndoAction2^.Node, tmpStr);
            end;

            lstSubtitles.InvalidateNode(UndoAction2^.Node);

            if (lstSubtitles.FocusedNode <> UndoAction2^.Node) or (lstSubtitles.SelectedCount <> 1) then //added by adenry - important!
            begin
              UnSelectAll(lstSubtitles);
              lstSubtitles.FocusedNode := UndoAction2^.Node;
              lstSubtitles.Selected[lstSubtitles.FocusedNode] := True;
            end;
            //added by adenry: begin
            //we undo a character typing, so we should return the focus to the control the character was typed in:
            if PCharChange(UndoAction2^.Buffer)^.Original then
              frmMain.mmoSubtitleText.SetFocus else
              frmMain.mmoTranslation.SetFocus;
            //added by adenry: end

            if GetFocus = mmoSubtitleText.Handle then
              mmoSubtitleText.SelStart := PCharChange(UndoAction2^.Buffer)^.CharNum-1 else
            if GetFocus = mmoTranslation.Handle then
              mmoTranslation.SelStart := PCharChange(UndoAction2^.Buffer)^.CharNum-1;

            AutoRecheckNodeErrors(lstSubtitles.FocusedNode, TextErrors); //added by adenry
          end;
        uaDeleteChar:
          begin
            UndoAction2^.UndoActionType                := uaTypeChar;
            UndoAction2^.BufferSize                    := SizeOf(TCharChange);
            UndoAction2^.Buffer                        := AllocMem(UndoAction2^.BufferSize);
            UndoAction2^.LineNumber                    := UndoAction1^.LineNumber;
            UndoAction2^.Node                          := GetNodeWithIndex(lstSubtitles, UndoAction2^.LineNumber);
            PCharChange(UndoAction2^.Buffer).CharNum   := PCharChange(UndoAction1^.Buffer).CharNum;
            PCharChange(UndoAction2^.Buffer).Character := PCharChange(UndoAction1^.Buffer).Character;
            PCharChange(UndoAction2^.Buffer).Original  := PCharChange(UndoAction1^.Buffer).Original;
            if PCharChange(UndoAction2^.Buffer).Original then
            begin
              tmpStr := GetSubText(UndoAction2^.Node);
              tmpStr := Copy(tmpStr, 1, PCharChange(UndoAction2^.Buffer).CharNum-1) +
                        PCharChange(UndoAction2^.Buffer).Character +
                        Copy(tmpStr, PCharChange(UndoAction2^.Buffer).CharNum, Length(tmpStr)-PCharChange(UndoAction2^.Buffer).CharNum+1);
              SetText(UndoAction2^.Node, tmpStr);
              mmoSubtitleTextSelStart := PCharChange(UndoAction2^.Buffer).CharNum; //added by adenry
            end else
            begin
              tmpStr := GetSubTranslation(UndoAction2^.Node);
              tmpStr := Copy(tmpStr, 1, PCharChange(UndoAction2^.Buffer).CharNum-1)+
                        PCharChange(UndoAction2^.Buffer).Character +
                        Copy(tmpStr, PCharChange(UndoAction2^.Buffer).CharNum, Length(tmpStr)-PCharChange(UndoAction2^.Buffer).CharNum+1);
              SetTranslation(UndoAction2^.Node,tmpStr);
              mmoTranslationSelStart := PCharChange(UndoAction2^.Buffer).CharNum; //added by adenry
            end;

            lstSubtitles.InvalidateNode(UndoAction2^.Node);

            //added by adenry: begin
            if (lstSubtitles.FocusedNode <> UndoAction2^.Node) or (lstSubtitles.SelectedCount <> 1) then //important!
            begin
              UnSelectAll(lstSubtitles);
              lstSubtitles.FocusedNode := UndoAction2^.Node;
              lstSubtitles.Selected[lstSubtitles.FocusedNode] := True;
            end;
            //we undo a character deletion, so we should return the focus to the control the character was deleted in:
            if PCharChange(UndoAction2^.Buffer)^.Original then
              frmMain.mmoSubtitleText.SetFocus else
              frmMain.mmoTranslation.SetFocus;
            //added by adenry: end

            //removed by adenry:
            //if GetFocus = mmoTranslation.Handle then
            //  mmoTranslation.SelStart := PCharChange(UndoAction2^.Buffer)^.CharNum else
            //  mmoSubtitleText.SelStart := PCharChange(UndoAction2^.Buffer)^.CharNum;

            AutoRecheckNodeErrors(UndoAction2^.Node, TextErrors); //added by adenry
          end;
        uaTimeChange:
          begin
            UndoAction2^.UndoActionType := uaTimeChange;
            UndoAction2^.LineNumber     := UndoAction1^.LineNumber;
            UndoAction2^.Node           := GetNodeWithIndex(lstSubtitles, UndoAction2^.LineNumber);
            UndoAction2^.BufferSize     := SizeOf(TTimeChange);
            UndoAction2^.Buffer         := AllocMem(UndoAction2^.BufferSize);

            if PTimeChange(UndoAction1^.Buffer).StartTime > -1 then
            begin
              PTimeChange(UndoAction2^.Buffer).StartTime := GetStartTime(UndoAction2^.Node);
              SetStartTime(UndoAction2^.Node, PTimeChange(UndoAction1^.Buffer).StartTime);
            end else
              PTimeChange(UndoAction2^.Buffer).StartTime := -1;

            if PTimeChange(UndoAction1^.Buffer).FinalTime > -1 then
            begin
              PTimeChange(UndoAction2^.Buffer).FinalTime := GetFinalTime(UndoAction2^.Node);
              SetFinalTime(UndoAction2^.Node, PTimeChange(UndoAction1^.Buffer).FinalTime);
            end else
              PTimeChange(UndoAction2^.Buffer).FinalTime := -1;

            lstSubtitles.InvalidateNode(UndoAction2^.Node);
            AutoRecheckNodeErrors(UndoAction2^.Node, TimeErrors); //added by adenry
            AutoRecheckNodeErrors(UndoAction2^.Node.NextSibling, PauseErrors); //added by adenry
          end;
        uaFPSChange:
          begin
            // It is better to remember the floating point value here rather than
            // the index in the combobox, because the index can change while editing
            // (when the user adds a custom FPS)
            UndoAction2^.UndoActionType                := uaFPSChange;
            UndoAction2^.Node                          := nil;
            UndoAction2^.BufferSize                    := SizeOf(TFPSChange);
            UndoAction2^.Buffer                        := AllocMem(UndoAction2^.BufferSize);
            PFPSChange(UndoAction2^.Buffer).InputOrFPS := PFPSChange(UndoAction1^.Buffer).InputOrFPS;
            if PFPSChange(UndoAction2^.Buffer).InputOrFPS then
            //Input FPS changed:
            begin
              PFPSChange(UndoAction2^.Buffer).OldValue := OldInputFPS;
              cmbInputFPS.ItemIndex := cmbInputFPS.Items.IndexOf(FormatFloat('#.###', PFPSChange(UndoAction1^.Buffer).OldValue));
              cmbInputFPS.SetFocus;

              //this is removed, because the exact times are now saved as uaTimeChange
              //removed by adenry: begin
              {Node := lstSubtitles.GetFirst;
              while Assigned(Node) do
              begin
                // ------------ //
                // Initial time //
                // ------------ //
                Time1 := TimeToFrames(GetStartTime(Node), GetInputFPS);
                SetStartTime(Node, FramesToTime(Time1, OldInputFPS));

                // ---------- //
                // Final time //
                // ---------- //
                Time2 := TimeToFrames(GetFinalTime(Node), GetInputFPS);
                SetFinalTime(Node, FramesToTime(Time2, OldInputFPS));

                Node := Node.NextSibling;
              end;}
              //removed by adenry: end

              OldInputFPS := PFPSChange(UndoAction1^.Buffer).OldValue;
            end else
            //FPS changed:
            begin
              PFPSChange(UndoAction2^.Buffer).OldValue := OldFPS;
              cmbFPS.ItemIndex := cmbFPS.Items.IndexOf(FormatFloat('#.###', PFPSChange(UndoAction1^.Buffer).OldValue));
              cmbFPS.SetFocus;

              //this is removed, because the exact times are now saved as uaTimeChange
              //removed by adenry: begin
              {Node := lstSubtitles.GetFirst;
              while Assigned(Node) do
              begin
                // ------------ //
                // Initial time //
                // ------------ //
                Time1 := TimeToFrames(GetStartTime(Node), OldFPS);
                SetStartTime(Node, FramesToTime(Time1, GetFPS));

                // ---------- //
                // Final time //
                // ---------- //
                Time2 := TimeToFrames(GetFinalTime(Node), OldFPS);
                SetFinalTime(Node, FramesToTime(Time2, GetFPS));

                Node := Node.NextSibling;
              end;}
              //removed by adenry: end

              OldFPS := PFPSChange(UndoAction1^.Buffer).OldValue;
            end;
            frmMain.AutoRecheckAllErrors(TimeErrors); //added by adenry
          end;
        uaFullTextChange:
          begin
            UndoAction2^.UndoActionType := uaFullTextChange;
            UndoAction2^.BufferSize     := SizeOf(TFullTextChange);
            UndoAction2^.Buffer         := AllocMem(UndoAction2^.BufferSize);
            UndoAction2^.LineNumber     := UndoAction1^.LineNumber;
            UndoAction2^.Node           := GetNodeWithIndex(lstSubtitles, UndoAction2^.LineNumber);

            PFullTextChange(UndoAction2^.Buffer)^.OldText      := GetSubText(UndoAction2^.Node);
            PFullTextChange(UndoAction2^.Buffer)^.OldTrans     := GetSubTranslation(UndoAction2^.Node);
            PFullTextChange(UndoAction2^.Buffer)^.OriginalOnly := PFullTextChange(UndoAction1^.Buffer)^.OriginalOnly;

            SetText(UndoAction2^.Node, PFullTextChange(UndoAction1^.Buffer)^.OldText);
            if PFullTextChange(UndoAction2^.Buffer)^.OriginalOnly = False then
              SetTranslation(UndoAction2^.Node, PFullTextChange(UndoAction1^.Buffer)^.OldTrans);

            AutoRecheckNodeErrors(UndoAction2^.Node, TextErrors); //added by adenry
          end;
        uaRTLFix:
          begin
            UndoAction2^.UndoActionType := uaRTLFix;
            UndoAction2^.BufferSize     := SizeOf(TRTLFix);
            UndoAction2^.Buffer         := AllocMem(UndoAction2^.BufferSize);
            UndoAction2^.LineNumber     := UndoAction1^.LineNumber;
            UndoAction2^.Node           := GetNodeWithIndex(lstSubtitles, UndoAction2^.LineNumber);
            PRTLFix(UndoAction2^.Buffer)^.ReverseText    := PRTLFix(UndoAction1^.Buffer).ReverseText;
            PRTLFix(UndoAction2^.Buffer)^.KeepLinesOrder := PRTLFix(UndoAction1^.Buffer).KeepLinesOrder;
            PRTLFix(UndoAction2^.Buffer)^.FixPunctuation := PRTLFix(UndoAction1^.Buffer).FixPunctuation;

            if PRTLFix(UndoAction1^.Buffer).ReverseText then
              SetText(UndoAction2^.Node, USubtitlesFunctions.ReverseText(GetSubText(UndoAction2^.Node), PRTLFix(UndoAction1^.Buffer).KeepLinesOrder));
            if PRTLFix(UndoAction1^.Buffer).FixPunctuation then
            begin
              if PRTLFix(UndoAction1^.Buffer).Original then
                SetText(UndoAction2^.Node, FixRTLPunctuation(GetSubText(UndoAction2^.Node))) else
                SetTranslation(UndoAction2^.Node, FixRTLPunctuation(GetSubTranslation(UndoAction2^.Node)));
            end;
            AutoRecheckNodeErrors(UndoAction2^.Node, TextErrors); //added by adenry
          end;
        uaSwapOrgTrans:
          begin
            UndoAction2^.UndoActionType := uaSwapOrgTrans;
            UndoAction2^.BufferSize     := 0;
            UndoAction2^.Buffer         := nil;
            UndoAction2^.Node           := nil;
            SwapOrgTrans(frmMain as TObject, False);
            //no need for AutoRecheckAllErrors cause SwapOrgTrans is called and it calls AutoRecheckAllErrors
          end;
        uaMarkSubtitle:
          begin
            UndoAction2^.UndoActionType := uaMarkSubtitle;
            UndoAction2^.BufferSize     := 0;
            UndoAction2^.Buffer         := nil;
            UndoAction2^.Node           := GetNodeWithIndex(lstSubtitles, UndoAction1^.LineNumber);
            UndoAction2^.LineNumber     := UndoAction1^.LineNumber;

            Data := lstSubtitles.GetNodeData(UndoAction2^.Node);
            Data.Marked := not Data.Marked;
            //nothing changed except marking, no need to recheck any errors
            AutoRecheckNodeErrors(UndoAction2^.Node, [], rtNormal, True);//refresh info&errors form only //added by adenry
          end;
        uaFullSubChange:
          begin
            UndoAction2^.UndoActionType := uaFullSubChange;
            UndoAction2^.BufferSize     := SizeOf(TLineChange);
            UndoAction2^.Buffer         := AllocMem(UndoAction2^.BufferSize);
            UndoAction2^.Node           := GetNodeWithIndex(lstSubtitles, UndoAction1^.LineNumber);
            UndoAction2^.LineNumber     := UndoAction2^.Node.Index;
            Data := lstSubtitles.GetNodeData(UndoAction2^.Node);
            PLineChange(UndoAction2.Buffer)^.SubtitleItem.InitialTime := Data^.InitialTime;
            PLineChange(UndoAction2.Buffer)^.SubtitleItem.FinalTime   := Data^.FinalTime;
            PLineChange(UndoAction2.Buffer)^.SubtitleItem.Text        := Data^.Text;
            PLineChange(UndoAction2.Buffer)^.SubtitleItem.Translation := Data^.Translation;
            PLineChange(UndoAction2.Buffer)^.SubtitleItem.Marked      := Data^.Marked;
            PLineChange(UndoAction2.Buffer)^.SubtitleItem.ErrorType   := Data^.ErrorType;
            Data^.InitialTime := PLineChange(UndoAction1^.Buffer)^.SubtitleItem.InitialTime;
            Data^.FinalTime   := PLineChange(UndoAction1^.Buffer)^.SubtitleItem.FinalTime;
            Data^.Text        := PLineChange(UndoAction1^.Buffer)^.SubtitleItem.Text;
            Data^.Translation := PLineChange(UndoAction1^.Buffer)^.SubtitleItem.Translation;
            Data^.Marked      := PLineChange(UndoAction1^.Buffer)^.SubtitleItem.Marked;
            Data^.ErrorType   := PLineChange(UndoAction1^.Buffer)^.SubtitleItem.ErrorType;
            //no need to recheck the errors, as we restore them in Data^.ErrorType with the previous line
            AutoRecheckNodeErrors(UndoAction2^.Node, [], rtNormal, True); //refresh info&errors form only //added by adenry
            UpdateSubSubtitleTextAfterNodeChange(UndoAction2^.Node); //added by adenry
          end;
      end;
      NewList.Add(UndoAction2); //add the Undo action to the Redo list or vice versa

      if UndoAction1^.BufferSize > 0 then
        System.FreeMem(UndoAction1^.Buffer, UndoAction1^.BufferSize);

      OldList.Remove(UndoAction1);
      Dispose(UndoAction1);
    end;
  end;

var ShouldSelect: Boolean; //added by adenry
begin
  mmoSubtitleTextSelStart := -1; //added by adenry
  mmoTranslationSelStart := -1; //added by adenry
  //executes when Undo or Redo is pressed
  with frmMain do
  begin
    ShouldSelect := lstSubtitles.SelectedCount > 0; //added by adenry

    while (OldList.Count > 1) and (PUndoAction(OldList.Items[OldList.Count-2]).BindToNext) do
      UndoSingleAction(True);
    if OldList.Count > 0 then UndoSingleAction(False);

    //added by adenry: if we reached the Undo action prior to saving the file, mark the file as unmodified
    if UndoNumWhenOrgSaved = UndoList.Count then OrgModified := False;
    if UndoNumWhenTransSaved = UndoList.Count then TransModified := False;

    //added by adenry: Set selection...
    if (lstSubtitles.SelectedCount = 0) and ShouldSelect and (lstSubtitles.TotalCount > 0) then
      if Assigned(lstSubtitles.FocusedNode) then
        lstSubtitles.Selected[lstSubtitles.FocusedNode] := True else
        lstSubtitles.Selected[lstSubtitles.GetFirst] := True;

    setUndoEnabled(UndoList.Count > 0); //modified by adenry //mnuUndo.Enabled := UndoList.Count > 0;
    setRedoEnabled(RedoList.Count > 0); //modified by adenry //mnuRedo.Enabled := RedoList.Count > 0;

    lstSubtitles.Refresh;
    RefreshTimes;
    //added by adenry: refresh SelStart of memos:
    if mmoSubtitleTextSelStart > -1 then mmoSubtitleText.SelStart := mmoSubtitleTextSelStart;
    if mmoTranslationSelStart > -1 then mmoTranslation.SelStart := mmoTranslationSelStart;
    MarkLongLinesInLabel(lblText); //added by adenry
    MarkLongLinesInLabel(lblTranslation); //added by adenry
  end;
end;

// -----------------------------------------------------------------------------

end.




