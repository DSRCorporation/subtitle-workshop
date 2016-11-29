// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: SonicDVD Creator subtitle format reading functionality

function FileToSubtitles_SONICDVD(var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; FPS: Single; ExtraTime: Integer): Boolean;
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
      c    := 1;
      Text := '';
      InitialTime := HHMMSSFFTimeToMS(Copy(tmpSubFile[i], 7, 11), FPS);
      FinalTime   := HHMMSSFFTimeToMS(Copy(tmpSubFile[i], 20, 11), FPS);
      if (InitialTime > -1) and
         (FinalTime > -1) then
      begin
        Text := Copy(tmpSubFile[i], 33, Length(tmpSubFile[i]));
        while (i+c < (tmpSubFile.Count-1)) and
              (StringToTime(Copy(tmpSubFile[i+c], 7, 11)) = -1) and
              (StringToTime(Copy(tmpSubFile[i+c], 20, 11)) = -1) do
        begin
          Text := Text + #13#10 + tmpSubFile[i+c];
          Inc(c);
        end;

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
