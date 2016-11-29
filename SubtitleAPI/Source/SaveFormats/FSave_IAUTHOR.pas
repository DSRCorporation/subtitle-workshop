// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: I-Author Script subtitle format saving functionality

function SubtitlesToFile_IAUTHOR(Subtitles: TSubtitles; const FileName: String; From: Integer = -1; UpTo: Integer = -1): Boolean;
var
  tmpSubFile : TSubtitleFile;
  tmpTiempo  : Single;
  i, c       : Integer;
  tmpNum     : String;
  dc         : Char;
begin
  Result := True;

  dc := DecimalSeparator;
  tmpSubFile := TSubtitleFile.Create;
  try
    c                := 1;
    DecimalSeparator := '.';

    for i := From to UpTo do
    begin
      Subtitles.Text[i] := RemoveSWTags(Subtitles.Text[i], True, True, True);

      tmpTiempo := Subtitles[i].InitialTime / 1000;
      If tmpTiempo > (256*c) Then inc(c);

      tmpTiempo := tmpTiempo - (256*(c-1));
      tmpNum    := LimitDecimals(tmpTiempo, 2);

      if Pos('.',tmpNum) = 0 then
        tmpNum := tmpNum + '.00';
      if Length(Copy(tmpNum,Pos('.',tmpNum)+1,Length(tmpNum))) < 2 then
        tmpNum := tmpNum + '0';

      tmpSubFile.Add('BMPFILE: ' + ReplaceEnters(Subtitles[i].Text,' '), False);
      tmpSubFile.Add('', False);
      tmpSubFile.Add('STARTTIME: ' + tmpNum, False);
      tmpSubFile.Add('', False);
      tmpSubFile.Add(Format('TIME: %s SETCOLOR Primary 0, 16, 128, 128',[tmpNum]), False);
      tmpSubFile.Add('', False);
      tmpSubFile.Add(Format('TIME: %s SETCOLOR Primary 1, 234, 128, 128',[tmpNum]), False);
      tmpSubFile.Add('', False);
      tmpSubFile.Add(Format('TIME: %s SETCOLOR Primary 2, 16, 128, 128',[tmpNum]), False);
      tmpSubFile.Add('', False);
      tmpSubFile.Add(Format('TIME: %s SETCOLOR Primary 3, 125, 128, 128',[tmpNum]), False);
      tmpSubFile.Add('', False);
      tmpSubFile.Add(Format('TIME: %s SETCOLOR Highlight 0, 16, 128, 128',[tmpNum]), False);
      tmpSubFile.Add('', False);
      tmpSubFile.Add(Format('TIME: %s SETCOLOR Highlight 1, 209, 146, 17',[tmpNum]), False);
      tmpSubFile.Add('', False);
      tmpSubFile.Add(Format('TIME: %s SETCOLOR Highlight 2, 81, 239, 91',[tmpNum]), False);
      tmpSubFile.Add('', False);
      tmpSubFile.Add(Format('TIME: %s SETCOLOR Highlight 3, 144, 35, 54',[tmpNum]), False);
      tmpSubFile.Add('', False);
      tmpSubFile.Add(Format('TIME: %s region 207, 170 to 432, 190',[tmpNum]), False);
      tmpSubFile.Add('', False);
      tmpSubFile.Add(Format('TIME: %s SETBLEND Primary 0, 15, 15, 15',[tmpNum]), False);
      tmpSubFile.Add('', False);
      tmpSubFile.Add(Format('TIME: %s SETBLEND Hightlight 0, 15, 15, 15',[tmpNum]), False);
      tmpSubFile.Add('', False);
      tmpSubFile.Add(Format('TIME: %s FIELDINDEX 0, 1',[tmpNum]), False);
      tmpSubFile.Add('', False);
      tmpSubFile.Add(Format('TIME: %s ENABLE_OGT',[tmpNum]), False);
      tmpSubFile.Add('', False);

      tmpTiempo := Subtitles[i].FinalTime / 1000;
      tmpTiempo := tmpTiempo - (256*(c-1));

      tmpNum    := LimitDecimals(tmpTiempo, 2);

      if Pos('.',tmpNum) = 0 then
        tmpNum := tmpNum + '.00';
      if Length(Copy(tmpNum,Pos('.',tmpNum)+1,Length(tmpNum))) < 2 then
        tmpNum := tmpNum + '0';

      tmpSubFile.Add(Format('TIME: %s DISABLE_OGT',[tmpNum]), False);
      tmpSubFile.Add('', False);
      tmpSubFile.Add('************ Page #' + IntToStr(i+1) + ' Finished ***************', False);
      tmpSubFile.Add('', False);
    end;
    try
      tmpSubFile.SaveToFile(FileName);
    except
      Result := False;
    end;
  finally
    tmpSubFile.Free;
    DecimalSeparator := dc;
  end;
end;
