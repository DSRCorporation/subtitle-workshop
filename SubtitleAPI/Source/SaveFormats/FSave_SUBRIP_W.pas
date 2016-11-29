// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: SubRip (WideString) subtitle format saving functionality

function SubtitlesToFile_SUBRIP_W(Subtitles: TSubtitles; const FileName: String; From: Integer = -1; UpTo: Integer = -1): Boolean;
var
  tmpSubFile : TSubtitleFile;
  i, Count   : Integer;
begin
  Count  := 1;
  Result := True;
  tmpSubFile := TSubtitleFile.Create;
  try

    for i := From to UpTo do
    begin
      tmpSubFile.Add(IntToStr(Count), False);
      Inc(Count);
      tmpSubFile.Add(TimeToString(Subtitles[i].InitialTime, 'hh:mm:ss,zzz') + ' --> ' + TimeToString(Subtitles[i].FinalTime, 'hh:mm:ss,zzz'), False);

      {$IFNDEF VIPLAY}
      if NoInteractionWithTags = False then
      begin
      {$ENDIF}
        if WorkWithTags = False then
          Subtitles.Text[i] := RemoveSWTags(Subtitles.Text[i], True, True, True) else
        begin
{          if Pos('<u>', Subtitles[i].Text) <> 0 then
            Subtitles.Text[i] := Subtitles[i].Text + '</u>';
          if Pos('<b>', Subtitles[i].Text) <> 0 then
            Subtitles.Text[i] := Subtitles[i].Text + '</b>';
          if Pos('<i>', Subtitles[i].Text) <> 0 then
            Subtitles.Text[i] := Subtitles[i].Text + '</i>';}
          Subtitles.Text[i] := RemoveSWTags(Subtitles.Text[i], False, False, False, True);
        end;
      {$IFNDEF VIPLAY}
      end;
      {$ENDIF}

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
