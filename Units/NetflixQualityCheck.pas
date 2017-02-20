// This file is part of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle Workshop's copyright information
// File Description: Netflix quality check system functionality

unit NetflixQualityCheck;


interface

uses IniFiles;

procedure PerformNetflixQualityCheck(ShowSuccessMessages: Boolean);
procedure NetflixQualityCheckerLoadLanguage(LF: TIniFile);

implementation

uses Dialogs, formMain, TreeViewHandle, VirtualTrees, Classes, SysUtils,
  Functions, USubtitlesFunctions, Windows, Math;

type
  TGlyphArray = Array of Integer;

const
  FULL_TIMECODE: string = 'hh:mm:ss.zzz';
  CONTEXT_RADIUS: Integer = 6;

var
	GlyphCheckSuccessfull: string;
	GlyphCheckFailed: string;
	GlyphCheckReport: string;
	WhiteSpaceCheckSuccessfull: string;
	WhiteSpaceCheckFailed: string;
	WhiteSpaceCheckReport: string;
  SavingError: string;

  
// Language loder

procedure NetflixQualityCheckerLoadLanguage(LF: TIniFile);
begin
 	GlyphCheckSuccessfull := LF.ReadString('Netflix quality check', 'GlyphCheckSuccessfull',
    'Character validation successful.');
	GlyphCheckFailed := LF.ReadString('Netflix quality check', 'GlyphCheckFailed',
    'Character validation failed. Refer to the Netflix Glyph List for valid characters. Please see the full report here: %s.');
	GlyphCheckReport := LF.ReadString('Netflix quality check', 'GlyphCheckReport',
    'Invalid character %s found at column %d.');
	WhiteSpaceCheckSuccessfull := LF.ReadString('Netflix quality check', 'WhiteSpaceCheckSuccessfull',
    'White space validation successful.');
	WhiteSpaceCheckFailed := LF.ReadString('Netflix quality check', 'WhiteSpaceCheckFailed',
    'White space validation failed. Please see the full report here: %s.');
	WhiteSpaceCheckReport := LF.ReadString('Netflix quality check', 'WhiteSpaceCheckReport',
    'Invalid white space found at column %d.');
	SavingError := LF.ReadString('Netflix quality check', 'SavingError',
    'Cannt save report.');
end;


// Quality check report
  
procedure NetflixQCReportAddHeader(var report: string);
begin
  report := report + 'Timecode,Context,Comment' + #13#10;
end;


procedure NetflixQCReportAddWarning(var Report: string; Timecode: string;
  Context: string; Comment: string);
begin
  Report := Report + Timecode + ',' + Context + ',' + Comment + #13#10;
end;


function GetStringContext(Str: string; Pos: Integer; Radius: Integer): string;
var
  l, r, n: Integer;
begin
  l := Max(1, Pos - Radius);
  r := Min(length(Str), Pos + Radius);
  n := r - l + 1;
  Result := Copy(Str, l, n);
end;


