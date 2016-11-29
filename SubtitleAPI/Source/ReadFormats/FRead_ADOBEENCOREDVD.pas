// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: Adobe Encore DVD (Old) subtitle format reading functionality

function FileToSubtitles_ADOBEENCOREDVD (var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; FPS: Single; ExtraTime: Integer): Boolean;
var
  i           : Integer;
  InitialTime : Integer;
  FinalTime   : Integer;
  Text        : String;
begin
  Result := False;
  try

    i := 0;
    while i < tmpSubFile.Count do
    begin
      if (TimeInFormat(Copy(tmpSubFile[i], 1, 11), 'hh:mm:ss:ff')) and
         (TimeInFormat(Copy(tmpSubFile[i], 13, 11), 'hh:mm:ss:ff')) then
      begin
        InitialTime := HHMMSSFFTimeToMS(Copy(tmpSubFile[i], 1, 11), FPS);
        FinalTime   := HHMMSSFFTimeToMS(Copy(tmpSubFile[i], 13, 11), FPS);
        Text := Copy(tmpSubFile[i], 25, Length(tmpSubFile[i]));

        Inc(i);
        while (i < tmpSubFile.Count) and
              (TimeInFormat(Copy(tmpSubFile[i], 1, 11), 'hh:mm:ss:ff') = False) and
              (TimeInFormat(Copy(tmpSubFile[i], 13, 11), 'hh:mm:ss:ff') = False) do
        begin
          if Text <> '' then
            Text := Text + #13#10 + tmpSubFile[i] else
            Text := tmpSubFile[i];
          Inc(i);
        end;
        Dec(i);

        if (InitialTime > -1) and (FinalTime > -1) then
          if (MaxDuration > 0) and ((FinalTime + ExtraTime) > MaxDuration) Then
            Subtitles.Add(InitialTime + ExtraTime, InitialTime + ExtraTime + MaxDuration, Text)
          else
            Subtitles.Add(InitialTime + ExtraTime, FinalTime + ExtraTime, Text);
      end;

      Inc(i);
    end;

  finally
    if Subtitles.Count > 0 then Result := True;
  end;
end;
