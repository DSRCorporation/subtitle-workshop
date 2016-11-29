// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: Captions Inc. subtitle format saving functionality

function SubtitlesToFile_CAPTIONSINC(Subtitles: TSubtitles; const FileName: String; From: Integer = -1; UpTo: Integer = -1): Boolean;
var
  tmpSubFile : TSubtitleFile;
  i          : Integer;
begin
  Result := True;
  tmpSubFile := TSubtitleFile.Create;
  try
    tmpSubFile.Add('*Timecode type: PAL/EBU', False);
    tmpSubFile.Add('', False);

    for i := From to UpTo do
    begin
      Subtitles.Text[i] := RemoveSWTags(Subtitles.Text[i], True, True, True, True);
      tmpSubFile.Add(TimeToString(Subtitles[i].InitialTime, 'hh:mm:ss:zz') + ' ' + TimeToString(Subtitles[i].FinalTime, 'hh:mm:ss:zz'), False);
      tmpSubFile.Add('{0 [1 ' + ReplaceEnters(Subtitles[i].Text, ' '), False);
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
