// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: MicroDVD subtitle format saving functionality

function SubtitlesToFile_MICRODVD(Subtitles: TSubtitles; const FileName: String; const FPS: Single; From: Integer = -1; UpTo: Integer = -1): Boolean;

  function ConvertFromSWTags(Text: String): String;

		//added by adenry: begin 2013.04.11
		function SWTagsToMicroDVDTags(Text: String; UppercaseTags: Boolean): String;
		  function TextHasTag(Text, openTag, closeTag: String): Boolean;
		  begin
		    if (StringCount(openTag, Text, False) = 1) and (StringCount(closeTag, Text, False) <= 1)
		      and (SmartPos(openTag, Text, False) = 1) and (SmartPos(closeTag, Text, False) = Length(Text)-Length(closeTag)+1) then
		        Result := True else
		        Result := False;
		  end;
		var
		  Bold, Italic, Underline, Color: Boolean;
		  CTag, YTag, TheColor: String;
		  SL: TStringList;
		  i: Integer;
		begin
		  if UppercaseTags then
		  begin
		    CTag := '{C:$';
		    YTag := '{Y:';
		  end else
		  begin
		    CTag := '{c:$';
		    YTag := '{y:';
		  end;
		
		  Bold := TextHasTag(RemoveSWTags(Text, False, True, True, True), '<b>', '</b>');
		  if Bold then Text := RemoveSWTags(Text, True, False, False, False);
		
		  Italic := TextHasTag(RemoveSWTags(Text, True, False, True, True), '<i>', '</i>');
		  if Italic then Text := RemoveSWTags(Text, False, True, False, False);
		
		  Underline := TextHasTag(RemoveSWTags(Text, True, True, False, True), '<u>', '</u>');
		  if Underline then Text := RemoveSWTags(Text, False, False, True, False);
		
		  Color := TextHasTag(RemoveSWTags(Text, True, True, True, False), '<c:#', '</c>');
		  if Color then
		  begin
		    TheColor := Copy(Text, SmartPos('<c:#', Text, False) + 4, 6);
		    Text := RemoveSWTags(Text, False, False, False, True);
		  end else
		  begin
		    Color := TextHasTag(RemoveSWTags(Text, True, True, True, False), '<font color=#', '</font>');
		    if Color then
		    begin
		      TheColor := Copy(Text, SmartPos('<font color=#', Text, False) + 13, 6);
		      Text := RemoveSWTags(Text, False, False, False, True);
		    end;
		  end;
		
		  if UppercaseTags then
		  begin
		    SL := TStringList.Create;
		    SL.Text := Text;
		    for i := 0 to SL.Count - 1 do
		      SL[i] := SWTagsToMicroDVDTags(SL[i], False);
		    Text := SL.Text;
		    SL.Free;
		    Delete(Text, Length(Text)-1, 2); //remove #13#10 at the end attached by the TStringList
		  end;
		
		  if Bold or Italic or Underline then
		  begin
		    if Bold then YTag := YTag + 'b';
		    if Italic then YTag := YTag + 'i';
		    if Underline then YTag := YTag + 'u';
		    YTag := YTag + '}';
		    Text := YTag + Text;
		  end;
		
		  if Color then
		  begin
		    if (TheColor[1] in HexChars) and (TheColor[2] in HexChars) and (TheColor[3] in HexChars) and (TheColor[4] in HexChars) and (TheColor[5] in HexChars) and (TheColor[6] in HexChars) then
		    begin
		      CTag := CTag + TheColor[5] + TheColor[6] + TheColor[3] + TheColor[4] + TheColor[1] + TheColor[2] + '}';
		      Text := CTag + Text;
		    end;
		  end;
		
		  Result := Text;
		end;
		//added by adenry: end

  var
    tmpStyle   : String;
  begin
    {$IFNDEF VIPLAY}
    if NoInteractionWithTags = False then
    begin
    {$ENDIF}
      if WorkWithTags = True then
        {$IFNDEF VIPLAY}
        if SingleTagsMode then //added by adenry 2013.04.11
        {$ENDIF}
        begin
          // Styles
          tmpStyle := '';
          if Pos('<u>', Text) <> 0 then
            tmpStyle := tmpStyle + 'u';
          if Pos('<b>', Text) <> 0 then
            tmpStyle := tmpStyle + 'b';
          if Pos('<i>', Text) <> 0 then
            tmpStyle := tmpStyle + 'i';

          if tmpStyle <> '' then
            Text := '{Y:' + tmpStyle + '}' + Text;

          // Colors
          if Pos('<c:#', Text) > 0 then
            Text := '{C:$' + InvertHTMLColor(Copy(Text, Pos('<c:#', Text) + 4, 6)) + '}' + Text;
        end

        //added by adenry: begin 2013.04.11
        {$IFNDEF VIPLAY}
        else
        if MultiTagsMode then
        begin
          Text := SWTagsToMicroDVDTags(Text, True);
        end
        {$ENDIF};
        //added by adenry: end

        Text := RemoveSWTags(Text, True, True, True, True);
    {$IFNDEF VIPLAY}
    end;
    {$ENDIF}
    Result := Text;
  end;

var
  tmpSubFile : TSubtitleFile;
  i          : Integer;
  DecimalSep : Char;
begin
  Result := True;
  tmpSubFile := TSubtitleFile.Create;
  try
    // DivXG400 FPS Info tag
    DecimalSep       := DecimalSeparator;
    DecimalSeparator := '.';
    tmpSubFile.Add(Format('{1}{1}%.3f', [FPS]), False);
    DecimalSeparator := DecimalSep;

    for i := From to UpTo do
    begin
      Subtitles.Text[i] := ConvertFromSWTags(Subtitles.Text[i]);
      tmpSubFile.Add('{' + IntToStr(TimeToFrames(Subtitles[i].InitialTime, FPS)) + '}{' + IntToStr(TimeToFrames(Subtitles[i].FinalTime, FPS)) + '}' + ReplaceEnters(Subtitles[i].Text,'|'), False);
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
