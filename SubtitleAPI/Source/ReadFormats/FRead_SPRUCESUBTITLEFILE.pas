// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: Spruce Subtitle File subtitle format reading functionality

function FileToSubtitles_SPRUCESUBTITLEFILE(var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; FPS: Single; ExtraTime: Integer): Boolean;
var
  i           : Integer;
  InitialTime : Integer;
  FinalTime   : Integer;
  Text        : String;
  Value       : String;  //added by adenry 2013.04.12
  Color       : String;  //added by adenry 2013.04.12
  Bold, Italic, UnderLined: Boolean; //added by adenry 2013.04.12
  
  //added by adenry: begin 2013.04.12
  function ConvertToSWTags(Text: String): String;
  var
    b,i,u: Boolean;
  begin
    {$IFNDEF VIPLAY}
    if NoInteractionWithTags = False then
    begin
    {$ENDIF}
  //READ AND CONVERT TAGS

      //Set Bold:
      if Bold then
        Text := '<b>' + Text;
      b := not Bold;
      while SmartPos('^B', Text, False) > 0 do
      begin
        if b then
          Text := ReplaceString(Text, '^B', '<b>', False) else
          Text := ReplaceString(Text, '^B', '</b>', False);
        b := not b;
      end;
      //Set Italic:
      if Italic then
        Text := '<i>' + Text;
      i := not Italic;
      while SmartPos('^I', Text, False) > 0 do
      begin
        if i then
          Text := ReplaceString(Text, '^I', '<i>', False) else
          Text := ReplaceString(Text, '^I', '</i>', False);
        i := not i;
      end;
      //Set UnderLined:
      if UnderLined then
        Text := '<u>' + Text;
      u := not UnderLined;
      while SmartPos('^U', Text, False) > 0 do
      begin
        if u then
          Text := ReplaceString(Text, '^U', '<u>', False) else
          Text := ReplaceString(Text, '^U', '</u>', False);
        u := not u;
      end;

      //Set color:
      if Color <> 'ffffff' then
        Text := '<c:#' + Color + '>' + Text + '</c>';

  //DELETE ALL TAGS:
      if WorkWithTags = False then
      begin
        Text := RemoveSWTags(Text, True, True, True, True);
      end else
      {$IFNDEF VIPLAY}
  //SINGLE TAGS MODE:
      if SingleTagsMode then
      {$ENDIF}
      begin
        Text := SetTagsForSingleTagsMode(Text);
      end

      {$IFNDEF VIPLAY}
      else
  //MULTI TAGS MODE:
      if MultiTagsMode then
      begin
        //Close all unclosed tags
        Text := CloseUnclosedTags(Text, '<b>', '</b>');
        Text := CloseUnclosedTags(Text, '<i>', '</i>');
        Text := CloseUnclosedTags(Text, '<u>', '</u>');
      end
      {$ENDIF};

    {$IFNDEF VIPLAY}
    end;
    {$ENDIF}
    Result := Text;
  end;
  //added by adenry: end

