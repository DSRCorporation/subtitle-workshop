// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: DVDSubtitle subtitle format reading functionality

function FileToSubtitles_DVDSUBTITLE(var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; ExtraTime: Integer): Boolean;
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
      if (SmartPos('{T ', tmpSubFile[i], False) = 1) and
         (TimeInFormat(Copy(tmpSubFile[i], 4, 11), 'hh:mm:ss:zz')) then
      begin
        InitialTime := StringToTime(Copy(tmpSubFile[i], 4, 11));
        c    := 1;
        Text := '';
        while (i+c < (tmpSubFile.Count-1)) and (tmpSubFile[i+c] <> '}') do
        begin
          If Text <> '' then
            Text := Text + #13#10 + tmpSubFile[i+c]
          else
            Text := tmpSubFile[i+c];
          Inc(c);
        end;
        c := 1;
        while (i+c < (tmpSubFile.Count-1)) and (SmartPos('{T ', tmpSubFile[i+c], False) = 0) do
          Inc(c);
        FinalTime := StringToTime(Copy(tmpSubFile[i+c], 4, 11));
        if FinalTime = -1 then FinalTime := InitialTime + 2000;


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
