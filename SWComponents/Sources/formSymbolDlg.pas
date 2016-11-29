// This file is part of SWComponents, the component package for Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle Workshop's copyright information
// File Description: Insert symbol form for the SymbolDlg component

Unit formSymbolDlg;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Grids, ExtCtrls;

Type
  TInsertSymbolEvent = Procedure( Sender: TObject; Font: TFont; Chr: Char ) Of Object;
  TFormActivateEvent = Procedure( Sender: TObject) Of Object;
  TFormDeactivateEvent = Procedure( Sender: TObject) Of Object;
  TFormCreateEvent = Procedure( Sender: TObject) Of Object;
  TFormDestroyEvent = Procedure( Sender: TObject) Of Object;

  TfrmSymbolDlg = Class( TForm )
    PageControl: TPageControl;
    Tab_Symbols: TTabSheet;
    DrawGrid: TDrawGrid;
    lbl_Font: TLabel;
    btn_Insert: TButton;
    btn_Cancel: TButton;
    tmrDoubleClick: TTimer;
    Panel: TPanel;

    Procedure DrawGridDrawCell( Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState );
    Procedure DrawGridSelectCell( Sender: TObject; ACol, ARow: Integer; Var CanSelect: Boolean );
    Procedure DrawGridKeyUp( Sender: TObject; Var Key: Word; Shift: TShiftState );
    Procedure btn_InsertClick( Sender: TObject );
    Procedure DoubleClick( Sender: TObject );
    Procedure FormCreate( Sender: TObject );
    procedure tmrDoubleClickTimer(Sender: TObject);
    procedure DrawGridMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PanelMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btn_CancelClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);

  Private

    FOnInsertSymbol: TInsertSymbolEvent;
    FOnFormActivate: TFormActivateEvent;
    FOnFormDeactivate: TFormDeactivateEvent;
    FOnFormCreate: TFormCreateEvent;
    FOnFormDestroy: TFormDestroyEvent;
    FCanZoom: Boolean;

    Procedure DoInsert( Font: TFont; Chr: Char );

  Public

  Published

    Property CanZoom: Boolean Read FCanZoom Write FCanZoom;
    Property OnInsertSymbol: TInsertSymbolEvent Read FOnInsertSymbol Write FOnInsertSymbol;
    Property OnFormActivate: TFormActivateEvent Read FOnFormActivate Write FOnFormActivate;
    Property OnFormDeactivate: TFormDeactivateEvent Read FOnFormDeactivate Write FOnFormDeactivate;
    Property OnFormCreate: TFormCreateEvent Read FOnFormCreate Write FOnFormCreate;
    Property OnFormDestroy: TFormDestroyEvent Read FOnFormDestroy Write FOnFormDestroy;

  End;

// -----------------------------------------------------------------------------

Implementation

{$R *.DFM}

// -----------------------------------------------------------------------------

Procedure TfrmSymbolDlg.DrawGridDrawCell( Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState );
Var
  Text: String;
  Size: TSize;
Begin
  Text := Chr( ( ACol + ( 28 * ARow ) ) + 32 );
  Size := DrawGrid.Canvas.TextExtent( Text );
  DrawGrid.Canvas.TextRect( Rect, ( ( ( Rect.Right - Rect.Left ) Div 2 ) - ( Size.CX Div 2 ) ) + Rect.Left, Rect.Top + 2, Text );
End;

// -----------------------------------------------------------------------------

Procedure TfrmSymbolDlg.DrawGridSelectCell( Sender: TObject; ACol, ARow: Integer; Var CanSelect: Boolean );
Begin
  Panel.Visible := CanZoom;

  Panel.Font.Name := DrawGrid.Font.Name;

  Panel.Left := PageControl.Left + Tab_Symbols.Left + DrawGrid.Left + ACol * (DrawGrid.DefaultColWidth + DrawGrid.GridLineWidth) - ((Panel.Width - DrawGrid.DefaultColWidth - DrawGrid.GridLineWidth) div 2);
  //If Panel.Left + Panel.Width > DrawGrid.Left + DrawGrid.Width Then
    //Panel.Left := DrawGrid.Left + DrawGrid.Width - Panel.Width;

  Panel.Top := PageControl.Top + Tab_Symbols.Top + DrawGrid.Top + ARow * (DrawGrid.DefaultRowHeight + DrawGrid.GridLineWidth) - ((Panel.Height - DrawGrid.DefaultRowHeight - DrawGrid.GridLineWidth) div 2);
  //If Panel.Top + Panel.Height > DrawGrid.Top + DrawGrid.Height Then
    //Panel.Top := DrawGrid.Top + DrawGrid.Height - Panel.Height;

  Panel.Caption := Chr( ( ACol + ( 28 * ARow ) ) + 32 );
