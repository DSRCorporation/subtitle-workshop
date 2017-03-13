object frmExecutionProgress: TfrmExecutionProgress
  Left = 339
  Top = 244
  BorderStyle = bsToolWindow
  Caption = 'Execution progress'
  ClientHeight = 43
  ClientWidth = 325
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCloseQuery = FormCloseQuery
  DesignSize = (
    325
    43)
  PixelsPerInch = 96
  TextHeight = 13
  object lblMsg: TLabel
    Left = 16
    Top = 16
    Width = 138
    Height = 13
    Caption = 'Please wait, extracting audio.'
  end
  object btnCancel: TButton
    Left = 241
    Top = 8
    Width = 75
    Height = 25
    Anchors = [akTop, akRight, akBottom]
    Cancel = True
    Caption = 'Cancel'
    TabOrder = 0
    OnClick = btnCancelClick
  end
end
