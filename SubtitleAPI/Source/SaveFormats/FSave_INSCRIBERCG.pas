// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: Inscriber CG subtitle format saving functionality

function SubtitlesToFile_INSCRIBERCG(Subtitles: TSubtitles; const FileName: String; From: Integer = -1; UpTo: Integer = -1): Boolean;
var
  tmpSubFile : TSubtitleFile;
  i          : Integer;
begin
  Result := True;
  tmpSubFile := TSubtitleFile.Create;
  try
    tmpSubFile.Add('@@9 Title', False);
    tmpSubFile.Add('@@9 Created by URUSoft Subtitle API (http://www.urusoft.net)', False);
    tmpSubFile.Add('@@9 STORY:', False);
    tmpSubFile.Add('@@9 LANG: ENG', False);
    for i := 1 to 4 do
      tmpSubFile.Add('@@9', False);

    for i := From to UpTo do
    begin
      Subtitles.Text[i] := RemoveSWTags(Subtitles.Text[i], True, True, True);

      tmpSubFile.Add('@@9 ' + ReplaceEnters(Subtitles[i].Text, #13#10+'@@9 ') +
                     '<' + TimeToString(Subtitles[i].InitialTime, 'hh:mm:ss:zz') + '><'  +
                     TimeToString(Subtitles[i].FinalTime, 'hh:mm:ss:zz') + '>');

      tmpSubFile.Add('', False);
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
