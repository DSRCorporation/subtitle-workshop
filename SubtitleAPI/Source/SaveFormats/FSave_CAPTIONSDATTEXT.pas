// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: Captions DAT Text subtitle format saving functionality

function SubtitlesToFile_CAPTIONSDATTEXT(Subtitles: TSubtitles; const FileName: String; From: Integer = -1; UpTo: Integer = -1): Boolean;
var
  tmpSubFile : TSubtitleFile;
  i, a       : Integer;
  BigStr     : String;
  Text       : String;
begin
  Result := True;
  BigStr := '';

  tmpSubFile := TSubtitleFile.Create;
  try
    for i := From to UpTo do
    begin
      Text := RemoveSWTags(Subtitles.Text[i], True, True, True, True);

      BigStr := BigStr + '#T' + TimeToString(Subtitles[i].InitialTime, 'hmmsszzz') + '0' + IntToStr(Subtitles[i].FinalTime-Subtitles[i].InitialTime) + '0' + #13;
      a := Pos(#13#10, Text);
      while a > 0 do
      begin
        BigStr := BigStr + 'BG @015 A ' + Copy(Text, 1, a - 1) + #13;
        Text := Copy(Text, a + 2, Length(Text));
        a := Pos(#13#10, Text);
      end;

      BigStr := BigStr + 'BG @015 A ' + Text + #13;
    end;

    tmpSubFile.Add(#0#13 + BigStr + #26, False);
    try
      tmpSubFile.SaveToFile(FileName);
    except
      Result := False;
    end;
  finally
    tmpSubFile.Free;
  end;
end;
