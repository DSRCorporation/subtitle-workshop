// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: Sasami Script subtitle format saving functionality

function SubtitlesToFile_SASAMISCRIPT(Subtitles: TSubtitles; const FileName: String; From: Integer = -1; UpTo: Integer = -1): Boolean;
var
  tmpSubFile  : TSubtitleFile;
  tmpLines    : TSubtitleFile;
  i,a         : Integer;
  tmpText,Aux : String;
begin
  Result := True;
  tmpSubFile := TSubtitleFile.Create;
  tmpLines   := TSubtitleFile.Create;
  try
    tmpSubFile.Add(';Env.Movie.Width=320', False);
    tmpSubFile.Add(';Env.Movie.Height=240', False);
    tmpSubFile.Add(';Set.Slot=1', False);
    tmpSubFile.Add(';Set.Time.Delay=15000', False);
    tmpSubFile.Add(';Set.Alpha.End=256', False);
    tmpSubFile.Add(';Set.Alpha.Start=256', False);
    tmpSubFile.Add(';Set.Alpha.Step=-300', False);
    tmpSubFile.Add(';Set.Font.Style.Bold=0', False);
    tmpSubFile.Add(';Set.Font.Color=#FFFFFF', False);
    tmpSubFile.Add(';Set.Font.Outline.Color=#00101010', False);
    tmpSubFile.Add(';Set.Font.Outline2.Color=#01101010', False);
    tmpSubFile.Add(';Set.Font.Size=20', False);
    tmpSubFile.Add(';Set.Font.Face=Tahoma', False);
    tmpSubFile.Add(';Buffer.Push=1', False);

    for i := From to UpTo do
    begin
      Subtitles.Text[i] := RemoveSWTags(Subtitles.Text[i], True, True, True);
      tmpText := Subtitles.Text[i];

      tmpLines.Clear;

      if StringCount(#13#10, tmpText) > 0 then
      begin
        for a := 0 to StringCount(#13#10, tmpText) do
        begin
          if Pos(#13#10,tmpText) <> 0 then
            Aux := Copy(tmpText, 1, Pos(#13#10,tmpText)-1)
          else
            Aux := tmpText;

          tmpText := Copy(tmpText, Pos(#13#10,tmpText)+1,Length(tmpText));
          if Assigned(tmpLines) then
            tmpLines.Add(Aux);
        end;
      end
      else
        tmpLines.Add(tmpText);

      tmpSubFile.Add(';Buffer.Pop=1', False);
      tmpSubFile.Add(';Set.Time.Start=' + IntToStr(Subtitles.InitialTime[i]), False);

      for a := 0 to tmpLines.Count-1 do
      begin
        tmpSubFile.Add(';Set.Start.Position.x=160', False);
        tmpSubFile.Add(';Set.End.Position.x=160', False);
        tmpSubFile.Add(';Set.Start.Position.y=' + IntToStr(221 - (18 * (tmpLines.Count - a))), False);
        tmpSubFile.Add(';Set.End.Position.y=' + IntToStr(221 - (18 * (tmpLines.Count - a))), False);
        tmpSubFile.Add(tmpLines[a], False);
      end;

      tmpSubFile.Add(';Buffer.Pop=1', False);
      tmpSubFile.Add(';Set.Time.Start=' + IntToStr(Subtitles.FinalTime[i]), False);
      tmpSubFile.Add(';Set.Start.Position.x=160', False);
      tmpSubFile.Add(';Set.End.Position.x=160', False);
      tmpSubFile.Add(';Set.Start.Position.y=221', False);
      tmpSubFile.Add(';Set.End.Position.y=221', False);
      tmpSubFile.Add(' ', False);

    end;
    try
      tmpSubFile.SaveToFile(FileName);
    except
      Result := False;
    end;
  finally
    tmpSubFile.Free;
    tmpLines.Free;
  end;
end;
