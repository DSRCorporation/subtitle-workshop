// This file is part of SWComponents, the component package for Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle Workshop's copyright information
// File Description: SymbolDlg component - Insert symbols through a form

Unit SymbolDlg;

Interface

Uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  formSymbolDlg,
  Forms; //temp

Type

  TSymbolDlg = Class( TComponent )
  Private

    frm_Symbols: TfrmSymbolDlg;
    FFormModal: Boolean;

    Function GetPanelColor: TColor;
    Procedure SetPanelColor( AValue: TColor );
    Function GetPanelFontColor: TColor;
    Procedure SetPanelFontColor( AValue: TColor );
    Function GetFont: TFont;
    Procedure SetFont( AValue: TFont );
    Function GetZoom: Boolean;
    Procedure SetZoom( AValue: Boolean );
    Function GetCaption: String;
    Procedure SetCaption( AValue: String );
    Function GetFontCaption: String;
    Procedure SetFontCaption( AValue: String );
    Function GetInsertCaption: String;
    Procedure SetInsertCaption( AValue: String );
    Function GetCancelCaption: String;
    Procedure SetCancelCaption( AValue: String );
    Function GetSymbolsCaption: String;
    Procedure SetSymbolsCaption( AValue: String );
    Function GetOnInsertSymbol: TInsertSymbolEvent;
    Procedure SetOnInsertSymbol( AValue: TInsertSymbolEvent );
    Function GetOnFormActivate: TFormActivateEvent;
    Procedure SetOnFormActivate( AValue: TFormActivateEvent );
    Function GetOnFormDeactivate: TFormDeactivateEvent;
    Procedure SetOnFormDeactivate( AValue: TFormDeactivateEvent );
    Function GetOnFormCreate: TFormCreateEvent;
    Procedure SetOnFormCreate( AValue: TFormCreateEvent );
    Function GetOnFormDestroy: TFormDestroyEvent;
    Procedure SetOnFormDestroy( AValue: TFormDestroyEvent );

  Protected

  Public

    Constructor Create( AOwner: TComponent ); Override;
    Destructor Destroy; Override;

    Procedure Execute;

    Procedure SetFocus;

  Published

    Property Form: TfrmSymbolDlg Read frm_Symbols;
    Property Zoom: Boolean Read GetZoom Write SetZoom;
    Property PanelColor: TColor Read GetPanelColor Write SetPanelColor;
    Property PanelFontColor: TColor Read GetPanelFontColor Write SetPanelFontColor;
    Property Font: TFont Read GetFont Write SetFont;
    Property Caption: String Read GetCaption Write SetCaption;
    Property btnInsert: String Read GetInsertCaption Write SetInsertCaption;
    Property btnCancel: String Read GetCancelCaption Write SetCancelCaption;
    Property lblFont: String Read GetFontCaption Write SetFontCaption;
    Property tabSymbols: String Read GetSymbolsCaption Write SetSymbolsCaption;
    Property Modal: Boolean Read FFormModal Write FFormModal;
    Property OnInsertSymbol: TInsertSymbolEvent Read GetOnInsertSymbol Write SetOnInsertSymbol;
    Property OnFormActivate: TFormActivateEvent Read GetOnFormActivate Write SetOnFormActivate;
    Property OnFormDeactivate: TFormDeactivateEvent Read GetOnFormDeactivate Write SetOnFormDeactivate;
    Property OnFormCreate: TFormCreateEvent Read GetOnFormCreate Write SetOnFormCreate;
    Property OnFormDestroy: TFormDestroyEvent Read GetOnFormDestroy Write SetOnFormDestroy;

  End;

procedure Register;

// -----------------------------------------------------------------------------

Implementation

// -----------------------------------------------------------------------------

{TSymbolDlg}

Constructor TSymbolDlg.Create( AOwner: TComponent );
Begin
  Inherited Create( AOwner );

  FFormModal := False;

  frm_Symbols := TfrmSymbolDlg.Create(Nil);
End;

Destructor TSymbolDlg.Destroy;
Begin
  frm_Symbols.Free;
  Inherited Destroy;
End;

// -----------------------------------------------------------------------------

Procedure TSymbolDlg.Execute;
Begin
  if FFormModal then
    frm_Symbols.ShowModal else
    begin
      frm_Symbols.Show;
      SetWindowPos(frm_Symbols.Handle, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE + SWP_NOSIZE);
    end;
End;

// -----------------------------------------------------------------------------

Procedure TSymbolDlg.SetFocus;
Begin
  frm_Symbols.SetFocus;
End;

// -----------------------------------------------------------------------------

Function TSymbolDlg.GetOnInsertSymbol: TInsertSymbolEvent;
Begin
  Result := frm_Symbols.OnInsertSymbol;
End;

