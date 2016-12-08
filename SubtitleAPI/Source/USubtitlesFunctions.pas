// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: Subtitles text and timing functionality

unit USubtitlesFunctions;

// -----------------------------------------------------------------------------

interface

uses
  Classes, //added by adenry for TStrings 2013.04.11
  Windows, //added by adenry for GetRValue, GetGValue, GetBValue 2013.04.11
  SysUtils, Math, FastStrings;

// -----------------------------------------------------------------------------

type
  SubtitleString = {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF};

  TCPData = record
    CPID: UINT;
    CPName: SubtitleString;
  end;

// -----------------------------------------------------------------------------

const
  HexChars: set of Char = ['A'..'F', 'a'..'f' , '0'..'9']; //added by adenry 2013.04.11

  MaxEncodings = 140;
  Encodings: array[0..MaxEncodings - 1] of TCPData =
  (
    (CPID: 37; CPName: 'IBM037'),
    (CPID: 437; CPName: 'IBM437'),
    (CPID: 500; CPName: 'IBM500'),
    (CPID: 708; CPName: 'ASMO-708'),
    (CPID: 720; CPName: 'DOS-720'),
    (CPID: 737; CPName: 'ibm737'),
    (CPID: 775; CPName: 'ibm775'),
    (CPID: 850; CPName: 'ibm850'),
    (CPID: 852; CPName: 'ibm852'),
    (CPID: 855; CPName: 'IBM855'),
    (CPID: 857; CPName: 'ibm857'),
    (CPID: 858; CPName: 'IBM00858'),
    (CPID: 860; CPName: 'IBM860'),
    (CPID: 861; CPName: 'ibm861'),
    (CPID: 862; CPName: 'DOS-862'),
    (CPID: 863; CPName: 'IBM863'),
    (CPID: 864; CPName: 'IBM864'),
    (CPID: 865; CPName: 'IBM865'),
    (CPID: 866; CPName: 'cp866'),
    (CPID: 869; CPName: 'ibm869'),
    (CPID: 870; CPName: 'IBM870'),
    (CPID: 874; CPName: 'windows-874'),
    (CPID: 875; CPName: 'cp875'),
    (CPID: 932; CPName: 'shift_jis'),
    (CPID: 936; CPName: 'gb2312'),
    (CPID: 949; CPName: 'ks_c_5601-1987'),
    (CPID: 950; CPName: 'big5'),
    (CPID: 1026; CPName: 'IBM1026'),
    (CPID: 1047; CPName: 'IBM01047'),
    (CPID: 1140; CPName: 'IBM01140'),
    (CPID: 1141; CPName: 'IBM01141'),
    (CPID: 1142; CPName: 'IBM01142'),
    (CPID: 1143; CPName: 'IBM01143'),
    (CPID: 1144; CPName: 'IBM01144'),
    (CPID: 1145; CPName: 'IBM01145'),
    (CPID: 1146; CPName: 'IBM01146'),
    (CPID: 1147; CPName: 'IBM01147'),
    (CPID: 1148; CPName: 'IBM01148'),
    (CPID: 1149; CPName: 'IBM01149'),
    (CPID: 1200; CPName: 'utf-16'),
    (CPID: 1201; CPName: 'unicodeFFFE'),
    (CPID: 1250; CPName: 'windows-1250'),
    (CPID: 1251; CPName: 'windows-1251'),
    (CPID: 1252; CPName: 'windows-1252'),
    (CPID: 1253; CPName: 'windows-1253'),
    (CPID: 1254; CPName: 'windows-1254'),
    (CPID: 1255; CPName: 'windows-1255'),
    (CPID: 1256; CPName: 'windows-1256'),
    (CPID: 1257; CPName: 'windows-1257'),
    (CPID: 1258; CPName: 'windows-1258'),
    (CPID: 1361; CPName: 'Johab'),
    (CPID: 10000; CPName: 'macintosh'),
    (CPID: 10001; CPName: 'x-mac-japanese'),
    (CPID: 10002; CPName: 'x-mac-chinesetrad'),
    (CPID: 10003; CPName: 'x-mac-korean'),
    (CPID: 10004; CPName: 'x-mac-arabic'),
    (CPID: 10005; CPName: 'x-mac-hebrew'),
    (CPID: 10006; CPName: 'x-mac-greek'),
    (CPID: 10007; CPName: 'x-mac-cyrillic'),
    (CPID: 10008; CPName: 'x-mac-chinesesimp'),
    (CPID: 10010; CPName: 'x-mac-romanian'),
    (CPID: 10017; CPName: 'x-mac-ukrainian'),
    (CPID: 10021; CPName: 'x-mac-thai'),
    (CPID: 10029; CPName: 'x-mac-ce'),
    (CPID: 10079; CPName: 'x-mac-icelandic'),
    (CPID: 10081; CPName: 'x-mac-turkish'),
    (CPID: 10082; CPName: 'x-mac-croatian'),
    (CPID: 12000; CPName: 'utf-32'),
    (CPID: 12001; CPName: 'utf-32BE'),
    (CPID: 20000; CPName: 'x-Chinese-CNS'),
    (CPID: 20001; CPName: 'x-cp20001'),
    (CPID: 20002; CPName: 'x-Chinese-Eten'),
    (CPID: 20003; CPName: 'x-cp20003'),
    (CPID: 20004; CPName: 'x-cp20004'),
    (CPID: 20005; CPName: 'x-cp20005'),
    (CPID: 20105; CPName: 'x-IA5'),
    (CPID: 20106; CPName: 'x-IA5-German'),
    (CPID: 20107; CPName: 'x-IA5-Swedish'),
    (CPID: 20108; CPName: 'x-IA5-Norwegian'),
    (CPID: 20127; CPName: 'us-ascii'),
    (CPID: 20261; CPName: 'x-cp20261'),
    (CPID: 20269; CPName: 'x-cp20269'),
    (CPID: 20273; CPName: 'IBM273'),
    (CPID: 20277; CPName: 'IBM277'),
    (CPID: 20278; CPName: 'IBM278'),
    (CPID: 20280; CPName: 'IBM280'),
    (CPID: 20284; CPName: 'IBM284'),
    (CPID: 20285; CPName: 'IBM285'),
    (CPID: 20290; CPName: 'IBM290'),
    (CPID: 20297; CPName: 'IBM297'),
    (CPID: 20420; CPName: 'IBM420'),
    (CPID: 20423; CPName: 'IBM423'),
    (CPID: 20424; CPName: 'IBM424'),
    (CPID: 20833; CPName: 'x-EBCDIC-KoreanExtended'),
    (CPID: 20838; CPName: 'IBM-Thai'),
    (CPID: 20866; CPName: 'koi8-r'),
    (CPID: 20871; CPName: 'IBM871'),
    (CPID: 20880; CPName: 'IBM880'),
    (CPID: 20905; CPName: 'IBM905'),
    (CPID: 20924; CPName: 'IBM00924'),
    (CPID: 20932; CPName: 'EUC-JP'),
    (CPID: 20936; CPName: 'x-cp20936'),
    (CPID: 20949; CPName: 'x-cp20949'),
    (CPID: 21025; CPName: 'cp1025'),
    (CPID: 21866; CPName: 'koi8-u'),
    (CPID: 28591; CPName: 'iso-8859-1'),
    (CPID: 28592; CPName: 'iso-8859-2'),
    (CPID: 28593; CPName: 'iso-8859-3'),
    (CPID: 28594; CPName: 'iso-8859-4'),
    (CPID: 28595; CPName: 'iso-8859-5'),
    (CPID: 28596; CPName: 'iso-8859-6'),
    (CPID: 28597; CPName: 'iso-8859-7'),
    (CPID: 28598; CPName: 'iso-8859-8'),
    (CPID: 28599; CPName: 'iso-8859-9'),
    (CPID: 28603; CPName: 'iso-8859-13'),
    (CPID: 28605; CPName: 'iso-8859-15'),
    (CPID: 29001; CPName: 'x-Europa'),
    (CPID: 38598; CPName: 'iso-8859-8-i'),
    (CPID: 50220; CPName: 'iso-2022-jp'),
    (CPID: 50221; CPName: 'csISO2022JP'),
    (CPID: 50222; CPName: 'iso-2022-jp'),
    (CPID: 50225; CPName: 'iso-2022-kr'),
    (CPID: 50227; CPName: 'x-cp50227'),
    (CPID: 51932; CPName: 'euc-jp'),
    (CPID: 51936; CPName: 'EUC-CN'),
    (CPID: 51949; CPName: 'euc-kr'),
    (CPID: 52936; CPName: 'hz-gb-2312'),
    (CPID: 54936; CPName: 'GB18030'),
    (CPID: 57002; CPName: 'x-iscii-de'),
    (CPID: 57003; CPName: 'x-iscii-be'),
    (CPID: 57004; CPName: 'x-iscii-ta'),
    (CPID: 57005; CPName: 'x-iscii-te'),
    (CPID: 57006; CPName: 'x-iscii-as'),
    (CPID: 57007; CPName: 'x-iscii-or'),
    (CPID: 57008; CPName: 'x-iscii-ka'),
    (CPID: 57009; CPName: 'x-iscii-ma'),
    (CPID: 57010; CPName: 'x-iscii-gu'),
    (CPID: 57011; CPName: 'x-iscii-pa'),
    (CPID: 65000; CPName: 'utf-7'),
    (CPID: 65001; CPName: 'utf-8')
  );

