// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: TMPlayer subtitle format reading functionality

function FileToSubtitles_TMPLAYER(var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; ExtraTime: Integer): Boolean;
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
      InitialTime := 0;
      FinalTime   := 0;
      Text        := '';

      // TMPlayer MultiLine format
      If ((StringCount(':', tmpSubFile[i]) >= 2) and
         (Pos(',', tmpSubFile[i]) = 9) and
         (Pos('=', tmpSubFile[i]) = 11) and
         (TimeInFormat(Copy(tmpSubFile[i], 1, 8), 'hh:mm:ss'))) then
         begin
           InitialTime := StringToTime(Copy(tmpSubFile[i], 1, 8));

           If (i+2 < tmpSubFile.Count) and (TimeInFormat(Copy(tmpSubFile[i+2], 1, 8), 'hh:mm:ss')) and (Copy(tmpSubFile[i+2],9,2) = ',1') then
             FinalTime := StringToTime(Copy(tmpSubFile[i+2], 1, 8))
           else
             FinalTime := InitialTime + 2000;

           if Copy(tmpSubFile[i], 9, 2) = ',1' then
             Text := Copy(tmpSubFile[i], 12, Length(tmpSubFile[i]));

           If (i+1 <= tmpSubFile.Count-1) and
              (Copy(tmpSubFile[i+1], 1, 8) = Copy(tmpSubFile[i],0,8)) and
              (Copy(tmpSubFile[i+1], 9, 2) = ',2') and
              (Copy(tmpSubFile[i+1], 12, Length(tmpSubFile[i+1])) <> '') then
              Text := Text + #13#10 + Copy(tmpSubFile[i+1], 12, Length(tmpSubFile[i+1]));

        end
        else

      // TMPlayer Time Structure 1
      if ((StringCount(':', tmpSubFile[i]) >= 3) and
         (Pos(':', tmpSubFile[i]) = 3) and
         (TimeInFormat(Copy(tmpSubFile[i], 1, 8), 'hh:mm:ss'))) then
         begin
           InitialTime := StringToTime(Copy(tmpSubFile[i], 1, 8));

           If (i+1 <= tmpSubFile.Count-1) and (TimeInFormat(Copy(tmpSubFile[i+1], 1, 8), 'hh:mm:ss')) then
             FinalTime := StringToTime(Copy(tmpSubFile[i+1], 1, 8))
           else
             FinalTime := InitialTime + 2000;

           Text := ReplaceString(Copy(tmpSubFile[i], 10, Length(tmpSubFile[i])), '|', #13#10);
         end
         else

      // TMPlayer Time Structure 2
      if ((StringCount(':', tmpSubFile[i]) >= 3) and
         (Pos(':', tmpSubFile[i]) = 2) and
         (TimeInFormat(Copy(tmpSubFile[i], 1, 7), 'h:mm:ss'))) then
         begin
           InitialTime := StringToTime(Copy(tmpSubFile[i], 1, 7));

           If (i+1 <= tmpSubFile.Count-1) and (TimeInFormat(Copy(tmpSubFile[i+1], 1, 7), 'h:mm:ss')) then
             FinalTime := StringToTime(Copy(tmpSubFile[i+1], 1, 7))
           else
             FinalTime := InitialTime + 2000;

           Text := ReplaceString(Copy(tmpSubFile[i], 9, Length(tmpSubFile[i])), '|', #13#10);
         end
         else

      // TMPlayer+ Time Structure 1
      if ((StringCount(':', tmpSubFile[i]) >= 2) and
         (Pos(':', tmpSubFile[i]) = 3) and
         (Pos('=',tmpSubFile[i]) = 9) and
         (TimeInFormat(Copy(tmpSubFile[i], 1, 8), 'hh:mm:ss'))) then
         begin
           InitialTime := StringToTime(Copy(tmpSubFile[i], 1, 8));

           If (i+1 <= tmpSubFile.Count-1) and (TimeInFormat(Copy(tmpSubFile[i+1], 1, 8), 'hh:mm:ss')) then
             FinalTime := StringToTime(Copy(tmpSubFile[i+1], 1, 8))
           else
             FinalTime := InitialTime + 2000;

           Text := ReplaceString(Copy(tmpSubFile[i], 10, Length(tmpSubFile[i])), '|', #13#10);
         end
         else

      // TMPlayer+ Time Structure 2
      if ((StringCount(':', tmpSubFile[i]) >= 2) and
         (Pos(':', tmpSubFile[i]) = 2) and
         (TimeInFormat(Copy(tmpSubFile[i], 1, 7), 'h:mm:ss'))) then
         begin
           InitialTime := StringToTime(Copy(tmpSubFile[i], 1, 7));

           If (i+1 <= tmpSubFile.Count-1) and (TimeInFormat(Copy(tmpSubFile[i+1], 1, 7), 'h:mm:ss')) then
             FinalTime := StringToTime(Copy(tmpSubFile[i+1], 1, 7))
           else
             FinalTime := InitialTime + 2000;

           Text := ReplaceString(Copy(tmpSubFile[i], 9, Length(tmpSubFile[i])), '|', #13#10);
         end;

      if (InitialTime > -1) and (FinalTime > -1) then
        if (MaxDuration > 0) and ((FinalTime + ExtraTime) > MaxDuration) Then
          Subtitles.Add(InitialTime + ExtraTime, InitialTime + ExtraTime + MaxDuration, Text)
        else
          Subtitles.Add(InitialTime + ExtraTime, FinalTime + ExtraTime, Text);
    end;
  finally
    if Subtitles.Count > 0 then Result := True;
  end;
end;
