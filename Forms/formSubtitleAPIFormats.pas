// This file is part of Subtitle Workshop
// URL: subworkshop.sf.net
// Licesne: GPL v3
// Copyright: See Subtitle Workshop's copyright information
// File Description: SubtitleAPI Formats form

unit formSubtitleAPIFormats; //added by adenry

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, IniFiles, StdCtrls,
  VirtualTrees;

type
  TSubtitleAPIFormats = record
    FormatName : String;
    FormatExts : String;
  end;
  PSubtitleAPIFormats = ^TSubtitleAPIFormats;

  TfrmSubtitleAPIFormats = class(TForm)
    lstFormats: TVirtualStringTree;
    btnOk: TButton;
    procedure FormCreate(Sender: TObject);
    procedure lstFormatsFreeNode(Sender: TBaseVirtualTree;
      Node: PVirtualNode);
    procedure lstFormatsGetNodeDataSize(Sender: TBaseVirtualTree;
      var NodeDataSize: Integer);
    procedure lstFormatsGetText(Sender: TBaseVirtualTree;
      Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
      var CellText: WideString);
    procedure lstFormatsInitNode(Sender: TBaseVirtualTree; ParentNode,
      Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);
  private
    procedure SetLanguage;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSubtitleAPIFormats: TfrmSubtitleAPIFormats;

// -----------------------------------------------------------------------------

implementation

uses
  General, USubtitlesFunctions,
  formAbout;

{$R *.dfm}

// -----------------------------------------------------------------------------

procedure TfrmSubtitleAPIFormats.SetLanguage;
begin
  Caption := frmAbout.btnSupportedFormats.Caption;
  btnOk.Caption := BTN_OK;
end;

// -----------------------------------------------------------------------------

procedure TfrmSubtitleAPIFormats.FormCreate(Sender: TObject);
var
  i             : Integer;
  TotalFormats  : Integer;
  Name, Exts    : String;
  Data          : PSubtitleAPIFormats;
  //Ini           : TIniFile;
begin
  SetLanguage;
  TotalFormats := SubtitleApi.FormatsCount;
  lstFormats.Clear;

  //Ini := TIniFile.Create(IniRoot);
  //Width  := Ini.ReadInteger('Save', 'Width', 337);
  //Height := Ini.ReadInteger('Save', 'Height', 247);

  try
    for i := 1 to TotalFormats do
    begin
      SubtitleAPI.GetFormatInfo(i, Name, Exts);
      lstFormats.RootNodeCount  := lstFormats.RootNodeCount + 1; //add a new node
      Data                      := lstFormats.GetNodeData(lstFormats.GetLast); //connect the Data var to the new node's Data
      Data.FormatName           := Name;
      Data.FormatExts           := Exts;
    end;
  finally
    //Ini.Free;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmSubtitleAPIFormats.lstFormatsInitNode(Sender: TBaseVirtualTree;
  ParentNode, Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);
var
  Data: PSubtitleAPIFormats;
begin
  Data            := Sender.GetNodeData(Node);
  Data.FormatName := '';
  Data.FormatExts := '';
end;

// -----------------------------------------------------------------------------

procedure TfrmSubtitleAPIFormats.lstFormatsFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
var
  Data: PSubtitleAPIFormats;
begin
  Data            := Sender.GetNodeData(Node);
  Data.FormatName := '';
  Data.FormatExts := '';
end;

// -----------------------------------------------------------------------------

procedure TfrmSubtitleAPIFormats.lstFormatsGetNodeDataSize(Sender: TBaseVirtualTree; var NodeDataSize: Integer);
begin
  NodeDataSize := SizeOf(TSubtitleAPIFormats);
end;

// -----------------------------------------------------------------------------

procedure TfrmSubtitleAPIFormats.lstFormatsGetText(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: WideString);
var
  Data: PSubtitleAPIFormats;
begin
  Data := lstFormats.GetNodeData(Node);
  case Column of
    0: CellText := IntToStr(Node.Index + 1);
    1: CellText := Data.FormatName;
    2: CellText := ReplaceString(Data.FormatExts, ';*', ', *');
  end;
end;

// -----------------------------------------------------------------------------

end.
