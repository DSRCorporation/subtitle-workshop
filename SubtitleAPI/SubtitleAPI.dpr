// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: Subtitle API main project file

{*
 *  Subtitle API v1.15
 *  
 *  Description: Subtitle API is a reading and writing library for subtitle files
 *
 *  Copyright (C) 2001-2004, 2007 URUWorks
 *                2005-2007, 2011 Bedazzle
 *                2013 Andrey Spiridonov
 *}

{

 Version  Changes
 -------------------------------------------------------------------------------
 1.00     Start.
 1.01     Added Support for FAB Subtitler, MAC DVD Studio Pro and MPSub.
          Fixed A bug when reading subtitle file in Spruce DVDMaestro format.
          ?
 1.02     Added Support for Inscriber CG, OVR Script and Panimation.
          Fixed AQTitle, Captions DAT, Captions DAT Text, DVDSubtitle,
          FAB Subtitler, MacSub, MPSub, PowerPixel, Sasami Script, SBT,
          SonicDVD, SpruceDVD, SubRip, SubViewer 1.0, and SubViewer 2.0
          Access Violation!
          Added "No interaction with tags" option
 1.03     Fixed a bug when loading some SubViewer 2 files created by SubRip
 1.04     Added support for Adobe Encore DVD format (no unicode)
          Fixed Sonic Scenarist, SonicDVD, Pinnacle Impression time formats read and write.
 1.05     Fixed bug reading SAMI files
          Added support for "Ulead DVD Workshop 2.0" format
 1.06     (-) Fixed bug in reading/saving styles for *.stl files
          (+) Added support for Scantitle (*.890) text-based format
 1.07     (+) Added support for Titlevision (*.txt) ANSI text with cues
          (+) Added alternative Ulead format - "00:00:00.00" instead of "00;00;00;00"
 1.08     (+) Added support for Advanced subtitles (*.xas)
 1.08a    (+) Added support for Cavena subtitles (*.txt)
 1.08b    (+) Added support for Wincaps text timecoded subtitles (*.txt)
 1.08c    (-) Fixed loading Subrip files with bad timing (FinalTime < StartTime)
 1.09     (+) Added basic support for Timed Text subtitles (*.xml)
 1.10     (+) Added support for Youtube subtitles (*.sbv)
 1.11     (+) Save with right encoding in SubStation Alpha
 1.12     (-) Added work with closing tags </b>, </i>, </u>, </c>
          (-) Removed re-tagging
 1.13     * Added two working modes: a new MultiTagsMode and a SingleTagsMode (the old mode)
          * Modified reading and writing of SubRip, MicroDVD, SubStation Alpha, and Advanced Substation Alpha to work with the new modes!
 1.14     * Bug fixed: Ulead DVD Workshop 2.0 a incorrectly recognized as Ulead DVD Workshop 2.0
          * Added support for Adobe Encore 2+ NTSC (*.txt) format
          * Added support for Adobe Encore 2+ PAL (*.txt) format
          * Bug fixed: Advanced Subtitles format not correctly detected
          * SW Tags now removed when saving AQTitle
          * Bug fixed: Captions Inc. incorrectly detected as Adobe Encore DVD (Old)
          * SW Tags now removed when saving Cavena
          * Bug fixed: CPC-600 incorrectly detected as TMPlayer
          * Bug fixed: DVD Subtitle System incorrectly detected as Adobe Encore DVD (Old)
          * Bug fixed: MAC DVD Studio Pro incorrectly detected as Adobe Encore DVD (Old)
          * Bug fixed: OVR Script incorrectly detected
          * Bug fixed: OVR Script reading causes an error
          * Bug fixed: PowerPixel incorrectly detected as Adobe Encore DVD (Old)
          * Modified reading and writing of RealTime to work with the new modes
          * Color tags are now saved for SAMI Captioning
          * Modified reading and writing of SAMI Captioning to work with the new modes
          * SW Tags now removed when saving Scantitle
          * Bug fixed: Spruce Subtitle File incorrectly detected as Adobe Encore DVD (Old)
          * Bug fixed: Spruce Subtitle File tags incorrectly handled
          * Modified reading and writing of Spruce Subtitle File to work with the new modes
          * SW Tags now removed when saving Timed Text
          * Bug fixed: incorrect Timed Text timing reading
          * Bug fixed: incorrect Timed Text new lines reading 
          * Timed Text reading and writing updated
          * Titlevision removed - both Read and Save functions are empty...???
          * Added tags convertion for ViPlay format saving
          * SW Tags now removed when saving YouTube sbv
          * Bug fixed: reading YouTube format is incorrect when the text contains commas
          * Bug fixed: when reading SubRip, lines containing only numbers are omitted
 1.15     * Advanced Subtitles (*.xas) form removed, XASAttributes used instead
          * Removed unnecessary function that sets SSA Encoding parameter
          * Collisions, PlayResX, PlayResY, and Timer attributes added to SSAAttributes; Title and Script attributes added to ASSAttributes
 2.00     (+) Support of Unicode in Subrip
}

library SubtitleAPI;

// -----------------------------------------------------------------------------

{ $DEFINE UTF8}

{$IFDEF VER150}
  {$WARN SYMBOL_DEPRECATED OFF}
  {$WARN UNSAFE_CODE OFF}
  {$WARN UNSAFE_TYPE OFF}
  {$WARN UNSAFE_CAST OFF}
{$ENDIF}

