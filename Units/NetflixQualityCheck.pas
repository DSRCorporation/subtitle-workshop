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
begin
  Result := Copy(Str, Max(1, Pos - Radius), Radius * 2 + 1);  // todo
end;


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
        Context := 'ctx';
        Comment := 'cmnt';
        NetflixQCReportAddWarning(Report, Timecode, Context, Comment);
        Result := false;
      end;
    end;
    ParagraphNode := ParagraphNode.NextSibling;
  end;
end;


{function GetSubtitle(): String;
var
  Node: PVirtualNode;
  Subtitle: String;
begin
  Subtitle := '';
  Node := frmMain.lstSubtitles.GetFirst;
  while Assigned(Node) do
  begin
    Subtitle := Subtitle + GetSubText(Node) + #13#10;
    Node := Node.NextSibling;
  end;
  Result := Subtitle;
end;}

procedure PerformNetflixQualityCheck();
var
  Report: string;
begin
  NetflixQCReportAddHeader(Report);
  PerformNetflixGlyphCheck(Report);
  ShowMessage(Report);
end;

end.


