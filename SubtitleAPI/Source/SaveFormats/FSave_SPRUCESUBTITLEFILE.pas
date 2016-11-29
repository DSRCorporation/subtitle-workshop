// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: Spruce Subtitle File subtitle format saving functionality

function SubtitlesToFile_SPRUCESUBTITLEFILE(Subtitles: TSubtitles; const FileName: String; const FPS: Single; From: Integer = -1; UpTo: Integer = -1): Boolean;
//const
//  SPFInfo : Array[0..63] of Byte =
//  ($80, $80, $80, $00, $00, $00, $00, $00, $00, $00, $00, $00, $FF, $FF, $FF, $00,
//   $80, $80, $80, $00, $C0, $C0, $C0, $00, $00, $FF, $FF, $00, $FF, $00, $FF, $00,
//   $FF, $FF, $00, $00, $00, $00, $80, $00, $00, $80, $00, $00, $80, $00, $00, $00,
//   $00, $80, $80, $00, $80, $00, $80, $00, $80, $80, $00, $00, $FF, $FF, $FF, $00);
var
  tmpSubFile         : TSubtitleFile;
  InitialTime        : String;
  FinalTime          : String;
  i                  : Integer;
  //tmpU, tmpI, tmpB   : boolean;    // by Bedazzle 2005.11.16 //removed by adenry
  tmpStr             : String;     // by Bedazzle 2005.11.16
//  Ext, FileNameSPF : String;
//  SPF              : TFileStream;
  Color              : String;  //added by adenry 2013.04.12
  ColorRemoved       : Boolean; //added by adenry 2013.04.12

  //added by adenry: begin 2013.04.12
  function ConvertFromSWTags(Text: String): String;
  begin
    {$IFNDEF VIPLAY}
    if NoInteractionWithTags = False then
    begin
    {$ENDIF}
  //DELETE ALL TAGS:
      if WorkWithTags = False then
        Text := RemoveSWTags(Text, True, True, True, True) else
      {$IFNDEF VIPLAY}
  //SINGLE TAGS MODE:
      begin
        if SingleTagsMode then
        {$ENDIF}
        begin
          Text := SetTagsForSingleTagsMode(Text, True);
        end
        {$IFNDEF VIPLAY}
        else
  //MULTI TAGS MODE:
        if MultiTagsMode then
        begin
          Text := CloseUnclosedTags(Text, '<b>', '</b>');
          Text := CloseUnclosedTags(Text, '<i>', '</i>');
          Text := CloseUnclosedTags(Text, '<u>', '</u>');
        end
        {$ENDIF};
  //CONVERT TAGS:
        Text := ReplaceString(Text, '<b>', '^B', False);
        Text := ReplaceString(Text,'</b>', '^B', False);
        Text := ReplaceString(Text, '<i>', '^I', False);
        Text := ReplaceString(Text,'</i>', '^I', False);
        Text := ReplaceString(Text, '<u>', '^U', False);
        Text := ReplaceString(Text,'</u>', '^U', False);
      end;
    {$IFNDEF VIPLAY}
    end;
    {$ENDIF}
    Result := Text;
  end;
  //added by adenry: end

