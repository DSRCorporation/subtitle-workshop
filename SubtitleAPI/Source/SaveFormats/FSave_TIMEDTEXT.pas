// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: Timed Text subtitle format saving functionality

function SubtitlesToFile_TIMEDTEXT(Subtitles: TSubtitles; const FileName: String; const charset: Byte = DEFAULT_CHARSET; const utf8: Boolean = False; From: Integer = -1; UpTo: Integer = -1): Boolean;
var
  tmpSubFile  : TSubtitleFile;
  doc         : TTtmlDocument;
  pBuilder    : TParagraphBuilder;
  encoding    : SubtitleString;
  i           : Integer;
begin
  Result := True;

  if utf8 then
    encoding := 'UTF-8'
  else
    encoding := GetCharsetEncoding(charset);

  doc := TTtmlDocument.Create(encoding, ExtractFileName(FileName));
  pBuilder := TParagraphBuilder.Create(charset, utf8);

  doc.AppendParagraphs(pBuilder.BuildParagraphs(Subtitles, From, UpTo));

  tmpSubFile := TSubtitleFile.Create;
  try
    for i := 0 to doc.XML.Count - 1 do
      tmpSubFile.Add(doc.XML[i], False);

    try
      tmpSubFile.SaveToFile(FileName);
    except
      Result := False
    end;
    
  finally
    tmpSubFile.Free;
    pBuilder.Destroy;
    doc.Destroy;
  end;
end;
