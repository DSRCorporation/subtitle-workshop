// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: MPSub subtitle format reading functionality

function FileToSubtitles_MPSUB(var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; ExtraTime: Integer): Boolean;
  function ReplaceToDSep(Text: String): String;
  var
    i: Integer;
  begin
    for i := 1 to Length(Text) do
    begin
      if (Text[i] in ['0'..'9']) = False then
        Text[i] := DecimalSeparator;
    end;
    Result := Text;
  end;

var
  i,c         : Integer;
  PrevFTime   : Integer;
  InitialTime : Integer;
  FinalTime   : Integer;
  StartTime   : Single;
  Duration    : Single;
  Text        : String;
begin
  Result := False;
  try
    PrevFTime := 0;
    for i := 0 to tmpSubFile.Count-1 do
    begin
      StartTime := StrToFloatDef(ReplaceToDSep(Copy(tmpSubFile[i], 1, Pos(' ', tmpSubFile[i])-1)), -1);
      Duration  := StrToFloatDef(ReplaceToDSep(Copy(tmpSubFile[i], Pos(' ', tmpSubFile[i])+1, Length(tmpSubFile[i]))), -1);

      if (StartTime > -1) and (Duration > -1) then
      begin
        InitialTime := PrevFTime + Round(StartTime*1000);
        FinalTime   := InitialTime + Round(Duration*1000);
        PrevFTime   := FinalTime;

        c    := 1;
        Text := '';
        while (i+c <= (tmpSubFile.Count-1)) and
              (IsInteger(Copy(tmpSubFile[i+c], 1, Pos(' ', tmpSubFile[i+c])-1), ',.') = False) and
              (IsInteger(Copy(tmpSubFile[i+c], Pos(' ', tmpSubFile[i+c])+1, Length(tmpSubFile[i+c])), ',.') = False) do
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
