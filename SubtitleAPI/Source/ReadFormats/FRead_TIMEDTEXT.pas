// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: Timed Text subtitle format reading functionality

function FileToSubtitles_TIMEDTEXT(var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; ExtraTime: Integer): Boolean;
type
  TXMLState = (xsNone, xsSubtitleHeader, xsSubtitleText);

var
  XML         : TXMLParser;
  State       : set of TXMLState;
  Tag         : String;
  InitialTime : Integer;
  FinalTime   : Integer;
  Text        : String;

  function GetTimeValue(const ID: String): Integer;
  var
    S: String;
  begin
    S := XML.CurAttr.Value(ID);
    //Result := StrToInt(Copy(S, 1, Length(S)-1)) * 1000; //removed by adenry 2013.04.13
    //added by adenry: begin 2013.04.13
    try
      Result := Trunc(StrToFloat(Copy(S, 1, Length(S)-1)) * 1000);
    except
      Result := 0;
    end;
    //added by adenry: end    
  end;

begin
  Result := False;
  State  := [xsNone];
  XML    := TXMLParser.Create;

  DecimalSeparator := '.'; //added by adenry 2013.04.13

  with XML do
  try
    tmpSubFile.Text := ReplaceString(tmpSubFile.Text, '<br/>', #17); //added by adenry 2013.04.13
    LoadFromBuffer(PChar(tmpSubFile.Text));
    InitialTime := -1; //added by adenry 2013.04.13
    FinalTime   := -1; //added by adenry 2013.04.13
    StartScan;
    while Scan do
    begin
      Tag := LowerCase(CurName);
      //InitialTime := -1; //removed by adenry 2013.04.13
      //FinalTime   := -1; //removed by adenry 2013.04.13

      case CurPartType of
        ptStartTag : begin

          if Tag = 'div' then
                       Include(State, xsSubtitleHeader) else //added by adenry 2013.04.13
          if Tag = 'p' then //added by adenry 2013.04.13
                     if (xsSubtitleHeader in State) then //added by adenry 2013.04.13
                     begin
                       //Include(State, xsSubtitleHeader); //removed by adenry 2013.04.13
                       InitialTime := GetTimeValue('begin');
                       FinalTime   := GetTimeValue('end');
                       Include(State, xsSubtitleText); //added by adenry 2013.04.13
                     end;
                     //else if (xsSubtitleHeader in State) and (Tag = 'p') then //removed by adenry 2013.04.13
                     //  Include(State, xsSubtitleText);                        //removed by adenry 2013.04.13
        end;

        ptEndTag   : if Tag = 'p' then
                       Exclude(State, xsSubtitleText)
                     else if Tag = 'div' then
                       Exclude(State, xsSubtitleHeader)
                     else if Tag = 'body' then
                       Break;

        ptContent  : //if tag = 'p' then
                      if (xsSubtitleText in State) then
                      begin
                        Text := ReplaceString(XML.CurContent, #17, #13#10); //'|' replaced with #17 by adenry 2013.04.13
                        //moved in here by adenry: 2013.04.13
                        if (InitialTime > -1) and (FinalTime > -1) then
                        begin
                          if (MaxDuration > 0) and ((FinalTime + ExtraTime) > MaxDuration) Then
                            Subtitles.Add(InitialTime + ExtraTime, InitialTime + ExtraTime + MaxDuration, Text)
                          else
                            Subtitles.Add(InitialTime + ExtraTime, FinalTime + ExtraTime, Text);
                        end;
                        InitialTime := -1; //added by adenry 2013.04.13
                        FinalTime   := -1; //added by adenry 2013.04.13
                      end;
      end;
      
    end;
  finally
    Free;
    if Subtitles.Count > 0 then Result := True;
  end;
end;
