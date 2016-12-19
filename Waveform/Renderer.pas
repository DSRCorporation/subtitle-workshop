// -----------------------------------------------------------------------------
//  VisualSubSync
// -----------------------------------------------------------------------------
//  Copyright (C) 2003 Christophe Paris
// -----------------------------------------------------------------------------
//  This Program is free software; you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation; either version 2, or (at your option)
//  any later version.
//
//  This Program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with GNU Make; see the file COPYING.  If not, write to
//  the Free Software Foundation, 675 Mass Ave, Cambridge, MA 02139, USA.
//  http://www.gnu.org/copyleft/gpl.html
// -----------------------------------------------------------------------------

unit Renderer;

interface

uses Classes, Windows, DirectShow9, Messages, DirectVobsubInterface;

type
  TWaitCompletionThread = class;

  TRenderer = class
  private
    FOnStopPlaying : TNotifyEvent;
  public
    function PlayRange(Start, Stop : Cardinal; Loop : Boolean = False) : Boolean; virtual; abstract;
    procedure Pause; virtual; abstract;
    procedure Resume; virtual; abstract;
    procedure UpdatePlayRange(Start, Stop : Cardinal); virtual;
    function GetPosition : Cardinal; virtual; abstract;
    function GetDuration : Cardinal; virtual; abstract;
    procedure Stop(CallOnStopPlaying : Boolean = True); virtual; abstract;
    function IsOpen : Boolean; virtual; abstract;
    procedure SetRate(Rate : Integer); virtual;
    procedure SetVolume(Vol : Integer); virtual; abstract;
    procedure CopyState(Renderer : TRenderer); virtual; abstract;
  published
    property OnStopPlaying : TNotifyEvent read FOnStopPlaying write FOnStopPlaying;
  end;

  TDShowRenderer = class(TRenderer)
  private
    FGraphBuilder : IGraphBuilder;
    FMediaControl : IMediaControl;
    FMediaSeeking : IMediaSeeking;
    FMediaEventEx : IMediaEventEx;
    FVideoWindow : IVideoWindow;
    FBasicAudio : IBasicAudio;
    FDisplayWindowProc, FDisplayWindowOldProc : TFarProc;
    FLastResult : HRESULT;
    FWaitThread : TWaitCompletionThread;
    FLoop : Boolean;
    FStart, FStop : Int64;
    FVideoWidth, FVideoHeight : Integer;
    FVideoTop, FVideoLeft : Integer;
    FDisplayWindow : THandle;
    FIsOpen : Boolean;
    FStartStopAccessCS : TRtlCriticalSection;
    FAutoInsertCustomVSFilter : Boolean;
    FHCustomVSFilterInst : THandle;
    FCustomVSFilterIntallOk : Boolean;
    FROTID : Integer;

    function FGetStart : Int64;
    function FGetStop : Int64;
    function GetDirectVobSubFilter : IBaseFilter;
    function GetDirectVobSubInterface : IDirectVobSub;
    
  protected
    procedure DisplayWindowProc(var Mesg : TMessage);

  public
    constructor Create;
    destructor Destroy; override;
    function GetLastErrorString : string;
    function Open(filename : WideString) : Boolean;
    function PlayRange(Start, Stop : Cardinal; Loop : Boolean = False) : Boolean; override;
    procedure Pause; override;
    procedure Resume; override;
    procedure UpdatePlayRange(Start, Stop : Cardinal); override;
    function GetPosition : Cardinal; override;
    function GetDuration : Cardinal; override;    
    procedure Stop(CallOnStopPlaying : Boolean = True); override;
    function IsPlaying : Boolean;
    function IsPaused : Boolean;
    procedure Replay;
    procedure SetDisplayWindow(WinHwnd : THandle);
    procedure UpdateDisplayWindow;
    procedure KillVideo;
    procedure Close;
    function IsOpen : Boolean; override;
    procedure SetRate(Rate : Integer); override;
    procedure ShowImageAt(TimeMs : Cardinal);
    procedure SetVolume(Vol : Integer); override;
    procedure SetSubtitleFilename(Filename : WideString);
    procedure HideSubtitle(Hide : boolean);
    procedure SetAutoInsertCustomVSFilter(AutoInsert : Boolean);
    procedure UpdateImage;
    procedure CopyState(Renderer : TRenderer); override;
    function GetVSFilterFPS : Double;
    function GetFilters(list : TStrings) : Boolean;
    function GetFiltersAsString : string;
        
  published
    property OnStopPlaying;
    property VideoWidth : Integer read FVideoWidth;
    property VideoHeight : Integer read FVideoHeight;
    property StartTime : Int64 read FGetStart;
    property StopTime : Int64 read FGetStop;
  end;

  TWaitCompletionThread = class(TThread)
  private
    FRenderer : TDShowRenderer;
    hTerminateEvent : THandle;
  public
    constructor Create(Renderer : TDShowRenderer);
    destructor Destroy; override;
    procedure Execute; override;
    procedure SignalTermination;
  end;

  TWAVExtractionType = (wetOnlyPeakFile, wetNoConversion, wetFastConversion);
  TDSWavExtractor = class
  private
    FGraphBuilder : IGraphBuilder;
    FMediaControl : IMediaControl;
    FMediaSeeking : IMediaSeeking;
    FMediaEventEx : IMediaEventEx;
    FLastResult : HRESULT;
    FSplitter : IBaseFilter;
    FAudioStreamCount : Integer;
    FDuration : Int64;
    FSourceFilename : WideString;
    FDestinationFilename : WideString;
    FHWavWriterInst : THandle;
    FWAVExtractionType : TWAVExtractionType;

    function GetOutputAudioPinCount(Filter : IBaseFilter) : Integer;
    function GetPCMOutputPin(Filter : IBaseFilter) : IPin;
    function InstallWriter(Pin : IPin) : Boolean;
        
  public
    constructor Create;
    destructor Destroy; override;
    function Open(Filename : WideString) : Boolean;
    function SelectAudioPin(Index : Integer) : Boolean;
    procedure Go;    
    function GetLastErrorString : string;
    function GetProgress : Integer;
    function IsFinished : Boolean;
    procedure Close;
    function GetFilters(list : TStrings) : Boolean;
    function GetFiltersAsString : string;

  published
    property AudioStreamCount : Integer read FAudioStreamCount;
    property DestinationFilename : WideString read FDestinationFilename write FDestinationFilename;
    property WAVExtractionType : TWAVExtractionType read FWAVExtractionType write FWAVExtractionType;
  end;

  IWavWriterInterface = interface(IUnknown)
    function SetFastConversionMode(bFastConvertMode : DWORD) : HRESULT; stdcall;
    function GetFastConversionMode(out bFastConvertMode : DWORD) : HRESULT; stdcall;
    function SetSamplesPerPeakRatio(SamplePerPeakRatio : DWORD) : HRESULT; stdcall;
    function SetWritePeakFile(WritePeakFile : DWORD) : HRESULT; stdcall;
    function SetPeakFileName(pszFileName: PWideChar) : HRESULT; stdcall;
    function SetWriteWavFile(WriteWavFile : DWORD) : HRESULT; stdcall;
  end;

implementation

uses ActiveX, MMSystem, SysUtils, Types, MiscToolsUnit, Math, TntSysUtils;

