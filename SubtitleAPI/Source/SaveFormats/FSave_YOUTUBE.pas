// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: YouTube subtitle format saving functionality

function SubtitlesToFile_YOUTUBE(Subtitles: TSubtitles; const FileName: String; From: Integer = -1; UpTo: Integer = -1): Boolean;
var
  tmpSubFile : TSubtitleFile;
  i : Integer;
  //p : Integer; //removed by adenry 2013.04.13
  //s : String;  //removed by adenry 2013.04.13
begin
  Result := True;
  tmpSubFile := TSubtitleFile.Create;
  try

    for i := From to UpTo do
    begin
      tmpSubFile.Add(TimeToString(Subtitles[i].InitialTime, 'h:mm:ss.zzz') + ',' + TimeToString(Subtitles[i].FinalTime, 'h:mm:ss.zzz'), False);

      {$IFNDEF VIPLAY}
      if NoInteractionWithTags = False then
      begin
      {$ENDIF}
        Subtitles.Text[i] := RemoveSWTags(Subtitles.Text[i], True, True, True, True); //added by adenry 2013.04.13 - sbv does not support any tags
        //removed by adenry: begin 2013.04.13
        //if WorkWithTags = False then
        //  Subtitles.Text[i] := RemoveSWTags(Subtitles.Text[i], True, True, True) else
        //begin
        //  Subtitles.Text[i] := RemoveSWTags(Subtitles.Text[i], False, False, False, True);
        //end;
        //removed by adenry: end
      {$IFNDEF VIPLAY}
      end;
      {$ENDIF}

      //removed by adenry: begin 2013.04.13 - why does it have to be so difficult?
      //// strip CR anv leave LF
      //s := Subtitles[i].Text;
      //p := pos(#13, s);
      //while p > 0 do
      //begin
      //  s := copy(s, 1, p-1) + copy(s, p+1, length(s)-p);
      //  p := pos(#13, s);
      //end;
      //
      //tmpSubFile.Add(s, False);
      //removed by adenry: end

      tmpSubFile.Add(ReplaceString(Subtitles[i].Text, #13, ''), False); //added by adenry 2013.04.13 - strip CR

      tmpSubFile.Add('', False);
    end;

    try
      tmpSubFile.SaveToFile(FileName, tlbsLF);  // Save line feed (LF) only
    except
      Result := False;
    end;
  finally
    tmpSubFile.Free;
  end;
end;
