// This file is part of SWComponents, the component package for Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle Workshop's copyright information
// File Description: MiSubtitulo component - render subtitle

unit MiSubtitulo;

// --------------------------------------------------------------------

interface

uses
  Windows, Messages, Classes, Graphics, Controls, SysUtils, USGraphics,
  Forms, ComCtrls, Math, RichEdit, FastStrings; //added by adenry

const
  //TransparentColor = $FF00FF; //removed by adenry
  HexChars: set of Char = ['A'..'F', 'a'..'f' , '0'..'9']; //added by adenry

type
  TMiSubtitulo = class(TCustomControl)
  private
    { Private declarations }
    FImage             : TBitmap;
    FBorder            : Boolean;
    FShadow            : Boolean;
    FForceTransparency : Boolean;
    FBorderWidth       : Byte;
    FShadowWidth       : Byte;
    FUseTags           : Boolean;
    FText              : String;
    FTextColor         : TColor;
    FBackgroundColor   : TColor;
		FAlignment				 : TAlignment; //added by adenry
    FBorderColor       : TColor; //added by adenry
    FShadowColor       : TColor; //added by adenry
    FAntialiased       : Boolean; //added by adenry
    FRenderRichText    : Boolean; //added by adenry
    FRichEdit          : TRichEdit; //added by adenry
    FTransparentColor  : TColor; //added by adenry
    FSubtitleNum       : Cardinal; //added by adenry
    procedure DrawSubtitleText;
    procedure DrawRTF(DestDCHandle: HDC; const R: TRect; RichEdit: TRichEdit; PixelsPerInch: Integer); //added by adenry
    procedure HTMLtoRTF(re: TRichEdit; s: String); //added by adenry
    procedure SetRichEditWidth(re : TRichEdit); //added by adenry
    procedure SetRichEditHeight(re: TRichEdit); //added by adenry
    procedure SetText(Text: String);
    procedure SetShadow(Value: Boolean);
    procedure SetBorder(Value: Boolean);
    procedure SetBorderWidth(Value: Byte);
    procedure SetShadowWidth(Value: Byte);
    procedure SetUseTags(Value: Boolean);
    procedure SetTextColor(Value: TColor);
    procedure SetBackgroundColor(Value: TColor);
    procedure SetForceTransparency(Value: Boolean);
    procedure SetAlignment(Value: TAlignment); //added by adenry
    procedure SetBorderColor(Value: TColor); //added by adenry
    procedure SetShadowColor(Value: TColor); //added by adenry
    procedure SetAntialiased(Value: Boolean); //added by adenry
    procedure SetRenderRichText(Value: Boolean); //added by adenry
    procedure SetTransparentColor(Value: TColor); //added by adenry
    procedure RefreshRichEditFont; //added by adenry
    procedure SetRichEditText(RichEdit: TRichEdit; Text: String); //added by adenry
  protected
    { Protected declarations }
    procedure Paint; override;
    procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;
  public
    { Public declarations }
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
  published
    { Published declarations }
    property Text            : String  read FText            write SetText;
    property Shadow          : Boolean read FShadow          write SetShadow;
    property Border          : Boolean read FBorder          write SetBorder;
    property UsarTags        : Boolean read FUseTags         write SetUseTags;
    property TextColor       : TColor  read FTextColor       write SetTextColor;
    property BackgroundColor : TColor  read FBackgroundColor write SetBackgroundColor;
    property BorderWidth     : Byte    read FBorderWidth     write SetBorderWidth;
    property ShadowWidth     : Byte    read FShadowWidth     write SetShadowWidth;
    property ForceTransparency: Boolean read FForceTransparency write SetForceTransparency;
		property Alignment			 : TAlignment read FAlignment		 write SetAlignment; //added by adenry
    property BorderColor     : TColor  read FBorderColor     write SetBorderColor; //added by adenry
    property ShadowColor     : TColor  read FShadowColor     write SetShadowColor; //added by adenry
    property Antialiased     : Boolean read FAntialiased     write SetAntialiased; //added by adenry
    property RenderRichText  : Boolean     read FRenderRichText    write SetRenderRichText; //added by adenry
    property TransparentColor: TColor      read FTransparentColor  write SetTransparentColor; //added by adenry
    property SubtitleNum     : Cardinal read FSubtitleNum     write FSubtitleNum; //added by adenry
    property Anchors;
    property Enabled;
    property Font;
    property Visible;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnClick;
    property OnDblClick; //added by adenry
    property OnDragDrop; //added by adenry
    property OnDragOver; //added by adenry
    property OnStartDrag; //added by adenry
    property OnEndDrag; //added by adenry
    property PopupMenu; //added by adenry
  end;

procedure Register;

// -----------------------------------------------------------------------------

implementation

// -----------------------------------------------------------------------------

function RemoveSWTags(Text: String; Bold, Italic, Underline, Color: Boolean): String;
var
  TagPos, Tag2Pos, Tag3Pos, SearchStart: Integer; //added by adenry
begin
  //added by adenry: begin
	if Bold = True then 
	begin
		Text := StringReplace(Text, '<b>', '', [rfReplaceAll, rfIgnoreCase]);
		Text := StringReplace(Text, '</b>', '', [rfReplaceAll, rfIgnoreCase]);
	end;
  if Italic = True then
	begin
		Text := StringReplace(Text, '<i>', '', [rfReplaceAll, rfIgnoreCase]);
		Text := StringReplace(Text, '</i>', '', [rfReplaceAll, rfIgnoreCase]);
	end;
  if Underline = True then
	begin
		Text := StringReplace(Text, '<u>', '', [rfReplaceAll, rfIgnoreCase]);
		Text := StringReplace(Text, '</u>', '', [rfReplaceAll, rfIgnoreCase]);
	end;	
  if Color = True then begin
		Text := StringReplace(Text, '</c>', '', [rfReplaceAll, rfIgnoreCase]);
    {
		Text := StringReplace(Text, '</font>', '', [rfReplaceAll, rfIgnoreCase]);
    }

    TagPos := SmartPos('<c:#', Text, False);
    Tag2Pos := SmartPos('>', Text, True, TagPos+1);
    SearchStart := 1;
  	while (TagPos > 0) and (Tag2Pos > 0) do
    begin
      Tag3Pos := SmartPos('<', Text, True, TagPos+1);
      if (Tag2Pos < Tag3Pos) or (Tag3Pos = 0) then
	  	Delete(Text, TagPos, Tag2Pos-TagPos+1) else
        SearchStart := TagPos+1;
      TagPos := SmartPos('<c:#', Text, False, SearchStart);
      Tag2Pos := SmartPos('>', Text, True, TagPos+1);
    end;

    {
    TagPos := SmartPos('<font', Text, False);
    Tag2Pos := SmartPos('>', Text, True, TagPos+1);
    SearchStart := 1;
    while (TagPos > 0) and (Tag2Pos > 0) do
    begin
      Tag3Pos := SmartPos('<', Text, True, TagPos+1);
      if (Tag2Pos < Tag3Pos) or (Tag3Pos = 0) then
	  	  Delete(Text, TagPos, Tag2Pos-TagPos+1) else
        SearchStart := TagPos+1;
      TagPos := SmartPos('<font', Text, False, SearchStart);
      Tag2Pos := SmartPos('>', Text, True, TagPos+1);
    end;
    }
	end;
	//added by adenry: end
	
	//removed by adenry: begin
	{if Bold      = True then Text := StringReplace(Text, '<b>', '', [rfReplaceAll, rfIgnoreCase]);
  if Italic    = True then Text := StringReplace(Text, '<i>', '', [rfReplaceAll, rfIgnoreCase]);
  if Underline = True then Text := StringReplace(Text, '<u>', '', [rfReplaceAll, rfIgnoreCase]);
	if Color = True then
    while Pos('<c:#', Text) > 0 Do
      Delete(Text, Pos('<c:#', Text), Pos('>', Copy(Text, Pos('<c:#', Text), Length(Text))));}
	//removed by adenry: end
	
  Result := Text;
