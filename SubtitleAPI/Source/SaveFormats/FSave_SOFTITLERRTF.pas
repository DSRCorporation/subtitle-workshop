// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: Softitler RTF subtitle format saving functionality

function SubtitlesToFile_SOFTITLERRTF(Subtitles: TSubtitles; const FileName: String; From: Integer = -1; UpTo: Integer = -1): Boolean;
var
  tmpSubFile  : TSubtitleFile;
  i, Index, a : Integer;
  Text        : String;
begin
  Result := True;
  tmpSubFile := TSubtitleFile.Create;
  try
    tmpSubFile.Add('{\rtf1\ansi\deff0\deftab720{\fonttbl{\f0\fswiss MS Sans Serif;}{\f1\froman\fcharset2 Symbol;}{\f2\fswiss\fcharset1 MS Sans Serif;}}', False);
    tmpSubFile.Add('{\colortbl\red0\green0\blue0;\red255\green255\blue255;}', False);
    tmpSubFile.Add('\deflang2058\pard\plain\f2\fs40\cf1 [1]', False);
    Index := 2;
    for i := From to UpTo do
    begin
      Text := RemoveSWTags(Subtitles.Text[i], True, True, True);
      Text := ReplaceString(Text, '�', '\''e1', True, False);
      Text := ReplaceString(Text, '�', '\''e9', True, False);
      Text := ReplaceString(Text, '�', '\''ed', True, False);
      Text := ReplaceString(Text, '�', '\''f3', True, False);
      Text := ReplaceString(Text, '�', '\''fa', True, False);
      Text := ReplaceString(Text, '�', '\''f1', True, False);
      Text := ReplaceString(Text, '�', '\''c1', True, False);
      Text := ReplaceString(Text, '�', '\''c9', True, False);
      Text := ReplaceString(Text, '�', '\''cd', True, False);
      Text := ReplaceString(Text, '�', '\''d3', True, False);
      Text := ReplaceString(Text, '�', '\''da', True, False);
      Text := ReplaceString(Text, '�', '\''d1', True, False);
      Text := ReplaceString(Text, '{', '\{', True, False);
      Text := ReplaceString(Text, '{', '\}', True, False);
      Text := ReplaceString(Text, '�', '\''a1', True, False);
      Text := ReplaceString(Text, '�', '\''bf', True, False);
      Text := ReplaceString(Text, '"', '\''94', True, False);
      Text := ReplaceString(Text, '�', '\''fb', True, False);
      Text := ReplaceString(Text, '�', '\''e4', True, False);
      Text := ReplaceString(Text, '�', '\''f9', True, False);
      Text := ReplaceString(Text, '�', '\''fb', True, False);
      Text := ReplaceString(Text, '�', '\''e4', True, False);
      Text := ReplaceString(Text, '�', '\''ea', True, False);
      Text := ReplaceString(Text, '�', '\''e7', True, False);
      Text := ReplaceString(Text, '�', '\''e0', True, False);
      Text := ReplaceString(Text, '�', '\''e8', True, False);
      Text := ReplaceString(Text, '�', '\''f9', True, False);
      Text := ReplaceString(Text, '_', '\''a3', True, False);
      Text := ReplaceString(Text, '�', '\''f5', True, False);
      Text := ReplaceString(Text, '�', '\''fc', True, False);
      Text := ReplaceString(Text, '�', '\''f6', True, False);
      Text := ReplaceString(Text, '�', '\''d7', True, False);
      Text := ReplaceString(Text, '�', '\''e5', True, False);
      Text := ReplaceString(Text, '�', '\''f2', True, False);
      Text := ReplaceString(Text, '�', '\''ee', True, False);

      if (i = 0) and (Subtitles[i].InitialTime <> 0) then
      begin
        tmpSubFile.Add('\par 00:00:00:00', False);
        tmpSubFile.Add('\par ' + TimeToString(Subtitles[i].InitialTime - 10, 'hh:mm:ss:zz'), False);
        tmpSubFile.Add('\par ', False);
        tmpSubFile.Add('\par [2]', False);
        Inc(Index);
      end;
      if i > 0 then
      begin
        tmpSubFile.Add('\par [' + IntToStr(Index) + ']', False);
        Inc(Index);
        tmpSubFile.Add('\par ' + TimeToString(Subtitles[i-1].FinalTime + 10, 'hh:mm:ss:zz'), False);
        tmpSubFile.Add('\par ' + TimeToString(Subtitles[i].InitialTime - 10, 'hh:mm:ss:zz'), False);
        tmpSubFile.Add('\par ', False);
        tmpSubFile.Add('\par [' + IntToStr(Index) + ']', False);
        Inc(Index);
      end;

      tmpSubFile.Add('\par ' + TimeToString(Subtitles[i].InitialTime, 'hh:mm:ss:zz'), False);
      tmpSubFile.Add('\par ' + TimeToString(Subtitles[i].FinalTime, 'hh:mm:ss:zz'), False);

      a := Pos(#13#10, Text);
      while a > 0 do
      begin
        tmpSubFile.Add('\par ' + Copy(Text, 1, a-1), False);
        Text := Copy(Text, a+2, Length(Text));
        a := Pos(#13#10, Text);
      end;
      tmpSubFile.Add('\par ' + Text, False);

    end;

    tmpSubFile.Add('\par ', False);
    tmpSubFile.Add('\par }}', False);

    try
      tmpSubFile.SaveToFile(FileName);
    except
      Result := False;
    end;
  finally
    tmpSubFile.Free;
  end;
end;
