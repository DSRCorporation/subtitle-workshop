// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: Adobe Encore DVD (Old) subtitle format saving functionality

function SubtitlesToFile_ADOBEENCOREDVD(Subtitles: TSubtitles; const FileName: String; const FPS: Single; From: Integer = -1; UpTo: Integer = -1) : Boolean;
var
  tmpSubFile : TSubtitleFile;
  i          : Integer;
begin
  Result := True;
  tmpSubFile := TSubtitleFile.Create;
  try
    for i := From to UpTo do
    begin
      tmpSubFile.Add(MSToHHMMSSFFTime(Subtitles.InitialTime[i], FPS) + ' ' +
                     MSToHHMMSSFFTime(Subtitles.FinalTime[i], FPS) + ' ' +
                     RemoveSWTags(Subtitles.Text[i], True, True, True, True)
                     );
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
