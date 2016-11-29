// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: Inscriber CG subtitle format reading functionality

function FileToSubtitles_INSCRIBERCG(var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; ExtraTime: Integer): Boolean;
var
  i,c         : Integer;
  InitialTime : Integer;
  FinalTime   : Integer;
  Text        : String;
begin
  Result := False;
  try
    for i := 0 to tmpSubFile.Count-1 do
    begin
      if TimeInFormat(Copy(tmpSubFile[i], Length(tmpSubFile[i])-24, 11), 'hh:mm:ss:zz') and
         TimeInFormat(Copy(tmpSubFile[i], Length(tmpSubFile[i])-11, 11), 'hh:mm:ss:zz') then
      begin
        InitialTime := StringToTime(Copy(tmpSubFile[i], Length(tmpSubFile[i])-24, 11));
        FinalTime   := StringToTime(Copy(tmpSubFile[i], Length(tmpSubFile[i])-11, 11));
        Text := Copy(tmpSubFile[i], 5, Length(tmpSubFile[i])-30);

        c := 1;
        while (TimeInFormat(Copy(tmpSubFile[i-c], Length(tmpSubFile[i-c])-24, 11), 'hh:mm:ss:zz') = False) and
              (i-c > 0) do
        begin
          if tmpSubFile[i-c] = '@@9' then break;
          Text := Copy(tmpSubFile[i-c], 5, Length(tmpSubFile[i-c])) + #13#10 + Text;
          Inc(c);
        end;

        if (MaxDuration > 0) and ((FinalTime + ExtraTime) > MaxDuration) then
          Subtitles.Add(InitialTime + ExtraTime, InitialTime + ExtraTime + MaxDuration, Text)
        else
          Subtitles.Add(InitialTime + ExtraTime, FinalTime + ExtraTime, Text);
      end;
    end;
  finally
    if Subtitles.Count > 0 then Result := True;
  end;
end;
