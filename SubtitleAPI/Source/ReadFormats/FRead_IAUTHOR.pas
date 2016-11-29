// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: I-Author Script subtitle format reading functionality

function FileToSubtitles_IAUTHOR(var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; ExtraTime: Integer): Boolean;
var
  i, c, u     : Integer;
  InitialTime : Integer;
  FinalTime   : Integer;
  DecimalSep  : Char;
  Text        : String;
begin
  Result := False;

  c := 0;
  u := 0;
  DecimalSep := DecimalSeparator;
  DecimalSeparator := '.';

  try
    for i := tmpSubFile.Count-1 downto 0 do
    begin
      if (SmartPos('BMPFILE:', tmpSubFile[i], False) = 0) and
         ((SmartPos('TIME:', tmpSubFile[i], False) = 1) and ((SmartPos('DISABLE_OGT', tmpSubFile[i], False) = 0))) or
         (Pos('*', tmpSubFile[i]) = 1) then
        tmpSubFile.Delete(i);
    end;

    for i := 0 to tmpSubFile.Count-1 do
    begin
      if (SmartPos('BMPFILE:', tmpSubFile[i], False) = 1) then
      begin
        Text := Trim(Copy(tmpSubFile[i], 9, Length(tmpSubFile[i])));
        if (SmartPos('STARTTIME:', tmpSubFile[i+1], False) = 1) then
        begin
          InitialTime := Round((StrToFloat(Trim(Copy(tmpSubFile[i+1], 11, Length(tmpSubFile[i+1]))))+(256*c))*1000);

          if InitialTime > u then
            u := InitialTime
          else
          begin
            u := InitialTime;
            Inc(c);
          end;
          if (SmartPos('TIME:', tmpSubFile[i+2], False) = 1) then
            FinalTime := Round((StrToFloat(Trim(Copy(tmpSubFile[i+2], 6, Pos(' ', tmpSubFile[i+2]))))+(256*c))*1000)
          else
            FinalTime := InitialTime + 2000;


          if (MaxDuration > 0) and ((FinalTime + ExtraTime) > MaxDuration) Then
            Subtitles.Add(InitialTime + ExtraTime, InitialTime + ExtraTime + MaxDuration, Text)
          else
            Subtitles.Add(InitialTime + ExtraTime, FinalTime + ExtraTime, Text);
        end;
      end;
    end;
  finally
    DecimalSeparator := DecimalSep;
    if Subtitles.Count > 0 then Result := True;
  end;
end;
