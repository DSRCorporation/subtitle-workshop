// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: Subtitle file reading functionality

// -----------------------------------------------------------------------------
// FORMAT                                  EXTENSION                    BASE
// -----------------------------------------------------------------------------
// Adobe Encore DVD (Old)                  *.txt                        Time & Frames
// Adobe Encore DVD NSC                    *.txt                        Time & Frames //added by adenry 2013.04.11
// Adobe Encore DVD PAL                    *.txt                        Time & Frames //added by adenry 2013.04.11
// Advanced SubStation Alpha               *.ass                        Time
// Advanced Subtitles                      *.xas                        Time
// AQTitle                                 *.aqt                        Frames
// Captions 32                             *.txt                        Time
// Captions DAT                            *.dat                        Time
// Captions DAT Text                       *.dat                        Time
// Captions Inc                            *.txt                        Time
// Cavena                                  *.txt                        Time
// Cheetah                                 *.asc                        Time
// CPC-600                                 *.txt                        Time
// DKS Subtitle Format                     *.dks                        Time
// DVD Junior                              *.txt                        Time
// DVD Subtitle System                     *.txt                        Time
// DVDSubtitle                             *.sub                        Time
// FAB Subtitler                           *.txt                        Time & Frames (25 or 30)
// I-Author Script                         *.txt                        Time
// Inscriber CG                            *.txt                        Time
// JACOSub 2.7+                            *.jss                        Time
// Karaoke Lyrics LRC                      *.lrc                        Time
// Karaoke Lyrics VKT                      *.vkt                        Time
// MAC DVD Studio Pro                      *.txt                        Time & Frames (25 or 30)
// MacSUB                                  *.scr                        Frames
// MicroDVD                                *.sub; *.txt                 Frames
// MPlayer                                 *.mpl                        Frames
// MPlayer2                                *.mpl                        Time
// MPSub                                   *.sub                        Time (dynamic)
// OVR Script                              *.ovr                        Time
// Panimator                               *.pan                        Time
// Philips SVCD Designer                   *.sub                        Time
// Phoenix Japanimation Society            *.pjs                        Frames
// Pinnacle Impression                     *.txt                        Time
// PowerDivX                               *.psb; *.txt                 Time
// PowerPixel                              *.txt                        Time
// QuickTime Text                          *.txt                        Time
// RealTime                                *.rt                         Time
// SAMI Captioning                         *.smi; *.sami                Time
// Sasami Script                           *.s2k                        Time
// SBT                                     *.sbt                        Time
// Scantitle                               *.890                        Time    // by Bedazzle 2005.11.18
// Sofni                                   *.sub                        Time
// Softitler RTF                           *.rtf                        Time
// SonicDVD Creator                        *.sub                        Time & Frames (25 or 30)
// Sonic Scenarist                         *.sst                        Time & Frames (25 or 30)
// Spruce DVDMaestro                       *.son                        Time & Frames (25 or 30)
// Spruce Subtitle File                    *.stl                        Time & Frames (25 or 30)
// Stream SubText Player                   *.sst                        Time
// Stream SubText Script                   *.ssts                       Time
// SubCreator 1.x                          *.txt                        Time
// SubRip                                  *.srt                        Time
//    SubRip (Unicode)                     *.srt                        Time    // by Bedazzle 2011.09.19
// SubSonic                                *.sub                        Time
// SubStation Alpha                        *.ssa                        Time
// SubViewer 1.0                           *.sub                        Time
// SubViewer 2.0                           *.sub                        Time
// TimedText                               *.xml                        Time    // by URUWorks 2007.12.22
// Titlevision ANSI with cues              *.txt                        Time
// TMPlayer                                *.txt; *.sub                 Time
//    TMPlayer 1                           *.txt; *.sub                 Time
//    TMPlayer 2                           *.txt; *.sub                 Time
//    TMPlayer +1                          *.txt; *.sub                 Time
//    TMPlayer +2                          *.txt; *.sub                 Time
//    TMPlayer Multiline                   *.txt; *.sub                 Time
//    KoalaPlayer (TMPlayer?)              *.txt                        Time
// Turbo Titler                            *.tts                        Time
// Ulead DVD Workshop 2.0                  *.txt                        Time
// Ulead DVD Workshop 2.0 a                *.txt                        Time
// ViPlay Subtitle File                    *.vsf                        Time
// Wincaps text timecoded                  *.txt                        Time    // by Bedazzle 2007.07.04
// Youtube                                 *.sbv                        Time    // by Bedazzle 2011.09.14
// ZeroG                                   *.zeg                        Time
// -----------------------------------------------------------------------------
// TOTAL: 66
// -----------------------------------------------------------------------------

unit USubtitlesRead;

