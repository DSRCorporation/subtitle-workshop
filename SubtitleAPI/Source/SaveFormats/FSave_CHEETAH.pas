// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: Cheetah subtitle format saving functionality

function SubtitlesToFile_CHEETAH(Subtitles: TSubtitles; const FileName: String; From: Integer = -1; UpTo: Integer = -1): Boolean;
var
  tmpSubFile : TSubtitleFile;
  i          : Integer;
  SubIndex   : Integer;
begin
  Result := True;
  tmpSubFile := TSubtitleFile.Create;
  try
    tmpSubFile.Add('*NonDropFrame', False);
    tmpSubFile.Add('*Width 32', False);
    tmpSubFile.Add('', False);
    SubIndex := 1;
    for i := From to UpTo do
    begin
      Subtitles.Text[i] := RemoveSWTags(Subtitles.Text[i], True, True, True);;
      
      tmpSubFile.Add('** Caption Number '+ IntToStr(SubIndex), False);
      tmpSubFile.Add('*PopOn', False);
      tmpSubFile.Add('*T ' + TimeToString(Subtitles[i].InitialTime, 'hh:mm:ss:zz'), False);
      tmpSubFile.Add('*BottomUp', False);
      tmpSubFile.Add('*Lf01', False);
      tmpSubFile.Add(Subtitles[i].Text, False);
      tmpSubFile.Add('', False);
      Inc(SubIndex);

      tmpSubFile.Add('** Caption Number '+ IntToStr(SubIndex), False);
      tmpSubFile.Add('*PopOn', False);
      tmpSubFile.Add('*T ' + TimeToString(Subtitles[i].FinalTime, 'hh:mm:ss:zz'), False);
      tmpSubFile.Add('*BottomUp', False);
      tmpSubFile.Add('*Lf01', False);
      tmpSubFile.Add('', False);
      tmpSubFile.Add('', False);
      Inc(SubIndex);
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
