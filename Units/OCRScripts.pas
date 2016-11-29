// This file is part of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle Workshop's copyright information
// File Description: OCR Script functionality

unit OCRScripts;

// -----------------------------------------------------------------------------

interface

// -----------------------------------------------------------------------------

uses
  SysUtils,
  FastStrings, HTMLPars, RegExpr;

// -----------------------------------------------------------------------------
type
  TOCRError = record
    Find                 : String;
    ReplaceBy            : String;
    UseRE                : Boolean;
    UseREOnlyToFind      : Boolean;
    // Only if UseRE is false
    CaseSensitive        : Boolean;
    WholeWord            : Boolean;
    PreserveCase         : Boolean;
  end;

// -----------------------------------------------------------------------------

function ParseOCRErrors(const FileName: String): Boolean;
function FixOCRErrors(Text: String; CheckOnly: Boolean = False): String;
function HasOCRErrors(const Text: String): Boolean;

// -----------------------------------------------------------------------------

var
  OCRErrors    : array of TOCRError;
  OCRMax       : Integer;
  OCRWordChars : String;

// -----------------------------------------------------------------------------

implementation

uses
  Functions;

// -----------------------------------------------------------------------------
                        
function ParseOCRErrors(const FileName: String): Boolean;
var
  Parser : THTMLParser;
  Obj    : TObject;
  Tag    : THTMLTag;
  Param  : THTMLParam;
  i, a   : Integer;
  AMax   : Integer;
begin
  Result := False;
  SetLength(OCRErrors, 0);
  AMax := 0;
  if FileExists(FileName) then
  begin
    Parser := THTMLParser.Create;
    Parser.Lines.LoadFromFile(FileName);
    Parser.Execute;
    for i := 0 to Parser.Parsed.Count-1 do
    begin
      Obj := Parser.Parsed[i];
      if Obj.ClassType = THTMLTag then
      begin
        Tag := THTMLTag(Obj);
        if (i = 0) and (Tag.Name <> 'SWOCR') then
          exit else
        begin
          if Tag.Params.Count > 0 then
          begin
            Param := Tag.Params[0];
            if Param.Key = 'WORDCHARS' then
            begin
              OCRWordChars := Param.Value;
              if OCRWordChars = '' then
                OCRWordChars := '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_Ò—·ÈÌÛ˙¡…Õ”⁄‰ÎÔˆ¸';
            end;
          end else
            OCRWordChars := '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_Ò—·ÈÌÛ˙¡…Õ”⁄‰ÎÔˆ¸';

          Result := True;
          if Tag.Name = 'ERROR' then
          begin
            SetLength(OCRErrors, AMax + 1);
            OCRErrors[AMax].UseRE           := True;
            OCRErrors[AMax].UseREOnlyToFind := True;
            OCRErrors[AMax].CaseSensitive   := False;
            OCRErrors[AMax].WholeWord       := False;
            OCRErrors[AMax].PreserveCase    := False;
            for a := 0 to Tag.Params.Count-1 do
            begin
              Param := Tag.Params[a];
              if Param.Key = 'FIND' then
                OCRErrors[AMax].Find := Param.Value;
              OCRErrors[AMax].ReplaceBy := #0; //added by adenry
              if Param.Key = 'REPLACEBY' then
                OCRErrors[AMax].ReplaceBy := Param.Value;
              // Read values from tag parameters
              if Param.Key = 'USERE' then
                OCRErrors[AMax].UseRE := StrToBool(Param.Value);
              if Param.Key = 'USEREONLYTOFIND' then
                OCRErrors[AMax].UseREOnlyToFind := StrToBool(Param.Value);
              if Param.Key = 'CASESENSITIVE' then
                OCRErrors[AMax].CaseSensitive := StrToBool(Param.Value);
              if Param.Key = 'WHOLEWORD' then
                OCRErrors[AMax].WholeWord := StrToBool(Param.Value);
              if Param.Key = 'PRESERVECASE' then
                OCRErrors[AMax].PreserveCase := StrToBool(Param.Value);
            end;
            Inc(AMax);
          end;
        end;
      end;
    end;
    Parser.Free;
    OCRMax := AMax;
  end;
end;

// -----------------------------------------------------------------------------

function RepRE(RE: String; AInputString, AReplaceString: String): String;
var
  r: TRegExpr;
  i: integer;
begin
  r := TRegExpr.Create;
  r.WordChars := OCRWordChars;
  Result := AInputString;
  i := 0;
  try
    r.Expression := RE;
    if r.Exec(AInputString) then
      repeat
        if (Length(r.Match[0]) = Length(AReplaceString)) and (Length(r.Substitute('$1')) = Length(AReplaceString)) then
          Result := Copy(Result, 1, r.MatchPos[0]-1 + i) +
                    AReplaceString +
                    Copy(AInputString, r.MatchPos[0] + r.MatchLen[0], Length(AInputString)) else
          Result := Copy(Result, 1, r.MatchPos[0]-1 + i) +
                    FastReplace(r.Match[0], r.Substitute('$1'), AReplaceString, True) +
                    Copy(AInputString, r.MatchPos[0] + r.MatchLen[0], Length(AInputString));
        i := i + Length(AReplaceString) - Length(r.Substitute('$1'));
      until not r.ExecNext;
  finally
    r.Free;
  end;
end;

// -----------------------------------------------------------------------------

function FixOCRErrors(Text: String; CheckOnly: Boolean = False): String; //CheckOnly added by adenry
var
  i: Integer;
  S: String; //added by adenry
begin
  S := Text;   //added by adenry
  //if OCRMax < 1 then exit; //removed by adenry
  if OCRMax > 0 then  //added by adenry
  for i := 0 to OCRMax-1 do
    if (OCRErrors[i].ReplaceBy <> #0) or CheckOnly then //added by adenry
    begin
      if OCRErrors[i].UseRE then
      begin
        if OCRErrors[i].UseREOnlyToFind = True then
          S := RepRE(OCRErrors[i].Find, S, OCRErrors[i].ReplaceBy) else      //Text replaced with S by adenry
          S := ReplaceRegExpr(OCRErrors[i].Find, S, OCRErrors[i].ReplaceBy); //Text replaced with S by adenry
      end else
        S := Replace(S, OCRErrors[i].Find, OCRErrors[i].ReplaceBy, OCRErrors[i].CaseSensitive, OCRErrors[i].WholeWord, OCRErrors[i].PreserveCase); //Text replaced with S by adenry
      //added by adenry: we are only checking for OCR errors. One difference is enough to say there is an OCR error. But not if this error is fixed later in the script...
      //if CheckOnly then
      //  if S <> Text then break;
    end;
  Result := S; //Text replaced with S by adenry
end;

// -----------------------------------------------------------------------------

function HasOCRErrors(const Text: String): Boolean;
begin
  Result := FixOCRErrors(Text, True) <> Text; //True added by adenry
end;

// -----------------------------------------------------------------------------

end.