uses
  SysUtils,
  Windows,
  USubtitleFile in 'Source\USubtitleFile.pas',
  UCheckFormat in 'Source\UCheckFormat.pas',
  USubtitlesRead in 'Source\USubtitlesRead.pas',
  USubtitlesSave in 'Source\USubtitlesSave.pas',
  USubtitlesFunctions in 'Source\USubtitlesFunctions.pas';

var
  Subtitles: TSubtitles = NIL;

// -----------------------------------------------------------------------------

{$R *.res}

// -------------------------------------------------------------------------- //
//                              Module specific                               //
// -------------------------------------------------------------------------- //

function GetModuleVersion: Integer; stdcall;
begin
//  Result := $105; // 1.05   // by URUWorks 2004
//  Result := $106; // 1.06   // by Bedazzle 2005.11.16
//  Result := $107; // 1.07   // by Bedazzle 2006.02.18
//  Result := $108; // 1.08   // by Bedazzle 2007.01.26
//  Result := $108; // 1.08a  // by Bedazzle 2007.05.13
//  Result := $108; // 1.08b  // by Bedazzle 2007.07.04
//  Result := $108; // 1.08c  // by Bedazzle 2007.10.02
//  Result := $109; // 1.09   // by URUWorks 2007.12.22
//  Result := $110; // 1.10   // by Bedazzle 2011.09.14
//  Result := $111; // 1.11   // by Bedazzle 2011.09.20
//  Result := $112; // 1.12   // by Bedazzle 2011.11.01
//  Result := $113; // 1.13   // by adenry 2013.04.11
//  Result := $114; // 1.14   // by adenry 2013.04.11 - 2013.04.13
  Result := $115; // 1.15   // by adenry 2013.08.09
//  Result := $200;  // 2.00  // by Bedazzle 2011.09.19
end;

// -----------------------------------------------------------------------------

procedure GetModuleDescription(Text: PChar; var BufferLen: Integer); stdcall;
const
  Description = 'Subtitle API';
begin
  if BufferLen > 0 then
    StrLCopy(Text, PChar(Description), BufferLen)
  else
    BufferLen := Length(Description);
end;

// -----------------------------------------------------------------------------

function GetSupportedFormatsCount: Integer; stdcall;
begin
  Result := High(TSubtitleFormatsName);
end;

// -------------------------------------------------------------------------- //
//                              Format specific                               //
// -------------------------------------------------------------------------- //

function GetFormatInformation(Index: Integer; Description: PChar; Extensions: PChar; var BufferLen1, BufferLen2: Integer): LongBool; stdcall;
var
  Desc, Exts: String;