//------------------------------------------------------------------------------

interface

uses
  Dialogs, // by Bedazzle 2007.01.26
  Classes, //added by adenry 2013.04.11 - for TStringList
  USubtitleFile, USubtitlesFunctions, SysUtils, FastStrings{$IFDEF VIPLAY}, Forms{$ENDIF};

//------------------------------------------------------------------------------

type
  TSubtitleFormats = (sfInvalid,
                      sfAdobeEncoreDVD,
                      sfAdobeEncoreDVDNTSC,         // added by adenry 2013.04.11
                      sfAdobeEncoreDVDPAL,          // added by adenry 2013.04.11
                      sfAdvancedSubStationAlpha,
                      sfAdvancedSubtitlesXAS,      // by Bedazzle 2007.01.26
                      sfAQTitle,
                      sfCaptions32,
                      sfCaptionsDat,
                      sfCaptionsDatText,
                      sfCaptionsInc,
                      sfCavena,                    // by Bedazzle 2007.05.13
                      sfCheetah,
                      sfCPC600,
                      sfDKS,
                      sfDVDJunior,
                      sfDVDSubtitleSystem,
                      sfDVDSubtitle,
                      sfFABSubtitler,
                      sfIAuthor,
                      sfInscriberCG,
                      sfJACOSub,
                      sfKaraokeLyricsLRC,
                      sfKaraokeLyricsVKT,
                      sfMACDVDStudioPro,
                      sfMacSUB,
                      sfMicroDVD,
                      sfMPlayer,
                      sfMPlayer2,
                      sfMPSub,
                      sfOVRScript,
                      sfPanimator,
                      sfPhilipsSVCD,
                      sfPhoenixJS,
                      sfPinnacleImpression,
                      sfPowerDivX,
                      sfPowerPixel,
                      sfQuickTimeText,
                      sfRealTime,
                      sfSAMI,
                      sfSasamiScript,
                      sfSBT,
                      sfScantitle,                 // by Bedazzle 2005.11.18
                      sfSofni,
                      sfSoftitlerRTF,
                      sfSonicDVD,
                      sfSonicScenarist,
                      sfSpruceDVDMaestro,
                      sfSpruceSubtitleFile,
                      sfSSTPlayer,
                      sfSSTScript,
                      sfSubCreator,
                      sfSubRip,
//                      sfSubRipW,                   // by Bedazzle 2011.09.19
                      sfSubSonic,
                      sfSubStationAlpha,
                      sfSubViewer1,
                      sfSubViewer2,
                      sfTimedText,                 // by URUWorks 2007.12.22
                      //sfTitlevisionTXT,
                      sfTMPlayer,
                      sfTurboTitler,
                      sfUleadDVDWorkshop2,
                      sfUleadDVDWorkshop2a,
                      sfViPlay,
                      sfWincapsTextTimecoded,      // by Bedazzle 2007.07.04
                      sfYoutube,                   // by Bedazzle 2011.09.14
                      sfZeroG);

const
  TSubtitleFormatsName : array[1..65] of String =
  ('Adobe Encore DVD (Old)',
   'Adobe Encore DVD NTSC', //added by adenry 2013.04.11
   'Adobe Encore DVD PAL', //added by adenry 2013.04.11
   'Advanced SubStation Alpha',
   'Advanced Subtitles',
   'AQTitle',
   'Captions 32',
   'Captions DAT',
   'Captions DAT Text',
   'Captions Inc.',
   'Cavena',
   'Cheetah',
   'CPC-600',
   'DKS Subtitle Format',
   'DVD Junior',
   'DVD Subtitle System',
   'DVDSubtitle',
   'FAB Subtitler',
   'I-Author Script',
   'Inscriber CG',
   'JACOSub 2.7+',
   'Karaoke Lyrics LRC',
   'Karaoke Lyrics VKT',
   'MAC DVD Studio Pro',
   'MacSUB',
   'MicroDVD',
   'MPlayer',
   'MPlayer2',
   'MPSub',
   'OVR Script',
   'Panimator',
   'Philips SVCD Designer 1.5-2.0',
   'Phoenix Japanimation Society',
   'Pinnacle Impression',
   'PowerDivX',
   'PowerPixel',
   'QuickTime Text',
   'RealTime',
   'SAMI Captioning',
   'Sasami Script',
   'SBT',
   'Scantitle',   // by Bedazzle 2005.11.18
   'Sofni',
   'Softitler RTF',
   'SonicDVD Creator',
   'Sonic Scenarist',
   'Spruce DVDMaestro',
   'Spruce Subtitle File',
   'Stream SubText Player',
   'Stream SubText Script',
   'SubCreator 1.x',
   'SubRip',
//   'SubRip Unicode',  // by Bedazzle 2011.09.19
   'SubSonic',
   'SubStation Alpha',
   'SubViewer 1.0',
   'SubViewer 2.0',
   'Timed Text',              // by URUWorks 2007.12.22
   //'Titlevision ANSI with cues',
   'TMPlayer',
   'Turbo Titler',
   'Ulead DVD Workshop 2.0',
   'Ulead DVD Workshop 2.0 a',
   'ViPlay Subtitle File',
   'Wincaps text timecoded',  // by Bedazzle 2007.07.04
   'YouTube',                 // by Bedazzle 2011.09.14
   'ZeroG');

