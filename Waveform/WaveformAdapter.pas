unit WaveformAdapter;

interface

uses
  Windows,
  SysUtils,
  Classes,
  ExtCtrls,
  Controls,
  Graphics,
  Types,
  VirtualTrees,
  WAVDisplayerUnit,
  Renderer,
  SubStructUnit,
  CommonTypes;

type

  // Adapter for efficient usage TWAVDisplayer bound with TVirtualStringTree
  TWaveformAdapter = class
  private
    WAVDisplayer        : TWAVDisplayer;
    WAVRenderer         : TDShowRenderer;
    FSourceTree         : TVirtualStringTree;
    FCharset            : Byte;
    
    procedure InitDisplayer(parentPanel: TPanel);
    procedure InitRenderer;

    function HasNodeChanged(node: PVirtualNode): Boolean;
  protected
    procedure OnCustomDrawRange(Sender: TObject; ACanvas: TCanvas; Range: TRange; Rect: TRect);

    procedure SelectNode(node: PVirtualNode);
    function GetSelectedNode: PVirtualNode;

    procedure SetCharset(charset: Byte);
  public
    constructor Create(parentPanel: TPanel; sourceTree: TVirtualStringTree);
    destructor Destroy; override;

    procedure Clear;
    procedure ClearSubtitles;
    procedure LoadWAV(filename: WideString);
    procedure AddSubtitle; overload;
    procedure AddSubtitle(node: PVirtualNode); overload;
    procedure SyncSubtitlesWithTree;
    procedure UpdateSubtitle; overload;
    procedure UpdateSubtitle(node: PVirtualNode); overload;
    procedure DeleteSubtitle; overload;
    procedure DeleteSubtitle(node: PVirtualNode); overload;
    procedure ClearSelection;

    property Displayer: TWAVDisplayer read WAVDisplayer;
    property SelectedNode: PVirtualNode read GetSelectedNode write SelectNode;
    property Charset: Byte read FCharset write SetCharset;
  end;

//------------------------------------------------------------------------------

implementation

uses
  TreeViewHandle;
  
// Common utility routines

var
  rangeFactory: TSubtitleRangeFactory;

type
  TAccessCanvas = class(TCanvas);

procedure CanvasDrawText(Canvas: TCanvas; Rect: TRect;
  const Text: AnsiString; AllowLineBreak : Boolean = False; AlignBottom : Boolean = True);
var
  Options: Cardinal;
  OriginalRectBottom, OriginalRectRight, BottomDiff : Integer;
begin
  with TAccessCanvas(Canvas) do begin
    Changing;
    RequiredState([csHandleValid, csFontValid, csBrushValid]);
    Options := DT_END_ELLIPSIS or DT_NOPREFIX or DT_EDITCONTROL;
    if AllowLineBreak then
      Options := Options or DT_WORDBREAK;
    if AlignBottom then
    begin
      OriginalRectBottom := Rect.Bottom;
      OriginalRectRight := Rect.Right;
      Windows.DrawText(Handle, PChar(Text), Length(Text), Rect, Options or DT_CALCRECT);
      BottomDiff := OriginalRectBottom - Rect.Bottom;
      if (BottomDiff > 0) then
        OffsetRect(Rect, 0, BottomDiff)
      else
        Rect.Bottom := OriginalRectBottom;
      Rect.Right := OriginalRectRight;
    end;
    Windows.DrawText(Handle, PChar(Text), Length(Text), Rect, Options);
    Changed;
  end;
end;

// TWaveformAdapter

constructor TWaveformAdapter.Create(parentPanel: TPanel; sourceTree: TVirtualStringTree);
begin
  FSourceTree := sourceTree;
  FCharset    := DEFAULT_CHARSET;
  
  InitDisplayer(parentPanel);
end;

destructor TWaveformAdapter.Destroy;
begin
  FSourceTree := nil;
  
  FreeAndNil(WAVRenderer);
  FreeAndNil(WAVDisplayer);
  
  inherited;
end;

procedure TWaveformAdapter.InitDisplayer(parentPanel: TPanel);
begin
  WAVDisplayer := TWAVDisplayer.Create(nil);
  
  WAVDisplayer.Left   := 0;
  WAVDisplayer.Top    := 0;
  WAVDisplayer.Width  := parentPanel.Width;
  WAVDisplayer.Height := parentPanel.Height - 12;
  WAVDisplayer.Align  := alClient;
  WAVDisplayer.Parent := parentPanel;

  WAVDisplayer.OnCustomDrawRange := Self.OnCustomDrawRange;

//  WAVDisplayer.Enabled := False;
  WAVDisplayer.SetPageSizeMs(10000);
  WAVDisplayer.MinimumBlank := 150;

  WAVDisplayer.SceneChangeEnabled     := True;
  WAVDisplayer.SceneChangeStartOffset := 150;
  WAVDisplayer.SceneChangeStopOffset  := 150;
end;

procedure TWaveformAdapter.InitRenderer;
begin
  WAVRenderer := TDShowRenderer.Create;
  WAVRenderer.SetAutoInsertCustomVSFilter(True);
  WAVDisplayer.SetRenderer(WAVRenderer);
end;

procedure TWaveformAdapter.Clear;
begin
  ClearSubtitles;
//    WAVDisplayer.Enabled := False;
  WAVDisplayer.Close;
  WAVDisplayer.Invalidate;
  WAVDisplayer.VerticalScaling := 100;
end;

procedure TWaveformAdapter.ClearSubtitles;
var
  emptyArray: TIntegerDynArray;
