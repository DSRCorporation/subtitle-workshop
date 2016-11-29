// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: MacSUB subtitle format reading functionality

function FileToSubtitles_MACSUB(var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; FPS: Single; ExtraTime: Integer): Boolean;
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
      If (Pos('/', tmpSubFile[i]) = 1) and
         (IsInteger(Copy(tmpSubFile[i], 2, Length(tmpSubFile[i])))) then
      begin
        InitialTime := FramesToTime(StrToInt(Copy(tmpSubFile[i], 2, Length(tmpSubFile[i]))), FPS);
        c    := 1;
        Text := '';
        while (i+c <= (tmpSubFile.Count-1)) and (Pos('/', tmpSubFile[i+c]) <> 1) do
        begin
          If Text <> '' then
            Text := Text + #13#10 + tmpSubFile[i+c]
          else
            Text := tmpSubFile[i+c];
          Inc(c);
        end;

        If (i+c <= (tmpSubFile.Count-1)) and (IsInteger(Copy(tmpSubFile[i+c], 2, Length(tmpSubFile[i+c])))) then
          FinalTime := FramesToTime(StrToInt(Copy(tmpSubFile[i+c], 2, Length(tmpSubFile[i+c]))), FPS)
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
