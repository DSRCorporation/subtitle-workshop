// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: SubStation Alpha subtitle format saving functionality

function SubtitlesToFile_SUBSTATIONALPHA(Subtitles: TSubtitles; const FileName: String; From: Integer = -1; UpTo: Integer = -1): Boolean;
  const
    Format = 'Format: Name, Fontname, Fontsize, PrimaryColour, SecondaryColour, TertiaryColour, BackColour, Bold, Italic, BorderStyle, Outline, Shadow, Alignment, MarginL, MarginR, MarginV, AlphaLevel, Encoding';

  function GetSSAStyleStr: String;
  begin
    Result := Format;
    Result := ReplaceString(Result, 'Format: Name',     'Style: Default');
    Result := ReplaceString(Result, ' Fontname',        SSAAttributes.FontName);
    Result := ReplaceString(Result, ' Fontsize',        IntToStr(SSAAttributes.FontSize));
    Result := ReplaceString(Result, ' PrimaryColour',   IntToStr(SSAAttributes.PrimaryColor));
    Result := ReplaceString(Result, ' SecondaryColour', IntToStr(SSAAttributes.SecondaryColor));
    Result := ReplaceString(Result, ' TertiaryColour',  IntToStr(SSAAttributes.OutlineColour));
    Result := ReplaceString(Result, ' BackColour',      IntToStr(SSAAttributes.ShadowColor));
    Result := ReplaceString(Result, ' Bold',            BoolToStr(SSAAttributes.Bold));
    Result := ReplaceString(Result, ' Italic',          BoolToStr(SSAAttributes.Italic));
    Result := ReplaceString(Result, ' BorderStyle',     IntToStr(SSAAttributes.BorderStyle));
    Result := ReplaceString(Result, ' Outline',         IntToStr(SSAAttributes.Outline));
    Result := ReplaceString(Result, ' Shadow',          IntToStr(SSAAttributes.Shadow));
    Result := ReplaceString(Result, ' Alignment',       IntToStr(SSAAttributes.Alignment));
    Result := ReplaceString(Result, ' MarginL',         IntToStr(SSAAttributes.MarginL));
    Result := ReplaceString(Result, ' MarginR',         IntToStr(SSAAttributes.MarginR));
    Result := ReplaceString(Result, ' MarginV',         IntToStr(SSAAttributes.MarginV));
    Result := ReplaceString(Result, ' AlphaLevel',      '0');
    Result := ReplaceString(Result, ' Encoding',        IntToStr(SSAAttributes.Encoding));
  end;

  function ConvertFromSWTags(Text: String): String;

		//added by adenry: begin 2013.04.11
		function SWTagsToSSATags(Text: String): String;
		var
		  SSAColor: String;
		  tagPos: Integer;
		  additional: Byte;
		begin
	    //1. REPLACE COLOR TAGS

	    //1.1. Get default SSA color - it will be used for the close tags
        SSAColor := ColorToHtml(SSAAttributes.PrimaryColor); //default is white
	    SSAColor := '{\c&H' + SSAColor[5] + SSAColor[6] + SSAColor[3] + SSAColor[4] + SSAColor[1] + SSAColor[2] + '&}';
	
	    //1.2. </c> COLOR CLOSE TAGS: in SSA the equivalent to a color close tag is to set the primary color

	    //1.2.1. Remove closing tags for color at the end of the subtitle
	    tagPos := SmartPos('</c>', Text, False);
	    while tagPos > 0 do
	    begin
	      if RemoveSWTags(Copy(Text, tagPos, MaxInt), False, False, False, True) = '' then
	      begin
	        Text := Copy(Text, 1, tagPos-1);
	        break;
	      end else
	        tagPos := SmartPos('</c>', Text, False, tagPos+1);
	    end;
        //1.2.2. Set close tag (ssa default color)
	    Text := ReplaceString(Text, '</c>', SSAColor);

	    //1.3. <c:# COLOR OPEN TAGS:

	    tagPos := SmartPos('<c:#', Text, False);
	    while tagPos > 0 do
	    begin
	      additional := 0;
	      SSAColor := Copy(Text, tagPos+4, 6); //get color value
	      if (SSAColor[1] in HexChars) and (SSAColor[2] in HexChars) and (SSAColor[3] in HexChars) and (SSAColor[4] in HexChars) and (SSAColor[5] in HexChars) and (SSAColor[6] in HexChars) then
	      begin
	        SSAColor := '{\c&H' + SSAColor[5] + SSAColor[6] + SSAColor[3] + SSAColor[4] + SSAColor[1] + SSAColor[2] + '&}';
	        Insert(SSAColor, Text, tagPos);
	        additional := 13;
	      end;
	      tagPos := SmartPos('<c:#', Text, False, tagPos+4+additional);
	    end;
	    Text := RemoveSWTags(Text, False, False, False, True);
	
	    //2. REPLACE FONT STYLE TAGS
	    Text := ReplaceString(Text, '<b>', '{\b1}');
	    Text := ReplaceString(Text,'</b>', '{\b0}');
	    Text := ReplaceString(Text, '<i>', '{\i1}');
	    Text := ReplaceString(Text,'</i>', '{\i0}');
      // Unlike ASS, SSA does NOT support UNDERLINE tags, so we remove them:
	    Text := ReplaceString(Text, '<u>', '');
	    Text := ReplaceString(Text,'</u>', '');
	
	    Result := Text;
		end;
		//added by adenry: end

  begin
    {$IFNDEF VIPLAY}
    if NoInteractionWithTags = False then
    begin
    {$ENDIF}
      if WorkWithTags = True then
      begin
        {$IFNDEF VIPLAY}
        if SingleTagsMode then //added by adenry 2013.04.11
        {$ENDIF}
        begin
          //removed by adenry: 2013.04.11
          // Unlike ASS, SSA does NOT support UNDERLINE tags, so we don't save them
          //if Pos('<b>',Text) <> 0 then
          //  Text := '{\b1}' + Text + '{\b0}';
          //if Pos('<i>',Text) <> 0 then
          //  Text := '{\i1}' + Text + '{\i0}';

          //added by adenry:
          Text := SetTagsForSingleTagsMode(Text, True);
          Text := SWTagsToSSATags(Text);
        end

        //added by adenry: begin 2013.04.11
        {$IFNDEF VIPLAY}
        else
        if MultiTagsMode then
        begin
          Text := SWTagsToSSATags(Text);
        end
        {$ENDIF};
        //added by adenry: end
      end
      else //added by adenry 2013.04.11
        Text := RemoveSWTags(Text, True, True, True, True);
    {$IFNDEF VIPLAY}
    end;
    {$ENDIF}
    Result := Text;
  end;

