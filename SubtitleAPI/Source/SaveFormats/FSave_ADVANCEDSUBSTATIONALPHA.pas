// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: Advanced SubStation Alpha subtitle format saving functionality

function SubtitlesToFile_ADVANCEDSUBSTATIONALPHA(Subtitles: TSubtitles; const FileName: String; From: Integer = -1; UpTo: Integer = -1): Boolean;
const
  Format = 'Format: Name, Fontname, Fontsize, PrimaryColour, SecondaryColour, OutlineColour, BackColour, Bold, Italic, Underline, StrikeOut, ScaleX, ScaleY, Spacing, Angle, BorderStyle, Outline, Shadow, Alignment, MarginL, MarginR, MarginV, Encoding';

  function GetASSStyleStr: String;
  var
    DSep : Char;
  begin
    DSep := DecimalSeparator;
    DecimalSeparator := '.';

    Result := Format;
    Result := ReplaceString(Result, 'Format: Name',     'Style: Default');
    Result := ReplaceString(Result, ' FontName',        ASSAttributes.FontName);
    Result := ReplaceString(Result, ' FontSize',        IntToStr(ASSAttributes.FontSize));
    Result := ReplaceString(Result, ' PrimaryColour',   '&H'+IntToHex(ASSAttributes.PrimaryColor, 8));
    Result := ReplaceString(Result, ' SecondaryColour', '&H'+IntToHex(ASSAttributes.SecondaryColor, 8));
    Result := ReplaceString(Result, ' OutlineColour',   '&H'+IntToHex(ASSAttributes.OutlineColour, 8));
    Result := ReplaceString(Result, ' BackColour',      '&H'+IntToHex(ASSAttributes.ShadowColor, 8));
    Result := ReplaceString(Result, ' Bold',            BoolToStr(ASSAttributes.Bold));
    Result := ReplaceString(Result, ' Italic',          BoolToStr(ASSAttributes.Italic));
    Result := ReplaceString(Result, ' Underline',       BoolToStr(ASSAttributes.Underline));
    Result := ReplaceString(Result, ' StrikeOut',       BoolToStr(ASSAttributes.StrikeOut));
    Result := ReplaceString(Result, ' ScaleX',          IntToStr(ASSAttributes.ScaleX));
    Result := ReplaceString(Result, ' ScaleY',          IntToStr(ASSAttributes.ScaleY));
    Result := ReplaceString(Result, ' Spacing',         IntToStr(ASSAttributes.Spacing));
    Result := ReplaceString(Result, ' Angle',           ASSAttributes.Angle);
    Result := ReplaceString(Result, ' BorderStyle',     IntToStr(ASSAttributes.BorderStyle));
    Result := ReplaceString(Result, ' Outline',         IntToStr(ASSAttributes.Outline));
    Result := ReplaceString(Result, ' Shadow',          IntToStr(ASSAttributes.Shadow));
    Result := ReplaceString(Result, ' Alignment',       IntToStr(ASSAttributes.Alignment));
    Result := ReplaceString(Result, ' MarginL',         IntToStr(ASSAttributes.MarginL));
    Result := ReplaceString(Result, ' MarginR',         IntToStr(ASSAttributes.MarginR));
    Result := ReplaceString(Result, ' MarginV',         IntToStr(ASSAttributes.MarginV));
    Result := ReplaceString(Result, ' Encoding',        IntToStr(ASSAttributes.Encoding));

    DecimalSeparator := DSep;
  end;

  function ConvertFromSWTags(Text: String): String;

		//added by adenry: begin 2013.04.11
		function SWTagsToASSTags(Text: String): String;
		var
		  SSAColor: String;
		  tagPos: Integer;
		  additional: Byte;
		begin
	    //1. REPLACE COLOR TAGS

	    //1.1. Get default SSA color - it will be used for the close tags
        SSAColor := ColorToHtml(ASSAttributes.PrimaryColor); //default is white
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
	    Text := ReplaceString(Text, '<u>', '{\u1}');
	    Text := ReplaceString(Text,'</u>', '{\u0}');
	
	    Result := Text;
		end;
		//added by adenry: end

  begin
    {$IFNDEF VIPLAY}
    if NoInteractionWithTags = False then
    begin
    {$ENDIF}
      if WorkWithTags then
      begin
        {$IFNDEF VIPLAY}
        if SingleTagsMode then //added by adenry 2013.04.11
        {$ENDIF}
        begin
          //removed by adenry: 2013.04.11
          //if Pos('<b>', Text) <> 0 then
          //  Text := '{\b1}' + Text + '{\b0}';
          //if Pos('<i>', Text) <> 0 then
          //  Text := '{\i1}' + Text + '{\i0}';
          //if Pos('<u>', Text) <> 0 then
          //  Text := '{\u1}' + Text + '{\u0}';

          //added by adenry: 2013.04.11
          Text := SetTagsForSingleTagsMode(Text, True);
          Text := SWTagsToASSTags(Text);
        end

        //added by adenry: begin 2013.04.11
        {$IFNDEF VIPLAY}
        else
        if MultiTagsMode then
        begin
          Text := SWTagsToASSTags(Text);
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

  if ASSAttributes.Assigned = False then
    with ASSAttributes do
    begin
      Title          := '<untitled>'; //added by adenry 11.08.2013
      Script         := '<unknown>';  //added by adenry 11.08.2013
      Collisions     := 'Normal';
      PlayResX       := 0; //modified by adenry, was 384
      PlayResY       := 0; //modified by adenry, was 288
      Timer          := '100.0000';
      FontName       := 'Tahoma';
      FontSize       := 24;
      PrimaryColor   := 16777215;
      SecondaryColor := 16777215;
      OutlineColour  := 16777215;
      ShadowColor    := 12632256;
      Bold           := True;
      Italic         := False;
      Underline      := False;
      StrikeOut      := False;
      ScaleX         := 100;
      ScaleY         := 100;
      Spacing        := 0;
      Angle          := '0.00';
      BorderStyle    := 1;
      Outline        := 2;
      Shadow         := 3;
      Alignment      := 2;
      MarginL        := 20;
      MarginR        := 20;
      MarginV        := 20;
      Encoding       := 1;
    end;

  tmpSubFile := TSubtitleFile.Create;
  try
    tmpSubFile.Add('[Script Info]', False);
    tmpSubFile.Add('Title: ' + ASSAttributes.Title, False);            //added by adenry 11.08.2013
    tmpSubFile.Add('Original Script: ' + ASSAttributes.Script, False); //added by adenry 11.08.2013
    tmpSubFile.Add('ScriptType: v4.00+', False);
    tmpSubFile.Add('Collisions: ' + ASSAttributes.Collisions, False);
    if ASSAttributes.PlayResX > 0 then                                 //added by adenry 11.08.2013
      tmpSubFile.Add('PlayResX: ' + IntToStr(ASSAttributes.PlayResX), False);
    if ASSAttributes.PlayResY > 0 then                                //added by adenry 11.08.2013
      tmpSubFile.Add('PlayResY: ' + IntToStr(ASSAttributes.PlayResY), False);
    tmpSubFile.Add('Timer: ' + ASSAttributes.Timer, False);
    tmpSubFile.Add('', False);
    tmpSubFile.Add('[V4+ Styles]', False);
    tmpSubFile.Add(Format, False);
    tmpSubFile.Add(GetASSStyleStr);
    tmpSubFile.Add('', False);
    tmpSubFile.Add('[Events]', False);
    tmpSubFile.Add('Format: Layer, Start, End, Style, Actor, MarginL, MarginR, MarginV, Effect, Text', False);

    for i := From to UpTo do
    begin
      tmpCad := Subtitles[i].Text;

      tmpCad := ConvertFromSWTags(tmpCad);

      tmpSubFile.Add('Dialogue: 0,' + TimeToString(Subtitles[i].InitialTime, 'h:mm:ss.zz') + ',' + TimeToString(Subtitles[i].FinalTime, 'h:mm:ss.zz') + ',Default,,0000,0000,0000,,'+ ReplaceEnters(tmpCad,'\N'), False);
    end;

    try
      tmpSubFile.SaveToFile(FileName);
    except
      Result := False;
    end;
  finally
    tmpSubFile.Free;

    //todo: why is this necessary?  
    if ASSAttributes.Assigned = False then
      with ASSAttributes do
      begin
        Title          := ''; //added by adenry 11.08.2013
        Script         := ''; //added by adenry 11.08.2013
        Collisions     := '';
        PlayResX       := 0;
        PlayResY       := 0;
        Timer          := '';
        FontName       := '';
        FontSize       := 0;
        PrimaryColor   := 0;
        SecondaryColor := 0;
        OutlineColour  := 0;
        ShadowColor    := 0;
        Bold           := False;
        Italic         := False;
        Underline      := False;
        StrikeOut      := False;
        ScaleX         := 0;
        ScaleY         := 0;
        Spacing        := 0;
        Angle          := '';
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
