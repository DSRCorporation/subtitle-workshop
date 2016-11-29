object frmCompositeCustomInfo: TfrmCompositeCustomInfo
  Left = 296
  Top = 561
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'TfrmCompositeCustomInfo'
  ClientHeight = 553
  ClientWidth = 529
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object bvlInfoErrors: TBevel
    Left = 8
    Top = 8
    Width = 513
    Height = 505
    Style = bsRaised
  end
  object pnlErrorTypes: TPanel
    Left = 16
    Top = 47
    Width = 489
    Height = 268
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      489
      268)
    object bvlBottom: TBevel
      Left = 0
      Top = 265
      Width = 489
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object bvlTop: TBevel
      Left = 0
      Top = 23
      Width = 489
      Height = 2
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object chkLinesWithoutLetters: TCheckBox
      Left = 0
      Top = 56
      Width = 240
      Height = 17
      Caption = 'Lines without letters'
      TabOrder = 1
    end
    object chkEmptySubtitles: TCheckBox
      Left = 0
      Top = 72
      Width = 240
      Height = 17
      Caption = 'Empty subtitles'
      TabOrder = 2
    end
    object chkOverlapping: TCheckBox
      Left = 0
      Top = 96
      Width = 240
      Height = 17
      Caption = 'Overlapping subtitles'
      TabOrder = 3
    end
    object chkBadValues: TCheckBox
      Left = 0
      Top = 112
      Width = 240
      Height = 17
      Caption = 'Bad values'
      TabOrder = 4
    end
    object chkTooShortPause: TCheckBox
      Left = 0
      Top = 128
      Width = 240
      Height = 17
      Caption = 'Too short pause'
      TabOrder = 5
    end
    object chkTooLongDur: TCheckBox
      Left = 0
      Top = 152
      Width = 240
      Height = 17
      Caption = 'Too long durations'
      TabOrder = 6
    end
    object chkTooShortDur: TCheckBox
      Left = 0
      Top = 168
      Width = 240
      Height = 17
      Caption = 'Too short durations'
      TabOrder = 7
    end
    object chkTooLongLines: TCheckBox
      Left = 0
      Top = 184
      Width = 240
      Height = 17
      Caption = 'Too long lines'
      TabOrder = 8
    end
    object chkHearingImpaired: TCheckBox
      Left = 0
      Top = 224
      Width = 240
      Height = 17
      Caption = 'Hearing impaired subtitles'
      TabOrder = 10
    end
    object chkTextBeforeColon: TCheckBox
      Left = 0
      Top = 240
      Width = 240
      Height = 17
      Caption = 'Text before colon (":")'
      TabOrder = 11
    end
    object chkUnnecessaryDots: TCheckBox
      Left = 247
      Top = 32
      Width = 240
      Height = 17
      Caption = 'Unnecessary dots'
      TabOrder = 12
    end
    object chkProhibitedChars: TCheckBox
      Left = 247
      Top = 48
      Width = 240
      Height = 17
      Caption = 'Prohibited characters'
      TabOrder = 13
    end
    object chkRepeatedChars: TCheckBox
      Left = 247
      Top = 64
      Width = 240
      Height = 17
      Caption = 'Repeated characters'
      TabOrder = 14
    end
    object chkRepeatedSubs: TCheckBox
      Left = 247
      Top = 80
      Width = 240
      Height = 17
      Caption = 'Repeated subtitles'
      TabOrder = 15
    end
    object chkOCRErrors: TCheckBox
      Left = 247
      Top = 96
      Width = 240
      Height = 17
      Caption = 'OCR Errors'
      TabOrder = 16
    end
    object chkOpnDlgInSubsWithOneLine: TCheckBox
      Left = 247
      Top = 120
      Width = 240
      Height = 17
      Caption = '"- " in subtitles with one line'
      TabOrder = 17
    end
    object chkDashOnFirstLine: TCheckBox
      Left = 247
      Top = 136
      Width = 240
      Height = 17
      Caption = '"- " on first line'
      TabOrder = 18
    end
    object chkDialogueOnOneLine: TCheckBox
      Left = 247
      Top = 152
      Width = 240
      Height = 17
      Caption = 'Dialogue on one line'
      TabOrder = 19
    end
    object chkSpaceAfterCustomChars: TCheckBox
      Left = 247
      Top = 168
      Width = 240
      Height = 17
      Caption = 'Space after custom characters'
      TabOrder = 20
    end
    object chkSpaceBeforeCustomChars: TCheckBox
      Left = 247
      Top = 184
      Width = 240
      Height = 17
      Caption = 'Space before custom characters'
      TabOrder = 21
    end
    object chkUnnecessarySpaces: TCheckBox
      Left = 247
      Top = 200
      Width = 240
      Height = 17
      Caption = 'Unnecessary spaces'
      TabOrder = 22
    end
    object chkUnnecessaryTags: TCheckBox
      Left = 247
      Top = 216
      Width = 240
      Height = 17
      Caption = 'Unnecessary tags'
      TabOrder = 23
    end
    object chkTooMuchCPS: TCheckBox
      Left = 247
      Top = 240
      Width = 240
      Height = 17
      Caption = 'Too much characters per second'
      TabOrder = 25
    end
    object btnCheckAll: TButton
      Left = 0
      Top = 0
      Width = 81
      Height = 18
      Hint = 'Select all'
      Caption = 'All'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 24
      TabStop = False
      OnClick = btnCheckAllClick
    end
    object btnCheckNone: TButton
      Left = 88
      Top = 0
      Width = 81
      Height = 18
      Hint = 'Select none'
      Caption = 'None'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 26
      TabStop = False
      OnClick = btnCheckNoneClick
    end
    object chkMarkedSubs: TCheckBox
      Left = 0
      Top = 32
      Width = 240
      Height = 17
      Caption = 'Marked subtitles'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object btnCheckInverse: TButton
      Left = 176
      Top = 0
      Width = 81
      Height = 18
      Hint = 'Invert selection'
      Caption = 'Inverse'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 27
      TabStop = False
      OnClick = btnCheckInverseClick
    end
    object chkOverTwoLines: TCheckBox
      Left = 0
      Top = 200
      Width = 240
      Height = 17
      Caption = 'Subtitles over two lines'
      TabOrder = 9
    end
  end
  object pnlCustomInfo: TPanel
    Left = 16
    Top = 321
    Width = 489
    Height = 178
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      489
      178)
    object Bevel1: TBevel
      Left = 0
      Top = 24
      Width = 489
      Height = 2
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object scrollboxCustomInfo: TScrollBox
      Left = 0
      Top = 32
      Width = 489
      Height = 144
      HorzScrollBar.Smooth = True
      HorzScrollBar.Tracking = True
      HorzScrollBar.Visible = False
      VertScrollBar.Smooth = True
      VertScrollBar.Tracking = True
      BorderStyle = bsNone
      Color = clBtnFace
      ParentColor = False
      TabOrder = 0
      object pnlInsideScrollBox: TPanel
        Left = 0
        Top = 0
        Width = 465
        Height = 24
        Alignment = taLeftJustify
        BevelOuter = bvNone
        Caption = 
          ' There is no custom info. Click the "+" button to add new custom' +
          ' info.'
        Constraints.MinHeight = 24
        TabOrder = 0
      end
    end
    object tbAddCustomInfo: TToolBar
      Left = 0
      Top = 0
      Width = 36
      Height = 22
      Align = alNone
      Caption = 'tbErrorTypes'
      Color = clBtnFace
      DisabledImages = frmMain.imgLstMenuDisabled
      EdgeBorders = []
      EdgeInner = esNone
      EdgeOuter = esNone
      Flat = True
      Images = frmMain.imgLstMenu
      ParentColor = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      object tbtnAddCustomInfo: TToolButton
        Tag = 7
        Left = 0
        Top = 0
        Hint = 'Add custom info'
        Caption = 'Add custom info'
        DropdownMenu = mnuAddCustomInfoDropdown
        ImageIndex = 25
        Style = tbsDropDown
        OnClick = tbtnAddCustomInfoClick
      end
    end
  end
  object edtCaption: TLabeledEdit
    Left = 104
    Top = 16
    Width = 409
    Height = 21
    EditLabel.Width = 39
    EditLabel.Height = 13
    EditLabel.Caption = 'Caption:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    LabelPosition = lpLeft
    LabelSpacing = 6
    ParentFont = False
    TabOrder = 0
    OnKeyPress = edtCaptionKeyPress
  end
  object btnOk: TButton
    Left = 416
    Top = 520
    Width = 105
    Height = 25
    Caption = '&Ok'
    Default = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ModalResult = 1
    ParentFont = False
    TabOrder = 3
    OnClick = btnOkClick
  end
  object tmrDeleteCustomInfo: TTimer
    Enabled = False
    Interval = 50
    OnTimer = tmrDeleteCustomInfoTimer
    Left = 384
    Top = 520
  end
  object mnuAddCustomInfoDropdown: TPopupMenu
    MenuAnimation = [maTopToBottom]
    Left = 56
    Top = 320
    object mnuSubtitlesDurationCustomInfo: TMenuItem
      Tag = 1
      Caption = 'Subtitles duration information'
      OnClick = mnuCustomInfoClick
    end
    object mnuSubtitlesLineLengthCustomInfo: TMenuItem
      Tag = 2
      Caption = 'Subtitles line length information'
      OnClick = mnuCustomInfoClick
    end
    object mnuSubtitlesLinesCountCustomInfo: TMenuItem
      Tag = 3
      Caption = 'Subtitles lines count information'
      OnClick = mnuCustomInfoClick
    end
    object mnuSubtitlesPauseCustomInfo: TMenuItem
      Tag = 4
      Caption = 'Subtitles pause information'
      OnClick = mnuCustomInfoClick
    end
    object mnuSubtitlesCPSCustomInfo: TMenuItem
      Tag = 5
      Caption = 'Subtitles CPS information'
      OnClick = mnuCustomInfoClick
    end
    object mnuSubtitlesTextCustomInfo: TMenuItem
      Tag = 6
      Caption = 'Subtitles text information'
      OnClick = mnuCustomInfoClick
    end
  end
end