// ----------------------------------------------------- ------------------------
  
function RemoveSWTags   (Text: String; Bold, Italic, Underline: Boolean; Color: Boolean = True): String; //moved here from USubtitlesSave by adenry 2013.04.11
function TimeToFrames   (Time: Integer; FPS: Single): Integer;
function FramesToTime   (Frames, FPS: Single): Integer;
function StringCount    (const aFindString, aSourceString : {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF}; Const CaseSensitive : Boolean = TRUE): Integer;
function IsInteger      (const Str: {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF}; AddChars: {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF} = ''): Boolean;
function TimeToString   (Time: Integer; TimeFormat: String = {$IFDEF VIPLAY}'hh:mm:ss'{$ELSE}'hh:mm:ss,zzz'{$ENDIF}): String;
//function StringToTime   (Time: String; NoHours: Boolean = False): Integer;
function StringToTime   (Time: String; NoHours: Boolean = False; FramesInstead: Boolean = False): Integer;    // by Bedazzle 2007.05.13
function TimeInFormat   (Time, Format: String): Boolean;
function PadLeft        (const S: {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF}; const PadChar: {$IFDEF UTF8}WideChar{$ELSE}AnsiChar{$ENDIF}; const Length: Integer; const Cut: Boolean = False): String;
function PadRight       (const S: {$IFDEF UTF8}WideString{$ELSE}AnsiString{$ENDIF}; const PadChar: {$IFDEF UTF8}WideChar{$ELSE}AnsiChar{$ENDIF}; const Length: Integer; const Cut: Boolean): {$IFDEF UTF8}WideString{$ELSE}AnsiString{$ENDIF};
function LimitDecimals  (Num: Real; Limit: Integer): {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF};
function ReverseText    (Text: {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF}; KeepLinesOrder: Boolean = True) : {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF};
function ReplaceEnters  (const S, NewPattern: {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF}): {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF};
function ReplaceString  (const S, OldPattern, NewPattern: {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF}; ReplaceAll: Boolean = True; IgnoreCase: Boolean = True): {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF};
function InvertHTMLColor(const Color: {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF}): {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF};
function InvertHTMLColor2(var Color: {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF}): Boolean; //added by adenry 2013.04.11
function ColorToHTML(Color: Integer): {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF}; //added by adenry 2013.04.11
function RemoveRTFFormatting(Text: {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF}): {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF};
function GetMSInFrames(const Time: Integer; const FPS: Single): Integer;
function MSToHHMMSSFFTime(const Time: Integer; const FPS: Single; const FramesSeparator: Char = ':'): String;
function HHMMSSFFTimeToMS(const Time: String; const FPS: Single): Integer;
function CloseUnclosedTags(Text, OpenTag, CloseTag: {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF}): {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF}; //added by adenry 2013.04.11
function SetTagsForSingleTagsMode(Text: {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF}; CloseTags: Boolean = False): {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF}; //added by adenry 2013.04.11
procedure SplitDelimitedString(Delimiter: Char; Str: {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF}; ListOfStrings: TStrings); //added by adenry 2013.04.11
function CharSetToCodePage(ciCharset: UINT): UINT;
function GetCharsetEncoding(charset: Byte): SubtitleString;
function StringToWideStringEx(const S: string; CodePage: Word): WideString;
function WideStringToStringEx(const WS: WideString; CodePage: Word): AnsiString;
// -----------------------------------------------------------------------------

