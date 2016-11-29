// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: TMPlayer subtitle format saving functionality

function SubtitlesToFile_TMPLAYER(Subtitles: TSubtitles; const FileName: String; From: Integer = -1; UpTo: Integer = -1): Boolean;
var
  tmpSubFile          : TSubtitleFile;
  i                   : Integer;
  T1,T2, Line1, Line2 : String;
begin
  if TMPlayerAttributes.Assigned = False then
    TMPlayerAttributes.TypeOfFormat := 0;

  Result := True;
  tmpSubFile := TSubtitleFile.Create;
  try

    for i := From to UpTo do
    begin
      Subtitles.Text[i] := RemoveSWTags(Subtitles.Text[i], True, True, True);

      if TMPlayerAttributes.TypeOfFormat = 0 then
      begin
        //********************************//
        //    TMPlayer Multiline Format   //
        //********************************//
        Line1 := '';
        Line2 := '';
        T1 := TimeToString(Subtitles[i].InitialTime, 'hh:mm:ss');
        T2 := TimeToString(Subtitles[i].FinalTime, 'hh:mm:ss');

        if Pos(#13#10,Subtitles[i].Text) <> 0 then
        begin
          Line1 := Copy(Subtitles[i].Text,0,Pos(#13#10,Subtitles[i].Text)-1);
          Line2 := ReplaceEnters(Copy(Subtitles[i].Text, Pos(#13#10,Subtitles[i].Text) + 2, Length(Subtitles[i].Text)),' ');
        end
        else
        begin
          Line1 := Subtitles[i].Text;
          Line2 := '';
        end;

        // Tiempo inicial
        tmpSubFile.Add(T1 + ',1=' + Line1, False);
        tmpSubFile.Add(T1 + ',2=' + Line2, False);
        // Tiempo final
        tmpSubFile.Add(T2 + ',1=', False);
        tmpSubFile.Add(T2 + ',2=', False);
      end
      else
      begin
        //********************************//
        //    TMPlayer Time Structure 1   //
        //********************************//
        if TMPlayerAttributes.TypeOfFormat = 1 then
        begin
          T1 := TimeToString(Subtitles[i].InitialTime, 'hh:mm:ss') + ':';
          T2 := TimeToString(Subtitles[i].FinalTime, 'hh:mm:ss') + ':';
        end
        else
        //********************************//
        //    TMPlayer Time Structure 2   //
        //********************************//
        if TMPlayerAttributes.TypeOfFormat = 2 then
        begin
          T1 := TimeToString(Subtitles[i].InitialTime, 'h:mm:ss') + ':';
          T2 := TimeToString(Subtitles[i].FinalTime, 'h:mm:ss') + ':';
        end
        else
        //********************************//
        //    TMPlayer+ Time Structure 1  //
        //********************************//
        if TMPlayerAttributes.TypeOfFormat = 3 then
        begin
          T1 := TimeToString(Subtitles[i].InitialTime, 'hh:mm:ss') + '=';
          T2 := TimeToString(Subtitles[i].FinalTime, 'hh:mm:ss') + '=';
        end
        else
        //********************************//
        //    TMPlayer+ Time Structure 2  //
        //********************************//
        if TMPlayerAttributes.TypeOfFormat = 4 then
        begin
          T1 := TimeToString(Subtitles[i].InitialTime, 'h:mm:ss') + '=';
          T2 := TimeToString(Subtitles[i].FinalTime, 'h:mm:ss') + '=';
        end;
        tmpSubFile.Add(T1 + ReplaceEnters(Subtitles[i].Text,'|'), False);
        tmpSubFile.Add(T2, False);
      end;
    end;

    try
      tmpSubFile.SaveToFile(FileName);
    except
      Result := False;
    end;
  finally
    tmpSubFile.Free;

    //todo: why is this necessary?      
    if TMPlayerAttributes.Assigned = False then //= False added by adenry - bug fix
      TMPlayerAttributes.TypeOfFormat := -1;
  end;
end;