//------------------------------------------------------------------------------

function LoadSubtitle(var Subtitles: TSubtitles; const FileName: String; FPS: Single; SubtitleFormat: TSubtitleFormats = sfInvalid; Clear: Boolean = True; ReCalcTimeValues: Boolean = False): Boolean;
procedure CloseSubtitle(var Subtitles: TSubtitles);
function DisplaySubtitle(var Subtitles: TSubtitles; const Time: Integer): String;

function IndexToName(const FormatIndex: ShortInt): String;
function NameToIndex(const FormatName: String): ShortInt;
function MakeOneLine(const Source: String): String;

//------------------------------------------------------------------------------

function FileToSubtitles                         (var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; FPS: Single; SubtitleFormat: TSubtitleFormats; ReCalcTimeValues: Boolean): Boolean;
function FileToSubtitles_ADOBEENCOREDVD          (var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; FPS: Single; ExtraTime: Integer): Boolean;
function FileToSubtitles_ADOBEENCOREDVDNTSC      (var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; FPS: Single; ExtraTime: Integer): Boolean; //added by adenry 2013.04.11
function FileToSubtitles_ADOBEENCOREDVDPAL       (var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; FPS: Single; ExtraTime: Integer): Boolean; //added by adenry 2013.04.11
function FileToSubtitles_ADVANCEDSUBSTATIONALPHA (var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; ExtraTime: Integer): Boolean;
function FileToSubtitles_ADVANCEDSUBTITLESXAS    (var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; ExtraTime: Integer): Boolean;   // by Bedazzle 2007.01.26
function FileToSubtitles_AQTITLE                 (var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; FPS: Single; ExtraTime: Integer): Boolean;
function FileToSubtitles_CAPTIONS32              (var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; ExtraTime: Integer): Boolean;
function FileToSubtitles_CAPTIONSDAT             (var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; ExtraTime: Integer): Boolean;
function FileToSubtitles_CAPTIONSDATTEXT         (var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; ExtraTime: Integer): Boolean;
function FileToSubtitles_CAPTIONSINC             (var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; ExtraTime: Integer): Boolean;
function FileToSubtitles_CAVENA                  (var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; ExtraTime: Integer): Boolean;   // by Bedazzle 2007.05.13
function FileToSubtitles_CHEETAH                 (var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; ExtraTime: Integer): Boolean;
function FileToSubtitles_CPC600                  (var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; ExtraTime: Integer): Boolean;
function FileToSubtitles_DKS                     (var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; ExtraTime: Integer): Boolean;
function FileToSubtitles_DVDJUNIOR               (var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; ExtraTime: Integer): Boolean;
function FileToSubtitles_DVDSUBTITLESYSTEM       (var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; ExtraTime: Integer): Boolean;
function FileToSubtitles_DVDSUBTITLE             (var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; ExtraTime: Integer): Boolean;
function FileToSubtitles_FABSUBTITLER            (var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; FPS: Single; ExtraTime: Integer): Boolean;
function FileToSubtitles_IAUTHOR                 (var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; ExtraTime: Integer): Boolean;
function FileToSubtitles_INSCRIBERCG             (var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; ExtraTime: Integer): Boolean;
function FileToSubtitles_JACOSUB                 (var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; ExtraTime: Integer): Boolean;
function FileToSubtitles_KARAOKELYRICSLRC        (var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; ExtraTime: Integer): Boolean;
function FileToSubtitles_KARAOKELYRICSVKT        (var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; ExtraTime: Integer): Boolean;
function FileToSubtitles_MACDVDSTUDIOPRO         (var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; FPS: Single; ExtraTime: Integer): Boolean;
function FileToSubtitles_MACSUB                  (var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; FPS: Single; ExtraTime: Integer): Boolean;
function FileToSubtitles_MICRODVD                (var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; FPS: Single; ExtraTime: Integer): Boolean;
function FileToSubtitles_MPLAYER                 (var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; FPS: Single; ExtraTime: Integer): Boolean;
function FileToSubtitles_MPLAYER2                (var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; ExtraTime: Integer): Boolean;
function FileToSubtitles_MPSUB                   (var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; ExtraTime: Integer): Boolean;
function FileToSubtitles_OVRSCRIPT               (var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; ExtraTime: Integer): Boolean;
function FileToSubtitles_PANIMATOR               (var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; ExtraTime: Integer): Boolean;
function FileToSubtitles_PHILIPSSVCD             (var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; ExtraTime: Integer): Boolean;
function FileToSubtitles_PHOENIXJAPANIMATION     (var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; FPS: Single; ExtraTime: Integer): Boolean;
function FileToSubtitles_PINNACLEIMPRESSION      (var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; FPS: Single; ExtraTime: Integer): Boolean;
function FileToSubtitles_POWERDIVX               (var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; ExtraTime: Integer): Boolean;
function FileToSubtitles_POWERPIXEL              (var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; ExtraTime: Integer): Boolean;
function FileToSubtitles_QUICKTIMETEXT           (var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; ExtraTime: Integer): Boolean;
function FileToSubtitles_REALTIME                (var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; ExtraTime: Integer): Boolean;
function FileToSubtitles_SAMI                    (var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; ExtraTime: Integer): Boolean;
function FileToSubtitles_SASAMISCRIPT            (var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; ExtraTime: Integer): Boolean;
function FileToSubtitles_SBT                     (var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; ExtraTime: Integer): Boolean;
function FileToSubtitles_SCANTITLE               (var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; ExtraTime: Integer): Boolean;   // by Bedazzle 2005.11.18
function FileToSubtitles_SOFNI                   (var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; ExtraTime: Integer): Boolean;
function FileToSubtitles_SOFTITLERRTF            (var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; ExtraTime: Integer): Boolean;
function FileToSubtitles_SONICDVD                (var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; FPS: Single; ExtraTime: Integer): Boolean;
function FileToSubtitles_SONICSCENARIST          (var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; FPS: Single; ExtraTime: Integer): Boolean;
function FileToSubtitles_SPRUCEDVDMAESTRO        (var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; FPS: Single; ExtraTime: Integer): Boolean;
function FileToSubtitles_SPRUCESUBTITLEFILE      (var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; FPS: Single; ExtraTime: Integer): Boolean;
function FileToSubtitles_SSTPLAYER               (var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; ExtraTime: Integer): Boolean;
function FileToSubtitles_SSTSCRIPT               (var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; ExtraTime: Integer): Boolean;
function FileToSubtitles_SUBCREATOR1X            (var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; ExtraTime: Integer): Boolean;
function FileToSubtitles_SUBRIP                  (var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; ExtraTime: Integer): Boolean;
//function FileToSubtitles_SUBRIP_W                (var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; ExtraTime: Integer): Boolean;   // by Bedazzle 2011.09.19
function FileToSubtitles_SUBSONIC                (var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; ExtraTime: Integer): Boolean;
function FileToSubtitles_SUBSTATIONALPHA         (var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; ExtraTime: Integer): Boolean;
function FileToSubtitles_SUBVIEWER1              (var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; ExtraTime: Integer): Boolean;
function FileToSubtitles_SUBVIEWER2              (var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; ExtraTime: Integer): Boolean;
function FileToSubtitles_TIMEDTEXT               (var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; ExtraTime: Integer): Boolean;   // by URUWorks 2007.12.22
//function FileToSubtitles_TITLEVISIONTXT          (var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; ExtraTime: Integer): Boolean;
function FileToSubtitles_TMPLAYER                (var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; ExtraTime: Integer): Boolean;
function FileToSubtitles_TURBOTITLER             (var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; ExtraTime: Integer): Boolean;
function FileToSubtitles_ULEADDVDWORKSHOP2       (var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; FPS: Single; ExtraTime: Integer; alternative: boolean): Boolean;
function FileToSubtitles_VIPLAY                  (var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; ExtraTime: Integer): Boolean;
function FileToSubtitles_WINCAPSTEXTTIMECODED    (var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; FPS: Single; ExtraTime: Integer): Boolean;  // by Bedazzle 2007.07.04
function FileToSubtitles_YOUTUBE                 (var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; ExtraTime: Integer): Boolean;   // by Bedazzle 2011.09.14
function FileToSubtitles_ZEROG                   (var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; ExtraTime: Integer): Boolean;

