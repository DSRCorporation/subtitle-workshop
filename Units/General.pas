// This file is part of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle Workshop's copyright information
// File Description: File handling and general functionality

unit General;

interface

uses
  Forms, Windows, Classes, SysUtils, Controls, StdCtrls, Mask, Menus, IniFiles, Dialogs, Graphics, Messages, ClipBrd, ExtCtrls, Math, //Dialogs, Graphics, Messages, ClipBrd, ExtCtrls, Math added by adenry
  VirtualTrees,
  FastStrings,
  USubtitleAPI, CommonTypes;

// -----------------------------------------------------------------------------

const
  ID_PROGRAM      = 'Subtitle Workshop';
  ID_VERSION      = '6.0b';
  ID_BUILD        = '131121';
  ID_FULLVERSION  = ID_VERSION + ' (build ' + ID_BUILD + ')';
  ID_EMAIL        = 'subtitleworkshop@gmail.com';
  ID_WEBPAGE      = 'http://subworkshop.sf.net';
  ID_DONATIONPAGE = 'https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=974UTRLZU5L6C';
  ID_ININAME      = 'SubtitleWorkshop.ini';
  ID_UPDATEINI    = 'http://subworkshop.sf.net/swupdate.ini';
  ID_DLLNAME      = 'SubtitleAPI.dll';
  ID_DLLDIR       = 'SubtitleAPI';
  ID_CFPDIR       = 'CustomFormats';
  ID_STPEXT       = '.stp';
  ID_SRFEXT       = '.srf';
  ID_OCREXT       = '.ocr';
  ID_SHORTCUTS    = 'shortcuts.key';

  SpecialChars  : set of Char = ['¡', '!', '"', '#', '$', '%', '&', '''', '(', ')', '+', '-', '.', '/',
                                 ':', ';', '<', '=', '>', '¿', '?', '@', '[', '\', ']', '^', '_', '`',
                                 '{', '|', '}', '~', '€', '‚', 'ƒ', '„', '…', '†', '‡', 'ˆ', '‰', '‹',// '«', '»', //last two added by adenry
                                 '‘', '’', '“', '”', '•', '-', '—', '˜', '™', '›', #13, #10, ' ', ',']; //',' added by adenry

  Alphanumeric: set of Char = ['a'..'z', 'A'..'Z', '0'..'9']; //added by adenry
  HexChars: set of Char = ['A'..'F', 'a'..'f' , '0'..'9']; //added by adenry
  NumDelimiterChars : set of Char = ['.', ',', ':', '-', '+', '=', '^']; //added by adenry

  //added by adenry: begin
  VideoExtsGroups: array [1..22] of array[1..2] of String = (
    ('3GP', '3gp,3g2,3gp2,3gpp,k3g'),
    ('AMV', 'amv'),
    ('Advanced Systems Format', 'asf'),
    ('Audio Video Interleave', 'avi'),
    ('Avisynth', 'avs'),
    ('DivX', 'divx'),
    ('Flash video', 'flv,f4v'),
    ('Google Video Files', 'gvi'),
    ('High-Definition Video', 'm2t'),
    ('Matroska', 'mkv'),
    ('MPEG', 'mpg,mpeg,m1v,mp2v,mpe,mpv2'),
    ('MPEG-2 Transport Stream', 'm2ts,mts,ts'),
    ('MPEG-4', 'mp4'),
    ('MTV','mtv'),
    ('Nullsoft Streaming Video','nsv'),
    ('Ogg Video', 'ogm,ogv'),
    ('QuickTime', 'qt,mov,hdmov'),
    ('RealMedia','rm,rmvb,rv'),
    ('Sony Movie', 'mqv'),
    ('Video Object', 'vob'),
    ('WebM','webm'),
    ('Windows Media Video', 'wmv,wm')
  );
  AudioExtsGroups: array [1..10] of array[1..2] of String = (
    ('Advanced Audio Coding','aac'),
    ('AC3','ac3'),
    ('Digital Theater Systems','dts'),
    ('Free Lossless Audio Codec','flac'),
    ('MIDI','mid'),
    ('MPEG Audio Layer 3', 'mp3'),
    ('OGG', 'ogg'),
    ('RealMedia Audio', 'ra'),
    ('Waveform Audio File', 'wav,wave'),
    ('Windows Media Audio', 'wma')
  );
  //added by adenry: end

  Abbreviations: array [1..12] of String = ('Mr', 'Mrs', 'Ms', 'Dr', 'St', 'Prof', 'Gen', 'Rep', 'Sen', 'Messrs', 'Drs', 'Mmes'); //added by adenry

  //added by adenry: begin
  TopLevelDomains = ',com,org,info,aero,biz,coop,int,mobi,tel,xxx,edu,gov,mil'
                  + ',ac,ad,ae,af,ag,ai,al,am,ao,aq,ar,au,aw,ax,az,ba,bb,bd,bf,bg,bh,bj,bm,bn,bo,br,bs,bt,bv,bw,by,bz,ca,cc,cd,cf,cg,ch,ci,ck,cl,cm,cn,co,cr,cs,cu,cv,cx,cy,cz,dd,de,dk,dm,dz,ec,ee,eg,eh,er,es,et,eu,fi,fj,fk,fm,fo,fr'
                  + ',ga,gb,gd,ge,gf,gh,gi,gl,gm,gn,gp,gq,gr,gs,gt,gu,gw,gy,hk,hm,hr,ht,hu,ie,il,im,io,ir,je,jm,jo,jp,ke,kg,kh,ki,km,kn,kp,kr,kw,ky,kz,la,lb,lc,li,lk,lr,ls,lt,lu,lv,ly,ma,mc,md,me,mg,mh,mk,ml,mm,mn,mo,mp,mq,mt,mu,mv,mw,mz,na,nc,ne,nf,ng,ni,np,nr,nu,nz'
                  + ',om,pa,pe,pf,pg,ph,pk,pl,pm,pn,pr,ps,pt,pw,py,qa,re,ro,rs,ru,rw,sa,sb,sc,sd,se,sg,sh,si,sj,sk,sl,sm,sn,so,sr,ss,st,su,sv,sx,sy,sz,tc,td,tf,tg,th,tj,tk,tl,tm,tn,tp,tr,tt,tw,tz,ua,ug,uy,uz,va,vc,ve,vg,vi,vn,vu,wf,ws,ye,yt,yu,za,zm,zw,';
  TopLevelDomainsWords = ',net,asia,cat,jobs,museum,name,post,pro,travel' + ',an,as,at,be,do,in,is,it,mr,ms,my,no,to,'; //TLDs that are also words
  TopLevelDomainsWordsUppercase = ',dj,id,iq,tv,uk,us,'; //TLDs that are also words that are most likely written with uppercase letters
  //added by adenry: end

  //ID_TIMEOVERLAPPRECISION = 35;
  EffectFlash = 1;
  EffectType  = 2;
  MAX_TIME    = 86399999; //23:59:59,999 //added by adenry
  EPSILON     = 0.0000001; //added by adenry
  EMPTY_SUBTITLE = '- empty subtitle -'; //added by adenry
  UNTRANSLATED_SUBTITLE = '- Untranslated subtitle -';

  //added by adenry: begin
  PauseErrors: TErrorTypeSet = [etTooShortPause] + [etOverlapping]; //added later
  TimeErrors : TErrorTypeSet = [etTooMuchCPS] + [etRepeatedSubtitle] + [etOverlapping] + [etBadValues] + [etTooLongDuration] + [etTooShortDuration] + [etTooShortPause];
  TextErrors : TErrorTypeSet = [etTooMuchCPS] + [etRepeatedSubtitle] + [etLinesWithoutLetters] + [etEmptySubtitle] + [etTooLongLine] + [etOverTwoLines] + [etHearingImpaired] + [etTextBeforeColon] + [etUnnecessaryDots] + [etProhibitedCharacter] + [etRepeatedCharacter] + [etOCRErrors] + [etOpnDlgSubsOneLine] + [etSpaceAfterCustChars] + [etSpaceBeforeCustChars] + [etUnnecessarySpaces] + [etUnnecessaryTags] + [etDashOnFirstLine] + [etDialogueOnOneLine];
  AllErrors  : TErrorTypeSet = [etTooMuchCPS] + [etRepeatedSubtitle] + [etOverlapping] + [etBadValues] + [etTooLongDuration] + [etTooShortDuration] + [etTooShortPause]
                                                                     + [etLinesWithoutLetters] + [etEmptySubtitle] + [etTooLongLine] + [etOverTwoLines] + [etHearingImpaired] + [etTextBeforeColon] + [etUnnecessaryDots] + [etProhibitedCharacter] + [etRepeatedCharacter] + [etOCRErrors] + [etOpnDlgSubsOneLine] + [etSpaceAfterCustChars] + [etSpaceBeforeCustChars] + [etUnnecessarySpaces] + [etUnnecessaryTags] + [etDashOnFirstLine] + [etDialogueOnOneLine];
  //added by adenry: end

// -----------------------------------------------------------------------------

// ---------------
// File handling
// ---------------
function LoadSubtitle(const FileName: String; FPS: Single; SubtitleFormat: Integer = 0; TranslatedFile: Boolean = False; EnableControls: Boolean = True): Boolean; //procedure converted to a function by adenry
function LoadPlainText(const FileName: String; Translation: Boolean = False): Boolean; //procedure converted to a function by adenry //Translation added by adenry
function LoadSRF(const FileName: String; Translation: Boolean = False): Boolean; // URUSoft Subtitle Report file //procedure converted to a function by adenry //Translation added by adenry
// ---------------
function SaveFile(FileName: WideString; FormatIndex: Integer; FPS: Single): Boolean;
procedure SaveMarking(markingFile, subFile: String); //added by adenry
procedure LoadMarking(markingFile: String); //added by adenry
// ---------------
procedure ReadTextsAndTimesFromFile(FileName: String; SubFormat: Integer; Times, Texts: Boolean);
procedure LoadProject(const FileName: String);
function CloseSub: Boolean;
function AskToSaveFile: Boolean;
// ---------------
procedure GetCustomFormatInfo(const FileName: String; var Name, Extension, NewLineChar, TimeStructure: String; var Time, Frames: Boolean; var FPS: Single; Lines: TStrings);
procedure SaveCustomFormat(SavePathNameExt: String; FormatLines: TStrings; Time, Frames: Boolean; TimeStruct: String; FPS: Single; NewLineChar: String);
// ---------------
procedure CommandLineProcess(Cli: String);
// ---------------
// Translator Mode
// ---------------
procedure SetUntranslated;
procedure SetTranslatorMode(const Flag: Boolean; SaveColsWidth: Boolean = True; ShowLeftPanel: Boolean = True);
// --------------------------------
// Smart Line Adjust text handling
// --------------------------------
function WrapTextEqualLines(Text, BreakStr: String; const BreakChars: TSysCharSet; MaxCol: Integer; OnlyIfTooLong: Boolean = True): String; //added by adenry
function SmartWrapText(Text: String; FontCharset: TFontCharset; MaxCol: Integer; BreakOnPunctMarksOnly: Boolean = False; ForcedWrap: Boolean = True; OnlyIfTooLong: Boolean = True): String; //added by adenry
function BreakTextInTheMiddle(Text: String; UseAltBreakPoint: Boolean = False; ForceBreakIfNecessary: Boolean = True): String; //added by adenry
function FastSmartLineAdjust(org: String; FontCharset: TFontCharset): String; //added by adenry
function FindBetterBreakPoint(Text: String; FontCharset: TFontCharset; MaxCol: Integer; OnlyIfOrigBrPointNotASpecialChar: Boolean = False; AlwaysChange: Boolean = False): String; //added by adenry
function IsNoRegularDot(Text: String; n: Integer; SpaceAfterDotCheck: Boolean = False): Boolean; //added by adenry
function IsDotInWebsiteAddress(Text: String; n: Integer): Boolean; //added by adenry
function IsAbbrSpace(Text: String; n: Integer): Boolean; //added by adenry
// ---------------
// Text fixing
// ---------------
function FixSpaces(Text: String): String;//added by adenry
function DeleteEmptyLines(Text: String): String; //added by adenry
// ---------------
// Timing rounding
// ---------------
function RoundTimeValue(TimeValue: Cardinal; Factor: Integer; RoundUpward: Boolean = False; RoundDownward: Boolean = False): Cardinal; //added by adenry
procedure RoundSubtitlesValues(RoundFactor: Byte; SelectedOnly: Boolean); //added by adenry
// ---------------
// Charset related
// ---------------
function SetDashes(FontCharset: TFontCharset): TSysCharSet; //added by adenry
function GetActualDefaultCharset: TFontCharset; //added by adenry
// ---------------
// Various
// ---------------
procedure SetFormCaption;
function SetObjectAlignment(index: Integer): TAlignment; //added by adenry
function Rnd(r: Double): LongInt;//added by adenry
function MixColors (C1, C2: TColor; p1: Integer): TColor; //added by adenry
procedure SetCheckedState(const checkBox : TCheckBox; const check: Boolean);//added by adenry
procedure ShowMsg(msg: String); //added by adenry
procedure Note(Text: String); //added by adenry for test purposes
procedure SplitDelimitedString(Delimiter: Char; Str: string; ListOfStrings: TStrings); //added by adenry
function GetVideoFilesFilterString: String; //added by adenry

// -----------------------------------------------------------------------------

var
  SubtitleAPI : TSubtitleAPI;
  // Root of the main ini file
  IniRoot : String;
  Dashes  : set of Char; //added by adenry
  DashCharsets1 : set of TFontCharset; //added by adenry - contain a dash in #150, and #151
  DashCharsets2 : set of TFontCharset; //added by adenry - contain a dash in #150, #151, and #173
  ActualDefaultCharset : TFontCharset; //added by adenry
  VideoExts: TStringList; //added by adenry
  AudioExts: TStringList; //added by adenry
  VideoAudioExts: TStringList; //added by adenry

  // ------------------ //
  //  Language strings  //
  // ------------------ //
  BTN_OK            : String;
  BTN_CANCEL        : String;
  BTN_BROWSE        : String;
  BTN_APPLY         : String;
  BTN_EXIT          : String;
  BTN_YES           : String;
  BTN_NO            : String;
  AllSupportedFiles : String;
  AllFiles          : String; //added by adenry
  // -------------------- //
  //  Arrays of messages  //
  // -------------------- //
  ErrorMsg     : array[1..28] of String; //20 changed to 28 by adenry
  QuestionMsg  : array[1..10] of String; //09 changed to 10 by adenry
  InfoMsg      : array[1..12] of String; //11 changed to 12
  IEMsgBoxes   : array[1..05] of String;
  ErrorReports : array[1..25] of String; //20 changed to 25 by adenry

// -----------------------------------------------------------------------------

implementation

uses
  Functions, Undo, InfoErrorsFunctions, TreeViewHandle, USubtitlesFunctions, VideoPreview, ShortCuts,
  formMain, formSaveAs;

// -----------------------------------------------------------------------------

function LoadSubtitle(const FileName: String; FPS: Single; SubtitleFormat: Integer = 0; TranslatedFile: Boolean = False; EnableControls: Boolean = True): Boolean; //procedure converted to a function by adenry
  //const Exts: array[1..15] of String = ('asf', 'avi', 'avs', 'divx', 'flv', 'm1v', 'mov', 'mp4', 'mpeg', 'mpg', 'mkv', 'ogm', 'qt', 'vob', 'wmv'); //avs, mov, and flv added by adenry //removed by adenry
  procedure FixOverlap;
  var
    Node: PVirtualNode;
  begin
    with frmMain do
    begin
      Node := lstSubtitles.GetFirst.NextSibling;
      while Assigned(Node) do
      begin
        if GetFinalTime(Node.PrevSibling) = GetStartTime(Node) then
          SetStartTime(Node, GetStartTime(Node) + DefaultSubPause);//+ ID_TIMEOVERLAPPRECISION);
        Node := Node.NextSibling;
      end;
    end;
  end;
var
  TempFileName    : String;
  MovieFileName   : String;
  MarkingFileName : String; //added by adenry
  //Ini             : TIniFile; //removed by adenry
  i               : Integer;
  Node            : PVirtualNode; //added by adenry
  Data            : PSubtitleItem; //added by adenry
begin
//added by aenry: begin
Result := False;
//check if the file exists
if FileExists(FileName) = FALSE then
begin
  MsgBox(Format(ErrorMsg[27], [FileName]), BTN_OK, '', '', MB_ICONERROR, frmMain);
end else
//added by aenry: end
begin
  if TranslatedFile = False then
  begin
    if CloseSub = False then exit;
    //frmMain.lstSubtitles.Clear; //removed by adenry - already done in CloseSub
  end;

  //todo: is srf check necessary here?
  if LowerCase(ExtractFileExt(FileName)) = ID_SRFEXT then
  begin
    Result := LoadSRF(FileName, TranslatedFile); //added by adenry
    //removed by adenry: begin
    //Ini := TIniFile.Create(FileName);
    //try
    //  if Ini.SectionExists('URUSoft Subtitle Report File') then
    //    LoadSRF(FileName);
    //finally
    //  Ini.Free;
    //end;
    //removed by adenry: end
  end else //; replaced with ELSE by adenry - bug fix

  with frmMain do
  begin
    Dec(SubtitleFormat, 1);
    if SubtitleFormat < 0 then SubtitleFormat := 0;
    if SubtitleFormat > SubtitleAPI.FormatsCount then SubtitleFormat := 0;
    //SubtitleFormat = 0 is automatic format detection

    if SubtitleAPI.LoadSubtitle(FileName, FPS, SubtitleFormat) = True then
    begin
      dlgLoadFile.InitialDir := ExtractFilePath(FileName);
      AddToRecent(FileName);
      //frmMain.lstSubtitles.BeginUpdate;
      AddArrayItems(TranslatedFile);

      if TranslatedFile = False then
      //ORIGINAL WAS LOADED
      begin
        lstSubtitles.FocusedNode := lstSubtitles.GetFirst;
        lstSubtitles.Selected[lstSubtitles.GetFirst] := True;
        if (SubtitleAPI.IsFrameBased(SubtitleAPI.CurrentFormatIndex)) and (ForceWorkWithTime = False) then
        begin
          rdoModeFrames.Checked := True; //added by adenry
          rdoModeClick(rdoModeFrames); //added by adenry
        end else
        begin
          rdoModeTime.Checked := True; //added by adenry
          rdoModeClick(rdoModeTime); //added by adenry
        end;
        //added by adenry: begin
        //clear EMPTY_SUBTITLE text
        if frmMain.SaveEmptyLines then
        begin
          Node := lstSubtitles.GetFirst;
          while Assigned(Node) do
          begin
            Data := lstSubtitles.GetNodeData(Node);
            if Data.Text = EMPTY_SUBTITLE then
              SetText(Node, '');
            Node := Node.NextSibling;
          end;
        end;
        //added by adenry: end
        OrgFormat   := SubtitleAPI.CurrentFormatIndex;
        OrgFile     := FileName;
        OrgModified := False;
        UndoNumWhenOrgSaved := 0;
      end else

      //TRANSLATION WAS LOADED
      begin
        if TransModified = True then
        begin
          if AskToSaveFile then
          begin
            TransFormat   := SubtitleAPI.CurrentFormatIndex;
            TransFile     := FileName;
            TransModified := False;
          end;
        end else
        begin
          TransFormat   := SubtitleAPI.CurrentFormatIndex;
          TransFile     := FileName;
          TransModified := False;
        end;
        UndoNumWhenTransSaved := 0; //added by adenry
        //added by adenry: begin
        //clear EMPTY_SUBTITLE text
        if frmMain.SaveEmptyLines then
        begin
          Node := lstSubtitles.GetFirst;
          while Assigned(Node) do
          begin
            Data := lstSubtitles.GetNodeData(Node);
            if Data.Translation = EMPTY_SUBTITLE then
              SetTranslation(Node, '');
            Node := Node.NextSibling;
          end;
        end;
        //added by adenry: end
        UpdateSubSubtitleTextAndVisibility; //added by adenry
      end;

      SubtitleAPI.ClearSubtitles; // So we don't waste memory

      ClearUndoList(UndoList);
      ClearUndoList(RedoList);
      setUndoEnabled(False);//modified by adenry //mnuUndo.Enabled := False;
      setRedoEnabled(False); //modified by adenry //mnuRedo.Enabled := False;
      OldInputFPS := FPS;
      OldFPS := FPS;
      frmMain.cmbFPS.ItemIndex := frmMain.cmbInputFPS.ItemIndex;
      SetFormCaption;
      //frmMain.RefreshTimes; //moved from here by adenry
      if EnableControls then
        frmMain.EnableCtrls(True);

      // Fix one unit overlap at load
      if FixOneUnitOverlap then
        FixOverlap;

      //added by adenry: begin
      //Round time values
      if RoundOnLoad then
        RoundSubtitlesValues(frmMain.RoundingFactor, False);
      //added by adenry: end

      if AutoSearchMovie then
      begin
        //for i := Low(Exts) to High(Exts) do //removed by adenry
        for i := 0 to VideoExts.Count - 1 do //added by adenry
          begin
            if StringCount('.', ExtractFileName(FileName)) = 1 then
              MovieFileName := ExtractFilePath(FileName) + Copy(ExtractFileName(FileName), 1, LastDelimiter('.', ExtractFileName(FileName))-1) + '.' + VideoExts[i] else //Exts replaced with VideoExts by adenry
            begin
              TempFileName  := Copy(FileName, 1, LastDelimiter('.', FileName)-1);
              MovieFileName := TempFileName + '.' + VideoExts[i]; //Exts replaced with VideoExts by adenry

              if FileExists(MovieFileName) = False then
              begin
                while (StringCount('.', MovieFileName) > 1) do
                begin
                  if FileExists(MovieFileName) then break;
                  MovieFileName := ExtractFilePath(TempFileName) + Copy(ExtractFileName(TempFileName), 1, LastDelimiter('.', ExtractFileName(TempFileName))-1) + '.' + VideoExts[i]; //Exts replaced with VideoExts by adenry
                  TempFileName := Copy(TempFileName, 1, LastDelimiter('.', TempFileName)-1);
                end;
              end;
            end;
            if FileExists(MovieFileName) = True then break;
          end;

          if FileExists(MovieFileName) then
          begin
            if LoadMovie(MovieFileName) then
              SetVideoPreviewMode(True);
            UpdateSubtitlesPos;
          end;
      end;

      //added by adenry: begin
      //auto load marking
      if MarkingAutoLoad then
      begin
        if FileExists(FileName + ID_SRFEXT) then
          MarkingFileName := FileName + ID_SRFEXT else
          if FileExists(ChangeFileExt(FileName, ID_SRFEXT)) then
            MarkingFileName := ChangeFileExt(FileName, ID_SRFEXT) else
            MarkingFileName := '';
        if MarkingFileName <> '' then
          LoadMarking(MarkingFileName);
      end;
      frmMain.MarkingModified := False; //because we just loaded the file...
      //added by aenry: end

      RefreshTimes; //added by adenry

      Result := True; //added by adenry
    end else
    begin
      if InvalidFPlainText = False then
      begin
        if SubtitleFormat = 0 then
          MsgBox(Format(ErrorMsg[03],[FileName]), BTN_OK, '', '', MB_ICONERROR, frmMain) else
          MsgBox(Format(ErrorMsg[04],[FileName, SubtitleAPI.GetFormatName(SubtitleFormat)]), BTN_OK, '', '', MB_ICONERROR, frmMain);
        SetFormCaption;
      end else
        Result := LoadPlainText(FileName, TranslatedFile); //Result := added by adenry; TranslatedFile added by adenry
    end;
  end;

  if (MarkOnLoad) or (FixOnLoad) then
  begin
    frmMain.Refresh;
    if (MarkOnLoad) and (FixOnLoad) then
    begin
      FixErrors;
      CheckMarkErrors;
      frmMain.RefreshFormInfoErrors; //added by adenry
    end;
    if (FixOnLoad) and (MarkOnLoad = False) then
      FixErrors;
    if (MarkOnLoad) and (FixOnLoad = False) then
    begin
      CheckMarkErrors;
      frmMain.RefreshFormInfoErrors; //added by adenry
    end;
  end;
  frmMain.RefreshFormVariousInfo; //added by adenry

//  frmMain.lstSubtitles.EndUpdate;
end;
end;

// -----------------------------------------------------------------------------

function LoadPlainText(const FileName: String; Translation: Boolean = False): Boolean; //procedure converted to a function by adenry //Translation added by adenry
var
  PlainTxt    : TStringList;
  Node        : PVirtualNode;
  i           : Integer;
  InitialTime : Integer;
  FinalTime   : Integer;
begin
  Result := False;

  InitialTime := 0;
  FinalTime   := frmMain.DefaultSubDuration; //1000 replaced with frmMain.DefaultSubDuration by adenry
  PlainTxt    := TStringList.Create;

  if Translation = FALSE then      //added by adenry
    if CloseSub = False then exit;

  try
    PlainTxt.LoadFromFile(FileName);
    with frmMain do
    begin
      for i := PlainTxt.Count-1 downto 0 do
      begin
        PlainTxt[i] := Trim(PlainTxt[i]);
        if PlainTxt[i] = '' then
          PlainTxt.Delete(i);
      end;
      lstSubtitles.RootNodeCount := PlainTxt.Count;
      dlgLoadFile.InitialDir := ExtractFilePath(FileName);
      
      Node := lstSubtitles.GetFirst;
      while Assigned(Node) do
      begin
        if Translation then                               //added by adenry
          SetTranslation(Node, PlainTxt[Node.Index]) else //added by adenry - if loading a Translation, only load the text, don't change the timing
        begin
          SetText(Node, PlainTxt[Node.Index]);
          //SetText(Node, PlainTxt[Node.Index]); //removed by adenry
          SetStartTime(Node, InitialTime);
          SetFinalTime(Node, FinalTime);
          AddError(Node, []);
          InitialTime := FinalTime + frmMain.DefaultSubPause; //1 replaced with frmMain.DefaultSubPause by adenry
          FinalTime := FinalTime + frmMain.DefaultSubPause + frmMain.DefaultSubDuration; //1001 replaced with frmMain.DefaultSubPause + frmMain.DefaultSubDuration by adenry
        end;
        Node := lstSubtitles.GetNextSibling(Node);
      end;
      if Translation then  //added by adenry
        TransModified := False else
        OrgModified := False;

      if frmMain.mnuTranslatorMode.Checked = FALSE then  //added by adenry later
        MarkingModified := False; //added by adenry

      OldInputFPS := GetInputFPS;
      OldFPS      := GetFPS;
      SetFormCaption;
      RefreshTimes;
      EnableCtrls(True);

      Result := True;

      //added by adenry: begin
      if (FixOnLoad) then
        FixErrors;
      if (MarkOnLoad) then
      begin
        CheckMarkErrors;
        RefreshFormInfoErrors;
      end;
      frmMain.RefreshFormVariousInfo; //added by adenry
      //added by adenry: end
    end;
  finally
    PlainTxt.Free;
  end;
end;

// -----------------------------------------------------------------------------

function LoadSRF(const FileName: String; Translation: Boolean = False): Boolean; //procedure converted to a function by adenry //Translation added by adenry
var
  Ini  : TIniFile;
  i    : Integer;
  Data : PSubtitleItem;
begin
  Result := False;

  Ini := TIniFile.Create(FileName);
  try
    if Ini.SectionExists('URUSoft Subtitle Report File') then
    begin
      if LoadSubtitle(Ini.ReadString('URUSoft Subtitle Report File', 'File', ''), GetFPS, 0, Translation) then //if-then added by adenry //, 0, Translation added by adenry
      begin
        Result := True;
        for i := 0 to Ini.ReadInteger('URUSoft Subtitle Report File', 'Count', 0)-1 do
        begin
          Data := frmMain.lstSubtitles.GetNodeData(GetNodeWithIndex(frmMain.lstSubtitles, Ini.ReadInteger('URUSoft Subtitle Report File', IntToStr(i), 0)));
          if Assigned(Data) then //added by adenry
            Data.Marked := True;
        end;
        frmMain.lstSubtitles.Refresh;
      end;
    end else
      MsgBox(Format(ErrorMsg[28], [FileName]), BTN_OK, '', '', MB_ICONERROR, frmMain);
  finally
    Ini.Free;
  end;
end;

// -----------------------------------------------------------------------------

procedure ReadTextsAndTimesFromFile(FileName: String; SubFormat: Integer; Times, Texts: Boolean);
var
  Node       : PVirtualNode;
  NIndex     : Integer;
  UndoAction : PUndoAction;
begin
  with frmMain do
  begin
    if (Times = False) and (Texts = False) then exit;

    if SubtitleAPI.LoadSubtitle(FileName, GetInputFPS, SubFormat) then
    begin
      Node := lstSubtitles.GetFirst;
      while Assigned(Node) do
      begin
        NIndex := Node.Index;
        if NIndex < SubtitleAPI.SubtitleCount then
        begin
          if Times = True then
          begin
            New(UndoAction);
            UndoAction^.UndoActionType                 := uaTimeChange;
            UndoAction^.UndoActionName                 := uanReadTimeFromFile; //added by adenry
            UndoAction^.BufferSize                     := SizeOf(TTimeChange);
            UndoAction^.Buffer                         := AllocMem(UndoAction^.BufferSize);
            UndoAction^.Node                           := Node;
            UndoAction^.LineNumber                     := Node.Index;
            UndoAction^.BindToNext                     := Node <> lstSubtitles.GetLast;
            PTimeChange(UndoAction^.Buffer)^.StartTime := GetStartTime(Node);
            PTimeChange(UndoAction^.Buffer)^.FinalTime := GetFinalTime(Node);
            AddUndo(UndoAction);

            SetStartTime(Node, SubtitleAPI.GetInitialTime(NIndex));
            SetFinalTime(Node, SubtitleAPI.GetFinalTime(NIndex));
            AddError(Node, []);
          end;
          if Texts = True then
          begin
            New(UndoAction);
            UndoAction^.UndoActionType                        := uaFullTextChange;
            UndoAction^.UndoActionName                        := uanReadTextsFromFile; //added by adenry
            UndoAction^.BufferSize                            := SizeOf(TFullTextChange);
            UndoAction^.Buffer                                := AllocMem(UndoAction^.BufferSize);
            UndoAction^.Node                                  := Node;
            UndoAction^.LineNumber                            := Node.Index;
            UndoAction^.BindToNext                            := Node <> lstSubtitles.GetLast;
            PFullTextChange(UndoAction^.Buffer)^.OldText      := GetSubText(Node);
            PFullTextChange(UndoAction^.Buffer)^.OldTrans     := '';
            PFullTextChange(UndoAction^.Buffer)^.OriginalOnly := True;
            AddUndo(UndoAction);
                      
            SetText(Node, SubtitleAPI.GetText(NIndex));
          end;
        end;
        Node := Node.NextSibling;
      end;
      OldInputFPS := GetInputFPS;
      OldFPS      := GetFPS;
    end else
    begin
      if (SubFormat = 0) then
        MsgBox(Format(ErrorMsg[03],[FileName]), BTN_OK, '', '', MB_ICONERROR, frmMain) else
        MsgBox(Format(ErrorMsg[04],[FileName, SubtitleAPI.GetFormatName(SubFormat)]), BTN_OK, '', '', MB_ICONERROR, frmMain);
    end;
    
    SubtitleAPI.ClearSubtitles;
    //frmMain.AutoRecheckAllErrors; //added by adenry
  end;
end;

// -----------------------------------------------------------------------------

procedure LoadProject(const FileName: String);
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(FileName);
  try
    if FileExists(Ini.ReadString('Subtitle files', 'Original', '')) then
    begin
      CloseSub;
      LoadSubtitle(Ini.ReadString('Subtitle files', 'Original', ''), GetInputFPS);
      if FileExists(Ini.ReadString('Subtitle files', 'Translated', '')) then
      begin
        SetTranslatorMode(True);
        LoadSubtitle(Ini.ReadString('Subtitle files', 'Translated', ''), GetInputFPS, 0, True);
      end;
    end;
    if FileExists(Ini.ReadString('Movie file', 'Movie', '')) then
    begin
      SetVideoPreviewMode(True);
      //frmMain.AudioStreamNum := 0; //added by adenry
      LoadMovie(Ini.ReadString('Movie file', 'Movie', ''));
      if Ini.ReadInteger('Movie file', 'Position', 0) >= 0 then
        SetVideoPos(Ini.ReadInteger('Movie file', 'Position', 0));
    end;
    if Ini.ReadInteger('Other', 'Focused node', 0) >= 0 then
    begin
      UnSelectAll(frmMain.lstSubtitles);
      frmMain.lstSubtitles.FocusedNode := GetNodeWithIndex(frmMain.lstSubtitles, Ini.ReadInteger('Other', 'Focused node', 0));
      frmMain.lstSubtitles.ScrollIntoView(frmMain.lstSubtitles.FocusedNode,True);
      frmMain.lstSubtitles.Selected[frmMain.lstSubtitles.FocusedNode] := True;
      frmMain.RefreshTimes;
    end;
    frmMain.AddToRecent(FileName);
  finally
    Ini.Free;
  end;
end;

// -----------------------------------------------------------------------------

//Closes both the Original and the Translation files
function CloseSub: Boolean;
begin
  with frmMain do
  begin
    if AskToSaveFile = True then
    begin
      Result := True;
      SubtitleAPI.CloseSubtitle;
      lstSubtitles.Clear;
      tmeShow.Time     := 0;
      tmeHide.Time     := 0;
      tmeDuration.Time := 0;
      tmePause.Time    := 0; //added by adenry
      tmeShow.Clear;
      tmeHide.Clear;
      tmeDuration.Clear;
      tmePause.Clear; //added by adenry
      lblText.Caption := LabelText + ':';
      lblTranslation.Caption := LabelTranslation + ':';
      MarkLongLinesInLabel(lblText); //added by adenry
      MarkLongLinesInLabel(lblTranslation); //added by adenry
      mmoSubtitleText.Clear;
      mmoTranslation.Clear;
      OrgFile           := '';
      OrgFormat         := 0;
      OrgModified       := False;
      TransFile         := '';
      TransFormat       := 0;
      TransModified     := False;
      subSubtitle.Text  := '';
      OldInputFPS       := 0;
      OldFPS            := 0;
      UndoNumWhenOrgSaved := 0; //added by adenry
      UndoNumWhenTransSaved := 0; //added by adenry
      MarkingModified   := False; //added by adenry
//      frmMain.Caption   := ID_PROGRAM;
      frmMain.Caption   := ID_PROGRAM + ' ' + ID_VERSION;
      Application.Title := frmMain.Caption;
      EnableCtrls(False);
      ClearUndoList(UndoList);
      ClearUndoList(RedoList);
      setUndoEnabled(False);//modified by adenry //mnuUndo.Enabled := False;
      setRedoEnabled(False); //modified by adenry //mnuRedo.Enabled := False;
      SetLength(frmMain.SyncPointsArray, 0);
      RefreshTimes; //added by adenry to properly refresh the time boxes
      frmMain.RefreshFormInfoErrors; //added by adenry
      frmMain.RefreshFormVariousInfo; //added by adenry
    end else
      Result := False;
  end;
end;

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure LoadMarking(markingFile: String);
var
  Ini         : TIniFile;
  Data        : PSubtitleItem;
  i           : Integer;
begin
  Ini := TIniFile.Create(markingFile);
  try
    for i := 0 to Ini.ReadInteger('URUSoft Subtitle Report File', 'Count', 0)-1 do
    begin
      Data        := frmMain.lstSubtitles.GetNodeData(GetNodeWithIndex(frmMain.lstSubtitles, Ini.ReadInteger('URUSoft Subtitle Report File', IntToStr(i), 0)));
      if Assigned(Data) then
        Data.Marked := True;
    end;
    frmMain.lstSubtitles.Refresh;
    frmMain.MarkingModified := True;
  finally
    Ini.Free;
  end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure SaveMarking(markingFile, subFile: String);
var
  Ini   : TIniFile;
  Node  : PVirtualNode;
  Data  : PSubtitleItem;
  totalMarked: Integer;
begin
  if ((markingFile <> '') and (subFile <> '')) then
  begin
    Ini := TIniFile.Create(markingFile);
    Ini.EraseSection('URUSoft Subtitle Report File');
    Ini.WriteString('URUSoft Subtitle Report File','File', subFile);
    Node := frmMain.lstSubtitles.GetFirst;
    totalMarked := 0;
    while Assigned(Node) do
    begin
      Data := frmMain.lstSubtitles.GetNodeData(Node);
      if Data.Marked then
      begin
        Ini.WriteInteger('URUSoft Subtitle Report File',IntToStr(totalMarked),Node.Index);
        totalMarked := totalMarked + 1;
      end;
      Node := Node.NextSibling;
    end;
    Ini.WriteInteger('URUSoft Subtitle Report File','Count',totalMarked);
    frmMain.MarkingModified := False;
    Ini.Free;
  end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

function AskToSaveFile: Boolean;
var
  MsgTxt: String;
begin
  Result := True;
  with frmMain do
  begin
    if mnuTranslatorMode.Checked = False then
      MsgTxt := Format(QuestionMsg[01], [OrgFile]) else
      MsgTxt := Format(QuestionMsg[03], [OrgFile]);

      // Original
      if (AskToSave) and (OrgModified) then
      begin
        case MsgBox(MsgTxt, BTN_YES, BTN_NO, BTN_CANCEL, MB_ICONWARNING, frmMain) of
        1:
          begin
            UpdateArray(OrgFormat); //format index added by adenry
            if OrgFile <> '' then
            begin
              if SaveFile(OrgFile, OrgFormat, GetFPS) then
              begin
                OrgModified := False;
                UndoNumWhenOrgSaved := UndoList.Count; //added by adenry
              end else
              begin
                Result := False;
                exit;
              end;
            end else
            begin // If original file is new...
              frmSaveAs := TfrmSaveAs.Create(Application);
              frmSaveAs.SaveTranslation := False;
              frmSaveAs.ShowModal;
              frmSaveAs.Free;
            end;
            Result := True;
          end;
        2: Result := True;
        3:
          begin
            Result := False;
            exit;
          end;
        end;
      end;

      // Translated
      if (AskToSave) and (TransModified) and (mnuTranslatorMode.Checked) then
      begin
        case MsgBox(Format(QuestionMsg[04], [TransFile]), BTN_YES, BTN_NO, BTN_CANCEL, MB_ICONWARNING, frmMain) of
        1:
          begin
            UpdateArray(TransFormat, True); //format index added by adenry
            if TransFile <> '' then
            begin
              SubtitleAPI.SaveSubtitle(TransFile, TransFormat, GetFPS);
              TransModified := False;
            end else
            begin // If translated file is new...
              frmSaveAs := TfrmSaveAs.Create(Application);
              frmSaveAs.SaveTranslation := True;
              frmSaveAs.ShowModal;
              frmSaveAs.Free;
            end;
            Result := True;
          end;
        2: Result := True;
        3:
          begin
            Result := False;
            exit;
          end;
        end;
      end;

      //added by adenry: begin
      // Marking file
      if (MarkingSave <> 0) and (MarkingModified) and((OrgFile <> '') or (TransFile <> '')) then
      begin
        case MsgBox(QuestionMsg[10], BTN_YES, BTN_NO, BTN_CANCEL, MB_ICONQUESTION, frmMain) of
        1:
          begin
            SaveMarking(frmMain.OrgFile+ID_SRFEXT, frmMain.OrgFile);
            if frmMain.TransFile <> '' then
              SaveMarking(frmMain.TransFile+ID_SRFEXT, frmMain.TransFile);
            Result := True;
          end;
        2:
          begin
            MarkingModified := False;
            Result := True;
          end;
        3:
          begin
            Result := False;
            exit;
          end;
        end;
      end;
      //added by adenry: end

      SubtitleAPI.ClearSubtitles;
  end;
end;

// -----------------------------------------------------------------------------

procedure SetFormCaption;
var
  OrgAsterisk, TransAsterisk : String; //by BDZL
begin
  with frmMain do
  begin
    //Modified asterisk by BDZL
    if OrgModified then
      OrgAsterisk := ' *' else
      OrgAsterisk := '';
    if TransModified then
      TransAsterisk := ' *' else
      TransAsterisk := '';

    // set mainform caption
    if mnuTranslatorMode.Checked then
    begin
      if (OrgFile <> '') and (TransFile <> '') then
        frmMain.Caption := ID_PROGRAM + ' ' + ID_VERSION + ' - ' + ExtractFileName(OrgFile) + OrgAsterisk + ' / ' + ExtractFileName(TransFile) + TransAsterisk else
      if (OrgFile <> '') and (TransFile = '') then
        frmMain.Caption := ID_PROGRAM + ' ' + ID_VERSION + ' - ' + ExtractFileName(OrgFile) + OrgAsterisk + ' / ?' else
      if (OrgFile = '') and (TransFile <> '') then
        frmMain.Caption := ID_PROGRAM + ' ' + ID_VERSION + ' - ? / ' + ExtractFileName(TransFile) + TransAsterisk else
      if (OrgFile = '') and (TransFile = '') then
        frmMain.Caption := ID_PROGRAM + ' ' + ID_VERSION;
    end else
    begin
      if OrgFile <> '' then
        frmMain.Caption := ID_PROGRAM + ' ' + ID_VERSION + ' - ' + ExtractFileName(OrgFile) + OrgAsterisk else
        frmMain.Caption := ID_PROGRAM + ' ' + ID_VERSION;
    end;
    //Application.Title := frmMain.Caption;

    // set taskbar caption by BDZL
    if (OrgFile <> '') then
      Application.Title := ExtractFileName(OrgFile) + ' - ' + ID_PROGRAM + ' ' + ID_VERSION else
    if (TransFile <> '') then
      Application.Title := ExtractFileName(TransFile) + ' - ' + ID_PROGRAM + ' ' + ID_VERSION else
    Application.Title := ID_PROGRAM + ' ' + ID_VERSION;
  end;
end;

// -----------------------------------------------------------------------------

procedure SetUntranslated;
var
  Node    : PVirtualNode;
  Trans   : String;
  PrevMod : Boolean;
begin
  with frmMain do
  begin
    PrevMod := TransModified;
    Node := lstSubtitles.GetFirst;
    while Assigned(Node) do
    begin
      Trans := Trim(GetSubTranslation(Node));
      if (Trans = '') then
        SetTranslation(Node, UntranslatedSub); //todo: use FALSE as third parameter and drop the PrevMod variable
      Node := Node.NextSibling;
    end;
    TransModified := PrevMod;
  end;
end;

// -----------------------------------------------------------------------------

procedure SetTranslatorMode(const Flag: Boolean; SaveColsWidth: Boolean = True; ShowLeftPanel: Boolean = True);
var
  Ini: TIniFile;
begin
  with frmMain do
  begin
    tbTranslatorMode.Down := Flag;
    Ini := TIniFile.Create(IniRoot);
    try
      mnuTranslatorMode.Checked := Flag;
      mnuColTranslation.Checked := Flag; //added by adenry
      mnuColTranslationPopup.Checked := Flag; //added by adenry
      if (Flag = True) then
      begin
        // Show new column
        lstSubtitles.Header.Columns[4].Options := [coAllowClick, coDraggable, coEnabled, coParentBidiMode, coParentColor, coResizable, coShowDropMark, coVisible, coAllowFocus]; //coAllowFocus added by adenry

        if SaveColsWidth then
        begin
          // Save columns width for normal mode
          Ini.WriteInteger('Columns width (normal mode)', '1', lstSubtitles.Header.Columns[0].Width);
          Ini.WriteInteger('Columns width (normal mode)', '2', lstSubtitles.Header.Columns[1].Width);
          Ini.WriteInteger('Columns width (normal mode)', '3', lstSubtitles.Header.Columns[2].Width);
          Ini.WriteInteger('Columns width (normal mode)', '4', lstSubtitles.Header.Columns[3].Width);
          Ini.WriteInteger('Columns width (normal mode)', '6', lstSubtitles.Header.Columns[5].Width); //added by adenry
          Ini.WriteInteger('Columns width (normal mode)', '7', lstSubtitles.Header.Columns[6].Width); //added by adenry
        end;

        // Read translator mode's column width
        lstSubtitles.Header.Columns[0].Width := Ini.ReadInteger('Columns width (translator mode)', '1', 40);
        lstSubtitles.Header.Columns[1].Width := Ini.ReadInteger('Columns width (translator mode)', '2', 80);
        lstSubtitles.Header.Columns[2].Width := Ini.ReadInteger('Columns width (translator mode)', '3', 80);
        lstSubtitles.Header.Columns[3].Width := Ini.ReadInteger('Columns width (translator mode)', '4', 340);
        lstSubtitles.Header.Columns[4].Width := Ini.ReadInteger('Columns width (translator mode)', '5', 340);
        lstSubtitles.Header.Columns[5].Width := Ini.ReadInteger('Columns width (translator mode)', '6', 50); //added by adenry
        lstSubtitles.Header.Columns[6].Width := Ini.ReadInteger('Columns width (translator mode)', '7', 66); //added by adenry

        TextTransColsRatio := lstSubtitles.Header.Columns[3].Width / (lstSubtitles.Header.Columns[3].Width + lstSubtitles.Header.Columns[4].Width); //added by adenry

        SetUntranslated;
        lblTranslation.Caption      := LabelTranslation + ':';
        lblTranslation.Enabled      := InterfaceEnabled;
        mmoTranslation.Enabled      := InterfaceEnabled;
        lblTranslationLines.Enabled := InterfaceEnabled; //added by adenry
        lblLines2.Enabled           := InterfaceEnabled; //added by adenry

        if mmoTranslation.Visible = False then
          mmoTranslation.Show;
        if lblTranslation.Visible = False then
          lblTranslation.Show;

        //added by adenry: begin //fixed later
        if mnuShowLinesCount.Checked then
        begin
          lblTranslationLines.Show;
          lblLines2.Show;
        end;
        //added by adenry: end

        //added by adenry later: begin
        if mnuTextStyleBars.Checked then
          tbTransStyle.Show;
        //added by adenry later: end

        // Work with the menus...
        mnuLoadSubtitle.ShortCut := 0;
        mnuLoadSubtitle.Visible  := False;
        mnuSaveFile.ShortCut     := 0;
        mnuSaveFile.Visible      := False;
        mnuSaveFileAs.ShortCut   := 0;
        mnuSaveFileAs.Visible    := False;
        // ---
        mnuTranslatorSave.Visible := True;
        mnuLoad.Visible           := True;

        mnuLoadProject.ShortCut      := menuLoadProjSC;
        mnuLoadOriginal.ShortCut     := menuLoadOrgSC;
        mnuLoadTranslated.ShortCut   := menuLoadTransSC;
        mnuSaveProject.ShortCut      := menuSaveProjSC;
        mnuSaveOriginal.ShortCut     := menuSaveOrgSC;
        mnuSaveTranslated.ShortCut   := menuSaveTransSC;
        mnuSaveOriginalAs.ShortCut   := menuSaveOrgAsSC;
        mnuSaveTranslatedAs.ShortCut := menuSaveTransAsSC;

        if InterfaceEnabled then
          cmbTransCharset.Enabled := True;
        //SetTranslationCtrlsPositions; //removed by adenry - called in RepositionTextTrans
        RepositionTextTrans; //added by adenry
      end else
      if (Flag = False) then
      begin
        lstSubtitles.Header.Columns[4].Options := [coAllowClick, coDraggable, coEnabled, coParentBidiMode, coParentColor, coResizable, coShowDropMark];

        if SaveColsWidth then
        begin
          // Save columns width for translator mode
          Ini.WriteInteger('Columns width (translator mode)', '1', lstSubtitles.Header.Columns[0].Width);
          Ini.WriteInteger('Columns width (translator mode)', '2', lstSubtitles.Header.Columns[1].Width);
          Ini.WriteInteger('Columns width (translator mode)', '3', lstSubtitles.Header.Columns[2].Width);
          Ini.WriteInteger('Columns width (translator mode)', '4', lstSubtitles.Header.Columns[3].Width);
          Ini.WriteInteger('Columns width (translator mode)', '5', lstSubtitles.Header.Columns[4].Width);
          Ini.WriteInteger('Columns width (translator mode)', '6', lstSubtitles.Header.Columns[5].Width); //added by adenry
          Ini.WriteInteger('Columns width (translator mode)', '7', lstSubtitles.Header.Columns[6].Width); //added by adenry
        end;

        // Read normal columns width
        lstSubtitles.Header.Columns[0].Width := Ini.ReadInteger('Columns width (normal mode)', '1', 40);
        lstSubtitles.Header.Columns[1].Width := Ini.ReadInteger('Columns width (normal mode)', '2', 80);
        lstSubtitles.Header.Columns[2].Width := Ini.ReadInteger('Columns width (normal mode)', '3', 80);
        lstSubtitles.Header.Columns[3].Width := Ini.ReadInteger('Columns width (normal mode)', '4', 345);
        lstSubtitles.Header.Columns[5].Width := Ini.ReadInteger('Columns width (normal mode)', '6', 50); //added by adenry
        lstSubtitles.Header.Columns[6].Width := Ini.ReadInteger('Columns width (normal mode)', '7', 66); //added by adenry

        mmoTranslation.Clear;
        mmoTranslation.Hide;
        lblTranslation.Hide;
        lblTranslationLines.Hide; //added by adenry
        lblLines2.Hide; //added by adenry
        tbTransStyle.Hide; //added by adenry later
        //SetTranslationCtrlsPositions; //removed by adenry - called in RepositionTextTrans
        RepositionTextTrans; //added by adenry

        // Menus...
        mnuLoadSubtitle.ShortCut := menuLoadSubSC;
        mnuLoadSubtitle.Visible  := True;
        mnuSaveFile.ShortCut     := menuSaveFileSC;
        mnuSaveFile.Visible      := True;
        mnuSaveFileAs.ShortCut   := menuSaveFileAsSC;
        mnuSaveFileAs.Visible    := True;
        // ---
        mnuTranslatorSave.Visible := False;
        mnuLoad.Visible           := False;

        mnuLoadProject.ShortCut      := 0;
        mnuLoadOriginal.ShortCut     := 0;
        mnuLoadTranslated.ShortCut   := 0;
        mnuSaveProject.ShortCut      := 0;
        mnuSaveOriginal.ShortCut     := 0;
        mnuSaveTranslated.ShortCut   := 0;
        mnuSaveOriginalAs.ShortCut   := 0;
        mnuSaveTranslatedAs.ShortCut := 0;

        cmbTransCharset.Enabled := False;
        lstSubtitles.Header.MainColumn := 3; //added by adenry
      end;
      CallLstSubtitlesColumnResize; //added by adenry
      UpdateStatusbarWidths;
    finally
      Ini.Free;
    end;

    //added by adenry
    //if (WindowState = wsMaximized) and SmartResize then //removed later
      FormResize(frmMain);
    RefreshTimes;

    UpdateSubSubtitleTextAndVisibility; //added by adenry
  end;
  SetFormCaption;

end;

// -----------------------------------------------------------------------------

procedure CommandLineProcess(Cli: String);
  procedure ParamConvertFile(Param: String);
  var
    Input     : String;
    Output    : String;
    Format    : Integer;
    InputFPS  : Single;
    OutputFPS : Single;
  begin
    // SubtitleWorkshop.exe "/CONVERT(Input_File/Output_File/Output_Format/Input_FPS/Output_FPS)"
    Param    := Copy(Param, 10, Length(Param)-1);
    Input    := Copy(Param, 1, Pos('/', Param)-1);               // Input file
    Param    := Copy(Param, Pos('/', Param) + 1, Length(Param));
    Output   := Copy(Param, 1, Pos('/',Param)-1);                // Output file
    Param     := Copy(Param, Pos('/', Param)+1, Length(Param));
    Format    := SubtitleAPI.GetFormatIndex(Copy(Param, 1, Pos('/', Param)-1)); // Output format
    Param     := Copy(Param, Pos('/', Param)+1, Length(Param));
    InputFPS  := StrToFloatDef(Copy(Param, 1, Pos('/', Param)-1), 25); // Input FPS
    Param     := Copy(Param, Pos('/', Param)+1, Length(Param));
    OutputFPS := StrToFloatDef(Copy(Param, 1, Length(Param)-1), 25); // Output FPS

    SubtitleAPI.LoadSubtitle(Input, InputFPS);
    SubtitleAPI.SaveSubtitle(Output, Format, OutputFPS);
    SubtitleAPI.CloseSubtitle;
    
    //ExitProcess(0);
    Application.Terminate;
  end;

  procedure ParamDelayFile(Param: String);
  var
    Input  : String;
    Output : String;
    FPS    : Single;
    Delay  : Integer;
  begin
    // SubtitleWorkshop.exe "/DELAY(Input_File/Output_File/Input_FPS/Delay_in_Milliseconds)"
    Param  := Copy(Param, 8, Length(Param)-1);
    Input  := Copy(Param, 1, Pos('/', Param)-1);
    Param  := Copy(Param, Pos('/', Param) + 1, Length(Param));
    Output := Copy(Param, 1, Pos('/',Param)-1);
    Param  := Copy(Param, Pos('/', Param)+1, Length(Param));
    FPS    := StrToFloatDef(Copy(Param, 1, Pos('/', Param)-1), 25);
    Param  := Copy(Param, Pos('/', Param)+1, Length(Param));
    Delay  := StrToIntDef(Copy(Param, 1, Length(Param)-1), 0);

    SubtitleAPI.LoadSubtitle(Input, FPS);
    try
      if Delay <> 0 then
        SubtitleAPI.SetAbsoluteDelay(Delay);
    finally
      SubtitleAPI.SaveSubtitle(Output, SubtitleAPI.CurrentFormatIndex, FPS);
      SubtitleAPI.CloseSubtitle;
    end;
    //ExitProcess(0);
    Application.Terminate;
  end;

  procedure SaveFormatsToFile;
  var
    i       : Integer;
    Formats : TStringList;
  begin
    // SubtitleWorkshop.exe /GetSupportedFormats
    Formats := TStringList.Create;
    Formats.Add('These are the formats you should use for command line parameters.');
    Formats.Add('Do NOT modify a single character because it will not work, note that it is not case sensitive.');
    Formats.Add('');
    try
      for i := 0 to SubtitleAPI.FormatsCount do
        Formats.Add(SubtitleAPI.GetFormatName(i));
    finally
      Formats.SaveToFile(ExtractFilePath(Application.ExeName) + 'SupportedFormats.txt');
      Formats.Free;
    end;
    Application.Terminate;
  end;

  //by BDZL
  procedure ParamRunScript(Param: String);
  var
    Input     : String;
    Output    : String;
    Script    : String;
    FPS  : Single;
    err : Boolean;
    l          : LongInt;
    ErrorsText : String;
  begin
    try
      // SubtitleWorkshop.exe "/SCRIPT(Input_File/Output_File/Input_FPS/Pascal_script)"
      Param    := Copy(Param, 9, Length(Param)-1);
      Input    := Copy(Param, 1, Pos('/', Param)-1);               // Input file
      Param    := Copy(Param, Pos('/', Param) + 1, Length(Param));
      Output   := Copy(Param, 1, Pos('/',Param)-1);                // Output file
      Param    := Copy(Param, Pos('/', Param)+1, Length(Param));
      FPS      := StrToFloatDef(Copy(Param, 1, Pos('/', Param)-1), 25); // Input FPS
      Param    := Copy(Param, Pos('/', Param) + 1, Length(Param));
      Script   := Copy(Param, 1, Length(Param)-1);                // Pascal script

      LoadSubtitle(Input, FPS);
      SubtitleAPI.LoadSubtitle(Input, FPS);

      // run script
      err := FALSE;
      frmMain.psCompExec.Script.LoadFromFile(ExtractFilePath(Application.ExeName) + 'PascalScripts\' + Script);

      if frmMain.psCompExec.Compile then
      begin
        if not frmMain.psCompExec.Execute then
          err := TRUE;
      end else
        err := TRUE;

      if err = TRUE then
      begin
        ErrorsText := '';
        for l := 0 to frmMain.psCompExec.CompilerMessageCount - 1 do
        begin
          ErrorsText := ErrorsText + #13#10 + frmMain.psCompExec.CompilerErrorToStr(l);
        end;
        MsgBox('Compiler errors:' + #13#10#13#10 + ErrorsText, BTN_OK, '', '', MB_ICONERROR, nil);
      end;

      // save work
      UpdateArray(frmMain.OrgFormat); //format index added by adenry
      SaveFile(Output, frmMain.OrgFormat, FPS);
      SubtitleAPI.ClearSubtitles;

    except on E:Exception do
      MsgBox('Error:' + #13#10#13#10 + E.Message, BTN_OK, '', '', MB_ICONERROR, nil);
    end;

    Application.Terminate;
  end;

var
  Param: String;
begin
  if (AnsiUpperCase(Copy(Cli, 1, 6)) = '/OPEN(') or (FileExists(Cli)) then
  begin
    frmMain.Show;
    frmMain.Refresh;
    if FileExists(Cli) = False then
      Param := Copy(Cli, 7, Length(Cli) - 7) else
      Param := Cli;
    if (LowerCase(ExtractFileExt(Param)) = ID_STPEXT) then
      LoadProject(Param) else
    if (LowerCase(ExtractFileExt(Param)) = ID_SRFEXT) then
      LoadSRF(Param) else
    if (FileExists(Param)) then
      LoadSubtitle(Param, GetInputFPS);
  end else
  if AnsiUpperCase(Copy(Cli, 1, 9)) = '/CONVERT(' then
    ParamConvertFile(Cli) else
  if AnsiUpperCase(Copy(Cli, 1, 7)) = '/DELAY(' then
    ParamDelayFile(Cli) else
  if AnsiUpperCase(Copy(Cli, 1, 20)) = '/GETSUPPORTEDFORMATS' then
    SaveFormatsToFile else
  if AnsiUpperCase(Copy(Cli, 1, 8)) = '/SCRIPT(' then
    ParamRunScript(Cli);
end;

// -----------------------------------------------------------------------------

procedure GetCustomFormatInfo(const FileName: String; var Name, Extension, NewLineChar, TimeStructure: String; var Time, Frames: Boolean; var FPS: Single; Lines: TStrings);
var
  Format : TStringList;
  i      : Integer;
  IsLine : Boolean;
  Ini    : TIniFile;
begin
  if FileExists(FileName) = True then
  begin
    if Assigned(Lines) = False then
      Lines := TStringList.Create;
    Lines.Clear;
    Format := TStringList.Create;
    Ini := TIniFile.Create(FileName);
    try
      Format.LoadFromFile(FileName);
      IsLine := False;
      for i := 0 to Format.Count-1 do
      begin
        if IsLine then Lines.Add(Format[i]);
        if AnsiLowerCase(Format[i]) = '[format text]' then IsLine := True;
      end;

      Name          := Ini.ReadString('Information', 'Name', 'Custom format');
      Extension     := Ini.ReadString('Information', 'Extension', '*.xxx');
      NewLineChar   := Ini.ReadString('Information', 'New line char', '|');
      TimeStructure := Ini.ReadString('Information', 'Time structure', 'hh:mm:ss,zzz');
      Time          := StrToBool(Ini.ReadString('Information', 'Time', 'True'));
      Frames        := not Time;
      FPS           := Ini.ReadFloat('Information', 'FPS', 25);

    finally
      Format.Free;
      Ini.Free;
    end;
  end;  
end;

// -----------------------------------------------------------------------------

procedure SaveCustomFormat(SavePathNameExt: String; FormatLines: TStrings; Time, Frames: Boolean; TimeStruct: String; FPS: Single; NewLineChar: String);
var
  i, a, Pad       : Integer;
  RepeatPartStart : Integer;
  EndRepeat       : Integer;
  tmpLines        : TStringList;
  RepeatPart      : TStringList;
  tmpSubtitle     : TStringList;
  tmpStr          : String;
begin
  if SubtitleAPI.SubtitleCount > 0 then
  begin
    tmpLines    := TStringList.Create;
    RepeatPart  := TStringList.Create;
    tmpSubtitle := TStringList.Create;

    RepeatPartStart := 0;
    EndRepeat       := 0;
    tmpLines.Text   := FormatLines.Text;

    for i := tmpLines.Count-1 downto 0 do
      if tmpLines[i] = '' then
        tmpLines[i] := '{BlankLine}';

    while (Pos('**', tmpLines.Text) > 0) and (Pos('!*', tmpLines.Text) > Pos('**', tmpLines.Text)) do
      tmpLines.Text := Copy(tmpLines.Text, 0, Pos('**', tmpLines.Text)-1) + Copy(tmpLines.Text, Pos('!*',tmpLines.Text) + 2, Length(tmpLines.Text));

    for i := tmpLines.Count-1 downto 0 do
      if tmpLines[i] = '' then
        tmpLines.Delete(i);

    for i := tmpLines.Count-1 downto 0 do
    begin
      if tmpLines[i] = '{BlankLine}' then
        tmpLines[i] := '' else
      if SmartPos('{repeatsub}', tmpLines[i], False) > 0 then
        RepeatPartStart := i;
      if SmartPos('{endrepeat}', tmpLines[i], False) > 0 then
        EndRepeat := i;
    end;

    for i := RepeatPartStart+1 to EndRepeat-1 do
      RepeatPart.Add(tmpLines[i]);

    for i := 0 to RepeatPartStart-1 do
      tmpSubtitle.Add(ReplaceString(tmpLines[i], '{asterisk}', '*'));

    for i := 0 to SubtitleAPI.SubtitleCount-1 do
    begin

      for a := 0 to RepeatPart.Count-1 do
      begin
        tmpSubtitle.Add(RepeatPart[a]);
        tmpSubtitle[tmpSubtitle.Count-1] := ReplaceString(tmpSubtitle[tmpSubtitle.Count-1], '{asterisk}', '*');

        if (SmartPos('{SubCount', tmpSubtitle[tmpSubtitle.Count-1], False) > 0) and (Pos('}',tmpSubtitle[tmpSubtitle.Count-1]) > SmartPos('{SubCount', tmpSubtitle[tmpSubtitle.Count-1], False)) then
        begin
          if SmartPos('{SubCount,', tmpSubtitle[tmpSubtitle.Count-1], False) > 0 then
          begin
            tmpStr := Copy(tmpSubtitle[tmpSubtitle.Count-1], SmartPos('{SubCount,', tmpSubtitle[tmpSubtitle.Count-1], False) + 10, Length(tmpSubtitle[tmpSubtitle.Count-1])-1);
            if IsInteger(Copy(tmpStr, 1, Pos('}', tmpStr)-1)) then
              Pad := StrToInt(Copy(tmpStr, 1, Pos('}',tmpStr)-1)) else
              Pad := 0;
            tmpSubtitle[tmpSubtitle.Count-1] := ReplaceString(tmpSubtitle[tmpSubtitle.Count-1], '{SubCount,' + IntToStr(Pad) + '}', PadLeft(IntToStr(i+1), '0', Pad));
          end else
          tmpSubtitle[tmpSubtitle.Count-1] := ReplaceString(tmpSubtitle[tmpSubtitle.Count-1], '{SubCount}', IntToStr(i+1));
        end;

        if SmartPos('{swStart}', tmpSubtitle[tmpSubtitle.Count-1], False) > 0 then
        begin
          if Time = True then
          begin
            if AnsiUpperCase(TimeStruct) <> 'MS' then
              tmpSubtitle[tmpSubtitle.Count-1] := ReplaceString(tmpSubtitle[tmpSubtitle.Count-1], '{swStart}', TimeToString(SubtitleAPI.GetInitialTime(i), TimeStruct)) else
              tmpSubtitle[tmpSubtitle.Count-1] := ReplaceString(tmpSubtitle[tmpSubtitle.Count-1], '{swStart}', IntToStr(SubtitleAPI.GetInitialTime(i)));
          end else
            tmpSubtitle[tmpSubtitle.Count-1] := ReplaceString(tmpSubtitle[tmpSubtitle.Count-1], '{swStart}', IntToStr(TimeToFrames(SubtitleAPI.GetInitialTime(i), FPS)));
        end;

        if SmartPos('{swEnd}', tmpSubtitle[tmpSubtitle.Count-1], False) > 0 then
        begin
          if Time = True then
          begin
            if AnsiUpperCase(TimeStruct) <> 'MS' then
              tmpSubtitle[tmpSubtitle.Count-1] := ReplaceString(tmpSubtitle[tmpSubtitle.Count-1], '{swEnd}', TimeToString(SubtitleAPI.GetFinalTime(i), TimeStruct)) else
              tmpSubtitle[tmpSubtitle.Count-1] := ReplaceString(tmpSubtitle[tmpSubtitle.Count-1], '{swEnd}', IntToStr(SubtitleAPI.GetFinalTime(i)));
          end else
            tmpSubtitle[tmpSubtitle.Count-1] := ReplaceString(tmpSubtitle[tmpSubtitle.Count-1], '{swEnd}', IntToStr(TimeToFrames(SubtitleAPI.GetFinalTime(i), FPS)));
        end;

        if SmartPos('{swFrameStart', tmpSubtitle[tmpSubtitle.Count-1], False) > 0 then
        begin
          if SmartPos('{swFrameStart,',tmpSubtitle[tmpSubtitle.Count-1], False) > 0 then
          begin
            tmpStr := Copy(tmpSubtitle[tmpSubtitle.Count-1], SmartPos('{swFrameStart,', tmpSubtitle[tmpSubtitle.Count-1], False) + 14, Length(tmpSubtitle[tmpSubtitle.Count-1])-1);
            if IsInteger(Copy(tmpStr, 1, Pos('}',tmpStr)-1)) then
              Pad := StrToInt(Copy(tmpStr, 1, Pos('}',tmpStr)-1)) else
              Pad := 0;
            tmpSubtitle[tmpSubtitle.Count-1] := ReplaceString(tmpSubtitle[tmpSubtitle.Count-1], '{swFrameStart,' + IntToStr(Pad) + '}', PadLeft(IntToStr(TimeToFrames(SubtitleAPI.GetInitialTime(i), FPS)), '0', Pad));
          end else
            tmpSubtitle[tmpSubtitle.Count-1] := ReplaceString(tmpSubtitle[tmpSubtitle.Count-1], '{swFrameStart}',IntToStr(TimeToFrames(SubtitleAPI.GetInitialTime(i), FPS)));
        end;

        if SmartPos('{swFrameEnd', tmpSubtitle[tmpSubtitle.Count-1], False) > 0 then
        begin
          if SmartPos('{swFrameEnd,', tmpSubtitle[tmpSubtitle.Count-1], False) > 0 then
          begin
            tmpStr := Copy(tmpSubtitle[tmpSubtitle.Count-1], SmartPos('{swFrameEnd,', tmpSubtitle[tmpSubtitle.Count-1], False) + 12,Length(tmpSubtitle[tmpSubtitle.Count-1])-1);
            if IsInteger(Copy(tmpStr, 1, Pos('}',tmpStr)-1)) then
              Pad := StrToInt(Copy(tmpStr, 1, Pos('}',tmpStr)-1)) else
              Pad := 0;
            tmpSubtitle[tmpSubtitle.Count-1] := ReplaceString(tmpSubtitle[tmpSubtitle.Count-1], '{swFrameEnd,' + IntToStr(Pad) + '}', PadLeft(IntToStr(TimeToFrames(SubtitleAPI.GetFinalTime(i), FPS)), '0', Pad));
          end else
            tmpSubtitle[tmpSubtitle.Count-1] := ReplaceString(tmpSubtitle[tmpSubtitle.Count-1], '{swFrameEnd}', IntToStr(TimeToFrames(SubtitleAPI.GetFinalTime(i), FPS)));
        end;

        if SmartPos('{swText}',tmpSubtitle[tmpSubtitle.Count-1], False) > 0 then
        begin
          if AnsiLowerCase(NewLineChar) = '[enter]' then
            tmpStr := SubtitleAPI.GetText(i) else
            tmpStr := ReplaceEnters(SubtitleAPI.GetText(i), NewLineChar);
          tmpSubtitle[tmpSubtitle.Count-1] := ReplaceString(tmpSubtitle[tmpSubtitle.Count-1], '{swText}', tmpStr);
        end;
      end;

    end;

    for i := EndRepeat+1 to tmpLines.Count-1 do
      tmpSubtitle.Add(ReplaceString(tmpLines[i], '{asterisk}', '*'));

    tmpSubtitle.SaveToFile(SavePathNameExt);

    tmpLines.Free;
    RepeatPart.Free;
    tmpSubtitle.Free;
  end;
end;

// -----------------------------------------------------------------------------

function SaveFile(FileName: WideString; FormatIndex: Integer; FPS: Single): Boolean;
begin
  Result := False;
  if FileExists(FileName) = False then
  begin
    SubtitleAPI.SaveSubtitle(FileName, FormatIndex, FPS);
    Result := True;
  end else
  begin
    if FileIsReadOnly(FileName) = False then
    begin
      SubtitleAPI.SaveSubtitle(FileName, FormatIndex, FPS);
      Result := True;
    end else
    begin
      case MsgBox(QuestionMsg[09], BTN_YES, BTN_NO, '', MB_ICONWARNING, frmMain) of
        1:
          begin
            if FileSetReadOnly(FileName, False) then
            begin
              SubtitleAPI.SaveSubtitle(FileName, FormatIndex, FPS);
              Result := True;
            end else
            begin
              MsgBox(Format(ErrorMsg[12], [FileName]), BTN_OK, '', '', MB_ICONERROR, frmMain);
              Result := False;
              exit;
            end;
          end;
        2: exit;
      end;
    end;
  end;
  //added by adenry: begin
  //save marking file
  if Result and (frmMain.MarkingSave = 2) and frmMain.MarkingModified then
    if (FileName = frmMain.OrgFile) then
      SaveMarking(frmMain.OrgFile+ID_SRFEXT, frmMain.OrgFile) else
    if (FileName = frmMain.TransFile) then
      SaveMarking(frmMain.TransFile+ID_SRFEXT, frmMain.TransFile);
  //added by adenry: end
end;

// -----------------------------------------------------------------------------

//added by adenry: begin
function SetObjectAlignment(index: Integer):TAlignment;
begin
  case index of
    0: Result:=taLeftJustify;
    1: Result:=taRightJustify
    else Result:=Classes.taCenter;
  end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
//Correct rounding! No Banker's rounding!
function Rnd(r: Double): LongInt;
begin
  Result := Trunc(r);
  if abs(Frac(r)) >= 0.5 then
    if r > 0 then
      Result := Result + 1 else
      Result := Result - 1;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
function MixColors(C1, C2: TColor; p1: Integer): TColor;
var
  R1,R2,G1,G2,B1,B2: Byte;
  p2: Integer;
begin
  C1 := ColorToRGB(C1);
  C2 := ColorToRGB(C2);
  if p1>100 then p1 := 100 else
  if p1<0 then p1 := 0;
  p2 := 100-p1;
  R1 := GetRValue (C1);
  R2 := GetRValue (C2);
  G1 := GetGValue (C1);
  G2 := GetGValue (C2);
  B1 := GetBValue (C1);
  B2 := GetBValue (C2);
  Result:=RGB(Round((R1*p1+R2*p2)/100),Round((G1*p1+G2*p2)/100),Round((B1*p1+B2*p2)/100)); //Round should be Ceil !!!!
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
//this sets a checkBox's state without firing the OnClick event
procedure SetCheckedState(const checkBox : TCheckBox; const check: Boolean);
var
  onClickHandler : TNotifyEvent;
begin
  with checkBox do
  begin
    onClickHandler := OnClick;
    OnClick := nil;
    Checked := check;
    OnClick := onClickHandler;
  end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure ShowMsg(msg: String);
begin
  Application.NormalizeTopMosts;
  ShowMessage(msg);
  Application.RestoreTopMosts;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
function FixSpaces(Text: String): String;
begin
  Result := RemoveUnnecessarySpaces(Text, True);
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
function WrapTextEqualLines(Text, BreakStr: String; const BreakChars: TSysCharSet; MaxCol: Integer; OnlyIfTooLong: Boolean = True): String;
var
  i, j: Integer;
begin
  Text := ReplaceString(Text, #13#10, ' ');
  if (Length(Text) > MaxCol) or (OnlyIfTooLong = False) then
  begin
    j := -1;
    //get the break points
    for i := 1 to Length(Text)-1 do
      if Text[i] in BreakChars then
        if (not (Text[i] in [' ', ':'])) or (not IsTagPart(Text, i)) then //added by adenry later - don't break tags
          if Length(FixSpaces(RemoveSWTags(Copy(Text, 1, i), True, True, True, True))) <=
            Length(FixSpaces(RemoveSWTags(Copy(Text, i+1, MaxInt), True, True, True, True))) then
            j := i else
            break;
    //choose the better break point
    if j > 0 then
      if Length(FixSpaces(RemoveSWTags(Copy(Text, 1, i), True, True, True, True))) >
         Length(FixSpaces(RemoveSWTags(Copy(Text, j+1, MaxInt), True, True, True, True))) then
        i := j;
    //break
    Insert(BreakStr, Text, i+1);
    //remove unnecessary spaces, fix tags positions, and remove empty lines 
    Text := FixSpaces(Text);
    Text := FixTagsPositions(Text);
    Text := DeleteEmptyLines(Text);
  end;
  Result := Text;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
//Divides a one-line text into two lines. Tries to divide on special characters first
function SmartWrapText(Text: String; FontCharset: TFontCharset; MaxCol: Integer; BreakOnPunctMarksOnly: Boolean = False; ForcedWrap: Boolean = True; OnlyIfTooLong: Boolean = True): String;
var
  i, DialoguesOnOneLineNum: Integer;
  prevChar, nextChar      : Char;
  RC1, RC2, RC3, RC4, RC5 : Char;
begin
  if OnlyIfTooLong then
    if not HasTooLongLine(Text, MaxCol+1) then
    begin
      if not HasTooLongLine(ReplaceString(Text, #13#10, ' '), MaxCol+1) then
        Result := ReplaceString(Text, #13#10, ' ') else
        Result := Text;
      exit;
    end;

  //replace characters: they are assigned symbols that don't appear in normal text
  RC1 := #17;
  RC2 := #18;
  RC3 := #19;
  RC4 := #20;
  RC5 := #21;

  //unbreak
  Text := ReplaceString(Text, #13#10, ' ');

  //remove unnecessary spaces
  while Pos('  ', Text) > 0 do
    Text := ReplaceString(Text, '  ', ' ');
  Text := Trim(Text);

  //TODO: check for " and ' after every break sign...

    //check for dialogue on one line
    DialoguesOnOneLineNum := HasDialogueOnOneLine(Text, FontCharset);
    if DialoguesOnOneLineNum > 0 then
      Text := FixDialogueOnOneLine(Text, FontCharset, DialoguesOnOneLineNum);

    //'?', '!' or '.'
    if Pos(#13#10, Text) = 0 then
    begin
      Text := ReplaceString(Text, '?', RC1);
      Text := ReplaceString(Text, '!', RC2);
      Text := ReplaceString(Text, '.', RC3);
      Text := ReplaceString(Text, '"', RC4);
      Text := ReplaceString(Text, #39, RC5);
      for i := 2 to Length(Text) - 2 do
        if Text[i] in [RC1, RC2, RC3] then
          if not(Text[i+1] in [RC1, RC2, RC3]) then //check for double signs like ?! !? ..
            if not(Text[i+1] in [RC4, RC5]) then
            begin
              if Text[i]=RC1 then Text[i] := '?';
              if Text[i]=RC2 then Text[i] := '!';
              if Text[i]=RC3 then
              begin
                Text[i] := '.';
                if IsNoRegularDot(ReplaceString(Text, RC3, '.'), i) then //check if the dot is a number delimiter or part of an abbreviation
                  Text[i] := RC3;
              end;
            end else
            if (Text[i+2] = ' ') then //there must be a space after the quote character   //if not(Text[i+2] in [RC1, RC2, RC3, ',', ':']) then // ?". ?"! ?", etc...
            begin // ?" !" ." / ?' !' .'
              if Text[i+1]=RC4 then Text[i+1] := '"';
              if Text[i+1]=RC5 then Text[i+1] := #39;
            end;
      Text := WrapTextEqualLines(Text, #13#10, ['?', '!', '.', '"', #39], MaxCol, OnlyIfTooLong);
      Text := ReplaceString(Text, RC1, '?');
      Text := ReplaceString(Text, RC2, '!');
      Text := ReplaceString(Text, RC3, '.');
      Text := ReplaceString(Text, RC4, '"');
      Text := ReplaceString(Text, RC5, #39);
      if HasTooLongLine(Text, MaxCol+1) then
        Text := ReplaceString(Text, #13#10, ' ');
    end;

    //'...'
    if Pos(#13#10, Text) = 0 then
    begin
      Text := ReplaceString(Text, '.', RC1);
      Text := ReplaceString(Text, '"', RC2);
      Text := ReplaceString(Text, #39, RC3);
      for i := 3 to Length(Text) - 2 do
        if (Text[i] = RC1) and (Text[i-1] = RC1) then
          if (Text[i+1] = ' ') then  // '.. '
          begin
            if (i > 3) or (Text[1] <> RC1) then //prevent breaking after dots at the beginning, but allow breaking after e.g. 'I..'
              Text[i] := '.';
          end else
          if (Text[i+1] in [RC2, RC3]) then
            if not(Text[i+2] in ['!', '?', ',', ':']) then // ."! .", etc...
            begin // ." .'
              if Text[i+1]=RC2 then Text[i+1] := '"';
              if Text[i+1]=RC3 then Text[i+1] := #39;
            end;
      Text := WrapTextEqualLines(Text, #13#10, ['.', '"', #39], MaxCol, OnlyIfTooLong);
      Text := ReplaceString(Text, RC1, '.');
      Text := ReplaceString(Text, RC2, '"');
      Text := ReplaceString(Text, RC3, #39);
      if HasTooLongLine(Text, MaxCol+1) then
        Text := ReplaceString(Text, #13#10, ' ');
    end;

    //',', ':' (only if they are not NUMBER delimiters)
    if Pos(#13#10, Text) = 0 then
    begin
      Text := ReplaceString(Text, ',', RC1);
      Text := ReplaceString(Text, ':', RC2);
      Text := ReplaceString(Text, '"', RC3);
      Text := ReplaceString(Text, #39, RC4);
      for i := 2 to Length(Text) - 2 do
        if Text[i] in [RC1, RC2] then
        begin
          if (Text[i-1]<>' ') or (i=2) then
            prevChar := Text[i-1] else
            prevChar := Text[i-2];
          if Text[i+1]<>' ' then
            nextChar := Text[i+1] else
            nextChar := Text[i+2];
          if not((prevChar in ['0'..'9'])and(nextChar in ['0'..'9'])) then // 3,5 or 3:5
            if not (Text[i+1] in [RC3, RC4]) then // ," or :" or ,' or :'
            begin
              if Text[i] = RC1 then
                  Text[i] := ',';
              if Text[i] = RC2 then
                if Copy(Text, i+1, 2) <> '//' then //prevent breaking after http:// etc. //added by adenry later
                  Text[i] := ':';
            end else
            begin // ," :" / ,' :'
              if Text[i+1]=RC3 then Text[i+1] := '"';
              if Text[i+1]=RC4 then Text[i+1] := #39;
            end;
        end;
      Text := WrapTextEqualLines(Text, #13#10, [',', ':', '"', #39], MaxCol, OnlyIfTooLong);
      Text := ReplaceString(Text, RC1, ',');
      Text := ReplaceString(Text, RC2, ':');
      Text := ReplaceString(Text, RC3, '"');
      Text := ReplaceString(Text, RC4, #39);
      if HasTooLongLine(Text, MaxCol+1) then
        Text := ReplaceString(Text, #13#10, ' ');
    end;

    //' - ' or '--' for all four dashes ('-', #150, #151, #173)
    if Pos(#13#10, Text) = 0 then
    begin
      Text := ReplaceString(Text, '-', RC1);
      if (FontCharset in DashCharsets1) then //added later
        Text := ReplaceString(Text, #150, RC2);
      if (FontCharset in DashCharsets1) then //added later
        Text := ReplaceString(Text, #151, RC3);
      if (FontCharset in DashCharsets2) then //added later
        Text := ReplaceString(Text, #173, RC4);
      for i := 2 to Length(Text) - 2 do
        if Text[i] in [RC1, RC2, RC3, RC4] then
          if ( (Text[i-1] = ' ') and (Text[i+1] = ' ') ) // ' - '
          or ( (Text[i-1] = Text[i]) and not(Text[i+1] in ['"', #39]) ) then //--
            begin
              if Text[i] = RC1 then Text[i] := '-';
              if Text[i] = RC2 then if FontCharset in DashCharsets1 then Text[i] := #150;
              if Text[i] = RC3 then if FontCharset in DashCharsets1 then Text[i] := #151;
              if Text[i] = RC4 then if FontCharset in DashCharsets2 then Text[i] := #173;
            end;
      Text := WrapTextEqualLines(Text, #13#10, Dashes, MaxCol, OnlyIfTooLong);
      Text := ReplaceString(Text, RC1, '-');
      Text := ReplaceString(Text, RC2, #150);
      Text := ReplaceString(Text, RC3, #151);
      Text := ReplaceString(Text, RC4, #173);
      if HasTooLongLine(Text, MaxCol+1) then
        Text := ReplaceString(Text, #13#10, ' ');
    end;

    //';'
    if Pos(#13#10, Text) = 0 then
    begin
      Text := ReplaceString(Text, ';', RC1);
      for i := 2 to Length(Text) - 2 do
        if Text[i] = RC1 then
          if not (Text[i+1] in ['"', #39]) then // ;" or ;'
            Text[i] := ';';
      Text := WrapTextEqualLines(Text, #13#10, [';'], MaxCol, OnlyIfTooLong);
      Text := ReplaceString(Text, RC1, ';');
      if HasTooLongLine(Text, MaxCol+1) then
        Text := ReplaceString(Text, #13#10, ' ');
    end;

    //'" ' and ' "' and ' '' and '' '
    if Pos(#13#10, Text) = 0 then
    begin
      Text := ReplaceString(Text, ' ', RC1);
      for i := 2 to Length(Text) - 2 do
        if Text[i] in ['"', #39] then
          if (Text[i+1] <> RC1) or (Text[i-1] <> RC1) then
            if Text[i+1]=RC1 then
              Text[i+1] := ' ' else
            if Text[i-1]=RC1 then
              Text[i-1] := ' ';
      Text := WrapTextEqualLines(Text, #13#10, [' '], MaxCol+1, OnlyIfTooLong);
      Text := ReplaceString(Text, RC1, ' ');
      Text := FixSpaces(Text);
      if HasTooLongLine(Text, MaxCol+1) then
        Text := ReplaceString(Text, #13#10, ' ');
    end;

    if not BreakOnPunctMarksOnly then
    begin
      //space or tab
      if Pos(#13#10, Text) = 0 then
      begin
        Text := WrapTextEqualLines(Text, #13#10, [' ', #9], MaxCol, OnlyIfTooLong);
        if HasTooLongLine(Text, MaxCol+1) then
          Text := ReplaceString(Text, #13#10, ' ');
      end;

      //if there are even no spaces, break in the middle
      if Pos(#13#10, Text) = 0 then
        if ForcedWrap then
          Insert(#13#10, Text, Length(Text) div 2);
    end;

  Result := Text;
end;
//added by adenry: end
 
// -----------------------------------------------------------------------------

//added by adenry: begin
function BreakTextInTheMiddle(Text: String; UseAltBreakPoint: Boolean = False; ForceBreakIfNecessary: Boolean = True): String;
var
  i, j, p1, p2: Integer;
begin
  Text := RemoveUnnecessaryTags(Text);
  Text := ReplaceEnters(Text, ' ');
  while Pos('  ', Text) > 0 do Text := ReplaceString(Text, '  ', ' ');

  // find the middle point
  if (SubtitleApi.MultiTagsMode) or (SubtitleApi.SingleTagsMode) then
  begin
    i := 0;
    j := Length(Text)+1;
    while i < j do
    begin
      Inc(i);
      while (Copy(Text, i, 1) = '<') and IsTagPart(Text, i) do
      begin
        while Text[i] <> '>' do Inc(i);
        Inc(i);
      end;
      if i=j then break;
      Dec(j);
      while (Copy(Text, j, 1) = '>') and IsTagPart(Text, j) do
      begin
        while Text[j] <> '<' do Dec(j);
        Dec(j);
      end;
      if i=j then break;
    end;
  end else
    i := Length(Text) div 2;

  //get the two space characters closest to the middle point
  p1 := i;
  p2 := i;
  while (p1 > 0) and ((Text[p1] <> ' ')or(IsTagPart(Text,p1))or(IsAbbrSpace(Text,p1))) do Dec(p1);
  while (p2 <= Length(Text)) and ((Text[p2] <> ' ')or(IsTagPart(Text,p2))or(IsAbbrSpace(Text,p2))) do Inc(p2);

  //choose the space character to break on
  if (Length(RemoveSWTags(Copy(Text,p1+1,MaxInt), True, True, True, True))
    > Length(RemoveSWTags(Copy(Text, 1, p2-1), True, True, True, True)))
    Xor UseAltBreakPoint then
  begin //use p2
    if p2 < Length(Text) then
    begin
      Insert(#13#10, Text, p2+1);
      Delete(Text, p2, 1);
    end else
    if ForceBreakIfNecessary then
    begin
      Insert(#13#10, Text, i+1); //insert a new line in the middle of the text
      Text := RemoveUnnecessarySpaces(Text);
    end;
  end else
  begin //use p1
    if p1 > 1 then
    begin
      Insert(#13#10, Text, p1+1);
      Delete(Text, p1, 1);
    end else
    if ForceBreakIfNecessary then
    begin
      Insert(#13#10, Text, i+1); //insert a new line in the middle of the text
      Text := RemoveUnnecessarySpaces(Text);
    end;
  end;

  Result := Text;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
function FastSmartLineAdjust(org: String; FontCharset: TFontCharset): String;
var
  tmp, adj1, adj2, adj3 : String;
  toggle, noToggle: Boolean;
  DialoguesOnOneLineNum: Integer;
begin
    Result := org;
    tmp := org;
    toggle := (frmMain.lstSubtitles.SelectedCount = 1) and frmMain.ToggleBreakPoint;
    noToggle := (frmMain.lstSubtitles.SelectedCount = 1) and (frmMain.ToggleBreakPoint = False);

    // 1. GET ADJUST OPTIONS
    adj1 := '';
    adj2 := '';
    adj3 := '';
    // 1.1. fix more than 2 lines
    if CountLines(tmp) > 2 then
      tmp := ReplaceEnters(tmp, ' ');
    // 1.2. check for dialogue dash
    if not HasDashOnSecondLine(tmp, FontCharset) then
    begin
      // 1.3. Fix dialogue on one line
      DialoguesOnOneLineNum := HasDialogueOnOneLine(tmp, FontCharset);
      if DialoguesOnOneLineNum > 0 then
        adj1 := FixDialogueOnOneLine(tmp, FontCharset, DialoguesOnOneLineNum) else
        begin
          // 1.4. Option 1: Unbreak
          adj1 := ReplaceEnters(tmp, ' ');
          if HasTooLongLine(adj1) or (noToggle and (adj1=org)) then adj1 := '';
          if (adj1='') or toggle then
          begin
            // 1.5. Option 2: Break on punctuation mark
            adj2 := SmartWrapText(tmp, FontCharset, TooLongLine, True, False, False);
            if (CountLines(adj2) = 1) or (noToggle and (adj2=org)) then adj2 := '';
            if (adj2 = '') or toggle then
            begin
              // 1.6. Option 3: Break in the middle
              adj3 := BreakTextInTheMiddle(tmp);
              if noToggle and (adj3=org) then adj3 := '';
            end;
          end;
          // 1.7. Remove duplicate and empty options
          if (adj3=adj2) then adj3:='';
          if (adj2='') then begin adj2:=adj3; adj3:='' end;
          if (adj1='') then begin adj1:=adj2; adj2:=adj3; adj3:='' end;
          // 1.8. Add an additional breakpoint, if there are less than 3 so far (a total of 4 would be too much)
          if ((adj3='') and toggle) or (adj1='') then
          begin
            tmp := BreakTextInTheMiddle(tmp, True, False);
            if (noToggle and (tmp=org)) or (tmp=adj1) or (tmp=adj2) then tmp := '';
            if tmp <> '' then
              if adj1 = '' then adj1 := tmp else
              if adj2 = '' then adj2 := tmp else
                adj3 := tmp;
          end;
        end;
    end;
    // 2. SET ADJUSTED TEXT
    if adj1 <> '' then
    begin
      // 2.1. Toggling is ON and we have more than 1 option
      if toggle and (adj2 <> '') then
      begin
        if org = adj1 then
          Result := adj2 else //Toggle from option 1 to option 2
        if org = adj2 then
        begin
          if adj3 <> '' then //if there is a third option
            Result := adj3 else //Toggle from option 2 to option 3
            Result := adj1; //Toggle from option 2 to option 1
        end else
        if (org = adj3) then
          Result := adj1 else //Toggle from option 3 to option 1
          Result := adj1;
      end else
      // 2.2. Toggling is OFF or we have only 1 option
        Result := adj1;
    end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry - round a passed time value
function RoundTimeValue(TimeValue: Cardinal; Factor: Integer; RoundUpward: Boolean = False; RoundDownward: Boolean = False): Cardinal;
var
  ModValue: Cardinal;
begin
  ModValue := TimeValue mod Factor;
  if ModValue > 0 then
    if (RoundUpward or (ModValue >= Factor / 2)) and (RoundDownward = False) then
      ModValue := ModValue - Factor; //round upward

  Result := TimeValue - ModValue;
end;

//added by adenry: begin
procedure RoundSubtitlesValues(RoundFactor: Byte; SelectedOnly: Boolean);
var
  Node          : PVirtualNode;
  NewStartTime  : Integer;
  OldStartTime  : Integer;
  NewFinalTime  : Integer;
  OldFinalTime  : Integer;
  UndoAction    : PUndoAction;
begin
  if SelectedOnly then
    Node := frmMain.lstSubtitles.GetFirstSelected else
    Node := frmMain.lstSubtitles.GetFirst;
  while Assigned(Node) do
  begin
    OldStartTime := GetStartTime(Node);
    OldFinalTime := GetFinalTime(Node);
    NewStartTime := RoundTimeValue(OldStartTime, RoundFactor);
    NewFinalTime := RoundTimeValue(OldFinalTime, RoundFactor);

    if (NewStartTime <> OldStartTime) or (NewFinalTime <> OldFinalTime) then
    begin
      New(UndoAction);
      UndoAction^.UndoActionType                    := uaTimeChange;
      UndoAction^.UndoActionName                    := uanRoundTimeValues;
      UndoAction^.BufferSize                        := SizeOf(TTimeChange);
      UndoAction^.Buffer                            := AllocMem(UndoAction^.BufferSize);
      UndoAction^.Node                              := Node;
      UndoAction^.LineNumber                        := Node.Index;
      UndoAction^.BindToNext                        := True;
      if NewStartTime <> OldStartTime then
      begin
        PTimeChange(UndoAction^.Buffer)^.StartTime  := OldStartTime;
        SetStartTime(Node, NewStartTime);
      end else
        PTimeChange(UndoAction^.Buffer)^.StartTime  := -1;
      if NewFinalTime <> OldFinalTime then
      begin
        PTimeChange(UndoAction^.Buffer)^.FinalTime  := OldFinalTime;
        SetFinalTime(Node, NewFinalTime);
      end else
        PTimeChange(UndoAction^.Buffer)^.FinalTime  := -1;
      AddUndo(UndoAction);
    end;

    if SelectedOnly then
      Node := frmMain.lstSubtitles.GetNextSelected(Node) else
      Node := Node.NextSibling;
  end;

  if UndoList.Count > 0 then
    PUndoAction(UndoList.Last)^.BindToNext := False;
  //frmMain.lstSubtitles.Refresh; //AutoRecheck***Errors refreshes it
  frmMain.RefreshTimes;
  frmMain.AutoRecheckAllErrors(TimeErrors);
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure SplitDelimitedString(Delimiter: Char; Str: String; ListOfStrings: TStrings);
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

//added by adenry: begin
//Finds a better breaking point for a 2-line subtitle
function FindBetterBreakPoint(Text: String; FontCharset: TFontCharset; MaxCol: Integer; OnlyIfOrigBrPointNotASpecialChar: Boolean = False; AlwaysChange: Boolean = False): String;
var
  OldBreakChar, NewBreakChar: String;
  thedashes : set of Char;
begin
  Result := Text;
  if CountLines(Text) <> 2 then exit;

  //get old break character
  if Pos(#13#10, Text) > 1 then
    OldBreakChar := Copy(Text, Pos(#13#10, Text)-1, 1) else exit;

  if (AlwaysChange = False) and (OldBreakChar[1] in ['?', '!', '.']) then exit; //no better break point possible

  thedashes := SetDashes(FontCharset);

  if (OnlyIfOrigBrPointNotASpecialChar = False)
  or not (OldBreakChar[1] in ['?', '!', '.', ',', ':', ';', '"', #39]+thedashes) then
  begin
    //get new Text and the new break character
    Text := SmartWrapText(Text, FontCharset, MaxCol, True, False, False);
    if Pos(#13#10, Text) > 1 then
      NewBreakChar := Copy(Text, Pos(#13#10, Text)-1, 1) else exit;
    if AlwaysChange then
      Result := Text else
    //compare break characters
    if NewBreakChar[1] in ['?', '!', '.'] then
      Result := Text else
    if (NewBreakChar[1] in [',', ':']) and not(OldBreakChar[1] in [',', ':']) then
      Result := Text else
    if (NewBreakChar[1] in thedashes) and not(OldBreakChar[1] in [',', ':']+thedashes) then
      Result := Text else
    if (NewBreakChar[1] in [';']) and not(OldBreakChar[1] in [',', ':', ';']+thedashes) then
      Result := Text else
    if (NewBreakChar[1] in ['"', #39]) and not(OldBreakChar[1] in [',', ':', ';', '"', #39]+thedashes) then
      Result := Text;
  end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure Note(Text: String);
begin
  frmMain.mmoNotes.Text := frmMain.mmoNotes.Text + Text;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
function DeleteEmptyLines(Text: String): String;
begin
  ReplaceString(Text, #13#10#13#10, #13#10);
  if Copy(Text, 1, 2) = #13#10 then Delete(Text, 1, 2);
  if Copy(Text, Length(Text)-1, 2) = #13#10 then Delete(Text, Length(Text)-1, 2);
  Result := Text;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
//check if a dot is a fullstop or something else (like a part of ... or an abbreviation dot or a number delimiter)
function IsNoRegularDot(Text: String; n: Integer; SpaceAfterDotCheck: Boolean = False): Boolean;
var
  prev, next, i: Integer;
  s1, s2: String;
begin
  Result := True;

  if (n < 1) or (n > Length(Text)) then exit;
  if Text[n] <> '.' then exit;

  // get texts before and after the dot (and remove their tags and double spaces)
  if (n > 1) then
    s1 := RemoveSWTags(Copy(Text, 1, n-1), True, True, True, True) else
    s1 := '';
  while Pos('  ', s1) > 0 do s1 := ReplaceString(s1, '  ', ' ');
  if (n < Length(Text)) then
    s2 := RemoveSWTags(Copy(Text, n+1, MaxInt), True, True, True, True) else
    s2 := '';
  while Pos('  ', s2) > 0 do s2 := ReplaceString(s2, '  ', ' ');

  // check if the dot is a number delimiter, like '2.6'
  if (s1 <> '') and (s2 <> '') then
    if (s1[Length(s1)] in ['0'..'9', ' ']) and (s2[1] in ['0'..'9']) then exit; //' ' is for numbers like ' .5'

  // get the positions of the previous and the next characters
  if s1 <> '' then
  begin
    prev := Length(s1);
    if (s1[prev] = ' ') then Dec(prev);
  end else
    prev := 0;
  if s2 <> '' then
  begin
    next := 1;
    if (s2[next] = ' ') then Inc(next);
  end else
    next := 0;

  if SpaceAfterDotCheck = False then
  begin
    // check for consecutive dots (.. or ... etc)
    if s1 <> '' then
      if s1[prev] = '.' then exit;
    if s2 <> '' then
      if s2[next] = '.' then exit;

    // check for abbreviation letter like F. B. I. or James T. Kirk
    if prev > 1 then
      if not (s1[prev] in SpecialChars) then //previous character is a letter
        if (s1[prev-1] = ' ') then //there's a space before the letter
          exit;

    // check for abbreviations like: Mr. or Mrs. or Ms. or Dr.
    if s1 <> '' then
      for i := 1 to Length(Abbreviations) do
        if SmartPos(Abbreviations[i], s1, False, Length(s1), False) = Length(s1)-Length(Abbreviations[i])+1 then exit;
  end else
  begin
    //check for consecutive dots (.. or ... etc) at the beginning of the line
    if s1 <> '' then
      if s1[prev] = '.' then
        if DeleteSpecialChars(s1) = '' then
          exit;
  end;

  // check for abbreviations like: S.W.A.T. or F.B.I. or S. W. A. T. or F. B. I.
  if s1 <> '' then
  if s1[prev] <> '.' then
  begin
    if prev > 2 then
    begin
      Dec(prev);
      if (s1[prev] = ' ') then Dec(prev);
      if s1[prev] = '.' then exit;
    end;
    if next < Length(s2) then
    begin
      Inc(next);
      if s2[next] = '.' then exit;
    end;
  end;

  // check for website addresses
  if IsDotInWebsiteAddress(Text, n) then exit;

  Result := False;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
//Check if a dot is part of a website address
function IsDotInWebsiteAddress(Text: String; n: Integer): Boolean;
var
  prev, next, buff: Integer;
  s1, s2, website: String;
begin
    Result := False;

    // get texts before and after the dot
    if (n > 1) then
      s1 := RemoveSWTags(Copy(Text, 1, n-1), True, True, True, True) else
      s1 := '';
    if (n < Length(Text)) then
      s2 := RemoveSWTags(Copy(Text, n+1, MaxInt), True, True, True, True) else
      s2 := '';

    if (s1 <> '') and (s2 <> '') then //if there's no text on one or both sides of the dot, it's not a website address dot
    begin
      prev := Length(s1);
      next := 1;
      if (s1[prev] in Alphanumeric) and (s2[next] in Alphanumeric) then //if the characters around the dot are alphanumeric
      begin
        //get the start and the end of the website address
        prev := Max(SmartPos(' ', s1, True, prev, False), SmartPos(#13#10, s1, True, prev, False)) + 1;
        next := SmartPos(' ', s2, True);
        buff := SmartPos(#13#10, s2, True);
        if (buff > 0) and (buff < next) then next := buff;
        if next = 0 then next := Length(s2) else Dec(next);
        //form the website address
        website := Copy(s1, prev, MaxInt) + '.' + Copy(s2, 1, next);
        while website[Length(website)] in ['.','!','?',',',':',';',#39,'"',')',']','}'] do
          Delete(website, Length(website), 1); //remove special chars at the end
        //find the first slash (ignore '//' at the beginning if it exists) - the TLD is just before the slash
        website := ReplaceString(website, '//', '');
        buff := SmartPos('/', website);
        if buff = 0 then buff := Length(website) else Dec(buff);
        //trim everything after the first slash (including that slash)
        website := Copy(website, 1, buff);
        //triim everything before the last dot (including that dot)
        website := Copy(website, SmartPos('.', website, True, buff, False)+1, MaxInt); //now we have the TLD
        //Check if it is a proper TLD
        website := ','+website+',';
        if SmartPos(website, TopLevelDomains, False) > 0 then
          Result := True;
        if SmartPos(website, TopLevelDomainsWords+TopLevelDomainsWordsUppercase, True) > 0 then
          Result := True;
        if SmartPos(website, Uppercase(TopLevelDomainsWords), True) > 0 then
          Result := True;
      end;
    end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
//Check if a SPACE (' ') character is inside of an abbreviation (like S. W. A. T.)
//Note: we don't care if it is a space right AFTER an abbreviation
function IsAbbrSpace(Text: String; n: Integer): Boolean;
var
  s1, s2: String;
begin
  Result := False;
  if (n < 3) or (n > Length(Text)-2) then exit;
  if Text[n] <> ' ' then exit;

  //get the texts before and after the space
  s1 := RemoveSWTags(Copy(Text, 1, n-1), True, True, True, True);
  while Pos('  ', s1) > 0 do s1 := ReplaceString(s1, '  ', ' ');
  s2 := RemoveSWTags(Copy(Text, n+1, MaxInt), True, True, True, True);
  while Pos('  ', s2) > 0 do s2 := ReplaceString(s2, '  ', ' ');

  if (Length(s1) < 2) or (Length(s2) < 2) then exit;

  //check
  if (s1[Length(s1)] = '.') and (s2[2] = '.') //check for the dots
  and not(s1[Length(s1)-1] in SpecialChars) and not(s2[1] in SpecialChars) //check for the abbreviation characters
  and ( (Length(s1) = 2) or (s1[Length(s1)-2] = ' ') ) then //check for space before the first character
    Result := True;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
function SetDashes(FontCharset: TFontCharset): TSysCharSet;
begin
  Result := ['-'];
  if FontCharset in DashCharsets1 then Result := ['-', #150, #151] else
  if FontCharset in DashCharsets2 then Result := ['-', #150, #151, #173];
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
function GetActualDefaultCharset: TFontCharset; //added by adenry
var
  CodePage: Cardinal;
  FontCharsets: array [1..16] of TFontCharset;
  CodePages: array [1..16] of Cardinal;
  b: Byte;
begin
  Result := DEFAULT_CHARSET;

  CodePage := GetACP;

  FontCharsets[1] := (ANSI_CHARSET);
  FontCharsets[2] := (SYMBOL_CHARSET);
  FontCharsets[3] := (SHIFTJIS_CHARSET);
  FontCharsets[4] := (HANGEUL_CHARSET);
  FontCharsets[5] := (JOHAB_CHARSET);
  FontCharsets[6] := (GB2312_CHARSET);
  FontCharsets[7] := (CHINESEBIG5_CHARSET);
  FontCharsets[8] := (GREEK_CHARSET);
  FontCharsets[9] := (TURKISH_CHARSET);
  FontCharsets[10] := (VIETNAMESE_CHARSET);
  FontCharsets[11] := (HEBREW_CHARSET);
  FontCharsets[12] := (ARABIC_CHARSET);
  FontCharsets[13] := (BALTIC_CHARSET);
  FontCharsets[14] := (RUSSIAN_CHARSET);
  FontCharsets[15] := (THAI_CHARSET);
  FontCharsets[16] := (EASTEUROPE_CHARSET);

  for b := 1 to 16 do
    CodePages[b] := CharsetToCodePage(FontCharsets[b]);

  for b := 1 to 16 do
    if CodePage = CodePages[b] then
      Result := FontCharsets[b];
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
function GetVideoFilesFilterString: String;
var
  StringList: TStringList;
  i, j: Integer;
  extsList: String;
begin
  StringList := TStringList.Create;
  Result := AllSupportedFiles + '|';
  for i := 0 to VideoAudioExts.Count - 1 do
    if i > 0 then
      Result := Result + '; *.' + VideoAudioExts[i] else
      Result := Result + '*.' + VideoAudioExts[i];
  Result := Result + '|' + AllFiles + ' (*.*)|*.*';
  for i := 1 to Length(VideoExtsGroups) do
  begin
    Result := Result + '|' + VideoExtsGroups[i][1] + ' (';
    SplitDelimitedString(',', VideoExtsGroups[i][2], StringList);
    for j := 0 to StringList.Count - 1 do
      if j > 0 then
        extsList := extsList + ' ; *.' + StringList[j] else
        extsList := '*.' + StringList[j];
    Result := Result + extsList + ')|' + extsList;
  end;
  for i := 1 to Length(AudioExtsGroups) do
  begin
    Result := Result + '|' + AudioExtsGroups[i][1] + ' (';
    SplitDelimitedString(',', AudioExtsGroups[i][2], StringList);
    for j := 0 to StringList.Count - 1 do
      if j > 0 then
        extsList := extsList + ' ; *.' + StringList[j] else
        extsList := '*.' + StringList[j];
    Result := Result + extsList + ')|' + extsList;
  end;

  StringList.Free;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

end.