const
  CLSID_WavWriter : TGUID = '{F3AFF1C3-ABBB-41f9-9521-988881D9D640}';
  IID_IWavWriter : TGUID = '{3B7A03CE-3D3B-4fef-8CDE-3D6C2709AFF1}';
  MEDIATYPE_Subtitle : TGUID = '{E487EB08-6B26-4be9-9DD3-993434D313FD}';

//==============================================================================

function CreateFilterFromFile(hLibInst : THandle; Guid : TGUID; out Filter) : HRESULT;
var DllGetClassObject : function(const clsid, iid : TGUID; var Obj) : HRESULT; stdcall;
    ClassFactory : IClassFactory;
begin
  Result := S_FALSE;
  DllGetClassObject := GetProcAddress(hLibInst, 'DllGetClassObject');
  if Assigned(DllGetClassObject) then
  begin
    Result := DllGetClassObject(Guid, IClassFactory, ClassFactory);
    if Result = S_OK then
    begin
      Result := ClassFactory.CreateInstance(nil,IBaseFilter,Filter);
    end;
  end;
end;

//------------------------------------------------------------------------------

function FindFilterByCLSID(GraphBuilder : IGraphBuilder; CLSID: TGUID): IBaseFilter;
var 
  EnumFilter: IEnumFilters;
  Fetched: ULong;
  BaseFilter: IBaseFilter;
  FilterCLSID: TGuid;
begin
  Result := nil;

  if GraphBuilder.EnumFilters(EnumFilter) <> S_Ok then
    Exit;
  
  while EnumFilter.Next(1, BaseFilter, @Fetched) = S_Ok do
  begin
    BaseFilter.GetClassID(FilterCLSID);
    if IsEqualGUID(FilterCLSID, CLSID) then
    begin 
      Result := BaseFilter;
      Break;
    end;
    BaseFilter := nil;
  end;
  BaseFilter := nil;
  EnumFilter := nil;
end;

//------------------------------------------------------------------------------

function GetFilterPin(Filter : IBaseFilter; Direction : TPinDirection; out ResultPin : IPin) : HRESULT;
var EnumPins: IEnumPins;
    Pin: IPin;
    ul: ULONG;
    PinDir: TPinDirection;
begin
  Result := S_FALSE;
  if Filter = nil then
    Exit;

  if Filter.EnumPins(EnumPins) <> S_OK then
    Exit;

  while (EnumPins.Next(1,Pin, @ul) = S_OK) do
  begin
    Pin.QueryDirection(PinDir);
    if PinDir = Direction then
    begin
      ResultPin := Pin;
      Break;
    end;
    Pin := nil;
  end;
  Pin := nil;
  EnumPins := nil;
end;

//------------------------------------------------------------------------------

function NukeDownstream(GraphBuilder : IGraphBuilder; Pin : IPin) : Boolean;
var
  PinConnectedTo, PinOut : IPin;
  EnumPins : IEnumPins;
  ul: ULONG;
  Filter : IBaseFilter;
	PinInfo : TPinInfo;
  PinDir: TPinDirection;
begin
  Pin.ConnectedTo(PinConnectedTo);
  if PinConnectedTo = nil then
  begin
    Result := False;
    Exit;
  end;
  PinConnectedTo.QueryPinInfo(PinInfo);
  Filter := PinInfo.pFilter;
  Filter.EnumPins(EnumPins);

  while (EnumPins.Next(1,PinOut, @ul) = S_OK) do
  begin
    PinOut.QueryDirection(PinDir);
    if (PinDir = PINDIR_OUTPUT) then
    begin
      NukeDownstream(GraphBuilder,PinOut);
    end;
    PinOut := nil;
  end;
  EnumPins := nil;
  PinConnectedTo := nil;
  GraphBuilder.RemoveFilter(Filter);
  Filter := nil;
  Result := True;
end;

//------------------------------------------------------------------------------

procedure DeleteMediaType(pmt: PAMMediaType);
begin
  if (pmt <> nil) then
  begin
    if (pmt^.cbFormat <> 0) then
      CoTaskMemFree(pmt^.pbFormat);
    if (pmt^.pUnk <> nil) then
      pmt^.pUnk := nil;
    CoTaskMemFree(pmt);
  end;
end;

//------------------------------------------------------------------------------

function IsPinOfMajorMediaType(Pin : IPin; RequestedMT : TGUID) : Boolean;
var
  EnumMT : IEnumMediaTypes;
  ul : ULONG;
  pMT : PAMMediaType;
begin
  Result := False;
  Pin.EnumMediaTypes(EnumMT);
  while (EnumMT.Next(1,pMT,@ul) = S_OK) do
  begin
    if IsEqualGUID(pMT.majortype, RequestedMT) then
    begin
      Result := True;
      DeleteMediaType(pMT);
      Break;
    end
    else
      DeleteMediaType(pMT);
  end;
  EnumMT := nil;
end;

//------------------------------------------------------------------------------

function IsAudioPin(Pin : IPin) : Boolean;
begin
  Result := IsPinOfMajorMediaType(Pin, MEDIATYPE_Audio);
end;

//------------------------------------------------------------------------------

function GetDllFilenameByCLSID(const GUID : TGUID) : string;
var KeyName, FileName : string;
    Key : HKEY;
    dwSize : DWORD;
begin
  Result := '';
  if IsEqualCLSID(GUID, GUID_NULL) then
    Exit;

  KeyName := Format('Software\Classes\CLSID\%s\InprocServer32', [GUIDToString(GUID)]);

  if (RegOpenKeyEx(HKEY_LOCAL_MACHINE, PChar(KeyName), 0, KEY_READ, Key) = ERROR_SUCCESS) then
  begin
    dwSize := 0;
    if (RegQueryValueEx(Key, nil, nil, nil, nil, @dwSize) = ERROR_SUCCESS) then
    begin
      SetLength(FileName, dwSize-1);
      if RegQueryValueEx(Key, nil, nil, nil, PBYTE(FileName), @dwSize) = ERROR_SUCCESS then
      begin
        Result := FileName;
      end;
    end;
    RegCloseKey(Key);
  end;
end;

// -----------------------------------------------------------------------------

function GetFriendlyNameByCLSID(const GUID : TGUID) : string;
var KeyName, FriendlyName : string;
    Key : HKEY;
    dwSize : DWORD;
begin
  Result := '';
  if IsEqualCLSID(GUID, GUID_NULL) then
    Exit;

  KeyName := Format('Software\Classes\CLSID\%s', [GUIDToString(GUID)]);
  if (RegOpenKeyEx(HKEY_LOCAL_MACHINE, PChar(KeyName), 0, KEY_READ, Key) = ERROR_SUCCESS) then
  begin
    dwSize := 0;
    if (RegQueryValueEx(Key, nil, nil, nil, nil, @dwSize) = ERROR_SUCCESS) then
    begin
      SetLength(FriendlyName, dwSize-1);
      if RegQueryValueEx(Key, nil, nil, nil, PBYTE(FriendlyName), @dwSize) = ERROR_SUCCESS then
      begin
        Result := FriendlyName;
      end;
    end;
    RegCloseKey(Key);
  end;
end;

// -----------------------------------------------------------------------------

function GetFiltersList(GraphBuilder : IGraphBuilder; list : TStrings) : Boolean;
var FilterEnum : IEnumFilters;
    Filter : IBaseFilter;
    ul: ULONG;
    FilterInfo : TFilterInfo;
    s : WideString;
    FilterGUID : TGUID;
    FileName, FriendlyName : WideString;
