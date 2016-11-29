// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: RealTime subtitle format saving functionality

function SubtitlesToFile_REALTIME(Subtitles: TSubtitles; const FileName: String; From: Integer = -1; UpTo: Integer = -1): Boolean;

  function ConvertFromSWTags(Text: String): String;
  var
    tagPos: Integer; //added by adenry 2013.04.12
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
      if SingleTagsMode then //added by adenry 2013.04.12
      {$ENDIF}
      begin
          Text := SetTagsForSingleTagsMode(Text, True);
          //Text := ReplaceString(Text, '<c:#', '<font color=');
          Text := ReplaceString(Text, '</c>', '</font>');
          if Pos('<c:#', Text) > 0 then
            Text := Copy(Text, 0, Pos('<c:#', Text) - 1) + '<font color="' + Copy(Text, Pos('<c:#', Text) + 3, 7) + '">' + Copy(Text, Pos('<c:#', Text) + 11, Length(Text));

          //removed by adenry: begin 2013.04.12
          //if Pos('<u>',Text) > 0 then
          //  Text := Text + '</u>';
          //if Pos('<b>',Text) > 0 then
          //  Text := Text + '</b>';
          //if Pos('<i>',Text) > 0 then
          //  Text := Text + '</i>';
          //if Pos('<c:#', Text) > 0 then
          //begin
          //  Text := Text + '</font>';
          //  Text := Copy(Text, 0, Pos('<c:#', Text) - 1) + '<font color="' + Copy(Text, Pos('<c:#', Text) + 3, 7) + '">' + Copy(Text, Pos('<c:#', Text) + 11, Length(Text));
          //end;
          //removed by adenry: end
      end

      //added by adenry: begin 2013.04.12
      {$IFNDEF VIPLAY}
      else
      if MultiTagsMode then
      begin
        Text := CloseUnclosedTags(Text, '<b>', '</b>');
        Text := CloseUnclosedTags(Text, '<i>', '</i>');
        Text := CloseUnclosedTags(Text, '<u>', '</u>');
        Text := CloseUnclosedTags(Text, '<c:#', '</c>');
        Text := CloseUnclosedTags(Text, '<font', '</font>');
        Text := ReplaceString(Text, '<c:#', '<font color="#');
        Text := ReplaceString(Text, '</c>', '</font>');
        tagPos := SmartPos('<font color="#', Text, False);
        while tagPos > 0 do
        begin
          Insert('"', Text, tagPos+20);
          tagPos := SmartPos('<c:#', Text, False, tagPos+1);
        end;
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
  i          : Integer;
  Text       : String;
begin
  Result := True;
  tmpSubFile := TSubtitleFile.Create;
  try
    tmpSubFile.Add('<Window', False);
    tmpSubFile.Add('  Width    = "640"', False);
    tmpSubFile.Add('  Height   = "480"', False);
    tmpSubFile.Add('  WordWrap = "true"', False);
    tmpSubFile.Add('  Loop     = "true"', False);
    tmpSubFile.Add('  bgcolor  = "black"', False);
    tmpSubFile.Add('>', False);
    tmpSubFile.Add('<Font', False);
    tmpSubFile.Add('  Color = "white"', False);
    tmpSubFile.Add('  Face  = "Arial"', False);
    tmpSubFile.Add('  Size  = "+2"', False);
    tmpSubFile.Add('>', False);
    tmpSubFile.Add('<center>', False);
    tmpSubFile.Add('<b>', False);
    tmpSubFile.Add('', False);

    for i := From to UpTo do
    begin
      Text := ReplaceEnters(Subtitles[i].Text,'<br>');

      Text := ConvertFromSWTags(Text);

      tmpSubFile.Add('<Time begin="' + TimeToString(Subtitles[i].InitialTime, 'h:mm:ss.z') + '" end="' + TimeToString(Subtitles[i].FinalTime, 'h:mm:ss.z') + '" /><clear/>'+ Text, False);
    end;


    tmpSubFile.Add('</b>', False);
    tmpSubFile.Add('</center>', False);

    try
      tmpSubFile.SaveToFile(FileName);
    except
      Result := False;
    end;
  finally
    tmpSubFile.Free;
  end;
end;
