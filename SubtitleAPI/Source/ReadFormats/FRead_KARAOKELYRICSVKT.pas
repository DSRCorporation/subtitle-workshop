// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: Karaoke Lyrics VKT subtitle format reading functionality

function FileToSubtitles_KARAOKELYRICSVKT(var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; ExtraTime: Integer): Boolean;
var
  i           : Integer;
  InitialTime : Integer;
  FinalTime   : Integer;
  Text        : String;
begin
  Result := False;
  try
    for i := 0 to tmpSubFile.Count-1 do
      if Copy(tmpSubFile[i], 1, 1) = '{' then
      begin
        InitialTime := StrToInt(Copy(tmpSubFile[i], 2, Pos(' ', tmpSubFile[i]) - 2))*10;
        if (i+1 <= (tmpSubFile.Count-1)) and (Copy(tmpSubFile[i+1], 1, 1) = '{') then
          FinalTime := StrToInt(Copy(tmpSubFile[i+1], 2, Pos(' ', tmpSubFile[i+1]) - 2))*10
        else
          FinalTime := InitialTime + 2000;

        Text := Copy(tmpSubFile[i], Pos(' ', tmpSubFile[i]) + 1, LastDelimiter('}', tmpSubFile[i]) - (Pos(' ', tmpSubFile[i]) + 1));

        if (InitialTime > -1) and (FinalTime > -1) then
          if (MaxDuration > 0) and ((FinalTime + ExtraTime) > MaxDuration) Then
            Subtitles.Add(InitialTime + ExtraTime, InitialTime + ExtraTime + MaxDuration, Text)
          else
            Subtitles.Add(InitialTime + ExtraTime, FinalTime + ExtraTime, Text);
      end;
  finally
    if Subtitles.Count > 0 then Result := True;
  end;
end;
