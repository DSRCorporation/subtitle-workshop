object frmNetflixQcResult: TfrmNetflixQcResult
  Left = 288
  Top = 347
  Cursor = crArrow
  BorderStyle = bsToolWindow
  Caption = 'Netflix quality check'
  ClientHeight = 99
  ClientWidth = 403
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poMainFormCenter
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object lblLink1: TTntLabel
    Left = 48
    Top = 8
    Width = 22
    Height = 13
    Cursor = crHandPoint
    Caption = 'link1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsUnderline]
    ParentFont = False
    OnClick = lblLinkClick
  end
  object lblPref1: TTntLabel
    Left = 8
    Top = 8
    Width = 24
    Height = 13
    Caption = 'pref1'
  end
  object lblPostf1: TTntLabel
    Left = 88
    Top = 8
    Width = 29
    Height = 13
    Caption = 'postf1'
  end
  object lblLink2: TTntLabel
    Left = 48
    Top = 24
    Width = 22
    Height = 13
    Cursor = crHandPoint
    Caption = 'link2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsUnderline]
    ParentFont = False
    OnClick = lblLinkClick
  end
  object lblPref2: TTntLabel
    Left = 8
    Top = 24
    Width = 24
    Height = 13
    Caption = 'pref2'
  end
  object lblPostf2: TTntLabel
    Left = 88
    Top = 24
    Width = 29
    Height = 13
    Caption = 'postf2'
  end
  object btnLocateFile: TButton
    Left = 104
    Top = 64
    Width = 105
    Height = 25
    Caption = 'Open file location'
    TabOrder = 0
    OnClick = btnLocateFileClick
  end
  object btnOk: TButton
    Left = 216
    Top = 64
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 1
    OnClick = btnOkClick
  end
end
