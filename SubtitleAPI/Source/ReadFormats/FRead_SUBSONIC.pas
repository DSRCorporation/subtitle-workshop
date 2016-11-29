// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: SubSonic subtitle format reading functionality

function FileToSubtitles_SUBSONIC(var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; ExtraTime: Integer): Boolean;
var
  i, c, u     : Integer;
  InitialTime : Integer;
  FinalTime   : Integer;
  Text        : String;
  DecimalSep  : Char;
begin
  // *** COMO FUNCIONA ESTA #$&@! DE SUBSONIC E I-AUTHOR:
  // POR LO QUE DESCUBRI CON LA CALCULADORA DE WINDOWS SERIA ASI...
  // Resultado := (Tiempo+(256*Cantidad))*1000;
  Result := False;
  c := 0;
  u := 0;
  DecimalSep := DecimalSeparator;
  DecimalSeparator := '.';

  try
    for i := 0 to tmpSubFile.Count-1 do
    begin
      if Pos(' \ ~:\', tmpSubFile[i]) > 0 then
      begin
        InitialTime := Round((StrToFloat(Trim(Copy(tmpSubFile[i], 3, Pos('\ ~:\', tmpSubFile[i]) - 3)))+(256*c))*1000);
        if InitialTime > u then
          u := InitialTime
        else
        begin
          u := InitialTime;
          Inc(c);
        end;
        if Pos(' \ ~:\', tmpSubFile[i+1]) = 0 Then
          FinalTime := Round((StrToFloat(Trim(Copy(tmpSubFile[i+1], 3, Length(tmpSubFile[i+1]))))+(256*c))*1000)
        else
          FinalTime := InitialTime + 2000;

        Text := Copy(tmpSubFile[i], Pos(' \ ~:\', tmpSubFile[i]) + 6, Length(tmpSubFile[i]));

        if (MaxDuration > 0) and ((FinalTime + ExtraTime) > MaxDuration) Then
          Subtitles.Add(InitialTime + ExtraTime, InitialTime + ExtraTime + MaxDuration, Text)
        else
          Subtitles.Add(InitialTime + ExtraTime, FinalTime + ExtraTime, Text);
      end;
    end;
  finally
    DecimalSeparator := DecimalSep;
    if Subtitles.Count > 0 then Result := True;
  end;
end;