const
  IID_IPropertyBag : TGUID = '{55272A00-42CB-11CE-8135-00AA004BB851}';    
begin
  list.Clear;
  Result := False;
  if Assigned(GraphBuilder) then
  begin
    if Succeeded(GraphBuilder.EnumFilters(FilterEnum)) then
    begin
      while (FilterEnum.Next(1, Filter, @ul) = S_OK) do
      begin
        FilterInfo.achName[0] := #0;
        Filter.QueryFilterInfo(FilterInfo);
        s := FilterInfo.achName;
        FilterGUID := GUID_NULL;
        if Succeeded(Filter.GetClassID(FilterGUID)) then
        begin
          FriendlyName := GetFriendlyNameByCLSID(FilterGUID);
          if (Length(FriendlyName) > 0) and (s <> FriendlyName) then
          begin
            s := s + ' - ' + FriendlyName;
          end;
          s := s + ' - ' + GUIDToString(FilterGUID);
          FileName := GetDllFilenameByCLSID(FilterGUID);
          if (Length(FileName) > 0) then
          begin
            s := s + ' - ' + FileName;
            s := s + ' (' + GetFileVersionString(FileName) + ')';
          end;
        end;

        list.Add(s);
        Filter := nil;
      end;
      FilterEnum := nil;
    end;
  end;
end;

// -----------------------------------------------------------------------------

function AddToRot(Graph: IFilterGraph; out dwRegister : Integer): HRESULT;
var Moniker : IMoniker;
    ROT : IRunningObjectTable;
    wsz : WideString;
begin
  Result := GetRunningObjectTable(0, ROT);
  if Failed(Result) then
    Exit;
  wsz := Format('FilterGraph %p pid %x',[Pointer(Graph), GetCurrentProcessId()]);
  Result  := CreateItemMoniker('!', PWideChar(wsz), Moniker);
  if Failed(Result) then
    Exit;
  Result := ROT.Register(0, Graph, Moniker, dwRegister);
  Moniker := nil;
end;

// -----------------------------------------------------------------------------

function RemoveFromRot(dwRegister: Integer): HRESULT;
var ROT: IRunningObjectTable;
begin
  Result := GetRunningObjectTable(0, ROT);
  if Failed(Result) then
    Exit;
  Result := ROT.Revoke(dwRegister);
  ROT := nil;
end;


//==============================================================================

procedure TRenderer.UpdatePlayRange(Start, Stop : Cardinal);
begin
  // do nothing
end;

procedure TRenderer.SetRate(Rate : Integer);
begin
  // do nothing
end;

//==============================================================================

constructor TDShowRenderer.Create;
begin
  FGraphBuilder := nil;
  FMediaControl := nil;
  FMediaSeeking := nil;
  FMediaEventEx := nil;
  FOnStopPlaying := nil;
  FWaitThread := nil;
  FVideoWindow := nil;
  FLoop := False;
  FLastResult := S_OK;
  FIsOpen := False;
  FDisplayWindow := 0;
  FDisplayWindowProc := nil;
  FDisplayWindowOldProc := nil;
  FVideoWidth := 0;
  FVideoHeight := 0;
  FCustomVSFilterIntallOk := False;
  FAutoInsertCustomVSFilter := False;
  FHCustomVSFilterInst := 0;
  FROTID := 0;

  InitializeCriticalSection(FStartStopAccessCS);
end;

//------------------------------------------------------------------------------

destructor TDShowRenderer.Destroy;
begin
  if Assigned(FWaitThread) then
  begin
    FWaitThread.SignalTermination;
    FWaitThread.WaitFor;
    FWaitThread.Free;
    FWaitThread := nil;
  end;
  Close;
  DeleteCriticalSection(FStartStopAccessCS);
  inherited;
end;

//------------------------------------------------------------------------------

function TDShowRenderer.GetLastErrorString : string;
begin
  SetLength(Result,MAX_ERROR_TEXT_LEN);
  AMGetErrorText(FLastResult,@Result[1],MAX_ERROR_TEXT_LEN);
end;

//------------------------------------------------------------------------------

function TDShowRenderer.GetFilters(list : TStrings) : Boolean;
begin
  Result := GetFiltersList(FGraphBuilder, list);
end;

//------------------------------------------------------------------------------

function TDShowRenderer.GetFiltersAsString : string;
var strList : TStringList;
begin
  strList := TStringList.Create;
  GetFiltersList(FGraphBuilder, strList);
  Result := strList.Text;
  FreeAndNil(strList);
end;

//------------------------------------------------------------------------------

procedure TDShowRenderer.SetAutoInsertCustomVSFilter(AutoInsert : Boolean);
begin
  if (FAutoInsertCustomVSFilter <> AutoInsert) then
  begin
    FAutoInsertCustomVSFilter := AutoInsert;
  end;
end;

//------------------------------------------------------------------------------

function TDShowRenderer.Open(filename : WideString) : Boolean;
var
  BasicVideoI : IBasicVideo2;
  VSFilter : IBaseFilter;
  VSFilterVendorInfo : PWideChar;
begin
  if Assigned(FGraphBuilder) then
    Close;
  Result := False;
  if (filename = '') or (not WideFileExists(filename)) then
    Exit;
  FLastResult := CoCreateInstance(TGUID(CLSID_FilterGraph), nil, CLSCTX_INPROC,
    TGUID(IID_IGraphBuilder), FGraphBuilder);
  GetLastErrorString;
  if (FLastResult <> S_OK) then Exit;

  FLastResult := FGraphBuilder.QueryInterface(IID_IMediaControl, FMediaControl);
  if (FLastResult <> S_OK) then Exit;
  FLastResult := FGraphBuilder.QueryInterface(IID_IMediaSeeking, FMediaSeeking);
  if (FLastResult <> S_OK) then Exit;
  FLastResult := FGraphBuilder.QueryInterface(IID_IMediaEventEx, FMediaEventEx);
  if (FLastResult <> S_OK) then Exit;

  // TODO : For audio only graph we could avoid building the video or subtitle part from start.

  FCustomVSFilterIntallOk := False;
  if (FAutoInsertCustomVSFilter) then
  begin
    FHCustomVSFilterInst := CoLoadLibrary('VSSCustomVSFilter.dll',True);
    if (FHCustomVSFilterInst <> 0) then
    begin
      FLastResult := CreateFilterFromFile(FHCustomVSFilterInst,
        CLSID_DirectVobSubFilter, VSFilter);
      if Succeeded(FLastResult) then
        FGraphBuilder.AddFilter(VSFilter, 'VSS Custom VSFilter');
      VSFilter := nil;
    end;
  end;
  
  FLastResult := FGraphBuilder.RenderFile(@filename[1], nil);
  Result := (FLastResult = S_OK);
  FIsOpen := Result;

  FGraphBuilder.QueryInterface(IID_IBasicVideo2, BasicVideoI);
  BasicVideoI.get_VideoWidth(FVideoWidth);
  BasicVideoI.get_VideoHeight(FVideoHeight);
  BasicVideoI := nil;

  FGraphBuilder.QueryInterface(IID_IBasicAudio, FBasicAudio);

  VSFilter := GetDirectVobSubFilter;
  if Assigned(VSFilter) then
  begin
    FLastResult := VSFilter.QueryVendorInfo(VSFilterVendorInfo);
    if Succeeded(FLastResult) then
    begin
      FCustomVSFilterIntallOk := Pos('VSS Custom VSFilter', VSFilterVendorInfo) = 1;
      CoTaskMemFree(VSFilterVendorInfo);
    end;
  end;

  {AddToRot(FGraphBuilder, FROTID);}

  SetRate(100);