//------------------------------------------------------------------------------

var
  {$IFNDEF VIPLAY}
  NoInteractionWithTags : Boolean = False;
  SingleTagsMode        : Boolean = True; //added by adenry 2013.04.11
  MultiTagsMode         : Boolean = False; //added by adenry 2013.04.11
  {$ENDIF}
  WorkWithTags          : Boolean = False;
  PlaybackDelay         : Integer = 0;
  MaxDuration           : Integer = 0;
  {$IFDEF VIPLAY}
  CurrentLine           : Integer = -1;
  {$ENDIF}

//------------------------------------------------------------------------------

implementation

uses UCheckFormat, LibXMLParser;

//------------------------------------------------------------------------------

function LoadSubtitle(var Subtitles: TSubtitles; const FileName: String; FPS: Single; SubtitleFormat: TSubtitleFormats = sfInvalid; Clear: Boolean = True; ReCalcTimeValues: Boolean = False): Boolean;
var
  tmpSubFile: TSubtitleFile;
begin
  Result := False;

  if Clear = True then CloseSubtitle(Subtitles);
  if Assigned(Subtitles) = False then Subtitles := TSubtitles.Create;
  Subtitles.Format := Integer(SubtitleFormat);

  tmpSubFile := TSubtitleFile.Create;
  try
    tmpSubFile.LoadFromFile(FileName);
    if Subtitles.Format <= Integer(sfInvalid) then
      Subtitles.Format := Integer(CheckSubtitleFormat(tmpSubFile));

    Result := FileToSubtitles(Subtitles, tmpSubFile, FPS, TSubtitleFormats(Subtitles.Format), ReCalcTimeValues);
  finally
    tmpSubFile.Free;
    if Result = False then
      CloseSubtitle(Subtitles)
    else
      Subtitles.Capacity := Subtitles.Count;
  end;
