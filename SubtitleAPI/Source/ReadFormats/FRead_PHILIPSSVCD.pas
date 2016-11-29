// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: Philips SVCD Designer subtitle format reading functionality

function FileToSubtitles_PHILIPSSVCD(var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; ExtraTime: Integer): Boolean;
var
  i           : Integer;
  StartPos    : Integer;
  AfterList   : Boolean;
  InitialTime : Integer;
  FinalTime   : Integer;
  Text        : String;
begin
  Result := False;
  AfterList := False;
  try
    for i := 0 to tmpSubFile.Count-1 do
    begin
      if AfterList then
      begin
        if StringCount(':', tmpSubFile[i]) >= 6 then
        begin
          StartPos := 1;
          while TimeInFormat(Copy(tmpSubFile[i], StartPos, 11), 'hh:mm:ss:zz') = False do
            Inc(StartPos);
          Text        := Text + Copy(tmpSubFile[i], 1, StartPos - 2);
          InitialTime := StringToTime(Copy(tmpSubFile[i], StartPos, 11));
          FinalTime   := StringToTime(Copy(tmpSubFile[i], SmartPos(' ', tmpSubFile[i], True, StartPos) + 1, 11));

          if (MaxDuration > 0) and ((FinalTime + ExtraTime) > MaxDuration) Then
            Subtitles.Add(InitialTime + ExtraTime, InitialTime + ExtraTime + MaxDuration, Text)
          else
            Subtitles.Add(InitialTime + ExtraTime, FinalTime + ExtraTime, Text);

          Text := '';
        end
        else
        begin
          if (i < tmpSubFile.Count-1) then
            Text := Text + tmpSubFile[i] + #13#10;
        end;
      end
      else
      if SmartPos('[list]', tmpSubFile[i], False) = 1 then
        AfterList := True;
    end;
  finally
    if Subtitles.Count > 0 then Result := True;
  end;
end;
