// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: DVDSubtitle subtitle format saving functionality

function SubtitlesToFile_DVDSUBTITLE(Subtitles: TSubtitles; const FileName: String; From: Integer = -1; UpTo: Integer = -1): Boolean;
var
  tmpSubFile : TSubtitleFile;
  i          : Integer;
begin
  Result := True;
  tmpSubFile := TSubtitleFile.Create;
  try
    tmpSubFile.Add('{HEAD', False);
    tmpSubFile.Add('DISCID=' + DVDSubtitleAttributes.DiskId, False);
    tmpSubFile.Add('DVDTITLE=' + DVDSubtitleAttributes.DVDTitle, False);
    tmpSubFile.Add('CODEPAGE=1250', False);
    tmpSubFile.Add('FORMAT=ASCII', False);
    tmpSubFile.Add('LANG=' + DVDSubtitleAttributes.Language, False);
    tmpSubFile.Add('TITLE=1', False);
    tmpSubFile.Add('ORIGINAL=ORIGINAL', False);
    tmpSubFile.Add('AUTHOR=' + DVDSubtitleAttributes.Author, False);
    tmpSubFile.Add('WEB=' + DVDSubtitleAttributes.Web, False);
    tmpSubFile.Add('INFO=' + DVDSubtitleAttributes.Info, False);
    tmpSubFile.Add('LICENSE=' + DVDSubtitleAttributes.License, False);
    tmpSubFile.Add('}', False);

    for i := From to UpTo do
    begin
      Subtitles.Text[i] := RemoveSWTags(Subtitles.Text[i], True, True, True);

      tmpSubFile.Add('{T ' + TimeToString(Subtitles[i].InitialTime, 'hh:mm:ss:zz'), False);
      tmpSubFile.Add(Subtitles[i].Text, False);
      tmpSubFile.Add('}', False);
      tmpSubFile.Add('{T ' + TimeToString(Subtitles[i].FinalTime, 'hh:mm:ss:zz'), False);
      tmpSubFile.Add('', False);
      tmpSubFile.Add('}', False);
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
