// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: ViPlay Subtitle File subtitle format saving functionality

function SubtitlesToFile_VIPLAY(Subtitles: TSubtitles; const FileName: String; From: Integer = -1; UpTo: Integer = -1): Boolean;
var
  tmpSubFile : TSubtitleFile;
  i          : Integer;
begin
  Result := True;
  tmpSubFile := TSubtitleFile.Create;
  try

    tmpSubFile.Add('{* VIPLAY SUBTITLE FILE *}', False);

    for i := From to UpTo do
    begin
      {$IFNDEF VIPLAY}
      if NoInteractionWithTags = False then
      begin
      {$ENDIF}
        if WorkWithTags = False then
          Subtitles.Text[i] := RemoveSWTags(Subtitles.Text[i], True, True, True)
          else Subtitles.Text[i] := SetTagsForSingleTagsMode(Subtitles.Text[i], False);//added by adenry 2013.04.13
      {$IFNDEF VIPLAY}
      end;
      {$ENDIF}
      tmpSubFile.Add(TimeToString(Subtitles[i].InitialTime, 'hh:mm:ss,zzz') + '-' + TimeToString(Subtitles[i].FinalTime, 'hh:mm:ss,zzz') + '=' + ReplaceEnters(Subtitles[i].Text,'|'), False);
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
