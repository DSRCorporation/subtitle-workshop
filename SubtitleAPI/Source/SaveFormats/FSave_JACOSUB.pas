// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: JACOSub 2.7+ subtitle format saving functionality

function SubtitlesToFile_JACOSUB(Subtitles: TSubtitles; const FileName: String; From: Integer = -1; UpTo: Integer = -1): Boolean;
var
  tmpSubFile : TSubtitleFile;
  i          : Integer;
begin
  Result := True;
  tmpSubFile := TSubtitleFile.Create;
  try
    tmpSubFile.Add('#T100', False);
    tmpSubFile.Add('', False);
    tmpSubFile.Add('# Directive entries', False);
    tmpSubFile.Add('#D', False);
    for i := 1 to 29 do
      tmpSubFile.Add('#D'+IntToStr(i), False);
    tmpSubFile.Add('', False);

    for i := From to UpTo do
    begin
      Subtitles.Text[i] := RemoveSWTags(Subtitles.Text[i], True, True, True);
      tmpSubFile.Add(TimeToString(Subtitles[i].InitialTime, 'h:mm:ss.zz') + ' ' + TimeToString(Subtitles[i].FinalTime, 'h:mm:ss.zz') + ' {NTP} ' + ReplaceEnters(Subtitles[i].Text,'\n'), False);
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