end;

//------------------------------------------------------------------------------

function TDShowRenderer.IsOpen : Boolean;
begin
  Result := FIsOpen;
end;

//------------------------------------------------------------------------------

function TDShowRenderer.PlayRange(Start, Stop : Cardinal; Loop : Boolean) : Boolean;
var StopDummy : Int64;
begin
  // First stop the graph in case it's running
  FMediaControl.Stop;
  if Assigned(FWaitThread) then
  begin
    FWaitThread.SignalTermination;
    FWaitThread.WaitFor;
    FWaitThread.Free;
  end;
  Result := False;
  FLoop := Loop;
  FStart := Int64(Start) * 10000;
  FStop := Int64(Stop) * 10000;
  StopDummy := 0;

  // We can't use the stop position
  // it cause problems with AVI (stop before the stop point :p),
  // and matroska splitter doesn't support stop

  FLastResult := FMediaSeeking.SetPositions(FStart,
    AM_SEEKING_AbsolutePositioning, StopDummy, AM_SEEKING_NoPositioning);
  if (FLastResult <> S_OK) then
    Exit;

  FWaitThread := TWaitCompletionThread.Create(Self);
  FLastResult := FMediaControl.Run;
  Result := (FLastResult = S_OK);
end;

//------------------------------------------------------------------------------

procedure TDShowRenderer.Pause;
var FilterState : TFilterState;
begin
  FilterState := State_Stopped;
  FMediaControl.GetState(1000, FilterState);
  if FilterState = State_Running then
  begin
    FMediaControl.Pause;
  end;
end;

//------------------------------------------------------------------------------

procedure TDShowRenderer.Resume;
var FilterState : TFilterState;
begin
  FilterState := State_Stopped; 
  FMediaControl.GetState(1000,FilterState);
  if FilterState = State_Paused then
  begin
    FMediaControl.Run;
  end;
end;

//------------------------------------------------------------------------------

procedure TDShowRenderer.UpdatePlayRange(Start, Stop : Cardinal);
begin
  EnterCriticalSection(FStartStopAccessCS);
  FStart := Int64(Start) * 10000;
  FStop := Int64(Stop) * 10000;
  LeaveCriticalSection(FStartStopAccessCS);  
end;

//------------------------------------------------------------------------------

function TDShowRenderer.FGetStart : Int64;
begin
  EnterCriticalSection(FStartStopAccessCS);
  Result := FStart;
  LeaveCriticalSection(FStartStopAccessCS);
end;

//------------------------------------------------------------------------------

function TDShowRenderer.FGetStop : Int64;
begin
  EnterCriticalSection(FStartStopAccessCS);
  Result := FStop;
  LeaveCriticalSection(FStartStopAccessCS);
end;

//------------------------------------------------------------------------------

procedure TDShowRenderer.Stop(CallOnStopPlaying : Boolean);
begin
  if not Assigned(FMediaControl) then
    Exit;

  FMediaControl.Stop;
  if Assigned(FWaitThread) then
  begin
    FWaitThread.SignalTermination;
    FWaitThread.WaitFor;
    FWaitThread.Free;
    FWaitThread := nil;
  end;
  if CallOnStopPlaying and Assigned(FOnStopPlaying) then
    FOnStopPlaying(Self);
end;

//------------------------------------------------------------------------------

function TDShowRenderer.GetPosition : Cardinal;
var CurrentTime : Int64;
begin
  FMediaSeeking.GetCurrentPosition(CurrentTime);
  if (CurrentTime < 0) then
  begin
    OutputDebugString('WARN in TDShowRenderer.GetPosition : CurrentTime < 0');
  end;
  Result := CurrentTime div 10000;
end;

//------------------------------------------------------------------------------

function TDShowRenderer.GetDuration : Cardinal;
var Duration : Int64;
begin
  FMediaSeeking.GetDuration(Duration);
  Result := Duration div 10000;
end;

//------------------------------------------------------------------------------

function TDShowRenderer.IsPlaying : Boolean;
var State : TFilterState;
begin
  Result := False;
  if Assigned(FMediaControl) then
  begin
    FMediaControl.GetState(0,State);
    Result := (State = State_Running);
  end;
end;

//------------------------------------------------------------------------------

function TDShowRenderer.IsPaused : Boolean;
var State : TFilterState;
begin
  Result := False;
  if Assigned(FMediaControl) then
  begin
    FMediaControl.GetState(0, State);
    Result := (State = State_Paused);
  end;
end;

//------------------------------------------------------------------------------

procedure TDShowRenderer.Replay;
begin
  PlayRange(FStart, FStop, FLoop);
end;

//------------------------------------------------------------------------------

procedure TDShowRenderer.DisplayWindowProc(var Mesg : TMessage);
var xPos, yPos : Short;
    CursorPos : TPoint;
begin
  with Mesg do
  begin
    case Msg of
    WM_SIZE: UpdateDisplayWindow;
    WM_RBUTTONUP:
      // Translate coordinate
      begin
        if (GetCursorPos(CursorPos) = True) and (ScreenToClient(FDisplayWindow, CursorPos) = True) then
        begin
          // horizontal position of cursor : LOWORD(lParam)
          // vertical position of cursor : HIWORD(lParam)
          xPos := CursorPos.X;
          yPos := CursorPos.Y;
          lParam := MakeLParam(xPos, yPos);
        end;
      end;
    end;
    
    Result := CallWindowProc(FDisplayWindowOldProc, FDisplayWindow, Msg,
      WParam, LParam);
  end;
end;

//------------------------------------------------------------------------------

procedure TDShowRenderer.SetDisplayWindow(WinHwnd : THandle);
var State : TFilterState;
begin
  if (FDisplayWindow = WinHwnd) then
    Exit;

  FMediaControl.GetState(0, State);
  if (State = State_Running) or (State = State_Paused) then
    FMediaControl.Stop;

  if Assigned(FVideoWindow) then
  begin
    FVideoWindow.put_Visible(False);
    FVideoWindow.put_MessageDrain(0);

    // This steal the focus, so we do it only before releasing the graph
    if WinHwnd = 0 then
      FVideoWindow.put_Owner(0);
    FVideoWindow := nil;
  end;

  // Unsubclass old window
  if (FDisplayWindowOldProc <> nil) then
  begin
    SetWindowLong(FDisplayWindow, GWL_WNDPROC, LongInt(FDisplayWindowOldProc));
    FreeObjectInstance(FDisplayWindowProc);
    FDisplayWindowProc := nil;
    FDisplayWindowOldProc := nil;
  end;

  FDisplayWindow := WinHwnd;
  if (WinHwnd <> 0) then
  begin
    FLastResult := FGraphBuilder.QueryInterface(IID_IVideoWindow, FVideoWindow);
    if Succeeded(FLastResult) and Assigned(FVideoWindow) then
    begin
      // Subclass new window to handle resize
      FDisplayWindowProc := MakeObjectInstance(DisplayWindowProc);
      FDisplayWindowOldProc := Pointer(GetWindowLong(FDisplayWindow, GWL_WNDPROC));
      SetWindowLong(FDisplayWindow, GWL_WNDPROC, LongInt(FDisplayWindowProc));

      FVideoWindow.put_Owner(FDisplayWindow);
      //FVideoWindow.put_AutoShow(False);
      FVideoWindow.put_MessageDrain(FDisplayWindow);
      FVideoWindow.put_WindowStyle(WS_CHILD + WS_CLIPSIBLINGS + WS_CLIPCHILDREN);
      //FVideoWindow.put_Visible(True);

      UpdateDisplayWindow;
    end;

    if (State = State_Running) then
      FMediaControl.Run
    else if(State = State_Paused) then
      FMediaControl.Pause;
  end;
