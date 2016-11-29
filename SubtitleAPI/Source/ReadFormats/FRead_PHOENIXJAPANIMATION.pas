// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: Phoenix Japanimation Society subtitle format reading functionality

function FileToSubtitles_PHOENIXJAPANIMATION(var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; FPS: Single; ExtraTime: Integer): Boolean;
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
      If (IsInteger(Copy(tmpSubFile[i], 1, Pos(',',tmpSubFile[i]) - 1))) and
         (Pos('"', tmpSubFile[i]) > 0) and
         (StringCount(',', Copy(tmpSubFile[i], 1, Pos('"', tmpSubFile[i]) - 1)) = 2) and
         (StringCount('"', tmpSubFile[i]) >= 2) then
      begin
        InitialTime := FramesToTime(StrToInt(Copy(tmpSubFile[i], 0, Pos(',', tmpSubFile[i])-1)), FPS);
        FinalTime   := FramesToTime(StrToInt(Trim(Copy(tmpSubFile[i], Pos(',', tmpSubFile[i]) + 1, SmartPos(',', tmpSubFile[i], True, Pos(',', tmpSubFile[i]) + 1) - (Pos(',', tmpSubFile[i]) + 1)))), FPS);
        Text        := ReplaceString(Copy(tmpSubFile[i], Pos('"', tmpSubFile[i]) + 1, Length(tmpSubFile[i]) - (Pos('"', tmpSubFile[i]) + 1)), '|', #13#10);

        if (MaxDuration > 0) and ((FinalTime + ExtraTime) > MaxDuration) Then
          Subtitles.Add(InitialTime + ExtraTime, InitialTime + ExtraTime + MaxDuration, Text)
        else
          Subtitles.Add(InitialTime + ExtraTime, FinalTime + ExtraTime, Text);
      end;
    end;
  finally
    if Subtitles.Count > 0 then Result := True;
  end;
end;