begin
  Result := True;
  Desc   := '';
  Exts   := '';

  case TSubtitleformats(Index) Of
    sfAdobeEncoreDVD          : begin Desc := TSubtitleFormatsName[Index]; Exts := '*.txt'; end;
    sfAdobeEncoreDVDNTSC      : begin Desc := TSubtitleFormatsName[Index]; Exts := '*.txt'; end; //added by adenry 2013.04.11
    sfAdobeEncoreDVDPAL       : begin Desc := TSubtitleFormatsName[Index]; Exts := '*.txt'; end; //added by adenry 2013.04.11
    sfAdvancedSubStationAlpha : begin Desc := TSubtitleFormatsName[Index]; Exts := '*.ass'; end;
    sfAdvancedSubtitlesXAS    : begin Desc := TSubtitleFormatsName[Index]; Exts := '*.xas'; end;
    sfAQTitle                 : begin Desc := TSubtitleFormatsName[Index]; Exts := '*.aqt'; end;
    sfCaptions32              : begin Desc := TSubtitleFormatsName[Index]; Exts := '*.txt'; end;
    sfCaptionsDat             : begin Desc := TSubtitleFormatsName[Index]; Exts := '*.dat'; end;
    sfCaptionsDatText         : begin Desc := TSubtitleFormatsName[Index]; Exts := '*.dat'; end;
    sfCaptionsInc             : begin Desc := TSubtitleFormatsName[Index]; Exts := '*.txt'; end;
    sfCavena                  : begin Desc := TSubtitleFormatsName[Index]; Exts := '*.txt'; end;    // by Bedazzle 2007.05.13
    sfCheetah                 : begin Desc := TSubtitleFormatsName[Index]; Exts := '*.asc'; end;
    sfCPC600                  : begin Desc := TSubtitleFormatsName[Index]; Exts := '*.txt'; end;
    sfDKS                     : begin Desc := TSubtitleFormatsName[Index]; Exts := '*.dks'; end;
    sfDVDJunior               : begin Desc := TSubtitleFormatsName[Index]; Exts := '*.txt'; end;
    sfDVDSubtitleSystem       : begin Desc := TSubtitleFormatsName[Index]; Exts := '*.txt'; end;
    sfDVDSubtitle             : begin Desc := TSubtitleFormatsName[Index]; Exts := '*.sub'; end;
    sfFABSubtitler            : begin Desc := TSubtitleFormatsName[Index]; Exts := '*.txt'; end;
    sfIAuthor                 : begin Desc := TSubtitleFormatsName[Index]; Exts := '*.txt'; end;
    sfInscriberCG             : begin Desc := TSubtitleFormatsName[Index]; Exts := '*.txt'; end;
    sfJACOSub                 : begin Desc := TSubtitleFormatsName[Index]; Exts := '*.js;*.jss'; end;
    sfKaraokeLyricsLRC        : begin Desc := TSubtitleFormatsName[Index]; Exts := '*.lrc'; end;
    sfKaraokeLyricsVKT        : begin Desc := TSubtitleFormatsName[Index]; Exts := '*.vkt'; end;
    sfMACDVDStudioPro         : begin Desc := TSubtitleFormatsName[Index]; Exts := '*.txt'; end;
    sfMacSUB                  : begin Desc := TSubtitleFormatsName[Index]; Exts := '*.scr'; end;
    sfMicroDVD                : begin Desc := TSubtitleFormatsName[Index]; Exts := '*.sub;*.txt'; end;
    sfMPlayer                 : begin Desc := TSubtitleFormatsName[Index]; Exts := '*.mpl'; end;
    sfMPlayer2                : begin Desc := TSubtitleFormatsName[Index]; Exts := '*.mpl'; end;
    sfMPSub                   : begin Desc := TSubtitleFormatsName[Index]; Exts := '*.sub'; end;
    sfOVRScript               : begin Desc := TSubtitleFormatsName[Index]; Exts := '*.ovr'; end;
    sfPanimator               : begin Desc := TSubtitleFormatsName[Index]; Exts := '*.pan'; end;
    sfPhilipsSVCD             : begin Desc := TSubtitleFormatsName[Index]; Exts := '*.sub'; end;
    sfPhoenixJS               : begin Desc := TSubtitleFormatsName[Index]; Exts := '*.pjs'; end;
    sfPinnacleImpression      : begin Desc := TSubtitleFormatsName[Index]; Exts := '*.txt'; end;
    sfPowerDivX               : begin Desc := TSubtitleFormatsName[Index]; Exts := '*.psb;*.txt'; end;
    sfPowerPixel              : begin Desc := TSubtitleFormatsName[Index]; Exts := '*.txt'; end;
    sfQuickTimeText           : begin Desc := TSubtitleFormatsName[Index]; Exts := '*.txt'; end;
    sfRealTime                : begin Desc := TSubtitleFormatsName[Index]; Exts := '*.rt'; end;
    sfSAMI                    : begin Desc := TSubtitleFormatsName[Index]; Exts := '*.smi;*.sami'; end;
    sfSasamiScript            : begin Desc := TSubtitleFormatsName[Index]; Exts := '*.s2k'; end;
    sfSBT                     : begin Desc := TSubtitleFormatsName[Index]; Exts := '*.sbt'; end;
    sfScantitle               : begin Desc := TSubtitleFormatsName[Index]; Exts := '*.890'; end;    // by Bedazzle 2005.11.18
    sfSofni                   : begin Desc := TSubtitleFormatsName[Index]; Exts := '*.sub'; end;
    sfSoftitlerRTF            : begin Desc := TSubtitleFormatsName[Index]; Exts := '*.rtf'; end;
    sfSonicDVD                : begin Desc := TSubtitleFormatsName[Index]; Exts := '*.sub'; end;
    sfSonicScenarist          : begin Desc := TSubtitleFormatsName[Index]; Exts := '*.sst'; end;
    sfSpruceDVDMaestro        : begin Desc := TSubtitleFormatsName[Index]; Exts := '*.son'; end;
    sfSpruceSubtitleFile      : begin Desc := TSubtitleFormatsName[Index]; Exts := '*.stl'; end;
    sfSSTPlayer               : begin Desc := TSubtitleFormatsName[Index]; Exts := '*.sst'; end;
    sfSSTScript               : begin Desc := TSubtitleFormatsName[Index]; Exts := '*.ssts'; end;
    sfSubCreator              : begin Desc := TSubtitleFormatsName[Index]; Exts := '*.txt'; end;
    sfSubRip                  : begin Desc := TSubtitleFormatsName[Index]; Exts := '*.srt'; end;
//    sfSubRipW                 : begin Desc := TSubtitleFormatsName[Index]; Exts := '*.srt'; end;    // by Bedazzle 2011.09.19
    sfSubSonic                : begin Desc := TSubtitleFormatsName[Index]; Exts := '*.sub'; end;
    sfSubStationAlpha         : begin Desc := TSubtitleFormatsName[Index]; Exts := '*.ssa'; end;
    sfSubViewer1              : begin Desc := TSubtitleFormatsName[Index]; Exts := '*.sub'; end;
    sfSubViewer2              : begin Desc := TSubtitleFormatsName[Index]; Exts := '*.sub'; end;
    sfTimedText               : begin Desc := TSubtitleFormatsName[Index]; Exts := '*.xml'; end;    
    //sfTitlevisionTXT          : begin Desc := TSubtitleFormatsName[Index]; Exts := '*.txt'; end;
    sfTMPlayer                : begin Desc := TSubtitleFormatsName[Index]; Exts := '*.txt;*.sub'; end;
    sfTurboTitler             : begin Desc := TSubtitleFormatsName[Index]; Exts := '*.tts'; end;
    sfUleadDVDWorkshop2       : begin Desc := TSubtitleFormatsName[Index]; Exts := '*.txt'; end;
    sfUleadDVDWorkshop2a      : begin Desc := TSubtitleFormatsName[Index]; Exts := '*.txt'; end;
    sfViPlay                  : begin Desc := TSubtitleFormatsName[Index]; Exts := '*.vsf'; end;
    sfWincapsTextTimecoded    : begin Desc := TSubtitleFormatsName[Index]; Exts := '*.txt'; end;    // by Bedazzle 2007.07.04
    sfYoutube                 : begin Desc := TSubtitleFormatsName[Index]; Exts := '*.sbv'; end;    // by Bedazzle 2011.09.14
    sfZeroG                   : begin Desc := TSubtitleFormatsName[Index]; Exts := '*.zeg'; end;
    else
    begin
      Description := '';
      Extensions  := '';
      Result      := False;
    end;
  end;

  if (Result = True) and (Desc <> '') and (Exts <> '') then
  begin
    if BufferLen1 > 0 then
      StrLCopy(Description, PChar(Desc), BufferLen1)
    else
      BufferLen1 := Length(Desc);

    if BufferLen2 > 0 then
      StrLCopy(Extensions, PChar(Exts), BufferLen2)
    else
      BufferLen2 := Length(Exts);
  end;
