// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: Ulead DVD Workshop 2.0 subtitle format saving functionality

function SubtitlesToFile_ULEADDVDWORKSHOP2(Subtitles: TSubtitles; const FileName: String; const FPS: Single; alternative: boolean; From: Integer = -1; UpTo: Integer = -1): Boolean;
var
  tmpSubFile         : TSubtitleFile;
  i, count           : Integer;
  time1, time2       : shortstring;
begin
  Result := True;
  tmpSubFile := TSubtitleFile.Create;
  try

    tmpSubFile.Add('#Ulead subtitle format', False);
    tmpSubFile.Add('', False);
    tmpSubFile.Add('#Subtitle stream attribute begin', False);
    tmpSubFile.Add('#FR:' + Format('%.2f', [FPS]), False);
    tmpSubFile.Add('#Subtitle stream attribute end', False);
    tmpSubFile.Add('', False);
    tmpSubFile.Add('#Subtitle text begin', False);

    count := 0;
    for i := From to UpTo do
    begin
      // Time format is hh;mm;ss;ff

      if (alternative = FALSE) then  // "00;00;00;00"
        tmpSubFile.Add('#' + IntToStr(count) + ' ' +
                       MSToHHMMSSFFTime(Subtitles.InitialTime[i], FPS, ';') + ' ' +
                       MSToHHMMSSFFTime(Subtitles.FinalTime[i], FPS, ';') + #13#10 +
                       RemoveSWTags(Subtitles.Text[i], True, True, True)
                       )
      else
      begin   // "00:00:00.00"
        time1 := MSToHHMMSSFFTime(Subtitles.InitialTime[i], FPS, ';');
        time2 := MSToHHMMSSFFTime(Subtitles.FinalTime[i], FPS, ';');

        time1 := copy(time1, 1, 2) + ':' + copy(time1, 4, 2) + ':' + copy(time1, 7, 2) + '.' + copy(time1, 10,2);
        time2 := copy(time2, 1, 2) + ':' + copy(time2, 4, 2) + ':' + copy(time2, 7, 2) + '.' + copy(time2, 10,2);

        tmpSubFile.Add('#' + IntToStr(count) + ' ' +
                       time1 + ' ' +
                       time2 + #13#10 +
                       RemoveSWTags(Subtitles.Text[i], True, True, True)
                       );
      end;

      Inc(count);
    end;

    tmpSubFile.Add('#Subtitle text end', False);
    tmpSubFile.Add('', False);
    tmpSubFile.Add('#Subtitle text attribute begin', False);
    tmpSubFile.Add('#/R:1,' + IntToStr(count) + ' /FP:8  /FS:24', False);
    tmpSubFile.Add('#Subtitle text attribute end', False);

    try
      tmpSubFile.SaveToFile(FileName);
    except
      Result := False;
    end;
  finally
    tmpSubFile.Free;
  end;
end;
