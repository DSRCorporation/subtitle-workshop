// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: Pinnacle Impression subtitle format saving functionality

function SubtitlesToFile_PINNACLEIMPRESSION(Subtitles: TSubtitles; const FileName: String; const FPS: Single; From: Integer = -1; UpTo: Integer = -1): Boolean;
var
  tmpSubFile : TSubtitleFile;
  i          : Integer;
begin
  Result := True;
  tmpSubFile := TSubtitleFile.Create;
  try

    tmpSubFile.Add('-------------------------------------------------', False);
    tmpSubFile.Add('#INPOINT OUTPOINT PATH', False);
    tmpSubFile.Add('-------------------------------------------------', False);

    for i := From to UpTo do
    begin
      Subtitles.Text[i] := RemoveSWTags(Subtitles.Text[i], True, True, True);
      tmpSubFile.Add(MSToHHMMSSFFTime(Subtitles[i].InitialTime, FPS) + ' ' + MSToHHMMSSFFTime(Subtitles[i].FinalTime, FPS) + ' '+ ReplaceEnters(Subtitles[i].Text,' '), False);
    end;
    tmpSubFile.Add('-------------------------------------------------', False);

    try
      tmpSubFile.SaveToFile(FileName);
    except
      Result := False;
    end;
  finally
    tmpSubFile.Free;
  end;
end;
