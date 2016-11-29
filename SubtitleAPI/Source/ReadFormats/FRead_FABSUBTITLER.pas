// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: FAB Subtitler subtitle format reading functionality

function FileToSubtitles_FABSUBTITLER(var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; FPS: Single; ExtraTime: Integer): Boolean;
var
  i,c         : Integer;
  InitialTime : Integer;
  FinalTime   : Integer;
  Text        : String;
begin
  Result := False;
  try
    for i := 0 to tmpSubFile.Count-1 do
    begin
      InitialTime := StringToTime(Copy(tmpSubFile[i], 1, 8));
      FinalTime   := StringToTime(Copy(tmpSubFile[i], 14, 8));

      if IsInteger(Copy(tmpSubFile[i], 10, 2)) then
        InitialTime := InitialTime + FramesToTime(StrToInt(Copy(tmpSubFile[i], 10, 2)), FPS);
      if IsInteger(Copy(tmpSubFile[i], 23, 2)) then
        FinalTime := FinalTime + FramesToTime(StrToInt(Copy(tmpSubFile[i], 23, 2)), FPS);

      c    := 1;
      Text := '';
      while (i+c <= (tmpSubFile.Count-1)) and
            (StringToTime(Copy(tmpSubFile[i+c], 1, 8)) = -1) and
            (StringToTime(Copy(tmpSubFile[i+c], 14, 8)) = -1) do
      begin
        If Text <> '' then
          Text := Text + #13#10 + tmpSubFile[i+c]
        else
          Text := tmpSubFile[i+c];
        Inc(c);
      end;

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
