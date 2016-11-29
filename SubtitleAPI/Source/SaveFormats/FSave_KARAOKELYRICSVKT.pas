// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: Karaoke Lyrics VKT subtitle format saving functionality

function SubtitlesToFile_KARAOKELYRICSVKT(Subtitles: TSubtitles; const FileName: String; From: Integer = -1; UpTo: Integer = -1): Boolean;
var
  tmpSubFile : TSubtitleFile;
  i          : Integer;
  DateSep    : Char;
  DateFor    : String;
begin
  Result := True;
  tmpSubFile := TSubtitleFile.Create;
  try
    tmpSubFile.Add('# <HEAD>', False);
    tmpSubFile.Add('# FRAME RATE=MP3', False);
    tmpSubFile.Add('# CREATOR=Project author', False);
    tmpSubFile.Add('# VIDEO SOURCE=C:\Untitled.avi', False);
    // DATE
    DateSep         := DateSeparator;
    DateFor         := ShortDateFormat;
    DateSeparator   := '-';
    ShortDateFormat := 'yyyy/mm/dd';
    tmpSubFile.Add('# DATE=' + DateToStr(Date), False);
    DateSeparator   := DateSep;
    ShortDateFormat := DateFor;
    //
    tmpSubFile.Add('# </HEAD>', False);
    tmpSubFile.Add('#', False);

    for i := From to UpTo do
    begin
      Subtitles.Text[i] := RemoveSWTags(Subtitles.Text[i], True, True, True);
      tmpSubFile.Add('{' + PadLeft(IntToStr(Subtitles[i].InitialTime div 10), '0', 5){TimeToString(Subtitles[i].InitialTime, 'msszz')} + ' ' + ReplaceEnters(Subtitles[i].Text, '') + '}', False);
      tmpSubFile.Add('{' + PadLeft(IntToStr(Subtitles[i].FinalTime div 10), '0', 5){TimeToString(Subtitles[i].FinalTime, 'msszz')} + ' }');
    end;

    tmpSubFile.Add('', False);
    tmpSubFile.Add('#', False);
    tmpSubFile.Add('# THE END.', False);

    try
      tmpSubFile.SaveToFile(FileName);
    except
      Result := False;
    end;
  finally
    tmpSubFile.Free;
  end;
end;