end;

//------------------------------------------------------------------------------

procedure CloseSubtitle(var Subtitles: TSubtitles);
begin
  if Assigned(Subtitles) then
  begin
    Subtitles.Free;
    Subtitles := NIL;
  end;
  {$IFDEF VIPLAY}
  CurrentLine := -1;
  {$ENDIF}
end;

// -----------------------------------------------------------------------------

function DisplaySubtitle(var Subtitles: TSubtitles; const Time: Integer): {$IFDEF UTF8}WideString{$ELSE}String{$ENDIF};
var
  i: Integer;
begin
  Result := '';

  if not Assigned(Subtitles) then Exit;

  for i := 0 to Subtitles.Count-1 do
  begin
    {$IFDEF VIPLAY}
    if (i mod 10) = 0 then Application.ProcessMessages;
    {$ENDIF}

    if (Time >= Subtitles[i].InitialTime+PlaybackDelay) and (Time <= Subtitles[i].FinalTime+PlaybackDelay) then
    begin
      Result := Subtitles[i].Text;
      {$IFDEF VIPLAY}
      CurrentLine := i;
      {$ENDIF}
      Break;
    end
    else if Time < Subtitles[i].FinalTime + PlaybackDelay then
      Break;
  end;
end;

//------------------------------------------------------------------------------

function FileToSubtitles(var Subtitles: TSubtitles; tmpSubFile: TSubtitleFile; FPS: Single; SubtitleFormat: TSubtitleFormats; ReCalcTimeValues: Boolean): Boolean;
var
  ExtraTime: Integer;
