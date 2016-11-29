// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: Karaoke Lyrics LRC subtitle format saving functionality

function SubtitlesToFile_KARAOKELYRICSLRC(Subtitles: TSubtitles; const FileName: String; From: Integer = -1; UpTo: Integer = -1): Boolean;
var
  tmpSubFile : TSubtitleFile;
  i          : Integer;
begin
  Result := True;
  tmpSubFile := TSubtitleFile.Create;
  try
    tmpSubFile.Add('[ti:Project title]', False);
    tmpSubFile.Add('[ar:Project author]', False);
    tmpSubFile.Add('[la:af]', False);
    tmpSubFile.Add('Project title', False);
    tmpSubFile.Add('', False);

    for i := From to UpTo do
    begin
      Subtitles.Text[i] := RemoveSWTags(Subtitles.Text[i], True, True, True);
      tmpSubFile.Add('[' + TimeToString(Subtitles[i].InitialTime, 'mm:ss.zz') + ']' + ReplaceEnters(Subtitles[i].Text, ''), False);
      tmpSubFile.Add('[' + TimeToString(Subtitles[i].FinalTime, 'mm:ss.zz') + ']');
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
