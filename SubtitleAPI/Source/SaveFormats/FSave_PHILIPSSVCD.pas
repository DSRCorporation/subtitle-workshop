// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: Philips SVCD Designer subtitle format saving functionality

function SubtitlesToFile_PHILIPSSVCD(Subtitles: TSubtitles; const FileName: String; From: Integer = -1; UpTo: Integer = -1): Boolean;
var
  tmpSubFile : TSubtitleFile;
  i          : Integer;
begin
  Result := True;
  tmpSubFile := TSubtitleFile.Create;
  try

    tmpSubFile.Add('# PHILIPS SVCD DESIGNER 1.5 - 2.0 SUBTITLES FILE', False);
    tmpSubFile.Add('#', False);
    tmpSubFile.Add('[HEADER]', False);
    tmpSubFile.Add('TITLE'{+#9+#9+''}, False);             // TITULO!
    tmpSubFile.Add('FRAMERATE'+#9+'PAL', False);           // PAL o NTSC
// LA SIGUIENTE LINEA VA SOLO SI EL FRAMERATE ES NTSC!
//    tmpSubFile.Add('DROPFRAME'+#9+'NO', False);          // YES o NO
    tmpSubFile.Add('CONTRAST'+#9+'(0 15 15 15)', False);
    {tmpSubFile.Add('COLOR'+#9+#9+'(0 1 2 3)', False);
    tmpSubFile.Add('', False);
    tmpSubFile.Add('[PALETTE]', False);
    tmpSubFile.Add('0 (0, 0, 0)', False);
    tmpSubFile.Add('1 (255, 255, 255)', False);
    tmpSubFile.Add('2 (0, 0, 0)', False);
    tmpSubFile.Add('3 (128, 128, 128)', False);        }
    tmpSubFile.Add('', False);
    tmpSubFile.Add('[LIST]', False);

    for i := From to UpTo do
    begin
      Subtitles.Text[i] := RemoveSWTags(Subtitles.Text[i], True, True, True);
      tmpSubFile.Add(Subtitles[i].Text + ' ' + TimeToString(Subtitles[i].InitialTime, 'hh:mm:ss:zz') + ' ' + TimeToString(Subtitles[i].FinalTime, 'hh:mm:ss:zz') + ' 001 001 000 000', False);
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
