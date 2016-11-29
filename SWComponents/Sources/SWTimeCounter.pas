// This file is part of SWComponents, the component package for Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle Workshop's copyright information
// File Description: SWTimeCounter component - display frame rate and current and total time of the video file

unit SWTimeCounter;

// -----------------------------------------------------------------------------

interface

// -----------------------------------------------------------------------------

uses
  SysUtils, Math, Classes, Graphics, Controls;

// -----------------------------------------------------------------------------

type
  TSWTimeCounter = class(TCustomControl)
  private
    FText1     : String;
    FText2     : String;
    FText3     : String;
    FText4     : String;
    FBackColor : TColor;
    FLineColor : TColor; //added by adenry
    FTextColor : TColor;
    FText1Color: TColor; //added by adenry
    FText2Color: TColor; //added by adenry
    FText3Color: TColor; //added by adenry
    FText4Color: TColor; //added by adenry
    FCharset   : TFontCharset;
    procedure SetText1(const Text1: String);
    procedure SetText2(const Text2: String);
    procedure SetText3(const Text3: String);
    procedure SetText4(const Text4: String);
    procedure SetBackColor(const Color: TColor);
    procedure SetLineColor(const Color: TColor); //added by adenry
    procedure SetTextColor(const Color: TColor);
    procedure SetText1Color(const Color: TColor); //added by adenry
    procedure SetText2Color(const Color: TColor); //added by adenry
    procedure SetText3Color(const Color: TColor); //added by adenry
    procedure SetText4Color(const Color: TColor); //added by adenry
    procedure SetFontCharset(const Value: TFontCharset);
  protected
    procedure Paint; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Text1: String read FText1 write SetText1;
    property Text2: String read FText2 write SetText2;
    property Text3: String read FText3 write SetText3;
    property Text4: String read FText4 write SetText4;
    property BackColor: TColor read FBackColor write SetBackColor;
    property LineColor: TColor read FLineColor write SetLineColor; //added by adenry
    property TextColor: TColor read FText1Color write SetTextColor;
    property Text1Color: TColor read FText1Color write SetText1Color; //added by adenry
    property Text2Color: TColor read FText2Color write SetText2Color; //added by adenry
    property Text3Color: TColor read FText3Color write SetText3Color; //added by adenry
    property Text4Color: TColor read FText4Color write SetText4Color; //added by adenry
    property FontCharset: TFontCharset read FCharset write SetFontCharset;
    property Anchors;
    property Visible;
    property OnMouseDown; //added by adenry
    property OnMouseMove; //added by adenry
    property OnMouseUp; //added by adenry
    property OnMouseWheelDown; //added by adenry
    property OnMouseWheelUp; //added by adenry
  end;

procedure Register;

implementation

// -----------------------------------------------------------------------------

constructor TSWTimeCounter.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle + [csOpaque];
  Width        := 125;
  Height       := 35;
  FBackColor   := clBlack;
  FLineColor   := clWhite;
  FText1Color  := clWhite;
  FText2Color  := clWhite;
  FText3Color  := clWhite;
  FText4Color  := clWhite;
end;

// -----------------------------------------------------------------------------

destructor TSWTimeCounter.Destroy;
begin
  inherited Destroy;
end;

// -----------------------------------------------------------------------------

procedure TSWTimeCounter.Paint;
var
  X: Integer;
begin
  X := Max(Canvas.TextWidth(FText1), Canvas.TextWidth(FText2));
  Canvas.Font.Charset := FCharset;
  Canvas.Brush.Color := FBackColor;
  Canvas.FillRect(Rect(0, 0, Width, Height));
  Canvas.Font.Name  := 'Tahoma';
  Canvas.Font.Size  := 8;
  Canvas.Font.Style := Canvas.Font.Style + [fsBold];
  Canvas.Font.Color := FText1Color;
  Canvas.TextOut(4, 0, FText1);
  Canvas.Font.Color := FText2Color;
  Canvas.TextOut(4, Canvas.TextHeight(FText1), FText2);
  Canvas.Pen.Color := FLineColor;
  Canvas.Pen.Width := 2;

  Canvas.MoveTo(8 + X, Canvas.TextHeight(FText1)*2 - 2); //-2 added by adenry
  Canvas.LineTo(8 + X, 0 + 2); //+2 added by adenry
  Canvas.Font.Color := FText3Color;
  Canvas.TextOut(4 + X + 8, 0, FText3);
  Canvas.Font.Color := FText4Color;
  Canvas.TextOut(4 + X + 8, Canvas.TextHeight(FText3), FText4);
end;

// -----------------------------------------------------------------------------

procedure TSWTimeCounter.SetText1(const Text1: String);
begin
  FText1 := Text1;
  Paint;
end;

// -----------------------------------------------------------------------------

procedure TSWTimeCounter.SetText2(const Text2: String);
begin
  FText2 := Text2;
  Paint;
end;

// -----------------------------------------------------------------------------

procedure TSWTimeCounter.SetText3(const Text3: String);
begin
  FText3 := Text3;
  Paint;
end;

// -----------------------------------------------------------------------------

procedure TSWTimeCounter.SetText4(const Text4: String);
begin
  FText4 := Text4;
  Paint;
end;

// -----------------------------------------------------------------------------

procedure TSWTimeCounter.SetBackColor(const Color: TColor);
begin
  FBackColor := Color;
  Paint;
end;

// -----------------------------------------------------------------------------

procedure TSWTimeCounter.SetLineColor(const Color: TColor);
begin
  FLineColor := Color;
  Paint;
end;

// -----------------------------------------------------------------------------

procedure TSWTimeCounter.SetTextColor(const Color: TColor);
begin
  FTextColor := Color;
  FText1Color := Color; //added by adenry
  FText2Color := Color; //added by adenry
  FText3Color := Color; //added by adenry
  FText4Color := Color; //added by adenry
  FLineColor := Color;  //added by adenry
  Paint;
end;

// -----------------------------------------------------------------------------

procedure TSWTimeCounter.SetText1Color(const Color: TColor);
begin
  FText1Color := Color;
  Paint;
end;

// -----------------------------------------------------------------------------

procedure TSWTimeCounter.SetText2Color(const Color: TColor);
begin
  FText2Color := Color;
  Paint;
end;

// -----------------------------------------------------------------------------

procedure TSWTimeCounter.SetText3Color(const Color: TColor);
begin
  FText3Color := Color;
  Paint;
end;

// -----------------------------------------------------------------------------

procedure TSWTimeCounter.SetText4Color(const Color: TColor);
begin
  FText4Color := Color;
  Paint;
end;

// -----------------------------------------------------------------------------

procedure TSWTimeCounter.SetFontCharset(const Value: TFontCharset);
begin
  FCharset := Value;
  Paint;
end;

// -----------------------------------------------------------------------------

procedure Register;
begin
  RegisterComponents('Subtitle Workshop', [TSWTimeCounter]);
end;

// -----------------------------------------------------------------------------

end.
