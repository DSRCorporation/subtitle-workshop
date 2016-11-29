// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: Sonic Scenarist subtitle format reading functionality

function FileToSubtitles_SONICSCENARIST(var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; FPS: Single; ExtraTime: Integer): Boolean;
  function DeleteDoubleTabs(const Line: String): String;
  var
    c: Integer;
  begin
    Result := Line;
    c := Pos(#9#9, Result);
    while c > 0 do
    begin
      Delete(Result, Pos(#9#9, Result), 1);
      c := Pos(#9#9, Result);
    end;
  end;
var
  i,c         : Integer;
  InitialTime : Integer;
  FinalTime   : Integer;
  Text        : String;
  tmpLine     : String;
begin
  Result := False;
  try
    for i := 0 to tmpSubFile.Count-1 do
    begin
      tmpLine := DeleteDoubleTabs(tmpSubFile[i]);

      c := Pos(#9, tmpLine);
      InitialTime := HHMMSSFFTimeToMS(Copy(tmpLine, c + 1, 11), FPS);
      c := SmartPos(#9, tmpLine, True, c+1);
      FinalTime := HHMMSSFFTimeToMS(Copy(tmpLine, c + 1, 11), FPS);
      c := SmartPos(#9, tmpLine, True, c+1);
      Text := Copy(tmpLine, c+1, Length(tmpLine));

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
