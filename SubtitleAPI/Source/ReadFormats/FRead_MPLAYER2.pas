// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: MPlayer2 subtitle format reading functionality

function FileToSubtitles_MPLAYER2(var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; ExtraTime: Integer): Boolean;
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
      if (Pos('[', tmpSubFile[i]) = 1) and
         (Pos(']', tmpSubFile[i]) > 1) and
         (StringCount('[',tmpSubFile[i], True) >= 2) and
         (StringCount(']',tmpSubFile[i], True) >= 2) and
         (IsInteger(Copy(tmpSubFile[i], 2, Pos(']', tmpSubFile[i]) - 2))) then
      begin
        InitialTime := StrToInt(Copy(tmpSubFile[i], 2, Pos(']', tmpSubFile[i]) - 2)) * 100;
        Text := Copy(tmpSubFile[i], SmartPos('[', tmpSubFile[i], True, 2) + 1, SmartPos(']', tmpSubFile[i], True, Pos(']', tmpSubFile[i]) + 1) - (SmartPos('[', tmpSubFile[i], True, 2) + 1));
        if IsInteger(Text) then
          FinalTime := StrToInt(Text) * 100
        else
          FinalTime := InitialTime + 2000;

        Text := ReplaceString(Copy(tmpSubFile[i], SmartPos(']', tmpSubFile[i], True, Pos(']', tmpSubFile[i]) + 1) + 1, Length(tmpSubFile[i])), '|', #13#10);

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
