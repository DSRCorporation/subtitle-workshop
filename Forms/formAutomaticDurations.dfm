object frmAutomaticDurations: TfrmAutomaticDurations
  Left = 364
  Top = 595
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmAutomaticDurations'
  ClientHeight = 457
  ClientWidth = 401
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
  PixelsPerInch = 96
  TextHeight = 13
  object btnApply: TButton
    Left = 224
    Top = 424
    Width = 81
    Height = 25
    Caption = '&Apply'
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
  object gbMethod: TGroupBox
    Left = 8
    Top = 8
    Width = 385
    Height = 185
    Caption = 'Method'
    TabOrder = 2
    object lblPerCharacter: TLabel
      Left = 96
      Top = 56
      Width = 65
      Height = 13
      Caption = 'per character'
    end
    object lblPerWord: TLabel
      Left = 96
      Top = 80
      Width = 43
      Height = 13
      Caption = 'per word'
    end
    object lblPerLine: TLabel
      Left = 96
      Top = 104
      Width = 35
      Height = 13
      Caption = 'per line'
    end
    object lblPerSecond: TLabel
      Left = 96
      Top = 160
      Width = 53
      Height = 13
      Caption = 'per second'
    end
    object edtMSPerCharacter: TEdit
      Left = 32
      Top = 48
      Width = 41
      Height = 21
      TabOrder = 0
      Text = '0'
    end
    object udMSPerCharacter: TUpDown
      Left = 73
      Top = 48
      Width = 15
      Height = 21
      Associate = edtMSPerCharacter
      Max = 200
      TabOrder = 1
    end
    object edtMSPerWord: TEdit
      Left = 32
      Top = 72
      Width = 41
      Height = 21
      TabOrder = 2
      Text = '0'
    end
    object udMSPerWord: TUpDown
      Left = 73
      Top = 72
      Width = 15
      Height = 21
      Associate = edtMSPerWord
      Max = 200
      TabOrder = 3
    end
    object edtMSPerLine: TEdit
      Left = 32
      Top = 96
      Width = 41
      Height = 21
      TabOrder = 4
      Text = '0'
    end
    object udMSPerLine: TUpDown
      Left = 73
      Top = 96
      Width = 15
      Height = 21
      Associate = edtMSPerLine
      Max = 200
      TabOrder = 5
    end
    object rdoMilliseconds: TRadioButton
      Left = 16
      Top = 24
      Width = 297
      Height = 17
      Caption = 'Milliseconds'
      TabOrder = 6
    end
    object rdoCharacters: TRadioButton
      Left = 16
      Top = 128
      Width = 297
      Height = 17
      Caption = 'Characters'
      TabOrder = 7
    end
    object edtCPS: TEdit
      Left = 32
      Top = 152
      Width = 41
      Height = 21
      TabOrder = 8
      Text = '0'
    end
    object udCPS: TUpDown
      Left = 73
      Top = 152
      Width = 16
      Height = 21
      Associate = edtCPS
      Max = 300
      TabOrder = 9
    end
  end
  object btnCancel: TButton
    Left = 312
    Top = 424
    Width = 81
    Height = 25
    Cancel = True
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 1
  end
  object pnlWhere: TPanel
    Left = 8
    Top = 368
    Width = 385
    Height = 49
    TabOrder = 4
    object rdoSelectedSubs: TRadioButton
      Left = 8
      Top = 24
      Width = 369
      Height = 17
      Caption = 'Selected subtitles only'
      TabOrder = 1
    end
    object rdoAllSubs: TRadioButton
      Left = 8
      Top = 8
      Width = 369
      Height = 17
      Caption = 'All subtitles'
      Checked = True
      TabOrder = 0
      TabStop = True
    end
  end
  object Panel1: TPanel
    Left = 8
    Top = 296
    Width = 385
    Height = 65
    TabOrder = 3
    object rdoNewDurGreaterOrg: TRadioButton
      Left = 8
      Top = 24
      Width = 369
      Height = 17
      Caption = 'Only if new duration is greater than original'
      TabOrder = 1
    end
    object rdoAllCases: TRadioButton
      Left = 8
      Top = 8
      Width = 369
      Height = 17
      Caption = 'Apply new duration in all cases'
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object rdoNewDurSmallerOrg: TRadioButton
      Left = 8
      Top = 40
      Width = 369
      Height = 17
      Caption = 'Only if new duration is smaller than original'
      TabOrder = 2
    end
  end
  object pnlIncreaseAtStart: TPanel
    Left = 8
    Top = 200
    Width = 385
    Height = 89
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 5
    object lblMilliseconds: TLabel
      Left = 104
      Top = 60
      Width = 55
      Height = 13
      Caption = 'milliseconds'
    end
    object chkIncreaseAtStart: TCheckBox
      Left = 16
      Top = 8
      Width = 361
      Height = 17
      Caption = 'Increase at start if necessary'
      TabOrder = 0
    end
    object edtMaxIncrease: TLabeledEdit
      Left = 32
      Top = 52
      Width = 49
      Height = 21
      EditLabel.Width = 194
      EditLabel.Height = 13
      EditLabel.Caption = 'Maximum increase at start (0 = no limit):'
      TabOrder = 1
      Text = '0'
    end
    object udMaxIncrease: TUpDown
      Left = 81
      Top = 52
      Width = 16
      Height = 21
      Associate = edtMaxIncrease
      Max = 10000
      Increment = 100
      TabOrder = 2
      Thousands = False
    end
  end
end
