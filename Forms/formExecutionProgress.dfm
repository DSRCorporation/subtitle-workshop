object frmExecutionProgress: TfrmExecutionProgress
  Left = 339
  Top = 244
  BorderStyle = bsToolWindow
  Caption = 'Execution progress'
  ClientHeight = 47
  ClientWidth = 308
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object lblMsg: TLabel
    Left = 16
    Top = 16
    Width = 281
    Height = 13
    Caption = 'Please wait, extracting audio.'
  end
end