begin
  Result := False;

  if (ReCalcTimeValues = True) and Assigned(Subtitles) and (Subtitles.Count > 0) then
    ExtraTime := Subtitles[Subtitles.Count-1].FinalTime
  else
    ExtraTime := 0;

  case SubtitleFormat of
    sfAdobeEncoreDVD          : Result := FileToSubtitles_ADOBEENCOREDVD         (Subtitles, tmpSubFile, FPS, ExtraTime);
    sfAdobeEncoreDVDNTSC      : Result := FileToSubtitles_ADOBEENCOREDVDNTSC     (Subtitles, tmpSubFile, FPS, ExtraTime); //added by adenry 2013.04.11
    sfAdobeEncoreDVDPAL       : Result := FileToSubtitles_ADOBEENCOREDVDPAL      (Subtitles, tmpSubFile, FPS, ExtraTime); //added by adenry 2013.04.11
    sfAdvancedSubStationAlpha : Result := FileToSubtitles_ADVANCEDSUBSTATIONALPHA(Subtitles, tmpSubFile, ExtraTime);
    sfAdvancedSubtitlesXAS    : Result := FileToSubtitles_ADVANCEDSUBTITLESXAS   (Subtitles, tmpSubFile, ExtraTime);    // by Bedazzle 2007.01.26
    sfAQTitle                 : Result := FileToSubtitles_AQTITLE                (Subtitles, tmpSubFile, FPS, ExtraTime);
    sfCaptions32              : Result := FileToSubtitles_CAPTIONS32             (Subtitles, tmpSubFile, ExtraTime);
    sfCaptionsDat             : Result := FileToSubtitles_CAPTIONSDAT            (Subtitles, tmpSubFile, ExtraTime);
    sfCaptionsDatText         : Result := FileToSubtitles_CAPTIONSDATTEXT        (Subtitles, tmpSubFile, ExtraTime);
    sfCaptionsInc             : Result := FileToSubtitles_CAPTIONSINC            (Subtitles, tmpSubFile, ExtraTime);
    sfCavena                  : Result := FileToSubtitles_CAVENA                 (Subtitles, tmpSubFile, ExtraTime);    // by Bedazzle 2007.05.13
    sfCheetah                 : Result := FileToSubtitles_CHEETAH                (Subtitles, tmpSubFile, ExtraTime);
    sfCPC600                  : Result := FileToSubtitles_CPC600                 (Subtitles, tmpSubFile, ExtraTime);
    sfDKS                     : Result := FileToSubtitles_DKS                    (Subtitles, tmpSubFile, ExtraTime);
    sfDVDJunior               : Result := FileToSubtitles_DVDJUNIOR              (Subtitles, tmpSubFile, ExtraTime);
    sfDVDSubtitleSystem       : Result := FileToSubtitles_DVDSUBTITLESYSTEM      (Subtitles, tmpSubFile, ExtraTime);
    sfDVDSubtitle             : Result := FileToSubtitles_DVDSUBTITLE            (Subtitles, tmpSubFile, ExtraTime);
    sfFABSubtitler            : Result := FileToSubtitles_FABSUBTITLER           (Subtitles, tmpSubFile, FPS, ExtraTime);
    sfIAuthor                 : Result := FileToSubtitles_IAUTHOR                (Subtitles, tmpSubFile, ExtraTime);
    sfInscriberCG             : Result := FileToSubtitles_INSCRIBERCG            (Subtitles, tmpSubFile, ExtraTime);
    sfJACOSub                 : Result := FileToSubtitles_JACOSUB                (Subtitles, tmpSubFile, ExtraTime);
    sfKaraokeLyricsLRC        : Result := FileToSubtitles_KARAOKELYRICSLRC       (Subtitles, tmpSubFile, ExtraTime);
    sfKaraokeLyricsVKT        : Result := FileToSubtitles_KARAOKELYRICSVKT       (Subtitles, tmpSubFile, ExtraTime);
    sfMACDVDStudioPro         : Result := FileToSubtitles_MACDVDSTUDIOPRO        (Subtitles, tmpSubFile, FPS, ExtraTime);
    sfMacSUB                  : Result := FileToSubtitles_MACSUB                 (Subtitles, tmpSubFile, FPS, ExtraTime);
    sfMicroDVD                : Result := FileToSubtitles_MICRODVD               (Subtitles, tmpSubFile, FPS, ExtraTime);
    sfMPlayer                 : Result := FileToSubtitles_MPLAYER                (Subtitles, tmpSubFile, FPS, ExtraTime);
    sfMPlayer2                : Result := FileToSubtitles_MPLAYER2               (Subtitles, tmpSubFile, ExtraTime);
    sfMPSub                   : Result := FileToSubtitles_MPSUB                  (Subtitles, tmpSubFile, ExtraTime);
    sfOVRScript               : Result := FileToSubtitles_OVRSCRIPT              (Subtitles, tmpSubFile, ExtraTime);
    sfPanimator               : Result := FileToSubtitles_PANIMATOR              (Subtitles, tmpSubFile, ExtraTime);
    sfPhilipsSVCD             : Result := FileToSubtitles_PHILIPSSVCD            (Subtitles, tmpSubFile, ExtraTime);
    sfPhoenixJS               : Result := FileToSubtitles_PHOENIXJAPANIMATION    (Subtitles, tmpSubFile, FPS, ExtraTime);
    sfPinnacleImpression      : Result := FileToSubtitles_PINNACLEIMPRESSION     (Subtitles, tmpSubFile, FPS, ExtraTime);
    sfPowerDivX               : Result := FileToSubtitles_POWERDIVX              (Subtitles, tmpSubFile, ExtraTime);
    sfPowerPixel              : Result := FileToSubtitles_POWERPIXEL             (Subtitles, tmpSubFile, ExtraTime);
    sfQuickTimeText           : Result := FileToSubtitles_QUICKTIMETEXT          (Subtitles, tmpSubFile, ExtraTime);
    sfRealTime                : Result := FileToSubtitles_REALTIME               (Subtitles, tmpSubFile, ExtraTime);
    sfSAMI                    : Result := FileToSubtitles_SAMI                   (Subtitles, tmpSubFile, ExtraTime);
    sfSasamiScript            : Result := FileToSubtitles_SASAMISCRIPT           (Subtitles, tmpSubFile, ExtraTime);
    sfSBT                     : Result := FileToSubtitles_SBT                    (Subtitles, tmpSubFile, ExtraTime);
    sfScantitle               : Result := FileToSubtitles_SCANTITLE              (Subtitles, tmpSubFile, ExtraTime);    // by Bedazzle 2005.11.18
    sfSofni                   : Result := FileToSubtitles_SOFNI                  (Subtitles, tmpSubFile, ExtraTime);
    sfSoftitlerRTF            : Result := FileToSubtitles_SOFTITLERRTF           (Subtitles, tmpSubFile, ExtraTime);
    sfSonicDVD                : Result := FileToSubtitles_SONICDVD               (Subtitles, tmpSubFile, FPS, ExtraTime);
    sfSonicScenarist          : Result := FileToSubtitles_SONICSCENARIST         (Subtitles, tmpSubFile, FPS, ExtraTime);
    sfSpruceDVDMaestro        : Result := FileToSubtitles_SPRUCEDVDMAESTRO       (Subtitles, tmpSubFile, FPS, ExtraTime);
    sfSpruceSubtitleFile      : Result := FileToSubtitles_SPRUCESUBTITLEFILE     (Subtitles, tmpSubFile, FPS, ExtraTime);
    sfSSTPlayer               : Result := FileToSubtitles_SSTPLAYER              (Subtitles, tmpSubFile, ExtraTime);
    sfSSTScript               : Result := FileToSubtitles_SSTSCRIPT              (Subtitles, tmpSubFile, ExtraTime);
    sfSubCreator              : Result := FileToSubtitles_SUBCREATOR1X           (Subtitles, tmpSubFile, ExtraTime);
    sfSubRip                  : Result := FileToSubtitles_SUBRIP                 (Subtitles, tmpSubFile, ExtraTime);
