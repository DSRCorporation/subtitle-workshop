// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: DKS Subtitle Format subtitle format reading functionality

function FileToSubtitles_DKS(var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; ExtraTime: Integer): Boolean;
var
  i           : Integer;
  InitialTime : Integer;
  FinalTime   : Integer;
  Text        : String;
begin
  Result    := False;
  FinalTime := -1;
  try
    for i := 0 to tmpSubFile.Count-1 do
    begin
      If (Pos('[', tmpSubFile[i]) = 1) and
         (Pos(']', tmpSubFile[i]) = 10) and
         (TimeInFormat(Copy(tmpSubFile[i], 2, 8), 'hh:mm:ss')) then
      begin
        InitialTime := StringToTime(Copy(tmpSubFile[i], 2, 8));
        if (i <= tmpSubFile.Count-1) then
          FinalTime := StringToTime(Copy(tmpSubFile[i+1], 2, 8));
        if FinalTime = -1 then FinalTime := InitialTime + 2000;

        Text := ReplaceString(Copy(tmpSubFile[i], 11, Length(tmpSubFile[i])), '[br]', #13#10);

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
