// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: MicroDVD subtitle format reading functionality

function FileToSubtitles_MICRODVD(var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; FPS: Single; ExtraTime: Integer): Boolean;

  function ConvertToSWTags(Text: String; i: Integer): String;

    //added by adenry: begin 2013.04.11
		function MicroDVDTagsToSWTags(Text: String; UppercaseTags: Boolean): String;
		var
		  tagPos, tagEnd       : Integer;
		  CTag, YTag, Tag, Color  : String;
		  Bold, Italic, Underline : Boolean;
		begin
      //prepare
		  if UppercaseTags then
		  begin
		    CTag := '{C:$';
		    YTag := '{Y:';
		  end else
		  begin
		    CTag := '{c:$';
		    YTag := '{y:';
		  end;
		  Bold := False;
		  Italic := False;
		  Underline := False;
		  Color := '';
		  //search for style tags
		  tagPos := Pos(YTag, Text);
		  while tagPos > 0 do //for every {y: tag
		  begin
		    tagEnd := SmartPos('}', Text, True, tagPos+2); //get tag end -- }
		    if tagEnd > 0 then
		    begin
		      Tag := Copy(Text, tagPos, tagEnd-tagPos+1);
		      if Pos('i', Tag) > 0 then Italic := True;
		      if Pos('b', Tag) > 0 then Bold := True;
		      if Pos('u', Tag) > 0 then Underline := True;
		      Delete(Text, tagPos, tagEnd-tagPos+1);
		      tagPos := Pos(YTag, Text);
		    end else
		      break;
		  end;
		  //search for color tags
		  tagPos := Pos(CTag, Text);
		  while tagPos > 0 do //for every {c: tag
		  begin
		    tagEnd := SmartPos('}', Text, True, tagPos+2); //get tag end -- }
		    if tagEnd > 0 then
		    begin
		      Tag := Copy(Text, tagPos, tagEnd-tagPos+1);
		      if (Color = '') and (Length(Tag) = 11) then
		        if (Tag[5] in HexChars)and(Tag[6] in HexChars)and(Tag[7] in HexChars)and(Tag[8] in HexChars)and(Tag[9] in HexChars)and(Tag[10] in HexChars) then
		          Color := Tag[9] + Tag[10] + Tag[7] + Tag[8] + Tag[5] + Tag[6];
		      Delete(Text, tagPos, tagEnd-tagPos+1);
		      tagPos := Pos(CTag, Text);
		    end else
		      break;
		  end;
		  //set tags
		  if Underline then Text := '<u>' + RemoveSWTags(Text, False, False, UppercaseTags, False) + '</u>';
		  if Bold then Text := '<b>' + RemoveSWTags(Text, UppercaseTags, False, False, False) + '</b>';
		  if Italic then Text := '<i>' + RemoveSWTags(Text, False, UppercaseTags, False, False) + '</i>';
		  if Color <> '' then Text := '<c:#' + Color + '>' + Text + '</c>';
		  //set Result
		  Result := Text;
		end;
    //added by adenry: end

  var
    SubText: TStringList;
    j : Integer;
  begin
    {$IFNDEF VIPLAY}
    if NoInteractionWithTags = False then
    begin
    {$ENDIF}
      if WorkWithTags = True then
        {$IFNDEF VIPLAY}
  //SINGLE TAGS MODE
        if SingleTagsMode then //added by adenry 2013.04.11
        {$ENDIF}
        begin
          // Style tags
          if (SmartPos('{y:', Text, False) <> 0) and (Pos('}',Text) <> 0) then
          begin
            tmpSubFile[i] := Copy(Text, SmartPos('{y:', Text, False) + 3, SmartPos('}', Text, True, SmartPos('{y:', Text, False) + 3) - SmartPos('{y:', Text, False) - 3);

            if SmartPos('u', tmpSubFile[i], False) > 0 then
              Text := '<u>' + Text;
            if SmartPos('b', tmpSubFile[i], False) > 0 then
              Text := '<b>' + Text;
            if SmartPos('i', tmpSubFile[i], False) > 0 then
              Text := '<i>' + Text;
          end;
          // Color tags
          if (SmartPos('{c:$', Text, False) > 0) and (SmartPos('}', Text, True, SmartPos('{c:$', Text, False)) = (SmartPos('{c:$', Text, False) + 10)) then
            Text := '<c:#' + InvertHTMLColor(Copy(Text, SmartPos('{c:$', Text, False) + 4, 6)) + '>' + Text;
        end

        //added by adenry: begin 2013.04.11
        {$IFNDEF VIPLAY}
        else
  //MULTI TAGS MODE
        if MultiTagsMode then
        begin
          SubText := TStringList.Create;
          SubText.Clear;
          SubText.Text := Text;
          //convert line-specific tags (lowercase y and c)
          for j := 0 to SubText.Count - 1 do
            SubText[j] := MicroDVDTagsToSWTags(SubText[j], False);
          //convert subtitle-specific tags (uppercase Y and C)
          Text := SubText.Text;
          Delete(Text, Length(Text)-1, 2); //remove #13#10 at the end attached by the TStringList
          Text := MicroDVDTagsToSWTags(Text, True);
        end
        {$ENDIF};
        //added by adenry: end

      // Clean all {c:$bbggrr} and {y:style} tags, as well as all other tags - {f:fontname}, {s:size}, {H:charset}, {P:position}, {o:x-coordinate,y-coordinate}
      while (Pos('{', Text) <> 0) and (Pos('}', Text) <> 0) do
        Delete(Text, Pos('{', Text), Pos('}', Text) - Pos('{', Text) + 1);
    {$IFNDEF VIPLAY}
    end;
    {$ENDIF}
    Result := Text;
  end;

