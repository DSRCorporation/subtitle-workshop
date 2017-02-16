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
    FToolPath     : String;
    FToolDetected : Boolean;
    FSampleRate   : Integer;
    
    function BuildAmergeMapArgs(streams: array of Integer): String;
    function BuildTempPath(filename: String; extension: String): String;
    procedure Execute(command: String; args: array of const);
    function JsonToAudioStream(json: TlkJSONobject): TAudioStream;
  public
    constructor Create(toolPath: String; sampleRate: Integer);

    procedure SetSettings(toolPath: String; sampleRate: Integer);
    
    function ExtractWAVFromVideo(filename: String; streams: array of Integer): String;
    function DetectAudioStreams(filename: String): TAudioStreams;
    function IsWAVFile(filename: String): Boolean;

    property ToolDetected: Boolean read FToolDetected;
  end;

implementation

uses
  TntSysUtils,
  MiscToolsUnit;

constructor TFFMPEGHelper.Create(toolPath: String; sampleRate: Integer);
begin
  SetSettings(toolPath, sampleRate);
end;

procedure TFFMPEGHelper.SetSettings(toolPath: String; sampleRate: Integer);
begin
  toolPath := ExpandFileName(toolPath);
  if  FileExists(IncludeTrailingPathDelimiter(toolPath) + 'ffmpeg.exe') and
      FileExists(IncludeTrailingPathDelimiter(toolPath) + 'ffprobe.exe')then
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

function TFFMPEGHelper.BuildTempPath(filename: String; extension: String): String;
begin
  Result := WideChangeFileExt(GetTempDirectory + ExtractFileName(filename), extension);
end;

procedure TFFMPEGHelper.Execute(command: String; args: array of const);
begin
 ExecuteCommand(Format(command, args), FToolPath);
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

function TFFMPEGHelper.ExtractWAVFromVideo(filename: String; streams: array of Integer): String;
var
  tmpWavPath  : String;
begin
  tmpWavPath := BuildTempPath(filename, '.wav');

  if (Length(streams) = 0) then
    Execute('ffmpeg -hide_banner -y -vn -i "%s" -ar %d -f wav "%s"',
            [filename, FSampleRate, tmpWavPath])
  else
  if (Length(streams) = 1) then
    Execute('ffmpeg -hide_banner -y -vn -i "%s" -map 0:%d -c:a:0 pcm_s16le -ar %d -f wav "%s"',
            [filename, streams[0], FSampleRate, tmpWavPath])
  else
    Execute('ffmpeg -hide_banner -y -vn -i "%s" -filter_complex "%samerge=inputs=%d[aout]" -map "[aout]" -ar %d -f wav "%s"',
            [filename, BuildAmergeMapArgs(streams), Length(streams), FSampleRate, tmpWavPath]);

  Result := tmpWavPath;
end;

function TFFMPEGHelper.DetectAudioStreams(filename: String): TAudioStreams;
var
  obj     : TlkJSONobject;
  streams : TlkJSONlist;
  tmpJsonPath: String;
  i: Integer;
begin
  tmpJsonPath := BuildTempPath(filename, '.json');

  Execute('ffprobe -v error -select_streams a -show_entries stream=index,codec_name,channels,sample_rate,bit_rate,duration -of json "%s" > "%s"',
          [filename, tmpJsonPath]);

  obj     := TlkJSONStreamed.LoadFromFile(tmpJsonPath) as TlkJsonObject;
  streams := obj.Field['streams'] as TlkJSONlist;

  SetLength(Result, streams.Count);

  for i := 0 to streams.Count - 1 do
    Result[i] := JsonToAudioStream(streams.Child[i] as TlkJSONobject);

  obj.Free;

  SysUtils.DeleteFile(tmpJsonPath);
end;

function TFFMPEGHelper.IsWAVFile(filename: String): Boolean;
begin
  Result := UpperCase(ExtractFileExt(filename)) = '.WAV';
end;

end.