end;

//------------------------------------------------------------------------------

procedure TDShowRenderer.UpdateDisplayWindow;
var Rect : TRect;
    WinWidth, WinHeight : Integer;
    NewWidth, NewHeight : Integer;
begin
  if (FDisplayWindow = 0) or (not Assigned(FVideoWindow)) or
     (FVideoWidth = 0) or (FVideoHeight = 0) then
    Exit;

  if (GetWindowRect(FDisplayWindow, Rect) = False) then
    Exit;
  WinWidth := Rect.Right - Rect.Left;
  WinHeight := Rect.Bottom - Rect.Top;

  if (FVideoWidth / FVideoHeight) > (WinWidth / WinHeight) then
  begin
    NewHeight := (WinWidth * FVideoHeight) div FVideoWidth;
    NewWidth := WinWidth;
  end
  else
  begin
    NewWidth := (FVideoWidth * WinHeight) div FVideoHeight;
    NewHeight := WinHeight;
  end;

  FVideoTop := (WinHeight - NewHeight) div 2;
  FVideoLeft := (WinWidth - NewWidth) div 2;
  FVideoWindow.SetWindowPosition(
    FVideoLeft,
    FVideoTop,
    NewWidth,
    NewHeight);
end;

//------------------------------------------------------------------------------

procedure TDShowRenderer.KillVideo;
var FiltersEnum : IEnumFilters;
    Filter, Splitter : IBaseFilter;
    ul : ULONG;
    PinsEnum : IEnumPins;
    Pin, VideoPin : IPin;
    PinDir: TPinDirection;
    HasVideo, HasAudio : Boolean;
    MT : TAMMediaType;
begin
  // We search for a filter that has a video output and an audio output (that
  // should be the splitter ;-)
  FGraphBuilder.EnumFilters(FiltersEnum);
  while FiltersEnum.Next(1,Filter,@ul) = S_OK do
  begin
    HasVideo := False;
    HasAudio := False;
    Filter.EnumPins(PinsEnum);
    while PinsEnum.Next(1,Pin,@ul) = S_OK do
    begin
      Pin.QueryDirection(PinDir);
      if (PinDir = PINDIR_OUTPUT) then
      begin
        if Pin.ConnectionMediaType(MT) = S_OK then
        begin
          if IsEqualGUID(MT.majortype, MEDIATYPE_Video) then
          begin
            HasVideo := True;
            VideoPin := nil;
            VideoPin := Pin;
          end
          else if IsEqualGUID(MT.majortype, MEDIATYPE_Audio) then
          begin
            HasAudio := True;
          end;
          if HasAudio and HasVideo then
            Break;
        end;
      end;
      Pin := nil;
    end;
    if HasAudio and HasVideo then
    begin
      Splitter := Filter;
      Break;
    end;
    Filter := nil;
  end;
  Pin := nil;  
  PinsEnum := nil;
  FiltersEnum := nil;
  Filter := nil;

  if Assigned(VideoPin) then
  begin
    NukeDownstream(FGraphBuilder,VideoPin);
  end;
end;

//------------------------------------------------------------------------------

procedure TDShowRenderer.SetRate(Rate : Integer);
begin
  if Assigned(FMediaSeeking) then
    FMediaSeeking.SetRate(Rate / 100);
end;

//------------------------------------------------------------------------------

procedure TDShowRenderer.SetVolume(Vol : Integer);
var NewVolume : Integer;
begin
  if Assigned(FBasicAudio) then
  begin
    if (Vol <= 0) then
    begin
      FBasicAudio.put_Volume(-10000);
    end
    else
    begin
      NewVolume := Round(1000*Log2(Vol / 100.0));
      FBasicAudio.put_Volume(NewVolume);
    end;
  end;
end;

//------------------------------------------------------------------------------

procedure TDShowRenderer.ShowImageAt(TimeMs : Cardinal);
var SeekToTime100NS, StopDummy : Int64;
begin
  if Assigned(FMediaSeeking) then
  begin
    FLastResult := FMediaControl.Stop;
    if (FLastResult <> S_OK) then
      Exit;
    SeekToTime100NS := Int64(TimeMs) * 10000;
    StopDummy := 0;

    FLastResult := FMediaSeeking.SetPositions(SeekToTime100NS,
      AM_SEEKING_AbsolutePositioning,
      StopDummy,
      AM_SEEKING_NoPositioning);
    if (FLastResult <> S_OK) then
      Exit;

    FMediaControl.StopWhenReady;
  end;
end;

//------------------------------------------------------------------------------

procedure TDShowRenderer.Close;
begin
  if (FROTID <> 0) then
  begin
    RemoveFromRot(FROTID);
    FROTID := 0;
  end;
  FVideoWidth := 0;
  FVideoHeight := 0;  
  FIsOpen := False;
  if Assigned(FMediaControl) then FMediaControl.Stop;
  SetDisplayWindow(0);
  if Assigned(FBasicAudio) then FBasicAudio := nil;
  if Assigned(FMediaControl) then FMediaControl := nil;
  if Assigned(FMediaEventEx) then FMediaEventEx := nil;
  if Assigned(FMediaSeeking) then FMediaSeeking := nil;
  if Assigned(FGraphBuilder) then FGraphBuilder := nil;
  if (FHCustomVSFilterInst <> 0) then
  begin
    CoFreeLibrary(FHCustomVSFilterInst);
    FHCustomVSFilterInst := 0;
  end;

end;

//------------------------------------------------------------------------------

function TDShowRenderer.GetDirectVobSubFilter : IBaseFilter;
begin
  Result := nil;
  if not Assigned(FGraphBuilder) then
    Exit;
  Result := FindFilterByCLSID(FGraphBuilder,
    CLSID_DirectVobSubFilter);
  if not Assigned(Result) then
  begin
    Result := FindFilterByCLSID(FGraphBuilder, CLSID_DirectVobSubFilterAuto);
  end;
end;

//------------------------------------------------------------------------------

function TDShowRenderer.GetDirectVobSubInterface : IDirectVobSub;
var DirectVobSubFilter : IBaseFilter;
begin
  Result := nil;
  DirectVobSubFilter := GetDirectVobSubFilter;
  if not Assigned(DirectVobSubFilter) then
    Exit;
  
  DirectVobSubFilter.QueryInterface(IID_IIDirectVobSub, Result);
  if not Assigned(Result) then
  begin
    DirectVobSubFilter := nil;
    Exit;
  end;
  DirectVobSubFilter := nil;
end;

//------------------------------------------------------------------------------