begin
  Result := True;
  tmpSubFile := TSubtitleFile.Create;
  try

    tmpSubFile.Add('//Font select and font size', False);
    tmpSubFile.Add('$FontName       = Arial', False);
    tmpSubFile.Add('$FontSize       = 30', False);
    tmpSubFile.Add('', False);
    tmpSubFile.Add('//Character attributes (global)', False);
    tmpSubFile.Add('$Bold           = FALSE', False);
    tmpSubFile.Add('$UnderLined     = FALSE', False);
    tmpSubFile.Add('$Italic         = FALSE', False);
    tmpSubFile.Add('', False);
    tmpSubFile.Add('//Position Control', False);
    tmpSubFile.Add('$HorzAlign      = Center', False);
    tmpSubFile.Add('$VertAlign      = Bottom', False);
    tmpSubFile.Add('$XOffset        = 0', False);
    tmpSubFile.Add('$YOffset        = 0', False);
    tmpSubFile.Add('', False);
    tmpSubFile.Add('//Contrast Control', False);
    tmpSubFile.Add('$TextContrast           = 15', False);
    tmpSubFile.Add('$Outline1Contrast       = 8', False);
    tmpSubFile.Add('$Outline2Contrast       = 15', False);
    tmpSubFile.Add('$BackgroundContrast     = 0', False);
    tmpSubFile.Add('', False);
    tmpSubFile.Add('//Effects Control', False);
    tmpSubFile.Add('$ForceDisplay   = FALSE', False);
    tmpSubFile.Add('$FadeIn         = 0', False);
    tmpSubFile.Add('$FadeOut        = 0', False);
    tmpSubFile.Add('', False);
    tmpSubFile.Add('//Other Controls', False);
    tmpSubFile.Add('$TapeOffset          = FALSE', False);
    tmpSubFile.Add('//$SetFilePathToken  = <<:>>', False);
    tmpSubFile.Add('', False);
    tmpSubFile.Add('//Colors', False);
    tmpSubFile.Add('$ColorIndex1    = 0', False);
    tmpSubFile.Add('$ColorIndex2    = 1', False);
    tmpSubFile.Add('$ColorIndex3    = 2', False);
    tmpSubFile.Add('$ColorIndex4    = 3', False);
    tmpSubFile.Add('', False);
    tmpSubFile.Add('//Subtitles', False);

    ColorRemoved := True; //added by adenry 2013.04.12

    for i := From to UpTo do
    begin
      // by Bedazzle 2005.11.16 start
      // Subtitles.Text[i] := RemoveSWTags(Subtitles.Text[i], True, True, True);
      // by Bedazzle 2005.11.16 end

      // Time format is hh:mm:ss:ff
      InitialTime := TimeToString(Subtitles[i].InitialTime, 'hh:mm:ss:') +
                     PadLeft(IntToStr(GetMSInFrames(Subtitles[i].InitialTime, FPS)), '0', 2, False);

      FinalTime := TimeToString(Subtitles[i].FinalTime, 'hh:mm:ss:') +
                   PadLeft(IntToStr(GetMSInFrames(Subtitles[i].FinalTime, FPS)), '0', 2, False);

      tmpStr := ReplaceEnters(Subtitles[i].Text, '|'); //added by adenry 2013.04.12
      tmpStr := ConvertFromSWTags(tmpStr);             //added by adenry 2013.04.12

      //removed by adenry: begin 2013.04.12
      //// by Bedazzle 2005.11.16 start
      ////  tmpSubFile.Add(InitialTime + ',' + FinalTime + ',' + ReplaceEnters(Subtitles[i].Text, '|'), False);
      //tmpStr := Subtitles[i].Text;
      //if SmartPos('<i>', tmpStr, False) <> 0 then tmpI := TRUE else tmpI := FALSE;
      //if SmartPos('<u>', tmpStr, False) <> 0 then tmpU := TRUE else tmpU := FALSE;
      //if SmartPos('<b>', tmpStr, False) <> 0 then tmpB := TRUE else tmpB := FALSE;
      //
      //tmpStr := RemoveSWTags(Subtitles.Text[i], True, True, True);
      //tmpStr := ReplaceEnters(tmpStr, '|');
      //
      //if tmpI = TRUE then tmpStr := '^I' + ReplaceString(tmpStr, '|', '|^I');
      //if tmpU = TRUE then tmpStr := '^U' + ReplaceString(tmpStr, '|', '|^U');
      //if tmpB = TRUE then tmpStr := '^B' + ReplaceString(tmpStr, '|', '|^B');
      //// by Bedazzle 2005.11.16 end
      //removed by adenry: end

      //added by adenry: begin 2013.04.12
      //add control command line to set a color (for the entire sub only):
      if SmartPos('<c:#', tmpStr, False) > 0 then
      begin
        if Color <> Copy(tmpStr, SmartPos('<c:#', tmpStr, False)+4, 6) then
        begin
          Color := Copy(tmpStr, SmartPos('<c:#', tmpStr, False)+4, 6);
          //Default palette colors:
          //TODO: Approximate color instead of this...
          if Color = '000000' then tmpSubFile.Add('$ColorIndex3 = ' + IntToStr(0), False)  else //Black      : 000, 000, 000
          if Color = '202020' then tmpSubFile.Add('$ColorIndex3 = ' + IntToStr(1), False)  else //Off-Black  : 032, 032, 032
          if Color = 'ffffff' then tmpSubFile.Add('$ColorIndex3 = ' + IntToStr(2), False)  else //White      : 255, 255, 255
          if Color = 'ff0000' then tmpSubFile.Add('$ColorIndex3 = ' + IntToStr(3), False)  else //Red        : 255, 000, 000
          if Color = '808080' then tmpSubFile.Add('$ColorIndex3 = ' + IntToStr(4), False)  else //Gray       : 128, 128, 128
          if Color = 'c0c0c0' then tmpSubFile.Add('$ColorIndex3 = ' + IntToStr(5), False)  else //Silver     : 192, 192, 192
          if Color = '00ffff' then tmpSubFile.Add('$ColorIndex3 = ' + IntToStr(6), False)  else //Aqua       : 000, 255, 255
          if Color = 'ff00ff' then tmpSubFile.Add('$ColorIndex3 = ' + IntToStr(7), False)  else //Fuschia    : 255, 000, 255
          if Color = 'ffff00' then tmpSubFile.Add('$ColorIndex3 = ' + IntToStr(8), False)  else //Yellow     : 255, 255, 000
          if Color = '000080' then tmpSubFile.Add('$ColorIndex3 = ' + IntToStr(9), False)  else //Navy       : 000, 000, 128
          if Color = '008000' then tmpSubFile.Add('$ColorIndex3 = ' + IntToStr(10), False) else //Green      : 000, 128, 000
          if Color = '800000' then tmpSubFile.Add('$ColorIndex3 = ' + IntToStr(11), False) else //Maroon     : 128, 000, 000
          if Color = '008080' then tmpSubFile.Add('$ColorIndex3 = ' + IntToStr(12), False) else //Teal       : 000, 128, 128
          if Color = '800080' then tmpSubFile.Add('$ColorIndex3 = ' + IntToStr(13), False) else //Purple     : 128, 000, 128
          if Color = '808000' then tmpSubFile.Add('$ColorIndex3 = ' + IntToStr(14), False) else //Olive      : 128, 128, 000
          if Color = 'ffffff' then tmpSubFile.Add('$ColorIndex3 = ' + IntToStr(15), False) else //White      : 255, 255, 255
                                   tmpSubFile.Add('$ColorIndex3 = ' + IntToStr(8), False); //we better set SOME color than none...
          ColorRemoved := False;
        end;
      end else
        if not ColorRemoved then
        begin
          tmpSubFile.Add('$ColorIndex3 = ' + IntToStr(2), False);
          ColorRemoved := True;
        end;
      tmpStr := RemoveSWTags(tmpStr, False, False, False, True);
      //added by adenry: end

      tmpSubFile.Add(InitialTime + ',' + FinalTime + ',' + tmpStr, False);

    end;

{    // A CONTINUACION SE CREA EL ARCHIVO .SPF, PARA QUE? NPI!
    Ext := ExtractFileExt(FileName);
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
