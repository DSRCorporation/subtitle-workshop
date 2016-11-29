// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: QuickTime Text subtitle format saving functionality

function SubtitlesToFile_QUICKTIMETEXT(Subtitles: TSubtitles; const FileName: String; From: Integer = -1; UpTo: Integer = -1): Boolean;
var
  tmpSubFile : TSubtitleFile;
  i          : Integer;
begin
  Result := True;
  tmpSubFile := TSubtitleFile.Create;
  try

    tmpSubFile.Add('{QTtext} {font:Tahoma}', False);
    tmpSubFile.Add('{plain} {size:20}', False);
    tmpSubFile.Add('{timeScale:30}', False);
    tmpSubFile.Add('{width:160} {height:32}', False);
    tmpSubFile.Add('{timeStamps:absolute} {language:0}', False);

    for i := From to UpTo do
    begin
      Subtitles.Text[i] := RemoveSWTags(Subtitles.Text[i], True, True, True);
      tmpSubFile.Add('[' + TimeToString(Subtitles[i].InitialTime, 'hh:mm:ss.zz') + ']');
      tmpSubFile.Add(ReplaceEnters(Subtitles[i].Text, ' '));
      tmpSubFile.Add('[' + TimeToString(Subtitles[i].FinalTime, 'hh:mm:ss.zz') + ']');
      tmpSubFile.Add(' ', False);
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
