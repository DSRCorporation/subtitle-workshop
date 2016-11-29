// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: Cavena subtitle format saving functionality

// by Bedazzle 2007.05.13 start
function SubtitlesToFile_CAVENA(Subtitles: TSubtitles; const FileName: String; From: Integer = -1; UpTo: Integer = -1): Boolean;
var
  tmpSubFile : TSubtitleFile;
  i, Count   : Integer;
  z: shortstring;
begin
  Count  := 1;
  Result := True;
  tmpSubFile := TSubtitleFile.Create;
  try
    for i := From to UpTo do
    begin
      z := IntToStr(Count);
      z := copy('     ', 1, 5-length(z)) + z;
      tmpSubFile.Add(z + '       ' + TimeToString(Subtitles[i].InitialTime, 'hh:mm:ss:ff') + '   ' + TimeToString(Subtitles[i].FinalTime, 'hh:mm:ss:ff'), False);

      tmpSubFile.Add(RemoveSWTags(Subtitles[i].Text,True,True,True,True), False); //RemoveSWTags added by adenry 2013.04.12
      tmpSubFile.Add('', False);
      Inc(Count);
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
// by Bedazzle 2007.05.13 end