implementation

// -----------------------------------------------------------------------------

function RemoveSWTags(Text: {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF}; Bold, Italic, Underline: Boolean; Color: Boolean = True): {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF};
var p: Integer; //added by adenry 2013.04.11
begin
  if Bold      = True then begin
    Text := ReplaceString(Text, '<b>', '');
    Text := ReplaceString(Text, '</b>', '');
  end;

  if Italic    = True then begin
    Text := ReplaceString(Text, '<i>', '');
    Text := ReplaceString(Text, '</i>', '');
  end;

  if Underline = True then begin
    Text := ReplaceString(Text, '<u>', '');
    Text := ReplaceString(Text, '</u>', '');
  end;

  if Color = True then begin
    while SmartPos('<c:#', Text, False) > 0 Do
      //Delete(Text, SmartPos('<c:#', Text, False), Pos('>', Copy(Text, SmartPos('<c:#', Text, False), Length(Text)))); //removed by adenry 2013.04.11
    //added by adenry: begin 2013.04.11
    begin
      p := Pos('>', Copy(Text, SmartPos('<c:#', Text, False), Length(Text)));
      if p > 0 then //avoid infinite loop
        Delete(Text, SmartPos('<c:#', Text, False), p) else
        break;
    end;
    //added by adenry: end
    Text := ReplaceString(Text, '</c>', '');
  end;
  
  Result := Text;
