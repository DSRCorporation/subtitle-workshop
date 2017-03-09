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
  Functions, USubtitlesFunctions, Windows, Math, Forms, StdCtrls, Controls,
  ShellAPI, TntClasses, TntSystem, TntSysUtils, MiscToolsUnit, formNetflixQcResult;

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
  ReportPrompt: string;
  SavingError: string;

  UntitledSubtitle: WideString;
  OpenFileLocation: WideString;


// Language loder

procedure NetflixQualityCheckerLoadLanguage(LF: TIniFile);
begin
 	GlyphCheckSuccessfull := LF.ReadString('Netflix quality check', 'GlyphCheckSuccessfull',
    'Character validation has been successful.');
	GlyphCheckFailed := LF.ReadString('Netflix quality check', 'GlyphCheckFailed',
    'Character validation has failed.');
	GlyphCheckReport := LF.ReadString('Netflix quality check', 'GlyphCheckReport',
    'Invalid character %s found at column %d.');
	WhiteSpaceCheckSuccessfull := LF.ReadString('Netflix quality check', 'WhiteSpaceCheckSuccessfull',
    'White space validation has been successful.');
	WhiteSpaceCheckFailed := LF.ReadString('Netflix quality check', 'WhiteSpaceCheckFailed',
    'White space validation has failed.');
	WhiteSpaceCheckReport := LF.ReadString('Netflix quality check', 'WhiteSpaceCheckReport',
    'Invalid white space found at column %d.');
	ReportPrompt := LF.ReadString('Netflix quality check', 'ReportPrompt',
    'Please see full report here: %s.');
	SavingError := LF.ReadString('Netflix quality check', 'SavingError',
    'Report cannot be saved.');

  UntitledSubtitle := 'untitledSubtitle';
  OpenFileLocation := 'Open file location'; 
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
  Result := StringReplace(Result, #13, '\r', [rfReplaceAll]);
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


function IsPunctuationChar(Chr: Char): Boolean;
begin
  if Chr in ['!', '?', ')', '.', ','] then
    Result := true
  else
    Result := false;
end;


procedure WhiteSpaceReportParagraph(ParagraphNode: PVirtualNode; var Report: string; Pos: Integer);
var
  Timecode, Context, Comment: string;
begin
  Timecode := TimeToString(GetStartTime(ParagraphNode), FULL_TIMECODE);

  Context := EscapeCSV(GetStringContext(GetSubText(ParagraphNode), Pos, CONTEXT_RADIUS));
  Context := UTF8Encode(StringToWideStringEx(context, CharSetToCodePage(GetOrgCharset)));

  Comment := Format(WhiteSpaceCheckReport, [Pos]);
  NetflixQCReportAddWarning(Report, Timecode, Context, Comment);
end;


function CheckWhiteSpacesBeforePunctuation(ParagraphNode: PVirtualNode; var Report: string): Boolean;
var
  CurrentText: string;
  WhiteSpaceSize: Integer;
  i: Integer;

  IsCurrentCharSpace: Boolean;
  IsSecondCharSpace: Boolean;
  IsThirdCharSpace: Boolean;

  ThirdCharPos: Integer;
begin
  Result := True;
  CurrentText := GetSubText(ParagraphNode);

  for i := 1 to Length(CurrentText) - 1 do
  begin
    IsCurrentCharSpace := IsWhiteSpace(CurrentText, i, WhiteSpaceSize);

    if IsCurrentCharSpace then
      Continue;

    IsSecondCharSpace := IsWhiteSpace(CurrentText, i + 1, WhiteSpaceSize);

    if not IsSecondCharSpace then
      Continue;

    ThirdCharPos := i + 1 + WhiteSpaceSize;

    if (ThirdCharPos <= Length(CurrentText)) and
      IsPunctuationChar(CurrentText[ThirdCharPos]) then
    begin
      WhiteSpaceReportParagraph(ParagraphNode, Report, i + 1);
      Result := False;
    end;    
  end;
end;


function CheckLineEndings(ParagraphNode: PVirtualNode; var Report: string): Boolean;
var
  CurrentText: string;
  i, j: Integer;
begin
  Result := True;
  CurrentText := GetSubText(ParagraphNode);

  if Length(CurrentText) = 0 then
    Exit;

  if (Length(CurrentText) = 1) and IsWhiteSpace(CurrentText, 1, i) then
  begin
    WhiteSpaceReportParagraph(ParagraphNode, Report, 1);
    Result := False;
    Exit;
  end;

  if (Length(CurrentText) = 2) and IsWhiteSpace(CurrentText, 1, i) and (i = 2) then
  begin
    WhiteSpaceReportParagraph(ParagraphNode, Report, 1);
    Result := False;
    Exit;
  end;

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

  if not CheckWhiteSpacesBeforePunctuation(ParagraphNode, Report) then
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

function SaveString(Str: string; FileName: WideString): Boolean;
var
  fileStream: TTntFileStream;
begin
  Result := true;

  try
    try
      fileStream := TTntFileStream.Create(FileName, fmCreate);
      fileStream.WriteBuffer(PChar(UTF8_BOM)^, SizeOf(UTF8_BOM));
      fileStream.WriteBuffer(PChar(str)^, Length(str) * SizeOf(Char));
    except
      Result := false;
    end;
  finally
    try
      fileStream.Free;
    except
      Result := false;
    end;
  end;
end;


procedure PerformNetflixQualityCheck(ShowSuccessMessages: Boolean);
var
  Report: string;
  ReportPath: WideString;

  WsChkMessage: WideString;
  WsChkReportPath: WideString;
  GlyphChkMessage: WideString;
  GlyphChkReportPath: WideString;

  IsAllSuccess: Boolean;
  CurrentFileName: WideString;

  FirstReportPath: WideString;
  ResultForm: TfrmNetflixQcResult;
begin
  FirstReportPath := '';
  IsAllSuccess := True;

  if frmMain.OrgFile <> '' then
    CurrentFileName := WideChangeFileExt(WideExtractFileName(frmMain.OrgFile), '')
  else
    CurrentFileName := UntitledSubtitle;


  Report := '';
  GlyphChkReportPath := '';
  NetflixQCReportAddHeader(Report);

  if PerformNetflixGlyphCheck(Report) then
  begin
    GlyphChkMessage := GlyphCheckSuccessfull;
  end
  else
  begin
    IsAllSuccess := False;
    ReportPath := GetTemporaryFolder + CurrentFileName + '_NetflixGlyphCheck.csv';

    if SaveString(Report, ReportPath) then
    begin
      GlyphChkMessage := Format(GlyphCheckFailed + ' ' + ReportPrompt, [ReportPath]);
      GlyphChkReportPath := ReportPath;

      if FirstReportPath = '' then
        FirstReportPath := ReportPath;
    end
    else
      GlyphChkMessage := GlyphCheckFailed + ' ' + SavingError;
  end;


  Report := '';
  WsChkReportPath := '';
  NetflixQCReportAddHeader(Report);

  if PerformNetflixWhiteSpaceCheck(Report) then
  begin
    WsChkMessage := WhiteSpaceCheckSuccessfull;
  end
  else
  begin
    IsAllSuccess := False;
    ReportPath := GetTemporaryFolder + CurrentFileName + '_NetflixWhiteSpaceCheck.csv';

    if SaveString(Report, ReportPath) then
    begin
      WsChkMessage := Format(WhiteSpaceCheckFailed + ' ' + ReportPrompt, [ReportPath]);
      WsChkReportPath := ReportPath;

      if FirstReportPath = '' then
        FirstReportPath := ReportPath;
    end
    else
      WsChkMessage := WhiteSpaceCheckFailed + ' ' + SavingError;
  end;

  if (not ShowSuccessMessages) and IsAllSuccess then
  begin
    Exit;
  end;

  ResultForm := TfrmNetflixQcResult.Create(nil,
    GlyphChkMessage, GlyphChkReportPath,
    WsChkMessage, WsChkReportPath, FirstReportPath);
  ResultForm.ShowModal;
end;

end.

