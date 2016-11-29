// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: Advanced SubStation Alpha subtitle format reading functionality

function FileToSubtitles_ADVANCEDSUBSTATIONALPHA(var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; ExtraTime: Integer): Boolean;

	//added by adenry: begin 2013.04.11
  function GetPrimaryColour: String;
  var
    i : Integer;
    Color: String;
    SSAFile, SSAStyle: TStringList;
    position: Byte;
  begin
	  //Get the SSA file default text color:
	  SSAStyle  := TStringList.Create;
	  SSAFile   := TStringList.Create;
	  try
	    //Get color string:
    SSAFile.Text := tmpSubFile.Text;

	    position := 0;
	    Color := '';
	    for i := 0 to SSAFile.Count do
	    if Pos('Format:', SSAFile[i]) > 0 then
	    begin
	      if Pos('PrimaryColour', SSAFile[i]) > 0 then
	      position := StringCount(',', Copy(SSAFile[i],0,Pos('PrimaryColour', SSAFile[i])), False) + 1;
	    end else
	    if Pos('Style:', SSAFile[i]) > 0 then
	      if position > 0 then
	      begin
	      Color := SSAFile[i];
	      Delete(Color, Pos('Style:', Color), 6);
	      TrimLeft(Color);
	      SplitDelimitedString(',', Color, SSAStyle);
	      Color := SSAStyle[position-1];
	      break;
	      end;
	  finally
	    SSAStyle.Free;
	    SSAFile.Free;
	  end;
	  //Convert the ssa default color to a proper html color value
    Color := ReplaceString(Color, '&H', '');
    if Length(Color) = 8 then
      Delete(Color, 1, 2);
    InvertHTMLColor2(Color); //convert to html color
    Result := Color;
  end;
  //added by adenry: end

  function ConvertToSWTags(Text: String; PrimaryColour: String): String;

    //added by adenry: begin 2013.04.11
		function ASSTagsToSWTags(Text, DefaultSSATextColor: String): String;
		var
		  tagPos, closeTagPos, subtagPos, c: Integer;
		  origTag, newTag, color: String;
		begin
		  tagPos := Pos('{\', Text); //get first tag
		  while tagPos > 0 do
		  begin
		    closeTagPos := SmartPos('}', Text, True, tagPos);
		    if closeTagPos < tagPos then
		      break else
		    begin
		      origTag := Copy(Text, tagPos, closeTagPos - tagPos + 1);
		      newTag := '';
		
		      //one SSA tag may contain one or several subtags
		      subtagPos := Pos('\', origTag);
		      while subtagPos > 0 do
		      begin
		        //check for bold, italic and underline
		        if origTag[subtagPos+1] in ['b', 'i', 'u'] then
		        begin
		          if Copy(origTag, subtagPos+2, 1) = '1' then
		            newTag := newTag + '<' + origTag[subtagPos+1] + '>' else
		          if Copy(origTag, subtagPos+2, 1) = '0' then
		            newTag := newTag + '</' + origTag[subtagPos+1] + '>';
		        end else
		        //check for color
		        begin
		          color := '';
		          c := 0;
		          if (Copy(origTag, subtagPos+1, 3) = 'c&H') then
		            c := 4 else
		          if (Copy(origTag, subtagPos+1, 4) = '1c&H') then
		            c := 5;
		          if c > 0 then
		          begin
		            //specifications of SSA say leading zeros for color tags are not required
		            if Copy(origTag, subtagPos+c+6, 1) = '&' then color := Copy(origTag, subtagPos+c, 6) else
		            if Copy(origTag, subtagPos+c+5, 1) = '&' then color := '0' + Copy(origTag, subtagPos+c, 5) else
		            if Copy(origTag, subtagPos+c+4, 1) = '&' then color := '00' + Copy(origTag, subtagPos+c, 4) else
		            if Copy(origTag, subtagPos+c+3, 1) = '&' then color := '000' + Copy(origTag, subtagPos+c, 3) else
		            if Copy(origTag, subtagPos+c+2, 1) = '&' then color := '0000' + Copy(origTag, subtagPos+c, 2) else
		            if Copy(origTag, subtagPos+c+1, 1) = '&' then color := '00000' + Copy(origTag, subtagPos+c, 1) else
		            if Copy(origTag, subtagPos+c, 1)   = '&' then color := '000000';
		
		            if InvertHTMLColor2(color) then
		            begin
		              //Check if the color is the subtitle file's default color. If it is, set the tag to a closing tag (</c>).
		              if color = DefaultSSATextColor then
		                newTag := newTag + '</c>' else
		                newTag := newTag + '<c:#' + color + '>';
		            end;
		
		          end;
		        end;
		        //get next subtag
		        subtagPos := SmartPos('\', origTag, True, subtagPos+1);
		      end;

		      Delete(Text, tagPos, Length(origTag)); //delete SSA tag
		      Insert(newTag, Text, tagPos); //insert converted tag
		    end;

		    tagPos := Pos('{\', Text); //get next tag
		  end;
		
		  Result := Text;
		end;
		//added by adenry: end

  var
    PosOpen, PosClose: Integer;    
  begin
    {$IFNDEF VIPLAY}
    if NoInteractionWithTags = False then
    begin
    {$ENDIF}

// removed by adenry: begin 2013.04.11
//          Text := ReplaceString(Text, '{\i0}', '');
//          Text := ReplaceString(Text, '{\b0}', '');
//
//          if WorkWithTags = False then
//          begin
//            Text := ReplaceString(Text, '{\i1}', '');
//            Text := ReplaceString(Text, '{\b1}', '');
//          end else
//          begin
//            if SmartPos('{\b1}', Text, False) <> 0 then
//            begin
//              Text := ReplaceString(Text, '{\b1}', '');
//              Text := '<b>' + Text + '</b>';
//            end;
//            if SmartPos('{\i1}', Text, False) <> 0 then
//            begin
//              Text := ReplaceString(Text, '{\i1}', '');
//              Text := '<i>' + Text + '</i>';
//            end;
//          end;
//
//          while (Pos('{', Text) > 0) and (Pos('}',Text) > (Pos('{', Text))) do
//            Delete(Text, Pos('{', Text), Pos('}', Text));
// removed by adenry: end

      //added by adenry: begin 2013.04.11
      if WorkWithTags = True then
      begin
        Text := ASSTagsToSWTags(Text, PrimaryColour);
        {$IFNDEF VIPLAY}
  //SINGLE TAGS MODE
        if SingleTagsMode then
        {$ENDIF}
        begin
          Text := SetTagsForSingleTagsMode(Text);
        end
        {$IFNDEF VIPLAY}
        else
  //MULTI TAGS MODE
        if MultiTagsMode then
        begin
          //close all unclosed tags
          Text := CloseUnclosedTags(Text, '<b>', '</b>');
          Text := CloseUnclosedTags(Text, '<i>', '</i>');
          Text := CloseUnclosedTags(Text, '<u>', '</u>');
          Text := CloseUnclosedTags(Text, '<c:#', '</c>');
        end
        {$ENDIF};
      end else
      begin
        // Remove all SSA tags { }
        PosOpen  := Pos('{\', Text);
        PosClose := Pos('}',Text);
        while (PosOpen > 0) and (PosClose > PosOpen) do
        begin
          Delete(Text, PosOpen, PosClose - PosOpen + 1);
          PosOpen  := Pos('{\', Text);
          PosClose := Pos('}',Text);
        end;
      end;
      //added by adenry: end

    {$IFNDEF VIPLAY}
    end;
    {$ENDIF}
    Result := Text;
  end;

var
  i, a        : Integer;
  InitialTime : Integer;
  FinalTime   : Integer;
  Text        : String;
  Color       : String; //added by adenry 2013.04.11
begin
  Result := False;

  try
    Color := GetPrimaryColour; //added by adenry 2013.04.11

    for i := 0 to tmpSubFile.Count-1 do
    begin
      a := Pos(',', tmpSubFile[i]);
      InitialTime := StringToTime(Trim(Copy(tmpSubFile[i], a + 1, SmartPos(',', tmpSubFile[i], True, a + 1) - (a + 1))));
      a := SmartPos(',', tmpSubFile[i], True, a + 1);
      FinalTime   := StringToTime(Trim(Copy(tmpSubFile[i], a + 1, SmartPos(',', tmpSubFile[i], True, a + 1) - (a + 1))));

      if (InitialTime > -1) and (FinalTime > -1) then
      begin
        Text := tmpSubFile[i];
        // Always 9 commas before text
        for a := 1 to 9 do
          Delete(Text, 1, Pos(',', Text));

        Text := ReplaceString(Trim(Text), '\N', #13#10);

        Text := ConvertToSWTags(Text, Color);

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
