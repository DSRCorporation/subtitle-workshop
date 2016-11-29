// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: Captions Inc. subtitle format reading functionality

function FileToSubtitles_CAPTIONSINC(var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; ExtraTime: Integer): Boolean;
var
  i           : Integer;
  InitialTime : Integer;
  FinalTime   : Integer;
  Text        : String;
begin
  Result := False;
  try
    for i := 0 to tmpSubFile.Count-2 do
    begin
      if (TimeInFormat(Copy(tmpSubFile[i], 1, 11), 'hh:mm:ss:zz') and
         (TimeInFormat(Copy(tmpSubFile[i], 13, 11), 'hh:mm:ss:zz') and
         (Pos('{0 [1 ', tmpSubFile[i+1]) = 1))) then
      begin
        InitialTime := StringToTime(Copy(tmpSubFile[i], 1, 11));
        FinalTime   := StringToTime(Copy(tmpSubFile[i], 13, 11));
        Text        := Copy(tmpSubFile[i+1], 7, Length(tmpSubFile[i+1]));

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