var
  tmpSubFile : TSubtitleFile;
  i          : Integer;
  tmpCad     : String;
begin
  Result := True;

  if SSAAttributes.Assigned = False then
    with SSAAttributes do
    begin
      Title          := '<untitled>';
      Script         := '<unknown>';
      Collisions     := 'Normal';   //added by adenry 11.08.2013
      PlayResX       := 0;          //added by adenry 11.08.2013
      PlayResY       := 0;          //added by adenry 11.08.2013
      Timer          := '100.0000'; //added by adenry 11.08.2013
      FontName       := 'Tahoma';
      FontSize       := 24;
      PrimaryColor   := 16777215;
      SecondaryColor := 16777215;
      OutlineColour  := 16777215;
      ShadowColor    := 12632256;
      Bold           := True;
      Italic         := False;
      BorderStyle    := 1;
      Outline        := 1;
      Shadow         := 1;
      Alignment      := 6;
      MarginL        := 30;
      MarginR        := 30;
      MarginV        := 30;
      Encoding       := 0;
    end;

  tmpSubFile := TSubtitleFile.Create;
  try
    tmpSubFile.Add('[Script Info]', False);
    tmpSubFile.Add('Title: ' + SSAAttributes.Title, False);
    tmpSubFile.Add('Original Script: ' + SSAAttributes.Script, False);
    tmpSubFile.Add('ScriptType: v4.00', False);
    //added by adenry: begin 11.08.2013
    tmpSubFile.Add('Collisions: ' + SSAAttributes.Collisions, False);
    if SSAAttributes.PlayResX >0 then
      tmpSubFile.Add('PlayResX: ' + IntToStr(SSAAttributes.PlayResX), False);
    if SSAAttributes.PlayResY >0 then
      tmpSubFile.Add('PlayResY: ' + IntToStr(SSAAttributes.PlayResY), False);
    tmpSubFile.Add('Timer: ' + SSAAttributes.Timer, False);
    //added by adenry: end 11.08.2013
    tmpSubFile.Add('', False);
    tmpSubFile.Add('[V4 Styles]', False);
    tmpSubFile.Add(Format, False);
    tmpSubFile.Add(GetSSAStyleStr);
    tmpSubFile.Add('', False);
    tmpSubFile.Add('[Events]', False);
    tmpSubFile.Add('Format: Marked, Start, End, Style, Name, MarginL, MarginR, MarginV, Effect, Text', False);

    for i := From to UpTo do
    begin
      tmpCad := Subtitles[i].Text;

      tmpCad := ConvertFromSWTags(tmpCad);

      tmpSubFile.Add('Dialogue: Marked=0,' + TimeToString(Subtitles[i].InitialTime, 'h:mm:ss.zz') + ',' + TimeToString(Subtitles[i].FinalTime, 'h:mm:ss.zz') + ',Default,NTP,0000,0000,0000,!Effect,'+ ReplaceEnters(tmpCad,'\N'), False);
    end;

    try
      tmpSubFile.SaveToFile(FileName);
    except
      Result := False;
    end;
  finally
    tmpSubFile.Free;

    //todo: why is this necessary?    
    if SSAAttributes.Assigned = False then
      with SSAAttributes do
      begin
        Title          := '';
        Script         := '';
        Collisions     := ''; //added by adenry 11.08.2013
        PlayResX       := 0;  //added by adenry 11.08.2013
        PlayResY       := 0;  //added by adenry 11.08.2013
        Timer          := ''; //added by adenry 11.08.2013
        FontName       := '';
        FontSize       := 0;
        PrimaryColor   := 0;
        SecondaryColor := 0;
        OutlineColour  := 0;
        ShadowColor    := 0;
        Bold           := False;
        Italic         := False;
        BorderStyle    := 0;
        Outline        := 0;
        Shadow         := 0;
        Alignment      := 0;
        MarginL        := 0;
        MarginR        := 0;
        MarginV        := 0;
        Encoding       := 0;
      end;
  end;
end;