end;

// -----------------------------------------------------------------------------

constructor TMiSubtitulo.Create(AOwner : TComponent);
begin
  inherited Create(AOwner);

  ControlStyle := ControlStyle + [csOpaque];
  FImage      := TBitmap.Create;

  Width  := 50;
  Height := 50;

  FRenderRichText := False; //added by adenry

  FTextColor       := clWhite;
  FBackgroundColor := clBtnFace;
  FBorderColor     := clBlack;
  FShadowColor     := clBlack;
  FTransparentColor:= $00010101; //added by adenry

  FAlignment   := taCenter; //added by adenry
	FAntialiased := False; //added by adenry

  FBorder      := True;
  FShadow      := True;
  FBorderWidth := 1;
  FShadowWidth := 1;
  FText        := '';
  FSubtitleNum := 0; //added by adenry

  Font.Name    := 'Tahoma';
  Font.Size    := 24;
  Font.Style   := []; //fsBold removed by adenry
  Font.Color   := FTextColor; //added by adenry

  //added by adenry:
  FRichEdit := TRichEdit.CreateParented(HWND(HWND_MESSAGE));
  FRichEdit.Name  := 'FRichEdit';
  FRichEdit.Left  := 0;
  FRichEdit.Top   := 0;
  FRichEdit.Width := 50;
  FRichEdit.Height := 22;
  FRichEdit.Visible := False;
  FRichEdit.Text := '';
  FRichEdit.ParentFont := False;
  FRichEdit.Font := Font;
  FRichEdit.Font.Style := [];
  FRichEdit.WordWrap := False;
  FRichEdit.Alignment := FAlignment;
  FRichEdit.BevelInner := bvNone;
  FRichEdit.BevelKind := bkNone;
  FRichEdit.BevelOuter := bvNone;
  FRichEdit.BorderStyle := bsNone;
  FRichEdit.ReadOnly := True;
end;

// -----------------------------------------------------------------------------

destructor TMiSubtitulo.Destroy;
begin
  FRichEdit.Free; //added by adenry

  FImage.Free;
  FImage := nil;

  inherited Destroy;
end;

// -----------------------------------------------------------------------------

procedure TMiSubtitulo.Paint;
var
  Region: HRGN;
begin
  if (FImage.Width > 0) And (FImage.Height > 0) Then
    BitBlt(Canvas.Handle, 0, 0, FImage.Width, FImage.Height, FImage.Canvas.Handle, 0, 0, SrcCopy);
  if  not (csDesigning in ComponentState) then
  begin
    if (FForceTransparency) then
    begin
      Region := ConvertBitmapToRegion(FImage, FTransparentColor); //TransparentColor replaced with FTransparentColor by adenry
      SetWindowRgn(Handle, Region, True);
    end else
    begin
      Region := CreateRectRGN(0, 0, Width, Height);
      SetWindowRgn(Handle, Region, True);
    end;
  end
end;

// -----------------------------------------------------------------------------

procedure TMiSubtitulo.DrawSubtitleText;
  function GetSubColor(Text: String): Integer;
  const
    HTMLChars: set of Char = ['A'..'F', '0'..'9'];
  var
    i: Integer;
    tagPos: Integer; //added by adenry
  begin
    Result := -1;

    tagPos := SmartPos('<c:#', Text, False); //added by adenry

		if (tagPos > 0) then
    begin
      Text := Copy(Text, tagPos + 4, 7);
      if Copy(Text, 7, 1) = '>' then
      begin
        Delete(Text, 7, 1);
        Text := AnsiUpperCase(Text);

        for i := 0 to Length(Text) do
          if (Text[i] <> '') and (Text[i] in HTMLChars = False) then exit;

        // convert hexadecimal values to RGB
        Result := Integer(StrToInt('$' + Copy(Text, 1, 2))) +
                  Integer(StrToInt('$' + Copy(Text, 3, 2))) shl 8 +
                  Integer(StrToInt('$' + Copy(Text, 5, 2))) shl 16;
      end;
    end;

		//added by adenry: begin
    {
		i:=Pos('<font color=', Text);
		if (i > 0) then
		begin
			Text:=Text+'1234567890'; //to prevent memory access violations
			if Text[i+18]='>' then Text:=Copy(Text,i+12,6) else
			if (Text[i+12]='"') and (Text[i+19]='"') and (Text[i+20]='>') then Text:=Copy(Text,i+13,6) else
			if (Text[i+12]='#') and (Text[i+19]='>') then Text:=Copy(Text,i+13,6) else
			if (Text[i+12]='"') and (Text[i+13]='#') and (Text[i+20]='"') and (Text[i+21]='>') then Text:=Copy(Text,i+14,6);
			begin
				Text := AnsiUpperCase(Text);

				for i := 0 to Length(Text) do
					if (Text[i] <> '') and (Text[i] in HTMLChars = False) then exit;

				// convert hexadecimal values to RGB
				Result := Integer(StrToInt('$' + Copy(Text, 1, 2))) +
									Integer(StrToInt('$' + Copy(Text, 3, 2))) shl 8 +
									Integer(StrToInt('$' + Copy(Text, 5, 2))) shl 16;
			end;
		end;
    }
		//added by adenry: end
  end;

