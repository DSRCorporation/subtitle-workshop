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

unit SubStructUnit;

interface

uses WAVDisplayerUnit, VirtualTrees, Classes, Types, Windows;

type
  TDelayShiftType = (dstBothTime, dstStartTimeOnly, dstStopTimeOnly);
  TDelayApplyToType = (dattAll, dattSelected, dattFromCursor);

  TSubtitleRange = class(TRange)
    Text: WideString;

    Effect : WideString;
    Layer : WideString;
    Marked : WideString;
    Actor : WideString;
    RightMarg : WideString;
    LeftMarg : WideString;
    VertMarg : WideString;
    Style: WideString;

    Node : PVirtualNode; // TSubtitleRange and tree node are linked both way

    procedure Assign(const Range : TRange); override;
    procedure SaveToStream(Stream : TStream); override;
    procedure LoadFromStream(Stream : TStream); override;
  end;

  TSubtitleRangeFactory = class(TRangeFactory)
    function CreateRange : TRange; override;
  end;

  TTreeData = record
    Range: TSubtitleRange;
  end;
  PTreeData = ^TTreeData;

  TSceneChangeWrapper = class(TObject)
  private
    FSceneChangeList : TIntegerDynArray;
    FStartOffset, FStopOffset, FFilterOffset : Integer;
    FVisible : Boolean;

    function GetNextIndex(TimeMs : Integer; Backward : Boolean = False) : Integer;
  public
    procedure SetSceneChangeList(SceneChangeList : TIntegerDynArray);
    procedure SetOffsets(StartOffset, StopOffset, FilterOffset : Integer);
    procedure SetVisible(Value : Boolean);
    function Delete(StartTimeMs, StopTimeMs : Integer) : TIntegerDynArray;
    procedure Insert(Src : TIntegerDynArray);
    function GetSCArray : TIntegerDynArray;
  published
    function Contains(Start, Stop : Integer) : Boolean;
    function GetCount : Integer;
    function GetAt(Index : Integer) : Integer;
    function GetNext(TimeMs : Integer) : Integer;
    function GetPrevious(TimeMs : Integer) : Integer;

    property StartOffset : Integer read FStartOffset;
    property StopOffset : Integer read FStopOffset;
    property FilterOffset : Integer read FFilterOffset;
    property Visible : Boolean read FVisible;
  end;

implementation

uses MiscToolsUnit, SysUtils, TntSysUtils;

//==============================================================================

procedure TSubtitleRange.Assign(const Range : TRange);
var SubRange : TSubtitleRange;
begin
  inherited Assign(Range);
  SubRange := TSubtitleRange(Range);
  Self.Text := SubRange.Text;
  Self.Effect := SubRange.Effect;
  Self.Layer := SubRange.Layer;
  Self.Marked := SubRange.Marked;
  Self.Actor := SubRange.Actor;
  Self.RightMarg := SubRange.RightMarg;
  Self.LeftMarg := SubRange.LeftMarg;
  Self.VertMarg := SubRange.VertMarg;
  Self.Style := SubRange.Style;
end;

procedure TSubtitleRange.SaveToStream(Stream : TStream);
begin
  inherited SaveToStream(Stream);
  
  SaveToStreamWS(Stream, Self.Text);
  SaveToStreamWS(Stream, Self.Effect);
  SaveToStreamWS(Stream, Self.Layer);
  SaveToStreamWS(Stream, Self.Marked);
  SaveToStreamWS(Stream, Self.Actor);
  SaveToStreamWS(Stream, Self.RightMarg);
  SaveToStreamWS(Stream, Self.LeftMarg);
  SaveToStreamWS(Stream, Self.VertMarg);
  SaveToStreamWS(Stream, Self.Style);
end;

procedure TSubtitleRange.LoadFromStream(Stream : TStream);
begin
  inherited LoadFromStream(Stream);

  LoadFromStreamWS(Stream, Self.Text);
  LoadFromStreamWS(Stream, Self.Effect);
  LoadFromStreamWS(Stream, Self.Layer);
  LoadFromStreamWS(Stream, Self.Marked);
  LoadFromStreamWS(Stream, Self.Actor);
  LoadFromStreamWS(Stream, Self.RightMarg);
  LoadFromStreamWS(Stream, Self.LeftMarg);
  LoadFromStreamWS(Stream, Self.VertMarg);
  LoadFromStreamWS(Stream, Self.Style);
end;


function TSubtitleRangeFactory.CreateRange : TRange;
begin
  Result := TSubtitleRange.Create;
  Result.StartTime := 0;
  Result.StopTime := 0;
  SetLength(Result.SubTime, 0);
  TSubtitleRange(Result).Text := '';
  TSubtitleRange(Result).Effect := '';
  TSubtitleRange(Result).Layer := '0';
  TSubtitleRange(Result).Marked := 'Marked=0';
  TSubtitleRange(Result).Actor := '';
  TSubtitleRange(Result).RightMarg := '0000';
  TSubtitleRange(Result).LeftMarg := '0000';
  TSubtitleRange(Result).VertMarg := '0000';
  TSubtitleRange(Result).Style := 'Default';
  TSubtitleRange(Result).Node := nil;
