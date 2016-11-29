// This file is part of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle Workshop's copyright information
// File Description: Video Preview functionality

unit VideoPreview;

interface

uses
  Forms, Windows, Controls, ComCtrls, ExtCtrls, ActiveX, DirectShow9, SysUtils, Menus, Classes, {Graphics,} //Graphics added by adenry for Screengrab;
  VirtualTrees, //VirtualTrees added by adenry
  CommonTypes;

const
  CLSID_MPEG2Splitter           : TGUID = '{3AE86B20-7BE8-11D1-ABE6-00A0C905F375}';
  CLSID_OGGSplitter             : TGUID = '{F07E245F-5A1F-4D1E-8BFF-DC31D84A55AB}';
  CLSID_GabestMatroskaSplitter  : TGUID = '{0A68C3B5-9164-4A54-AFAF-995B2FF0E0D4}';
  CLSID_GabestRealMediaSplitter : TGUID = '{E21BE468-5C18-43EB-B0CC-DB93A847D769}';
  CLSID_GabestAviSplitter       : TGUID = '{9736D831-9D6C-4E72-B6E7-560EF9181001}';
  CLSID_HaaliMediaSplitter      : TGUID = '{55DA30FC-F16B-49FC-BAA5-AE59FC65F82D}'; //by BDZL
  CLSID_VideoRenderer           : TGUID = '{70E102B0-5556-11CE-97C0-00AA0055595A}'; //by BDZL
  CLSID_ffdshowVideDecoder      : TGUID = '{04FE9017-F873-410E-871E-AB91661A4EF7}'; //by BDZL
  CLSID_LAVSplitter             : TGUID = '{171252A0-8820-4AFE-9DF8-5C92B2D66B04}'; //by BDZL
  MAX_FONT_SIZE = 144;
  MIN_FONT_SIZE = 2;
  FONT_SIZE_TO_WIDTH = 600;
  FONT_SIZE_TO_BORDER = 22;
  FONT_SIZE_TO_SHADOW = 22;

// -----------------------------------------------------------------------------

