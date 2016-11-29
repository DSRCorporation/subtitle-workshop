// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: Phoenix Japanimation Society subtitle format saving functionality

function SubtitlesToFile_PHOENIXJAPANIMATION(Subtitles: TSubtitles; const FileName: String; const FPS: Single; From: Integer = -1; UpTo: Integer = -1): Boolean;
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
      tmpSubFile.Add(PadLeft(IntToStr(TimeToFrames(Subtitles[i].InitialTime, FPS)), ' ', 7) + ',' + PadLeft(IntToStr(TimeToFrames(Subtitles[i].FinalTime, FPS)), ' ', 7) + ', "' + ReplaceEnters(Subtitles[i].Text, '|') + '"', False);
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