//    sfSubRipW                 : Result := FileToSubtitles_SUBRIP_W               (Subtitles, tmpSubFile, ExtraTime);    // by Bedazzle 2011.09.19
    sfSubSonic                : Result := FileToSubtitles_SUBSONIC               (Subtitles, tmpSubFile, ExtraTime);
    sfSubStationAlpha         : Result := FileToSubtitles_SUBSTATIONALPHA        (Subtitles, tmpSubFile, ExtraTime);
    sfSubViewer1              : Result := FileToSubtitles_SUBVIEWER1             (Subtitles, tmpSubFile, ExtraTime);
    sfSubViewer2              : Result := FileToSubtitles_SUBVIEWER2             (Subtitles, tmpSubFile, ExtraTime);
    sfTimedText               : Result := FileToSubtitles_TIMEDTEXT              (Subtitles, tmpSubFile, ExtraTime);    // by URUWorks 2007.12.22
    //sfTitlevisionTXT          : Result := FileToSubtitles_TITLEVISIONTXT         (Subtitles, tmpSubFile, ExtraTime);
    sfTMPlayer                : Result := FileToSubtitles_TMPLAYER               (Subtitles, tmpSubFile, ExtraTime);
    sfTurboTitler             : Result := FileToSubtitles_TURBOTITLER            (Subtitles, tmpSubFile, ExtraTime);
    sfUleadDVDWorkshop2       : Result := FileToSubtitles_ULEADDVDWORKSHOP2      (Subtitles, tmpSubFile, FPS, ExtraTime, False);
    sfUleadDVDWorkshop2a      : Result := FileToSubtitles_ULEADDVDWORKSHOP2      (Subtitles, tmpSubFile, FPS, ExtraTime, True);
    sfViPlay                  : Result := FileToSubtitles_VIPLAY                 (Subtitles, tmpSubFile, ExtraTime);
    sfWincapsTextTimecoded    : Result := FileToSubtitles_WINCAPSTEXTTIMECODED   (Subtitles, tmpSubFile, FPS, ExtraTime); // by Bedazzle 2007.07.04
    sfYoutube                 : Result := FileToSubtitles_YOUTUBE                (Subtitles, tmpSubFile, ExtraTime);    // by Bedazzle 2011.09.14
    sfZeroG                   : Result := FileToSubtitles_ZEROG                  (Subtitles, tmpSubFile, ExtraTime);
  end;
end;