Procedure TSymbolDlg.SetOnInsertSymbol( AValue: TInsertSymbolEvent );
Begin
  frm_Symbols.OnInsertSymbol := AValue;
End;

// -----------------------------------------------------------------------------

Function TSymbolDlg.GetOnFormActivate: TFormActivateEvent;
Begin
  Result := frm_Symbols.OnFormActivate;
End;

Procedure TSymbolDlg.SetOnFormActivate( AValue: TFormActivateEvent );
Begin
  frm_Symbols.OnFormActivate := AValue;
End;

// -----------------------------------------------------------------------------

Function TSymbolDlg.GetOnFormDeactivate: TFormDeactivateEvent;
Begin
  Result := frm_Symbols.OnFormDeactivate;
End;

Procedure TSymbolDlg.SetOnFormDeactivate( AValue: TFormDeactivateEvent );
Begin
  frm_Symbols.OnFormDeactivate := AValue;
End;

// -----------------------------------------------------------------------------

Function TSymbolDlg.GetOnFormCreate: TFormCreateEvent;
Begin
  Result := frm_Symbols.OnFormCreate;
End;

Procedure TSymbolDlg.SetOnFormCreate( AValue: TFormCreateEvent );
Begin
  frm_Symbols.OnFormCreate := AValue;
End;

// -----------------------------------------------------------------------------

Function TSymbolDlg.GetOnFormDestroy: TFormDestroyEvent;
Begin
  Result := frm_Symbols.OnFormDestroy;
End;

Procedure TSymbolDlg.SetOnFormDestroy( AValue: TFormDestroyEvent );
Begin
  frm_Symbols.OnFormDestroy := AValue;
End;

// -----------------------------------------------------------------------------

Function TSymbolDlg.GetCaption: String;
Begin
  Result := frm_Symbols.Caption;
End;

Procedure TSymbolDlg.SetCaption( AValue: String );
Begin
  frm_Symbols.Caption := AValue;
End;

// -----------------------------------------------------------------------------

Function TSymbolDlg.GetInsertCaption: String;
Begin
  Result := frm_Symbols.btn_Insert.Caption;
End;

Procedure TSymbolDlg.SetInsertCaption( AValue: String );
Begin
  frm_Symbols.btn_Insert.Caption := AValue;
End;

// -----------------------------------------------------------------------------

Function TSymbolDlg.GetCancelCaption: String;
Begin
  Result := frm_Symbols.btn_Cancel.Caption;
End;

Procedure TSymbolDlg.SetCancelCaption( AValue: String );
Begin
  frm_Symbols.btn_Cancel.Caption := AValue;
End;

// -----------------------------------------------------------------------------

Function TSymbolDlg.GetSymbolsCaption: String;
begin
  Result := frm_Symbols.Tab_Symbols.Caption;
end;

Procedure TSymbolDlg.SetSymbolsCaption( AValue: String );
begin
  frm_Symbols.Tab_Symbols.Caption := AValue;
end;

// -----------------------------------------------------------------------------

Function TSymbolDlg.GetFontCaption: String;
Begin
  Result := frm_Symbols.lbl_Font.Caption;
End;

Procedure TSymbolDlg.SetFontCaption( AValue: String );
Begin
  frm_Symbols.lbl_Font.Caption := AValue;
End;

// -----------------------------------------------------------------------------

Function TSymbolDlg.GetFont: TFont;
Begin
  Result := frm_Symbols.DrawGrid.Font;
End;

Procedure TSymbolDlg.SetFont( AValue: TFont );
Begin
  frm_Symbols.DrawGrid.Font.Assign( AValue );
  frm_Symbols.Panel.Font.Assign(AValue);
  frm_Symbols.Panel.Font.Size := 24;
End;

// -----------------------------------------------------------------------------

Function TSymbolDlg.GetPanelFontColor: TColor;
Begin
  Result := frm_Symbols.Panel.Font.Color;
End;

Procedure TSymbolDlg.SetPanelFontColor( AValue: TColor );
Begin
  frm_Symbols.Panel.Font.Color := AValue;
End;

// -----------------------------------------------------------------------------

Function TSymbolDlg.GetPanelColor: TColor;
Begin
  Result := frm_Symbols.Panel.Color;
End;

Procedure TSymbolDlg.SetPanelColor( AValue: TColor );
Begin
  frm_Symbols.Panel.Color := AValue;
End;

// -----------------------------------------------------------------------------

Function TSymbolDlg.GetZoom: Boolean;
Begin
  Result := frm_Symbols.CanZoom;
End;

Procedure TSymbolDlg.SetZoom( AValue: Boolean );
Begin
  frm_Symbols.CanZoom := AValue;
End;

// -----------------------------------------------------------------------------

procedure Register;
begin
  RegisterComponents('Subtitle Workshop', [TSymbolDlg]);
end;

// -----------------------------------------------------------------------------

End.

