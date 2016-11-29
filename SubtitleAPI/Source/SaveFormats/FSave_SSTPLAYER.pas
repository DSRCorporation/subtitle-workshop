// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: Stream SubText Player subtitle format saving functionality

function SubtitlesToFile_SSTPLAYER(Subtitles: TSubtitles; const FileName: String; From: Integer = -1; UpTo: Integer = -1): Boolean;
var
  tmpSubFile : TSubtitleFile;
  i          : Integer;
begin
  Result := True;
  tmpSubFile := TSubtitleFile.Create;
  try

    tmpSubFile.Add('SST 2.0.73', False);
    tmpSubFile.Add(';', False);
    tmpSubFile.Add(';This is a subtitles file.', False);
    tmpSubFile.Add(';Get the Stream Subtext Player at', False);
    tmpSubFile.Add(';http://hem.passagen.se/jmorones/Pages/StreamSubText.htm', False);
    tmpSubFile.Add(';', False);
    tmpSubFile.Add('[PROPERTIES]', False);
    tmpSubFile.Add('Title=Project title', False);
    tmpSubFile.Add('Author=Project author', False);
    tmpSubFile.Add('Copyright=Copyright', False);
    tmpSubFile.Add('Description=Project description', False);
    tmpSubFile.Add('Web=Web page', False);
    tmpSubFile.Add('MovieFile=Default.avi', False);
    tmpSubFile.Add('Width=640', False);
    tmpSubFile.Add('Height=480', False);
    tmpSubFile.Add('FrameRate=25.000', False);
    tmpSubFile.Add('Aspect=4:3', False);
    tmpSubFile.Add('PixelAspect=1.0000', False);
    tmpSubFile.Add('VideoStandard=PC', False);
    tmpSubFile.Add('BackColor=0,0,0', False);
    tmpSubFile.Add('Language=English', False);
    tmpSubFile.Add('Language2=', False);
    tmpSubFile.Add('Volume=0%', False);
    tmpSubFile.Add('FontSizePercent=0%', False);
    tmpSubFile.Add('BoxHeight=0', False);
    tmpSubFile.Add('TimeOffset=0', False);
    tmpSubFile.Add('AutoScaleText=0', False);
    tmpSubFile.Add('[SCRIPT]', False);

    for i := From to UpTo do
    begin
      Subtitles.Text[i] := RemoveSWTags(Subtitles.Text[i], True, True, True);
      tmpSubFile.Add(IntToStr(Subtitles[i].InitialTime) + #9 + IntToStr(Subtitles[i].FinalTime) + #9 +
                     '{\rtf1\ansi\ansicpg1252\deff0\deflang14346{\fonttbl{\f0\fnil\fcharset0 Arial;}{\f1\fnil\fcharset0 MS Sans Serif;}}~{\colortbl ;\red255\green255\blue255;}~\viewkind4\uc1\pard\cf1\lang1252\fs24 ' +
                     ReplaceEnters(Subtitles.Text[i], '\cf0\f1\fs17 ~\par \cf1\f0\fs24 ') +
                     '\cf0\f1\fs17 ~\par \pard\lang14346\fs17 ~\par }~'
                     , False);
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
