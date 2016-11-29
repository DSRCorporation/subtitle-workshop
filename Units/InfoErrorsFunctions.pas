// This file is part of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle Workshop's copyright information
// File Description: Information and Errors system functionality

unit InfoErrorsFunctions;

interface

uses
  Forms, SysUtils, Windows, Graphics, Math, Controls, //Graphics added by adenry for TColor type use //Math added by adenry to use SimpleRoundTo //Controls added by adenry to use TCursor type
  VirtualTrees, StrMan, FastStrings, //RegExpr, HTMLPars, //RegExpr, HTMLPars removed by adenry
  CommonTypes;

// -----------------------------------------------------------------------------

// --------------------
// Text help functions
// --------------------
function IsUpperCase(Str: String): Boolean;
function IsEmpty(const Text: String): Boolean;
function DeleteSpecialChars(const Str: String): String;
function CountLines(Text: String): Integer;
// --------------------
// Text error checking
// --------------------
function IsHearingImpaired(Text: String): Boolean;
function HasLinesWithoutLetters(Text: String): Boolean;
function HasTextBeforeColon(Text: String; CapitalLetters: Boolean): Boolean;
function HasUnnecessaryDots(Text: String): Boolean;
function HasProhibitedChar(Text: String): Boolean;
function HasRepeatedChar(Text: String): Boolean;
function HasSpaceAfterOrBeforeCustomChar(const Text: String; const After: Boolean): Boolean;
function HasUnnecessarySpaces(Text: String): Boolean;
function HasUnnecessaryTags(Text: String): Boolean; //added by adenry
function HasDashOnSecondLine(Text: String; FontCharset: TFontCharset): Boolean; //added by adenry
function HasDashOnFirstLine(Text: String; CheckForDashOnSecondLine: Boolean): Boolean;//added by adenry
function HasTooMuchCPS(Text: String; Duration: Integer; TMCPS: Integer = -1): Boolean; //added by adenry
function HasDialogueOnOneLine(Text: String; FontCharset: TFontCharset): Integer; //added by adenry //Boolean changed to Integer
function HasTooLongLine(Text: String; TLL: Integer = -1): Boolean; //TLL added by adenry
function HasTooShortLine(Text: String; MinLength: Integer): Boolean; //added by adenry
// --
function GetError(Node, Previous: PVirtualNode; ErrorTypesToCheck: TErrorTypeSet = []): TErrorTypeSet;
procedure CheckMarkErrors(ErrorTypesToCheck: TErrorTypeSet = []);
procedure SingleCheckMarkErrors(Node: PVirtualNode; ErrorTypesToCheck: TErrorTypeSet = []); //added by adenry
// --------------------
// Text error fixing
// --------------------
function RemoveHearingImpaired(Text: String): String;
function RemoveTextBeforeColon(Text: String; CapitalLetters: Boolean): String;
function RemoveUnnecessaryDots(Text: String): String;
function RemoveRepeatedChar(Text: String): String;
function RemoveUnnecessarySpaces(Text: String; ForceFix: Boolean = False): String; //ForceFix added by adenry
function RemoveUnnecessaryTags(Text: String): String;//added by adenry
function RemoveDashOnFirstLine(Text: String): String;//added by adenry
function FixNoSpaceAfterOrBeforeCustomChar(Text: String; After: Boolean): String;
function FixDialogueOnOneLine(Text: String; FontCharset: TFontCharset; DialoguesOnOneLineNum: Integer): String;//added by adenry
// --
function FixError(Node, Previous: PVirtualNode; ConfirmDeletions: Boolean; FormParent: TForm): TFixTypesSet;
procedure FixErrors(const OnlySelected: Boolean = False);

// -----------------------------------------------------------------------------

var
  ErrorsToCheck : TErrors;
  ErrorsToFix   : TErrors;
  // -------------------------//
  //  Information and errors  //
  // -------------------------//
  ShowConfMainForm                : Boolean;
  //MarkErrorsInList                : Boolean;
  //MarkWithColor                   : Integer;
  //MarkWithBackground              : Integer; //added by adenry
  //MarkBold                        : Boolean;
  //MarkItalic                      : Boolean;
  //MarkUnderline                   : Boolean;
  //UseOriginalTextColor            : Boolean; //added by adenry
  //OnlyIfThereIsAColorTag          : Boolean; //added by adenry
  //UseOriginalBackground           : Boolean; //added by adenry
  //UseOriginalTextStyle            : Boolean; //added by adenry
  MarkOnLoad                      : Boolean;
  //AutoRecheckErrors               : Boolean; //added by adenry //moved to formMain
  //AutoRecheckOnScripts            : Byte; //added by adenry //moved to formMain
  FixOnLoad                       : Boolean;
  FixOneUnitOverlap               : Boolean;
  OCRDefFile                      : String;
  RepeatableChars                 : String;
  ProhibitedChars                 : String;
  SpaceAfterChars                 : String;
  SpaceBeforeChars                : String;
  ToleranceForRepeated            : Integer;
  TooLongDuration                 : Integer;
  TooShortDuration                : Integer;
  TooLongLine                     : Integer;
  TooShortPause                   : Word; //added by adenry
  TooMuchCPS                      : Integer;//added by adenry
  NormalCPSColor                  : Integer;//added by adenry
  NormalCPSBckgr                  : Integer;//added by adenry
  TooMuchCPSColor                 : Integer;//added by adenry
  TooMuchCPSBckgr                 : Integer;//added by adenry
  PercentageInCPSHintBox          : Boolean; //added by adenry
  CurCPSInCPSHintBox              : Boolean; //added by adenry
  MinTimeInCPSHintBox             : Boolean; //added by adenry
  MaxCharInCPSHintBox             : Boolean; //added by adenry
  IndicTooLongLines               : Boolean; //added by adenry
  TooLongLinesColor               : Integer; //added by adenry
  TooLongLinesBackground          : Integer; //added by adenry
  IndicTooShortDuration           : Boolean; //added by adenry
  TooShortDurationColor           : Integer; //added by adenry
  TooShortDurationBackground      : Integer; //added by adenry
  IndicTooLongDuration            : Boolean; //added by adenry
  TooLongDurationColor            : Integer; //added by adenry
  TooLongDurationBackground       : Integer; //added by adenry
  IndicTooShortPause              : Boolean; //added by adenry
  TooShortPauseColor              : Integer; //added by adenry
  TooShortPauseBackground         : Integer; //added by adenry
  IndicOverlapping                : Boolean; //added by adenry
  OverlappingColor                : Integer; //added by adenry
  OverlappingBackground           : Integer; //added by adenry
  IndicBadValues                  : Boolean; //added by adenry
  BadValuesColor                  : Integer; //added by adenry
  BadValuesBackground             : Integer; //added by adenry
  IndicOverTwoLines               : Boolean; //added by adenry
  OverTwoLinesColor               : Integer; //added by adenry
  OverTwoLinesBackground          : Integer; //added by adenry
  AdvancedErrorMarking            : Boolean; //added by adenry
  //MarkDisableStandard             : Boolean; //added by adenry
  MarkFlags                       : array[0..24] of TMarkFlags; //added by adenry
  MarkColors                      : array[0..24] of TColor; //added by adenry
  MarkBackgrounds                 : array[0..24] of TColor; //added by adenry
  MarkCPSHintBox                  : Boolean;//added by adenry
  CustomInfoTypes                 : array [1..7] of String; //added by adenry
  CustomInfoLabels                : array [1..6] of String; //added by adenry
  CustomInfoCombos                : array [1..8] of String; //added by adenry
  CustomInfoCaption               : String; //added by adenry
  // -----------
  CancelProcess: Boolean;

implementation

// -----------------------------------------------------------------------------

uses
  General, Functions, TreeViewHandle, USubtitlesFunctions, OCRScripts, Undo, VideoPreview, //VideoPreview added by adenry
  formMain, formInfoErrors;

// -----------------------------------------------------------------------------

function IsUpperCase(Str: String): Boolean;
begin
  Result := False;
  if AnsiUpperCase(Str) = Str then
    Result := True;
end;

// -----------------------------------------------------------------------------

function IsEmpty(const Text: String): Boolean;
begin
  Result := False;
  if DeleteSpecialChars(Text) = '' then //todo: should we remove tags first?
    Result := True;
end;

// -----------------------------------------------------------------------------

function DeleteSpecialChars(const Str: String): String;
var
  i      : Integer;
  tmpStr : String;
begin
  tmpStr := Str;
  if tmpStr <> '' then
  begin
    i := 1;
    while i <= Length(tmpStr) do
    begin
      if (tmpStr[i] in SpecialChars) then
        Delete(tmpStr, i, 1) else
        Inc(i);
    end;
  end;
  Result := Trim(tmpStr);
end;

// -----------------------------------------------------------------------------

function HasLinesWithoutLetters(Text: String): Boolean;
  // We need to check every line separately...
  function CheckLine(Line: String): Boolean;
  begin
    Result := False;
    if DeleteSpecialChars(Line) = '' then
      Result := True;
  end;
var
  CurrLine : String;
  PosEnter : Integer;
