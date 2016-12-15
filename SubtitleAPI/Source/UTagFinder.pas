// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: Subtitles text and timing functionality

unit UTagFinder;

interface

uses
  Classes,
  SysUtils,
  FastStrings,
  USubtitlesFunctions;

type

  TTagFinder = class(TObject)
  private
    FSource   : SubtitleString;
    FTag      : SubtitleString;
    FStart    : Integer;
    FEnd      : Integer;
    FContent  : SubtitleString;
    FLeft     : SubtitleString;
    FRight    : SubtitleString;
    FParams   : SubtitleString;
    FFound    : Boolean;
    function FindOpenTag(var tagStart, tagEnd: Integer): Boolean;
    function FindCloseTag(var tagStart, tagEnd: Integer): Boolean;
  protected
    procedure SetSource(source: SubtitleString);
    procedure SetTag(tag: SubtitleString);
  public
    constructor Create; overload;
    constructor Create(source: SubtitleString); overload;
    property Source: SubtitleString read FSource write SetSource;
    property Tag: SubtitleString read FTag write SetTag;
    property Content: SubtitleString read FContent;
    property Left: SubtitleString read FLeft;
    property Right: SubtitleString read FRight;
    property TagStart: Integer read FStart;
    property TagEnd: Integer read FEnd;
    property Params: SubtitleString read FParams;
    property Found: Boolean read FFound;
    procedure Build;
    procedure Clear;
  end;

  function FindFirstTag(source: SubtitleString; tags: array of SubtitleString): TTagFinder;

implementation

  constructor TTagFinder.Create;
  begin
    Clear;
  end;

  constructor TTagFinder.Create(source: SubtitleString);
  begin
    SetSource(source);
    Clear;
  end;

  procedure TTagFinder.SetSource(source: SubtitleString);
  begin
    FSource := source;
    Clear;
  end;

  procedure TTagFinder.SetTag(tag: SubtitleString);
  begin
    FTag := tag;
    Clear;
  end;

  function TTagFinder.FindOpenTag(var tagStart, tagEnd: Integer): Boolean;
  var
    tag: SubtitleString;
  begin
    Result    := False;
    tagStart  := 0;
    tagEnd    := 0;

    tag := '<' + FTag;

    tagStart := Pos(tag, FSource);
    if (tagStart > 0) then begin
      tagEnd := SmartPos('>', FSource, True, tagStart + Length(tag)) + 1;
      Result := True;
    end;
  end;

  function TTagFinder.FindCloseTag(var tagStart, tagEnd: Integer): Boolean;
  var
    tag: SubtitleString;
  begin
    Result    := False;
    tagStart  := 0;
    tagEnd    := 0;

    tag := Format('</%s>', [FTag]);

    tagStart := Pos(tag, FSource);
    if (tagStart > 0) then begin
      tagEnd := tagStart + Length(tag);
      Result := True;
    end;
  end;

  procedure TTagFinder.Clear;
  begin
    FContent  := '';
    FLeft     := FSource;
    FRight    := '';
    FStart    := 0;
    FEnd      := 0;
    FParams   := '';
    FFound    := False;
  end;

  procedure TTagFinder.Build;
  var
    openStart, openEnd    : Integer;
    closeStart, closeEnd  : Integer;
    paramsStart           : Integer;
  begin
    Clear;

    if FindOpenTag(openStart, openEnd)
      and FindCloseTag(closeStart, closeEnd)
      and (openStart < closeStart) then
    begin
      FStart    := openStart;
      FEnd      := closeEnd;
      FContent  := Copy(source, openEnd, closeStart - openEnd);
      FLeft     := Copy(source, 1, openStart - 1);
      FRight    := Copy(Source, closeEnd, Length(FSource));
      FFound    := True;

      paramsStart := openStart + Length(FTag) + 1;
      FParams     := Trim(Copy(source, paramsStart, openEnd - paramsStart - 1));
    end;
  end;

  function FindFirstTag(source: SubtitleString; tags: array of SubtitleString): TTagFinder;
  var
    i, minStart : Integer;
    tagFinder   : TTagFinder;
  begin
    Result    := TTagFinder.Create(source);
    minStart  := Length(source) + 1;

    for i := 0 to Length(tags) - 1 do begin
      tagFinder     := TTagFinder.Create(source);
      tagFinder.Tag := tags[i];
      tagFinder.Build;

      if (tagFinder.Found) and (tagFinder.TagStart < minStart) then begin
        Result.Destroy;
        Result    := tagFinder;
        minStart  := tagFinder.TagStart;
      end else begin
        tagFinder.Destroy;
      end;
    end;
  end;

end.
