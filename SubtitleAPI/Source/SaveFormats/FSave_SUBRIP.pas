// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: SubRip subtitle format saving functionality

function SubtitlesToFile_SUBRIP(Subtitles: TSubtitles; const FileName: String; From: Integer = -1; UpTo: Integer = -1): Boolean;

  function ConvertFromSWTags(Text: String): String;
  begin
    {$IFNDEF VIPLAY}
    if NoInteractionWithTags = False then
    begin
    {$ENDIF}
  //DELETE ALL TAGS:
      if WorkWithTags = False then
        Text := RemoveSWTags(Text, True, True, True, True) else
      {$IFNDEF VIPLAY}
  //SINGLE TAGS MODE:
      if SingleTagsMode then //added by adenry 2013.04.11
      {$ENDIF}
      begin
        //removed by adenry: begin 2013.04.11
        //if Pos('<u>', Text) <> 0 then
        //  Text := Text + '</u>';
        //if Pos('<b>', Text) <> 0 then
        //  Text := Text + '</b>';
        //if Pos('<i>', Text) <> 0 then
        //  Text := Text + '</i>';
        //Text := RemoveSWTags(Text, False, False, False, True);
        //removed by adenry: end
        
        //added by adenry: begin 2013.04.11
        Text := SetTagsForSingleTagsMode(Text, True);
        Text := ReplaceString(Text, '<c:#', '<font color=');
        Text := ReplaceString(Text, '</c>', '</font>');
        //added by adenry: end
      end
      //added by adenry: begin 2013.04.11
      {$IFNDEF VIPLAY}
      else
  //MULTI TAGS MODE:
      if MultiTagsMode then
      begin
        Text := CloseUnclosedTags(Text, '<b>', '</b>');
        Text := CloseUnclosedTags(Text, '<i>', '</i>');
        Text := CloseUnclosedTags(Text, '<u>', '</u>');
        Text := CloseUnclosedTags(Text, '<c:#', '</c>');
        Text := CloseUnclosedTags(Text, '<font', '</font>');
        Text := ReplaceString(Text, '<c:#', '<font color=#');
        Text := ReplaceString(Text, '</c>', '</font>');
      end
      {$ENDIF};
      //added by adenry: end

    {$IFNDEF VIPLAY}
    end;
    {$ENDIF}
    Result := Text;
  end;

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

      Subtitles.Text[i] := ConvertFromSWTags(Subtitles.Text[i]);

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