procedure TDShowRenderer.SetSubtitleFilename(Filename : WideString);
var DirectVobSub :IDirectVobSub;
begin
  DirectVobSub := GetDirectVobSubInterface;
  if Assigned(DirectVobSub) then
  begin
    if FCustomVSFilterIntallOk then
    begin
      DirectVobSub.put_PreBuffering(FALSE);
      DirectVobSub.put_SubtitleReloader(TRUE);
      DirectVobSub.put_LoadSettings(2, FALSE, FALSE, FALSE);
      DirectVobSub.put_FileName(PWideChar(Filename));
    end;
    DirectVobSub := nil;
  end;
end;

//------------------------------------------------------------------------------

procedure TDShowRenderer.HideSubtitle(Hide : boolean);
var DirectVobSub :IDirectVobSub;
begin
  DirectVobSub := GetDirectVobSubInterface;
  if Assigned(DirectVobSub) then
  begin
    if FCustomVSFilterIntallOk then
    begin
      DirectVobSub.put_HideSubtitles(Hide);
    end;
    DirectVobSub := nil;
  end;
end;

//------------------------------------------------------------------------------

procedure TDShowRenderer.UpdateImage;
var SeekToTime100NS, StopDummy : Int64;
begin
  if Assigned(FMediaSeeking) then
  begin
    FMediaSeeking.GetCurrentPosition(SeekToTime100NS);
    StopDummy := 0;

    FLastResult := FMediaSeeking.SetPositions(SeekToTime100NS,
      AM_SEEKING_AbsolutePositioning,
      StopDummy,
      AM_SEEKING_NoPositioning);
    if (FLastResult <> S_OK) then
      Exit;
  end;
end;

//------------------------------------------------------------------------------

procedure TDShowRenderer.CopyState(Renderer : TRenderer);
var CurrentPosition, StopDummy : Int64;
    DShowRenderer : TDShowRenderer;
begin
  DShowRenderer := Renderer as TDShowRenderer;
  if Assigned(DShowRenderer) and Assigned(FMediaSeeking) and Assigned(DShowRenderer.FMediaSeeking) then
  begin
    DShowRenderer.FMediaSeeking.GetCurrentPosition(CurrentPosition);
    FMediaSeeking.SetPositions(CurrentPosition,
      AM_SEEKING_AbsolutePositioning,
      StopDummy,
      AM_SEEKING_NoPositioning);
    FLoop := DShowRenderer.FLoop;
    FStart := DShowRenderer.FStart;
    FStop := DShowRenderer.FStop;
    if DShowRenderer.IsPlaying or DShowRenderer.IsPaused then
    begin
      // Renderer will be in paused state after copy state
      if Assigned(FWaitThread) then
      begin
        FWaitThread.SignalTermination;
        FWaitThread.WaitFor;
        FWaitThread.Free;
      end;
      FWaitThread := TWaitCompletionThread.Create(Self);
      FLastResult := FMediaControl.Pause;
    end;
  end;
end;

//------------------------------------------------------------------------------

function TDShowRenderer.GetVSFilterFPS : Double;
var DirectVobSub :IDirectVobSub;
    fpsEnabled : LongBool;
    fps : Double;
begin
  fps := -1.0;
  fpsEnabled := False;
  DirectVobSub := GetDirectVobSubInterface;
  if Assigned(DirectVobSub) then
  begin
    DirectVobSub.get_MediaFPS(fpsEnabled, fps);
  end;
  Result := fps;
end;

//==============================================================================

constructor TWaitCompletionThread.Create(Renderer : TDShowRenderer);
begin
  FRenderer := Renderer;
  hTerminateEvent := CreateEvent(nil,False,False,nil);
  inherited Create(False);
end;

//------------------------------------------------------------------------------

destructor TWaitCompletionThread.Destroy;
begin
  CloseHandle(hTerminateEvent);
  inherited;
end;

//------------------------------------------------------------------------------

procedure TWaitCompletionThread.SignalTermination;
begin
  Terminate;
  SetEvent(hTerminateEvent);
end;

//------------------------------------------------------------------------------

procedure TWaitCompletionThread.Execute;
const WAIT_TIMEOUT_MS : Integer = 1;
const HALF_WAIT_TIMEOUT_100NS : Integer = 5000;
var
  hInQueueEvent : THandle;
  evCode, param1, param2 : Integer;
  bDone : Boolean;
  EventsArray : array[0..1] of THandle;
  WaitResult : Cardinal;
  CurrentPos, StartPos : Int64;
  StopDummy : Int64;
label TWaitCompletionThread_Restart;
begin
  if (FRenderer.FMediaEventEx.GetEventHandle(OAEVENT(hInQueueEvent)) <> S_OK) then
    // Insert failure-handling code here
    Exit;

  EventsArray[0] := hTerminateEvent;
  EventsArray[1] := hInQueueEvent;

TWaitCompletionThread_Restart:

  bDone := False;
  while (not bDone) and (not Self.Terminated) do
  begin
    WaitResult := WaitForMultipleObjects(2, @EventsArray, False, WAIT_TIMEOUT_MS);
    if (WaitResult = WAIT_OBJECT_0+1) then
    begin
      while (FRenderer.FMediaEventEx.GetEvent(evCode, param1, param2, 0) = S_OK) do
      begin
        FRenderer.FMediaEventEx.FreeEventParams(evCode, param1, param2);
        bDone := (evCode = EC_COMPLETE);
      end;
    end;
    // Check position
    FRenderer.FMediaSeeking.GetCurrentPosition(CurrentPos);
    if (CurrentPos >= FRenderer.StopTime - HALF_WAIT_TIMEOUT_100NS) or
       (CurrentPos < FRenderer.StartTime) then
    begin
      bDone := True;
    end;
  end;

  if bDone then
  begin
    if FRenderer.FLoop then
    begin
      StartPos := FRenderer.StartTime;
      FRenderer.FMediaSeeking.SetPositions(StartPos,
        AM_SEEKING_AbsolutePositioning, StopDummy, AM_SEEKING_NoPositioning);
      goto TWaitCompletionThread_Restart;
    end
    else
    begin
      FRenderer.FMediaControl.Stop;
      if Assigned(FRenderer.FOnStopPlaying) then
        FRenderer.FOnStopPlaying(FRenderer);
    end;
  end;
end;

//==============================================================================

constructor TDSWavExtractor.Create;
begin
  FLastResult := S_OK;
  FAudioStreamCount := 0;
  FHWavWriterInst := CoLoadLibrary('WavWriter.dll',True);
  if (FHWavWriterInst = 0) then
    MessageBox(0, 'Error while loading WavWriter.dll', 'Error', MB_OK);
end;

//------------------------------------------------------------------------------

destructor TDSWavExtractor.Destroy;
begin
  Close;
  if (FHWavWriterInst <> 0) then
  begin
    //CoFreeLibrary(FHWavWriterInst); // TODO : why it b0rks ?
    //FHWavWriterInst := 0;
  end;
  inherited;
end;

//------------------------------------------------------------------------------

function TDSWavExtractor.GetOutputAudioPinCount(Filter : IBaseFilter) : Integer;
var
  EnumPins : IEnumPins;
  ul: ULONG;
  Pin : IPin;
  PinDir: TPinDirection;
begin
  Result := 0;
  Filter.EnumPins(EnumPins);
  while (EnumPins.Next(1,Pin, @ul) = S_OK) do
  begin
    Pin.QueryDirection(PinDir);
    if (PinDir = PINDIR_OUTPUT) and IsAudioPin(Pin) then
      Inc(Result);
    Pin := nil;
  end;