begin
  Bold := False;        //added by adenry 2013.04.12
  Italic := False;        //added by adenry 2013.04.12
  UnderLined := False;        //added by adenry 2013.04.12
  Color := 'ffffff'; //added by adenry 2013.04.12

  Result := False;
  try
    for i := 0 to tmpSubFile.Count-1 do
    if Copy(tmpSubFile[i], 1, 1)[1] in ['0'..'9'] then //only if it's not a command line, comment, or special function // added by adenry 2013.04.12
    begin
      InitialTime := HHMMSSFFTimeToMS(Copy(tmpSubFile[i], 1, 11), FPS);   // bdzl  - why 10? must be 11 ! //10 changed to 11 by adenry 2013.04.12
      FinalTime   := HHMMSSFFTimeToMS(Copy(tmpSubFile[i], 13, 11), FPS);  // bdzl  - why 10? must be 11 ! //10 changed to 11 by adenry 2013.04.12

      Text := ReplaceString(Copy(tmpSubFile[i], 25, Length(tmpSubFile[i])), '|', #13#10);

      Text := ConvertToSWTags(Text); //added by adenry 2013.04.12

      //removed by adenry: begin 2013.04.12
      //
      //// by Bedazzle 2005.11.16 start
      //if WorkWithTags = FALSE then
      //begin
      //  Text := ReplaceString(Copy(tmpSubFile[i], 25, Length(tmpSubFile[i])), '|', #13#10);
      //end else
      //begin
      //  Text := Copy(tmpSubFile[i], 25, Length(tmpSubFile[i]));
      //
      //  if SmartPos('^I', Text, False) <> 0 then
      //  begin
      //    Text := ReplaceString(Text, '^I', '');
      //    Text := '<i>' + ReplaceString(Text, '|', '|<i>') + '</i>';
      //  end;
      //
      //  if SmartPos('^U', Text, False) <> 0 then
      //  begin
      //    Text := ReplaceString(Text, '^U', '');
      //    Text := '<u>' + ReplaceString(Text, '|', '|<u>') + '</u>';
      //  end;
      //
      //  if SmartPos('^B', Text, False) <> 0 then
      //  begin
      //    Text := ReplaceString(Text, '^B', '');
      //    Text := '<b>' + ReplaceString(Text, '|', '|<b>' + '</b>');
      //  end;
      //
      //  Text := ReplaceString(Text, '|', #13#10);
      //end;
      //// by Bedazzle 2005.11.16 end
      //
      //removed by adenry: end

      if (InitialTime > -1) and (FinalTime > -1) then
        if (MaxDuration > 0) and ((FinalTime + ExtraTime) > MaxDuration) Then
          Subtitles.Add(InitialTime + ExtraTime, InitialTime + ExtraTime + MaxDuration, Text)
        else
          Subtitles.Add(InitialTime + ExtraTime, FinalTime + ExtraTime, Text);
    end else
    //added by adenry: begin 2013.04.12
    if Pos('$', tmpSubFile[i]) = 1 then
    begin
      Value := Copy(tmpSubFile[i], Pos('=', tmpSubFile[i])+1, MaxInt);
      Value := Trim(Value);
      Value := LowerCase(Value);
      if Pos('$Bold', tmpSubFile[i]) = 1 then
      begin
        if (Value = 'true') or (Value = '1') then
          Bold := True else
        if (Value = 'false') or (Value = '0') then
          Bold := False;
      end else
      if Pos('$Italic', tmpSubFile[i]) = 1 then
      begin
        if (Value = 'true') or (Value = '1') then
          Italic := True else
        if (Value = 'false') or (Value = '0') then
          Italic := False;
      end else
      if Pos('$UnderLined', tmpSubFile[i]) = 1 then
      begin
        if (Value = 'true') or (Value = '1') then
          UnderLined := True else
        if (Value = 'false') or (Value = '0') then
          UnderLined := False;
      end else
      if Pos('$ColorIndex3', tmpSubFile[i]) = 1 then
      begin

        //Currently, we use the default palatte:
        case StrToInt(Value) of
          0 : Color := '000000'; //Black      : 000, 000, 000
          1 : Color := '202020'; //Off-Black  : 032, 032, 032
          2 : Color := 'ffffff'; //White      : 255, 255, 255
          3 : Color := 'ff0000'; //Red        : 255, 000, 000
          4 : Color := '808080'; //Gray       : 128, 128, 128
          5 : Color := 'c0c0c0'; //Silver     : 192, 192, 192
          6 : Color := '00ffff'; //Aqua       : 000, 255, 255
          7 : Color := 'ff00ff'; //Fuschia    : 255, 000, 255
          8 : Color := 'ffff00'; //Yellow     : 255, 255, 000
          9 : Color := '000080'; //Navy       : 000, 000, 128
          10: Color := '008000'; //Green      : 000, 128, 000
          11: Color := '800000'; //Maroon     : 128, 000, 000
          12: Color := '008080'; //Teal       : 000, 128, 128
          13: Color := '800080'; //Purple     : 128, 000, 128
          14: Color := '808000'; //Olive      : 128, 128, 000
          15: Color := 'ffffff'; //White      : 255, 255, 255
        end;
      end;
    end;
    //added by adenry: end
  finally
    if Subtitles.Count > 0 then Result := True;
  end;
end;
