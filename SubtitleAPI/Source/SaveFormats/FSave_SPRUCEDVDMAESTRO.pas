// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: Spruce DVDMaestro subtitle format saving functionality

function SubtitlesToFile_SPRUCEDVDMAESTRO(Subtitles: TSubtitles; const FileName: String; const FPS: Single; From: Integer = -1; UpTo: Integer = -1): Boolean;
//const
//  SPFInfo : Array[0..63] of Byte =
//  ($80, $80, $80, $00, $00, $00, $00, $00, $00, $00, $00, $00, $FF, $FF, $FF, $00,
//   $80, $80, $80, $00, $C0, $C0, $C0, $00, $00, $FF, $FF, $00, $FF, $00, $FF, $00,
//   $FF, $FF, $00, $00, $00, $00, $80, $00, $00, $80, $00, $00, $80, $00, $00, $00,
//   $00, $80, $80, $00, $80, $00, $80, $00, $80, $80, $00, $00, $FF, $FF, $FF, $00);
var
  tmpSubFile : TSubtitleFile;
  Indice     : String;
  i          : Integer;
//  Ext, FileNameSPF : String;
//  SPF              : TFileStream;
begin
  Result := True;
  tmpSubFile := TSubtitleFile.Create;
  try

    tmpSubFile.Add('st_format'+#9+'2', False);
    tmpSubFile.Add('Display_Start'+#9+'non_forced', False);
    tmpSubFile.Add('TV_Type'+#9+#9+'PAL', False);             // PAL o NTSC
    tmpSubFile.Add('Tape_Type'+#9+'NON_DROP', False);         // NON_DROP o DROP
    tmpSubFile.Add('Pixel_Area'+#9+'(0 573)', False);         // 573 en PAL o 477 en NTSC
    tmpSubFile.Add('Directory', False);
    tmpSubFile.Add('', False);
    tmpSubFile.Add('SP_NUMBER' + #9 + 'START'+ #9#9 +'END'+ #9#9 +'FILE_NAME', False);
    tmpSubFile.Add('Color'+ #9 +'(0 1 2 3)', False);
    tmpSubFile.Add('Contrast'+ #9 +'(0 15 15 15)', False);

    for i := From to UpTo do
    begin
      Subtitles.Text[i] := RemoveSWTags(Subtitles.Text[i], True, True, True);
      Indice := PadLeft(IntToStr(i+1), '0', 4);

    // LA SIGUIENTE LINEA VA SOLO SI SE QUIERE GRABAR EL 'Extended Format'!
    //  tmpSubFile.Add('Display_Area	(000 000 719 573)', False); // 573 en PAL o 477 en NTSC
      tmpSubFile.Add(Indice + #9#9 + MSToHHMMSSFFTime(Subtitles[i].InitialTime, FPS) + #9 + MSToHHMMSSFFTime(Subtitles[i].FinalTime, FPS) + #9 + ReplaceString(Subtitles[i].Text, #13#10, ' '), False);
    end;

    // A CONTINUACION SE CREA EL ARCHIVO .SPF, PARA QUE? NPI!
{    Ext := ExtractFileExt(FileName);
    if  Ext <> '' then
      FileNameSPF := Copy(FileName, 1, Length(FileName)-Length(Ext))
    else
      FileNameSPF := FileName;

    FileNameSPF := FileNameSPF + '.spf';

    SPF := TFileStream.Create(FileNameSPF, fmCreate);
    try
      SPF.Seek(0, soFromBeginning);
      SPF.Write(SPFInfo, SizeOf(SPFInfo));
    finally
      SPF.Free;
    end;}

    try
      tmpSubFile.SaveToFile(FileName);
    except
      Result := False;
    end;
  finally
    tmpSubFile.Free;
  end;
end;
