// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: SubViewer 2.0 subtitle format reading functionality

function FileToSubtitles_SUBVIEWER2(var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; ExtraTime: Integer): Boolean;
var
  i           : Integer;
  InitialTime : Integer;
  FinalTime   : Integer;
  Text        : String;
begin
  Result := False;
  try

    i := 0;
    while i < tmpSubFile.Count do
    begin
      InitialTime := StringToTime(Copy(tmpSubFile[i], 1, 11));
      FinalTime   := StringToTime(Copy(tmpSubFile[i], 13, 11));
      if (InitialTime > -1) and (FinalTime > -1) then
      begin
        Inc(i);
        if (StringToTime(Copy(tmpSubFile[i], 1, 11)) > -1) then
        begin
          InitialTime := StringToTime(Copy(tmpSubFile[i], 1, 11));
          FinalTime   := StringToTime(Copy(tmpSubFile[i], 13, 11));
          Inc(i);
        end;
        if (i < tmpSubFile.Count) then
        begin
          Text := ReplaceString(tmpSubFile[i], '[br]', #13#10);
          if (MaxDuration > 0) and ((FinalTime + ExtraTime) > MaxDuration) Then
            Subtitles.Add(InitialTime + ExtraTime, InitialTime + ExtraTime + MaxDuration, Text)
          else
            Subtitles.Add(InitialTime + ExtraTime, FinalTime + ExtraTime, Text);
        end;
      end;
      Inc(i);
    end;

  finally
    if Subtitles.Count > 0 then Result := True;
  end;
end;
