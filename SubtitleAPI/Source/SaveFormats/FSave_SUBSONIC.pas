// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: SubSonic subtitle format saving functionality

function SubtitlesToFile_SUBSONIC(Subtitles: TSubtitles; const FileName: String; From: Integer = -1; UpTo: Integer = -1): Boolean;
var
  tmpSubFile : TSubtitleFile;
  tmpTiempo  : Single;
  i, c       : Integer;
  tmpNum     : String;
  dc         : Char;
begin
  c          := 1;
  Result     := True;
  dc         := DecimalSeparator;
  tmpSubFile := TSubtitleFile.Create;

  try
    DecimalSeparator := '.';

    for i := From to UpTo do
    begin
      Subtitles.Text[i] := RemoveSWTags(Subtitles.Text[i], True, True, True);

      tmpTiempo := Subtitles[i].InitialTime / 1000;
      If tmpTiempo > (256*c) Then inc(c);

      tmpTiempo := tmpTiempo - (256*(c-1));
      tmpNum    := LimitDecimals(tmpTiempo, 2);

      if Pos('.',tmpNum) = 0 then
        tmpNum := tmpNum + '.00';
      if Length(Copy(tmpNum,Pos('.',tmpNum)+1,Length(tmpNum))) < 2 then
        tmpNum := tmpNum + '0';

      tmpSubFile.Add('1 ' + tmpNum + Format(' \ ~:\%s', [ReplaceEnters(Subtitles[i].Text, ' ')]), False);

      tmpTiempo := Subtitles[i].FinalTime / 1000;
      tmpTiempo := tmpTiempo - (256*(c-1));
      tmpNum    := LimitDecimals(tmpTiempo, 2);

      if Pos('.',tmpNum) = 0 then
        tmpNum := tmpNum + '.00';
      if Length(Copy(tmpNum,Pos('.',tmpNum) + 1, Length(tmpNum))) < 2 then
        tmpNum := tmpNum + '0';

      tmpSubFile.Add('1 ' + tmpNum, False);

    end;

    try
      tmpSubFile.SaveToFile(FileName);
    except
      Result := False;
    end;
  finally
    tmpSubFile.Free;
    DecimalSeparator := dc;
  end;
end;
