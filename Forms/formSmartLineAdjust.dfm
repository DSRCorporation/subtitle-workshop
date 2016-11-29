object frmSmartLineAdjust: TfrmSmartLineAdjust
  Left = 292
  Top = 739
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Smart line adjust'
  ClientHeight = 305
  ClientWidth = 385
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
    Left = 192
    Top = 272
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
    Left = 296
    Top = 272
    Width = 81
    Height = 25
    Cancel = True
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 1
  end
  object pnlSmartLineAdjust1: TPanel
    Left = 8
    Top = 8
    Width = 369
    Height = 201
    TabOrder = 2
    object lblTwoLinesIfLongerThan: TLabel
      Left = 8
      Top = 8
      Width = 112
      Height = 13
      Caption = 'Two lines if longer than:'
    end
    object lblCharacters1: TLabel
      Left = 72
      Top = 32
      Width = 50
      Height = 13
      Caption = 'characters'
    end
    object lblBreakMethod: TLabel
      Left = 8
      Top = 64
      Width = 69
      Height = 13
      Caption = 'Break method:'
    end
    object lblCharacters2: TLabel
      Left = 288
      Top = 48
      Width = 50
      Height = 13
      Caption = 'characters'
      Visible = False
    end
    object lblMinimumLineLength: TLabel
      Left = 224
      Top = 26
      Width = 95
      Height = 13
      Caption = 'Minimum line length:'
      Visible = False
    end
    object edtCharacters1: TEdit
      Left = 8
      Top = 28
      Width = 41
      Height = 21
      TabOrder = 0
      Text = '45'
    end
    object udCharacters1: TUpDown
      Left = 49
      Top = 28
      Width = 16
      Height = 21
      Associate = edtCharacters1
      Min = 1
      Max = 200
      Position = 45
      TabOrder = 1
    end
    object edtCharacters2: TEdit
      Left = 224
      Top = 44
      Width = 41
      Height = 21
      TabOrder = 2
      Text = '5'
      Visible = False
    end
    object udCharacters2: TUpDown
      Left = 265
      Top = 44
      Width = 16
      Height = 21
      Associate = edtCharacters2
      Min = 1
      Max = 200
      Position = 5
      TabOrder = 3
      Visible = False
    end
    object rdoEqualLines: TRadioButton
      Left = 8
      Top = 80
      Width = 345
      Height = 17
      Caption = 'Equal lines'
      TabOrder = 5
      OnClick = chkAlwaysTryEnable
    end
    object chkDontUnbreak: TCheckBox
      Left = 8
      Top = 152
      Width = 353
      Height = 17
      Caption = 'Don'#39't unbreak subtitles that are not too long'
      TabOrder = 6
    end
    object chkAdjustOnly: TCheckBox
      Left = 8
      Top = 172
      Width = 355
      Height = 21
      Caption = 'Adjust only long subs and subs with more than 2 lines'
      TabOrder = 7
      OnClick = chkAlwaysTryEnable
    end
    object chkAlwaysTry: TCheckBox
      Left = 24
      Top = 116
      Width = 339
      Height = 21
      Caption = 'Always try to find a better breaking point'
      TabOrder = 8
    end
    object rdoBreakOnPunctuationMarks: TRadioButton
      Left = 8
      Top = 96
      Width = 345
      Height = 17
      Caption = 'Break on punctuation marks'
      Checked = True
      TabOrder = 4
      TabStop = True
      OnClick = chkAlwaysTryEnable
    end
  end
  object pnlSmartLineAdjust2: TPanel
    Left = 8
    Top = 216
    Width = 369
    Height = 49
    TabOrder = 3
    object rdoAllSubs: TRadioButton
      Left = 8
      Top = 8
      Width = 353
      Height = 17
      Caption = 'For all the subtitles'
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object rdoSelSubs: TRadioButton
      Left = 8
      Top = 24
      Width = 353
      Height = 17
      Caption = 'For the selected subtitles'
      TabOrder = 1
    end
  end
end