//------------------------------------------------------------------------------
{$include ReadFormats/FRead_ADOBEENCOREDVD}
{$include ReadFormats/FRead_ADOBEENCOREDVDNTSC}
{$include ReadFormats/FRead_ADOBEENCOREDVDPAL}
{$include ReadFormats/FRead_ADVANCEDSUBSTATIONALPHA}
{$include ReadFormats/FRead_ADVANCEDSUBTITLESXAS}
{$include ReadFormats/FRead_AQTITLE}
{$include ReadFormats/FRead_CAPTIONS32}
{$include ReadFormats/FRead_CAPTIONSDAT}
{$include ReadFormats/FRead_CAPTIONSDATTEXT}
{$include ReadFormats/FRead_CAPTIONSINC}
{$include ReadFormats/FRead_CAVENA}
{$include ReadFormats/FRead_CHEETAH}
{$include ReadFormats/FRead_CPC600}
{$include ReadFormats/FRead_DKS}
{$include ReadFormats/FRead_DVDJUNIOR}
{$include ReadFormats/FRead_DVDSUBTITLE}
{$include ReadFormats/FRead_DVDSUBTITLESYSTEM}
{$include ReadFormats/FRead_FABSUBTITLER}
{$include ReadFormats/FRead_IAUTHOR}
{$include ReadFormats/FRead_INSCRIBERCG}
{$include ReadFormats/FRead_JACOSUB}
{$include ReadFormats/FRead_KARAOKELYRICSLRC}
{$include ReadFormats/FRead_KARAOKELYRICSVKT}
{$include ReadFormats/FRead_MACDVDSTUDIOPRO}
{$include ReadFormats/FRead_MACSUB}
{$include ReadFormats/FRead_MICRODVD}
{$include ReadFormats/FRead_MPLAYER}
{$include ReadFormats/FRead_MPLAYER2}
{$include ReadFormats/FRead_MPSUB}
{$include ReadFormats/FRead_OVRScript}
{$include ReadFormats/FRead_PANIMATOR}
{$include ReadFormats/FRead_PHILIPSSVCD}
{$include ReadFormats/FRead_PHOENIXJAPANIMATION}
{$include ReadFormats/FRead_PINNACLEIMPRESSION}
{$include ReadFormats/FRead_POWERDIVX}
{$include ReadFormats/FRead_POWERPIXEL}
{$include ReadFormats/FRead_QUICKTIMETEXT}
{$include ReadFormats/FRead_REALTIME}
{$include ReadFormats/FRead_SAMI}
{$include ReadFormats/FRead_SASAMISCRIPT}
{$include ReadFormats/FRead_SBT}
{$include ReadFormats/FRead_SCANTITLE}
{$include ReadFormats/FRead_SOFNI}
{$include ReadFormats/FRead_SOFTITLERRTF}
{$include ReadFormats/FRead_SONICDVD}
{$include ReadFormats/FRead_SONICSCENARIST}
{$include ReadFormats/FRead_SPRUCEDVDMAESTRO}
{$include ReadFormats/FRead_SPRUCESUBTITLEFILE}
{$include ReadFormats/FRead_SSTPLAYER}
{$include ReadFormats/FRead_SSTSCRIPT}
{$include ReadFormats/FRead_SUBCREATOR1X}
{$include ReadFormats/FRead_SUBRIP}
//{$include ReadFormats/FRead_SUBRIP_W}
{$include ReadFormats/FRead_SUBSONIC}
{$include ReadFormats/FRead_SUBSTATIONALPHA}
{$include ReadFormats/FRead_SUBVIEWER1}
{$include ReadFormats/FRead_SUBVIEWER2}
{$include ReadFormats/FRead_TIMEDTEXT}
//{$include ReadFormats/FRead_TITLEVISIONTXT}
{$include ReadFormats/FRead_TMPLAYER}
{$include ReadFormats/FRead_TURBOTITLER}
{$include ReadFormats/FRead_ULEADDVDWORKSHOP2}
{$include ReadFormats/FRead_VIPLAY}
{$include ReadFormats/FRead_WINCAPSTEXTTIMECODED}
{$include ReadFormats/FRead_YOUTUBE}
{$include ReadFormats/FRead_ZEROG}

//------------------------------------------------------------------------------

function IndexToName(const FormatIndex: ShortInt): String;
begin
  Result := '';
  if (FormatIndex >= Low(TSubtitleFormatsName)) and (FormatIndex <= High(TSubtitleFormatsName)) Then
    Result := TSubtitleFormatsName[FormatIndex];
end;

//------------------------------------------------------------------------------

function NameToIndex(const FormatName: String): ShortInt;
var
  i: ShortInt;
begin
  Result := 0;
  for i := Low(TSubtitleFormatsName) to High(TSubtitleFormatsName) do
    if AnsiLowerCase(FormatName) = AnsiLowerCase(TSubtitleFormatsName[i]) Then
      Result := i;
end;

//------------------------------------------------------------------------------

function MakeOneLine(const Source: String): String;
var
  i: Integer;
begin
  Result := '';
  for i := 1 to Length(Source) do
  begin
    if (Source[i] <> #13) and (Source[i] <> #10) and (Source[i] <> #9) then
      Result := Result + Source[i];
  end;
end;

//------------------------------------------------------------------------------

end.