end;

//------------------------------------------------------------------------------

function TDSWavExtractor.Open(Filename : WideString) : Boolean;
var
  Filter : IBaseFilter;
  Pin1, Pin2 : IPin;
  PinInfo : TPinInfo;
  EnumPins : IEnumPins;
  ul: ULONG;
  Count: Cardinal;
begin
  Result := False;
  if (FHWavWriterInst = 0) then
    Exit;

  if Assigned(FGraphBuilder) then
    Close;

  OutputDebugStringW('TDSWavExtractor.Open: Creating Graph builder');
  FLastResult := CoCreateInstance(TGUID(CLSID_FilterGraph), nil, CLSCTX_INPROC,
    TGUID(IID_IGraphBuilder), FGraphBuilder);
  GetLastErrorString;
  if (FLastResult <> S_OK) then Exit;
  FLastResult := FGraphBuilder.QueryInterface(IID_IMediaControl, FMediaControl);
  if (FLastResult <> S_OK) then Exit;
  FLastResult := FGraphBuilder.QueryInterface(IID_IMediaSeeking, FMediaSeeking);
  if (FLastResult <> S_OK) then Exit;
  FLastResult := FGraphBuilder.QueryInterface(IID_IMediaEventEx, FMediaEventEx);
  if (FLastResult <> S_OK) then Exit;

  OutputDebugStringW(PWideChar('TDSWavExtractor.Open: Adding source filter ' + Filename));
  FLastResult := FGraphBuilder.AddSourceFilter(@Filename[1],nil,Filter);
  if (FLastResult <> S_OK) then Exit;

  // Try to render pins on the source filter to get audio data
  OutputDebugStringW('TDSWavExtractor.Open: Rendering all source filter pins');
  Filter.EnumPins(EnumPins);
  Count := 0;
  while EnumPins.Next(1,Pin1, @ul) = S_OK do
  begin
    // We are only interested in audio or data stream (containing audio) pin here.
    // To be safe just don't try to render video or subtitles 
    if (not IsPinOfMajorMediaType(Pin1, MEDIATYPE_Video)) and
       (not IsPinOfMajorMediaType(Pin1, MEDIATYPE_Text)) and
       (not IsPinOfMajorMediaType(Pin1, MEDIATYPE_Subtitle)) then
    begin
      FLastResult := FGraphBuilder.Render(Pin1);
      if FLastResult = S_OK then
        Inc(Count)
    end;
    Pin1 := nil;
  end;
  EnumPins := nil;
  // Abort if no pin could be rendered
  if Count = 0 then
    Exit;

  // Get the duration
  OutputDebugStringW('TDSWavExtractor.Open: Getting duration');
  FLastResult := FMediaSeeking.GetDuration(FDuration);

  // Check if this is a source/splitter filter
  OutputDebugStringW('TDSWavExtractor.Open: Getting audio output pin count');
  FAudioStreamCount := GetOutputAudioPinCount(Filter);
  if FAudioStreamCount = 0 then
  begin
    OutputDebugStringW('TDSWavExtractor.Open: Getting audio output pin count on next filter');  
    // No audio stream available, this is probably the File source filter
    // Next filter is probably a splitter
    FLastResult := GetFilterPin(Filter,PINDIR_OUTPUT,Pin1);
    FLastResult := Pin1.ConnectedTo(Pin2);
    FLastResult := Pin2.QueryPinInfo(PinInfo);
    Filter := nil;
    Filter := PinInfo.pFilter;
    FAudioStreamCount := GetOutputAudioPinCount(Filter);
  end;
  FSplitter := Filter;
  Result := (FAudioStreamCount > 0);
  Filter := nil;
  Pin1 := nil;
  Pin2 := nil;
  FMediaSeeking := nil;
  FSourceFilename := Filename;
end;

//------------------------------------------------------------------------------

procedure TDSWavExtractor.Close;
begin
  FAudioStreamCount := 0;
  if Assigned(FSplitter) then FSplitter := nil;
  if Assigned(FMediaControl) then
  begin
    FMediaControl.Stop;
    FMediaControl := nil;
  end;
  if Assigned(FMediaEventEx) then FMediaEventEx := nil;
  if Assigned(FMediaSeeking) then FMediaSeeking := nil;
  if Assigned(FGraphBuilder) then FGraphBuilder := nil;
end;

//------------------------------------------------------------------------------

function GetFilterName(Filter : IBaseFilter) : WideString;
var FilterInfo : TFilterInfo;
    Res : HRESULT;
begin
  FilterInfo.achName[0] := #0;
  Res := Filter.QueryFilterInfo(FilterInfo);
  if Succeeded(Res) then
    Result := '<' + WideString(FilterInfo.achName) + '>'
  else
    Result := '<Filter = null>';
end;

function GetPinName(Pin : IPin) : WideString;
var PinInfo : TPinInfo;
    Res : HRESULT;
begin
  PinInfo.achName[0] := #0;
  Res := Pin.QueryPinInfo(PinInfo);
  if Succeeded(Res) then
  begin
    Result := GetFilterName(PinInfo.pFilter) + '.<' + PinInfo.achName + '>';
  end
  else
  begin
    Result := '<Pin = null>';
  end;
end;

function TDSWavExtractor.SelectAudioPin(Index : Integer) : Boolean;
var
  EnumPins : IEnumPins;
  ul: ULONG;
  Pin : IPin;
  PinDir: TPinDirection;
  AudioPinCurrentIndex : Integer;
begin
  Result := False;
  if not Assigned(FSplitter) then
  begin
    Exit;
  end;
  AudioPinCurrentIndex := 0;
  FSplitter.EnumPins(EnumPins);
  OutputDebugStringW(PWideChar('TDSWavExtractor.SelectAudioPin: Enumerating audio output pins on ' + GetFilterName(FSplitter)));
  while (EnumPins.Next(1, Pin, @ul) = S_OK) do
  begin
    Pin.QueryDirection(PinDir);
    if (PinDir = PINDIR_OUTPUT) then
    begin
      if IsAudioPin(Pin) then
      begin
        if (AudioPinCurrentIndex <> Index) then
          NukeDownstream(FGraphBuilder,Pin)
        else
        begin
          InstallWriter(Pin);
        end;
        Inc(AudioPinCurrentIndex);
      end
      else
        NukeDownstream(FGraphBuilder,Pin);
    end;
    Pin := nil;
  end;
end;

//------------------------------------------------------------------------------

function PinSupportPCMMediaType(Pin : IPin) : Boolean;
var
  EnumMT : IEnumMediaTypes;
  pMT : PAMMediaType;
  ul: ULONG;
const WAVE_FORMAT_IEEE_FLOAT : Integer = 3;
begin
  Result := False;
  Pin.EnumMediaTypes(EnumMT);
  while (EnumMT.Next(1, pMT, @ul) = S_OK) do
  begin
    if IsEqualGUID(pMT.majortype, MEDIATYPE_Audio) and
      (IsEqualGUID(pMT.subtype, MEDIASUBTYPE_PCM) or
      IsEqualGUID(pMT.subtype, MEDIASUBTYPE_IEEE_FLOAT)) and
      IsEqualGUID(pMT.formattype, FORMAT_WaveFormatEx) and
      ((PWaveFormatEx(pMT.pbFormat).wFormatTag = WAVE_FORMAT_PCM) or
       (PWaveFormatEx(pMT.pbFormat).wFormatTag = WAVE_FORMAT_IEEE_FLOAT) or
       (PWaveFormatEx(pMT.pbFormat).wFormatTag = WAVE_FORMAT_EXTENSIBLE))
       then
    begin
      Result := True;
      Break;
    end;
    DeleteMediaType(pMT);
  end;
  EnumMT := nil;