end;

// -----------------------------------------------------------------------------

procedure GetFormatName(Index: Integer; Name: PChar; var BufferLen: Integer); stdcall;
var
  FName : String;
begin
  FName := IndexToName(Index);

  if BufferLen > 0 then
    StrLCopy(Name, PChar(FName), BufferLen)
  else
    BufferLen := Length(FName);
end;

// -----------------------------------------------------------------------------

function GetFormatIndex(Name: PChar): Integer; stdcall;
begin
  Result := NameToIndex(Name);
end;

// -----------------------------------------------------------------------------

function IsFrameBased(FormatIndex: Integer): LongBool; stdcall;
begin
  Result := False;

  case TSubtitleFormats(FormatIndex) of
    sfAdobeEncoreDVD,
    sfAdobeEncoreDVDNTSC, //added by adenry 2013.04.11
    sfAdobeEncoreDVDPAL, //added by adenry 2013.04.11
    sfAQTitle,
    sfFABSubtitler,
    sfMACDVDStudioPro,
    sfMacSUB,
    sfMicroDVD,
    sfMPlayer,
    sfPhoenixJS,
    sfSonicDVD,
    sfSonicScenarist,
    sfSpruceSubtitleFile: Result := True;
  end;
end;

// -------------------------------------------------------------------------- //
//                               File handling                                //
// -------------------------------------------------------------------------- //

function LoadSubtitleFile(FileName: PChar; FPS: Single; FormatIndex: Integer; Append, ReCalcTimeValues: LongBool): LongBool; stdcall;
begin
  if Append = False then
    Result := LongBool(LoadSubtitle(Subtitles, FileName, FPS, TSubtitleFormats(FormatIndex)))
  else
    Result := LongBool(LoadSubtitle(Subtitles, FileName, FPS, TSubtitleFormats(FormatIndex), False, ReCalcTimeValues));
end;

// -----------------------------------------------------------------------------

procedure CreateNewSubtitle; stdcall;
begin
  CloseSubtitle(Subtitles);
  Subtitles := TSubtitles.Create;
end;

// -----------------------------------------------------------------------------

function GetFileFormat(FileName: PChar): Integer; stdcall;
var
  tmpSubs: TSubtitleFile;
begin
  tmpSubs := TSubtitleFile.Create(FileName);
  try
    Result := Integer(CheckSubtitleFormat(tmpSubs));
  finally
    tmpSubs.Free;
  end;
end;

// -----------------------------------------------------------------------------

function SaveSubtitleFile(FileName: PChar; FormatIndex: Integer; FPS: Single; FromIndex, ToIndex: Integer): LongBool; stdcall;
begin
  Result := LongBool(SubtitlesToFile(Subtitles, FileName, FPS, TSubtitleFormats(FormatIndex), FromIndex, ToIndex));
end;

// -----------------------------------------------------------------------------

procedure CloseSubtitleFile; stdcall;
begin
  CloseSubtitle(Subtitles);
end;

// -------------------------------------------------------------------------- //
//                              Subtitle editing                              //
// -------------------------------------------------------------------------- //

function AddSubtitle(InitialTime, FinalTime: Integer; Text: {$IFDEF UTF8}PWideChar{$ELSE}PChar{$ENDIF}): Integer; stdcall;
begin
  Result := -1;

  if Assigned(Subtitles) then
    Result := Subtitles.Add(InitialTime, FinalTime, {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF}(Text));
end;

// -----------------------------------------------------------------------------

function InsertSubtitle(Index, InitialTime, FinalTime: Integer; Text: {$IFDEF UTF8}PWideChar{$ELSE}PChar{$ENDIF}): LongBool; stdcall;
begin
  Result := False;

  if Assigned(Subtitles) and (Subtitles.Count > 0) and ((Index >= 0) and (Index < Subtitles.Count)) then
  begin
    Subtitles.Insert(Index, InitialTime, FinalTime, {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF}(Text));
    Result := True;
  end;
end;

// -----------------------------------------------------------------------------

function MoveSubtitle(Index, NewIndex: Integer): LongBool; stdcall;
begin
  Result := False;

  if Assigned(Subtitles) and (Subtitles.Count > 0) and ((Index >= 0) and (Index < Subtitles.Count)) then
  begin
    Subtitles.Move(Index, NewIndex);
    Result := True;
  end;
end;

// -----------------------------------------------------------------------------

