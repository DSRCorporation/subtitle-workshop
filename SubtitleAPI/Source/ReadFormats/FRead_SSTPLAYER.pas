// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: Stream SubText Player subtitle format reading functionality

function FileToSubtitles_SSTPLAYER(var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; ExtraTime: Integer): Boolean;
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
      c := Pos(#9, tmpSubFile[i]);
      InitialTime := StrToIntDef(Copy(tmpSubFile[i], 1, c-1), -1);
      if InitialTime > -1 then
      begin
        FinalTime := StrToIntDef(Copy(tmpSubFile[i], c+1, SmartPos(#9, tmpSubFile[i], True, c+1) - (c+1)), -1);
        Text := Copy(tmpSubFile[i], SmartPos(#9, tmpSubFile[i], True, c+1) + 1, Length(tmpSubFile[i]));
        Text := Trim(ReplaceString(RemoveRTFFormatting(Text), '~', #13#10));

        while Pos('}', Text) > 0 do
          Delete(Text, Pos('}', Text), 1);
        Text := ReplaceString(Text, '~', #13#10);

        Text := Trim(Text);

        if Text <> '~' then
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
