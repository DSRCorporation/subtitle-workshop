unit FFMPEGHelper;

interface

uses
  SysUtils,
  Classes,
  Types,
  CommonTypes,
  uLkJSON;

type

  TAudioStream  = record
    Index       : Integer;
    CodecName   : String;
    ChannelsNum : Integer;
    SampleRate  : Integer;
    BitRate     : Integer;
    Duration    : Extended;
  end;

  PAudioStream  = ^TAudioStream;
  TAudioStreams = array of TAudioStream;

  TStreamIndexes = array of Integer;
  
  TFFMPEGHelper = class
  private
    FToolPath     : WideString;
    FToolDetected : Boolean;
    FSampleRate   : Integer;
    
    function BuildAmergeMapArgs(streams: array of Integer): String;
    function BuildTempPath(filename: WideString; extension: String): WideString;
    procedure Execute(command: WideString; args: array of const);
    function ExecuteWithForm(command: WideString; filename: WideString; args: array of const): Boolean;
    function JsonToAudioStream(json: TlkJSONobject): TAudioStream;
  public
    constructor Create(toolPath: WideString; sampleRate: Integer);

    procedure SetSettings(toolPath: WideString; sampleRate: Integer);
    
    function ExtractWAVFromVideo(filename: WideString; streams: array of Integer): WideString;
    function DetectAudioStreams(filename: WideString): TAudioStreams;
    function IsWAVFile(filename: WideString): Boolean;

    property ToolDetected: Boolean read FToolDetected;
  end;

implementation

uses
  TntSysUtils,
  MiscToolsUnit,
  Windows,
  formExecutionProgress;

constructor TFFMPEGHelper.Create(toolPath: WideString; sampleRate: Integer);
begin
  SetSettings(toolPath, sampleRate);
end;

procedure TFFMPEGHelper.SetSettings(toolPath: WideString; sampleRate: Integer);
begin
  toolPath := WideExpandFileName(toolPath);
  if  WideFileExists(WideIncludeTrailingPathDelimiter(toolPath) + 'ffmpeg.exe') and
      WideFileExists(WideIncludeTrailingPathDelimiter(toolPath) + 'ffprobe.exe')then
  begin
    FToolPath := toolPath;
    FToolDetected := True;
  end else
  begin
    FToolPath := '';
    FToolDetected := False;
  end;

  FSampleRate := sampleRate;
end;

function TFFMPEGHelper.BuildAmergeMapArgs(streams: array of Integer): String;
var
  i: Integer;
begin
  Result := '';
  for i := Low(streams) to High(streams) do
    Result := Result + Format('[0:%d]', [streams[i]]);
end;

function TFFMPEGHelper.BuildTempPath(filename: WideString; extension: String): WideString;
begin
  Result := WideChangeFileExt(GetTemporaryFolder + WideExtractFileName(filename), extension);
end;

procedure TFFMPEGHelper.Execute(command: WideString; args: array of const);
var
  thread      : TExecuteExternalThread;
begin
  thread := TExecuteExternalThread.Create(WideFormat(command, args), FToolPath);
  thread.FreeOnTerminate := true;
  thread.Resume;

  WaitForSingleObject(thread.Handle, INFINITE);
end;

function TFFMPEGHelper.ExecuteWithForm(command: WideString; filename: WideString; args: array of const): Boolean;
const
  Msg = 'Extracting audio. Please wait...';
var
  FrmProgress : TfrmExecutionProgress;
  thread      : TExecuteExternalThread;
  UseCmd      : Boolean;
  appName     : WideString;
begin
  FrmProgress := TfrmExecutionProgress.Create(nil, Msg);

  UseCmd := SysUtils.Win32MajorVersion <= 5;

  if UseCmd then begin
    appName := '';
    command := 'ffmpeg.exe' + ' ' + command;
  end else begin
    appName := 'ffmpeg.exe';
  end;
  
  thread := TExecuteExternalThread.Create(WideFormat(command, args), FToolPath, appName, UseCmd, FrmProgress.Handle);
  thread.FreeOnTerminate := true;
  thread.Resume;

  FrmProgress.ShowModal;
  WaitForSingleObject(thread.Handle, 1000);

  Result := not FrmProgress.ExecutionCancelled;

  if not Result and WideFileExists(filename) then WideDeleteFile(filename);
end;

function TFFMPEGHelper.JsonToAudioStream(json: TlkJSONobject): TAudioStream;
begin
  Result.Index        := TlkJSONnumber(json.Field['index']).Value;
  Result.CodecName    := '';
  Result.ChannelsNum  := 0;
  Result.SampleRate   := 0;
  Result.BitRate      := 0;

  if Assigned(json.Field['codec_name']) then
    Result.CodecName := TlkJSONnumber(json.Field['codec_name']).Value;
  if Assigned(json.Field['channels']) then
    Result.ChannelsNum := TlkJSONnumber(json.Field['channels']).Value;
  if Assigned(json.Field['sample_rate']) then
    Result.SampleRate := TlkJSONnumber(json.Field['sample_rate']).Value;
  if Assigned(json.Field['bit_rate']) then
    Result.BitRate := TlkJSONnumber(json.Field['bit_rate']).Value;
end;

function TFFMPEGHelper.ExtractWAVFromVideo(filename: WideString; streams: array of Integer): WideString;
var
  tmpWavPath  : WideString;
  extracted   : Boolean;
begin
  tmpWavPath  := BuildTempPath(filename, '.wav');

  if (Length(streams) = 0) then
    extracted := ExecuteWithForm('-hide_banner -y -vn -i "%s" -ar %d -f wav "%s"',
                                tmpWavPath, [filename, FSampleRate, tmpWavPath])
  else
  if (Length(streams) = 1) then
    extracted := ExecuteWithForm('-hide_banner -y -vn -i "%s" -map 0:%d -c:a:0 pcm_s16le -ar %d -f wav "%s"',
                                tmpWavPath, [filename, streams[0], FSampleRate, tmpWavPath])
  else
    extracted := ExecuteWithForm('-hide_banner -y -vn -i "%s" -filter_complex "%samerge=inputs=%d[aout]" -map "[aout]" -ar %d -f wav "%s"',
                                tmpWavPath, [filename, BuildAmergeMapArgs(streams), Length(streams), FSampleRate, tmpWavPath]);

  if not extracted then
    Result := ''
  else
    Result := tmpWavPath
end;

function TFFMPEGHelper.DetectAudioStreams(filename: WideString): TAudioStreams;
var
  obj     : TlkJSONobject;
  streams : TlkJSONlist;
  tmpJsonPath: WideString;
  i: Integer;
begin
  tmpJsonPath := BuildTempPath(filename, '.json');

  Execute('ffprobe -hide_banner -select_streams a -show_entries stream=index,codec_name,channels,sample_rate,bit_rate,duration -of json "%s" > "%s"',
          [filename, tmpJsonPath]);

  obj     := TlkJSONStreamed.LoadFromFile(tmpJsonPath) as TlkJsonObject;
  streams := obj.Field['streams'] as TlkJSONlist;

  SetLength(Result, streams.Count);

  for i := 0 to streams.Count - 1 do
    Result[i] := JsonToAudioStream(streams.Child[i] as TlkJSONobject);

  obj.Free;

  WideDeleteFile(tmpJsonPath);
end;

function TFFMPEGHelper.IsWAVFile(filename: WideString): Boolean;
begin
  Result := UpperCase(WideExtractFileExt(filename)) = '.WAV';
end;

end.