End;

// -----------------------------------------------------------------------------

Procedure TfrmSymbolDlg.DrawGridKeyUp( Sender: TObject; Var Key: Word; Shift: TShiftState );
Begin
  If Key = VK_ESCAPE Then Panel.Visible := False;
End;

// -----------------------------------------------------------------------------

Procedure TfrmSymbolDlg.DoInsert( Font: TFont; Chr: Char );
Begin
  If Assigned( FOnInsertSymbol ) Then
    FOnInsertSymbol( Self, DrawGrid.Font, Chr );
End;

// -----------------------------------------------------------------------------

Procedure TfrmSymbolDlg.btn_InsertClick( Sender: TObject );
Begin
  DoInsert( DrawGrid.Font, Chr( ( DrawGrid.Col + ( 28 * DrawGrid.Row ) ) + 32 ) );
End;

// -----------------------------------------------------------------------------

Procedure TfrmSymbolDlg.DoubleClick( Sender: TObject );
Begin
  btn_InsertClick( Sender );
End;

// -----------------------------------------------------------------------------

Procedure TfrmSymbolDlg.FormCreate( Sender: TObject );
Begin
  DrawGrid.DefaultRowHeight := (DrawGrid.ClientHeight) div DrawGrid.RowCount;
  if (DrawGrid.DefaultRowHeight+DrawGrid.GridLineWidth)*DrawGrid.RowCount > DrawGrid.Height then
    DrawGrid.DefaultRowHeight := DrawGrid.DefaultRowHeight - 1;
  DrawGrid.DefaultColWidth  := (DrawGrid.ClientWidth) div DrawGrid.ColCount;
  if (DrawGrid.DefaultColWidth+DrawGrid.GridLineWidth)*DrawGrid.ColCount > DrawGrid.Width then
    DrawGrid.DefaultColWidth := DrawGrid.DefaultColWidth - 1;

  FCanZoom := True;
  tmrDoubleClick.Interval := GetDoubleClickTime;
  //Panel.Font := DrawGrid.Font;
  //Panel.Font.Size := 24;

  if Assigned(FOnFormCreate) then
    FOnFormCreate(Self);
End;

// -----------------------------------------------------------------------------

procedure TfrmSymbolDlg.tmrDoubleClickTimer(Sender: TObject);
begin
  tmrDoubleClick.Enabled := False;
end;

// -----------------------------------------------------------------------------

procedure TfrmSymbolDlg.DrawGridMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if tmrDoubleClick.Enabled then
    btn_InsertClick(Sender) else
    tmrDoubleClick.Enabled := True;
end;

// -----------------------------------------------------------------------------

procedure TfrmSymbolDlg.PanelMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Panel.Hide;
  if tmrDoubleClick.Enabled then
    btn_InsertClick(Sender) else
    tmrDoubleClick.Enabled := True;
end;

// -----------------------------------------------------------------------------

procedure TfrmSymbolDlg.btn_CancelClick(Sender: TObject);
begin
  if not(fsModal in FormState) then
    Close;
end;

// -----------------------------------------------------------------------------

procedure TfrmSymbolDlg.FormActivate(Sender: TObject);
begin
  if Assigned(FOnFormActivate) then
    FOnFormActivate(Self);
end;

// -----------------------------------------------------------------------------

procedure TfrmSymbolDlg.FormDeactivate(Sender: TObject);
begin
  if Assigned(FOnFormDeactivate) then
    FOnFormDeactivate(Self);
end;

// -----------------------------------------------------------------------------

procedure TfrmSymbolDlg.FormDestroy(Sender: TObject);
begin
  if Assigned(FOnFormDestroy) then
    FOnFormDestroy(Self);
end;

// -----------------------------------------------------------------------------

End.

