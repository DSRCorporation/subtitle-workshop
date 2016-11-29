// This file is part of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle Workshop's copyright information
// File Description: "In-place edition" functionality

unit VTInPlaceEdition;

// -----------------------------------------------------------------------------

interface

// -----------------------------------------------------------------------------

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, StdCtrls, ExtDlgs, ImgList, Buttons, ExtCtrls, ComCtrls, Mask,
  VirtualTrees, TimeMaskEdit,
  CommonTypes;

// -----------------------------------------------------------------------------

type
  // Our own edit link to implement several different node editors.
  TTreeEditLink = class(TInterfacedObject, IVTEditLink)
  private
    FEdit: TWinControl;        // One of the property editor classes.
    FTree: TVirtualStringTree; // A back reference to the tree calling.
    FNode: PVirtualNode;       // The node being edited.
    FColumn: Integer;          // The column of the node being edited.
    FOldEditProc: TWndMethod;  // Used to capture some important messages
                               // regardless of the type of edit control we use
    FOkayToEndWithF2: Boolean;
  protected
    procedure EditWindowProc(var Message: TMessage);
    //procedure EditTimeChangeFromEditOnly(Sender: TObject; NewTime: Cardinal); //removed by adenry
    procedure EditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EditKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState); //added by adenry
    procedure EditKeyPress(Sender: TObject; var Key: Char); //added by adenry
  public
    destructor Destroy; override;

    function BeginEdit: Boolean; stdcall;
    function CancelEdit: Boolean; stdcall;
    function EndEdit: Boolean; stdcall;
    function GetBounds: TRect; stdcall;
    function PrepareEdit(Tree: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex): Boolean; stdcall;
    procedure ProcessMessage(var Message: TMessage); stdcall;
    procedure SetBounds(R: TRect); stdcall;
  end;

// -----------------------------------------------------------------------------

implementation

uses
  TreeViewHandle, USubtitlesFunctions, Undo, //Functions removed by adenry
  formMain;

//----------------- TEdit interceptor-------------------------------------------

//added by adenry: begin

// We modify TEdit for this unit with an interceptor class to include Alignment

type
  TEdit = class(StdCtrls.Tedit)
  private
    FAlignment: TAlignment;
    procedure SetAlignment(Value: TAlignment);
  protected
    procedure CreateParams(var Params: TCreateParams); override;
  public
    property Alignment: TAlignment read FAlignment write SetAlignment;
  end;

procedure TEdit.CreateParams(var Params: TCreateParams);
const
  Alignments : array[TAlignment] of LongWord = (ES_Left,ES_Right, ES_Center);
begin
  inherited CreateParams(Params);
  Params.Style := Params.Style or Alignments[FAlignment];
end;

procedure TEdit.SetAlignment(Value: TAlignment);
begin
  if FAlignment <> Value then
  begin
    FAlignment := Value;
    RecreateWnd;
  end;
end;

//added by adenry: end

//----------------- TTreeEditLink ----------------------------------------------

destructor TTreeEditLink.Destroy;
begin
  FEdit.Free; //removed by adenry
  inherited;
end;

// -----------------------------------------------------------------------------

procedure TTreeEditLink.EditWindowProc(var Message: TMessage);
// Here we can capture messages for keeping track of focus changes.
begin
  case Message.Msg of
    WM_KILLFOCUS: FTree.EndEditNode;
  else
    FOldEditProc(Message);
  end;
end;

// -----------------------------------------------------------------------------

