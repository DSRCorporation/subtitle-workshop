// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: QuickTime Text subtitle format reading functionality

function FileToSubtitles_QUICKTIMETEXT(var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; ExtraTime: Integer): Boolean;
var
  i           : Integer;
  InitialTime : Integer;
  FinalTime   : Integer;
  Text        : String;
begin
  Result := False;
  try
    for i := 0 to tmpSubFile.Count-1 do
    begin
      InitialTime := StringToTime(Copy(tmpSubFile[i], 2, 11));
      if (i < tmpSubFile.Count-2) and
         (InitialTime > -1) then
      begin
        FinalTime := StringToTime(Copy(tmpSubFile[i+2], 2, 11));
        if FinalTime = -1 then FinalTime := InitialTime + 2000;

        if (InitialTime > -1) and (FinalTime > -1) and (Pos('[', tmpSubFile[i+1]) <> 1) and (Pos(']', tmpSubFile[i+1]) <> 13) then
        begin
          Text := tmpSubFile[i+1];

          if (MaxDuration > 0) and ((FinalTime + ExtraTime) > MaxDuration) Then
            Subtitles.Add(InitialTime + ExtraTime, InitialTime + ExtraTime + MaxDuration, Text)
          else
            Subtitles.Add(InitialTime + ExtraTime, FinalTime + ExtraTime, Text);
        end;
      end;
    end;
  finally
    if Subtitles.Count > 0 then Result := True;
  end;
end;