function EscapeCSV(Str: string): string;
begin
  Result := Str;
  Result := StringReplace(Result, '"', '""', [rfReplaceAll]);
  Result := StringReplace(Result, #13#10, #10, [rfReplaceAll]);
  Result := StringReplace(Result, #10, '\n', [rfReplaceAll]);
  Result := Format('"%s"', [Result]);
end;


// Glyph check

function LoadNetflixAllowedGlyphs(): TGlyphArray;
const
  CodePointSize = 4;
var
  Stream: TResourceStream;
  Buffer: array [0..CodePointSize] of Byte;
  CodePoint: Integer;
  CodePointsCount: Integer;
  i: Integer;
begin
  Stream := TResourceStream.Create(HInstance, 'NetflixAllowedGlyphs', 'RT_RCDATA');
  CodePointsCount := Stream.Size div CodePointSize;
  SetLength(Result, CodePointsCount);

  for i := 0 to CodePointsCount - 1 do
  begin
    Stream.Read(Buffer, CodePointSize);
    Move(Buffer, CodePoint, CodePointSize);
    Result[i] := CodePoint;
  end;
end;


function IsGlyphAllowed(const AllowedGlyphs: TGlyphArray; Glyph: Integer): Boolean;
var
  i: Integer;
begin
  if (Glyph = 13) or (Glyph = 10) then
  begin
    Result := true;
    Exit;
  end;

  for i := 0 to Length(AllowedGlyphs) - 1 do
  begin
    if AllowedGlyphs[i] = Glyph then
    begin
      Result := true;
      Exit;
    end;
  end;
  Result := false;
end;


function PerformNetflixGlyphCheck(var Report: string): Boolean;
var
  AllowedGlyphs: TGlyphArray;
  CodePage: Cardinal;
  ParagraphNode: PVirtualNode;
  CurrentText: WideString;
  CurrentGlyph: Integer;
  i: Integer;
  Timecode, Context, Comment: string;
begin
  AllowedGlyphs := LoadNetflixAllowedGlyphs;
  CodePage := CharSetToCodePage(GetOrgCharset);
  Result := true;
  ParagraphNode := frmMain.lstSubtitles.GetFirst;
  while Assigned(ParagraphNode) do
  begin
    CurrentText := StringToWideStringEx(GetSubText(ParagraphNode), CodePage);
    for i := 1 to Length(CurrentText) do
    begin
      CurrentGlyph := Ord(CurrentText[i]);
      if not IsGlyphAllowed(AllowedGlyphs, CurrentGlyph) then
      begin
        Timecode := TimeToString(GetStartTime(ParagraphNode), FULL_TIMECODE);
        Context := UTF8Encode(EscapeCSV(GetStringContext(CurrentText, i, CONTEXT_RADIUS)));
        Comment := Format(GlyphCheckReport, ['U+' + IntToHex(CurrentGlyph, 4), i]);
        NetflixQCReportAddWarning(Report, Timecode, Context, Comment);
        Result := false;
      end;
    end;
    ParagraphNode := ParagraphNode.NextSibling;
  end;
end;


// White space check

function IsWhiteSpace(Str: string; Pos: Integer; var SpaceSize: Integer): Boolean;
begin
  Result := false;

  if Pos > Length(Str) then
    Exit;

  if (Str[Pos] = ' ') or (Str[Pos] = #10) then
  begin
    Result := true;
    SpaceSize := 1;
    Exit;
  end;

  if (Pos <> Length(Str)) and
    (Str[Pos] = #13) and
    (Str[Pos + 1] = #10) then
  begin
    Result := true;
    SpaceSize := 2;
    Exit;
  end;
end;

procedure WhiteSpaceReportParagraph(ParagraphNode: PVirtualNode; var Report: string; Pos: Integer);
var
  Timecode, Context, Comment: string;
begin
  Timecode := TimeToString(GetStartTime(ParagraphNode), FULL_TIMECODE);
  Context := UTF8Encode(EscapeCSV(GetStringContext(GetSubText(ParagraphNode), Pos, CONTEXT_RADIUS)));
  Comment := Format(WhiteSpaceCheckReport, [Pos]);
  NetflixQCReportAddWarning(Report, Timecode, Context, Comment);
end;

function CheckLineEndings(ParagraphNode: PVirtualNode; var Report: string): Boolean;
var
  CurrentText: string;
  i, j: Integer;
begin
  Result := True;
  CurrentText := GetSubText(ParagraphNode);

  if IsWhiteSpace(CurrentText, 1, i) and (not IsWhiteSpace(CurrentText, 1 + i, j)) then
  begin
    WhiteSpaceReportParagraph(ParagraphNode, Report, 1);
    Result := False;
  end;

  if (not IsWhiteSpace(CurrentText, Length(CurrentText) - 1, i)) and IsWhiteSpace(CurrentText, Length(CurrentText), j) then
  begin
    WhiteSpaceReportParagraph(ParagraphNode, Report, Length(CurrentText));
    Result := False;
  end;

  if (not IsWhiteSpace(CurrentText, Length(CurrentText) - 2, i)) and IsWhiteSpace(CurrentText, Length(CurrentText) - 1, j) and (j = 2) then
  begin
    WhiteSpaceReportParagraph(ParagraphNode, Report, 1);
    Result := False;
  end;
end;

function CheckWhiteSpacesInLine(ParagraphNode: PVirtualNode; var Report: string): Boolean;
var
  CurrentText: string;
  IsPreviousCharSpace: Boolean;
  PreviousCharPos: Integer;
  IsCurrentCharSpace: Boolean;
  CharsSkip: Integer;
  SkipWhileSpaceRest: Boolean;
  i: Integer;
begin
  CurrentText := GetSubText(ParagraphNode);
  IsPreviousCharSpace := false;
  SkipWhileSpaceRest := false;
  PreviousCharPos := 0;
  Result := true;

  if not CheckLineEndings(ParagraphNode, Report) then
  begin
    Result := false;
  end;

  i := 1;
  while i <= Length(CurrentText) do
  begin
    CharsSkip := 1;
    IsCurrentCharSpace := IsWhiteSpace(CurrentText, i, CharsSkip);

    if SkipWhileSpaceRest then
    begin
      if not IsCurrentCharSpace then
      begin
        SkipWhileSpaceRest := false;
      end;
    end
    else
    if IsPreviousCharSpace and IsCurrentCharSpace then
    begin
      WhiteSpaceReportParagraph(ParagraphNode, Report, PreviousCharPos);

      Result := false;
      SkipWhileSpaceRest := true;
    end;

    PreviousCharPos := i;
    IsPreviousCharSpace := IsCurrentCharSpace;
    i := i + CharsSkip;
  end;
end;

function PerformNetflixWhiteSpaceCheck(var Report: string): Boolean;
var
  ParagraphNode: PVirtualNode;
begin
  Result := true;
  ParagraphNode := frmMain.lstSubtitles.GetFirst;
  while Assigned(ParagraphNode) do
  begin
    if not CheckWhiteSpacesInLine(ParagraphNode, Report) then
    begin
      Result := false;
    end;
    ParagraphNode := ParagraphNode.NextSibling;
  end;
end;


// Quality check

function GetTempPathStr(): string;
var
  TempFolderBuf: array[0..MAX_PATH] of Char;
begin
  GetTempPath(MAX_PATH, @TempFolderBuf);
  Result := StrPas(TempFolderBuf);
end;

function SaveString(Str: string; FileName: string): Boolean;
begin
  Result := true;
  with TStringList.Create do
  try
    try
      Add(Str);
      SaveToFile(FileName);
    except
      Result := false;
    end;
  finally
    Free;
  end;
end;

procedure PerformNetflixQualityCheck(ShowSuccessMessages: Boolean);
var
  GlyphCheckReport: string;
  GlyphCheckReportPath: string;
  WhiteSpaceCheckReport: string;
  WhiteSpaceCheckReportPath: string;

  Messages: TStringList;
  CurrentFileName: string;
begin
  Messages := TStringList.Create;
  if frmMain.OrgFile <> '' then
  begin
    CurrentFileName := ChangeFileExt(ExtractFileName(frmMain.OrgFile), '');
  end
  else
  begin
    CurrentFileName := 'untitledSubtitle';
  end;

  NetflixQCReportAddHeader(GlyphCheckReport);
  if PerformNetflixGlyphCheck(GlyphCheckReport) then
  begin
    if ShowSuccessMessages then
    begin
      Messages.Add(GlyphCheckSuccessfull);
    end;
  end
  else
  begin
    GlyphCheckReportPath := GetTempPathStr() + CurrentFileName + '_NetflixGlyphCheck.csv';
    Messages.Add(Format(GlyphCheckFailed, [GlyphCheckReportPath]));
    if not SaveString(GlyphCheckReport, GlyphCheckReportPath) then
    begin
      Messages.Add(SavingError);
    end;
  end;

  NetflixQCReportAddHeader(WhiteSpaceCheckReport);
  if PerformNetflixWhiteSpaceCheck(WhiteSpaceCheckReport) then
  begin
    if ShowSuccessMessages then
    begin
      Messages.Add(WhiteSpaceCheckSuccessfull);
    end;
  end
  else
  begin
    WhiteSpaceCheckReportPath := GetTempPathStr() + CurrentFileName + '_NetflixWhiteSpaceCheck.csv';
    Messages.Add(Format(WhiteSpaceCheckFailed, [WhiteSpaceCheckReportPath]));
    if not SaveString(WhiteSpaceCheckReport, WhiteSpaceCheckReportPath) then
    begin
      Messages.Add(SavingError);
    end;
  end;

  if Messages.Count > 0 then
  begin
    ShowMessage(Messages.Text);
  end;
end;

end.

