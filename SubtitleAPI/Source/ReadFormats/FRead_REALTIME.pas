// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: RealTime subtitle format reading functionality

function FileToSubtitles_REALTIME(var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; ExtraTime: Integer): Boolean;

  function ConvertToSWTags(Text: String): String;
  var
    //tmpCad: String; //removed by adenry 2013.04.12
    //Bold, Italic, Underline: Boolean; //removed by adenry 2013.04.12
    //a: Integer; //removed by adenry 2013.04.12
    TagPos, i: Integer; //added by adenry 2013.04.12
    Color : String; //added by adenry 2013.04.12
  begin
    {$IFNDEF VIPLAY}
    if NoInteractionWithTags = False then
    begin
    {$ENDIF}
      //added by adenry: begin 2013.04.12
  //READ AND CONVERT TAGS
      Text := ReplaceString(Text, '< b>', '<b>');
      Text := ReplaceString(Text, '<b >', '<b>');
      Text := ReplaceString(Text, '< i>', '<i>');
      Text := ReplaceString(Text, '<i >', '<i>');
      Text := ReplaceString(Text, '< u>', '<u>');
      Text := ReplaceString(Text, '<u >', '<u>');

      Text := ReplaceString(Text, '</ b>', '</b>');
      Text := ReplaceString(Text, '< /b>', '</b>');
      Text := ReplaceString(Text, '</b >', '</b>');
      Text := ReplaceString(Text, '</ i>', '</i>');
      Text := ReplaceString(Text, '< /i>', '</i>');
      Text := ReplaceString(Text, '</i >', '</i>');
      Text := ReplaceString(Text, '</ u>', '</u>');
      Text := ReplaceString(Text, '< /u>', '</u>');
      Text := ReplaceString(Text, '</u >', '</u>');

      Text := ReplaceString(Text, '</font>', '</c>');
      Text := ReplaceString(Text, '</ font>', '</c>');
      Text := ReplaceString(Text, '< /font>', '</c>');
      Text := ReplaceString(Text, '</font >', '</c>');

      Text := ReplaceString(Text, '<font color=#', '<c:#');
      Text := ReplaceString(Text, '<font color =#', '<c:#');
      Text := ReplaceString(Text, '<font color = #', '<c:#');
      Text := ReplaceString(Text, '<font color=', '<c:#');
      Text := ReplaceString(Text, '<font color = ', '<c:#');
      Text := ReplaceString(Text, '<font color =', '<c:#');

      TagPos := SmartPos('<c:#', Text, False, 1);
      while TagPos > 0 do
      begin
        if SmartPos('>', Text, False, TagPos) > 0 then
        begin
          i := TagPos+4;
          Color := Copy(Text, i, 1);
          while (Color <> '>') and (Color <> '') do
          begin
            if not (Color[1] in HexChars) then
              Delete(Text, i, 1) else
              Inc(i);
            Color := Copy(Text, i, 1);
          end;
          TagPos := SmartPos('<c:#', Text, False, TagPos+4);
        end else
          break;
      end;

  //DELETE ALL TAGS:
      if WorkWithTags = False then
      begin
        Text := RemoveSWTags(Text, True, True, True, True);
      end else
      //added by adenry: end

      {$IFNDEF VIPLAY}
  //SINGLE TAGS MODE:      
      if SingleTagsMode then//added by adenry 2013.04.12
      {$ENDIF}
      begin
          Text := SetTagsForSingleTagsMode(Text); //added by adenry 2013.04.12

          //removed by adenry: begin 2013.04.12
          //// Store tags
          //Bold      := SmartPos('<b>', Text, False) > 0;
          //Italic    := SmartPos('<i>', Text, False) > 0;
          //Underline := SmartPos('<u>', Text, False) > 0;
          //
          //if SmartPos('<font color="', Text, False) > 0 then
          //begin
          //  tmpCad := Copy(Text, SmartPos('<font color="', Text, False) + 13, 7);
          //  if Pos('#', tmpCad) <> 1 then tmpCad := '#' + tmpCad;
          //  tmpCad := '<c:' + tmpCad + '>';
          //end else
          //  tmpCad := '';
          //
          //// Replace all opening and closing tags...
          //while (Pos('<', Text) <> 0) and (Pos('>', Text) <> 0) do
          //begin
          //  for a := Pos('<', Text) to Length(Text) do
          //    if Text[a] = '>' then break;
          //  Delete(Text, Pos('<', Text), a + 1 - Pos('<', Text));
          //end;
          //
          //if WorkWithTags then
          //begin
          //  if Underline then Text := '<u>' + Text + '</u>';
          //  if Bold then      Text := '<b>' + Text + '</b>';
          //  if Italic then    Text := '<i>' + Text + '</i>';
          //  Text := tmpCad + Text;
          //end;
          //removed by adenry: end
      end

      //added by adenry: begin 2013.04.12
      {$IFNDEF VIPLAY}
      else
  //MULTI TAGS MODE:       
      if MultiTagsMode then
      begin
        //Close all unclosed tags
        Text := CloseUnclosedTags(Text, '<b>', '</b>');
        Text := CloseUnclosedTags(Text, '<i>', '</i>');
        Text := CloseUnclosedTags(Text, '<u>', '</u>');
        Text := CloseUnclosedTags(Text, '<c:#','</c>');
      end
      {$ENDIF};
      //added by adenry: end

    {$IFNDEF VIPLAY}
    end;
    {$ENDIF}
    Result := Text;
  end;

