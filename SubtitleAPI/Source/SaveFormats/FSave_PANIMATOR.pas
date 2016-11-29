// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: Panimator subtitle format saving functionality

function SubtitlesToFile_PANIMATOR(Subtitles: TSubtitles; const FileName: String; From: Integer = -1; UpTo: Integer = -1): Boolean;
var
  tmpSubFile : TSubtitleFile;
  i          : Integer;
begin
  Result := True;
  tmpSubFile := TSubtitleFile.Create;
  try
    for i := From to UpTo do
    begin
      Subtitles.Text[i] := RemoveSWTags(Subtitles.Text[i], True, True, True);
      tmpSubFile.Add('/d ' + TimeToString(Subtitles[i].InitialTime, 'ss zz') + ' ', False);
      tmpSubFile.Add(Subtitles[i].Text, False);
      tmpSubFile.Add('/d ' + TimeToString(Subtitles[i].FinalTime, 'ss zz') + ' ', False);
      tmpSubFile.Add('/c');
    end;
    try
      tmpSubFile.SaveToFile(FileName);
    except
      Result := False;
    end;
  finally
    tmpSubFile.Free;
  end;
end;