function DeleteSubtitle(Index: Integer): LongBool; stdcall;
begin
  Result := False;

  if Assigned(Subtitles) and (Subtitles.Count > 0) and ((Index >= 0) and (Index < Subtitles.Count)) then
  begin
    Subtitles.Delete(Index);
    Result := True;
  end;
end;

// -----------------------------------------------------------------------------

procedure ClearSubtitles; stdcall;
begin
  if Assigned(Subtitles) then
    Subtitles.Clear;
end;

// -----------------------------------------------------------------------------

function SetSubtitle(Index: Integer; InitialTime, FinalTime: Integer; Text: {$IFDEF UTF8}PWideChar{$ELSE}PChar{$ENDIF}): LongBool; stdcall;
begin
  Result := False;

  if Assigned(Subtitles) and (Subtitles.Count > 0) and ((Index >= 0) and (Index < Subtitles.Count)) then
  begin
    Subtitles.InitialTime[Index] := InitialTime;
    Subtitles.FinalTime[Index]   := FinalTime;
    Subtitles.Text[Index]        := Text;
    Result                       := True;
  end;
end;

// -----------------------------------------------------------------------------

function ReverseSubtitleText(FromIndex, ToIndex: Integer; KeepLinesOrder: LongBool): LongBool; stdcall;
var
  i, IndexFrom, IndexTo: Integer;
begin
  Result := False;

  if Assigned(Subtitles) and (Subtitles.Count > 0) then
  begin
    if ((FromIndex >= 0) and (FromIndex < Subtitles.Count)) then
      IndexFrom := FromIndex
    else
      IndexFrom := 0;

    if ((ToIndex >= 0) and (ToIndex < Subtitles.Count)) then
      IndexTo := ToIndex
    else
      IndexTo := Subtitles.Count-1;

    if IndexFrom > IndexTo then Exit;

    for i := IndexFrom To IndexTo Do
      Subtitles.Text[i] := ReverseText(Subtitles[i].Text, Boolean(KeepLinesOrder));

    Result := True;
  end;
end;

// -------------------------------------------------------------------------- //
//                             Subtitle specific                              //
// -------------------------------------------------------------------------- //

procedure GetCurrentFormat(Name: PChar; var Index: Integer; var BufferLen: Integer); stdcall;
begin
  if Assigned(Subtitles) and (Subtitles.Format > 0) then
  begin
    if BufferLen > 0 then
      StrLCopy(Name, PChar(TSubtitleFormatsName[Subtitles.Format]), BufferLen)
    else
      BufferLen := Length(TSubtitleFormatsName[Subtitles.Format]);

    Index := Subtitles.Format;
  end;
end;

// -----------------------------------------------------------------------------

function GetSubtitleCount: Integer; stdcall;
begin
  Result := -1;

  if Assigned(Subtitles) then
    Result := Subtitles.Count;
end;

// -----------------------------------------------------------------------------

procedure GetSubtitleText(Time: Integer; Text: {$IFDEF UTF8}PWideChar{$ELSE}PChar{$ENDIF}; var BufferLen: Integer); stdcall;
var
  FText : {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF};
begin
  FText := DisplaySubtitle(Subtitles, Time);

  if BufferLen > 0 then
{$IFDEF UTF8}
//    Text := Copy(FText, 1, BufferLen)
    Text := StringToWideChar(FText, Text, BufferLen)
{$ELSE}
    StrLCopy(Text, PChar(FText), BufferLen)
{$ENDIF}
  else
    BufferLen := Length(FText);
end;

// -----------------------------------------------------------------------------

function GetSubtitle(Index: Integer; var InitialTime, FinalTime: Integer; Text: {$IFDEF UTF8}PWideChar{$ELSE}PChar{$ENDIF}; var BufferLen: Integer): LongBool; stdcall;
begin
  Result := False;

  if Assigned(Subtitles) and (Subtitles.Count > 0) and ((Index >= 0) and (Index < Subtitles.Count)) then
  begin
    if BufferLen > 0 then
{$IFDEF UTF8}
//    Text := Copy(FText, 1, BufferLen)
      Text := StringToWideChar(Subtitles[Index].Text, Text, BufferLen)
{$ELSE}
      StrLCopy(Text, PChar(Subtitles[Index].Text), BufferLen)
{$ENDIF}
    else
      BufferLen := Length(Subtitles[Index].Text);

    InitialTime := Subtitles[Index].InitialTime;
    FinalTime   := Subtitles[Index].FinalTime;
    Result      := True;
  end;
end;

// -------------------------------------------------------------------------- //
//                                   Delay                                    //
// -------------------------------------------------------------------------- //

procedure SetPlaybackDelay(Time: Integer); stdcall;
begin
  PlaybackDelay := Time;
end;

// -----------------------------------------------------------------------------

function GetPlaybackDelay: Integer; stdcall;
begin
  Result := PlaybackDelay;
end;

// -----------------------------------------------------------------------------

function SetAbsoluteDelay(Time, FromIndex, ToIndex: Integer): LongBool; stdcall;
var
  i, IndexFrom, IndexTo: Integer;
