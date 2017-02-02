unit formAudioStreams;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, VirtualTrees, FFMPEGHelper;

type
  TAudioStreamsForm = class(TForm)
    treeStreams: TVirtualStringTree;
    btnOK: TButton;
    btnCancel: TButton;
    chkSelectAll: TCheckBox;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure treeStreamsGetText(Sender: TBaseVirtualTree;
      Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
      var CellText: WideString);
    procedure chkSelectAllClick(Sender: TObject);
    procedure treeStreamsChange(Sender: TBaseVirtualTree;
      Node: PVirtualNode);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    function IsAllSelected: Boolean;
    function IsAnySelected: Boolean;
    procedure UpdateOKEnabled;
  public
    { Public declarations }
    procedure SetStreams(streams: TAudioStreams);
    function GetStreams: TStreamIndexes;
  end;

var
  AudioStreamsForm: TAudioStreamsForm;

implementation

{$R *.dfm}

procedure TAudioStreamsForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_ESCAPE) then
  begin
    ModalResult := mrCancel;
    Close;
  end;
end;

procedure TAudioStreamsForm.btnOKClick(Sender: TObject);
begin
  Close;
  ModalResult := mrOK;
end;

procedure TAudioStreamsForm.btnCancelClick(Sender: TObject);
begin
  Close;
  ModalResult := mrCancel;
end;

procedure TAudioStreamsForm.SetStreams(streams: TAudioStreams);
var
  i     : Integer;
  node  : PVirtualNode;
  data  : PAudioStream;
begin
  treeStreams.BeginUpdate;
  for i := Low(streams) to High(streams) do begin
    node := treeStreams.AddChild(nil);
    data := treeStreams.GetNodeData(node);

    data.Index      := streams[i].Index;
    data.ChannelsNum:= streams[i].ChannelsNum;
    data.SampleRate := streams[i].SampleRate;
    data.BitRate    := streams[i].BitRate;
    data.CodecName  := streams[i].CodecName;

    treeStreams.Selected[node] := True;
  end;

  treeStreams.EndUpdate;
end;

function TAudioStreamsForm.GetStreams: TStreamIndexes;
var
  node  : PVirtualNode;
  data  : PAudioStream;
  i     : Integer;
begin
  if IsAllSelected then begin
    SetLength(Result, 0);
    Exit;
  end;
  
  SetLength(Result, treeStreams.SelectedCount);

  node  := treeStreams.GetFirstSelected;
  i     := 0;
  while Assigned(node) do begin
    data := treeStreams.GetNodeData(node);
    Result[i] := data.Index;
    Inc(i);

    node := treeStreams.GetNextSelected(node);
  end;
end;

procedure TAudioStreamsForm.FormCreate(Sender: TObject);
begin
  treeStreams.NodeDataSize := SizeOf(TAudioStream);
end;

function BuildCaption(stream: TAudioStream): String;
begin
  with stream do begin
    Result := Format('Stream #%d: %s, %d channels, %d Hz, %d kb/s',
                      [Index, CodecName, ChannelsNum, SampleRate, Round(BitRate/1000)]);
  end;
end;

function TAudioStreamsForm.IsAllSelected: Boolean;
var
  node : PVirtualNode;
begin
  node := treeStreams.GetFirst;

  while Assigned(node) do begin
    if not treeStreams.Selected[node] then begin
      Result := False;
      Exit;
    end;
    node := treeStreams.GetNextSibling(node);
  end;

  Result := True;
end;


function TAudioStreamsForm.IsAnySelected: Boolean;
var
  node : PVirtualNode;
begin
  node := treeStreams.GetFirst;

  while Assigned(node) do begin
    if treeStreams.Selected[node] then begin
      Result := True;
      Exit;
    end;
    node := treeStreams.GetNextSibling(node);
  end;

  Result := False;
end;


procedure TAudioStreamsForm.UpdateOKEnabled;
begin
  btnOK.Enabled := IsAnySelected;
end;

procedure TAudioStreamsForm.treeStreamsGetText(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
  var CellText: WideString);
var
  data : PAudioStream;
begin
  data := treeStreams.GetNodeData(node);

  CellText := BuildCaption(data^);
end;

procedure TAudioStreamsForm.chkSelectAllClick(Sender: TObject);
var
  node : PVirtualNode;
begin
  node := treeStreams.GetFirst;

  treeStreams.BeginUpdate;
  while Assigned(node) do begin
    treeStreams.Selected[node] := chkSelectAll.Checked;
    node := treeStreams.GetNextSibling(node);
  end;
  treeStreams.EndUpdate;

  treeStreams.SetFocus;
  UpdateOKEnabled;
end;

procedure TAudioStreamsForm.treeStreamsChange(Sender: TBaseVirtualTree;
  Node: PVirtualNode);
begin
  chkSelectAll.Checked := IsAllSelected;
  UpdateOKEnabled;
end;

procedure TAudioStreamsForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  treeStreams.Clear;
end;

end.
