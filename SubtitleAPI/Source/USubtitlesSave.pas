// This file is part of Subtitle API, the subtitle file read/write library of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle API's copyright information
// File Description: Subtitle file saving functionality

unit USubtitlesSave;

// -----------------------------------------------------------------------------

interface

uses
  Windows, Dialogs, Controls,
  Classes, //added by adenry 2013.04.11 - for TStringList
  USubtitlesRead, USubtitleFile, USubtitlesFunctions, FastStrings, SysUtils;

//function RemoveSWTags                            (Text: String; Bold, Italic, Underline: Boolean; Color: Boolean = True): String; //moved to USubtitlesFunctions by adenry 2013.04.11
function SubtitlesToFile                         (Subtitles: TSubtitles; const FileName: String; const FPS: Single; const SubtitleFormat: TSubtitleFormats; From: Integer = -1; UpTo: Integer = -1): Boolean;
function SubtitlesToFile_ADOBEENCOREDVD          (Subtitles: TSubtitles; const FileName: String; const FPS: Single; From: Integer = -1; UpTo: Integer = -1) : Boolean;
function SubtitlesToFile_ADOBEENCOREDVDNTSC      (Subtitles: TSubtitles; const FileName: String; const FPS: Single; From: Integer = -1; UpTo: Integer = -1) : Boolean; //added by adenry 2013.04.11
function SubtitlesToFile_ADOBEENCOREDVDPAL       (Subtitles: TSubtitles; const FileName: String; const FPS: Single; From: Integer = -1; UpTo: Integer = -1) : Boolean; //added by adenry 2013.04.11
function SubtitlesToFile_ADVANCEDSUBSTATIONALPHA (Subtitles: TSubtitles; const FileName: String; From: Integer = -1; UpTo: Integer = -1)                    : Boolean;
function SubtitlesToFile_ADVANCEDSUBTITLESXAS    (Subtitles: TSubtitles; const FileName: String; From: Integer = -1; UpTo: Integer = -1)                    : Boolean;    // by Bedazzle 2007.01.26
function SubtitlesToFile_AQTITLE                 (Subtitles: TSubtitles; const FileName: String; const FPS: Single; From: Integer = -1; UpTo: Integer = -1) : Boolean;
function SubtitlesToFile_CAPTIONS32              (Subtitles: TSubtitles; const FileName: String; From: Integer = -1; UpTo: Integer = -1)                    : Boolean;
function SubtitlesToFile_CAPTIONSDAT             (Subtitles: TSubtitles; const FileName: String; From: Integer = -1; UpTo: Integer = -1)                    : Boolean;
function SubtitlesToFile_CAPTIONSDATTEXT         (Subtitles: TSubtitles; const FileName: String; From: Integer = -1; UpTo: Integer = -1)                    : Boolean;
function SubtitlesToFile_CAPTIONSINC             (Subtitles: TSubtitles; const FileName: String; From: Integer = -1; UpTo: Integer = -1)                    : Boolean;
function SubtitlesToFile_CAVENA                  (Subtitles: TSubtitles; const FileName: String; From: Integer = -1; UpTo: Integer = -1)                    : Boolean;
function SubtitlesToFile_CHEETAH                 (Subtitles: TSubtitles; const FileName: String; From: Integer = -1; UpTo: Integer = -1)                    : Boolean;
function SubtitlesToFile_CPC600                  (Subtitles: TSubtitles; const FileName: String; From: Integer = -1; UpTo: Integer = -1)                    : Boolean;
function SubtitlesToFile_DKS                     (Subtitles: TSubtitles; const FileName: String; From: Integer = -1; UpTo: Integer = -1)                    : Boolean;
function SubtitlesToFile_DVDJUNIOR               (Subtitles: TSubtitles; const FileName: String; From: Integer = -1; UpTo: Integer = -1)                    : Boolean;
function SubtitlesToFile_DVDSUBTITLESYSTEM       (Subtitles: TSubtitles; const FileName: String; From: Integer = -1; UpTo: Integer = -1)                    : Boolean;
function SubtitlesToFile_DVDSUBTITLE             (Subtitles: TSubtitles; const FileName: String; From: Integer = -1; UpTo: Integer = -1)                    : Boolean;
function SubtitlesToFile_FABSUBTITLER            (Subtitles: TSubtitles; const FileName: String; const FPS: Single; From: Integer = -1; UpTo: Integer = -1) : Boolean;
function SubtitlesToFile_IAUTHOR                 (Subtitles: TSubtitles; const FileName: String; From: Integer = -1; UpTo: Integer = -1)                    : Boolean;
function SubtitlesToFile_INSCRIBERCG             (Subtitles: TSubtitles; const FileName: String; From: Integer = -1; UpTo: Integer = -1)                    : Boolean;
function SubtitlesToFile_JACOSUB                 (Subtitles: TSubtitles; const FileName: String; From: Integer = -1; UpTo: Integer = -1)                    : Boolean;
function SubtitlesToFile_KARAOKELYRICSLRC        (Subtitles: TSubtitles; const FileName: String; From: Integer = -1; UpTo: Integer = -1)                    : Boolean;
function SubtitlesToFile_KARAOKELYRICSVKT        (Subtitles: TSubtitles; const FileName: String; From: Integer = -1; UpTo: Integer = -1)                    : Boolean;
function SubtitlesToFile_MACDVDSTUDIOPRO         (Subtitles: TSubtitles; const FileName: String; const FPS: Single; From: Integer = -1; UpTo: Integer = -1) : Boolean;
function SubtitlesToFile_MACSUB                  (Subtitles: TSubtitles; const FileName: String; const FPS: Single; From: Integer = -1; UpTo: Integer = -1) : Boolean;
function SubtitlesToFile_MICRODVD                (Subtitles: TSubtitles; const FileName: String; const FPS: Single; From: Integer = -1; UpTo: Integer = -1) : Boolean;
function SubtitlesToFile_MPLAYER                 (Subtitles: TSubtitles; const FileName: String; const FPS: Single; From: Integer = -1; UpTo: Integer = -1) : Boolean;
function SubtitlesToFile_MPLAYER2                (Subtitles: TSubtitles; const FileName: String; From: Integer = -1; UpTo: Integer = -1)                    : Boolean;
function SubtitlesToFile_MPSUB                   (Subtitles: TSubtitles; const FileName: String; From: Integer = -1; UpTo: Integer = -1)                    : Boolean;
function SubtitlesToFile_OVRSCRIPT               (Subtitles: TSubtitles; const FileName: String; From: Integer = -1; UpTo: Integer = -1)                    : Boolean;
function SubtitlesToFile_PANIMATOR               (Subtitles: TSubtitles; const FileName: String; From: Integer = -1; UpTo: Integer = -1)                    : Boolean;
function SubtitlesToFile_PHILIPSSVCD             (Subtitles: TSubtitles; const FileName: String; From: Integer = -1; UpTo: Integer = -1)                    : Boolean;
function SubtitlesToFile_PHOENIXJAPANIMATION     (Subtitles: TSubtitles; const FileName: String; const FPS: Single; From: Integer = -1; UpTo: Integer = -1) : Boolean;
function SubtitlesToFile_PINNACLEIMPRESSION      (Subtitles: TSubtitles; const FileName: String; const FPS: Single; From: Integer = -1; UpTo: Integer = -1) : Boolean;
function SubtitlesToFile_POWERDIVX               (Subtitles: TSubtitles; const FileName: String; From: Integer = -1; UpTo: Integer = -1)                    : Boolean;
function SubtitlesToFile_POWERPIXEL              (Subtitles: TSubtitles; const FileName: String; From: Integer = -1; UpTo: Integer = -1)                    : Boolean;
function SubtitlesToFile_QUICKTIMETEXT           (Subtitles: TSubtitles; const FileName: String; From: Integer = -1; UpTo: Integer = -1)                    : Boolean;
function SubtitlesToFile_REALTIME                (Subtitles: TSubtitles; const FileName: String; From: Integer = -1; UpTo: Integer = -1)                    : Boolean;
function SubtitlesToFile_SAMI                    (Subtitles: TSubtitles; const FileName: String; From: Integer = -1; UpTo: Integer = -1)                    : Boolean;
function SubtitlesToFile_SASAMISCRIPT            (Subtitles: TSubtitles; const FileName: String; From: Integer = -1; UpTo: Integer = -1)                    : Boolean;
function SubtitlesToFile_SBT                     (Subtitles: TSubtitles; const FileName: String; From: Integer = -1; UpTo: Integer = -1)                    : Boolean;
function SubtitlesToFile_SCANTITLE               (Subtitles: TSubtitles; const FileName: String; From: Integer = -1; UpTo: Integer = -1)                    : Boolean;  // by Bedazzle 2005.11.18
function SubtitlesToFile_SOFNI                   (Subtitles: TSubtitles; const FileName: String; From: Integer = -1; UpTo: Integer = -1)                    : Boolean;
function SubtitlesToFile_SOFTITLERRTF            (Subtitles: TSubtitles; const FileName: String; From: Integer = -1; UpTo: Integer = -1)                    : Boolean;
function SubtitlesToFile_SONICDVD                (Subtitles: TSubtitles; const FileName: String; const FPS: Single; From: Integer = -1; UpTo: Integer = -1) : Boolean;
function SubtitlesToFile_SONICSCENARIST          (Subtitles: TSubtitles; const FileName: String; const FPS: Single; From: Integer = -1; UpTo: Integer = -1) : Boolean;
function SubtitlesToFile_SPRUCEDVDMAESTRO        (Subtitles: TSubtitles; const FileName: String; const FPS: Single; From: Integer = -1; UpTo: Integer = -1) : Boolean;
function SubtitlesToFile_SPRUCESUBTITLEFILE      (Subtitles: TSubtitles; const FileName: String; const FPS: Single; From: Integer = -1; UpTo: Integer = -1) : Boolean;
function SubtitlesToFile_SSTPLAYER               (Subtitles: TSubtitles; const FileName: String; From: Integer = -1; UpTo: Integer = -1)                    : Boolean;
function SubtitlesToFile_SSTSCRIPT               (Subtitles: TSubtitles; const FileName: String; From: Integer = -1; UpTo: Integer = -1)                    : Boolean;
function SubtitlesToFile_SUBCREATOR1X            (Subtitles: TSubtitles; const FileName: String; From: Integer = -1; UpTo: Integer = -1)                    : Boolean;
function SubtitlesToFile_SUBRIP                  (Subtitles: TSubtitles; const FileName: String; From: Integer = -1; UpTo: Integer = -1)                    : Boolean;
//function SubtitlesToFile_SUBRIP_W                (Subtitles: TSubtitles; const FileName: String; From: Integer = -1; UpTo: Integer = -1)                    : Boolean;  // by Bedazzle 2011.09.19
function SubtitlesToFile_SUBSONIC                (Subtitles: TSubtitles; const FileName: String; From: Integer = -1; UpTo: Integer = -1)                    : Boolean;
function SubtitlesToFile_SUBSTATIONALPHA         (Subtitles: TSubtitles; const FileName: String; From: Integer = -1; UpTo: Integer = -1)                    : Boolean;
function SubtitlesToFile_SUBVIEWER1              (Subtitles: TSubtitles; const FileName: String; From: Integer = -1; UpTo: Integer = -1)                    : Boolean;
function SubtitlesToFile_SUBVIEWER2              (Subtitles: TSubtitles; const FileName: String; From: Integer = -1; UpTo: Integer = -1)                    : Boolean;
function SubtitlesToFile_TIMEDTEXT               (Subtitles: TSubtitles; const FileName: String; From: Integer = -1; UpTo: Integer = -1)                    : Boolean;  // by URUWorks 2007.12.22
//function SubtitlesToFile_TITLEVISIONTXT          (Subtitles: TSubtitles; const FileName: String; From: Integer = -1; UpTo: Integer = -1)                    : Boolean;
function SubtitlesToFile_TMPLAYER                (Subtitles: TSubtitles; const FileName: String; From: Integer = -1; UpTo: Integer = -1)                    : Boolean;
function SubtitlesToFile_TURBOTITLER             (Subtitles: TSubtitles; const FileName: String; From: Integer = -1; UpTo: Integer = -1)                    : Boolean;
function SubtitlesToFile_ULEADDVDWORKSHOP2       (Subtitles: TSubtitles; const FileName: String; const FPS: Single; alternative: boolean; From: Integer = -1; UpTo: Integer = -1) : Boolean;
function SubtitlesToFile_VIPLAY                  (Subtitles: TSubtitles; const FileName: String; From: Integer = -1; UpTo: Integer = -1)                    : Boolean;
function SubtitlesToFile_WINCAPSTEXTTIMECODED    (Subtitles: TSubtitles; const FileName: String; const FPS: Single; From: Integer = -1; UpTo: Integer = -1) : Boolean;  // by Bedazzle 2007.07.04
function SubtitlesToFile_YOUTUBE                 (Subtitles: TSubtitles; const FileName: String; From: Integer = -1; UpTo: Integer = -1)                    : Boolean;  // by Bedazzle 2011.09.14
function SubtitlesToFile_ZEROG                   (Subtitles: TSubtitles; const FileName: String; From: Integer = -1; UpTo: Integer = -1)                    : Boolean;

