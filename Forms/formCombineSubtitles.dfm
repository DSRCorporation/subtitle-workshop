object frmCombineSubtitles: TfrmCombineSubtitles
  Left = 308
  Top = 597
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Auto combine subtitles'
  ClientHeight = 497
  ClientWidth = 401
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
  object btnApply: TButton
    Left = 208
    Top = 464
    Width = 97
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
  object btnCancel: TButton
    Left = 312
    Top = 464
    Width = 81
    Height = 25
    Cancel = True
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 1
  end
  object pnlCombineSubtitles2: TPanel
    Left = 8
    Top = 408
    Width = 385
    Height = 49
    TabOrder = 2
    object rdoAllSubs: TRadioButton
      Left = 8
      Top = 8
      Width = 369
      Height = 17
      Caption = 'For all the subtitles'
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object rdoSelSubs: TRadioButton
      Left = 8
      Top = 24
      Width = 369
      Height = 17
      Caption = 'For the selected subtitles'
      TabOrder = 1
    end
  end
  object pnlCombineSubtitles1: TPanel
    Left = 8
    Top = 8
    Width = 385
    Height = 161
    TabOrder = 3
    object lblMilliseconds1: TLabel
      Left = 88
      Top = 36
      Width = 56
      Height = 13
      Caption = 'milliseconds'
    end
    object lblCPS: TLabel
      Left = 88
      Top = 84
      Width = 106
      Height = 13
      Caption = 'characters per second'
    end
    object lblMilliseconds2: TLabel
      Left = 88
      Top = 132
      Width = 56
      Height = 13
      Caption = 'milliseconds'
    end
    object edtMinDuration: TLabeledEdit
      Left = 16
      Top = 28
      Width = 49
      Height = 21
      EditLabel.Width = 207
      EditLabel.Height = 13
      EditLabel.Caption = 'Combine if duration is less than (0 = no limit):'
      TabOrder = 0
      Text = '1000'
    end
    object udMinDuration: TUpDown
      Left = 65
      Top = 28
      Width = 16
      Height = 21
      Associate = edtMinDuration
      Max = 10000
      Increment = 100
      Position = 1000
      TabOrder = 1
      Thousands = False
    end
    object edtMaxCPS: TLabeledEdit
      Left = 16
      Top = 76
      Width = 49
      Height = 21
      EditLabel.Width = 205
      EditLabel.Height = 13
      EditLabel.Caption = 'Combine if CPS is greater than (0 = no limit):'
      TabOrder = 2
      Text = '20'
    end
    object udMaxCPS: TUpDown
      Left = 65
      Top = 76
      Width = 16
      Height = 21
      Associate = edtMaxCPS
      Max = 1000
      Position = 20
      TabOrder = 3
      Thousands = False
    end
    object edtMaxPause: TLabeledEdit
      Left = 16
      Top = 124
      Width = 49
      Height = 21
      EditLabel.Width = 240
      EditLabel.Height = 13
      EditLabel.Caption = 'Don'#39't combine if pause is greater than (0 = no limit):'
      TabOrder = 4
      Text = '2000'
    end
    object udMaxPause: TUpDown
      Left = 65
      Top = 124
      Width = 16
      Height = 21
      Associate = edtMaxPause
      Max = 10000
      Increment = 100
      Position = 2000
      TabOrder = 5
      Thousands = False
    end
  end
  object pnlCombineSubtitles3: TPanel
    Left = 8
    Top = 216
    Width = 385
    Height = 113
    TabOrder = 4
    object lblMilliseconds3: TLabel
      Left = 88
      Top = 36
      Width = 56
      Height = 13
      Caption = 'milliseconds'
    end
    object lblMilliseconds4: TLabel
      Left = 88
      Top = 84
      Width = 56
      Height = 13
      Caption = 'milliseconds'
    end
    object edtMaxDuration: TLabeledEdit
      Left = 16
      Top = 28
      Width = 49
      Height = 21
      EditLabel.Width = 237
      EditLabel.Height = 13
      EditLabel.Caption = 'Combined subtitles maximum duration (0 = no limit):'
      TabOrder = 0
      Text = '7000'
    end
    object udMaxDuration: TUpDown
      Left = 65
      Top = 28
      Width = 16
      Height = 21
      Associate = edtMaxDuration
      Max = 30000
      Increment = 100
      Position = 7000
      TabOrder = 1
      Thousands = False
    end
    object edtDecreaseDur: TLabeledEdit
      Left = 16
      Top = 76
      Width = 49
      Height = 21
      EditLabel.Width = 239
      EditLabel.Height = 13
      EditLabel.Caption = 'Decrease duration if necessary, with no more than:'
      TabOrder = 2
      Text = '1000'
    end
    object udDecreaseDur: TUpDown
      Left = 65
      Top = 76
      Width = 16
      Height = 21
      Associate = edtDecreaseDur
      Max = 30000
      Increment = 100
      Position = 1000
      TabOrder = 3
      Thousands = False
    end
  end
  object pnlCombineSubtitles4: TPanel
    Left = 8
    Top = 176
    Width = 385
    Height = 33
    TabOrder = 5
    object chkPunctuationMarks: TCheckBox
      Left = 8
      Top = 8
      Width = 369
      Height = 17
      Caption = 'Punctuation marks detection'
      TabOrder = 0
    end
  end
  object pnlCombineSubtitles5: TPanel
    Left = 8
    Top = 336
    Width = 385
    Height = 65
    TabOrder = 6
    object lblCharacters: TLabel
      Left = 88
      Top = 36
      Width = 50
      Height = 13
      Caption = 'characters'
    end
    object edtMaxLineLength: TLabeledEdit
      Left = 16
      Top = 28
      Width = 49
      Height = 21
      EditLabel.Width = 252
      EditLabel.Height = 13
      EditLabel.Caption = 'Combined subtitles maximum lines length (0 = no limit):'
      TabOrder = 0
      Text = '45'
    end
    object udMaxLineLength: TUpDown
      Left = 65
      Top = 28
      Width = 16
      Height = 21
      Associate = edtMaxLineLength
      Max = 200
      Position = 45
      TabOrder = 1
      Thousands = False
    end
  end
end
