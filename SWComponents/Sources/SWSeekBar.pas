// This file is part of SWComponents, the component package for Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle Workshop's copyright information
// File Description: SWSeekBar component - video player seekbar

unit SWSeekBar;

interface

uses
  Windows, Messages, SysUtils, Graphics, Classes, Controls, USGraphics;

type
  TRepaintSeekbarEvent = Procedure(Sender: TObject; Bitmap: TBitmap) Of Object;

  //TStates = (sNormal, sPressed, sDisabled});
  TSWSeekBar = class(TCustomControl)
  private
    FSeekBarBitmap      : TBitmap; //added by adenry
    FUserBitmap         : TBitmap; //added by adenry
    FinalBitmap         : TBitmap;
    FMainSeekBar        : TBitmap;
    FNormal             : TBitmap;
    FDisabled           : TBitmap;
    FMax                : Int64;
    FPosition           : Int64;
    FEnabled            : Boolean;
    FMouseIsDown        : Boolean;
    FOnMouseEnter       : TNotifyEvent; //added by adenry
    FOnMouseLeave       : TNotifyEvent; //added by adenry
    FFillColor          : TColor; //added by adenry
    FDisabledFillColor  : TColor; //added by adenry
    FBckgrColor         : Tcolor; //added by adenry
    FSeekBarVPos        : ShortInt; //added by adenry
    FOnRepaintSeekbar   : TRepaintSeekbarEvent; //added by adenry
    procedure SetMax(Max: Int64);
    procedure SetPosition(Position: Int64);
    procedure SetMainSeekBarBitmap(Bitmap: TBitmap);
    procedure SetNormalBtnBitmap  (Bitmap: TBitmap);
    procedure SetDisabledBtnBitmap(Bitmap: TBitmap);
    procedure SetFillColor(Color: TColor); //added by adenry
    procedure SetDisabledFillColor(Color: TColor); //added by adenry
    procedure SetBckgrColor(Color: TColor); //added by adenry
    procedure SetSeekBarVPos(Pos: ShortInt); //added by adenry
  protected
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure Paint; override;
    procedure PaintSBButton;
    procedure SetEnabled(Value: Boolean); override;
    procedure CMMouseEnter (var msg: TMessage); message CM_MOUSEENTER; //added by adenry
    procedure CMMouseLeave (var msg: TMessage); message CM_MOUSELEAVE; //added by adenry
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property MainBar   : TBitmap  read FMainSeekBar write SetMainSeekBarBitmap;
    property Max       : Int64    read FMax         write SetMax;
    property Position  : Int64    read FPosition    write SetPosition;
    property Normal    : TBitmap  read FNormal      write SetNormalBtnBitmap;
    property Disabled  : TBitmap  read FDisabled    write SetDisabledBtnBitmap;
    property Enabled   : Boolean  read FEnabled     write SetEnabled;
    property FillColor : TColor   read FFillColor   write SetFillColor; //added by adenry
    property DisabledFillColor: TColor read FDisabledFillColor write SetDisabledFillColor; //added by adenry
    property BckgrColor: TColor   read FBckgrColor  write SetBckgrColor; //added by adenry;
    property SeekBarVPos: ShortInt read FSeekBarVPos  write SetSeekBarVPos; //added by adenry;
    property Align;
    property Anchors;
    property Visible;
    property ShowHint;
    property Hint;
    //property OnClick;
    property OnMouseDown;
    property OnMouseUp;
    property OnMouseMove;
    property OnMouseWheelDown; //added by adenry
    property OnMouseWheelUp; //added by adenry
    property OnMouseEnter : TNotifyEvent read FOnMouseEnter write FOnMouseEnter; //added by adenry
    property OnMouseLeave : TNotifyEvent read FOnMouseLeave write FOnMouseLeave; //added by adenry
    property OnRepaintSeekbar: TRepaintSeekbarEvent read FOnRepaintSeekbar write FOnRepaintSeekbar; //added by adenry
  end;

procedure Register;

implementation

// -----------------------------------------------------------------------------

constructor TSWSeekBar.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle        := ControlStyle + [csOpaque];
  FSeekBarBitmap      := TBitmap.Create; //added by adenry
  FUserBitmap         := TBitmap.Create; //added by adenry
  FinalBitmap         := TBitmap.Create;
  FMainSeekBar        := TBitmap.Create;
  FNormal             := TBitmap.Create;
  FDisabled           := TBitmap.Create;
  FEnabled            := True;
  FMouseIsDown        := False;
  FMax                := 1000;
  FPosition           := 0;
  FFillColor          := $97A8B2; //added by adenry
  FDisabledFillColor  := $97A8B2; //added by adenry
  FBckgrColor         := clBtnFace; //added by adenry
  Width               := 100;
  Height              := 10;
  FSeekBarVPos        := 0; //added by adenry
end;

// -----------------------------------------------------------------------------