var
  i           : Integer;
  InitialTime : Integer;
  FinalTime   : Integer;
  BigStr      : String;
  tmpCad      : String;
  Text        : String;
begin
  Result := False;

  try
    // Put all in one line
    BigStr := MakeOneLine(tmpSubFile.Text);

    // Add #13#10 as needed
    for i := Length(BigStr)-3 downto 2 do
    begin
      if SmartPos('<time', BigStr, False, i) = i then//(AnsiLowerCase(Copy(BigStr, i, 5)) = '<time') then
        Insert(#13#10, BigStr, i);
    end;

    tmpSubFile.Text := BigStr;
    BigStr          := '';

    for i := 0 to tmpSubFile.Count-1 do
    begin
      Text := '';
      tmpCad := Copy(tmpSubFile[i], SmartPos('begin="', tmpSubFile[i], False) + 7, SmartPos('"', tmpSubFile[i], True, SmartPos('begin="', tmpSubFile[i], False) + 7) - (SmartPos('begin="', tmpSubFile[i], False) + 7));
      if Length(tmpCad) = 8 then tmpCad := '00:' + tmpCad;
      InitialTime := StringToTime(tmpCad);
      tmpCad := Copy(tmpSubFile[i], SmartPos('end="', tmpSubFile[i], False) + 5, SmartPos('"', tmpSubFile[i], True, SmartPos('end="', tmpSubFile[i], False) + 5) - (SmartPos('end="', tmpSubFile[i], False) + 5));
      if Length(tmpCad) = 8 then tmpCad := '00:' + tmpCad;
      FinalTime := StringToTime(tmpCad);

      if (InitialTime > -1) and
         (FinalTime > -1) and
         (SmartPos('<time', tmpSubFile[i], False) > 0) and
         (SmartPos('begin="', tmpSubFile[i], False) > 0) and
         (SmartPos('end="', tmpSubFile[i], False) > 0) then
      begin
        Text := ReplaceString(Trim(Copy(tmpSubFile[i], SmartPos('<clear/>', tmpSubFile[i], False) + 8, Length(tmpSubFile[i]))), '<br>', #13#10);

        Text := ConvertToSWTags(Text);

        if (MaxDuration > 0) and ((FinalTime + ExtraTime) > MaxDuration) Then
          Subtitles.Add(InitialTime + ExtraTime, InitialTime + ExtraTime + MaxDuration, Text)
        else
          Subtitles.Add(InitialTime + ExtraTime, FinalTime + ExtraTime, Text);
      end;
    end;
  finally
    if Subtitles.Count > 0 then Result := True;
  end;
end;
