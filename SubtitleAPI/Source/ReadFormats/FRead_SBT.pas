// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: SBT subtitle format reading functionality

function FileToSubtitles_SBT(var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; ExtraTime: Integer): Boolean;
var
  i,c         : Integer;
  InitialTime : Integer;
  FinalTime   : Integer;
  Text        : String;
begin
  Result := False;
  try
    for i := 0 to tmpSubFile.Count-2 do
    begin
      InitialTime := StringToTime(tmpSubFile[i]);
      if (InitialTime > -1) then
      begin
        FinalTime := StringToTime(tmpSubFile[i+1]);
        if FinalTime = -1 then FinalTime := InitialTime + 2000;
        Text := '';
        c    := 2;
        while (i+c <= (tmpSubFile.Count-1)) and (StringToTime(tmpSubFile[i+c]) = -1) do
        begin
          If Text <> '' then
            Text := Text + #13#10 + tmpSubFile[i+c]
          else
            Text := tmpSubFile[i+c];
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