type
  TDVDSubtitleAttributes = record
    Assigned : Boolean;
    DiskId   : String;
    DVDTitle : String;
    Language : String;
    Author   : String;
    Web      : String;
    Info     : String;
    License  : String;
  end;

  TSAMIAttributes = record
    Assigned        : Boolean;
    FontName        : String;
    FontSize        : Integer;
    Bold            : Boolean;
    Italic          : Boolean;
    Underline       : Boolean;
    SubColor        : String;
    BackgroundColor : String;
    Align           : String;
  end;

  TSonicScenaristAttributes = record
    Assigned  : Boolean;
    PAL       : Boolean;
    DropFrame : Boolean;
    Color0    : Integer;
    Color1    : Integer;
    Color2    : Integer;
    Color3    : Integer;
    Contrast0 : Integer;
    Contrast1 : Integer;
    Contrast2 : Integer;
    Contrast3 : Integer;
  end;

  TSubViewer1Attributes = record
    Assigned : Boolean;
    Title    : String;
    Author   : String;
    Source   : String;
    Programa : String;
    Path     : String;
    Delay    : Integer;
  end;

  TSubViewer2Attributes = record
    Assigned  : Boolean;
    Title     : String;
    Author    : String;
    Source    : String;
    Programa  : String;
    Path      : String;
    Delay     : Integer;
    CDTrack   : Integer;
    Comment   : String;
    FontName  : String;
    FontSize  : Integer;
    Bold      : Boolean;
    Italic    : Boolean;
    Underline : Boolean;
    StrikeOut : Boolean;
    FontColor : Integer;
  end;

  TSSAAttributes = record
    Assigned       : Boolean;
    Title          : String;
    Script         : String;
    Collisions     : String;  //added by adenry 11.08.2013
    PlayResX       : Integer; //added by adenry 11.08.2013
    PlayResY       : Integer; //added by adenry 11.08.2013
    Timer          : String;  //added by adenry 11.08.2013
    FontName       : String;
    FontSize       : Integer;
    Bold           : Boolean;
    Italic         : Boolean;
    BorderStyle    : Integer;
    PrimaryColor   : Integer;
    SecondaryColor : Integer;
    OutlineColour  : Integer; //TertiaryColor //renamed by adenry 11.08.2013
    ShadowColor    : Integer; //BackColour
    Outline        : Integer; // From 0 to 4
    Shadow         : Integer; // "         "
    Alignment      : Integer;
    // Margins
    MarginL        : Integer;
    MarginR        : Integer;
    MarginV        : Integer;
    Encoding       : Integer;
    //ASS only, added by adenry 11.08.2013
    Underline      : Boolean;
    StrikeOut      : Boolean;
    ScaleX         : Integer;
    ScaleY         : Integer;
    Spacing        : Integer;
    Angle          : String;
  end;

  TTMplayerAttributes = record
    Assigned     : Boolean;
    TypeOfFormat : ShortInt;
  end;

  //added by adenry 2013.08.09
  TXASAttributes = record
    Assigned          : Boolean;
    //Font
    FontName          : String;
    FontSize          : Integer;
    FontSizeInPercent : Boolean;
    TextColor         : Integer;
    Shadow            : Boolean;
    ShadowColor       : Integer;
    Transparency      : Byte;
    //Position
    X                 : Integer;
    Y                 : Integer;
    Width             : Integer;
    Height            : Integer;
    XInPercent        : Boolean;
    YInPercent        : Boolean;
    WidthInPercent    : Boolean;
    HeightInPercent   : Boolean;
    Alignment         : Byte;
    //Language
    Encoding          : String;
    Language          : String;
    //Join
    JoinShortLines    : Boolean;
    WrapLines         : Boolean;
    WrapLinesValue    : Byte;
  end;

