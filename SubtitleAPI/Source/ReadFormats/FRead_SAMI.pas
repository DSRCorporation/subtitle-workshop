// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: SAMI Captioning subtitle format reading functionality

function FileToSubtitles_SAMI(var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; ExtraTime: Integer): Boolean;

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
  i, a         : Integer;
  InitialTime  : Integer;
  FinalTime    : Integer;
  tmpCad, Text : String;
  BigStr       : String;
begin
  Result := False;

  try
    // Put all in one line
    BigStr := MakeOneLine(tmpSubFile.Text);

    // Delete comments
    while (Pos('<!--', BigStr) > 0) and (Pos('-->', BigStr) > 0) do
      BigStr := Copy(BigStr, 0, Pos('<!--', BigStr)-1) + Copy(BigStr, Pos('-->',BigStr) + 3, Length(BigStr));

    // Add #13#10 as needed
    for i := Length(BigStr)-3 downto 2 do
    begin
      if (BigStr[i] = '>') then
      begin
        for a := i downto 2 do
          if BigStr[a]  = '<' then break; // search for last "<" before the actual ">"
        if (AnsiLowerCase(Copy(BigStr, a, 2)) = '<p')     or
           (AnsiLowerCase(Copy(BigStr, i-3, 3)) = '</p>') then
        begin
          if (AnsiLowerCase(Copy(BigStr, a, 2)) = '<p') then
            Delete(BigStr, a, i - a + 1)
          else
            Insert(#13#10, BigStr, i + 1);
        end;
        if (AnsiLowerCase(Copy(BigStr, a, 12)) = '<sync start=') then
        begin
          Insert(#13#10, BigStr, a);
          Insert(#13#10, BigStr, i + 3);
        end;
      end;
    end;

    tmpSubFile.Text := BigStr;
    BigStr          := '';

    for i := 0 to tmpSubFile.Count-1 do
    begin
      if (i <= tmpSubFile.Count-3) and
        (SmartPos('<sync start=', tmpSubFile[i], False) = 1) and
        (Pos('>', tmpSubFile[i]) > 13) then
      begin
        // ------------------ //
        //    Initial time    //
        // ------------------ //
        tmpCad := Trim(Copy(tmpSubFile[i], Pos('=', tmpSubFile[i]) + 1, Pos('>', tmpSubFile[i]) - 13));

        if Pos('"',tmpCad) > 0 then
          tmpCad := Trim(Copy(tmpCad, Pos('"',tmpCad) + 1, SmartPos('"', tmpCad, True, Pos('"', tmpCad) + 1) - (Pos('"',tmpCad) + 1)));
        if IsInteger(tmpCad) then
          InitialTime := StrToInt(tmpCad)
        else
          InitialTime := 0;

        // ------------------ //
        //     Final time     //
        // ------------------ //
        if (i <= tmpSubFile.Count-3) and (SmartPos('<sync start=', tmpSubFile[i+2], False) > 0) then
        begin
          tmpCad := Trim(Copy(tmpSubFile[i+2], Pos('=', tmpSubFile[i+2]) + 1, Pos('>', tmpSubFile[i+2]) - 13));
          if Pos('"',tmpCad) > 0 then
            tmpCad := Trim(Copy(tmpCad, Pos('"',tmpCad) + 1, SmartPos('"', tmpCad, True, Pos('"', tmpCad) + 1) - (Pos('"',tmpCad) + 1)));
          if IsInteger(tmpCad) then
            FinalTime := StrToInt(tmpCad)
          else
            FinalTime := InitialTime + 2000;
        end
        else
          FinalTime := InitialTime + 2000;

        // ------------------ //
        //        Text        //
        // ------------------ //
        tmpCad := tmpSubFile[i+1];

        // Replace the enters, not just <br> because they may be some variants like <br />...
        while (SmartPos('<br', tmpCad, False) > 0) and (Pos('>',tmpCad) > 0) do
        begin
          for a := SmartPos('<br', tmpCad, False) to Length(tmpCad) do  // search for next ">" after "<br" ...
            if tmpCad[a] = '>' then break;
          tmpCad := ReplaceString(tmpCad, Copy(tmpCad, SmartPos('<br', tmpCad, False), a - SmartPos('<br', tmpCad, False) + 1), #13#10);
        end;

        tmpCad := ReplaceString(tmpCad, '&nbsp;', ' ');
        tmpCad := ReplaceString(tmpCad, '&quote;', '"');
        tmpCad := ReplaceString(tmpCad, '&quot;', '"');

        Text := Trim(tmpCad);

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