var
  //old render method vars:
  R, RTexto   : TRect;
  //a, b        : Integer; //removed by denry
  L, T        : Integer; //added by adenry
  Color       : Integer;
  TextToPaint : String;
  tmpFont     : TFont;
  alignment   : Cardinal; //added by adenry
  fontSizeDiv2: Integer; //added by adenry
  fontSizeDiv3: Integer; //added by adenry
  lf          : TLogFont; //added by adenry

  //new render method vars:
  ExStyle     : DWord; //added by adenry
  DestDCHandle: HDC; //added by adenry
  AlOffset    : Integer; //added by adenry
  bord        : Byte; //added by adenry
  shad        : Byte; //added by adenry
  padding     : Byte; //added by adenry

BEGIN

If FRenderRichText = False then
//Old render method - can't render full rich text
Begin

  tmpFont := nil;
  Color   := TextColor;
  TextToPaint := FText;

  //added by adenry: begin
  if FAlignment = taLeftJustify then
    alignment := DT_LEFT else
  if FAlignment = taRightJustify then
    alignment := DT_RIGHT else
    alignment :=DT_CENTER;
  //added by adenry: end

  if FUseTags = True then
  begin
    tmpFont := TFont.Create;
    tmpFont.Assign(Font);

    if (Pos('<i>', TextToPaint) > 0) or (Pos('<I>', TextToPaint) > 0) then // '<I>' check added by adenry
      tmpFont.Style := tmpFont.Style + [fsItalic];
    if (Pos('<b>', TextToPaint) > 0) or (Pos('<B>', TextToPaint) > 0) then // '<B>' check added by adenry
      tmpFont.Style := tmpFont.Style + [fsBold];
    if (Pos('<u>', TextToPaint) > 0) or (Pos('<U>', TextToPaint) > 0) then // '<U>' check added by adenry
      tmpFont.Style := tmpFont.Style + [fsUnderline];
    Color := GetSubColor(TextToPaint);
    if Color = -1 then
     Color := TextColor;
      
    TextToPaint := RemoveSWTags(TextToPaint, True, True, True, True);

    FImage.Canvas.Font.Assign(tmpFont);
    //tmpFont.Free;
  end else
  FImage.Canvas.Font.Assign(Font);

  //added by adenry: begin
  //ADD ANTIALIAS TO FONT (TrueType):
	if FAntialiased then
	begin
		GetObject(FImage.Canvas.Font.Handle, SizeOf(TLogFont), @lf);
		lf.lfQuality := ANTIALIASED_QUALITY;
		FImage.Canvas.Font.Handle := CreateFontIndirect(lf);
	end;
  //added by adenry: end

  // CALCULATE RECT
  RTexto := Rect(0, 0, 0, 0);
  DrawText(FImage.Canvas.Handle, PChar(TextToPaint), -1, RTexto, DT_CALCRECT);
  {RTexto := Rect(0, 0, RTexto.Right + 10, RTexto.Bottom + 10);} //removed by adenry
  //added by adenry: begin
  if not FBorder then FBorderWidth := 0;
  if not FShadow then FShadowWidth := 0;
  fontSizeDiv2 := FImage.Canvas.Font.Size div 2;
  fontSizeDiv3 := FImage.Canvas.Font.Size div 3;
  RTexto := Rect(0, 0, RTexto.Right + (FBorderWidth * 2) + FShadowWidth + (2 * fontSizeDiv2), RTexto.Bottom + (FBorderWidth * 2) + FShadowWidth + (2 * fontSizeDiv3));
  //added by adenry: end

  // SET IMAGE
  FImage.Width              := RTexto.Right;
  FImage.Height             := RTexto.Bottom;
  FImage.Canvas.Brush.Style := bsSolid;
  if FForceTransparency = False then
  begin
    FImage.Canvas.Brush.Color := FBackgroundColor;
    FImage.Canvas.Pen.Color   := FBackgroundColor;
  end else
  begin
    FImage.Canvas.Brush.Color := FTransparentColor;
    FImage.Canvas.Pen.Color   := FTransparentColor;
  end;
  FImage.Canvas.Rectangle(0, 0, FImage.Width, FImage.Height);
  FImage.Canvas.Brush.Style := bsClear;

  // DRAW SHADOW
  If FShadow = True Then
  Begin
    //removed by adenry: begin
    {FImage.Canvas.Font.Color := clBlack;          // 1 // 2 to 4
                                                  // 2 // 4 to 6
                                                  // 3 // 6 to 8
    For a := //(FShadowWidth * 2) to (FShadowWidth * 4 - 2) do //2 To 4 Do // 4 to 6
      For b := //(FShadowWidth * 2) to (FShadowWidth * 4 - 2) do //2 To 4 Do // 4 to 6}

    {For a := (2 + FShadowWidth) to (FShadowWidth * 2 + 2) do//(FShadowWidth * 2) to ((FShadowWidth * 2) + 2) do
      For b := (2 + FShadowWidth) to (FShadowWidth * 2 + 2) do//(FShadowWidth * 2) to ((FShadowWidth * 2) + 2) do
      Begin
        R := Rect(RTexto.Left + a + 2, RTexto.Top + b + 1, RTexto.Right - 8 + a, RTexto.Bottom - 8 + a);
        DrawText(FImage.Canvas.Handle, PChar(TextToPaint), -1, R, alignment); //DT_CENTER replaced with alignment by adenry
      end;}
    //removed by adenry: end

    //added by adenry: begin
    FImage.Canvas.Font.Color := FShadowColor;
    For L := FShadowWidth to FShadowWidth + (2 * FBorderWidth) do
      For T := FShadowWidth to FShadowWidth + (2 * FBorderWidth) do
      Begin
        R := Rect(RTexto.Left + L {+ fontSizeDiv2}, RTexto.Top + T + fontSizeDiv3, RTexto.Right - (FBorderWidth * 2) - FShadowWidth + L {- fontSizeDiv2}, RTexto.Bottom - (FBorderWidth * 2) - FShadowWidth + T - fontSizeDiv3 );
        if alignment = DT_LEFT then R.Left := R.Left + fontSizeDiv2 else
        if alignment = DT_RIGHT then R.Right := R.Right - fontSizeDiv2;
        DrawText(FImage.Canvas.Handle, PChar(TextToPaint), -1, R, alignment); //DT_CENTER replaced with alignment by adenry
      end; FImage.Canvas
    //added by adenry: end
  end;

  // DRAW BORDER
  If FBorder = True Then
  Begin
    //removed by adenry: begin
    {FImage.Canvas.Font.Color := clBlack;
    For a := (2 - FBorderWidth) to (2 + FBorderWidth) do
      For b := (2 - FBorderWidth) to (2 + FBorderWidth) do
      Begin
        R := Rect(RTexto.Left + a, RTexto.Top + b, RTexto.Right - 8 + a, RTexto.Bottom - 8 + a);
        DrawText(FImage.Canvas.Handle, PChar(TextToPaint), -1, R, alignment); //DT_CENTER replaced with alignment by adenry
      end;}
    //removed by adenry: end

    //added by adenry: begin
    FImage.Canvas.Font.Color := FBorderColor;
    For L := 0 to (2 * FBorderWidth) do
      For T := 0 to (2 * FBorderWidth) do
      Begin
        R := Rect(RTexto.Left + L {+ fontSizeDiv2}, RTexto.Top + T + fontSizeDiv3, RTexto.Right - (FBorderWidth * 2) - FShadowWidth + L {- fontSizeDiv2}, RTexto.Bottom - (FBorderWidth * 2) - FShadowWidth + T - fontSizeDiv3 );
        if alignment = DT_LEFT then R.Left := R.Left + fontSizeDiv2 else
        if alignment = DT_RIGHT then R.Right := R.Right - fontSizeDiv2;
        DrawText(FImage.Canvas.Handle, PChar(TextToPaint), -1, R, alignment); //DT_CENTER replaced with alignment by adenry
      end;
    //added by adenry: end
  end;

  // DRAW TEXT
  //removed by adenry: begin
  {FImage.Canvas.Font.Color := Color;
  R := Rect(RTexto.Left + 2, RTexto.Top + 2, RTexto.Right - 6, RTexto.Bottom - 6);
  DrawText(FImage.Canvas.Handle, PChar(TextToPaint), -1, R, alignment); //DT_CENTER replaced with alignment by adenry}
  //removed by adenry: end

  //added by adenry: begin
  if FTextColor <> Font.Color then      //added by adenry
    FImage.Canvas.Font.Color := Font.Color else //added by adenry - set MARKING COLOR (for marked subtitle) //subSubtitle.Font.Color here is Font.Color and it stores the color for MARKED subtitles
    FImage.Canvas.Font.Color := Color;
  R := Rect(RTexto.Left + FBorderWidth {+ fontSizeDiv2}, RTexto.Top + FBorderWidth + fontSizeDiv3, RTexto.Right - FBorderWidth - FShadowWidth {- fontSizeDiv2}, RTexto.Bottom - FBorderWidth - FShadowWidth - fontSizeDiv3 );
  if alignment = DT_LEFT then R.Left := R.Left + fontSizeDiv2 else
  if alignment = DT_RIGHT then R.Right := R.Right - fontSizeDiv2;
  DrawText(FImage.Canvas.Handle, PChar(TextToPaint), -1, R, alignment); //DT_CENTER replaced with alignment by adenry

  {FImage.Canvas.Pen.Width := 4;
  FImage.Canvas.Pen.Color := clBlack;
  BeginPath(FImage.Canvas.Handle);
  DrawText(FImage.Canvas.Handle, PChar(TextToPaint), -1, R, alignment); //DT_CENTER replaced with alignment by adenry
  EndPath(FImage.Canvas.Handle);
  FImage.Canvas.Brush.Color := clWhite;
  StrokeAndFillPath(FImage.Canvas.Handle);}

  //added by adenry: end

  // RESIZE
  SetBounds(Left, Top, FImage.Width, FImage.Height);

  if FUseTags then
    tmpFont.Free;

End Else
//New render method - renders full rich text
Begin

  //MAKE PREPARATIONS:
  bord := Integer(FBorder)*FBorderWidth;
  shad := Integer(FShadow)*FShadowWidth;
  padding := Abs(Font.Height) div 16;
  if padding < 1 then padding := 1;
  //set FRichText Height and Width (important: in that order!):
  RefreshRichEditFont;
  SetRichEditHeight(FRichEdit);
  SetRichEditWidth(FRichEdit);
  //set MiSubtitulo Width and Height - the FRichEdit Width and Height + some padding + shadow and border width and height
  Height := FRichEdit.Height + (Abs(Font.Height) div 7) + (bord * 2) + shad;
  Width := FRichEdit.Width + (Abs(Font.Height)) + (bord * 2) + shad;
  FImage.Width := Width;
  FImage.Height := Height;
  //Set background color
  if FForceTransparency = False then
    FImage.Canvas.Brush.Color := FBackgroundColor else
    FImage.Canvas.Brush.Color := FTransparentColor;
  FImage.Canvas.Fillrect(Rect(0, 0, FImage.Width, FImage.Height));
  //Win2k, WinXP
  ExStyle := GetWindowLong(FRichEdit.Handle, GWL_EXSTYLE);
  ExStyle := ExStyle or WS_EX_TRANSPARENT;
  SetWindowLong(FRichEdit.Handle, GWL_EXSTYLE, ExStyle);

  //Alignment offset
  AlOffset := 1;
  if FAlignment = taLeftJustify then
    AlOffset := 1 - bord + (Width - FRichEdit.Width) div 2 else
  if FAlignment = taRightJustify then
    AlOffset := -(Width - FRichEdit.Width) div 2;

  //DRAW SHADOW:
  if FShadow then
  begin
    FRichEdit.SelectAll;
    FRichEdit.SelAttributes.Color := FShadowColor;
    DestDCHandle := FImage.Canvas.Handle;
    SetBkMode(DestDCHandle, TRANSPARENT); //Win9x
    for L := 0 to (2 * bord) do
      for T := 0 to (2 * bord) do
        DrawRTF(DestDCHandle, Rect(padding+FShadowWidth+L+AlOffset-bord, FShadowWidth+T, FImage.Width-padding+FShadowWidth+L+AlOffset-bord, FImage.Height+FShadowWidth+T), FRichEdit, Font.PixelsPerInch);
  end;

  //DRAW BORDER:
  if FBorder then
  begin
    FRichEdit.SelectAll;
    FRichEdit.SelAttributes.Color := FBorderColor;
    DestDCHandle := FImage.Canvas.Handle;
    SetBkMode(DestDCHandle, TRANSPARENT); //Win9x
    for L := 0 to (2 * bord) do
      for T := 0 to (2 * bord) do
        DrawRTF(DestDCHandle, Rect(padding+L+AlOffset-bord, T, FImage.Width-padding+L+AlOffset-bord, FImage.Height+T), FRichEdit, Font.PixelsPerInch);
  end;

  //DRAW TEXT:
  FRichEdit.SelectAll;
  if FTextColor <> Font.Color then
  begin
    //set MARKING COLOR (for marked subtitle) //subSubtitle.Font.Color here is Font.Color and it stores the color for MARKED subtitles
    FRichEdit.SelAttributes.Color := Font.Color;
    FRichEdit.Font.Color := Font.Color;
  end else
    FRichEdit.SelAttributes.Color := FTextColor;
  HTMLtoRTF(FRichEdit, FText); //Set text again, because COLOR tags were lost

  DestDCHandle := FImage.Canvas.Handle;
  SetBkMode(DestDCHandle, TRANSPARENT); //Win9x

  DrawRTF(DestDCHandle, Rect(padding+AlOffset, bord, FImage.Width-padding+AlOffset, FImage.Height+bord), FRichEdit, Font.PixelsPerInch);

End;

END;

// -----------------------------------------------------------------------------

procedure TMiSubtitulo.SetText(Text: String);
var
  PrevVisible: Boolean;
begin
  if (Text = FText) then Exit;

  PrevVisible := Visible;
  Visible := False;
  FText := Text;

  //added by adenry:
  if FRenderRichText then
  begin
    //set FRichText lines:
    HTMLtoRTF(FRichEdit, FText);
    //set FRichText Height and Width (important: in that order!):
    //SetRichEditHeight(FRichEdit);
    //SetRichEditWidth(FRichEdit);
    //set MiSubtitulo Width and Height - the FRichEdit Width and Height + some padding + shadow and border width and height
    //Height := FRichEdit.Height + Abs(Font.Height) div 7 + Integer(FBorder)*FBorderWidth*2 + Integer(FShadow)*FShadowWidth;
    //Width := FRichEdit.Width + Abs(Font.Height) div 2 + Integer(FBorder)*FBorderWidth*2 + Integer(FShadow)*FShadowWidth;
  end;

  if FText <> '' then
    DrawSubtitleText else
  begin
    FImage.Width  := 0;
    FImage.Height := 0;
    SetBounds(Left, Top, 0, 0);
  end;

  Paint;
  Visible := PrevVisible;
end;

// -----------------------------------------------------------------------------

procedure TMiSubtitulo.SetShadow(Value: Boolean);
Begin
  FShadow := Value;

  DrawSubtitleText;
  Paint;
end;

// -----------------------------------------------------------------------------

procedure TMiSubtitulo.SetBorder(Value: Boolean);
Begin
  FBorder := Value;

  DrawSubtitleText;
  Paint;
end;

// -----------------------------------------------------------------------------

procedure TMiSubtitulo.SetBorderWidth(Value: Byte);
begin
  FBorderWidth := Value;

  DrawSubtitleText;
  Paint;
end;

// -----------------------------------------------------------------------------

procedure TMiSubtitulo.SetShadowWidth(Value: Byte);
begin
  FShadowWidth := Value;

  DrawSubtitleText;
  Paint;
end;

// -----------------------------------------------------------------------------

procedure TMiSubtitulo.SetTextColor(Value: TColor);
Begin
  FTextColor := Value;

  //added by adenry:
  if RenderRichText then
    FRichEdit.Font.Color := Value;

  DrawSubtitleText;
  Paint;
end;

// -----------------------------------------------------------------------------

procedure TMiSubtitulo.SetUseTags(Value: Boolean);
Begin
  FUseTags := Value;

  DrawSubtitleText;
  Paint;
end;

// -----------------------------------------------------------------------------

procedure TMiSubtitulo.SetBackgroundColor(Value: TColor);
Begin
  FBackgroundColor := Value;

  DrawSubtitleText;
  Paint;
end;

// -----------------------------------------------------------------------------

procedure TMiSubtitulo.SetForceTransparency(Value: Boolean);
begin
  FForceTransparency := Value;

  DrawSubtitleText;
  Paint;
end;

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TMiSubtitulo.SetAlignment(Value: TAlignment);
begin
	FAlignment := Value;

  //added by adenry:
  if FRenderRichText then
  begin
    FRichEdit.Alignment := Value;
    if FText <> '' then
    begin
      FRichEdit.SelectAll;
      FRichEdit.Paragraph.Alignment := Value;
    end;
  end;

  DrawSubtitleText;
  Paint;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TMiSubtitulo.SetBorderColor(Value: TColor);
Begin
  FBorderColor := Value;

  DrawSubtitleText;
  Paint;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TMiSubtitulo.SetShadowColor(Value: TColor);
Begin
  FShadowColor := Value;

  DrawSubtitleText;
  Paint;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TMiSubtitulo.SetAntialiased(Value: Boolean); //added by adenry
begin
  FAntialiased := Value;

  DrawSubtitleText;
  Paint;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TMiSubtitulo.SetRenderRichText(Value: Boolean); //added by adenry
begin
  FRenderRichText := Value;
  if Value = True then
  begin
    FRichEdit.Alignment := FAlignment;
    FRichEdit.Font := Font;
    FRichEdit.Font.Style := [];
    FRichEdit.Font.Color := FTextColor;

    FRichEdit.SelectAll;
    FRichEdit.Paragraph.Alignment := FAlignment;
    FRichEdit.SelAttributes.Size := Font.Size;
    FRichEdit.SelAttributes.Name := Font.Name;
    FRichEdit.SelAttributes.Charset := Font.Charset;
    //FRichEdit.SelAttributes.Height := Font.Height;
    FRichEdit.SelAttributes.Pitch := Font.Pitch;
    FRichEdit.SelAttributes.Color := FTextColor;

    //set FRichText lines:
    HTMLtoRTF(FRichEdit, FText);
    //set FRichText Height and Width (important: in that order!):
    //SetRichEditHeight(FRichEdit);
    //SetRichEditWidth(FRichEdit);
    //Height := FRichEdit.Height + Abs(Font.Height) div 7 + FBorderWidth*2 + + FShadowWidth;
    //Width := FRichEdit.Width + Abs(Font.Height) div 2 + FBorderWidth*2 + + FShadowWidth;
  end;

  DrawSubtitleText;
  Paint;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TMiSubtitulo.SetTransparentColor(Value: TColor); //added by adenry
begin
  FTransparentColor := Value;

  DrawSubtitleText;
  Paint;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TMiSubtitulo.DrawRTF(DestDCHandle: HDC; const R: TRect; RichEdit: TRichEdit; PixelsPerInch: Integer);
var
  //TwipsPerPixel: Integer;
  TwipsPerPixelD: Double;
  Range: TFormatRange;
begin
  //TwipsPerPixel := Ceil(1440 / PixelsPerInch); //Important! We must round upwards! it was: //TwipsPerPixel := 1440 div PixelsPerInch;
  TwipsPerPixelD := 1440 / PixelsPerInch;
  with Range do
  begin
    hDC := DestDCHandle; //DC handle
    hdcTarget := DestDCHandle; //ditto
    //Convert the coordinates to twips (1/1440")
    //Rounding here makes for a much more accurate result than when rounding the TwipsPerPixel value
    rc.Left   := Ceil(R.Left * TwipsPerPixelD);   //rc.Left := R.Left * TwipsPerPixel;
    rc.Top    := Ceil(R.Top * TwipsPerPixelD);    //rc.Top := R.Top * TwipsPerPixel;
    rc.Right  := Ceil(R.Right * TwipsPerPixelD);  //rc.Right := R.Right * TwipsPerPixel;
    rc.Bottom := Ceil(R.Bottom * TwipsPerPixelD); //rc.Bottom := R.Bottom * TwipsPerPixel;
    rcPage := rc;
    chrg.cpMin := 0;
    chrg.cpMax := -1; //RichEdit.GetTextLen;
    //Free cached information
    RichEdit.Perform(EM_FORMATRANGE, 0, 0);
    //First measure the text, to find out how high the format rectangle will be.
    //            The call sets fmtrange.rc.bottom to the actual height required, if all
    //            characters in the selected range will fit into a smaller rectangle
    RichEdit.Perform(EM_FORMATRANGE, 0, DWord(@Range));
    //Now render the text
    RichEdit.Perform(EM_FORMATRANGE, 1, DWord(@Range));
    //Free cached information
    RichEdit.Perform(EM_FORMATRANGE, 0, 0);
  end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TMiSubtitulo.HTMLtoRTF(re: TRichEdit; s: String);
const
  b: String = '<b>';
  b2: String = '</b>';
  i: String = '<i>';
  i2: String = '</i>';
  u: String = '<u>';
  u2: String = '</u>';
  {
  f: String = '<font color=#';
  f2: String = '</font>';
  }
  c: String = '<c:#';
  c2: String = '</c>';
var
  tPos, t2Pos, tPos2, SelLength, SelStart, SearchStart: SmallInt;
  Color: String;
begin
  re.SelectAll;
  re.SelAttributes.Style := [];
  re.SelAttributes.Color := re.Font.Color;
  re.SelAttributes.Size := re.Font.Size;
  re.Paragraph.Alignment := re.Alignment;
  re.Lines.Clear;

  //re.Text := s;
  re.Font.Charset := Font.Charset;
  SetRichEditText(re, s);
  
  //Replace BOLD tags
  tPos := SmartPos(b, re.Text, False);
  While(tPos > 0) do
  begin
    t2Pos := SmartPos(b2, re.Text, False);

    re.SelStart := tPos + 2;
    re.SelLength := t2Pos - tPos - 3; //if t2Pos = 0 SelLength automatically extends to the text's end
    re.SelAttributes.Style := re.SelAttributes.Style + [fsBold];

    re.SelStart := t2Pos - 1;
    re.SelLength := 4;
    re.SelText := '';
    re.SelStart := tPos - 1;
    re.SelLength := 3;
    re.SelText := '';

    tPos := SmartPos(b, re.Text, False);
  end;

  //Replace ITALIC tags
  tPos := SmartPos(i, re.Text, False);
  While(tPos > 0) do
  begin
    t2Pos := SmartPos(i2, re.Text, False);

    re.SelStart := tPos + 2;
    SelStart := re.SelStart;
    re.SelLength := t2Pos - tPos - 3; //if t2Pos = 0 SelLength automatically extends to the text's end
    SelLength := re.SelLength;
    //re.SelAttributes.Style := re.SelAttributes.Style + [fsItalic];
    for SelStart := SelStart to SelStart+SelLength-1 do //this method is used so that overlapping tags could be rendered properly
    begin
      re.SelStart := SelStart;
      re.SelLength := 1;
      re.SelAttributes.Style := re.SelAttributes.Style + [fsItalic];
    end;

    re.SelStart := t2Pos - 1;
    re.SelLength := 4;
    re.SelText := '';
    re.SelStart := tPos - 1;
    re.SelLength := 3;
    re.SelText := '';

    tPos := SmartPos(i, re.Text, False);
  end;

  //Replace UNDERLINE tags
  tPos := SmartPos(u, re.Text, False);
  While(tPos > 0) do
  begin
    t2Pos := SmartPos(u2, re.Text, False);

    re.SelStart := tPos + 2;
    SelStart := re.SelStart;
    re.SelLength := t2Pos - tPos - 3; //if t2Pos = 0 SelLength automatically extends to the text's end
    SelLength := re.SelLength;
    //re.SelAttributes.Style := re.SelAttributes.Style + [fsUnderline];
    for SelStart := SelStart to SelStart+SelLength-1 do //this method is used so that overlapping tags could be rendered properly
    begin
      re.SelStart := SelStart;
      re.SelLength := 1;
      re.SelAttributes.Style := re.SelAttributes.Style + [fsUnderline];
    end;

    re.SelStart := t2Pos - 1;
    re.SelLength := 4;
    re.SelText := '';
    re.SelStart := tPos - 1;
    re.SelLength := 3;
    re.SelText := '';

    tPos := SmartPos(u, re.Text, False);
  end;

  //Replace COLOR tags
  tPos := SmartPos(c, re.Text, False);
  SearchStart := 1;
  While(tPos > 0) do
  begin
    if (Copy(re.Text, tPos+10, 1) = '>') and ( (SmartPos('<', re.Text, False, tPos+4) > tPos+10) or (SmartPos('<', re.Text, False, tPos+4)=0) ) then
    begin  //it's a proper <c:#XXXXXX> tag:
      t2Pos := SmartPos(c2, re.Text, False, tPos+4); //nearest </c> tag
      //get next nearest <c:#XXXXXX> tag: //It's much easier to get the nearest <c:# tag, but it's not accurate: tPos2 := SmartPos(c, re.Text, False, tPos+4);
      tPos2 := 0; SelStart := tPos+4;
      while (True) do
      begin
        tPos2 := SmartPos(c, re.Text, False, SelStart); //get nearest <c:# tag
        if tPos2 = 0 then break; //there are no more <c:# tags, so break
        if Copy(re.Text, tPos2+10, 1) <> '>' then
          SelStart := tPos2+1 else break; //if this is a proper <c:#XXXXXX> tag - break, otherwise - search for the next <c:#
      end;
      //determine the selection end - it's either the nearest </c> tag, the nearest <c:#XXXXXX> tag, or the end of the subtitle
      if (t2Pos>0) then
      begin //a </c> tag exists
        if ((t2Pos < tPos2) or (tPos2=0)) then
        begin //we can delete </c> tag -- it's the selection end -- the </c> tag is before the <c:#XXXXXX> tag, or the <c:#XXXXXX> tag doesn't exist
          re.SelStart := t2Pos - 1;
          re.SelLength := 4;
          re.SelText := '';
        end else //(tPos2>0) and (t2Pos>tPos2) //the <c:#XXXXXX> tag is before the </c> tag -- we don't delete the </c> tag
          t2Pos := tPos2; //change selection end
      end else //t2Pos=0 //a </c> tag does not exist
        if tPos2>0 then   //if a <c:#XXXXXX> tag exists
          t2Pos := tPos2; //change selection end

      //now we have the proper selection end in t2Pos and we do the actual coloring (if hte six symbols are proper hex values):
      re.SelStart := tPos + 10;
      re.SelLength := t2Pos - (tPos + 11); //if t2Pos = 0 SelLength automatically extends to the text's end!!
      Color := Copy(re.Text, tPos + 4, 6);
      if (Color[1] in HexChars)and(Color[2] in HexChars)and(Color[3] in HexChars)and(Color[4] in HexChars)and(Color[5] in HexChars)and(Color[6] in HexChars) then
        re.SelAttributes.Color := RGB(StrToInt('$'+Copy(re.Text, tPos + 4, 2)), StrToInt('$'+Copy(re.Text, tPos + 6, 2)),StrToInt('$'+Copy(re.Text, tPos + 8, 2)));

      //delete <c:#XXXXXX> tag
      re.SelStart := tPos - 1;
      re.SelLength := 11;
      re.SelText := '';
    end else
    begin //it's not a proper <c:#XXXXXX> tag:
      t2Pos := SmartPos('>', re.Text, False, tPos+4);
      if (t2Pos > 0) and ( (t2Pos < SmartPos('<', re.Text, False, tPos+4)) or (SmartPos('<', re.Text, False, tPos+4)=0) ) then
      begin //at least it's a closed <c:# tag, so we delete it
        re.SelStart := tPos - 1;
        re.SelLength := t2Pos-tPos+1;
        re.SelText := '';
      end else //it's not even a closed <c:# tag, so we can't delete it as we don't know where its end is
        SearchStart := tPos+1;
    end;
    tPos := SmartPos(c, re.Text, False, SearchStart);
  end;

  {
  //Replace FONT COLOR tags
  tPos := SmartPos(f, re.Text, False);
  SearchStart := 1;
  While(tPos > 0) do
  begin
    if (Copy(re.Text, tPos+19, 1) = '>') and ( (SmartPos('<', re.Text, False, tPos+13) > tPos+19) or (SmartPos('<', re.Text, False, tPos+13)=0) ) then
    begin  //it's a proper <font color=#XXXXXX> tag:
      t2Pos := SmartPos(f2, re.Text, False, tPos+13); //nearest </font> tag
      //get next nearest <font color=#XXXXXX> tag: //It's much easier to get the nearest <font color=# tag, but it's not accurate: tPos2 := SmartPos(f, re.Text, False, tPos+13);
      tPos2 := 0; SelStart := tPos+13;
      while (True) do
      begin
        tPos2 := SmartPos(f, re.Text, False, SelStart); //get nearest <font color=# tag
        if tPos2 = 0 then break; //there are no more <font color=# tags, so break
        if Copy(re.Text, tPos2+19, 1) <> '>' then
          SelStart := tPos2+1 else break; //if this is a proper <font color=#XXXXXX> tag - break, otherwise - search for the next <font color=#
      end;
      //determine the selection end - it's either the nearest </font> tag, the nearest <font color=#XXXXXX> tag, or the end of the subtitle
      if (t2Pos>0) then
      begin //a </font> tag exists
        if ((t2Pos < tPos2) or (tPos2=0)) then
        begin //we can delete </font> tag -- it's the selection end -- the </font> tag is before the <font color=#XXXXXX> tag, or the <font color=#XXXXXX> tag doesn't exist
          re.SelStart := t2Pos - 1;
          re.SelLength := 13;
          re.SelText := '';
        end else //(tPos2>0) and (t2Pos>tPos2) //the <font color=#XXXXXX> tag is before the </font> tag -- we don't delete the </font> tag
          t2Pos := tPos2; //change selection end
      end else //t2Pos=0 //a </font> tag does not exist
        if tPos2>0 then   //if a <font color=#XXXXXX> tag exists
          t2Pos := tPos2; //change selection end

      //now we have the proper selection end in t2Pos and we do the actual coloring (if hte six symbols are proper hex values):
      re.SelStart := tPos + 19;
      re.SelLength := t2Pos - (tPos + 20); //if t2Pos = 0 SelLength automatically extends to the text's end!!
      Color := Copy(re.Text, tPos + 13, 6);
      if (Color[1] in HexChars)and(Color[2] in HexChars)and(Color[3] in HexChars)and(Color[4] in HexChars)and(Color[5] in HexChars)and(Color[6] in HexChars) then
        re.SelAttributes.Color := RGB(StrToInt('$'+Copy(re.Text, tPos + 13, 2)), StrToInt('$'+Copy(re.Text, tPos + 15, 2)),StrToInt('$'+Copy(re.Text, tPos + 17, 2)));

      //delete <font color=#XXXXXX> tag
      re.SelStart := tPos - 1;
      re.SelLength := 20;
      re.SelText := '';
    end else
    begin //it's not a proper <font color=#XXXXXX> tag:
      t2Pos := SmartPos('>', re.Text, False, tPos+13);
      if (t2Pos > 0) and ( (t2Pos < SmartPos('<', re.Text, False, tPos+13)) or (SmartPos('<', re.Text, False, tPos+13)=0) ) then
      begin //at least it's a closed <font color=# tag, so we delete it
        re.SelStart := tPos - 1;
        re.SelLength := t2Pos-tPos+1;
        re.SelText := '';
      end else //it's not even a closed <font color=# tag, so we can't delete it as we don't know where its end is
        SearchStart := tPos+1;
    end;
    tPos := SmartPos(f, re.Text, False, SearchStart);
  end;
  }

  //Clear unnecessary close tags
  t2Pos := SmartPos(b2, re.Text, False);
  While (t2Pos > 0) do
  begin
    re.SelStart := t2Pos - 1;
    re.SelLength := 4;
    re.SelText := '';
    t2Pos := SmartPos(b2, re.Text, False);
  end;
  t2Pos := SmartPos(i2, re.Text, False);
  While (t2Pos > 0) do
  begin
    re.SelStart := t2Pos - 1;
    re.SelLength := 4;
    re.SelText := '';
    t2Pos := SmartPos(i2, re.Text, False);
  end;
  t2Pos := SmartPos(u2, re.Text, False);
  While (t2Pos > 0) do
  begin
    re.SelStart := t2Pos - 1;
    re.SelLength := 4;
    re.SelText := '';
    t2Pos := SmartPos(u2, re.Text, False);
  end;
  t2Pos := SmartPos(c2, re.Text, False);
  While (t2Pos > 0) do
  begin
    re.SelStart := t2Pos - 1;
    re.SelLength := 4;
    re.SelText := '';
    t2Pos := SmartPos(c2, re.Text, False);
  end;
  {
  t2Pos := SmartPos(f2, re.Text, False);
  While (t2Pos > 0) do
  begin
    re.SelStart := t2Pos - 1;
    re.SelLength := 7;
    re.SelText := '';
    t2Pos := SmartPos(f2, re.Text, False);
  end;
  }
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TMiSubtitulo.SetRichEditWidth(re : TRichEdit);
var
  i, CharIdx, NeededWidth : integer;
  RHSPt, CharPt : TPoint;
  al: TAlignment;
const
  MinWidth : integer = 10;
begin
  al := re.Paragraph.Alignment;
  re.Paragraph.Alignment := taLeftJustify; //important: set LEFT alignment!

  re.Width := 4000;
  //re.SetBounds(0, 0, 2000, re.Height);
  NeededWidth := MinWidth;
  for i := 0 to (re.Height div 5) do begin
    //get a point at RHS of richedeit
    RHSPt := point(re.Width, i * 5);
    //get nearest char to that
    CharIdx := re.Perform(EM_CHARFROMPOS, 0, integer(@RHSPt));
    //get point of that char
    re.Perform(EM_POSFROMCHAR, integer(@CharPt), CharIdx + 1); // + 1 to get the position of RHS of last character and EM_POSFROMCHAR returns LHS of character
    //adjust NeededWidth is necessary
    if CharPt.X > NeededWidth then
      NeededWidth := CharPt.X;
  end;
  re.Width := NeededWidth;
  //re.SetBounds(0, 0, NeededWidth, re.Height); //NeededWidth + re.Width - re.ClientWidth
  re.Paragraph.Alignment := al; //restore alignment

// THIS IS THE OLD METHOD:
//
//  NeededWidth := MinWidth;
//  re.Width := 0;
//  for i := 0 to Length(re.Text) do
//  begin
//    re.Perform(EM_POSFROMCHAR, Integer(@CharPt), i); //EM_POSFROMCHAR = WM_USER + 38
//    if CharPt.x > NeededWidth then
//      NeededWidth := CharPt.x;
//  end;
//  re.Width := NeededWidth; // + re.Width - re.ClientWidth;
//  re.Paragraph.Alignment := al; //restore alignment

end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TMiSubtitulo.SetRichEditHeight(re: TRichEdit);
var
  BMP : TBitmap;
begin
  BMP := TBitmap.Create;
  try
    BMP.Canvas.Font.Assign(re.Font);
    re.Height := re.Lines.Count * BMP.Canvas.TextHeight('Wqg');
  finally
    FreeAndNIL(BMP);
  end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

procedure TMiSubtitulo.CMFontChanged(var Message: TMessage);
begin
  inherited;

  //added by adenry
  //if FRenderRichText then
  //begin
  //  RefreshRichEditFont;
  //  SetRichEditHeight(FRichEdit);
  //  SetRichEditWidth(FRichEdit);
  //  //Height := FRichEdit.Height + Abs(Font.Height) div 7 + FBorderWidth*2 + + FShadowWidth;
  //  //Width := FRichEdit.Width + Abs(Font.Height) div 2 + FBorderWidth*2 + FShadowWidth;
  //end;

  DrawSubtitleText;
  if Assigned(FRichEdit) then Paint; //added by adenry
end;

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TMiSubtitulo.RefreshRichEditFont; //added by adenry
begin
  FRichEdit.Font.Assign(Font);
  FRichEdit.Font.Style := [];
  FRichEdit.Font.Color := FTextColor;
  if FText <> '' then
  begin
    FRichEdit.SelectAll;
    FRichEdit.SelAttributes.Size := Font.Size;
    FRichEdit.SelAttributes.Name := Font.Name;
    FRichEdit.SelAttributes.Charset := Font.Charset;
    FRichEdit.SelAttributes.Height := Font.Height;
    FRichEdit.SelAttributes.Pitch := Font.Pitch;
  end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
//Set RichEdit Text as ANSI String WITH THE PROPER ENCODING instead of the encoding of the system's default non-Unicode language
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

procedure TMiSubtitulo.SetRichEditText(RichEdit: TRichEdit; Text: String);
// EM_SETTEXTEX and SETTEXTEX from RichEdit v.3
// Windows 2000/ME/XP or later is required for these to work
const
  {$IFDEF CPPBUILDER}{$EXTERNALSYM EM_SETTEXTEX}{$ENDIF}
  EM_SETTEXTEX = WM_USER + 97;
type
  // EM_SETTEXTEX info; this struct is passed in the wparam of the message
  PSetTextEx = ^TSetTextEx;
  {$IFDEF CPPBUILDER}{$EXTERNALSYM _settextex}{$ENDIF}
  _settextex = packed record
    flags: DWORD;       // Flags (see the ST_XXX defines)
    codepage: UINT;     // Code page for translation (CP_ACP for sys default, 1200 for Unicode, -1 for control default)
  end;
  {$IFDEF CPPBUILDER}{$EXTERNALSYM SETTEXTEX}{$ENDIF}
  SETTEXTEX = _settextex;
  TSetTextEx = _settextex;
var
  TheSetTextEx: TSetTextEx;
begin
  TheSetTextEx.flags := GTL_DEFAULT;
  TheSetTextEx.codepage := CharsetToCodePage(RichEdit.Font.Charset);
  SendMessage(RichEdit.Handle, EM_SETTEXTEX, WPARAM(@TheSetTextEx), LPARAM(PChar(Text))); //PWideChar changed to PChar
end;
//added by adenry: end

// -----------------------------------------------------------------------------

procedure Register;
begin
  RegisterComponents('Subtitle Workshop', [TMiSubtitulo]);
end;

// -----------------------------------------------------------------------------

End.