begin
  Result := False;

  if Assigned(Subtitles) and (Subtitles.Count > 0) then
  begin
    if ((FromIndex >= 0) and (FromIndex < Subtitles.Count)) then
      IndexFrom := FromIndex
    else
      IndexFrom := 0;

    if ((ToIndex >= 0) and (ToIndex < Subtitles.Count)) then
      IndexTo := ToIndex
    else
      IndexTo := Subtitles.Count-1;

    if IndexFrom > IndexTo then Exit;

    for i := IndexFrom To IndexTo Do
    begin
      Subtitles.InitialTime[i] := Subtitles[i].InitialTime + Time;
      Subtitles.FinalTime[i]   := Subtitles[i].FinalTime + Time;
    end;

    Result := True;
  end;
end;

// -------------------------------------------------------------------------- //
//                             General variables                              //
// -------------------------------------------------------------------------- //
{$IFNDEF VIPLAY}

function GetNoInteractionWithTags: LongBool; stdcall;
begin
  Result := LongBool(NoInteractionWithTags);
end;

// -----------------------------------------------------------------------------

procedure SetNoInteractionWithTags(Value: LongBool); stdcall;
begin
  // test magick
  NoInteractionWithTags := Boolean(Value);
end;

// -----------------------------------------------------------------------------
//added by adenry: 2013.04.11
function GetSingleTagsMode: LongBool; stdcall;
begin
  Result := LongBool(SingleTagsMode);
end;

// -----------------------------------------------------------------------------
//added by adenry: 2013.04.11
procedure SetSingleTagsMode(Value: LongBool); stdcall;
begin
  SingleTagsMode := Boolean(Value);
end;

// -----------------------------------------------------------------------------
//added by adenry: 2013.04.11
function GetMultiTagsMode: LongBool; stdcall;
begin
  Result := LongBool(MultiTagsMode);
end;

// -----------------------------------------------------------------------------
//added by adenry: 2013.04.11
procedure SetMultiTagsMode(Value: LongBool); stdcall;
begin
  MultiTagsMode := Boolean(Value);
end;

{$ENDIF}
// -----------------------------------------------------------------------------

function GetSubtitleWorkWithTags: LongBool; stdcall;
begin
  Result := LongBool(WorkWithTags);
end;

// -----------------------------------------------------------------------------

procedure SetSubtitleWorkWithTags(Value: LongBool); stdcall;
begin
  WorkWithTags := Boolean(Value);
end;

// -------------------------------------------------------------------------- //
//                              Output settings                               //
// -------------------------------------------------------------------------- //

procedure SetOutputSettingsAdvancedSubStationAlpha(Assigned: LongBool; Title, Script, Collisions: PChar;
                                                   PlayResX, PlayResY: Integer; Timer, FontName: PChar;
                                                   FontSize: Integer; Bold, Italic: LongBool; BorderStyle,
                                                   PrimaryColor, SecondaryColor, OutlineColour, ShadowColor,
                                                   Outline, Shadow, Alignment, MarginL, MarginR, MarginV,
                                                   Encoding: Integer; Underline, StrikeOut: LongBool;
                                                   ScaleX, ScaleY, Spacing: Integer; Angle: PChar); stdcall;
begin
  ASSAttributes.Assigned       := Boolean(Assigned);
  ASSAttributes.Title          := Title;      //added by adenry 11.08.2013
  ASSAttributes.Script         := Script;     //added by adenry 11.08.2013
  ASSAttributes.Collisions     := Collisions;
  ASSAttributes.PlayResX       := PlayResX;
  ASSAttributes.PlayResY       := PlayResY;
  ASSAttributes.Timer          := Timer;
  ASSAttributes.FontName       := FontName;
  ASSAttributes.FontSize       := FontSize;
  ASSAttributes.Bold           := Boolean(Bold);
  ASSAttributes.Italic         := Boolean(Italic);
  ASSAttributes.BorderStyle    := BorderStyle;
  ASSAttributes.PrimaryColor   := PrimaryColor;
  ASSAttributes.SecondaryColor := SecondaryColor;
  ASSAttributes.OutlineColour  := OutlineColour;
  ASSAttributes.ShadowColor    := ShadowColor;
  ASSAttributes.Outline        := Outline;
  ASSAttributes.Shadow         := Shadow;
  ASSAttributes.Alignment      := Alignment;
  // Margins
  ASSAttributes.MarginL        := MarginL;
  ASSAttributes.MarginR        := MarginR;
  ASSAttributes.MarginV        := MarginV;
  ASSAttributes.Encoding       := Encoding;
  //ASS only
  ASSAttributes.Underline      := Boolean(Underline);
  ASSAttributes.StrikeOut      := Boolean(Underline);
  ASSAttributes.ScaleX         := ScaleX;
  ASSAttributes.ScaleY         := ScaleY;
  ASSAttributes.Spacing        := Spacing;
  ASSAttributes.Angle          := Angle;
end;

// -----------------------------------------------------------------------------

procedure SetOutputSettingsDVDSubtitle(Assigned: LongBool; DiskId, DVDTitle,
                                       Language, Author, Web, Info, License : PChar); stdcall;
begin
  DVDSubtitleAttributes.Assigned := Boolean(Assigned);
  DVDSubtitleAttributes.DiskId   := DiskId;
  DVDSubtitleAttributes.DVDTitle := DVDTitle;
  DVDSubtitleAttributes.Language := Language;
  DVDSubtitleAttributes.Author   := Author;
  DVDSubtitleAttributes.Web      := Web;
  DVDSubtitleAttributes.Info     := Info;
  DVDSubtitleAttributes.License  := License;
end;

// -----------------------------------------------------------------------------