procedure TTreeEditLink.EditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  //added by adenry: cancel cursor move when UP or DOWN keys are used
  case Key of
    VK_PRIOR, VK_NEXT, VK_TAB: Key := 0;
    VK_F2: FOkayToEndWithF2 := True;
  end;

  //removed by adenry: Can't end node edit here, because FEdit would be freed, and it's needed later... That's why an error always occures! OnKeyPress added instead
  {
  case Key of
    VK_RETURN,
    VK_UP,
    VK_DOWN:
      begin
        //FEdit.Hide; //added by adenry
        FTree.EndEditNode;
        //FTree.RepaintNode(FNode);

        with FTree do
        begin
          if Assigned(FNode) then
          begin
            Selected[FNode] := False;
            if Key = VK_UP then
              FocusedNode := FNode.PrevSibling else
              FocusedNode := FNode.NextSibling;
            if Assigned(FocusedNode) then
            begin
              Selected[FocusedNode] := True;
              FTree.FocusedNode := FocusedNode;
            end;
            //SetFocus(FTree.Handle);

            //added by adenry:
            //if FTree.Enabled then
            //begin
            //  FTree.SetFocus;
            //  FTree.FocusedNode := FNode;
            //  FTree.Selected[FNode] := True;
            //end;
          end;
        end;
        Key := 0;
      end;
  end;
  }
end;

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TTreeEditLink.EditKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  Node: PVirtualNode;
  Column: Integer;
begin
  if Key in [VK_PRIOR, VK_NEXT, VK_TAB] then
  begin
    //determine what would be the next edit
    Node := FNode;
    Column := FColumn;
    case Key of
      VK_PRIOR:
        Node := FNode.PrevSibling; //get previous subtitle with PageUp
      VK_NEXT:
        Node := FNode.NextSibling; //get next subtitle with PageDown
      VK_TAB:
      begin
        // get next/previous subtitle with Ctrl+Tab/Ctrl+Shift+Tab
        //if (ssCtrl in Shift) then
        //begin
        //  if (ssShift in Shift) then
        //    Node := FNode.PrevSibling else
        //    Node := FNode.NextSibling;
        //end else
        //get next/previous column with Tab/Shift+Tab
        repeat
          if (ssShift in Shift) then
            Column := GetTreePrevColumn(FTree, Column, True) else
            Column := GetTreeNextColumn(FTree, Column, True);
        until (Column <> 0); //skip Column #0 (Num)
      end;
    end;
    Key := 0;
    
    if (Assigned(Node) and (Node <> FNode)) or (Column <> FColumn) then
    begin
      //finish the current edit
      FTree.EndEditNode;
      FTree.SetFocus;
      //start the new edit
      //FTree.FocusedNode := Node; //Important - do NOT change the FocusedNode!
      FTree.Selected[FNode] := False;
      FTree.Selected[Node] := True;
      FTree.EditNode(Node, Column);
    end;
  end else
  if (Key = VK_F2) and FOkayToEndWithF2 then
  begin
    Key := 0;
    FTree.EndEditNode;
    FTree.SetFocus;
  end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TTreeEditLink.EditKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    #13: //ENTER - Finish editing
    begin
      Key := #0; //IMPORTANT!
      //(FEdit as TEdit).SelText := '|';
      if FColumn in [1,2,5,6] then
        (FEdit as TTimeMaskEdit).Time := StringToTime((FEdit as TTimeMaskEdit).Text); //set Time from Text manually, because we just set Key to #0
      FTree.EndEditNode;
      FTree.SetFocus;
    end;
    #27: //ESCAPE - Cancel editing
    begin
      Key := #0; //IMPORTANT!
      FTree.CancelEditNode;
      FTree.SetFocus;
    end;
  end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

{procedure TTreeEditLink.EditTimeChangeFromEditOnly(Sender: TObject; NewTime: Cardinal);
//added by adenry: begin
begin
  case FColumn of
    1:  if NewTime <> GetStartTime(FNode) then
        begin
          SetStartTime(FNode, NewTime);
          frmMain.AutoRecheckNodeErrorsAndRepaint(FNode, TimeErrors);
        end;
    2:  if NewTime <> GetFinalTime(FNode) then
        begin
          SetFinalTime(FNode, NewTime);
          frmMain.AutoRecheckNodeErrorsAndRepaint(FNode, TimeErrors);
          if Assigned(FNode.NextSibling) then
            frmMain.AutoRecheckNodeErrorsAndRepaint(FNode.NextSibling, TimeErrors);
        end;
  end;
end;}
//added by adenry: end