var
  i           : Integer;
  InitialTime : Integer;
  FinalTime   : Integer;
  Text        : String;
  DecimalSep  : Char;
begin
  Result := False;

  try
    for i := 0 to tmpSubFile.Count-1 do
    begin
      // DivXG400 FPS Info tag
      if Copy(tmpSubFile[i], 1, 6) = '{1}{1}' then
      begin
        DecimalSep       := DecimalSeparator;
        DecimalSeparator := '.';
        if IsInteger(Copy(tmpSubFile[i], 7, Length(tmpSubFile[i])), DecimalSeparator) then
          FPS := StrToFloat(Copy(tmpSubFile[i], 7, Length(tmpSubFile[i])));
        DecimalSeparator := DecimalSep;
      end else

      if (Pos('{', tmpSubFile[i]) = 1) and
         (Pos('}', tmpSubFile[i]) > 1) and
         (StringCount('{',tmpSubFile[i], True) >= 2) and
         (StringCount('}',tmpSubFile[i], True) >= 2) then
      begin
        InitialTime := FramesToTime(StrToIntDef(Copy(tmpSubFile[i], 2, Pos('}', tmpSubFile[i]) - 2), 0), FPS);
        Text := Copy(tmpSubFile[i], SmartPos('{', tmpSubFile[i], True, 2) + 1, SmartPos('}', tmpSubFile[i], True, Pos('}', tmpSubFile[i]) + 1) - (SmartPos('{', tmpSubFile[i], True, 2) + 1));
        if IsInteger(Text) then
          FinalTime := FramesToTime(StrToIntDef(Text, 0), FPS) else
          FinalTime := InitialTime + 2000;
        Text := ReplaceString(Copy(tmpSubFile[i], SmartPos('}', tmpSubFile[i], True, Pos('}', tmpSubFile[i]) + 1) + 1, Length(tmpSubFile[i])), '|', #13#10);

        if (InitialTime = 0) and (i > 0) then
        begin
          InitialTime := FramesToTime(StrToIntDef(Copy(tmpSubFile[i-1], SmartPos('{', tmpSubFile[i-1], True, 2) + 1, SmartPos('}', tmpSubFile[i-1], True, Pos('}', tmpSubFile[i-1]) + 1) - (SmartPos('{', tmpSubFile[i-1], True, 2) + 1)), 0), FPS);
          if InitialTime < 0 then InitialTime := 0;
        end;
        if (FinalTime = 0) and (i < tmpSubFile.Count-1) then
        begin
          FinalTime := FramesToTime(StrToIntDef(Copy(tmpSubFile[i+1], 2, Pos('}', tmpSubFile[i+1]) - 2), 0), FPS);
          if FinalTime < 0 then FinalTime := 0;
        end;

        Text := ConvertToSWTags(Text, i);

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
