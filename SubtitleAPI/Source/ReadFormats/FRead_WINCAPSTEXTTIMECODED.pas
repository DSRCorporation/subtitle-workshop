// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: Wincaps text timecoded subtitle format reading functionality

function FileToSubtitles_WincapsTextTimecoded(var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; FPS: Single; ExtraTime: Integer): Boolean;
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
      c    := 1;
      Text := '';
      InitialTime := HHMMSSFFTimeToMS(Copy(tmpSubFile[i], 6, 11), FPS);
      FinalTime   := HHMMSSFFTimeToMS(Copy(tmpSubFile[i], 18, 11), FPS);

      if (InitialTime > -1) and (FinalTime > -1) then
      begin
        Text := tmpSubFile[i+c];
        while (i+c+1 < (tmpSubFile.Count-1)) and
              (StringToTime(Copy(tmpSubFile[i+c+1], 6, 11)) = -1) and
              (StringToTime(Copy(tmpSubFile[i+c+1], 18, 11)) = -1) do
        begin
          Text := Text + #13#10 + tmpSubFile[i+c+1];
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

{
123456789_123456789_123456789_123456789_
0001 01:01:13:16 01:01:16:06

Salutations, snack.

0002 01:01:17:12 01:01:19:12
}
{
123456789_123456789_123456789_123456789_
0001  00:00:45:06  00:00:48:13  [ Girl ] People once believed
that when someone dies...

0002  00:00:48:15  00:00:52:18  a crow carries their soul
to the land of the dead.

0003  00:00:52:20  00:00:56:00  But sometimes,
something so bad happens...
}
