object frmRoundTimeValues: TfrmRoundTimeValues
  Left = 492
  Top = 854
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmRoundTimeValues'
  ClientHeight = 145
  ClientWidth = 305
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
  object pnlWhere: TPanel
    Left = 8
    Top = 56
    Width = 289
    Height = 49
    TabOrder = 3
    object rdoAllSubs: TRadioButton
      Left = 8
      Top = 8
      Width = 273
      Height = 17
      Caption = 'All subtitles'
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object rdoSelectedSubs: TRadioButton
      Left = 8
      Top = 24
      Width = 273
      Height = 17
      Caption = 'Selected subtitles only'
      TabOrder = 1
    end
  end
  object btnApply: TButton
    Left = 128
    Top = 112
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
  object btnCancel: TButton
    Left = 216
    Top = 112
    Width = 81
    Height = 25
    Cancel = True
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 1
  end
  object pnlRoundFactor: TPanel
    Left = 8
    Top = 8
    Width = 289
    Height = 41
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    object lblMilliseconds: TLabel
      Left = 200
      Top = 16
      Width = 56
      Height = 13
      Caption = 'milliseconds'
    end
    object edtRoundingFactor: TLabeledEdit
      Left = 128
      Top = 12
      Width = 49
      Height = 21
      EditLabel.Width = 47
      EditLabel.Height = 13
      EditLabel.Caption = 'Round to:'
      LabelPosition = lpLeft
      TabOrder = 1
      Text = '100'
    end
    object udRoundingFactor: TUpDown
      Left = 177
      Top = 12
      Width = 16
      Height = 21
      Associate = edtRoundingFactor
      Min = 2
      Max = 10000
      Increment = 5
      Position = 100
      TabOrder = 0
      Thousands = False
    end
  end
end
