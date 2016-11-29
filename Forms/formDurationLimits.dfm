object frmDurationLimits: TfrmDurationLimits
  Left = 381
  Top = 565
  BiDiMode = bdLeftToRight
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmDurationLimits'
  ClientHeight = 217
  ClientWidth = 361
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object btnApply: TButton
    Left = 184
    Top = 184
    Width = 81
    Height = 25
    Caption = '&Apply'
    Default = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = btnApplyClick
  end
  object btnCancel: TButton
    Left = 272
    Top = 184
    Width = 81
    Height = 25
    Cancel = True
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 345
    Height = 169
    TabOrder = 2
    object lblNoOverlapping: TLabel
      Left = 16
      Top = 112
      Width = 321
      Height = 25
      AutoSize = False
      Caption = '* Increasing the time will not cause overlapping'
      WordWrap = True
    end
    object edtMaxDur: TLabeledEdit
      Left = 16
      Top = 32
      Width = 81
      Height = 21
      EditLabel.Width = 55
      EditLabel.Height = 13
      EditLabel.Caption = 'Milliseconds'
      LabelPosition = lpRight
      MaxLength = 6
      TabOrder = 1
      OnKeyPress = edtMaxDurKeyPress
    end
    object chkSetMaxDur: TCheckBox
      Left = 8
      Top = 8
      Width = 329
      Height = 17
      Caption = 'Set maximum duration'
      TabOrder = 0
    end
    object edtMinDur: TLabeledEdit
      Left = 16
      Top = 88
      Width = 81
      Height = 21
      EditLabel.Width = 55
      EditLabel.Height = 13
      EditLabel.Caption = 'Milliseconds'
      LabelPosition = lpRight
      MaxLength = 6
      TabOrder = 3
      OnKeyPress = edtMinDurKeyPress
    end
    object chkSetMinDur: TCheckBox
      Left = 8
      Top = 64
      Width = 329
      Height = 17
      Caption = 'Set minimum duration'
      TabOrder = 2
    end
    object chkIncreaseAtStart: TCheckBox
      Left = 16
      Top = 140
      Width = 321
      Height = 17
      Caption = 'Increase at start if necessary'
      TabOrder = 4
    end
  end
end