end;

//------------------------------------------------------------------------------

function TDSWavExtractor.GetPCMOutputPin(Filter : IBaseFilter) : IPin;
var
  EnumPins : IEnumPins;
  ul: ULONG;
  Pin : IPin;
  PinDir: TPinDirection;
begin
  Result := nil;
  Filter.EnumPins(EnumPins);
  while (EnumPins.Next(1,Pin, @ul) = S_OK) do
  begin
    Pin.QueryDirection(PinDir);
    if (PinDir = PINDIR_OUTPUT) and PinSupportPCMMediaType(Pin) then
    begin
      OutputDebugStringW(PWideChar('TDSWavExtractor.GetPCMOutputPin: Found PCM pin ' + GetPinName(Pin)));
      Result := Pin;
      Break;
    end;
    Pin := nil;
  end;
  Pin := nil;
  EnumPins := nil;
end;

//------------------------------------------------------------------------------

function TDSWavExtractor.InstallWriter(Pin : IPin) : Boolean;
var
  PCMPin, PinConnectedTo : IPin;
  Filter, WavWriterFilter : IBaseFilter;
  PinInfo : TPinInfo;
  FileSinkFilter : IFileSinkFilter;
  WavWriterInterface : IWavWriterInterface;
  DestinationFilenamePeak : WideString;
begin
  OutputDebugStringW(PWideChar('TDSWavExtractor.InstallWriter: InstallWriter on ' + GetPinName(Pin)));
  if PinSupportPCMMediaType(Pin) then
  begin
    OutputDebugStringW('TDSWavExtractor.InstallWriter: PCMPin OK');
    PCMPin := Pin;
  end
  else
  begin
    OutputDebugStringW('TDSWavExtractor.InstallWriter: No PCM support on this pin, getting next filter pin.');
    // We need a pin with wformattag which is probably after a decoder :)
    Pin.ConnectedTo(PinConnectedTo);
    if not Assigned(PinConnectedTo) then
    begin
      // TODO : Do something here or add more error checking
      OutputDebugStringW('TDSWavExtractor.InstallWriter: PinConnectedTo is nil');
      MessageBox(0, 'VisualSubSync failed to render the audio stream. See http://www.visualsubsync.org/tutorials/codecs for more information about codecs installation.', 'Error', MB_OK);
      Result := False;
      Exit;
    end;
    PinConnectedTo.QueryPinInfo(PinInfo);
    Filter := PinInfo.pFilter;
    OutputDebugStringW(PWideChar('TDSWavExtractor.SelectAudioPin: Get PCM output pin on ' + GetFilterName(Filter)));
    PCMPin := GetPCMOutputPin(Filter);
  end;
  PinConnectedTo := nil;
  Filter := nil;
  assert(PCMPin <> nil);
  // TODO : better error handling here
  NukeDownstream(FGraphBuilder, PCMPin);

  OutputDebugStringW('TDSWavExtractor.InstallWriter: Creating and adding WAVWriter to graph');  
  // We are ready to connect, the WAV writer filter and the File Writer
  FLastResult := CreateFilterFromFile(FHWavWriterInst,CLSID_WavWriter, WavWriterFilter);
  FLastResult := WavWriterFilter.QueryInterface(IID_IFileSinkFilter, FileSinkFilter);
  FLastResult := FileSinkFilter.SetFileName(@DestinationFilename[1],nil);
  FileSinkFilter := nil;
  FLastResult := FGraphBuilder.AddFilter(WavWriterFilter,'WAV Writer');

  WavWriterFilter.QueryInterface(IID_IWavWriter,WavWriterInterface);
  if WavWriterInterface <> nil then
  begin
    OutputDebugStringW('TDSWavExtractor.InstallWriter: Configuring WAVWriter');
      if (FWAVExtractionType = wetOnlyPeakFile) then
        WavWriterInterface.SetWriteWavFile(0)
      else if (FWAVExtractionType = wetFastConversion) then
        WavWriterInterface.SetFastConversionMode(1);
      WavWriterInterface.SetWritePeakFile(1);
      DestinationFilenamePeak := WideChangeFileExt(DestinationFilename,'.peak');
      WavWriterInterface.SetPeakFileName(@DestinationFilenamePeak[1]);
      WavWriterInterface.SetSamplesPerPeakRatio(100);
      WavWriterInterface := nil;
  end;

  OutputDebugStringW('TDSWavExtractor.InstallWriter: Rendering PCMPin');
  FLastResult := FGraphBuilder.Render(PCMPin);
  if Failed(FLastResult) then
    OutputDebugStringW('TDSWavExtractor.InstallWriter: Rendering PCMPin failed.');

  FLastResult := PCMPin.ConnectedTo(PinConnectedTo);
  if Failed(FLastResult) then
    OutputDebugStringW('TDSWavExtractor.InstallWriter: PCMPin ConnectedTo failed.')
  else
    OutputDebugStringW(PWideChar('TDSWavExtractor.InstallWriter: PCMPin is now connected to ' + GetPinName(PinConnectedTo))) ;

  FLastResult := WavWriterFilter.QueryInterface(IID_IMediaSeeking, FMediaSeeking);

  PCMPin := nil;  
  Filter := nil;
  WavWriterFilter := nil;
  Result := (FLastResult = S_OK);
end;

//------------------------------------------------------------------------------

function TDSWavExtractor.GetLastErrorString : string;
begin
  SetLength(Result,MAX_ERROR_TEXT_LEN);
  AMGetErrorText(FLastResult,@Result[1],MAX_ERROR_TEXT_LEN);
end;

//------------------------------------------------------------------------------

procedure TDSWavExtractor.Go;
begin
  FMediaControl.Run;
end;

//------------------------------------------------------------------------------

function TDSWavExtractor.GetProgress : Integer;
var Current, Duration : Int64;
begin
  if Assigned(FMediaSeeking) then
  begin
    FMediaSeeking.GetCurrentPosition(Current);
    FMediaSeeking.GetDuration(Duration);
    Result := Round(Current / Duration * 1000);
  end
  else
    Result := 0;
end;

//------------------------------------------------------------------------------

function TDSWavExtractor.IsFinished : Boolean;
var evCode, param1, param2 : Integer;
begin
  Result := False;
  while (not Result) and (FMediaEventEx.GetEvent(evCode, param1, param2,0) = S_OK) do
  begin
    FMediaEventEx.FreeEventParams(evCode, param1, param2);
    Result := (evCode = EC_COMPLETE);
  end;
end;

// -----------------------------------------------------------------------------

function TDSWavExtractor.GetFilters(list : TStrings) : Boolean;
begin
  Result := GetFiltersList(FGraphBuilder, list);
end;

// -----------------------------------------------------------------------------

function TDSWavExtractor.GetFiltersAsString : string;
var strList : TStringList;
begin
  strList := TStringList.Create;
  GetFiltersList(FGraphBuilder, strList);
  Result := strList.Text;
  FreeAndNil(strList);
end;

//------------------------------------------------------------------------------
end.
//------------------------------------------------------------------------------
