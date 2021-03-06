// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: OVR Script subtitle format reading functionality

function FileToSubtitles_OVRScript(var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; ExtraTime: Integer): Boolean;
var
  i           : Integer;
  InitialTime : Integer;
  FinalTime   : Integer;
  Text        : String;
begin
  //00:00:03:00 Text//Text
  //00:00:08:00
  Result    := False;
  FinalTime := -1;
  try
    for i := 0 to tmpSubFile.Count-1 do
    begin
      if TimeInFormat(Copy(tmpSubFile[i], 1, 11), 'hh:mm:ss:zz')
      and(Copy(tmpSubFile[i], 12, 1) = ' ') //added by adenry 2013.04.12
      then
      begin
        InitialTime := StringToTime(Copy(tmpSubFile[i], 1, 11));
        if (i <= tmpSubFile.Count-1) then
          FinalTime := StringToTime(Copy(tmpSubFile[i+1], 1, 11));
        if FinalTime = -1 then FinalTime := InitialTime + 2000;

        Text := ReplaceString(Copy(tmpSubFile[i], 13, Length(tmpSubFile[i])-12), '//', #13#10);

        if (MaxDuration > 0) and ((FinalTime + ExtraTime) > MaxDuration) then
          Subtitles.Add(InitialTime + ExtraTime, InitialTime + ExtraTime + MaxDuration, Text)
        else
          Subtitles.Add(InitialTime + ExtraTime, FinalTime + ExtraTime, Text);
      end;
    end;
  finally
    if Subtitles.Count > 0 then Result := True;
  end;
end;
