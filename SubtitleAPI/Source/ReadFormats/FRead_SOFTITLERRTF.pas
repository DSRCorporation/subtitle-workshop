// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: Softitler RTF subtitle format reading functionality

function FileToSubtitles_SOFTITLERRTF(var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; ExtraTime: Integer): Boolean;
var
  i, c        : Integer;
  InitialTime : Integer;
  FinalTime   : Integer;
  Text        : String;
begin
  Result := False;

  // Remove all RichText formatting from each line
  for i := tmpSubFile.Count-1 downto 0 do
  begin
    tmpSubFile[i] := Trim(RemoveRTFFormatting(tmpSubFile[i] + ' '));
    if tmpSubFile[i] = '' then
      tmpSubFile.Delete(i);
  end;

  try
    for i := 0 to tmpSubFile.Count-3 do
    begin
      InitialTime := StringToTime(tmpSubFile[i]);
      FinalTime   := StringToTime(tmpSubFile[i+1]);
      if (InitialTime > -1) and
         (FinalTime > -1) then
      begin
        Text := '';
        c := 2;
        while (i+c < (tmpSubFile.Count-1)) and
              (StringToTime(tmpSubFile[i+c+1]) = -1) do
        begin
          if Text <> '' then
            Text := Text + #13#10 + tmpSubFile[i+c] else
            Text := tmpSubFile[i+c];
          Inc(c);
        end;

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