var
  ASSAttributes            : TSSAAttributes;
  DVDSubtitleAttributes    : TDVDSubtitleAttributes;
  SAMIAttributes           : TSAMIAttributes;
  SonicScenaristAttributes : TSonicScenaristAttributes;
  SubViewer1Attributes     : TSubViewer1Attributes;
  SubViewer2Attributes     : TSubViewer2Attributes;
  SSAAttributes            : TSSAAttributes;
  TMPlayerAttributes       : TTMPlayerAttributes;
  XASAttributes            : TXASAttributes; //added by adenry 2013.08.09

// -----------------------------------------------------------------------------

implementation

// -----------------------------------------------------------------------------

function SubtitlesToFile(Subtitles: TSubtitles; const FileName: String; const FPS: Single; const SubtitleFormat: TSubtitleFormats; From: Integer = -1; UpTo: Integer = -1): Boolean;
begin
  Result := False;
  if not Assigned(Subtitles) then exit;

  if From = -1 then From := 0;
  if UpTo = -1 then UpTo := Subtitles.Count-1;

  if FileExists(FileName) and FileIsReadOnly(FileName) then
    Exit;

  if Subtitles.Count > 0 then
  begin
    case SubtitleFormat of
      sfAdobeEncoreDVD          : Result := SubtitlesToFile_ADOBEENCOREDVD(Subtitles, FileName, FPS, From, UpTo);
      sfAdobeEncoreDVDNTSC      : Result := SubtitlesToFile_ADOBEENCOREDVDNTSC(Subtitles, FileName, FPS, From, UpTo); //added by adenry 2013.04.11
      sfAdobeEncoreDVDPAL       : Result := SubtitlesToFile_ADOBEENCOREDVDPAL(Subtitles, FileName, FPS, From, UpTo);  //added by adenry 2013.04.11
      sfAdvancedSubStationAlpha : Result := SubtitlesToFile_ADVANCEDSUBSTATIONALPHA(Subtitles, FileName, From, UpTo);
      sfAdvancedSubtitlesXAS    : Result := SubtitlesToFile_ADVANCEDSUBTITLESXAS(Subtitles, FileName, From, UpTo);     // by Bedazzle 2007.01.26
      sfAQTitle                 : Result := SubtitlesToFile_AQTITLE(Subtitles, FileName, FPS, From, UpTo);
      sfCaptions32              : Result := SubtitlesToFile_CAPTIONS32(Subtitles, FileName, From, UpTo);
      sfCaptionsDat             : Result := SubtitlesToFile_CAPTIONSDAT(Subtitles, FileName, From, UpTo);
      sfCaptionsDatText         : Result := SubtitlesToFile_CAPTIONSDATTEXT(Subtitles, FileName, From, UpTo);
      sfCaptionsInc             : Result := SubtitlesToFile_CAPTIONSINC(Subtitles, FileName, From, UpTo);
      sfCavena                  : Result := SubtitlesToFile_CAVENA(Subtitles, FileName, From, UpTo);    // by Bedazzle 2007.05.13
      sfCheetah                 : Result := SubtitlesToFile_CHEETAH(Subtitles, FileName, From, UpTo);
      sfCPC600                  : Result := SubtitlesToFile_CPC600(Subtitles, FileName, From, UpTo);
      sfDKS                     : Result := SubtitlesToFile_DKS(Subtitles, FileName, From, UpTo);
      sfDVDJunior               : Result := SubtitlesToFile_DVDJUNIOR(Subtitles, FileName, From, UpTo);
      sfDVDSubtitleSystem       : Result := SubtitlesToFile_DVDSUBTITLESYSTEM(Subtitles, FileName, From, UpTo);
      sfDVDSubtitle             : Result := SubtitlesToFile_DVDSUBTITLE(Subtitles, FileName, From, UpTo);
      sfFABSubtitler            : Result := SubtitlesToFile_FABSUBTITLER(Subtitles, FileName, FPS, From, UpTo);
      sfIAuthor                 : Result := SubtitlesToFile_IAUTHOR(Subtitles, FileName, From, UpTo);
      sfInscriberCG             : Result := SubtitlesToFile_INSCRIBERCG(Subtitles, FileName, From, UpTo);
      sfJACOSub                 : Result := SubtitlesToFile_JACOSUB(Subtitles, FileName, From, UpTo);
      sfKaraokeLyricsLRC        : Result := SubtitlesToFile_KARAOKELYRICSLRC(Subtitles, FileName, From, UpTo);
      sfKaraokeLyricsVKT        : Result := SubtitlesToFile_KARAOKELYRICSVKT(Subtitles, FileName, From, UpTo);
      sfMACDVDStudioPro         : Result := SubtitlesToFile_MACDVDSTUDIOPRO(Subtitles, FileName, FPS, From, UpTo);
      sfMacSUB                  : Result := SubtitlesToFile_MACSUB(Subtitles, FileName, FPS, From, UpTo);
      sfMicroDVD                : Result := SubtitlesToFile_MICRODVD(Subtitles, FileName, FPS, From, UpTo);
      sfMPlayer                 : Result := SubtitlesToFile_MPLAYER(Subtitles, FileName, FPS, From, UpTo);
      sfMPlayer2                : Result := SubtitlesToFile_MPLAYER2(Subtitles, FileName, From, UpTo);
      sfMPSub                   : Result := SubtitlesToFile_MPSUB(Subtitles, FileName, From, UpTo);
      sfOVRScript               : Result := SubtitlesToFile_OVRSCRIPT(Subtitles, FileName, From, UpTo);
      sfPanimator               : Result := SubtitlesToFile_PANIMATOR(Subtitles, FileName, From, UpTo);
      sfPhilipsSVCD             : Result := SubtitlesToFile_PHILIPSSVCD(Subtitles, FileName, From, UpTo);
      sfPhoenixJS               : Result := SubtitlesToFile_PHOENIXJAPANIMATION(Subtitles, FileName, FPS, From, UpTo);
      sfPinnacleImpression      : Result := SubtitlesToFile_PINNACLEIMPRESSION(Subtitles, FileName, FPS, From, UpTo);
      sfPowerDivX               : Result := SubtitlesToFile_POWERDIVX(Subtitles, FileName, From, UpTo);
      sfPowerPixel              : Result := SubtitlesToFile_POWERPIXEL(Subtitles, FileName, From, UpTo);
      sfQuickTimeText           : Result := SubtitlesToFile_QUICKTIMETEXT(Subtitles, FileName, From, UpTo);
      sfRealTime                : Result := SubtitlesToFile_REALTIME(Subtitles, FileName, From, UpTo);
      sfSAMI                    : Result := SubtitlesToFile_SAMI(Subtitles, FileName, From, UpTo);
      sfSasamiScript            : Result := SubtitlesToFile_SASAMISCRIPT(Subtitles, FileName, From, UpTo);
      sfSBT                     : Result := SubtitlesToFile_SBT(Subtitles, FileName, From, UpTo);
      sfScantitle               : Result := SubtitlesToFile_SCANTITLE(Subtitles, FileName, From, UpTo);   // by Bedazzle 2005.11.18
      sfSofni                   : Result := SubtitlesToFile_SOFNI(Subtitles, FileName, From, UpTo);
      sfSoftitlerRTF            : Result := SubtitlesToFile_SOFTITLERRTF(Subtitles, FileName, From, UpTo);
      sfSonicDVD                : Result := SubtitlesToFile_SONICDVD(Subtitles, FileName, FPS, From, UpTo);
      sfSonicScenarist          : Result := SubtitlesToFile_SONICSCENARIST(Subtitles, FileName, FPS, From, UpTo);
      sfSpruceDVDMaestro        : Result := SubtitlesToFile_SPRUCEDVDMAESTRO(Subtitles, FileName, FPS, From, UpTo);
      sfSpruceSubtitleFile      : Result := SubtitlesToFile_SPRUCESUBTITLEFILE(Subtitles, FileName, FPS, From, UpTo);
      sfSSTPlayer               : Result := SubtitlesToFile_SSTPLAYER(Subtitles, FileName, From, UpTo);
      sfSSTScript               : Result := SubtitlesToFile_SSTSCRIPT(Subtitles, FileName, From, UpTo);
      sfSubCreator              : Result := SubtitlesToFile_SUBCREATOR1X(Subtitles, FileName, From, UpTo);
      sfSubRip                  : Result := SubtitlesToFile_SUBRIP(Subtitles, FileName, From, UpTo);