end;

//------------------------------------------------------------------------------

function TimeToFrames(Time: Integer; FPS: Single): Integer;
begin
  Result := Round((Time / 1000) * FPS);
end;

// -----------------------------------------------------------------------------

function FramesToTime(Frames, FPS: Single): Integer;
begin
  Result := Round((Frames / FPS) * 1000);
end;

// -----------------------------------------------------------------------------

function StringCount(const aFindString, aSourceString : {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF}; Const CaseSensitive : Boolean = TRUE) : Integer;
var
  Find,
  Source,
  NextPos                     : {$IFDEF UTF8}PWideChar{$ELSE}PChar{$ENDIF};
  LSource,
  LFind                       : Integer;
  Next                        : TFastPosProc;
  JumpTable                   : TBMJumpTable;
begin
  Result := 0;
  LSource := Length(aSourceString);
  if LSource = 0 then exit;

  LFind := Length(aFindString);
  if LFind = 0 then exit;

  if CaseSensitive then
  begin
    Next := BMPos;
    MakeBMTable({$IFDEF UTF8}PWideChar{$ELSE}PChar{$ENDIF}(aFindString), Length(aFindString), JumpTable);
  end
  else
  begin
    Next := BMPosNoCase;
    MakeBMTableNoCase(PChar(aFindString), Length(aFindString), JumpTable);
  end;

  Source := @aSourceString[1];
  Find := @aFindString[1];

  repeat
    NextPos := Next(Source, Find, LSource, LFind, JumpTable);
    if NextPos <> nil then
    begin
      Dec(LSource, (NextPos - Source) + LFind);
      Inc(Result);
      Source := NextPos + LFind;
    end;
  until NextPos = nil;
end;

// -----------------------------------------------------------------------------

function IsInteger(const Str: {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF}; AddChars: {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF} = ''): Boolean;
var
  i       : Integer;
  Numbers : {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF};
begin
  if Str = '' then
  begin
    Result := False;
    exit;
  end;
  Numbers := '0123456789' + AddChars;  
  Result := True;
  for i := 1 to Length(Str) do
  begin
    if Pos(Str[i], Numbers) = 0 then
    begin
      Result := False;
      exit;
    end;
  end;
end;

// -----------------------------------------------------------------------------

//function StringToTime(Time: String; NoHours: Boolean = False): Integer;
function StringToTime(Time: String; NoHours: Boolean = False; FramesInstead: Boolean = False): Integer;
var
  H, M, S, Z, i: Integer;
  PCount, PFirst, PSec, PThird: Integer;
begin
  Result := -1;
  if (Time = '') then exit;

  H      := 0;
  M      := 0;
  S      := 0;
  Z      := 0;
  PCount := 0;
  PFirst := 0;
  PSec   := 0;
  PThird := 0;

  for i := 1 to Length(Time) do
  begin
    if (Time[i] in ['0'..'9']) = False then
    begin
      if Time[i] in [':',',','.',';'] then
      begin
        if (i = 1) or (i = Length(Time)) then exit;
        case PCount of
          0: PFirst  := i;
          1: PSec    := i;
          2: PThird  := i;
        end;
        Inc(PCount);
      end
      else
        Exit;
    end;
  end;

  try
    if PFirst > 0 then
    begin
      if NoHours then
        M := StrToIntDef(Copy(Time, 0, PFirst - 1), 0) else
        H := StrToIntDef(Copy(Time, 0, PFirst - 1), 0);
      if PSec > 0 then
      begin
        if NoHours then
        begin
          S := StrToIntDef(Copy(Time, PFirst + 1, PSec - PFirst - 1), 0);
          Z := StrToIntDef(PadRight(Copy(Time, PSec + 1, Length(Time)), '0', 3, False), 0);
        end else
          M := StrToIntDef(Copy(Time, PFirst + 1, PSec - PFirst - 1), 0);
        if PThird > 0 then
        begin
          S := StrToIntDef(Copy(Time, PSec + 1, PThird - PSec - 1), 0);
          Z := StrToIntDef(PadRight(Copy(Time, PThird + 1, Length(Time)), '0', 3, False), 0);
        end else
        begin
          if NoHours = False then
            S := StrToIntDef(Copy(Time, PSec + 1, Length(Time)), 0);
        end;
      end;

      if FramesInstead = FALSE then
        Result := ((H*3600)*1000) + ((M*60)*1000) + (S*1000) + Z
      else
        Result := ((H*3600)*1000) + ((M*60)*1000) + (S*1000) + Trunc(Z/10 * 41.667);   // 1000 / 24 = 41.667  (24 frames per sec)
    end;
  except
    Result := -1;
  end;