destructor TSWSeekBar.Destroy;
begin
  inherited Destroy;
  FSeekBarBitmap.Free; //added by adenry
  FUserBitmap.Free; //added by adenry
  FinalBitmap.Free;
  FMainSeekBar.Free;
  FNormal.Free;
  FDisabled.Free;
end;

// -----------------------------------------------------------------------------

procedure TSWSeekBar.Paint;
var
  a    : Integer;
  Top  : Integer;
  //Left : Integer;
  Left2: Integer; //added by adenry
begin
  // 1. Draw Seekbar base:
  Top := (Height div 2) - (FMainSeekBar.Height div 2);
  FSeekBarBitmap.Width  := Width;
  FSeekBarBitmap.Height := Height;

  // 1.1. Draw background:
  FSeekBarBitmap.Canvas.Brush.Color := FBckgrColor;
  FSeekBarBitmap.Canvas.FillRect(Rect(0, 0, Width, Height));

  // 1.2. Draw main bar:
  Left2 := FNormal.Width div 2; //added by adenry
//  DrawTransparentBitmap(FinalBitmap.Canvas.Handle, FMainSeekBar.Handle, 0, Top, clFuchsia);
  //BitBlt(FinalBitmap.Canvas.Handle, 0, Top, FMainSeekBar.Width, FMainSeekBar.Height, FMainSeekBar.Canvas.Handle, 0, 0, srcCopy); //removed by adenry
  BitBlt(FSeekBarBitmap.Canvas.Handle, Left2, Top+FSeekBarVPos, FMainSeekBar.Width, FMainSeekBar.Height, FMainSeekBar.Canvas.Handle, 0, 0, srcCopy); //added by adenry
  a := 91 + Left2; //+ Left2 added by adenry
  while a < Width - Left2 - 90 do //- Left2 - 90 added by adenry
  begin
    //DrawTransparentBitmap(FinalBitmap.Canvas.Handle, FMainSeekBar.Handle, a, Top, clFuchsia);
    BitBlt(FSeekBarBitmap.Canvas.Handle, a, Top+FSeekBarVPos, FMainSeekBar.Width, FMainSeekBar.Height, FMainSeekBar.Canvas.Handle, 2, 0, srcCopy);
    Inc(a, 89);
  end;
  //DrawTransparentBitmap(FinalBitmap.Canvas.Handle, FMainSeekBar.Handle, Width-3, Top, clFuchsia);
  //BitBlt(FinalBitmap.Canvas.Handle, Width - 3, Top, FMainSeekBar.Width, FMainSeekBar.Height, FMainSeekBar.Canvas.Handle, 89, 0, srcCopy); //removed by adenry
  BitBlt(FSeekBarBitmap.Canvas.Handle, a, Top+FSeekBarVPos, FMainSeekBar.Width, FMainSeekBar.Height, FMainSeekBar.Canvas.Handle, 91-(Width-a-Left2), 0, srcCopy); //added by adenry

  // 2. User drawing on the seekbar, below the button and above everything else:
  if Assigned(FOnRepaintSeekbar) then
    FOnRepaintSeekbar(Self, FUserBitmap);

  // 3. Draw the button and fill the bar:
  PaintSBButton;
end;

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TSWSeekBar.PaintSBButton;
var
  Top  : Integer;
  Top2 : Integer; //added by adenry
  Left : Integer;
  Left2: Integer; //added by adenry
begin
  FinalBitmap.Width  := Width;
  FinalBitmap.Height := Height;
  
  // Draw base seekbar:
  FinalBitmap.Canvas.Draw(0, 0, FSeekBarBitmap);

  // Draw fill line to the button:
  Left2 := 1 + FNormal.Width div 2; //added by adenry
  if FMax <> 0 then
    Left := Trunc((FPosition * 100 / FMax) * (Width-FNormal.Width) / 100) else
    Left := 0;
  Top2 := (Height div 2) - (FMainSeekBar.Height div 2) + 1 + FSeekBarVPos;
  Top := (Height div 2) - (FNormal.Height div 2);
  if FEnabled then
    FinalBitmap.Canvas.Brush.Color := FFillColor else
    FinalBitmap.Canvas.Brush.Color := FDisabledFillColor;
  //FinalBitmap.Canvas.FillRect(Rect(1, (Height div 2) - (FMainSeekBar.Height div 2) + 1, Left, ((Height div 2) - (FMainSeekBar.Height div 2)) + FMainSeekBar.Height - 1)); //removed by adenry
  FinalBitmap.Canvas.FillRect(Rect(Left2, Top2, Left+Left2, ((Height div 2) - (FMainSeekBar.Height div 2)) + FMainSeekBar.Height - 1 + FSeekBarVPos)); //added by adenry

  // Draw user bitmap:
  if Assigned(FOnRepaintSeekbar) then //added later to fix a bug
    DrawTransparentBitmap(FinalBitmap.Canvas.Handle, FUserBitmap.Handle, Left2, Top2, clFuchsia);

  // Draw button:
  if FEnabled then
    DrawTransparentBitmap(FinalBitmap.Canvas.Handle, FNormal.Handle, Left, Top, clFuchsia) else
    DrawTransparentBitmap(FinalBitmap.Canvas.Handle, FDisabled.Handle, Left, Top, clFuchsia);

  // Draw the entire control:
  BitBlt(Canvas.Handle, 0, 0, FinalBitmap.Width, FinalBitmap.Height, FinalBitmap.Canvas.Handle, 0, 0, srcCopy);
