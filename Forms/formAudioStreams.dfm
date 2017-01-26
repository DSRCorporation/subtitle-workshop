object AudioStreamsForm: TAudioStreamsForm
  Left = 475
  Top = 308
  BorderStyle = bsToolWindow
  BorderWidth = 3
  Caption = 'Select audio streams'
  ClientHeight = 154
  ClientWidth = 338
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  DesignSize = (
    338
    154)
  PixelsPerInch = 96
  TextHeight = 13
  object treeStreams: TVirtualStringTree
    Left = 0
    Top = 0
    Width = 338
    Height = 98
    Align = alTop
    Header.AutoSizeIndex = 0
    Header.Font.Charset = DEFAULT_CHARSET
    Header.Font.Color = clWindowText
    Header.Font.Height = -11
    Header.Font.Name = 'MS Sans Serif'
    Header.Font.Style = []
    Header.MainColumn = -1
    TabOrder = 0
    TreeOptions.SelectionOptions = [toMultiSelect]
    OnChange = treeStreamsChange
    OnGetText = treeStreamsGetText
    Columns = <>
  end
  object btnOK: TButton
    Left = 32
    Top = 128
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'OK'
    TabOrder = 1
    OnClick = btnOKClick
  end
  object btnCancel: TButton
    Left = 241
    Top = 128
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Cancel'
    TabOrder = 2
    OnClick = btnCancelClick
  end
  object chkSelectAll: TCheckBox
    Left = 0
    Top = 104
    Width = 97
    Height = 16
    Caption = 'Select all'
    Checked = True
    State = cbChecked
    TabOrder = 3
    OnClick = chkSelectAllClick
  end
end
