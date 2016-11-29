// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: Sasami Script subtitle format reading functionality

function FileToSubtitles_SASAMISCRIPT(var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; ExtraTime: Integer): Boolean;
var
  i,c         : Integer;
  InitialTime : Integer;
  FinalTime   : Integer;
  Text        : String;
begin
  Result := False;
  try
    // Delete garbage lines...
    for i := tmpSubFile.Count-1 downto 0 do
      if ((Pos(';', tmpSubFile[i]) = 1) and (AnsiLowerCase(Copy(tmpSubFile[i], 1, 16)) <> ';set.time.start=')) or
         (Copy(tmpSubFile[i], 0, 2) = '//') then
        tmpSubFile.Delete(i);

    for i := 0 to tmpSubFile.Count-2 do
    begin
      if (Pos(';', tmpSubFile[i]) = 1) then
      begin
        InitialTime := StrToInt(Copy(tmpSubFile[i], 17, Length(tmpSubFile[i])));
        Text := '';
        c    := 1;
        while (i+c < (tmpSubFile.Count-1)) and (tmpSubFile[i+c][1] <> ';') do
        begin
          If Text <> '' then
            Text := Text + #13#10 + tmpSubFile[i+c]
          else
            Text := tmpSubFile[i+c];
          Inc(c);
        end;
        If Pos(';', tmpSubFile[i+c]) = 1 then
          FinalTime := StrToInt(Copy(tmpSubFile[i+c], 17, Length(tmpSubFile[i])))
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