begin
  Result   := False;
  CurrLine := '';
  PosEnter := Pos(#13#10, Text);
  // For multi line subtitles...
  while PosEnter > 0 do
  begin
    if CheckLine(Copy(Text, 1, PosEnter-1)) then
    begin
      Result := True;
      exit;
    end;
    Text     := Copy(Text, PosEnter + 2, Length(Text) - PosEnter);
    PosEnter := Pos(#13#10, Text);
  end;
  if CheckLine(Text) then
    Result := True;
end;

// -----------------------------------------------------------------------------

function IsHearingImpaired(Text: String): Boolean;
begin
  Result := False;
  if ((Pos('(', Text) > 0) and (Pos(')', Text) > Pos('(', Text))) or
     ((Pos('[', Text) > 0) and (Pos(']', Text) > Pos('[', Text))) or
     ((Pos('<', Text) > 0) and (Pos('>', Text) > Pos('<', Text))) then
  Result := True;
end;

// -----------------------------------------------------------------------------

function HasTextBeforeColon(Text: String; CapitalLetters: Boolean): Boolean;
  // We need to check every line separately...
  function CheckLine(Line: String): Boolean;
  var
    a: Integer;
  begin
    Result := False;
    a := Pos(':', Line);
    if a > 1 then
    begin
      if CapitalLetters then
      begin
        if IsUpperCase(Copy(Line, 1, a-1)) then
          Result := True;
      end else
        Result := True;
      // If colon is between two numbers
      Line := ReplaceString(Line, ' ', ''); //added by adenry - to cover cases like '5: 30' or '5 : 30'
      if IsInteger(Copy(Line, a-1, 1)) and (IsInteger(Copy(Line, a+1,1))) then
        Result := False;
    end;
  end;
  
var
  PosEnter : Integer;
begin
  Result   := False;
  Text := RemoveSWTags(Text, True, True, True, True); //added by adenry
  if Pos(':', Text) = Length(Text) then exit;
  PosEnter := Pos(#13#10, Text);
  // For multi line subtitles...
  while PosEnter > 0 do
  begin
    if CheckLine(Copy(Text, 1, PosEnter-1)) then
    begin
      Result := True;
      exit;
    end;
    Text     := Copy(Text, PosEnter + 2, Length(Text) - PosEnter);
    PosEnter := Pos(#13#10, Text);
  end;
  // If subtitle is one line or contains the text in the last line
  if CheckLine(Text) then
    Result := True;
end;

// -----------------------------------------------------------------------------

function HasUnnecessaryDots(Text: String): Boolean;
begin
  Result := False;
  if Pos('....', Text) > 0 then
    Result := True;
end;

// -----------------------------------------------------------------------------

function CountLines(Text: String): Integer;
begin
  Result := StringCount(#13#10, Text) + 1;
end;

// -----------------------------------------------------------------------------

function HasProhibitedChar(Text: String): Boolean;
var
  i: Integer;
begin
  Result := False;
  if Length(Text) = 0 then exit;
  for i := 0 to Length(Text) do
  begin
    if (Text[i] <> ',') and (Pos(Text[i], ProhibitedChars) > 0) then
    begin
      Result := True;
      exit;
    end;
  end;
end;

// -----------------------------------------------------------------------------

function HasRepeatedChar(Text: String): Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := 1 to Length(Text)-1 do //0 replaced with 1 by adenry
  begin
    if (Pos(Text[i], RepeatableChars) > 0) and (Text[i+1] = Text[i]) then
      if (Text[i] <> '/') or (Copy(Text, i-1, 3) <> '://') then //added by adenry
      begin
        Result := True;
        exit;
      end;
  end;
end;

// -----------------------------------------------------------------------------

function HasSpaceAfterOrBeforeCustomChar(const Text: String; const After: Boolean): Boolean;
begin
  Result := not(FixNoSpaceAfterOrBeforeCustomChar(Text, After) = Text);
end;

// -----------------------------------------------------------------------------

function HasUnnecessarySpaces(Text: String): Boolean;
var
  i: Integer;
begin
  Result := False;
  if (Length(Text) = 0) then exit;
  if (sm.Trim(Text) = '') then
  begin
    Result := True;
    exit;
  end;
  if EntersAndSpacesBeginningEnd in ErrorsToCheck.eWhatUnnecessarySpaces then
  begin
    if ((Pos(#13#10, Text) = 1) or ((Length(Text) > 1) and (SmartPos(#13#10, Text, True, Length(Text), False) = Length(Text)-1))) or
       (Text[1] = ' ') or (SmartPos(' ', Text, True, Length(Text), False) = Length(Text)) then
    begin
      Result := True;
      exit;
    end;
  end;
  if SpacesBetweenEnters in ErrorsToCheck.eWhatUnnecessarySpaces then
  begin
    if (Pos(' ' + #13#10, Text) > 0) or (Pos(#13#10 + ' ', Text) > 0) then
    begin
      Result := True;
      exit;
    end;
  end;
  if DoubleSpacesAndEnters in ErrorsToCheck.eWhatUnnecessarySpaces then
  begin
    if (Pos('  ', Text) > 0) or (Pos(#13#10#13#10, Text) > 0) then
    begin
      Result := True;
      exit;
    end;
  end;
  if SpacesFrontPunctuation in ErrorsToCheck.eWhatUnnecessarySpaces then
  begin
    if (StringCount(' ,', Text) > 0) or
       //((StringCount(' .', Text) - StringCount('- ...', Text)) > 0) or //removed by adenry
       (StringCount(' :', Text) > 0) or
       (StringCount(' ;', Text) > 0) then
    begin
      Result := True;
      exit;
    end;
    //added by adenry: begin
    i := SmartPos(' .', Text, True, 1);
    while i > 0 do
    begin
      if (i=1) or (i = Length(Text)-1) or // ' .' at the beginning or at the end of the subtitle
      (
        not( (Text[i-1] in Dashes) and (Text[i+2] = '.') ) and //'- ..'
        not( (Text[i+2] in ['0'..'9']) ) //a number like ' .5'
      ) then
      begin
        Result := True;
        exit;
      end;
      i := SmartPos(' .', Text, True, i+2);
    end;
    //added by adenry: end
  end;
  if SpacesAfterQuestionAndExclamation in ErrorsToCheck.eWhatUnnecessarySpaces then
  begin
    if (Pos('¡ ', Text) > 0) or (Pos('¿ ', Text) > 0) then
    begin
      Result := True;
      exit;
    end;
  end;
  if SpacesBeforeQuestionAndExclamation in ErrorsToCheck.eWhatUnnecessarySpaces then
  begin
    if (Pos(' ?', Text) > 0) or (Pos(' !', Text) > 0) then
    begin
      Result := True;
      exit;
    end;
  end;
  if SpacesBetweenNumbers in ErrorsToCheck.eWhatUnnecessarySpaces then
  begin
    for i := 0 to Length(Text)-2 do
    begin
      if (Text[i] in ['0'..'9', '/']) and
         (Text[i+1] = ' ') and
         (Text[i+2] in ['0'..'9', ',', '.', '-', ':', '/']) then
      begin
        Result := True;
        exit;
      end;
    end;
  end;
end;

// -----------------------------------------------------------------------------

//added by adenry: begin
function HasUnnecessaryTags(Text: String): Boolean;
begin
  Result := False;
  if SubtitleApi.MultiTagsMode then
  begin
    if Pos('<i></i>',Text) > 0 then begin Result := True; exit; end;
    if Pos('<b></b>',Text) > 0 then begin Result := True; exit; end;
    if Pos('<u></u>',Text) > 0 then begin Result := True; exit; end;
    if Pos('<i><i>',Text) > 0 then begin Result := True; exit; end;
    if Pos('<b><b>',Text) > 0 then begin Result := True; exit; end;
    if Pos('<u><u>',Text) > 0 then begin Result := True; exit; end;
    if Pos('</i><i>',Text) > 0 then begin Result := True; exit; end;
    if Pos('</b><b>',Text) > 0 then begin Result := True; exit; end;
    if Pos('</u><u>',Text) > 0 then begin Result := True; exit; end;
    if Pos('</i></i>',Text) > 0 then begin Result := True; exit; end;
    if Pos('</b></b>',Text) > 0 then begin Result := True; exit; end;
    if Pos('</u></u>',Text) > 0 then begin Result := True; exit; end;
    if Pos('<i>'+#13#10+'</i>',Text) > 0 then begin Result := True; exit; end;
    if Pos('<b>'+#13#10+'</b>',Text) > 0 then begin Result := True; exit; end;
    if Pos('<u>'+#13#10+'</u>',Text) > 0 then begin Result := True; exit; end;
    if Pos('</i>'+#13#10+'<i>',Text) > 0 then begin Result := True; exit; end;
    if Pos('</b>'+#13#10+'<b>',Text) > 0 then begin Result := True; exit; end;
    if Pos('</u>'+#13#10+'<u>',Text) > 0 then begin Result := True; exit; end;
    if Pos('</i> <i>',Text) > 0 then begin Result := True; exit; end;
    if Pos('<i> </i>',Text) > 0 then begin Result := True; exit; end;
    if Pos('</b> <b>',Text) > 0 then begin Result := True; exit; end;
    if Pos('<b> </b>',Text) > 0 then begin Result := True; exit; end;
    if Pos('</u> <u>',Text) > 0 then begin Result := True; exit; end;
    if Pos('<u> </u>',Text) > 0 then begin Result := True; exit; end;
  end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
function HasDashOnFirstLine(Text: String; CheckForDashOnSecondLine: Boolean): Boolean;
begin
  Result := False;
  Text := ReplaceString(RemoveSWTags(Text, True, True, True, True),' ',''); //remove tags and spaces
  if Length(Copy(Text,1,1)) = 1 then
    if Copy(Text,1,1)[1] in dashes then
      Result := True;
  if CheckForDashOnSecondLine then
    if HasDashOnSecondLine(Text, frmMain.OrgCharset) then
      Result := False;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
function HasDashOnSecondLine(Text: String; FontCharset: TFontCharset): Boolean;
begin
  Result := False;
  Text := ReplaceString(RemoveSWTags(Text, True, True, True, True),' ',''); //remove tags and spaces
  if (Pos(#13#10+'-',Text) > 0)
  or ((Pos(#13#10#150,Text) > 0)and(FontCharset in DashCharsets1))
  or ((Pos(#13#10#151,Text) > 0)and(FontCharset in DashCharsets1))
  or ((Pos(#13#10#173,Text) > 0)and(FontCharset in DashCharsets2)) then
    Result := True;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
function HasTooMuchCPS(Text: String; Duration: Integer; TMCPS: Integer = -1): Boolean;
var
  d1, d2: Currency; //the type is important!
begin
  if TMCPS = -1 then TMCPS := TooMuchCPS;
  //if Length(ReplaceString(Text,#13#10,'')) > ((TMCPS * Duration) / 1000) then
  Result := False;
  if Duration > 0 then begin
    d1 := Duration/1000;
    d2 := Math.SimpleRoundTo((Length(ReplaceString(Text,#13#10,'')) / TMCPS),-3);
    if d2 > d1 then
      Result := True;
  end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
function HasDialogueOnOneLine(Text: String; FontCharset: TFontCharset): Integer; //Boolean changed to Integer
begin
  //Result := False;
  //remove tags and characters that should be ignored
  Text := RemoveSWTags(Text, True, True, True, True);
  Text := ReplaceString(Text,' ','');
  Text := ReplaceString(Text,'"','');
  Text := ReplaceString(Text,#39,''); //#39 is '

  //replace double dashes
  Text := ReplaceString(Text, '--', '...');
  
  //remove dashes at end of line
  Text := Text + #13#10;
  Text := ReplaceString(Text, '-'#13#10, #13#10);
  if (FontCharset in DashCharsets1) then
  begin
    Text := ReplaceString(Text, #150#13#10, #13#10);
    Text := ReplaceString(Text, #151#13#10, #13#10);
  end;
  if (FontCharset in DashCharsets2) then
    Text := ReplaceString(Text, #173#13#10, #13#10);

  //check for dialgue on one line
  Result := StringCount('.-',Text) + StringCount('!-',Text) + StringCount('?-',Text);
  if (FontCharset in DashCharsets1) then
    Result := Result + StringCount('.'#150,Text) + StringCount('!'#150,Text) + StringCount('?'#150,Text)
                     + StringCount('.'#151,Text) + StringCount('!'#151,Text) + StringCount('?'#151,Text);
  if (FontCharset in DashCharsets2) then
    Result := Result + StringCount('.'#173,Text) + StringCount('!'#173,Text) + StringCount('?'#173,Text);

  //if (Pos('.-',Text)>0) or (Pos('!-',Text)>0) or (Pos('?-',Text)>0)
  //or ((FontCharset in DashCharsets1)and((Pos('.'#150,Text)>0) or (Pos('!'#150,Text)>0) or (Pos('?'#150,Text)>0)))
  //or ((FontCharset in DashCharsets1)and((Pos('.'#151,Text)>0) or (Pos('!'#151,Text)>0) or (Pos('?'#151,Text)>0)))
  //or ((FontCharset in DashCharsets2)and((Pos('.'#173,Text)>0) or (Pos('!'#173,Text)>0) or (Pos('?'#173,Text)>0))) then
  //  Result := True;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
function FixDialogueOnOneLine(Text: String; FontCharset: TFontCharset; DialoguesOnOneLineNum: Integer): String;
var
  i, j, L: Integer;
begin
  Result := Text;
  if (DialoguesOnOneLineNum = 1) then Text := ReplaceString(Text, #13#10, ' '); //added later
  if (Pos(#13#10, Text) = 0) then //added later - so that we don't make subtitles over 2 lines!
  begin
    L := Length(Text);
    if L < 4 then exit;

    i := 1;
    j := 1;

    while true do
    begin
      while not (Text[i] in SetDashes(FontCharset)) do
      begin
        Inc(i);
        if i > L then exit;
      end;
      j := i - 1;
      if j>0 then
      begin
        while (Text[j] in [' ', '"', #39]) or (IsTagPart(Text, j)) do
        begin
          if j = 1 then break;
          Dec(j);
        end;
        if Text[j] in ['.', '!', '?'] then
          break;
      end;
      Inc(i);
    end;

    Insert(#13#10, Text, i);
    while Text[j+1] = ' ' do
      Delete(Text, j+1, 1);

    Result := Text;
  end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

function HasTooLongLine(Text: String; TLL: Integer = -1): Boolean; //TLL added by adenry
var
  PosEnter : Integer;
begin
  Text := RemoveSWTags(Text, True, True, True, True);//added by adenry later
  if TLL = -1 then TLL := TooLongLine; //added by adenry
  Result   := False;
  PosEnter := Pos(#13#10, Text);
  // For multi line subtitles...
  while PosEnter > 0 do
  begin
    if PosEnter-1 >= TLL then //TooLongLine replaced with TLL by adenry
    begin
      Result := True;
      exit;
    end;
    Text     := Copy(Text, PosEnter + 2, Length(Text) - PosEnter);
    PosEnter := Pos(#13#10, Text);
  end;
  if Length(Text) >= TLL then //TooLongLine replaced with TLL by adenry
    Result := True;
end;

// -----------------------------------------------------------------------------

//added by adenry: begin
function HasTooShortLine(Text: String; MinLength: Integer): Boolean;
var
  PosEnter : Integer;
begin
  Result   := False;
  Text := RemoveSWTags(Text, True, True, True, True);
  PosEnter := Pos(#13#10, Text);
  // For multi line subtitles...
  while PosEnter > 0 do
  begin
    if PosEnter-1 < MinLength then
    begin
      Result := True;
      exit;
    end;
    Text     := Copy(Text, PosEnter + 2, Length(Text) - PosEnter);
    PosEnter := Pos(#13#10, Text);
  end;
  if Length(Text) < MinLength then
    Result := True;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

function GetError(Node, Previous: PVirtualNode; ErrorTypesToCheck: TErrorTypeSet = []): TErrorTypeSet; //ErrorTypesToCheck added by adenry
var
  Data    : PSubtitleItem; // Node
  DataP   : PSubtitleItem; // Previous
  SubText : String;
  i       : Integer; //added by adenry
begin
  DataP := nil;
  Data  := frmMain.lstSubtitles.GetNodeData(Node);
  if Assigned(Previous) then
    DataP := frmMain.lstSubtitles.GetNodeData(Previous);
  SubText := RemoveSWTags(Data.Text, True, True, True, True);

  //Data.ErrorType := []; //removed by adenry

  //added by adenry: begin
  if ErrorTypesToCheck = [] then
  begin
    ErrorTypesToCheck := AllErrors;
    Data.ErrorType := []; //all errors will be checked, so clear all errors
  end else
  begin
    //clear only the errors that will be checked!
    for i := 0 to Integer(High(TErrorType)) do //for each type of error
      if (TErrorType(i) in ErrorTypesToCheck) then
        Data.ErrorType := Data.ErrorType - [TErrorType(i)];
  end;
  //added by adenry: end

  // --------------------- //
  // Lines without letters //
  // --------------------- //
  if ErrorsToCheck.eLinesWithoutLetters then
  if etLinesWithoutLetters in ErrorTypesToCheck then //added by adenry
  begin
    if HasLinesWithoutLetters(SubText) then
      Data.ErrorType := Data.ErrorType + [etLinesWithoutLetters];
  end;

  // --------------- //
  // Empty subtitles //
  // --------------- //
  if ErrorsToCheck.eEmptySubtitle then
  if etEmptySubtitle in ErrorTypesToCheck then //added by adenry
  begin
    if IsEmpty(SubText) then
      Data.ErrorType := Data.ErrorType + [etEmptySubtitle];
  end;    

  // ----------- //
  // Overlapping //
  // ----------- //
  if ErrorsToCheck.eOverlapping then
  if etOverlapping in ErrorTypesToCheck then //added by adenry
  begin
    if Node <> frmMain.lstSubtitles.GetFirst then
    begin
      if Data.InitialTime <= DataP.FinalTime then
        Data.ErrorType := Data.ErrorType + [etOverlapping];
    end;
  end;

  // ---------- //
  // Bad values //
  // ---------- //
  if ErrorsToCheck.eBadValues then
  if etBadValues in ErrorTypesToCheck then //added by adenry
  begin
    if Data.InitialTime > Data.FinalTime then
      Data.ErrorType := Data.ErrorType + [etBadValues];
  end;

  // ---------------- //
  // Hearing impaired //
  // ---------------- //
  if ErrorsToCheck.eHearingImpaired then
  if etHearingImpaired in ErrorTypesToCheck then //added by adenry
  begin
    if IsHearingImpaired(SubText) then
      Data.ErrorType := Data.ErrorType + [etHearingImpaired];
  end;

  // ----------------------- //
  // Text before colon (":") //
  // ----------------------- //
  if ErrorsToCheck.eTextBeforeColon then
  if etTextBeforeColon in ErrorTypesToCheck then //added by adenry
  begin
    if HasTextBeforeColon(SubText, ErrorsToCheck.eOnlyIfCapitalLetters) then
      Data.ErrorType := Data.ErrorType + [etTextBeforeColon];
  end;

  // ---------------- //
  // Unnecessary dots //
  // ---------------- //
  if ErrorsToCheck.eUnnecessaryDots then
  if etUnnecessaryDots in ErrorTypesToCheck then //added by adenry
  begin
    if HasUnnecessaryDots(SubText) then
      Data.ErrorType := Data.ErrorType + [etUnnecessaryDots];
  end;

  // ----------------------- //
  // Subtitle over two lines //
  // ----------------------- //
  if ErrorsToCheck.eOverTwoLines then
  if etOverTwoLines in ErrorTypesToCheck then //added by adenry
  begin
    if CountLines(SubText) > 2 then
      Data.ErrorType := Data.ErrorType + [etOverTwoLines];
  end;

  // -------------------- //
  // Prohibited character //
  // -------------------- //
  if ErrorsToCheck.eProhibitedCharacter then
  if etProhibitedCharacter in ErrorTypesToCheck then //added by adenry
  begin
    if HasProhibitedChar(SubText) then
      Data.ErrorType := Data.ErrorType + [etProhibitedCharacter];
  end;

  // ------------------ //
  // Repeated character //
  // ------------------ //
  if ErrorsToCheck.eRepeatedCharacter then
  if etRepeatedCharacter in ErrorTypesToCheck then //added by adenry
  begin
    if HasRepeatedChar(SubText) then
      Data.ErrorType := Data.ErrorType + [etRepeatedCharacter];
  end;

  // ----------------- //
  // Repeated subtitle //
  // ----------------- //
  if ErrorsToCheck.eRepeatedSubtitle then
  if etRepeatedSubtitle in ErrorTypesToCheck then //added by adenry
  begin
    if Node <> frmMain.lstSubtitles.GetFirst then
    begin
      if ((DataP.Text = Data.Text) and (Data.Text <> '')) and // If the text is the same (we don't use SubText because Data.Text contains the tags)
         ((Data.InitialTime - DataP.FinalTime) < ToleranceForRepeated) then // And the difference of time is less than the tolerance
        Data.ErrorType := Data.ErrorType + [etRepeatedSubtitle];
    end;
  end;

  // ---------- //
  // OCR Errors //
  // ---------- //
  if frmMain.chkOCRScripts.Checked then //added by adenry
  if (ErrorsToCheck.eOCRErrors) and (OCRMax > 0) then
  if etOCRErrors in ErrorTypesToCheck then //added by adenry
  begin
    if SubtitleAPI.MultiTagsMode then SubText := Data.Text; //added by adenry
    if HasOCRErrors(SubText) then
      Data.ErrorType := Data.ErrorType + [etOCRErrors];
    SubText := RemoveSWTags(Data.Text, True, True, True, True); //added by adenry
  end;

  // ------------------------------- //
  // "- " in subtitles with one line //
  // ------------------------------- //
  if ErrorsToCheck.eOpnDlgSubsOneLine then
  if etOpnDlgSubsOneLine in ErrorTypesToCheck then //added by adenry
  begin
    if CountLines(SubText) = 1 then
    begin
      i := 1; //added by adenry
      while Copy(SubText,i,1) = ' ' do Inc(i); //added by adenry
      //if Copy(SubText, 1, 1) = '-' then //removed by adenry
      if Length(Copy(SubText, i, 1)) = 1 then //added by adenry
        if Copy(SubText, i, 1)[1] in dashes then //added by adenry
          Data.ErrorType := Data.ErrorType + [etOpnDlgSubsOneLine];
    end;
  end;

  // ----------------------------- //
  // Space after custom characters //
  // ----------------------------- //
  if ErrorsToCheck.eSpaceAfterCustChars then
  if etSpaceAfterCustChars in ErrorTypesToCheck then //added by adenry
  begin
    if HasSpaceAfterOrBeforeCustomChar(SubText, True) then
      Data.ErrorType := Data.ErrorType + [etSpaceAfterCustChars];
  end;

  // ------------------------------ //
  // Space before custom characters //
  // ------------------------------ //
  if ErrorsToCheck.eSpaceBeforeCustChars then
  if etSpaceBeforeCustChars in ErrorTypesToCheck then //added by adenry
  begin
    if HasSpaceAfterOrBeforeCustomChar(SubText, False) then
      Data.ErrorType := Data.ErrorType + [etSpaceBeforeCustChars]; //etSpaceAfterCustChars changed to etSpaceBeforeCustChars by adenry...
  end;

  // ------------------ //
  // Unnecessary spaces //
  // ------------------ //
  if ErrorsToCheck.eUnnecessarySpaces then
  if etUnnecessarySpaces in ErrorTypesToCheck then //added by adenry
  begin
    if HasUnnecessarySpaces(SubText) then
      Data.ErrorType := Data.ErrorType + [etUnnecessarySpaces];
  end;

  // ----------------- //
  // Too long duration //
  // ----------------- //
  if ErrorsToCheck.eTooLongDurations then
  if etTooLongDuration in ErrorTypesToCheck then //added by adenry
  begin
    if (Data.FinalTime-Data.InitialTime) > TooLongDuration then
      Data.ErrorType := Data.ErrorType + [etTooLongDuration];
  end;

  // ------------------ //
  // Too short duration //
  // ------------------ //
  if ErrorsToCheck.eTooShortDurations then
  if etTooShortDuration in ErrorTypesToCheck then //added by adenry
  begin
    if (Data.FinalTime-Data.InitialTime) < TooShortDuration then
      if (Data.FinalTime-Data.InitialTime) >= 0 then //added by adenry - if less it is a bad value
        Data.ErrorType := Data.ErrorType + [etTooShortDuration];
  end;

  // -------------- //
  // Too long lines //
  // -------------- //
  if ErrorsToCheck.eTooLongLines then
  if etTooLongLine in ErrorTypesToCheck then //added by adenry
  begin
    if HasTooLongLine(SubText) then
      Data.ErrorType := Data.ErrorType + [etTooLongLine];
  end;

  //added by adenry: begin
  // ---------------- //
  // Unnecessary tags //
  // ---------------- //
  if ErrorsToCheck.eUnnecessaryTags then
  if etUnnecessaryTags in ErrorTypesToCheck then //added by adenry
  begin
    if HasUnnecessaryTags(Data.Text) then
      Data.ErrorType := Data.ErrorType + [etUnnecessaryTags];
  end;
  //added by adenry: end

  //added by adenry: begin
  // ------------------ //
  // "- " on first line //
  // ------------------ //
  if ErrorsToCheck.eDashOnFirstLine then
  if etDashOnFirstLine in ErrorTypesToCheck then //added by adenry
  begin
    if CountLines(SubText) > 1 then
      if HasDashOnFirstLine(SubText, ErrorsToCheck.eOnlyIfNoDashOnSecondLine) then
        Data.ErrorType := Data.ErrorType + [etDashOnFirstLine];
  end;
  //added by adenry: end

  //added by adenry: begin
  // ------------ //
  // Too much CPS //
  // ------------ //
  if ErrorsToCheck.eTooMuchCPS then
  if etTooMuchCPS in ErrorTypesToCheck then //added by adenry
  begin
    if HasTooMuchCPS(SubText, Data.FinalTime-Data.InitialTime) then
      Data.ErrorType := Data.ErrorType + [etTooMuchCPS];
  end;
  //added by adenry: end

  //added by adenry: begin
  //this error chech shoud stay after the overlapping check!
  // --------------- //
  // Too short pause //
  // --------------- //
  if ErrorsToCheck.eTooShortPause then
  if etTooShortPause in ErrorTypesToCheck then //added by adenry
  begin
    {if HasTooShortPause(Data.InitialTime, Data.FinalTime) then
      Data.ErrorType := Data.ErrorType + [etTooShortPause];}
    if Node <> frmMain.lstSubtitles.GetFirst then
    begin
      if Data.InitialTime - TooShortPause < DataP.FinalTime then
        if not(etOverlapping in Data.ErrorType) then
          Data.ErrorType := Data.ErrorType + [etTooShortPause];
    end;
  end;
  //added by adenry: end

  //added by adenry: begin
  // -------------------- //
  // Dialogue on one line //
  // -------------------- //
  if ErrorsToCheck.eDialogueOnOneLine then
  if etDialogueOnOneLine in ErrorTypesToCheck then //added by adenry
  begin
    if HasDialogueOnOneLine(SubText, frmMain.OrgCharset) > 0 then
      Data.ErrorType := Data.ErrorType + [etDialogueOnOneLine];
  end;
  //added by adenry: end

  Result := Data.ErrorType;
end;

// -----------------------------------------------------------------------------

procedure CheckMarkErrors(ErrorTypesToCheck: TErrorTypeSet = []); //ErrorTypesToCheck added by adenry
var
  Node: PVirtualNode;
begin
  //if (ErrorsToCheck.eOCRErrors) and (FileExists(OCRDefFile)) then ParseOCRErrors(OCRDefFile); //removed by adenry later
  with frmMain do
  begin
    Node := lstSubtitles.GetFirst;
    while Assigned(Node) do
    begin
      GetError(Node, Node.PrevSibling, ErrorTypesToCheck);
      Node := Node.NextSibling;
    end;
    lstSubtitles.Refresh;
  end;
end;
 
// -----------------------------------------------------------------------------

//added by adenry: begin
procedure SingleCheckMarkErrors(Node: PVirtualNode; ErrorTypesToCheck: TErrorTypeSet = []);
begin
  //if (ErrorsToCheck.eOCRErrors) and (FileExists(OCRDefFile)) then ParseOCRErrors(OCRDefFile); //removed by adenry later
  with frmMain do
    if Assigned(Node) then
    begin
      GetError(Node, Node.PrevSibling, ErrorTypesToCheck);
      //lstSubtitles.RepaintNode(Node); //removed later, everything is faster this way. but remember to call AutoRecheckNodeErrorsAndRepaint when a refresh is necessary (usually it's not as we usually call lstSubtitles.Refresh after a Node loop)
    end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

function DeleteLinesWithoutLetters(Text: String): String;
  function CheckLine(Line: String): Boolean;
  begin
    Result := False;
    if DeleteSpecialChars(Line) = '' then
      Result := True;
  end;
  //added by adenry: begin
  function LineIsTagsOnly(Line: String): Boolean;
  begin
    Result := False;
    if DeleteSpecialChars(RemoveSWTags(Line,True,True,True,True)) = '' then
      Result := True;
  end;
  //added by adenry: end
var
  NewText  : String;
  Tags     : String; //added by adenry
  PosEnter : Integer;
begin
  Result   := Text;
  NewText  := '';
  PosEnter := Pos(#13#10, Text);
  // For multi line subtitles...

  //removed by adenry: begin
  {while PosEnter > 0 do
  begin
    if CheckLine(Copy(Text, 1, PosEnter-1)) = False then
      NewText := NewText + #13#10 + Copy(Text, 1, PosEnter-1);
    Text     := Copy(Text, PosEnter + 2, Length(Text) - PosEnter);
    PosEnter := Pos(#13#10, Text);
  end;
  if CheckLine(Text) = False then
    NewText := NewText + #13#10 + Text;}
  //removed by adenry: end

  //added by aderny: begin
  while PosEnter > 0 do
  begin
    Tags := '';
    if CheckLine(Copy(Text, 1, PosEnter-1)) = False then
      if LineIsTagsOnly(Copy(Text, 1, PosEnter-1)) then
        Tags := Copy(Text, 1, PosEnter-1) else
        NewText := NewText + #13#10 + Copy(Text, 1, PosEnter-1);
    Text     := Tags + Copy(Text, PosEnter + 2, Length(Text) - PosEnter);
    PosEnter := Pos(#13#10, Text);
  end;
  if LineIsTagsOnly(Text) = False then
    NewText := NewText + #13#10 + Text;
  //added by aderny: end

  // We remove the #13#10 at the beginning
  Result := Copy(NewText, 3, Length(NewText));
end;

// -----------------------------------------------------------------------------

function RemoveHearingImpaired(Text: String): String;
  function RHearingImpaired(Line: String): String;
  begin
    while (Pos('(', Line) > 0) and (Pos(')', Line) > Pos('(', Line)) do
    begin
      if Copy(Line, Pos(')', Line) + 1, 1) = ':' then
        Delete(Line, Pos(')', Line) + 1, 1);
      Delete(Line, Pos('(', Line), Pos(')', Line) - Pos('(', Line) + 1);
    end;
    while (Pos('[', Line) > 0) and (Pos(']', Line) > Pos('[', Line)) do
    begin
      if Copy(Line, Pos(']', Line) + 1, 1) = ':' then
        Delete(Line, Pos(']', Line) + 1, 1);
      Delete(Line, Pos('[', Line), Pos(']', Line) - Pos('[', Line) + 1);
    end;
    if IsEmpty(Line) then Line := '';
    Result := Line;
  end;
var
  PosEnter : Integer;
  A, B     : String;
begin
  Result := '';
  if Text <> '' then
  begin
    A := Text;
    B := '';
    PosEnter := Pos(#13#10, A);
    while PosEnter > 0 do
    begin
      B     := B + RHearingImpaired(Copy(A, 1, PosEnter-1)) + #13#10;
      A     := Copy(A, PosEnter + 2, Length(A) - PosEnter);
      PosEnter := Pos(#13#10, A);
    end;
    B := RemoveUnnecessarySpaces(RHearingImpaired(B + RHearingImpaired(A)));
    if (Pos(#13#10, B) = 0) and (Copy(B, 1, 1) = '-') then
    begin
      B := Copy(B, 2, Length(B));
      Result := RemoveUnnecessarySpaces(B);
    end else
      Result := B;
  end;
end;

// -----------------------------------------------------------------------------

function RemoveTextBeforeColon(Text: String; CapitalLetters: Boolean): String;
  // We need to delete text before colon in every line, separately...
  function RTextBeforeColon(Line: String): String;
  var
    a: Integer;
    txt, tags, dash: String;  //added by adenry
  begin
    //a := Pos(':', Line); //removed by adenry
    //added by adenry:
    a := SmartPos(':', Line, False, 1);
    while a > 0 do
      if IsTagPart(Line, a) then
        a := SmartPos(':', Line, False, a+1) else
        break;

    if (a > 1) then
    begin

      if (IsInteger(Copy(Line, a-1, 1)) and (IsInteger(Copy(Line, a+1,1)))) = False then //check for numbers around :
      begin
        //removed by adenry: begin
        {if CapitalLetters then
        begin
          if IsUpperCase(Copy(Line, 1, a-1)) then
            Delete(Line, 1, a);
        end else
          Delete(Line, 1, a);}
        //removed by adenry: end

        //added by adenry: begin
        tags := '';
        txt  := Copy(Line, 1, a-1);
        if SubtitleApi.MultiTagsMode then
        begin
          //separate tags from txt...
          while Pos('<',txt) > 0 do
            if Pos('>',txt) > 0 then
            begin
              tags := tags + Copy(txt,Pos('<',txt),Pos('>',txt)-Pos('<',txt)+1);
              Delete(txt, Pos('<',txt), Pos('>',txt)-Pos('<',txt)+1);
            end else
              break;
        end;
        //check for capital letters
        if IsUpperCase(txt) or not CapitalLetters then
        begin
          //save dash
          dash := Copy(sm.TrimLeft(txt), 1, 2);
          if Length(dash) > 0 then
          begin
            if dash[1] in dashes then
            begin
              if Copy(dash, 2, 1) <> ' ' then
                dash := dash[1];
            end else
              dash := '';
          end;

          Delete(Line, 1, a); //delete text before colon
          while Copy(Line,1,1)=' ' do Delete(Line, 1, 1); //trim spaces after colon

          Line := tags + dash + Line; //RESTORE TAGS AND DASH
        end;
        //added by adenry: end
      end;
    end;
    Result := sm.TrimRight(Line);
  end;
var
  PosEnter : Integer;
  A, B     : String;
begin
  A := Text;
  B := '';
  if Pos(':', RemoveSWTags(Text, True, True, True, True)) <> Length(Text) then //RemoveSWTags added by adenry
  begin
    PosEnter := Pos(#13#10, A);
    while PosEnter > 0 do
    begin
      B     := B + RTextBeforeColon(Copy(A, 1, PosEnter-1)) + #13#10;
      A     := Copy(A, PosEnter + 2, Length(A) - PosEnter);
      PosEnter := Pos(#13#10, A);
    end;
    B      := RTextBeforeColon(B + RTextBeforeColon(A));
    Result := RemoveUnnecessarySpaces(B);
  end else
  Result := Text;
end;

// -----------------------------------------------------------------------------

function RemoveUnnecessaryDots(Text: String): String;
begin
  while Pos('....', Text) > 0 do
    Delete(Text, Pos('....', Text), 1);
  Result := Text;
end;

// -----------------------------------------------------------------------------

function RemoveRepeatedChar(Text: String): String;
var
  i: Integer;
begin
  for i := Length(Text) downto 2 do //1 replaced with 2 by adenry
  begin
    if (Pos(Text[i], RepeatableChars) > 0) and (Text[i-1] = Text[i]) then
      if (Text[i] <> '/') or (Copy(Text, i-2, 3) <> '://') then //added by adenry
        Delete(Text, i, 1);
  end;
  Result := Text;
end;

// -----------------------------------------------------------------------------

function FixNoSpaceAfterOrBeforeCustomChar(Text: String; After: Boolean): String;
  function FixNoSpaceAfterOrBeforeCustChar(Line: String): String;
  var
    i, j: Integer;
  begin
    if After then
    begin
      // ---------------------------- //
      // Space after custom character //
      // ---------------------------- //
      i := 1;
      while i < Length(Line) do
      begin
        if Pos(Line[i], SpaceAfterChars) > 0 then
        begin
          if (Line[i+1] <> ' ') and                                                             // If it's not a space
             (((Line[i+1] in ['0'..'9'] = False)and(Line[i-1] in ['0'..'9'] = False)) or (Line[i] in NumDelimiterChars = False)) and  // If it's not a number //and(Line[i-1] in ['0'..'9'] = False)) or (Line[i] in NumDelimiterChars = False) added by adenry //i-1 is okay, the [0] char is #0
             (Pos(Line[i+1], SpaceAfterChars) = 0) and                                          // If it's not another character after which we need to add a space
             (                                                                                  // If it's not a word dash
                (
                  (i > 1) and //2 replaced with 1 by adenry
                  (
                    //( (Line[i] <> '-') and (Line[i-1] in (SpecialChars - [' ']) = False) and (Line[i+1] in SpecialChars = False) ) or //removed by adenry
                    ( (Line[i] <> '-') and (Line[i+1] in (SpecialChars - ['<']) = False) ) or //added by adenry
                    ( (Line[i]  = '-') and (Line[i-1] in SpecialChars) ) // modified by adenry from (SpecialChars - [' '])
                  )
                ) or
                (i <= 1)  //2 replaced with 1 by adenry 
             ) and
             not( (Line[i]='.') and (IsNoRegularDot(Line,i,True)) ) // If it's not a dot in an abbreviation or in a website address, or dots (2 or more) at the beginning of the line
          then
          begin
            //added by adenry: begin
            //check for a tag
            if (Line[i+1] = '<') then
              if IsTagPart(Line, i+1) then
              begin
                j := SmartPos('>', Line, True, i+1);
                if (Line[j+1] = ' ') then //there's a space after the tag
                begin
                  i := j+1;
                  continue;
                end;
                if (Line[i+2] = '/') then //if it's a close tag, insert the space after it
                begin
                  i := j;
                  if i = Length(Line) then break;
                end;
              end;
            //added by adenry: end
            Insert(' ', Line, i+1);
            Inc(i);
          end;
        end;
        Inc(i);
      end;
    end else
    begin
      // ----------------------------- //
      // Space before custom character //
      // ----------------------------- //
      i := 2;
      while i <= Length(Line) do
      begin
        if Pos(Line[i], SpaceBeforeChars) > 0 then
        begin
          if (Line[i-1] <> ' ') and                     // If it's not a space
             (Pos(Line[i-1], SpaceBeforeChars) = 0) and // or another character before which we need to add a space
             (
               ((Line[i] = '-') and (Line[i-1] in SpecialChars)) or
               (Line[i] <> '-')
             ) then
          begin
            Insert(' ', Line, i);
            Inc(i);
          end;
        end;  
        Inc(i);
      end;
    end;
    
    Result := Line;
  end;
var
  PosEnter : Integer;
  A, B     : String;
begin
  A := Text;
  B := '';
  PosEnter := Pos(#13#10, A);
  while PosEnter > 0 do
  begin
    B     := B + FixNoSpaceAfterOrBeforeCustChar(Copy(A, 1, PosEnter-1)) + #13#10;
    A     := Copy(A, PosEnter + 2, Length(A) - PosEnter);
    PosEnter := Pos(#13#10, A);
  end;
  Result := B + FixNoSpaceAfterOrBeforeCustChar(A);
end;

// -----------------------------------------------------------------------------

function RemoveUnnecessarySpaces(Text: String; ForceFix: Boolean = False): String; //ForceFix added by adenry
  // Delete unnecessary spaces in each line
  function RUnnecessarySpaces(Line: String; ForceFix: Boolean = False): String; //ForceFix added by adenry
  var
    i: Integer;
    tmp: String; //added by adenry
    j,k,l: Byte; //added by adenry
    tags: Array[1..3] of String; //added by adenry
  begin
    if (Length(Line) > 0) then
    begin
      if (EntersAndSpacesBeginningEnd in ErrorsToFix.eWhatUnnecessarySpaces) or ForceFix then
      begin
        if ForceFix then Line := TrimSpacesAndNewLinesOnly(Line) else //added by adenry
        Line := sm.Trim(Line);
        //added by adenry: begin
        if SubtitleApi.MultiTagsMode then
        begin
          //fix space in the begining after a tag
          while True do
          begin
            tmp := Copy(Line, 1, SmartPos(' ', Line, False, 1, True));
            tmp := ReplaceString(tmp, '<i>', '');
            tmp := ReplaceString(tmp, '<b>', '');
            tmp := ReplaceString(tmp, '<u>', '');
            tmp := ReplaceString(tmp, '</i>', '');
            tmp := ReplaceString(tmp, '</b>', '');
            tmp := ReplaceString(tmp, '</u>', '');
            if tmp = ' ' then
              Delete(Line, SmartPos(' ', Line, False, 1, True), 1) else
              break;
          end;
          //fix space in the end before a tag
          while True do
          begin
            tmp := Copy(Line, SmartPos(' ', Line, False, Length(Line), False), 1+Length(Line)-SmartPos(' ', Line, False, Length(Line), False));
            tmp := ReplaceString(tmp, '</i>', '');
            tmp := ReplaceString(tmp, '</b>', '');
            tmp := ReplaceString(tmp, '</u>', '');
            tmp := ReplaceString(tmp, '<i>', '');
            tmp := ReplaceString(tmp, '<b>', '');
            tmp := ReplaceString(tmp, '<u>', '');
            if tmp = ' ' then
              Delete(Line, SmartPos(' ', Line, False, Length(Line), False), 1) else
              break;
          end;
        end;
        //added by adenry: end
      end;
      if (SpacesBetweenEnters in ErrorsToFix.eWhatUnnecessarySpaces) or ForceFix then
      begin
        while (Pos(' ' + #13#10, Line) > 0) do
          Delete(Line, Pos(' ' + #13#10, Line), 1);
        while (Pos(#13#10 + ' ', Line) > 0) do
          Delete(Line, Pos(#13#10 + ' ', Line) + 2, 1);
      end;
      if (DoubleSpacesAndEnters in ErrorsToFix.eWhatUnnecessarySpaces) or ForceFix then
      begin
        while (Pos('  ', Line) > 0) do
          Delete(Line, Pos('  ', Line), 1);
        while (Pos(#13#10#13#10, Line) > 0) do
          Delete(Line, Pos(#13#10#13#10, Line), 2);
        //added by adenry: begin
        //fix two spaces around tag(s)
        if SubtitleApi.MultiTagsMode then
        begin
          if (HasUnnecessarySpaces(RemoveSWTags(Line,True,True,True,False,True))) then
          begin
            tags[1]:='<i>'; tags[2]:='<b>'; tags[3]:='<u>';
            for j := 1 to 3 do
            begin
              Line := ReplaceString(Line, ' '+tags[j]+' ', ' '+tags[j]);
              for k := 1 to 3 do
              begin
                Line := ReplaceString(Line, ' '+tags[j]+tags[k]+' ', ' '+tags[j]+tags[k]);
                for l := 1 to 3 do
                  Line := ReplaceString(Line, ' '+tags[j]+tags[k]+tags[l]+' ', ' '+tags[j]+tags[k]+tags[l]);
              end;
            end;
            tags[1]:='</i>'; tags[2]:='</b>'; tags[3]:='</u>';
            for j := 1 to 3 do
            begin
              Line := ReplaceString(Line, ' '+tags[j]+' ', tags[j]+' ');
              for k := 1 to 3 do
              begin
                Line := ReplaceString(Line, ' '+tags[j]+tags[k]+' ', tags[j]+tags[k]+' ');
                for l := 1 to 3 do
                  Line := ReplaceString(Line, ' '+tags[j]+tags[k]+tags[l]+' ', tags[j]+tags[k]+tags[l]+' ');
              end;
            end;
          end;
        end;
        //added by adenry: end
      end;
      if (SpacesFrontPunctuation in ErrorsToFix.eWhatUnnecessarySpaces) and not ForceFix then
      begin
        while (Pos(' ,', Line) > 0) do
          Delete(Line, Pos(' ,', Line), 1);
        i := Pos(' .', Line);
        while (i > 0) do
        begin
          //if Copy(Line, i-1, 5) <> '- ...' then //removed by adenry
          //added by adenry: begin
          if (i=1) or (i = Length(Line)-1) or // ' .' at the beginning or at the end of the subtitle
          (
            not( (Line[i-1] in Dashes) and (Line[i+2] = '.') ) and //'- ..'
            not( (Line[i+2] in ['0'..'9']) ) //a number like ' .5'
          ) then
          //added by adenry: end          
            Delete(Line, i, 1);
          i := SmartPos(' .', Line, True, i+1);
        end;
        while (Pos(' :', Line) > 0) do
          Delete(Line, Pos(' :', Line), 1);
        while (Pos(' ;', Line) > 0) do
          Delete(Line, Pos(' ;', Line), 1);
      end;
      if (SpacesAfterQuestionAndExclamation in ErrorsToFix.eWhatUnnecessarySpaces) and not ForceFix then
      begin
        while (Pos('¡ ', Line) > 0) do
          Delete(Line, Pos('¡ ', Line) + 1, 1);
        while (Pos('¿ ', Line) > 0) do
          Delete(Line, Pos('¿ ', Line) + 1, 1);
      end;
      if (SpacesBeforeQuestionAndExclamation in ErrorsToFix.eWhatUnnecessarySpaces) and not ForceFix then
      begin
        while (Pos(' !', Line) > 0) do
          Delete(Line, Pos(' !', Line), 1);
        while (Pos(' ?', Line) > 0) do
          Delete(Line, Pos(' ?', Line), 1);
      end;
      if (SpacesBetweenNumbers in ErrorsToFix.eWhatUnnecessarySpaces) and not ForceFix then
      begin
        for i := 0 to Length(Line)-2 do
        begin
          if (Line[i] in ['0'..'9', '/']) and
             (Line[i+1] = ' ') and
             (Line[i+2] in ['0'..'9', ',', '.', '-', ':', '/']) then
            Delete(Line, i+1, 1);
        end;
      end;
    end;
    Result := Line;
  end;
var
  PosEnter : Integer;
  A, B     : String;
begin
  A := Text;
  B := '';
  if Length(Text) > 0 then
  begin
    PosEnter := Pos(#13#10, A);
    while PosEnter > 0 do
    begin
      B     := B + RUnnecessarySpaces(Copy(A, 1, PosEnter-1), ForceFix) + #13#10;
      A     := Copy(A, PosEnter + 2, Length(A) - PosEnter);
      PosEnter := Pos(#13#10, A);
    end;
    B      := RUnnecessarySpaces(B + RUnnecessarySpaces(A, ForceFix), ForceFix);
    Result := B;
  end else
    Result := '';
end;

// -----------------------------------------------------------------------------

//added by adenry: begin
function RemoveUnnecessaryTags(Text: String): String;
begin
  Text := ReplaceString(Text,'<i></i>','');
  Text := ReplaceString(Text,'<i><i>','<i>');
  Text := ReplaceString(Text,'</i><i>','');
  Text := ReplaceString(Text,'</i></i>','</i>');
  Text := ReplaceString(Text,'</i> <i>',' ');
  Text := ReplaceString(Text,'<i> </i>',' ');
  Text := ReplaceString(Text,'<i>'+#13#10+'</i>',#13#10);
  Text := ReplaceString(Text,'</i>'+#13#10+'<i>',#13#10);
  Text := ReplaceString(Text,'<b></b>','');
  Text := ReplaceString(Text,'<b><b>','<b>');
  Text := ReplaceString(Text,'</b><b>','');
  Text := ReplaceString(Text,'</b></b>','</b>');
  Text := ReplaceString(Text,'</b> <b>',' ');
  Text := ReplaceString(Text,'<b> </b>',' ');
  Text := ReplaceString(Text,'<b>'+#13#10+'</b>',#13#10);
  Text := ReplaceString(Text,'</b>'+#13#10+'<b>',#13#10);
  Text := ReplaceString(Text,'<u></u>','');
  Text := ReplaceString(Text,'<u><u>','<u>');
  Text := ReplaceString(Text,'</u><u>','');
  Text := ReplaceString(Text,'</u></u>','</u>');
  Text := ReplaceString(Text,'</u> <u>',' ');
  Text := ReplaceString(Text,'<u> </u>',' ');
  Text := ReplaceString(Text,'<u>'+#13#10+'</u>',#13#10);
  Text := ReplaceString(Text,'</u>'+#13#10+'<u>',#13#10);
  Result := Text;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
function RemoveDashOnFirstLine(Text: String): String;
var
  DashPos: Integer;
begin
  //this algorithm allows for dashes in tags:
  {DashPos := Pos('-',Text);
  while ReplaceString(RemoveSWTags(Copy(Text,1,DashPos-1),True,True,True,True,True),' ','') <> '' do
  begin
    DashPos := SmartPos('-',Text,False,DashPos+1);
    if DashPos = 0 then break;
  end;
  Delete(Text,DashPos,1);
  //clear intervals
  while Copy(Text,DashPos,1)=' ' do
    Delete(Text,DashPos,1);
  while Copy(Text,DashPos-1,1)=' ' do
  begin
    Delete(Text,DashPos-1,1);
    Dec(DashPos);
  end;
  Result := Text;}

  //find the first dash
  DashPos := 1;
  while (Copy(Text,DashPos,1)<>'-')
  and ((Copy(Text,DashPos,1)<>#150)or not(frmMain.OrgCharset in DashCharsets1))
  and ((Copy(Text,DashPos,1)<>#151)or not(frmMain.OrgCharset in DashCharsets1))
  and ((Copy(Text,DashPos,1)<>#173)or not(frmMain.OrgCharset in DashCharsets2)) do
    DashPos := DashPos + 1;
  //delete all dashes and spaces
  while (Copy(Text,DashPos,1)=' ') or (Copy(Text,DashPos,1)='-')
  or ((Copy(Text,DashPos,1)=#150)and(frmMain.OrgCharset in DashCharsets1))
  or ((Copy(Text,DashPos,1)=#151)and(frmMain.OrgCharset in DashCharsets1))
  or ((Copy(Text,DashPos,1)=#173)and(frmMain.OrgCharset in DashCharsets2)) do
    Delete(Text, DashPos, 1);
  //delete all spaces before the dashes
  while Copy(Text,DashPos-1,1)=' ' do
  begin
    Delete(Text,DashPos-1,1);
    Dec(DashPos);
  end;
  Result := RemoveUnnecessarySpaces(Text);
end;
//added by adenry: end

// -----------------------------------------------------------------------------

function FixError(Node, Previous: PVirtualNode; ConfirmDeletions: Boolean; FormParent: TForm): TFixTypesSet;
var
  Data    : PSubtitleItem; // Node
  DataP   : PSubtitleItem; // Previous
  SubText : String;
  tmpText : String;
  tmpTags : String; //added by adenry
  // Variables to store tags
  Bold      : Boolean;
  Italic    : Boolean;
  Underline : Boolean;
  SubColor  : Integer;
  // -
  i: Integer;
  OVERLAPPRECISION: Integer;
  dash    : Char; //added by adenry
  DialoguesOnOneLineNum: Integer; //added by adenry
  OldShowTime, OldHideTime: Integer; //added by adenry
begin
  Result := [];
  DataP := nil;
  Data  := frmMain.lstSubtitles.GetNodeData(Node);
  if Assigned(Previous) then
    DataP := frmMain.lstSubtitles.GetNodeData(Previous);

  // Store tags
  Bold      := Pos('<b>', Data.Text) > 0;
  Italic    := Pos('<i>', Data.Text) > 0;
  Underline := Pos('<u>', Data.Text) > 0;
  SubColor  := GetSubColor(Data.Text);
  OldShowTime := Data.InitialTime; //added by adenry
  OldHideTime := Data.FinalTime; //added by adenry
  // Important!!!: Remove tags
  SubText := Data.Text;
  if SubtitleApi.SingleTagsMode then //added by adenry
    SubText := RemoveSWTags(SubText, True, True, True, True);

//Prohibitet character, Text before colon, Hearing impaired moved first by adenry !!!

  // -------------------- //
  // Prohibited character //
  // -------------------- //
  if ErrorsToFix.eProhibitedCharacter then
  begin
    if HasProhibitedChar(SubText) then
    begin
      if ConfirmDeletions = False then
        Result := Result + [ftSubDeletedProhibitedCharacter] else
      begin
        case MsgBox(Format(IEMsgBoxes[2], [Node.Index + 1, Data.Text]), BTN_YES, BTN_NO, BTN_CANCEL, MB_ICONQUESTION, FormParent) of
          1: Result := Result + [ftSubDeletedProhibitedCharacter];
          2: Result := [];
          3: CancelProcess := True;
        end;
      end;
      exit;
    end;
  end;

  // ----------------------- //
  // Text before colon (":") //
  // ----------------------- //
  if ErrorsToFix.eTextBeforeColon then
  begin
    //if Pos(':', SubText) > 0 then //removed by adenry
    if HasTextBeforeColon(SubText, ErrorsToFix.eOnlyIfCapitalLetters) then //added by adenry
    begin
      tmpText := RemoveTextBeforeColon(SubText, ErrorsToFix.eOnlyIfCapitalLetters);
      if tmpText <> SubText then
      begin
        if ConfirmDeletions = False then
        begin
          SubText := tmpText;
          Result  := Result + [ftTextBeforeColon];
        end else
        begin
          case MsgBox(Format(IEMsgBoxes[4], [Node.Index + 1, SubText, tmpText]), BTN_YES, BTN_NO, BTN_CANCEL, MB_ICONQUESTION, FormParent) of
            1: begin SubText := tmpText; Result := Result + [ftTextBeforeColon]; end;
            2: Result := [];
            3: CancelProcess := True;
          end;
        end;
      end;
    end;
  end;

  // ---------------- //
  // Hearing impaired //
  // ---------------- //
  if ErrorsToFix.eHearingImpaired then
  begin
    if IsHearingImpaired(RemoveSWTags(SubText, True, True, True, True)) then //RemoveSWTags added by adenry
    begin
      tmpText := RemoveHearingImpaired(SubText);
      if tmpText <> SubText then
      begin
        // We have to delete whole subtitle
        if tmpText = '' then
        begin
          if ConfirmDeletions = False then
          begin
            Result := Result + [ftHearingImpairedDeleted];
            exit;
          end else
          begin
            case MsgBox(Format(IEMsgBoxes[3], [Node.Index + 1, Data.Text]), BTN_YES, BTN_NO, BTN_CANCEL, MB_ICONQUESTION, FormParent) of
              1: begin Result := Result + [ftHearingImpairedDeleted]; exit; end;
              2: Result := [];
              3: begin CancelProcess := True; exit; end;
            end;
          end;
        end else
        begin
          // We only have to delete the hearing impaired part, not all
          if ConfirmDeletions = False then
          begin
            SubText := tmpText;
            Result  := Result + [ftHearingImpairedPartDeleted];
          end else
          begin
            case MsgBox(Format(IEMsgBoxes[4], [Node.Index + 1, Data.Text, tmpText]), BTN_YES, BTN_NO, BTN_CANCEL, MB_ICONQUESTION, FormParent) of
              1: begin SubText := tmpText; Result := Result + [ftHearingImpairedPartDeleted]; end;
              2: Result := [];
              3: CancelProcess := True;
            end;
          end;
        end;
      end;
    end;
  end;

  //moved here by adenry - OCR Errors may lead to empty subtitles
  // ---------- //
  // OCR Errors //
  // ---------- //
  if frmMain.chkOCRScripts.Checked then //added by adenry
  if (ErrorsToFix.eOCRErrors) and (OCRMax > 0) then
  begin
    tmpText := FixOCRErrors(SubText);
    if tmpText <> SubText then
    begin
      SubText := tmpText;
      Result  := Result + [ftOCRErrors];
    end;
  end;

  // --------------------- //
  // Lines without letters //
  // --------------------- //
  if ErrorsToFix.eLinesWithoutLetters then
  begin
    tmpText := DeleteLinesWithoutLetters(SubText); //removed by adenry
    //tmpText := RemoveSWTags(DeleteLinesWithoutLetters(SubText), True, True, True, True); //added by adenry
    if tmpText <> SubText then
    begin
      SubText := tmpText;
      Result  := Result + [ftLinesWithoutLettersDeleted];
    end;
  end;

  // --------------- //
  // Empty subtitles //
  // --------------- //
  if ErrorsToFix.eEmptySubtitle then
  begin
    //if IsEmpty(SubText) then //removed by adenry
    if IsEmpty(RemoveSWTags(SubText, True, True, True, True)) then //added by adenry
    begin
      if ConfirmDeletions = False then
        Result := Result + [ftEmptySubtitleDeleted] else
      begin
        case MsgBox(Format(IEMsgBoxes[1], [Node.Index + 1, Data.Text]), BTN_YES, BTN_NO, BTN_CANCEL, MB_ICONQUESTION, FormParent) of
          1: Result := Result + [ftEmptySubtitleDeleted];
          2: Result := [];
          3: CancelProcess := True;
        end;
      end;
      exit;
    end;
  end;

  //added by adenry: begin
  // --------------- //
  // Unnecessary TAGS//
  // --------------- //
  if ErrorsToFix.eUnnecessaryTags then
    if SubtitleApi.MultiTagsMode then
    begin
      tmpText := RemoveUnnecessaryTags(SubText);
      if tmpText <> SubText then
      begin
        SubText := tmpText;
        Result  := Result + [ftUnnecessaryTags];
      end;
    end;
  //added by adenry: end

  // ----------------- //
  // Repeated subtitle //
  // ----------------- //
  if ErrorsToFix.eRepeatedSubtitle then
  begin
    if Node <> frmMain.lstSubtitles.GetFirst then
    begin
      if ((DataP.Text = Data.Text) and (Data.Text <> '')) and // If the text is the same (we don't use SubText because Data.Text contains the tags)
         ((Data.InitialTime - DataP.FinalTime) < ToleranceForRepeated) then // And the difference of time is less than the tolerance
      begin
        DataP.FinalTime := Data.FinalTime;
        Result          := Result + [ftRepeatedSubtitle];
        exit;
      end;
    end;
  end;

//Prohibitet character, Text before colon, Hearing impaired were moved from here by adenry !!!

  // ----------- //
  // Overlapping //
  // ----------- //
  if (ErrorsToFix.eOverlapping) then
  begin
    if Node <> frmMain.lstSubtitles.GetFirst then
    begin
      if Data.InitialTime <= DataP.FinalTime then
      begin
        if frmMain.FormatType = ftTime then
          //removed by adenry: begin
          {OVERLAPPRECISION := ID_TIMEOVERLAPPRECISION else
          OVERLAPPRECISION := FramesToTime(TimeToFrames(ID_TIMEOVERLAPPRECISION, GetFPS), GetFPS) + 10;}
          //removed by adenry: end
          //added by adenry: begin
          OVERLAPPRECISION := frmMain.DefaultSubPause else
          OVERLAPPRECISION := FramesToTime(TimeToFrames(frmMain.DefaultSubPause, GetFPS), GetFPS);
          //added by adenry: end

        tmpText := RemoveSWTags(DataP.Text, True, True, True, True);
        if Abs(Length(Data.Text) - Length(tmpText)) < 5 then // Set equal lengths for both subtitles
        begin
          i                := Data.FinalTime - DataP.InitialTime - OVERLAPPRECISION; //- OVERLAPPRECISION added by adenry
          DataP.FinalTime  := DataP.InitialTime + (i div 2);
          Data.InitialTime := DataP.FinalTime + OVERLAPPRECISION;
        end else
        begin
          // We cut smaller string
          if Length(Data.Text) < Length(tmpText) then
            Data.InitialTime := DataP.FinalTime + OVERLAPPRECISION else
            DataP.FinalTime := Data.InitialTime - OVERLAPPRECISION; //this was moved here by adenry
        end;
        //DataP.FinalTime := Data.InitialTime - OVERLAPPRECISION; //removed by adenry

        Result := Result + [ftOverlapping];
      end;
    end;
  end;

  // ---------- //
  // Bad values //
  // ---------- //
  if ErrorsToFix.eBadValues then
  begin
    if Data.InitialTime > Data.FinalTime then
    begin
      i                := Data.InitialTime;
      Data.InitialTime := Data.FinalTime;
      Data.FinalTime   := i;
      Result           := Result + [ftBadValues];
    end;
  end;

  // ---------------- //
  // Unnecessary dots //
  // ---------------- //
  if ErrorsToFix.eUnnecessaryDots then
  begin
    if HasUnnecessaryDots(SubText) then
    begin
      tmpText := RemoveUnnecessaryDots(SubText);
      if tmpText <> SubText then
      begin
        SubText := tmpText;
        Result  := Result + [ftUnnecessaryDots];
      end;
    end;
  end;

  // ------------------ //
  // Repeated character //
  // ------------------ //
  if ErrorsToFix.eRepeatedCharacter then
  begin
    tmpText := RemoveRepeatedChar(SubText);
    if tmpText <> SubText then
    begin
      SubText := tmpText;
      Result  := Result + [ftRepeatedCharacter];
    end;
  end;

  // OCR Errors was here

  // ------------------------------- //
  // "- " in subtitles with one line //
  // ------------------------------- //
  if ErrorsToFix.eOpnDlgSubsOneLine then
  begin
    if (CountLines(SubText) = 1) then
    begin
      tmpText := SubText;
      //added by adenry: begin
      dash := ' ';
      i := 1;
      while not (dash in dashes) and (i <= Length(SubText)) do
      begin
        dash := SubText[i];
        i := i + 1;
      end;
      if not (dash in dashes) then dash := '-'; //just in case
      //added by adenry: end
      //added by adenry: begin
      tmpTags := '';
      if SubtitleApi.MultiTagsMode and (Pos(dash,tmpText)>3) then
        if ReplaceString(RemoveSWTags(Copy(tmpText,1,Pos(dash,tmpText)-1),True,True,True,True),' ','') = '' then
        begin
          tmpTags := Copy(tmpText,1,Pos(dash,tmpText)-1);
          Delete (tmpText,1,Pos(dash,tmpText)-1);
        end;
      //added by adenry: end

      while Copy(tmpText, 1, 1) = ' ' do Delete(tmpText,1,1);//added by adenry
      while Copy(tmpText, 1, 1) = dash do //'-' replaced with dash by adenry
      begin
        tmpText := TrimLeft(Copy(tmpText, 2, Length(tmpText)));
        if ftOpnDlgOneLineSubDeleted in Result = False then
          Result := Result + [ftOpnDlgOneLineSubDeleted];
      end;

      if SubtitleApi.MultiTagsMode then tmpText := tmpTags + tmpText; //added by adenry
      while Copy(tmpText, 1, 1) = ' ' do Delete(tmpText,1,1);//added by adenry

      //if Copy(SubText, 1, 1) = '-' then //removed by adenry
      if Copy(ReplaceString(RemoveSWTags(SubText,True,True,True,True), ' ', ''), 1, 1) = dash then //added by adenry
      begin
        if ConfirmDeletions = True then
        begin
          case MsgBox(Format(IEMsgBoxes[5], [Node.Index + 1, Data.Text]), BTN_YES, BTN_NO, BTN_CANCEL, MB_ICONQUESTION, FormParent) of
            1: begin SubText := tmpText; Result := Result + [ftHearingImpairedPartDeleted]; end;
            2: Result := Result - [ftOpnDlgOneLineSubDeleted];
            3: begin Result := Result - [ftOpnDlgOneLineSubDeleted]; CancelProcess := True; end;
          end;
        end else SubText := tmpText;
      end;
    end;
  end;

  //added by adenry: begin
  // ------------------ //
  // "- " on first line //
  // ------------------ //
  if ErrorsToFix.eDashOnFirstLine then
    if CountLines(SubText) > 1 then
      if HasDashOnFirstLine(SubText, ErrorsToFix.eOnlyIfNoDashOnSecondLine) then
      begin
        tmpText := RemoveDashOnFirstLine(SubText);
        Result := Result + [ftDashOnFirstline];
        if ConfirmDeletions = True then
        begin
          case MsgBox(Format(IEMsgBoxes[5], [Node.Index + 1, Data.Text]), BTN_YES, BTN_NO, BTN_CANCEL, MB_ICONQUESTION, FormParent) of
            1: begin SubText := tmpText; Result := Result + [ftDashOnFirstline]; end;
            2: Result := Result - [ftDashOnFirstline];
            3: begin Result := Result - [ftDashOnFirstline]; CancelProcess := True; end;
          end;
        end else SubText := tmpText;
      end;
  //added by adenry: begin

  // ------------------ //
  // Unnecessary spaces //
  // ------------------ //
  if ErrorsToFix.eUnnecessarySpaces then
  begin
    tmpText := RemoveUnnecessarySpaces(SubText);
    if tmpText <> SubText then
    begin
      SubText := tmpText;
      Result  := Result + [ftUnnecessarySpaces];
    end;
  end;

  // -------------------------------- //
  // No space after custom characters //
  // -------------------------------- //
  if ErrorsToFix.eSpaceAfterCustChars then
  begin
    tmpText := FixNoSpaceAfterOrBeforeCustomChar(SubText, True);
    if tmpText <> SubText then
    begin
      SubText := tmpText;
      Result  := Result + [ftSpaceAfterCustChars];
    end;
  end;

  // --------------------------------- //
  // No space before custom characters //
  // --------------------------------- //
  if ErrorsToFix.eSpaceBeforeCustChars then
  begin
    tmpText := FixNoSpaceAfterOrBeforeCustomChar(SubText, False);
    if tmpText <> SubText then
    begin
      SubText := tmpText;
      Result  := Result + [ftSpaceBeforeCustChars];
    end;
  end;

  // ----------------------- //
  // Subtitle over two lines //
  // ----------------------- //
  if ErrorsToFix.eOverTwoLines then
  begin
    if CountLines(SubText) > 2 then
    begin
      //SubText := AdjustLines(SubText); //removed by adenry
      //added by adenry: begin
      SubText := SmartWrapText(SubText, frmMain.OrgCharset, TooLongLine, False, False, False);
      if Pos(#13#10, SubText) = 0 then
        SubText := BreakTextInTheMiddle(SubText);
      //added by adenry: end
      Result  := Result + [ftOverTwoLinesAdjusted];
    end;
  end;

  //added by adenry: begin
  // -------------------- //
  // Dialogue on one line //
  // -------------------- //
  if ErrorsToFix.eDialogueOnOneLine then
  begin
    DialoguesOnOneLineNum := HasDialogueOnOneLine(SubText, frmMain.OrgCharset);
    if DialoguesOnOneLineNum > 0 then
    begin
      SubText := FixDialogueOnOneLine(SubText, frmMain.OrgCharset, DialoguesOnOneLineNum);
      //if not HasDialogueOnOneLine(SubText, frmMain.OrgCharset) then
      if HasDialogueOnOneLine(SubText, frmMain.OrgCharset) < DialoguesOnOneLineNum then
        Result  := Result + [ftDialogueOnOneLine];
    end;
  end;
  //added by adenry: end

  if SubtitleApi.SingleTagsMode then //added by adenry
  begin
    // Restore tags
    if Underline = True then SubText := '<u>' + SubText;
    if Bold      = True then SubText := '<b>' + SubText;
    if Italic    = True then SubText := '<i>' + SubText;
    if SubColor > -1 then
      SubText := SetColorTag(SubText, SubColor);
  end;

  // Apply modifications done to the text
  SetText(Node, SubText); //modified by adenry. was: //Data.Text := SubText;
  UpdateSubSubtitleVisibilityAfterNodeChange(Node, OldShowTime, OldHideTime, Data.InitialTime, Data.FinalTime); //added by adenry

  //removed by adenry: begin
  {if ((etTooLongDuration  in Data.ErrorType) = False) and
     ((etTooShortDuration in Data.ErrorType) = False) and
     ((etTooLongLine      in Data.ErrorType) = False) and
     ((etTooMuchCPS       in Data.ErrorType) = False) then //added by adenry
    Data.ErrorType := [];}
  //removed by adenry: end

  //Data.ErrorType := GetError(Node, Previous);


//frmMain.AutoRecheckNodeErrors(Node); //added by adenry //removed by adenry when making optimization.


  //added by adenry: begin
  //Data.ErrorType := [];
  //Data.ErrorType := GetError(Node, Previous, [etTooLongDuration]+[etTooShortDuration]+[etTooLongLine]+[etTooMuchCPS]);
  //added by adenry: end
end;

// -----------------------------------------------------------------------------

procedure FixErrors(const OnlySelected: Boolean = False);
var
  Data, Data2   : PSubtitleItem;
  PrevData      : PSubtitleItem; //added by adenry
  PrevFinalTime : Integer;
  Node          : PVirtualNode;
  Sib           : PVirtualNode;
  FTS           : TFixTypesSet;
  UndoAction    : PUndoAction;
  PrevUndoAction: PUndoAction; //added by adenry
begin
Screen.Cursor := crHourGlass; //added by adenry
try
  //if (ErrorsToFix.eOCRErrors) and (FileExists(OCRDefFile)) then ParseOCRErrors(OCRDefFile); //removed by adenry later
  with frmMain do
  begin
    if OnlySelected = False then
      Node := lstSubtitles.GetFirst else
      Node := lstSubtitles.GetFirstSelected;
    while Assigned(Node) do
    begin
      if OnlySelected = False then
        Sib := Node.NextSibling else
        Sib := lstSubtitles.GetNextSelected(Node);

      Data := lstSubtitles.GetNodeData(Node);

      //added by adenry: begin
      //this will be used to save changes of previous subtitle's final time (it changes when fixing overlapping or repeated subtitles)
      PrevFinalTime := -1;
      if Node <> lstSubtitles.GetFirst then
      begin
        PrevData := lstSubtitles.GetNodeData(Node.PrevSibling);
        PrevFinalTime := PrevData.FinalTime;
      end;
      //added by adenry: end

      New(UndoAction);
      UndoAction^.UndoActionType := uaFullSubChange;
      //added by adenry: begin
      if OnlySelected = True then
        UndoAction^.UndoActionName := uanFixErrorsSelSubs else
        UndoAction^.UndoActionName := uanFixAllErrors;
      //added by adenry: end
      UndoAction^.BufferSize     := SizeOf(TLineChange);
      UndoAction^.Buffer         := AllocMem(UndoAction^.BufferSize);
      UndoAction^.Node           := Node;
      UndoAction^.LineNumber     := Node.Index;
      UndoAction^.BindToNext     := True;
      PLineChange(UndoAction^.Buffer).SubtitleItem := Data^;

      // Delete:
      //   ftEmptySubtitleDeleted
      //   ftRepeatedSubtitle
      //   ftSubDeletedProhibitedCharacter
      //   ftHearingImpairedDeleted
      FTS := FixError(Node, Node.PrevSibling, ShowConfMainForm, frmMain);

      //added by adenry: begin
      //this will save changes of previous subtitle's final time (it changes when fixing overlapping or repeated subtitles)
      if Node <> lstSubtitles.GetFirst then
      begin
        PrevData := lstSubtitles.GetNodeData(Node.PrevSibling);
        if PrevData.FinalTime <> PrevFinalTime then
        begin
          New(PrevUndoAction);
          PrevUndoAction^.UndoActionType                 := uaTimeChange;
          //added by adenry later: begin
          if OnlySelected = True then
            UndoAction^.UndoActionName := uanFixErrorsSelSubs else
            UndoAction^.UndoActionName := uanFixAllErrors;
          //added by adenry later: end
          PrevUndoAction^.BufferSize                     := SizeOf(TTimeChange);
          PrevUndoAction^.Buffer                         := AllocMem(PrevUndoAction^.BufferSize);
          PrevUndoAction^.Node                           := Node.PrevSibling;
          PrevUndoAction^.LineNumber                     := Node.PrevSibling.Index;
          PrevUndoAction^.BindToNext                     := True;
          PTimeChange(PrevUndoAction^.Buffer)^.StartTime := -1;
          PTimeChange(PrevUndoAction^.Buffer)^.FinalTime := PrevFinalTime;
          AddUndo(PrevUndoAction);
        end;
      end;
      //added by adenry: end

      if (ftEmptySubtitleDeleted in FTS)          or
         (ftRepeatedSubtitle in FTS)              or
         (ftSubDeletedProhibitedCharacter in FTS) or
         (ftHearingImpairedDeleted in FTS)        then
      begin
        New(UndoAction);
        UndoAction^.UndoActionType                    := uaDeleteLine;
        //added by adenry: begin
        if OnlySelected = True then
          UndoAction^.UndoActionName := uanFixErrorsSelSubs else
          UndoAction^.UndoActionName := uanFixAllErrors;
        //added by adenry: end
        UndoAction^.BufferSize                        := SizeOf(TLineChange);
        UndoAction^.Buffer                            := AllocMem(UndoAction^.BufferSize);
        UndoAction^.BindToNext                        := True;
        UndoAction^.LineNumber                        := Node.Index;
        PLineChange(UndoAction^.Buffer)^.SubtitleItem := Data^;
        AddUndo(UndoAction);
        lstSubtitles.DeleteNode(Node);
      end else
      begin
        Data2 := lstSubtitles.GetNodeData(Node);
        if (PLineChange(UndoAction^.Buffer).SubtitleItem.InitialTime <> Data2^.InitialTime) or
           (PLineChange(UndoAction^.Buffer).SubtitleItem.FinalTime   <> Data2^.FinalTime)   or
           (PLineChange(UndoAction^.Buffer).SubtitleItem.Text        <> Data2^.Text)        or
           (PLineChange(UndoAction^.Buffer).SubtitleItem.Translation <> Data2^.Translation) or
           (PLineChange(UndoAction^.Buffer).SubtitleItem.ErrorType   <> Data2^.ErrorType)   then        
          AddUndo(UndoAction);
      end;

      if CancelProcess then
      begin
        CancelProcess        := False;
        OrgModified          := True;
        TransModified        := True;
        if UndoList.Count > 0 then
          PUndoAction(UndoList.Last)^.BindToNext := False;
        lstSubtitles.Refresh;
        RefreshTimes;
        exit;
      end;

      //added by adenry: begin
      {if OnlySelected then
      begin
        frmMain.AutoRecheckNodeErrors(Node);
        frmMain.AutoRecheckNodeErrors(Node.PrevSibling);
      end;}
      //added by adenry: end
      Node := Sib;
    end;

    if UndoList.Count > 0 then
      PUndoAction(UndoList.Last)^.BindToNext := False;
    RefreshTimes;
    lstSubtitles.Refresh;
    OrgModified   := True;
    TransModified := True;
  end;
finally
  Screen.Cursor := crDefault; //added by adenry
end;
end;

// -----------------------------------------------------------------------------

end.