//      sfSubRipW                 : Result := SubtitlesToFile_SUBRIP_W(Subtitles, FileName, From, UpTo);
      sfSubSonic                : Result := SubtitlesToFile_SUBSONIC(Subtitles, FileName, From, UpTo);
      sfSubStationAlpha         : Result := SubtitlesToFile_SUBSTATIONALPHA(Subtitles, FileName, From, UpTo);
      sfSubViewer1              : Result := SubtitlesToFile_SUBVIEWER1(Subtitles, FileName, From, UpTo);
      sfSubViewer2              : Result := SubtitlesToFile_SUBVIEWER2(Subtitles, FileName, From, UpTo);
      sfTimedText               : Result := SubtitlesToFile_TIMEDTEXT(Subtitles, FileName, From, UpTo);
      //sfTitlevisionTXT          : Result := SubtitlesToFile_TITLEVISIONTXT(Subtitles, FileName, From, UpTo);
      sfTMPlayer                : Result := SubtitlesToFile_TMPLAYER(Subtitles, FileName, From, UpTo);
      sfTurboTitler             : Result := SubtitlesToFile_TURBOTITLER(Subtitles, FileName, From, UpTo);
      sfUleadDVDWorkshop2       : Result := SubtitlesToFile_ULEADDVDWORKSHOP2(Subtitles, FileName, FPS, FALSE, From, UpTo);
      sfUleadDVDWorkshop2a      : Result := SubtitlesToFile_ULEADDVDWORKSHOP2(Subtitles, FileName, FPS, TRUE, From, UpTo);
      sfViPlay                  : Result := SubtitlesToFile_VIPLAY(Subtitles, FileName, From, UpTo);
      sfWincapsTextTimecoded    : Result := SubtitlesToFile_WINCAPSTEXTTIMECODED(Subtitles, FileName, FPS, From, UpTo);
      sfYoutube                 : Result := SubtitlesToFile_YOUTUBE(Subtitles, FileName, From, UpTo);
      sfZeroG                   : Result := SubtitlesToFile_ZEROG(Subtitles, FileName, From, UpTo);
    end;
  end;
