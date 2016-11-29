// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: Captions 32 subtitle format reading functionality

function FileToSubtitles_CAPTIONS32(var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; ExtraTime: Integer): Boolean;
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
      InitialTime := StringToTime(Copy(tmpSubFile[i], 1, 11));
      FinalTime   := StringToTime(Copy(tmpSubFile[i], 15, 11));
      if (InitialTime > -1) and (FinalTime > -1) then
      begin
        Text := Trim(Copy(tmpSubFile[i], 29, 33));
        if Length(tmpSubFile[i]) > 62 then
          Text := Text + #13#10 + Trim(Copy(tmpSubFile[i], 63, Length(tmpSubFile[i])-62));


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
