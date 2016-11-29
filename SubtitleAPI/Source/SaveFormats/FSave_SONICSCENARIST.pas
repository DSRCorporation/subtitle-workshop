// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: Sonic Scenarist subtitle format saving functionality

function SubtitlesToFile_SONICSCENARIST(Subtitles: TSubtitles; const FileName: String; const FPS: Single; From: Integer = -1; UpTo: Integer = -1): Boolean;
var
  tmpSubFile : TSubtitleFile;
  Indice     : String;
  sFPS       : String;
  i          : Integer;
begin
  Result := True;
  tmpSubFile := TSubtitleFile.Create;

  if SonicScenaristAttributes.Assigned = False then
    with SonicScenaristAttributes do
    begin
      PAL       := True;
      Color0    := 3;
      Color1    := 4;
      Color2    := 3;
      Color3    := 9;
      Contrast0 := 0;
      Contrast1 := 15;
      Contrast2 := 15;
      Contrast3 := 15;
    end;

  if SonicScenaristAttributes.PAL = True then
    sFPS := 'PAL' else
    sFPS := 'NTSC';

  try
    tmpSubFile.Add('st_format 2', False);
    tmpSubFile.Add('Display_Start'+#9+'non_forced', False);
    tmpSubFile.Add('TV_Type'+#9#9+ sFPS, False);             // PAL o NTSC

    if (SonicScenaristAttributes.PAL = False) and
       (SonicScenaristAttributes.DropFrame = True) then
      tmpSubFile.Add('Tape_Type'+#9+'DROP', False) // NON_DROP o DROP
    else
      tmpSubFile.Add('Tape_Type'+#9+'NON_DROP', False);

    if SonicScenaristAttributes.PAL = True then
    begin
      tmpSubFile.Add('Pixel_Area'+#9+'(2 576)', False);         // 576 en PAL o 479 en NTSC
      tmpSubFile.Add('Display_Area'+#9+'(0 2 719 574)', False); // 574 en PAL o 479 en NTSC
    end
    else
    begin
      tmpSubFile.Add('Pixel_Area'+#9+'(2 479)', False);
      tmpSubFile.Add('Display_Area'+#9+'(0 2 719 479)', False);
    end;

    tmpSubFile.Add('Color'+#9+#9+ Format('(%d %d %d %d)',[SonicScenaristAttributes.Color3,SonicScenaristAttributes.Color2,SonicScenaristAttributes.Color1,SonicScenaristAttributes.Color0]), False);
    tmpSubFile.Add('Contrast'+#9+Format('(%d %d %d %d)',[SonicScenaristAttributes.Contrast3,SonicScenaristAttributes.Contrast2,SonicScenaristAttributes.Contrast1,SonicScenaristAttributes.Contrast0]), False);
    tmpSubFile.Add('E2'+#9+#9+'(0 0 255 ===)', False);
    tmpSubFile.Add('E1'+#9+#9+'(255 0 0 ===)', False);
    tmpSubFile.Add('PA'+#9+#9+'(0 0 0 ===)', False);
    tmpSubFile.Add('BG'+#9+#9+'(255 255 255 ===)', False);
    tmpSubFile.Add('Directory'+#9+'.', False);
    tmpSubFile.Add('#####################################################', False);
    tmpSubFile.Add('SP_NUMBER'+#9+'START'+#9#9+'END'+#9#9+'FILE_NAME', False);

    for i := From to UpTo do
    begin
      Subtitles.Text[i] := RemoveSWTags(Subtitles.Text[i], True, True, True);
      Indice := IntToStr(i+1);
      tmpSubFile.Add(Indice + #9#9 + MSToHHMMSSFFTime(Subtitles[i].InitialTime, FPS) + #9 + MSToHHMMSSFFTime(Subtitles[i].FinalTime, FPS) + #9 + ReplaceEnters(Subtitles[i].Text, ' '), False);
    end;

    try
      tmpSubFile.SaveToFile(FileName);
    except
      Result := False;
    end;
  finally
    tmpSubFile.Free;

    //todo: why is this necessary?      
    if SonicScenaristAttributes.Assigned = False then
      with SonicScenaristAttributes do
      begin
        PAL       := False;
        Color0    := 0;
        Color1    := 0;
        Color2    := 0;
        Color3    := 0;
        Contrast0 := 0;
        Contrast1 := 0;
        Contrast2 := 0;
        Contrast3 := 0;
      end;
  end;
end;
