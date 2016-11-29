// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: Sofni subtitle format reading functionality

function FileToSubtitles_SOFNI(var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; ExtraTime: Integer): Boolean;
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
      InitialTime := StringToTime(Copy(tmpSubFile[i], 1, 11));
      FinalTime   := StringToTime(Copy(tmpSubFile[i], 13, 11));
      if (InitialTime = -1) and
         (FinalTime = -1) then
      begin
        if Text = '' then
          Text := tmpSubFile[i]
        else
          Text := Text + #13#10 + tmpSubFile[i];
      end
      else if (InitialTime > -1) and (FinalTime > -1) and (Pos('\', tmpSubFile[i]) = 12) then
      begin
        if (MaxDuration > 0) and ((FinalTime + ExtraTime) > MaxDuration) Then
          Subtitles.Add(InitialTime + ExtraTime, InitialTime + ExtraTime + MaxDuration, Text)
        else
          Subtitles.Add(InitialTime + ExtraTime, FinalTime + ExtraTime, Text);

        Text := '';
      end;
    end;
  finally
    if Subtitles.Count > 0 then Result := True;
  end;
end;
