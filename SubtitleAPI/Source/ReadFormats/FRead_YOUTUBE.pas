// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: YouTube subtitle format reading functionality

function FileToSubtitles_YOUTUBE(var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; ExtraTime: Integer): Boolean;
var
  i, c        : Integer;
  InitialTime : Integer;
  FinalTime   : Integer;
  Text        : String;
begin
  Result := False;
  try
    for i := 0 to tmpSubFile.Count-1 do
    begin
      // 123456789_123456789_123
      // 0:00:01.000,0:00:32.559
      InitialTime := StringToTime(Copy(tmpSubFile[i], 1, 11));
      FinalTime   := StringToTime(Copy(tmpSubFile[i], 13, 11));
      if (InitialTime > -1) and (FinalTime > -1) then
      begin
        c    := 1;
        Text := '';
        while (i+c <= (tmpSubFile.Count-1))
          //and (Pos(',', tmpSubFile[i+c]) = 0) //removed by adenry - text lines can contain commas! 2013.04.13
          do
        begin
          //added by adenry: begin 2013.04.13
          if (Length(tmpSubFile[i+c]) = 23)
          and(Copy(tmpSubFile[i+c], 12, 1)=',')
          and(TimeInFormat(Copy(tmpSubFile[i+c], 1, 11), 'h:mm:ss.zzz'))
          and(TimeInFormat(Copy(tmpSubFile[i+c], 13,11), 'h:mm:ss.zzz'))
          then
            break;
          //added by adenry: end
          If Text <> '' then
            Text := Text + #13#10 + tmpSubFile[i+c]
          else
            Text := tmpSubFile[i+c];
          Inc(c);
        end;

        {$IFNDEF VIPLAY}
        if NoInteractionWithTags = False then
        begin
        {$ENDIF}
          if WorkWithTags = False then
          begin
            Text := ReplaceString(Text, '<i>', '');
            Text := ReplaceString(Text, '<b>', '');
            Text := ReplaceString(Text, '<u>', '');

            Text := ReplaceString(Text, '</i>', '');
            Text := ReplaceString(Text, '</b>', '');
            Text := ReplaceString(Text, '</u>', '');
{          end else
          begin
            if Pos('<u>',Text) <> 0 then
            begin
              Text := ReplaceString(Text,'<u>','');
              Text := '<u>' + Text;
            end;
            if Pos('<b>',Text) <> 0 then
            begin
              Text := ReplaceString(Text,'<b>','');
              Text := '<b>' + Text;
            end;
            if Pos('<i>',Text) <> 0 then
            begin
              Text := ReplaceString(Text,'<i>','');
              Text := '<i>' + Text;
            end;}
          end;
        {$IFNDEF VIPLAY}
        end;
        {$ENDIF}

        if (MaxDuration > 0) and ((FinalTime + ExtraTime) > MaxDuration) Then
          Subtitles.Add(InitialTime + ExtraTime, InitialTime + ExtraTime + MaxDuration, Text)
        else
          Subtitles.Add(InitialTime + ExtraTime, FinalTime + ExtraTime, Text);
      end;
    end;
  finally
    if Subtitles.Count > 0 then Result := True;
  end;
end;
