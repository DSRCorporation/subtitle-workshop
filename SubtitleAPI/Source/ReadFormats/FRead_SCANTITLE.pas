// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: Scanlite subtitle format reading functionality

// by Bedazzle 2005.11.18 start
function FileToSubtitles_SCANTITLE(var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; ExtraTime: Integer): Boolean;
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
      InitialTime := StringToTime(Copy(tmpSubFile[i], length(tmpSubFile[i])-24, 11));
      FinalTime   := StringToTime(Copy(tmpSubFile[i], length(tmpSubFile[i])-10, 11));
      if (InitialTime > -1) and (FinalTime > -1) then
      begin
        c    := 1;
        Text := '';
        while ((i+c <= (tmpSubFile.Count-1)) and
        ( Copy(tmpSubFile[i+c], length(tmpSubFile[i+c])-2, 1)<>':') and
        ( Copy(tmpSubFile[i+c], length(tmpSubFile[i+c])-5, 1)<>':') and
        ( Copy(tmpSubFile[i+c], length(tmpSubFile[i+c])-8, 1)<>':') and
        ( Copy(tmpSubFile[i+c], length(tmpSubFile[i+c])-16, 1)<>':') and
        ( Copy(tmpSubFile[i+c], length(tmpSubFile[i+c])-19, 1)<>':') and
        ( Copy(tmpSubFile[i+c], length(tmpSubFile[i+c])-22, 1)<>':') and
        ( Copy(tmpSubFile[i+c], length(tmpSubFile[i+c])-13, 3)<>'   ')
        ) do
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
// by Bedazzle 2005.11.18 end
