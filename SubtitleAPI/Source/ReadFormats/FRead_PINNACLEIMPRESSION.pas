// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: Pinnacle Impression subtitle format reading functionality

function FileToSubtitles_PINNACLEIMPRESSION(var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; FPS: Single; ExtraTime: Integer): Boolean;
var
  i           : Integer;
  InitialTime : Integer;
  FinalTime   : Integer;
  Text        : String;
begin
  Result := False;
  try
    for i := 0 to tmpSubFile.Count-1 do
    begin
      InitialTime := HHMMSSFFTimeToMS(Copy(tmpSubFile[i], 1, 11), FPS);
      FinalTime   := HHMMSSFFTimeToMS(Copy(tmpSubFile[i], 13, 11), FPS);
      Text        := Copy(tmpSubFile[i], 25, Length(tmpSubFile[i]));

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
