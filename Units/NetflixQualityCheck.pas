// This file is part of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle Workshop's copyright information
// File Description: Netflix quality check system functionality

unit NetflixQualityCheck;


interface

procedure PerformNetflixQualityCheck();


implementation

uses Dialogs, formMain, TreeViewHandle, VirtualTrees, Classes, SysUtils,
  Functions, USubtitlesFunctions, Windows, Math;

type
  TGlyphArray = Array of Integer;

const
  FULL_TIMECODE: string = 'hh:mm:ss.zzz';
  CONTEXT_RADIUS: Integer = 6;


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
        Comment := Format('Invalid character %s found at column %d.',
          ['U+' + IntToHex(CurrentGlyph, 4), i]);
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

function CheckWhiteSpacesInLine(ParagraphNode: PVirtualNode; var Report: string): Boolean;
var
  CurrentText: string;
  IsPreviousCharSpace: Boolean;
  PreviousCharPos: Integer;
  IsCurrentCharSpace: Boolean;
  CharsSkip: Integer;
  SkipWhileSpaceRest: Boolean;
  i: Integer;
  Timecode, Context, Comment: string;
begin
  CurrentText := GetSubText(ParagraphNode);    
  IsPreviousCharSpace := false;
  PreviousCharPos := 0;
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
      Timecode := TimeToString(GetStartTime(ParagraphNode), FULL_TIMECODE);
      Context := UTF8Encode(EscapeCSV(GetStringContext(CurrentText, i, CONTEXT_RADIUS)));
      Comment := Format('Invalid white space found at column %d.', [PreviousCharPos]);
      NetflixQCReportAddWarning(Report, Timecode, Context, Comment);
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

procedure PerformNetflixQualityCheck();
var
  Report: string;
begin
  NetflixQCReportAddHeader(Report);
  PerformNetflixGlyphCheck(Report);
  PerformNetflixWhiteSpaceCheck(Report);
  ShowMessage(Report);
end;

end.


