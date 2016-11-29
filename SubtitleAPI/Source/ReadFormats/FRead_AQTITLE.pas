// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: AQTitle subtitle format reading functionality

function FileToSubtitles_AQTITLE(var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; FPS: Single; ExtraTime: Integer): Boolean;
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
      if (Pos('-->> ', tmpSubFile[i]) = 1) and
         (IsInteger(Copy(tmpSubFile[i], 6, Length(tmpSubFile[i])))) then
      begin
        c    := 1;
        Text := '';
        InitialTime := FramesToTime(StrToIntDef(Copy(tmpSubFile[i], 6, 6), -1), FPS);
        while (i+c < (tmpSubFile.Count-1)) and (Copy(tmpSubFile[i+c], 1, 5) <> '-->> ') do
        begin
          If Text <> '' then
            Text := Text + #13#10 + tmpSubFile[i+c]
          else
            Text := tmpSubFile[i+c];
          Inc(c);
        end;
        If (IsInteger(Copy(tmpSubFile[i+c], 6, 2))) then
          FinalTime := FramesToTime(StrToIntDef(Copy(tmpSubFile[i+c], 6, 6), -1), FPS)
        else
          FinalTime := InitialTime + 2000;

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