end;

// -----------------------------------------------------------------------------

function TimeInFormat(Time, Format: String): Boolean;
begin
  Result := False;
  if StringToTime(Time) > -1 then
  begin
    if (Pos(':', Time) = Pos(':', Format)) and
       (Pos('.', Time) = Pos('.', Format)) and
       (Pos(',', Time) = Pos(',', Format)) and
       (StringCount(':', Time) = StringCount(':', Format)) and
       (StringCount('.', Time) = StringCount('.', Format)) and
       (StringCount(',', Time) = StringCount(',', Format)) and
       (Length(Time) = Length(Format)) then
       Result := True;
  end;
end;

// -----------------------------------------------------------------------------

function PadLeft(const S : {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF}; const PadChar : {$IFDEF UTF8}WideChar{$ELSE}Char{$ENDIF}; const Length : Integer; const Cut : Boolean = False) : String;
var
  F, L, P, M : Integer;
  I, J : {$IFDEF UTF8}PWideChar{$ELSE}PChar{$ENDIF};
Begin
  if Length = 0 then
  begin
    if Cut then
      Result := ''
    else
      Result := S;
      
    exit;
  end;
  M := System.Length (S);
  if Length = M then
  begin
    Result := S;
    exit;
  end;
  if Cut then
    L := Length
  else
    L := Max(Length, M);
  P := Max(0, L - M);

  SetLength(Result, L);
  if P > 0 then
    FillChar(Pointer(Result)^, P, PadChar);
  if L > P then
  begin
    I := Pointer(Result);
    J := Pointer(S);
    Inc(I, P);
    for F := 1 to L - P do
    begin
      I^ := J^;
      Inc(I);
      Inc(J);
    end;
  end;
end;

// -----------------------------------------------------------------------------

function PadRight(const S: {$IFDEF UTF8}WideString{$ELSE}AnsiString{$ENDIF}; const PadChar: {$IFDEF UTF8}WideChar{$ELSE}AnsiChar{$ENDIF}; const Length: Integer; const Cut: Boolean): AnsiString;
var
  F, L, P, M : Integer;
  I, J       : {$IFDEF UTF8}PWideChar{$ELSE}PAnsiChar{$ENDIF};
  function MaxI(const A, B: Integer): Integer;
  begin
    if A > B then
      Result := A
    else
      Result := B;
  end;
begin
  if Length = 0 then
  begin
    if Cut then
      Result := ''
    else
      Result := S;

    Exit;
  end;
  M := System.Length(S);
  if Length = M then
  begin
    Result := S;
    exit;
  end;
  if Cut then
    L := Length
  else
    L := MaxI(Length, M);
  P := L - M;
  if P < 0 then
    P := 0;
  SetLength(Result, L);
  if L > P then
  begin
    I := Pointer(Result);
    J := Pointer(S);
    for F := 1 to L - P do
    begin
      I^ := J^;
      Inc(I);
      Inc(J);
    end;
  end;
  if P > 0 then
    FillChar(Result[L - P + 1], P, PadChar);
end;

// -----------------------------------------------------------------------------

function TimeToString(Time: Integer; TimeFormat: String = {$IFDEF VIPLAY}'hh:mm:ss'{$ELSE}'hh:mm:ss,zzz'{$ENDIF}): String;
var
  Hour, Min, Sec, MSec, Fram : Word;
  tmpApariciones, tmp  : Byte;
