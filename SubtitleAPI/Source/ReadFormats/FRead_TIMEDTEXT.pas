// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: Timed Text subtitle format reading functionality
function FileToSubtitles_TIMEDTEXT(var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; ExtraTime: Integer; charset: Byte; var DetectedEncoding: String): Boolean;
var
  parser: TTtmlParser;
begin
  parser := TTtmlParser.Create(charset, MaxDuration, ExtraTime);
  Result := parser.ParseTtml(tmpSubFile, Subtitles, DetectedEncoding);
end;
