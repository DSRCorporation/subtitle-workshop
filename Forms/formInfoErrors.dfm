object frmInfoErrors: TfrmInfoErrors
  Left = 1394
  Top = 186
  AutoScroll = False
  BorderIcons = [biSystemMenu]
  Caption = 'frmInfoErrors'
  ClientHeight = 768
  ClientWidth = 505
  Color = clBtnFace
  Constraints.MinHeight = 300
  Constraints.MinWidth = 513
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnResize = FormResize
  OnShow = FormShow
  DesignSize = (
    505
    768)
  PixelsPerInch = 96
  TextHeight = 13
  object sbErrorTypes: TSpeedButton
    Left = 118
    Top = 736
    Width = 123
    Height = 24
    Hint = 'Show/hide Error types panel'
    AllowAllUp = True
    Anchors = [akLeft, akBottom]
    GroupIndex = 1
    Down = True
    Caption = 'Error types'
    ParentShowHint = False
    ShowHint = True
    OnClick = sbErrorTypesClick
  end
  object sbCustomInfo: TSpeedButton
    Left = 246
    Top = 736
    Width = 123
    Height = 24
    Hint = 'Show/hide Custom info panel'
    AllowAllUp = True
    Anchors = [akLeft, akBottom]
    GroupIndex = 2
    Caption = 'Custom info'
    ParentShowHint = False
    ShowHint = True
    OnClick = sbCustomInfoClick
  end
  object pnlInfoErrorsWrapper: TPanel
    Left = 8
    Top = 8
    Width = 489
    Height = 720
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvNone
    TabOrder = 2
    object spSplitter: TSplitter
      Left = 0
      Top = 654
      Width = 489
      Height = 8
      Cursor = crVSplit
      Align = alBottom
      AutoSnap = False
      MinSize = 58
      ResizeStyle = rsUpdate
      OnCanResize = spSplitterCanResize
      OnMoved = spSplitterMoved
    end
    object pnlInfoErrorsList: TPanel
      Left = 0
      Top = 0
      Width = 489
      Height = 380
      Align = alClient
      BevelOuter = bvNone
      Constraints.MinHeight = 226
      FullRepaint = False
      TabOrder = 0
      DesignSize = (
        489
        380)
      object bvlInfoErrors: TBevel
        Left = 0
        Top = 0
        Width = 489
        Height = 380
        Anchors = [akLeft, akTop, akRight, akBottom]
      end
      object lblFixedErrors: TLabel
        Left = 380
        Top = 338
        Width = 86
        Height = 13
        Alignment = taRightJustify
        Anchors = [akRight, akBottom]
        Caption = 'Fixed errrors: 0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblTotalErrors: TLabel
        Left = 381
        Top = 322
        Width = 85
        Height = 13
        Alignment = taRightJustify
        Anchors = [akRight, akBottom]
        Caption = 'Total errrors: 0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblDisplayed: TLabel
        Left = 398
        Top = 18
        Width = 68
        Height = 13
        Alignment = taRightJustify
        Anchors = [akTop, akRight]
        Caption = 'Displayed: 0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object sbShowHideCustomInfoType: TSpeedButton
        Left = 226
        Top = 8
        Width = 30
        Height = 24
        Hint = 'Show/hide Custom info'
        AllowAllUp = True
        GroupIndex = 6
        Down = True
        Caption = 'CI'
        ParentShowHint = False
        ShowHint = True
        OnClick = sbShowHideCustomInfoTypeClick
      end
      object sbShowHideErrorType: TSpeedButton
        Left = 136
        Top = 8
        Width = 30
        Height = 24
        Hint = 'Show/hide Errors'
        AllowAllUp = True
        GroupIndex = 3
        Down = True
        Caption = 'E'
        ParentShowHint = False
        ShowHint = True
        OnClick = sbShowHideErrorTypeClick
      end
      object sbShowHideFixedType: TSpeedButton
        Left = 196
        Top = 8
        Width = 30
        Height = 24
        Hint = 'Show/hide Fixed'
        AllowAllUp = True
        GroupIndex = 5
        Down = True
        Caption = 'F'
        ParentShowHint = False
        ShowHint = True
        OnClick = sbShowHideFixedTypeClick
      end
      object sbShowHideWarningType: TSpeedButton
        Left = 166
        Top = 8
        Width = 30
        Height = 24
        Hint = 'Show/hide Warnings'
        AllowAllUp = True
        GroupIndex = 4
        Down = True
        Caption = 'W'
        ParentShowHint = False
        ShowHint = True
        OnClick = sbShowHideWarningTypeClick
      end
      object lstErrors: TVirtualStringTree
        Left = 8
        Top = 40
        Width = 473
        Height = 277
        Anchors = [akLeft, akTop, akRight, akBottom]
        DefaultPasteMode = amInsertAfter
        EditDelay = 100
        Header.AutoSizeIndex = 4
        Header.DefaultHeight = 17
        Header.Font.Charset = ANSI_CHARSET
        Header.Font.Color = clWindowText
        Header.Font.Height = -11
        Header.Font.Name = 'Tahoma'
        Header.Font.Style = []
        Header.Options = [hoAutoResize, hoColumnResize, hoDrag, hoRestrictDrag, hoShowSortGlyphs, hoVisible]
        Header.SortColumn = 0
        Header.Style = hsPlates
        HintMode = hmHintAndDefault
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        TreeOptions.AutoOptions = [toAutoDropExpand, toAutoScroll, toAutoTristateTracking, toAutoDeleteMovedNodes]
        TreeOptions.MiscOptions = [toAcceptOLEDrop, toFullRepaintOnResize, toInitOnSave, toReportMode, toToggleOnDblClick, toWheelPanning]
        TreeOptions.PaintOptions = [toShowButtons, toShowDropmark, toShowHorzGridLines, toShowTreeLines, toShowVertGridLines, toThemeAware, toUseBlendedImages]
        TreeOptions.SelectionOptions = [toFullRowSelect]
        OnCompareNodes = lstErrorsCompareNodes
        OnDblClick = lstErrorsDblClick
        OnFreeNode = lstErrorsFreeNode
        OnGetText = lstErrorsGetText
        OnPaintText = lstErrorsPaintText
        OnGetNodeDataSize = lstErrorsGetNodeDataSize
        OnHeaderClick = lstErrorsHeaderClick
        OnInitNode = lstErrorsInitNode
        Columns = <
          item
            Options = [coAllowClick, coDraggable, coEnabled, coParentBidiMode, coResizable, coShowDropMark, coVisible, coAllowFocus]
            Position = 0
            WideText = 'Subtitle'
          end
          item
            Position = 1
            Width = 80
            WideText = 'Type'
          end
          item
            Position = 2
            Width = 339
            WideText = 'Description'
          end>
      end
      object btnCheck: TButton
        Left = 8
        Top = 8
        Width = 114
        Height = 24
        Caption = 'Check'
        TabOrder = 1
        OnClick = btnCheckClick
      end
      object btnPrevious: TButton
        Left = 290
        Top = 8
        Width = 24
        Height = 24
        Caption = '<'
        TabOrder = 2
        OnClick = btnPreviousClick
      end
      object btnNext: TButton
        Left = 320
        Top = 8
        Width = 24
        Height = 24
        Caption = '>'
        TabOrder = 3
        OnClick = btnNextClick
      end
      object btnFixErrors: TButton
        Left = 8
        Top = 324
        Width = 105
        Height = 24
        Anchors = [akLeft, akBottom]
        Caption = 'Fix errors'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        OnClick = btnFixErrorsClick
      end
      object btnSelect: TButton
        Left = 8
        Top = 354
        Width = 105
        Height = 20
        Hint = 'Select subtitles'
        Anchors = [akLeft, akBottom]
        Caption = 'Select'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        OnClick = btnSelectClick
      end
      object btnSelectPlus: TButton
        Left = 120
        Top = 354
        Width = 105
        Height = 20
        Hint = 'Add to selected subtitles'
        Anchors = [akLeft, akBottom]
        Caption = '+ Select'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        OnClick = btnSelectPlusClick
      end
      object btnSelectMinus: TButton
        Left = 232
        Top = 354
        Width = 105
        Height = 20
        Hint = 'Remove from selected subtitles'
        Anchors = [akLeft, akBottom]
        Caption = '- Select'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 7
        OnClick = btnSelectMinusClick
      end
      object chkConfirm: TCheckBox
        Left = 120
        Top = 328
        Width = 185
        Height = 17
        Anchors = [akLeft, akBottom]
        Caption = 'Confirm each deletion'
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 8
      end
      object btnExportToFile: TButton
        Left = 368
        Top = 354
        Width = 113
        Height = 20
        Anchors = [akRight, akBottom]
        Caption = 'Export to file'
        TabOrder = 9
        OnClick = btnExportToFileClick
      end
    end
    object pnlErrorTypes: TPanel
      Left = 0
      Top = 380
      Width = 489
      Height = 274
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      DesignSize = (
        489
        274)
      object bvlBottom: TBevel
        Left = 0
        Top = 270
        Width = 489
        Height = 2
        Anchors = [akLeft, akRight, akBottom]
        Shape = bsTopLine
      end
      object bvlTop: TBevel
        Left = 0
        Top = 32
        Width = 489
        Height = 2
        Anchors = [akLeft, akTop, akRight]
        Shape = bsTopLine
      end
      object pnlErrorTypesRightCol: TPanel
        Left = 247
        Top = 40
        Width = 242
        Height = 225
        BevelOuter = bvNone
        FullRepaint = False
        TabOrder = 5
        DesignSize = (
          242
          225)
        object lblCountUnnecessaryTags: TLabel
          Left = 213
          Top = 184
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Caption = '9999'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblCountUnnecessarySpaces: TLabel
          Left = 213
          Top = 168
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Caption = '9999'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblCountUnnecessaryDots: TLabel
          Left = 213
          Top = 0
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Caption = '9999'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblCountTooMuchCPS: TLabel
          Left = 213
          Top = 208
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Caption = '9999'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblCountSpaceBeforeCustomChars: TLabel
          Left = 213
          Top = 152
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Caption = '9999'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblCountSpaceAfterCustomChars: TLabel
          Left = 213
          Top = 136
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Caption = '9999'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblCountRepeatedSubs: TLabel
          Left = 213
          Top = 48
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Caption = '9999'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblCountRepeatedChars: TLabel
          Left = 213
          Top = 32
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Caption = '9999'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblCountProhibitedChars: TLabel
          Left = 213
          Top = 16
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Caption = '9999'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblCountOpnDlgInSubsWithOneLine: TLabel
          Left = 213
          Top = 88
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Caption = '9999'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblCountOCRErrors: TLabel
          Left = 213
          Top = 64
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Caption = '9999'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblCountDialogueOnOneLine: TLabel
          Left = 213
          Top = 120
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Caption = '9999'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblCountDashOnFirstLine: TLabel
          Left = 213
          Top = 104
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Caption = '9999'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object chkUnnecessaryDots: TCheckBox
          Left = 0
          Top = 0
          Width = 210
          Height = 17
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Unnecessary dots'
          TabOrder = 0
          OnClick = chkUnnecessaryDotsClick
        end
        object chkProhibitedChars: TCheckBox
          Left = 0
          Top = 16
          Width = 210
          Height = 17
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Prohibited characters'
          TabOrder = 1
          OnClick = chkProhibitedCharsClick
        end
        object chkRepeatedChars: TCheckBox
          Left = 0
          Top = 32
          Width = 210
          Height = 17
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Repeated characters'
          TabOrder = 2
          OnClick = chkRepeatedCharsClick
        end
        object chkRepeatedSubs: TCheckBox
          Left = 0
          Top = 48
          Width = 210
          Height = 17
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Repeated subtitles'
          TabOrder = 3
          OnClick = chkRepeatedSubsClick
        end
        object chkOCRErrors: TCheckBox
          Left = 0
          Top = 64
          Width = 210
          Height = 17
          Anchors = [akLeft, akTop, akRight]
          Caption = 'OCR Errors'
          TabOrder = 4
          OnClick = chkOCRErrorsClick
        end
        object chkOpnDlgInSubsWithOneLine: TCheckBox
          Left = 0
          Top = 88
          Width = 210
          Height = 17
          Anchors = [akLeft, akTop, akRight]
          Caption = '"- " in subtitles with one line'
          TabOrder = 5
          OnClick = chkOpnDlgInSubsWithOneLineClick
        end
        object chkDashOnFirstLine: TCheckBox
          Left = 0
          Top = 104
          Width = 210
          Height = 17
          Anchors = [akLeft, akTop, akRight]
          Caption = '"- " on first line'
          TabOrder = 6
          OnClick = chkDashOnFirstLineClick
        end
        object chkDialogueOnOneLine: TCheckBox
          Left = 0
          Top = 120
          Width = 210
          Height = 17
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Dialogue on one line'
          TabOrder = 7
          OnClick = chkDialogueOnOneLineClick
        end
        object chkSpaceAfterCustomChars: TCheckBox
          Left = 0
          Top = 136
          Width = 210
          Height = 17
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Space after custom characters'
          TabOrder = 8
          OnClick = chkSpaceAfterCustomCharsClick
        end
        object chkSpaceBeforeCustomChars: TCheckBox
          Left = 0
          Top = 152
          Width = 210
          Height = 17
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Space before custom characters'
          TabOrder = 9
          OnClick = chkSpaceBeforeCustomCharsClick
        end
        object chkUnnecessarySpaces: TCheckBox
          Left = 0
          Top = 168
          Width = 210
          Height = 17
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Unnecessary spaces'
          TabOrder = 10
          OnClick = chkUnnecessarySpacesClick
        end
        object chkUnnecessaryTags: TCheckBox
          Left = 0
          Top = 184
          Width = 210
          Height = 17
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Unnecessary tags'
          TabOrder = 11
          OnClick = chkUnnecessaryTagsClick
        end
        object chkTooMuchCPS: TCheckBox
          Left = 0
          Top = 208
          Width = 210
          Height = 17
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Too many characters per second'
          TabOrder = 12
          OnClick = chkTooMuchCPSClick
        end
      end
      object pnlErrorTypesLeftCol: TPanel
        Left = 0
        Top = 40
        Width = 241
        Height = 225
        BevelOuter = bvNone
        FullRepaint = False
        TabOrder = 4
        DesignSize = (
          241
          225)
        object lblCountMarkedSubs: TLabel
          Left = 210
          Top = 0
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Caption = '9999'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblCountLinesWithoutLetters: TLabel
          Left = 210
          Top = 24
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Caption = '9999'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblCountEmptySubtitles: TLabel
          Left = 210
          Top = 40
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Caption = '9999'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblCountOverlapping: TLabel
          Left = 210
          Top = 64
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Caption = '9999'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblCountBadValues: TLabel
          Left = 210
          Top = 80
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Caption = '9999'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblCountTooShortPause: TLabel
          Left = 210
          Top = 96
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Caption = '9999'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblCountTooLongDur: TLabel
          Left = 210
          Top = 120
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Caption = '9999'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblCountTooShortDur: TLabel
          Left = 210
          Top = 136
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Caption = '9999'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblCountTooLongLines: TLabel
          Left = 210
          Top = 152
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Caption = '9999'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblCountOverTwoLines: TLabel
          Left = 210
          Top = 168
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Caption = '9999'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblCountHearingImpaired: TLabel
          Left = 210
          Top = 192
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Caption = '9999'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblCountTextBeforeColon: TLabel
          Left = 210
          Top = 208
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Caption = '9999'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object chkMarkedSubs: TCheckBox
          Left = 0
          Top = 0
          Width = 207
          Height = 17
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Marked subtitles'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = chkMarkedSubsClick
        end
        object chkLinesWithoutLetters: TCheckBox
          Left = 0
          Top = 24
          Width = 207
          Height = 17
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Lines without letters'
          TabOrder = 1
          OnClick = chkLinesWithoutLettersClick
        end
        object chkEmptySubtitles: TCheckBox
          Left = 0
          Top = 40
          Width = 207
          Height = 17
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Empty subtitles'
          TabOrder = 2
          OnClick = chkEmptySubtitlesClick
        end
        object chkOverlapping: TCheckBox
          Left = 0
          Top = 64
          Width = 207
          Height = 17
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Overlapping subtitles'
          TabOrder = 3
          OnClick = chkOverlappingClick
        end
        object chkBadValues: TCheckBox
          Left = 0
          Top = 80
          Width = 207
          Height = 17
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Bad values'
          TabOrder = 4
          OnClick = chkBadValuesClick
        end
        object chkTooShortPause: TCheckBox
          Left = 0
          Top = 96
          Width = 207
          Height = 17
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Too short pause'
          TabOrder = 5
          OnClick = chkTooShortPauseClick
        end
        object chkTooLongDur: TCheckBox
          Left = 0
          Top = 120
          Width = 207
          Height = 17
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Too long durations'
          TabOrder = 6
          OnClick = chkTooLongDurClick
        end
        object chkTooShortDur: TCheckBox
          Left = 0
          Top = 136
          Width = 207
          Height = 17
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Too short durations'
          TabOrder = 7
          OnClick = chkTooShortDurClick
        end
        object chkTooLongLines: TCheckBox
          Left = 0
          Top = 152
          Width = 207
          Height = 17
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Too long lines'
          TabOrder = 8
          OnClick = chkTooLongLinesClick
        end
        object chkOverTwoLines: TCheckBox
          Left = 0
          Top = 168
          Width = 207
          Height = 17
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Subtitles over two lines'
          TabOrder = 9
          OnClick = chkOverTwoLinesClick
        end
        object chkHearingImpaired: TCheckBox
          Left = 0
          Top = 192
          Width = 207
          Height = 17
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Hearing impaired subtitles'
          TabOrder = 10
          OnClick = chkHearingImpairedClick
        end
        object chkTextBeforeColon: TCheckBox
          Left = 0
          Top = 208
          Width = 207
          Height = 17
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Text before colon (":")'
          TabOrder = 11
          OnClick = chkTextBeforeColonClick
        end
      end
      object btnCheckAllErr: TButton
        Left = 79
        Top = 9
        Width = 76
        Height = 18
        Hint = 'Select all'
        Caption = 'All'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = btnCheckAllErrClick
      end
      object btnCheckNoneErr: TButton
        Left = 159
        Top = 9
        Width = 76
        Height = 18
        Hint = 'Select none'
        Caption = 'None'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = btnCheckNoneErrClick
      end
      object btnCheckInverseErr: TButton
        Left = 239
        Top = 9
        Width = 76
        Height = 18
        Hint = 'Invert selection'
        Caption = 'Inverse'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = btnCheckInverseErrClick
      end
      object tbErrorTypesSets: TToolBar
        Left = 443
        Top = 8
        Width = 46
        Height = 22
        Align = alNone
        Anchors = [akTop, akRight]
        Caption = 'tbErrorTypesSets'
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
        TabOrder = 3
        object tbtnSaveErrorTypesSet: TToolButton
          Left = 0
          Top = 0
          Hint = 'Save error types set'
          Caption = 'Save error types set'
          ImageIndex = 11
          OnClick = tbtnSaveErrorTypesSetClick
        end
        object tbtnDeleteErrorTypesSet: TToolButton
          Left = 23
          Top = 0
          Hint = 'Delete error types set'
          Caption = 'Delete error types set'
          ImageIndex = 26
          OnClick = tbtnDeleteErrorTypesSetClick
        end
      end
      object cmbErrorTypesSets: TComboBox
        Left = 320
        Top = 8
        Width = 120
        Height = 21
        Hint = 'Error types sets'
        AutoComplete = False
        Anchors = [akTop, akRight]
        DropDownCount = 12
        ItemHeight = 13
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        OnKeyPress = cmbErrorTypesSetsKeyPress
        OnSelect = cmbErrorTypesSetsSelect
      end
    end
    object pnlCustomInfo: TPanel
      Left = 0
      Top = 662
      Width = 489
      Height = 58
      Align = alBottom
      BevelOuter = bvNone
      Constraints.MinHeight = 58
      TabOrder = 2
      DesignSize = (
        489
        58)
      object bvlTop2: TBevel
        Left = 0
        Top = 24
        Width = 489
        Height = 2
        Anchors = [akLeft, akTop, akRight]
        Shape = bsTopLine
      end
      object bvlBottom2: TBevel
        Left = 0
        Top = 56
        Width = 489
        Height = 2
        Anchors = [akLeft, akRight, akBottom]
        Shape = bsTopLine
      end
      object scrollboxCustomInfo: TScrollBox
        Left = 0
        Top = 32
        Width = 489
        Height = 24
        HorzScrollBar.Smooth = True
        HorzScrollBar.Tracking = True
        HorzScrollBar.Visible = False
        VertScrollBar.Smooth = True
        VertScrollBar.Tracking = True
        Anchors = [akLeft, akTop, akRight]
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
          TabOrder = 0
        end
      end
      object cmbCustomInfoSets: TComboBox
        Left = 320
        Top = 0
        Width = 120
        Height = 21
        Hint = 'Custom info sets'
        AutoComplete = False
        Anchors = [akTop, akRight]
        ItemHeight = 13
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnKeyPress = cmbCustomInfoSetsKeyPress
        OnSelect = cmbCustomInfoSetsSelect
      end
      object btnCheckAllCI: TButton
        Left = 79
        Top = 1
        Width = 76
        Height = 18
        Hint = 'Select all'
        Caption = 'All'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = btnCheckAllCIClick
      end
      object btnCheckNoneCI: TButton
        Left = 159
        Top = 1
        Width = 76
        Height = 18
        Hint = 'Select none'
        Caption = 'None'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = btnCheckNoneCIClick
      end
      object btnCheckInverseCI: TButton
        Left = 239
        Top = 1
        Width = 76
        Height = 18
        Hint = 'Invert selection'
        Caption = 'Inverse'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnClick = btnCheckInverseCIClick
      end
      object tbCustomInfoSets: TToolBar
        Left = 443
        Top = 0
        Width = 46
        Height = 22
        Align = alNone
        Anchors = [akTop, akRight]
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
        TabOrder = 5
        object tbtnSaveCustomInfoSet: TToolButton
          Left = 0
          Top = 0
          Hint = 'Save custom info set'
          Caption = 'Save custom info set'
          ImageIndex = 11
          OnClick = tbtnSaveCustomInfoSetClick
        end
        object tbtnDeleteCustomInfoSet: TToolButton
          Left = 23
          Top = 0
          Hint = 'Delete custom info set'
          Caption = 'Delete custom info set'
          ImageIndex = 26
          OnClick = tbtnDeleteCustomInfoSetClick
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
        TabOrder = 6
        object tbtnAddCustomInfo: TToolButton
          Tag = 7
          Left = 0
          Top = 0
          Hint = 'Add custom info'
          Caption = 'Add custom info'
          DropdownMenu = mnuAddCustomInfoDropdown
          ImageIndex = 25
          Style = tbsDropDown
          OnClick = mnuCustomInfoClick
        end
      end
    end
  end
  object btnSettings: TButton
    Left = 8
    Top = 736
    Width = 105
    Height = 24
    Anchors = [akLeft, akBottom]
    Caption = '&Settings'
    TabOrder = 1
    OnClick = btnSettingsClick
  end
  object btnOk: TButton
    Left = 392
    Top = 736
    Width = 105
    Height = 24
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = '&Ok'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ModalResult = 1
    ParentFont = False
    TabOrder = 0
    OnClick = btnOkClick
  end
  object tmrDeleteCustomInfo: TTimer
    Enabled = False
    Interval = 50
    OnTimer = tmrDeleteCustomInfoTimer
    Left = 432
    Top = 696
  end
  object mnuAddCustomInfoDropdown: TPopupMenu
    Left = 48
    Top = 664
    object mnuCompositeCustomInfo: TMenuItem
      Tag = 7
      Caption = 'Composite custom info'
      Default = True
      OnClick = mnuCustomInfoClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
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
  object dlgSave: TSaveDialog
    Left = 352
    Top = 360
  end
  object tmrBlink: TTimer
    Enabled = False
    Interval = 14
    OnTimer = tmrBlinkTimer
    Left = 400
    Top = 696
  end
end