begin
  if Time < 0 then Time := 0;
  Hour := Trunc(Time / 3600000);
  Min  := Trunc((Time-(Hour*3600000)) / 60000);
  Sec  := Trunc((Time-(Hour*3600000)-(Min*60000)) / 1000);
  MSec := Trunc((Time-(Hour*3600000)-(Min*60000)-(Sec*1000)));
  Fram := Trunc(Msec/41.667);

  if TimeFormat = 'hh:mm:ss' then
    Result := Format('%.2d:%.2d:%.2d', [Hour, Min, Sec])
  else
  begin
    // ... La función StringOfChar crea una string de n caracteres ...
    tmpApariciones := StringCount('h', TimeFormat);
    if tmpApariciones > 0 then TimeFormat := ReplaceString(TimeFormat, StringOfChar('h',tmpApariciones), PadLeft(IntToStr(Hour), '0', tmpApariciones)) else
      Min := Min + Hour * 60;

    tmpApariciones := StringCount('m', TimeFormat);
    if tmpApariciones > 0 then TimeFormat := ReplaceString(TimeFormat, StringOfChar('m',tmpApariciones), PadLeft(IntToStr(Min), '0', tmpApariciones)) else
      Sec := Sec + Min * 60;

    tmpApariciones := StringCount('s', TimeFormat);
    if tmpApariciones > 0 then TimeFormat := ReplaceString(TimeFormat, StringOfChar('s',tmpApariciones), PadLeft(IntToStr(Sec), '0', tmpApariciones));

    tmpApariciones := StringCount('z', TimeFormat);
    If tmpApariciones > 0 then
    begin
      tmp := Pos('z', TimeFormat);
      TimeFormat := Copy(ReplaceString(TimeFormat, StringOfChar('z', tmpApariciones), Copy(PadLeft(IntToStr(MSec), '0', 3), 0, tmpApariciones)), 0, tmp + tmpApariciones-1);
    end;

    tmpApariciones := StringCount('f', TimeFormat);
    If tmpApariciones > 0 then
    begin
      tmp := Pos('f', TimeFormat);
      TimeFormat := Copy(ReplaceString(TimeFormat, StringOfChar('f', tmpApariciones), Copy(PadLeft(IntToStr(Fram), '0', 2), 0, tmpApariciones)), 0, tmp + tmpApariciones-1);
    end;

    Result := TimeFormat;
  end;
end;

// -----------------------------------------------------------------------------
{
function ReemplazaDecimalChar(Num: Real; Character: Char): String;
begin
  Result := FloatToStr(Num);
  Result := ReplaceString(Result,DecimalSeparator,Character, True, False);
end;   }

// -----------------------------------------------------------------------------

function LimitDecimals(Num: Real; Limit: Integer) : String;
begin
  Result := FloatToStr(Round(Num * Power(10, Limit)) / Power(10, Limit));
end;

// -----------------------------------------------------------------------------

Function ReverseText(Text: {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF}; KeepLinesOrder: Boolean = True): {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF};
var
  x, TotalLines      : Integer;
  PosEnter, NewEnter : Integer;
