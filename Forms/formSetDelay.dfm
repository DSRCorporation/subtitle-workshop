object frmSetDelay: TfrmSetDelay
  Left = 263
  Top = 843
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmSetDelay'
  ClientHeight = 145
  ClientWidth = 297
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = tmeDelayKeyDown
  OnMouseWheelDown = tmeDelayMouseWheelDown
  OnMouseWheelUp = tmeDelayMouseWheelUp
  PixelsPerInch = 96
  TextHeight = 13
  object bvlDelay: TBevel
    Left = 8
    Top = 8
    Width = 281
    Height = 97
  end
  object btnApply: TButton
    Left = 72
    Top = 112
    Width = 129
    Height = 25
    Caption = '&Apply'
    Default = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnClick = btnApplyClick
    OnKeyDown = tmeDelayKeyDown
  end
  object cmbDelayType: TComboBox
    Left = 40
    Top = 16
    Width = 71
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 1
    TabStop = False
    Text = '+'
    Visible = False
    Items.Strings = (
      '+'
      '-')
  end
  object rdoAllSubs: TRadioButton
    Left = 16
    Top = 48
    Width = 265
    Height = 17
    Caption = 'For all the subtitles'
    Checked = True
    TabOrder = 3
    TabStop = True
    OnKeyDown = tmeDelayKeyDown
  end
  object rdoSelSubs: TRadioButton
    Left = 16
    Top = 64
    Width = 265
    Height = 17
    Caption = 'For the selected subtitles'
    TabOrder = 4
    TabStop = True
    OnKeyDown = tmeDelayKeyDown
  end
  object btnCancel: TButton
    Left = 208
    Top = 112
    Width = 81
    Height = 25
    Cancel = True
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 7
    OnKeyDown = tmeDelayKeyDown
  end
  object tmeDelay: TTimeMaskEdit
    Left = 128
    Top = 16
    Width = 105
    Height = 22
    Alignment = taCenter
    ChangeTimeOnModify = True
    FPS = 25.000000000000000000
    MinTime = 0
    TabOrder = 0
    Time = 0
    TimeMode = tmTime
    TimeStep = 100
    FramesStep = 1
    OnKeyDown = tmeDelayKeyDown
  end
  object rdoFromFirstSelected: TRadioButton
    Left = 16
    Top = 80
    Width = 265
    Height = 17
    Caption = 'From first selected until last subtitle'
    TabOrder = 5
    TabStop = True
    OnKeyDown = tmeDelayKeyDown
  end
  object pnlDelayType: TPanel
    Left = 24
    Top = 16
    Width = 97
    Height = 25
    BevelOuter = bvNone
    TabOrder = 2
    object rdoDelayPlus: TRadioButton
      Left = 8
      Top = 4
      Width = 30
      Height = 17
      Caption = '+'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnKeyDown = tmeDelayKeyDown
    end
    object rdoDelayMinus: TRadioButton
      Left = 56
      Top = 4
      Width = 30
      Height = 17
      Caption = '-'
      TabOrder = 1
      TabStop = True
      OnKeyDown = tmeDelayKeyDown
    end
  end
end
