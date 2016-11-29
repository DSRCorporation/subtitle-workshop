// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: SubViewer 1.0 subtitle format saving functionality

function SubtitlesToFile_SUBVIEWER1(Subtitles: TSubtitles; const FileName: String; From: Integer = -1; UpTo: Integer = -1): Boolean;
var
  tmpSubFile : TSubtitleFile;
  i          : Integer;
begin
  if SubViewer1Attributes.Assigned = False then
    with SubViewer1Attributes do
    begin
      Title    := '';
      Author   := '';
      Source   := '';
      Programa := '';
      Path     := '';
      Delay    := 0;
    end;

  Result := True;
  tmpSubFile := TSubtitleFile.Create;
  try

    tmpSubFile.Add('[TITLE]', False);
    tmpSubFile.Add(SubViewer1Attributes.Title, False);
    tmpSubFile.Add('[AUTHOR]', False);
    tmpSubFile.Add(SubViewer1Attributes.Author, False);
    tmpSubFile.Add('[SOURCE]', False);
    tmpSubFile.Add(SubViewer1Attributes.Source, False);
    tmpSubFile.Add('[PRG]', False);
    tmpSubFile.Add(SubViewer1Attributes.Programa, False);
    tmpSubFile.Add('[FILEPATH]', False);
    tmpSubFile.Add(SubViewer1Attributes.Path, False);
    tmpSubFile.Add('[DELAY]', False);
    tmpSubFile.Add(IntToStr(SubViewer1Attributes.Delay), False);
    tmpSubFile.Add('[CD TRACK]', False);
    tmpSubFile.Add('0', False);
    tmpSubFile.Add('[BEGIN]', False);
    tmpSubFile.Add('******** START SCRIPT ********', False);

    for i := From to UpTo do
    begin
      Subtitles.Text[i] := RemoveSWTags(Subtitles.Text[i], True, True, True);
      if (Subtitles[i].InitialTime = Subtitles[i].FinalTime) then
        Subtitles.FinalTime[i] := Subtitles[i].InitialTime + 1000;
      tmpSubFile.Add('[' + TimeToString(Subtitles[i].InitialTime, 'hh:mm:ss') + ']', False);
      tmpSubFile.Add(ReplaceEnters(Subtitles[i].Text,'|'), False);
      tmpSubFile.Add('[' + TimeToString(Subtitles[i].FinalTime, 'hh:mm:ss') + ']', False);
      tmpSubFile.Add('', False);
    end;

    tmpSubFile.Add('[end]', False);
    tmpSubFile.Add('******** END SCRIPT ********', False);

    try
      tmpSubFile.SaveToFile(FileName);
    except
      Result := False;
    end;
  finally
    tmpSubFile.Free;
  end;
end;
