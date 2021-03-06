// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: Cheetah subtitle format reading functionality

function FileToSubtitles_CHEETAH(var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; ExtraTime: Integer): Boolean;
var
  i, c        : Integer;
  InitialTime : Integer;
  FinalTime   : Integer;
  Text        : String;
begin
  Result := False;
  try
    for i := tmpSubFile.Count-1 downto 0 do
      if (Pos('*', tmpSubFile[i]) = 1) and (SmartPos('*t ', tmpSubFile[i], False) <> 1) then
        tmpSubFile.Delete(i);

    for i := 0 to tmpSubFile.Count-2 do
    begin
      If (TimeInFormat(Copy(tmpSubFile[i], 4, 11), 'hh:mm:ss:zz')) then
      begin
        c    := 1;
        Text := '';
        while (i+c < (tmpSubFile.Count-1)) and (Pos('*', tmpSubFile[i+c]) <> 1) do
        begin
          If Text <> '' then
            Text := Text + #13#10 + tmpSubFile[i+c]
          else
            Text := tmpSubFile[i+c];
          Inc(c);
        end;

        InitialTime := StringToTime(Copy(tmpSubFile[i], 4, 11));
        FinalTime   := StringToTime(Copy(tmpSubFile[i+c], 4, 11));

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