procedure SetOutputSettingsSAMI(Assigned: LongBool; FontName: PChar; FontSize: Integer;
                                Bold, Italic, Underline: LongBool; SubColor,
                                BackgroundColor: Integer; Align: PChar);  stdcall;
  function ColorToHTML(Color: Integer): String;
  begin
    Result := Format('#%.2x%.2x%.2x', [GetRValue(Color), GetGValue(Color), GetBValue(Color)]);
  end;
begin
  SAMIAttributes.Assigned        := Boolean(Assigned);
  SAMIAttributes.FontName        := FontName;
  SAMIAttributes.FontSize        := FontSize;
  SAMIAttributes.Bold            := Boolean(Bold);
  SAMIAttributes.Italic          := Boolean(Italic);
  SAMIAttributes.Underline       := Boolean(Underline);
  SAMIAttributes.SubColor        := ColorToHTML(SubColor);
  SAMIAttributes.BackgroundColor := ColorToHTML(BackgroundColor);
  SAMIAttributes.Align           := Align;
end;

// -----------------------------------------------------------------------------

procedure SetOutputSettingsSonicScenarist(Assigned, PAL, DropFrame: LongBool;
                                          Color0, Color1, Color2, Color3, Contrast0,
                                          Contrast1, Contrast2, Contrast3: Integer); stdcall;
begin
  SonicScenaristAttributes.Assigned  := Boolean(Assigned);
  SonicScenaristAttributes.PAL       := Boolean(PAL);
  SonicScenaristAttributes.DropFrame := Boolean(DropFrame);
  SonicScenaristAttributes.Color0    := Color0;
  SonicScenaristAttributes.Color1    := Color1;
  SonicScenaristAttributes.Color2    := Color2;
  SonicScenaristAttributes.Color3    := Color3;
  SonicScenaristAttributes.Contrast0 := Contrast0;
  SonicScenaristAttributes.Contrast1 := Contrast1;
  SonicScenaristAttributes.Contrast2 := Contrast2;
  SonicScenaristAttributes.Contrast3 := Contrast3;
end;

// -----------------------------------------------------------------------------

procedure SetOutputSettingsSubViewer1(Assigned: LongBool; Title, Author, Source,
                                      vProgram, Path: PChar; Delay: Integer); stdcall;
begin
  SubViewer1Attributes.Assigned := Boolean(Assigned);
  SubViewer1Attributes.Title    := Title;
  SubViewer1Attributes.Author   := Author;
  SubViewer1Attributes.Source   := Source;
  SubViewer1Attributes.Programa := vProgram;
  SubViewer1Attributes.Path     := Path;
  SubViewer1Attributes.Delay    := Delay
end;

// -----------------------------------------------------------------------------

procedure SetOutputSettingsSubViewer2(Assigned: LongBool; Title, Author, Source,
                                      vProgram, Path: PChar; Delay, CDTrack: Integer;
                                      Comment, FontName: PChar; FontSize, FontColor: Integer;
                                      Bold, Italic, Underline, StrikeOut: LongBool); stdcall;
begin
  SubViewer2Attributes.Assigned  := Boolean(Assigned);
  SubViewer2Attributes.Title     := Title;
  SubViewer2Attributes.Author    := Author;
  SubViewer2Attributes.Source    := Source;
  SubViewer2Attributes.Programa  := vProgram;
  SubViewer2Attributes.Path      := Path;
  SubViewer2Attributes.Delay     := Delay;
  SubViewer2Attributes.CDTrack   := CDTrack;
  SubViewer2Attributes.Comment   := Comment;
  SubViewer2Attributes.FontName  := FontName;
  SubViewer2Attributes.FontSize  := FontSize;
  SubViewer2Attributes.FontColor := FontColor;
  SubViewer2Attributes.Bold      := Boolean(Bold);
  SubViewer2Attributes.Italic    := Boolean(Italic);
  SubViewer2Attributes.Underline := Boolean(Underline);
  SubViewer2Attributes.StrikeOut := Boolean(StrikeOut);
end;

// -----------------------------------------------------------------------------

procedure SetOutputSettingsSubStationAlpha(Assigned: LongBool; Title, Script, Collisions: PChar;
                                           PlayResX, PlayResY: Integer; Timer, FontName: PChar;
                                           FontSize: Integer; Bold, Italic: LongBool; BorderStyle,
                                           PrimaryColor, SecondaryColor, OutlineColour, ShadowColor,
                                           Outline, Shadow, Alignment, MarginL, MarginR, MarginV,
                                           Encoding: Integer); stdcall;
begin
  SSAAttributes.Assigned       := Boolean(Assigned);
  SSAAttributes.Title          := Title;
  SSAAttributes.Script         := Script;
  SSAAttributes.Collisions     := Collisions; //added by adenry 11.08.2013
  SSAAttributes.PlayResX       := PlayResX;   //added by adenry 11.08.2013
  SSAAttributes.PlayResY       := PlayResY;   //added by adenry 11.08.2013
  SSAAttributes.Timer          := Timer;      //added by adenry 11.08.2013
  SSAAttributes.FontName       := FontName;
  SSAAttributes.FontSize       := FontSize;
  SSAAttributes.Bold           := Boolean(Bold);
  SSAAttributes.Italic         := Boolean(Italic);
  SSAAttributes.BorderStyle    := BorderStyle;
  SSAAttributes.PrimaryColor   := PrimaryColor;
  SSAAttributes.SecondaryColor := SecondaryColor;
  SSAAttributes.OutlineColour  := OutlineColour;
  SSAAttributes.ShadowColor    := ShadowColor;
  SSAAttributes.Outline        := Outline;
  SSAAttributes.Shadow         := Shadow;
  SSAAttributes.Alignment      := Alignment;
  SSAAttributes.MarginL        := MarginL;
  SSAAttributes.MarginR        := MarginR;
  SSAAttributes.MarginV        := MarginV;
  SSAAttributes.Encoding       := Encoding;
