// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: Timed Text subtitle format saving functionality

function SubtitlesToFile_TIMEDTEXT(Subtitles: TSubtitles; const FileName: String; From: Integer = -1; UpTo: Integer = -1): Boolean;
var
  tmpSubFile : TSubtitleFile;
  i          : Integer;
begin
  Result := True;
  tmpSubFile := TSubtitleFile.Create;
  with tmpSubFile do
  try
    //Add('<tt xml:lang="en" xmlns="http://www.w3.org/2006/10/ttaf1" xmlns:tts="http://www.w3.org/2006/10/ttaf1#style">', False); //removed by adenry 2013.04.13
    Add('<tt xml:lang="" xmlns="http://www.w3.org/ns/ttml">', False); //added by adenry 2013.04.13
    Add(' <head>', False);
    Add(' </head>', False);
    Add(' <body region="subtitleArea">', False); //region="subtitleArea" added by adenry 2013.04.13
    Add('   <div>', False); //added by adenry 2013.04.13

    DecimalSeparator := '.'; //added by adenry 2013.04.13

    for i := From to UpTo do
    begin
      {$IFNDEF VIPLAY}
      if NoInteractionWithTags = False then
      begin
      {$ENDIF}
        //if WorkWithTags = False then //removed by adenry 2013.04.13
          Subtitles.Text[i] := RemoveSWTags(Subtitles.Text[i], True, True, True, True);
      {$IFNDEF VIPLAY}
      end;
      {$ENDIF}
      //Add(Format('		<div xml:id="d%d" begin="%ds" dur="10s" end="%ds">', [i + 1, Subtitles[i].InitialTime div 1000, Subtitles[i].FinalTime div 1000]), False); //removed by adenry 2013.04.13
      //Add(Format('			<p xml:id="p%d" region="r1">%s</p>', [i + 1, Subtitles[i].Text]), False); //removed by adenry 2013.04.13
      //Add('		</div>', False); //removed by adenry 2013.04.13
      Add(Format('      <p xml:id="subtitle%d" begin="%.3fs" end="%.3fs">', [i + 1, Subtitles[i].InitialTime / 1000, Subtitles[i].FinalTime / 1000]), False); //added by adenry 2013.04.13
      Add(Format('        %s', [ReplaceString(Subtitles[i].Text, #13#10, '<br/>')]), False); //added by adenry 2013.04.13
      Add       ('      </p>', False); //added by adenry 2013.04.13
    end;

    Add('   </div>', False); //added by adenry 2013.04.13
    Add(' </body>', False);
    Add('</tt>', False);

    try
      tmpSubFile.SaveToFile(FileName);
    except
      Result := False;
    end;
  finally
    tmpSubFile.Free;
  end;
end;
