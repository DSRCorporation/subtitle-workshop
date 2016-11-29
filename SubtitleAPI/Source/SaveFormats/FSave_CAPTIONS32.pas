// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: Captions 32 subtitle format saving functionality

function SubtitlesToFile_CAPTIONS32(Subtitles: TSubtitles; const FileName: String; From: Integer = -1; UpTo: Integer = -1): Boolean;
var
  tmpSubFile : TSubtitleFile;
  i, c       : Integer;
  Text       : String;
begin
  Result := True;
  tmpSubFile := TSubtitleFile.Create;
  try
    for i := From to UpTo do
    begin
      Subtitles.Text[i] := ReplaceEnters(RemoveSWTags(Subtitles.Text[i], True, True, True), '|');

      c := StringCount('|', Subtitles.Text[i], False);
      if c = 0 then
      begin
        if Length(Subtitles.Text[i]) > 33 then
          Text := Copy(Subtitles.Text[i], 1, 33) else
          Text := PadRight(Subtitles.Text[i], ' ', 33, False);
        Text := PadRight(Text + '|', ' ', 67, False);
      end else
      begin
        if c > 1 then
        begin
          c := Pos('|', Subtitles.Text[i]);
          Subtitles.Text[i] := Copy(Subtitles.Text[i], 1, SmartPos('|', Subtitles.Text[i], False, c+1)-1);
        end;

        c := Pos('|', Subtitles.Text[i]);
        Text := Copy(Subtitles.Text[i], 1, c-1);
        if Length(Text) > 33 then
          Text := Copy(Text, 1, 33) else
          Text := PadRight(Text, ' ', 33, False);

        Text := Text + '|' + Copy(Subtitles.Text[i], c+1, Length(Subtitles.Text[i])-c);

        if Length(Text) > 67 then
          Text := Copy(Text, 1, 67)
        else
          Text := PadRight(Text, ' ', 67, False);
      end;

      tmpSubFile.Add(TimeToString(Subtitles[i].InitialTime, 'hh:mm:ss:zz') + ' , ' + TimeToString(Subtitles[i].FinalTime, 'hh:mm:ss:zz') + ' , ' + Text, False);
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
