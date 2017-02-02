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
    FToolPath   : String;
    FSampleRate : Integer;
    
    function BuildAmergeMapArgs(streams: array of Integer): String;
    function BuildTempPath(filename: String; extension: String): String;
    procedure Execute(command: String; args: array of const);
    function JsonToAudioStream(json: TlkJSONobject): TAudioStream;
  public
    constructor Create(toolPath: String; sampleRate: Integer);
    
    function ExtractWAVFromVideo(filename: String; streams: array of Integer): String;
    function DetectAudioStreams(filename: String): TAudioStreams;
    function IsWAVFile(filename: String): Boolean;
  end;

implementation

uses
  TntSysUtils,
  MiscToolsUnit;

constructor TFFMPEGHelper.Create(toolPath: String; sampleRate: Integer);
begin
  FToolPath   := toolPath;
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
  Result.CodecName    := TlkJSONstring(json.Field['codec_name']).Value;
  Result.ChannelsNum  := TlkJSONnumber(json.Field['channels']).Value;
  Result.SampleRate   := TlkJSONnumber(json.Field['sample_rate']).Value;
  Result.BitRate      := TlkJSONnumber(json.Field['bit_rate']).Value;
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
    Execute('ffmpeg -hide_banner -y -vn -i "%s" -c:%d copy -ar %d -f wav "%s"',
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
