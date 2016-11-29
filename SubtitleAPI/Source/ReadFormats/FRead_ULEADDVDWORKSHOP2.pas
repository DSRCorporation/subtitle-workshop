// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: Ulead DVD Workshop 2.0 subtitle format reading functionality

function FileToSubtitles_ULEADDVDWORKSHOP2(var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; FPS: Single; ExtraTime: Integer; alternative: boolean): Boolean;
var
  i           : Integer;
  InitialTime : Integer;
  FinalTime   : Integer;
  Text        : String;
  tmpStr      : String;
begin
  Result := False;
  try
    i := 1;
    repeat
      Inc(i);
    until (LowerCase(tmpSubFile[i]) = '#subtitle text begin');
    Inc(i);

    if (i < tmpSubFile.Count-1) then
    begin
      while (LowerCase(tmpSubFile[i]) <> '#subtitle text end') and (i < tmpSubFile.Count-2) do
      begin
        tmpStr := Copy(tmpSubFile[i], Pos(' ', tmpSubFile[i])+1, Length(tmpSubFile[i]));

        if (alternative = FALSE) then
        begin  // "00;00;00;00"
          InitialTime := HHMMSSFFTimeToMS(Copy(tmpStr, 1, 11), FPS);
          FinalTime   := HHMMSSFFTimeToMS(Copy(tmpStr, 13, 11), FPS);
        end
        else
        begin  // "00:00:00.00"
          InitialTime := HHMMSSFFTimeToMS(Copy(tmpStr, 1,  2)+';' + Copy(tmpStr, 4,  2)+';' + Copy(tmpStr, 7,  2)+';' + Copy(tmpStr, 10, 2), FPS);
          FinalTime   := HHMMSSFFTimeToMS(Copy(tmpStr, 13, 2)+';' + Copy(tmpStr, 16, 2)+';' + Copy(tmpStr, 19, 2)+';' + Copy(tmpStr, 22, 2), FPS);
        end;

        Inc(i);
        Text := tmpSubFile[i];
        Inc(i);

        while (Copy(tmpSubFile[i], 1, 1) <> '#') do
        begin
          Text := Text + #13#10 + tmpSubFile[i];
          Inc(i);
        end;
        Dec(i);

        if (InitialTime > -1) and (FinalTime > -1) then
          if (MaxDuration > 0) and ((FinalTime + ExtraTime) > MaxDuration) Then
            Subtitles.Add(InitialTime + ExtraTime, InitialTime + ExtraTime + MaxDuration, Text)
          else
            Subtitles.Add(InitialTime + ExtraTime, FinalTime + ExtraTime, Text);

        Inc(i);
      end;
    end;
  finally
    if Subtitles.Count > 0 then Result := True;
  end;
end;
