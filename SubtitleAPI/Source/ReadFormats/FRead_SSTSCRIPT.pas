// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: Stream SubText Script subtitle format reading functionality

function FileToSubtitles_SSTSCRIPT(var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; ExtraTime: Integer): Boolean;
var
  i, c        : Integer;
  InitialTime : Integer;
  FinalTime   : Integer;
  Text        : String;
begin
  Result := False;
  try
    for i := 0 to tmpSubFile.Count-1 do
    begin
      if (StringCount(#9, tmpSubFile[i]) = 5) then
      begin
        c := SmartPos(#9, tmpSubFile[i], True, Pos(#9, tmpSubFile[i]) + 1) + 1;
        InitialTime := StringToTime(Copy(tmpSubFile[i], c, SmartPos(#9, tmpSubFile[i], True, c) - c));
        c := SmartPos(#9, tmpSubFile[i], True, c + 1) + 1;
        FinalTime := StringToTime(Copy(tmpSubFile[i], c, SmartPos(#9, tmpSubFile[i], True, c) - c));
        c := SmartPos(#9, tmpSubFile[i], True, c + 1) + 1;
        Text := ReplaceString(Copy(tmpSubFile[i], c, SmartPos(#9, tmpSubFile[i], True, c) - c), '~', #13#10);

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