begin
  WAVDisplayer.ClearRangeList;
  WAVDisplayer.ClearRangeListVO;
  WAVDisplayer.SetSceneChangeList(emptyArray);
end;

procedure TWaveformAdapter.LoadWAV(filename: WideString);
var
  loadWAV: Boolean;
begin
  loadWAV := WAVDisplayer.LoadWAV(filename);

  if loadWAV then begin
    InitRenderer;
    WAVRenderer.Open(filename);

    WAVDisplayer.Enabled := True;
    WAVDisplayer.SetPageSizeMs(WAVDisplayer.Length div 4);
  end;
end;

procedure TWaveformAdapter.AddSubtitle;
begin
  AddSubtitle(FSourceTree.FocusedNode);
end;

procedure TWaveformAdapter.AddSubtitle(node: PVirtualNode);
var
  range   : TSubtitleRange;
  subtitle: PSubtitleItem;
begin
  if Assigned(node) then begin
    subtitle := FSourceTree.GetNodeData(node);

    if Assigned(subtitle) then begin
      range       := TSubtitleRange(rangeFactory.CreateRangeSS(subtitle.InitialTime, subtitle.FinalTime));
      range.Text  := subtitle.Text;
      range.Node  := node;

      subtitle.Range := range;

      WAVDisplayer.AddRange(range);
    end;
  end;
end;

procedure TWaveformAdapter.SyncSubtitlesWithTree;
var
  node: PVirtualNode;
begin
  ClearSubtitles;
  
  node := FSourceTree.GetFirst;

  while Assigned(node) do begin
    AddSubtitle(node);

    node := FSourceTree.GetNextSibling(node);
  end;
end;

function TWaveformAdapter.HasNodeChanged(node: PVirtualNode): Boolean;
var
  range   : TSubtitleRange;
  subtitle: PSubtitleItem;
begin
  Result := False;

  subtitle  := FSourceTree.GetNodeData(node);
  range     := subtitle.Range;

  if  (range.StartTime <> subtitle.InitialTime) or
      (range.StopTime <> subtitle.FinalTime) or
      (range.Text <> subtitle.Text) then
     Result := True;
end;

procedure TWaveformAdapter.UpdateSubtitle;
begin
  UpdateSubtitle(FSourceTree.FocusedNode);
end;

procedure TWaveformAdapter.UpdateSubtitle(node: PVirtualNode);
var
  range   : TSubtitleRange;
  subtitle: PSubtitleItem;
begin
  if Assigned(node) then begin
    subtitle  := FSourceTree.GetNodeData(node);
    range     := subtitle.Range;

    if Assigned(range) then begin
      if not HasNodeChanged(node) then Exit;
      
      range.StartTime := subtitle.InitialTime;
      range.StopTime  := subtitle.FinalTime;
      range.Text      := subtitle.Text;

      WAVDisplayer.RefreshSelection;
    end;
  end;
end;

procedure TWaveformAdapter.DeleteSubtitle;
begin
  DeleteSubtitle(FSourceTree.FocusedNode);
end;

procedure TWaveformAdapter.DeleteSubtitle(node: PVirtualNode);
var
  range   : TSubtitleRange;
  subtitle: PSubtitleItem;
begin
  if Assigned(node) then begin
    subtitle  := FSourceTree.GetNodeData(node);
    range     := subtitle.Range;

    if Assigned(range) then
      WAVDisplayer.DeleteRangeAtIdx(WAVDisplayer.RangeList.IndexOf(range));
  end;
end;

procedure TWaveformAdapter.SelectNode(node: PVirtualNode);
var
  range   : TSubtitleRange;
  subtitle: PSubtitleItem;
begin
  if Assigned(node) then begin
    if not FSourceTree.Selected[node] then Exit;
    
    subtitle  := FSourceTree.GetNodeData(node);
    range     := subtitle.Range;

    if Assigned(range) then
      WAVDisplayer.SelectedRange := range;
  end else
    WAVDisplayer.ClearSelection;
end;

function TWaveformAdapter.GetSelectedNode: PVirtualNode;
begin
  Result := nil;
  if Assigned(WAVDisplayer.SelectedRange) then
    Result := TSubtitleRange(WAVDisplayer.SelectedRange).Node;
end;

procedure TWaveformAdapter.ClearSelection;
begin
  WAVDisplayer.ClearSelection;
end;

procedure TWaveformAdapter.SetCharset(charset: Byte);
begin
  FCharset := charset;

  WAVDisplayer.UpdateView([uvfRange]);
end;

procedure TWaveformAdapter.OnCustomDrawRange(Sender: TObject; ACanvas: TCanvas; Range : TRange; Rect : TRect);
const MINIMAL_SPACE : Integer = 25;
      TEXT_MARGINS : Integer = 5;
var WAVZoneHeight : Integer;
    AlignBottom : Boolean;
begin
//  TODO: preferences support
//  if (not ConfigObject.ShowTextInWAVDisplay) then
//    Exit;

  InflateRect(Rect, -TEXT_MARGINS, -TEXT_MARGINS);
  if (Rect.Right - Rect.Left) > MINIMAL_SPACE then begin
    ACanvas.Font.Charset := FCharset;

    WAVZoneHeight := WAVDisplayer.Height - WAVDisplayer.RulerHeight;
    AlignBottom := (Rect.Top > WAVZoneHeight div 2);
    ACanvas.Font.Color := ACanvas.Pen.Color;
    CanvasDrawText(ACanvas, Rect, TSubtitleRange(Range).Text, False, AlignBottom);
  end;
end;

//------------------------------------------------------------------------------

initialization

  rangeFactory := TSubtitleRangeFactory.Create;

end.