// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: SubViewer 1.0 subtitle format reading functionality

function FileToSubtitles_SUBVIEWER1(var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; ExtraTime: Integer): Boolean;
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
      if (Pos('[', tmpSubFile[i]) = 1) and (Pos(']',tmpSubFile[i]) = 10) then
        InitialTime := StringToTime(Copy(tmpSubFile[i], 2, 8))
      else
        InitialTime := StringToTime(tmpSubFile[i]);
      if (InitialTime > -1) then
      begin
        FinalTime := -1;

        if (i+2 <= (tmpSubFile.Count-1)) then
          if (Pos('[', tmpSubFile[i+2]) = 1) and (Pos(']',tmpSubFile[i+2]) = 10) then
            FinalTime := StringToTime(Copy(tmpSubFile[i+2], 2, 8))
          else
            FinalTime := StringToTime(tmpSubFile[i+2]);

        if FinalTime = -1 then FinalTime := InitialTime + 2000;

        if (i+1 <= (tmpSubFile.Count-1)) then
          Text := ReplaceString(tmpSubFile[i+1], '|', #13#10)
        else
          Break;

        if (i+1 <= (tmpSubFile.Count-1)) and (StringToTime(Copy(tmpSubFile[i+1], 2, 8)) = -1) and (SmartPos('[end]', tmpSubFile[i+1], False) <> 1) then
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
