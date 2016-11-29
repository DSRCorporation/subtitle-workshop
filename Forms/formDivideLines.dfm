object frmDivideLines: TfrmDivideLines
  Left = 372
  Top = 224
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Divide lines'
  ClientHeight = 353
  ClientWidth = 577
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
  object btnDivide: TButton
    Left = 400
    Top = 320
    Width = 81
    Height = 25
    Caption = '&Divide'
    Default = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ModalResult = 1
    ParentFont = False
    TabOrder = 0
    OnClick = btnDivideClick
  end
  object btnCancel: TButton
    Left = 488
    Top = 320
    Width = 81
    Height = 25
    Cancel = True
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 1
  end
  object pnlDivideLines: TPanel
    Left = 8
    Top = 8
    Width = 561
    Height = 305
    TabOrder = 2
    object lblDivideAfterLineNumber: TLabel
      Left = 8
      Top = 8
      Width = 118
      Height = 13
      Caption = 'Divide after line number:'
    end
    object Bevel1: TBevel
      Left = 8
      Top = 192
      Width = 545
      Height = 3
    end
    object lblShowSub1: TLabel
      Left = 8
      Top = 89
      Width = 73
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Show:'
    end
    object lblHideSub1: TLabel
      Left = 8
      Top = 113
      Width = 73
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Hide:'
    end
    object lblShowSub2: TLabel
      Left = 8
      Top = 225
      Width = 73
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Show:'
    end
    object lblHideSub2: TLabel
      Left = 8
      Top = 249
      Width = 73
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Hide:'
    end
    object lblDuration1: TLabel
      Left = 8
      Top = 137
      Width = 73
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Duration:'
    end
    object lblDuration2: TLabel
      Left = 8
      Top = 273
      Width = 73
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Duration:'
    end
    object lblLength1: TLabel
      Left = 192
      Top = 72
      Width = 49
      Height = 13
      Caption = 'lblLength1'
    end
    object lblLength2: TLabel
      Left = 192
      Top = 208
      Width = 49
      Height = 13
      Caption = 'lblLength2'
    end
    object mmoSub2Old: TMemo
      Left = 192
      Top = 224
      Width = 361
      Height = 70
      TabOrder = 2
      Visible = False
      OnChange = mmoSubtitle2Change
      OnKeyDown = mmoSubtitle2KeyDown
    end
    object mmoSub1Old: TMemo
      Left = 192
      Top = 88
      Width = 361
      Height = 70
      TabOrder = 0
      Visible = False
      OnChange = mmoSubtitle1Change
      OnKeyDown = mmoSubtitle1KeyDown
    end
    object mmoSub1: TRichEdit
      Left = 192
      Top = 88
      Width = 361
      Height = 70
      PlainText = True
      TabOrder = 1
      OnChange = mmoSubtitle1Change
      OnKeyDown = mmoSubtitle1KeyDown
    end
    object mmoSub2: TRichEdit
      Left = 192
      Top = 224
      Width = 361
      Height = 70
      TabOrder = 3
      OnChange = mmoSubtitle2Change
      OnKeyDown = mmoSubtitle2KeyDown
    end
    object edtDivideAfterBreakNum: TEdit
      Left = 16
      Top = 24
      Width = 33
      Height = 21
      ReadOnly = True
      TabOrder = 4
      Text = '1'
    end
    object udDivideAfterBreakNum: TUpDown
      Left = 49
      Top = 24
      Width = 15
      Height = 21
      Associate = edtDivideAfterBreakNum
      Min = 1
      Position = 1
      TabOrder = 5
      OnChangingEx = udDivideAfterBreakNumChangingEx
    end
    object btn31: TButton
      Left = 430
      Top = 8
      Width = 33
      Height = 41
      Caption = '3:1'
      TabOrder = 12
      OnClick = btn31Click
    end
    object btn13: TButton
      Left = 397
      Top = 8
      Width = 33
      Height = 41
      Caption = '1:3'
      TabOrder = 11
      OnClick = btn13Click
    end
    object btn32: TButton
      Left = 356
      Top = 8
      Width = 33
      Height = 41
      Caption = '3:2'
      TabOrder = 10
      OnClick = btn32Click
    end
    object btn23: TButton
      Left = 323
      Top = 8
      Width = 33
      Height = 41
      Caption = '2:3'
      TabOrder = 9
      OnClick = btn23Click
    end
    object btn21: TButton
      Left = 282
      Top = 8
      Width = 33
      Height = 41
      Caption = '2:1'
      TabOrder = 8
      OnClick = btn21Click
    end
    object btn12: TButton
      Left = 249
      Top = 8
      Width = 33
      Height = 41
      Caption = '1:2'
      TabOrder = 7
      OnClick = btn12Click
    end
    object btn11: TButton
      Left = 192
      Top = 8
      Width = 49
      Height = 41
      Caption = '1:1'
      TabOrder = 6
      OnClick = btn11Click
    end
    object chkContinueDirectly: TCheckBox
      Left = 8
      Top = 168
      Width = 449
      Height = 17
      Caption = 'Continue directly'
      TabOrder = 14
      OnClick = chkContinueDirectlyClick
    end
    object chkUseAutoDur: TCheckBox
      Left = 8
      Top = 56
      Width = 449
      Height = 17
      Caption = 'Use automatic duration'
      TabOrder = 13
      OnClick = chkUseAutoDurClick
    end
    object tmeShowSub1: TTimeMaskEdit
      Left = 88
      Top = 88
      Width = 97
      Height = 22
      Alignment = taCenter
      ChangeTimeOnModify = False
      Enabled = False
      FPS = 25.000000000000000000
      MinTime = 0
      ReadOnly = True
      TabOrder = 15
      Time = 0
      TimeMode = tmTime
      TimeStep = 100
      FramesStep = 1
    end
    object tmeHideSub1: TTimeMaskEdit
      Left = 88
      Top = 112
      Width = 97
      Height = 22
      Alignment = taCenter
      ChangeTimeOnModify = False
      FPS = 25.000000000000000000
      MinTime = 0
      TabOrder = 16
      Time = 0
      TimeMode = tmTime
      TimeStep = 100
      FramesStep = 1
      OnTimeChangeFromEditOnly = tmeHideSub1TimeChangeFromEditOnly
    end
    object tmeDuration1: TTimeMaskEdit
      Left = 88
      Top = 136
      Width = 97
      Height = 22
      Alignment = taCenter
      ChangeTimeOnModify = False
      FPS = 25.000000000000000000
      MinTime = 0
      TabOrder = 17
      Time = 0
      TimeMode = tmTime
      TimeStep = 100
      FramesStep = 1
      OnTimeChangeFromEditOnly = tmeDuration1TimeChangeFromEditOnly
    end
    object tmeShowSub2: TTimeMaskEdit
      Left = 88
      Top = 224
      Width = 97
      Height = 22
      Alignment = taCenter
      ChangeTimeOnModify = False
      FPS = 25.000000000000000000
      MinTime = 0
      TabOrder = 18
      Time = 0
      TimeMode = tmTime
      TimeStep = 100
      FramesStep = 1
      OnTimeChangeFromEditOnly = tmeShowSub2TimeChangeFromEditOnly
    end
    object tmeHideSub2: TTimeMaskEdit
      Left = 88
      Top = 248
      Width = 97
      Height = 22
      Alignment = taCenter
      ChangeTimeOnModify = False
      Enabled = False
      FPS = 25.000000000000000000
      MinTime = 0
      ReadOnly = True
      TabOrder = 19
      Time = 0
      TimeMode = tmTime
      TimeStep = 100
      FramesStep = 1
    end
    object tmeDuration2: TTimeMaskEdit
      Left = 88
      Top = 272
      Width = 97
      Height = 22
      Alignment = taCenter
      ChangeTimeOnModify = False
      Enabled = False
      FPS = 25.000000000000000000
      MinTime = 0
      ReadOnly = True
      TabOrder = 20
      Time = 0
      TimeMode = tmTime
      TimeStep = 100
      FramesStep = 1
    end
  end
end
