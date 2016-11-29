// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: SubRip (WideString) subtitle format reading functionality

function FileToSubtitles_SUBRIP_W(var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; ExtraTime: Integer): Boolean;
var
  i, c        : Integer;
  InitialTime : Integer;
  FinalTime   : Integer;
  Text        : {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF};
begin
  Result := False;
  try
    for i := 0 to tmpSubFile.Count-1 do
    begin
      InitialTime := StringToTime(Copy(tmpSubFile[i], 1, 12));
      FinalTime   := StringToTime(Copy(tmpSubFile[i], 18, 12));
      if (InitialTime > -1) and (FinalTime > -1) then
      begin
        c    := 1;
        Text := '';
        while (i+c <= (tmpSubFile.Count-1)) and
              ((IsInteger(tmpSubFile[i+c]) = False) and
              (Pos(' --> ', tmpSubFile[i+c]) = 0)) do
        begin
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
