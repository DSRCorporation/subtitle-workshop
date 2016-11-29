// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: CPC-600 subtitle format saving functionality

function SubtitlesToFile_CPC600(Subtitles: TSubtitles; const FileName: String; From: Integer = -1; UpTo: Integer = -1): Boolean;
var
  tmpSubFile : TSubtitleFile;
  i          : Integer;
begin
  Result := True;
  tmpSubFile := TSubtitleFile.Create;
  try
    tmpSubFile.Add('~CPCC6.38~;UpperLower;PopOn;01;', False);
    for i := From to UpTo do
    begin
      Subtitles.Text[i] := RemoveSWTags(Subtitles.Text[i], True, True, True, True);;
      tmpSubFile.Add(TimeToString(Subtitles[i].InitialTime, 'hh:mm:ss:zz') + '_0NEN_' + ReplaceString(Subtitles[i].Text,#13#10,'\'), False);
      tmpSubFile.Add(TimeToString(Subtitles[i].FinalTime, 'hh:mm:ss:zz') + '_0NEN_');
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
