// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: Panimator subtitle format reading functionality

function FileToSubtitles_PANIMATOR(var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; ExtraTime: Integer): Boolean;
var
  i, c, x     : Integer;
  InitialTime : Integer;
  FinalTime   : Integer;
  Text        : String;
begin
  Result := False;
  try
    i := 0;
    while (i <= tmpSubFile.Count-1) do
    begin
      c := 1;
      if (Pos('/c', tmpSubFile[i]) = 1) or (i+1 < (tmpSubFile.Count-1)) and (Pos('/c', tmpSubFile[i+1]) = 1) then
      begin
        Inc(i);
        Continue;
      end
      else if (Pos('/d ', tmpSubFile[i]) = 1) and
              (IsInteger(Copy(tmpSubFile[i], 4, SmartPos(' ', tmpSubFile[i], False, 4)-4))) then
      begin
        x := SmartPos(' ', tmpSubFile[i], False, 4);
        InitialTime := (StrToInt(Copy(tmpSubFile[i], 4, x-4))*1000) +
                        StrToInt(Copy(tmpSubFile[i], x+1, Length(tmpSubFile[i])));

        c    := 1;
        Text := '';
        while (i+c < (tmpSubFile.Count-1)) and (Pos('/d ', tmpSubFile[i+c]) <> 1) do
        begin
          If Text <> '' then
            Text := Text + #13#10 + tmpSubFile[i+c]
          else
            Text := tmpSubFile[i+c];

          Inc(c);
        end;

        x := SmartPos(' ', tmpSubFile[i], False, 4);
        If (IsInteger(Copy(tmpSubFile[i+c], 4, x-4))) then
          FinalTime := (StrToInt(Copy(tmpSubFile[i+c], 4, x-4))*1000)+
                        StrToInt(Copy(tmpSubFile[i+c], x+1, Length(tmpSubFile[i])))
        else
          FinalTime := InitialTime + 2000;

        if (MaxDuration > 0) and ((FinalTime + ExtraTime) > MaxDuration) Then
          Subtitles.Add(InitialTime + ExtraTime, InitialTime + ExtraTime + MaxDuration, Text)
        else
          Subtitles.Add(InitialTime + ExtraTime, FinalTime + ExtraTime, Text);
      end;

      Inc(i, c);
    end;
  finally
    if Subtitles.Count > 0 then Result := True;
  end;
end;
