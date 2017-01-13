unit UTtmlTimeConverter;

interface

uses
  SysUtils,
  Classes,
  Windows,
  XMLIntf,
  XMLDoc,
  USubtitleFile,
  USubtitlesFunctions,
  UTagFinder;

type

  TTtmlTimeConverter = class
  private
    FFrameRate    : Integer;
    FFrNumerator  : Integer;
    FFrDenominator: Integer;
    FSubFrameRate : Integer;
    FTickRate     : Integer;
    FPS           : Extended;
  public
    constructor Create(frameRate, frNumerator, frDenominator, subFrameRate, tickRate: Integer);
    function ParseTimeExpression(timeExpression: SubtitleString): Integer;
  end;

implementation

constructor TTtmlTimeConverter.Create(frameRate, frNumerator, frDenominator, subFrameRate, tickRate: Integer);
begin
  FFrameRate      := frameRate;
  FFrNumerator    := frNumerator;
  FFrDenominator  := frDenominator;
  FSubFrameRate   := subFrameRate;
  FTickRate       := tickRate;
  
  FPS := FFrDenominator / (FFrameRate * FFrNumerator);
end;

function TTtmlTimeConverter.ParseTimeExpression(timeExpression: SubtitleString): Integer;
var
  h, m          : Integer;
  s, f, time    : Extended;
  parts         : TStrings;
  fParts        : TStrings;
  metric        : SubtitleString;
  metricLength  : Integer;
begin
  Result := 0;

  if (timeExpression = '') then Exit;

  if (Pos(':', timeExpression) > 0) then begin
    parts := TStringList.Create;
    ExtractStrings([':'], [], PChar(timeExpression), parts);

    if (parts.Count = 3) then begin
      h := StrToInt(parts[0]);
      m := StrToInt(parts[1]);
      s := StrToFloat(parts[2]);

      Result := h * 3600000 + m * 60000 + Trunc(s * 1000);
    end
    else
    if (parts.Count = 4) then begin
      fParts := TStringList.Create;

      if (Pos('.', parts[3]) > 0) then
        ExtractStrings(['.'], [], PChar(parts[3]), fParts)
      else
      begin
        fParts.Add(parts[3]);
        fParts.Add('0');
      end;

      h := StrToInt(parts[0]);
      m := StrToInt(parts[1]);
      s := StrToFloat(parts[2]);
      f := StrToFloat(fParts[0]) + StrToFloat(fParts[1]) / FSubFrameRate;

      Result := h * 3600000 + m * 60000 + Trunc(s * 1000)
              + Trunc(f * 1000 * FPS);
    end;
  end
  else
  begin
    if (Pos('ms', timeExpression) > 0) then
      metricLength := 2
    else
      metricLength := 1;

    metric := Copy(timeExpression, Length(timeExpression) - metricLength + 1, metricLength);
    timeExpression := Copy(timeExpression, 0, Length(timeExpression) - metricLength);

    time := StrToFloat(timeExpression);
    if (metric = 'h')   then Result := Trunc(time * 3600000)    else
    if (metric = 'm')   then Result := Trunc(time * 60000)      else
    if (metric = 's')   then Result := Trunc(time * 1000)       else
    if (metric = 'ms')  then Result := Trunc(time)              else
    if (metric = 'f')   then Result := Trunc(time * 1000 * FPS) else
    if (metric = 't')   then Result := Trunc(time * 1000 / FTickRate);
  end;
end;

end.