end;

//==============================================================================

// SceneChange.GetCount() : Get the total number of scene change
function TSceneChangeWrapper.GetCount : Integer;
begin
  Result := Length(FSceneChangeList);
end;

// SceneChange.GetAt(Index) : Get the time of the scene change in ms at the specified index. index is between 0 and GetCount()-1
function TSceneChangeWrapper.GetAt(Index : Integer) : Integer;
begin
  if (Index >= Low(FSceneChangeList)) and (Index <= High(FSceneChangeList)) then
    Result := FSceneChangeList[Index]
  else
    Result := -1;
end;

function TSceneChangeWrapper.GetNextIndex(TimeMs : Integer;
  Backward : Boolean = False) : Integer;
begin
  Result := BinarySearch(FSceneChangeList, TimeMs, Backward);
end;

// SceneChange.GetNext(TimeMs) : Get the time in ms of the next scene change >= TimeMs
function TSceneChangeWrapper.GetNext(TimeMs : Integer) : Integer;
begin
  Result := GetAt(GetNextIndex(TimeMs));
end;

// SceneChange.GetPrevious(TimeMs) : Get the time in ms of the next scene change <= TimeMs
function TSceneChangeWrapper.GetPrevious(TimeMs : Integer) : Integer;
begin
  Result := GetAt(GetNextIndex(TimeMs, True));
end;

// SceneChange.Contains(Start,Stop) : Check if there is a scene change between [Start,Stop]
function TSceneChangeWrapper.Contains(Start, Stop : Integer) : Boolean;
var I : Integer;
begin
  I := GetNextIndex(Start);
  Result := (I <= High(FSceneChangeList)) and (FSceneChangeList[I] <= Stop);
end;

procedure TSceneChangeWrapper.SetSceneChangeList(SceneChangeList : TIntegerDynArray);
begin
  SetLength(FSceneChangeList, System.Length(SceneChangeList));
  if System.Length(SceneChangeList) > 0 then
  begin
    CopyMemory(@FSceneChangeList[0], @SceneChangeList[0],
      Length(SceneChangeList) * SizeOf(Integer));
  end;
end;

procedure TSceneChangeWrapper.SetOffsets(StartOffset, StopOffset, FilterOffset : Integer);
begin
  FStartOffset := StartOffset;
  FStopOffset := StopOffset;
  FFilterOffset := FilterOffset;
end;

procedure TSceneChangeWrapper.SetVisible(Value : Boolean);
begin
  FVisible := Value;
end;

function TSceneChangeWrapper.Delete(StartTimeMs, StopTimeMs : Integer) : TIntegerDynArray;
var StartIdx, StopIdx, Count, I, J : Integer;
begin
  StartIdx := GetNextIndex(StartTimeMs);
  StopIdx := GetNextIndex(StopTimeMs, True);
  if (StopIdx = -1) then
  begin
    SetLength(Result, 0);
    Exit;
  end;
  Count := StopIdx - StartIdx + 1;

  SetLength(Result, Count);
  J := 0;
  for I := StartIdx to StopIdx do
  begin
    Result[J] := FSceneChangeList[I];
    Inc(J);
  end;

  for I := (StopIdx + 1) to High(FSceneChangeList) do
  begin
    FSceneChangeList[I - Count] := FSceneChangeList[I];
  end;
  SetLength(FSceneChangeList, Length(FSceneChangeList) - Count);
end;

procedure TSceneChangeWrapper.Insert(Src : TIntegerDynArray);
var NewSCArray : TIntegerDynArray;
    I, J, K : Integer;
begin
  I := 0; J := 0; K := 0;
  SetLength(NewSCArray, Length(FSceneChangeList) + Length(Src));
  while (I < Length(FSceneChangeList)) and (J < Length(Src))  do
  begin
    while (I < Length(FSceneChangeList)) and (FSceneChangeList[I] < Src[J]) do
    begin
      NewSCArray[K] := FSceneChangeList[I];
      Inc(K);
      Inc(I);
    end;
    while (J < Length(Src)) and (FSceneChangeList[I] > Src[J]) do
    begin
      NewSCArray[K] := Src[J];
      Inc(K);
      Inc(J);
    end;
    while (J < Length(Src)) and (I < Length(FSceneChangeList)) and (FSceneChangeList[I] = Src[J]) do
    begin
      NewSCArray[K] := FSceneChangeList[I];
      Inc(K);
      Inc(J);
      Inc(I);
    end;
  end;
  while (I < Length(FSceneChangeList)) do
  begin
    NewSCArray[K] := FSceneChangeList[I];
    Inc(K);
    Inc(I);
  end;
  while (J < Length(Src)) do
  begin
    NewSCArray[K] := Src[J];
    Inc(K);
    Inc(J);
  end;
  // Re-adjust space
  SetLength(NewSCArray, K);
  SetSceneChangeList(NewSCArray);
end;

function TSceneChangeWrapper.GetSCArray : TIntegerDynArray;
begin
  Result := FSceneChangeList;
end;

end.
//==============================================================================
