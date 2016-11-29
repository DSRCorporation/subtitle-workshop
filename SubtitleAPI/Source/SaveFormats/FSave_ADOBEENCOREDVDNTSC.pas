// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: Adobe Encore DVD NTSC subtitle format saving functionality

//added by adenry
function SubtitlesToFile_ADOBEENCOREDVDNTSC(Subtitles: TSubtitles; const FileName: String; const FPS: Single; From: Integer = -1; UpTo: Integer = -1) : Boolean;
var
  tmpSubFile : TSubtitleFile;
  i, n       : Integer;
begin
  Result := True;
  tmpSubFile := TSubtitleFile.Create;
  n := 1;
  try
    for i := From to UpTo do
    begin
      tmpSubFile.Add(IntToStr(n) + ' ' +
                     MSToHHMMSSFFTime(Subtitles.InitialTime[i], FPS, ';') + ' ' +
                     MSToHHMMSSFFTime(Subtitles.FinalTime[i], FPS, ';') + ' ' +
                     RemoveSWTags(Subtitles.Text[i], True, True, True, True)
                     );
      Inc(n);
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
