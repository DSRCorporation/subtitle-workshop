// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: MAC DVD Studio Pro subtitle format reading functionality

function FileToSubtitles_MACDVDSTUDIOPRO(var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; FPS: Single; ExtraTime: Integer): Boolean;
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
      InitialTime := StringToTime(Copy(tmpSubFile[i], 1, 8));
      FinalTime   := StringToTime(Copy(tmpSubFile[i], 13, 8));

      if IsInteger(Copy(tmpSubFile[i], 10, 2)) then
        InitialTime := InitialTime + FramesToTime(StrToInt(Copy(tmpSubFile[i], 10, 2)), FPS);
      if IsInteger(Copy(tmpSubFile[i], 22, 2)) then
        FinalTime := FinalTime + FramesToTime(StrToInt(Copy(tmpSubFile[i], 22, 2)), FPS);

      Text := ReplaceString(Copy(tmpSubFile[i], 25, Length(tmpSubFile[i])), '<P>', #13#10);

      if (InitialTime > -1) and (FinalTime > -1) and (Text <> '') then
      begin
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
