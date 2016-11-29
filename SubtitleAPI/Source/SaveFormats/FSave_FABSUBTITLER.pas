// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: FAB Subtitler subtitle format saving functionality

function SubtitlesToFile_FABSUBTITLER(Subtitles: TSubtitles; const FileName: String; const FPS: Single; From: Integer = -1; UpTo: Integer = -1): Boolean;
var
  tmpSubFile  : TSubtitleFile;
  InitialTime : String;
  FinalTime   : String;
  i           : Integer;
begin
  Result := True;
  tmpSubFile := TSubtitleFile.Create;
  try
    for i := From to UpTo do
    begin
      Subtitles.Text[i] := RemoveSWTags(Subtitles.Text[i], True, True, True);

      // Time format is hh:mm:ss:ff
      InitialTime := TimeToString(Subtitles[i].InitialTime, 'hh:mm:ss:') +
                     PadLeft(IntToStr(GetMSInFrames(Subtitles[i].InitialTime, FPS)), '0', 2, False);

      FinalTime := TimeToString(Subtitles[i].FinalTime, 'hh:mm:ss:') +
                   PadLeft(IntToStr(GetMSInFrames(Subtitles[i].FinalTime, FPS)), '0', 2, False);

      tmpSubFile.Add(InitialTime + '  ' + FinalTime);
      tmpSubFile.Add(Subtitles[i].Text, False);
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
