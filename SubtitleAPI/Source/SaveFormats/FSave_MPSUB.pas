// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: MPSub subtitle format saving functionality

function SubtitlesToFile_MPSUB(Subtitles: TSubtitles; const FileName: String; From: Integer = -1; UpTo: Integer = -1): Boolean;
var
  tmpSubFile : TSubtitleFile;
  i          : Integer;
  DSep       : Char;
  BigStr     : String;
begin
  Result     := True;
  tmpSubFile := TSubtitleFile.Create;
  DSep       := DecimalSeparator;
  try
    DecimalSeparator := '.';
    BigStr           := '';

    BigStr := BigStr + 'TITLE='#10;
    BigStr := BigStr + 'FILE='#10;
    BigStr := BigStr + 'AUTHOR='#10;
    BigStr := BigStr + 'TYPE=VIDEO'#10;
    BigStr := BigStr + 'FORMAT=TIME'#10;
    BigStr := BigStr + 'NOTE='#10#10;

    for i := From to UpTo do
    begin
      Subtitles.Text[i] := RemoveSWTags(Subtitles.Text[i], True, True, True);
      if i = 0 then
        BigStr := BigStr + LimitDecimals(Subtitles[i].InitialTime / 1000, 2) + ' ' + LimitDecimals((Subtitles[i].FinalTime / 1000) - (Subtitles[i].InitialTime / 1000), 2) + #10 else
        BigStr := BigStr + LimitDecimals((Subtitles[i].InitialTime / 1000) - (Subtitles[i-1].FinalTime / 1000), 2) + ' ' + LimitDecimals((Subtitles[i].FinalTime / 1000) - (Subtitles[i].InitialTime / 1000), 2) + #10;

      BigStr := BigStr + ReplaceEnters(Subtitles[i].Text, #10) + #10#10;
    end;

    tmpSubFile.Add(BigStr, False);

    try
      tmpSubFile.SaveToFile(FileName);
    except
      Result := False;
    end;
  finally
    tmpSubFile.Free;
    DecimalSeparator := DSep;
  end;
end;
