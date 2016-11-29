// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: SubViewer 2.0 subtitle format saving functionality

function SubtitlesToFile_SUBVIEWER2(Subtitles: TSubtitles; const FileName: String; From: Integer = -1; UpTo: Integer = -1): Boolean;
  function GetSubViewer2FontStr(FontName: String; FontSize: Integer; Bold, Italic, Underline, StrikeOut: Boolean; Color: Integer): String;
  var
    StCol, StStyle, StSize, StFont : String;
  begin
    StCol := IntToHex((Color and $FFFFFF), 6);
    StStyle := 'no';
    If StrikeOut = True then StStyle := 'st';
    If Underline then StStyle := 'ud';
    If Bold = True then StStyle := 'bd';
    If Italic then StStyle := 'it';
    StSize := IntToStr(FontSize);
    StFont := FontName;
    Result := '[COLF]&H' + StCol + ',[STYLE]' + StStyle + ',[SIZE]' + StSize + ',[FONT]' + StFont;
  end;
var
  tmpSubFile : TSubtitleFile;
  i          : Integer;
  T1,T2      : String;
begin
  if SubViewer2Attributes.Assigned = False then
    with SubViewer2Attributes do
    begin
      Title     := '';
      Author    := '';
      Source    := '';
      Programa  := '';
      Path      := '';
      Delay     := 0;
      CDTrack   := 0;
      Comment   := '';
      FontName  := 'Tahoma';
      FontSize  := 24;
      FontColor := 0;
      Bold      := True;
      Italic    := False;
      Underline := False;
      StrikeOut := False;
    end;

  Result := True;
  tmpSubFile := TSubtitleFile.Create;
  try

    tmpSubFile.Add('[INFORMATION]', False);
    tmpSubFile.Add('[TITLE]' + SubViewer2Attributes.Title, False);
    tmpSubFile.Add('[AUTHOR]' + SubViewer2Attributes.Author, False);
    tmpSubFile.Add('[SOURCE]' + SubViewer2Attributes.Source, False);
    tmpSubFile.Add('[PRG]' + SubViewer2Attributes.Programa, False);
    tmpSubFile.Add('[FILEPATH]' + SubViewer2Attributes.Path, False);
    tmpSubFile.Add('[DELAY]' + IntToStr(SubViewer2Attributes.Delay), False);
    tmpSubFile.Add('[CD TRACK]' + IntToStr(SubViewer2Attributes.CDTrack), False);
    tmpSubFile.Add('[COMMENT]' + SubViewer2Attributes.Comment, False);
    tmpSubFile.Add('[END INFORMATION]', False);
    tmpSubFile.Add('[SUBTITLE]', False);
    tmpSubFile.Add(GetSubViewer2FontStr(SubViewer2Attributes.FontName,
                                        SubViewer2Attributes.FontSize,
                                        SubViewer2Attributes.Bold,
                                        SubViewer2Attributes.Italic,
                                        SubViewer2Attributes.Underline,
                                        SubViewer2Attributes.StrikeOut,
                                        SubViewer2Attributes.FontColor), False);

    for i := From to UpTo do
    begin
      Subtitles.Text[i] := RemoveSWTags(Subtitles.Text[i], True, True, True);

      T1 := TimeToString(Subtitles[i].InitialTime, 'hh:mm:ss.zz');
      T2 := TimeToString(Subtitles[i].FinalTime, 'hh:mm:ss.zz');
      tmpSubFile.Add(T1 + ',' + T2, False);
      tmpSubFile.Add(ReplaceEnters(Subtitles[i].Text,'[br]'), False);
      tmpSubFile.Add('', False);
    end;

    try
      tmpSubFile.SaveToFile(FileName);
    except
      Result := False;
    end;
  finally
    tmpSubFile.Free;

    //todo: why is this necessary?      
    if SubViewer2Attributes.Assigned = False then
      with SubViewer2Attributes do
      begin
        Assigned  := True;
        Title     := '';
        Author    := '';
        Source    := '';
        Programa  := '';
        Path      := '';
        Delay     := 0;
        CDTrack   := 0;
        Comment   := '';
        FontName  := '';
        FontSize  := 0;
        FontColor := 0;
        Bold      := False;
        Italic    := False;
        Underline := False;
        StrikeOut := False;
      end;
  end;
end;
