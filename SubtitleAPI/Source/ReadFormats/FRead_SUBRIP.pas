// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: SubRip subtitle format reading functionality

function FileToSubtitles_SUBRIP(var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; ExtraTime: Integer): Boolean;

  function ConvertToSWTags(Text: String): String;
  var
    TagPos, i: Integer; //added by adenry 2013.04.11
    Color : String; //added by adenry 2013.04.11
  begin
    {$IFNDEF VIPLAY}
    if NoInteractionWithTags = False then
    begin
    {$ENDIF}
  //READ AND CONVERT TAGS
      //added by adenry: begin 2013.04.11
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
      //added by adenry: end

  //DELETE ALL TAGS:
      if WorkWithTags = False then
      begin
        Text := RemoveSWTags(Text, True, True, True, True); //added by adenry 2013.04.11

        //removed by adenry: 2013.04.11
        //Text := ReplaceString(Text, '<i>', '');
        //Text := ReplaceString(Text, '<b>', '');
        //Text := ReplaceString(Text, '<u>', '');
        //Text := ReplaceString(Text, '</i>', '');
        //Text := ReplaceString(Text, '</b>', '');
        //Text := ReplaceString(Text, '</u>', '');
      end else
      {$IFNDEF VIPLAY}
  //SINGLE TAGS MODE:
      if SingleTagsMode then //added by adenry 2013.04.11
      {$ENDIF}
      begin
        Text := SetTagsForSingleTagsMode(Text); //added by adenry 2013.04.11
      end

      //added by adenry: begin 2013.04.11
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
  i, c        : Integer;
  InitialTime : Integer;
  FinalTime   : Integer;
  Text        : String;
begin
  Result := False;
  try
    for i := 0 to tmpSubFile.Count-1 do
    begin
      InitialTime := StringToTime(Copy(tmpSubFile[i], 1, 12));
      FinalTime   := StringToTime(Copy(tmpSubFile[i], 18, 12));
      if (InitialTime > -1) and (FinalTime > -1) then
      begin
        c    := 1;
        Text := '';
        while (i+c <= (tmpSubFile.Count-1)) and
              //(IsInteger(tmpSubFile[i+c]) = False) and //removed by adenry 2013.04.16 - this would omit lines containing only numbers!
              ( (i+c = tmpSubFile.Count-1) or (Pos(' --> ', tmpSubFile[i+c+1]) = 0) ) and  //added by adenry 2013.04.16
              (Pos(' --> ', tmpSubFile[i+c]) = 0) do
        begin
          If Text <> '' then
            Text := Text + #13#10 + tmpSubFile[i+c]
          else
            Text := tmpSubFile[i+c];
          Inc(c);
        end;

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