end;

// -----------------------------------------------------------------------------

{$include SaveFormats/FSave_ADOBEENCOREDVD}
{$include SaveFormats/FSave_ADOBEENCOREDVDNTSC}
{$include SaveFormats/FSave_ADOBEENCOREDVDPAL}
{$include SaveFormats/FSave_ADVANCEDSUBSTATIONALPHA}
{$include SaveFormats/FSave_ADVANCEDSUBTITLESXAS}
{$include SaveFormats/FSave_AQTITLE}
{$include SaveFormats/FSave_CAPTIONS32}
{$include SaveFormats/FSave_CAPTIONSDAT}
{$include SaveFormats/FSave_CAPTIONSDATTEXT}
{$include SaveFormats/FSave_CAPTIONSINC}
{$include SaveFormats/FSave_CAVENA}
{$include SaveFormats/FSave_CHEETAH}
{$include SaveFormats/FSave_CPC600}
{$include SaveFormats/FSave_DKS}
{$include SaveFormats/FSave_DVDJUNIOR}
{$include SaveFormats/FSave_DVDSUBTITLE}
{$include SaveFormats/FSave_DVDSUBTITLESYSTEM}
{$include SaveFormats/FSave_FABSUBTITLER}
{$include SaveFormats/FSave_IAUTHOR}
{$include SaveFormats/FSave_INSCRIBERCG}
{$include SaveFormats/FSave_JACOSUB}
{$include SaveFormats/FSave_KARAOKELYRICSLRC}
{$include SaveFormats/FSave_KARAOKELYRICSVKT}
{$include SaveFormats/FSave_MACDVDSTUDIOPRO}
{$include SaveFormats/FSave_MACSUB}
{$include SaveFormats/FSave_MICRODVD}
{$include SaveFormats/FSave_MPLAYER}
{$include SaveFormats/FSave_MPLAYER2}
{$include SaveFormats/FSave_MPSUB}
{$include SaveFormats/FSave_OVRSCRIPT}
{$include SaveFormats/FSave_PANIMATOR}
{$include SaveFormats/FSave_PHILIPSSVCD}
{$include SaveFormats/FSave_PHOENIXJAPANIMATION}
{$include SaveFormats/FSave_PINNACLEIMPRESSION}
{$include SaveFormats/FSave_POWERDIVX}
{$include SaveFormats/FSave_POWERPIXEL}
{$include SaveFormats/FSave_QUICKTIMETEXT}
{$include SaveFormats/FSave_REALTIME}
{$include SaveFormats/FSave_SAMI}
{$include SaveFormats/FSave_SASAMISCRIPT}
{$include SaveFormats/FSave_SBT}
{$include SaveFormats/FSave_SCANTITLE}
{$include SaveFormats/FSave_SOFNI}
{$include SaveFormats/FSave_SOFTITLERRTF}
{$include SaveFormats/FSave_SONICDVD}
{$include SaveFormats/FSave_SONICSCENARIST}
{$include SaveFormats/FSave_SPRUCEDVDMAESTRO}
{$include SaveFormats/FSave_SPRUCESUBTITLEFILE}
{$include SaveFormats/FSave_SSTPLAYER}
{$include SaveFormats/FSave_SSTSCRIPT}
{$include SaveFormats/FSave_SUBCREATOR1X}
{$include SaveFormats/FSave_SUBRIP}
//{$include SaveFormats/FSave_SUBRIP_W}
{$include SaveFormats/FSave_SUBSONIC}
{$include SaveFormats/FSave_SUBSTATIONALPHA}
{$include SaveFormats/FSave_SUBVIEWER1}
{$include SaveFormats/FSave_SUBVIEWER2}
{$include SaveFormats/FSave_TIMEDTEXT}
//{$include SaveFormats/FSave_TITLEVISIONTXT}
{$include SaveFormats/FSave_TMPLAYER}
{$include SaveFormats/FSave_TURBOTITLER}
{$include SaveFormats/FSave_ULEADDVDWORKSHOP2}
{$include SaveFormats/FSave_VIPLAY}
{$include SaveFormats/FSave_WINCAPSTEXTTIMECODED}
{$include SaveFormats/FSave_YOUTUBE}
{$include SaveFormats/FSave_ZEROG}

end.