end;
//added by adenry: end

// -----------------------------------------------------------------------------

procedure TSWSeekBar.SetEnabled(Value: Boolean);
begin
  if Value <> FEnabled then
  begin
    FEnabled := Value;
    EnableWindow(Handle, Value);
    Paint;
  end;
end;

// -----------------------------------------------------------------------------

procedure TSWSeekBar.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if (Assigned(FNormal)) and (ssLeft in Shift) and (FEnabled) then
  begin
    FPosition := ((X - (FNormal.Width div 2)) * FMax) div (Width-(FNormal.Width));
    if FPosition < 0 then FPosition := 0;
    if FPosition > (FMax) then FPosition := FMax;
    PaintSBButton; //Paint; //modified by adenry
  end;
  FMouseIsDown := True;
  if Assigned(OnMouseDown) then
    OnMouseDown(Self, Button, Shift, X, Y);
end;

// -----------------------------------------------------------------------------

procedure TSWSeekBar.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if FMouseIsDown then
  begin
    if (Assigned(FNormal)) and (ssLeft in Shift) and (FEnabled) then
    begin
      FPosition := ((X - (FNormal.Width div 2)) * FMax) div (Width-(FNormal.Width));
      if FPosition < 0 then FPosition := 0;
      if FPosition > (FMax) then FPosition := FMax;
      PaintSBButton; //Paint; //modified by adenry
    end;
    if Assigned(OnMouseUp) then
      OnMouseUp(Self, Button, Shift, X, Y);
    FMouseIsDown := False;
  end;
end;

// -----------------------------------------------------------------------------

procedure TSWSeekBar.MouseMove(Shift: TShiftState; X, Y: Integer);
begin
  if FMouseIsDown = True then
  begin
    if (Assigned(FNormal)) and (ssLeft in Shift) and (FEnabled) then
    begin
      FPosition := ((X - (FNormal.Width div 2)) * FMax) div (Width-(FNormal.Width));
      if FPosition < 0 then FPosition := 0;
      if FPosition > (FMax) then FPosition := FMax;
      PaintSBButton; //Paint; //modified by adenry
    end;
  end;
  if Assigned(OnMouseMove) then
    OnMouseMove(Self, Shift, X, Y);
end;

// -----------------------------------------------------------------------------

procedure TSWSeekBar.SetMax(Max: Int64);
begin
  if FMax <> Max then
  begin
    FMax := Max;
    Paint;
  end;
end;

// -----------------------------------------------------------------------------

procedure TSWSeekBar.SetPosition(Position: Int64);
begin
  if FPosition <> Position then
  begin
    FPosition := Position;
    PaintSBButton; //Paint; //modified by adenry
  end;
end;

// -----------------------------------------------------------------------------

procedure TSWSeekBar.SetMainSeekBarBitmap(Bitmap: TBitmap);
begin
  FMainSeekBar.Assign(Bitmap);
  Paint;
end;

// -----------------------------------------------------------------------------

procedure TSWSeekBar.SetNormalBtnBitmap(Bitmap: TBitmap);
begin
  FNormal.Assign(Bitmap);
  Paint;
end;

// -----------------------------------------------------------------------------

procedure TSWSeekBar.SetDisabledBtnBitmap(Bitmap: TBitmap);
begin
  FDisabled.Assign(Bitmap);
  Paint;
end;

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TSWSeekBar.SetFillColor(Color: TColor);
begin
  FFillColor := Color;
  PaintSBButton;
end;
//added by adenry: begin

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TSWSeekBar.SetDisabledFillColor(Color: TColor);
begin
  FDisabledFillColor := Color;
  PaintSBButton;
end;
//added by adenry: begin

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TSWSeekBar.SetBckgrColor(Color: TColor);
begin
  FBckgrColor := Color;
  Paint;
end;
//added by adenry: begin

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TSWSeekBar.SetSeekBarVPos(Pos: ShortInt);
begin
  FSeekBarVPos := Pos;
  Paint;
end;
//added by adenry: begin

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure TSWSeekBar.CMMouseEnter(var msg: TMessage);
begin
  if Assigned(FOnMouseEnter) then FOnMouseEnter(self);
end;

procedure TSWSeekBar.CMMouseLeave(var msg: TMessage);
begin
  if Assigned(FOnMouseLeave) then FOnMouseLeave(self);
end;
//added by adenry: end

// -----------------------------------------------------------------------------

procedure Register;
begin
  RegisterComponents('Subtitle Workshop', [TSWSeekBar]);
end;

// -----------------------------------------------------------------------------

end.
