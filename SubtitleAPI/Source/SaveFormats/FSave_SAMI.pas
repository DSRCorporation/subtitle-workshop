// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: SAMI Captioning subtitle format saving functionality

function SubtitlesToFile_SAMI(Subtitles: TSubtitles; const FileName: String; From: Integer = -1; UpTo: Integer = -1): Boolean;

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
          //if Pos('<u>',Text) <> 0 then
          //  Text := Text + '</u>';
          //if Pos('<b>',Text) <> 0 then
          //  Text := Text + '</b>';
          //if Pos('<i>',Text) <> 0 then
          //  Text := Text + '</i>';
          //Text := RemoveSWTags(Text, False, False, False, True);
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
  tmpStr     : String;
begin

  // Default values
  if SAMIAttributes.Assigned = False then
    with SAMIAttributes do
    begin
      FontName        := 'Tahoma';
      FontSize        := 24;
      Bold            := True;
      Italic          := False;
      Underline       := False;
      SubColor        := '#FFFFFF';
      BackgroundColor := '#000000';
      Align           := 'center';
    end;

  Result := True;
  tmpSubFile := TSubtitleFile.Create;
  try
    if SAMIAttributes.Bold then
    begin
      if SAMIAttributes.Italic then
      begin
        if SAMIAttributes.Underline then
          tmpStr := 'font-weight: bold; font-style: italic; text-decoration: underline; '
        else
          tmpStr := 'font-weight: bold; font-style: italic; ';
      end
      else
        tmpStr := 'font-weight: bold; ';
    end
    else if SAMIAttributes.Italic then
    begin
      if SAMIAttributes.Underline then
        tmpStr := 'font-style: italic; text-decoration: underline; '
      else
        tmpStr := 'font-style: italic; ';
    end
    else if SAMIAttributes.Underline then
      tmpStr := 'text-decoration: underline; '
    else
      tmpStr := '';

    tmpSubFile.Add('<SAMI>', False);
    tmpSubFile.Add('<HEAD>', False);
    tmpSubFile.Add('   <STYLE TYPE="Text/css">', False);
    tmpSubFile.Add('   <!--', False);
    tmpSubFile.Add('      P {margin-left: 29pt; margin-right: 29pt; font-size: ' + IntToStr(SAMIAttributes.FontSize) + 'pt; text-align: ' + AnsiLowerCase(SAMIAttributes.Align) + '; font-family: ' + SAMIAttributes.FontName + '; '+ tmpStr + 'color: ' + SAMIAttributes.SubColor + '; background-color: ' + SAMIAttributes.BackgroundColor + ';}', False);
    tmpSubFile.Add('      .SUBTTL {Name: ''Subtitles''; Lang: en-US; SAMIType: CC;}', False);
    tmpSubFile.Add('   -->', False);
    tmpSubFile.Add('   </STYLE>', False);
    tmpSubFile.Add('</HEAD>', False);
    tmpSubFile.Add('<BODY>', False);

    for i := From to UpTo do
    begin
      Subtitles.Text[i] := ConvertFromSWTags(Subtitles.Text[i]);

      tmpSubFile.Add('   <SYNC START=' + IntToStr(Subtitles[i].InitialTime) + '>', False);
      tmpSubFile.Add('      <P CLASS=SUBTTL>' + ReplaceEnters(Subtitles[i].Text,'<br>'), False);

      tmpSubFile.Add('   <SYNC START=' + IntToStr(Subtitles[i].FinalTime) + '>', False);
      tmpSubFile.Add('      <P CLASS=SUBTTL>&nbsp;', False);

    end;

    tmpSubFile.Add('</BODY>', False);
    tmpSubFile.Add('</SAMI>', False);

    try
      tmpSubFile.SaveToFile(FileName);
    except
      Result := False;
    end;
  finally
    tmpSubFile.Free;

    //todo: why is this necessary?
    if SAMIAttributes.Assigned = False then
      with SAMIAttributes do
      begin
        FontName        := '';
        FontSize        := 0;
        Bold            := False;
        Italic          := False;
        Underline       := False;
        SubColor        := '';
        BackgroundColor := '';
        Align           := '';
      end;
  end;
end;
