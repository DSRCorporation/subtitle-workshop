object frmSetPauses: TfrmSetPauses
  Left = 375
  Top = 754
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Set pauses'
  ClientHeight = 272
  ClientWidth = 265
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object bvlPauses: TBevel
    Left = 8
    Top = 8
    Width = 249
    Height = 169
  end
  object lblPausesValue: TLabel
    Left = 16
    Top = 16
    Width = 67
    Height = 13
    Caption = 'Pauses value:'
  end
  object lblShortenDurationOf: TLabel
    Left = 16
    Top = 72
    Width = 93
    Height = 13
    Caption = 'Shorten duration of:'
  end
  object btnCancel: TButton
    Left = 176
    Top = 240
    Width = 81
    Height = 25
    Cancel = True
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 1
  end
  object btnApply: TButton
    Left = 56
    Top = 240
    Width = 113
    Height = 25
    Caption = '&Apply'
    Default = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ModalResult = 1
    ParentFont = False
    TabOrder = 0
    OnClick = btnApplyClick
  end
  object rdoFirstSub: TRadioButton
    Left = 16
    Top = 96
    Width = 233
    Height = 17
    Caption = 'First subtitle only'
    TabOrder = 2
  end
  object rdoSecondSub: TRadioButton
    Left = 16
    Top = 112
    Width = 233
    Height = 17
    Caption = 'Second subtitle only'
    TabOrder = 3
  end
  object rdoBothSubs: TRadioButton
    Left = 16
    Top = 128
    Width = 233
    Height = 17
    Caption = 'Both subtitles equally'
    TabOrder = 4
  end
  object rdoSubWithLessCPS: TRadioButton
    Left = 16
    Top = 144
    Width = 233
    Height = 17
    Caption = 'The subtitle with less CPS'
    Checked = True
    TabOrder = 5
    TabStop = True
  end
  object tmePauseValue: TTimeMaskEdit
    Left = 16
    Top = 32
    Width = 105
    Height = 22
    Alignment = taCenter
    ChangeTimeOnModify = True
    FPS = 25.000000000000000000
    MinTime = 0
    TabOrder = 6
    Time = 0
    TimeMode = tmTime
    TimeStep = 100
    FramesStep = 1
  end
  object pnlPauses: TPanel
    Left = 8
    Top = 184
    Width = 249
    Height = 49
    BevelOuter = bvLowered
    TabOrder = 7
    object rdoAllSubs: TRadioButton
      Left = 8
      Top = 8
      Width = 233
      Height = 17
      Caption = 'For all the subtitles'
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object rdoSelSubs: TRadioButton
      Left = 8
      Top = 24
      Width = 233
      Height = 17
      Caption = 'For the selected subtitles'
      TabOrder = 1
    end
  end
end