type
  // DirectShow Media Player.
  TDSMP = record
    Initialized  : Boolean;
    // DirectShow stuff
    GraphBuilder : IGraphBuilder;
    MediaControl : IMediaControl;
    MediaSeeking : IMediaSeeking;
    MediaEventEx : IMediaEvent;
    BasicAudio   : IBasicAudio;
    BasicVideo   : IBasicVideo;
    VideoWindow  : IVideoWindow;
    VideoAvail   : Boolean;
    VideoWidth   : Integer;
    VideoHeight  : Integer;
    {SampleGrabberFilter : IBaseFilter; //added by adenry
    SampleGrabber: ISampleGrabber; //added by adenry
    am_media_type : AM_MEDIA_TYPE; //added by adenry}
  end;

  //added by adenry - for the SmoothBitmapResize procedure:
  //TRGBArray = array[0..32767] of TRGBTriple;
  //pRGBArray = ^TRGBArray;

// -----------------------------------------------------------------------------

procedure SetVideoPreviewMode(Flag: Boolean);
function FindFilter(Guid: TGUID): IBaseFilter;
function GetColorKeyFUNC: Integer;
function LoadMovie({const} FileName: String; AudioStream: SmallInt = 0; OverridePlayOnLoad: Boolean = False; VidPos: Int64 = 0): Boolean; //const removed by adenry, AudioStream, OverridePlayOnLoad, VidPos added by adenry
procedure FreeFile;
procedure SetPlaybackRate(Rate: Double; AlterAltPlayRateButton: Boolean = False);
procedure SetDefaultShortCut;
function GetPlaybackRate: Double;
procedure SetVideoPos(const Pos: Int64; MoveSeekBar: Boolean = True);
procedure Play;
procedure Pause;
procedure Stop;
function GetCurrentPos: Integer;
procedure SetTimeCounter(const CurrPos: Int64);
procedure InitializeTimeCounter; //added by adenry
procedure UpdateSubtitlesPos;
procedure UpdateVideoPos;
procedure EnableVPCtrls(Flag: Boolean);
procedure ShowVolumeControls(Flag: Boolean); //added by adenry
procedure SelectAudioStream(GraphBuilder: IGraphBuilder; StreamNum: SmallInt = 0); //added by adenry
//function TakeScreengrab(Bitmap: TBitmap; SCWidth, SCHeight: Integer): TBitmap; //added by adenry
//procedure SmoothBitmapResize(abmp: TBitmap; NuWidth, NuHeight: integer); //added by adenry
//procedure CreatePreviewThumbs; //added by adenry
procedure SetAspectRatio(AR: Real); //added by adenry
procedure UpdateSubSubtitleTextAndVisibility; //added by adenry
procedure UpdateSubSubtitleTextAfterNodeChange(Node: PVirtualNode); //added by adenry
procedure UpdateSubSubtitleVisibilityAfterNodeChange(Node: PVirtualNode; OldShowTime, OldHideTime, NewShowTime, NewHideTime: Integer); //added by adenry

// -----------------------------------------------------------------------------

var
  // ------------------------- //
  //  DirectShow Media Player  //
  // ------------------------- //
  Player        : TDSMP;
  VideoDuration : Int64;
  Playing       : Boolean;
  // ------------------- //
  //  Subtitle handling  //
  // ------------------- //
  StartSubTime : Integer = -1;
  EndSubTime   : Integer = -1;
  // --
  DefAltPlayRateShortcut : Integer = 16393;
  //PreviewThumbs : Array [1..100] of TBitmap; //added by adenry
  VideoAspectRatio : Real; //added by adenry

// -----------------------------------------------------------------------------

implementation

uses
  General, Functions, USubtitlesFunctions, TreeViewHandle, //TreeViewHandle added by adenry
  formMain;

// -----------------------------------------------------------------------------

procedure SetVideoPreviewMode(Flag: Boolean);
begin
  with frmMain do
  begin
    if Flag = True then
    begin
      mnuVideoPreviewMode.Checked := True;
      pnlVideo.Height := Round(pnlParent1.Height * VideoPanelRatio); //modified by adenry //pnlVideo.Height := (pnlParent1.Height div 2) - (spSplitter.Height div 2);
      if (spSplitter.Top < 70) then
        spSplitter.Top := 70;
      lstSubtitles.Top := pnlVideo.Height + spSplitter.Height;
      if pnlVideo.Visible = False then
        pnlVideo.Show;
      if spSplitter.Visible = False then
        spSplitter.Show;
      lstSubtitles.Height := pnlParent1.Height - spSplitter.Top - spSplitter.Height;
      //sbSeekBar.Position := 0;
      sbSeekBar.Show;
      UpdateVideoPos;
      if Player.Initialized then
        tcTimeCounter.Show else
      begin
        tcTimeCounter.Text1 := '';
        tcTimeCounter.Text2 := '';
      end;
      UpdateSubSubtitleTextAndVisibility; //added by adenry
    end else
    begin
      subSubtitle.Hide;
      subSubtitle.Text := ''; //added by adenry
      subSubtitle.SubtitleNum := 0; //added by adenry
      mnuVideoPreviewMode.Checked := False;
      spSplitter.Hide;
      pnlVideo.Hide;
      lstSubtitles.Top := 0;
      lstSubtitles.Height := pnlParent1.Height;
      tcTimeCounter.Hide;
      sbSeekBar.Hide;
    end;
    tbVideoPreviewMode.Down := Flag; //added by adenry
  end;
end;

// -----------------------------------------------------------------------------

function FindFilter(Guid: TGUID): IBaseFilter;
var
  EnumF   : IEnumFilters;
  Fetched : ULong;
  Fi      : IBaseFilter;
  g       : TGuid;
begin
  Result := nil;

  if Player.GraphBuilder = nil then
    exit;

  Player.GraphBuilder.EnumFilters(EnumF);
  if EnumF <> nil then
  begin
    while EnumF.Next(1, Fi, @Fetched) = S_OK do
    begin
      Fi.GetClassID(G);
      if IsEqualGUID(g, guid) then
        Result := Fi;
    end;
  end;
  Fi    := nil;
  EnumF := nil;
end;

// -----------------------------------------------------------------------------

function GetColorKeyFUNC: Integer;
var
  IO             : IOverlay;
  Pin            : IPin;
  Enum           : IEnumPins;
  f              : ULong;
  Ck             : TColorKey;
  fVideoRenderer : IBaseFilter;
begin
  Result:= RGB(0, 0, 0);
  FVideoRenderer := FindFilter(CLSID_VideoRenderer);
  //FVideoRenderer := FindFilter(CLSID_VideoMixingRenderer9);

  if FVideoRenderer = nil then
    FVideoRenderer := FindFilter(CLSID_VideoMixingRenderer);
  if FVideoRenderer = nil then
    exit;

  FVideoRenderer.EnumPins(Enum); 
  Enum.Next(1, Pin, @f);
  Enum:= nil;

  if Pin = nil then
    Exit;

  Pin.QueryInterface(IID_IOverlay, IO);
  if IO = nil then begin Pin:= nil; exit; end;

  IO.GetDefaultColorKey(Ck);

  Result := RGB(GetRValue(ck.HighColorValue),GetGValue(ck.HighColorValue),GetBValue(ck.HighColorValue));

  FVideoRenderer := nil;
  IO             := nil;
  Pin            := nil;
end;

// -----------------------------------------------------------------------------

//added by adenry: begin
//this is a copy of PlayOnlyStream1 with some changes
procedure SelectAudioStream(GraphBuilder: IGraphBuilder; StreamNum: SmallInt = 0); //StreamNum added by adenry
    function FindSplitter: IBaseFilter;
    var
      EnumF   : IEnumFilters;
      Fetched : ULong;
      Fi      : IBaseFilter;
      g       : TGuid;
    begin
      Result := nil;
      if GraphBuilder = nil then
        Exit;

      GraphBuilder.EnumFilters(EnumF);
      if EnumF <> nil then
      while EnumF.Next(1, Fi, @Fetched) = S_OK do
      begin
        Fi.GetClassID(G);
        if IsEqualGUID(G, CLSID_AviSplitter)            or
           IsEqualGUID(G, CLSID_OGGSplitter)            or
           IsEqualGUID(G, CLSID_MPEG1Splitter)          or
           IsEqualGUID(G, CLSID_MPEG2Splitter)          or
           IsEqualGUID(G, CLSID_GabestAviSplitter)      or
           IsEqualGUID(G, CLSID_GabestMatroskaSplitter) or
           IsEqualGUID(G, CLSID_ffdshowVideDecoder)     or //by BDZL
           IsEqualGUID(G, CLSID_HaaliMediaSplitter)     or //by BDZL
           IsEqualGUID(G, CLSID_VideoRenderer)          or //by BDZL
           IsEqualGUID(G, CLSID_LAVSplitter)            or //by BDZL
           IsEqualGUID(G, CLSID_GabestRealMediaSplitter) then
          Result := Fi;
      end;
      Fi    := nil;
      EnumF := nil;
    end;
  var
    EnumPins : IEnumPins;
    Fetched  : ULong;
    Pin      : IPin;
    Pin2     : IPin;
    PinType  : TAMMediaType;
    Splitter : IBaseFilter;
    a        : Byte;
    i        : Integer; //added by adenry
    tmi, tmi2: TMenuItem; //added by adenry
    StreamTitles : array of PWideChar; //added by adenry for stream titles
    //j        : Integer; //added by adenry
    //wc       :PWideChar; //added by adenry
    //pininfo: _PinInfo; //added by adenry
  begin

    Splitter := FindSplitter;

    if Assigned(Splitter) then
    begin
      Splitter.EnumPins(EnumPins);
      a := 0;
      //j := 0;
      while EnumPins.Next(1, Pin, @Fetched) = S_OK do
      begin
        //frmMAin.mmoNotes.Text := frmMain.mmoNotes.Text + ' p' + IntToStr(j);
        //added by adenry: begin
        //if Pin.ConnectionMediaType(PinType) = S_OK then
        //  if IsEqualGUID(PinType.MajorType, MEDIAType_Audio) then
        //    frmMAin.mmoNotes.Text := frmMain.mmoNotes.Text + ' a' + IntToStr(a);

        //TODO: if we could restore disconnected audio streams HERE, we wouldn't have to reaload the entire video when changing audio streams!!!

        //reconnect disconnected audio stream
        //if Pin.ConnectedTo(Pin2) = VFW_E_NOT_CONNECTED then
        //begin
        //  frmMAin.mmoNotes.Text := frmMain.mmoNotes.Text + ' p' + IntToStr(j) + ' is disc';
        //  if Pin.ConnectionMediaType(PinType) = S_OK then
        //  begin
        //    frmMAin.mmoNotes.Text := frmMain.mmoNotes.Text + ' p' + IntToStr(j) + ' MTypeOK';
        //    if IsEqualGUID(PinType.MajorType, MEDIAType_Audio) then
        //    begin
        //      frmMAin.mmoNotes.Text := frmMain.mmoNotes.Text + ' is Disc. Rec..';
        //      GraphBuilder.Render(Pin);
        //    end;
        //  end;
        //end;
        //if Pin.ConnectedTo(Pin2) <> VFW_E_NOT_CONNECTED then
        //  if Pin.ConnectionMediaType(PinType) = S_OK then
        //    if IsEqualGUID(PinType.MajorType, MEDIAType_Audio) then
        //      frmMAin.mmoNotes.Text := frmMain.mmoNotes.Text + ' is Con!';
        //added by adenry: end
        if Pin.ConnectionMediaType(PinType) = S_OK then
        begin
          if IsEqualGUID(PinType.MajorType, MEDIAType_Audio) then
          begin
            SetLength(StreamTitles, a+1); //added by adenry
            Pin.QueryId(StreamTitles[a]); //added by adenry - get stream title
            if a <> StreamNum then //changed by adenry - disconnect all audio streams, except the chosen one
            begin
              Pin.ConnectedTo(Pin2);
              //Pin2.QueryPinInfo(pininfo);
              //frmMAin.mmoNotes.Text := frmMain.mmoNotes.Text + ' name="'+pininfo.achName + '"';
              //Pin2.QueryId(wc);
              //frmMAin.mmoNotes.Text := frmMain.mmoNotes.Text + ' id2="'+wc + '"';
              //Pin.QueryId(wc);
              //frmMAin.mmoNotes.Text := frmMain.mmoNotes.Text + ' id1="'+wc + '"';
              GraphBuilder.Disconnect(Pin);
              GraphBuilder.Disconnect(Pin2);
              //frmMAin.mmoNotes.Text := frmMain.mmoNotes.Text + ' was Disc';
            end;
            Inc(a);
          end;
        end;
        //Inc(j);
      end;

      //added by adenry: begin
      //add audio stream menu items
      if a > 0 then
      begin
        frmMain.mnuAudioStream.Enabled := True;
        frmMain.mnuAudioStream.Clear;
        frmMain.mnuAudioStreamPopup.Enabled := True;
        frmMain.mnuAudioStreamPopup.Clear;
        for i := 0 to a do
        begin
          tmi            := TMenuItem.Create(frmMain);
          if i = 0 then
            tmi.Caption  := NoneAudioStream else
            tmi.Caption  := IntToStr(i) + '. ' + StreamTitles[i-1];
          tmi.Tag        := i-1;
          tmi.OnClick    := frmMain.mnuAudioStreamNClick;
          tmi.AutoCheck  := True;
          if StreamNum = i-1 then
            tmi.Checked := True;
          frmMain.mnuAudioStream.Add(tmi);
          tmi2           := TMenuItem.Create(frmMain);
          tmi2.Caption   := tmi.Caption;
          tmi2.Tag       := tmi.Tag;
          tmi2.OnClick   := tmi.OnClick;
          tmi2.AutoCheck := tmi.AutoCheck;
          tmi2.Checked   := tmi.Checked;
          frmMain.mnuAudioStreamPopup.Add(tmi2);
        end;
      end else
      begin
        frmMain.mnuAudioStream.Enabled := False;
        frmMain.mnuAudioStreamPopup.Enabled := False;
      end;
      //added by adenry: end
      EnumPins := nil;
      Splitter := nil;
    end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

function LoadMovie({const} FileName: String; AudioStream: SmallInt = 0; OverridePlayOnLoad: Boolean = False; VidPos: Int64 = 0): Boolean;
  procedure RemoveVMR(GraphBuilder: IGraphBuilder);
  var
    EnumPins      : IEnumPins;
    Fetched       : ULong;
    Pin           : IPin;
    OutPin        : IPin;
    Dir           : TPinDirection;
    VideoRenderer : IBaseFilter;
  begin
    if GraphBuilder = nil then
      exit;

    VideoRenderer := FindFilter(CLSID_VideoMixingRenderer);

    if Assigned(VideoRenderer) then
    begin
      VideoRenderer.EnumPins(EnumPins);
      // We see where is VMR connected and store the Pin
      while EnumPins.Next(1, Pin, @Fetched) = S_OK do
      begin
        Pin.QueryDirection(Dir);
        if Dir = PINDIR_INPUT then
        begin
          Pin.ConnectedTo(OutPin);
          Break;
        end;
      end;
      EnumPins := nil;

      GraphBuilder.RemoveFilter(VideoRenderer);

      VideoRenderer := nil;
      //set Default renderer or VMR9
      if frmMain.mnuVMR9VidRend.Checked then //added by adenry
        CoCreateInstance(TGUID(CLSID_VideoMixingRenderer9), nil, CLSCTX_INPROC_SERVER, TGUID(IID_IBaseFilter), VideoRenderer) else //added by adenry
      CoCreateInstance(TGUID(CLSID_VideoRenderer), nil, CLSCTX_INPROC_SERVER, TGUID(IID_IBaseFilter), VideoRenderer);

      if Assigned(VideoRenderer) then
      begin
        GraphBuilder.AddFilter(VideoRenderer, PWideChar(WideString('Video Renderer')));
        VideoRenderer.EnumPins(EnumPins);
        EnumPins.Next(1, Pin, @Fetched);
        EnumPins := nil;

        // Connect the other video renderer with the Pin that VMR was previously connected to
        if (Assigned(Pin)) and (Assigned(OutPin)) then
          GraphBuilder.Connect(OutPin, Pin);
      end;

      Pin           := nil;
      OutPin        := nil;
      VideoRenderer := nil;
    end;
  end;

  //removed by adenry: begin
  {procedure PlayOnlyStream1(GraphBuilder: IGraphBuilder);
    function FindSplitter: IBaseFilter;
    var
      EnumF   : IEnumFilters;
      Fetched : ULong;
      Fi      : IBaseFilter;
      g       : TGuid;
    begin
      Result := nil;
      if GraphBuilder = nil then
        Exit;

      GraphBuilder.EnumFilters(EnumF);
      if EnumF <> nil then
      while EnumF.Next(1, Fi, @Fetched) = S_OK do
      begin
        Fi.GetClassID(G);
        if IsEqualGUID(G, CLSID_AviSplitter)            or
           IsEqualGUID(G, CLSID_OGGSplitter)            or
           IsEqualGUID(G, CLSID_MPEG1Splitter)          or
           IsEqualGUID(G, CLSID_MPEG2Splitter)          or
           IsEqualGUID(G, CLSID_GabestAviSplitter)      or
           IsEqualGUID(G, CLSID_GabestMatroskaSplitter) or
           IsEqualGUID(G, CLSID_GabestRealMediaSplitter) then
          Result := Fi;
      end;
      Fi    := nil;
      EnumF := nil;
    end;
  var
    EnumPins : IEnumPins;
    Fetched  : ULong;
    Pin      : IPin;
    Pin2     : IPin;
    PinType  : TAMMediaType;
    Splitter : IBaseFilter;
    a        : Byte;
  begin
    Splitter := FindSplitter;

    if Assigned(Splitter) then
    begin
      Splitter.EnumPins(EnumPins);

      a := 0;
      while EnumPins.Next(1, Pin, @Fetched) = S_OK do
      begin
        if Pin.ConnectionMediaType(PinType) = S_OK then
        begin
          if IsEqualGUID(PinType.MajorType, MEDIAType_Audio) then
          begin
            if a >= 1 then
            begin
              Pin.ConnectedTo(Pin2);
              GraphBuilder.Disconnect(Pin);
              GraphBuilder.Disconnect(Pin2);
            end;
            Inc(a);
          end;
        end;
      end;
      EnumPins := nil;
      Splitter := nil;
    end;
  end;}
  //removed by adenry: end

var
  mFPS         : Double;
  TempFPS      : Single;
  TempDur      : Integer;
  RenderResult : HResult;
begin
  Result := False;
  FreeFile;

  with Player do
  begin
    Initialized := False;

    CoInitialize(nil);
    if Failed(CoCreateInstance(TGUID(CLSID_FilterGraph), nil, CLSCTX_INPROC_SERVER, TGUID(IID_IGraphBuilder), GraphBuilder)) then
      exit;

    //added by adenry: begin
    {CoCreateInstance(TGUID(CLSID_SampleGrabber), nil, CLSCTX_INPROC_SERVER, TGUID(IID_IBaseFilter), SampleGrabberFilter);
    SampleGrabberFilter.QueryInterface(IID_ISampleGrabber, SampleGrabber);
    ZeroMemory(@am_media_type, SizeOf(am_media_type));
    am_media_type.majortype := MEDIATYPE_Video;
    am_media_type.subtype := MEDIASUBTYPE_RGB24;
    am_media_type.formattype := FORMAT_VideoInfo;
    SampleGrabber.SetMediaType(am_media_type);
    //GraphBuilder.AddFilter(SampleGrabberFilter, PWideChar(WideString('Sample Grabber')));
    GraphBuilder.QueryInterface(IID_IMediaControl, MediaControl);
    //MediaControl.RenderFile(PWideChar(WideString(FileName)));

    SampleGrabber.GetConnectedMediaType(am_media_type);

    SampleGrabber.SetBufferSamples(True);

    //SampleGrabber.GetCurrentBuffer();}
    //added by adenry: end


    // ------------------ //
    //    File to play    //
    // ------------------ //
    RenderResult := GraphBuilder.RenderFile(PWideChar(WideString(FileName)), nil);

    if RenderResult <> S_OK then
    begin
      if (RenderResult <> VFW_S_AUDIO_NOT_RENDERED) and
         (RenderResult <> VFW_S_VIDEO_NOT_RENDERED) and
         (RenderResult <> VFW_S_PARTIAL_RENDER) and
         (RenderResult <> VFW_S_DUPLICATE_NAME) then
        exit
      else
        if (RenderResult <> VFW_S_PARTIAL_RENDER) and (RenderResult <> VFW_S_DUPLICATE_NAME) then //added by adenry
          MsgBox(Format(InfoMsg[10], ['$'+IntToHex(RenderResult, 8)]), BTN_OK, '', '', MB_ICONWARNING, frmMain);
    end;

    // Remove VMR Renderer
    RemoveVMR(GraphBuilder);

    // Play only audio stream 1 (if multiple audio streams)
    // PlayOnlyStream1(GraphBuilder); //removed by adenry

    //Select first audio stream
    SelectAudioStream(GraphBuilder, AudioStream); //added by adenry

    // -------------------------- //
    //    Fill Player variable    //
    // -------------------------- //
    if Failed(GraphBuilder.QueryInterface(IID_IMediaControl, MediaControl)) then exit;
    if Failed(GraphBuilder.QueryInterface(IID_IMediaSeeking, MediaSeeking)) then exit;
    if Failed(GraphBuilder.QueryInterface(IID_IMediaEventEx, MediaEventEx)) then exit;
    if Failed(GraphBuilder.QueryInterface(IID_IBasicAudio, BasicAudio)) then exit;
    if Failed(GraphBuilder.QueryInterface(IID_IBasicVideo, BasicVideo)) then exit;
    if Failed(GraphBuilder.QueryInterface(IID_IVideoWindow, VideoWindow)) then exit;

    // ------------------ //
    //   Set time format  //
    // ------------------ //
    MediaSeeking.SetTimeFormat(TIME_FORMAT_MEDIA_TIME);

    // ------------------- //
    // Assign video window //
    // ------------------- //
    VideoWindow.put_Owner(frmMain.pnlVideoDisplay.Handle); // Set owner
    VideoWindow.put_MessageDrain(frmMain.pnlVideoDisplay.Handle); // Set message drain to parent window
    VideoWindow.put_WindowStyle(WS_CHILD or WS_CLIPCHILDREN or WS_CLIPSIBLINGS); // Set window style
    VideoAvail := Assigned(BasicVideo) and Assigned(VideoWindow);
    MediaSeeking.GetDuration(VideoDuration);
    VideoDuration := VideoDuration div 10000;

    with frmMain do
    begin

      if VideoAvail then
      begin
        BasicVideo.get_VideoWidth(VideoWidth);
        BasicVideo.get_VideoHeight(VideoHeight);
        mFPS := 0;
        BasicVideo.get_AvgTimePerFrame(mFPS);

        if mFPS > 0 then
          mFPS := 1 / mFPS else
        begin
          mFPS := 0;
          GetVideoInfo(FileName, TempFPS, TempDur);
          mFPS := TempFPS;
        end;

        if mFPS > 0 then
          AddFPSItem(mFPS, True, False, False);
        MovieFPS := mFPS;
                         
        if TransparentSubs then
        begin
          subSubtitle.BackgroundColor := GetColorKeyFUNC;
          if ForceUsingReg then
            subSubtitle.ForceTransparency := True;
        end else
        begin
          subSubtitle.ForceTransparency := False;
          subSubtitle.BackgroundColor   := frmMain.BackgroundColor;
        end;
      end;

      //btnPlay.Hide; //moved from here by adenry
      //btnPause.Show; //moved from here by adenry
      MovieFile := FileName;
      if (mnuTranslatorMode.Checked) then
      begin
        if (mnuDisplayOriginal.Checked) then
          subSubtitle.Font.Charset := OrgCharset else
          subSubtitle.Font.Charset := TransCharset;
      end else
        subSubtitle.Font.Charset := OrgCharset;

      //Playing := True; //moved from here by adenry
      sbSeekBar.Max      := VideoDuration;
      sbSeekBar.Position := VidPos;
      tmrVideo.Enabled   := True;
      btnScrollList.Down := ScrollList;
      EnableVPCtrls(True);
      Player.Initialized := True; //moved before SetVideoPos by adenry
      InitializeTimeCounter; //added by adenry
      tcTimeCounter.Show;
      //SetTimeCounter(VidPos); //added by adenry
      SetVideoPos(VidPos);
      sbSeekbar.Repaint; //added by adenry to refresh subtitles graphical representation
    end;

    if frmMain.mnuVideoPreviewMode.Checked then
    begin
      UpdateVideoPos;
      UpdateSubtitlesPos;
    end;
    frmMain.VolumeSet(frmMain.sbVolume.Position); //added by adenry  

    // --------------- //
    //  Playback rate  //
    // --------------- //
    if frmMain.mnu10P.Checked then SetPlayBackRate(0.10, True) else
    if frmMain.mnu20P.Checked then SetPlayBackRate(0.20, True) else
    if frmMain.mnu30P.Checked then SetPlayBackRate(0.30, True) else
    if frmMain.mnu40P.Checked then SetPlayBackRate(0.40, True) else
    if frmMain.mnu50P.Checked then SetPlayBackRate(0.50, True) else
    if frmMain.mnu60P.Checked then SetPlayBackRate(0.60, True) else
    if frmMain.mnu70P.Checked then SetPlayBackRate(0.70, True) else
    if frmMain.mnu80P.Checked then SetPlayBackRate(0.80, True) else
    if frmMain.mnu90P.Checked then SetPlayBackRate(0.90, True) else
    if frmMain.mnu200P.Checked then SetPlayBackRate(2, True) else
    if frmMain.mnu300P.Checked then SetPlayBackRate(3, True) else
    if frmMain.mnu400P.Checked then SetPlayBackRate(4, True) else
      SetPlayBackRate(1, True);

    MediaControl.Run;

    //added by adenry: begin
    //Check Play video on load option
    if frmMain.PlayVideoOnLoad and (OverridePlayOnLoad = False) then
    begin
      frmMain.btnPlay.Hide; //moved here by adenry
      frmMain.btnPause.Show; //moved here by adenry
      Playing := True; //moved here by adenry
    end else
    begin
      frmMain.btnPlay.Show;
      frmMain.btnPause.Hide;
      Playing := False;
      MediaControl.Pause;
    end;
    //added by adenry: end

    //CreatePreviewThumbs; //added by adenry //commented out as it's just too slow
    Result := True;
  end;
end;

// -----------------------------------------------------------------------------

procedure FreeFile;
//var i: Integer; //added by adenry
begin
  with Player do
  begin
    Initialized := False;
    if Assigned(MediaEventEx) then MediaEventEx := nil;
    if Assigned(MediaSeeking) then MediaSeeking := nil;
    if Assigned(MediaControl) then MediaControl := nil;
    if Assigned(BasicAudio)   then BasicAudio   := nil;
    if Assigned(BasicVideo)   then BasicVideo   := nil;
    if Assigned(VideoWindow)  then VideoWindow  := nil;
    if Assigned(GraphBuilder) then GraphBuilder := nil;
    FillChar(Player, SizeOf(Player), 0);
    CoUninitialize;
    with frmMain do
    begin
      tmrVideo.Enabled    := False;
      sbSeekBar.Position  := 0;
      sbSeekBar.Enabled   := False;
      subSubtitle.Text    := '';
      subSubtitle.Visible := False;
      tcTimeCounter.Text1 := '';
      tcTimeCounter.Text2 := '';
      tcTimeCounter.Hide;
      MovieFile := '';
      EnableVPCtrls(False);
      frmMain.mnuAudioStream.Clear; //added by adenry
      frmMain.mnuAudioStreamPopup.Clear; //added by adenry
      Playing := False;
      btnPause.Hide;
      btnPlay.Show;
      //tcTimeCounter.Hide; //removed by adenry
    end;    
  end;

  //added by adenry: Free preview thumbnails memory:
  //for i := 1 to 100 do
  //  PreviewThumbs[i].Free;
end;

// -----------------------------------------------------------------------------

procedure SetPlaybackRate(Rate: Double; AlterAltPlayRateButton: Boolean = False);
begin
  with frmMain do
  begin
    if Player.Initialized then
    begin
      if Rate = GetPlaybackRate then
      begin
        mnu100P.Checked := True;
        Rate := 1;
      end;
      Player.MediaSeeking.SetRate(Rate);
      if AlterAltPlayRateButton then
      begin
        if Rate = 1 then
          btnAlterPlaybackRate.Down := False else
          btnAlterPlaybackRate.Down := True;
      end;
    end;  
  end;
end;

// -----------------------------------------------------------------------------

procedure SetDefaultShortCut;
begin
  with frmMain do
  begin
    mnu10P.ShortCut := 0;
    mnu20P.ShortCut := 0;
    mnu30P.ShortCut := 0;
    mnu40P.ShortCut := 0;
    mnu50P.ShortCut := 0;
    mnu60P.ShortCut := 0;
    mnu70P.ShortCut := 0;
    mnu80P.ShortCut := 0;
    mnu90P.ShortCut := 0;
    mnu150P.ShortCut := 0;
    mnu200P.ShortCut := 0;
    mnu300P.ShortCut := 0;
    mnu400P.ShortCut := 0;
    // 16393 = [Ctrl]+[Tab]
    case DefAltPlayRate of
      1: mnu10P.ShortCut := DefAltPlayRateShortcut;
      2: mnu20P.ShortCut := DefAltPlayRateShortcut;
      3: mnu30P.ShortCut := DefAltPlayRateShortcut;
      4: mnu40P.ShortCut := DefAltPlayRateShortcut;
      5: mnu50P.ShortCut := DefAltPlayRateShortcut;
      6: mnu60P.ShortCut := DefAltPlayRateShortcut;
      7: mnu70P.ShortCut := DefAltPlayRateShortcut;
      8: mnu80P.ShortCut := DefAltPlayRateShortcut;
      9: mnu90P.ShortCut := DefAltPlayRateShortcut;
      10: mnu150P.ShortCut := DefAltPlayRateShortcut;
      11: mnu200P.ShortCut := DefAltPlayRateShortcut;
      12: mnu300P.ShortCut := DefAltPlayRateShortcut;
      13: mnu400P.ShortCut := DefAltPlayRateShortcut;
    end;
  end;
end;

// -----------------------------------------------------------------------------

function GetPlaybackRate: Double;
begin
  Result := -1;
  if Player.Initialized then
    Player.MediaSeeking.GetRate(Result);
end;

// -----------------------------------------------------------------------------

procedure SetVideoPos(const Pos: Int64; MoveSeekBar: Boolean = True); //MoveSeekBar added by adenry
var
  vPos: Int64;
  tmrVideoEnabled: Boolean; //added by adenry
begin
  if (Player.Initialized) then
  begin
    with frmMain do
    begin
      vPos := Pos * 10000;
      tmrVideoEnabled := tmrVideo.Enabled; //added by adenry
      tmrVideo.Enabled := False;
      if vPos < 0 then vPos := 0;
      if vPos >= (VideoDuration * 10000) then //> changed to >= by adenry
      begin
        vPos := (VideoDuration * 10000);
        frmMain.btnPlay.Show;
        frmMain.btnPause.Hide;
      end;
      Player.MediaSeeking.SetPositions(vPos, AM_SEEKING_ABSOLUTEPOSITIONING, vPos, AM_SEEKING_NOPOSITIONING); //SET VIDEO POSITION
      if MoveSeekBar then //added by adenry
      begin
        sbSeekBar.Position := vPos div 10000;
        SetTimeCounter(vPos div 10000);
      end;
      UpdateSubSubtitleTextAndVisibility; //added by adenry
      if tmrVideoEnabled then //added by adenry
        tmrVideo.Enabled := True;
    end;
  end;
end;

// -----------------------------------------------------------------------------

procedure SetTimeCounter(const CurrPos: Int64);
begin
  //removed by adenry - InitializeTimeCounter used instead:
  {with frmMain do
  begin
    if frmMain.FormatType = ftTime then
    begin
      tcTimeCounter.Text1 := TimeToString(CurrPos);
      tcTimeCounter.Text2 := TimeToString(VideoDuration);
      tcTimeCounter.Text3 := FormatFloat('#.###', MovieFPS);
    end else
    begin
      tcTimeCounter.Text1 := IntToStr(TimeToFrames(CurrPos, MovieFPS));
      tcTimeCounter.Text2 := IntToStr(TimeToFrames(VideoDuration, MovieFPS));
    end;
    tcTimeCounter.Text3 := FormatFloat('#.###', MovieFPS);
  end;}
  //added by adenry:
  with frmMain do
    if FormatType = ftTime then
      tcTimeCounter.Text1 := TimeToString(CurrPos) else
      tcTimeCounter.Text1 := IntToStr(TimeToFrames(CurrPos, MovieFPS));
end;

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure InitializeTimeCounter;
begin
  with frmMain do
  begin
    if FormatType = ftTime then
      tcTimeCounter.Text2 := TimeToString(VideoDuration) else
      tcTimeCounter.Text2 := IntToStr(TimeToFrames(VideoDuration, MovieFPS));
    tcTimeCounter.Text3 := FormatFloat('#.###', MovieFPS);
  end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
// update subSubtitle every time the text of the subtitle it is displaying is changed
procedure UpdateSubSubtitleTextAfterNodeChange(Node: PVirtualNode);
var
  Data         : PSubtitleItem;
  CurrTime     : Integer;
  SubtitleText : String;
begin
  with frmMain do
  begin
    if (Player.Initialized) and (mnuVideoPreviewMode.Checked = True) then
    begin
      if lstSubtitles.RootNodeCount > 0 then
      begin
        CurrTime := GetCurrentPos;
        Data := lstSubtitles.GetNodeData(Node);
        if (CurrTime >= Data.InitialTime) and (CurrTime <= Data.FinalTime) then
        begin
          if mnuTranslatorMode.Checked and mnuDisplayTranslation.Checked then
            SubtitleText := Data.Translation else
            SubtitleText := Data.Text;

          //added by adenry: begin
          if MarkingInVideoPreview then
            if Data.Marked then
              subSubtitle.Font.Color := MarkingInVideoPreviewColor else
              subSubtitle.Font.Color := subSubtitle.TextColor; //subSubtitle.Font.Color stores the color for marking
          //added by adenry: end

          if subSubtitle.Text <> SubtitleText then
          begin
            subSubtitle.Hide;
            subSubtitle.Font.Charset := OrgCharset;
            subSubtitle.Text := SubtitleText;
            //added by adenry: begin
            if AlignLeftLineWithDash and (
            (Pos(#13#10+'-',RemoveSWTags(SubtitleText,True,True,True,True,True)) > 0) or
            ((OrgCharset in DashCharsets1)and(Pos(#13#10+#150,RemoveSWTags(SubtitleText,True,True,True,True,True)) > 0)) or
            ((OrgCharset in DashCharsets1)and(Pos(#13#10+#151,RemoveSWTags(SubtitleText,True,True,True,True,True)) > 0)) or
            ((OrgCharset in DashCharsets2)and(Pos(#13#10+#173,RemoveSWTags(SubtitleText,True,True,True,True,True)) > 0)) ) then
              subSubtitle.Alignment := taLeftJustify else
              subSubtitle.Alignment := Classes.taCenter;
            //added by adenry: end
            UpdateSubtitlesPos;
            if mnuShowSubtitles.Checked then
              subSubtitle.Show;
          end;
        end;
      end;
    end;
  end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
// update subSubtitle every time the timing of the subtitle it is displaying (or the timing of another subtitle sometimes) is changed
procedure UpdateSubSubtitleVisibilityAfterNodeChange(Node: PVirtualNode; OldShowTime, OldHideTime, NewShowTime, NewHideTime: Integer);
var
  Data         : PSubtitleItem;
  CurrTime     : Integer;
  SubtitleText : String;
begin
with frmMain do
begin
  if (Player.Initialized) and (mnuVideoPreviewMode.Checked = True) then
  if (OldShowTime <> NewShowTime) or (OldHideTime <> NewHideTime) then
  begin
    CurrTime := GetCurrentPos;
    if lstSubtitles.RootNodeCount > 0 then
    begin
        if subSubtitle.Visible = True then
        begin
          //check if subSubtitle should be hidden
          if (CurrTime >= OldShowTime) and (CurrTime <= OldHideTime) then
            if (CurrTime < NewShowTime) or (CurrTime > NewHideTime) then
            begin
              subSubtitle.Hide;
              subSubtitle.Text := '';
              subSubtitle.SubtitleNum := 0;
            end;
        end else
        if (CurrTime >= NewShowTime) and (CurrTime <= NewHideTime) then
        begin
          subSubtitle.SubtitleNum := Node.Index + 1; //added by adenry
          //check if subSubtitle should be shown
          Data := lstSubtitles.GetNodeData(Node);
          if mnuTranslatorMode.Checked and mnuDisplayTranslation.Checked then
            SubtitleText := Data.Translation else
            SubtitleText := Data.Text;

          //added by adenry: begin
          if MarkingInVideoPreview then
            if Data.Marked then
              subSubtitle.Font.Color := MarkingInVideoPreviewColor else
              subSubtitle.Font.Color := subSubtitle.TextColor; //subSubtitle.Font.Color stores the color for marking
          //added by adenry: end

          //if subSubtitle.Text <> SubtitleText then
          begin
            subSubtitle.Hide;
            subSubtitle.Font.Charset := OrgCharset;
            subSubtitle.Text := SubtitleText;
            //added by adenry: begin
            if AlignLeftLineWithDash and (
            (Pos(#13#10+'-',RemoveSWTags(SubtitleText,True,True,True,True,True)) > 0) or
            ((OrgCharset in DashCharsets1)and(Pos(#13#10+#150,RemoveSWTags(SubtitleText,True,True,True,True,True)) > 0)) or
            ((OrgCharset in DashCharsets1)and(Pos(#13#10+#151,RemoveSWTags(SubtitleText,True,True,True,True,True)) > 0)) or
            ((OrgCharset in DashCharsets2)and(Pos(#13#10+#173,RemoveSWTags(SubtitleText,True,True,True,True,True)) > 0)) ) then
              subSubtitle.Alignment := taLeftJustify else
              subSubtitle.Alignment := Classes.taCenter;
            //added by adenry: end
            UpdateSubtitlesPos;

            //if ScrollList then
            //begin
            //  UnSelectAll(lstSubtitles);
            //  lstSubtitles.ScrollIntoView(Node, True);
            //  lstSubtitles.Selected[Node] := True;
            //  lstSubtitles.FocusedNode    := Node;
            //  RefreshTimes; //added by adenry
            //end;

            if mnuShowSubtitles.Checked then
              subSubtitle.Show;
          end;
        end;
    end;
  end;
end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
//this was initially a part of procedure TfrmMain.tmrVideoTimer
procedure UpdateSubSubtitleTextAndVisibility;
var
  Node         : PVirtualNode;
  Data         : PSubtitleItem;
  LastNodeData : PSubtitleItem;
  CurrTime     : Integer;
  SubtitleText : String;
begin
with frmMain do
begin
  if (Player.Initialized) and (mnuVideoPreviewMode.Checked = True) then
  begin
    CurrTime := GetCurrentPos;
    if lstSubtitles.RootNodeCount > 0 then
    begin
      Node := lstSubtitles.GetFirst;
      LastNodeData := lstSubtitles.GetNodeData(lstSubtitles.GetLast);
      while Assigned(Node) do
      begin
        Data := lstSubtitles.GetNodeData(Node);
        if (CurrTime >= Data.InitialTime) and (CurrTime <= Data.FinalTime) then
        begin //we found the subtitle!
          subSubtitle.SubtitleNum := Node.Index + 1; //added by adenry
          if mnuTranslatorMode.Checked and mnuDisplayTranslation.Checked then
            SubtitleText := Data.Translation else
            SubtitleText := Data.Text;

          //added by adenry: begin
          if MarkingInVideoPreview then
            if Data.Marked then
              subSubtitle.Font.Color := MarkingInVideoPreviewColor else
              subSubtitle.Font.Color := subSubtitle.TextColor; //subSubtitle.Font.Color stores the color for marking
          //added by adenry: end

          if subSubtitle.Text <> SubtitleText then
          begin
            subSubtitle.Hide;
            subSubtitle.Font.Charset := OrgCharset;
            subSubtitle.Text := SubtitleText;
            //added by adenry: begin
            if AlignLeftLineWithDash and (
            (Pos(#13#10+'-',RemoveSWTags(SubtitleText,True,True,True,True,True)) > 0) or
            ((OrgCharset in DashCharsets1)and(Pos(#13#10+#150,RemoveSWTags(SubtitleText,True,True,True,True,True)) > 0)) or
            ((OrgCharset in DashCharsets1)and(Pos(#13#10+#151,RemoveSWTags(SubtitleText,True,True,True,True,True)) > 0)) or
            ((OrgCharset in DashCharsets2)and(Pos(#13#10+#173,RemoveSWTags(SubtitleText,True,True,True,True,True)) > 0)) ) then
              subSubtitle.Alignment := taLeftJustify else
              subSubtitle.Alignment := Classes.taCenter;
            //added by adenry: end
            UpdateSubtitlesPos;
            if ScrollList then
            begin
              UnSelectAll(lstSubtitles);
              lstSubtitles.ScrollIntoView(Node, True);
              lstSubtitles.Selected[Node] := True;
              lstSubtitles.FocusedNode    := Node;
              RefreshTimes; //added by adenry
            end;
            if mnuShowSubtitles.Checked then
              subSubtitle.Show;
          end;
          Break;
        end else
        if (CurrTime < Data.FinalTime)                //we are between subtitles
        or (CurrTime > LastNodeData.FinalTime) then   //we are after the last subtitle
        begin
          subSubtitle.Visible := False;
          subSubtitle.Text := '';
          subSubtitle.SubtitleNum := 0;
          Break;
        end;
        Node := Node.NextSibling;
      end;
    end;
  end;
end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//Update subSubtitle's Font.Size, Top, and Left proerties
procedure UpdateSubtitlesPos;
var
  W, H, bottom, newFontSize, newBorderWidth, newShadowWidth, newTop: Integer;
begin
  with frmMain do
  if not TogglingFullScreen then //added by adenry
  begin
    if (mnuVideoPreviewMode.Checked) then
    begin
      //added by adenry: begin
      //Set bottom border
      bottom := pnlVideoDisplay.Height;
      if (Player.Initialized) and (Player.VideoAvail) then //if (Assigned(Player.BasicVideo)) and KeepSubOnVideo then
      begin
        Player.VideoWindow.get_Height(H);
        if KeepSubOnVideo then
        begin
          bottom := H;
          if FullScreen or VertVideoAlign then
            bottom := H + ((pnlVideoDisplay.Height - H) div 2);
          //added later: fix position in fullscreen when the video controls panel is visible  
          if FullScreen and pnlVideoControls.Visible then
            bottom := H + ((pnlVideoDisplay.Height + pnlVideoControls.Height - H) div 2);
        end;
      end;
      //Set font size
      if RelativeFontSize then
      begin
        newFontSize := SubFontSize;
        if (Player.Initialized) and (Player.VideoAvail) then //if Assigned(Player.BasicVideo) then
        begin
          Player.VideoWindow.get_Width(W);
          newFontSize := Round(W/(FONT_SIZE_TO_WIDTH/SubFontSize));
          if newFontSize > MAX_FONT_SIZE then newFontSize := MAX_FONT_SIZE else
          if newFontSize < MIN_FONT_SIZE then newFontSize := MIN_FONT_SIZE;
          //subSubtitle.Font.Size := newFontSize;
        end;
        subSubtitle.Font.Size := newFontSize;
        newBorderWidth := Round(SubBorderWidth*(newFontSize/FONT_SIZE_TO_BORDER));
        if newBorderWidth < 1 then newBorderWidth := 1;
        subSubtitle.BorderWidth := newBorderWidth;
        newShadowWidth := Round(SubShadowWidth*(newFontSize/FONT_SIZE_TO_SHADOW));
        if newShadowWidth < 1 then newShadowWidth := 1;
        subSubtitle.ShadowWidth := newShadowWidth;
        newTop := bottom - subSubtitle.Height {- (newFontSize div 3)};
      end else
      begin
        newTop := bottom - subSubtitle.Height - 5;
      end;
      //Consider vertical position shift (set with mouse drag)
      if (Player.Initialized) and (Player.VideoAvail) then
        //newTop := newTop + Round(subSubtitleTopShift * H);
        if subSubtitleTopShift <> 0.0 then
          if KeepSubOnVideo then
            newTop := bottom - H + Round(subSubtitleTopShift * H) - subSubtitle.Height else
            newTop := bottom - Round(subSubtitleTopShift * H) - subSubtitle.Height;
      //Set Top and Left
      subSubtitle.Top := newTop;
      subSubtitle.Left := (pnlVideoDisplay.Width div 2) - (subSubtitle.Width div 2);
      //added by adenry: end

      //subSubtitle.Top := pnlVideoDisplay.Height - subSubtitle.Height - 5; //removed by adenry
      //subSubtitle.Left := (pnlParent1.Width div 2) - (subSubtitle.Width div 2); //removed by adenry
    end;
  end;
end;

// -----------------------------------------------------------------------------

procedure UpdateVideoPos;
var
  Proportion: Real;
  NewWidth, NewHeight, NewLeft, NewTop: Integer; //NewTop added by adenry
  {T,L,W,H,a:Longint;//tmp added by adenry
  tmp: String;//tmp added by adenry
  tmpHandle: OAHWND;//tmp added by adenry
  b: LongBool;//tmp added by adenry}
begin
  if not frmMain.TogglingFullScreen then //added by adenry
  if (Player.Initialized) and (Player.VideoAvail) and (frmMain.mnuVideoPreviewMode.Checked) then
  begin
    if (Player.VideoWidth > 0) and (Player.VideoHeight > 0) then
    begin
      if VideoAspectRatio <> -1.0 then      //added by adenry
        Proportion := VideoAspectRatio else //added by adenry
        Proportion := Player.VideoWidth / Player.VideoHeight;
      if (frmMain.pnlVideoDisplay.Width / frmMain.pnlVideoDisplay.Height) > Proportion then
      begin
        NewWidth  := Round(frmMain.pnlVideoDisplay.Height * Proportion);
        NewLeft   := (frmMain.pnlVideoDisplay.Width - NewWidth) Div 2;
        NewWidth  := NewLeft + NewWidth;
        NewHeight := frmMain.pnlVideoDisplay.Height;
        NewTop    := 0; //added by adenry
      end else
      begin
        NewHeight := Round(frmMain.pnlVideoDisplay.Width / Proportion);
        NewLeft   := 0;
        NewWidth  := frmMain.pnlVideoDisplay.Width;
        //added by adenry: begin
        if frmMain.VertVideoAlign or frmMain.FullScreen then
          NewTop  := (frmMain.pnlVideoDisplay.Height - NewHeight) div 2 else
          NewTop  := 0;
        //added by adenry: end
      end;
      
    {  Player.VideoWindow.put_Top(0);
      Player.VideoWindow.put_Left(NewLeft);
      Player.VideoWindow.put_Width(NewWidth-NewLeft);
      Player.VideoWindow.put_Height(NewHeight);
       }
      Player.VideoWindow.SetWindowPosition(NewLeft, NewTop, (NewWidth-NewLeft), (NewHeight)); //0 replaced with NewTop by adenry

      {//tests by adenry....
      Player.VideoWindow.get_Top(T); Player.VideoWindow.get_Left(L);
      Player.VideoWindow.get_Height(H); Player.VideoWindow.get_Width(W);

      //Player.VideoWindow.get_Visible(b); if b then tmp:='True' else tmp:='False'; //STAVA FALSE!!!
      //Player.VideoWindow.get_WindowStyle(a);tmp:=IntToStr(a); //IMA
      //if Assigned(Player.VideoWindow)then tmp:='assigned'else tmp:='NOT assigned'; //ASSIGNED E!
      //a:=Player.VideoWindow.get_Owner(tmpHandle); tmp:=IntToStr(a);
      //Player.BasicVideo.get_SourceWidth(a); tmp:=IntToStr(a);
      //if Failed(Player.GraphBuilder.QueryInterface(IID_IVideoWindow, Player.VideoWindow)) then tmp := 'Failed' else tmp := 'Succeeded';
      //Player.VideoWindow.get_Caption(tmp);
      //if Player.Initialized then tmp:='initialized' else tmp:='not initialized';
      //Application.MessageBox(PAnsiChar(tmp+' L:'+IntToStr(L)+' T:'+IntToStr(T)+' H:'+IntToStr(H)+' W:'+IntToStr(W)),'asd');
      //Application.MessageBox(PAnsiChar('L:'+IntToStr(NewLeft)+' T:'+IntToStr(NewTop)+' H:'+IntToStr(NewHeight)+' W:'+IntToStr(NewWidth-NewLeft)),'asd');}
    end;
  end;
end;

// -----------------------------------------------------------------------------

procedure Play;
var
  CurrentPos   : Int64; //added by adenry
begin
  if (Player.Initialized) and (Playing = False) then
  begin
    if frmMain.InPausedVideoPreviewMode then //added later by adenry
      SetVideoPos(frmMain.sbSeekBar.Position); //added by adenry - for when the video is played through a key shortcut while the mouse is still over the seekbar

    //added by adenry: begin
    //rewind the video to the start, if it is at the end
    Player.MediaSeeking.GetCurrentPosition(CurrentPos);
    if CurrentPos >= (VideoDuration * 10000) then
      SetVideoPos(0);
    //added by adenry: end

    Player.MediaControl.Run;
    Playing := True;
    frmMain.tmrVideo.Enabled := True;
    frmMain.btnPause.Visible := True;
    frmMain.btnPlay.Visible  := False;
  end;
end;

// -----------------------------------------------------------------------------

procedure Pause;
begin
  if (Player.Initialized) then
  begin
    if Playing = True then
    begin
      Player.MediaControl.Pause;
      Playing := False;
      frmMain.tmrVideo.Enabled := False;
      frmMain.btnPause.Visible := False;
      frmMain.btnPlay.Visible  := True;
      frmMain.sbSeekBar.Position := GetCurrentPos; //added by adenry - bug fix - set exact (still rounded) position when the video is paused
      SetTimeCounter(frmMain.sbSeekBar.Position); //added by adenry - bug fix - show exact (still rounded) current time when the video is paused
    end else
      Play;
  end;
end;

// -----------------------------------------------------------------------------

procedure Stop;
begin
  if (Player.Initialized) then
  begin
    //Player.MediaControl.Stop; //removed by adenry
    if Playing = True then Player.MediaControl.Pause; //added by adenry - Stop replaced with Pause so that MouseOver video preview could continue to function
    Playing := False;
    SetVideoPos(0);
    //frmMain.tmrVideo.Enabled := False; //removed by adenry - allows for refresh of subSubtitle on stop and is simply unnecessary
    frmMain.btnPause.Hide;
    frmMain.btnPlay.Show;
  end;
end;

// -----------------------------------------------------------------------------

function GetCurrentPos: Integer;
var
  cPos: Int64;
begin
  Result := 0;
  if (Player.Initialized) then
  begin
    Player.MediaSeeking.GetCurrentPosition(cPos);
    Result := cPos div 10000;
  end;
end;

// -----------------------------------------------------------------------------

procedure EnableVPCtrls(Flag: Boolean);
begin
  with frmMain do
  begin
    sbSeekBar.Enabled            := Flag;
    btnPlay.Enabled              := Flag;
    btnPause.Enabled             := Flag;
    btnStop.Enabled              := Flag;
    btnScrollList.Enabled        := Flag;
    btnPrevSub.Enabled           := Flag;
    btnNextSub.Enabled           := Flag;
    btnRew.Enabled               := Flag;
    btnForward.Enabled           := Flag;
    btnAlterPlaybackRate.Enabled := Flag;
    btnMoveSubtitle.Enabled      := Flag;
    btnSetShowTime.Enabled       := Flag;
    btnSetHideTime.Enabled       := Flag;
    btnStartSubtitle.Enabled     := Flag;
    btnEndSubtitle.Enabled       := Flag;
    btnSyncPoint1.Enabled        := Flag;
    btnSyncPoint2.Enabled        := Flag;
    btnAddSyncPoint.Enabled      := Flag;
    sbVolume.Enabled             := Flag; //added by adenry
    btnMute.Enabled              := Flag; //added by adenry
  end;
end;

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure ShowVolumeControls(Flag: Boolean);
begin
  with frmMain do
  begin
    if pnlControl.Visible and (Width < Constraints.MinWidth + pnlControl.Width) then
    begin
      sbVolume.Visible  := False;
      btnMute.Visible := False;
    end else
    begin
      sbVolume.Visible  := Flag;
      btnMute.Visible := Flag;
    end;
  end;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
{
procedure CreatePreviewThumbs;
var
  AR: Real;
  Width, Height: Integer;
  MaxWidth, MaxHeight: Integer;
  i: Integer;
begin
Screen.Cursor := crHourGlass;
try

  Pause;

  MaxWidth := 160;
  MaxHeight:= 120;
  AR := Player.VideoWidth / Player.VideoHeight;
  if (MaxHeight * AR) > MaxWidth then
  begin
    Width := MaxWidth;
    Height := Round(MaxWidth / AR);
  end else
  begin
    Height := MaxHeight;
    Width := Round(MaxHeight * AR);
  end;
  //frmMain.pnlVideoPreview.Width := Width;
  //frmMain.pnlVideoPreview.Height := Height;

  for i := 1 to 100 do
  begin
    PreviewThumbs[i] := TBitmap.Create;
    SetVideoPos(Round((VideoDuration / 100) * i));
    PreviewThumbs[i] := TakeScreengrab(PreviewThumbs[i], Width, Height);
  end;
  SetVideoPos(0);
  Pause;

finally
  Screen.Cursor := crDefault;
end;
end;
}
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
//Make a screengrab from the video
//Source: http://forum.4programmers.net/Delphi_Pascal/123438-Delphi_IBasicVideo.GetCurrentImage_-_do_TBitmap
{
function TakeScreengrab(Bitmap: TBitmap; SCWidth, SCHeight: Integer): TBitmap;

  function GetDibHeaderSize(Dib: PBitmapInfo): Integer;
  begin
    // Defaults for colors used, so get the color table count from
    // the number of bits per pixel
    if (Dib.bmiHeader.biClrUsed = 0) then
    begin
      case Dib.bmiHeader.biBitCount of
        1: Dib.bmiHeader.biClrUsed := 2;
        2: Dib.bmiHeader.biClrUsed := 4;
        3: Dib.bmiHeader.biClrUsed := 8;
        4: Dib.bmiHeader.biClrUsed := 16;
        5: Dib.bmiHeader.biClrUsed := 32;
        6: Dib.bmiHeader.biClrUsed := 64;
        7: Dib.bmiHeader.biClrUsed := 128;
        8: Dib.bmiHeader.biClrUsed := 256;
      end;
    end;
    Result := Dib.bmiHeader.biSize + (Dib.bmiHeader.biClrUsed * 4);
    if ((Dib.bmiHeader.biCompression = BI_BITFIELDS) and (Dib.bmiHeader.biSize = SizeOf(TBitmapInfoHeader))) then
      Result := Result + 12;
  end;

  function PackedDibToDibSection(Dib: PBitmapInfo): HBITMAP;

    function GetDibDataSize(Dib: PBitmapInfo): Integer;

      function AlignScan(Width: Dword; Depth: Dword): Dword;
      begin
        Result := (((Width * Depth) + $1F) and $FFFFFFE0) div 8;
      end;

    begin
      case Dib.bmiHeader.biCompression of
        BI_RGB, BI_BITFIELDS:
          begin
            Result := Integer(AlignScan(Dword(Dib.bmiHeader.biWidth), Dword(Dib.bmiHeader.biBitCount))) * Abs(Dib.bmiHeader.biHeight);
            Dib.bmiHeader.biSizeImage := Result;
          end;
        else Result := Dib.bmiHeader.biSizeImage;
      end;
    end;

  var
    BmHead   : TBitmapInfoHeader;
    HeadSize : Integer;
    DataSize : Integer;
    DataBits : Pointer;
  begin
    CopyMemory(@BmHead, Dib, SizeOf(Bmhead));
    // Get header and data size
    HeadSize := GetDibHeaderSize(@BmHead);
    DataSize := GetDibDataSize(@BmHead);
    // Create DibSection based on header
    Result := CreateDibSection(0, Dib^, DIB_RGB_COLORS, DataBits, 0, 0);
    // Copy bitmap to it
    if Result <> 0 then
      CopyMemory(DataBits, Pointer(@PByteArray(Dib)^[HeadSize]), DataSize);
  end;

var
  ErrCode         : HResult;
  Local           : PBitmapInfo;
  ASize           : Integer;
  ABitmap         : HBITMAP;
  //Bitmap          : TBitmap;

begin
  Result := nil;
  ASize := 0;
  Local := nil;
  ErrCode := Player.BasicVideo.GetCurrentImage(ASize, Local^);

  if ErrCode = S_OK then
  begin
    try
      GetMem(Local, ASize);
      if Player.BasicVideo.GetCurrentImage(ASize, Local^) = S_OK then
      begin
        ABitmap := PackedDibToDibSection(Local);
        //Bitmap := TBitmap.Create;
        Bitmap.Handle := ABitmap;
        SmoothBitmapResize(Bitmap, SCWidth, SCHeight);
        //Bitmap.Canvas.Draw(0, 0, frmMain.imgVideoPreview.Picture.Graphic);
        //frmMain.imgVideoPreview.Canvas.Draw(0, 0, Bitmap);
        //Bitmap.SaveToFile('c:\image_0001.bmp');
        //frmMain.imgVideoPreview.Picture.Assign(Bitmap);
        Result := Bitmap;
      end;
    finally
      FreeMem(Local);
      //Bitmap.Free;
    end;
  end else
    MsgBox('Screengrab Error: '+IntToHex(ErrCode,8), BTN_OK, '', '', MB_ICONERROR, frmMain);
end;
}
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
//Smooth bitmap resizing
//Source: http://users.atw.hu/delphicikk/listaz.php?id=2477&oldal=47
{
procedure SmoothBitmapResize(abmp: TBitmap; NuWidth, NuHeight: integer);
var
  xscale, yscale: Single;
  sfrom_y, sfrom_x: Single;
  ifrom_y, ifrom_x: Integer;
  to_y, to_x: Integer;
  weight_x, weight_y: array[0..1] of Single;
  weight: Single;
  new_red, new_green: Integer;
  new_blue: Integer;
  total_red, total_green: Single;
  total_blue: Single;
  ix, iy: Integer;
  bTmp: TBitmap;
  sli, slo: pRGBArray;
  //pointers for scanline access
  liPByte, loPByte, p: PByte;
  //offset increment
  liSize, loSize: integer;
begin
  abmp.PixelFormat := pf24bit;
  bTmp := TBitmap.Create;
  bTmp.PixelFormat := pf24bit;
  bTmp.Width := NuWidth;
  bTmp.Height := NuHeight;
  xscale := bTmp.Width / (abmp.Width - 1);
  yscale := bTmp.Height / (abmp.Height - 1);
  liPByte := abmp.Scanline[0];
  liSize := integer(abmp.Scanline[1]) - integer(liPByte);
  loPByte := bTmp.Scanline[0];
  loSize := integer(bTmp.Scanline[1]) - integer(loPByte);
  for to_y := 0 to bTmp.Height - 1 do
  begin
    sfrom_y := to_y / yscale;
    ifrom_y := Trunc(sfrom_y);
    weight_y[1] := sfrom_y - ifrom_y;
    weight_y[0] := 1 - weight_y[1];
    for to_x := 0 to bTmp.Width - 1 do
    begin
      sfrom_x := to_x / xscale;
      ifrom_x := Trunc(sfrom_x);
      weight_x[1] := sfrom_x - ifrom_x;
      weight_x[0] := 1 - weight_x[1];
      total_red := 0.0;
      total_green := 0.0;
      total_blue := 0.0;
      for ix := 0 to 1 do
      begin
        for iy := 0 to 1 do
        begin
          p := liPByte;
          Inc(p, liSize * (ifrom_y + iy));
          sli := pRGBArray(p);
          new_red := sli[ifrom_x + ix].rgbtRed;
          new_green := sli[ifrom_x + ix].rgbtGreen;
          new_blue := sli[ifrom_x + ix].rgbtBlue;
          weight := weight_x[ix] * weight_y[iy];
          total_red := total_red + new_red * weight;
          total_green := total_green + new_green * weight;
          total_blue := total_blue + new_blue * weight;
        end;
      end;
      p := loPByte;
      Inc(p, loSize * to_y);
      slo := pRGBArray(p);
      slo[to_x].rgbtRed := Round(total_red);
      slo[to_x].rgbtGreen := Round(total_green);
      slo[to_x].rgbtBlue := Round(total_blue);
    end;
  end;
  abmp.Width := bTmp.Width;
  abmp.Height := bTmp.Height;
  abmp.Canvas.Draw(0, 0, bTmp);
  bTmp.Free;
end;
}
//added by adenry: end

// -----------------------------------------------------------------------------

//added by adenry: begin
procedure SetAspectRatio(AR: Real);
begin
  VideoAspectRatio := AR;
  UpdateVideoPos;
  UpdateSubtitlesPos;
end;
//added by adenry: end

// -----------------------------------------------------------------------------

end.