end;

// -----------------------------------------------------------------------------

procedure SetOutputSettingsTMPlayer(Assigned: LongBool; TypeOfFormat: Integer); stdcall;
begin
  TMPlayerAttributes.Assigned     := Boolean(Assigned);
  TMPlayerAttributes.TypeOfFormat := TypeOfFormat;
end;

// -----------------------------------------------------------------------------

//added by adenry: begin 2013.08.09
//Note: the text parameters MUST be PChar, CAN'T be String!
procedure SetOutputSettingsXAS(Assigned: LongBool; FontName: PChar; FontSize: Integer; FontSizeInPercent: LongBool; TextColor: Integer; Shadow: LongBool; ShadowColor: Integer; Transparency: Byte;
                               X, Y, Width, Height: Integer; XInPercent, YInPercent, WidthInPercent, HeightInPercent: LongBool; Alignment: Byte;
                               Encoding, Language: PChar; JoinShortLines, WrapLines: LongBool; WrapLinesValue: Byte); stdcall;
begin
  XASAttributes.Assigned          := Boolean(Assigned);
  //Font
  XASAttributes.FontName          := FontName;
  XASAttributes.FontSize          := FontSize;
  XASAttributes.FontSizeInPercent := Boolean(FontSizeInPercent);
  XASAttributes.TextColor         := TextColor;
  XASAttributes.Shadow            := Boolean(Shadow);
  XASAttributes.ShadowColor       := ShadowColor;
  XASAttributes.Transparency      := Transparency;
  //Position
  XASAttributes.X                 := X;
  XASAttributes.Y                 := Y;
  XASAttributes.Width             := Width;
  XASAttributes.Height            := Height;
  XASAttributes.XInPercent        := Boolean(XInPercent);
  XASAttributes.YInPercent        := Boolean(YInPercent);
  XASAttributes.WidthInPercent    := Boolean(WidthInPercent);
  XASAttributes.HeightInPercent   := Boolean(HeightInPercent);
  XASAttributes.Alignment         := Alignment;
  //Language
  XASAttributes.Encoding          := Encoding;
  XASAttributes.Language          := Language;
  //Join
  XASAttributes.JoinShortLines    := Boolean(JoinShortLines);
  XASAttributes.WrapLines         := Boolean(WrapLines);
  XASAttributes.WrapLinesValue    := WrapLinesValue;
end;
//added by adenry: end 2013.08.09

// -----------------------------------------------------------------------------

exports
  // --------------------- //
  //    Module specific    //
  // --------------------- //
  GetModuleVersion,
  GetModuleDescription,
  GetSupportedFormatsCount,
  // --------------------- //
  //    Format specific    //
  // --------------------- //
  GetFormatInformation,
  GetFormatName,
  GetFormatIndex,
  IsFrameBased,
  // --------------------- //
  //     File handling     //
  // --------------------- //
  LoadSubtitleFile,
  CreateNewSubtitle,
  GetFileFormat,
  SaveSubtitleFile,
  CloseSubtitleFile,
  // --------------------- //
  //   Subtitle editing    //
  // --------------------- //
  AddSubtitle,
  InsertSubtitle,
  MoveSubtitle,
  DeleteSubtitle,
  ClearSubtitles,
  SetSubtitle,
  ReverseSubtitleText,
  // --------------------- //
  //   Subtitle specific   //
  // --------------------- //
  GetCurrentFormat,
  GetSubtitleCount,
  GetSubtitleText,
  GetSubtitle,
  // --------------------- //
  //         Delay         //
  // --------------------- //
  SetPlaybackDelay,
  GetPlaybackDelay,
  SetAbsoluteDelay,
  // --------------------- //
  //   General variables   //
  // --------------------- //
  {$IFNDEF VIPLAY}
  GetNoInteractionWithTags,
  SetNoInteractionWithTags,
  GetSingleTagsMode, //added by adenry 2013.04.11
  SetSingleTagsMode, //added by adenry 2013.04.11
  GetMultiTagsMode, //added by adenry 2013.04.11
  SetMultiTagsMode, //added by adenry 2013.04.11
  {$ENDIF}
  GetSubtitleWorkWithTags,
  SetSubtitleWorkWithTags,
  // --------------------- //
  //    Output settings    //
  // --------------------- //
  SetOutputSettingsAdvancedSubStationAlpha,
  SetOutputSettingsDVDSubtitle,
  SetOutputSettingsSAMI,
  SetOutputSettingsSonicScenarist,
  SetOutputSettingsSubViewer1,
  SetOutputSettingsSubViewer2,
  SetOutputSettingsSubStationAlpha,
  SetOutputSettingsTMPlayer,
  SetOutputSettingsXAS; //added by adenry 2013.08.09

// -----------------------------------------------------------------------------

begin
end.
