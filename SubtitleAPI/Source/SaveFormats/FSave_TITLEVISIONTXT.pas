// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: Titlevision subtitle format saving functionality

function SubtitlesToFile_TITLEVISIONTXT (Subtitles: TSubtitles; const FileName: String; From: Integer = -1; UpTo: Integer = -1)                    : Boolean;
//var
//  tmpSubFile          : TSubtitleFile;
//  i                   : Integer;
//  T1,T2, Line1, Line2 : String;
begin
  if TMPlayerAttributes.Assigned = False then
    TMPlayerAttributes.TypeOfFormat := 0;

  Result := True;
end;
