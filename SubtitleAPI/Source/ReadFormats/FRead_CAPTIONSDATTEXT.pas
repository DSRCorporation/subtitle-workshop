// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: Captions DAT Text subtitle format reading functionality

function FileToSubtitles_CAPTIONSDATTEXT(var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; ExtraTime: Integer): Boolean;
var
  i, a, c     : Integer;
  InitialTime : Integer;
  FinalTime   : Integer;
  Text        : String;
  BigStr      : String;
begin
  Result := False;
  try
    BigStr := MakeOneLine(tmpSubFile.Text);

    // Add #13#10 as needed
    for i := Length(BigStr)-1 downto 0 do
    begin
      Text := Copy(BigStr, i, 4);
      if (Text = 'BG @') or (Copy(Text, 1, 2) = '#T') then
        Insert(#13#10, BigStr, i);
    end;

    tmpSubFile.Text := BigStr;
    BigStr          := '';

    for i := 0 to tmpSubFile.Count-1 do
    begin
      if (Pos('#T', tmpSubFile[i]) = 1) and (IsInteger(Copy(tmpSubFile[i], Pos('#T', tmpSubFile[i]) + 2, 14))) then
      begin
        Text := '';
        c    := 1;
        while (i+c <= (tmpSubFile.Count-1)) and (Pos('BG @', tmpSubFile[i+c]) = 1) do
        begin
          a := SmartPos(' ', tmpSubFile[i+c], True, SmartPos(' ', tmpSubFile[i+c], True, Pos(' ', tmpSubFile[i+c]) + 1) + 1) + 1;

          if Text <> '' then
            Text := Text + #13#10 + Copy(tmpSubFile[i+c], a, Length(tmpSubFile[i+c])-(a-1))
          else
            Text := Copy(tmpSubFile[i+c], a, Length(tmpSubFile[i+c])-(a-1));

          Inc(c);
        end;
        // The format of the time is:
        // #T00023010032100
        //   hmmsszzz+++++?

        InitialTime := StrToInt(Copy(tmpSubFile[i], 3, 8));
        FinalTime   := InitialTime + StrToInt(Copy(tmpSubFile[i], 11, 5));

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
