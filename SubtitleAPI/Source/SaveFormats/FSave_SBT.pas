// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: SBT subtitle format saving functionality

function SubtitlesToFile_SBT(Subtitles: TSubtitles; const FileName: String; From: Integer = -1; UpTo: Integer = -1): Boolean;
var
  tmpSubFile : TSubtitleFile;
  i          : Integer;
  Text       : String;
begin
  Result := True;
  tmpSubFile := TSubtitleFile.Create;
  try
    for i := From to UpTo do
    begin
      Subtitles.Text[i] := RemoveSWTags(Subtitles.Text[i], True, True, True);

      if StringCount(#13#10, Subtitles[i].Text) = 0 then
        Text := #13#10 + Subtitles[i].Text
      else if StringCount(#13#10, Subtitles[i].Text) = 1 then
        Text := Subtitles[i].Text
      else if StringCount(#13#10, Subtitles[i].Text) > 1 then
        Text := Copy(Subtitles[i].Text, 0, Pos(#13#10, Subtitles[i].Text) + 2) + ReplaceEnters(Copy(Subtitles[i].Text, Pos(#13#10, Subtitles[i].Text)+2, Length(Subtitles[i].Text)), ' ');

      tmpSubFile.Add(TimeToString(Subtitles[i].InitialTime, 'hh:mm:ss'), False);
      tmpSubFile.Add(TimeToString(Subtitles[i].FinalTime, 'hh:mm:ss'), False);
      tmpSubFile.Add(Text, False);
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