//removed by adenry: begin
{var Data: PSubtitleItem;
begin
  Data := FTree.GetNodeData(FNode);
  case FColumn of
    1: Data.InitialTime := NewTime;
    2: Data.FinalTime := NewTime;
  end;
end;}
//removed by adenry: end

// -----------------------------------------------------------------------------

function TTreeEditLink.BeginEdit: Boolean;
begin
  Result := True;
  FEdit.Show;
  FEdit.SetFocus;
  // Set a window procedure hook (aka subclassing) to get notified about important messages.
  FOldEditProc     := FEdit.WindowProc;
  FEdit.WindowProc := EditWindowProc;
end;

// -----------------------------------------------------------------------------

function TTreeEditLink.CancelEdit: Boolean;
begin
  Result := True;
  // Restore the edit's window proc.
  FEdit.WindowProc := FOldEditProc;
  FEdit.Hide;
end;

// -----------------------------------------------------------------------------

function TTreeEditLink.EndEdit: Boolean;
var
  Data: PSubtitleItem;
  S: WideString;
  P: TPoint;
  Dummy: Integer;
begin
  // Check if the place the user clicks on
  GetCursorPos(P);
  P := FTree.ScreenToClient(P);
  //Result := FTree.GetNodeAt(P.X, P.Y, True, Dummy) <> FNode; //removed by adenry
  Result := True; //added by adenry

  if Result then
  begin
    Data := FTree.GetNodeData(FNode);
    if FEdit.Visible then
    case FColumn of
      1: frmMain.ChangeShowTime(FNode, (FEdit as TTimeMaskEdit).Time); //added by adenry
      2: frmMain.ChangeHideTime(FNode, (FEdit as TTimeMaskEdit).Time); //added by adenry
      3:
        begin
          S := (FEdit as TEdit).Text;
          if S <> Data.Text then
          begin
            DetectChangesForUndo(Data.Text, ReplaceString(S, '|', #13#10), True);
            SetText(FNode, ReplaceString(S, '|', #13#10)); //modified by adenry. was: //Data.Text := ReplaceString(S, '|', #13#10);
            FTree.InvalidateNode(FNode);
            //frmMain.OrgModified := True; //removed by adenry
            //frmMain.lblText.Caption := Format(TextOrTransLength, [LabelText, GetLengthForEachLine(Data.Text)]); //removed by adenry - unnecessary
            frmMain.RefreshTimes; //added by adenry - to refresh the contet of mmoSubtitleText when ENTER is pressed
            frmMain.MarkLongLinesInLabel(frmMain.lblText); //added by adenry
          end;
        end;
      4:
        begin
          S := (FEdit as TEdit).Text;
          if S <> Data.Translation then
          begin
            DetectChangesForUndo(Data.Translation, ReplaceString(S, '|', #13#10), False); //True replaced with False by adenry - bug fix
            SetTranslation(FNode, ReplaceString(S, '|', #13#10)); //modified by adenry. was: //Data.Translation := ReplaceString(S, '|', #13#10);
            FTree.InvalidateNode(FNode);
            frmMain.TransModified := True;
            //frmMain.lblTranslation.Caption := Format(TextOrTransLength, [LabelTranslation, GetLengthForEachLine(Data.Translation)]); //removed by adenry - unnecessary
            frmMain.RefreshTimes; //added by adenry - to refresh the contet of mmoTranslation when ENTER is pressed
            frmMain.MarkLongLinesInLabel(frmMain.lblTranslation); //added by adenry
          end;
        end;
      5: frmMain.tmeDurationTimeChangeFromEditOnly(frmMain.tmePause, (FEdit as TTimeMaskEdit).Time); //added by adenry
      6: frmMain.tmePauseTimeChangeFromEditOnly(frmMain.tmePause, (FEdit as TTimeMaskEdit).Time); //added by adenry
    end; 
    //FEdit.Hide;
    frmMain.AutoRecheckNodeErrors(FNode);//added by adenry
    FTree.Refresh;
    //FTree.RepaintNode(FNode); //removed by adenry
  end;

  //added by adenry:
  // Restore the edit's window proc, if the user clicked on the same node
  if FTree.GetNodeAt(P.X, P.Y, True, Dummy) = FNode then
  begin
    FEdit.WindowProc := FOldEditProc;
    FEdit.Hide;
  end;
end;

// -----------------------------------------------------------------------------

function TTreeEditLink.GetBounds: TRect;
begin
  Result := FEdit.BoundsRect;
end;

// -----------------------------------------------------------------------------

function TTreeEditLink.PrepareEdit(Tree: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex): Boolean;
var
  Data: PSubtitleItem;
begin
  Result  := True;
  FTree   := Tree as TVirtualStringTree;
  FNode   := Node;
  FColumn := Column;
  FOkayToEndWithF2 := False; //added by adenry

  // determine what edit type actually is needed
  FEdit.Free;
  FEdit := nil;
  Data := Tree.GetNodeData(FNode);

  case Column of
    1: //Show
      begin
        FEdit := TTimeMaskEdit.Create(nil);
        with FEdit as TTimeMaskEdit do
        begin
          Visible     := False;
          Parent      := Tree;
          //BorderStyle := bsNone; //removed by adenry
          Ctl3D       := False; //added by adenry
          Alignment   := FTree.Header.Columns[1].Alignment; //added by adenry
          Time        := Data.InitialTime;
          OnTimeChangeFromEditOnly := frmMain.tmeShowTimeChangeFromEditOnly; //modified by adenry
          SelStart    := 10; // Milliseconds get focus by default
          OnKeyPress  := EditKeyPress; //added by adenry
          OnKeyUp     := EditKeyUp; //added by adenry
          OnKeyDown   := EditKeyDown; //added by adenry
          TimeStep    := frmMain.tmeShow.TimeStep; //added by adenry
          FramesStep  := frmMain.tmeShow.FramesStep; //added by adenry
          Constraints.MinHeight := FTree.NodeHeight[FNode]; //added by adenry //makes the box height as high as the Tree row
          OnMouseWheelUp  := frmMain.tmeShowMouseWheelUp; //added by adenry
          OnMouseWheelDown:= frmMain.tmeShowMouseWheelDown; //added by adenry
        end;
      end;
    2: //Hide
      begin
        FEdit := TTimeMaskEdit.Create(nil);
        with FEdit as TTimeMaskEdit do
        begin
          Visible     := False;
          Parent      := Tree;
          //BorderStyle := bsNone; //removed by adenry
          Ctl3D       := False; //added by adenry
          Alignment   := FTree.Header.Columns[2].Alignment; //added by adenry
          Constraints.MinHeight   := FTree.NodeHeight[FNode]; //added by adenry
          Time        := Data.FinalTime;
          OnTimeChangeFromEditOnly := frmMain.tmeHideTimeChangeFromEditOnly; //modified by adenry
          SelStart    := 10; // Milliseconds get focus by default
          OnKeyPress  := EditKeyPress; //added by adenry
          OnKeyUp     := EditKeyUp; //added by adenry
          OnKeyDown   := EditKeyDown; //added by adenry
          TimeStep    := frmMain.tmeHide.TimeStep; //added by adenry
          FramesStep  := frmMain.tmeHide.FramesStep; //added by adenry
          Constraints.MinHeight := FTree.NodeHeight[FNode]; //added by adenry //makes the box height as high as the Tree row
          OnMouseWheelUp  := frmMain.tmeHideMouseWheelUp; //added by adenry
          OnMouseWheelDown:= frmMain.tmeHideMouseWheelDown; //added by adenry
        end;
      end;
    3: //Text
      begin
        FEdit := TEdit.Create(nil);
        with FEdit as TEdit do
        begin
          Visible      := False;
          Parent       := Tree;
          Ctl3D        := False;
          Text         := ReplaceString(Data.Text, #13#10, '|');
          Alignment    := FTree.Header.Columns[3].Alignment; //added by adenry
          OnKeyPress   := EditKeyPress; //added by adenry
          OnKeyUp     := EditKeyUp; //added by adenry
          OnKeyDown   := EditKeyDown;
          Font.Charset := frmMain.OrgCharset;
        end;
      end;
    4: //Translation
      begin
        FEdit := TEdit.Create(nil);
        with FEdit as TEdit do
        begin
          Visible      := False;
          Parent       := Tree;
          Ctl3D        := False;
          Text         := ReplaceString(Data.Translation, #13#10, '|');
          Alignment    := FTree.Header.Columns[4].Alignment; //added by adenry
          OnKeyPress   := EditKeyPress; //added by adenry
          OnKeyUp     := EditKeyUp; //added by adenry
          OnKeyDown   := EditKeyDown;
          Font.Charset := frmMain.TransCharset;
        end;
      end;
    //added by adenry: begin
    5: //Duration
      begin
        FEdit := TTimeMaskEdit.Create(nil);
        with FEdit as TTimeMaskEdit do
        begin
          Visible     := False;
          Parent      := Tree;
          Ctl3D       := False;
          Alignment   := FTree.Header.Columns[5].Alignment;
          Time        := Data.FinalTime - Data.InitialTime;
          OnTimeChangeFromEditOnly := frmMain.tmeDurationTimeChangeFromEditOnly;
          SelStart    := 10; // Milliseconds get focus by default
          OnKeyPress  := EditKeyPress;
          OnKeyUp     := EditKeyUp;
          OnKeyDown   := EditKeyDown;
          TimeStep    := frmMain.tmeDuration.TimeStep;
          FramesStep  := frmMain.tmeDuration.FramesStep;
          Constraints.MinHeight := FTree.NodeHeight[FNode]; //makes the box height as high as the Tree row
          OnMouseWheelUp  := frmMain.tmeDurationMouseWheelUp;
          OnMouseWheelDown:= frmMain.tmeDurationMouseWheelDown;
        end;
      end;
    6: //Pause
      if FNode <> FTree.GetFirst then
      begin
        FEdit := TTimeMaskEdit.Create(nil);
        with FEdit as TTimeMaskEdit do
        begin
          Visible     := False;
          Parent      := Tree;
          Ctl3D       := False;
          Alignment   := FTree.Header.Columns[6].Alignment;
          Time        := GetPause(FNode);
          OnTimeChangeFromEditOnly := frmMain.tmePauseTimeChangeFromEditOnly;
          SelStart    := 10; // Milliseconds get focus by default
          OnKeyPress  := EditKeyPress;
          OnKeyUp     := EditKeyUp;
          OnKeyDown   := EditKeyDown;
          TimeStep    := frmMain.tmePause.TimeStep;
          FramesStep  := frmMain.tmePause.FramesStep;
          Constraints.MinHeight := FTree.NodeHeight[FNode]; //makes the box height as high as the Tree row
          OnMouseWheelUp  := frmMain.tmePauseMouseWheelUp;
          OnMouseWheelDown:= frmMain.tmePauseMouseWheelDown;
        end;
      end else
        Result := False;
    //added by adenry: end      
  else
    Result := False;
  end;
end;

// -----------------------------------------------------------------------------

procedure TTreeEditLink.ProcessMessage(var Message: TMessage);
begin
  FEdit.WindowProc(Message);
end;

// -----------------------------------------------------------------------------

procedure TTreeEditLink.SetBounds(R: TRect);
//var Dummy: Integer; //removed by adenry
begin
  // Since we don't want to activate grid extensions in the tree (this would influence how the selection is drawn)
  // we have to set the edit's width explicitly to the width of the column.
  FTree.Header.Columns.GetColumnBounds(FColumn, R.Left, R.Right); //Dummy replaced with R.Left by adenry
  FEdit.BoundsRect := R;
end;

// -----------------------------------------------------------------------------

end.