begin
  try
    if KeepLinesOrder = True then
    begin
      SetLength(Result, Length(Text));
      TotalLines := 0;
      repeat
        NewEnter := 0;
        PosEnter   := Pos(#13#10, Text);

        if PosEnter = 0 then
          PosEnter := Length(Text)+1
        else
          NewEnter := PosEnter;

        for x := 1 to PosEnter-1 do
          Result[TotalLines+PosEnter-x] := Text[x];

        if NewEnter <> 0 then
        begin
          Result[TotalLines+NewEnter]   := #13;
          Result[TotalLines+NewEnter+1] := #10;
        end;

        Delete(Text, 1, PosEnter+1);
        Inc(TotalLines, PosEnter+1);
      until Text = '';
    end
    else
    begin
      Result := '';
      for x := 1 to Length(Text) do
        Result := Text[x] + Result;
      Result := ReplaceString(Result, #10#13, #13#10);
    end;
  except
    Result := '';
  end;
end;

// -----------------------------------------------------------------------------

function ReplaceEnters(const S, NewPattern: {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF}): {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF};
begin
  Result := FastReplace(S, #13#10, NewPattern);
end;

// -----------------------------------------------------------------------------

function ReplaceString(const S, OldPattern, NewPattern: {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF}; ReplaceAll: Boolean = True; IgnoreCase: Boolean = True): {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF};
var
  Flags: TReplaceFlags;
begin
  Flags := [];
  If ReplaceAll = True Then Flags := Flags + [rfReplaceAll];
  If IgnoreCase = True Then Flags := Flags + [rfIgnoreCase];
  Result := FastAnsiReplace(S, OldPattern, NewPattern, Flags);
end;

// -----------------------------------------------------------------------------

function InvertHTMLColor(const Color: {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF}): {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF};
begin
  If (Color = '') or (Length(Color) <> 6) Then Exit;
  Result := Copy(Color, 5, 2) + Copy(Color, 3, 2) + Copy(Color, 1, 2);
end;

// -----------------------------------------------------------------------------

//added by adenry: begin 2013.04.11
function InvertHTMLColor2(var Color: {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF}): Boolean;
begin
  Result := False;
  if Length(Color) = 6 then
    if (Color[1] in HexChars)and(Color[2] in HexChars)and(Color[3] in HexChars)and(Color[4] in HexChars)and(Color[5] in HexChars)and(Color[6] in HexChars) then
    begin
      color := color[5] + color[6] + color[3] + color[4] + color[1] + color[2];
      Result := True;
    end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin 2013.04.11
function ColorToHTML(Color: Integer): {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF};
begin
  Result := Format('%.2x%.2x%.2x', [GetRValue(Color), GetGValue(Color), GetBValue(Color)]);
end;
//added by adenry: end

// -----------------------------------------------------------------------------

function RemoveRTFFormatting(Text: {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF}): {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF};
  function Resolve(c: {$IFDEF UTF8}WideChar{$ELSE}Char{$ENDIF}): Integer;
  { Convert char to integer value - used to decode \'## to an ansi-value }
  begin
    c := UpperCase(c)[1];
    case Byte(c) of
      48..57 : Result := Byte(c) - 48;
      65..70 : Result := Byte(c) - 55;
      else Result := 0;
    end;
  end;
var
  i,c: Integer;
begin
  i := Pos('{', Text);
  c := Pos('}', Text);
  while (i > 0) and (c > 0) do
  begin
    if c < i then
      Delete(Text, c, 1) else
      Delete(Text, i, c-i+1);
    i := Pos('{', Text);
    c := Pos('}', Text);
  end;

  // Decode each \'## value to an ansi character
  c := Pos('\''', Text);
  while c > 0 do
  begin
    Delete(Text, c, 2);
    Text[c] := Char(Resolve(Text[c])*16 + Resolve(Text[c+1]));
    Delete(Text, c+1, 1);
    c := Pos('\''', Text);
  end;

  i := Pos('\', Text);
  if i > 0 then
  begin
    c := SmartPos(' ', Text, True, i);
    while (i > 0) and (c > 0) do
    begin
      Delete(Text, i, c-i+1);
      i := Pos('\', Text);
      if i > 0 then
        c := SmartPos(' ', Text, True, i) else
        c := 0;
    end;
  end; 

  Result := Text;
end;

// -----------------------------------------------------------------------------

function GetMSInFrames(const Time: Integer; const FPS: Single): Integer;
var
  Hour : Integer;
  Min  : Integer;
  Sec  : Integer;
  MS   : Integer;
begin
  // Time format is hh:mm:ss:ff
  Hour := Trunc(Time / 3600000);
  Min  := Trunc((Time-(Hour*3600000)) / 60000);
  Sec  := Trunc((Time-(Hour*3600000)-(Min*60000)) / 1000);
  MS   := Trunc((Time-(Hour*3600000)-(Min*60000)-(Sec*1000)));
  Result := TimeToFrames(MS, FPS)
end;

// -----------------------------------------------------------------------------

function MSToHHMMSSFFTime(const Time: Integer; const FPS: Single; const FramesSeparator: Char = ':'): String;
begin
  Result := TimeToString(Time, 'hh' + FramesSeparator + 'mm' + FramesSeparator + 'ss');
  Result := Result + FramesSeparator + PadLeft(IntToStr(TimeToFrames(Time - StringToTime(Result), FPS)), '0', 2);
end;

// -----------------------------------------------------------------------------

function HHMMSSFFTimeToMS(const Time: String; const FPS: Single): Integer;
begin
  if StringToTime(Time) = -1 then Result := -1 else
  Result := StringToTime(Copy(Time, 1, 8)) + Integer(FramesToTime(StrToIntDef(Copy(Time, 10, 2), 0), FPS));
end;

// -----------------------------------------------------------------------------

//added by adenry: begin 2013.04.11
function CloseUnclosedTags(Text, OpenTag, CloseTag: {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF}): {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF};
var
  dif: Integer;
begin
  dif := StringCount(OpenTag, Text, False) - StringCount(CloseTag, Text, False);
  while dif > 0 do
  begin
    Text := Text + CloseTag;
    dif := dif - 1;
  end;
  Result := Text;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin 2013.04.11
function SetTagsForSingleTagsMode(Text: {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF}; CloseTags: Boolean = False): {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF};
var
  TagPos: Integer;
  Color : String;
begin
  //Set style:
  Text := ReplaceString(Text, '</u>', '');
  if Pos('<u>',Text) <> 0 then
  begin
    Text := ReplaceString(Text, '<u>','');
    Text := '<u>' + Text;
    if CloseTags then Text := Text + '</u>';
  end;
  Text := ReplaceString(Text, '</b>', '');
  if Pos('<b>',Text) <> 0 then
  begin
    Text := ReplaceString(Text, '<b>','');
    Text := '<b>' + Text;
    if CloseTags then Text := Text + '</b>';
  end;
  Text := ReplaceString(Text, '</i>', '');
  if Pos('<i>',Text) <> 0 then
  begin
    Text := ReplaceString(Text, '<i>','');
    Text := '<i>' + Text;
    if CloseTags then Text := Text + '</i>';
  end;

  //Set color:
  Text := ReplaceString(Text, '</c>', '');
  TagPos := Pos('<c:#', Text);
  if TagPos <> 0 then
  begin
    Color := Copy(Text, TagPos, SmartPos('>', Text, True, TagPos+4) - TagPos + 1);
    Text := Color + RemoveSWTags(Text, False, False, False, True);
    if CloseTags then Text := Text + '</c>';
  end;

  Result := Text;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin 2013.04.11
procedure SplitDelimitedString(Delimiter: Char; Str: {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF}; ListOfStrings: TStrings);
begin
  if Assigned(ListOfStrings) then
  begin
    ListOfStrings.Clear;
    //ListOfStrings.Delimiter     := Delimiter;
    //ListOfStrings.DelimitedText := Str;
    ExtractStrings([Delimiter], [' '], PChar(Str), ListOfStrings);
  end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

// Windows.pas doesn't declare TranslateCharsetInfo() correctly.
function TranslateCharsetInfo(lpSrc: PDWORD; var lpCs: TCharsetInfo; dwFlags: DWORD): BOOL; stdcall; external gdi32 name 'TranslateCharsetInfo';

function CharSetToCodePage(ciCharset: UINT): UINT;
var
  C: TCharsetInfo;
begin
  if ciCharset = DEFAULT_CHARSET then Result := GetACP else //added by adenry - IMPORTANT! - fixes a bug - Otherwise Default charset can't be used properly
  begin
    TranslateCharsetInfo(PDWORD(ciCharset), C, TCI_SRCCHARSET);
    Result := C.ciACP;
  end;
end;

// -----------------------------------------------------------------------------

function GetCharsetEncoding(charset: Byte): SubtitleString;
var
  i     : Integer;
  CPID  : UINT;
begin
  Result  := Encodings[MaxEncodings - 1].CPName;
  CPID    := CharSetToCodePage(charset);
  
  for i := 0 to MaxEncodings - 1 do
    if Encodings[i].CPID = CPID then
    begin
      Result := Encodings[i].CPName;
      Exit;
    end;
end;

// -----------------------------------------------------------------------------

//Convert an ANSI string to a Wide string
function StringToWideStringEx(const S: string; CodePage: Word): WideString;
var
  InputLength,
  OutputLength: Integer;
begin
  InputLength := Length(S);
  OutputLength := MultiByteToWideChar(CodePage, 0, PChar(S), InputLength, nil, 0);
  SetLength(Result, OutputLength);
  MultiByteToWideChar(CodePage, 0, PChar(S), InputLength, PWideChar(Result), OutputLength);
end;

// -----------------------------------------------------------------------------

//Convert an Wide string to an ANSI string
function WideStringToStringEx(const WS: WideString; CodePage: Word): AnsiString;
var
  InputLength,
  OutputLength: Integer;
begin
  InputLength := Length(WS);
  OutputLength := WideCharToMultiByte(CodePage, 0, PWideChar(WS), InputLength, nil, 0, nil, nil);
  SetLength(Result, OutputLength);
  WideCharToMultiByte(CodePage, 0, PWideChar(WS), InputLength, PAnsiChar(Result), OutputLength, nil, nil);
end;

// -----------------------------------------------------------------------------

end.
