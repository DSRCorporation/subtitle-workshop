object frmMain: TfrmMain
  Tag = -1
  Left = 303
  Top = 330
  AutoScroll = False
  Caption = 'Subtitle Workshop'
  ClientHeight = 432
  ClientWidth = 833
  Color = clBtnFace
  Constraints.MinHeight = 336
  Constraints.MinWidth = 720
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mnuMain
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnMouseWheelDown = FormMouseWheelDown
  OnMouseWheelUp = FormMouseWheelUp
  OnResize = FormResize
  DesignSize = (
    833
    432)
  PixelsPerInch = 96
  TextHeight = 13
  object sbStatusbar: TStatusBar
    Left = 0
    Top = 408
    Width = 833
    Height = 24
    BorderWidth = 2
    Panels = <
      item
        Alignment = taRightJustify
        Width = 392
      end
      item
        Width = 205
      end
      item
        Width = 50
      end>
    OnMouseUp = sbStatusbarMouseUp
  end
  object tbMainToolBar: TToolBar
    Left = 0
    Top = 0
    Width = 833
    Height = 33
    BorderWidth = 2
    Caption = 'tbMainToolBar'
    Color = clBtnFace
    Ctl3D = False
    DisabledImages = imgLstMenuDisabled
    EdgeBorders = []
    EdgeInner = esNone
    EdgeOuter = esNone
    Flat = True
    Images = imgLstMenu
    Indent = 6
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    object tbNewSubtitle: TToolButton
      Left = 6
      Top = 0
      Caption = 'New subtitle...'
      ImageIndex = 9
      OnMouseUp = tbNewSubtitleMouseUp
    end
    object tbLoadSubtitle: TToolButton
      Left = 29
      Top = 0
      Caption = 'Load subtitle...'
      DropdownMenu = mnuRecentDropdown
      ImageIndex = 10
      Style = tbsDropDown
      OnMouseDown = tbLoadSubtitleMouseDown
      OnMouseUp = tbLoadSubtitleMouseUp
    end
    object tbSaveFile: TToolButton
      Left = 65
      Top = 0
      Caption = 'Save'
      ImageIndex = 11
      OnMouseUp = tbSaveFileMouseUp
    end
    object tbSeparator1: TToolButton
      Left = 88
      Top = 0
      Width = 16
      Style = tbsSeparator
    end
    object tbUndo: TToolButton
      Left = 104
      Top = 0
      Caption = 'Undo'
      DropdownMenu = mnuUndoDropdown
      ImageIndex = 12
      Style = tbsDropDown
      OnMouseDown = tbUndoMouseDown
      OnMouseUp = tbUndoMouseUp
    end
    object tbRedo: TToolButton
      Left = 140
      Top = 0
      Caption = 'Redo'
      DropdownMenu = mnuRedoDropdown
      ImageIndex = 13
      Style = tbsDropDown
      OnMouseDown = tbRedoMouseDown
      OnMouseUp = tbRedoMouseUp
    end
    object tbSeoarator2: TToolButton
      Left = 176
      Top = 0
      Width = 16
      Caption = 'tbSeoarator2'
      ImageIndex = 14
      Style = tbsSeparator
    end
    object tbCut: TToolButton
      Left = 192
      Top = 0
      Caption = 'Cut'
      ImageIndex = 14
      OnMouseUp = tbCutMouseUp
    end
    object tbCopy: TToolButton
      Left = 215
      Top = 0
      Caption = 'Copy'
      ImageIndex = 15
      OnMouseUp = tbCopyMouseUp
    end
    object tbPaste: TToolButton
      Left = 238
      Top = 0
      Caption = 'Paste'
      ImageIndex = 16
      OnMouseUp = tbPasteMouseUp
    end
    object tbSeparator3: TToolButton
      Left = 261
      Top = 0
      Width = 16
      Caption = 'tbSeparator3'
      ImageIndex = 17
      Style = tbsSeparator
    end
    object tbTimings: TToolButton
      Left = 277
      Top = 0
      Caption = 'Timings'
      ImageIndex = 20
      MenuItem = mnuTimings
      OnMouseDown = tbTimingsTextsSubtitlesMouseDown
    end
    object tbTexts: TToolButton
      Left = 300
      Top = 0
      Caption = 'Texts'
      ImageIndex = 21
      MenuItem = mnuTexts
      OnMouseDown = tbTimingsTextsSubtitlesMouseDown
    end
    object tbSubtitles: TToolButton
      Left = 323
      Top = 0
      Caption = 'Subtitles'
      ImageIndex = 22
      MenuItem = mnuSubtitles
      OnMouseDown = tbTimingsTextsSubtitlesMouseDown
    end
    object tbSeparator4: TToolButton
      Left = 346
      Top = 0
      Width = 16
      Caption = 'tbSeparator4'
      ImageIndex = 19
      Style = tbsSeparator
    end
    object tbTranslatorMode: TToolButton
      Left = 362
      Top = 0
      Caption = 'Translator Mode'
      ImageIndex = 23
      Style = tbsCheck
      OnMouseUp = tbTranslatorModeMouseUp
    end
    object tbSeparator5: TToolButton
      Left = 385
      Top = 0
      Width = 16
      Caption = 'tbSeparator5'
      ImageIndex = 19
      Style = tbsSeparator
    end
    object tbSearch: TToolButton
      Left = 401
      Top = 0
      Caption = 'Search...'
      ImageIndex = 17
      OnMouseUp = tbSearchMouseUp
    end
    object tbSeparator6: TToolButton
      Left = 424
      Top = 0
      Width = 16
      Caption = 'tbSeparator6'
      ImageIndex = 19
      Style = tbsSeparator
    end
    object tbSpellCheck: TToolButton
      Left = 440
      Top = 0
      Caption = 'Spell Check'
      ImageIndex = 39
      OnMouseUp = tbSpellCheckMouseUp
    end
    object tbInfoErrors: TToolButton
      Left = 463
      Top = 0
      Caption = 'Information and Errors...'
      ImageIndex = 28
      Style = tbsCheck
      OnMouseUp = tbInfoErrorsMouseUp
    end
    object tbVariousInfo: TToolButton
      Left = 486
      Top = 0
      Caption = 'Various Information...'
      ImageIndex = 29
      Style = tbsCheck
      OnMouseUp = tbVariousInfoMouseUp
    end
    object tbPascalScripts: TToolButton
      Left = 509
      Top = 0
      Caption = 'Pascal scripts'
      DropdownMenu = mnuPascalScriptsDropdown
      ImageIndex = 19
    end
    object tbSeparator7: TToolButton
      Left = 532
      Top = 0
      Width = 16
      Caption = 'tbSeparator7'
      ImageIndex = 19
      Style = tbsSeparator
    end
    object tbVideoPreviewMode: TToolButton
      Left = 548
      Top = 0
      Caption = 'Video preview mode'
      ImageIndex = 34
      Style = tbsCheck
      OnMouseUp = tbVideoPreviewModeMouseUp
    end
    object tbSeparator8: TToolButton
      Left = 571
      Top = 0
      Width = 16
      Caption = 'tbSeparator8'
      ImageIndex = 19
      Style = tbsSeparator
    end
    object tbInfoErrorsSettings: TToolButton
      Left = 587
      Top = 0
      Caption = 'Settings (Information and Errors)'
      ImageIndex = 30
      OnMouseUp = tbInfoErrorsSettingsMouseUp
    end
    object tbSettings: TToolButton
      Left = 610
      Top = 0
      Caption = 'Settings...'
      ImageIndex = 18
      OnMouseUp = tbSettingsMouseUp
    end
  end
  object pnlEditingControls: TPanel
    Left = 128
    Top = 323
    Width = 697
    Height = 86
    Anchors = [akLeft, akRight, akBottom]
    BevelOuter = bvNone
    FullRepaint = False
    TabOrder = 4
    object spSplitterEditingControls: TSplitter
      Left = 259
      Top = 0
      Width = 7
      Height = 86
      AutoSnap = False
      MinSize = 201
      ResizeStyle = rsUpdate
      OnMoved = spSplitterEditingControlsMoved
    end
    object pnlTimingControls: TPanel
      Left = 0
      Top = 0
      Width = 259
      Height = 86
      Align = alLeft
      BevelOuter = bvNone
      Constraints.MaxWidth = 359
      Constraints.MinWidth = 259
      FullRepaint = False
      TabOrder = 0
      object lblDuration: TLabel
        Left = 133
        Top = 46
        Width = 45
        Height = 13
        Caption = 'Duration:'
      end
      object lblHide: TLabel
        Left = 133
        Top = 6
        Width = 25
        Height = 13
        Caption = 'Hide:'
      end
      object lblShow: TLabel
        Left = 29
        Top = 6
        Width = 30
        Height = 13
        Caption = 'Show:'
      end
      object lblPause: TLabel
        Left = 29
        Top = 46
        Width = 33
        Height = 13
        Caption = 'Pause:'
      end
      object tmeShow: TTimeMaskEdit
        Left = 29
        Top = 22
        Width = 97
        Height = 22
        Alignment = taCenter
        ChangeTimeOnModify = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        FPS = 25.000000000000000000
        MinTime = 0
        ParentFont = False
        TabOrder = 0
        Time = 0
        TimeMode = tmTime
        TimeStep = 100
        FramesStep = 1
        OnEnter = tmeEnter
        OnMouseWheelDown = tmeShowMouseWheelDown
        OnMouseWheelUp = tmeShowMouseWheelUp
        OnTimeChangeFromEditOnly = tmeShowTimeChangeFromEditOnly
        OnMouseEnter = tmeMouseEnter
        OnMouseLeave = tmeMouseLeave
      end
      object tmeHide: TTimeMaskEdit
        Left = 133
        Top = 22
        Width = 97
        Height = 22
        Alignment = taCenter
        ChangeTimeOnModify = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        FPS = 25.000000000000000000
        MinTime = 0
        ParentFont = False
        TabOrder = 1
        Time = 0
        TimeMode = tmTime
        TimeStep = 100
        FramesStep = 1
        OnEnter = tmeEnter
        OnMouseWheelDown = tmeHideMouseWheelDown
        OnMouseWheelUp = tmeHideMouseWheelUp
        OnTimeChangeFromEditOnly = tmeHideTimeChangeFromEditOnly
        OnMouseEnter = tmeMouseEnter
        OnMouseLeave = tmeMouseLeave
      end
      object tmeDuration: TTimeMaskEdit
        Left = 133
        Top = 62
        Width = 97
        Height = 22
        Alignment = taCenter
        ChangeTimeOnModify = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        FPS = 25.000000000000000000
        MinTime = 0
        ParentFont = False
        TabOrder = 3
        Time = 0
        TimeMode = tmTime
        TimeStep = 100
        FramesStep = 1
        OnEnter = tmeEnter
        OnMouseWheelDown = tmeDurationMouseWheelDown
        OnMouseWheelUp = tmeDurationMouseWheelUp
        OnTimeChange = tmeDurationTimeChange
        OnTimeChangeFromEditOnly = tmeDurationTimeChangeFromEditOnly
        OnMouseEnter = tmeMouseEnter
        OnMouseLeave = tmeMouseLeave
      end
      object tmePause: TTimeMaskEdit
        Left = 29
        Top = 62
        Width = 97
        Height = 22
        Alignment = taCenter
        ChangeTimeOnModify = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        FPS = 25.000000000000000000
        MinTime = 0
        ParentFont = False
        TabOrder = 2
        Time = 0
        TimeMode = tmTime
        TimeStep = 100
        FramesStep = 1
        OnEnter = tmeEnter
        OnMouseWheelDown = tmePauseMouseWheelDown
        OnMouseWheelUp = tmePauseMouseWheelUp
        OnTimeChange = tmePauseTimeChange
        OnTimeChangeFromEditOnly = tmePauseTimeChangeFromEditOnly
        OnMouseEnter = tmeMouseEnter
        OnMouseLeave = tmeMouseLeave
      end
      object tbShowSnap: TToolBar
        Left = 0
        Top = 22
        Width = 23
        Height = 22
        Align = alNone
        Caption = 'tbTextStyle'
        Color = clBtnFace
        DisabledImages = imgLstMenuDisabled
        EdgeBorders = []
        EdgeInner = esNone
        EdgeOuter = esNone
        Flat = True
        Images = imgLstMenu
        ParentColor = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        object tbtnShowSnap: TToolButton
          Left = 0
          Top = 0
          Caption = 'Move to Previous/Extend to Previous'
          ImageIndex = 42
          OnMouseDown = tbtnTimeControlButtonMouseDown
          OnMouseMove = tbtnShowSnapMouseMove
          OnMouseUp = tbtnShowSnapMouseUp
        end
      end
      object tbHideSnap: TToolBar
        Left = 236
        Top = 22
        Width = 23
        Height = 22
        Align = alNone
        Caption = 'tbTextStyle'
        Color = clBtnFace
        DisabledImages = imgLstMenuDisabled
        EdgeBorders = []
        EdgeInner = esNone
        EdgeOuter = esNone
        Flat = True
        Images = imgLstMenu
        ParentColor = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        object tbtnHideSnap: TToolButton
          Left = 0
          Top = 0
          Caption = 'Move to Next/Extend to Next'
          ImageIndex = 43
          OnMouseDown = tbtnTimeControlButtonMouseDown
          OnMouseMove = tbtnShowSnapMouseMove
          OnMouseUp = tbtnHideSnapMouseUp
        end
      end
      object tbPauseSet: TToolBar
        Left = 0
        Top = 62
        Width = 23
        Height = 22
        Align = alNone
        Caption = 'tbTextStyle'
        Color = clBtnFace
        DisabledImages = imgLstMenuDisabled
        EdgeBorders = []
        EdgeInner = esNone
        EdgeOuter = esNone
        Flat = True
        Images = imgLstMenu
        ParentColor = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        object tbtnPauseSet: TToolButton
          Left = 0
          Top = 0
          Caption = 'Set Default Pause/Set Default Pause, if Pause is too short'
          ImageIndex = 40
          OnMouseDown = tbtnTimeControlButtonMouseDown
          OnMouseMove = tbtnShowSnapMouseMove
          OnMouseUp = tbtnPauseSetMouseUp
        end
      end
      object tbDurationSet: TToolBar
        Left = 236
        Top = 62
        Width = 23
        Height = 22
        Align = alNone
        Caption = 'tbTextStyle'
        Color = clBtnFace
        DisabledImages = imgLstMenuDisabled
        EdgeBorders = []
        EdgeInner = esNone
        EdgeOuter = esNone
        Flat = True
        Images = imgLstMenu
        ParentColor = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 7
        object tbtnDurationSet: TToolButton
          Left = 0
          Top = 0
          Caption = 'Set Auto Duration/Set Min Duration'
          ImageIndex = 41
          OnMouseDown = tbtnTimeControlButtonMouseDown
          OnMouseMove = tbtnShowSnapMouseMove
          OnMouseUp = tbtnDurationSetMouseUp
        end
      end
    end
    object pnlTextControls: TPanel
      Left = 266
      Top = 0
      Width = 431
      Height = 86
      Align = alClient
      BevelOuter = bvNone
      FullRepaint = False
      TabOrder = 1
      DesignSize = (
        431
        86)
      object lblLines2: TLabel
        Left = 393
        Top = 6
        Width = 28
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'Lines:'
      end
      object lblTranslationLines: TLabel
        Left = 422
        Top = 6
        Width = 6
        Height = 13
        Anchors = [akTop, akRight]
        Caption = '1'
      end
      object lblTextLines: TLabel
        Left = 193
        Top = 6
        Width = 6
        Height = 13
        Anchors = [akTop, akRight]
        Caption = '1'
      end
      object lblLines1: TLabel
        Left = 164
        Top = 6
        Width = 28
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'Lines:'
      end
      object lblTranslation: TLabel
        Left = 334
        Top = 6
        Width = 57
        Height = 13
        Caption = 'Translation:'
      end
      object lblText: TLabel
        Left = 126
        Top = 6
        Width = 26
        Height = 13
        Caption = 'Text:'
      end
      object mmoTranslationOld: TMemo
        Left = 208
        Top = 22
        Width = 222
        Height = 62
        Alignment = taCenter
        Anchors = [akLeft, akTop, akRight]
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        PopupMenu = mnuTextTransPopup
        TabOrder = 3
        Visible = False
        OnChange = mmoTransChange
        OnDblClick = mmoDblClick
        OnEnter = mmoTransEnter
        OnKeyPress = mmoTextTransKeyPress
        OnKeyUp = mmoTransKeyUp
        OnMouseUp = mmoTransMouseUp
      end
      object mmoSubtitleTextOld: TMemo
        Left = 0
        Top = 22
        Width = 201
        Height = 62
        Alignment = taCenter
        Anchors = [akLeft, akTop, akRight]
        BiDiMode = bdLeftToRight
        Ctl3D = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentCtl3D = False
        ParentFont = False
        PopupMenu = mnuTextTransPopup
        TabOrder = 1
        Visible = False
        OnChange = mmoSubTextChange
        OnDblClick = mmoDblClick
        OnEnter = mmoSubTextEnter
        OnKeyPress = mmoTextTransKeyPress
        OnKeyUp = mmoSubTextKeyUp
        OnMouseUp = mmoSubTextMouseUp
      end
      object mmoTranslation: TRichEdit
        Left = 208
        Top = 22
        Width = 222
        Height = 62
        Alignment = taCenter
        Anchors = [akLeft, akTop, akRight]
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        PlainText = True
        PopupMenu = mnuTextTransPopup
        TabOrder = 2
        OnChange = mmoTransChange
        OnEnter = mmoTransEnter
        OnExit = mmoTranslationExit
        OnKeyPress = mmoTextTransKeyPress
        OnKeyUp = mmoTransKeyUp
        OnMouseDown = reMouseDown
        OnMouseMove = reMouseMove
        OnMouseUp = mmoTransMouseUp
      end
      object mmoSubtitleText: TRichEdit
        Left = 0
        Top = 22
        Width = 201
        Height = 62
        Alignment = taCenter
        Anchors = [akLeft, akTop, akRight]
        BiDiMode = bdLeftToRight
        Ctl3D = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentCtl3D = False
        ParentFont = False
        PlainText = True
        PopupMenu = mnuTextTransPopup
        TabOrder = 0
        OnChange = mmoSubTextChange
        OnEnter = mmoSubTextEnter
        OnExit = mmoSubtitleTextExit
        OnKeyPress = mmoTextTransKeyPress
        OnKeyUp = mmoSubTextKeyUp
        OnMouseDown = reMouseDown
        OnMouseMove = reMouseMove
        OnMouseUp = mmoSubTextMouseUp
      end
      object tbTextStyle: TToolBar
        Left = 0
        Top = 0
        Width = 126
        Height = 22
        Align = alNone
        Caption = 'tbTextStyle'
        Color = clBtnFace
        DisabledImages = imgLstMenuDisabled
        EdgeBorders = []
        EdgeInner = esNone
        EdgeOuter = esNone
        Flat = True
        Images = imgLstMenu
        ParentColor = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        Visible = False
        object tbBold: TToolButton
          Left = 0
          Top = 0
          Caption = 'Bold'
          ImageIndex = 31
          Style = tbsCheck
          OnMouseUp = tbBoldItalicUnderlineMouseUp
        end
        object tbItalic: TToolButton
          Left = 23
          Top = 0
          Caption = 'Italic'
          ImageIndex = 32
          Style = tbsCheck
          OnMouseUp = tbBoldItalicUnderlineMouseUp
        end
        object tbUnderline: TToolButton
          Left = 46
          Top = 0
          Caption = 'Underline'
          ImageIndex = 33
          Style = tbsCheck
          OnMouseUp = tbBoldItalicUnderlineMouseUp
        end
        object tbSetColor: TToolButton
          Left = 69
          Top = 0
          Caption = 'Set Color'
          ImageIndex = 37
          OnMouseUp = tbSetColorMouseUp
        end
        object tbRemoveAllTags: TToolButton
          Left = 92
          Top = 0
          Caption = 'Remove All Tags'
          ImageIndex = 35
          OnMouseUp = tbRemoveAllTagsMouseUp
        end
      end
      object tbTransStyle: TToolBar
        Left = 208
        Top = 0
        Width = 126
        Height = 22
        Align = alNone
        Caption = 'tbTextStyle'
        Color = clBtnFace
        DisabledImages = imgLstMenuDisabled
        EdgeBorders = []
        EdgeInner = esNone
        EdgeOuter = esNone
        Flat = True
        Images = imgLstMenu
        ParentColor = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        Visible = False
        object tbBoldTrans: TToolButton
          Left = 0
          Top = 0
          Caption = 'Bold'
          ImageIndex = 31
          Style = tbsCheck
          OnMouseUp = tbBoldItalicUnderlineTransMouseUp
        end
        object tbItalicTrans: TToolButton
          Left = 23
          Top = 0
          Caption = 'Italic'
          ImageIndex = 32
          Style = tbsCheck
          OnMouseUp = tbBoldItalicUnderlineTransMouseUp
        end
        object tbUnderlineTrans: TToolButton
          Left = 46
          Top = 0
          Caption = 'Underline'
          ImageIndex = 33
          Style = tbsCheck
          OnMouseUp = tbBoldItalicUnderlineTransMouseUp
        end
        object tbSetColorTrans: TToolButton
          Left = 69
          Top = 0
          Caption = 'Set Color'
          ImageIndex = 37
          OnMouseUp = tbSetColorTransMouseUp
        end
        object tbRemoveAllTagsTrans: TToolButton
          Left = 92
          Top = 0
          Caption = 'Remove All Tags'
          ImageIndex = 35
          OnMouseUp = tbRemoveAllTagsTransMouseUp
        end
      end
    end
  end
  object pnlControl: TPanel
    Left = 8
    Top = 32
    Width = 113
    Height = 375
    Anchors = [akLeft, akTop, akBottom]
    BevelInner = bvLowered
    BevelOuter = bvNone
    FullRepaint = False
    TabOrder = 0
    DesignSize = (
      113
      375)
    object lblMode: TLabel
      Left = 8
      Top = 8
      Width = 30
      Height = 13
      Caption = 'Mode:'
      Color = clBtnFace
      ParentColor = False
    end
    object lblFPS: TLabel
      Left = 8
      Top = 112
      Width = 22
      Height = 13
      Caption = 'FPS:'
      Color = clBtnFace
      ParentColor = False
    end
    object lblInputFPS: TLabel
      Left = 8
      Top = 64
      Width = 51
      Height = 13
      Caption = 'Input FPS:'
      Color = clBtnFace
      ParentColor = False
    end
    object lblWorkWith: TLabel
      Left = 8
      Top = 160
      Width = 52
      Height = 13
      Caption = 'Work with:'
    end
    object lblNotes: TLabel
      Left = 8
      Top = 336
      Width = 32
      Height = 13
      Caption = 'Notes:'
      Color = clBtnFace
      ParentColor = False
    end
    object pnlModeRadios: TPanel
      Left = 5
      Top = 24
      Width = 100
      Height = 33
      BevelOuter = bvNone
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 0
      object rdoModeTime: TRadioButton
        Left = 3
        Top = 0
        Width = 97
        Height = 17
        Caption = 'Time'
        TabOrder = 1
        OnClick = rdoModeClick
      end
      object rdoModeFrames: TRadioButton
        Left = 3
        Top = 16
        Width = 97
        Height = 17
        Caption = 'Frames'
        TabOrder = 0
        OnClick = rdoModeClick
      end
    end
    object cmbFPS: TComboBox
      Left = 8
      Top = 128
      Width = 97
      Height = 21
      AutoComplete = False
      Ctl3D = True
      DropDownCount = 12
      ItemHeight = 13
      ParentCtl3D = False
      Sorted = True
      TabOrder = 2
      OnKeyPress = cmbFPSKeyPress
      OnSelect = cmbFPSSelect
    end
    object cmbInputFPS: TComboBox
      Left = 8
      Top = 80
      Width = 97
      Height = 21
      AutoComplete = False
      Ctl3D = False
      DropDownCount = 12
      ItemHeight = 13
      ParentCtl3D = False
      Sorted = True
      TabOrder = 1
      OnKeyPress = cmbInputFPSKeyPress
      OnSelect = cmbInputFPSSelect
    end
    object rdoDuration: TRadioButton
      Left = 8
      Top = 176
      Width = 97
      Height = 17
      Caption = 'Duration'
      TabOrder = 3
      OnClick = rdoDurationClick
    end
    object rdoFinalTime: TRadioButton
      Left = 8
      Top = 192
      Width = 97
      Height = 17
      Caption = 'Hide time'
      TabOrder = 4
      OnClick = rdoFinalTimeClick
    end
    object rdoBoth: TRadioButton
      Left = 8
      Top = 208
      Width = 97
      Height = 17
      Caption = 'Both'
      Checked = True
      TabOrder = 5
      TabStop = True
      OnClick = rdoBothClick
    end
    object cmbOrgCharset: TComboBox
      Left = 8
      Top = 240
      Width = 97
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 6
      OnSelect = cmbOrgCharsetSelect
    end
    object cmbTransCharset: TComboBox
      Left = 8
      Top = 264
      Width = 97
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 7
      OnSelect = cmbTransCharsetSelect
    end
    object cmbOCRScripts: TComboBox
      Left = 8
      Top = 305
      Width = 97
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 9
      OnSelect = cmbOCRScriptsSelect
    end
    object mmoNotes: TMemo
      Left = 0
      Top = 352
      Width = 113
      Height = 23
      Anchors = [akLeft, akTop, akRight, akBottom]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 10
      OnEnter = mmoNotesEnter
    end
    object chkOCRScripts: TCheckBox
      Left = 8
      Top = 288
      Width = 97
      Height = 17
      Caption = 'OCR Scripts'
      Checked = True
      State = cbChecked
      TabOrder = 8
      OnClick = chkOCRScriptsClick
    end
  end
  object pnlParent2: TPanel
    Left = 128
    Top = 32
    Width = 697
    Height = 290
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvNone
    FullRepaint = False
    TabOrder = 1
    object pnlParent1: TPanel
      Left = 0
      Top = 0
      Width = 697
      Height = 290
      Align = alClient
      BevelOuter = bvNone
      FullRepaint = False
      TabOrder = 0
      DesignSize = (
        697
        290)
      object spSplitter: TSplitter
        Left = 0
        Top = 101
        Width = 697
        Height = 4
        Cursor = crVSplit
        Align = alTop
        AutoSnap = False
        MinSize = 70
        ResizeStyle = rsUpdate
        OnMoved = spSplitterMoved
      end
      object pnlVideo: TPanel
        Left = 0
        Top = 0
        Width = 697
        Height = 101
        Align = alTop
        BevelOuter = bvNone
        Color = clBlack
        FullRepaint = False
        TabOrder = 0
        DesignSize = (
          697
          101)
        object edtPlayerShortcuts: TEdit
          Left = 40
          Top = 16
          Width = 41
          Height = 19
          TabStop = False
          Ctl3D = False
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 3
          OnKeyDown = PlayerShortcutsKeyDown
          OnKeyUp = PlayerShortcutsKeyUp
        end
        object pnlVideoDisplay: TPanel
          Left = 0
          Top = 0
          Width = 697
          Height = 51
          Cursor = crArrow
          Align = alClient
          BevelOuter = bvNone
          Color = clBlack
          TabOrder = 1
          OnClick = pnlVideoDisplayClick
          OnDblClick = pnlVideoDisplayDblClick
          OnMouseDown = pnlVideoDisplayMouseDown
          OnMouseMove = pnlVideoDisplayMouseMove
          OnMouseUp = pnlVideoDisplayMouseUp
        end
        object subSubtitle: TMiSubtitulo
          Left = 274
          Top = 24
          Width = 116
          Height = 28
          Cursor = crHandPoint
          Text = 'subSubtitle'
          Shadow = True
          Border = True
          UsarTags = True
          TextColor = clWhite
          BackgroundColor = clBlack
          BorderWidth = 1
          ShadowWidth = 1
          ForceTransparency = False
          Alignment = taCenter
          BorderColor = clBlack
          ShadowColor = clBlack
          Antialiased = False
          RenderRichText = True
          TransparentColor = 65793
          SubtitleNum = 0
          Anchors = []
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          Visible = False
          OnMouseDown = subSubtitleMouseDown
          OnMouseMove = subSubtitleMouseMove
          OnMouseUp = subSubtitleMouseUp
          OnDblClick = pnlVideoDisplayDblClick
        end
        object pnlVideoControls: TPanel
          Left = 0
          Top = 51
          Width = 697
          Height = 50
          Align = alBottom
          FullRepaint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          DesignSize = (
            697
            50)
          object tcTimeCounter: TSWTimeCounter
            Left = 570
            Top = 19
            Width = 125
            Height = 28
            Cursor = crHandPoint
            Text1 = '00:00:00,000'
            Text2 = '00:00:00,000'
            Text3 = 'X'
            Text4 = 'FPS'
            BackColor = clBtnFace
            LineColor = clWindowText
            TextColor = clWindowText
            Text1Color = clWindowText
            Text2Color = clWindowText
            Text3Color = clWindowText
            Text4Color = clWindowText
            FontCharset = ANSI_CHARSET
            Anchors = [akTop, akRight]
            Visible = False
            OnMouseDown = tcTimeCounterMouseDown
            OnMouseUp = tcTimeCounterMouseUp
            OnMouseWheelDown = tcTimeCounterMouseWheelDown
            OnMouseWheelUp = tcTimeCounterMouseWheelUp
          end
          object btnMute100: TSWButton
            Left = 430
            Top = 21
            Width = 30
            Height = 25
            Normal.Data = {
              C2070000424DC20700000000000036000000280000001C000000170000000100
              1800000000008C070000120B0000120B00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FF8E866C4E3E1E4E3E1E8E866CFF00FFFF00FF8E866C4E3E1E4E
              3E1E8E866CFF00FFFF00FF8E866C4E3E1E4E3E1E8E866CFF00FFFF00FF8E866C
              4E3E1E4E3E1E8E866CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4E3E1EC471
              22C471224E3E1EFF00FFFF00FF4E3E1EC47122C471224E3E1EFF00FFFF00FF4E
              3E1EC47122C471224E3E1EFF00FFFF00FF4E3E1EC47122C471224E3E1EFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF4E3E1EC47122C471224E3E1EFF00FFFF00
              FF4E3E1EC47122C471224E3E1EFF00FFFF00FF4E3E1EC47122C471224E3E1EFF
              00FFFF00FF4E3E1EC47122C471224E3E1EFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FF8E866C4E3E1E4E3E1E8E866CFF00FFFF00FF4E3E1EC47122C471224E3E
              1EFF00FFFF00FF4E3E1EC47122C471224E3E1EFF00FFFF00FF4E3E1EC47122C4
              71224E3E1EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FF4E3E1EC47122C471224E3E1EFF00FFFF00FF4E3E1EC471
              22C471224E3E1EFF00FFFF00FF4E3E1EC47122C471224E3E1EFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4E3E1E
              C47122C471224E3E1EFF00FFFF00FF4E3E1EC47122C471224E3E1EFF00FFFF00
              FF4E3E1EC47122C471224E3E1EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FF8E866C4E3E1E4E3E1E8E866CFF00FF
              FF00FF4E3E1EC47122C471224E3E1EFF00FFFF00FF4E3E1EC47122C471224E3E
              1EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4E3E1EC47122C47122
              4E3E1EFF00FFFF00FF4E3E1EC47122C471224E3E1EFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FF4E3E1EC47122C471224E3E1EFF00FFFF00FF4E3E1E
              C47122C471224E3E1EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8E
              866C4E3E1E4E3E1E8E866CFF00FFFF00FF4E3E1EC47122C471224E3E1EFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FF4E3E1EC47122C471224E3E1EFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4E3E1EC47122C4
              71224E3E1EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FF8E866C4E3E1E4E3E1E8E866CFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FF}
            MouseOver.Data = {
              C2070000424DC20700000000000036000000280000001C000000170000000100
              1800000000008C070000120B0000120B00000000000000000000FF00FFFF00FF
              7981817981817882827781817980837980837782807782807980837980837781
              8177818179808379808379808377818177818179808379808377818177818178
              7F82798083748082FF00FFFF00FFFF00FF7E8081F7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB808080FF
              00FF7B8081F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB758181808080F7E7EBF7E7EBF7
              E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EBF7E7EBF7E7EB7B8081808080F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7
              E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB7B80817F7F
              7FF7E7EBF7E7EB8E866C4E3E1E4E3E1E8E866CF7E7EBF7E7EB8E866C4E3E1E4E
              3E1E8E866CF7E7EBF7E7EB8E866C4E3E1E4E3E1E8E866CF7E7EBF7E7EB8E866C
              4E3E1E4E3E1E8E866CF7E7EBF7E7EB7B80817C8180F7E7EBF7E7EB4E3E1EC471
              22C471224E3E1EF7E7EBF7E7EB4E3E1EC47122C471224E3E1EF7E7EBF7E7EB4E
              3E1EC47122C471224E3E1EF7E7EBF7E7EB4E3E1EC47122C471224E3E1EF7E7EB
              F7E7EB7B7F847C8180F7E7EBF7E7EB4E3E1EC47122C471224E3E1EF7E7EBF7E7
              EB4E3E1EC47122C471224E3E1EF7E7EBF7E7EB4E3E1EC47122C471224E3E1EF7
              E7EBF7E7EB4E3E1EC47122C471224E3E1EF7E7EBF7E7EB7B7F847B8180F7E7EB
              F7E7EB8E866C4E3E1E4E3E1E8E866CF7E7EBF7E7EB4E3E1EC47122C471224E3E
              1EF7E7EBF7E7EB4E3E1EC47122C471224E3E1EF7E7EBF7E7EB4E3E1EC47122C4
              71224E3E1EF7E7EBF7E7EB7B80817B8180F7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EB4E3E1EC47122C471224E3E1EF7E7EBF7E7EB4E3E1EC471
              22C471224E3E1EF7E7EBF7E7EB4E3E1EC47122C471224E3E1EF7E7EBF7E7EB7B
              80817D8281F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB4E3E1E
              C47122C471224E3E1EF7E7EBF7E7EB4E3E1EC47122C471224E3E1EF7E7EBF7E7
              EB4E3E1EC47122C471224E3E1EF7E7EBF7E7EB7B80817C8180F7E7EBF7E7EBF7
              E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB8E866C4E3E1E4E3E1E8E866CF7E7EB
              F7E7EB4E3E1EC47122C471224E3E1EF7E7EBF7E7EB4E3E1EC47122C471224E3E
              1EF7E7EBF7E7EB7B80817C8081F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7
              E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB4E3E1EC47122C47122
              4E3E1EF7E7EBF7E7EB4E3E1EC47122C471224E3E1EF7E7EBF7E7EB7B80817B7F
              80F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7
              E7EBF7E7EBF7E7EBF7E7EB4E3E1EC47122C471224E3E1EF7E7EBF7E7EB4E3E1E
              C47122C471224E3E1EF7E7EBF7E7EB7B80817C8180F7E7EBF7E7EBF7E7EBF7E7
              EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB8E
              866C4E3E1E4E3E1E8E866CF7E7EBF7E7EB4E3E1EC47122C471224E3E1EF7E7EB
              F7E7EB7B80817C8180F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7
              E7EBF7E7EB4E3E1EC47122C471224E3E1EF7E7EBF7E7EB7B80817C8180F7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB4E3E1EC47122C4
              71224E3E1EF7E7EBF7E7EB7B80817D8281F7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EBF7E7EBF7E7EBF7E7EBF7E7EB8E866C4E3E1E4E3E1E8E866CF7E7EBF7E7EB7B
              80817C8180F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB7B80817C8180F7E7EBF7E7EBF7
              E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EBF7E7EBF7E7EB7B80817B8180F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7
              E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB758181FF00
              FF7E8080F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7
              E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EB808080FF00FFFF00FFFF00FF7980837980837781
              8177818179808379808377818177818179808379808377808377808379808379
              8083798083778083778083798083798083778181778181798083798083748082
              FF00FFFF00FF}
            Pressed.Data = {
              C2070000424DC20700000000000036000000280000001C000000170000000100
              1800000000008C070000120B0000120B00000000000000000000FF00FFFF00FF
              7981817981817882827781817980837980837782807782807980837980837980
              8377828077828079808379808377818177818179808379808377818177818178
              7F82798083748082FF00FFFF00FFFF00FF7E8081DACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF808080FF
              00FF7B8081DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF758181808080DACBCFDACBCFDA
              CBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCF7B80817F7F7FDACBCFDACBCFDACBCF8E866C4E3E1E4E3E1E8E
              866CDACBCFDACBCF8E866C4E3E1E4E3E1E8E866CDACBCFDACBCF8E866C4E3E1E
              4E3E1E8E866CDACBCFDACBCF8E866C4E3E1E4E3E1E8E866CDACBCF7B80817C81
              80DACBCFDACBCFDACBCF4E3E1EC47122C471224E3E1EDACBCFDACBCF4E3E1EC4
              7122C471224E3E1EDACBCFDACBCF4E3E1EC47122C471224E3E1EDACBCFDACBCF
              4E3E1EC47122C471224E3E1EDACBCF7B7F847C8180DACBCFDACBCFDACBCF4E3E
              1EC47122C471224E3E1EDACBCFDACBCF4E3E1EC47122C471224E3E1EDACBCFDA
              CBCF4E3E1EC47122C471224E3E1EDACBCFDACBCF4E3E1EC47122C471224E3E1E
              DACBCF7B7F847B8180DACBCFDACBCFDACBCF8E866C4E3E1E4E3E1E8E866CDACB
              CFDACBCF4E3E1EC47122C471224E3E1EDACBCFDACBCF4E3E1EC47122C471224E
              3E1EDACBCFDACBCF4E3E1EC47122C471224E3E1EDACBCF7B80817B8180DACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF4E3E1EC47122C471
              224E3E1EDACBCFDACBCF4E3E1EC47122C471224E3E1EDACBCFDACBCF4E3E1EC4
              7122C471224E3E1EDACBCF7B80817D8281DACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCF4E3E1EC47122C471224E3E1EDACBCFDACBCF4E3E
              1EC47122C471224E3E1EDACBCFDACBCF4E3E1EC47122C471224E3E1EDACBCF7B
              80817D8281DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF
              8E866C4E3E1E4E3E1E8E866CDACBCFDACBCF4E3E1EC47122C471224E3E1EDACB
              CFDACBCF4E3E1EC47122C471224E3E1EDACBCF7B80817C8180DACBCFDACBCFDA
              CBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCF4E3E1EC47122C471224E3E1EDACBCFDACBCF4E3E1EC47122C471
              224E3E1EDACBCF7B80817C8081DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDA
              CBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF4E3E1EC47122
              C471224E3E1EDACBCFDACBCF4E3E1EC47122C471224E3E1EDACBCF7B80817B7F
              80DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDA
              CBCFDACBCFDACBCFDACBCFDACBCF8E866C4E3E1E4E3E1E8E866CDACBCFDACBCF
              4E3E1EC47122C471224E3E1EDACBCF7B80817C8180DACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDA
              CBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF4E3E1EC47122C471224E3E1E
              DACBCF7B80817C8180DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDA
              CBCFDACBCFDACBCF4E3E1EC47122C471224E3E1EDACBCF7B80817C8180DACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF8E866C4E
              3E1E4E3E1E8E866CDACBCF7B80817D8281DACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF7B
              80817C8180DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF7B80817C8180DACBCFDACBCFDA
              CBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCF7B80817B8180DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDA
              CBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF758181FF00
              FF7E8080DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDA
              CBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCF808080FF00FFFF00FFFF00FF7980837980837781
              8177818179808379808377818177818179808379808379808377818177818179
              8083798083778083778083798083798083778181778181798083798083748082
              FF00FFFF00FF}
            Disabled.Data = {
              C2070000424DC20700000000000036000000280000001C000000170000000100
              1800000000008C07000000000000000000000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FF7D7D7D3636363636367D7D7DFF00FFFF00FF7D7D7D36363636
              36367D7D7DFF00FFFF00FF7D7D7D3636363636367D7D7DFF00FFFF00FF7D7D7D
              3636363636367D7D7DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF363636BBBB
              BBBBBBBB363636FF00FFFF00FF363636BBBBBBBBBBBB363636FF00FFFF00FF36
              3636BBBBBBBBBBBB363636FF00FFFF00FF363636BBBBBBBBBBBB363636FF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF363636BBBBBBBBBBBB363636FF00FFFF00
              FF363636BBBBBBBBBBBB363636FF00FFFF00FF363636BBBBBBBBBBBB363636FF
              00FFFF00FF363636BBBBBBBBBBBB363636FF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FF7D7D7D3636363636367D7D7DFF00FFFF00FF363636BBBBBBBBBBBB3636
              36FF00FFFF00FF363636BBBBBBBBBBBB363636FF00FFFF00FF363636BBBBBBBB
              BBBB363636FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FF363636BBBBBBBBBBBB363636FF00FFFF00FF363636BBBB
              BBBBBBBB363636FF00FFFF00FF363636BBBBBBBBBBBB363636FF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF363636
              BBBBBBBBBBBB363636FF00FFFF00FF363636BBBBBBBBBBBB363636FF00FFFF00
              FF363636BBBBBBBBBBBB363636FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FF7D7D7D3636363636367D7D7DFF00FF
              FF00FF363636BBBBBBBBBBBB363636FF00FFFF00FF363636BBBBBBBBBBBB3636
              36FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF363636BBBBBBBBBBBB
              363636FF00FFFF00FF363636BBBBBBBBBBBB363636FF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FF363636BBBBBBBBBBBB363636FF00FFFF00FF363636
              BBBBBBBBBBBB363636FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7D
              7D7D3636363636367D7D7DFF00FFFF00FF363636BBBBBBBBBBBB363636FF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FF363636BBBBBBBBBBBB363636FF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF363636BBBBBBBB
              BBBB363636FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FF7D7D7D3636363636367D7D7DFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FF}
            State = sNormal
            Enabled = False
            CanBeDown = False
            Down = False
            Anchors = [akTop, akRight]
            Visible = False
            ShowHint = True
          end
          object btnMute075: TSWButton
            Left = 430
            Top = 21
            Width = 30
            Height = 25
            Normal.Data = {
              C2070000424DC20700000000000036000000280000001C000000170000000100
              1800000000008C070000120B0000120B00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FF8E866C4E3E1E4E3E1E8E866CFF00FFFF00FF8E866C4E3E1E4E
              3E1E8E866CFF00FFFF00FF8E866C4E3E1E4E3E1E8E866CFF00FFFF00FF8E866C
              4E3E1E4E3E1E8E866CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4E3E1EC471
              22C471224E3E1EFF00FFFF00FF4E3E1EC47122C471224E3E1EFF00FFFF00FF4E
              3E1EC47122C471224E3E1EFF00FFFF00FF4E3E1EF7E7EFF7E7EF4E3E1EFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF4E3E1EC47122C471224E3E1EFF00FFFF00
              FF4E3E1EC47122C471224E3E1EFF00FFFF00FF4E3E1EC47122C471224E3E1EFF
              00FFFF00FF4E3E1EF7E7EFF7E7EF4E3E1EFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FF8E866C4E3E1E4E3E1E8E866CFF00FFFF00FF4E3E1EC47122C471224E3E
              1EFF00FFFF00FF4E3E1EC47122C471224E3E1EFF00FFFF00FF4E3E1EF7E7EFF7
              E7EF4E3E1EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FF4E3E1EC47122C471224E3E1EFF00FFFF00FF4E3E1EC471
              22C471224E3E1EFF00FFFF00FF4E3E1EF7E7EFF7E7EF4E3E1EFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4E3E1E
              C47122C471224E3E1EFF00FFFF00FF4E3E1EC47122C471224E3E1EFF00FFFF00
              FF4E3E1EF7E7EFF7E7EF4E3E1EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FF8E866C4E3E1E4E3E1E8E866CFF00FF
              FF00FF4E3E1EC47122C471224E3E1EFF00FFFF00FF4E3E1EF7E7EFF7E7EF4E3E
              1EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4E3E1EC47122C47122
              4E3E1EFF00FFFF00FF4E3E1EF7E7EFF7E7EF4E3E1EFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FF4E3E1EC47122C471224E3E1EFF00FFFF00FF4E3E1E
              F7E7EFF7E7EF4E3E1EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8E
              866C4E3E1E4E3E1E8E866CFF00FFFF00FF4E3E1EF7E7EFF7E7EF4E3E1EFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FF4E3E1EF7E7EFF7E7EF4E3E1EFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4E3E1EF7E7EFF7
              E7EF4E3E1EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FF8E866C4E3E1E4E3E1E8E866CFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FF}
            MouseOver.Data = {
              C2070000424DC20700000000000036000000280000001C000000170000000100
              1800000000008C070000120B0000120B00000000000000000000FF00FFFF00FF
              7981817981817882827781817980837980837782807782807980837980837781
              8177818179808379808379808377818177818179808379808377818177818178
              7F82798083748082FF00FFFF00FFFF00FF7E8081F7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB808080FF
              00FF7B8081F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB758181808080F7E7EBF7E7EBF7
              E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EBF7E7EBF7E7EB7B8081808080F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7
              E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB7B80817F7F
              7FF7E7EBF7E7EB8E866C4E3E1E4E3E1E8E866CF7E7EBF7E7EB8E866C4E3E1E4E
              3E1E8E866CF7E7EBF7E7EB8E866C4E3E1E4E3E1E8E866CF7E7EBF7E7EB8E866C
              4E3E1E4E3E1E8E866CF7E7EBF7E7EB7B80817C8180F7E7EBF7E7EB4E3E1EC471
              22C471224E3E1EF7E7EBF7E7EB4E3E1EC47122C471224E3E1EF7E7EBF7E7EB4E
              3E1EC47122C471224E3E1EF7E7EBF7E7EB4E3E1EF7E7EBF7E7EB4E3E1EF7E7EB
              F7E7EB7B7F847C8180F7E7EBF7E7EB4E3E1EC47122C471224E3E1EF7E7EBF7E7
              EB4E3E1EC47122C471224E3E1EF7E7EBF7E7EB4E3E1EC47122C471224E3E1EF7
              E7EBF7E7EB4E3E1EF7E7EBF7E7EB4E3E1EF7E7EBF7E7EB7B7F847B8180F7E7EB
              F7E7EB8E866C4E3E1E4E3E1E8E866CF7E7EBF7E7EB4E3E1EC47122C471224E3E
              1EF7E7EBF7E7EB4E3E1EC47122C471224E3E1EF7E7EBF7E7EB4E3E1EF7E7EBF7
              E7EB4E3E1EF7E7EBF7E7EB7B80817B8180F7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EB4E3E1EC47122C471224E3E1EF7E7EBF7E7EB4E3E1EC471
              22C471224E3E1EF7E7EBF7E7EB4E3E1EF7E7EBF7E7EB4E3E1EF7E7EBF7E7EB7B
              80817D8281F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB4E3E1E
              C47122C471224E3E1EF7E7EBF7E7EB4E3E1EC47122C471224E3E1EF7E7EBF7E7
              EB4E3E1EF7E7EBF7E7EB4E3E1EF7E7EBF7E7EB7B80817C8180F7E7EBF7E7EBF7
              E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB8E866C4E3E1E4E3E1E8E866CF7E7EB
              F7E7EB4E3E1EC47122C471224E3E1EF7E7EBF7E7EB4E3E1EF7E7EBF7E7EB4E3E
              1EF7E7EBF7E7EB7B80817C8081F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7
              E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB4E3E1EC47122C47122
              4E3E1EF7E7EBF7E7EB4E3E1EF7E7EBF7E7EB4E3E1EF7E7EBF7E7EB7B80817B7F
              80F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7
              E7EBF7E7EBF7E7EBF7E7EB4E3E1EC47122C471224E3E1EF7E7EBF7E7EB4E3E1E
              F7E7EBF7E7EB4E3E1EF7E7EBF7E7EB7B80817C8180F7E7EBF7E7EBF7E7EBF7E7
              EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB8E
              866C4E3E1E4E3E1E8E866CF7E7EBF7E7EB4E3E1EF7E7EBF7E7EB4E3E1EF7E7EB
              F7E7EB7B80817C8180F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7
              E7EBF7E7EB4E3E1EF7E7EBF7E7EB4E3E1EF7E7EBF7E7EB7B80817C8180F7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB4E3E1EF7E7EBF7
              E7EB4E3E1EF7E7EBF7E7EB7B80817D8281F7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EBF7E7EBF7E7EBF7E7EBF7E7EB8E866C4E3E1E4E3E1E8E866CF7E7EBF7E7EB7B
              80817C8180F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB7B80817C8180F7E7EBF7E7EBF7
              E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EBF7E7EBF7E7EB7B80817B8180F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7
              E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB758181FF00
              FF7E8080F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7
              E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EB808080FF00FFFF00FFFF00FF7980837980837781
              8177818179808379808377818177818179808379808377808377808379808379
              8083798083778083778083798083798083778181778181798083798083748082
              FF00FFFF00FF}
            Pressed.Data = {
              C2070000424DC20700000000000036000000280000001C000000170000000100
              1800000000008C070000120B0000120B00000000000000000000FF00FFFF00FF
              7981817981817882827781817980837980837782807782807980837980837980
              8377828077828079808379808377818177818179808379808377818177818178
              7F82798083748082FF00FFFF00FFFF00FF7E8081DACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF808080FF
              00FF7B8081DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF758181808080DACBCFDACBCFDA
              CBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCF7B80817F7F7FDACBCFDACBCFDACBCF8E866C4E3E1E4E3E1E8E
              866CDACBCFDACBCF8E866C4E3E1E4E3E1E8E866CDACBCFDACBCF8E866C4E3E1E
              4E3E1E8E866CDACBCFDACBCF8E866C4E3E1E4E3E1E8E866CDACBCF7B80817C81
              80DACBCFDACBCFDACBCF4E3E1EC47122C471224E3E1EDACBCFDACBCF4E3E1EC4
              7122C471224E3E1EDACBCFDACBCF4E3E1EC47122C471224E3E1EDACBCFDACBCF
              4E3E1EF7E7EBF7E7EB4E3E1EDACBCF7B7F847C8180DACBCFDACBCFDACBCF4E3E
              1EC47122C471224E3E1EDACBCFDACBCF4E3E1EC47122C471224E3E1EDACBCFDA
              CBCF4E3E1EC47122C471224E3E1EDACBCFDACBCF4E3E1EF7E7EBF7E7EB4E3E1E
              DACBCF7B7F847B8180DACBCFDACBCFDACBCF8E866C4E3E1E4E3E1E8E866CDACB
              CFDACBCF4E3E1EC47122C471224E3E1EDACBCFDACBCF4E3E1EC47122C471224E
              3E1EDACBCFDACBCF4E3E1EF7E7EBF7E7EB4E3E1EDACBCF7B80817B8180DACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF4E3E1EC47122C471
              224E3E1EDACBCFDACBCF4E3E1EC47122C471224E3E1EDACBCFDACBCF4E3E1EF7
              E7EBF7E7EB4E3E1EDACBCF7B80817D8281DACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCF4E3E1EC47122C471224E3E1EDACBCFDACBCF4E3E
              1EC47122C471224E3E1EDACBCFDACBCF4E3E1EF7E7EBF7E7EB4E3E1EDACBCF7B
              80817D8281DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF
              8E866C4E3E1E4E3E1E8E866CDACBCFDACBCF4E3E1EC47122C471224E3E1EDACB
              CFDACBCF4E3E1EF7E7EBF7E7EB4E3E1EDACBCF7B80817C8180DACBCFDACBCFDA
              CBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCF4E3E1EC47122C471224E3E1EDACBCFDACBCF4E3E1EF7E7EBF7E7
              EB4E3E1EDACBCF7B80817C8081DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDA
              CBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF4E3E1EC47122
              C471224E3E1EDACBCFDACBCF4E3E1EF7E7EBF7E7EB4E3E1EDACBCF7B80817B7F
              80DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDA
              CBCFDACBCFDACBCFDACBCFDACBCF8E866C4E3E1E4E3E1E8E866CDACBCFDACBCF
              4E3E1EF7E7EBF7E7EB4E3E1EDACBCF7B80817C8180DACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDA
              CBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF4E3E1EF7E7EBF7E7EB4E3E1E
              DACBCF7B80817C8180DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDA
              CBCFDACBCFDACBCF4E3E1EF7E7EBF7E7EB4E3E1EDACBCF7B80817C8180DACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF8E866C4E
              3E1E4E3E1E8E866CDACBCF7B80817D8281DACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF7B
              80817C8180DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF7B80817C8180DACBCFDACBCFDA
              CBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCF7B80817B8180DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDA
              CBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF758181FF00
              FF7E8080DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDA
              CBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCF808080FF00FFFF00FFFF00FF7980837980837781
              8177818179808379808377818177818179808379808379808377818177818179
              8083798083778083778083798083798083778181778181798083798083748082
              FF00FFFF00FF}
            Disabled.Data = {
              C2070000424DC20700000000000036000000280000001C000000170000000100
              1800000000008C07000000000000000000000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FF7D7D7D3636363636367D7D7DFF00FFFF00FF7D7D7D36363636
              36367D7D7DFF00FFFF00FF7D7D7D3636363636367D7D7DFF00FFFF00FF7D7D7D
              3636363636367D7D7DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF363636BBBB
              BBBBBBBB363636FF00FFFF00FF363636BBBBBBBBBBBB363636FF00FFFF00FF36
              3636BBBBBBBBBBBB363636FF00FFFF00FF363636F7F7F7F7F7F7363636FF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF363636BBBBBBBBBBBB363636FF00FFFF00
              FF363636BBBBBBBBBBBB363636FF00FFFF00FF363636BBBBBBBBBBBB363636FF
              00FFFF00FF363636F7F7F7F7F7F7363636FF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FF7D7D7D3636363636367D7D7DFF00FFFF00FF363636BBBBBBBBBBBB3636
              36FF00FFFF00FF363636BBBBBBBBBBBB363636FF00FFFF00FF363636F7F7F7F7
              F7F7363636FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FF363636BBBBBBBBBBBB363636FF00FFFF00FF363636BBBB
              BBBBBBBB363636FF00FFFF00FF363636F7F7F7F7F7F7363636FF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF363636
              BBBBBBBBBBBB363636FF00FFFF00FF363636BBBBBBBBBBBB363636FF00FFFF00
              FF363636F7F7F7F7F7F7363636FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FF7D7D7D3636363636367D7D7DFF00FF
              FF00FF363636BBBBBBBBBBBB363636FF00FFFF00FF363636F7F7F7F7F7F73636
              36FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF363636BBBBBBBBBBBB
              363636FF00FFFF00FF363636F7F7F7F7F7F7363636FF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FF363636BBBBBBBBBBBB363636FF00FFFF00FF363636
              F7F7F7F7F7F7363636FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7D
              7D7D3636363636367D7D7DFF00FFFF00FF363636F7F7F7F7F7F7363636FF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FF363636F7F7F7F7F7F7363636FF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF363636F7F7F7F7
              F7F7363636FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FF7D7D7D3636363636367D7D7DFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FF}
            State = sNormal
            Enabled = False
            CanBeDown = False
            Down = False
            Anchors = [akTop, akRight]
            Visible = False
            ShowHint = True
          end
          object btnMute050: TSWButton
            Left = 430
            Top = 21
            Width = 30
            Height = 25
            Normal.Data = {
              C2070000424DC20700000000000036000000280000001C000000170000000100
              1800000000008C070000120B0000120B00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FF8E866C4E3E1E4E3E1E8E866CFF00FFFF00FF8E866C4E3E1E4E
              3E1E8E866CFF00FFFF00FF8E866C4E3E1E4E3E1E8E866CFF00FFFF00FF8E866C
              4E3E1E4E3E1E8E866CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4E3E1EC471
              22C471224E3E1EFF00FFFF00FF4E3E1EC47122C471224E3E1EFF00FFFF00FF4E
              3E1EF7E7EFF7E7EF4E3E1EFF00FFFF00FF4E3E1EF7E7EFF7E7EF4E3E1EFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF4E3E1EC47122C471224E3E1EFF00FFFF00
              FF4E3E1EC47122C471224E3E1EFF00FFFF00FF4E3E1EF7E7EFF7E7EF4E3E1EFF
              00FFFF00FF4E3E1EF7E7EFF7E7EF4E3E1EFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FF8E866C4E3E1E4E3E1E8E866CFF00FFFF00FF4E3E1EC47122C471224E3E
              1EFF00FFFF00FF4E3E1EF7E7EFF7E7EF4E3E1EFF00FFFF00FF4E3E1EF7E7EFF7
              E7EF4E3E1EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FF4E3E1EC47122C471224E3E1EFF00FFFF00FF4E3E1EF7E7
              EFF7E7EF4E3E1EFF00FFFF00FF4E3E1EF7E7EFF7E7EF4E3E1EFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4E3E1E
              C47122C471224E3E1EFF00FFFF00FF4E3E1EF7E7EFF7E7EF4E3E1EFF00FFFF00
              FF4E3E1EF7E7EFF7E7EF4E3E1EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FF8E866C4E3E1E4E3E1E8E866CFF00FF
              FF00FF4E3E1EF7E7EFF7E7EF4E3E1EFF00FFFF00FF4E3E1EF7E7EFF7E7EF4E3E
              1EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4E3E1EF7E7EFF7E7EF
              4E3E1EFF00FFFF00FF4E3E1EF7E7EFF7E7EF4E3E1EFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FF4E3E1EF7E7EFF7E7EF4E3E1EFF00FFFF00FF4E3E1E
              F7E7EFF7E7EF4E3E1EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8E
              866C4E3E1E4E3E1E8E866CFF00FFFF00FF4E3E1EF7E7EFF7E7EF4E3E1EFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FF4E3E1EF7E7EFF7E7EF4E3E1EFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4E3E1EF7E7EFF7
              E7EF4E3E1EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FF8E866C4E3E1E4E3E1E8E866CFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FF}
            MouseOver.Data = {
              C2070000424DC20700000000000036000000280000001C000000170000000100
              1800000000008C070000120B0000120B00000000000000000000FF00FFFF00FF
              7981817981817882827781817980837980837782807782807980837980837781
              8177818179808379808379808377818177818179808379808377818177818178
              7F82798083748082FF00FFFF00FFFF00FF7E8081F7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB808080FF
              00FF7B8081F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB758181808080F7E7EBF7E7EBF7
              E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EBF7E7EBF7E7EB7B8081808080F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7
              E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB7B80817F7F
              7FF7E7EBF7E7EB8E866C4E3E1E4E3E1E8E866CF7E7EBF7E7EB8E866C4E3E1E4E
              3E1E8E866CF7E7EBF7E7EB8E866C4E3E1E4E3E1E8E866CF7E7EBF7E7EB8E866C
              4E3E1E4E3E1E8E866CF7E7EBF7E7EB7B80817C8180F7E7EBF7E7EB4E3E1EC471
              22C471224E3E1EF7E7EBF7E7EB4E3E1EC47122C471224E3E1EF7E7EBF7E7EB4E
              3E1EF7E7EBF7E7EB4E3E1EF7E7EBF7E7EB4E3E1EF7E7EBF7E7EB4E3E1EF7E7EB
              F7E7EB7B7F847C8180F7E7EBF7E7EB4E3E1EC47122C471224E3E1EF7E7EBF7E7
              EB4E3E1EC47122C471224E3E1EF7E7EBF7E7EB4E3E1EF7E7EBF7E7EB4E3E1EF7
              E7EBF7E7EB4E3E1EF7E7EBF7E7EB4E3E1EF7E7EBF7E7EB7B7F847B8180F7E7EB
              F7E7EB8E866C4E3E1E4E3E1E8E866CF7E7EBF7E7EB4E3E1EC47122C471224E3E
              1EF7E7EBF7E7EB4E3E1EF7E7EBF7E7EB4E3E1EF7E7EBF7E7EB4E3E1EF7E7EBF7
              E7EB4E3E1EF7E7EBF7E7EB7B80817B8180F7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EB4E3E1EC47122C471224E3E1EF7E7EBF7E7EB4E3E1EF7E7
              EBF7E7EB4E3E1EF7E7EBF7E7EB4E3E1EF7E7EBF7E7EB4E3E1EF7E7EBF7E7EB7B
              80817D8281F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB4E3E1E
              C47122C471224E3E1EF7E7EBF7E7EB4E3E1EF7E7EBF7E7EB4E3E1EF7E7EBF7E7
              EB4E3E1EF7E7EBF7E7EB4E3E1EF7E7EBF7E7EB7B80817C8180F7E7EBF7E7EBF7
              E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB8E866C4E3E1E4E3E1E8E866CF7E7EB
              F7E7EB4E3E1EF7E7EBF7E7EB4E3E1EF7E7EBF7E7EB4E3E1EF7E7EBF7E7EB4E3E
              1EF7E7EBF7E7EB7B80817C8081F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7
              E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB4E3E1EF7E7EBF7E7EB
              4E3E1EF7E7EBF7E7EB4E3E1EF7E7EBF7E7EB4E3E1EF7E7EBF7E7EB7B80817B7F
              80F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7
              E7EBF7E7EBF7E7EBF7E7EB4E3E1EF7E7EBF7E7EB4E3E1EF7E7EBF7E7EB4E3E1E
              F7E7EBF7E7EB4E3E1EF7E7EBF7E7EB7B80817C8180F7E7EBF7E7EBF7E7EBF7E7
              EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB8E
              866C4E3E1E4E3E1E8E866CF7E7EBF7E7EB4E3E1EF7E7EBF7E7EB4E3E1EF7E7EB
              F7E7EB7B80817C8180F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7
              E7EBF7E7EB4E3E1EF7E7EBF7E7EB4E3E1EF7E7EBF7E7EB7B80817C8180F7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB4E3E1EF7E7EBF7
              E7EB4E3E1EF7E7EBF7E7EB7B80817D8281F7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EBF7E7EBF7E7EBF7E7EBF7E7EB8E866C4E3E1E4E3E1E8E866CF7E7EBF7E7EB7B
              80817C8180F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB7B80817C8180F7E7EBF7E7EBF7
              E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EBF7E7EBF7E7EB7B80817B8180F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7
              E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB758181FF00
              FF7E8080F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7
              E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EB808080FF00FFFF00FFFF00FF7980837980837781
              8177818179808379808377818177818179808379808377808377808379808379
              8083798083778083778083798083798083778181778181798083798083748082
              FF00FFFF00FF}
            Pressed.Data = {
              C2070000424DC20700000000000036000000280000001C000000170000000100
              1800000000008C070000120B0000120B00000000000000000000FF00FFFF00FF
              7981817981817882827781817980837980837782807782807980837980837980
              8377828077828079808379808377818177818179808379808377818177818178
              7F82798083748082FF00FFFF00FFFF00FF7E8081DACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF808080FF
              00FF7B8081DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF758181808080DACBCFDACBCFDA
              CBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCF7B80817F7F7FDACBCFDACBCFDACBCF8E866C4E3E1E4E3E1E8E
              866CDACBCFDACBCF8E866C4E3E1E4E3E1E8E866CDACBCFDACBCF8E866C4E3E1E
              4E3E1E8E866CDACBCFDACBCF8E866C4E3E1E4E3E1E8E866CDACBCF7B80817C81
              80DACBCFDACBCFDACBCF4E3E1EC47122C471224E3E1EDACBCFDACBCF4E3E1EC4
              7122C471224E3E1EDACBCFDACBCF4E3E1EF7E7EBF7E7EB4E3E1EDACBCFDACBCF
              4E3E1EF7E7EBF7E7EB4E3E1EDACBCF7B7F847C8180DACBCFDACBCFDACBCF4E3E
              1EC47122C471224E3E1EDACBCFDACBCF4E3E1EC47122C471224E3E1EDACBCFDA
              CBCF4E3E1EF7E7EBF7E7EB4E3E1EDACBCFDACBCF4E3E1EF7E7EBF7E7EB4E3E1E
              DACBCF7B7F847B8180DACBCFDACBCFDACBCF8E866C4E3E1E4E3E1E8E866CDACB
              CFDACBCF4E3E1EC47122C471224E3E1EDACBCFDACBCF4E3E1EF7E7EBF7E7EB4E
              3E1EDACBCFDACBCF4E3E1EF7E7EBF7E7EB4E3E1EDACBCF7B80817B8180DACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF4E3E1EC47122C471
              224E3E1EDACBCFDACBCF4E3E1EF7E7EBF7E7EB4E3E1EDACBCFDACBCF4E3E1EF7
              E7EBF7E7EB4E3E1EDACBCF7B80817D8281DACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCF4E3E1EC47122C471224E3E1EDACBCFDACBCF4E3E
              1EF7E7EBF7E7EB4E3E1EDACBCFDACBCF4E3E1EF7E7EBF7E7EB4E3E1EDACBCF7B
              80817D8281DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF
              8E866C4E3E1E4E3E1E8E866CDACBCFDACBCF4E3E1EF7E7EBF7E7EB4E3E1EDACB
              CFDACBCF4E3E1EF7E7EBF7E7EB4E3E1EDACBCF7B80817C8180DACBCFDACBCFDA
              CBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCF4E3E1EF7E7EBF7E7EB4E3E1EDACBCFDACBCF4E3E1EF7E7EBF7E7
              EB4E3E1EDACBCF7B80817C8081DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDA
              CBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF4E3E1EF7E7EB
              F7E7EB4E3E1EDACBCFDACBCF4E3E1EF7E7EBF7E7EB4E3E1EDACBCF7B80817B7F
              80DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDA
              CBCFDACBCFDACBCFDACBCFDACBCF8E866C4E3E1E4E3E1E8E866CDACBCFDACBCF
              4E3E1EF7E7EBF7E7EB4E3E1EDACBCF7B80817C8180DACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDA
              CBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF4E3E1EF7E7EBF7E7EB4E3E1E
              DACBCF7B80817C8180DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDA
              CBCFDACBCFDACBCF4E3E1EF7E7EBF7E7EB4E3E1EDACBCF7B80817C8180DACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF8E866C4E
              3E1E4E3E1E8E866CDACBCF7B80817D8281DACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF7B
              80817C8180DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF7B80817C8180DACBCFDACBCFDA
              CBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCF7B80817B8180DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDA
              CBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF758181FF00
              FF7E8080DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDA
              CBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCF808080FF00FFFF00FFFF00FF7980837980837781
              8177818179808379808377818177818179808379808379808377818177818179
              8083798083778083778083798083798083778181778181798083798083748082
              FF00FFFF00FF}
            Disabled.Data = {
              C2070000424DC20700000000000036000000280000001C000000170000000100
              1800000000008C07000000000000000000000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FF7D7D7D3636363636367D7D7DFF00FFFF00FF7D7D7D36363636
              36367D7D7DFF00FFFF00FF7D7D7D3636363636367D7D7DFF00FFFF00FF7D7D7D
              3636363636367D7D7DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF363636BBBB
              BBBBBBBB363636FF00FFFF00FF363636BBBBBBBBBBBB363636FF00FFFF00FF36
              3636F7F7F7F7F7F7363636FF00FFFF00FF363636F7F7F7F7F7F7363636FF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF363636BBBBBBBBBBBB363636FF00FFFF00
              FF363636BBBBBBBBBBBB363636FF00FFFF00FF363636F7F7F7F7F7F7363636FF
              00FFFF00FF363636F7F7F7F7F7F7363636FF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FF7D7D7D3636363636367D7D7DFF00FFFF00FF363636BBBBBBBBBBBB3636
              36FF00FFFF00FF363636F7F7F7F7F7F7363636FF00FFFF00FF363636F7F7F7F7
              F7F7363636FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FF363636BBBBBBBBBBBB363636FF00FFFF00FF363636F7F7
              F7F7F7F7363636FF00FFFF00FF363636F7F7F7F7F7F7363636FF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF363636
              BBBBBBBBBBBB363636FF00FFFF00FF363636F7F7F7F7F7F7363636FF00FFFF00
              FF363636F7F7F7F7F7F7363636FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FF7D7D7D3636363636367D7D7DFF00FF
              FF00FF363636F7F7F7F7F7F7363636FF00FFFF00FF363636F7F7F7F7F7F73636
              36FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF363636F7F7F7F7F7F7
              363636FF00FFFF00FF363636F7F7F7F7F7F7363636FF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FF363636F7F7F7F7F7F7363636FF00FFFF00FF363636
              F7F7F7F7F7F7363636FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7D
              7D7D3636363636367D7D7DFF00FFFF00FF363636F7F7F7F7F7F7363636FF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FF363636F7F7F7F7F7F7363636FF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF363636F7F7F7F7
              F7F7363636FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FF7D7D7D3636363636367D7D7DFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FF}
            State = sNormal
            Enabled = False
            CanBeDown = False
            Down = False
            Anchors = [akTop, akRight]
            Visible = False
            ShowHint = True
          end
          object btnMute025: TSWButton
            Left = 430
            Top = 21
            Width = 30
            Height = 25
            Normal.Data = {
              C2070000424DC20700000000000036000000280000001C000000170000000100
              1800000000008C070000120B0000120B00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FF8E866C4E3E1E4E3E1E8E866CFF00FFFF00FF8E866C4E3E1E4E
              3E1E8E866CFF00FFFF00FF8E866C4E3E1E4E3E1E8E866CFF00FFFF00FF8E866C
              4E3E1E4E3E1E8E866CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4E3E1EC471
              22C471224E3E1EFF00FFFF00FF4E3E1EF7E7EFF7E7EF4E3E1EFF00FFFF00FF4E
              3E1EF7E7EFF7E7EF4E3E1EFF00FFFF00FF4E3E1EF7E7EFF7E7EF4E3E1EFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF4E3E1EC47122C471224E3E1EFF00FFFF00
              FF4E3E1EF7E7EFF7E7EF4E3E1EFF00FFFF00FF4E3E1EF7E7EFF7E7EF4E3E1EFF
              00FFFF00FF4E3E1EF7E7EFF7E7EF4E3E1EFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FF8E866C4E3E1E4E3E1E8E866CFF00FFFF00FF4E3E1EF7E7EFF7E7EF4E3E
              1EFF00FFFF00FF4E3E1EF7E7EFF7E7EF4E3E1EFF00FFFF00FF4E3E1EF7E7EFF7
              E7EF4E3E1EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FF4E3E1EF7E7EFF7E7EF4E3E1EFF00FFFF00FF4E3E1EF7E7
              EFF7E7EF4E3E1EFF00FFFF00FF4E3E1EF7E7EFF7E7EF4E3E1EFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4E3E1E
              F7E7EFF7E7EF4E3E1EFF00FFFF00FF4E3E1EF7E7EFF7E7EF4E3E1EFF00FFFF00
              FF4E3E1EF7E7EFF7E7EF4E3E1EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FF8E866C4E3E1E4E3E1E8E866CFF00FF
              FF00FF4E3E1EF7E7EFF7E7EF4E3E1EFF00FFFF00FF4E3E1EF7E7EFF7E7EF4E3E
              1EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4E3E1EF7E7EFF7E7EF
              4E3E1EFF00FFFF00FF4E3E1EF7E7EFF7E7EF4E3E1EFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FF4E3E1EF7E7EFF7E7EF4E3E1EFF00FFFF00FF4E3E1E
              F7E7EFF7E7EF4E3E1EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8E
              866C4E3E1E4E3E1E8E866CFF00FFFF00FF4E3E1EF7E7EFF7E7EF4E3E1EFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FF4E3E1EF7E7EFF7E7EF4E3E1EFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4E3E1EF7E7EFF7
              E7EF4E3E1EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FF8E866C4E3E1E4E3E1E8E866CFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FF}
            MouseOver.Data = {
              C2070000424DC20700000000000036000000280000001C000000170000000100
              1800000000008C070000120B0000120B00000000000000000000FF00FFFF00FF
              7981817981817882827781817980837980837782807782807980837980837781
              8177818179808379808379808377818177818179808379808377818177818178
              7F82798083748082FF00FFFF00FFFF00FF7E8081F7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB808080FF
              00FF7B8081F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB758181808080F7E7EBF7E7EBF7
              E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EBF7E7EBF7E7EB7B8081808080F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7
              E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB7B80817F7F
              7FF7E7EBF7E7EB8E866C4E3E1E4E3E1E8E866CF7E7EBF7E7EB8E866C4E3E1E4E
              3E1E8E866CF7E7EBF7E7EB8E866C4E3E1E4E3E1E8E866CF7E7EBF7E7EB8E866C
              4E3E1E4E3E1E8E866CF7E7EBF7E7EB7B80817C8180F7E7EBF7E7EB4E3E1EC471
              22C471224E3E1EF7E7EBF7E7EB4E3E1EF7E7EBF7E7EB4E3E1EF7E7EBF7E7EB4E
              3E1EF7E7EBF7E7EB4E3E1EF7E7EBF7E7EB4E3E1EF7E7EBF7E7EB4E3E1EF7E7EB
              F7E7EB7B7F847C8180F7E7EBF7E7EB4E3E1EC47122C471224E3E1EF7E7EBF7E7
              EB4E3E1EF7E7EBF7E7EB4E3E1EF7E7EBF7E7EB4E3E1EF7E7EBF7E7EB4E3E1EF7
              E7EBF7E7EB4E3E1EF7E7EBF7E7EB4E3E1EF7E7EBF7E7EB7B7F847B8180F7E7EB
              F7E7EB8E866C4E3E1E4E3E1E8E866CF7E7EBF7E7EB4E3E1EF7E7EBF7E7EB4E3E
              1EF7E7EBF7E7EB4E3E1EF7E7EBF7E7EB4E3E1EF7E7EBF7E7EB4E3E1EF7E7EBF7
              E7EB4E3E1EF7E7EBF7E7EB7B80817B8180F7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EB4E3E1EF7E7EBF7E7EB4E3E1EF7E7EBF7E7EB4E3E1EF7E7
              EBF7E7EB4E3E1EF7E7EBF7E7EB4E3E1EF7E7EBF7E7EB4E3E1EF7E7EBF7E7EB7B
              80817D8281F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB4E3E1E
              F7E7EBF7E7EB4E3E1EF7E7EBF7E7EB4E3E1EF7E7EBF7E7EB4E3E1EF7E7EBF7E7
              EB4E3E1EF7E7EBF7E7EB4E3E1EF7E7EBF7E7EB7B80817C8180F7E7EBF7E7EBF7
              E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB8E866C4E3E1E4E3E1E8E866CF7E7EB
              F7E7EB4E3E1EF7E7EBF7E7EB4E3E1EF7E7EBF7E7EB4E3E1EF7E7EBF7E7EB4E3E
              1EF7E7EBF7E7EB7B80817C8081F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7
              E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB4E3E1EF7E7EBF7E7EB
              4E3E1EF7E7EBF7E7EB4E3E1EF7E7EBF7E7EB4E3E1EF7E7EBF7E7EB7B80817B7F
              80F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7
              E7EBF7E7EBF7E7EBF7E7EB4E3E1EF7E7EBF7E7EB4E3E1EF7E7EBF7E7EB4E3E1E
              F7E7EBF7E7EB4E3E1EF7E7EBF7E7EB7B80817C8180F7E7EBF7E7EBF7E7EBF7E7
              EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB8E
              866C4E3E1E4E3E1E8E866CF7E7EBF7E7EB4E3E1EF7E7EBF7E7EB4E3E1EF7E7EB
              F7E7EB7B80817C8180F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7
              E7EBF7E7EB4E3E1EF7E7EBF7E7EB4E3E1EF7E7EBF7E7EB7B80817C8180F7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB4E3E1EF7E7EBF7
              E7EB4E3E1EF7E7EBF7E7EB7B80817D8281F7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EBF7E7EBF7E7EBF7E7EBF7E7EB8E866C4E3E1E4E3E1E8E866CF7E7EBF7E7EB7B
              80817C8180F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB7B80817C8180F7E7EBF7E7EBF7
              E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EBF7E7EBF7E7EB7B80817B8180F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7
              E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB758181FF00
              FF7E8080F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7
              E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EB808080FF00FFFF00FFFF00FF7980837980837781
              8177818179808379808377818177818179808379808377808377808379808379
              8083798083778083778083798083798083778181778181798083798083748082
              FF00FFFF00FF}
            Pressed.Data = {
              C2070000424DC20700000000000036000000280000001C000000170000000100
              1800000000008C070000120B0000120B00000000000000000000FF00FFFF00FF
              7981817981817882827781817980837980837782807782807980837980837980
              8377828077828079808379808377818177818179808379808377818177818178
              7F82798083748082FF00FFFF00FFFF00FF7E8081DACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF808080FF
              00FF7B8081DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF758181808080DACBCFDACBCFDA
              CBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCF7B80817F7F7FDACBCFDACBCFDACBCF8E866C4E3E1E4E3E1E8E
              866CDACBCFDACBCF8E866C4E3E1E4E3E1E8E866CDACBCFDACBCF8E866C4E3E1E
              4E3E1E8E866CDACBCFDACBCF8E866C4E3E1E4E3E1E8E866CDACBCF7B80817C81
              80DACBCFDACBCFDACBCF4E3E1EC47122C471224E3E1EDACBCFDACBCF4E3E1EF7
              E7EBF7E7EB4E3E1EDACBCFDACBCF4E3E1EF7E7EBF7E7EB4E3E1EDACBCFDACBCF
              4E3E1EF7E7EBF7E7EB4E3E1EDACBCF7B7F847C8180DACBCFDACBCFDACBCF4E3E
              1EC47122C471224E3E1EDACBCFDACBCF4E3E1EF7E7EBF7E7EB4E3E1EDACBCFDA
              CBCF4E3E1EF7E7EBF7E7EB4E3E1EDACBCFDACBCF4E3E1EF7E7EBF7E7EB4E3E1E
              DACBCF7B7F847B8180DACBCFDACBCFDACBCF8E866C4E3E1E4E3E1E8E866CDACB
              CFDACBCF4E3E1EF7E7EBF7E7EB4E3E1EDACBCFDACBCF4E3E1EF7E7EBF7E7EB4E
              3E1EDACBCFDACBCF4E3E1EF7E7EBF7E7EB4E3E1EDACBCF7B80817B8180DACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF4E3E1EF7E7EBF7E7
              EB4E3E1EDACBCFDACBCF4E3E1EF7E7EBF7E7EB4E3E1EDACBCFDACBCF4E3E1EF7
              E7EBF7E7EB4E3E1EDACBCF7B80817D8281DACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCF4E3E1EF7E7EBF7E7EB4E3E1EDACBCFDACBCF4E3E
              1EF7E7EBF7E7EB4E3E1EDACBCFDACBCF4E3E1EF7E7EBF7E7EB4E3E1EDACBCF7B
              80817D8281DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF
              8E866C4E3E1E4E3E1E8E866CDACBCFDACBCF4E3E1EF7E7EBF7E7EB4E3E1EDACB
              CFDACBCF4E3E1EF7E7EBF7E7EB4E3E1EDACBCF7B80817C8180DACBCFDACBCFDA
              CBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCF4E3E1EF7E7EBF7E7EB4E3E1EDACBCFDACBCF4E3E1EF7E7EBF7E7
              EB4E3E1EDACBCF7B80817C8081DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDA
              CBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF4E3E1EF7E7EB
              F7E7EB4E3E1EDACBCFDACBCF4E3E1EF7E7EBF7E7EB4E3E1EDACBCF7B80817B7F
              80DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDA
              CBCFDACBCFDACBCFDACBCFDACBCF8E866C4E3E1E4E3E1E8E866CDACBCFDACBCF
              4E3E1EF7E7EBF7E7EB4E3E1EDACBCF7B80817C8180DACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDA
              CBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF4E3E1EF7E7EBF7E7EB4E3E1E
              DACBCF7B80817C8180DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDA
              CBCFDACBCFDACBCF4E3E1EF7E7EBF7E7EB4E3E1EDACBCF7B80817C8180DACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF8E866C4E
              3E1E4E3E1E8E866CDACBCF7B80817D8281DACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF7B
              80817C8180DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF7B80817C8180DACBCFDACBCFDA
              CBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCF7B80817B8180DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDA
              CBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF758181FF00
              FF7E8080DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDA
              CBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCF808080FF00FFFF00FFFF00FF7980837980837781
              8177818179808379808377818177818179808379808379808377818177818179
              8083798083778083778083798083798083778181778181798083798083748082
              FF00FFFF00FF}
            Disabled.Data = {
              C2070000424DC20700000000000036000000280000001C000000170000000100
              1800000000008C07000000000000000000000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FF7D7D7D3636363636367D7D7DFF00FFFF00FF7D7D7D36363636
              36367D7D7DFF00FFFF00FF7D7D7D3636363636367D7D7DFF00FFFF00FF7D7D7D
              3636363636367D7D7DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF363636BBBB
              BBBBBBBB363636FF00FFFF00FF363636F7F7F7F7F7F7363636FF00FFFF00FF36
              3636F7F7F7F7F7F7363636FF00FFFF00FF363636F7F7F7F7F7F7363636FF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF363636BBBBBBBBBBBB363636FF00FFFF00
              FF363636F7F7F7F7F7F7363636FF00FFFF00FF363636F7F7F7F7F7F7363636FF
              00FFFF00FF363636F7F7F7F7F7F7363636FF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FF7D7D7D3636363636367D7D7DFF00FFFF00FF363636F7F7F7F7F7F73636
              36FF00FFFF00FF363636F7F7F7F7F7F7363636FF00FFFF00FF363636F7F7F7F7
              F7F7363636FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FF363636F7F7F7F7F7F7363636FF00FFFF00FF363636F7F7
              F7F7F7F7363636FF00FFFF00FF363636F7F7F7F7F7F7363636FF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF363636
              F7F7F7F7F7F7363636FF00FFFF00FF363636F7F7F7F7F7F7363636FF00FFFF00
              FF363636F7F7F7F7F7F7363636FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FF7D7D7D3636363636367D7D7DFF00FF
              FF00FF363636F7F7F7F7F7F7363636FF00FFFF00FF363636F7F7F7F7F7F73636
              36FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF363636F7F7F7F7F7F7
              363636FF00FFFF00FF363636F7F7F7F7F7F7363636FF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FF363636F7F7F7F7F7F7363636FF00FFFF00FF363636
              F7F7F7F7F7F7363636FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7D
              7D7D3636363636367D7D7DFF00FFFF00FF363636F7F7F7F7F7F7363636FF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FF363636F7F7F7F7F7F7363636FF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF363636F7F7F7F7
              F7F7363636FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FF7D7D7D3636363636367D7D7DFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FF}
            State = sNormal
            Enabled = False
            CanBeDown = False
            Down = False
            Anchors = [akTop, akRight]
            Visible = False
            ShowHint = True
          end
          object btnMute000: TSWButton
            Left = 430
            Top = 21
            Width = 30
            Height = 25
            Normal.Data = {
              C2070000424DC20700000000000036000000280000001C000000170000000100
              1800000000008C07000000000000000000000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FF8E866C4E3E1E4E3E1E8E866CFF00FFFF00FF8E866C4E3E1E4E
              3E1E8E866CFF00FFFF00FF8E866C4E3E1E4E3E1E8E866CFF00FFFF00FF8E866C
              4E3E1E4E3E1E8E866CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4E3E1EF7E7
              EFF7E7EF4E3E1EFF00FFFF00FF4E3E1EF7E7EFF7E7EF4E3E1EFF00FFFF00FF4E
              3E1EF7E7EFF7E7EF4E3E1EFF00FFFF00FF4E3E1EF7E7EFF7E7EF4E3E1EFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF4E3E1EF7E7EFF7E7EF4E3E1EFF00FFFF00
              FF4E3E1EF7E7EFF7E7EF4E3E1EFF00FFFF00FF4E3E1EF7E7EFF7E7EF4E3E1EFF
              00FFFF00FF4E3E1EF7E7EFF7E7EF4E3E1EFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FF8E866C4E3E1E4E3E1E8E866CFF00FFFF00FF4E3E1EF7E7EFF7E7EF4E3E
              1EFF00FFFF00FF4E3E1EF7E7EFF7E7EF4E3E1EFF00FFFF00FF4E3E1EF7E7EFF7
              E7EF4E3E1EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FF4E3E1EF7E7EFF7E7EF4E3E1EFF00FFFF00FF4E3E1EF7E7
              EFF7E7EF4E3E1EFF00FFFF00FF4E3E1EF7E7EFF7E7EF4E3E1EFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4E3E1E
              F7E7EFF7E7EF4E3E1EFF00FFFF00FF4E3E1EF7E7EFF7E7EF4E3E1EFF00FFFF00
              FF4E3E1EF7E7EFF7E7EF4E3E1EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FF8E866C4E3E1E4E3E1E8E866CFF00FF
              FF00FF4E3E1EF7E7EFF7E7EF4E3E1EFF00FFFF00FF4E3E1EF7E7EFF7E7EF4E3E
              1EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4E3E1EF7E7EFF7E7EF
              4E3E1EFF00FFFF00FF4E3E1EF7E7EFF7E7EF4E3E1EFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FF4E3E1EF7E7EFF7E7EF4E3E1EFF00FFFF00FF4E3E1E
              F7E7EFF7E7EF4E3E1EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8E
              866C4E3E1E4E3E1E8E866CFF00FFFF00FF4E3E1EF7E7EFF7E7EF4E3E1EFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FF4E3E1EF7E7EFF7E7EF4E3E1EFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4E3E1EF7E7EFF7
              E7EF4E3E1EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FF8E866C4E3E1E4E3E1E8E866CFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FF}
            MouseOver.Data = {
              C2070000424DC20700000000000036000000280000001C000000170000000100
              1800000000008C070000120B0000120B00000000000000000000FF00FFFF00FF
              7981817981817882827781817980837980837782807782807980837980837781
              8177818179808379808379808377818177818179808379808377818177818178
              7F82798083748082FF00FFFF00FFFF00FF7E8081F7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB808080FF
              00FF7B8081F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB758181808080F7E7EBF7E7EBF7
              E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EBF7E7EBF7E7EB7B8081808080F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7
              E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB7B80817F7F
              7FF7E7EBF7E7EB8E866C4E3E1E4E3E1E8E866CF7E7EBF7E7EB8E866C4E3E1E4E
              3E1E8E866CF7E7EBF7E7EB8E866C4E3E1E4E3E1E8E866CF7E7EBF7E7EB8E866C
              4E3E1E4E3E1E8E866CF7E7EBF7E7EB7B80817C8180F7E7EBF7E7EB4E3E1EF7E7
              EBF7E7EB4E3E1EF7E7EBF7E7EB4E3E1EF7E7EBF7E7EB4E3E1EF7E7EBF7E7EB4E
              3E1EF7E7EBF7E7EB4E3E1EF7E7EBF7E7EB4E3E1EF7E7EBF7E7EB4E3E1EF7E7EB
              F7E7EB7B7F847C8180F7E7EBF7E7EB4E3E1EF7E7EBF7E7EB4E3E1EF7E7EBF7E7
              EB4E3E1EF7E7EBF7E7EB4E3E1EF7E7EBF7E7EB4E3E1EF7E7EBF7E7EB4E3E1EF7
              E7EBF7E7EB4E3E1EF7E7EBF7E7EB4E3E1EF7E7EBF7E7EB7B7F847B8180F7E7EB
              F7E7EB8E866C4E3E1E4E3E1E8E866CF7E7EBF7E7EB4E3E1EF7E7EBF7E7EB4E3E
              1EF7E7EBF7E7EB4E3E1EF7E7EBF7E7EB4E3E1EF7E7EBF7E7EB4E3E1EF7E7EBF7
              E7EB4E3E1EF7E7EBF7E7EB7B80817B8180F7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EB4E3E1EF7E7EBF7E7EB4E3E1EF7E7EBF7E7EB4E3E1EF7E7
              EBF7E7EB4E3E1EF7E7EBF7E7EB4E3E1EF7E7EBF7E7EB4E3E1EF7E7EBF7E7EB7B
              80817D8281F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB4E3E1E
              F7E7EBF7E7EB4E3E1EF7E7EBF7E7EB4E3E1EF7E7EBF7E7EB4E3E1EF7E7EBF7E7
              EB4E3E1EF7E7EBF7E7EB4E3E1EF7E7EBF7E7EB7B80817C8180F7E7EBF7E7EBF7
              E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB8E866C4E3E1E4E3E1E8E866CF7E7EB
              F7E7EB4E3E1EF7E7EBF7E7EB4E3E1EF7E7EBF7E7EB4E3E1EF7E7EBF7E7EB4E3E
              1EF7E7EBF7E7EB7B80817C8081F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7
              E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB4E3E1EF7E7EBF7E7EB
              4E3E1EF7E7EBF7E7EB4E3E1EF7E7EBF7E7EB4E3E1EF7E7EBF7E7EB7B80817B7F
              80F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7
              E7EBF7E7EBF7E7EBF7E7EB4E3E1EF7E7EBF7E7EB4E3E1EF7E7EBF7E7EB4E3E1E
              F7E7EBF7E7EB4E3E1EF7E7EBF7E7EB7B80817C8180F7E7EBF7E7EBF7E7EBF7E7
              EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB8E
              866C4E3E1E4E3E1E8E866CF7E7EBF7E7EB4E3E1EF7E7EBF7E7EB4E3E1EF7E7EB
              F7E7EB7B80817C8180F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7
              E7EBF7E7EB4E3E1EF7E7EBF7E7EB4E3E1EF7E7EBF7E7EB7B80817C8180F7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB4E3E1EF7E7EBF7
              E7EB4E3E1EF7E7EBF7E7EB7B80817D8281F7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EBF7E7EBF7E7EBF7E7EBF7E7EB8E866C4E3E1E4E3E1E8E866CF7E7EBF7E7EB7B
              80817C8180F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB7B80817C8180F7E7EBF7E7EBF7
              E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EBF7E7EBF7E7EB7B80817B8180F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7
              E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB758181FF00
              FF7E8080F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7
              E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EB808080FF00FFFF00FFFF00FF7980837980837781
              8177818179808379808377818177818179808379808377808377808379808379
              8083798083778083778083798083798083778181778181798083798083748082
              FF00FFFF00FF}
            Pressed.Data = {
              C2070000424DC20700000000000036000000280000001C000000170000000100
              1800000000008C070000120B0000120B00000000000000000000FF00FFFF00FF
              7981817981817882827781817980837980837782807782807980837980837980
              8377828077828079808379808377818177818179808379808377818177818178
              7F82798083748082FF00FFFF00FFFF00FF7E8081DACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF808080FF
              00FF7B8081DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF758181808080DACBCFDACBCFDA
              CBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCF7B80817F7F7FDACBCFDACBCFDACBCF8E866C4E3E1E4E3E1E8E
              866CDACBCFDACBCF8E866C4E3E1E4E3E1E8E866CDACBCFDACBCF8E866C4E3E1E
              4E3E1E8E866CDACBCFDACBCF8E866C4E3E1E4E3E1E8E866CDACBCF7B80817C81
              80DACBCFDACBCFDACBCF4E3E1EF7E7EBF7E7EB4E3E1EDACBCFDACBCF4E3E1EF7
              E7EBF7E7EB4E3E1EDACBCFDACBCF4E3E1EF7E7EBF7E7EB4E3E1EDACBCFDACBCF
              4E3E1EF7E7EBF7E7EB4E3E1EDACBCF7B7F847C8180DACBCFDACBCFDACBCF4E3E
              1EF7E7EBF7E7EB4E3E1EDACBCFDACBCF4E3E1EF7E7EBF7E7EB4E3E1EDACBCFDA
              CBCF4E3E1EF7E7EBF7E7EB4E3E1EDACBCFDACBCF4E3E1EF7E7EBF7E7EB4E3E1E
              DACBCF7B7F847B8180DACBCFDACBCFDACBCF8E866C4E3E1E4E3E1E8E866CDACB
              CFDACBCF4E3E1EF7E7EBF7E7EB4E3E1EDACBCFDACBCF4E3E1EF7E7EBF7E7EB4E
              3E1EDACBCFDACBCF4E3E1EF7E7EBF7E7EB4E3E1EDACBCF7B80817B8180DACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF4E3E1EF7E7EBF7E7
              EB4E3E1EDACBCFDACBCF4E3E1EF7E7EBF7E7EB4E3E1EDACBCFDACBCF4E3E1EF7
              E7EBF7E7EB4E3E1EDACBCF7B80817D8281DACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCF4E3E1EF7E7EBF7E7EB4E3E1EDACBCFDACBCF4E3E
              1EF7E7EBF7E7EB4E3E1EDACBCFDACBCF4E3E1EF7E7EBF7E7EB4E3E1EDACBCF7B
              80817D8281DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF
              8E866C4E3E1E4E3E1E8E866CDACBCFDACBCF4E3E1EF7E7EBF7E7EB4E3E1EDACB
              CFDACBCF4E3E1EF7E7EBF7E7EB4E3E1EDACBCF7B80817C8180DACBCFDACBCFDA
              CBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCF4E3E1EF7E7EBF7E7EB4E3E1EDACBCFDACBCF4E3E1EF7E7EBF7E7
              EB4E3E1EDACBCF7B80817C8081DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDA
              CBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF4E3E1EF7E7EB
              F7E7EB4E3E1EDACBCFDACBCF4E3E1EF7E7EBF7E7EB4E3E1EDACBCF7B80817B7F
              80DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDA
              CBCFDACBCFDACBCFDACBCFDACBCF8E866C4E3E1E4E3E1E8E866CDACBCFDACBCF
              4E3E1EF7E7EBF7E7EB4E3E1EDACBCF7B80817C8180DACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDA
              CBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF4E3E1EF7E7EBF7E7EB4E3E1E
              DACBCF7B80817C8180DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDA
              CBCFDACBCFDACBCF4E3E1EF7E7EBF7E7EB4E3E1EDACBCF7B80817C8180DACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF8E866C4E
              3E1E4E3E1E8E866CDACBCF7B80817D8281DACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF7B
              80817C8180DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF7B80817C8180DACBCFDACBCFDA
              CBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCF7B80817B8180DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDA
              CBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF758181FF00
              FF7E8080DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDA
              CBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCF808080FF00FFFF00FFFF00FF7980837980837781
              8177818179808379808377818177818179808379808379808377818177818179
              8083798083778083778083798083798083778181778181798083798083748082
              FF00FFFF00FF}
            Disabled.Data = {
              C2070000424DC20700000000000036000000280000001C000000170000000100
              1800000000008C07000000000000000000000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FF7D7D7D3636363636367D7D7DFF00FFFF00FF7D7D7D36363636
              36367D7D7DFF00FFFF00FF7D7D7D3636363636367D7D7DFF00FFFF00FF7D7D7D
              3636363636367D7D7DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF363636F7F7
              F7F7F7F7363636FF00FFFF00FF363636F7F7F7F7F7F7363636FF00FFFF00FF36
              3636F7F7F7F7F7F7363636FF00FFFF00FF363636F7F7F7F7F7F7363636FF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF363636F7F7F7F7F7F7363636FF00FFFF00
              FF363636F7F7F7F7F7F7363636FF00FFFF00FF363636F7F7F7F7F7F7363636FF
              00FFFF00FF363636F7F7F7F7F7F7363636FF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FF7D7D7D3636363636367D7D7DFF00FFFF00FF363636F7F7F7F7F7F73636
              36FF00FFFF00FF363636F7F7F7F7F7F7363636FF00FFFF00FF363636F7F7F7F7
              F7F7363636FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FF363636F7F7F7F7F7F7363636FF00FFFF00FF363636F7F7
              F7F7F7F7363636FF00FFFF00FF363636F7F7F7F7F7F7363636FF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF363636
              F7F7F7F7F7F7363636FF00FFFF00FF363636F7F7F7F7F7F7363636FF00FFFF00
              FF363636F7F7F7F7F7F7363636FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FF7D7D7D3636363636367D7D7DFF00FF
              FF00FF363636F7F7F7F7F7F7363636FF00FFFF00FF363636F7F7F7F7F7F73636
              36FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF363636F7F7F7F7F7F7
              363636FF00FFFF00FF363636F7F7F7F7F7F7363636FF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FF363636F7F7F7F7F7F7363636FF00FFFF00FF363636
              F7F7F7F7F7F7363636FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7D
              7D7D3636363636367D7D7DFF00FFFF00FF363636F7F7F7F7F7F7363636FF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FF363636F7F7F7F7F7F7363636FF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF363636F7F7F7F7
              F7F7363636FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FF7D7D7D3636363636367D7D7DFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FF}
            State = sNormal
            Enabled = False
            CanBeDown = False
            Down = False
            Anchors = [akTop, akRight]
            Visible = False
            ShowHint = True
          end
          object btnMute: TSWButton
            Left = 430
            Top = 21
            Width = 30
            Height = 25
            Hint = 'Mute/Unmute'
            Normal.Data = {
              C2070000424DC20700000000000036000000280000001C000000170000000100
              1800000000008C07000000000000000000000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FF8E866C4E3E1E4E3E1E8E866CFF00FFFF00FF8E866C4E3E1E4E
              3E1E8E866CFF00FFFF00FF8E866C4E3E1E4E3E1E8E866CFF00FFFF00FF8E866C
              4E3E1E4E3E1E8E866CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4E3E1EC471
              22C471224E3E1EFF00FFFF00FF4E3E1EC47122C471224E3E1EFF00FFFF00FF4E
              3E1EC47122C471224E3E1EFF00FFFF00FF4E3E1EC47122C471224E3E1EFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF4E3E1EC47122C471224E3E1EFF00FFFF00
              FF4E3E1EC47122C471224E3E1EFF00FFFF00FF4E3E1EC47122C471224E3E1EFF
              00FFFF00FF4E3E1EC47122C471224E3E1EFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FF8E866C4E3E1E4E3E1E8E866CFF00FFFF00FF4E3E1EC47122C471224E3E
              1EFF00FFFF00FF4E3E1EC47122C471224E3E1EFF00FFFF00FF4E3E1EC47122C4
              71224E3E1EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FF4E3E1EC47122C471224E3E1EFF00FFFF00FF4E3E1EC471
              22C471224E3E1EFF00FFFF00FF4E3E1EC47122C471224E3E1EFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4E3E1E
              C47122C471224E3E1EFF00FFFF00FF4E3E1EC47122C471224E3E1EFF00FFFF00
              FF4E3E1EC47122C471224E3E1EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FF8E866C4E3E1E4E3E1E8E866CFF00FF
              FF00FF4E3E1EC47122C471224E3E1EFF00FFFF00FF4E3E1EC47122C471224E3E
              1EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4E3E1EC47122C47122
              4E3E1EFF00FFFF00FF4E3E1EC47122C471224E3E1EFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FF4E3E1EC47122C471224E3E1EFF00FFFF00FF4E3E1E
              C47122C471224E3E1EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8E
              866C4E3E1E4E3E1E8E866CFF00FFFF00FF4E3E1EC47122C471224E3E1EFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FF4E3E1EC47122C471224E3E1EFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4E3E1EC47122C4
              71224E3E1EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FF8E866C4E3E1E4E3E1E8E866CFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FF}
            MouseOver.Data = {
              C2070000424DC20700000000000036000000280000001C000000170000000100
              1800000000008C070000120B0000120B00000000000000000000FF00FFFF00FF
              7981817981817882827781817980837980837782807782807980837980837781
              8177818179808379808379808377818177818179808379808377818177818178
              7F82798083748082FF00FFFF00FFFF00FF7E8081F7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB808080FF
              00FF7B8081F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB758181808080F7E7EBF7E7EBF7
              E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EBF7E7EBF7E7EB7B8081808080F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7
              E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB7B80817F7F
              7FF7E7EBF7E7EB8E866C4E3E1E4E3E1E8E866CF7E7EBF7E7EB8E866C4E3E1E4E
              3E1E8E866CF7E7EBF7E7EB8E866C4E3E1E4E3E1E8E866CF7E7EBF7E7EB8E866C
              4E3E1E4E3E1E8E866CF7E7EBF7E7EB7B80817C8180F7E7EBF7E7EB4E3E1EC471
              22C471224E3E1EF7E7EBF7E7EB4E3E1EC47122C471224E3E1EF7E7EBF7E7EB4E
              3E1EC47122C471224E3E1EF7E7EBF7E7EB4E3E1EC47122C471224E3E1EF7E7EB
              F7E7EB7B7F847C8180F7E7EBF7E7EB4E3E1EC47122C471224E3E1EF7E7EBF7E7
              EB4E3E1EC47122C471224E3E1EF7E7EBF7E7EB4E3E1EC47122C471224E3E1EF7
              E7EBF7E7EB4E3E1EC47122C471224E3E1EF7E7EBF7E7EB7B7F847B8180F7E7EB
              F7E7EB8E866C4E3E1E4E3E1E8E866CF7E7EBF7E7EB4E3E1EC47122C471224E3E
              1EF7E7EBF7E7EB4E3E1EC47122C471224E3E1EF7E7EBF7E7EB4E3E1EC47122C4
              71224E3E1EF7E7EBF7E7EB7B80817B8180F7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EB4E3E1EC47122C471224E3E1EF7E7EBF7E7EB4E3E1EC471
              22C471224E3E1EF7E7EBF7E7EB4E3E1EC47122C471224E3E1EF7E7EBF7E7EB7B
              80817D8281F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB4E3E1E
              C47122C471224E3E1EF7E7EBF7E7EB4E3E1EC47122C471224E3E1EF7E7EBF7E7
              EB4E3E1EC47122C471224E3E1EF7E7EBF7E7EB7B80817C8180F7E7EBF7E7EBF7
              E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB8E866C4E3E1E4E3E1E8E866CF7E7EB
              F7E7EB4E3E1EC47122C471224E3E1EF7E7EBF7E7EB4E3E1EC47122C471224E3E
              1EF7E7EBF7E7EB7B80817C8081F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7
              E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB4E3E1EC47122C47122
              4E3E1EF7E7EBF7E7EB4E3E1EC47122C471224E3E1EF7E7EBF7E7EB7B80817B7F
              80F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7
              E7EBF7E7EBF7E7EBF7E7EB4E3E1EC47122C471224E3E1EF7E7EBF7E7EB4E3E1E
              C47122C471224E3E1EF7E7EBF7E7EB7B80817C8180F7E7EBF7E7EBF7E7EBF7E7
              EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB8E
              866C4E3E1E4E3E1E8E866CF7E7EBF7E7EB4E3E1EC47122C471224E3E1EF7E7EB
              F7E7EB7B80817C8180F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7
              E7EBF7E7EB4E3E1EC47122C471224E3E1EF7E7EBF7E7EB7B80817C8180F7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB4E3E1EC47122C4
              71224E3E1EF7E7EBF7E7EB7B80817D8281F7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EBF7E7EBF7E7EBF7E7EBF7E7EB8E866C4E3E1E4E3E1E8E866CF7E7EBF7E7EB7B
              80817C8180F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB7B80817C8180F7E7EBF7E7EBF7
              E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EBF7E7EBF7E7EB7B80817B8180F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7
              E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB758181FF00
              FF7E8080F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7
              E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EB808080FF00FFFF00FFFF00FF7980837980837781
              8177818179808379808377818177818179808379808377808377808379808379
              8083798083778083778083798083798083778181778181798083798083748082
              FF00FFFF00FF}
            Pressed.Data = {
              C2070000424DC20700000000000036000000280000001C000000170000000100
              1800000000008C070000120B0000120B00000000000000000000FF00FFFF00FF
              7981817981817882827781817980837980837782807782807980837980837980
              8377828077828079808379808377818177818179808379808377818177818178
              7F82798083748082FF00FFFF00FFFF00FF7E8081DACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF808080FF
              00FF7B8081DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF758181808080DACBCFDACBCFDA
              CBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCF7B80817F7F7FDACBCFDACBCFDACBCF8E866C4E3E1E4E3E1E8E
              866CDACBCFDACBCF8E866C4E3E1E4E3E1E8E866CDACBCFDACBCF8E866C4E3E1E
              4E3E1E8E866CDACBCFDACBCF8E866C4E3E1E4E3E1E8E866CDACBCF7B80817C81
              80DACBCFDACBCFDACBCF4E3E1EC47122C471224E3E1EDACBCFDACBCF4E3E1EC4
              7122C471224E3E1EDACBCFDACBCF4E3E1EC47122C471224E3E1EDACBCFDACBCF
              4E3E1EC47122C471224E3E1EDACBCF7B7F847C8180DACBCFDACBCFDACBCF4E3E
              1EC47122C471224E3E1EDACBCFDACBCF4E3E1EC47122C471224E3E1EDACBCFDA
              CBCF4E3E1EC47122C471224E3E1EDACBCFDACBCF4E3E1EC47122C471224E3E1E
              DACBCF7B7F847B8180DACBCFDACBCFDACBCF8E866C4E3E1E4E3E1E8E866CDACB
              CFDACBCF4E3E1EC47122C471224E3E1EDACBCFDACBCF4E3E1EC47122C471224E
              3E1EDACBCFDACBCF4E3E1EC47122C471224E3E1EDACBCF7B80817B8180DACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF4E3E1EC47122C471
              224E3E1EDACBCFDACBCF4E3E1EC47122C471224E3E1EDACBCFDACBCF4E3E1EC4
              7122C471224E3E1EDACBCF7B80817D8281DACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCF4E3E1EC47122C471224E3E1EDACBCFDACBCF4E3E
              1EC47122C471224E3E1EDACBCFDACBCF4E3E1EC47122C471224E3E1EDACBCF7B
              80817D8281DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF
              8E866C4E3E1E4E3E1E8E866CDACBCFDACBCF4E3E1EC47122C471224E3E1EDACB
              CFDACBCF4E3E1EC47122C471224E3E1EDACBCF7B80817C8180DACBCFDACBCFDA
              CBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCF4E3E1EC47122C471224E3E1EDACBCFDACBCF4E3E1EC47122C471
              224E3E1EDACBCF7B80817C8081DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDA
              CBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF4E3E1EC47122
              C471224E3E1EDACBCFDACBCF4E3E1EC47122C471224E3E1EDACBCF7B80817B7F
              80DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDA
              CBCFDACBCFDACBCFDACBCFDACBCF8E866C4E3E1E4E3E1E8E866CDACBCFDACBCF
              4E3E1EC47122C471224E3E1EDACBCF7B80817C8180DACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDA
              CBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF4E3E1EC47122C471224E3E1E
              DACBCF7B80817C8180DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDA
              CBCFDACBCFDACBCF4E3E1EC47122C471224E3E1EDACBCF7B80817C8180DACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF8E866C4E
              3E1E4E3E1E8E866CDACBCF7B80817D8281DACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF7B
              80817C8180DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF7B80817C8180DACBCFDACBCFDA
              CBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCF7B80817B8180DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDA
              CBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF758181FF00
              FF7E8080DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDA
              CBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCF808080FF00FFFF00FFFF00FF7980837980837781
              8177818179808379808377818177818179808379808379808377818177818179
              8083798083778083778083798083798083778181778181798083798083748082
              FF00FFFF00FF}
            Disabled.Data = {
              C2070000424DC20700000000000036000000280000001C000000170000000100
              1800000000008C070000120B0000120B00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FF7D7D7D3636363636367D7D7DFF00FFFF00FF7D7D7D36363636
              36367D7D7DFF00FFFF00FF7D7D7D3636363636367D7D7DFF00FFFF00FF7D7D7D
              3636363636367D7D7DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF363636BBBB
              BBBBBBBB363636FF00FFFF00FF363636BBBBBBBBBBBB363636FF00FFFF00FF36
              3636BBBBBBBBBBBB363636FF00FFFF00FF363636BBBBBBBBBBBB363636FF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF363636BBBBBBBBBBBB363636FF00FFFF00
              FF363636BBBBBBBBBBBB363636FF00FFFF00FF363636BBBBBBBBBBBB363636FF
              00FFFF00FF363636BBBBBBBBBBBB363636FF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FF7D7D7D3636363636367D7D7DFF00FFFF00FF363636BBBBBBBBBBBB3636
              36FF00FFFF00FF363636BBBBBBBBBBBB363636FF00FFFF00FF363636BBBBBBBB
              BBBB363636FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FF363636BBBBBBBBBBBB363636FF00FFFF00FF363636BBBB
              BBBBBBBB363636FF00FFFF00FF363636BBBBBBBBBBBB363636FF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF363636
              BBBBBBBBBBBB363636FF00FFFF00FF363636BBBBBBBBBBBB363636FF00FFFF00
              FF363636BBBBBBBBBBBB363636FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FF7D7D7D3636363636367D7D7DFF00FF
              FF00FF363636BBBBBBBBBBBB363636FF00FFFF00FF363636BBBBBBBBBBBB3636
              36FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF363636BBBBBBBBBBBB
              363636FF00FFFF00FF363636BBBBBBBBBBBB363636FF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FF363636BBBBBBBBBBBB363636FF00FFFF00FF363636
              BBBBBBBBBBBB363636FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7D
              7D7D3636363636367D7D7DFF00FFFF00FF363636BBBBBBBBBBBB363636FF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FF363636BBBBBBBBBBBB363636FF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF363636BBBBBBBB
              BBBB363636FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FF7D7D7D3636363636367D7D7DFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FF}
            State = sNormal
            Enabled = True
            CanBeDown = False
            Down = False
            Anchors = [akTop, akRight]
            ShowHint = True
            OnClick = btnMuteClick
          end
          object sbVolume: TSWSeekBar
            Left = 463
            Top = 25
            Width = 100
            Height = 17
            Cursor = crHandPoint
            Hint = 'Volume'
            MainBar.Data = {
              22030000424D220300000000000042000000280000005C000000040000000100
              100003000000E002000000000000000000000000000000000000007C0000E003
              00001F000000553ECE39CE39CE39CE39CE39CE39CE39CE39CE39CE39CE39CE39
              CE39CE39CE39CE39CE39CE39CE39CE39CE39CE39CE39CE39CE39CE39CE39CE39
              CE39CE39CE39CE39CE39CE39CE39CE39CE39CE39CE39CE39CE39CE39CE39CE39
              CE39CE39CE39CE39CE39CE39CE39CE39CE39CE39CE39CE39CE39CE39CE39CE39
              CE39CE39CE39CE39CE39CE39CE39CE39CE39CE39CE39CE39CE39CE39CE39CE39
              CE39CE39CE39CE39CE39CE39CE39CE39CE39CE39CE39CE39CE39CE39553ECE39
              DE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7B
              DE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7B
              DE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7B
              DE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7B
              DE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7B
              DE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7BCE39CE39DE7BDE7BDE7BDE7B
              DE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7B
              DE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7B
              DE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7B
              DE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7B
              DE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7B
              DE7BDE7BDE7BDE7BDE7BDE7BCE39553ECE39CE39CE39CE39CE39CE39CE39CE39
              CE39CE39CE39CE39CE39CE39CE39CE39CE39CE39CE39CE39CE39CE39CE39CE39
              CE39CE39CE39CE39CE39CE39CE39CE39CE39CE39CE39CE39CE39CE39CE39CE39
              CE39CE39CE39CE39CE39CE39CE39CE39CE39CE39CE39CE39CE39CE39CE39CE39
              CE39CE39CE39CE39CE39CE39CE39CE39CE39CE39CE39CE39CE39CE39CE39CE39
              CE39CE39CE39CE39CE39CE39CE39CE39CE39CE39CE39CE39CE39CE39CE39CE39
              CE39CE39553E}
            Max = 100
            Position = 100
            Normal.Data = {
              E6010000424DE60100000000000036000000280000000C0000000C0000000100
              180000000000B001000000000000000000000000000000000000FF00FFFF00FF
              FF00FFA49E8C9680688B62448A6244866F58948E7CFF00FFFF00FFFF00FFFF00
              FFFF00FF9680689E5A4191451E7B5D357E5C237E3A227A4735746E5CFF00FFFF
              00FFFF00FF876F588E6C33B54D2AB05A3DCAAD84CAAD848F5433A33F1C694126
              876F58FF00FF967468BF5E4CA16C2EC85B279B8855FFFFFFFFFFFF9E4E41B357
              1F91461E7E4423967468919190D76037B5702CC85B27918D57FFFFFFFFFFFF9E
              5A41B24E1F91461E7E4522795136977F69D97637B5702CB6632B9B7D54FFFFFF
              FFFFFFB34D1FB24E1F91461E91461E674339BB8675E07D4EB5702CB26C1FB17C
              3DFFFFFFFFFFFFB5582CB24E1FA5541D91461E794736A68478D0915DC4743BB3
              6C1FAE8051FFFFFFFFFFFFA0612DA0612DA1552D91461E775448A0A1A0D0915D
              D48F4BC5743A9A7E54FFFFFFFFFFFFA1612EC850278F5F327B5235967568FF00
              FFCAAD84D0905CD77537AF8B51CAAD84CAAD84A0612DA1602D8A4B44967568FF
              00FFFF00FFFF00FFCDA072D0915DD78137C4743C9B72549E65418B6D4594827B
              FF00FFFF00FFFF00FFFF00FFFF00FFB4AD9BBE9062C0814DAF7452977F68A393
              8BFF00FFFF00FFFF00FF}
            Disabled.Data = {
              E6010000424DE60100000000000036000000280000000C0000000C0000000100
              180000000000B0010000C30E0000C30E00000000000000000000FF00FFFF00FF
              FF00FF9C9C9C8282826B6B6B6B6B6B7373738B8B8BFF00FFFF00FFFF00FFFF00
              FFFF00FF8282826B6B6B5B5B5B6262625F5F5F4E4E4E5555556C6C6CFF00FFFF
              00FFFF00FF7373736F6F6F6B6B6B737373AAAAAAAAAAAA6363635C5C5C4D4D4D
              737373FF00FF7C7C7C7C7C7C767676787878868686FFFFFFFFFFFF6666666F6F
              6F5B5B5B5454547C7C7C8E8E8E8282827D7D7D7878787F7F7FFFFFFFFFFFFF6B
              6B6B6969697070705353535B5B5B8383838E8E8E7D7D7D7878787F7F7FFFFFFF
              FFFFFF6969697070707070705B5B5B4F4F4F9393939797977D7D7D7B7B7B8585
              85FFFFFFFFFFFF7171716F6F6F6868685B5B5B5555558C8C8C9E9E9E8686867C
              7C7C878787FFFFFFFFFFFF6F6F6F6F6F6F6A6A6A5B5B5B5E5E5E9E9E9E9D9D9D
              9C9C9C878787808080FFFFFFFFFFFF7070707373736868685C5C5C7C7C7CFF00
              FFAFAFAF9D9D9D8D8D8D8D8D8DAAAAAAAAAAAA6F6F6F6F6F6F5F5F5F7D7D7DFF
              00FFFF00FFFF00FFA7A7A79E9E9E9494948686867A7A7A727272707070858585
              FF00FFFF00FFFF00FFFF00FFFF00FFAAAAAA9797978F8F8F8181818282829595
              95FF00FFFF00FFFF00FF}
            Enabled = True
            FillColor = 10329501
            DisabledFillColor = 12303291
            BckgrColor = clBtnFace
            SeekBarVPos = 0
            Anchors = [akTop, akRight]
            ShowHint = True
            OnMouseDown = sbVolumeMouseDown
            OnMouseMove = sbVolumeMouseMove
            OnMouseEnter = sbVolumeMouseEnter
            OnMouseLeave = sbVolumeMouseLeave
          end
          object sbSeekBar: TSWSeekBar
            Left = 5
            Top = 3
            Width = 687
            Height = 17
            Cursor = crHandPoint
            MainBar.Data = {
              C2070000424DC20700000000000036000000280000005C000000070000000100
              1800000000008C07000000000000000000000000000000000000AD947B737373
              7373737373737373737373737373737373737373737373737373737373737373
              7373737373737373737373737373737373737373737373737373737373737373
              7373737373737373737373737373737373737373737373737373737373737373
              7373737373737373737373737373737373737373737373737373737373737373
              7373737373737373737373737373737373737373737373737373737373737373
              7373737373737373737373737373737373737373737373737373737373737373
              7373737373737373737373737373737373737373737373737373737373737373
              7373737373737373737373737373737373737373737373737373737373737373
              7373737373737373737373AD947B737373F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4
              F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3
              F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8
              F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4
              F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3
              F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8
              F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4
              F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3
              F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F473
              7373737373F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4
              F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3
              F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8
              F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4
              F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3
              F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8
              F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4
              F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3
              F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4737373737373F8F3F4F8F3F4F8
              F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4
              F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3
              F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8
              F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4
              F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3
              F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8
              F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4
              F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3
              F4F8F3F4F8F3F4737373737373F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8
              F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4
              F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3
              F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8
              F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4
              F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3
              F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8
              F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4
              F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F47373737373
              73F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8
              F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4
              F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3
              F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8
              F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4
              F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3
              F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8
              F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4
              F8F3F4F8F3F4F8F3F4F8F3F4F8F3F4737373AD947B7373737373737373737373
              7373737373737373737373737373737373737373737373737373737373737373
              7373737373737373737373737373737373737373737373737373737373737373
              7373737373737373737373737373737373737373737373737373737373737373
              7373737373737373737373737373737373737373737373737373737373737373
              7373737373737373737373737373737373737373737373737373737373737373
              7373737373737373737373737373737373737373737373737373737373737373
              7373737373737373737373737373737373737373737373737373737373737373
              7373737373737373737373737373737373737373737373737373737373737373
              737373AD947B}
            Max = 1000
            Normal.Data = {
              06030000424D060300000000000036000000280000000D000000120000000100
              180000000000D002000000000000000000000000000000000000FF00FFDD6946
              C76A5BAC623E8554459C5430886834894833855445895333917A65745248FF00
              FF00A08874DE8045DD6946BC793BCE66379A9665CFB38EA6644FBF57299B5430
              89533389533374524800C18F80E3875EDE8045BC793BBC6E3AA58762FFFFFFC0
              56299B54309B54309B543074524885544500AD8F84D69A6AE3875EBC793BBF77
              29BA884CFFFFFFBC653BAC623EAE5E2C9B543085544582625600A6A7A6D69A6A
              D69A6ACA7E48C07729B58B5FFFFFFFAA6E3E986A41AC623E9B54308262569F7F
              7300FF00FFA6A7A6D69A6ADA9759CC7E49A38762FFFFFFAA6E3E986A41986A41
              8660459F7F73FF00FF00FF00FFFF00FFCFB38ED79A69DD7F46B5935EFFFFFFAA
              6E3EAC6E3E9459539F7F73FF00FFFF00FF00FF00FFFF00FFFF00FFD3A77DD69A
              6ADD8A46CFB38EA66F4F9579549E8C86FF00FFFF00FFFF00FF00FF00FFFF00FF
              FF00FFFF00FFBBB5A3C4986EB67E60A18973A99B95FF00FFFF00FFFF00FFFF00
              FF00FF00FFFF00FFFF00FFFF00FFFF00FFBBB5A3CFB38EA99B95FF00FFFF00FF
              FF00FFFF00FFFF00FF00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FF00FF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FF00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FF00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FF00FF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FF00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FF00}
            Disabled.Data = {
              06030000424D060300000000000036000000280000000D000000120000000100
              180000000000D0020000C30E0000C30E00000000000000000000FF00FFA2A2A2
              A2A2A29999998686866A6A6A5F5F5F5F5F5F6969697E7E7E8686865F5F5FFF00
              FF009A9A9AA2A2A2A2A2A28686869090908C8C8CA8A8A88686867C7C7C7E7E7E
              5F5F5F5F5F5F5F5F5F00B5B5B5B4B4B4A2A2A2868686878787909090FFFFFF7E
              7E7E7C7C7C7C7C7C6969695F5F5F69696900ABABABB5B5B5B4B4B48686867C7C
              7C909090FFFFFF86868673737374747469696969696973737300BCBCBCB5B5B5
              B5B5B59999997E7E7E999999FFFFFF7C7C7C7C7C7C7C7C7C6969697373739999
              9900FF00FFBCBCBCB4B4B4ABABAB999999909090FFFFFF7C7C7C909090737373
              696969999999FF00FF00FF00FFFF00FFC4C4C4B4B4B4A2A2A2999999FFFFFF7C
              7C7C7C7C7C7C7C7C999999FF00FFFF00FF00FF00FFFF00FFFF00FFBCBCBCB5B5
              B5A2A2A2C8C8C88686867E7E7EA2A2A2FF00FFFF00FFFF00FF00FF00FFFF00FF
              FF00FFFF00FFC4C4C4ABABAB9A9A9A999999B4B4B4FF00FFFF00FFFF00FFFF00
              FF00FF00FFFF00FFFF00FFFF00FFFF00FFC4C4C4C4C4C4B4B4B4FF00FFFF00FF
              FF00FFFF00FFFF00FF00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FF00FF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FF00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FF00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FF00FF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FF00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FF00}
            Enabled = True
            FillColor = 10329501
            DisabledFillColor = 12303291
            BckgrColor = clBtnFace
            SeekBarVPos = -2
            Anchors = [akLeft, akTop, akRight]
            OnMouseDown = sbSeekBarMouseDown
            OnMouseUp = sbSeekBarMouseUp
            OnMouseMove = sbSeekBarMouseMove
            OnMouseEnter = sbSeekBarMouseEnter
            OnMouseLeave = sbSeekBarMouseLeave
            OnRepaintSeekbar = sbSeekBarRepaintSeekbar
          end
          object btnPause: TSWButton
            Left = 6
            Top = 21
            Width = 25
            Height = 25
            Normal.Data = {
              AE060000424DAE06000000000000360000002800000017000000170000000100
              1800000000007806000000000000000000000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FF7142
              136E4013653A115D351059330F59330F59330F59330F59330F59330F59330F59
              330F5A340F5A340F4C2B0DFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FF9154199C58229B5B1B94561A8D5218894F18854D17834D17844D17854D
              17854D17844D17854D17895018804B16693A194C2C0DFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFA9621DB96B20BE6E21B4681FAF651EAC641EA6611D
              A25F1CA05E1CA15E1CA15E1CA25E1CA25E1CA6611DA25E1C804B165A340FFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB2681FC47222C77322BD6E21B8
              6B21B4681FAF661EAA621DA6611DA25E1CA15E1CA25E1CA25D1CA7611DA7611D
              8950185A340FFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB66A20C775
              26C97626C07224BB6D22B76A20B3681FAE651EA9621DA25E1C9D5B1B9D5B1B9D
              5B1BA25E1CA25E1C854D1759330FFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FFB66A20CD7D30D38233C97829C27225BD6E21F8F0E9F8F0E9AD641EF6F0
              E9F6EFE9A05D1C9E5B1BA25D1CA25E1C844D1759330FFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFB66A20D18740D98C43D07F31CA7929C47323F9F1EA
              F8F1E9B2671FF7F0E9F6F0E9A7611DA15E1CA25D1CA15D1C844D1759330FFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB66A20D69657DD9A58D28439CF
              7D2DCC7827F9F1E9F8F0E9BB6C20F8F0E9F7F0E9A8611DA7611DA8621DA35E1C
              854C1759330FFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB66A20D9A1
              69E0A56BD3883FD18031D07E2DFAF1E9F9F1E9C47222F8F0E9F8F0E9AF651EAE
              651EAF651EA8611D894F1859330FFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FFB66A20DBA774E2AC76D48C45D28337D28335FAF2EAFAF1E9CB7724F9F1
              E9F8F0E9BC6D21B4681FB5691FAE651E8F54195A340FFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFB66A20DDAB7BE4B07DD7924ED58B42D3873DFAF2EB
              FAF2EAD17D2AFAF1E9F9F1E9C57222BA6C20BB6C20B66A2097581A623911FF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB66A20DEAE7FE6B584D99757D6
              904AD58B41FBF3ECFAF2EBD18030FAF2EAFAF1E9CA7523C47222C47122BD6E21
              9F5D1C6E4013FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB66A20DFB1
              86E9BD93DC9D60D7904CD68F48D48940D28337D28235D18031D07C2ACD7724CA
              7523C97523C37122A7611D7A4715FF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FFB66A20E0B48BEECBA9E3B384DFA76FDCA268DA9B5DD79351D68F4AD388
              3FD18031CF7B28CE7825CF7924CA7523AF651E864E17FF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFB66A20E0B081F2D4B5EECDADECC7A3EAC199E7B98D
              E3AF7CE0A46ADB9652D6883BD3802ED37B27D67C25D37B25B96B20915419FF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB76A20D49360E3B68BE4BE98E4
              BE98E3BA91E0B388DDAC7BD99F66D48F4DD0843ACD7C2CCB7726CF7824CC7623
              B869269A5A1BFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFBD77
              34C4864AC4884CC4884CC28446C07E3FC18142BF7B3ABB742FB96F27B76C23B7
              6C23B66A21B76B20AB631EFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF000000}
            MouseOver.Data = {
              AE060000424DAE06000000000000360000002800000017000000170000000100
              18000000000078060000120B0000120B00000000000000000000FF00FFFF00FF
              7981817981817882827781817980837980837782807782807980837980837781
              81778181798083798083778181778181787F82798083748082FF00FFFF00FF00
              0000FF00FF7E8081F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EB808080FF00FF0000007B8081F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7
              E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EB758181000000808080F7E7EBF7E7EBF7E7EB7142
              136E4013653A115D351059330F59330F59330F59330F59330F59330F59330F59
              330F5A340F5A340F4C2B0DF7E7EBF7E7EBF7E7EB7B8081000000808080F7E7EB
              F7E7EB9154199C5D219B5B1B94561A8D5218894F18854D17834D17844D17854D
              17854D17844D17854D17895018804B16693F184C2C0DF7E7EBF7E7EB7B808100
              00007F7F7FF7E7EBF7E7EBA9621DB96B20BE6E21B4681FAF651EAC641EA6611D
              A25F1CA05E1CA15E1CA15E1CA25E1CA25E1CA6611DA25E1C804B165A340FF7E7
              EBF7E7EB7B80810000007C8180F7E7EBF7E7EBB2681FC47222C77322BD6E21B8
              6B21B4681FAF661EAA621DA6611DA25E1CA15E1CA25E1CA25D1CA7611DA7611D
              8950185A340FF7E7EBF7E7EB7B7F840000007C8180F7E7EBF7E7EBB66A20C775
              26C97626C07224BB6D22B76A20B3681FAE651EA9621DA25E1C9D5B1B9D5B1B9D
              5B1BA25E1CA25E1C854D1759330FF7E7EBF7E7EB7B7F840000007B8180F7E7EB
              F7E7EBB66A20CD7D30D38233C97829C27225BD6E21F8F0E9F8F0E9AD641EF6F0
              E9F6EFE9A05D1C9E5B1BA25D1CA25E1C844D1759330FF7E7EBF7E7EB7B808100
              00007B8180F7E7EBF7E7EBB66A20D18740D98C43D07F31CA7929C47323F9F1EA
              F8F1E9B2671FF7F0E9F6F0E9A7611DA15E1CA25D1CA15D1C844D1759330FF7E7
              EBF7E7EB7B80810000007D8281F7E7EBF7E7EBB66A20D69657DD9A58D28439CF
              7D2DCC7827F9F1E9F8F0E9BB6C20F8F0E9F7F0E9A8611DA7611DA8621DA35E1C
              854C1759330FF7E7EBF7E7EB7B80810000007C8180F7E7EBF7E7EBB66A20D9A1
              69E0A56BD3883FD18031D07E2DFAF1E9F9F1E9C47222F8F0E9F8F0E9AF651EAE
              651EAF651EA8611D894F1859330FF7E7EBF7E7EB7B80810000007C8081F7E7EB
              F7E7EBB66A20DBA774E2AC76D48C45D28337D28335FAF2EAFAF1E9CB7724F9F1
              E9F8F0E9BC6D21B4681FB5691FAE651E8F54195A340FF7E7EBF7E7EB7B808100
              00007B7F80F7E7EBF7E7EBB66A20DDAB7BE4B07DD7924ED58B42D3873DFAF2EB
              FAF2EAD17D2AFAF1E9F9F1E9C57222BA6C20BB6C20B66A2097581A623911F7E7
              EBF7E7EB7B80810000007C8180F7E7EBF7E7EBB66A20DEAE7FE6B584D99757D6
              904AD58B41FBF3ECFAF2EBD18030FAF2EAFAF1E9CA7523C47222C47122BD6E21
              9F5D1C6E4013F7E7EBF7E7EB7B80810000007C8180F7E7EBF7E7EBB66A20DFB1
              86E9BD93DC9D60D7904CD68F48D48940D28337D28235D18031D07C2ACD7724CA
              7523C97523C37122A7611D7A4715F7E7EBF7E7EB7B80810000007C8180F7E7EB
              F7E7EBB66A20E0B48BEECBA9E3B384DFA76FDCA268DA9B5DD79351D68F4AD388
              3FD18031CF7B28CE7825CF7924CA7523AF651E864E17F7E7EBF7E7EB7B808100
              00007D8281F7E7EBF7E7EBB66A20E0B081F2D4B5EECDADECC7A3EAC199E7B98D
              E3AF7CE0A46ADB9652D6883BD3802ED37B27D67C25D37B25B96B20915419F7E7
              EBF7E7EB7B80810000007C8180F7E7EBF7E7EBB76A20D3995FE3B68BE4BE98E4
              BE98E3BA91E0B388DDAC7BD99F66D48F4DD0843ACD7C2CCB7726CF7824CC7623
              B86E269A5A1BF7E7EBF7E7EB7B80810000007C8180F7E7EBF7E7EBF7E7EBBD77
              34C4864AC4884CC4884CC28446C07E3FC18142BF7B3ABB742FB96F27B76C23B7
              6C23B66A21B76B20AB631EF7E7EBF7E7EBF7E7EB7B80810000007B8180F7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB75818100
              0000FF00FF7E8080F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EB808080FF00FF000000FF00FFFF00FF79808379808377818177818179808379
              8083778181778181798083798083778083778083798083798083778181778181
              798083798083748082FF00FFFF00FF000000}
            Pressed.Data = {
              AE060000424DAE06000000000000360000002800000017000000170000000100
              18000000000078060000120B0000120B00000000000000000000FF00FFFF00FF
              7981817981817882827781817980837980837782807782807980837980837781
              81778181798083798083778181778181787F82798083748082FF00FFFF00FF00
              0000FF00FF7E8081DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CF808080FF00FF0000007B8081DACBCFDACBCFDACBCFDACBCF7142136E401365
              3A115D351059330F59330F59330F59330F59330F59330F59330F59330F5A340F
              5A340F4C2B0DDACBCFDACBCF758181000000808080DACBCFDACBCFDACBCF9154
              199B5D209B5B1B94561A8D5218894F18854D17834D17844D17854D17854D1784
              4D17854D17895018804B16683F174C2C0DDACBCF7B80810000007F7F7FDACBCF
              DACBCFDACBCFA9621DB96B20BE6E21B4681FAF651EAC641EA6611DA25F1CA05E
              1CA15E1CA15E1CA25E1CA25E1CA6611DA25E1C804B165A340FDACBCF7B808100
              00007C8180DACBCFDACBCFDACBCFB2681FC47222C77322BD6E21B86B21B4681F
              AF661EAA621DA6611DA25E1CA15E1CA25E1CA25D1CA7611DA7611D8950185A34
              0FDACBCF7B7F840000007C8180DACBCFDACBCFDACBCFB66A20C77526C97626C0
              7224BB6D22B76A20B3681FAE651EA9621DA25E1C9D5B1B9D5B1B9D5B1BA25E1C
              A25E1C854D1759330FDACBCF7B7F840000007B8180DACBCFDACBCFDACBCFB66A
              20CD7D30D38233C97829C27225BD6E21F8F0E9F8F0E9AD641EF6F0E9F6EFE9A0
              5D1C9E5B1BA25D1CA25E1C844D1759330FDACBCF7B80810000007B8180DACBCF
              DACBCFDACBCFB66A20D18740D98C43D07F31CA7929C47323F9F1EAF8F1E9B267
              1FF7F0E9F6F0E9A7611DA15E1CA25D1CA15D1C844D1759330FDACBCF7B808100
              00007D8281DACBCFDACBCFDACBCFB66A20D69657DD9A58D28439CF7D2DCC7827
              F9F1E9F8F0E9BB6C20F8F0E9F7F0E9A8611DA7611DA8621DA35E1C854C175933
              0FDACBCF7B80810000007D8281DACBCFDACBCFDACBCFB66A20D9A169E0A56BD3
              883FD18031D07E2DFAF1E9F9F1E9C47222F8F0E9F8F0E9AF651EAE651EAF651E
              A8611D894F1859330FDACBCF7B80810000007C8180DACBCFDACBCFDACBCFB66A
              20DBA774E2AC76D48C45D28337D28335FAF2EAFAF1E9CB7724F9F1E9F8F0E9BC
              6D21B4681FB5691FAE651E8F54195A340FDACBCF7B80810000007C8081DACBCF
              DACBCFDACBCFB66A20DDAB7BE4B07DD7924ED58B42D3873DFAF2EBFAF2EAD17D
              2AFAF1E9F9F1E9C57222BA6C20BB6C20B66A2097581A623911DACBCF7B808100
              00007B7F80DACBCFDACBCFDACBCFB66A20DEAE7FE6B584D99757D6904AD58B41
              FBF3ECFAF2EBD18030FAF2EAFAF1E9CA7523C47222C47122BD6E219F5D1C6E40
              13DACBCF7B80810000007C8180DACBCFDACBCFDACBCFB66A20DFB186E9BD93DC
              9D60D7904CD68F48D48940D28337D28235D18031D07C2ACD7724CA7523C97523
              C37122A7611D7A4715DACBCF7B80810000007C8180DACBCFDACBCFDACBCFB66A
              20E0B48BEECBA9E3B384DFA76FDCA268DA9B5DD79351D68F4AD3883FD18031CF
              7B28CE7825CF7924CA7523AF651E864E17DACBCF7B80810000007C8180DACBCF
              DACBCFDACBCFB66A20E0B081F2D4B5EECDADECC7A3EAC199E7B98DE3AF7CE0A4
              6ADB9652D6883BD3802ED37B27D67C25D37B25B96B20915419DACBCF7B808100
              00007D8281DACBCFDACBCFDACBCFB76A20D2985EE3B68BE4BE98E4BE98E3BA91
              E0B388DDAC7BD99F66D48F4DD0843ACD7C2CCB7726CF7824CC7623B76D259A5A
              1BDACBCF7B80810000007C8180DACBCFDACBCFDACBCFDACBCFBD7734C4864AC4
              884CC4884CC28446C07E3FC18142BF7B3ABB742FB96F27B76C23B76C23B66A21
              B76B20AB631EDACBCFDACBCF7B80810000007C8180DACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDA
              CBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF7B80810000007B8180DACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF75818100
              0000FF00FF7E8080DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CF808080FF00FF000000FF00FFFF00FF79808379808377818177818179808379
              8083778181778181798083798083778083778083798083798083778181778181
              798083798083748082FF00FFFF00FF000000}
            Disabled.Data = {
              AE060000424DAE06000000000000360000002800000017000000170000000100
              18000000000078060000120B0000120B00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FF5252
              525151514A4A4A43434341414141414141414141414141414141414141414141
              4141424242424242383838FF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FF6A6A6A726F6D7171716C6C6C6767676464646161616060606060606161
              616161616060606161616464645E5E5E4C4948383838FF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FF7B7B7B8787878B8B8B8484848080807E7E7E797979
              7676767575757575757575757676767676767979797676765E5E5E424242FF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FF8282828F8F8F9292928A8A8A87
              87878484848080807D7D7D7979797676767575757676767676767A7A7A7A7A7A
              646464424242FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FF8585859393
              939595958E8E8E8A8A8A8585858383837F7F7F7B7B7B76767673737373737373
              7373767676767676616161414141FF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FF8585859D9D9DA2A2A29696969090908A8A8AF3F3F3F3F3F37F7F7FF2F2
              F2F2F2F2757575747474767676767676606060414141FF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FF858585A9A9A9AEAEAEA0A0A09696968F8F8FF4F4F4
              F3F3F3828282F2F2F2F2F2F27A7A7A757575767676757575606060414141FF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FF858585B7B7B7BBBBBBA5A5A59C
              9C9C979797F4F4F4F4F4F4898989F3F3F3F3F3F37B7B7B7A7A7A7A7A7A787878
              616161414141FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FF858585C2C2
              C2C6C6C6A9A9A9A0A0A09D9D9DF5F5F5F4F4F48F8F8FF4F4F4F3F3F38080807F
              7F7F8080807B7B7B646464414141FF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FF858585C9C9C9CCCCCCADADADA4A4A4A2A2A2F5F5F5F5F5F5949494F4F4
              F4F4F4F48989898484848484847F7F7F696969424242FF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FF858585CCCCCCD1D1D1B2B2B2ABABABA7A7A7F6F6F6
              F6F6F69B9B9BF5F5F5F5F5F59090908888888989898585856F6F6F474747FF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FF858585CECECED4D4D4B9B9B9B0
              B0B0ABABABF6F6F6F6F6F69E9E9EF5F5F5F5F5F59494948F8F8F8F8F8F8A8A8A
              747474515151FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FF858585D3D3
              D3DCDCDCBFBFBFB2B2B2AFAFAFAAAAAAA4A4A4A2A2A2A0A0A09B9B9B96969694
              94949393938E8E8E7A7A7A5A5A5AFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FF858585D4D4D4E6E6E6D3D3D3C8C8C8C3C3C3BDBDBDB5B5B5B0B0B0A9A9
              A9A0A0A0999999979797969696939393808080626262FF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FF858585D0D0D0EBEBEBE8E8E8E3E3E3DEDEDED9D9D9
              D0D0D0C6C6C6B7B7B7A7A7A79E9E9E9B9B9B9C9C9C9A9A9A8888886A6A6AFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FF858585BAB7B4D6D6D6DCDCDCDC
              DCDCD9D9D9D3D3D3CCCCCCC1C1C1B1B1B1A4A4A49A9A9A959595969696959595
              888481707070FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FF9595
              95A6A6A6A7A7A7A7A7A7A3A3A39E9E9EA0A0A09A9A9A9292928B8B8B88888888
              88888787878585857D7D7DFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF000000}
            State = sNormal
            Enabled = True
            CanBeDown = False
            Down = False
            Visible = False
            ShowHint = True
            OnClick = btnPlayClick
          end
          object btnPlay: TSWButton
            Left = 6
            Top = 21
            Width = 25
            Height = 25
            Normal.Data = {
              AE060000424DAE06000000000000360000002800000017000000170000000100
              1800000000007806000000000000000000000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FF7142
              136E4013653A115D351059330F59330F59330F59330F59330F59330F59330F59
              330F5A340F5A340F4C2B0DFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FF9154199C58229B5B1B94561A8D5218894F18854D17834D17844D17854D
              17854D17844D17854D17895018804B16693A194C2C0DFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFA9621DB96B20BE6E21B4681FAF651EAC641EA6611D
              A25F1CA05E1CA15E1CA15E1CA25E1CA25E1CA6611DA25E1C804B165A340FFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB2681FC47222C77322BD6E21B8
              6B21B4681FAF661EAA621DA6611DA25E1CA15E1CA25E1CA25D1CA7611DA7611D
              8950185A340FFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB66A20C775
              26C97626C07224BB6D22B76A20B3681FBA7B3EA9621DA25E1C9D5B1B9D5B1B9D
              5B1BA25E1CA25E1C854D1759330FFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FFB66A20CD7D30D38233C97829C27225BD6E21B66A20FFFEFEB97B3EA862
              1DA35E1CA05D1C9E5B1BA25D1CA25E1C844D1759330FFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFB66A20D18740D98C43D07F31CA7929C47323C07227
              FDFAF8FFFEFEB87B3EA8621DA7611DA15E1CA25D1CA15D1C844D1759330FFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB66A20D69657DD9A58D28439CF
              7D2DCC7827C77525FCF8F4FDFAF8FFFEFED2A67CA8611DA7611DA8621DA35E1C
              854C1759330FFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB66A20D9A1
              69E0A56BD3883FD18031D07E2DCC7623FCF8F4FCF8F4FDFBFAFFFFFFC79462AE
              651EAF651EA8611D894F1859330FFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FFB66A20DBA774E2AC76D48C45D28337D28335D07C2AFCF8F4FDFAF7FFFE
              FEE0B993BC6D21B4681FB5691FAE651E8F54195A340FFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFB66A20DDAB7BE4B07DD7924ED58B42D3873DD28336
              FEFBF8FFFEFED7924ECB7623C57222BA6C20BB6C20B66A2097581A623911FF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB66A20DEAE7FE6B584D99757D6
              904AD58B41D3873DFFFFFED99756D07C2BCE7825CA7523C47222C47122BD6E21
              9F5D1C6E4013FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB66A20DFB1
              86E9BD93DC9D60D7904CD68F48D48940DA9B5DD28235D18031D07C2ACD7724CA
              7523C97523C37122A7611D7A4715FF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FFB66A20E0B48BEECBA9E3B384DFA76FDCA268DA9B5DD79351D68F4AD388
              3FD18031CF7B28CE7825CF7924CA7523AF651E864E17FF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFB66A20E0B081F2D4B5EECDADECC7A3EAC199E7B98D
              E3AF7CE0A46ADB9652D6883BD3802ED37B27D67C25D37B25B96B20915419FF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB76A20D49360E3B68BE4BE98E4
              BE98E3BA91E0B388DDAC7BD99F66D48F4DD0843ACD7C2CCB7726CF7824CC7623
              B869269A5A1BFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFBD77
              34C4864AC4884CC4884CC28446C07E3FC18142BF7B3ABB742FB96F27B76C23B7
              6C23B66A21B76B20AB631EFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF000000}
            MouseOver.Data = {
              AE060000424DAE06000000000000360000002800000017000000170000000100
              18000000000078060000120B0000120B00000000000000000000FF00FFFF00FF
              7981817981817882827781817980837980837782807782807980837980837781
              81778181798083798083778181778181787F82798083748082FF00FFFF00FF00
              0000FF00FF7E8081F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EB808080FF00FF0000007B8081F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7
              E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EB758181000000808080F7E7EBF7E7EBF7E7EB7142
              136E4013653A115D351059330F59330F59330F59330F59330F59330F59330F59
              330F5A340F5A340F4C2B0DF7E7EBF7E7EBF7E7EB7B8081000000808080F7E7EB
              F7E7EB9154199C5D219B5B1B94561A8D5218894F18854D17834D17844D17854D
              17854D17844D17854D17895018804B16693F184C2C0DF7E7EBF7E7EB7B808100
              00007F7F7FF7E7EBF7E7EBA9621DB96B20BE6E21B4681FAF651EAC641EA6611D
              A25F1CA05E1CA15E1CA15E1CA25E1CA25E1CA6611DA25E1C804B165A340FF7E7
              EBF7E7EB7B80810000007C8180F7E7EBF7E7EBB2681FC47222C77322BD6E21B8
              6B21B4681FAF661EAA621DA6611DA25E1CA15E1CA25E1CA25D1CA7611DA7611D
              8950185A340FF7E7EBF7E7EB7B7F840000007C8180F7E7EBF7E7EBB66A20C775
              26C97626C07224BB6D22B76A20B3681FBA7B3EA9621DA25E1C9D5B1B9D5B1B9D
              5B1BA25E1CA25E1C854D1759330FF7E7EBF7E7EB7B7F840000007B8180F7E7EB
              F7E7EBB66A20CD7D30D38233C97829C27225BD6E21B66A20FFFEFEB97B3EA862
              1DA35E1CA05D1C9E5B1BA25D1CA25E1C844D1759330FF7E7EBF7E7EB7B808100
              00007B8180F7E7EBF7E7EBB66A20D18740D98C43D07F31CA7929C47323C07227
              FDFAF8FFFEFEB87B3EA8621DA7611DA15E1CA25D1CA15D1C844D1759330FF7E7
              EBF7E7EB7B80810000007D8281F7E7EBF7E7EBB66A20D69657DD9A58D28439CF
              7D2DCC7827C77525FCF8F4FDFAF8FFFEFED2A67CA8611DA7611DA8621DA35E1C
              854C1759330FF7E7EBF7E7EB7B80810000007C8180F7E7EBF7E7EBB66A20D9A1
              69E0A56BD3883FD18031D07E2DCC7623FCF8F4FCF8F4FDFBFAFFFFFFC79462AE
              651EAF651EA8611D894F1859330FF7E7EBF7E7EB7B80810000007C8081F7E7EB
              F7E7EBB66A20DBA774E2AC76D48C45D28337D28335D07C2AFCF8F4FDFAF7FFFE
              FEE0B993BC6D21B4681FB5691FAE651E8F54195A340FF7E7EBF7E7EB7B808100
              00007B7F80F7E7EBF7E7EBB66A20DDAB7BE4B07DD7924ED58B42D3873DD28336
              FEFBF8FFFEFED7924ECB7623C57222BA6C20BB6C20B66A2097581A623911F7E7
              EBF7E7EB7B80810000007C8180F7E7EBF7E7EBB66A20DEAE7FE6B584D99757D6
              904AD58B41D3873DFFFFFED99756D07C2BCE7825CA7523C47222C47122BD6E21
              9F5D1C6E4013F7E7EBF7E7EB7B80810000007C8180F7E7EBF7E7EBB66A20DFB1
              86E9BD93DC9D60D7904CD68F48D48940DA9B5DD28235D18031D07C2ACD7724CA
              7523C97523C37122A7611D7A4715F7E7EBF7E7EB7B80810000007C8180F7E7EB
              F7E7EBB66A20E0B48BEECBA9E3B384DFA76FDCA268DA9B5DD79351D68F4AD388
              3FD18031CF7B28CE7825CF7924CA7523AF651E864E17F7E7EBF7E7EB7B808100
              00007D8281F7E7EBF7E7EBB66A20E0B081F2D4B5EECDADECC7A3EAC199E7B98D
              E3AF7CE0A46ADB9652D6883BD3802ED37B27D67C25D37B25B96B20915419F7E7
              EBF7E7EB7B80810000007C8180F7E7EBF7E7EBB76A20D3995FE3B68BE4BE98E4
              BE98E3BA91E0B388DDAC7BD99F66D48F4DD0843ACD7C2CCB7726CF7824CC7623
              B86E269A5A1BF7E7EBF7E7EB7B80810000007C8180F7E7EBF7E7EBF7E7EBBD77
              34C4864AC4884CC4884CC28446C07E3FC18142BF7B3ABB742FB96F27B76C23B7
              6C23B66A21B76B20AB631EF7E7EBF7E7EBF7E7EB7B80810000007B8180F7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB75818100
              0000FF00FF7E8080F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EB808080FF00FF000000FF00FFFF00FF79808379808377818177818179808379
              8083778181778181798083798083778083778083798083798083778181778181
              798083798083748082FF00FFFF00FF000000}
            Pressed.Data = {
              AE060000424DAE06000000000000360000002800000017000000170000000100
              18000000000078060000120B0000120B00000000000000000000FF00FFFF00FF
              7981817981817882827781817980837980837782807782807980837980837781
              81778181798083798083778181778181787F82798083748082FF00FFFF00FF00
              0000FF00FF7E8081DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CF808080FF00FF0000007B8081DACBCFDACBCFDACBCFDACBCF7142136E401365
              3A115D351059330F59330F59330F59330F59330F59330F59330F59330F5A340F
              5A340F4C2B0DDACBCFDACBCF758181000000808080DACBCFDACBCFDACBCF9154
              199B5D209B5B1B94561A8D5218894F18854D17834D17844D17854D17854D1784
              4D17854D17895018804B16683F174C2C0DDACBCF7B80810000007F7F7FDACBCF
              DACBCFDACBCFA9621DB96B20BE6E21B4681FAF651EAC641EA6611DA25F1CA05E
              1CA15E1CA15E1CA25E1CA25E1CA6611DA25E1C804B165A340FDACBCF7B808100
              00007C8180DACBCFDACBCFDACBCFB2681FC47222C77322BD6E21B86B21B4681F
              AF661EAA621DA6611DA25E1CA15E1CA25E1CA25D1CA7611DA7611D8950185A34
              0FDACBCF7B7F840000007C8180DACBCFDACBCFDACBCFB66A20C77526C97626C0
              7224BB6D22B76A20B3681FBA7B3EA9621DA25E1C9D5B1B9D5B1B9D5B1BA25E1C
              A25E1C854D1759330FDACBCF7B7F840000007B8180DACBCFDACBCFDACBCFB66A
              20CD7D30D38233C97829C27225BD6E21B66A20FFFEFEB97B3EA8621DA35E1CA0
              5D1C9E5B1BA25D1CA25E1C844D1759330FDACBCF7B80810000007B8180DACBCF
              DACBCFDACBCFB66A20D18740D98C43D07F31CA7929C47323C07227FDFAF8FFFE
              FEB87B3EA8621DA7611DA15E1CA25D1CA15D1C844D1759330FDACBCF7B808100
              00007D8281DACBCFDACBCFDACBCFB66A20D69657DD9A58D28439CF7D2DCC7827
              C77525FCF8F4FDFAF8FFFEFED2A67CA8611DA7611DA8621DA35E1C854C175933
              0FDACBCF7B80810000007D8281DACBCFDACBCFDACBCFB66A20D9A169E0A56BD3
              883FD18031D07E2DCC7623FCF8F4FCF8F4FDFBFAFFFFFFC79462AE651EAF651E
              A8611D894F1859330FDACBCF7B80810000007C8180DACBCFDACBCFDACBCFB66A
              20DBA774E2AC76D48C45D28337D28335D07C2AFCF8F4FDFAF7FFFEFEE0B993BC
              6D21B4681FB5691FAE651E8F54195A340FDACBCF7B80810000007C8081DACBCF
              DACBCFDACBCFB66A20DDAB7BE4B07DD7924ED58B42D3873DD28336FEFBF8FFFE
              FED7924ECB7623C57222BA6C20BB6C20B66A2097581A623911DACBCF7B808100
              00007B7F80DACBCFDACBCFDACBCFB66A20DEAE7FE6B584D99757D6904AD58B41
              D3873DFFFFFED99756D07C2BCE7825CA7523C47222C47122BD6E219F5D1C6E40
              13DACBCF7B80810000007C8180DACBCFDACBCFDACBCFB66A20DFB186E9BD93DC
              9D60D7904CD68F48D48940DA9B5DD28235D18031D07C2ACD7724CA7523C97523
              C37122A7611D7A4715DACBCF7B80810000007C8180DACBCFDACBCFDACBCFB66A
              20E0B48BEECBA9E3B384DFA76FDCA268DA9B5DD79351D68F4AD3883FD18031CF
              7B28CE7825CF7924CA7523AF651E864E17DACBCF7B80810000007C8180DACBCF
              DACBCFDACBCFB66A20E0B081F2D4B5EECDADECC7A3EAC199E7B98DE3AF7CE0A4
              6ADB9652D6883BD3802ED37B27D67C25D37B25B96B20915419DACBCF7B808100
              00007D8281DACBCFDACBCFDACBCFB76A20D2985EE3B68BE4BE98E4BE98E3BA91
              E0B388DDAC7BD99F66D48F4DD0843ACD7C2CCB7726CF7824CC7623B76D259A5A
              1BDACBCF7B80810000007C8180DACBCFDACBCFDACBCFDACBCFBD7734C4864AC4
              884CC4884CC28446C07E3FC18142BF7B3ABB742FB96F27B76C23B76C23B66A21
              B76B20AB631EDACBCFDACBCF7B80810000007C8180DACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDA
              CBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF7B80810000007B8180DACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF75818100
              0000FF00FF7E8080DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CF808080FF00FF000000FF00FFFF00FF79808379808377818177818179808379
              8083778181778181798083798083778083778083798083798083778181778181
              798083798083748082FF00FFFF00FF000000}
            Disabled.Data = {
              AE060000424DAE06000000000000360000002800000017000000170000000100
              18000000000078060000120B0000120B00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FF5252
              525151514A4A4A43434341414141414141414141414141414141414141414141
              4141424242424242383838FF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FF6A6A6A726F6D7171716C6C6C6767676464646161616060606060606161
              616161616060606161616464645E5E5E4C4948383838FF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FF7B7B7B8787878B8B8B8484848080807E7E7E797979
              7676767575757575757575757676767676767979797676765E5E5E424242FF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FF8282828F8F8F9292928A8A8A87
              87878484848080807D7D7D7979797676767575757676767676767A7A7A7A7A7A
              646464424242FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FF8585859393
              939595958E8E8E8A8A8A8585858383839191917B7B7B76767673737373737373
              7373767676767676616161414141FF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FF8585859D9D9DA2A2A29696969090908A8A8A858585FFFFFF9191917A7A
              7A787878757575747474767676767676606060414141FF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FF858585A9A9A9AEAEAEA0A0A09696968F8F8F909090
              FBFBFBFFFFFF9090907A7A7A7A7A7A757575767676757575606060414141FF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FF858585B7B7B7BBBBBBA5A5A59C
              9C9C979797939393F9F9F9FBFBFBFFFFFFB6B6B67B7B7B7A7A7A7A7A7A787878
              616161414141FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FF858585C2C2
              C2C6C6C6A9A9A9A0A0A09D9D9D959595F9F9F9F9F9F9FDFDFDFFFFFFA6A6A67F
              7F7F8080807B7B7B646464414141FF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FF858585C9C9C9CCCCCCADADADA4A4A4A2A2A29B9B9BFAFAFAFBFBFBFFFF
              FFC8C8C88989898484848484847F7F7F696969424242FF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FF858585CCCCCCD1D1D1B2B2B2ABABABA7A7A7A3A3A3
              FCFCFCFFFFFFAAAAAA9494949090908888888989898585856F6F6F474747FF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FF858585CECECED4D4D4B9B9B9B0
              B0B0ABABABA7A7A7FFFFFFB0B0B09B9B9B9696969494948F8F8F8F8F8F8A8A8A
              747474515151FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FF858585D3D3
              D3DCDCDCBFBFBFB2B2B2AFAFAFAAAAAAB5B5B5A2A2A2A0A0A09B9B9B96969694
              94949393938E8E8E7A7A7A5A5A5AFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FF858585D4D4D4E6E6E6D3D3D3C8C8C8C3C3C3BDBDBDB5B5B5B0B0B0A9A9
              A9A0A0A0999999979797969696939393808080626262FF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FF858585D0D0D0EBEBEBE8E8E8E3E3E3DEDEDED9D9D9
              D0D0D0C6C6C6B7B7B7A7A7A79E9E9E9B9B9B9C9C9C9A9A9A8888886A6A6AFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FF858585BAB7B4D6D6D6DCDCDCDC
              DCDCD9D9D9D3D3D3CCCCCCC1C1C1B1B1B1A4A4A49A9A9A959595969696959595
              888481707070FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FF9595
              95A6A6A6A7A7A7A7A7A7A3A3A39E9E9EA0A0A09A9A9A9292928B8B8B88888888
              88888787878585857D7D7DFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF000000}
            State = sNormal
            Enabled = True
            CanBeDown = False
            Down = False
            ShowHint = True
            OnClick = btnPlayClick
          end
          object btnStop: TSWButton
            Left = 30
            Top = 21
            Width = 25
            Height = 25
            Normal.Data = {
              AE060000424DAE06000000000000360000002800000017000000170000000100
              1800000000007806000000000000000000000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FF7142
              136E4013653A115D351059330F59330F59330F59330F59330F59330F59330F59
              330F5A340F5A340F4C2B0DFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FF9154199C58229B5B1B94561A8D5218894F18854D17834D17844D17854D
              17854D17844D17854D17895018804B16693A194C2C0DFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFA9621DB96B20BE6E21B4681FAF651EAC641EA6611D
              A25F1CA05E1CA15E1CA15E1CA25E1CA25E1CA6611DA25E1C804B165A340FFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB2681FC47222C77322BD6E21B8
              6B21B4681FAF661EAA621DA6611DA25E1CA15E1CA25E1CA25D1CA7611DA7611D
              8950185A340FFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB66A20C775
              26C97626C07224BB6D22B76A20B3681FAE651EA9621DA25E1C9D5B1B9D5B1B9D
              5B1BA25E1CA25E1C854D1759330FFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FFB66A20CD7D30D38233C97829C27225BD6E21B66A20B3681FAD641EA862
              1DA35E1CA05D1C9E5B1BA25D1CA25E1C844D1759330FFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFB66A20D18740D98C43D07F31CA7929C47323FFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFA7611DA15E1CA25D1CA15D1C844D1759330FFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB66A20D69657DD9A58D28439CF
              7D2DCC7827FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA8611DA7611DA8621DA35E1C
              854C1759330FFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB66A20D9A1
              69E0A56BD3883FD18031D07E2DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAF651EAE
              651EAF651EA8611D894F1859330FFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FFB66A20DBA774E2AC76D48C45D28337D28335FFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFBC6D21B4681FB5691FAE651E8F54195A340FFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFB66A20DDAB7BE4B07DD7924ED58B42D3873DFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFC57222BA6C20BB6C20B66A2097581A623911FF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB66A20DEAE7FE6B584D99757D6
              904AD58B41D3873DD28335D18030D07C2BCE7825CA7523C47222C47122BD6E21
              9F5D1C6E4013FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB66A20DFB1
              86E9BD93DC9D60D7904CD68F48D48940D28337D28235D18031D07C2ACD7724CA
              7523C97523C37122A7611D7A4715FF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FFB66A20E0B48BEECBA9E3B384DFA76FDCA268DA9B5DD79351D68F4AD388
              3FD18031CF7B28CE7825CF7924CA7523AF651E864E17FF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFB66A20E0B081F2D4B5EECDADECC7A3EAC199E7B98D
              E3AF7CE0A46ADB9652D6883BD3802ED37B27D67C25D37B25B96B20915419FF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB76A20D49360E3B68BE4BE98E4
              BE98E3BA91E0B388DDAC7BD99F66D48F4DD0843ACD7C2CCB7726CF7824CC7623
              B869269A5A1BFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFBD77
              34C4864AC4884CC4884CC28446C07E3FC18142BF7B3ABB742FB96F27B76C23B7
              6C23B66A21B76B20AB631EFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF000000}
            MouseOver.Data = {
              AE060000424DAE06000000000000360000002800000017000000170000000100
              18000000000078060000120B0000120B00000000000000000000FF00FFFF00FF
              7981817981817882827781817980837980837782807782807980837980837781
              81778181798083798083778181778181787F82798083748082FF00FFFF00FF00
              0000FF00FF7E8081F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EB808080FF00FF0000007B8081F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7
              E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EB758181000000808080F7E7EBF7E7EBF7E7EB7142
              136E4013653A115D351059330F59330F59330F59330F59330F59330F59330F59
              330F5A340F5A340F4C2B0DF7E7EBF7E7EBF7E7EB7B8081000000808080F7E7EB
              F7E7EB9154199C5D219B5B1B94561A8D5218894F18854D17834D17844D17854D
              17854D17844D17854D17895018804B16693F184C2C0DF7E7EBF7E7EB7B808100
              00007F7F7FF7E7EBF7E7EBA9621DB96B20BE6E21B4681FAF651EAC641EA6611D
              A25F1CA05E1CA15E1CA15E1CA25E1CA25E1CA6611DA25E1C804B165A340FF7E7
              EBF7E7EB7B80810000007C8180F7E7EBF7E7EBB2681FC47222C77322BD6E21B8
              6B21B4681FAF661EAA621DA6611DA25E1CA15E1CA25E1CA25D1CA7611DA7611D
              8950185A340FF7E7EBF7E7EB7B7F840000007C8180F7E7EBF7E7EBB66A20C775
              26C97626C07224BB6D22B76A20B3681FAE651EA9621DA25E1C9D5B1B9D5B1B9D
              5B1BA25E1CA25E1C854D1759330FF7E7EBF7E7EB7B7F840000007B8180F7E7EB
              F7E7EBB66A20CD7D30D38233C97829C27225BD6E21B66A20B3681FAD641EA862
              1DA35E1CA05D1C9E5B1BA25D1CA25E1C844D1759330FF7E7EBF7E7EB7B808100
              00007B8180F7E7EBF7E7EBB66A20D18740D98C43D07F31CA7929C47323FFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFA7611DA15E1CA25D1CA15D1C844D1759330FF7E7
              EBF7E7EB7B80810000007D8281F7E7EBF7E7EBB66A20D69657DD9A58D28439CF
              7D2DCC7827FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA8611DA7611DA8621DA35E1C
              854C1759330FF7E7EBF7E7EB7B80810000007C8180F7E7EBF7E7EBB66A20D9A1
              69E0A56BD3883FD18031D07E2DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAF651EAE
              651EAF651EA8611D894F1859330FF7E7EBF7E7EB7B80810000007C8081F7E7EB
              F7E7EBB66A20DBA774E2AC76D48C45D28337D28335FFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFBC6D21B4681FB5691FAE651E8F54195A340FF7E7EBF7E7EB7B808100
              00007B7F80F7E7EBF7E7EBB66A20DDAB7BE4B07DD7924ED58B42D3873DFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFC57222BA6C20BB6C20B66A2097581A623911F7E7
              EBF7E7EB7B80810000007C8180F7E7EBF7E7EBB66A20DEAE7FE6B584D99757D6
              904AD58B41D3873DD28335D18030D07C2BCE7825CA7523C47222C47122BD6E21
              9F5D1C6E4013F7E7EBF7E7EB7B80810000007C8180F7E7EBF7E7EBB66A20DFB1
              86E9BD93DC9D60D7904CD68F48D48940D28337D28235D18031D07C2ACD7724CA
              7523C97523C37122A7611D7A4715F7E7EBF7E7EB7B80810000007C8180F7E7EB
              F7E7EBB66A20E0B48BEECBA9E3B384DFA76FDCA268DA9B5DD79351D68F4AD388
              3FD18031CF7B28CE7825CF7924CA7523AF651E864E17F7E7EBF7E7EB7B808100
              00007D8281F7E7EBF7E7EBB66A20E0B081F2D4B5EECDADECC7A3EAC199E7B98D
              E3AF7CE0A46ADB9652D6883BD3802ED37B27D67C25D37B25B96B20915419F7E7
              EBF7E7EB7B80810000007C8180F7E7EBF7E7EBB76A20D3995FE3B68BE4BE98E4
              BE98E3BA91E0B388DDAC7BD99F66D48F4DD0843ACD7C2CCB7726CF7824CC7623
              B86E269A5A1BF7E7EBF7E7EB7B80810000007C8180F7E7EBF7E7EBF7E7EBBD77
              34C4864AC4884CC4884CC28446C07E3FC18142BF7B3ABB742FB96F27B76C23B7
              6C23B66A21B76B20AB631EF7E7EBF7E7EBF7E7EB7B80810000007B8180F7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB75818100
              0000FF00FF7E8080F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EB808080FF00FF000000FF00FFFF00FF79808379808377818177818179808379
              8083778181778181798083798083778083778083798083798083778181778181
              798083798083748082FF00FFFF00FF000000}
            Pressed.Data = {
              AE060000424DAE06000000000000360000002800000017000000170000000100
              18000000000078060000120B0000120B00000000000000000000FF00FFFF00FF
              7981817981817882827781817980837980837782807782807980837980837781
              81778181798083798083778181778181787F82798083748082FF00FFFF00FF00
              0000FF00FF7E8081DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CF808080FF00FF0000007B8081DACBCFDACBCFDACBCFDACBCF7142136E401365
              3A115D351059330F59330F59330F59330F59330F59330F59330F59330F5A340F
              5A340F4C2B0DDACBCFDACBCF758181000000808080DACBCFDACBCFDACBCF9154
              199B5D209B5B1B94561A8D5218894F18854D17834D17844D17854D17854D1784
              4D17854D17895018804B16683F174C2C0DDACBCF7B80810000007F7F7FDACBCF
              DACBCFDACBCFA9621DB96B20BE6E21B4681FAF651EAC641EA6611DA25F1CA05E
              1CA15E1CA15E1CA25E1CA25E1CA6611DA25E1C804B165A340FDACBCF7B808100
              00007C8180DACBCFDACBCFDACBCFB2681FC47222C77322BD6E21B86B21B4681F
              AF661EAA621DA6611DA25E1CA15E1CA25E1CA25D1CA7611DA7611D8950185A34
              0FDACBCF7B7F840000007C8180DACBCFDACBCFDACBCFB66A20C77526C97626C0
              7224BB6D22B76A20B3681FAE651EA9621DA25E1C9D5B1B9D5B1B9D5B1BA25E1C
              A25E1C854D1759330FDACBCF7B7F840000007B8180DACBCFDACBCFDACBCFB66A
              20CD7D30D38233C97829C27225BD6E21B66A20B3681FAD641EA8621DA35E1CA0
              5D1C9E5B1BA25D1CA25E1C844D1759330FDACBCF7B80810000007B8180DACBCF
              DACBCFDACBCFB66A20D18740D98C43D07F31CA7929C47323FFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFA7611DA15E1CA25D1CA15D1C844D1759330FDACBCF7B808100
              00007D8281DACBCFDACBCFDACBCFB66A20D69657DD9A58D28439CF7D2DCC7827
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA8611DA7611DA8621DA35E1C854C175933
              0FDACBCF7B80810000007D8281DACBCFDACBCFDACBCFB66A20D9A169E0A56BD3
              883FD18031D07E2DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAF651EAE651EAF651E
              A8611D894F1859330FDACBCF7B80810000007C8180DACBCFDACBCFDACBCFB66A
              20DBA774E2AC76D48C45D28337D28335FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBC
              6D21B4681FB5691FAE651E8F54195A340FDACBCF7B80810000007C8081DACBCF
              DACBCFDACBCFB66A20DDAB7BE4B07DD7924ED58B42D3873DFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFC57222BA6C20BB6C20B66A2097581A623911DACBCF7B808100
              00007B7F80DACBCFDACBCFDACBCFB66A20DEAE7FE6B584D99757D6904AD58B41
              D3873DD28335D18030D07C2BCE7825CA7523C47222C47122BD6E219F5D1C6E40
              13DACBCF7B80810000007C8180DACBCFDACBCFDACBCFB66A20DFB186E9BD93DC
              9D60D7904CD68F48D48940D28337D28235D18031D07C2ACD7724CA7523C97523
              C37122A7611D7A4715DACBCF7B80810000007C8180DACBCFDACBCFDACBCFB66A
              20E0B48BEECBA9E3B384DFA76FDCA268DA9B5DD79351D68F4AD3883FD18031CF
              7B28CE7825CF7924CA7523AF651E864E17DACBCF7B80810000007C8180DACBCF
              DACBCFDACBCFB66A20E0B081F2D4B5EECDADECC7A3EAC199E7B98DE3AF7CE0A4
              6ADB9652D6883BD3802ED37B27D67C25D37B25B96B20915419DACBCF7B808100
              00007D8281DACBCFDACBCFDACBCFB76A20D2985EE3B68BE4BE98E4BE98E3BA91
              E0B388DDAC7BD99F66D48F4DD0843ACD7C2CCB7726CF7824CC7623B76D259A5A
              1BDACBCF7B80810000007C8180DACBCFDACBCFDACBCFDACBCFBD7734C4864AC4
              884CC4884CC28446C07E3FC18142BF7B3ABB742FB96F27B76C23B76C23B66A21
              B76B20AB631EDACBCFDACBCF7B80810000007C8180DACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDA
              CBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF7B80810000007B8180DACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF75818100
              0000FF00FF7E8080DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CF808080FF00FF000000FF00FFFF00FF79808379808377818177818179808379
              8083778181778181798083798083778083778083798083798083778181778181
              798083798083748082FF00FFFF00FF000000}
            Disabled.Data = {
              AE060000424DAE06000000000000360000002800000017000000170000000100
              18000000000078060000120B0000120B00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FF5252
              525151514A4A4A43434341414141414141414141414141414141414141414141
              4141424242424242383838FF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FF6A6A6A726F6D7171716C6C6C6767676464646161616060606060606161
              616161616060606161616464645E5E5E4C4948383838FF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FF7B7B7B8787878B8B8B8484848080807E7E7E797979
              7676767575757575757575757676767676767979797676765E5E5E424242FF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FF8282828F8F8F9292928A8A8A87
              87878484848080807D7D7D7979797676767575757676767676767A7A7A7A7A7A
              646464424242FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FF8585859393
              939595958E8E8E8A8A8A8585858383837F7F7F7B7B7B76767673737373737373
              7373767676767676616161414141FF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FF8585859D9D9DA2A2A29696969090908A8A8A8585858383837F7F7F7A7A
              7A787878757575747474767676767676606060414141FF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FF858585A9A9A9AEAEAEA0A0A09696968F8F8FFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFF7A7A7A757575767676757575606060414141FF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FF858585B7B7B7BBBBBBA5A5A59C
              9C9C979797FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7B7B7B7A7A7A7A7A7A787878
              616161414141FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FF858585C2C2
              C2C6C6C6A9A9A9A0A0A09D9D9DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8080807F
              7F7F8080807B7B7B646464414141FF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FF858585C9C9C9CCCCCCADADADA4A4A4A2A2A2FFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFF8989898484848484847F7F7F696969424242FF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FF858585CCCCCCD1D1D1B2B2B2ABABABA7A7A7FFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFF9090908888888989898585856F6F6F474747FF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FF858585CECECED4D4D4B9B9B9B0
              B0B0ABABABA7A7A7A2A2A29E9E9E9B9B9B9696969494948F8F8F8F8F8F8A8A8A
              747474515151FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FF858585D3D3
              D3DCDCDCBFBFBFB2B2B2AFAFAFAAAAAAA4A4A4A2A2A2A0A0A09B9B9B96969694
              94949393938E8E8E7A7A7A5A5A5AFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FF858585D4D4D4E6E6E6D3D3D3C8C8C8C3C3C3BDBDBDB5B5B5B0B0B0A9A9
              A9A0A0A0999999979797969696939393808080626262FF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FF858585D0D0D0EBEBEBE8E8E8E3E3E3DEDEDED9D9D9
              D0D0D0C6C6C6B7B7B7A7A7A79E9E9E9B9B9B9C9C9C9A9A9A8888886A6A6AFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FF858585BAB7B4D6D6D6DCDCDCDC
              DCDCD9D9D9D3D3D3CCCCCCC1C1C1B1B1B1A4A4A49A9A9A959595969696959595
              888481707070FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FF9595
              95A6A6A6A7A7A7A7A7A7A3A3A39E9E9EA0A0A09A9A9A9292928B8B8B88888888
              88888787878585857D7D7DFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF000000}
            State = sNormal
            Enabled = True
            CanBeDown = False
            Down = False
            ShowHint = True
            OnClick = btnStopClick
          end
          object btnRew: TSWButton
            Left = 142
            Top = 21
            Width = 27
            Height = 25
            Normal.Data = {
              AE060000424DAE06000000000000360000002800000017000000170000000100
              1800000000007806000000000000000000000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FF7142
              136E4013653A115D351059330F59330F59330F59330F59330F59330F59330F59
              330F5A340F5A340F4C2B0DFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FF9154199C58229B5B1B94561A8D5218894F18854D17834D17844D17854D
              17854D17844D17854D17895018804B16693A194C2C0DFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFA9621DB96B20BE6E21B4681FAF651EAC641EA6611D
              A25F1CA05E1CA15E1CA15E1CA25E1CA25E1CA6611DA25E1C804B165A340FFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB2681FC47222C77322BD6E21B8
              6B21B4681FAF661EAA621DA6611DA25E1CA15E1CA25E1CA25D1CA7611DA7611D
              8950185A340FFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB66A20C775
              26C97626C07224BB6D22B76A20B3681FBA7B3EA9621DA25E1C9D5B1BAB733B9D
              5B1BA25E1CA25E1C854D1759330FFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FFB66A20CD7D30D38233C97829C27225BD6E21C07E3FFFFEFEAD641EA862
              1DB0763CFFFEFE9E5B1BA25D1CA25E1C844D1759330FFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFB66A20D18740D98C43D07F31CA7929CD8742FFFEFE
              FDFAF8B2671FB87B3EFFFEFEFCFAF8A15E1CA25D1CA15D1C844D1759330FFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB66A20D69657DD9A58D28439E3
              B384FFFEFEFDFBF8FCF8F4D8AA7DFFFEFEFDFAF8FAF6F3A7611DA8621DA35E1C
              854C1759330FFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB66A20D9A1
              69E0A56BE1AD79FFFFFFFEFCFAFCF8F4FDFAF7FFFFFFFDFBFAFBF7F3FBF7F3AE
              651EAF651EA8611D894F1859330FFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FFB66A20DBA774E2AC76D48C45E9C39EFFFFFEFDFAF7FCF8F4E6BD94FFFE
              FEFDFAF7FBF7F3B4681FB5691FAE651E8F54195A340FFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFB66A20DDAB7BE4B07DD7924ED58B42DB9E61FFFFFE
              FEFBF8D17D2AD7924EFFFEFEFDFAF7BA6C20BB6C20B66A2097581A623911FF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB66A20DEAE7FE6B584D99757D6
              904AD58B41DB9E61FFFFFED18030D07C2BD7914EFFFEFEC47222C47122BD6E21
              9F5D1C6E4013FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB66A20DFB1
              86E9BD93DC9D60D7904CD68F48D48940DA9B5DD28235D18031D07C2AD7914ECA
              7523C97523C37122A7611D7A4715FF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FFB66A20E0B48BEECBA9E3B384DFA76FDCA268DA9B5DD79351D68F4AD388
              3FD18031CF7B28CE7825CF7924CA7523AF651E864E17FF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFB66A20E0B081F2D4B5EECDADECC7A3EAC199E7B98D
              E3AF7CE0A46ADB9652D6883BD3802ED37B27D67C25D37B25B96B20915419FF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB76A20D49360E3B68BE4BE98E4
              BE98E3BA91E0B388DDAC7BD99F66D48F4DD0843ACD7C2CCB7726CF7824CC7623
              B869269A5A1BFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFBD77
              34C4864AC4884CC4884CC28446C07E3FC18142BF7B3ABB742FB96F27B76C23B7
              6C23B66A21B76B20AB631EFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF000000}
            MouseOver.Data = {
              AE060000424DAE06000000000000360000002800000017000000170000000100
              18000000000078060000120B0000120B00000000000000000000FF00FFFF00FF
              7981817981817882827781817980837980837782807782807980837980837781
              81778181798083798083778181778181787F82798083748082FF00FFFF00FF00
              0000FF00FF7E8081F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EB808080FF00FF0000007B8081F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7
              E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EB758181000000808080F7E7EBF7E7EBF7E7EB7142
              136E4013653A115D351059330F59330F59330F59330F59330F59330F59330F59
              330F5A340F5A340F4C2B0DF7E7EBF7E7EBF7E7EB7B8081000000808080F7E7EB
              F7E7EB9154199C5D219B5B1B94561A8D5218894F18854D17834D17844D17854D
              17854D17844D17854D17895018804B16693F184C2C0DF7E7EBF7E7EB7B808100
              00007F7F7FF7E7EBF7E7EBA9621DB96B20BE6E21B4681FAF651EAC641EA6611D
              A25F1CA05E1CA15E1CA15E1CA25E1CA25E1CA6611DA25E1C804B165A340FF7E7
              EBF7E7EB7B80810000007C8180F7E7EBF7E7EBB2681FC47222C77322BD6E21B8
              6B21B4681FAF661EAA621DA6611DA25E1CA15E1CA25E1CA25D1CA7611DA7611D
              8950185A340FF7E7EBF7E7EB7B7F840000007C8180F7E7EBF7E7EBB66A20C775
              26C97626C07224BB6D22B76A20B3681FBA7B3EA9621DA25E1C9D5B1BAB733B9D
              5B1BA25E1CA25E1C854D1759330FF7E7EBF7E7EB7B7F840000007B8180F7E7EB
              F7E7EBB66A20CD7D30D38233C97829C27225BD6E21C07E3FFFFEFEAD641EA862
              1DB0763CFFFEFE9E5B1BA25D1CA25E1C844D1759330FF7E7EBF7E7EB7B808100
              00007B8180F7E7EBF7E7EBB66A20D18740D98C43D07F31CA7929CD8742FFFEFE
              FDFAF8B2671FB87B3EFFFEFEFCFAF8A15E1CA25D1CA15D1C844D1759330FF7E7
              EBF7E7EB7B80810000007D8281F7E7EBF7E7EBB66A20D69657DD9A58D28439E3
              B384FFFEFEFDFBF8FCF8F4D8AA7DFFFEFEFDFAF8FAF6F3A7611DA8621DA35E1C
              854C1759330FF7E7EBF7E7EB7B80810000007C8180F7E7EBF7E7EBB66A20D9A1
              69E0A56BE1AD79FFFFFFFEFCFAFCF8F4FDFAF7FFFFFFFDFBFAFBF7F3FBF7F3AE
              651EAF651EA8611D894F1859330FF7E7EBF7E7EB7B80810000007C8081F7E7EB
              F7E7EBB66A20DBA774E2AC76D48C45E9C39EFFFFFEFDFAF7FCF8F4E6BD94FFFE
              FEFDFAF7FBF7F3B4681FB5691FAE651E8F54195A340FF7E7EBF7E7EB7B808100
              00007B7F80F7E7EBF7E7EBB66A20DDAB7BE4B07DD7924ED58B42DB9E61FFFFFE
              FEFBF8D17D2AD7924EFFFEFEFDFAF7BA6C20BB6C20B66A2097581A623911F7E7
              EBF7E7EB7B80810000007C8180F7E7EBF7E7EBB66A20DEAE7FE6B584D99757D6
              904AD58B41DB9E61FFFFFED18030D07C2BD7914EFFFEFEC47222C47122BD6E21
              9F5D1C6E4013F7E7EBF7E7EB7B80810000007C8180F7E7EBF7E7EBB66A20DFB1
              86E9BD93DC9D60D7904CD68F48D48940DA9B5DD28235D18031D07C2AD7914ECA
              7523C97523C37122A7611D7A4715F7E7EBF7E7EB7B80810000007C8180F7E7EB
              F7E7EBB66A20E0B48BEECBA9E3B384DFA76FDCA268DA9B5DD79351D68F4AD388
              3FD18031CF7B28CE7825CF7924CA7523AF651E864E17F7E7EBF7E7EB7B808100
              00007D8281F7E7EBF7E7EBB66A20E0B081F2D4B5EECDADECC7A3EAC199E7B98D
              E3AF7CE0A46ADB9652D6883BD3802ED37B27D67C25D37B25B96B20915419F7E7
              EBF7E7EB7B80810000007C8180F7E7EBF7E7EBB76A20D3995FE3B68BE4BE98E4
              BE98E3BA91E0B388DDAC7BD99F66D48F4DD0843ACD7C2CCB7726CF7824CC7623
              B86E269A5A1BF7E7EBF7E7EB7B80810000007C8180F7E7EBF7E7EBF7E7EBBD77
              34C4864AC4884CC4884CC28446C07E3FC18142BF7B3ABB742FB96F27B76C23B7
              6C23B66A21B76B20AB631EF7E7EBF7E7EBF7E7EB7B80810000007B8180F7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB75818100
              0000FF00FF7E8080F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EB808080FF00FF000000FF00FFFF00FF79808379808377818177818179808379
              8083778181778181798083798083778083778083798083798083778181778181
              798083798083748082FF00FFFF00FF000000}
            Pressed.Data = {
              AE060000424DAE06000000000000360000002800000017000000170000000100
              18000000000078060000120B0000120B00000000000000000000FF00FFFF00FF
              7981817981817882827781817980837980837782807782807980837980837781
              81778181798083798083778181778181787F82798083748082FF00FFFF00FF00
              0000FF00FF7E8081DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CF808080FF00FF0000007B8081DACBCFDACBCFDACBCFDACBCF7142136E401365
              3A115D351059330F59330F59330F59330F59330F59330F59330F59330F5A340F
              5A340F4C2B0DDACBCFDACBCF758181000000808080DACBCFDACBCFDACBCF9154
              199B5D209B5B1B94561A8D5218894F18854D17834D17844D17854D17854D1784
              4D17854D17895018804B16683F174C2C0DDACBCF7B80810000007F7F7FDACBCF
              DACBCFDACBCFA9621DB96B20BE6E21B4681FAF651EAC641EA6611DA25F1CA05E
              1CA15E1CA15E1CA25E1CA25E1CA6611DA25E1C804B165A340FDACBCF7B808100
              00007C8180DACBCFDACBCFDACBCFB2681FC47222C77322BD6E21B86B21B4681F
              AF661EAA621DA6611DA25E1CA15E1CA25E1CA25D1CA7611DA7611D8950185A34
              0FDACBCF7B7F840000007C8180DACBCFDACBCFDACBCFB66A20C77526C97626C0
              7224BB6D22B76A20B3681FBA7B3EA9621DA25E1C9D5B1BAB733B9D5B1BA25E1C
              A25E1C854D1759330FDACBCF7B7F840000007B8180DACBCFDACBCFDACBCFB66A
              20CD7D30D38233C97829C27225BD6E21C07E3FFFFEFEAD641EA8621DB0763CFF
              FEFE9E5B1BA25D1CA25E1C844D1759330FDACBCF7B80810000007B8180DACBCF
              DACBCFDACBCFB66A20D18740D98C43D07F31CA7929CD8742FFFEFEFDFAF8B267
              1FB87B3EFFFEFEFCFAF8A15E1CA25D1CA15D1C844D1759330FDACBCF7B808100
              00007D8281DACBCFDACBCFDACBCFB66A20D69657DD9A58D28439E3B384FFFEFE
              FDFBF8FCF8F4D8AA7DFFFEFEFDFAF8FAF6F3A7611DA8621DA35E1C854C175933
              0FDACBCF7B80810000007D8281DACBCFDACBCFDACBCFB66A20D9A169E0A56BE1
              AD79FFFFFFFEFCFAFCF8F4FDFAF7FFFFFFFDFBFAFBF7F3FBF7F3AE651EAF651E
              A8611D894F1859330FDACBCF7B80810000007C8180DACBCFDACBCFDACBCFB66A
              20DBA774E2AC76D48C45E9C39EFFFFFEFDFAF7FCF8F4E6BD94FFFEFEFDFAF7FB
              F7F3B4681FB5691FAE651E8F54195A340FDACBCF7B80810000007C8081DACBCF
              DACBCFDACBCFB66A20DDAB7BE4B07DD7924ED58B42DB9E61FFFFFEFEFBF8D17D
              2AD7924EFFFEFEFDFAF7BA6C20BB6C20B66A2097581A623911DACBCF7B808100
              00007B7F80DACBCFDACBCFDACBCFB66A20DEAE7FE6B584D99757D6904AD58B41
              DB9E61FFFFFED18030D07C2BD7914EFFFEFEC47222C47122BD6E219F5D1C6E40
              13DACBCF7B80810000007C8180DACBCFDACBCFDACBCFB66A20DFB186E9BD93DC
              9D60D7904CD68F48D48940DA9B5DD28235D18031D07C2AD7914ECA7523C97523
              C37122A7611D7A4715DACBCF7B80810000007C8180DACBCFDACBCFDACBCFB66A
              20E0B48BEECBA9E3B384DFA76FDCA268DA9B5DD79351D68F4AD3883FD18031CF
              7B28CE7825CF7924CA7523AF651E864E17DACBCF7B80810000007C8180DACBCF
              DACBCFDACBCFB66A20E0B081F2D4B5EECDADECC7A3EAC199E7B98DE3AF7CE0A4
              6ADB9652D6883BD3802ED37B27D67C25D37B25B96B20915419DACBCF7B808100
              00007D8281DACBCFDACBCFDACBCFB76A20D2985EE3B68BE4BE98E4BE98E3BA91
              E0B388DDAC7BD99F66D48F4DD0843ACD7C2CCB7726CF7824CC7623B76D259A5A
              1BDACBCF7B80810000007C8180DACBCFDACBCFDACBCFDACBCFBD7734C4864AC4
              884CC4884CC28446C07E3FC18142BF7B3ABB742FB96F27B76C23B76C23B66A21
              B76B20AB631EDACBCFDACBCF7B80810000007C8180DACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDA
              CBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF7B80810000007B8180DACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF75818100
              0000FF00FF7E8080DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CF808080FF00FF000000FF00FFFF00FF79808379808377818177818179808379
              8083778181778181798083798083778083778083798083798083778181778181
              798083798083748082FF00FFFF00FF000000}
            Disabled.Data = {
              AE060000424DAE06000000000000360000002800000017000000170000000100
              18000000000078060000120B0000120B00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FF5252
              525151514A4A4A43434341414141414141414141414141414141414141414141
              4141424242424242383838FF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FF6A6A6A726F6D7171716C6C6C6767676464646161616060606060606161
              616161616060606161616464645E5E5E4C4948383838FF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FF7B7B7B8787878B8B8B8484848080807E7E7E797979
              7676767575757575757575757676767676767979797676765E5E5E424242FF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FF8282828F8F8F9292928A8A8A87
              87878484848080807D7D7D7979797676767575757676767676767A7A7A7A7A7A
              646464424242FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FF8585859393
              939595958E8E8E8A8A8A8585858383839191917B7B7B76767673737387878773
              7373767676767676616161414141FF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FF8585859D9D9DA2A2A29696969090908A8A8A969696FFFFFF7F7F7F7A7A
              7A8B8B8BFEFEFE747474767676767676606060414141FF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FF858585A9A9A9AEAEAEA0A0A09696969F9F9FFFFFFF
              FBFBFB828282909090FEFEFEFBFBFB757575767676757575606060414141FF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FF858585B7B7B7BBBBBBA5A5A5C5
              C5C5FFFFFFFCFCFCF9F9F9BABABAFFFFFFFBFBFBF8F8F87A7A7A7A7A7A787878
              616161414141FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FF858585C2C2
              C2C6C6C6C3C3C3FFFFFFFDFDFDFAFAFAFBFBFBFFFFFFFDFDFDF9F9F9F9F9F97F
              7F7F8080807B7B7B646464414141FF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FF858585C9C9C9CCCCCCADADADD3D3D3FFFFFFFBFBFBFAFAFACBCBCBFFFF
              FFFBFBFBF9F9F98484848484847F7F7F696969424242FF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FF858585CCCCCCD1D1D1B2B2B2ABABABB8B8B8FFFFFF
              FCFCFC9B9B9BAAAAAAFFFFFFFBFBFB8888888989898585856F6F6F474747FF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FF858585CECECED4D4D4B9B9B9B0
              B0B0ABABABB8B8B8FFFFFF9E9E9E9B9B9BAAAAAAFFFFFF8F8F8F8F8F8F8A8A8A
              747474515151FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FF858585D3D3
              D3DCDCDCBFBFBFB2B2B2AFAFAFAAAAAAB5B5B5A2A2A2A0A0A09B9B9BAAAAAA94
              94949393938E8E8E7A7A7A5A5A5AFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FF858585D4D4D4E6E6E6D3D3D3C8C8C8C3C3C3BDBDBDB5B5B5B0B0B0A9A9
              A9A0A0A0999999979797969696939393808080626262FF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FF858585D0D0D0EBEBEBE8E8E8E3E3E3DEDEDED9D9D9
              D0D0D0C6C6C6B7B7B7A7A7A79E9E9E9B9B9B9C9C9C9A9A9A8888886A6A6AFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FF858585BAB7B4D6D6D6DCDCDCDC
              DCDCD9D9D9D3D3D3CCCCCCC1C1C1B1B1B1A4A4A49A9A9A959595969696959595
              888481707070FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FF9595
              95A6A6A6A7A7A7A7A7A7A3A3A39E9E9EA0A0A09A9A9A9292928B8B8B88888888
              88888787878585857D7D7DFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF000000}
            State = sNormal
            Enabled = True
            CanBeDown = False
            Down = False
            ShowHint = True
            OnMouseDown = btnRewMouseDown
            OnMouseUp = btnRewMouseUp
          end
          object btnForward: TSWButton
            Left = 166
            Top = 21
            Width = 25
            Height = 25
            Normal.Data = {
              AE060000424DAE06000000000000360000002800000017000000170000000100
              1800000000007806000000000000000000000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FF7142
              136E4013653A115D351059330F59330F59330F59330F59330F59330F59330F59
              330F5A340F5A340F4C2B0DFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FF9154199C58229B5B1B94561A8D5218894F18854D17834D17844D17854D
              17854D17844D17854D17895018804B16693A194C2C0DFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFA9621DB96B20BE6E21B4681FAF651EAC641EA6611D
              A25F1CA05E1CA15E1CA15E1CA25E1CA25E1CA6611DA25E1C804B165A340FFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB2681FC47222C77322BD6E21B8
              6B21B4681FAF661EAA621DA6611DA25E1CA15E1CA25E1CA25D1CA7611DA7611D
              8950185A340FFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB66A20C775
              26C97626C07224BB6D22C17E3FB3681FAE651EA9621DAF753C9D5B1B9D5B1B9D
              5B1BA25E1CA25E1C854D1759330FFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FFB66A20CD7D30D38233C97829C27225FFFEFEC07E3FB3681FAD641EFFFE
              FEB0763CA05D1C9E5B1BA25D1CA25E1C844D1759330FFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFB66A20D18740D98C43D07F31CA7929FDFBF8FFFEFE
              C28041B2671FFCFAF8FFFEFEB3773DA15E1CA25D1CA15D1C844D1759330FFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB66A20D69657DD9A58D28439CF
              7D2DFCF8F4FDFBF8FFFEFED8AA7DFBF7F3FDFAF8FFFEFECCA37BA8621DA35E1C
              854C1759330FFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB66A20D9A1
              69E0A56BD3883FD18031FCF8F4FCF8F4FEFCFAFFFFFFFDFAF7FBF7F3FDFBFAFF
              FFFFC79462A8611D894F1859330FFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FFB66A20DBA774E2AC76D48C45D28337FCF8F4FDFAF7FFFEFEE6BD94FCF8
              F4FDFAF7FFFEFEDAB592B5691FAE651E8F54195A340FFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFB66A20DDAB7BE4B07DD7924ED58B42FEFBF8FFFFFE
              D99757D17D2AFDFAF7FFFEFED08D4CBA6C20BB6C20B66A2097581A623911FF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB66A20DEAE7FE6B584D99757D6
              904AFFFFFEDB9E61D28335D18030FFFEFED7914ECA7523C47222C47122BD6E21
              9F5D1C6E4013FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB66A20DFB1
              86E9BD93DC9D60D7904CDDA36AD48940D28337D28235D99757D07C2ACD7724CA
              7523C97523C37122A7611D7A4715FF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FFB66A20E0B48BEECBA9E3B384DFA76FDCA268DA9B5DD79351D68F4AD388
              3FD18031CF7B28CE7825CF7924CA7523AF651E864E17FF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFB66A20E0B081F2D4B5EECDADECC7A3EAC199E7B98D
              E3AF7CE0A46ADB9652D6883BD3802ED37B27D67C25D37B25B96B20915419FF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB76A20D49360E3B68BE4BE98E4
              BE98E3BA91E0B388DDAC7BD99F66D48F4DD0843ACD7C2CCB7726CF7824CC7623
              B869269A5A1BFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFBD77
              34C4864AC4884CC4884CC28446C07E3FC18142BF7B3ABB742FB96F27B76C23B7
              6C23B66A21B76B20AB631EFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF000000}
            MouseOver.Data = {
              AE060000424DAE06000000000000360000002800000017000000170000000100
              18000000000078060000120B0000120B00000000000000000000FF00FFFF00FF
              7981817981817882827781817980837980837782807782807980837980837781
              81778181798083798083778181778181787F82798083748082FF00FFFF00FF00
              0000FF00FF7E8081F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EB808080FF00FF0000007B8081F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7
              E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EB758181000000808080F7E7EBF7E7EBF7E7EB7142
              136E4013653A115D351059330F59330F59330F59330F59330F59330F59330F59
              330F5A340F5A340F4C2B0DF7E7EBF7E7EBF7E7EB7B8081000000808080F7E7EB
              F7E7EB9154199C5D219B5B1B94561A8D5218894F18854D17834D17844D17854D
              17854D17844D17854D17895018804B16693F184C2C0DF7E7EBF7E7EB7B808100
              00007F7F7FF7E7EBF7E7EBA9621DB96B20BE6E21B4681FAF651EAC641EA6611D
              A25F1CA05E1CA15E1CA15E1CA25E1CA25E1CA6611DA25E1C804B165A340FF7E7
              EBF7E7EB7B80810000007C8180F7E7EBF7E7EBB2681FC47222C77322BD6E21B8
              6B21B4681FAF661EAA621DA6611DA25E1CA15E1CA25E1CA25D1CA7611DA7611D
              8950185A340FF7E7EBF7E7EB7B7F840000007C8180F7E7EBF7E7EBB66A20C775
              26C97626C07224BB6D22C17E3FB3681FAE651EA9621DAF753C9D5B1B9D5B1B9D
              5B1BA25E1CA25E1C854D1759330FF7E7EBF7E7EB7B7F840000007B8180F7E7EB
              F7E7EBB66A20CD7D30D38233C97829C27225FFFEFEC07E3FB3681FAD641EFFFE
              FEB0763CA05D1C9E5B1BA25D1CA25E1C844D1759330FF7E7EBF7E7EB7B808100
              00007B8180F7E7EBF7E7EBB66A20D18740D98C43D07F31CA7929FDFBF8FFFEFE
              C28041B2671FFCFAF8FFFEFEB3773DA15E1CA25D1CA15D1C844D1759330FF7E7
              EBF7E7EB7B80810000007D8281F7E7EBF7E7EBB66A20D69657DD9A58D28439CF
              7D2DFCF8F4FDFBF8FFFEFED8AA7DFBF7F3FDFAF8FFFEFECCA37BA8621DA35E1C
              854C1759330FF7E7EBF7E7EB7B80810000007C8180F7E7EBF7E7EBB66A20D9A1
              69E0A56BD3883FD18031FCF8F4FCF8F4FEFCFAFFFFFFFDFAF7FBF7F3FDFBFAFF
              FFFFC79462A8611D894F1859330FF7E7EBF7E7EB7B80810000007C8081F7E7EB
              F7E7EBB66A20DBA774E2AC76D48C45D28337FCF8F4FDFAF7FFFEFEE6BD94FCF8
              F4FDFAF7FFFEFEDAB592B5691FAE651E8F54195A340FF7E7EBF7E7EB7B808100
              00007B7F80F7E7EBF7E7EBB66A20DDAB7BE4B07DD7924ED58B42FEFBF8FFFFFE
              D99757D17D2AFDFAF7FFFEFED08D4CBA6C20BB6C20B66A2097581A623911F7E7
              EBF7E7EB7B80810000007C8180F7E7EBF7E7EBB66A20DEAE7FE6B584D99757D6
              904AFFFFFEDB9E61D28335D18030FFFEFED7914ECA7523C47222C47122BD6E21
              9F5D1C6E4013F7E7EBF7E7EB7B80810000007C8180F7E7EBF7E7EBB66A20DFB1
              86E9BD93DC9D60D7904CDDA36AD48940D28337D28235D99757D07C2ACD7724CA
              7523C97523C37122A7611D7A4715F7E7EBF7E7EB7B80810000007C8180F7E7EB
              F7E7EBB66A20E0B48BEECBA9E3B384DFA76FDCA268DA9B5DD79351D68F4AD388
              3FD18031CF7B28CE7825CF7924CA7523AF651E864E17F7E7EBF7E7EB7B808100
              00007D8281F7E7EBF7E7EBB66A20E0B081F2D4B5EECDADECC7A3EAC199E7B98D
              E3AF7CE0A46ADB9652D6883BD3802ED37B27D67C25D37B25B96B20915419F7E7
              EBF7E7EB7B80810000007C8180F7E7EBF7E7EBB76A20D3995FE3B68BE4BE98E4
              BE98E3BA91E0B388DDAC7BD99F66D48F4DD0843ACD7C2CCB7726CF7824CC7623
              B86E269A5A1BF7E7EBF7E7EB7B80810000007C8180F7E7EBF7E7EBF7E7EBBD77
              34C4864AC4884CC4884CC28446C07E3FC18142BF7B3ABB742FB96F27B76C23B7
              6C23B66A21B76B20AB631EF7E7EBF7E7EBF7E7EB7B80810000007B8180F7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB75818100
              0000FF00FF7E8080F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EB808080FF00FF000000FF00FFFF00FF79808379808377818177818179808379
              8083778181778181798083798083778083778083798083798083778181778181
              798083798083748082FF00FFFF00FF000000}
            Pressed.Data = {
              AE060000424DAE06000000000000360000002800000017000000170000000100
              18000000000078060000120B0000120B00000000000000000000FF00FFFF00FF
              7981817981817882827781817980837980837782807782807980837980837781
              81778181798083798083778181778181787F82798083748082FF00FFFF00FF00
              0000FF00FF7E8081DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CF808080FF00FF0000007B8081DACBCFDACBCFDACBCFDACBCF7142136E401365
              3A115D351059330F59330F59330F59330F59330F59330F59330F59330F5A340F
              5A340F4C2B0DDACBCFDACBCF758181000000808080DACBCFDACBCFDACBCF9154
              199B5D209B5B1B94561A8D5218894F18854D17834D17844D17854D17854D1784
              4D17854D17895018804B16683F174C2C0DDACBCF7B80810000007F7F7FDACBCF
              DACBCFDACBCFA9621DB96B20BE6E21B4681FAF651EAC641EA6611DA25F1CA05E
              1CA15E1CA15E1CA25E1CA25E1CA6611DA25E1C804B165A340FDACBCF7B808100
              00007C8180DACBCFDACBCFDACBCFB2681FC47222C77322BD6E21B86B21B4681F
              AF661EAA621DA6611DA25E1CA15E1CA25E1CA25D1CA7611DA7611D8950185A34
              0FDACBCF7B7F840000007C8180DACBCFDACBCFDACBCFB66A20C77526C97626C0
              7224BB6D22C17E3FB3681FAE651EA9621DAF753C9D5B1B9D5B1B9D5B1BA25E1C
              A25E1C854D1759330FDACBCF7B7F840000007B8180DACBCFDACBCFDACBCFB66A
              20CD7D30D38233C97829C27225FFFEFEC07E3FB3681FAD641EFFFEFEB0763CA0
              5D1C9E5B1BA25D1CA25E1C844D1759330FDACBCF7B80810000007B8180DACBCF
              DACBCFDACBCFB66A20D18740D98C43D07F31CA7929FDFBF8FFFEFEC28041B267
              1FFCFAF8FFFEFEB3773DA15E1CA25D1CA15D1C844D1759330FDACBCF7B808100
              00007D8281DACBCFDACBCFDACBCFB66A20D69657DD9A58D28439CF7D2DFCF8F4
              FDFBF8FFFEFED8AA7DFBF7F3FDFAF8FFFEFECCA37BA8621DA35E1C854C175933
              0FDACBCF7B80810000007D8281DACBCFDACBCFDACBCFB66A20D9A169E0A56BD3
              883FD18031FCF8F4FCF8F4FEFCFAFFFFFFFDFAF7FBF7F3FDFBFAFFFFFFC79462
              A8611D894F1859330FDACBCF7B80810000007C8180DACBCFDACBCFDACBCFB66A
              20DBA774E2AC76D48C45D28337FCF8F4FDFAF7FFFEFEE6BD94FCF8F4FDFAF7FF
              FEFEDAB592B5691FAE651E8F54195A340FDACBCF7B80810000007C8081DACBCF
              DACBCFDACBCFB66A20DDAB7BE4B07DD7924ED58B42FEFBF8FFFFFED99757D17D
              2AFDFAF7FFFEFED08D4CBA6C20BB6C20B66A2097581A623911DACBCF7B808100
              00007B7F80DACBCFDACBCFDACBCFB66A20DEAE7FE6B584D99757D6904AFFFFFE
              DB9E61D28335D18030FFFEFED7914ECA7523C47222C47122BD6E219F5D1C6E40
              13DACBCF7B80810000007C8180DACBCFDACBCFDACBCFB66A20DFB186E9BD93DC
              9D60D7904CDDA36AD48940D28337D28235D99757D07C2ACD7724CA7523C97523
              C37122A7611D7A4715DACBCF7B80810000007C8180DACBCFDACBCFDACBCFB66A
              20E0B48BEECBA9E3B384DFA76FDCA268DA9B5DD79351D68F4AD3883FD18031CF
              7B28CE7825CF7924CA7523AF651E864E17DACBCF7B80810000007C8180DACBCF
              DACBCFDACBCFB66A20E0B081F2D4B5EECDADECC7A3EAC199E7B98DE3AF7CE0A4
              6ADB9652D6883BD3802ED37B27D67C25D37B25B96B20915419DACBCF7B808100
              00007D8281DACBCFDACBCFDACBCFB76A20D2985EE3B68BE4BE98E4BE98E3BA91
              E0B388DDAC7BD99F66D48F4DD0843ACD7C2CCB7726CF7824CC7623B76D259A5A
              1BDACBCF7B80810000007C8180DACBCFDACBCFDACBCFDACBCFBD7734C4864AC4
              884CC4884CC28446C07E3FC18142BF7B3ABB742FB96F27B76C23B76C23B66A21
              B76B20AB631EDACBCFDACBCF7B80810000007C8180DACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDA
              CBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF7B80810000007B8180DACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF75818100
              0000FF00FF7E8080DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CF808080FF00FF000000FF00FFFF00FF79808379808377818177818179808379
              8083778181778181798083798083778083778083798083798083778181778181
              798083798083748082FF00FFFF00FF000000}
            Disabled.Data = {
              AE060000424DAE06000000000000360000002800000017000000170000000100
              18000000000078060000120B0000120B00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FF5252
              525151514A4A4A43434341414141414141414141414141414141414141414141
              4141424242424242383838FF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FF6A6A6A726F6D7171716C6C6C6767676464646161616060606060606161
              616161616060606161616464645E5E5E4C4948383838FF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FF7B7B7B8787878B8B8B8484848080807E7E7E797979
              7676767575757575757575757676767676767979797676765E5E5E424242FF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FF8282828F8F8F9292928A8A8A87
              87878484848080807D7D7D7979797676767575757676767676767A7A7A7A7A7A
              646464424242FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FF8585859393
              939595958E8E8E8A8A8A9696968383837F7F7F7B7B7B89898973737373737373
              7373767676767676616161414141FF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FF8585859D9D9DA2A2A2969696909090FFFFFF9696968383837F7F7FFEFE
              FE8B8B8B757575747474767676767676606060414141FF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FF858585A9A9A9AEAEAEA0A0A0969696FBFBFBFFFFFF
              999999828282FBFBFBFEFEFE8D8D8D757575767676757575606060414141FF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FF858585B7B7B7BBBBBBA5A5A59C
              9C9CFAFAFAFCFCFCFFFFFFBABABAF9F9F9FBFBFBFEFEFEB1B1B17A7A7A787878
              616161414141FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FF858585C2C2
              C2C6C6C6A9A9A9A0A0A0FAFAFAFAFAFAFDFDFDFFFFFFFBFBFBF9F9F9FDFDFDFF
              FFFFA6A6A67B7B7B646464414141FF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FF858585C9C9C9CCCCCCADADADA4A4A4FAFAFAFBFBFBFFFFFFCBCBCBF9F9
              F9FBFBFBFFFFFFC3C3C38484847F7F7F696969424242FF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FF858585CCCCCCD1D1D1B2B2B2ABABABFCFCFCFFFFFF
              B2B2B29B9B9BFBFBFBFFFFFFA5A5A58888888989898585856F6F6F474747FF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FF858585CECECED4D4D4B9B9B9B0
              B0B0FFFFFFB8B8B8A2A2A29E9E9EFFFFFFAAAAAA9494948F8F8F8F8F8F8A8A8A
              747474515151FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FF858585D3D3
              D3DCDCDCBFBFBFB2B2B2BEBEBEAAAAAAA4A4A4A2A2A2B2B2B29B9B9B96969694
              94949393938E8E8E7A7A7A5A5A5AFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FF858585D4D4D4E6E6E6D3D3D3C8C8C8C3C3C3BDBDBDB5B5B5B0B0B0A9A9
              A9A0A0A0999999979797969696939393808080626262FF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FF858585D0D0D0EBEBEBE8E8E8E3E3E3DEDEDED9D9D9
              D0D0D0C6C6C6B7B7B7A7A7A79E9E9E9B9B9B9C9C9C9A9A9A8888886A6A6AFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FF858585BAB7B4D6D6D6DCDCDCDC
              DCDCD9D9D9D3D3D3CCCCCCC1C1C1B1B1B1A4A4A49A9A9A959595969696959595
              888481707070FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FF9595
              95A6A6A6A7A7A7A7A7A7A3A3A39E9E9EA0A0A09A9A9A9292928B8B8B88888888
              88888787878585857D7D7DFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF000000}
            State = sNormal
            Enabled = True
            CanBeDown = False
            Down = False
            ShowHint = True
            OnMouseDown = btnForwardMouseDown
            OnMouseUp = btnForwardMouseUp
          end
          object btnAlterPlaybackRate: TSWButton
            Left = 190
            Top = 21
            Width = 25
            Height = 25
            Normal.Data = {
              AE060000424DAE06000000000000360000002800000017000000170000000100
              1800000000007806000000000000000000000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FF7142
              136E4013653A115D351059330F59330F59330F59330F59330F59330F59330F59
              330F5A340F5A340F4C2B0DFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FF9154199C58229B5B1B94561A8D5218894F18854D17834D17844D17854D
              17854D17844D17854D17895018804B16693A194C2C0DFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFA9621DB96B20BE6E21B4681FAF651EAC641EA6611D
              A25F1CA05E1CA15E1CA15E1CA25E1CA25E1CA6611DA25E1C804B165A340FFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB2681FC47222C77322BD6E21B8
              6B21B4681FAF661EAA621DA6611DA25E1CA15E1CA25E1CA25D1CA7611DA7611D
              8950185A340FFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB66A20C775
              26C97626C07224BB6D22C17E3FB3681FAE651EB5793DA25E1C9D5B1B9D5B1B9D
              5B1BA25E1CA25E1C854D1759330FFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FFB66A20CD7D30D38233C97829C27225FFFEFEB66A20B3681FFFFEFEB478
              3DA35E1CA05D1C9E5B1BA25D1CA25E1C844D1759330FFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFB66A20D18740D98C43D07F31CA7929FDFBF8C07227
              B86C22FDFAF8FFFEFEB4783DA7611DA15E1CA25D1CA15D1C844D1759330FFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB66A20D69657DD9A58D28439CF
              7D2DFCF8F4C77525C07022FBF7F3FDFAF8FFFEFECDA37BA7611DA8621DA35E1C
              854C1759330FFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB66A20D9A1
              69E0A56BD3883FD18031FCF8F4CC7623C97423FCF8F4FBF7F3FDFBFAFFFFFFC7
              9462AF651EA8611D894F1859330FFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FFB66A20DBA774E2AC76D48C45D28337FCF8F4D07C2ACE7927FCF8F4FDFA
              F7FFFEFEDEB893B4681FB5691FAE651E8F54195A340FFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFB66A20DDAB7BE4B07DD7924ED58B42FEFBF8D28336
              D18031FDFAF7FFFEFED5904DC57222BA6C20BB6C20B66A2097581A623911FF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB66A20DEAE7FE6B584D99757D6
              904AFFFFFED3873DD28335FFFFFED89452CE7825CA7523C47222C47122BD6E21
              9F5D1C6E4013FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB66A20DFB1
              86E9BD93DC9D60D7904CDDA36AD48940D28337DA9A5BD18031D07C2ACD7724CA
              7523C97523C37122A7611D7A4715FF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FFB66A20E0B48BEECBA9E3B384DFA76FDCA268DA9B5DD79351D68F4AD388
              3FD18031CF7B28CE7825CF7924CA7523AF651E864E17FF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFB66A20E0B081F2D4B5EECDADECC7A3EAC199E7B98D
              E3AF7CE0A46ADB9652D6883BD3802ED37B27D67C25D37B25B96B20915419FF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB76A20D49360E3B68BE4BE98E4
              BE98E3BA91E0B388DDAC7BD99F66D48F4DD0843ACD7C2CCB7726CF7824CC7623
              B869269A5A1BFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFBD77
              34C4864AC4884CC4884CC28446C07E3FC18142BF7B3ABB742FB96F27B76C23B7
              6C23B66A21B76B20AB631EFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF000000}
            MouseOver.Data = {
              AE060000424DAE06000000000000360000002800000017000000170000000100
              18000000000078060000120B0000120B00000000000000000000FF00FFFF00FF
              7981817981817882827781817980837980837782807782807980837980837781
              81778181798083798083778181778181787F82798083748082FF00FFFF00FF00
              0000FF00FF7E8081F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EB808080FF00FF0000007B8081F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7
              E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EB758181000000808080F7E7EBF7E7EBF7E7EB7142
              136E4013653A115D351059330F59330F59330F59330F59330F59330F59330F59
              330F5A340F5A340F4C2B0DF7E7EBF7E7EBF7E7EB7B8081000000808080F7E7EB
              F7E7EB9154199C5D219B5B1B94561A8D5218894F18854D17834D17844D17854D
              17854D17844D17854D17895018804B16693F184C2C0DF7E7EBF7E7EB7B808100
              00007F7F7FF7E7EBF7E7EBA9621DB96B20BE6E21B4681FAF651EAC641EA6611D
              A25F1CA05E1CA15E1CA15E1CA25E1CA25E1CA6611DA25E1C804B165A340FF7E7
              EBF7E7EB7B80810000007C8180F7E7EBF7E7EBB2681FC47222C77322BD6E21B8
              6B21B4681FAF661EAA621DA6611DA25E1CA15E1CA25E1CA25D1CA7611DA7611D
              8950185A340FF7E7EBF7E7EB7B7F840000007C8180F7E7EBF7E7EBB66A20C775
              26C97626C07224BB6D22C17E3FB3681FAE651EB5793DA25E1C9D5B1B9D5B1B9D
              5B1BA25E1CA25E1C854D1759330FF7E7EBF7E7EB7B7F840000007B8180F7E7EB
              F7E7EBB66A20CD7D30D38233C97829C27225FFFEFEB66A20B3681FFFFEFEB478
              3DA35E1CA05D1C9E5B1BA25D1CA25E1C844D1759330FF7E7EBF7E7EB7B808100
              00007B8180F7E7EBF7E7EBB66A20D18740D98C43D07F31CA7929FDFBF8C07227
              B86C22FDFAF8FFFEFEB4783DA7611DA15E1CA25D1CA15D1C844D1759330FF7E7
              EBF7E7EB7B80810000007D8281F7E7EBF7E7EBB66A20D69657DD9A58D28439CF
              7D2DFCF8F4C77525C07022FBF7F3FDFAF8FFFEFECDA37BA7611DA8621DA35E1C
              854C1759330FF7E7EBF7E7EB7B80810000007C8180F7E7EBF7E7EBB66A20D9A1
              69E0A56BD3883FD18031FCF8F4CC7623C97423FCF8F4FBF7F3FDFBFAFFFFFFC7
              9462AF651EA8611D894F1859330FF7E7EBF7E7EB7B80810000007C8081F7E7EB
              F7E7EBB66A20DBA774E2AC76D48C45D28337FCF8F4D07C2ACE7927FCF8F4FDFA
              F7FFFEFEDEB893B4681FB5691FAE651E8F54195A340FF7E7EBF7E7EB7B808100
              00007B7F80F7E7EBF7E7EBB66A20DDAB7BE4B07DD7924ED58B42FEFBF8D28336
              D18031FDFAF7FFFEFED5904DC57222BA6C20BB6C20B66A2097581A623911F7E7
              EBF7E7EB7B80810000007C8180F7E7EBF7E7EBB66A20DEAE7FE6B584D99757D6
              904AFFFFFED3873DD28335FFFFFED89452CE7825CA7523C47222C47122BD6E21
              9F5D1C6E4013F7E7EBF7E7EB7B80810000007C8180F7E7EBF7E7EBB66A20DFB1
              86E9BD93DC9D60D7904CDDA36AD48940D28337DA9A5BD18031D07C2ACD7724CA
              7523C97523C37122A7611D7A4715F7E7EBF7E7EB7B80810000007C8180F7E7EB
              F7E7EBB66A20E0B48BEECBA9E3B384DFA76FDCA268DA9B5DD79351D68F4AD388
              3FD18031CF7B28CE7825CF7924CA7523AF651E864E17F7E7EBF7E7EB7B808100
              00007D8281F7E7EBF7E7EBB66A20E0B081F2D4B5EECDADECC7A3EAC199E7B98D
              E3AF7CE0A46ADB9652D6883BD3802ED37B27D67C25D37B25B96B20915419F7E7
              EBF7E7EB7B80810000007C8180F7E7EBF7E7EBB76A20D3995FE3B68BE4BE98E4
              BE98E3BA91E0B388DDAC7BD99F66D48F4DD0843ACD7C2CCB7726CF7824CC7623
              B86E269A5A1BF7E7EBF7E7EB7B80810000007C8180F7E7EBF7E7EBF7E7EBBD77
              34C4864AC4884CC4884CC28446C07E3FC18142BF7B3ABB742FB96F27B76C23B7
              6C23B66A21B76B20AB631EF7E7EBF7E7EBF7E7EB7B80810000007B8180F7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB75818100
              0000FF00FF7E8080F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EB808080FF00FF000000FF00FFFF00FF79808379808377818177818179808379
              8083778181778181798083798083778083778083798083798083778181778181
              798083798083748082FF00FFFF00FF000000}
            Pressed.Data = {
              AE060000424DAE06000000000000360000002800000017000000170000000100
              18000000000078060000120B0000120B00000000000000000000FF00FFFF00FF
              7981817981817882827781817980837980837782807782807980837980837781
              81778181798083798083778181778181787F82798083748082FF00FFFF00FF00
              0000FF00FF7E8081DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CF808080FF00FF0000007B8081DACBCFDACBCFDACBCFDACBCF7142136E401365
              3A115D351059330F59330F59330F59330F59330F59330F59330F59330F5A340F
              5A340F4C2B0DDACBCFDACBCF758181000000808080DACBCFDACBCFDACBCF9154
              199B5D209B5B1B94561A8D5218894F18854D17834D17844D17854D17854D1784
              4D17854D17895018804B16683F174C2C0DDACBCF7B80810000007F7F7FDACBCF
              DACBCFDACBCFA9621DB96B20BE6E21B4681FAF651EAC641EA6611DA25F1CA05E
              1CA15E1CA15E1CA25E1CA25E1CA6611DA25E1C804B165A340FDACBCF7B808100
              00007C8180DACBCFDACBCFDACBCFB2681FC47222C77322BD6E21B86B21B4681F
              AF661EAA621DA6611DA25E1CA15E1CA25E1CA25D1CA7611DA7611D8950185A34
              0FDACBCF7B7F840000007C8180DACBCFDACBCFDACBCFB66A20C77526C97626C0
              7224BB6D22C17E3FB3681FAE651EB5793DA25E1C9D5B1B9D5B1B9D5B1BA25E1C
              A25E1C854D1759330FDACBCF7B7F840000007B8180DACBCFDACBCFDACBCFB66A
              20CD7D30D38233C97829C27225FFFEFEB66A20B3681FFFFEFEB4783DA35E1CA0
              5D1C9E5B1BA25D1CA25E1C844D1759330FDACBCF7B80810000007B8180DACBCF
              DACBCFDACBCFB66A20D18740D98C43D07F31CA7929FDFBF8C07227B86C22FDFA
              F8FFFEFEB4783DA7611DA15E1CA25D1CA15D1C844D1759330FDACBCF7B808100
              00007D8281DACBCFDACBCFDACBCFB66A20D69657DD9A58D28439CF7D2DFCF8F4
              C77525C07022FBF7F3FDFAF8FFFEFECDA37BA7611DA8621DA35E1C854C175933
              0FDACBCF7B80810000007D8281DACBCFDACBCFDACBCFB66A20D9A169E0A56BD3
              883FD18031FCF8F4CC7623C97423FCF8F4FBF7F3FDFBFAFFFFFFC79462AF651E
              A8611D894F1859330FDACBCF7B80810000007C8180DACBCFDACBCFDACBCFB66A
              20DBA774E2AC76D48C45D28337FCF8F4D07C2ACE7927FCF8F4FDFAF7FFFEFEDE
              B893B4681FB5691FAE651E8F54195A340FDACBCF7B80810000007C8081DACBCF
              DACBCFDACBCFB66A20DDAB7BE4B07DD7924ED58B42FEFBF8D28336D18031FDFA
              F7FFFEFED5904DC57222BA6C20BB6C20B66A2097581A623911DACBCF7B808100
              00007B7F80DACBCFDACBCFDACBCFB66A20DEAE7FE6B584D99757D6904AFFFFFE
              D3873DD28335FFFFFED89452CE7825CA7523C47222C47122BD6E219F5D1C6E40
              13DACBCF7B80810000007C8180DACBCFDACBCFDACBCFB66A20DFB186E9BD93DC
              9D60D7904CDDA36AD48940D28337DA9A5BD18031D07C2ACD7724CA7523C97523
              C37122A7611D7A4715DACBCF7B80810000007C8180DACBCFDACBCFDACBCFB66A
              20E0B48BEECBA9E3B384DFA76FDCA268DA9B5DD79351D68F4AD3883FD18031CF
              7B28CE7825CF7924CA7523AF651E864E17DACBCF7B80810000007C8180DACBCF
              DACBCFDACBCFB66A20E0B081F2D4B5EECDADECC7A3EAC199E7B98DE3AF7CE0A4
              6ADB9652D6883BD3802ED37B27D67C25D37B25B96B20915419DACBCF7B808100
              00007D8281DACBCFDACBCFDACBCFB76A20D2985EE3B68BE4BE98E4BE98E3BA91
              E0B388DDAC7BD99F66D48F4DD0843ACD7C2CCB7726CF7824CC7623B76D259A5A
              1BDACBCF7B80810000007C8180DACBCFDACBCFDACBCFDACBCFBD7734C4864AC4
              884CC4884CC28446C07E3FC18142BF7B3ABB742FB96F27B76C23B76C23B66A21
              B76B20AB631EDACBCFDACBCF7B80810000007C8180DACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDA
              CBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF7B80810000007B8180DACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF75818100
              0000FF00FF7E8080DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CF808080FF00FF000000FF00FFFF00FF79808379808377818177818179808379
              8083778181778181798083798083778083778083798083798083778181778181
              798083798083748082FF00FFFF00FF000000}
            Disabled.Data = {
              AE060000424DAE06000000000000360000002800000017000000170000000100
              18000000000078060000120B0000120B00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FF5252
              525151514A4A4A43434341414141414141414141414141414141414141414141
              4141424242424242383838FF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FF6A6A6A726F6D7171716C6C6C6767676464646161616060606060606161
              616161616060606161616464645E5E5E4C4948383838FF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FF7B7B7B8787878B8B8B8484848080807E7E7E797979
              7676767575757575757575757676767676767979797676765E5E5E424242FF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FF8282828F8F8F9292928A8A8A87
              87878484848080807D7D7D7979797676767575757676767676767A7A7A7A7A7A
              646464424242FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FF8585859393
              939595958E8E8E8A8A8A9696968383837F7F7F8E8E8E76767673737373737373
              7373767676767676616161414141FF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FF8585859D9D9DA2A2A2969696909090FFFFFF858585838383FEFEFE8D8D
              8D787878757575747474767676767676606060414141FF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FF858585A9A9A9AEAEAEA0A0A0969696FBFBFB909090
              888888FBFBFBFEFEFE8D8D8D7A7A7A757575767676757575606060414141FF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FF858585B7B7B7BBBBBBA5A5A59C
              9C9CFAFAFA9393938D8D8DF9F9F9FBFBFBFFFFFFB2B2B27A7A7A7A7A7A787878
              616161414141FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FF858585C2C2
              C2C6C6C6A9A9A9A0A0A0FAFAFA959595939393F9F9F9F9F9F9FDFDFDFFFFFFA6
              A6A68080807B7B7B646464414141FF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FF858585C9C9C9CCCCCCADADADA4A4A4FAFAFA9B9B9B999999FAFAFAFBFB
              FBFFFFFFC6C6C68484848484847F7F7F696969424242FF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FF858585CCCCCCD1D1D1B2B2B2ABABABFCFCFCA3A3A3
              A0A0A0FBFBFBFFFFFFA8A8A89090908888888989898585856F6F6F474747FF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FF858585CECECED4D4D4B9B9B9B0
              B0B0FFFFFFA7A7A7A2A2A2FFFFFFAEAEAE9696969494948F8F8F8F8F8F8A8A8A
              747474515151FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FF858585D3D3
              D3DCDCDCBFBFBFB2B2B2BEBEBEAAAAAAA4A4A4B4B4B4A0A0A09B9B9B96969694
              94949393938E8E8E7A7A7A5A5A5AFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FF858585D4D4D4E6E6E6D3D3D3C8C8C8C3C3C3BDBDBDB5B5B5B0B0B0A9A9
              A9A0A0A0999999979797969696939393808080626262FF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FF858585D0D0D0EBEBEBE8E8E8E3E3E3DEDEDED9D9D9
              D0D0D0C6C6C6B7B7B7A7A7A79E9E9E9B9B9B9C9C9C9A9A9A8888886A6A6AFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FF858585BAB7B4D6D6D6DCDCDCDC
              DCDCD9D9D9D3D3D3CCCCCCC1C1C1B1B1B1A4A4A49A9A9A959595969696959595
              888481707070FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FF9595
              95A6A6A6A7A7A7A7A7A7A3A3A39E9E9EA0A0A09A9A9A9292928B8B8B88888888
              88888787878585857D7D7DFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF000000}
            State = sNormal
            Enabled = True
            CanBeDown = True
            Down = False
            ShowHint = True
            OnClick = btnAlterPlaybackRateClick
          end
          object btnSetShowTime: TSWButton
            Left = 246
            Top = 21
            Width = 25
            Height = 25
            Normal.Data = {
              AE060000424DAE06000000000000360000002800000017000000170000000100
              1800000000007806000000000000000000000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FF7142
              136E4013653A115D351059330F59330F59330F59330F59330F59330F59330F59
              330F5A340F5A340F4C2B0DFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FF9154199C58229B5B1B94561A8D5218894F18854D17834D17844D17854D
              17854D17844D17854D17895018804B16693A194C2C0DFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFA9621DB96B20BE6E21B4681FAF651EAC641EA6611D
              A25F1CA05E1CA15E1CA15E1CA25E1CA25E1CA6611DA25E1C804B165A340FFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB2681FC47222C77322BD6E21B8
              6B21B4681FAF661EAA621DA6611DA25E1CA15E1CA25E1CA25D1CA7611DA7611D
              8950185A340FFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB66A20C775
              26C97626C07224BB6D22B76A20B3681FAE651EA9621DA25E1C9D5B1B9D5B1B9D
              5B1BA25E1CA25E1C854D1759330FFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FFB66A20CD7D30D38233C97829C27225BD6E21B66A20B3681FAD641EA862
              1DA35E1CA05D1C9E5B1BA25D1CA25E1C844D1759330FFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFB66A20D18740D98C43D07F31CA7929C47323C07227
              B86C22B2671FAD651EA8621DA7611DA15E1CA25D1CA15D1C844D1759330FFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB66A20D69657DD9A58DEA46BFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA8621DA35E1C
              854C1759330FFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB66A20D9A1
              69E0A56BD3883FDCA064FFFFFFFFFFFFFFFFFFD4985EC98646C58547BE8247BC
              8044AF651EA8611D894F1859330FFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FFB66A20DBA774E2AC76D48C45D28337DA9A5AFFFFFFFFFFFFD7995BC572
              22C06F21BC6D21B4681FB5691FAE651E8F54195A340FFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFB66A20DDAB7BE4B07DD7924ED58B42D3873DDDA36A
              FFFFFFD9934FCE7925CB7623C57222BA6C20BB6C20B66A2097581A623911FF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB66A20DEAE7FE6B584D99757D6
              904AD58B41D3873DDDA268D18030D07C2BCE7825CA7523C47222C47122BD6E21
              9F5D1C6E4013FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB66A20DFB1
              86E9BD93DC9D60D7904CD68F48D48940D28337D28235D18031D07C2ACD7724CA
              7523C97523C37122A7611D7A4715FF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FFB66A20E0B48BEECBA9E3B384DFA76FDCA268DA9B5DD79351D68F4AD388
              3FD18031CF7B28CE7825CF7924CA7523AF651E864E17FF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFB66A20E0B081F2D4B5EECDADECC7A3EAC199E7B98D
              E3AF7CE0A46ADB9652D6883BD3802ED37B27D67C25D37B25B96B20915419FF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB76A20D49360E3B68BE4BE98E4
              BE98E3BA91E0B388DDAC7BD99F66D48F4DD0843ACD7C2CCB7726CF7824CC7623
              B869269A5A1BFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFBD77
              34C4864AC4884CC4884CC28446C07E3FC18142BF7B3ABB742FB96F27B76C23B7
              6C23B66A21B76B20AB631EFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF000000}
            MouseOver.Data = {
              AE060000424DAE06000000000000360000002800000017000000170000000100
              18000000000078060000120B0000120B00000000000000000000FF00FFFF00FF
              7981817981817882827781817980837980837782807782807980837980837781
              81778181798083798083778181778181787F82798083748082FF00FFFF00FF00
              0000FF00FF7E8081F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EB808080FF00FF0000007B8081F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7
              E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EB758181000000808080F7E7EBF7E7EBF7E7EB7142
              136E4013653A115D351059330F59330F59330F59330F59330F59330F59330F59
              330F5A340F5A340F4C2B0DF7E7EBF7E7EBF7E7EB7B8081000000808080F7E7EB
              F7E7EB9154199C5D219B5B1B94561A8D5218894F18854D17834D17844D17854D
              17854D17844D17854D17895018804B16693F184C2C0DF7E7EBF7E7EB7B808100
              00007F7F7FF7E7EBF7E7EBA9621DB96B20BE6E21B4681FAF651EAC641EA6611D
              A25F1CA05E1CA15E1CA15E1CA25E1CA25E1CA6611DA25E1C804B165A340FF7E7
              EBF7E7EB7B80810000007C8180F7E7EBF7E7EBB2681FC47222C77322BD6E21B8
              6B21B4681FAF661EAA621DA6611DA25E1CA15E1CA25E1CA25D1CA7611DA7611D
              8950185A340FF7E7EBF7E7EB7B7F840000007C8180F7E7EBF7E7EBB66A20C775
              26C97626C07224BB6D22B76A20B3681FAE651EA9621DA25E1C9D5B1B9D5B1B9D
              5B1BA25E1CA25E1C854D1759330FF7E7EBF7E7EB7B7F840000007B8180F7E7EB
              F7E7EBB66A20CD7D30D38233C97829C27225BD6E21B66A20B3681FAD641EA862
              1DA35E1CA05D1C9E5B1BA25D1CA25E1C844D1759330FF7E7EBF7E7EB7B808100
              00007B8180F7E7EBF7E7EBB66A20D18740D98C43D07F31CA7929C47323C07227
              B86C22B2671FAD651EA8621DA7611DA15E1CA25D1CA15D1C844D1759330FF7E7
              EBF7E7EB7B80810000007D8281F7E7EBF7E7EBB66A20D69657DD9A58DEA46BFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA8621DA35E1C
              854C1759330FF7E7EBF7E7EB7B80810000007C8180F7E7EBF7E7EBB66A20D9A1
              69E0A56BD3883FDCA064FFFFFFFFFFFFFFFFFFD4985EC98646C58547BE8247BC
              8044AF651EA8611D894F1859330FF7E7EBF7E7EB7B80810000007C8081F7E7EB
              F7E7EBB66A20DBA774E2AC76D48C45D28337DA9A5AFFFFFFFFFFFFD7995BC572
              22C06F21BC6D21B4681FB5691FAE651E8F54195A340FF7E7EBF7E7EB7B808100
              00007B7F80F7E7EBF7E7EBB66A20DDAB7BE4B07DD7924ED58B42D3873DDDA36A
              FFFFFFD9934FCE7925CB7623C57222BA6C20BB6C20B66A2097581A623911F7E7
              EBF7E7EB7B80810000007C8180F7E7EBF7E7EBB66A20DEAE7FE6B584D99757D6
              904AD58B41D3873DDDA268D18030D07C2BCE7825CA7523C47222C47122BD6E21
              9F5D1C6E4013F7E7EBF7E7EB7B80810000007C8180F7E7EBF7E7EBB66A20DFB1
              86E9BD93DC9D60D7904CD68F48D48940D28337D28235D18031D07C2ACD7724CA
              7523C97523C37122A7611D7A4715F7E7EBF7E7EB7B80810000007C8180F7E7EB
              F7E7EBB66A20E0B48BEECBA9E3B384DFA76FDCA268DA9B5DD79351D68F4AD388
              3FD18031CF7B28CE7825CF7924CA7523AF651E864E17F7E7EBF7E7EB7B808100
              00007D8281F7E7EBF7E7EBB66A20E0B081F2D4B5EECDADECC7A3EAC199E7B98D
              E3AF7CE0A46ADB9652D6883BD3802ED37B27D67C25D37B25B96B20915419F7E7
              EBF7E7EB7B80810000007C8180F7E7EBF7E7EBB76A20D3995FE3B68BE4BE98E4
              BE98E3BA91E0B388DDAC7BD99F66D48F4DD0843ACD7C2CCB7726CF7824CC7623
              B86E269A5A1BF7E7EBF7E7EB7B80810000007C8180F7E7EBF7E7EBF7E7EBBD77
              34C4864AC4884CC4884CC28446C07E3FC18142BF7B3ABB742FB96F27B76C23B7
              6C23B66A21B76B20AB631EF7E7EBF7E7EBF7E7EB7B80810000007B8180F7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB75818100
              0000FF00FF7E8080F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EB808080FF00FF000000FF00FFFF00FF79808379808377818177818179808379
              8083778181778181798083798083778083778083798083798083778181778181
              798083798083748082FF00FFFF00FF000000}
            Pressed.Data = {
              AE060000424DAE06000000000000360000002800000017000000170000000100
              18000000000078060000120B0000120B00000000000000000000FF00FFFF00FF
              7981817981817882827781817980837980837782807782807980837980837781
              81778181798083798083778181778181787F82798083748082FF00FFFF00FF00
              0000FF00FF7E8081DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CF808080FF00FF0000007B8081DACBCFDACBCFDACBCFDACBCF7142136E401365
              3A115D351059330F59330F59330F59330F59330F59330F59330F59330F5A340F
              5A340F4C2B0DDACBCFDACBCF758181000000808080DACBCFDACBCFDACBCF9154
              199B5D209B5B1B94561A8D5218894F18854D17834D17844D17854D17854D1784
              4D17854D17895018804B16683F174C2C0DDACBCF7B80810000007F7F7FDACBCF
              DACBCFDACBCFA9621DB96B20BE6E21B4681FAF651EAC641EA6611DA25F1CA05E
              1CA15E1CA15E1CA25E1CA25E1CA6611DA25E1C804B165A340FDACBCF7B808100
              00007C8180DACBCFDACBCFDACBCFB2681FC47222C77322BD6E21B86B21B4681F
              AF661EAA621DA6611DA25E1CA15E1CA25E1CA25D1CA7611DA7611D8950185A34
              0FDACBCF7B7F840000007C8180DACBCFDACBCFDACBCFB66A20C77526C97626C0
              7224BB6D22B76A20B3681FAE651EA9621DA25E1C9D5B1B9D5B1B9D5B1BA25E1C
              A25E1C854D1759330FDACBCF7B7F840000007B8180DACBCFDACBCFDACBCFB66A
              20CD7D30D38233C97829C27225BD6E21B66A20B3681FAD641EA8621DA35E1CA0
              5D1C9E5B1BA25D1CA25E1C844D1759330FDACBCF7B80810000007B8180DACBCF
              DACBCFDACBCFB66A20D18740D98C43D07F31CA7929C47323C07227B86C22B267
              1FAD651EA8621DA7611DA15E1CA25D1CA15D1C844D1759330FDACBCF7B808100
              00007D8281DACBCFDACBCFDACBCFB66A20D69657DD9A58DEA46BFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA8621DA35E1C854C175933
              0FDACBCF7B80810000007D8281DACBCFDACBCFDACBCFB66A20D9A169E0A56BD3
              883FDCA064FFFFFFFFFFFFFFFFFFD4985EC98646C58547BE8247BC8044AF651E
              A8611D894F1859330FDACBCF7B80810000007C8180DACBCFDACBCFDACBCFB66A
              20DBA774E2AC76D48C45D28337DA9A5AFFFFFFFFFFFFD7995BC57222C06F21BC
              6D21B4681FB5691FAE651E8F54195A340FDACBCF7B80810000007C8081DACBCF
              DACBCFDACBCFB66A20DDAB7BE4B07DD7924ED58B42D3873DDDA36AFFFFFFD993
              4FCE7925CB7623C57222BA6C20BB6C20B66A2097581A623911DACBCF7B808100
              00007B7F80DACBCFDACBCFDACBCFB66A20DEAE7FE6B584D99757D6904AD58B41
              D3873DDDA268D18030D07C2BCE7825CA7523C47222C47122BD6E219F5D1C6E40
              13DACBCF7B80810000007C8180DACBCFDACBCFDACBCFB66A20DFB186E9BD93DC
              9D60D7904CD68F48D48940D28337D28235D18031D07C2ACD7724CA7523C97523
              C37122A7611D7A4715DACBCF7B80810000007C8180DACBCFDACBCFDACBCFB66A
              20E0B48BEECBA9E3B384DFA76FDCA268DA9B5DD79351D68F4AD3883FD18031CF
              7B28CE7825CF7924CA7523AF651E864E17DACBCF7B80810000007C8180DACBCF
              DACBCFDACBCFB66A20E0B081F2D4B5EECDADECC7A3EAC199E7B98DE3AF7CE0A4
              6ADB9652D6883BD3802ED37B27D67C25D37B25B96B20915419DACBCF7B808100
              00007D8281DACBCFDACBCFDACBCFB76A20D2985EE3B68BE4BE98E4BE98E3BA91
              E0B388DDAC7BD99F66D48F4DD0843ACD7C2CCB7726CF7824CC7623B76D259A5A
              1BDACBCF7B80810000007C8180DACBCFDACBCFDACBCFDACBCFBD7734C4864AC4
              884CC4884CC28446C07E3FC18142BF7B3ABB742FB96F27B76C23B76C23B66A21
              B76B20AB631EDACBCFDACBCF7B80810000007C8180DACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDA
              CBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF7B80810000007B8180DACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF75818100
              0000FF00FF7E8080DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CF808080FF00FF000000FF00FFFF00FF79808379808377818177818179808379
              8083778181778181798083798083778083778083798083798083778181778181
              798083798083748082FF00FFFF00FF000000}
            Disabled.Data = {
              AE060000424DAE06000000000000360000002800000017000000170000000100
              18000000000078060000120B0000120B00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FF5252
              525151514A4A4A43434341414141414141414141414141414141414141414141
              4141424242424242383838FF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FF6A6A6A726F6D7171716C6C6C6767676464646161616060606060606161
              616161616060606161616464645E5E5E4C4948383838FF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FF7B7B7B8787878B8B8B8484848080807E7E7E797979
              7676767575757575757575757676767676767979797676765E5E5E424242FF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FF8282828F8F8F9292928A8A8A87
              87878484848080807D7D7D7979797676767575757676767676767A7A7A7A7A7A
              646464424242FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FF8585859393
              939595958E8E8E8A8A8A8585858383837F7F7F7B7B7B76767673737373737373
              7373767676767676616161414141FF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FF8585859D9D9DA2A2A29696969090908A8A8A8585858383837F7F7F7A7A
              7A787878757575747474767676767676606060414141FF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FF858585A9A9A9AEAEAEA0A0A09696968F8F8F909090
              8888888282827E7E7E7A7A7A7A7A7A757575767676757575606060414141FF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FF858585B7B7B7BBBBBBBCBCBCFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7A7A7A787878
              616161414141FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FF858585C2C2
              C2C6C6C6A9A9A9B8B8B8FFFFFFFFFFFFFFFFFFADADAD9F9F9F9C9C9C97979795
              95958080807B7B7B646464414141FF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FF858585C9C9C9CCCCCCADADADA4A4A4B3B3B3FFFFFFFFFFFFAFAFAF9090
              908D8D8D8989898484848484847F7F7F696969424242FF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FF858585CCCCCCD1D1D1B2B2B2ABABABA7A7A7BBBBBB
              FFFFFFACACAC9696969494949090908888888989898585856F6F6F474747FF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FF858585CECECED4D4D4B9B9B9B0
              B0B0ABABABA7A7A7B9B9B99E9E9E9B9B9B9696969494948F8F8F8F8F8F8A8A8A
              747474515151FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FF858585D3D3
              D3DCDCDCBFBFBFB2B2B2AFAFAFAAAAAAA4A4A4A2A2A2A0A0A09B9B9B96969694
              94949393938E8E8E7A7A7A5A5A5AFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FF858585D4D4D4E6E6E6D3D3D3C8C8C8C3C3C3BDBDBDB5B5B5B0B0B0A9A9
              A9A0A0A0999999979797969696939393808080626262FF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FF858585D0D0D0EBEBEBE8E8E8E3E3E3DEDEDED9D9D9
              D0D0D0C6C6C6B7B7B7A7A7A79E9E9E9B9B9B9C9C9C9A9A9A8888886A6A6AFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FF858585BAB7B4D6D6D6DCDCDCDC
              DCDCD9D9D9D3D3D3CCCCCCC1C1C1B1B1B1A4A4A49A9A9A959595969696959595
              888481707070FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FF9595
              95A6A6A6A7A7A7A7A7A7A3A3A39E9E9EA0A0A09A9A9A9292928B8B8B88888888
              88888787878585857D7D7DFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF000000}
            State = sNormal
            Enabled = True
            CanBeDown = False
            Down = False
            ShowHint = True
            OnClick = btnSetShowTimeClick
          end
          object btnSetHideTime: TSWButton
            Left = 270
            Top = 21
            Width = 25
            Height = 25
            Normal.Data = {
              AE060000424DAE06000000000000360000002800000017000000170000000100
              1800000000007806000000000000000000000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FF7142
              136E4013653A115D351059330F59330F59330F59330F59330F59330F59330F59
              330F5A340F5A340F4C2B0DFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FF9154199C58229B5B1B94561A8D5218894F18854D17834D17844D17854D
              17854D17844D17854D17895018804B16693A194C2C0DFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFA9621DB96B20BE6E21B4681FAF651EAC641EA6611D
              A25F1CA05E1CA15E1CA15E1CA25E1CA25E1CA6611DA25E1C804B165A340FFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB2681FC47222C77322BD6E21B8
              6B21B4681FAF661EAA621DA6611DA25E1CA15E1CA25E1CA25D1CA7611DA7611D
              8950185A340FFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB66A20C775
              26C97626C07224BB6D22B76A20B3681FAE651EA9621DA25E1C9D5B1B9D5B1B9D
              5B1BA25E1CA25E1C854D1759330FFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FFB66A20CD7D30D38233C97829C27225BD6E21B66A20B3681FAD641EA862
              1DA35E1CA05D1C9E5B1BA25D1CA25E1C844D1759330FFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFB66A20D18740D98C43D07F31CA7929C47323C07227
              B86C22B2671FAD651EA8621DA7611DA15E1CA25D1CA15D1C844D1759330FFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB66A20D69657DD9A58D28439FF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBE8956A35E1C
              854C1759330FFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB66A20D9A1
              69E0A56BD3883FD99553D99653D58E4AD28B48D4985EFFFFFFFFFFFFFFFFFFC3
              8C57AF651EA8611D894F1859330FFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FFB66A20DBA774E2AC76D48C45D28337D28335D07C2ACE7927D7995BFFFF
              FFFFFFFFC88849B4681FB5691FAE651E8F54195A340FFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFB66A20DDAB7BE4B07DD7924ED58B42D3873DD28336
              D18031D9934FFFFFFFD8995CC57222BA6C20BB6C20B66A2097581A623911FF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB66A20DEAE7FE6B584D99757D6
              904AD58B41D3873DD28335D18030DC9D60CE7825CA7523C47222C47122BD6E21
              9F5D1C6E4013FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB66A20DFB1
              86E9BD93DC9D60D7904CD68F48D48940D28337D28235D18031D07C2ACD7724CA
              7523C97523C37122A7611D7A4715FF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FFB66A20E0B48BEECBA9E3B384DFA76FDCA268DA9B5DD79351D68F4AD388
              3FD18031CF7B28CE7825CF7924CA7523AF651E864E17FF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFB66A20E0B081F2D4B5EECDADECC7A3EAC199E7B98D
              E3AF7CE0A46ADB9652D6883BD3802ED37B27D67C25D37B25B96B20915419FF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB76A20D49360E3B68BE4BE98E4
              BE98E3BA91E0B388DDAC7BD99F66D48F4DD0843ACD7C2CCB7726CF7824CC7623
              B869269A5A1BFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFBD77
              34C4864AC4884CC4884CC28446C07E3FC18142BF7B3ABB742FB96F27B76C23B7
              6C23B66A21B76B20AB631EFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF000000}
            MouseOver.Data = {
              AE060000424DAE06000000000000360000002800000017000000170000000100
              18000000000078060000120B0000120B00000000000000000000FF00FFFF00FF
              7981817981817882827781817980837980837782807782807980837980837781
              81778181798083798083778181778181787F82798083748082FF00FFFF00FF00
              0000FF00FF7E8081F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EB808080FF00FF0000007B8081F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7
              E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EB758181000000808080F7E7EBF7E7EBF7E7EB7142
              136E4013653A115D351059330F59330F59330F59330F59330F59330F59330F59
              330F5A340F5A340F4C2B0DF7E7EBF7E7EBF7E7EB7B8081000000808080F7E7EB
              F7E7EB9154199C5D219B5B1B94561A8D5218894F18854D17834D17844D17854D
              17854D17844D17854D17895018804B16693F184C2C0DF7E7EBF7E7EB7B808100
              00007F7F7FF7E7EBF7E7EBA9621DB96B20BE6E21B4681FAF651EAC641EA6611D
              A25F1CA05E1CA15E1CA15E1CA25E1CA25E1CA6611DA25E1C804B165A340FF7E7
              EBF7E7EB7B80810000007C8180F7E7EBF7E7EBB2681FC47222C77322BD6E21B8
              6B21B4681FAF661EAA621DA6611DA25E1CA15E1CA25E1CA25D1CA7611DA7611D
              8950185A340FF7E7EBF7E7EB7B7F840000007C8180F7E7EBF7E7EBB66A20C775
              26C97626C07224BB6D22B76A20B3681FAE651EA9621DA25E1C9D5B1B9D5B1B9D
              5B1BA25E1CA25E1C854D1759330FF7E7EBF7E7EB7B7F840000007B8180F7E7EB
              F7E7EBB66A20CD7D30D38233C97829C27225BD6E21B66A20B3681FAD641EA862
              1DA35E1CA05D1C9E5B1BA25D1CA25E1C844D1759330FF7E7EBF7E7EB7B808100
              00007B8180F7E7EBF7E7EBB66A20D18740D98C43D07F31CA7929C47323C07227
              B86C22B2671FAD651EA8621DA7611DA15E1CA25D1CA15D1C844D1759330FF7E7
              EBF7E7EB7B80810000007D8281F7E7EBF7E7EBB66A20D69657DD9A58D28439FF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBE8956A35E1C
              854C1759330FF7E7EBF7E7EB7B80810000007C8180F7E7EBF7E7EBB66A20D9A1
              69E0A56BD3883FD99553D99653D58E4AD28B48D4985EFFFFFFFFFFFFFFFFFFC3
              8C57AF651EA8611D894F1859330FF7E7EBF7E7EB7B80810000007C8081F7E7EB
              F7E7EBB66A20DBA774E2AC76D48C45D28337D28335D07C2ACE7927D7995BFFFF
              FFFFFFFFC88849B4681FB5691FAE651E8F54195A340FF7E7EBF7E7EB7B808100
              00007B7F80F7E7EBF7E7EBB66A20DDAB7BE4B07DD7924ED58B42D3873DD28336
              D18031D9934FFFFFFFD8995CC57222BA6C20BB6C20B66A2097581A623911F7E7
              EBF7E7EB7B80810000007C8180F7E7EBF7E7EBB66A20DEAE7FE6B584D99757D6
              904AD58B41D3873DD28335D18030DC9D60CE7825CA7523C47222C47122BD6E21
              9F5D1C6E4013F7E7EBF7E7EB7B80810000007C8180F7E7EBF7E7EBB66A20DFB1
              86E9BD93DC9D60D7904CD68F48D48940D28337D28235D18031D07C2ACD7724CA
              7523C97523C37122A7611D7A4715F7E7EBF7E7EB7B80810000007C8180F7E7EB
              F7E7EBB66A20E0B48BEECBA9E3B384DFA76FDCA268DA9B5DD79351D68F4AD388
              3FD18031CF7B28CE7825CF7924CA7523AF651E864E17F7E7EBF7E7EB7B808100
              00007D8281F7E7EBF7E7EBB66A20E0B081F2D4B5EECDADECC7A3EAC199E7B98D
              E3AF7CE0A46ADB9652D6883BD3802ED37B27D67C25D37B25B96B20915419F7E7
              EBF7E7EB7B80810000007C8180F7E7EBF7E7EBB76A20D3995FE3B68BE4BE98E4
              BE98E3BA91E0B388DDAC7BD99F66D48F4DD0843ACD7C2CCB7726CF7824CC7623
              B86E269A5A1BF7E7EBF7E7EB7B80810000007C8180F7E7EBF7E7EBF7E7EBBD77
              34C4864AC4884CC4884CC28446C07E3FC18142BF7B3ABB742FB96F27B76C23B7
              6C23B66A21B76B20AB631EF7E7EBF7E7EBF7E7EB7B80810000007B8180F7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB75818100
              0000FF00FF7E8080F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EB808080FF00FF000000FF00FFFF00FF79808379808377818177818179808379
              8083778181778181798083798083778083778083798083798083778181778181
              798083798083748082FF00FFFF00FF000000}
            Pressed.Data = {
              AE060000424DAE06000000000000360000002800000017000000170000000100
              18000000000078060000120B0000120B00000000000000000000FF00FFFF00FF
              7981817981817882827781817980837980837782807782807980837980837781
              81778181798083798083778181778181787F82798083748082FF00FFFF00FF00
              0000FF00FF7E8081DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CF808080FF00FF0000007B8081DACBCFDACBCFDACBCFDACBCF7142136E401365
              3A115D351059330F59330F59330F59330F59330F59330F59330F59330F5A340F
              5A340F4C2B0DDACBCFDACBCF758181000000808080DACBCFDACBCFDACBCF9154
              199B5D209B5B1B94561A8D5218894F18854D17834D17844D17854D17854D1784
              4D17854D17895018804B16683F174C2C0DDACBCF7B80810000007F7F7FDACBCF
              DACBCFDACBCFA9621DB96B20BE6E21B4681FAF651EAC641EA6611DA25F1CA05E
              1CA15E1CA15E1CA25E1CA25E1CA6611DA25E1C804B165A340FDACBCF7B808100
              00007C8180DACBCFDACBCFDACBCFB2681FC47222C77322BD6E21B86B21B4681F
              AF661EAA621DA6611DA25E1CA15E1CA25E1CA25D1CA7611DA7611D8950185A34
              0FDACBCF7B7F840000007C8180DACBCFDACBCFDACBCFB66A20C77526C97626C0
              7224BB6D22B76A20B3681FAE651EA9621DA25E1C9D5B1B9D5B1B9D5B1BA25E1C
              A25E1C854D1759330FDACBCF7B7F840000007B8180DACBCFDACBCFDACBCFB66A
              20CD7D30D38233C97829C27225BD6E21B66A20B3681FAD641EA8621DA35E1CA0
              5D1C9E5B1BA25D1CA25E1C844D1759330FDACBCF7B80810000007B8180DACBCF
              DACBCFDACBCFB66A20D18740D98C43D07F31CA7929C47323C07227B86C22B267
              1FAD651EA8621DA7611DA15E1CA25D1CA15D1C844D1759330FDACBCF7B808100
              00007D8281DACBCFDACBCFDACBCFB66A20D69657DD9A58D28439FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBE8956A35E1C854C175933
              0FDACBCF7B80810000007D8281DACBCFDACBCFDACBCFB66A20D9A169E0A56BD3
              883FD99553D99653D58E4AD28B48D4985EFFFFFFFFFFFFFFFFFFC38C57AF651E
              A8611D894F1859330FDACBCF7B80810000007C8180DACBCFDACBCFDACBCFB66A
              20DBA774E2AC76D48C45D28337D28335D07C2ACE7927D7995BFFFFFFFFFFFFC8
              8849B4681FB5691FAE651E8F54195A340FDACBCF7B80810000007C8081DACBCF
              DACBCFDACBCFB66A20DDAB7BE4B07DD7924ED58B42D3873DD28336D18031D993
              4FFFFFFFD8995CC57222BA6C20BB6C20B66A2097581A623911DACBCF7B808100
              00007B7F80DACBCFDACBCFDACBCFB66A20DEAE7FE6B584D99757D6904AD58B41
              D3873DD28335D18030DC9D60CE7825CA7523C47222C47122BD6E219F5D1C6E40
              13DACBCF7B80810000007C8180DACBCFDACBCFDACBCFB66A20DFB186E9BD93DC
              9D60D7904CD68F48D48940D28337D28235D18031D07C2ACD7724CA7523C97523
              C37122A7611D7A4715DACBCF7B80810000007C8180DACBCFDACBCFDACBCFB66A
              20E0B48BEECBA9E3B384DFA76FDCA268DA9B5DD79351D68F4AD3883FD18031CF
              7B28CE7825CF7924CA7523AF651E864E17DACBCF7B80810000007C8180DACBCF
              DACBCFDACBCFB66A20E0B081F2D4B5EECDADECC7A3EAC199E7B98DE3AF7CE0A4
              6ADB9652D6883BD3802ED37B27D67C25D37B25B96B20915419DACBCF7B808100
              00007D8281DACBCFDACBCFDACBCFB76A20D2985EE3B68BE4BE98E4BE98E3BA91
              E0B388DDAC7BD99F66D48F4DD0843ACD7C2CCB7726CF7824CC7623B76D259A5A
              1BDACBCF7B80810000007C8180DACBCFDACBCFDACBCFDACBCFBD7734C4864AC4
              884CC4884CC28446C07E3FC18142BF7B3ABB742FB96F27B76C23B76C23B66A21
              B76B20AB631EDACBCFDACBCF7B80810000007C8180DACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDA
              CBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF7B80810000007B8180DACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF75818100
              0000FF00FF7E8080DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CF808080FF00FF000000FF00FFFF00FF79808379808377818177818179808379
              8083778181778181798083798083778083778083798083798083778181778181
              798083798083748082FF00FFFF00FF000000}
            Disabled.Data = {
              AE060000424DAE06000000000000360000002800000017000000170000000100
              18000000000078060000120B0000120B00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FF5252
              525151514A4A4A43434341414141414141414141414141414141414141414141
              4141424242424242383838FF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FF6A6A6A726F6D7171716C6C6C6767676464646161616060606060606161
              616161616060606161616464645E5E5E4C4948383838FF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FF7B7B7B8787878B8B8B8484848080807E7E7E797979
              7676767575757575757575757676767676767979797676765E5E5E424242FF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FF8282828F8F8F9292928A8A8A87
              87878484848080807D7D7D7979797676767575757676767676767A7A7A7A7A7A
              646464424242FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FF8585859393
              939595958E8E8E8A8A8A8585858383837F7F7F7B7B7B76767673737373737373
              7373767676767676616161414141FF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FF8585859D9D9DA2A2A29696969090908A8A8A8585858383837F7F7F7A7A
              7A787878757575747474767676767676606060414141FF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FF858585A9A9A9AEAEAEA0A0A09696968F8F8F909090
              8888888282827E7E7E7A7A7A7A7A7A757575767676757575606060414141FF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FF858585B7B7B7BBBBBBA5A5A5FF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9B9B9B787878
              616161414141FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FF858585C2C2
              C2C6C6C6A9A9A9B0B0B0AFAFAFA8A8A8A5A5A5ADADADFFFFFFFFFFFFFFFFFF9F
              9F9F8080807B7B7B646464414141FF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FF858585C9C9C9CCCCCCADADADA4A4A4A2A2A29B9B9B999999AFAFAFFFFF
              FFFFFFFF9F9F9F8484848484847F7F7F696969424242FF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FF858585CCCCCCD1D1D1B2B2B2ABABABA7A7A7A3A3A3
              A0A0A0ACACACFFFFFFB0B0B09090908888888989898585856F6F6F474747FF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FF858585CECECED4D4D4B9B9B9B0
              B0B0ABABABA7A7A7A2A2A29E9E9EB4B4B49696969494948F8F8F8F8F8F8A8A8A
              747474515151FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FF858585D3D3
              D3DCDCDCBFBFBFB2B2B2AFAFAFAAAAAAA4A4A4A2A2A2A0A0A09B9B9B96969694
              94949393938E8E8E7A7A7A5A5A5AFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FF858585D4D4D4E6E6E6D3D3D3C8C8C8C3C3C3BDBDBDB5B5B5B0B0B0A9A9
              A9A0A0A0999999979797969696939393808080626262FF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FF858585D0D0D0EBEBEBE8E8E8E3E3E3DEDEDED9D9D9
              D0D0D0C6C6C6B7B7B7A7A7A79E9E9E9B9B9B9C9C9C9A9A9A8888886A6A6AFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FF858585BAB7B4D6D6D6DCDCDCDC
              DCDCD9D9D9D3D3D3CCCCCCC1C1C1B1B1B1A4A4A49A9A9A959595969696959595
              888481707070FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FF9595
              95A6A6A6A7A7A7A7A7A7A3A3A39E9E9EA0A0A09A9A9A9292928B8B8B88888888
              88888787878585857D7D7DFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF000000}
            State = sNormal
            Enabled = True
            CanBeDown = False
            Down = False
            ShowHint = True
            OnClick = btnSetHideTimeClick
          end
          object btnStartSubtitle: TSWButton
            Left = 294
            Top = 21
            Width = 27
            Height = 25
            Normal.Data = {
              AE060000424DAE06000000000000360000002800000017000000170000000100
              1800000000007806000000000000000000000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FF7142
              136E4013653A115D351059330F59330F59330F59330F59330F59330F59330F59
              330F5A340F5A340F4C2B0DFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FF9154199C58229B5B1B94561A8D5218894F18854D17834D17844D17854D
              17854D17844D17854D17895018804B16693A194C2C0DFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFA9621DB96B20BE6E21B4681FAF651EAC641EA6611D
              A25F1CA05E1CA15E1CA15E1CA25E1CA25E1CA6611DA25E1C804B165A340FFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB2681FC47222C77322BD6E21B8
              6B21B4681FAF661EAA621DA6611DA25E1CA15E1CA25E1CA25D1CA7611DA7611D
              8950185A340FFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB66A20C775
              26C97626C07224BB6D22B76A20B3681FAE651EA9621DA25E1C9D5B1B9D5B1B9D
              5B1BA25E1CA25E1C854D1759330FFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FFB66A20CD7D30D38233C97829C27225BD6E21C78D54F8F0E9AD641EA862
              1DA35E1CA05D1C9E5B1BA25D1CA25E1C844D1759330FFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFB66A20D18740D98C43D07F31CA7929CE8B49F9F1EA
              F8F1E9B2671FAD651EA8621DF6F0E9A15E1CA25D1CA15D1C844D1759330FFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB66A20D69657DD9A58D28439DA
              9B5CF9F1E9F9F1E9CC8B4CBB6C20B76B20B1671FF6F0E9A7611DA8621DA35E1C
              854C1759330FFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB66A20D9A1
              69E0A56BD3883FFAF2EAFAF2EAD79453C97423C47222F8F0E9F8F0E9F7F0E9F7
              F0E9F7F0E9A8611D894F1859330FFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FFB66A20DBA774E2AC76D48C45DC9F64FAF2EBFAF2EAD7924FCB7724C572
              22C06F21F8F0E9B4681FB5691FAE651E8F54195A340FFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFB66A20DDAB7BE4B07DD7924ED58B42DA9C5EFAF2EB
              FAF2EAD17D2ACE7925CB7623F9F1E9BA6C20BB6C20B66A2097581A623911FF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB66A20DEAE7FE6B584D99757D6
              904AD58B41DDA36AFAF2EBD18030D07C2BCE7825CA7523C47222C47122BD6E21
              9F5D1C6E4013FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB66A20DFB1
              86E9BD93DC9D60D7904CD68F48D48940D28337D28235D18031D07C2ACD7724CA
              7523C97523C37122A7611D7A4715FF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FFB66A20E0B48BEECBA9E3B384DFA76FDCA268DA9B5DD79351D68F4AD388
              3FD18031CF7B28CE7825CF7924CA7523AF651E864E17FF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFB66A20E0B081F2D4B5EECDADECC7A3EAC199E7B98D
              E3AF7CE0A46ADB9652D6883BD3802ED37B27D67C25D37B25B96B20915419FF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB76A20D49360E3B68BE4BE98E4
              BE98E3BA91E0B388DDAC7BD99F66D48F4DD0843ACD7C2CCB7726CF7824CC7623
              B869269A5A1BFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFBD77
              34C4864AC4884CC4884CC28446C07E3FC18142BF7B3ABB742FB96F27B76C23B7
              6C23B66A21B76B20AB631EFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF000000}
            MouseOver.Data = {
              AE060000424DAE06000000000000360000002800000017000000170000000100
              18000000000078060000120B0000120B00000000000000000000FF00FFFF00FF
              7981817981817882827781817980837980837782807782807980837980837781
              81778181798083798083778181778181787F82798083748082FF00FFFF00FF00
              0000FF00FF7E8081F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EB808080FF00FF0000007B8081F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7
              E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EB758181000000808080F7E7EBF7E7EBF7E7EB7142
              136E4013653A115D351059330F59330F59330F59330F59330F59330F59330F59
              330F5A340F5A340F4C2B0DF7E7EBF7E7EBF7E7EB7B8081000000808080F7E7EB
              F7E7EB9154199C5D219B5B1B94561A8D5218894F18854D17834D17844D17854D
              17854D17844D17854D17895018804B16693F184C2C0DF7E7EBF7E7EB7B808100
              00007F7F7FF7E7EBF7E7EBA9621DB96B20BE6E21B4681FAF651EAC641EA6611D
              A25F1CA05E1CA15E1CA15E1CA25E1CA25E1CA6611DA25E1C804B165A340FF7E7
              EBF7E7EB7B80810000007C8180F7E7EBF7E7EBB2681FC47222C77322BD6E21B8
              6B21B4681FAF661EAA621DA6611DA25E1CA15E1CA25E1CA25D1CA7611DA7611D
              8950185A340FF7E7EBF7E7EB7B7F840000007C8180F7E7EBF7E7EBB66A20C775
              26C97626C07224BB6D22B76A20B3681FAE651EA9621DA25E1C9D5B1B9D5B1B9D
              5B1BA25E1CA25E1C854D1759330FF7E7EBF7E7EB7B7F840000007B8180F7E7EB
              F7E7EBB66A20CD7D30D38233C97829C27225BD6E21C78D54F8F0E9AD641EA862
              1DA35E1CA05D1C9E5B1BA25D1CA25E1C844D1759330FF7E7EBF7E7EB7B808100
              00007B8180F7E7EBF7E7EBB66A20D18740D98C43D07F31CA7929CE8B49F9F1EA
              F8F1E9B2671FAD651EA8621DF6F0E9A15E1CA25D1CA15D1C844D1759330FF7E7
              EBF7E7EB7B80810000007D8281F7E7EBF7E7EBB66A20D69657DD9A58D28439DA
              9B5CF9F1E9F9F1E9CC8B4CBB6C20B76B20B1671FF6F0E9A7611DA8621DA35E1C
              854C1759330FF7E7EBF7E7EB7B80810000007C8180F7E7EBF7E7EBB66A20D9A1
              69E0A56BD3883FFAF2EAFAF2EAD79453C97423C47222F8F0E9F8F0E9F7F0E9F7
              F0E9F7F0E9A8611D894F1859330FF7E7EBF7E7EB7B80810000007C8081F7E7EB
              F7E7EBB66A20DBA774E2AC76D48C45DC9F64FAF2EBFAF2EAD7924FCB7724C572
              22C06F21F8F0E9B4681FB5691FAE651E8F54195A340FF7E7EBF7E7EB7B808100
              00007B7F80F7E7EBF7E7EBB66A20DDAB7BE4B07DD7924ED58B42DA9C5EFAF2EB
              FAF2EAD17D2ACE7925CB7623F9F1E9BA6C20BB6C20B66A2097581A623911F7E7
              EBF7E7EB7B80810000007C8180F7E7EBF7E7EBB66A20DEAE7FE6B584D99757D6
              904AD58B41DDA36AFAF2EBD18030D07C2BCE7825CA7523C47222C47122BD6E21
              9F5D1C6E4013F7E7EBF7E7EB7B80810000007C8180F7E7EBF7E7EBB66A20DFB1
              86E9BD93DC9D60D7904CD68F48D48940D28337D28235D18031D07C2ACD7724CA
              7523C97523C37122A7611D7A4715F7E7EBF7E7EB7B80810000007C8180F7E7EB
              F7E7EBB66A20E0B48BEECBA9E3B384DFA76FDCA268DA9B5DD79351D68F4AD388
              3FD18031CF7B28CE7825CF7924CA7523AF651E864E17F7E7EBF7E7EB7B808100
              00007D8281F7E7EBF7E7EBB66A20E0B081F2D4B5EECDADECC7A3EAC199E7B98D
              E3AF7CE0A46ADB9652D6883BD3802ED37B27D67C25D37B25B96B20915419F7E7
              EBF7E7EB7B80810000007C8180F7E7EBF7E7EBB76A20D3995FE3B68BE4BE98E4
              BE98E3BA91E0B388DDAC7BD99F66D48F4DD0843ACD7C2CCB7726CF7824CC7623
              B86E269A5A1BF7E7EBF7E7EB7B80810000007C8180F7E7EBF7E7EBF7E7EBBD77
              34C4864AC4884CC4884CC28446C07E3FC18142BF7B3ABB742FB96F27B76C23B7
              6C23B66A21B76B20AB631EF7E7EBF7E7EBF7E7EB7B80810000007B8180F7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB75818100
              0000FF00FF7E8080F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EB808080FF00FF000000FF00FFFF00FF79808379808377818177818179808379
              8083778181778181798083798083778083778083798083798083778181778181
              798083798083748082FF00FFFF00FF000000}
            Pressed.Data = {
              AE060000424DAE06000000000000360000002800000017000000170000000100
              18000000000078060000120B0000120B00000000000000000000FF00FFFF00FF
              7981817981817882827781817980837980837782807782807980837980837781
              81778181798083798083778181778181787F82798083748082FF00FFFF00FF00
              0000FF00FF7E8081DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CF808080FF00FF0000007B8081DACBCFDACBCFDACBCFDACBCF7142136E401365
              3A115D351059330F59330F59330F59330F59330F59330F59330F59330F5A340F
              5A340F4C2B0DDACBCFDACBCF758181000000808080DACBCFDACBCFDACBCF9154
              199B5D209B5B1B94561A8D5218894F18854D17834D17844D17854D17854D1784
              4D17854D17895018804B16683F174C2C0DDACBCF7B80810000007F7F7FDACBCF
              DACBCFDACBCFA9621DB96B20BE6E21B4681FAF651EAC641EA6611DA25F1CA05E
              1CA15E1CA15E1CA25E1CA25E1CA6611DA25E1C804B165A340FDACBCF7B808100
              00007C8180DACBCFDACBCFDACBCFB2681FC47222C77322BD6E21B86B21B4681F
              AF661EAA621DA6611DA25E1CA15E1CA25E1CA25D1CA7611DA7611D8950185A34
              0FDACBCF7B7F840000007C8180DACBCFDACBCFDACBCFB66A20C77526C97626C0
              7224BB6D22B76A20B3681FAE651EA9621DA25E1C9D5B1B9D5B1B9D5B1BA25E1C
              A25E1C854D1759330FDACBCF7B7F840000007B8180DACBCFDACBCFDACBCFB66A
              20CD7D30D38233C97829C27225BD6E21C78D54F8F0E9AD641EA8621DA35E1CA0
              5D1C9E5B1BA25D1CA25E1C844D1759330FDACBCF7B80810000007B8180DACBCF
              DACBCFDACBCFB66A20D18740D98C43D07F31CA7929CE8B49F9F1EAF8F1E9B267
              1FAD651EA8621DF6F0E9A15E1CA25D1CA15D1C844D1759330FDACBCF7B808100
              00007D8281DACBCFDACBCFDACBCFB66A20D69657DD9A58D28439DA9B5CF9F1E9
              F9F1E9CC8B4CBB6C20B76B20B1671FF6F0E9A7611DA8621DA35E1C854C175933
              0FDACBCF7B80810000007D8281DACBCFDACBCFDACBCFB66A20D9A169E0A56BD3
              883FFAF2EAFAF2EAD79453C97423C47222F8F0E9F8F0E9F7F0E9F7F0E9F7F0E9
              A8611D894F1859330FDACBCF7B80810000007C8180DACBCFDACBCFDACBCFB66A
              20DBA774E2AC76D48C45DC9F64FAF2EBFAF2EAD7924FCB7724C57222C06F21F8
              F0E9B4681FB5691FAE651E8F54195A340FDACBCF7B80810000007C8081DACBCF
              DACBCFDACBCFB66A20DDAB7BE4B07DD7924ED58B42DA9C5EFAF2EBFAF2EAD17D
              2ACE7925CB7623F9F1E9BA6C20BB6C20B66A2097581A623911DACBCF7B808100
              00007B7F80DACBCFDACBCFDACBCFB66A20DEAE7FE6B584D99757D6904AD58B41
              DDA36AFAF2EBD18030D07C2BCE7825CA7523C47222C47122BD6E219F5D1C6E40
              13DACBCF7B80810000007C8180DACBCFDACBCFDACBCFB66A20DFB186E9BD93DC
              9D60D7904CD68F48D48940D28337D28235D18031D07C2ACD7724CA7523C97523
              C37122A7611D7A4715DACBCF7B80810000007C8180DACBCFDACBCFDACBCFB66A
              20E0B48BEECBA9E3B384DFA76FDCA268DA9B5DD79351D68F4AD3883FD18031CF
              7B28CE7825CF7924CA7523AF651E864E17DACBCF7B80810000007C8180DACBCF
              DACBCFDACBCFB66A20E0B081F2D4B5EECDADECC7A3EAC199E7B98DE3AF7CE0A4
              6ADB9652D6883BD3802ED37B27D67C25D37B25B96B20915419DACBCF7B808100
              00007D8281DACBCFDACBCFDACBCFB76A20D2985EE3B68BE4BE98E4BE98E3BA91
              E0B388DDAC7BD99F66D48F4DD0843ACD7C2CCB7726CF7824CC7623B76D259A5A
              1BDACBCF7B80810000007C8180DACBCFDACBCFDACBCFDACBCFBD7734C4864AC4
              884CC4884CC28446C07E3FC18142BF7B3ABB742FB96F27B76C23B76C23B66A21
              B76B20AB631EDACBCFDACBCF7B80810000007C8180DACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDA
              CBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF7B80810000007B8180DACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF75818100
              0000FF00FF7E8080DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CF808080FF00FF000000FF00FFFF00FF79808379808377818177818179808379
              8083778181778181798083798083778083778083798083798083778181778181
              798083798083748082FF00FFFF00FF000000}
            Disabled.Data = {
              AE060000424DAE06000000000000360000002800000017000000170000000100
              18000000000078060000120B0000120B00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FF5252
              525151514A4A4A43434341414141414141414141414141414141414141414141
              4141424242424242383838FF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FF6A6A6A726F6D7171716C6C6C6767676464646161616060606060606161
              616161616060606161616464645E5E5E4C4948383838FF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FF7B7B7B8787878B8B8B8484848080807E7E7E797979
              7676767575757575757575757676767676767979797676765E5E5E424242FF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FF8282828F8F8F9292928A8A8A87
              87878484848080807D7D7D7979797676767575757676767676767A7A7A7A7A7A
              646464424242FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FF8585859393
              939595958E8E8E8A8A8A8585858383837F7F7F7B7B7B76767673737373737373
              7373767676767676616161414141FF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FF8585859D9D9DA2A2A29696969090908A8A8AA2A2A2F3F3F37F7F7F7A7A
              7A787878757575747474767676767676606060414141FF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FF858585A9A9A9AEAEAEA0A0A0969696A2A2A2F4F4F4
              F3F3F38282827E7E7E7A7A7AF2F2F2757575767676757575606060414141FF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FF858585B7B7B7BBBBBBA5A5A5B2
              B2B2F5F5F5F4F4F4A2A2A2898989858585828282F2F2F27A7A7A7A7A7A787878
              616161414141FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FF858585C2C2
              C2C6C6C6A9A9A9F6F6F6F5F5F5ACACAC9393938F8F8FF4F4F4F3F3F3F3F3F3F2
              F2F2F3F3F37B7B7B646464414141FF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FF858585C9C9C9CCCCCCADADADB8B8B8F6F6F6F5F5F5ACACAC9494949090
              908D8D8DF3F3F38484848484847F7F7F696969424242FF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FF858585CCCCCCD1D1D1B2B2B2ABABABB6B6B6F6F6F6
              F6F6F69B9B9B969696949494F4F4F48888888989898585856F6F6F474747FF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FF858585CECECED4D4D4B9B9B9B0
              B0B0ABABABBCBCBCF6F6F69E9E9E9B9B9B9696969494948F8F8F8F8F8F8A8A8A
              747474515151FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FF858585D3D3
              D3DCDCDCBFBFBFB2B2B2AFAFAFAAAAAAA4A4A4A2A2A2A0A0A09B9B9B96969694
              94949393938E8E8E7A7A7A5A5A5AFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FF858585D4D4D4E6E6E6D3D3D3C8C8C8C3C3C3BDBDBDB5B5B5B0B0B0A9A9
              A9A0A0A0999999979797969696939393808080626262FF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FF858585D0D0D0EBEBEBE8E8E8E3E3E3DEDEDED9D9D9
              D0D0D0C6C6C6B7B7B7A7A7A79E9E9E9B9B9B9C9C9C9A9A9A8888886A6A6AFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FF858585BAB7B4D6D6D6DCDCDCDC
              DCDCD9D9D9D3D3D3CCCCCCC1C1C1B1B1B1A4A4A49A9A9A959595969696959595
              888481707070FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FF9595
              95A6A6A6A7A7A7A7A7A7A3A3A39E9E9EA0A0A09A9A9A9292928B8B8B88888888
              88888787878585857D7D7DFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF000000}
            State = sNormal
            Enabled = True
            CanBeDown = False
            Down = False
            ShowHint = True
            OnClick = btnStartSubtitleClick
          end
          object btnEndSubtitle: TSWButton
            Left = 318
            Top = 21
            Width = 27
            Height = 25
            Normal.Data = {
              AE060000424DAE06000000000000360000002800000017000000170000000100
              1800000000007806000000000000000000000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FF7142
              136E4013653A115D351059330F59330F59330F59330F59330F59330F59330F59
              330F5A340F5A340F4C2B0DFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FF9154199C58229B5B1B94561A8D5218894F18854D17834D17844D17854D
              17854D17844D17854D17895018804B16693A194C2C0DFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFA9621DB96B20BE6E21B4681FAF651EAC641EA6611D
              A25F1CA05E1CA15E1CA15E1CA25E1CA25E1CA6611DA25E1C804B165A340FFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB2681FC47222C77322BD6E21B8
              6B21B4681FAF661EAA621DA6611DA25E1CA15E1CA25E1CA25D1CA7611DA7611D
              8950185A340FFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB66A20C775
              26C97626C07224BB6D22B76A20BB7838AE651EA9621DA25E1C9D5B1B9D5B1B9D
              5B1BA25E1CA25E1C854D1759330FFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FFB66A20CD7D30D38233C97829C27225D5A271FFFFFFC08246AD641EA862
              1DF6EFE9B683519E5B1BA25D1CA25E1C844D1759330FFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFB66A20D18740D98C43D07F31D28D4AFEFCFBFCF9F6
              DCB691B2671FAD651EF6F0E9F6F0E9B17A43A25D1CA15D1C844D1759330FFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB66A20D69657DD9A58D3873DFB
              F5EFF2DECAEFD8C2F4E6D9BB6C20B76B20C08449F6F0E9F6F0E9BB854FA35E1C
              854C1759330FFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB66A20D9A1
              69E0A56BDA995AF4E2D1D18132DDA26AFEFCFBC47222BE6E21B96B20C1874FF7
              F0E9F7F0E9A8611D894F1859330FFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FFB66A20DBA774E2AC76D48C45D28337D28335D07C2AFEFCFBDBA36BC572
              22CC8B4BF8F0E9F8F0E9C58B51AE651E8F54195A340FFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFB66A20DDAB7BE4B07DD7924ED58B42D3873DD28336
              F7E9DCF1D7BECE7925F9F1E9F9F1E9C68547BB6C20B66A2097581A623911FF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB66A20DEAE7FE6B584D99757D6
              904AD58B41D3873DEBC8A7FBF4EDD07C2BFAF1E9D79657C47222C47122BD6E21
              9F5D1C6E4013FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB66A20DFB1
              86E9BD93DC9D60D7904CD68F48D48940D99553FFFFFED4883FD07C2ACD7724CA
              7523C97523C37122A7611D7A4715FF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FFB66A20E0B48BEECBA9E3B384DFA76FDCA268DA9B5DD79351DDA167D388
              3FD18031CF7B28CE7825CF7924CA7523AF651E864E17FF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFB66A20E0B081F2D4B5EECDADECC7A3EAC199E7B98D
              E3AF7CE0A46ADB9652D6883BD3802ED37B27D67C25D37B25B96B20915419FF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB76A20D49360E3B68BE4BE98E4
              BE98E3BA91E0B388DDAC7BD99F66D48F4DD0843ACD7C2CCB7726CF7824CC7623
              B869269A5A1BFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFBD77
              34C4864AC4884CC4884CC28446C07E3FC18142BF7B3ABB742FB96F27B76C23B7
              6C23B66A21B76B20AB631EFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF000000}
            MouseOver.Data = {
              AE060000424DAE06000000000000360000002800000017000000170000000100
              18000000000078060000120B0000120B00000000000000000000FF00FFFF00FF
              7981817981817882827781817980837980837782807782807980837980837781
              81778181798083798083778181778181787F82798083748082FF00FFFF00FF00
              0000FF00FF7E8081F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EB808080FF00FF0000007B8081F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7
              E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EB758181000000808080F7E7EBF7E7EBF7E7EB7142
              136E4013653A115D351059330F59330F59330F59330F59330F59330F59330F59
              330F5A340F5A340F4C2B0DF7E7EBF7E7EBF7E7EB7B8081000000808080F7E7EB
              F7E7EB9154199C5D219B5B1B94561A8D5218894F18854D17834D17844D17854D
              17854D17844D17854D17895018804B16693F184C2C0DF7E7EBF7E7EB7B808100
              00007F7F7FF7E7EBF7E7EBA9621DB96B20BE6E21B4681FAF651EAC641EA6611D
              A25F1CA05E1CA15E1CA15E1CA25E1CA25E1CA6611DA25E1C804B165A340FF7E7
              EBF7E7EB7B80810000007C8180F7E7EBF7E7EBB2681FC47222C77322BD6E21B8
              6B21B4681FAF661EAA621DA6611DA25E1CA15E1CA25E1CA25D1CA7611DA7611D
              8950185A340FF7E7EBF7E7EB7B7F840000007C8180F7E7EBF7E7EBB66A20C775
              26C97626C07224BB6D22B76A20BB7838AE651EA9621DA25E1C9D5B1B9D5B1B9D
              5B1BA25E1CA25E1C854D1759330FF7E7EBF7E7EB7B7F840000007B8180F7E7EB
              F7E7EBB66A20CD7D30D38233C97829C27225D5A271FFFFFFC08246AD641EA862
              1DF6EFE9B683519E5B1BA25D1CA25E1C844D1759330FF7E7EBF7E7EB7B808100
              00007B8180F7E7EBF7E7EBB66A20D18740D98C43D07F31D28D4AFEFCFBFCF9F6
              DCB691B2671FAD651EF6F0E9F6F0E9B17A43A25D1CA15D1C844D1759330FF7E7
              EBF7E7EB7B80810000007D8281F7E7EBF7E7EBB66A20D69657DD9A58D3873DFB
              F5EFF2DECAEFD8C2F4E6D9BB6C20B76B20C08449F6F0E9F6F0E9BB854FA35E1C
              854C1759330FF7E7EBF7E7EB7B80810000007C8180F7E7EBF7E7EBB66A20D9A1
              69E0A56BDA995AF4E2D1D18132DDA26AFEFCFBC47222BE6E21B96B20C1874FF7
              F0E9F7F0E9A8611D894F1859330FF7E7EBF7E7EB7B80810000007C8081F7E7EB
              F7E7EBB66A20DBA774E2AC76D48C45D28337D28335D07C2AFEFCFBDBA36BC572
              22CC8B4BF8F0E9F8F0E9C58B51AE651E8F54195A340FF7E7EBF7E7EB7B808100
              00007B7F80F7E7EBF7E7EBB66A20DDAB7BE4B07DD7924ED58B42D3873DD28336
              F7E9DCF1D7BECE7925F9F1E9F9F1E9C68547BB6C20B66A2097581A623911F7E7
              EBF7E7EB7B80810000007C8180F7E7EBF7E7EBB66A20DEAE7FE6B584D99757D6
              904AD58B41D3873DEBC8A7FBF4EDD07C2BFAF1E9D79657C47222C47122BD6E21
              9F5D1C6E4013F7E7EBF7E7EB7B80810000007C8180F7E7EBF7E7EBB66A20DFB1
              86E9BD93DC9D60D7904CD68F48D48940D99553FFFFFED4883FD07C2ACD7724CA
              7523C97523C37122A7611D7A4715F7E7EBF7E7EB7B80810000007C8180F7E7EB
              F7E7EBB66A20E0B48BEECBA9E3B384DFA76FDCA268DA9B5DD79351DDA167D388
              3FD18031CF7B28CE7825CF7924CA7523AF651E864E17F7E7EBF7E7EB7B808100
              00007D8281F7E7EBF7E7EBB66A20E0B081F2D4B5EECDADECC7A3EAC199E7B98D
              E3AF7CE0A46ADB9652D6883BD3802ED37B27D67C25D37B25B96B20915419F7E7
              EBF7E7EB7B80810000007C8180F7E7EBF7E7EBB76A20D3995FE3B68BE4BE98E4
              BE98E3BA91E0B388DDAC7BD99F66D48F4DD0843ACD7C2CCB7726CF7824CC7623
              B86E269A5A1BF7E7EBF7E7EB7B80810000007C8180F7E7EBF7E7EBF7E7EBBD77
              34C4864AC4884CC4884CC28446C07E3FC18142BF7B3ABB742FB96F27B76C23B7
              6C23B66A21B76B20AB631EF7E7EBF7E7EBF7E7EB7B80810000007B8180F7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB75818100
              0000FF00FF7E8080F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EB808080FF00FF000000FF00FFFF00FF79808379808377818177818179808379
              8083778181778181798083798083778083778083798083798083778181778181
              798083798083748082FF00FFFF00FF000000}
            Pressed.Data = {
              AE060000424DAE06000000000000360000002800000017000000170000000100
              18000000000078060000120B0000120B00000000000000000000FF00FFFF00FF
              7981817981817882827781817980837980837782807782807980837980837781
              81778181798083798083778181778181787F82798083748082FF00FFFF00FF00
              0000FF00FF7E8081DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CF808080FF00FF0000007B8081DACBCFDACBCFDACBCFDACBCF7142136E401365
              3A115D351059330F59330F59330F59330F59330F59330F59330F59330F5A340F
              5A340F4C2B0DDACBCFDACBCF758181000000808080DACBCFDACBCFDACBCF9154
              199B5D209B5B1B94561A8D5218894F18854D17834D17844D17854D17854D1784
              4D17854D17895018804B16683F174C2C0DDACBCF7B80810000007F7F7FDACBCF
              DACBCFDACBCFA9621DB96B20BE6E21B4681FAF651EAC641EA6611DA25F1CA05E
              1CA15E1CA15E1CA25E1CA25E1CA6611DA25E1C804B165A340FDACBCF7B808100
              00007C8180DACBCFDACBCFDACBCFB2681FC47222C77322BD6E21B86B21B4681F
              AF661EAA621DA6611DA25E1CA15E1CA25E1CA25D1CA7611DA7611D8950185A34
              0FDACBCF7B7F840000007C8180DACBCFDACBCFDACBCFB66A20C77526C97626C0
              7224BB6D22B76A20BB7838AE651EA9621DA25E1C9D5B1B9D5B1B9D5B1BA25E1C
              A25E1C854D1759330FDACBCF7B7F840000007B8180DACBCFDACBCFDACBCFB66A
              20CD7D30D38233C97829C27225D5A271FFFFFFC08246AD641EA8621DF6EFE9B6
              83519E5B1BA25D1CA25E1C844D1759330FDACBCF7B80810000007B8180DACBCF
              DACBCFDACBCFB66A20D18740D98C43D07F31D28D4AFEFCFBFCF9F6DCB691B267
              1FAD651EF6F0E9F6F0E9B17A43A25D1CA15D1C844D1759330FDACBCF7B808100
              00007D8281DACBCFDACBCFDACBCFB66A20D69657DD9A58D3873DFBF5EFF2DECA
              EFD8C2F4E6D9BB6C20B76B20C08449F6F0E9F6F0E9BB854FA35E1C854C175933
              0FDACBCF7B80810000007D8281DACBCFDACBCFDACBCFB66A20D9A169E0A56BDA
              995AF4E2D1D18132DDA26AFEFCFBC47222BE6E21B96B20C1874FF7F0E9F7F0E9
              A8611D894F1859330FDACBCF7B80810000007C8180DACBCFDACBCFDACBCFB66A
              20DBA774E2AC76D48C45D28337D28335D07C2AFEFCFBDBA36BC57222CC8B4BF8
              F0E9F8F0E9C58B51AE651E8F54195A340FDACBCF7B80810000007C8081DACBCF
              DACBCFDACBCFB66A20DDAB7BE4B07DD7924ED58B42D3873DD28336F7E9DCF1D7
              BECE7925F9F1E9F9F1E9C68547BB6C20B66A2097581A623911DACBCF7B808100
              00007B7F80DACBCFDACBCFDACBCFB66A20DEAE7FE6B584D99757D6904AD58B41
              D3873DEBC8A7FBF4EDD07C2BFAF1E9D79657C47222C47122BD6E219F5D1C6E40
              13DACBCF7B80810000007C8180DACBCFDACBCFDACBCFB66A20DFB186E9BD93DC
              9D60D7904CD68F48D48940D99553FFFFFED4883FD07C2ACD7724CA7523C97523
              C37122A7611D7A4715DACBCF7B80810000007C8180DACBCFDACBCFDACBCFB66A
              20E0B48BEECBA9E3B384DFA76FDCA268DA9B5DD79351DDA167D3883FD18031CF
              7B28CE7825CF7924CA7523AF651E864E17DACBCF7B80810000007C8180DACBCF
              DACBCFDACBCFB66A20E0B081F2D4B5EECDADECC7A3EAC199E7B98DE3AF7CE0A4
              6ADB9652D6883BD3802ED37B27D67C25D37B25B96B20915419DACBCF7B808100
              00007D8281DACBCFDACBCFDACBCFB76A20D2985EE3B68BE4BE98E4BE98E3BA91
              E0B388DDAC7BD99F66D48F4DD0843ACD7C2CCB7726CF7824CC7623B76D259A5A
              1BDACBCF7B80810000007C8180DACBCFDACBCFDACBCFDACBCFBD7734C4864AC4
              884CC4884CC28446C07E3FC18142BF7B3ABB742FB96F27B76C23B76C23B66A21
              B76B20AB631EDACBCFDACBCF7B80810000007C8180DACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDA
              CBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF7B80810000007B8180DACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF75818100
              0000FF00FF7E8080DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CF808080FF00FF000000FF00FFFF00FF79808379808377818177818179808379
              8083778181778181798083798083778083778083798083798083778181778181
              798083798083748082FF00FFFF00FF000000}
            Disabled.Data = {
              AE060000424DAE06000000000000360000002800000017000000170000000100
              18000000000078060000120B0000120B00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FF5252
              525151514A4A4A43434341414141414141414141414141414141414141414141
              4141424242424242383838FF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FF6A6A6A726F6D7171716C6C6C6767676464646161616060606060606161
              616161616060606161616464645E5E5E4C4948383838FF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FF7B7B7B8787878B8B8B8484848080807E7E7E797979
              7676767575757575757575757676767676767979797676765E5E5E424242FF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FF8282828F8F8F9292928A8A8A87
              87878484848080807D7D7D7979797676767575757676767676767A7A7A7A7A7A
              646464424242FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FF8585859393
              939595958E8E8E8A8A8A8585859191917F7F7F7B7B7B76767673737373737373
              7373767676767676616161414141FF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FF8585859D9D9DA2A2A2969696909090B4B4B4FFFFFF9898987F7F7F7A7A
              7AF2F2F2959595747474767676767676606060414141FF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FF858585A9A9A9AEAEAEA0A0A0A6A6A6FDFDFDFBFBFB
              C4C4C48282827E7E7EF2F2F2F2F2F28D8D8D767676757575606060414141FF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FF858585B7B7B7BBBBBBA7A7A7F8
              F8F8E6E6E6E1E1E1ECECEC8989898585859A9A9AF2F2F2F2F2F2989898787878
              616161414141FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FF858585C2C2
              C2C6C6C6B5B5B5EAEAEA9F9F9FB7B7B7FDFDFD8F8F8F8B8B8B8787879B9B9BF2
              F2F2F3F3F37B7B7B646464414141FF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FF858585C9C9C9CCCCCCADADADA4A4A4A2A2A29B9B9BFDFDFDB6B6B69090
              90A2A2A2F3F3F3F3F3F39F9F9F7F7F7F696969424242FF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FF858585CCCCCCD1D1D1B2B2B2ABABABA7A7A7A3A3A3
              EFEFEFE0E0E0969696F5F5F5F4F4F49D9D9D8989898585856F6F6F474747FF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FF858585CECECED4D4D4B9B9B9B0
              B0B0ABABABA7A7A7D7D7D7F7F7F79B9B9BF5F5F5ADADAD8F8F8F8F8F8F8A8A8A
              747474515151FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FF858585D3D3
              D3DCDCDCBFBFBFB2B2B2AFAFAFAAAAAAB0B0B0FFFFFFA7A7A79B9B9B96969694
              94949393938E8E8E7A7A7A5A5A5AFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FF858585D4D4D4E6E6E6D3D3D3C8C8C8C3C3C3BDBDBDB5B5B5BCBCBCA9A9
              A9A0A0A0999999979797969696939393808080626262FF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FF858585D0D0D0EBEBEBE8E8E8E3E3E3DEDEDED9D9D9
              D0D0D0C6C6C6B7B7B7A7A7A79E9E9E9B9B9B9C9C9C9A9A9A8888886A6A6AFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FF858585BAB7B4D6D6D6DCDCDCDC
              DCDCD9D9D9D3D3D3CCCCCCC1C1C1B1B1B1A4A4A49A9A9A959595969696959595
              888481707070FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FF9595
              95A6A6A6A7A7A7A7A7A7A3A3A39E9E9EA0A0A09A9A9A9292928B8B8B88888888
              88888787878585857D7D7DFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF000000}
            State = sNormal
            Enabled = True
            CanBeDown = False
            Down = False
            ShowHint = True
            OnClick = btnEndSubtitleClick
          end
          object btnAddSyncPoint: TSWButton
            Left = 398
            Top = 21
            Width = 27
            Height = 25
            Normal.Data = {
              AE060000424DAE06000000000000360000002800000017000000170000000100
              1800000000007806000000000000000000000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FF7142
              136E4013653A115D351059330F59330F59330F59330F59330F59330F59330F59
              330F5A340F5A340F4C2B0DFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FF9154199C58229B5B1B94561A8D5218894F18854D17834D17844D17854D
              17854D17844D17854D17895018804B16693A194C2C0DFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFA9621DB96B20BE6E21B4681FAF651EAC641EA6611D
              A25F1CA05E1CA15E1CA15E1CA25E1CA25E1CA6611DA25E1C804B165A340FFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB2681FC47222C77322BD6E21B8
              6B21B4681FAF661EAA621DA6611DA25E1CA15E1CA25E1CA25D1CA7611DA7611D
              8950185A340FFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB66A20C775
              26C97626C07224BB6D22C07D3CF1E3D6FFFFFFFFFFFFEEE2D5BC8F639D5B1B9D
              5B1BA25E1CA25E1C854D1759330FFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FFB66A20CD7D30D38233C97829C27225C9894AD6AB82C58E57C28C56D3B0
              8EFFFFFFB27B469E5B1BA25D1CA25E1C844D1759330FFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFB66A20D18740D98C43D07F31CA7929C47323C07227
              B86C22B2671FAD651EFAF6F2D3B08EA15E1CA25D1CA15D1C844D1759330FFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB66A20D69657DD9A58D28439CF
              7D2DCC7827C77525C07022BF752ED7AC82FFFFFFC89C72A7611DA8621DA35E1C
              854C1759330FFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB66A20D9A1
              69E0A56BD3883FD18031D07E2DDCA168F4E5D6FFFFFFFFFFFFE0BF9EAF651EAE
              651EAF651EA8611D894F1859330FFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FFB66A20DBA774E2AC76D48C45D28337DA9A5BFFFFFFF0D6BCDBA269C572
              22C06F21BC6D21B4681FB5691FAE651E8F54195A340FFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFB66A20DDAB7BE4B07DD7924ED58B42DEA56EFFFFFF
              D4883ED17D2ACE7925CB7623C57222BA6C20BB6C20B66A2097581A623911FF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB66A20DEAE7FE6B584D99757D6
              904ADA9959FFFFFFEED0B3DC9F63DC9D60E4B385D1873FC47222C47122BD6E21
              9F5D1C6E4013FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB66A20DFB1
              86E9BD93DC9D60D7904CD68F48E1AE7CFAF0E7FFFFFFFFFFFFF6E6D7D48940CA
              7523C97523C37122A7611D7A4715FF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FFB66A20E0B48BEECBA9E3B384DFA76FDCA268DA9B5DD79351D68F4AD388
              3FD18031CF7B28CE7825CF7924CA7523AF651E864E17FF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFB66A20E0B081F2D4B5EECDADECC7A3EAC199E7B98D
              E3AF7CE0A46ADB9652D6883BD3802ED37B27D67C25D37B25B96B20915419FF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB76A20D49360E3B68BE4BE98E4
              BE98E3BA91E0B388DDAC7BD99F66D48F4DD0843ACD7C2CCB7726CF7824CC7623
              B869269A5A1BFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFBD77
              34C4864AC4884CC4884CC28446C07E3FC18142BF7B3ABB742FB96F27B76C23B7
              6C23B66A21B76B20AB631EFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF000000}
            MouseOver.Data = {
              AE060000424DAE06000000000000360000002800000017000000170000000100
              18000000000078060000120B0000120B00000000000000000000FF00FFFF00FF
              7981817981817882827781817980837980837782807782807980837980837781
              81778181798083798083778181778181787F82798083748082FF00FFFF00FF00
              0000FF00FF7E8081F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EB808080FF00FF0000007B8081F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7
              E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EB758181000000808080F7E7EBF7E7EBF7E7EB7142
              136E4013653A115D351059330F59330F59330F59330F59330F59330F59330F59
              330F5A340F5A340F4C2B0DF7E7EBF7E7EBF7E7EB7B8081000000808080F7E7EB
              F7E7EB9154199C5D219B5B1B94561A8D5218894F18854D17834D17844D17854D
              17854D17844D17854D17895018804B16693F184C2C0DF7E7EBF7E7EB7B808100
              00007F7F7FF7E7EBF7E7EBA9621DB96B20BE6E21B4681FAF651EAC641EA6611D
              A25F1CA05E1CA15E1CA15E1CA25E1CA25E1CA6611DA25E1C804B165A340FF7E7
              EBF7E7EB7B80810000007C8180F7E7EBF7E7EBB2681FC47222C77322BD6E21B8
              6B21B4681FAF661EAA621DA6611DA25E1CA15E1CA25E1CA25D1CA7611DA7611D
              8950185A340FF7E7EBF7E7EB7B7F840000007C8180F7E7EBF7E7EBB66A20C775
              26C97626C07224BB6D22C07D3CF1E3D6FFFFFFFFFFFFEEE2D5BC8F639D5B1B9D
              5B1BA25E1CA25E1C854D1759330FF7E7EBF7E7EB7B7F840000007B8180F7E7EB
              F7E7EBB66A20CD7D30D38233C97829C27225C9894AD6AB82C58E57C28C56D3B0
              8EFFFFFFB27B469E5B1BA25D1CA25E1C844D1759330FF7E7EBF7E7EB7B808100
              00007B8180F7E7EBF7E7EBB66A20D18740D98C43D07F31CA7929C47323C07227
              B86C22B2671FAD651EFAF6F2D3B08EA15E1CA25D1CA15D1C844D1759330FF7E7
              EBF7E7EB7B80810000007D8281F7E7EBF7E7EBB66A20D69657DD9A58D28439CF
              7D2DCC7827C77525C07022BF752ED7AC82FFFFFFC89C72A7611DA8621DA35E1C
              854C1759330FF7E7EBF7E7EB7B80810000007C8180F7E7EBF7E7EBB66A20D9A1
              69E0A56BD3883FD18031D07E2DDCA168F4E5D6FFFFFFFFFFFFE0BF9EAF651EAE
              651EAF651EA8611D894F1859330FF7E7EBF7E7EB7B80810000007C8081F7E7EB
              F7E7EBB66A20DBA774E2AC76D48C45D28337DA9A5BFFFFFFF0D6BCDBA269C572
              22C06F21BC6D21B4681FB5691FAE651E8F54195A340FF7E7EBF7E7EB7B808100
              00007B7F80F7E7EBF7E7EBB66A20DDAB7BE4B07DD7924ED58B42DEA56EFFFFFF
              D4883ED17D2ACE7925CB7623C57222BA6C20BB6C20B66A2097581A623911F7E7
              EBF7E7EB7B80810000007C8180F7E7EBF7E7EBB66A20DEAE7FE6B584D99757D6
              904ADA9959FFFFFFEED0B3DC9F63DC9D60E4B385D1873FC47222C47122BD6E21
              9F5D1C6E4013F7E7EBF7E7EB7B80810000007C8180F7E7EBF7E7EBB66A20DFB1
              86E9BD93DC9D60D7904CD68F48E1AE7CFAF0E7FFFFFFFFFFFFF6E6D7D48940CA
              7523C97523C37122A7611D7A4715F7E7EBF7E7EB7B80810000007C8180F7E7EB
              F7E7EBB66A20E0B48BEECBA9E3B384DFA76FDCA268DA9B5DD79351D68F4AD388
              3FD18031CF7B28CE7825CF7924CA7523AF651E864E17F7E7EBF7E7EB7B808100
              00007D8281F7E7EBF7E7EBB66A20E0B081F2D4B5EECDADECC7A3EAC199E7B98D
              E3AF7CE0A46ADB9652D6883BD3802ED37B27D67C25D37B25B96B20915419F7E7
              EBF7E7EB7B80810000007C8180F7E7EBF7E7EBB76A20D3995FE3B68BE4BE98E4
              BE98E3BA91E0B388DDAC7BD99F66D48F4DD0843ACD7C2CCB7726CF7824CC7623
              B86E269A5A1BF7E7EBF7E7EB7B80810000007C8180F7E7EBF7E7EBF7E7EBBD77
              34C4864AC4884CC4884CC28446C07E3FC18142BF7B3ABB742FB96F27B76C23B7
              6C23B66A21B76B20AB631EF7E7EBF7E7EBF7E7EB7B80810000007B8180F7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB75818100
              0000FF00FF7E8080F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EB808080FF00FF000000FF00FFFF00FF79808379808377818177818179808379
              8083778181778181798083798083778083778083798083798083778181778181
              798083798083748082FF00FFFF00FF000000}
            Pressed.Data = {
              AE060000424DAE06000000000000360000002800000017000000170000000100
              18000000000078060000120B0000120B00000000000000000000FF00FFFF00FF
              7981817981817882827781817980837980837782807782807980837980837781
              81778181798083798083778181778181787F82798083748082FF00FFFF00FF00
              0000FF00FF7E8081DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CF808080FF00FF0000007B8081DACBCFDACBCFDACBCFDACBCF7142136E401365
              3A115D351059330F59330F59330F59330F59330F59330F59330F59330F5A340F
              5A340F4C2B0DDACBCFDACBCF758181000000808080DACBCFDACBCFDACBCF9154
              199B5D209B5B1B94561A8D5218894F18854D17834D17844D17854D17854D1784
              4D17854D17895018804B16683F174C2C0DDACBCF7B80810000007F7F7FDACBCF
              DACBCFDACBCFA9621DB96B20BE6E21B4681FAF651EAC641EA6611DA25F1CA05E
              1CA15E1CA15E1CA25E1CA25E1CA6611DA25E1C804B165A340FDACBCF7B808100
              00007C8180DACBCFDACBCFDACBCFB2681FC47222C77322BD6E21B86B21B4681F
              AF661EAA621DA6611DA25E1CA15E1CA25E1CA25D1CA7611DA7611D8950185A34
              0FDACBCF7B7F840000007C8180DACBCFDACBCFDACBCFB66A20C77526C97626C0
              7224BB6D22C07D3CF1E3D6FFFFFFFFFFFFEEE2D5BC8F639D5B1B9D5B1BA25E1C
              A25E1C854D1759330FDACBCF7B7F840000007B8180DACBCFDACBCFDACBCFB66A
              20CD7D30D38233C97829C27225C9894AD6AB82C58E57C28C56D3B08EFFFFFFB2
              7B469E5B1BA25D1CA25E1C844D1759330FDACBCF7B80810000007B8180DACBCF
              DACBCFDACBCFB66A20D18740D98C43D07F31CA7929C47323C07227B86C22B267
              1FAD651EFAF6F2D3B08EA15E1CA25D1CA15D1C844D1759330FDACBCF7B808100
              00007D8281DACBCFDACBCFDACBCFB66A20D69657DD9A58D28439CF7D2DCC7827
              C77525C07022BF752ED7AC82FFFFFFC89C72A7611DA8621DA35E1C854C175933
              0FDACBCF7B80810000007D8281DACBCFDACBCFDACBCFB66A20D9A169E0A56BD3
              883FD18031D07E2DDCA168F4E5D6FFFFFFFFFFFFE0BF9EAF651EAE651EAF651E
              A8611D894F1859330FDACBCF7B80810000007C8180DACBCFDACBCFDACBCFB66A
              20DBA774E2AC76D48C45D28337DA9A5BFFFFFFF0D6BCDBA269C57222C06F21BC
              6D21B4681FB5691FAE651E8F54195A340FDACBCF7B80810000007C8081DACBCF
              DACBCFDACBCFB66A20DDAB7BE4B07DD7924ED58B42DEA56EFFFFFFD4883ED17D
              2ACE7925CB7623C57222BA6C20BB6C20B66A2097581A623911DACBCF7B808100
              00007B7F80DACBCFDACBCFDACBCFB66A20DEAE7FE6B584D99757D6904ADA9959
              FFFFFFEED0B3DC9F63DC9D60E4B385D1873FC47222C47122BD6E219F5D1C6E40
              13DACBCF7B80810000007C8180DACBCFDACBCFDACBCFB66A20DFB186E9BD93DC
              9D60D7904CD68F48E1AE7CFAF0E7FFFFFFFFFFFFF6E6D7D48940CA7523C97523
              C37122A7611D7A4715DACBCF7B80810000007C8180DACBCFDACBCFDACBCFB66A
              20E0B48BEECBA9E3B384DFA76FDCA268DA9B5DD79351D68F4AD3883FD18031CF
              7B28CE7825CF7924CA7523AF651E864E17DACBCF7B80810000007C8180DACBCF
              DACBCFDACBCFB66A20E0B081F2D4B5EECDADECC7A3EAC199E7B98DE3AF7CE0A4
              6ADB9652D6883BD3802ED37B27D67C25D37B25B96B20915419DACBCF7B808100
              00007D8281DACBCFDACBCFDACBCFB76A20D2985EE3B68BE4BE98E4BE98E3BA91
              E0B388DDAC7BD99F66D48F4DD0843ACD7C2CCB7726CF7824CC7623B76D259A5A
              1BDACBCF7B80810000007C8180DACBCFDACBCFDACBCFDACBCFBD7734C4864AC4
              884CC4884CC28446C07E3FC18142BF7B3ABB742FB96F27B76C23B76C23B66A21
              B76B20AB631EDACBCFDACBCF7B80810000007C8180DACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDA
              CBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF7B80810000007B8180DACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF75818100
              0000FF00FF7E8080DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CF808080FF00FF000000FF00FFFF00FF79808379808377818177818179808379
              8083778181778181798083798083778083778083798083798083778181778181
              798083798083748082FF00FFFF00FF000000}
            Disabled.Data = {
              AE060000424DAE06000000000000360000002800000017000000170000000100
              18000000000078060000120B0000120B00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FF5252
              525151514A4A4A43434341414141414141414141414141414141414141414141
              4141424242424242383838FF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FF6A6A6A726F6D7171716C6C6C6767676464646161616060606060606161
              616161616060606161616464645E5E5E4C4948383838FF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FF7B7B7B8787878B8B8B8484848080807E7E7E797979
              7676767575757575757575757676767676767979797676765E5E5E424242FF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FF8282828F8F8F9292928A8A8A87
              87878484848080807D7D7D7979797676767575757676767676767A7A7A7A7A7A
              646464424242FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FF8585859393
              939595958E8E8E8A8A8A949494E8E8E8FFFFFFFFFFFFE6E6E69F9F9F73737373
              7373767676767676616161414141FF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FF8585859D9D9DA2A2A2969696909090A0A0A0BBBBBBA2A2A29F9F9FBDBD
              BDFFFFFF8F8F8F747474767676767676606060414141FF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FF858585A9A9A9AEAEAEA0A0A09696968F8F8F909090
              8888888282827E7E7EF7F7F7BDBDBD757575767676757575606060414141FF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FF858585B7B7B7BBBBBBA5A5A59C
              9C9C9797979393938D8D8D909090BBBBBBFFFFFFADADAD7A7A7A7A7A7A787878
              616161414141FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FF858585C2C2
              C2C6C6C6A9A9A9A0A0A09D9D9DB6B6B6EBEBEBFFFFFFFFFFFFCBCBCB8080807F
              7F7F8080807B7B7B646464414141FF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FF858585C9C9C9CCCCCCADADADA4A4A4B4B4B4FFFFFFDFDFDFB6B6B69090
              908D8D8D8989898484848484847F7F7F696969424242FF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FF858585CCCCCCD1D1D1B2B2B2ABABABBDBDBDFFFFFF
              A6A6A69B9B9B9696969494949090908888888989898585856F6F6F474747FF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FF858585CECECED4D4D4B9B9B9B0
              B0B0B6B6B6FFFFFFDCDCDCB6B6B6B4B4B4C4C4C4A1A1A18F8F8F8F8F8F8A8A8A
              747474515151FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FF858585D3D3
              D3DCDCDCBFBFBFB2B2B2AFAFAFC5C5C5F4F4F4FFFFFFFFFFFFEDEDEDA3A3A394
              94949393938E8E8E7A7A7A5A5A5AFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FF858585D4D4D4E6E6E6D3D3D3C8C8C8C3C3C3BDBDBDB5B5B5B0B0B0A9A9
              A9A0A0A0999999979797969696939393808080626262FF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FF858585D0D0D0EBEBEBE8E8E8E3E3E3DEDEDED9D9D9
              D0D0D0C6C6C6B7B7B7A7A7A79E9E9E9B9B9B9C9C9C9A9A9A8888886A6A6AFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FF858585BAB7B4D6D6D6DCDCDCDC
              DCDCD9D9D9D3D3D3CCCCCCC1C1C1B1B1B1A4A4A49A9A9A959595969696959595
              888481707070FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FF9595
              95A6A6A6A7A7A7A7A7A7A3A3A39E9E9EA0A0A09A9A9A9292928B8B8B88888888
              88888787878585857D7D7DFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF000000}
            State = sNormal
            Enabled = True
            CanBeDown = False
            Down = False
            ShowHint = True
            OnClick = btnAddSyncPointClick
          end
          object btnScrollList: TSWButton
            Left = 54
            Top = 21
            Width = 25
            Height = 25
            Normal.Data = {
              AE060000424DAE06000000000000360000002800000017000000170000000100
              1800000000007806000000000000000000000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FF7142
              136E4013653A115D351059330F59330F59330F59330F59330F59330F59330F59
              330F5A340F5A340F4C2B0DFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FF9154199C58229B5B1B94561A8D5218894F18854D17834D17844D17854D
              17854D17844D17854D17895018804B16693A194C2C0DFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFA9621DB96B20BE6E21B4681FAF651EAC641EA6611D
              A25F1CA05E1CA15E1CA15E1CA25E1CA25E1CA6611DA25E1C804B165A340FFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB2681FC47222C77322BD6E21B8
              6B21B4681FAF661EAA621DA6611DA25E1CA15E1CA25E1CA25D1CA7611DA7611D
              8950185A340FFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB66A20C775
              26C97626C07224BB6D22B76A20B3681FC38C57F3E9DFBA88569D5B1B9D5B1B9D
              5B1BA25E1CA25E1C854D1759330FFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FFB66A20CD7D30D38233C97829C27225BD6E21C48549F1E3D6FFFFFFEFE2
              D6B47C46A05D1C9E5B1BA25D1CA25E1C844D1759330FFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFB66A20D18740D98C43D07F31CA7929D3975BF5E9DD
              FFFFFFFFFFFFFFFFFFF1E6DBBD8956A15E1CA25D1CA15D1C844D1759330FFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB66A20D69657DD9A58D28439CF
              7D2DF5E5D5FAF4EEFEFCFBFFFFFFFDFCFBF9F4EEEEE0D3A7611DA8621DA35E1C
              854C1759330FFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB66A20D9A1
              69E0A56BD3883FD18031D8924DD79556F8EDE3FFFFFFF7EDE3C98D54BB7D41AE
              651EAF651EA8611D894F1859330FFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FFB66A20DBA774E2AC76D48C45D28337D28335D4883EF8ECE1FFFFFFF7EB
              E0C67D36BC6D21B4681FB5691FAE651E8F54195A340FFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFB66A20DDAB7BE4B07DD7924ED58B42D3873DD89452
              FAF2EAFFFFFFFAF1E8D28942C57222BA6C20BB6C20B66A2097581A623911FF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB66A20DEAE7FE6B584D99757D6
              904AD58B41D99656F7EADDFCF8F3F7E9DCD58A42CA7523C47222C47122BD6E21
              9F5D1C6E4013FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB66A20DFB1
              86E9BD93DC9D60D7904CD68F48D48940D28337D28235D18031D07C2ACD7724CA
              7523C97523C37122A7611D7A4715FF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FFB66A20E0B48BEECBA9E3B384DFA76FDCA268DA9B5DD79351D68F4AD388
              3FD18031CF7B28CE7825CF7924CA7523AF651E864E17FF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFB66A20E0B081F2D4B5EECDADECC7A3EAC199E7B98D
              E3AF7CE0A46ADB9652D6883BD3802ED37B27D67C25D37B25B96B20915419FF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB76A20D49360E3B68BE4BE98E4
              BE98E3BA91E0B388DDAC7BD99F66D48F4DD0843ACD7C2CCB7726CF7824CC7623
              B869269A5A1BFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFBD77
              34C4864AC4884CC4884CC28446C07E3FC18142BF7B3ABB742FB96F27B76C23B7
              6C23B66A21B76B20AB631EFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF000000}
            MouseOver.Data = {
              AE060000424DAE06000000000000360000002800000017000000170000000100
              18000000000078060000120B0000120B00000000000000000000FF00FFFF00FF
              7981817981817882827781817980837980837782807782807980837980837781
              81778181798083798083778181778181787F82798083748082FF00FFFF00FF00
              0000FF00FF7E8081F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EB808080FF00FF0000007B8081F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7
              E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EB758181000000808080F7E7EBF7E7EBF7E7EB7142
              136E4013653A115D351059330F59330F59330F59330F59330F59330F59330F59
              330F5A340F5A340F4C2B0DF7E7EBF7E7EBF7E7EB7B8081000000808080F7E7EB
              F7E7EB9154199C5D219B5B1B94561A8D5218894F18854D17834D17844D17854D
              17854D17844D17854D17895018804B16693F184C2C0DF7E7EBF7E7EB7B808100
              00007F7F7FF7E7EBF7E7EBA9621DB96B20BE6E21B4681FAF651EAC641EA6611D
              A25F1CA05E1CA15E1CA15E1CA25E1CA25E1CA6611DA25E1C804B165A340FF7E7
              EBF7E7EB7B80810000007C8180F7E7EBF7E7EBB2681FC47222C77322BD6E21B8
              6B21B4681FAF661EAA621DA6611DA25E1CA15E1CA25E1CA25D1CA7611DA7611D
              8950185A340FF7E7EBF7E7EB7B7F840000007C8180F7E7EBF7E7EBB66A20C775
              26C97626C07224BB6D22B76A20B3681FC38C57F3E9DFBA88569D5B1B9D5B1B9D
              5B1BA25E1CA25E1C854D1759330FF7E7EBF7E7EB7B7F840000007B8180F7E7EB
              F7E7EBB66A20CD7D30D38233C97829C27225BD6E21C48549F1E3D6FFFFFFEFE2
              D6B47C46A05D1C9E5B1BA25D1CA25E1C844D1759330FF7E7EBF7E7EB7B808100
              00007B8180F7E7EBF7E7EBB66A20D18740D98C43D07F31CA7929D3975BF5E9DD
              FFFFFFFFFFFFFFFFFFF1E6DBBD8956A15E1CA25D1CA15D1C844D1759330FF7E7
              EBF7E7EB7B80810000007D8281F7E7EBF7E7EBB66A20D69657DD9A58D28439CF
              7D2DF5E5D5FAF4EEFEFCFBFFFFFFFDFCFBF9F4EEEEE0D3A7611DA8621DA35E1C
              854C1759330FF7E7EBF7E7EB7B80810000007C8180F7E7EBF7E7EBB66A20D9A1
              69E0A56BD3883FD18031D8924DD79556F8EDE3FFFFFFF7EDE3C98D54BB7D41AE
              651EAF651EA8611D894F1859330FF7E7EBF7E7EB7B80810000007C8081F7E7EB
              F7E7EBB66A20DBA774E2AC76D48C45D28337D28335D4883EF8ECE1FFFFFFF7EB
              E0C67D36BC6D21B4681FB5691FAE651E8F54195A340FF7E7EBF7E7EB7B808100
              00007B7F80F7E7EBF7E7EBB66A20DDAB7BE4B07DD7924ED58B42D3873DD89452
              FAF2EAFFFFFFFAF1E8D28942C57222BA6C20BB6C20B66A2097581A623911F7E7
              EBF7E7EB7B80810000007C8180F7E7EBF7E7EBB66A20DEAE7FE6B584D99757D6
              904AD58B41D99656F7EADDFCF8F3F7E9DCD58A42CA7523C47222C47122BD6E21
              9F5D1C6E4013F7E7EBF7E7EB7B80810000007C8180F7E7EBF7E7EBB66A20DFB1
              86E9BD93DC9D60D7904CD68F48D48940D28337D28235D18031D07C2ACD7724CA
              7523C97523C37122A7611D7A4715F7E7EBF7E7EB7B80810000007C8180F7E7EB
              F7E7EBB66A20E0B48BEECBA9E3B384DFA76FDCA268DA9B5DD79351D68F4AD388
              3FD18031CF7B28CE7825CF7924CA7523AF651E864E17F7E7EBF7E7EB7B808100
              00007D8281F7E7EBF7E7EBB66A20E0B081F2D4B5EECDADECC7A3EAC199E7B98D
              E3AF7CE0A46ADB9652D6883BD3802ED37B27D67C25D37B25B96B20915419F7E7
              EBF7E7EB7B80810000007C8180F7E7EBF7E7EBB76A20D3995FE3B68BE4BE98E4
              BE98E3BA91E0B388DDAC7BD99F66D48F4DD0843ACD7C2CCB7726CF7824CC7623
              B86E269A5A1BF7E7EBF7E7EB7B80810000007C8180F7E7EBF7E7EBF7E7EBBD77
              34C4864AC4884CC4884CC28446C07E3FC18142BF7B3ABB742FB96F27B76C23B7
              6C23B66A21B76B20AB631EF7E7EBF7E7EBF7E7EB7B80810000007B8180F7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB75818100
              0000FF00FF7E8080F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EB808080FF00FF000000FF00FFFF00FF79808379808377818177818179808379
              8083778181778181798083798083778083778083798083798083778181778181
              798083798083748082FF00FFFF00FF000000}
            Pressed.Data = {
              AE060000424DAE06000000000000360000002800000017000000170000000100
              18000000000078060000120B0000120B00000000000000000000FF00FFFF00FF
              7981817981817882827781817980837980837782807782807980837980837781
              81778181798083798083778181778181787F82798083748082FF00FFFF00FF00
              0000FF00FF7E8081DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CF808080FF00FF0000007B8081DACBCFDACBCFDACBCFDACBCF7142136E401365
              3A115D351059330F59330F59330F59330F59330F59330F59330F59330F5A340F
              5A340F4C2B0DDACBCFDACBCF758181000000808080DACBCFDACBCFDACBCF9154
              199B5D209B5B1B94561A8D5218894F18854D17834D17844D17854D17854D1784
              4D17854D17895018804B16683F174C2C0DDACBCF7B80810000007F7F7FDACBCF
              DACBCFDACBCFA9621DB96B20BE6E21B4681FAF651EAC641EA6611DA25F1CA05E
              1CA15E1CA15E1CA25E1CA25E1CA6611DA25E1C804B165A340FDACBCF7B808100
              00007C8180DACBCFDACBCFDACBCFB2681FC47222C77322BD6E21B86B21B4681F
              AF661EAA621DA6611DA25E1CA15E1CA25E1CA25D1CA7611DA7611D8950185A34
              0FDACBCF7B7F840000007C8180DACBCFDACBCFDACBCFB66A20C77526C97626C0
              7224BB6D22B76A20B3681FC38C57F3E9DFBA88569D5B1B9D5B1B9D5B1BA25E1C
              A25E1C854D1759330FDACBCF7B7F840000007B8180DACBCFDACBCFDACBCFB66A
              20CD7D30D38233C97829C27225BD6E21C48549F1E3D6FFFFFFEFE2D6B47C46A0
              5D1C9E5B1BA25D1CA25E1C844D1759330FDACBCF7B80810000007B8180DACBCF
              DACBCFDACBCFB66A20D18740D98C43D07F31CA7929D3975BF5E9DDFFFFFFFFFF
              FFFFFFFFF1E6DBBD8956A15E1CA25D1CA15D1C844D1759330FDACBCF7B808100
              00007D8281DACBCFDACBCFDACBCFB66A20D69657DD9A58D28439CF7D2DF5E5D5
              FAF4EEFEFCFBFFFFFFFDFCFBF9F4EEEEE0D3A7611DA8621DA35E1C854C175933
              0FDACBCF7B80810000007D8281DACBCFDACBCFDACBCFB66A20D9A169E0A56BD3
              883FD18031D8924DD79556F8EDE3FFFFFFF7EDE3C98D54BB7D41AE651EAF651E
              A8611D894F1859330FDACBCF7B80810000007C8180DACBCFDACBCFDACBCFB66A
              20DBA774E2AC76D48C45D28337D28335D4883EF8ECE1FFFFFFF7EBE0C67D36BC
              6D21B4681FB5691FAE651E8F54195A340FDACBCF7B80810000007C8081DACBCF
              DACBCFDACBCFB66A20DDAB7BE4B07DD7924ED58B42D3873DD89452FAF2EAFFFF
              FFFAF1E8D28942C57222BA6C20BB6C20B66A2097581A623911DACBCF7B808100
              00007B7F80DACBCFDACBCFDACBCFB66A20DEAE7FE6B584D99757D6904AD58B41
              D99656F7EADDFCF8F3F7E9DCD58A42CA7523C47222C47122BD6E219F5D1C6E40
              13DACBCF7B80810000007C8180DACBCFDACBCFDACBCFB66A20DFB186E9BD93DC
              9D60D7904CD68F48D48940D28337D28235D18031D07C2ACD7724CA7523C97523
              C37122A7611D7A4715DACBCF7B80810000007C8180DACBCFDACBCFDACBCFB66A
              20E0B48BEECBA9E3B384DFA76FDCA268DA9B5DD79351D68F4AD3883FD18031CF
              7B28CE7825CF7924CA7523AF651E864E17DACBCF7B80810000007C8180DACBCF
              DACBCFDACBCFB66A20E0B081F2D4B5EECDADECC7A3EAC199E7B98DE3AF7CE0A4
              6ADB9652D6883BD3802ED37B27D67C25D37B25B96B20915419DACBCF7B808100
              00007D8281DACBCFDACBCFDACBCFB76A20D2985EE3B68BE4BE98E4BE98E3BA91
              E0B388DDAC7BD99F66D48F4DD0843ACD7C2CCB7726CF7824CC7623B76D259A5A
              1BDACBCF7B80810000007C8180DACBCFDACBCFDACBCFDACBCFBD7734C4864AC4
              884CC4884CC28446C07E3FC18142BF7B3ABB742FB96F27B76C23B76C23B66A21
              B76B20AB631EDACBCFDACBCF7B80810000007C8180DACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDA
              CBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF7B80810000007B8180DACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF75818100
              0000FF00FF7E8080DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CF808080FF00FF000000FF00FFFF00FF79808379808377818177818179808379
              8083778181778181798083798083778083778083798083798083778181778181
              798083798083748082FF00FFFF00FF000000}
            Disabled.Data = {
              AE060000424DAE06000000000000360000002800000017000000170000000100
              18000000000078060000120B0000120B00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FF5252
              525151514A4A4A43434341414141414141414141414141414141414141414141
              4141424242424242383838FF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FF6A6A6A726F6D7171716C6C6C6767676464646161616060606060606161
              616161616060606161616464645E5E5E4C4948383838FF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FF7B7B7B8787878B8B8B8484848080807E7E7E797979
              7676767575757575757575757676767676767979797676765E5E5E424242FF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FF8282828F8F8F9292928A8A8A87
              87878484848080807D7D7D7979797676767575757676767676767A7A7A7A7A7A
              646464424242FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FF8585859393
              939595958E8E8E8A8A8A858585838383A0A0A0ECECEC99999973737373737373
              7373767676767676616161414141FF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FF8585859D9D9DA2A2A29696969090908A8A8A9B9B9BE9E9E9FFFFFFE7E7
              E7919191757575747474767676767676606060414141FF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FF858585A9A9A9AEAEAEA0A0A0969696ACACACEEEEEE
              FFFFFFFFFFFFFFFFFFEAEAEA9C9C9C757575767676757575606060414141FF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FF858585B7B7B7BBBBBBA5A5A59C
              9C9CEBEBEBF7F7F7FDFDFDFFFFFFFDFDFDF6F6F6E5E5E57A7A7A7A7A7A787878
              616161414141FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FF858585C2C2
              C2C6C6C6A9A9A9A0A0A0ACACACAEAEAEF1F1F1FFFFFFF0F0F0A3A3A39393937F
              7F7F8080807B7B7B646464414141FF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FF858585C9C9C9CCCCCCADADADA4A4A4A2A2A2A4A4A4F1F1F1FFFFFFEFEF
              EF9898988989898484848484847F7F7F696969424242FF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FF858585CCCCCCD1D1D1B2B2B2ABABABA7A7A7B0B0B0
              F5F5F5FFFFFFF4F4F4A3A3A39090908888888989898585856F6F6F474747FF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FF858585CECECED4D4D4B9B9B9B0
              B0B0ABABABB3B3B3F0F0F0F9F9F9EFEFEFA4A4A49494948F8F8F8F8F8F8A8A8A
              747474515151FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FF858585D3D3
              D3DCDCDCBFBFBFB2B2B2AFAFAFAAAAAAA4A4A4A2A2A2A0A0A09B9B9B96969694
              94949393938E8E8E7A7A7A5A5A5AFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FF858585D4D4D4E6E6E6D3D3D3C8C8C8C3C3C3BDBDBDB5B5B5B0B0B0A9A9
              A9A0A0A0999999979797969696939393808080626262FF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FF858585D0D0D0EBEBEBE8E8E8E3E3E3DEDEDED9D9D9
              D0D0D0C6C6C6B7B7B7A7A7A79E9E9E9B9B9B9C9C9C9A9A9A8888886A6A6AFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FF858585BAB7B4D6D6D6DCDCDCDC
              DCDCD9D9D9D3D3D3CCCCCCC1C1C1B1B1B1A4A4A49A9A9A959595969696959595
              888481707070FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FF9595
              95A6A6A6A7A7A7A7A7A7A3A3A39E9E9EA0A0A09A9A9A9292928B8B8B88888888
              88888787878585857D7D7DFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF000000}
            State = sNormal
            Enabled = True
            CanBeDown = True
            Down = False
            ShowHint = True
            OnClick = btnScrollListClick
          end
          object btnPrevSub: TSWButton
            Left = 86
            Top = 21
            Width = 25
            Height = 25
            Normal.Data = {
              AE060000424DAE06000000000000360000002800000017000000170000000100
              1800000000007806000000000000000000000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FF7142
              136E4013653A115D351059330F59330F59330F59330F59330F59330F59330F59
              330F5A340F5A340F4C2B0DFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FF9154199C58229B5B1B94561A8D5218894F18854D17834D17844D17854D
              17854D17844D17854D17895018804B16693A194C2C0DFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFA9621DB96B20BE6E21B4681FAF651EAC641EA6611D
              A25F1CA05E1CA15E1CA15E1CA25E1CA25E1CA6611DA25E1C804B165A340FFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB2681FC47222C77322BD6E21B8
              6B21B4681FAF661EAA621DA6611DA25E1CA15E1CA25E1CA25D1CA7611DA7611D
              8950185A340FFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB66A20C775
              26C97626C07224BB6D22B76A20B3681FAE651EA9621DA25E1C9D5B1B9D5B1B9D
              5B1BA25E1CA25E1C854D1759330FFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FFB66A20CD7D30D38233C97829C27225BD6E21C78D54F8F0E9BA7E42A862
              1DA35E1CA05D1C9E5B1BA25D1CA25E1C844D1759330FFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFB66A20D18740D98C43D07F31CA7929CE8B48F9F1EA
              F8F1E9B87332AD651EA8621DA7611DA15E1CA25D1CA15D1C844D1759330FFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB66A20D69657DD9A58D28439DA
              9A5BF9F1E9F9F1E9D2975FC58241C28243BE7F43B67B41B57B42B57A40A35E1C
              854C1759330FFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB66A20D9A1
              69E0A56BD3883FFAF2EAFAF2EAFAF1E9F9F1E9F9F1E9F8F0E9F8F0E9F7F0E9F7
              F0E9F7F0E9A8611D894F1859330FFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FFB66A20DBA774E2AC76D48C45DC9F63FAF2EBFAF2EADC9F62D28B44CF8A
              46CB8745C68344C08244C08041AE651E8F54195A340FFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFB66A20DDAB7BE4B07DD7924ED58B42DA9B5DFAF2EB
              FAF2EAD5883CCE7925CB7623C57222BA6C20BB6C20B66A2097581A623911FF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB66A20DEAE7FE6B584D99757D6
              904AD58B41DDA36AFAF2EBD89351D07C2BCE7825CA7523C47222C47122BD6E21
              9F5D1C6E4013FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB66A20DFB1
              86E9BD93DC9D60D7904CD68F48D48940D28337D28235D18031D07C2ACD7724CA
              7523C97523C37122A7611D7A4715FF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FFB66A20E0B48BEECBA9E3B384DFA76FDCA268DA9B5DD79351D68F4AD388
              3FD18031CF7B28CE7825CF7924CA7523AF651E864E17FF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFB66A20E0B081F2D4B5EECDADECC7A3EAC199E7B98D
              E3AF7CE0A46ADB9652D6883BD3802ED37B27D67C25D37B25B96B20915419FF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB76A20D49360E3B68BE4BE98E4
              BE98E3BA91E0B388DDAC7BD99F66D48F4DD0843ACD7C2CCB7726CF7824CC7623
              B869269A5A1BFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFBD77
              34C4864AC4884CC4884CC28446C07E3FC18142BF7B3ABB742FB96F27B76C23B7
              6C23B66A21B76B20AB631EFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF000000}
            MouseOver.Data = {
              AE060000424DAE06000000000000360000002800000017000000170000000100
              18000000000078060000120B0000120B00000000000000000000FF00FFFF00FF
              7981817981817882827781817980837980837782807782807980837980837781
              81778181798083798083778181778181787F82798083748082FF00FFFF00FF00
              0000FF00FF7E8081F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EB808080FF00FF0000007B8081F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7
              E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EB758181000000808080F7E7EBF7E7EBF7E7EB7142
              136E4013653A115D351059330F59330F59330F59330F59330F59330F59330F59
              330F5A340F5A340F4C2B0DF7E7EBF7E7EBF7E7EB7B8081000000808080F7E7EB
              F7E7EB9154199C5D219B5B1B94561A8D5218894F18854D17834D17844D17854D
              17854D17844D17854D17895018804B16693F184C2C0DF7E7EBF7E7EB7B808100
              00007F7F7FF7E7EBF7E7EBA9621DB96B20BE6E21B4681FAF651EAC641EA6611D
              A25F1CA05E1CA15E1CA15E1CA25E1CA25E1CA6611DA25E1C804B165A340FF7E7
              EBF7E7EB7B80810000007C8180F7E7EBF7E7EBB2681FC47222C77322BD6E21B8
              6B21B4681FAF661EAA621DA6611DA25E1CA15E1CA25E1CA25D1CA7611DA7611D
              8950185A340FF7E7EBF7E7EB7B7F840000007C8180F7E7EBF7E7EBB66A20C775
              26C97626C07224BB6D22B76A20B3681FAE651EA9621DA25E1C9D5B1B9D5B1B9D
              5B1BA25E1CA25E1C854D1759330FF7E7EBF7E7EB7B7F840000007B8180F7E7EB
              F7E7EBB66A20CD7D30D38233C97829C27225BD6E21C78D54F8F0E9BA7E42A862
              1DA35E1CA05D1C9E5B1BA25D1CA25E1C844D1759330FF7E7EBF7E7EB7B808100
              00007B8180F7E7EBF7E7EBB66A20D18740D98C43D07F31CA7929CE8B48F9F1EA
              F8F1E9B87332AD651EA8621DA7611DA15E1CA25D1CA15D1C844D1759330FF7E7
              EBF7E7EB7B80810000007D8281F7E7EBF7E7EBB66A20D69657DD9A58D28439DA
              9A5BF9F1E9F9F1E9D2975FC58241C28243BE7F43B67B41B57B42B57A40A35E1C
              854C1759330FF7E7EBF7E7EB7B80810000007C8180F7E7EBF7E7EBB66A20D9A1
              69E0A56BD3883FFAF2EAFAF2EAFAF1E9F9F1E9F9F1E9F8F0E9F8F0E9F7F0E9F7
              F0E9F7F0E9A8611D894F1859330FF7E7EBF7E7EB7B80810000007C8081F7E7EB
              F7E7EBB66A20DBA774E2AC76D48C45DC9F63FAF2EBFAF2EADC9F62D28B44CF8A
              46CB8745C68344C08244C08041AE651E8F54195A340FF7E7EBF7E7EB7B808100
              00007B7F80F7E7EBF7E7EBB66A20DDAB7BE4B07DD7924ED58B42DA9B5DFAF2EB
              FAF2EAD5883CCE7925CB7623C57222BA6C20BB6C20B66A2097581A623911F7E7
              EBF7E7EB7B80810000007C8180F7E7EBF7E7EBB66A20DEAE7FE6B584D99757D6
              904AD58B41DDA36AFAF2EBD89351D07C2BCE7825CA7523C47222C47122BD6E21
              9F5D1C6E4013F7E7EBF7E7EB7B80810000007C8180F7E7EBF7E7EBB66A20DFB1
              86E9BD93DC9D60D7904CD68F48D48940D28337D28235D18031D07C2ACD7724CA
              7523C97523C37122A7611D7A4715F7E7EBF7E7EB7B80810000007C8180F7E7EB
              F7E7EBB66A20E0B48BEECBA9E3B384DFA76FDCA268DA9B5DD79351D68F4AD388
              3FD18031CF7B28CE7825CF7924CA7523AF651E864E17F7E7EBF7E7EB7B808100
              00007D8281F7E7EBF7E7EBB66A20E0B081F2D4B5EECDADECC7A3EAC199E7B98D
              E3AF7CE0A46ADB9652D6883BD3802ED37B27D67C25D37B25B96B20915419F7E7
              EBF7E7EB7B80810000007C8180F7E7EBF7E7EBB76A20D3995FE3B68BE4BE98E4
              BE98E3BA91E0B388DDAC7BD99F66D48F4DD0843ACD7C2CCB7726CF7824CC7623
              B86E269A5A1BF7E7EBF7E7EB7B80810000007C8180F7E7EBF7E7EBF7E7EBBD77
              34C4864AC4884CC4884CC28446C07E3FC18142BF7B3ABB742FB96F27B76C23B7
              6C23B66A21B76B20AB631EF7E7EBF7E7EBF7E7EB7B80810000007B8180F7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB75818100
              0000FF00FF7E8080F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EB808080FF00FF000000FF00FFFF00FF79808379808377818177818179808379
              8083778181778181798083798083778083778083798083798083778181778181
              798083798083748082FF00FFFF00FF000000}
            Pressed.Data = {
              AE060000424DAE06000000000000360000002800000017000000170000000100
              18000000000078060000120B0000120B00000000000000000000FF00FFFF00FF
              7981817981817882827781817980837980837782807782807980837980837781
              81778181798083798083778181778181787F82798083748082FF00FFFF00FF00
              0000FF00FF7E8081DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CF808080FF00FF0000007B8081DACBCFDACBCFDACBCFDACBCF7142136E401365
              3A115D351059330F59330F59330F59330F59330F59330F59330F59330F5A340F
              5A340F4C2B0DDACBCFDACBCF758181000000808080DACBCFDACBCFDACBCF9154
              199B5D209B5B1B94561A8D5218894F18854D17834D17844D17854D17854D1784
              4D17854D17895018804B16683F174C2C0DDACBCF7B80810000007F7F7FDACBCF
              DACBCFDACBCFA9621DB96B20BE6E21B4681FAF651EAC641EA6611DA25F1CA05E
              1CA15E1CA15E1CA25E1CA25E1CA6611DA25E1C804B165A340FDACBCF7B808100
              00007C8180DACBCFDACBCFDACBCFB2681FC47222C77322BD6E21B86B21B4681F
              AF661EAA621DA6611DA25E1CA15E1CA25E1CA25D1CA7611DA7611D8950185A34
              0FDACBCF7B7F840000007C8180DACBCFDACBCFDACBCFB66A20C77526C97626C0
              7224BB6D22B76A20B3681FAE651EA9621DA25E1C9D5B1B9D5B1B9D5B1BA25E1C
              A25E1C854D1759330FDACBCF7B7F840000007B8180DACBCFDACBCFDACBCFB66A
              20CD7D30D38233C97829C27225BD6E21C78D54F8F0E9BA7E42A8621DA35E1CA0
              5D1C9E5B1BA25D1CA25E1C844D1759330FDACBCF7B80810000007B8180DACBCF
              DACBCFDACBCFB66A20D18740D98C43D07F31CA7929CE8B48F9F1EAF8F1E9B873
              32AD651EA8621DA7611DA15E1CA25D1CA15D1C844D1759330FDACBCF7B808100
              00007D8281DACBCFDACBCFDACBCFB66A20D69657DD9A58D28439DA9A5BF9F1E9
              F9F1E9D2975FC58241C28243BE7F43B67B41B57B42B57A40A35E1C854C175933
              0FDACBCF7B80810000007D8281DACBCFDACBCFDACBCFB66A20D9A169E0A56BD3
              883FFAF2EAFAF2EAFAF1E9F9F1E9F9F1E9F8F0E9F8F0E9F7F0E9F7F0E9F7F0E9
              A8611D894F1859330FDACBCF7B80810000007C8180DACBCFDACBCFDACBCFB66A
              20DBA774E2AC76D48C45DC9F63FAF2EBFAF2EADC9F62D28B44CF8A46CB8745C6
              8344C08244C08041AE651E8F54195A340FDACBCF7B80810000007C8081DACBCF
              DACBCFDACBCFB66A20DDAB7BE4B07DD7924ED58B42DA9B5DFAF2EBFAF2EAD588
              3CCE7925CB7623C57222BA6C20BB6C20B66A2097581A623911DACBCF7B808100
              00007B7F80DACBCFDACBCFDACBCFB66A20DEAE7FE6B584D99757D6904AD58B41
              DDA36AFAF2EBD89351D07C2BCE7825CA7523C47222C47122BD6E219F5D1C6E40
              13DACBCF7B80810000007C8180DACBCFDACBCFDACBCFB66A20DFB186E9BD93DC
              9D60D7904CD68F48D48940D28337D28235D18031D07C2ACD7724CA7523C97523
              C37122A7611D7A4715DACBCF7B80810000007C8180DACBCFDACBCFDACBCFB66A
              20E0B48BEECBA9E3B384DFA76FDCA268DA9B5DD79351D68F4AD3883FD18031CF
              7B28CE7825CF7924CA7523AF651E864E17DACBCF7B80810000007C8180DACBCF
              DACBCFDACBCFB66A20E0B081F2D4B5EECDADECC7A3EAC199E7B98DE3AF7CE0A4
              6ADB9652D6883BD3802ED37B27D67C25D37B25B96B20915419DACBCF7B808100
              00007D8281DACBCFDACBCFDACBCFB76A20D2985EE3B68BE4BE98E4BE98E3BA91
              E0B388DDAC7BD99F66D48F4DD0843ACD7C2CCB7726CF7824CC7623B76D259A5A
              1BDACBCF7B80810000007C8180DACBCFDACBCFDACBCFDACBCFBD7734C4864AC4
              884CC4884CC28446C07E3FC18142BF7B3ABB742FB96F27B76C23B76C23B66A21
              B76B20AB631EDACBCFDACBCF7B80810000007C8180DACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDA
              CBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF7B80810000007B8180DACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF75818100
              0000FF00FF7E8080DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CF808080FF00FF000000FF00FFFF00FF79808379808377818177818179808379
              8083778181778181798083798083778083778083798083798083778181778181
              798083798083748082FF00FFFF00FF000000}
            Disabled.Data = {
              AE060000424DAE06000000000000360000002800000017000000170000000100
              18000000000078060000120B0000120B00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FF5252
              525151514A4A4A43434341414141414141414141414141414141414141414141
              4141424242424242383838FF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FF6A6A6A726F6D7171716C6C6C6767676464646161616060606060606161
              616161616060606161616464645E5E5E4C4948383838FF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FF7B7B7B8787878B8B8B8484848080807E7E7E797979
              7676767575757575757575757676767676767979797676765E5E5E424242FF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FF8282828F8F8F9292928A8A8A87
              87878484848080807D7D7D7979797676767575757676767676767A7A7A7A7A7A
              646464424242FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FF8585859393
              939595958E8E8E8A8A8A8585858383837F7F7F7B7B7B76767673737373737373
              7373767676767676616161414141FF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FF8585859D9D9DA2A2A29696969090908A8A8AA2A2A2F3F3F39494947A7A
              7A787878757575747474767676767676606060414141FF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FF858585A9A9A9AEAEAEA0A0A0969696A2A2A2F4F4F4
              F3F3F38D8D8D7E7E7E7A7A7A7A7A7A757575767676757575606060414141FF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FF858585B7B7B7BBBBBBA5A5A5B2
              B2B2F5F5F5F4F4F4ACACAC9A9A9A9999999696969090909090908E8E8E787878
              616161414141FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FF858585C2C2
              C2C6C6C6A9A9A9F6F6F6F5F5F5F5F5F5F4F4F4F4F4F4F4F4F4F3F3F3F3F3F3F2
              F2F2F3F3F37B7B7B646464414141FF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FF858585C9C9C9CCCCCCADADADB8B8B8F6F6F6F5F5F5B5B5B5A4A4A4A2A2
              A29F9F9F9C9C9C9898989797977F7F7F696969424242FF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FF858585CCCCCCD1D1D1B2B2B2ABABABB6B6B6F6F6F6
              F6F6F6A4A4A49696969494949090908888888989898585856F6F6F474747FF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FF858585CECECED4D4D4B9B9B9B0
              B0B0ABABABBCBCBCF6F6F6AEAEAE9B9B9B9696969494948F8F8F8F8F8F8A8A8A
              747474515151FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FF858585D3D3
              D3DCDCDCBFBFBFB2B2B2AFAFAFAAAAAAA4A4A4A2A2A2A0A0A09B9B9B96969694
              94949393938E8E8E7A7A7A5A5A5AFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FF858585D4D4D4E6E6E6D3D3D3C8C8C8C3C3C3BDBDBDB5B5B5B0B0B0A9A9
              A9A0A0A0999999979797969696939393808080626262FF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FF858585D0D0D0EBEBEBE8E8E8E3E3E3DEDEDED9D9D9
              D0D0D0C6C6C6B7B7B7A7A7A79E9E9E9B9B9B9C9C9C9A9A9A8888886A6A6AFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FF858585BAB7B4D6D6D6DCDCDCDC
              DCDCD9D9D9D3D3D3CCCCCCC1C1C1B1B1B1A4A4A49A9A9A959595969696959595
              888481707070FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FF9595
              95A6A6A6A7A7A7A7A7A7A3A3A39E9E9EA0A0A09A9A9A9292928B8B8B88888888
              88888787878585857D7D7DFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF000000}
            State = sNormal
            Enabled = True
            CanBeDown = False
            Down = False
            ShowHint = True
            OnClick = btnPrevSubClick
          end
          object btnNextSub: TSWButton
            Left = 110
            Top = 21
            Width = 25
            Height = 25
            Normal.Data = {
              AE060000424DAE06000000000000360000002800000017000000170000000100
              1800000000007806000000000000000000000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FF7142
              136E4013653A115D351059330F59330F59330F59330F59330F59330F59330F59
              330F5A340F5A340F4C2B0DFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FF9154199C58229B5B1B94561A8D5218894F18854D17834D17844D17854D
              17854D17844D17854D17895018804B16693A194C2C0DFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFA9621DB96B20BE6E21B4681FAF651EAC641EA6611D
              A25F1CA05E1CA15E1CA15E1CA25E1CA25E1CA6611DA25E1C804B165A340FFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB2681FC47222C77322BD6E21B8
              6B21B4681FAF661EAA621DA6611DA25E1CA15E1CA25E1CA25D1CA7611DA7611D
              8950185A340FFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB66A20C775
              26C97626C07224BB6D22B76A20B3681FAE651EA9621DA25E1C9D5B1B9D5B1B9D
              5B1BA25E1CA25E1C854D1759330FFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FFB66A20CD7D30D38233C97829C27225BD6E21B66A20B3681FAD641EB57B
              41F6EFE9B683519E5B1BA25D1CA25E1C844D1759330FFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFB66A20D18740D98C43D07F31CA7929C47323C07227
              B86C22B2671FB37131F6F0E9F6F0E9B07942A25D1CA15D1C844D1759330FFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB66A20D69657DD9A58D28439D7
              924DD58F4BD08B48CB8746C68344C17F40C6915CF6F0E9F6F0E9BB844FA35E1C
              854C1759330FFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB66A20D9A1
              69E0A56BD3883FFAF2EAFAF2EAFAF1E9F9F1E9F9F1E9F8F0E9F8F0E9F7F0E9F7
              F0E9F7F0E9A8611D894F1859330FFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FFB66A20DBA774E2AC76D48C45D99756D99656D7904CD68E49D38C47CD86
              42D1975EF8F0E9F8F0E9C58A50AE651E8F54195A340FFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFB66A20DDAB7BE4B07DD7924ED58B42D3873DD28336
              D18031D17D2AD28437F9F1E9F9F1E9C68546BB6C20B66A2097581A623911FF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB66A20DEAE7FE6B584D99757D6
              904AD58B41D3873DD28335D18030D8914DFAF1E9D79657C47222C47122BD6E21
              9F5D1C6E4013FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB66A20DFB1
              86E9BD93DC9D60D7904CD68F48D48940D28337D28235D18031D07C2ACD7724CA
              7523C97523C37122A7611D7A4715FF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FFB66A20E0B48BEECBA9E3B384DFA76FDCA268DA9B5DD79351D68F4AD388
              3FD18031CF7B28CE7825CF7924CA7523AF651E864E17FF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFB66A20E0B081F2D4B5EECDADECC7A3EAC199E7B98D
              E3AF7CE0A46ADB9652D6883BD3802ED37B27D67C25D37B25B96B20915419FF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB76A20D49360E3B68BE4BE98E4
              BE98E3BA91E0B388DDAC7BD99F66D48F4DD0843ACD7C2CCB7726CF7824CC7623
              B869269A5A1BFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFBD77
              34C4864AC4884CC4884CC28446C07E3FC18142BF7B3ABB742FB96F27B76C23B7
              6C23B66A21B76B20AB631EFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF000000}
            MouseOver.Data = {
              AE060000424DAE06000000000000360000002800000017000000170000000100
              18000000000078060000120B0000120B00000000000000000000FF00FFFF00FF
              7981817981817882827781817980837980837782807782807980837980837781
              81778181798083798083778181778181787F82798083748082FF00FFFF00FF00
              0000FF00FF7E8081F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EB808080FF00FF0000007B8081F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7
              E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EB758181000000808080F7E7EBF7E7EBF7E7EB7142
              136E4013653A115D351059330F59330F59330F59330F59330F59330F59330F59
              330F5A340F5A340F4C2B0DF7E7EBF7E7EBF7E7EB7B8081000000808080F7E7EB
              F7E7EB9154199C5D219B5B1B94561A8D5218894F18854D17834D17844D17854D
              17854D17844D17854D17895018804B16693F184C2C0DF7E7EBF7E7EB7B808100
              00007F7F7FF7E7EBF7E7EBA9621DB96B20BE6E21B4681FAF651EAC641EA6611D
              A25F1CA05E1CA15E1CA15E1CA25E1CA25E1CA6611DA25E1C804B165A340FF7E7
              EBF7E7EB7B80810000007C8180F7E7EBF7E7EBB2681FC47222C77322BD6E21B8
              6B21B4681FAF661EAA621DA6611DA25E1CA15E1CA25E1CA25D1CA7611DA7611D
              8950185A340FF7E7EBF7E7EB7B7F840000007C8180F7E7EBF7E7EBB66A20C775
              26C97626C07224BB6D22B76A20B3681FAE651EA9621DA25E1C9D5B1B9D5B1B9D
              5B1BA25E1CA25E1C854D1759330FF7E7EBF7E7EB7B7F840000007B8180F7E7EB
              F7E7EBB66A20CD7D30D38233C97829C27225BD6E21B66A20B3681FAD641EB57B
              41F6EFE9B683519E5B1BA25D1CA25E1C844D1759330FF7E7EBF7E7EB7B808100
              00007B8180F7E7EBF7E7EBB66A20D18740D98C43D07F31CA7929C47323C07227
              B86C22B2671FB37131F6F0E9F6F0E9B07942A25D1CA15D1C844D1759330FF7E7
              EBF7E7EB7B80810000007D8281F7E7EBF7E7EBB66A20D69657DD9A58D28439D7
              924DD58F4BD08B48CB8746C68344C17F40C6915CF6F0E9F6F0E9BB844FA35E1C
              854C1759330FF7E7EBF7E7EB7B80810000007C8180F7E7EBF7E7EBB66A20D9A1
              69E0A56BD3883FFAF2EAFAF2EAFAF1E9F9F1E9F9F1E9F8F0E9F8F0E9F7F0E9F7
              F0E9F7F0E9A8611D894F1859330FF7E7EBF7E7EB7B80810000007C8081F7E7EB
              F7E7EBB66A20DBA774E2AC76D48C45D99756D99656D7904CD68E49D38C47CD86
              42D1975EF8F0E9F8F0E9C58A50AE651E8F54195A340FF7E7EBF7E7EB7B808100
              00007B7F80F7E7EBF7E7EBB66A20DDAB7BE4B07DD7924ED58B42D3873DD28336
              D18031D17D2AD28437F9F1E9F9F1E9C68546BB6C20B66A2097581A623911F7E7
              EBF7E7EB7B80810000007C8180F7E7EBF7E7EBB66A20DEAE7FE6B584D99757D6
              904AD58B41D3873DD28335D18030D8914DFAF1E9D79657C47222C47122BD6E21
              9F5D1C6E4013F7E7EBF7E7EB7B80810000007C8180F7E7EBF7E7EBB66A20DFB1
              86E9BD93DC9D60D7904CD68F48D48940D28337D28235D18031D07C2ACD7724CA
              7523C97523C37122A7611D7A4715F7E7EBF7E7EB7B80810000007C8180F7E7EB
              F7E7EBB66A20E0B48BEECBA9E3B384DFA76FDCA268DA9B5DD79351D68F4AD388
              3FD18031CF7B28CE7825CF7924CA7523AF651E864E17F7E7EBF7E7EB7B808100
              00007D8281F7E7EBF7E7EBB66A20E0B081F2D4B5EECDADECC7A3EAC199E7B98D
              E3AF7CE0A46ADB9652D6883BD3802ED37B27D67C25D37B25B96B20915419F7E7
              EBF7E7EB7B80810000007C8180F7E7EBF7E7EBB76A20D3995FE3B68BE4BE98E4
              BE98E3BA91E0B388DDAC7BD99F66D48F4DD0843ACD7C2CCB7726CF7824CC7623
              B86E269A5A1BF7E7EBF7E7EB7B80810000007C8180F7E7EBF7E7EBF7E7EBBD77
              34C4864AC4884CC4884CC28446C07E3FC18142BF7B3ABB742FB96F27B76C23B7
              6C23B66A21B76B20AB631EF7E7EBF7E7EBF7E7EB7B80810000007B8180F7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB75818100
              0000FF00FF7E8080F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EB808080FF00FF000000FF00FFFF00FF79808379808377818177818179808379
              8083778181778181798083798083778083778083798083798083778181778181
              798083798083748082FF00FFFF00FF000000}
            Pressed.Data = {
              AE060000424DAE06000000000000360000002800000017000000170000000100
              18000000000078060000120B0000120B00000000000000000000FF00FFFF00FF
              7981817981817882827781817980837980837782807782807980837980837781
              81778181798083798083778181778181787F82798083748082FF00FFFF00FF00
              0000FF00FF7E8081DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CF808080FF00FF0000007B8081DACBCFDACBCFDACBCFDACBCF7142136E401365
              3A115D351059330F59330F59330F59330F59330F59330F59330F59330F5A340F
              5A340F4C2B0DDACBCFDACBCF758181000000808080DACBCFDACBCFDACBCF9154
              199B5D209B5B1B94561A8D5218894F18854D17834D17844D17854D17854D1784
              4D17854D17895018804B16683F174C2C0DDACBCF7B80810000007F7F7FDACBCF
              DACBCFDACBCFA9621DB96B20BE6E21B4681FAF651EAC641EA6611DA25F1CA05E
              1CA15E1CA15E1CA25E1CA25E1CA6611DA25E1C804B165A340FDACBCF7B808100
              00007C8180DACBCFDACBCFDACBCFB2681FC47222C77322BD6E21B86B21B4681F
              AF661EAA621DA6611DA25E1CA15E1CA25E1CA25D1CA7611DA7611D8950185A34
              0FDACBCF7B7F840000007C8180DACBCFDACBCFDACBCFB66A20C77526C97626C0
              7224BB6D22B76A20B3681FAE651EA9621DA25E1C9D5B1B9D5B1B9D5B1BA25E1C
              A25E1C854D1759330FDACBCF7B7F840000007B8180DACBCFDACBCFDACBCFB66A
              20CD7D30D38233C97829C27225BD6E21B66A20B3681FAD641EB57B41F6EFE9B6
              83519E5B1BA25D1CA25E1C844D1759330FDACBCF7B80810000007B8180DACBCF
              DACBCFDACBCFB66A20D18740D98C43D07F31CA7929C47323C07227B86C22B267
              1FB37131F6F0E9F6F0E9B07942A25D1CA15D1C844D1759330FDACBCF7B808100
              00007D8281DACBCFDACBCFDACBCFB66A20D69657DD9A58D28439D7924DD58F4B
              D08B48CB8746C68344C17F40C6915CF6F0E9F6F0E9BB844FA35E1C854C175933
              0FDACBCF7B80810000007D8281DACBCFDACBCFDACBCFB66A20D9A169E0A56BD3
              883FFAF2EAFAF2EAFAF1E9F9F1E9F9F1E9F8F0E9F8F0E9F7F0E9F7F0E9F7F0E9
              A8611D894F1859330FDACBCF7B80810000007C8180DACBCFDACBCFDACBCFB66A
              20DBA774E2AC76D48C45D99756D99656D7904CD68E49D38C47CD8642D1975EF8
              F0E9F8F0E9C58A50AE651E8F54195A340FDACBCF7B80810000007C8081DACBCF
              DACBCFDACBCFB66A20DDAB7BE4B07DD7924ED58B42D3873DD28336D18031D17D
              2AD28437F9F1E9F9F1E9C68546BB6C20B66A2097581A623911DACBCF7B808100
              00007B7F80DACBCFDACBCFDACBCFB66A20DEAE7FE6B584D99757D6904AD58B41
              D3873DD28335D18030D8914DFAF1E9D79657C47222C47122BD6E219F5D1C6E40
              13DACBCF7B80810000007C8180DACBCFDACBCFDACBCFB66A20DFB186E9BD93DC
              9D60D7904CD68F48D48940D28337D28235D18031D07C2ACD7724CA7523C97523
              C37122A7611D7A4715DACBCF7B80810000007C8180DACBCFDACBCFDACBCFB66A
              20E0B48BEECBA9E3B384DFA76FDCA268DA9B5DD79351D68F4AD3883FD18031CF
              7B28CE7825CF7924CA7523AF651E864E17DACBCF7B80810000007C8180DACBCF
              DACBCFDACBCFB66A20E0B081F2D4B5EECDADECC7A3EAC199E7B98DE3AF7CE0A4
              6ADB9652D6883BD3802ED37B27D67C25D37B25B96B20915419DACBCF7B808100
              00007D8281DACBCFDACBCFDACBCFB76A20D2985EE3B68BE4BE98E4BE98E3BA91
              E0B388DDAC7BD99F66D48F4DD0843ACD7C2CCB7726CF7824CC7623B76D259A5A
              1BDACBCF7B80810000007C8180DACBCFDACBCFDACBCFDACBCFBD7734C4864AC4
              884CC4884CC28446C07E3FC18142BF7B3ABB742FB96F27B76C23B76C23B66A21
              B76B20AB631EDACBCFDACBCF7B80810000007C8180DACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDA
              CBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF7B80810000007B8180DACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF75818100
              0000FF00FF7E8080DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CF808080FF00FF000000FF00FFFF00FF79808379808377818177818179808379
              8083778181778181798083798083778083778083798083798083778181778181
              798083798083748082FF00FFFF00FF000000}
            Disabled.Data = {
              AE060000424DAE06000000000000360000002800000017000000170000000100
              18000000000078060000120B0000120B00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FF5252
              525151514A4A4A43434341414141414141414141414141414141414141414141
              4141424242424242383838FF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FF6A6A6A726F6D7171716C6C6C6767676464646161616060606060606161
              616161616060606161616464645E5E5E4C4948383838FF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FF7B7B7B8787878B8B8B8484848080807E7E7E797979
              7676767575757575757575757676767676767979797676765E5E5E424242FF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FF8282828F8F8F9292928A8A8A87
              87878484848080807D7D7D7979797676767575757676767676767A7A7A7A7A7A
              646464424242FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FF8585859393
              939595958E8E8E8A8A8A8585858383837F7F7F7B7B7B76767673737373737373
              7373767676767676616161414141FF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FF8585859D9D9DA2A2A29696969090908A8A8A8585858383837F7F7F8F8F
              8FF2F2F2959595747474767676767676606060414141FF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FF858585A9A9A9AEAEAEA0A0A09696968F8F8F909090
              888888828282898989F2F2F2F2F2F28C8C8C767676757575606060414141FF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FF858585B7B7B7BBBBBBA5A5A5AB
              ABABA8A8A8A4A4A49F9F9F9C9C9C979797A4A4A4F2F2F2F2F2F2979797787878
              616161414141FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FF858585C2C2
              C2C6C6C6A9A9A9F6F6F6F5F5F5F5F5F5F4F4F4F4F4F4F4F4F4F3F3F3F3F3F3F2
              F2F2F3F3F37B7B7B646464414141FF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FF858585C9C9C9CCCCCCADADADB2B2B2B1B1B1ABABABA9A9A9A5A5A5A0A0
              A0ACACACF3F3F3F3F3F39F9F9F7F7F7F696969424242FF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FF858585CCCCCCD1D1D1B2B2B2ABABABA7A7A7A3A3A3
              A0A0A09B9B9B9F9F9FF5F5F5F4F4F49C9C9C8989898585856F6F6F474747FF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FF858585CECECED4D4D4B9B9B9B0
              B0B0ABABABA7A7A7A2A2A29E9E9EABABABF5F5F5ADADAD8F8F8F8F8F8F8A8A8A
              747474515151FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FF858585D3D3
              D3DCDCDCBFBFBFB2B2B2AFAFAFAAAAAAA4A4A4A2A2A2A0A0A09B9B9B96969694
              94949393938E8E8E7A7A7A5A5A5AFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FF858585D4D4D4E6E6E6D3D3D3C8C8C8C3C3C3BDBDBDB5B5B5B0B0B0A9A9
              A9A0A0A0999999979797969696939393808080626262FF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FF858585D0D0D0EBEBEBE8E8E8E3E3E3DEDEDED9D9D9
              D0D0D0C6C6C6B7B7B7A7A7A79E9E9E9B9B9B9C9C9C9A9A9A8888886A6A6AFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FF858585BAB7B4D6D6D6DCDCDCDC
              DCDCD9D9D9D3D3D3CCCCCCC1C1C1B1B1B1A4A4A49A9A9A959595969696959595
              888481707070FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FF9595
              95A6A6A6A7A7A7A7A7A7A3A3A39E9E9EA0A0A09A9A9A9292928B8B8B88888888
              88888787878585857D7D7DFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF000000}
            State = sNormal
            Enabled = True
            CanBeDown = False
            Down = False
            ShowHint = True
            OnClick = btnNextSubClick
          end
          object btnMoveSubtitle: TSWButton
            Left = 222
            Top = 21
            Width = 25
            Height = 25
            Normal.Data = {
              AE060000424DAE06000000000000360000002800000017000000170000000100
              1800000000007806000000000000000000000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FF7142
              136E4013653A115D351059330F59330F59330F59330F59330F59330F59330F59
              330F5A340F5A340F4C2B0DFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FF9154199C58229B5B1B94561A8D5218894F18854D17834D17844D17854D
              17854D17844D17854D17895018804B16693A194C2C0DFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFA9621DB96B20BE6E21B4681FAF651EAC641EA6611D
              A25F1CA05E1CA15E1CA15E1CA25E1CA25E1CA6611DA25E1C804B165A340FFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB2681FC47222C77322BD6E21B8
              6B21B4681FAF661EAA621DA6611DA25E1CAD733AEFE4D9BB8858A7611DA7611D
              8950185A340FFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB66A20C775
              26C97626CA8948C7894BC48548C08347BD8147B97F46B27A43B98A5BF8F4F0EF
              E4DAB88553A25E1C854D1759330FFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FFB66A20CD7D30D38233FCF8F5FDFBFAFDFBF9FDFBF9FDFBF9FDFBF9FCFA
              F8FDFBFAFCFAF9FFFFFFEFE4D9A25E1C844D1759330FFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFB66A20D18740D98C43D89554D49251CF8C4BCB8C4E
              C5874ABF8247BB8045C08E5DF9F4F0EFE4DAB98553A15D1C844D1759330FFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB66A20D69657DD9A58D28439CF
              7D2DCC7827C77525C07022BB6C20B76B20BB7B3CF0E5D9BE8B58A8621DA35E1C
              854C1759330FFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB66A20D9A1
              69E0A56BD3883FD18031D07E2DCC7623C97423C47222BE6E21B96B20AF651EAE
              651EAF651EA8611D894F1859330FFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FFB66A20DBA774E2AC76D48C45D28337D28335D07C2ACE7927CB7724C572
              22C9833FF3E6D9C8905AB5691FAE651E8F54195A340FFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFB66A20DDAB7BE4B07DDEA46CDDA065DB9D60DA995A
              D99756D99451D68F4ADA9D61FBF6F0F4E7DBCC9057B66A2097581A623911FF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB66A20DEAE7FE6B584FEFBF8FE
              FCFBFEFCFAFEFCFAFEFCFAFEFCF9FEFBF9FEFCFAFEFCFAFFFFFFF5E7DABD6E21
              9F5D1C6E4013FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB66A20DFB1
              86E9BD93E2AE7BDFA56DDDA268DC9E62DA9A5BDA9959D99654DDA166FBF5F0F6
              E8DBD69758C37122A7611D7A4715FF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FFB66A20E0B48BEECBA9E3B384DFA76FDCA268DA9B5DD79351D68F4AD388
              3FD7904CF7E9DBDA9B5ECF7924CA7523AF651E864E17FF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFB66A20E0B081F2D4B5EECDADECC7A3EAC199E7B98D
              E3AF7CE0A46ADB9652D6883BD3802ED37B27D67C25D37B25B96B20915419FF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB76A20D49360E3B68BE4BE98E4
              BE98E3BA91E0B388DDAC7BD99F66D48F4DD0843ACD7C2CCB7726CF7824CC7623
              B869269A5A1BFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFBD77
              34C4864AC4884CC4884CC28446C07E3FC18142BF7B3ABB742FB96F27B76C23B7
              6C23B66A21B76B20AB631EFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF000000}
            MouseOver.Data = {
              AE060000424DAE06000000000000360000002800000017000000170000000100
              18000000000078060000120B0000120B00000000000000000000FF00FFFF00FF
              7981817981817882827781817980837980837782807782807980837980837781
              81778181798083798083778181778181787F82798083748082FF00FFFF00FF00
              0000FF00FF7E8081F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EB808080FF00FF0000007B8081F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7
              E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EB758181000000808080F7E7EBF7E7EBF7E7EB7142
              136E4013653A115D351059330F59330F59330F59330F59330F59330F59330F59
              330F5A340F5A340F4C2B0DF7E7EBF7E7EBF7E7EB7B8081000000808080F7E7EB
              F7E7EB9154199C5D219B5B1B94561A8D5218894F18854D17834D17844D17854D
              17854D17844D17854D17895018804B16693F184C2C0DF7E7EBF7E7EB7B808100
              00007F7F7FF7E7EBF7E7EBA9621DB96B20BE6E21B4681FAF651EAC641EA6611D
              A25F1CA05E1CA15E1CA15E1CA25E1CA25E1CA6611DA25E1C804B165A340FF7E7
              EBF7E7EB7B80810000007C8180F7E7EBF7E7EBB2681FC47222C77322BD6E21B8
              6B21B4681FAF661EAA621DA6611DA25E1CAD733AEFE4D9BB8858A7611DA7611D
              8950185A340FF7E7EBF7E7EB7B7F840000007C8180F7E7EBF7E7EBB66A20C775
              26C97626CA8948C7894BC48548C08347BD8147B97F46B27A43B98A5BF8F4F0EF
              E4DAB88553A25E1C854D1759330FF7E7EBF7E7EB7B7F840000007B8180F7E7EB
              F7E7EBB66A20CD7D30D38233FCF8F5FDFBFAFDFBF9FDFBF9FDFBF9FDFBF9FCFA
              F8FDFBFAFCFAF9FFFFFFEFE4D9A25E1C844D1759330FF7E7EBF7E7EB7B808100
              00007B8180F7E7EBF7E7EBB66A20D18740D98C43D89554D49251CF8C4BCB8C4E
              C5874ABF8247BB8045C08E5DF9F4F0EFE4DAB98553A15D1C844D1759330FF7E7
              EBF7E7EB7B80810000007D8281F7E7EBF7E7EBB66A20D69657DD9A58D28439CF
              7D2DCC7827C77525C07022BB6C20B76B20BB7B3CF0E5D9BE8B58A8621DA35E1C
              854C1759330FF7E7EBF7E7EB7B80810000007C8180F7E7EBF7E7EBB66A20D9A1
              69E0A56BD3883FD18031D07E2DCC7623C97423C47222BE6E21B96B20AF651EAE
              651EAF651EA8611D894F1859330FF7E7EBF7E7EB7B80810000007C8081F7E7EB
              F7E7EBB66A20DBA774E2AC76D48C45D28337D28335D07C2ACE7927CB7724C572
              22C9833FF3E6D9C8905AB5691FAE651E8F54195A340FF7E7EBF7E7EB7B808100
              00007B7F80F7E7EBF7E7EBB66A20DDAB7BE4B07DDEA46CDDA065DB9D60DA995A
              D99756D99451D68F4ADA9D61FBF6F0F4E7DBCC9057B66A2097581A623911F7E7
              EBF7E7EB7B80810000007C8180F7E7EBF7E7EBB66A20DEAE7FE6B584FEFBF8FE
              FCFBFEFCFAFEFCFAFEFCFAFEFCF9FEFBF9FEFCFAFEFCFAFFFFFFF5E7DABD6E21
              9F5D1C6E4013F7E7EBF7E7EB7B80810000007C8180F7E7EBF7E7EBB66A20DFB1
              86E9BD93E2AE7BDFA56DDDA268DC9E62DA9A5BDA9959D99654DDA166FBF5F0F6
              E8DBD69758C37122A7611D7A4715F7E7EBF7E7EB7B80810000007C8180F7E7EB
              F7E7EBB66A20E0B48BEECBA9E3B384DFA76FDCA268DA9B5DD79351D68F4AD388
              3FD7904CF7E9DBDA9B5ECF7924CA7523AF651E864E17F7E7EBF7E7EB7B808100
              00007D8281F7E7EBF7E7EBB66A20E0B081F2D4B5EECDADECC7A3EAC199E7B98D
              E3AF7CE0A46ADB9652D6883BD3802ED37B27D67C25D37B25B96B20915419F7E7
              EBF7E7EB7B80810000007C8180F7E7EBF7E7EBB76A20D3995FE3B68BE4BE98E4
              BE98E3BA91E0B388DDAC7BD99F66D48F4DD0843ACD7C2CCB7726CF7824CC7623
              B86E269A5A1BF7E7EBF7E7EB7B80810000007C8180F7E7EBF7E7EBF7E7EBBD77
              34C4864AC4884CC4884CC28446C07E3FC18142BF7B3ABB742FB96F27B76C23B7
              6C23B66A21B76B20AB631EF7E7EBF7E7EBF7E7EB7B80810000007B8180F7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB75818100
              0000FF00FF7E8080F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EB808080FF00FF000000FF00FFFF00FF79808379808377818177818179808379
              8083778181778181798083798083778083778083798083798083778181778181
              798083798083748082FF00FFFF00FF000000}
            Pressed.Data = {
              AE060000424DAE06000000000000360000002800000017000000170000000100
              18000000000078060000120B0000120B00000000000000000000FF00FFFF00FF
              7981817981817882827781817980837980837782807782807980837980837781
              81778181798083798083778181778181787F82798083748082FF00FFFF00FF00
              0000FF00FF7E8081DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CF808080FF00FF0000007B8081DACBCFDACBCFDACBCFDACBCF7142136E401365
              3A115D351059330F59330F59330F59330F59330F59330F59330F59330F5A340F
              5A340F4C2B0DDACBCFDACBCF758181000000808080DACBCFDACBCFDACBCF9154
              199B5D209B5B1B94561A8D5218894F18854D17834D17844D17854D17854D1784
              4D17854D17895018804B16683F174C2C0DDACBCF7B80810000007F7F7FDACBCF
              DACBCFDACBCFA9621DB96B20BE6E21B4681FAF651EAC641EA6611DA25F1CA05E
              1CA15E1CA15E1CA25E1CA25E1CA6611DA25E1C804B165A340FDACBCF7B808100
              00007C8180DACBCFDACBCFDACBCFB2681FC47222C77322BD6E21B86B21B4681F
              AF661EAA621DA6611DA25E1CAD733AEFE4D9BB8858A7611DA7611D8950185A34
              0FDACBCF7B7F840000007C8180DACBCFDACBCFDACBCFB66A20C77526C97626CA
              8948C7894BC48548C08347BD8147B97F46B27A43B98A5BF8F4F0EFE4DAB88553
              A25E1C854D1759330FDACBCF7B7F840000007B8180DACBCFDACBCFDACBCFB66A
              20CD7D30D38233FCF8F5FDFBFAFDFBF9FDFBF9FDFBF9FDFBF9FCFAF8FDFBFAFC
              FAF9FFFFFFEFE4D9A25E1C844D1759330FDACBCF7B80810000007B8180DACBCF
              DACBCFDACBCFB66A20D18740D98C43D89554D49251CF8C4BCB8C4EC5874ABF82
              47BB8045C08E5DF9F4F0EFE4DAB98553A15D1C844D1759330FDACBCF7B808100
              00007D8281DACBCFDACBCFDACBCFB66A20D69657DD9A58D28439CF7D2DCC7827
              C77525C07022BB6C20B76B20BB7B3CF0E5D9BE8B58A8621DA35E1C854C175933
              0FDACBCF7B80810000007D8281DACBCFDACBCFDACBCFB66A20D9A169E0A56BD3
              883FD18031D07E2DCC7623C97423C47222BE6E21B96B20AF651EAE651EAF651E
              A8611D894F1859330FDACBCF7B80810000007C8180DACBCFDACBCFDACBCFB66A
              20DBA774E2AC76D48C45D28337D28335D07C2ACE7927CB7724C57222C9833FF3
              E6D9C8905AB5691FAE651E8F54195A340FDACBCF7B80810000007C8081DACBCF
              DACBCFDACBCFB66A20DDAB7BE4B07DDEA46CDDA065DB9D60DA995AD99756D994
              51D68F4ADA9D61FBF6F0F4E7DBCC9057B66A2097581A623911DACBCF7B808100
              00007B7F80DACBCFDACBCFDACBCFB66A20DEAE7FE6B584FEFBF8FEFCFBFEFCFA
              FEFCFAFEFCFAFEFCF9FEFBF9FEFCFAFEFCFAFFFFFFF5E7DABD6E219F5D1C6E40
              13DACBCF7B80810000007C8180DACBCFDACBCFDACBCFB66A20DFB186E9BD93E2
              AE7BDFA56DDDA268DC9E62DA9A5BDA9959D99654DDA166FBF5F0F6E8DBD69758
              C37122A7611D7A4715DACBCF7B80810000007C8180DACBCFDACBCFDACBCFB66A
              20E0B48BEECBA9E3B384DFA76FDCA268DA9B5DD79351D68F4AD3883FD7904CF7
              E9DBDA9B5ECF7924CA7523AF651E864E17DACBCF7B80810000007C8180DACBCF
              DACBCFDACBCFB66A20E0B081F2D4B5EECDADECC7A3EAC199E7B98DE3AF7CE0A4
              6ADB9652D6883BD3802ED37B27D67C25D37B25B96B20915419DACBCF7B808100
              00007D8281DACBCFDACBCFDACBCFB76A20D2985EE3B68BE4BE98E4BE98E3BA91
              E0B388DDAC7BD99F66D48F4DD0843ACD7C2CCB7726CF7824CC7623B76D259A5A
              1BDACBCF7B80810000007C8180DACBCFDACBCFDACBCFDACBCFBD7734C4864AC4
              884CC4884CC28446C07E3FC18142BF7B3ABB742FB96F27B76C23B76C23B66A21
              B76B20AB631EDACBCFDACBCF7B80810000007C8180DACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDA
              CBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF7B80810000007B8180DACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF75818100
              0000FF00FF7E8080DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CF808080FF00FF000000FF00FFFF00FF79808379808377818177818179808379
              8083778181778181798083798083778083778083798083798083778181778181
              798083798083748082FF00FFFF00FF000000}
            Disabled.Data = {
              AE060000424DAE06000000000000360000002800000017000000170000000100
              18000000000078060000120B0000120B00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FF5252
              525151514A4A4A43434341414141414141414141414141414141414141414141
              4141424242424242383838FF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FF6A6A6A726F6D7171716C6C6C6767676464646161616060606060606161
              616161616060606161616464645E5E5E4C4948383838FF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FF7B7B7B8787878B8B8B8484848080807E7E7E797979
              7676767575757575757575757676767676767979797676765E5E5E424242FF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FF8282828F8F8F9292928A8A8A87
              87878484848080807D7D7D797979767676878787E8E8E89A9A9A7A7A7A7A7A7A
              646464424242FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FF8585859393
              93959595A1A1A1A0A0A09B9B9B9999999696969393938E8E8E9B9B9BF6F6F6E8
              E8E8979797767676616161414141FF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FF8585859D9D9DA2A2A2FAFAFAFDFDFDFCFCFCFCFCFCFCFCFCFBFBFBFBFB
              FBFCFCFCFCFCFCFFFFFFE8E8E8767676606060414141FF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FF858585A9A9A9AEAEAEB0B0B0A9A9A9A3A3A3A4A4A4
              9D9D9D999999949494A0A0A0F6F6F6E9E9E9979797757575606060414141FF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FF858585B7B7B7BBBBBBA5A5A59C
              9C9C9797979393938D8D8D898989858585939393E9E9E99D9D9D7A7A7A787878
              616161414141FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FF858585C2C2
              C2C6C6C6A9A9A9A0A0A09D9D9D9595959393938F8F8F8B8B8B8787878080807F
              7F7F8080807B7B7B646464414141FF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FF858585C9C9C9CCCCCCADADADA4A4A4A2A2A29B9B9B9999999494949090
              909C9C9CEBEBEBA4A4A48484847F7F7F696969424242FF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FF858585CCCCCCD1D1D1BFBFBFBABABAB7B7B7B4B4B4
              B1B1B1ADADADA8A8A8B2B2B2F8F8F8ECECECA6A6A68585856F6F6F474747FF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FF858585CECECED4D4D4FCFCFCFD
              FDFDFDFDFDFDFDFDFCFCFCFCFCFCFCFCFCFDFDFDFCFCFCFFFFFFEDEDED8A8A8A
              747474515151FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FF858585D3D3
              D3DCDCDCCACACAC0C0C0BDBDBDB9B9B9B4B4B4B3B3B3B0B0B0B7B7B7F8F8F8EE
              EEEEADADAD8E8E8E7A7A7A5A5A5AFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FF858585D4D4D4E6E6E6D3D3D3C8C8C8C3C3C3BDBDBDB5B5B5B0B0B0A9A9
              A9ADADADEEEEEEB2B2B2969696939393808080626262FF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FF858585D0D0D0EBEBEBE8E8E8E3E3E3DEDEDED9D9D9
              D0D0D0C6C6C6B7B7B7A7A7A79E9E9E9B9B9B9C9C9C9A9A9A8888886A6A6AFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FF858585BAB7B4D6D6D6DCDCDCDC
              DCDCD9D9D9D3D3D3CCCCCCC1C1C1B1B1B1A4A4A49A9A9A959595969696959595
              888481707070FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FF9595
              95A6A6A6A7A7A7A7A7A7A3A3A39E9E9EA0A0A09A9A9A9292928B8B8B88888888
              88888787878585857D7D7DFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF000000}
            State = sNormal
            Enabled = True
            CanBeDown = False
            Down = False
            ShowHint = True
            OnClick = btnMoveSubtitleClick
          end
          object btnSyncPoint1: TSWButton
            Left = 350
            Top = 21
            Width = 27
            Height = 25
            Normal.Data = {
              AE060000424DAE06000000000000360000002800000017000000170000000100
              1800000000007806000000000000000000000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FF7142
              136E4013653A115D351059330F59330F59330F59330F59330F59330F59330F59
              330F5A340F5A340F4C2B0DFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FF9154199C58229B5B1B94561A8D5218894F18854D17834D17844D17854D
              17854D17844D17854D17895018804B16693A194C2C0DFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFA9621DB96B20BE6E21B4681FAF651EAC641EA6611D
              A25F1CA05E1CA15E1CA15E1CA25E1CA25E1CA6611DA25E1C804B165A340FFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB2681FC47222C77322BD6E21B8
              6B21B4681FAF661EAA621DA6611DA25E1CA15E1CA25E1CA25D1CA7611DA7611D
              8950185A340FFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB66A20C775
              26C97626C07224FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFA25E1CA25E1C854D1759330FFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FFB66A20CD7D30D38233C97829FFFFFFBD6E21B66A20B3681FAD641EA862
              1DA35E1CA05D1C9E5B1BA25D1CA25E1C844D1759330FFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFB66A20D18740D98C43D07F31FFFFFFC47323C07227
              B86C22B2671FAD651EA8621DA7611DA15E1CA25D1CA15D1C844D1759330FFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB66A20D69657DD9A58D28439CF
              7D2DCC7827C77525EED9C4FFFFFFFFFFFFFFFFFFCBA077A7611DA8621DA35E1C
              854C1759330FFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB66A20D9A1
              69E0A56BD3883FD18031D07E2DCC7623C97423D4985DFFFFFFB96B20AF651EAE
              651EAF651EA8611D894F1859330FFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FFB66A20DBA774E2AC76D48C45D28337D28335D07C2ACE7927D99B5FFFFF
              FFC06F21BC6D21B4681FB5691FAE651E8F54195A340FFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFB66A20DDAB7BE4B07DD7924ED58B42D3873DD28336
              D18031DDA063FFFFFFCB7623C57222BA6C20BB6C20B66A2097581A623911FF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB66A20DEAE7FE6B584D99757D6
              904AD58B41D3873DD28335DDA267FFFFFFCE7825CA7523C47222C47122BD6E21
              9F5D1C6E4013FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB66A20DFB1
              86E9BD93DC9D60D7904CD68F48D48940F3DECAFFFFFFFFFFFFD07C2ACD7724CA
              7523C97523C37122A7611D7A4715FF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FFB66A20E0B48BEECBA9E3B384DFA76FDCA268DA9B5DD79351E4B586FFFF
              FFD18031CF7B28CE7825CF7924CA7523AF651E864E17FF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFB66A20E0B081F2D4B5EECDADECC7A3EAC199E7B98D
              E3AF7CE0A46ADB9652D6883BD3802ED37B27D67C25D37B25B96B20915419FF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB76A20D49360E3B68BE4BE98E4
              BE98E3BA91E0B388DDAC7BD99F66D48F4DD0843ACD7C2CCB7726CF7824CC7623
              B869269A5A1BFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFBD77
              34C4864AC4884CC4884CC28446C07E3FC18142BF7B3ABB742FB96F27B76C23B7
              6C23B66A21B76B20AB631EFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF000000}
            MouseOver.Data = {
              AE060000424DAE06000000000000360000002800000017000000170000000100
              18000000000078060000120B0000120B00000000000000000000FF00FFFF00FF
              7981817981817882827781817980837980837782807782807980837980837781
              81778181798083798083778181778181787F82798083748082FF00FFFF00FF00
              0000FF00FF7E8081F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EB808080FF00FF0000007B8081F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7
              E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EB758181000000808080F7E7EBF7E7EBF7E7EB7142
              136E4013653A115D351059330F59330F59330F59330F59330F59330F59330F59
              330F5A340F5A340F4C2B0DF7E7EBF7E7EBF7E7EB7B8081000000808080F7E7EB
              F7E7EB9154199C5D219B5B1B94561A8D5218894F18854D17834D17844D17854D
              17854D17844D17854D17895018804B16693F184C2C0DF7E7EBF7E7EB7B808100
              00007F7F7FF7E7EBF7E7EBA9621DB96B20BE6E21B4681FAF651EAC641EA6611D
              A25F1CA05E1CA15E1CA15E1CA25E1CA25E1CA6611DA25E1C804B165A340FF7E7
              EBF7E7EB7B80810000007C8180F7E7EBF7E7EBB2681FC47222C77322BD6E21B8
              6B21B4681FAF661EAA621DA6611DA25E1CA15E1CA25E1CA25D1CA7611DA7611D
              8950185A340FF7E7EBF7E7EB7B7F840000007C8180F7E7EBF7E7EBB66A20C775
              26C97626C07224FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFA25E1CA25E1C854D1759330FF7E7EBF7E7EB7B7F840000007B8180F7E7EB
              F7E7EBB66A20CD7D30D38233C97829FFFFFFBD6E21B66A20B3681FAD641EA862
              1DA35E1CA05D1C9E5B1BA25D1CA25E1C844D1759330FF7E7EBF7E7EB7B808100
              00007B8180F7E7EBF7E7EBB66A20D18740D98C43D07F31FFFFFFC47323C07227
              B86C22B2671FAD651EA8621DA7611DA15E1CA25D1CA15D1C844D1759330FF7E7
              EBF7E7EB7B80810000007D8281F7E7EBF7E7EBB66A20D69657DD9A58D28439CF
              7D2DCC7827C77525EED9C4FFFFFFFFFFFFFFFFFFCBA077A7611DA8621DA35E1C
              854C1759330FF7E7EBF7E7EB7B80810000007C8180F7E7EBF7E7EBB66A20D9A1
              69E0A56BD3883FD18031D07E2DCC7623C97423D4985DFFFFFFB96B20AF651EAE
              651EAF651EA8611D894F1859330FF7E7EBF7E7EB7B80810000007C8081F7E7EB
              F7E7EBB66A20DBA774E2AC76D48C45D28337D28335D07C2ACE7927D99B5FFFFF
              FFC06F21BC6D21B4681FB5691FAE651E8F54195A340FF7E7EBF7E7EB7B808100
              00007B7F80F7E7EBF7E7EBB66A20DDAB7BE4B07DD7924ED58B42D3873DD28336
              D18031DDA063FFFFFFCB7623C57222BA6C20BB6C20B66A2097581A623911F7E7
              EBF7E7EB7B80810000007C8180F7E7EBF7E7EBB66A20DEAE7FE6B584D99757D6
              904AD58B41D3873DD28335DDA267FFFFFFCE7825CA7523C47222C47122BD6E21
              9F5D1C6E4013F7E7EBF7E7EB7B80810000007C8180F7E7EBF7E7EBB66A20DFB1
              86E9BD93DC9D60D7904CD68F48D48940F3DECAFFFFFFFFFFFFD07C2ACD7724CA
              7523C97523C37122A7611D7A4715F7E7EBF7E7EB7B80810000007C8180F7E7EB
              F7E7EBB66A20E0B48BEECBA9E3B384DFA76FDCA268DA9B5DD79351E4B586FFFF
              FFD18031CF7B28CE7825CF7924CA7523AF651E864E17F7E7EBF7E7EB7B808100
              00007D8281F7E7EBF7E7EBB66A20E0B081F2D4B5EECDADECC7A3EAC199E7B98D
              E3AF7CE0A46ADB9652D6883BD3802ED37B27D67C25D37B25B96B20915419F7E7
              EBF7E7EB7B80810000007C8180F7E7EBF7E7EBB76A20D3995FE3B68BE4BE98E4
              BE98E3BA91E0B388DDAC7BD99F66D48F4DD0843ACD7C2CCB7726CF7824CC7623
              B86E269A5A1BF7E7EBF7E7EB7B80810000007C8180F7E7EBF7E7EBF7E7EBBD77
              34C4864AC4884CC4884CC28446C07E3FC18142BF7B3ABB742FB96F27B76C23B7
              6C23B66A21B76B20AB631EF7E7EBF7E7EBF7E7EB7B80810000007B8180F7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB75818100
              0000FF00FF7E8080F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EB808080FF00FF000000FF00FFFF00FF79808379808377818177818179808379
              8083778181778181798083798083778083778083798083798083778181778181
              798083798083748082FF00FFFF00FF000000}
            Pressed.Data = {
              AE060000424DAE06000000000000360000002800000017000000170000000100
              18000000000078060000120B0000120B00000000000000000000FF00FFFF00FF
              7981817981817882827781817980837980837782807782807980837980837781
              81778181798083798083778181778181787F82798083748082FF00FFFF00FF00
              0000FF00FF7E8081DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CF808080FF00FF0000007B8081DACBCFDACBCFDACBCFDACBCF7142136E401365
              3A115D351059330F59330F59330F59330F59330F59330F59330F59330F5A340F
              5A340F4C2B0DDACBCFDACBCF758181000000808080DACBCFDACBCFDACBCF9154
              199B5D209B5B1B94561A8D5218894F18854D17834D17844D17854D17854D1784
              4D17854D17895018804B16683F174C2C0DDACBCF7B80810000007F7F7FDACBCF
              DACBCFDACBCFA9621DB96B20BE6E21B4681FAF651EAC641EA6611DA25F1CA05E
              1CA15E1CA15E1CA25E1CA25E1CA6611DA25E1C804B165A340FDACBCF7B808100
              00007C8180DACBCFDACBCFDACBCFB2681FC47222C77322BD6E21B86B21B4681F
              AF661EAA621DA6611DA25E1CA15E1CA25E1CA25D1CA7611DA7611D8950185A34
              0FDACBCF7B7F840000007C8180DACBCFDACBCFDACBCFB66A20C77526C97626C0
              7224FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA25E1C
              A25E1C854D1759330FDACBCF7B7F840000007B8180DACBCFDACBCFDACBCFB66A
              20CD7D30D38233C97829FFFFFFBD6E21B66A20B3681FAD641EA8621DA35E1CA0
              5D1C9E5B1BA25D1CA25E1C844D1759330FDACBCF7B80810000007B8180DACBCF
              DACBCFDACBCFB66A20D18740D98C43D07F31FFFFFFC47323C07227B86C22B267
              1FAD651EA8621DA7611DA15E1CA25D1CA15D1C844D1759330FDACBCF7B808100
              00007D8281DACBCFDACBCFDACBCFB66A20D69657DD9A58D28439CF7D2DCC7827
              C77525EED9C4FFFFFFFFFFFFFFFFFFCBA077A7611DA8621DA35E1C854C175933
              0FDACBCF7B80810000007D8281DACBCFDACBCFDACBCFB66A20D9A169E0A56BD3
              883FD18031D07E2DCC7623C97423D4985DFFFFFFB96B20AF651EAE651EAF651E
              A8611D894F1859330FDACBCF7B80810000007C8180DACBCFDACBCFDACBCFB66A
              20DBA774E2AC76D48C45D28337D28335D07C2ACE7927D99B5FFFFFFFC06F21BC
              6D21B4681FB5691FAE651E8F54195A340FDACBCF7B80810000007C8081DACBCF
              DACBCFDACBCFB66A20DDAB7BE4B07DD7924ED58B42D3873DD28336D18031DDA0
              63FFFFFFCB7623C57222BA6C20BB6C20B66A2097581A623911DACBCF7B808100
              00007B7F80DACBCFDACBCFDACBCFB66A20DEAE7FE6B584D99757D6904AD58B41
              D3873DD28335DDA267FFFFFFCE7825CA7523C47222C47122BD6E219F5D1C6E40
              13DACBCF7B80810000007C8180DACBCFDACBCFDACBCFB66A20DFB186E9BD93DC
              9D60D7904CD68F48D48940F3DECAFFFFFFFFFFFFD07C2ACD7724CA7523C97523
              C37122A7611D7A4715DACBCF7B80810000007C8180DACBCFDACBCFDACBCFB66A
              20E0B48BEECBA9E3B384DFA76FDCA268DA9B5DD79351E4B586FFFFFFD18031CF
              7B28CE7825CF7924CA7523AF651E864E17DACBCF7B80810000007C8180DACBCF
              DACBCFDACBCFB66A20E0B081F2D4B5EECDADECC7A3EAC199E7B98DE3AF7CE0A4
              6ADB9652D6883BD3802ED37B27D67C25D37B25B96B20915419DACBCF7B808100
              00007D8281DACBCFDACBCFDACBCFB76A20D2985EE3B68BE4BE98E4BE98E3BA91
              E0B388DDAC7BD99F66D48F4DD0843ACD7C2CCB7726CF7824CC7623B76D259A5A
              1BDACBCF7B80810000007C8180DACBCFDACBCFDACBCFDACBCFBD7734C4864AC4
              884CC4884CC28446C07E3FC18142BF7B3ABB742FB96F27B76C23B76C23B66A21
              B76B20AB631EDACBCFDACBCF7B80810000007C8180DACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDA
              CBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF7B80810000007B8180DACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF75818100
              0000FF00FF7E8080DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CF808080FF00FF000000FF00FFFF00FF79808379808377818177818179808379
              8083778181778181798083798083778083778083798083798083778181778181
              798083798083748082FF00FFFF00FF000000}
            Disabled.Data = {
              AE060000424DAE06000000000000360000002800000017000000170000000100
              18000000000078060000120B0000120B00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FF5252
              525151514A4A4A43434341414141414141414141414141414141414141414141
              4141424242424242383838FF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FF6A6A6A726F6D7171716C6C6C6767676464646161616060606060606161
              616161616060606161616464645E5E5E4C4948383838FF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FF7B7B7B8787878B8B8B8484848080807E7E7E797979
              7676767575757575757575757676767676767979797676765E5E5E424242FF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FF8282828F8F8F9292928A8A8A87
              87878484848080807D7D7D7979797676767575757676767676767A7A7A7A7A7A
              646464424242FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FF8585859393
              939595958E8E8EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFF767676767676616161414141FF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FF8585859D9D9DA2A2A2969696FFFFFF8A8A8A8585858383837F7F7F7A7A
              7A787878757575747474767676767676606060414141FF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FF858585A9A9A9AEAEAEA0A0A0FFFFFF8F8F8F909090
              8888888282827E7E7E7A7A7A7A7A7A757575767676757575606060414141FF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FF858585B7B7B7BBBBBBA5A5A59C
              9C9C979797939393E1E1E1FFFFFFFFFFFFFFFFFFB0B0B07A7A7A7A7A7A787878
              616161414141FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FF858585C2C2
              C2C6C6C6A9A9A9A0A0A09D9D9D959595939393ADADADFFFFFF8787878080807F
              7F7F8080807B7B7B646464414141FF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FF858585C9C9C9CCCCCCADADADA4A4A4A2A2A29B9B9B999999B1B1B1FFFF
              FF8D8D8D8989898484848484847F7F7F696969424242FF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FF858585CCCCCCD1D1D1B2B2B2ABABABA7A7A7A3A3A3
              A0A0A0B6B6B6FFFFFF9494949090908888888989898585856F6F6F474747FF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FF858585CECECED4D4D4B9B9B9B0
              B0B0ABABABA7A7A7A2A2A2B8B8B8FFFFFF9696969494948F8F8F8F8F8F8A8A8A
              747474515151FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FF858585D3D3
              D3DCDCDCBFBFBFB2B2B2AFAFAFAAAAAAE7E7E7FFFFFFFFFFFF9B9B9B96969694
              94949393938E8E8E7A7A7A5A5A5AFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FF858585D4D4D4E6E6E6D3D3D3C8C8C8C3C3C3BDBDBDB5B5B5CACACAFFFF
              FFA0A0A0999999979797969696939393808080626262FF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FF858585D0D0D0EBEBEBE8E8E8E3E3E3DEDEDED9D9D9
              D0D0D0C6C6C6B7B7B7A7A7A79E9E9E9B9B9B9C9C9C9A9A9A8888886A6A6AFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FF858585BAB7B4D6D6D6DCDCDCDC
              DCDCD9D9D9D3D3D3CCCCCCC1C1C1B1B1B1A4A4A49A9A9A959595969696959595
              888481707070FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FF9595
              95A6A6A6A7A7A7A7A7A7A3A3A39E9E9EA0A0A09A9A9A9292928B8B8B88888888
              88888787878585857D7D7DFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF000000}
            State = sNormal
            Enabled = True
            CanBeDown = False
            Down = False
            ShowHint = True
            OnClick = btnSyncPoint1Click
          end
          object btnSyncPoint2: TSWButton
            Left = 374
            Top = 21
            Width = 27
            Height = 25
            Normal.Data = {
              AE060000424DAE06000000000000360000002800000017000000170000000100
              1800000000007806000000000000000000000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FF7142
              136E4013653A115D351059330F59330F59330F59330F59330F59330F59330F59
              330F5A340F5A340F4C2B0DFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FF9154199C58229B5B1B94561A8D5218894F18854D17834D17844D17854D
              17854D17844D17854D17895018804B16693A194C2C0DFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFA9621DB96B20BE6E21B4681FAF651EAC641EA6611D
              A25F1CA05E1CA15E1CA15E1CA25E1CA25E1CA6611DA25E1C804B165A340FFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB2681FC47222C77322BD6E21B8
              6B21B4681FAF661EAA621DA6611DA25E1CA15E1CA25E1CA25D1CA7611DA7611D
              8950185A340FFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB66A20C775
              26C97626C07224FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFA25E1CA25E1C854D1759330FFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FFB66A20CD7D30D38233C97829C27225BD6E21B66A20B3681FAD641EA862
              1DA35E1CA05D1CFFFFFFA25D1CA25E1C844D1759330FFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFB66A20D18740D98C43D07F31CA7929C47323C07227
              B86C22B2671FAD651EA8621DA7611DFFFFFFA25D1CA15D1C844D1759330FFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB66A20D69657DD9A58D28439CF
              7D2DE0AF7EFFFFFFFFFFFFFFFFFFFFFFFFC6905AA8611DA7611DA8621DA35E1C
              854C1759330FFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB66A20D9A1
              69E0A56BD3883FD18031D99857F8EDE2DFAC7BC47222BE6E21B96B20AF651EAE
              651EAF651EA8611D894F1859330FFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FFB66A20DBA774E2AC76D48C45D28337D28335D38438F5E4D4E3B58AC572
              22C06F21BC6D21B4681FB5691FAE651E8F54195A340FFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFB66A20DDAB7BE4B07DD7924ED58B42D3873DD28336
              D4883EF6E5D4E1AE7CCB7623C57222BA6C20BB6C20B66A2097581A623911FF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB66A20DEAE7FE6B584D99757D6
              904AD58B41D3873DD28335E0AA74FCF6F1CE7825CA7523C47222C47122BD6E21
              9F5D1C6E4013FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB66A20DFB1
              86E9BD93DC9D60D7904CE1AD79F0D7BFD28337E7BC93FCF7F1D07C2ACD7724CA
              7523C97523C37122A7611D7A4715FF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FFB66A20E0B48BEECBA9E3B384DFA76FE1AE7CF7EADEFFFFFFFFFFFFE5B8
              8CD18031CF7B28CE7825CF7924CA7523AF651E864E17FF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFB66A20E0B081F2D4B5EECDADECC7A3EAC199E7B98D
              E3AF7CE0A46ADB9652D6883BD3802ED37B27D67C25D37B25B96B20915419FF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFB76A20D49360E3B68BE4BE98E4
              BE98E3BA91E0B388DDAC7BD99F66D48F4DD0843ACD7C2CCB7726CF7824CC7623
              B869269A5A1BFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFBD77
              34C4864AC4884CC4884CC28446C07E3FC18142BF7B3ABB742FB96F27B76C23B7
              6C23B66A21B76B20AB631EFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF000000}
            MouseOver.Data = {
              AE060000424DAE06000000000000360000002800000017000000170000000100
              18000000000078060000120B0000120B00000000000000000000FF00FFFF00FF
              7981817981817882827781817980837980837782807782807980837980837781
              81778181798083798083778181778181787F82798083748082FF00FFFF00FF00
              0000FF00FF7E8081F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EB808080FF00FF0000007B8081F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7
              E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EB758181000000808080F7E7EBF7E7EBF7E7EB7142
              136E4013653A115D351059330F59330F59330F59330F59330F59330F59330F59
              330F5A340F5A340F4C2B0DF7E7EBF7E7EBF7E7EB7B8081000000808080F7E7EB
              F7E7EB9154199C5D219B5B1B94561A8D5218894F18854D17834D17844D17854D
              17854D17844D17854D17895018804B16693F184C2C0DF7E7EBF7E7EB7B808100
              00007F7F7FF7E7EBF7E7EBA9621DB96B20BE6E21B4681FAF651EAC641EA6611D
              A25F1CA05E1CA15E1CA15E1CA25E1CA25E1CA6611DA25E1C804B165A340FF7E7
              EBF7E7EB7B80810000007C8180F7E7EBF7E7EBB2681FC47222C77322BD6E21B8
              6B21B4681FAF661EAA621DA6611DA25E1CA15E1CA25E1CA25D1CA7611DA7611D
              8950185A340FF7E7EBF7E7EB7B7F840000007C8180F7E7EBF7E7EBB66A20C775
              26C97626C07224FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFA25E1CA25E1C854D1759330FF7E7EBF7E7EB7B7F840000007B8180F7E7EB
              F7E7EBB66A20CD7D30D38233C97829C27225BD6E21B66A20B3681FAD641EA862
              1DA35E1CA05D1CFFFFFFA25D1CA25E1C844D1759330FF7E7EBF7E7EB7B808100
              00007B8180F7E7EBF7E7EBB66A20D18740D98C43D07F31CA7929C47323C07227
              B86C22B2671FAD651EA8621DA7611DFFFFFFA25D1CA15D1C844D1759330FF7E7
              EBF7E7EB7B80810000007D8281F7E7EBF7E7EBB66A20D69657DD9A58D28439CF
              7D2DE0AF7EFFFFFFFFFFFFFFFFFFFFFFFFC6905AA8611DA7611DA8621DA35E1C
              854C1759330FF7E7EBF7E7EB7B80810000007C8180F7E7EBF7E7EBB66A20D9A1
              69E0A56BD3883FD18031D99857F8EDE2DFAC7BC47222BE6E21B96B20AF651EAE
              651EAF651EA8611D894F1859330FF7E7EBF7E7EB7B80810000007C8081F7E7EB
              F7E7EBB66A20DBA774E2AC76D48C45D28337D28335D38438F5E4D4E3B58AC572
              22C06F21BC6D21B4681FB5691FAE651E8F54195A340FF7E7EBF7E7EB7B808100
              00007B7F80F7E7EBF7E7EBB66A20DDAB7BE4B07DD7924ED58B42D3873DD28336
              D4883EF6E5D4E1AE7CCB7623C57222BA6C20BB6C20B66A2097581A623911F7E7
              EBF7E7EB7B80810000007C8180F7E7EBF7E7EBB66A20DEAE7FE6B584D99757D6
              904AD58B41D3873DD28335E0AA74FCF6F1CE7825CA7523C47222C47122BD6E21
              9F5D1C6E4013F7E7EBF7E7EB7B80810000007C8180F7E7EBF7E7EBB66A20DFB1
              86E9BD93DC9D60D7904CE1AD79F0D7BFD28337E7BC93FCF7F1D07C2ACD7724CA
              7523C97523C37122A7611D7A4715F7E7EBF7E7EB7B80810000007C8180F7E7EB
              F7E7EBB66A20E0B48BEECBA9E3B384DFA76FE1AE7CF7EADEFFFFFFFFFFFFE5B8
              8CD18031CF7B28CE7825CF7924CA7523AF651E864E17F7E7EBF7E7EB7B808100
              00007D8281F7E7EBF7E7EBB66A20E0B081F2D4B5EECDADECC7A3EAC199E7B98D
              E3AF7CE0A46ADB9652D6883BD3802ED37B27D67C25D37B25B96B20915419F7E7
              EBF7E7EB7B80810000007C8180F7E7EBF7E7EBB76A20D3995FE3B68BE4BE98E4
              BE98E3BA91E0B388DDAC7BD99F66D48F4DD0843ACD7C2CCB7726CF7824CC7623
              B86E269A5A1BF7E7EBF7E7EB7B80810000007C8180F7E7EBF7E7EBF7E7EBBD77
              34C4864AC4884CC4884CC28446C07E3FC18142BF7B3ABB742FB96F27B76C23B7
              6C23B66A21B76B20AB631EF7E7EBF7E7EBF7E7EB7B80810000007B8180F7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB75818100
              0000FF00FF7E8080F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EB
              F7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7EBF7E7
              EB808080FF00FF000000FF00FFFF00FF79808379808377818177818179808379
              8083778181778181798083798083778083778083798083798083778181778181
              798083798083748082FF00FFFF00FF000000}
            Pressed.Data = {
              AE060000424DAE06000000000000360000002800000017000000170000000100
              18000000000078060000120B0000120B00000000000000000000FF00FFFF00FF
              7981817981817882827781817980837980837782807782807980837980837781
              81778181798083798083778181778181787F82798083748082FF00FFFF00FF00
              0000FF00FF7E8081DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CF808080FF00FF0000007B8081DACBCFDACBCFDACBCFDACBCF7142136E401365
              3A115D351059330F59330F59330F59330F59330F59330F59330F59330F5A340F
              5A340F4C2B0DDACBCFDACBCF758181000000808080DACBCFDACBCFDACBCF9154
              199B5D209B5B1B94561A8D5218894F18854D17834D17844D17854D17854D1784
              4D17854D17895018804B16683F174C2C0DDACBCF7B80810000007F7F7FDACBCF
              DACBCFDACBCFA9621DB96B20BE6E21B4681FAF651EAC641EA6611DA25F1CA05E
              1CA15E1CA15E1CA25E1CA25E1CA6611DA25E1C804B165A340FDACBCF7B808100
              00007C8180DACBCFDACBCFDACBCFB2681FC47222C77322BD6E21B86B21B4681F
              AF661EAA621DA6611DA25E1CA15E1CA25E1CA25D1CA7611DA7611D8950185A34
              0FDACBCF7B7F840000007C8180DACBCFDACBCFDACBCFB66A20C77526C97626C0
              7224FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA25E1C
              A25E1C854D1759330FDACBCF7B7F840000007B8180DACBCFDACBCFDACBCFB66A
              20CD7D30D38233C97829C27225BD6E21B66A20B3681FAD641EA8621DA35E1CA0
              5D1CFFFFFFA25D1CA25E1C844D1759330FDACBCF7B80810000007B8180DACBCF
              DACBCFDACBCFB66A20D18740D98C43D07F31CA7929C47323C07227B86C22B267
              1FAD651EA8621DA7611DFFFFFFA25D1CA15D1C844D1759330FDACBCF7B808100
              00007D8281DACBCFDACBCFDACBCFB66A20D69657DD9A58D28439CF7D2DE0AF7E
              FFFFFFFFFFFFFFFFFFFFFFFFC6905AA8611DA7611DA8621DA35E1C854C175933
              0FDACBCF7B80810000007D8281DACBCFDACBCFDACBCFB66A20D9A169E0A56BD3
              883FD18031D99857F8EDE2DFAC7BC47222BE6E21B96B20AF651EAE651EAF651E
              A8611D894F1859330FDACBCF7B80810000007C8180DACBCFDACBCFDACBCFB66A
              20DBA774E2AC76D48C45D28337D28335D38438F5E4D4E3B58AC57222C06F21BC
              6D21B4681FB5691FAE651E8F54195A340FDACBCF7B80810000007C8081DACBCF
              DACBCFDACBCFB66A20DDAB7BE4B07DD7924ED58B42D3873DD28336D4883EF6E5
              D4E1AE7CCB7623C57222BA6C20BB6C20B66A2097581A623911DACBCF7B808100
              00007B7F80DACBCFDACBCFDACBCFB66A20DEAE7FE6B584D99757D6904AD58B41
              D3873DD28335E0AA74FCF6F1CE7825CA7523C47222C47122BD6E219F5D1C6E40
              13DACBCF7B80810000007C8180DACBCFDACBCFDACBCFB66A20DFB186E9BD93DC
              9D60D7904CE1AD79F0D7BFD28337E7BC93FCF7F1D07C2ACD7724CA7523C97523
              C37122A7611D7A4715DACBCF7B80810000007C8180DACBCFDACBCFDACBCFB66A
              20E0B48BEECBA9E3B384DFA76FE1AE7CF7EADEFFFFFFFFFFFFE5B88CD18031CF
              7B28CE7825CF7924CA7523AF651E864E17DACBCF7B80810000007C8180DACBCF
              DACBCFDACBCFB66A20E0B081F2D4B5EECDADECC7A3EAC199E7B98DE3AF7CE0A4
              6ADB9652D6883BD3802ED37B27D67C25D37B25B96B20915419DACBCF7B808100
              00007D8281DACBCFDACBCFDACBCFB76A20D2985EE3B68BE4BE98E4BE98E3BA91
              E0B388DDAC7BD99F66D48F4DD0843ACD7C2CCB7726CF7824CC7623B76D259A5A
              1BDACBCF7B80810000007C8180DACBCFDACBCFDACBCFDACBCFBD7734C4864AC4
              884CC4884CC28446C07E3FC18142BF7B3ABB742FB96F27B76C23B76C23B66A21
              B76B20AB631EDACBCFDACBCF7B80810000007C8180DACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDA
              CBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF7B80810000007B8180DACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF75818100
              0000FF00FF7E8080DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCF
              DACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACBCFDACB
              CF808080FF00FF000000FF00FFFF00FF79808379808377818177818179808379
              8083778181778181798083798083778083778083798083798083778181778181
              798083798083748082FF00FFFF00FF000000}
            Disabled.Data = {
              AE060000424DAE06000000000000360000002800000017000000170000000100
              18000000000078060000120B0000120B00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FF5252
              525151514A4A4A43434341414141414141414141414141414141414141414141
              4141424242424242383838FF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FF6A6A6A726F6D7171716C6C6C6767676464646161616060606060606161
              616161616060606161616464645E5E5E4C4948383838FF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FF7B7B7B8787878B8B8B8484848080807E7E7E797979
              7676767575757575757575757676767676767979797676765E5E5E424242FF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FF8282828F8F8F9292928A8A8A87
              87878484848080807D7D7D7979797676767575757676767676767A7A7A7A7A7A
              646464424242FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FF8585859393
              939595958E8E8EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFF767676767676616161414141FF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FF8585859D9D9DA2A2A29696969090908A8A8A8585858383837F7F7F7A7A
              7A787878757575FFFFFF767676767676606060414141FF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FF858585A9A9A9AEAEAEA0A0A09696968F8F8F909090
              8888888282827E7E7E7A7A7A7A7A7AFFFFFF767676757575606060414141FF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FF858585B7B7B7BBBBBBA5A5A59C
              9C9CC1C1C1FFFFFFFFFFFFFFFFFFFFFFFFA3A3A37B7B7B7A7A7A7A7A7A787878
              616161414141FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FF858585C2C2
              C2C6C6C6A9A9A9A0A0A0B1B1B1F1F1F1BEBEBE8F8F8F8B8B8B8787878080807F
              7F7F8080807B7B7B646464414141FF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FF858585C9C9C9CCCCCCADADADA4A4A4A2A2A2A2A2A2EBEBEBC6C6C69090
              908D8D8D8989898484848484847F7F7F696969424242FF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FF858585CCCCCCD1D1D1B2B2B2ABABABA7A7A7A3A3A3
              A6A6A6EBEBEBC0C0C09494949090908888888989898585856F6F6F474747FF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FF858585CECECED4D4D4B9B9B9B0
              B0B0ABABABA7A7A7A2A2A2BEBEBEF8F8F89696969494948F8F8F8F8F8F8A8A8A
              747474515151FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FF858585D3D3
              D3DCDCDCBFBFBFB2B2B2C4C4C4E3E3E3A4A4A4CDCDCDF9F9F99B9B9B96969694
              94949393938E8E8E7A7A7A5A5A5AFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FF858585D4D4D4E6E6E6D3D3D3C8C8C8CBCBCBF2F2F2FFFFFFFFFFFFCBCB
              CBA0A0A0999999979797969696939393808080626262FF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FF858585D0D0D0EBEBEBE8E8E8E3E3E3DEDEDED9D9D9
              D0D0D0C6C6C6B7B7B7A7A7A79E9E9E9B9B9B9C9C9C9A9A9A8888886A6A6AFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FF858585BAB7B4D6D6D6DCDCDCDC
              DCDCD9D9D9D3D3D3CCCCCCC1C1C1B1B1B1A4A4A49A9A9A959595969696959595
              888481707070FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FF9595
              95A6A6A6A7A7A7A7A7A7A3A3A39E9E9EA0A0A09A9A9A9292928B8B8B88888888
              88888787878585857D7D7DFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
              0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF000000}
            State = sNormal
            Enabled = True
            CanBeDown = False
            Down = False
            ShowHint = True
            OnClick = btnSyncPoint2Click
          end
        end
      end
      object lstSubtitles: TVirtualStringTree
        Left = 0
        Top = 104
        Width = 697
        Height = 186
        Anchors = [akLeft, akTop, akRight, akBottom]
        DefaultPasteMode = amInsertAfter
        EditDelay = 100
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Header.AutoSizeIndex = 4
        Header.DefaultHeight = 17
        Header.Font.Charset = ANSI_CHARSET
        Header.Font.Color = clWindowText
        Header.Font.Height = -11
        Header.Font.Name = 'Tahoma'
        Header.Font.Style = []
        Header.MainColumn = 3
        Header.MaxHeight = 30
        Header.MinHeight = 17
        Header.Options = [hoColumnResize, hoDrag, hoRestrictDrag, hoVisible]
        Header.PopupMenu = mnuColumnsPopup
        Header.Style = hsPlates
        HintMode = hmHintAndDefault
        Margin = 0
        ParentFont = False
        ParentShowHint = False
        PopupMenu = mnuStylePopup
        ShowHint = True
        TabOrder = 1
        TextMargin = 8
        TreeOptions.AutoOptions = [toAutoDropExpand, toAutoScroll, toAutoTristateTracking, toAutoDeleteMovedNodes]
        TreeOptions.MiscOptions = [toAcceptOLEDrop, toEditable, toFullRepaintOnResize, toInitOnSave, toReportMode, toToggleOnDblClick, toWheelPanning, toEditOnClick]
        TreeOptions.PaintOptions = [toShowButtons, toShowDropmark, toShowHorzGridLines, toShowTreeLines, toShowVertGridLines, toThemeAware, toUseBlendedImages, toAlwaysHideSelection]
        TreeOptions.SelectionOptions = [toExtendedFocus, toFullRowSelect, toMultiSelect, toRightClickSelect, toSimpleDrawSelection]
        OnAfterCellPaint = lstSubtitlesAfterCellPaint
        OnAfterColumnWidthTracking = lstSubtitlesAfterColumnWidthTracking
        OnBeforeCellPaint = lstSubtitlesBeforeCellPaint
        OnBeforeColumnWidthTracking = lstSubtitlesBeforeColumnWidthTracking
        OnChange = lstSubtitlesChange
        OnColumnResize = lstSubtitlesColumnResize
        OnCreateEditor = lstSubtitlesCreateEditor
        OnDblClick = lstSubtitlesDblClick
        OnEditCancelled = lstSubtitlesEditCancelled
        OnEdited = lstSubtitlesEdited
        OnEditing = lstSubtitlesEditing
        OnExit = lstSubtitlesExit
        OnFocusChanged = lstSubtitlesFocusChanged
        OnFreeNode = lstSubtitlesFreeNode
        OnGetText = lstSubtitlesGetText
        OnPaintText = lstSubtitlesPaintText
        OnGetHint = lstSubtitlesGetHint
        OnGetNodeDataSize = lstSubtitlesGetNodeDataSize
        OnHeaderClick = lstSubtitlesHeaderClick
        OnHeaderDragged = lstSubtitlesHeaderDragged
        OnInitNode = lstSubtitlesInitNode
        OnKeyDown = lstSubtitlesKeyDown
        OnKeyUp = lstSubtitlesKeyUp
        OnMouseDown = lstSubtitlesMouseDown
        OnMouseUp = lstSubtitlesMouseUp
        OnMouseWheel = lstSubtitlesMouseWheel
        Columns = <
          item
            Options = [coAllowClick, coDraggable, coEnabled, coParentBidiMode, coResizable, coShowDropMark, coVisible, coAllowFocus]
            Position = 0
            Width = 40
            WideText = 'Num'
          end
          item
            Position = 2
            Width = 80
            WideText = 'Show'
          end
          item
            Position = 3
            Width = 80
            WideText = 'Hide'
          end
          item
            Position = 5
            Width = 345
            WideText = 'Text'
          end
          item
            Options = [coAllowClick, coDraggable, coEnabled, coParentBidiMode, coParentColor, coResizable, coShowDropMark, coAllowFocus]
            Position = 6
            Width = 19
            WideText = 'Translation'
          end
          item
            Position = 4
            WideText = 'Duration'
          end
          item
            Position = 1
            Width = 66
            WideText = 'Pause'
          end>
        WideDefaultText = '-'
      end
    end
  end
  object pnlCaret: TPanel
    Left = 405
    Top = 352
    Width = 1
    Height = 20
    BevelOuter = bvNone
    Color = clBlack
    Constraints.MaxWidth = 1
    Constraints.MinWidth = 1
    TabOrder = 5
    Visible = False
  end
  object mnuMain: TMainMenu
    Images = imgLstMenu
    OwnerDraw = True
    Left = 136
    Top = 160
    object mnuFile: TMenuItem
      Caption = 'File'
      OnClick = mnuFileClick
      object mnuNewSubtitle: TMenuItem
        Caption = 'New subtitle...'
        ImageIndex = 9
        ShortCut = 16462
        OnClick = mnuNewSubtitleClick
      end
      object mnuLoad: TMenuItem
        Caption = 'Load'
        Visible = False
        object mnuLoadProject: TMenuItem
          Caption = 'Project...'
          ShortCut = 32848
          OnClick = mnuLoadProjectClick
        end
        object N20: TMenuItem
          Caption = '-'
        end
        object mnuLoadOriginal: TMenuItem
          Caption = 'Original...'
          ShortCut = 16463
          OnClick = mnuLoadSubtitleClick
        end
        object mnuLoadTranslated: TMenuItem
          Caption = 'Translated...'
          ShortCut = 24655
          OnClick = mnuLoadTranslatedClick
        end
      end
      object mnuLoadSubtitle: TMenuItem
        Caption = 'Load subtitle...'
        ImageIndex = 10
        ShortCut = 16463
        OnClick = mnuLoadSubtitleClick
      end
      object mnuRecent: TMenuItem
        Caption = 'Recent files'
        ImageIndex = 6
        object N10: TMenuItem
          Caption = '-'
        end
        object mnuClearList: TMenuItem
          Caption = 'Clear list'
          Default = True
          OnClick = mnuClearListClick
        end
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object mnuTranslatorSave: TMenuItem
        Caption = 'Save'
        ImageIndex = 11
        Visible = False
        object mnuSaveProject: TMenuItem
          Caption = 'Project...'
          ShortCut = 41040
          OnClick = mnuSaveProjectClick
        end
        object N21: TMenuItem
          Caption = '-'
        end
        object mnuSaveOriginal: TMenuItem
          Caption = 'Original'
          ShortCut = 16467
          OnClick = mnuSaveFileClick
        end
        object mnuSaveTranslated: TMenuItem
          Caption = 'Translated'
          ShortCut = 24659
          OnClick = mnuSaveTranslatedClick
        end
        object N12: TMenuItem
          Caption = '-'
        end
        object mnuSaveOriginalAs: TMenuItem
          Caption = 'Original as...'
          ShortCut = 41039
          OnClick = mnuSaveFileAsClick
        end
        object mnuSaveTranslatedAs: TMenuItem
          Caption = 'Translated as...'
          ShortCut = 41044
          OnClick = mnuSaveTranslatedAsClick
        end
      end
      object mnuSaveFile: TMenuItem
        Caption = 'Save'
        ImageIndex = 11
        ShortCut = 16467
        OnClick = mnuSaveFileClick
      end
      object mnuSaveFileAs: TMenuItem
        Caption = 'Save as...'
        ShortCut = 24659
        OnClick = mnuSaveFileAsClick
      end
      object mnuSaveMarking: TMenuItem
        Caption = 'Save marking'
        OnClick = mnuSaveMarkingClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object mnuClose: TMenuItem
        Caption = 'Close'
        ShortCut = 16471
        OnClick = mnuCloseClick
      end
      object mnuExit: TMenuItem
        Caption = 'Exit'
        ShortCut = 32883
        OnClick = mnuExitClick
      end
    end
    object mnuEdit: TMenuItem
      Caption = 'Edit'
      OnClick = mnuEditClick
      object mnuUndo: TMenuItem
        Caption = 'Undo'
        ImageIndex = 12
        ShortCut = 16474
        OnClick = mnuUndoClick
      end
      object mnuRedo: TMenuItem
        Caption = 'Redo'
        ImageIndex = 13
        ShortCut = 24666
        OnClick = mnuRedoClick
      end
      object N34: TMenuItem
        Caption = '-'
      end
      object mnuInsertSubtitle: TMenuItem
        Caption = 'Insert subtitle'
        ImageIndex = 24
        ShortCut = 45
        OnClick = mnuInsertSubtitleClick
      end
      object mnuInsertBefore: TMenuItem
        Caption = 'Insert before'
        ImageIndex = 25
        ShortCut = 8237
        OnClick = mnuInsertBeforeClick
      end
      object mnuRemoveSelected: TMenuItem
        Caption = 'Remove selected'
        ImageIndex = 26
        OnClick = mnuRemoveSelectedClick
      end
      object N42: TMenuItem
        Caption = '-'
      end
      object mnuInsertSymbol: TMenuItem
        Caption = 'Insert symbol...'
        OnClick = mnuInsertSymbolClick
      end
      object N18: TMenuItem
        Caption = '-'
      end
      object mnuCut: TMenuItem
        Caption = 'Cut'
        ImageIndex = 14
        ShortCut = 16472
        OnClick = mnuCutClick
      end
      object mnuCopy: TMenuItem
        Caption = 'Copy'
        ImageIndex = 15
        ShortCut = 16451
        OnClick = mnuCopyClick
      end
      object mnuPaste: TMenuItem
        Caption = 'Paste'
        ImageIndex = 16
        ShortCut = 16470
        OnClick = mnuPasteClick
      end
      object N58: TMenuItem
        Caption = '-'
      end
      object mnuStyle: TMenuItem
        Caption = 'Style'
        object mnuItalic: TMenuItem
          Caption = 'Italic'
          ImageIndex = 32
          OnClick = mnuItalicClick
        end
        object mnuBold: TMenuItem
          Caption = 'Bold'
          ImageIndex = 31
          OnClick = mnuBoldClick
        end
        object mnuUnderline: TMenuItem
          Caption = 'Underline'
          ImageIndex = 33
          OnClick = mnuUnderlineClick
        end
        object mnuSetColor: TMenuItem
          Caption = 'Set color'
          ImageIndex = 37
          OnClick = mnuSetColorClick
        end
        object mnuRemoveColorTags: TMenuItem
          Caption = 'Remove color tags'
          ImageIndex = 38
          OnClick = mnuRemoveColorTagsClick
        end
        object mnuRemoveAllTags: TMenuItem
          Caption = 'Remove all tags'
          ImageIndex = 35
          OnClick = mnuRemoveAllTagsClick
        end
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object mnuSelectAll: TMenuItem
        Caption = 'Select all'
        ShortCut = 16449
        OnClick = mnuSelectAllClick
      end
      object mnuInvertSelection: TMenuItem
        Caption = 'Invert selection'
        OnClick = mnuInvertSelectionClick
      end
      object N13: TMenuItem
        Caption = '-'
      end
      object mnuTimings: TMenuItem
        Caption = 'Timings'
        ImageIndex = 20
        object mnuSetDurationLimits: TMenuItem
          Caption = 'Set duration limits...'
          ShortCut = 16460
          OnClick = mnuSetDurationLimitsClick
        end
        object mnuSetDelay: TMenuItem
          Caption = 'Set delay...'
          ShortCut = 16452
          OnClick = mnuSetDelayClick
        end
        object mnuAdjust: TMenuItem
          Caption = 'Adjust'
          object mnuAdjustSubtitles: TMenuItem
            Caption = 'Adjust subtitles...'
            ShortCut = 16450
            OnClick = mnuAdjustSubtitlesClick
          end
          object mnuAdjustToSyncSubs: TMenuItem
            Caption = 'Adjust to synchronized subtitles'
            ShortCut = 24642
            OnClick = mnuAdjustToSyncSubsClick
          end
        end
        object mnuTimeExpanderReducer: TMenuItem
          Caption = 'Duration expander/reducer...'
          ShortCut = 24665
          OnClick = mnuTimeExpanderReducerClick
        end
        object N23: TMenuItem
          Caption = '-'
        end
        object mnuExtendLength: TMenuItem
          Caption = 'Extend length to next'
          ShortCut = 24645
          OnClick = mnuExtendLengthClick
        end
        object mnuExtendLength2: TMenuItem
          Caption = 'Extend length to previous'
          ShortCut = 41029
          OnClick = mnuExtendLength2Click
        end
        object mnuShiftToNext: TMenuItem
          Caption = 'Shift to next'
          OnClick = mnuShiftToNextClick
        end
        object mnuShiftToPrevious: TMenuItem
          Caption = 'Shift to previous'
          OnClick = mnuShiftToPreviousClick
        end
        object mnuAutomaticDurations: TMenuItem
          Caption = 'Automatic durations...'
          ShortCut = 24658
          OnClick = mnuAutomaticDurationsClick
        end
        object mnuReadTimesFromFile: TMenuItem
          Caption = 'Read timings from file'
          ShortCut = 24660
          OnClick = mnuReadTimesFromFileClick
        end
        object N26: TMenuItem
          Caption = '-'
        end
        object mnuSetPauses: TMenuItem
          Caption = 'Set pauses...'
          OnClick = mnuSetPausesClick
        end
        object N46: TMenuItem
          Caption = '-'
        end
        object mnuRoundTimeValues: TMenuItem
          Caption = 'Round time values...'
          OnClick = mnuRoundTimeValuesClick
        end
        object N44: TMenuItem
          Caption = '-'
        end
        object mnuShiftPlusMS: TMenuItem
          Caption = 'Shift +%d milliseconds'
          ShortCut = 24648
          OnClick = mnuShiftPlusMSClick
        end
        object mnuShiftLessMS: TMenuItem
          Caption = 'Shift -%d milliseconds'
          ShortCut = 24654
          OnClick = mnuShiftLessMSClick
        end
      end
      object mnuTexts: TMenuItem
        Caption = 'Texts'
        ImageIndex = 21
        object mnuSmartLineAdjust: TMenuItem
          Caption = 'Smart line adjust...'
          OnClick = mnuSmartLineAdjustClick
        end
        object mnuDivideLines: TMenuItem
          Caption = 'Divide lines...'
          ShortCut = 24644
          OnClick = mnuDivideLinesClick
        end
        object mnuUnbreakSubtitles: TMenuItem
          Caption = 'Unbreak subtitles...'
          OnClick = mnuUnbreakSubtitlesClick
        end
        object mnuConvertCase: TMenuItem
          Caption = 'Convert case...'
          ShortCut = 24643
          OnClick = mnuConvertCaseClick
        end
        object mnuSetMaxLineLength: TMenuItem
          Caption = 'Set maximum line length'
          ShortCut = 24652
          OnClick = mnuSetMaxLineLengthClick
        end
        object N54: TMenuItem
          Caption = '-'
        end
        object mnuFastSmartLineAdjust: TMenuItem
          Caption = 'Fast smart line adjust'
          ShortCut = 16453
          OnClick = mnuFastSmartLineAdjustClick
        end
        object mnuFastUnbreakSubtitles: TMenuItem
          Caption = 'Fast unbreak subtitles'
          ShortCut = 24661
          OnClick = mnuFastUnbreakSubtitlesClick
        end
        object mnuFastDivideLines: TMenuItem
          Caption = 'Fast divide lines'
          ShortCut = 24662
          OnClick = mnuFastDivideLinesClick
        end
        object N27: TMenuItem
          Caption = '-'
        end
        object mnuReadTextsFromFile: TMenuItem
          Caption = 'Read texts from file'
          ShortCut = 24664
          OnClick = mnuReadTextsFromFileClick
        end
      end
      object mnuSubtitles: TMenuItem
        Caption = 'Subtitles'
        ImageIndex = 22
        object mnuAutoCombineSubtitles: TMenuItem
          Caption = 'Auto combine subtitles...'
          OnClick = mnuAutoCombineSubtitlesClick
        end
        object mnuCombineSubtitles: TMenuItem
          Caption = 'Combine subtitles'
          ShortCut = 16459
          OnClick = mnuCombineSubtitlesClick
        end
        object N16: TMenuItem
          Caption = '-'
        end
        object mnuEffects: TMenuItem
          Caption = 'Effects'
          object mnuTypeEffect: TMenuItem
            Caption = 'Type effect'
            ShortCut = 41044
            OnClick = mnuTypeEffectClick
          end
          object mnuFlash: TMenuItem
            Caption = 'Flash'
            object mnuFastFlash: TMenuItem
              Caption = 'Fast flash'
              ShortCut = 41009
              OnClick = mnuFastFlashClick
            end
            object mnuMediumFlash: TMenuItem
              Caption = 'Medium flash'
              ShortCut = 41010
              OnClick = mnuMediumFlashClick
            end
            object mnuSlowFlash: TMenuItem
              Caption = 'Slow flash'
              ShortCut = 41011
              OnClick = mnuSlowFlashClick
            end
          end
        end
        object mnuRightToLeft: TMenuItem
          Caption = 'Right-to-Left'
          object mnuReverseText: TMenuItem
            Caption = 'Reverse text'
            ShortCut = 16456
            OnClick = mnuReverseTextClick
          end
          object mnuFixPunctuation: TMenuItem
            Caption = 'Fix punctuation'
            ShortCut = 24646
            OnClick = mnuFixPunctuationClick
          end
        end
        object mnuSort: TMenuItem
          Caption = 'Sort'
          ShortCut = 16473
          OnClick = mnuSortClick
        end
        object N30: TMenuItem
          Caption = '-'
        end
        object mnuDeleteUnnecessaryLinks: TMenuItem
          Caption = 'Delete unnecessary links'
          ShortCut = 24647
          OnClick = mnuDeleteUnnecessaryLinksClick
        end
        object mnuDeleteDotsAtBeginning: TMenuItem
          Caption = 'Delete dots at the beginning'
          OnClick = mnuDeleteDotsAtBeginningClick
        end
        object N33: TMenuItem
          Caption = '-'
        end
        object mnuMarkSelectedSubs: TMenuItem
          Caption = 'Mark selected subtitles'
          ShortCut = 24653
          OnClick = mnuMarkSelectedSubsClick
        end
        object mnuUnMarkSelectedSubs: TMenuItem
          Caption = 'Unmark selected subtitles'
          ShortCut = 24641
          OnClick = mnuUnMarkSelectedSubsClick
        end
        object N40: TMenuItem
          Caption = '-'
        end
        object mnuJumpToNextMarked: TMenuItem
          Caption = 'Jump to next marked'
          ShortCut = 16507
          OnClick = mnuJumpToNextMarkedClick
        end
        object mnuJumpToPrevMarked: TMenuItem
          Caption = 'Jump to previous marked'
          ShortCut = 24699
          OnClick = mnuJumpToPrevMarkedClick
        end
      end
      object N24: TMenuItem
        Caption = '-'
      end
      object mnuTranslation: TMenuItem
        Caption = 'Translation'
        ImageIndex = 23
        object mnuTranslatorMode: TMenuItem
          Caption = 'Translator mode'
          ShortCut = 16469
          OnClick = mnuTranslatorModeClick
        end
        object N22: TMenuItem
          Caption = '-'
        end
        object mnuSwap: TMenuItem
          Caption = 'Swap'
          ImageIndex = 27
          ShortCut = 24663
          OnClick = mnuSwapClick
        end
      end
    end
    object mnuView: TMenuItem
      Caption = 'View'
      object mnuToolbar: TMenuItem
        AutoCheck = True
        Caption = 'Toolbar'
        Checked = True
        OnClick = mnuToolbarClick
      end
      object N53: TMenuItem
        Caption = '-'
      end
      object mnuShowLeftPanel: TMenuItem
        AutoCheck = True
        Caption = 'Show left panel'
        Checked = True
        ShortCut = 115
        OnClick = mnuShowLeftPanelClick
      end
      object mnuShowNotesInLeftPanel: TMenuItem
        AutoCheck = True
        Caption = 'Show notes in left panel'
        Checked = True
        OnClick = mnuShowNotesInLeftPanelClick
      end
      object N56: TMenuItem
        Caption = '-'
      end
      object mnuVisualSubRepr: TMenuItem
        AutoCheck = True
        Caption = 'Visual subtitle representation'
        Checked = True
        OnClick = mnuVisualSubReprClick
      end
      object N50: TMenuItem
        Caption = '-'
      end
      object mnuColumns: TMenuItem
        Caption = 'Columns'
        object mnuColNum: TMenuItem
          AutoCheck = True
          Caption = 'Num'
          Checked = True
          OnClick = mnuColClick
        end
        object mnuColPause: TMenuItem
          Tag = 6
          AutoCheck = True
          Caption = 'Pause'
          Checked = True
          OnClick = mnuColClick
        end
        object mnuColShow: TMenuItem
          Tag = 1
          AutoCheck = True
          Caption = 'Show'
          Checked = True
          OnClick = mnuColClick
        end
        object mnuColHide: TMenuItem
          Tag = 2
          AutoCheck = True
          Caption = 'Hide'
          Checked = True
          OnClick = mnuColClick
        end
        object mnuColDuration: TMenuItem
          Tag = 5
          AutoCheck = True
          Caption = 'Duration'
          Checked = True
          OnClick = mnuColClick
        end
        object mnuColText: TMenuItem
          Tag = 3
          AutoCheck = True
          Caption = 'Text'
          Checked = True
          OnClick = mnuColClick
        end
        object N51: TMenuItem
          Caption = '-'
        end
        object mnuColTranslation: TMenuItem
          Tag = 4
          Caption = 'Translation'
          OnClick = mnuColTranslationClick
        end
      end
      object N45: TMenuItem
        Caption = '-'
      end
      object mnuShowTimeControls: TMenuItem
        AutoCheck = True
        Caption = 'Show time controls'
        Checked = True
        ShortCut = 116
        OnClick = mnuShowTimeControlsClick
      end
      object mnuShowTimeControlButtons: TMenuItem
        AutoCheck = True
        Caption = 'Show time control buttons'
        Checked = True
        OnClick = mnuShowTimeControlButtonsClick
      end
      object mnuTextStyleBars: TMenuItem
        AutoCheck = True
        Caption = 'Text style bars'
        Checked = True
        OnClick = mnuTextStyleBarsClick
      end
      object mnuShowLinesCount: TMenuItem
        AutoCheck = True
        Caption = 'Show lines count'
        Checked = True
        OnClick = mnuShowLinesCountClick
      end
      object N55: TMenuItem
        Caption = '-'
      end
      object mnuStatusbar: TMenuItem
        AutoCheck = True
        Caption = 'Statusbar'
        Checked = True
        OnClick = mnuStatusbarClick
      end
    end
    object mnuSearch: TMenuItem
      Caption = 'Search'
      OnClick = mnuSearchClick
      object mnuSubSearch: TMenuItem
        Caption = 'Search...'
        ImageIndex = 17
        ShortCut = 16454
        OnClick = mnuSubSearchClick
      end
      object mnuFindNext: TMenuItem
        Caption = 'Find next'
        ShortCut = 114
        OnClick = mnuFindNextClick
      end
      object mnuSearchAndReplace: TMenuItem
        Caption = 'Search && Replace...'
        ImageIndex = 48
        ShortCut = 16466
        OnClick = mnuSearchAndReplaceClick
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object mnuGoToLineNumber: TMenuItem
        Caption = 'Go to line number...'
        ImageIndex = 7
        ShortCut = 16455
        OnClick = mnuGoToLineNumberClick
      end
    end
    object mnuTools: TMenuItem
      Caption = 'Tools'
      OnClick = mnuToolsClick
      object mnuSpellCheck: TMenuItem
        Caption = 'Spell check...'
        ImageIndex = 39
        ShortCut = 118
        OnClick = mnuSpellCheckClick
      end
      object N32: TMenuItem
        Caption = '-'
      end
      object mnuBatchConvert: TMenuItem
        Caption = 'Batch convert...'
        ShortCut = 16461
        OnClick = mnuBatchConvertClick
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object mnuSplitSubtitle: TMenuItem
        Caption = 'Split subtitle...'
        ShortCut = 16468
        OnClick = mnuSplitSubtitleClick
      end
      object mnuJoinSubtitle: TMenuItem
        Caption = 'Join subtitles...'
        ShortCut = 16458
        OnClick = mnuJoinSubtitleClick
      end
      object N11: TMenuItem
        Caption = '-'
      end
      object mnuInfoErrors: TMenuItem
        Caption = 'Information and errors'
        object mnuInformationAndErrors: TMenuItem
          Caption = 'Information and errors...'
          ImageIndex = 28
          ShortCut = 16457
          OnClick = mnuInformationAndErrorsClick
        end
        object mnuVariousInformation: TMenuItem
          Caption = 'Various information...'
          ImageIndex = 29
          ShortCut = 24649
          OnClick = mnuVariousInformationClick
        end
        object mnuOCRScripts: TMenuItem
          AutoHotkeys = maManual
          Caption = 'OCR Scripts'
          object mnuShowInMainForm: TMenuItem
            AutoCheck = True
            Caption = 'Show in main form'
            OnClick = mnuShowInMainFormClick
          end
          object N39: TMenuItem
            Caption = '-'
          end
        end
        object mnuInfoErrorsSettings: TMenuItem
          Caption = 'Settings...'
          ImageIndex = 30
          ShortCut = 32841
          OnClick = mnuInfoErrorsSettingsClick
        end
        object N41: TMenuItem
          Caption = '-'
        end
        object mnuShowCPSHintBoxes: TMenuItem
          AutoCheck = True
          Caption = 'Show CPS boxes'
          ShortCut = 32840
          OnClick = mnuShowCPSHintBoxesClick
        end
        object N28: TMenuItem
          Caption = '-'
        end
        object mnuRecheckErrors: TMenuItem
          Caption = 'Recheck errors'
          ShortCut = 120
          OnClick = mnuRecheckErrorsClick
        end
        object mnuFixAllErrors: TMenuItem
          Caption = 'Fix all errors'
          ShortCut = 121
          OnClick = mnuFixAllErrorsClick
        end
        object mnuFixErrorsInSelSubs: TMenuItem
          Caption = 'Fix errors (selected subtitles)'
          ShortCut = 122
          OnClick = mnuFixErrorsInSelSubsClick
        end
        object N29: TMenuItem
          Caption = '-'
        end
        object mnuJumpToNextError: TMenuItem
          Caption = 'Jump to next error'
          ShortCut = 123
          OnClick = mnuJumpToNextErrorClick
        end
        object mnuJumpToPrevError: TMenuItem
          Caption = 'Jump to previous error'
          ShortCut = 8315
          OnClick = mnuJumpToPrevErrorClick
        end
      end
      object mnuAddFPSfromAVI: TMenuItem
        Caption = 'Add FPS from AVI...'
        OnClick = mnuAddFPSfromAVIClick
      end
      object N7: TMenuItem
        Caption = '-'
      end
      object mnuExternalPreview: TMenuItem
        Caption = 'External preview...'
        ShortCut = 119
        OnClick = mnuExternalPreviewClick
      end
      object N35: TMenuItem
        Caption = '-'
      end
      object mnuSAMILangExtractor: TMenuItem
        Caption = 'SAMI language extractor...'
        OnClick = mnuSAMILangExtractorClick
      end
      object mnuPascalScripts: TMenuItem
        AutoHotkeys = maManual
        Caption = 'Pascal scripts'
        ImageIndex = 19
      end
      object N62: TMenuItem
        Caption = '-'
        Visible = False
      end
      object mnuJumpToNextLine: TMenuItem
        Caption = 'mnuJumpToNextLine'
        ShortCut = 8205
        Visible = False
        OnClick = mnuJumpToNextLineClick
      end
      object mnuJumpToPrevLine: TMenuItem
        Caption = 'mnuJumpToPrevLine'
        ShortCut = 16397
        Visible = False
        OnClick = mnuJumpToPrevLineClick
      end
      object mnuJumpToNextSub: TMenuItem
        Caption = 'mnuJumpToNextSub'
        Visible = False
        OnClick = mnuJumpToNextSubClick
      end
      object mnuJumpToPrevSub: TMenuItem
        Caption = 'mnuJumpToPrevSub'
        Visible = False
        OnClick = mnuJumpToPrevSubClick
      end
      object mnuSubDblClick: TMenuItem
        Caption = 'mnuSubDblClick'
        ShortCut = 32781
        Visible = False
        OnClick = mnuSubDblClickClick
      end
      object mnuZeroFunction: TMenuItem
        Caption = 'mnuZeroFunction'
        ShortCut = 49242
        Visible = False
        OnClick = mnuZeroFunctionClick
      end
    end
    object mnuMovie: TMenuItem
      Caption = 'Movie'
      OnClick = mnuMovieClick
      object mnuOpenMovie: TMenuItem
        Caption = 'Open...'
        ShortCut = 16464
        OnClick = mnuOpenMovieClick
      end
      object mnuCloseMovie: TMenuItem
        Caption = 'Close'
        ShortCut = 24656
        OnClick = mnuCloseMovieClick
      end
      object mnuMovieInfo: TMenuItem
        Caption = 'Information...'
        OnClick = mnuMovieInfoClick
      end
      object N14: TMenuItem
        Caption = '-'
      end
      object mnuVideoPreviewMode: TMenuItem
        Caption = 'Video preview mode'
        ShortCut = 16465
        OnClick = mnuVideoPreviewModeClick
      end
      object mnuShowSubtitles: TMenuItem
        AutoCheck = True
        Caption = 'Show subtitles'
        OnClick = mnuShowSubtitlesClick
      end
      object mnuSubtitleToDisplay: TMenuItem
        Caption = 'Display'
        object mnuDisplayOriginal: TMenuItem
          AutoCheck = True
          Caption = 'Original'
          Checked = True
          RadioItem = True
          OnClick = mnuDisplayOriginalClick
        end
        object mnuDisplayTranslation: TMenuItem
          AutoCheck = True
          Caption = 'Translation'
          RadioItem = True
          OnClick = mnuDisplayTranslationClick
        end
      end
      object N9: TMenuItem
        Caption = '-'
      end
      object mnuPlayback: TMenuItem
        Caption = 'Playback'
        object mnuPlayPause: TMenuItem
          Caption = 'Play/Pause'
          ShortCut = 16416
          OnClick = mnuPlayPauseClick
        end
        object mnuStop: TMenuItem
          Caption = 'Stop'
          ShortCut = 16392
          OnClick = mnuStopClick
        end
        object N15: TMenuItem
          Caption = '-'
        end
        object mnuRewind: TMenuItem
          Caption = 'Backward'
          ShortCut = 32805
          OnClick = mnuRewindClick
        end
        object mnuForward: TMenuItem
          Caption = 'Forward'
          ShortCut = 32807
          OnClick = mnuForwardClick
        end
        object N31: TMenuItem
          Caption = '-'
        end
        object mnuBack5Sec: TMenuItem
          Caption = 'Backward 5 seconds'
          ShortCut = 16421
          OnClick = mnuBack5SecClick
        end
        object mnuFwd5Sec: TMenuItem
          Caption = 'Forward 5 seconds'
          ShortCut = 16423
          OnClick = mnuFwd5SecClick
        end
      end
      object mnuPlaybackRate: TMenuItem
        Caption = 'Playback rate'
        object mnu10P: TMenuItem
          AutoCheck = True
          Caption = '10%'
          RadioItem = True
          OnClick = mnu10PClick
        end
        object mnu20P: TMenuItem
          AutoCheck = True
          Caption = '20%'
          RadioItem = True
          OnClick = mnu20PClick
        end
        object mnu30P: TMenuItem
          AutoCheck = True
          Caption = '30%'
          RadioItem = True
          OnClick = mnu30PClick
        end
        object mnu40P: TMenuItem
          AutoCheck = True
          Caption = '40%'
          RadioItem = True
          OnClick = mnu40PClick
        end
        object mnu50P: TMenuItem
          AutoCheck = True
          Caption = '50%'
          RadioItem = True
          OnClick = mnu50PClick
        end
        object mnu60P: TMenuItem
          AutoCheck = True
          Caption = '60%'
          RadioItem = True
          OnClick = mnu60PClick
        end
        object mnu70P: TMenuItem
          AutoCheck = True
          Caption = '70%'
          RadioItem = True
          OnClick = mnu70PClick
        end
        object mnu80P: TMenuItem
          AutoCheck = True
          Caption = '80%'
          RadioItem = True
          OnClick = mnu80PClick
        end
        object mnu90P: TMenuItem
          AutoCheck = True
          Caption = '90%'
          RadioItem = True
          OnClick = mnu90PClick
        end
        object mnu100P: TMenuItem
          AutoCheck = True
          Caption = '100%'
          Checked = True
          Default = True
          RadioItem = True
          OnClick = mnu100PClick
        end
        object mnu150P: TMenuItem
          AutoCheck = True
          Caption = '150%'
          RadioItem = True
          OnClick = mnu150PClick
        end
        object mnu200P: TMenuItem
          AutoCheck = True
          Caption = '200%'
          RadioItem = True
          OnClick = mnu200PClick
        end
        object mnu300P: TMenuItem
          AutoCheck = True
          Caption = '300%'
          RadioItem = True
          OnClick = mnu300PClick
        end
        object mnu400P: TMenuItem
          AutoCheck = True
          Caption = '400%'
          RadioItem = True
          OnClick = mnu400PClick
        end
      end
      object mnuVideoRenderer: TMenuItem
        Caption = 'Video renderer'
        object mnuDefaultVidRend: TMenuItem
          Caption = 'Default'
          Checked = True
          RadioItem = True
          OnClick = mnuDefaultVidRendClick
        end
        object mnuVMR9VidRend: TMenuItem
          Caption = 'VMR9'
          RadioItem = True
          OnClick = mnuVMR9VidRendClick
        end
      end
      object mnuAudioStream: TMenuItem
        Caption = 'Audio stream'
        ImageIndex = 36
      end
      object mnuVidSubtitles: TMenuItem
        Caption = 'Subtitles'
        object mnuMoveSubtitle: TMenuItem
          Caption = 'Move subtitle'
          ShortCut = 32845
          OnClick = mnuMoveSubtitleClick
        end
        object N36: TMenuItem
          Caption = '-'
        end
        object mnuSetShowTime: TMenuItem
          Caption = 'Set show time'
          ShortCut = 32835
          OnClick = mnuSetShowTimeClick
        end
        object mnuSetHideTime: TMenuItem
          Caption = 'Set hide time'
          ShortCut = 32854
          OnClick = mnuSetHideTimeClick
        end
        object N19: TMenuItem
          Caption = '-'
        end
        object mnuStartSubtitle: TMenuItem
          Caption = 'Start subtitle'
          ShortCut = 32858
          OnClick = mnuStartSubtitleClick
        end
        object mnuEndSubtitle: TMenuItem
          Caption = 'End subtitle'
          ShortCut = 32856
          OnClick = mnuEndSubtitleClick
        end
      end
      object mnuSynchronization: TMenuItem
        Caption = 'Synchronization'
        object mnuFirstSyncPoint: TMenuItem
          Caption = 'First sync point'
          ShortCut = 16433
          OnClick = mnuFirstSyncPointClick
        end
        object mnuLastSyncPoint: TMenuItem
          Caption = 'Last sync point'
          ShortCut = 16434
          OnClick = mnuLastSyncPointClick
        end
        object N38: TMenuItem
          Caption = '-'
        end
        object mnuAddSyncPoint: TMenuItem
          Caption = 'Add synchronization point'
          ShortCut = 49232
          OnClick = mnuAddSyncPointClick
        end
      end
      object N17: TMenuItem
        Caption = '-'
      end
      object mnuSaveMediaStartupFile: TMenuItem
        Caption = 'Save media startup file'
        object mnuSaveASX: TMenuItem
          Caption = 'ASX (Microsoft Media Player)'
          OnClick = mnuSaveASXClick
        end
        object mnuSaveSMIL: TMenuItem
          Caption = 'SMIL (Real Player)'
          OnClick = mnuSaveSMILClick
        end
      end
    end
    object mnuSettings: TMenuItem
      Caption = 'Settings'
      object mnuSubSettings: TMenuItem
        Caption = 'Settings...'
        ImageIndex = 18
        ShortCut = 32851
        OnClick = mnuSubSettingsClick
      end
      object mnuOutputSettings: TMenuItem
        Caption = 'Output settings...'
        ShortCut = 41043
        OnClick = mnuOutputSettingsClick
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object mnuLanguage: TMenuItem
        AutoHotkeys = maManual
        Caption = 'Language'
        ImageIndex = 45
        object mnuRefreshLanguageFiles: TMenuItem
          Caption = 'Refresh language files'
          OnClick = mnuRefreshLanguageFilesClick
        end
        object N59: TMenuItem
          Caption = '-'
        end
      end
      object N37: TMenuItem
        Caption = '-'
      end
      object mnuUseInPlaceEdition: TMenuItem
        AutoCheck = True
        Caption = 'Use in-place edition'
        ShortCut = 117
        OnClick = mnuUseInPlaceEditionClick
      end
    end
    object mnuHelp: TMenuItem
      Caption = 'Help'
      ImageIndex = 3
      object mnuHelpOfProgram: TMenuItem
        Caption = 'Help'
        ImageIndex = 3
        ShortCut = 112
        OnClick = mnuHelpOfProgramClick
      end
      object mnuAboutSubtitleWorkshop: TMenuItem
        Caption = 'About Subtitle Workshop...'
        ImageIndex = 46
        OnClick = mnuAboutSubtitleWorkshopClick
      end
      object N8: TMenuItem
        Caption = '-'
      end
      object mnuCheckForNewVersion: TMenuItem
        Caption = 'Check for new version'
        ImageIndex = 47
        OnClick = mnuCheckForNewVersionClick
      end
    end
  end
  object MiMenu: TMiMenu
    Activo = True
    ColorFondo = 15790320
    ColorFranja = clSilver
    ColorBorde = 6579300
    ColorTexto = clBlack
    ColorTextoDeshabilitado = clInactiveCaption
    ColorSeleccionFondo = 12829635
    ColorSeleccionBorde = clBlack
    ColorSeleccionTexto = clBlack
    ColorSeparador = clSilver
    ColorTick = clMenuText
    ColorTickSeleccionado = clMenuText
    ColorTickBorde = clNavy
    Fuente.Charset = DEFAULT_CHARSET
    Fuente.Color = clMenuText
    Fuente.Height = -11
    Fuente.Name = 'Tahoma'
    Fuente.Style = []
    Sombra = False
    Left = 168
    Top = 160
  end
  object dlgLoadFile: TOpenDialog
    Left = 32
    Top = 24
  end
  object tmrVideo: TTimer
    Enabled = False
    Interval = 100
    OnTimer = tmrVideoTimer
    Left = 760
    Top = 40
  end
  object mnuStylePopup: TPopupMenu
    Images = imgLstMenu
    OwnerDraw = True
    OnPopup = mnuStylePopupPopup
    Left = 424
    Top = 288
    object mnuInsertSubtitlePopup: TMenuItem
      Caption = 'Insert subtitle'
      ImageIndex = 24
      OnClick = mnuInsertSubtitleClick
    end
    object mnuInsertBeforePopup: TMenuItem
      Caption = 'Insert before'
      ImageIndex = 25
      OnClick = mnuInsertBeforeClick
    end
    object mnuRemoveSelectedPopup: TMenuItem
      Caption = 'Remove selected'
      ImageIndex = 26
      OnClick = mnuRemoveSelectedClick
    end
    object N25: TMenuItem
      Caption = '-'
    end
    object mnuItalicPopup: TMenuItem
      Caption = 'Italic'
      ImageIndex = 32
      OnClick = mnuItalicClick
    end
    object mnuBoldPopup: TMenuItem
      Caption = 'Bold'
      ImageIndex = 31
      OnClick = mnuBoldClick
    end
    object mnuUnderlinePopup: TMenuItem
      Caption = 'Underline'
      ImageIndex = 33
      OnClick = mnuUnderlineClick
    end
    object mnuSetColorPopup: TMenuItem
      Caption = 'Set color'
      ImageIndex = 37
      OnClick = mnuSetColorClick
    end
    object mnuRemoveColorTagsPopup: TMenuItem
      Caption = 'Remove color tags'
      ImageIndex = 38
      OnClick = mnuRemoveColorTagsClick
    end
    object mnuRemoveAllTagsPopup: TMenuItem
      Caption = 'Remove all tags'
      ImageIndex = 35
      OnClick = mnuRemoveAllTagsClick
    end
  end
  object dlgColor: TColorDialog
    Options = [cdFullOpen, cdAnyColor]
    Left = 456
    Top = 288
  end
  object tmrSaveWork: TTimer
    Enabled = False
    Interval = 0
    OnTimer = tmrSaveWorkTimer
    Left = 136
    Top = 240
  end
  object imgLstMenu: TImageList
    Left = 200
    Top = 160
    Bitmap = {
      494C010131003600040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000040000000E0000000010020000000000000E0
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D382670000000000000000000000000086868600212121002121
      21009E9E9E004646460056565600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000AE4A2900D3826700000000000000000036363600808080000000
      0000686868003636360000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFBFA900DA5B
      3900AE4A2900AE4A2900AE4A2900DA5B39000000000056565600868686000000
      00009E9E9E003E3E3E0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DA5B39000000
      000000000000AE4A2900D38267000000000000000000000000005B5B5B005B5B
      5B00737373004444440000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000AE4A29000000
      000000000000D38267000000000000000000000000000000000000000000BABA
      BA00777777004A4A4A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFBFA9000000
      000000000000000000000000000000000000000000007B7B7B007B7B7B000000
      00007C7C7C005050500000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000717171001E1E1E001E1E
      1E001E1E1E001E1E1E00B1B1B1000000000000000000BABABA00545454005454
      540054545400A8A8A80000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000343434009999
      9900000000006666660034343400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000003B3B3B009C9C
      9C00000000009C9C9C003B3B3B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000414141007171
      7100000000009F9F9F0041414100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000474747006B6B
      6B004747470047474700A2A2A200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004C4C4C00A5A5
      A500000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000051515100A7A7
      A700000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000093939300545454006969
      6900BABABA000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C2A6A400C2A6
      A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6
      A400C2A6A400C2A6A40000000000000000000000000044548F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BE826E009638240084210E0084210E0095362100BA7A67000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000076AC70003C9933003C99330076AC7000000000000000
      0000000000000000000000000000000000000000000000000000C2A6A400FEFC
      FB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFC
      FB00FEFCFB00C2A6A40000000000000000000000000044548F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BE7F
      6C008D261000AB350D00C1410C00C9480C00C9480C00C1430D00AC360D009126
      0F00BD7B680000000000000000000000000000000000C8C8C800989898006767
      670040404000333333003A70330062EA510062EA51003A703300333333003636
      3600575757008B8B8B00C0C0C000000000000000000000000000C2A6A400FEFC
      FB00265F9C004C7EB8006992C200A4BBD700FEFCFB00FEFCFB00FEFCFB00FEFC
      FB00FEFCFB00C2A6A40000000000000000000000000044548F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BA766100A333
      1000C84A0E00CA4C0E00CA4C0E00CA4C0E00CA4C0E00CA4C0E00CA4C0E00C84A
      0E00A5331000BA76610000000000000000000000000000000000000000000000
      0000000000000000000073CA6600409733004097330073CA6600000000000000
      0000000000000000000000000000000000000000000000000000C2A6A400FEFA
      F5005181BA00C0E1F600A6D4F00083B8DF003A79B700FEFAF500FEFCFB00FEFA
      F500FEFAF500C2A6A40000000000000000000000000044548F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C2846F00A5371400CC50
      1200CC501200CC501200CC501200CC501200CC501200CC501200CC501200CC50
      1200CC501200A9371300BF7E6800000000000000000000000000000000000000
      0000000000000000000000000000797979007979790000000000000000000000
      0000000000000000000000000000000000000000000000000000C2A6A400FEFA
      F5008BAACE00D5E6F500D7E9FA00CBE3F9009FD9F400468BC300FEFAF500FEFA
      F500FEFAF500C2A6A40000000000000000000000000044548F00000000000000
      0000000000000000000000000000000000004148E100313CDE001D25DA001D25
      DA00323BDF006C71E8000000000000000000000000009D341900CE541600D056
      1600D0561600D0561600D0561600FBF5F100FBF5F100D0561600D0561600D056
      1600D0561600CF5516009D341800000000000000000000000000000000000000
      000000000000C0A98D00CB9858009369340093693400CB985800C0A98D000000
      0000000000000000000000000000000000000000000000000000C2A6A400FEF7
      F000CCD7E4007FA7D200F9FCFE00BCE3F90038BDE800519ACC00498DC500FEF7
      F000FEF7F000C2A6A40000000000000000000000000044548F00000000000000
      00000000000000000000000000001922DC003B47E0005E6DE7008BA0EF007587
      EB004654E2001D25DA002C33DD0000000000CA917A00B94C2100D35B1A00D35B
      1A00D35B1A00D35B1A00D35B1A00FBF6F300FBF6F300D35B1A00D35B1A00D35B
      1A00D35B1A00D35B1A00BE4D2000C2836B000000000000000000000000000000
      0000C9965900CE8E4500E9AA6900F4B87C00F4B87C00E7A96800CD924B00C996
      5A00000000000000000000000000000000000000000000000000C2A6A400FEF7
      F000FEF7F000648EC100C8E4F50044D0F40000C3F20025B8E6005198CB004D91
      C600FEF7F000C2A6A4000000000000000000000000001D25DA00696EEA000000
      000000000000000000006A6FEB001A23DA001D24D9002D37DD008094ED007183
      EA005564E400303BDD001D25DA0000000000AB442300CB5D1F00D5621F00D562
      1F00D5621F00D5621F00D5621F00FBF6F300FBF6F300D5621F00D5621F00D562
      1F00D5621F00D5621F00CE5C1F00AB442300000000000000000000000000C090
      5A00D08E4600EEAC6400EFAE6800EFB16D00EFB16D00ECAB6700EEBF7D00DAAB
      6500C0905B000000000000000000000000000000000000000000C2A6A400FEF3
      E900FEF3E900FEF3E900608FC400C2EAF80028CBF30000C3F20025B8E6005198
      CB005193C800C2A6A4000000000000000000000000001D25DA00323CDE00212A
      DB001D25DA001D25DA00262EDC003540DF001D25DA00323DDF008094ED007183
      EA005362E4002F39DD001D25DA0000000000A7432400D7682600D8682500D868
      2500D8682500D8682500D8682500FBF6F300FBF6F300D8682500D8682500D868
      2500D8682500D8682500D8692500AB4423000000000000000000D7BEA500B377
      3600E09B4600E29D4A00E3A25100E4A45500E4A45500DE9C4F00E6AA5C00FFCB
      7500C0884500D7BEA50000000000000000000000000000000000C2A6A400FFF0
      E200FFF0E200FEF3E900FFEEDE006594C500C2EBF80028CBF30000C3F20025B8
      E6005198CB005696CA000000000000000000000000001D25DA005D6DE6006272
      E7006A7DE9007083EB006879E9005E6EE8001D25DA00323CDF008094ED007184
      EA005362E4002F39DD001D25DA0000000000AB442300DF7E3800DC702A00DC70
      2A00DC702A00DC702A00DC702A00FBF6F300FBF6F300DC702A00DC702A00DC70
      2A00DC702A00DC702A00DF7B3600AB4423000000000000000000B1885E00C382
      3800D18C2E00D5923500D6953A00D6963C00D4933B00DE984200D18B3B00FFB4
      5300E5A35000B1885E0000000000000000000000000000000000C2A6A400FEF3
      E900FFEEDE00FFF0E200FEF3E900FFEEDE006B97C700C2EBF80028CBF30000C3
      F20027B8E6005299CC006C9DCB0000000000000000001D25DA005B6AE6006E80
      E900889CEE008EA4F1007688EC005C6BE7001D25DA00323CDF008296ED007284
      EA005361E4002F39DD001D25DA0000000000AB442300DB894E00DF782F00DF78
      2F00DF782F00DF782F00DF782F00DF782F00DF782F00DF782F00DF782F00DF78
      2F00DF782F00DF782F00DC8C5000AB44230000000000000000009E6D3C00C884
      3500D1892C00CC892900CF8E2D00CF8E2E00C6842A00D48A3600D68B3500E899
      3D00D08A39009E6D3C0000000000000000000000000000000000C2A6A400FFEE
      DE00FFEEDE00FFEEDE00FFEEDE00FFEEDE00FFEEDE00709BCA00C2EBF80028CB
      F30000C3F2003FBBE6005693C70000000000000000001D25DA005A69E6006B7D
      E9008296ED00899DF0007284EC005C6AE7001D25DA00323CDE007C8FED007184
      EB005766E500303ADD001D25DA0000000000D5A28700D1825400E3843B00E27E
      3400E27E3400E27E3400E27E3400FFFFFF00FFFFFF00E27E3400E27E3400E27E
      3400E27E3400E3823900D1815300D5A287000000000000000000A3723E00DB9C
      4F00DB963D00CE903200D3973900D0953900DF9F4A00FDB96400D8944300C584
      2C00C2853300A3723E0000000000000000000000000000000000C2A6A400FFEE
      DE00FFEAD700FFEEDE00FFEAD700FFEAD700FFEEDE00B0A29600759ECC00C2EB
      F80042D0F3005E9FCE000000000000000000000000001D25DA005A69E6006B7D
      E9008296ED00899DF0007284EC005B69E7001D25DA001F28DA001D25DA001D25
      DA003542DF002D38DE001D25DA000000000000000000BA572D00E9A97300E587
      3C00E5863B00E5863B00E5863B00FFFFFF00FFFFFF00E5863B00E5863B00E586
      3B00E5863B00EAA87000BD5B3000000000000000000000000000BE936100D19A
      5500D0954100D8A35200D8A45500D9A85C00E2B47300CB955300FFD28B00E3AE
      6300C68D4500BE93610000000000000000000000000000000000C2A6A400FFEA
      D700FFEAD700FFEAD700FFEAD700FFEAD700C9B9AC00FEFAF500FEF7F00079A1
      CE007CA4CE00000000000000000000000000000000001D25DA005B6BE6006B7C
      E9008296ED00899DF0007284EC005D6BE7001D25DA00424AE100000000000000
      00006C71E8001F27DB001D25DA000000000000000000DAA88B00CA744700EFB5
      8100E88E4500E88B3F00E88B3F00E88B3F00E88B3F00E88B3F00E88B3F00E88D
      4400EFB27E00CC7A4C00D8A48600000000000000000000000000E1C8A900CD99
      5300E2B77600EDCA8F00F5DBA800E0B67B00FFEBBC00E8C89600FFE9B200FBE1
      A700C58D4700E1C8A90000000000000000000000000000000000C2A6A400FFEA
      D700FFE6D000FFEAD700FFE6D000FFEAD700C5B5A900FEFAF500DDCFC200C2A6
      A40000000000000000000000000000000000000000001D25DA005867E5007284
      EA00899DEE0090A5F100788BED005969E7001D25DA0000000000000000000000
      000000000000000000006C71E800000000000000000000000000D79F7E00CB76
      4700F0BE9200EFAE7200ECA15E00EB974E00EB974D00ECA25D00EFAC6F00F1BE
      9300CF7D4C00D59D7D000000000000000000000000000000000000000000D9A7
      6300E3B87200E2BB8100FAECBE00E8C18700ECCF9D00FFF7CC00FFF7CA00E9C5
      8100D9A763000000000000000000000000000000000000000000C2A6A400FFE6
      D000FFE6D000FFE6D000FFE6D000FFE6D000C9B9AC00DDCFC200C2A6A4000000
      000000000000000000000000000000000000000000006E74EA00232EDC003D4A
      E0006274E800697AE900414FE2001D25DA00676DE90000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DCAA
      8C00C5623400D8915E00E2A77A00ECBD9500ECBD9500E3A87B00DA926100C664
      3500DBA889000000000000000000000000000000000000000000000000000000
      0000E6B16600E4AC5700ECC58200F3D79F00F9E9B800F8E2A700EBB96900E6B1
      6600000000000000000000000000000000000000000000000000C2A6A400C2A6
      A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6A400000000000000
      0000000000000000000000000000000000000000000000000000000000006C71
      E8003137DD003037DE009095F000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E0B59800D4936B00C9724300C8704100D5916800E0B093000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F6D8AC00F0BA6B00EDAC4C00EDAC4C00F0BA6B00F6D8AC000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008F4718008F4718008F4718008F4718008F471800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000185C8F00185C8F00185C8F00185C8F00185C8F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008F47
      18008F471800CA9C6600ECBA7500EFC58300E8B67100CAA47B008F4718008F47
      180000000000000000000000000000000000000000000000000000000000185C
      8F00185C8F006691CA0075A3EC0083A9EF00719FE8007B9ECA00185C8F00185C
      8F00000000000000000000000000000000000000000000000000854200008240
      0000773A00006D35000069330000693400006934000069340000693400006A34
      00006A3400005A2B000000000000000000000000000000000000854200008240
      0000773A00006D35000069330000693400006934000069340000693400006A34
      00006A3400005A2B0000000000000000000000000000000000008F471800A878
      5800CE9F7600E4D3C500F2ECE900CDCCC800F9F8F400F3E7D800DAAE8800C6B0
      A0008F4718000000000000000000000000000000000000000000185C8F005885
      A80076A2CE00C5D5E400E9EFF200C8C9CD00F4F5F900D8E3F30088B1DA00A0B5
      C600185C8F0000000000000000000000000000000000AB540000CB650000C561
      0000BC5D0000B5590000AF570000AD560000AE560000AE560000AE560000AE56
      0000B3590000954A00005A2C00000000000000000000AB540000CB650000C561
      0000BC5D0000B5590000AF570000AD560000AE560000AE560000AE560000AE56
      0000B3590000954A00005A2C000000000000000000008F471800B07A4C00C79A
      8300ECDFD900B9B7B300FCF8F300E6E2DD00FBF7F300B9B6B300FAF6F200DBB9
      9F00B79985008F471800000000000000000000000000185C8F004C7FB00083AE
      C700D9E5EC00B3B5B900F3F7FC00DDE1E600F3F7FB00B3B6B900F2F6FA009FBF
      DB0085A1B700185C8F00000000000000000000000000C7630000E9730000DD6D
      0000D66A0000D0670000C8630000C1600000BF5F0000BE5E0000BF5E0000BF5E
      0000C4610000B35900006A3400000000000000000000C7630000E9730000DD6D
      0000D66A0000D0670000C8630000C1600000BF5F0000BE5E0000BF5E0000BF5E
      0000C4610000B35900006A34000000000000000000008F471800CB936B00E5D3
      CC00FAF3EC00FAF3EC00FCF4EC00FAF4EC00FCF3EC00FAF3EC00F9F2EC00F7F1
      EC00CFA282008F471800000000000000000000000000185C8F006BA0CB00CCDD
      E500ECF3FA00ECF3FA00ECF3FC00ECF2FA00ECF4FC00ECF3FA00ECF3F900ECF2
      F70082ACCF00185C8F00000000000000000000000000D1680000ED760200F0B4
      7A00FCF1E600FBF0E600D0670000C8630000C1600000B95C0000C2722200BA5C
      0000BF5E0000AE5600006A3400000000000000000000D1680000ED760200E271
      0200DC6E0200DB7D2200D0670000C8630000C1600000B95C0000F8EFE600F8EF
      E600DDAA7900AE5600006A340000000000008F471800E3B77A00CEA79700B7AE
      AA00FAEEE600FAF0E600FAF0E600FAF0E600FAF0E600F9EFE600F8EFE700B6AE
      AB00E9D8CA00C8A27D008F47180000000000185C8F007AA3E30097BCCE00AAB3
      B700E6F1FA00E6EFFA00E6EFFA00E6EFFA00E6EFFA00E6EFF900E7EFF800ABB3
      B600CADAE9007DA0C800185C8F000000000000000000D66A0000F6821100EE7B
      0B00E6750500FCF1E600D5690000D0670000C8630000C9752200FBF6F100BA5C
      0000BF5E0000AE560000693400000000000000000000D66A0000F6821100EE7B
      0B00E6750500FDF7F100DB7D2200D0670000C8630000C1600000F8EFE600BA5C
      0000BF5E0000AE56000069340000000000008F471800F1CCA200DABAAB00FBEA
      DF00FBEADF00FBEBDF00CDBEB500ECDCD100FBEBDF00F8EBDF00F7EADF00F4E8
      E000EFE3DC00DCAF7F008F47180000000000185C8F00A2C4F100ABC9DA00DFEF
      FB00DFEFFB00DFEEFB00B5C3CD00D1E0EC00DFEEFB00DFEBF800DFEBF700E0EB
      F400DCE7EF007FA9DC00185C8F000000000000000000D66A0000F8933000F485
      1900F07C0B00FDF1E600E1730700D66A0000D67B2200FCF6F100FAF2EA00BD5E
      0000BF5E0000AE560000693400000000000000000000D66A0000F8933000F485
      1900F07C0B00FDF4EA00FDF7F100DB7E2200D0670000C8630000F9F0E600BD5E
      0000BF5E0000AE56000069340000000000008F471800EECFB500BDA39400E7D4
      C600FEE7D800FCE7D800CCBCB00006060600EAD8CB00F8E6D900F6E6DA00DED1
      C800C3B9B000DFB584008F47180000000000185C8F00B5D2EE0094ADBD00C6D8
      E700D8EEFE00D8ECFC00B0BFCC0006060600CBDCEA00D9EAF800DAE9F600C8D4
      DE00B0B9C30084ABDF00185C8F000000000000000000D66A0000F9A75600F48E
      2900F3811100FEF2E700EB740000EFA96500FDF7F100FCF3EA00FAF0E600C863
      0000C6620000B15700006A3400000000000000000000D66A0000F9A75600F48E
      2900F3811100FEF2E700FDF4EA00FEF7F100EBA76500D76A0000FAF0E600C863
      0000C6620000B15700006A340000000000008F471800F2E0D400DFB8A200FFE5
      D200FFE7D200FFE5D300FFE4D2002F2F2F003E383500E8D4C500F5E1D200F2E0
      D300EAD7C900E4B678008F47180000000000185C8F00D4E5F200A2C7DF00D2EA
      FF00D2E8FF00D3ECFF00D2EBFF002F2F2F00353B3E00C5D8E800D2E5F500D3E4
      F200C9DBEA0078A3E400185C8F000000000000000000D66A0000F9B36F00F494
      3500F3841700FEF3E800F69F4900FEF8F200FDF5ED00FCF1E600FBF0E600D168
      0000CF660000B85B0000733900000000000000000000D66A0000F9B36F00F494
      3500F3841700FEF3E800FEF2E600FEF5ED00FEF8F200E7984900FBF0E600D168
      0000CF660000B85B000073390000000000008F471800EDE5DD00D1A89400BFAA
      9500FFE3CE00FFE3CF00FFE2CD0046464600D1B8A500534D4800EAD2C100B4A4
      9600E1C4A800E0B87F008F47180000000000185C8F00DDE4ED0094BBD10095A9
      BF00CEE8FF00CFE9FF00CDE8FF0046464600A5BDD100484E5300C1D8EA0096A5
      B400A8C3E1007FA4E000185C8F000000000000000000D66A0000FABA7B00F599
      3F00F48B2400FEF3E900F3811100F9BD8200FEF8F100FEF3E900FCF1E600D76A
      0000D96B0000C2600000824000000000000000000000D66A0000FABA7B00F599
      3F00F48B2400FEF3E900FEF4EA00FEF8F200F8BA7D00EE760000FCF1E600D76A
      0000D96B0000C26000008240000000000000000000008F471800E5CEC400E9C4
      A900FFE5CD00FFE2CC00FFE1CA005A5A5A00FFDDC300D7BFA90080797300DEC3
      AD00E9BB80008F471800000000000000000000000000185C8F00C4DAE500A9CC
      E900CDE5FF00CCE7FF00CAE6FF005A5A5A00C3E3FF00A9BFD700737A8000ADC6
      DE0080ABE900185C8F00000000000000000000000000D66A0000FABF8500F69F
      4B00F4933300FEF4EA00F3861B00F3811100F5953700FEF8F100FEF3E900E571
      0000E3700000CD650000904700000000000000000000D66A0000FABF8500F69F
      4B00F4933300FEF5EC00FEF8F200F5983C00F37E0B00F2790200FDF2E600E571
      0000E3700000CD6500009047000000000000000000008F471800ECE3DE00E0C6
      BD00F2D5BD00C6AC9200FFE1C500C7AC9500FFDCBE00BAA38B00CFB29A00CAA7
      8200E2BC88008F471800000000000000000000000000185C8F00DEE7EC00BDD6
      E000BDD8F20092AAC600C5E1FF0095AEC700BEDFFF008BA0BA009AB5CF0082A3
      CA0088ABE200185C8F00000000000000000000000000D66A0000FBC79400F7AB
      6100F5973B00FEF4EB00F48B2400F3861B00F3841700F5953700FEF8F100EE76
      0000EB750000D76A00009E4E00000000000000000000D66A0000FBC79400F7AB
      6100F5973B00FEF9F400F6A04C00F3861B00F3841700F37E0B00FEF2E600EE76
      0000EB750000D76A00009E4E00000000000000000000000000008F471800F2EC
      E900F4EDEB00E3C4B500E6BD9F00C4A38800E1B69600D6A98C00EAC29500E5C3
      95008F4718000000000000000000000000000000000000000000185C8F00E9EF
      F200EBF2F400B5D2E3009FC6E60088A7C40096BEE1008CB6D60095BAEA0095B4
      E500185C8F0000000000000000000000000000000000D66A0000FBC99800F9C4
      9000F8B77700FDE8D400F6A55600F59C4400F4933300F3841700F4943500F379
      0200F5790000E2700000AB5400000000000000000000D66A0000FBC99800F9C4
      9000F8B77700F8BD8400F6A55600F59C4400F4933300F3841700FBD9B800F379
      0200F5790000E2700000AB540000000000000000000000000000000000008F47
      18008F471800F7F1EE00F2E6DE00EED8C700F3DDC700F2D8B9008F4718008F47
      180000000000000000000000000000000000000000000000000000000000185C
      8F00185C8F00EEF4F700DEE9F200C7DCEE00C7DBF300B9D1F200185C8F00185C
      8F000000000000000000000000000000000000000000D76A0000FBB97800FBCA
      9A00FBCC9E00FBC79400FABE8300F9B16A00F89E4600F78D2400F6800B00F67B
      0200FB7C0000EA740000B55A00000000000000000000D76A0000FBB97800FBCA
      9A00FBCC9E00FBC79400FABE8300F9B16A00F89E4600F78D2400F6800B00F67B
      0200FB7C0000EA740000B55A0000000000000000000000000000000000000000
      0000000000008F4718008F4718008F4718008F4718008F471800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000185C8F00185C8F00185C8F00185C8F00185C8F00000000000000
      0000000000000000000000000000000000000000000000000000DA771700DE86
      3000DE883300DE883300DD842C00DC7F2400DA771700D8700B00D76C0400D66B
      0200D76B0000C963000000000000000000000000000000000000DA771700DE86
      3000DE883300DE883300DD842C00DC7F2400DA771700D8700B00D76C0400D66B
      0200D76B0000C963000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000002791C3002692
      C3002791C4000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000026B2000026B200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000002493C60010B8E90008C6
      F80010B7E9002493C60000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000954B2500944A2400944A
      2400944A2400944A2400944A2400944A2400944A2400944A2400944A2400944A
      2400944A2400964C250000000000000000000000000026B2000026B200000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000026B2000026B20000000000000000000000000000000000000000
      0000000000000000000090483000000000000000000000000000000000000000
      000000000000000000000000000000000000000000002297C90013CAF90012CA
      F80013C9F90018BAEA002297C9000000000000000000000000002297C9002297
      CA002297CA00000000000000000000000000AB4E2100FEF4E900FEF0E000FEEC
      D700FEE8CF00FEE4C700FEE1C100FEDEBB00FEDDB800FEDDB800FEDDB800FEDD
      B800FEDDB800FEDDB800914923000000000000000000219A1F00219A1F00219A
      1F00000000000000000000000000000000000000000000000000000000000000
      0000219A1F00219A1F0000000000000000000000000000000000000000000000
      00000000000090483000B0604000B05830000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001F9ACD00FFFF
      FF001FCEFA0020CEF9001F9BCD0000000000000000001F9BCD0022B2E0001FCE
      FA0021BDEA001F9ACE000000000000000000AB4E2100FEF8F200F3DB9E00F3DB
      9E00F3DB9E00FEE9D200E27E0300E27E0300E27E0300FEDDB800A23F0800A23F
      0800A23F0800FEDDB8008F48230000000000000000001B744C001B744C001B74
      4C001B744C000000000000000000000000000000000000000000000000001B74
      4C001B744C00000000000000000000000000000000000000000000000000BB80
      6800A0503000C0705000D0785000C0684000B058300000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001C9E
      D1001C9ED1002ED4FB001C9ED10000000000000000001D9ED2002FD4FA002ED4
      FA002ED4FA002CC2EB001F9BCE0000000000AB4E2100FEFCF900F3DB9E00F3DB
      9E00F3DB9E00FEEEDC00E27E0300E27E0300E27E0300FEE0BE00A23F0800A23F
      0800A23F0800FEDDB8008F482300000000000000000000000000134980001349
      8000134980001349800000000000000000000000000000000000134980001349
      8000000000000000000000000000000000000000000000000000B2603A00B060
      4000D0806000F0A08000E0907000E0987000C0684000BB805C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000019A2D6003ED9FA0019A2D60000000000000000000000000019A2D600FFFF
      FF003ED9FB003EDAFB0019A2D60000000000AB4E2100FEFEFE00F3DB9E00F3DB
      9E00F3DB9E00FEF3E700E27E0300E27E0300E27E0300FEE3C600A23F0800A23F
      0800A23F0800FEDDB8008F482300000000000000000000000000000000000000
      00000B22B3000B22B3000B22B300000000000B22B3000B22B3000B22B3000000
      0000000000000000000000000000000000000000000000000000F0A89000F0A0
      8000F0A08000E09A7E0000000000E0A58D00F0A08000B0604000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000016A7DB004EDFFB0016A6DA000000000000000000000000000000000016A7
      DB0016A7DA004EDFFC0016A6DA0000000000AB4E2100FEFEFE00FEFEFE00FEFD
      FC00FEFBF700FEF7F000FEF4E800FEF0E100FEECD700FEE8D000FEE4C800FEE1
      C000FEDEBB00FEDDB8008F482300000000000000000000000000000000000000
      0000000000000507E0000507E0000507E0000507E0000507E000000000000000
      000000000000000000000000000000000000000000000000000000000000F0B8
      A000EDAD9300000000000000000000000000EFA48600E0987000B3683A000000
      0000000000000000000000000000000000000000000000000000000000000000
      000012ABDE005EE5FC0013ACDE00000000000000000000000000000000000000
      000013ABDF005EE4FC0012ABDF0000000000AB4E2100FEFEFE009CCA82009CCA
      82009CCA8200FEFCF900029A0300029A0300029A0300FEEDDA00265800002658
      000026580000FEDFBD008F482300000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E0A87E00E0886000B972
      5200000000000000000000000000000000000000000000000000000000000000
      00000FAFE4006DEBFD000FAFE300000000000000000000000000000000000000
      00000FB0E3006EEBFD000FB0E30000000000AB4E2100FEFEFE009CCA82009CCA
      82009CCA8200FEFEFE00029A0300029A0300029A0300FEF2E500265800002658
      000026580000FEE2C4008F482300000000000000000000000000000000000000
      0000000000000014FF000014FF000014FF000014FF000014FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E0A88D00D080
      5000B17B5E000000000000000000000000000000000000000000000000000000
      00000BB3E8007CF0FD000BB4E800000000000000000000000000000000000000
      00000CB4E7007CF0FE000CB3E70000000000AB4E2100FEFEFE009CCA82009CCA
      82009CCA8200FEFEFE00029A0300029A0300029A0300FEF7EE00265800002658
      000026580000FEE7CD008E472200000000000000000000000000000000000000
      0000003EFF00003EFF00003EFF000000000000000000003EFF00003EFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E1B1
      9600D0785000B17C5E0000000000000000000000000000000000000000000000
      000009B7EB0089F4FE0009B8EC0008B7EC000000000000000000000000000000
      000009B7EB0089F4FF0009B7EC0000000000AB4E2100FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFBF700FEF7EE00FEF2
      E500FEEDDA00FEE8D0008E472200000000000000000000000000000000000073
      FF000073FF000073FF00000000000000000000000000000000000073FF000073
      FF00000000000000000000000000000000003030300000000000000000000000
      00001C1C1C000D0D0D002A2B2B004748490000000000000000002A2B2B001C1C
      1C0010101000B0684000BA735200000000000000000000000000000000000000
      000006BBF00094F8FF0094F8FE0094F8FF0006BBF00006BBF00007BBF0000000
      000006BBEF0094F8FF0006BBEF0000000000AB4E2100FEFEFE0000FFF60000FF
      F60000FFF600FEFEFE0081ADF90081ADF90081ADF900FEFEFE000000FF000000
      FF000000FF00FEEDDA008E47220000000000000000000000000000ABFF0000AB
      FF0000ABFF0000000000000000000000000000000000000000000000000000AB
      FF0000ABFF00000000000000000000000000919394001C1C1C002A2B2B002A2B
      2B00828485004849490000000000898E8C005657580048494900919394000000
      000077787900866C6000D1865900BF9382000000000000000000000000000000
      000004BEF30004BEF30004BEF3009CFBFF009CFBFF009CFBFF009CFBFF0003BE
      F30003BFF3009CFBFF0004BEF30000000000AB4E2100FEFEFE0000FFF60000FF
      F60000FFF600FEFEFE0081ADF90081ADF90081ADF900FEFEFE000000FF000000
      FF000000FF00FEF2E5008E472200000000000000000000DCFF0000DCFF0000DC
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000DCFF0000000000000000000000000060585000000000003028
      2000000000000D0D0E0038383900707070000000000065676800000000000000
      0000000000000000000000000000E1947A000000000000000000000000000000
      000000000000000000000000000001C1F60001C1F60001C1F6009CFBFF009CFB
      FF009CFBFF009CFBFF0001C1F60000000000AB4E2100FEFEFE0000FFF60000FF
      F60000FFF600FEFEFE0081ADF90081ADF90081ADF900FEFEFE000000FF000000
      FF000000FF00FEF7EE008E4722000000000000FCFF0000FCFF0000FCFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BBBEBD00797A7A00BBBE
      BD0000000000575D5900000000009C999E00949495005F656000A1A3A4000000
      0000757677000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000C3F80000C3
      F80000C3F80000C3F80000C3F80000000000AB4E2100FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFBF7008E4722000000000000FCFF0000FCFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F000000
      000000000000595159006C666D008B8C8C0000000000000000005F596000524C
      5300464747000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AB4E2100AB4E2100AB4E
      2100AB4E2100AB4E2100AB4E2100AB4E2100AB4E2100AB4E2100AB4E2100AB4E
      2100AB4E2100AB4E210000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000140E0A001610
      0B001B140E001B140E001B140E001B140E001F1711001F1711001E1711002018
      110019120D0016100B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000732DE000732DE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000211913001B1510002119
      13007561510075615100745F5000715D4D006551430063504200614D41005E4B
      3D00231913001A130D001F17100000000000000000000732DE000732DE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000732DE000732DE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000281F170031241D002920
      1800C1B1A000BBAA9A00BBAA9A00BAA99700B8A69500B5A49200B3A18F00B19E
      8B00261B15002F241A00281F170000000000000000000732DE000732DE000732
      DE00000000000000000000000000000000000000000000000000000000000000
      00000732DE000732DE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000034271E00000000003026
      1D00C8B9AB00C2B3A300C2B3A300C0B1A000BCAB9B00BAA99800B8A79500B2A0
      8E002A20190000000000291F180000000000000000000732DE000732DD000732
      DE000732DE000000000000000000000000000000000000000000000000000732
      DE000732DE0000000000000000000000000000000000000000000E150E000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000E150E000000000000000000000000000E150E00000000000000
      000000000000000000000000000000000000000000004132290041322900392B
      2200CDBFB300C9BBAF00C8BAAD00C7B9AB00C4B5A700C0B1A300BBAB9B00B5A4
      92002C211A0032281F002B2119000000000000000000000000000534ED000732
      DF000732DE000732DE00000000000000000000000000000000000732DE000732
      DE00000000000000000000000000000000000000000000000000000000000000
      00000E150E000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000E150E0000000000000000000000000000000000000000000E150E000000
      0000000000000000000000000000000000000000000049393000000000004132
      2800D3C7BB00D2C5B900D1C4B800CFC2B600CBBDB000C8B9AC00C4B4A600BAA9
      9A0031271E0000000000372A2200000000000000000000000000000000000000
      00000732DE000732DE000732DD00000000000732DD000732DE000732DE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000E150E00000000000E150E000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000524235004F3E32004637
      2C00DACFC400D9CEC300D7CCC100D4C9BE00CFC2B500CBBDB000C7B9AB00C2B2
      A400382C2300382B23003D312800000000000000000000000000000000000000
      0000000000000732DD000633E6000633E6000633E9000732DC00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000052433600000000003D31
      280052433600564739005647390052443700514337004C3E320044382E003E32
      29002E231D00000000004B3D3100000000000000000000000000000000000000
      000000000000000000000633E3000732E3000534EF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000E150E00000000000E150E0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004F413400554438004738
      2F00715E5000725F5200715E5000715E4F006756470062504400614F43005D4C
      4000352A21003D3028003C302700000000000000000000000000000000000000
      0000000000000732DD000534ED000533E9000434EF000434F500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000058483C00000000005647
      3B00D8CEC200D3C8BD00D5C9BE00D5CABE00CEC1B400CABDAF00CABDAF00C5B8
      A900392E2600000000004B3D3200000000000000000000000000000000000000
      00000434F4000534EF000533EB0000000000000000000434F4000335F8000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000E150E00000000000E150E00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000524337005A4B3E005D4C
      4100D4C9BF00D4C9BE00D5CABF00D4CABF00D1C4B800CFC2B500CDC0B200C5B6
      A9004C3E350040342B0035292200000000000000000000000000000000000335
      FC000534EF000434F800000000000000000000000000000000000335FC000335
      FB00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000E150E000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006E5D4F00000000008875
      6600DFD6CD00DAD1C800DAD1C800D9CFC500D5CBBF00D2C7BB00D0C3B900CBBE
      B300635146000000000059483D000000000000000000000000000335FB000335
      FB000335FC000000000000000000000000000000000000000000000000000335
      FB000335FB000000000000000000000000000000000000000000000000000000
      000000000000000000000E150E00000000000000000000000000000000000000
      00000E150E000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000079675900958372009583
      7200E3DBD300DFD6CE00DFD6CE00DDD3CB00D9CFC600D6CBC100D3C7BD00CDC0
      B40067554900665548005F50420000000000000000000335FB000335FB000335
      FB00000000000000000000000000000000000000000000000000000000000000
      0000000000000335FB0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009E8D7C00000000009887
      7600E5DDD500E2DAD300E1D9D100E1D8D000DDD4CA00D9D0C500D7CDC200D2C4
      BA006A5A4C000000000078635500000000000335FB000335FB000335FB000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000098847600847263009884
      7600BFB1A500BFB1A500BEB0A300BAAB9E00AC9B8D00A69384009F8B7C009683
      74006D5A4F005A4B3E0069554B00000000000335FB000335FB00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000AF9E8E00AA98
      8800A6958400A7978700A7978700A4938300A08E7D00978475008D796A008774
      6500836F5F008471620000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000090C5000090
      C5000090C5000090C5000090C5000090C5000090C5000090C5000090C5000090
      C5000090C5000090C5000090C50000000000000000000C5194000C5194000C51
      94000C5194000C5194000C5194000C5194000C5194000C5194000C5194000C51
      94000C5194000C5194000C519400000000000000000000000000C2A6A400C2A6
      A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6
      A400C2A6A400C2A6A40000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000292C7000EB8E9000FCAFA000FCA
      FA0010CAFA000FCAFA000FCAFA000FCAFA000FCAFA000FCAFA000FCAFA000FCA
      FA000FC9FA000FCAF9000AB4E6000192C7000C5397000C6EC1000882E7000885
      E6000882E7000882E7000882E5000886E2000888E2000882E5000882E7000882
      E7000880E6000888E8000C68BA000C5397000000000000000000C2A6A400FEFC
      FB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFC
      FB00FEFCFB00C2A6A40000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000395CA0012B9E90017CDFA0018CD
      FA0017CDFA0018CDFB0017CDFA00000000000000000018CDFB0017CDFB0018CD
      FA0017CDFA0017CDFA000FB6E7000396CA000D5498000880E500097DE200097D
      E500097EE400087CE4000773DD002E8DE1003693E3000973DD00087CE200097F
      E600097DE5000875E100087FE6000D5498000000000000000000C2A6A400FEFC
      FB00993300009933000099330000993300009933000099330000993300009933
      0000FEFCFB00C2A6A40000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000059ACE0023D1FA0024D1
      FA0023D1FB0023D2FB0024D1FB00000000000000000023D1FB0023D1FB0023D2
      FB0023D2FB0023D1FB00059ACD00000000000D559A000A7DE3000C7EE5000C80
      E6000C80E5000A7BE3000772DA00E9F5FB00FEFDFF001179DB00097CE2000C80
      E7000C80E6000A7CE5000C80E4000D559A000000000000000000C2A6A400FEFB
      F70099330000F1F1F100F1F1F100F1F1F10048BDE80065C7E800F1F1F1009933
      0000FEFBF700C2A6A40000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000079ED1001DBEEA0031D6
      FB0031D6FB0031D6FB0032D6FB0032D7FB0031D6FB0031D6FB0031D6FB0031D6
      FB0032D6FB001FBBE700079ED200000000000F559A000E80E4001080E5001180
      E6001180E6000E7DE3000870D800DBF0FA00F4F9FC001479D9000D7FE2001286
      E8001180E600107CE4001183E5000F559A000000000000000000C2A6A400FEF9
      F40099330000F1F1F100D5EAF1003EB7E100019FDA002AB1E100F1F1F1009933
      0000FEF9F400C2A6A40000000000000000000000000000000000000000000008
      00000008000000080000000800000008000000080000000800000E150E000000
      000000000000000000000000000000000000000000000000000009A3D60041DB
      FB0041DBFC0041DCFC0042DCFC00000000000000000041DBFC0041DBFC0041DB
      FC0042DCFC0009A3D600000000000000000010589F001585E4001582E4001788
      E7001783E6001480E3000C72D800DFF3FA00F4F7FC00187BD9001380E2001789
      E8001685E6001580E3001582E40010589F000000000000000000C2A6A400FEF7
      F0009933000086D5F1001FADE100019FDA001DADE100029FDA008BD5F1009933
      0000FEF7F000C2A6A40000000000000000000000000000000000000000000000
      0000000800000008000000080000000000000000000000080000000000000E15
      0E000000000000000000000000000000000000000000000000000BA7DB0039D1
      F40052E2FC0051E1FC0052E1FC00000000000000000052E1FD0052E2FC0052E2
      FC0040D0F1000BA7DA000000000000000000115BA0001782E5001B85E5001A87
      E8001E89E8001B87E5001074D900DFF0F900F5FAFC001A76D9001782E2001E8A
      E8001883E7001B85E5001885E800115BA0000000000000000000C2A6A400FEF5
      EC009933000027AFE10009A1DA0069C8E800B2E1F1000CA2DA0025AFE1009733
      0400FEF5EC00C2A6A40000000000000000000000000000000000000000000000
      0000000800000008000000080000000000000000000000080000000000000E15
      0E00000000000000000000000000000000000000000000000000000000000EAD
      DF0063E7FD0063E7FD0063E8FD00000000000000000063E7FD0063E8FD0063E8
      FD000EADDF00000000000000000000000000145FA3001F87E4002289E400238A
      E7002590E8002087E3000E6ACD00DBEAF700F8FBFC00227ED9001E85E1002590
      E800238AE7002289E5001E87E700145FA3000000000000000000C2A6A400FEF3
      E900993300009BDDF1008BD5F100F1F1F100F1F1F1004EBFE800019FDA000A3E
      2400FEF3E900C2A6A40000000000000000000000000000000000000000000000
      0000000800000008000000080000000000000000000000080000000000000E15
      0E000000000000000000000000000000000000000000000000000000000010B2
      E4005FE1F80074EDFD0074EDFE00000000000000000074EDFE0074EEFD005EE1
      F90010B3E4000000000000000000000000001561A6003493E7003696E8003696
      E9003699EA002E8DE10071ABE300F3F8FB00F4F9FC003792DE003292E500389A
      EB003699E9003696E8003492E8001561A6000000000000000000C2A6A400FFF1
      E50099330000F1F1F100F1F1F100F1F1F100F1F1F100F1F1F10029B1E100019F
      DA00FFF1E500C2A6A40000000000000000000000000000000000000000000000
      00000008000000080000000800000008000000080000000800000E150E000000
      0000000000000000000000000000000000000000000000000000000000000000
      000013B8E80083F3FE0084F3FE00000000000000000084F3FE0083F3FE0012B8
      E800000000000000000000000000000000001764A700409CE800419CE800429D
      E800429EE800348DE100EAF4FB00FFFFFF00F5F9FD00479AE0003F9CE70044A4
      EB00419EEA00419EEA003F99E8001764A7000000000000000000C2A6A400FFF0
      E2009933000099330000993300009933000099330000993300008F3311000F56
      7500019FDA00C2A6A40000000000000000000000000000000000000000000000
      0000000800000008000000080000000000000000000000080000000000000E15
      0E00000000000000000000000000000000000000000000000000000000000000
      000014BCEC0076EAF90092F8FE00000000000000000091F8FE0075EAF90015BC
      EC00000000000000000000000000000000001867AB0046A0E800449DE9004BA0
      E8004BA0E800419AE600559DE000559EDA0055A0DC003891E10048A3E9004BA3
      EB004BA3EA0049A3EB004297E8001867AB000000000000000000C2A6A400FFEE
      DE00FFEEDE00FFEEDE00FFEEDE00FFEEDE00FFEEDE00C5B5A900C3B4A800C2B3
      A700019FDA00019FDA00019FDA00000000000000000000000000000000000000
      0000000800000008000000080000000000000000000000080000000000000E15
      0E00000000000000000000000000000000000000000000000000000000000000
      00000000000016C0F0009EFCFF0000000000000000009EFCFE0016C1F1000000
      0000000000000000000000000000000000001967AC004EA3E8004EA2E8004FA6
      EA0051A4EA004EA2E8003A97E100DBEAF700D5E9F7004FA2E1004A9FE8004FA6
      EA0051A7EB004FA6EA004D9EE8001967AC000000000000000000C2A6A400FFEC
      DA00FFECDA00FFECDA00FFECDA00FFECDA00FFECDA00B0A29600B0A29600B0A2
      9600B0A29600C2A6A400019FDA00000000000000000000000000000000000000
      0000000800000008000000080000000000000000000000080000000000000E15
      0E00000000000000000000000000000000000000000000000000000000000000
      00000000000018C4F40086EFFA00A6FFFF00A6FFFF0085EFFA0018C4F4000000
      0000000000000000000000000000000000001A69AD0057A7E80058A7E80058A7
      E9005AAAEA0057A7E9004A99E000EAF5FB00FFFFFF0060A4E3004FA2E70058A7
      E90058A7E9005AAAE80057A3E8001A69AD000000000000000000C2A6A400FFEA
      D700FFEAD700FFEAD700FFEAD700FFEAD700C9B9AC00FBF8F400FBF8F400E6DA
      D900C2A6A4000000000000000000000000000000000000000000000000000008
      00000008000000080000000800000008000000080000000800000E150E000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000001AC8F700A6FFFF00A6FFFF001AC7F700000000000000
      0000000000000000000000000000000000001C6EAF0058A8E8005CA4E7005DAA
      E80060ABE90060ABE90057A4E4006AB0E4007BBCE80053A0E3005DA9E80060AA
      E80060ABE8005DA7E8005AA8E9001C6EAF000000000000000000C2A6A400FFE8
      D300FFE8D300FFE8D300FFE8D300FFE8D300C9B9AC00FBF8F400DFCEC700C2A6
      A400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000001BCAF90086EFFA0085EFFA001BCAF900000000000000
      0000000000000000000000000000000000001E6FB2003393D8005CA8E8005DA4
      E6005EA7E8005EA7E8005EA6E70055A0E500539DE3005CA2E6005EA6E7005EA7
      E8005EA7E7005AA6E8003293D8001E6FB2000000000000000000C2A6A400FFE6
      D000FFE6D000FFE6D000FFE6D000FFE6D000C9B9AC00DFCEC700C2A6A4000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000001BCAF9001BCAF90000000000000000000000
      000000000000000000000000000000000000000000001E71B3001E71B3001E71
      B3001E71B3001E71B3001E71B3001E71B3001E71B3001E71B3001E71B3001E71
      B3001E71B3001E71B3001E71B300000000000000000000000000C2A6A400C2A6
      A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6A400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C07C0C00C17A0100C17A0100C07C0C00C68E33000000
      0000000000000000000000000000C07900000000000000000000000000000000
      000000000000000000002F8C33002F8C33002F8C33002F8C3300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000009F5A00009F5A00009F5A00009F5A0000000000000000
      0000000000000000000000000000000000000000000000000000000000002626
      9A00000000000000000000000000000000000000000000000000000000000000
      000027279A000000000000000000000000000000000000000000000000000000
      0000C17B0100CE8F2000D79E3700F0C57500F0C57500D79E3700CE8F2000C17B
      0100C68E340000000000C0790000C07900000000000000000000000000000000
      000000000000000000002F8C33003AA23E0039A03D002F8C3300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000009F5A0000BB6B0900B96B09009F5A0000000000000000
      000000000000000000000000000000000000000000000000000026269D00252C
      DB0026279D000000000000000000000000000000000000000000000000002627
      9E00252CDB0026269D000000000000000000000000000000000000000000C27B
      0000DBA95500F0C57500F0C57500DBA95500DBA95500F0C57500F0C57500DBA9
      5500CE8F2000BF780000DBA95500BF7800000000000000000000000000000000
      000000000000000000002F8C330041A6430041A544002F8C3300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000009F5A0000BE6F1100BD7011009F5A0000000000000000
      000000000000000000000000000000000000000000002527A1002E36DD002F35
      DD002F35DD002527A100000000000000000000000000000000002627A0002E36
      DD002E36DC002E36DD002527A400000000000000000000000000C0790000D9A6
      5100EDC16F00CE8E2000C07A0000C0790000C17A0000C0790000CD8E2000DAA7
      5100EDC26F00D9A65100EEC26F00BD7700000000000000000000000000000000
      000000000000000000002F8C330047AC4B0046AA4A002F8C3300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000009F5A0000C4771800C27617009F5A0000000000000000
      00000000000000000000000000000000000000000000000000002427A8003A41
      DF003B41DF003A41DE002527A40000000000000000002527A4003A41DE003A41
      DE003A41DF002527A900000000000000000000000000BD770100D8A34B00EABD
      6700CC8C2000BE7B10000000000000000000000000000000000000000000BC75
      0000D8A34A00EABC6700EABC6700BC7500000000000000000000000000000000
      000000000000000000002F8C33004CAF51004CAF51002F8C3300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000009F5A0000C87E1E00C87E1E009F5A0000000000000000
      0000000000000000000000000000000000000000000000000000000000002327
      AD00474DE100484EE100474DE1002426A9002526A900484EE100484EE100474E
      E1002426AD0000000000000000000000000000000000BD802400E7B65D00C98A
      2000BC7A10000000000000000000000000000000000000000000BB740000D59E
      4400E7B65D00E7B75E00E7B75D00BA730000000000002F8C33002F8C33002F8C
      33002F8C33002F8C33002F8C330051B1550050B154002F8C33002F8C33002F8C
      33002F8C33002F8C33002F8C330000000000000000009F5A00009F5A00009F5A
      00009F5A00009F5A00009F5A0000C9812400C98023009F5A00009F5A00009F5A
      00009F5A00009F5A00009F5A0000000000000000000000000000000000000000
      00002327B100565CE300565BE300575CE300565BE300565BE300565BE3002226
      B20000000000000000000000000000000000B9750C00D1993C00E3B05200B872
      00000000000000000000000000000000000000000000B9720000B9710000B972
      0000B9720000B9720000B9710000B9720000000000002F8C33005BBE610058B9
      5C0058B95C0058B95C0058B85C0056B65A0056B65A0056B65B0058B95C0058B9
      5C0058B95C0059BA5F002F8C330000000000000000009F5A0000D8902F00D189
      2B00D1892B00D1892B00D0892B00CE872A00CE872A00CE882A00D1892B00D189
      2B00D1892B00D48D2C009F5A0000000000000000000000000000000000000000
      0000000000002226B700656AE600656AE500656AE500656AE5002226B6000000
      000000000000000000000000000000000000B9750C00B9750C00B46E0000B46E
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000002F8C330065C56C005FBF
      65005FBF650060BF66005EBD64005CBA62005CBA62005DBB630060BF66005FBF
      65005FBF650062C368002F8C330000000000000000009F5A0000DE9B3900D894
      3400D8933400D8943500D6913300D28E3100D28E3100D48F3200D8943500D894
      3400D8933400DC9736009F5A0000000000000000000000000000000000000000
      0000000000002126BB007478E7007478E8007478E8007478E8002126BB000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B8720000B8720000B9750C00B9750C00000000002F8C33002F8C33002F8C
      33002F8C33002F8C33002F8C330064C16A0064C16A002F8C33002F8C33002F8C
      33002F8C33002F8C33002F8C330000000000000000009F5A00009F5A00009F5A
      00009F5A00009F5A00009F5A0000D9973900D99739009F5A00009F5A00009F5A
      00009F5A00009F5A00009F5A0000000000000000000000000000000000000000
      00002025C0008286EA008386EA008286EB008286EA008286EA008286EA002126
      C00000000000000000000000000000000000B9720000B9710000B9720000B972
      0000B9720000B9710000B9720000000000000000000000000000000000000000
      0000B8720000E3B05200D1993C00B9750C000000000000000000000000000000
      000000000000000000002F8C33006DC974006CC872002F8C3300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000009F5A0000E2A24300E1A042009F5A0000000000000000
      0000000000000000000000000000000000000000000000000000000000002026
      C4008F93EC009093EC009093EC001F26C9001F25C9009093ED008F93EC009093
      ED002025C500000000000000000000000000BA730000E7B75D00E7B75E00E7B6
      5D00D59E4400BB7400000000000000000000000000000000000000000000BC7A
      1000C98A2000E7B65D00BD802400000000000000000000000000000000000000
      000000000000000000002F8C330075CF7C0073CD7B002F8C3300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000009F5A0000E7A94D00E5A94B009F5A0000000000000000
      00000000000000000000000000000000000000000000000000001F26C8009B9E
      EE009C9EEE009B9EEE001F26CD0000000000000000001E25CD009C9FEF009C9E
      EF009C9EEE001F25C8000000000000000000BC750000EABC6700EABC6700D8A3
      4A00BC7500000000000000000000000000000000000000000000BE7B1000CC8C
      2000EABD6700D8A34B00BD770100000000000000000000000000000000000000
      000000000000000000002F8C33007BD484007AD382002F8C3300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000009F5A0000EDB35500EBB054009F5A0000000000000000
      000000000000000000000000000000000000000000001E25CF00A6A7F000A6A8
      F000A5A8F0001E25CF00000000000000000000000000000000001E25D000A5A8
      F000A6A7EF00A6A8F0001E25CC0000000000BD770000EEC26F00D9A65100EDC2
      6F00DAA75100CD8E2000C0790000C17A0000C0790000C07A0000CE8E2000EDC1
      6F00D9A65100C079000000000000000000000000000000000000000000000000
      000000000000000000002F8C33008CE197008ADF93002F8C3300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000009F5A0000FAC56700F7C166009F5A0000000000000000
      00000000000000000000000000000000000000000000000000001D25D300ADAF
      F1001E25D3000000000000000000000000000000000000000000000000001D25
      D300ADAFF1001E25CC000000000000000000BF780000DBA95500BF780000CE8F
      2000DBA95500F0C57500F0C57500DBA95500DBA95500F0C57500F0C57500DBA9
      5500C27B00000000000000000000000000000000000000000000000000000000
      000000000000000000002F8C33002F8C33002F8C33002F8C3300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000009F5A00009F5A00009F5A00009F5A0000000000000000
      0000000000000000000000000000000000000000000000000000000000001D25
      D500000000000000000000000000000000000000000000000000000000000000
      00001E25D200000000000000000000000000C0790000C079000000000000C68E
      3400C17B0100CE8F2000D79E3700F0C57500F0C57500D79E3700CE8F2000C17B
      0100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C079000000000000000000000000
      000000000000C68E3300C07C0C00C17A0100C17A0100C07C0C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007A622E007A622E007A622E007A622E007A622E00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009F5A0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000009C00000000000000000000000000009B570C00994F0A00974A0A009B51
      0C009C520D00974B0A009A530A00000000000000000000000000000000007A62
      2E007A622E00B8AD7800D7CD8B00DCD59700D3C98700BCB28A007A622E007A62
      2E00000000000000000000000000000000000000000000000000854200008240
      0000773A00006D35000069330000693400006934000069340000693400006A34
      00006A3400005A2B000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009F5A00009F5A00000000
      000000000000000000000000000000000000000000000000000000000000009C
      0000009C0000009C000000000000A94D15009E510000BD865200D4B08F00B16F
      3000AA621D00CEA57F00B17031009E55070000000000000000007A622E009A8A
      6700BEB08600DFDACB00F1EFEB00CCCCC900F8F8F500EEEBDD00CBBE9700BFB8
      A7007A622E0000000000000000000000000000000000AB540000CB650000C561
      0000BC5D0000B5590000AF570000AD560000AE560000AE560000AE560000AE56
      0000B3590000954A00005A2C0000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A05C0000EFD8B000A15C
      00000000000000000000000000000000000000000000009C000002940300009C
      0000009C0000009E0000009C0000B2461700B8793700FEFDFB00EAD7C300D1A6
      7D00E2C9B000FFFFFF00CFA37A00AA601900000000007A622E009E8E5E00BBAB
      9000E9E4DD00B8B8B400FBFAF500E5E4DF00FAF9F500B8B7B400F9F8F400D0C5
      AA00AEA48E007A622E00000000000000000000000000C7630000E9730000DD6D
      0000D66A0000DF975100FCF7F200FCF7F200FCF7F200FCF7F200CB7C3000BF5E
      0000C4610000B35900006A340000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A35E0000FCF2DF00EFD8
      B000A35E0000000000000000000000000000009C0000009F000026A91D002BA5
      2000009C0000009C0000AC948500B44E0D00D2A67800FDFBFA00B1621500A850
      0000E5CBB100F4EAE000AF5D0D00AE601300000000007A622E00BAA87D00E1DA
      D100F8F6EF00F8F6EF00F9F7EF00F8F7EF00F9F6EF00F8F6EF00F7F5EF00F5F3
      EE00C1B290007A622E00000000000000000000000000D1680000ED760200E271
      0200DC6E0200D9781900D8802900F9EDE200F4E3D200C5772900C06C1900BA5C
      0000BF5E0000AE5600006A340000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A6610000FCF2DF00FCF2
      DF00F0D8B200A66000000000000000000000009C00009BC47500F8DEC000F2DC
      B800009C0000AFCA8700FFE0BB00B45F0800CD955F00F9F5F000B5621100AC4D
      0000DAB18800F6EDE400B5610F00B16010007A622E00D0C78D00C4B5A100B5B2
      AD00F7F3EA00F7F4EA00F7F4EA00F7F4EA00F7F4EA00F6F3EA00F5F2EA00B4B1
      AD00E4DFD000BBB08B007A622E000000000000000000D66A0000F3811100EE7B
      0B00E6750500DE6E0000D5690000FAEEE200F2DAC200C1600000BC5D0000BA5C
      0000BF5E0000AE56000069340000000000000000000000000000AA640000A964
      0000A9640000AA640000AA640000AA640000AA640000BB833300FCF2DF00FCF2
      DF00FCF2DF00F0DAB500A964000000000000CAD09F00CB9E7600C3845F00CB98
      7000E3D7AE00FFE6CE00F9DBBC00BC671300B9620D00E9CFB600D9AB7E00B14F
      0000DDB28700F7EEE500BB651000B76310007A622E00E3DAB100D2C6B400F6F0
      E400F6F0E400F6F1E400C9C4BA00E7E2D600F6F1E400F4F0E400F3EFE400F1ED
      E400ECE8E000CBBF90007A622E000000000000000000D66A0000F3841700F381
      1100F07C0B00E8740200E1730700FAEEE200F4DBC200C8630000C5620000BD5E
      0000BF5E0000AE560000693400000000000000000000AE670000F0DBB900FCF2
      DF00FCF2DF00FCF2DF00FCF2DF00FCF2DF00FCF2DF00FCF2DF00FCF2DF00FCF2
      DF00FCF2DF00FCF2DF00F0DCB900AE680000F6E1CA00ECC7A700A3592A00B06A
      3C00FEE0C700FFEDD600DEAE8800BC620B00BD5F0200BD5F0300DDAD7F00D8A4
      7000E7C6A700F6EBE000C0681100BD6611007A622E00E4DBC000B6AD9C00E1DB
      CC00F7EFDF00F6EFDF00C7C2B50006060600E5DFD100F3EDDF00F1ECDF00DAD6
      CC00C0BDB400CFC595007A622E000000000000000000D66A0000F48B2400F384
      1700F3811100F17C0700EB740000FCEFE200F7DCC200D76A0000C8630000C863
      0000C6620000B15700006A34000000000000B16B0000F1DDBD00FCF2DF00FCF2
      DF00FCF2DF00FCF2DF00FCF2DF00FCF2DF00FCF2DF00FCF2DF00FCF2DF00FCF2
      DF00FCF2DF00FCF2DF00FCF2DF00B16B0000FAE5D000D19B7400A0542300DBAC
      8700FFF3DE00E6C0A100A65B2900C0620700C8701800DAA16800C5680E00CB78
      2B00EED3B800F7EBDF00C66C1100C16911007A622E00EDE7DA00D4C6AD00F8EF
      D900F8F0D900F9EFD900F8EED9002F2F2F003D3B3700E2DCCC00EFE9D900EDE7
      D900E4DECF00D1C78C007A622E000000000000000000D66A0000F4933300F48B
      2400F3841700F3811100F2780000FDEFE200F9DDC200DE6E0000D76A0000D168
      0000CF660000B85B00007339000000000000B56E0000FCF2DF00FCF2DF00FCF2
      DF00FCF2DF00FCF2DF00FCF2DF00FCF2DF00FCF2DF00FCF2DF00FCF2DF00FCF2
      DF00FCF2DF00FCF2DF00FCF2DF00B56F0000F6E2CF00B06C4000BB7C5100FFF1
      DE00F0D0B500AA633600B7734300CC6D0F00D3833400FFFFFF00D68B4200C354
      0000E7BB8F00F8EBDF00CB6D0F00C86D12007A622E00EAE8E000C6B79F00B8B2
      9D00FAEFD300FBEFD300F9EED30046464600C9C1AD00514F4A00E3DBC900AFAA
      9C00D7CFB300CFC791007A622E000000000000000000D66A0000F5973B00F493
      3300F48B2400F3861B00F3811100FEF0E300FCDFC200EE760000E5710000D76A
      0000D96B0000C26000008240000000000000B8710000FCF1DE00FCF2DF00673D
      0100673D0100673D0100673D0100673D0100673D0100673D0100673D0100673D
      0100673D0100FCF1DE00FBF1DE00B8720000F9ECDC00E5C1A400D5A27C00F7DE
      C500B26D4100A3582900EBC5A500D67B1E00D06D0C00F0D5B900E5B48200D582
      2F00F7EADD00E9BE9300CE690400CE711400000000007A622E00DFD6CA00DED2
      B500FCF2D000FDF0CE00FBEECE005A5A5A00F4E9CE00CFC8B2007E7C7600D5CD
      B600D6CC93007A622E00000000000000000000000000D66A0000F4933300F7AB
      6000FCDEC100F48B2400F3861B00FEF1E400FCE0C500F2790200EE760000F7D4
      B100E88B3000CD6500009047000000000000BC750000FDF7EC00FDF7EC00FDF7
      EC00FDF7EC00FDF7EC00FEF7EC00FDF7EC00FDF7EB00FDF7EC00FDF7EC00FDF7
      EC00FDF7EC00FDF7EC00FDF7EB00BB750000F8EBDD00FFF9EE00EDCBAE00B068
      3800AE693C00E2B69500E8C09E00DB7F2100D46D0600D6751200E5A66600E9B3
      7B00E5A66600D5720D00D5700B00D2781000000000007A622E00EAE7E100DAD0
      C400E9E0C700BDB69C00FAEFCA00BEB69E00F4E9C900B2AC9400C6BDA400BDB4
      8F00D2CA99007A622E00000000000000000000000000D66A0000F4933300F59A
      4000FEF9F500FAD0A700FAC69300FEF1E500FDE9D600F9BF8600FACEA200FEF8
      F200EE862000D76A00009E4E000000000000BF770000FEFCF700FEFCF700673D
      0100673D0100673D0100673D0100673D0100673D0100673D0100673D0100673D
      0100673D0100FEFBF700FEFCF700BF780000F9F0E600FDF1E300C38B6400A257
      2600E9CCB400FFF7ED00D8A27800E8C09E00DB6E0000D97B0000D8770000D776
      0000D7760000D97D0000D98000000000000000000000000000007A622E00F1EF
      EB00F3F0ED00DBD0BE00D9CCAC00B9AF9300D4C6A400C9BA9A00DBD1A500D7D0
      A4007A622E0000000000000000000000000000000000D66A0000F4933300F59A
      4000FEF9F500FEF9F500FEF9F500FEF9F400FEF9F300FEF9F300FEF8F200FEF8
      F200F6811000E2700000AB54000000000000C27A0000FEFCF700FEFCF700FEFC
      F700FEFCF700FEFCF700FEFCF700FEFCF700FEFCF700FEFCF700FEFCF700FEFC
      F700FEFCF700FEFCF700FEFCF700C27A0000FAF3EA00CE9C7A009F511F00E0BC
      A100FFFFF700CF9F7F00A3592900CF9F7F00FEF4ED0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007A62
      2E007A622E00F6F4F000EFEBE200E7E0CE00EBE5CF00E8E2C4007A622E007A62
      2E000000000000000000000000000000000000000000D76A0000F4933300F493
      3300F4933300F4933300F4933300F4933300F48B2400F3861B00F6800B00F67B
      0200FB7C0000EA740000B55A000000000000C37C0000F2E5CF00FEFCF700FEFC
      F700FEFCF700FEFCF700FEFCF700FEFCF700FEFCF700FEFCF700FEFCF700FEFC
      F700FEFCF700FEFCF700F2E5CF00C37C0000F9F4ED00BC7E5700D09F7D00FFFF
      FD00FEF8F000BA7C5400AD6A3F00C4967100FEF4ED0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007A622E007A622E007A622E007A622E007A622E00000000000000
      0000000000000000000000000000000000000000000000000000DA771700DA77
      1700DA771700DA771700DA771700DA771700DA771700D8700B00D76C0400D66B
      0200D76B0000C9630000000000000000000000000000C37C0000F2E5CF00FEFC
      F700FEFCF700FEFCF700FEFCF700FEFCF700FEFCF700FEFCF700FEFCF700FEFC
      F700FEFCF700F2E5CF00C37C000000000000FBFBF600F7E7DB00FBF1E900FFFD
      FC00FFFDF900F1DFD000F8EEE700FFFFFA00FFFFFA0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C37C0000C37C
      0000C37C0000C37C0000C37C0000C37C0000C37C0000C37C0000C37C0000C37C
      0000C37C0000C37C0000000000000000000000000000FAFAFA00F8F8F800F8F8
      F800F8F8F800FAFAFA00FAFAFA00FAFAFA000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000669A000066
      9A0000669A00B8898900B8898900B8898900B8898900B8898900B8898900B889
      8900B8898900B8898900B889890000000000000000004A667C00BE9596000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C2A6A400C2A6
      A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6
      A400C2A6A400C2A6A40000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000669A003CBEE30036BA
      E10030B6DF00B8898900FEFEFD00FEFEFE00FEFEFD00FEFEFD00FEFEFD00FEFE
      FD00FEFEFD00FEFEFD00B8898900000000006B9CC3001E89E8004B7AA300C896
      9300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C2A6A400FEFC
      FB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFC
      FB00FEFCFB00C2A6A4000000000000000000000000000000000000000000DA6D
      0400DA6D0400DA6D0400DA6D0400DA6D0400DA6D0400DA6D0400000000000000
      0000000000000000000000000000000000000000000000669A0045C4E6003FC0
      E40038BCE200B8898900FEFBF800B27E7300B27E7300B27E7300B27E7300B27E
      7300B27E7300FEFBF800B8898900000000004BB4FE0051B5FF002089E9004B7A
      A200C69592000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C2A6A400FEFC
      FB00993300009933000099330000993300009933000099330000993300009933
      0000FEFCFB00C2A6A4000000000000000000000000000000000000000000DB71
      0A00DB710A00DB710A00DB710A00DB710A00DB710A00DB710A00000000000000
      0000000000000000000000000000000000000000000000669A004DC9E90047C4
      E70041C0E500B8898900FEF8F300FFF4EC00FEF6EE00FEF8F100FFF9F400FEFB
      F600FEFCF900FEF8F300B8898900000000000000000051B7FE0051B3FF001D87
      E6004E7AA000CA97920000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C2A6A400FEFB
      F70099330000FEFEFE00FEFEFE00FEFEFE0047E4470065E86400FEFEFE009933
      0000FEFBF700C2A6A40000000000000000000000000000000000000000000000
      000000000000DD741100DD741100DD7411000000000000000000000000000000
      0000000000000000000000000000000000000000000000669A0056CDED0050C9
      EA004AC5E800B8898900FEF6ED00B27E7300B27E7300B27E7300B27E7300B27E
      7300B27E7300FEF6ED00B889890000000000000000000000000051B7FE004EB2
      FF001F89E6004E7BA200B9949700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C2A6A400FEF9
      F40099330000FEFEFE00D1F2D10040DA3F0003BC01002EDA2B00FEFEFE009933
      0000FEF9F400C2A6A40000000000000000000000000000000000000000000000
      000000000000DF791900DF791900DF7919000000000000000000000000000000
      0000000000000000000000000000000000000000000000669A005ED2F00058CF
      ED0052CBEB00B8898900FFF0E300FFF0E300FFF0E300FFF1E500FFF2E600FFF3
      E900FFF5EB00FFF0E300B88989000000000000000000000000000000000052B8
      FE004BB1FF002787D9005F6A760000000000B0857F00C09F9400C09F9600BC98
      8E00000000000000000000000000000000000000000000000000C2A6A400FEF7
      F0009933000080F27F0022DA210003BC010021DA200004BC020084F284009933
      0000FEF7F000C2A6A40000000000000000000000000000000000000000000000
      000000000000E17D2100E17D2100E17D21000000000000000000000000000000
      0000000000000000000000000000000000000000000000669A0066D7F30060D4
      F1005AD0EE00B8898900FFEDDD00B27E7300B27E7300B27E7300B27E7300CDA9
      9E00CCAA9E00D7C5BA00B8898900000000000000000000000000000000000000
      000055BDFF00B5D6ED00BF9D9200BB9B8C00E7DAC200FFFFE300FFFFE500FDFA
      DA00D8C3B300B58D850000000000000000000000000000000000C2A6A400FEF5
      EC00993300002ADA28000ABC080067E86700AAF2AA000DBC0B0023C622009733
      0400FEF5EC00C2A6A40000000000000000000000000000000000000000000000
      000000000000E3822A00E3822A00E3822A00E3822A00E3822A00E3822A00E382
      2A00000000000000000000000000000000000000000000669A006DDBF60067D8
      F30062D4F200B8898900FFEBD800FFEAD700FFEBD800FFEBD800FFEBD800C4AA
      A700C5ABA800CDB5B000CD999900000000000000000000000000000000000000
      00000000000000000000CEA79500FDEEBE00FFFFD800FFFFDA00FFFFDB00FFFF
      E600FFFFFB00EADDDC00AE837F00000000000000000000000000C2A6A400FEF3
      E9009933000096F2930084F28400FEFEFE00FEFEFE004CE44B0003BC01002837
      0A00FEF3E900C2A6A40000000000000000000000000000000000000000000000
      000000000000E5873300E5873300E5873300E5873300E5873300E5873300E587
      3300E58733000000000000000000000000000000000000669A0074DFF8006FDC
      F6006ADAF400B8898900FFE8D200FFE8D200FFE8D200FFE8D200FBE4CF00C6AC
      A900FEFEFE00CD99990000000000000000000000000000000000000000000000
      00000000000000000000C1A09100FBDCA800FEF7D000FFFFDB00FFFFE300FFFF
      F800FFFFFD00FFFFFD00C6A99C00000000000000000000000000C2A6A400FFF1
      E50099330000FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE0026C6250003BC
      0100FFF1E500C2A6A40000000000000000000000000000000000000000000000
      000000000000E78C3C00E78C3C00E78C3C000000000000000000E78C3C00E78C
      3C00E78C3C00E78C3C0000000000000000000000000000669A007AE3FA0076E1
      F80070DDF600B8898900FFE6CF00FFE6CF00FFE6CF00FFE6CF00E9CFBF00D2BA
      B400CD99990000669A0000000000000000000000000000000000000000000000
      000000000000C1A09100FEE3AC00F1C49100FCF2CA00FFFFDD00FFFFE400FFFF
      F700FFFFF700FFFFE900EEE5CB00B9948C000000000000000000C2A6A400FFF0
      E2009933000099330000993300009933000099330000993300008F3311000F5E
      140003BC0100C2A6A40000000000000000000000000000000000000000000000
      000000000000EA914500EA914500EA914500000000000000000000000000EA91
      4500EA914500EA91450000000000000000000000000000669A007FE6FC007BE4
      FA0077E1F900B8898900B8898900B8898900B8898900B8898900B8898900CD99
      990052CAEB0000669A0000000000000000000000000000000000000000000000
      000000000000C2A19100FFE6AE00EEB58100F7DCAE00FEFDD800FFFFDF00FFFF
      E300FFFFE400FFFFE000F3ECD200BB968E000000000000000000C2A6A400FFEE
      DE00FFEEDE00FFEEDE00FFEEDE00FFEEDE00FFEEDE00C5B5A900C3B4A800C2B3
      A70003BC010003BC010003BC0100000000000000000000000000000000000000
      000000000000EC964D00EC964D00EC964D00000000000000000000000000EC96
      4D00EC964D00EC964D0000000000000000000000000000669A0083E8FE0080E6
      FC007DE5FC007DE5FC0078E2FA0072DFF8006BDAF50064D5F2005DD0EF0056CD
      ED0052CAEB0000669A0000000000000000000000000000000000000000000000
      000000000000BC978C00FBE7B700F4C79100F2C99400F8E5B900FEFCD800FFFF
      DD00FFFFDC00FFFFE000E2D2BA00B68E86000000000000000000C2A6A400FFEC
      DA00FFECDA00FFECDA00FFECDA00FFECDA00FFECDA00B0A29600B0A29600B0A2
      9600B0A29600C2A6A40003BC0100000000000000000000000000000000000000
      000000000000ED9A5500ED9A5500ED9A5500000000000000000000000000ED9A
      5500ED9A5500ED9A550000000000000000000000000000669A0084E9FE0084E9
      FE007373730073737300737373007373730073737300737373007373730060D4
      F0005ACFEE0000669A0000000000000000000000000000000000000000000000
      00000000000000000000D9C3A900FFFEE500F7DCB800F2C99400F5D4A500FAE8
      BD00FDF4C900FDFBD600B6908900000000000000000000000000C2A6A400FFEA
      D700FFEAD700FFEAD700FFEAD700FFEAD700C9B9AC00FBF8F400FBF8F400E6DA
      D900C2A6A4000000000000000000000000000000000000000000000000000000
      000000000000EF9E5C00EF9E5C00EF9E5C000000000000000000EF9E5C00EF9E
      5C00EF9E5C00EF9E5C0000000000000000000000000000669A0084E9FE0084E9
      FE0073737300CFC1BC00CFC1BB00CFC1BB00CFC1BB00CEBEB7007373730068D8
      F40062D4F10000669A0000000000000000000000000000000000000000000000
      00000000000000000000B58D8500E8DEDD00FFFEF200F9D8A300F4C48C00F9D4
      9F00FDEAB800D0B49F00B8908600000000000000000000000000C2A6A400FFE8
      D300FFE8D300FFE8D300FFE8D300FFE8D300C9B9AC00FBF8F400DFCEC700C2A6
      A40000000000000000000000000000000000000000000000000000000000F1A1
      6100F1A16100F1A16100F1A16100F1A16100F1A16100F1A16100F1A16100F1A1
      6100F1A16100000000000000000000000000000000000000000000669A000066
      9A0073737300E2D8D300FAF9F800F9F8F700F9F8F700D0C5BF00737373000066
      9A0000669A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000AD827F00C9AA9E00EFE0B700EFDFB200E7CE
      AC00B8908600B890860000000000000000000000000000000000C2A6A400FFE6
      D000FFE6D000FFE6D000FFE6D000FFE6D000C9B9AC00DFCEC700C2A6A4000000
      000000000000000000000000000000000000000000000000000000000000F2A3
      6600F2A36600F2A36600F2A36600F2A36600F2A36600F2A36600F2A36600F2A3
      6600000000000000000000000000000000000000000000000000000000000000
      0000000000007373730073737300737373007373730073737300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BA968A00BB988C00B791
      8800000000000000000000000000000000000000000000000000C2A6A400C2A6
      A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6A400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A5420800A7440700A23F080000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B8898900B8898900B8898900B8898900B8898900B8898900B889
      8900B8898900B8898900B8898900000000000000000000000000854200008240
      0000773A00006D35000069330000693400006934000069340000693400006A34
      00006A3400005A2B000000000000000000000000000000000000854200008240
      0000773A00006D35000069330000693400006934000069340000693400006A34
      00006A3400005A2B000000000000000000000000000000000000000000000000
      000000000000A23F0800A5420800A23F0800A542080000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B8898900FEFEFD00FEFEFE00FEFEFD00FEFEFD00FEFEFD00FEFE
      FD00FEFEFD00FEFEFD00B88989000000000000000000AB540000CB650000C561
      0000BC5D0000B5590000AF570000AD560000AE560000AE560000AE560000AE56
      0000B3590000954A00005A2C00000000000000000000AB540000CB650000C561
      0000BC5D0000B5590000AF570000AD560000AE560000AE560000AE560000AE56
      0000B3590000954A00005A2C0000000000000000000000000000000000000000
      000000000000A74407000000000000000000A23F0800A23F080000000000A23F
      0800A74407000000000000000000000000000000000000000000000000000000
      000000000000B8898900FEFBF800B27E7300B27E7300B27E7300B27E7300B27E
      7300B27E7300FEFBF800B88989000000000000000000C7630000E9730000DD6D
      0000D66A0000D0670000C8630000C1600000BF5F0000BE5E0000BF5E0000BF5E
      0000C4610000B35900006A3400000000000000000000C7630000E9730000DD6D
      0000D66A0000D0670000C8630000C1600000BF5F0000BE5E0000BF5E0000BF5E
      0000C4610000B35900006A340000000000000000000000000000000000000000
      000000000000A74407000000000000000000A23F080000000000A23F0800A23F
      0800A23F0800A542080000000000000000000000000000000000000000000000
      000000000000B8898900FEF8F300FEFAF600FEF8F300FEF8F300FEF8F300FEF8
      F300FEF8F300FEF8F300B88989000000000000000000D1680000ED760200E271
      0200DC6E0200D5690000D98C3F00DA9A5A00D6985B00CF8C4B00C2702000BA5C
      0000BF5E0000AE5600006A3400000000000000000000D1680000ED760200E271
      0200DC6E0200DA7C2000DB934B00DB9A5B00D6975A00CC843F00B95C0000BA5C
      0000BF5E0000AE5600006A340000000000000000000000000000000000000000
      000000000000A5420800A23F0800A23F0800A23F080000000000A23F08000000
      000000000000A64307000000000000000000B8898900B8898900B8898900B889
      8900B8898900B8898900FEF6ED00B27E7300B27E7300B27E7300B27E7300B27E
      7300B27E7300FEF6ED00B88989000000000000000000D66A0000F6821100EE7B
      0B00E6750500DE6E0000EFC79F00FEFEFE00FEFEFE00FEFEFE00FEFEFE00D193
      5700BF5E0000AE560000693400000000000000000000D66A0000F6821100EE7B
      0B00EEA45A00FEFEFE00FEFEFE00FEFEFE00FEFEFE00E8C39F00BC5D0000BA5C
      0000BF5E0000AE56000069340000000000000000000000000000000000000000
      00000000000000000000A23F0800A7440700A5420800A23F0800A54208000000
      000000000000A23F08000000000000000000B8898900FEFEFD00FEFEFE00FEFE
      FD00FEFEFD00B8898900FEF3E800FFF4EA00FEF3E800FEF3E800FEF3E800FEF3
      E800FEF3E800FEF3E800B88989000000000000000000D66A0000F8933000F485
      1900F07C0B00E8740200E1730700DD771400D7771800D2761D00E5B98D00FEFE
      FE00BF5E0000AE560000693400000000000000000000D66A0000F8933000F485
      1900FEFEFE00F4C08E00E37F1D00DD7A1800D6751400CD690700C5620000BD5E
      0000BF5E0000AE56000069340000000000000000000000000000000000000000
      00000000000000000000000000009E410D00A14E2200A23F0800A7440700A542
      0800A5420800A23F08000000000000000000B8898900FEFBF800B27E7300B27E
      7300B27E7300B8898900FFF0E300B27E7300B27E7300B27E7300B27E7300B27E
      7300B27E7300FFF0E300B88989000000000000000000D66A0000F9A75600F48E
      2900F3811100F17C0700F7CA9E00E4710000DE6E0000D76A0000D2721400FEFE
      FE00C6620000B15700006A3400000000000000000000D66A0000F9A75600F48E
      2900FEFEFE00F2861A00EB740000E4710000DE6E0000EFC69E00CE660000C863
      0000C6620000B15700006A340000000000000000000000000000000000000000
      0000000000000000000000000000957D75008D766C00A55E3900A23F0800A23F
      0800A23F0800000000000000000000000000B8898900FEF8F300FEFAF600FEF8
      F300FEF8F300B8898900FFEDDD00FFEDDD00FFEDDD00FFEDDD00FFEDDD00E9D5
      C900E7D6C900D7C5BA00B88989000000000000000000D66A0000F9B36F00F494
      3500F3841700F9C99900FEFEFE00EE760000E6720000DE6E0000E69F5B00FEFE
      FE00CF660000B85B0000733900000000000000000000D66A0000F9B36F00F494
      3500FEFEFE00F6AB6000F2780000EE760000E6720000FEFEFE00EFC29600D168
      0000CF660000B85B000073390000000000000000000000000000000000000000
      000000000000000000008E7C7200AC928E008E7C72008E7C7200000000000000
      000000000000000000000000000000000000B8898900FEF6ED00B27E7300B27E
      7300B27E7300B8898900FFEBD800FFEAD700FFEBD800FFEBD800FFEBD800C4AA
      A700C5ABA800CDB5B000CD9999000000000000000000D66A0000FABA7B00F599
      3F00FBDBBB00FEFEFE00FEFEFE00FCECDC00FBE1C700F9E0C700FEFEFE00EEBD
      8C00D96B0000C2600000824000000000000000000000D66A0000FABA7B00F599
      3F00FACA9A00FEFEFE00FBE1C700FBE1C700FCECDC00FEFEFE00FEFEFE00F3D2
      B100D96B0000C260000082400000000000000000000000000000000000000000
      0000000000008E7C7200D3BDBD008E7C7200AD938F008E7C7200000000000000
      000000000000000000000000000000000000B8898900FEF3E800FFF4EA00FEF3
      E800FEF3E800B8898900FFE8D200FFE8D200FFE8D200FFE8D200FBE4CF00C6AC
      A900FEFEFE00CD999900000000000000000000000000D66A0000FABF8500F69F
      4B00FBD8B700FEFEFE00FEFEFE00FBDEC300F9CA9C00F9C99A00F2A45800E571
      0000E3700000CD650000904700000000000000000000D66A0000FABF8500F69F
      4B00F4933300F7B37100F9CDA100F9CB9D00FBDEC200FEFEFE00FEFEFE00F5CD
      A500E3700000CD65000090470000000000000000000000000000000000000000
      00008E7C7200E9DEDE008E7C7200A9958F00D2BABA008E7C7200000000000000
      000000000000000000000000000000000000B8898900FFF0E300B27E7300B27E
      7300B27E7300B8898900FFE6CF00FFE6CF00FFE6CF00FFE6CF00E9CFBF00D2BA
      B400CD99990000000000000000000000000000000000D66A0000FBC79400F7AB
      6100F5973B00FACDA100FEFEFE00F3861B00F3841700F37E0B00F2790200EE76
      0000EB750000D76A00009E4E00000000000000000000D66A0000FBC79400F7AB
      6100F5973B00F4933300F48B2400F3861B00F3841700FEFEFE00F9C18B00EE76
      0000EB750000D76A00009E4E0000000000000000000000000000000000008E7C
      7200FCFAFA008E7C7200000000008E7C7200DFCECE008E7C7200000000000000
      000000000000000000000000000000000000B8898900FFEDDD00FFEDDD00FFED
      DD00FFEDDD00B8898900B8898900B8898900B8898900B8898900B8898900CD99
      99000000000000000000000000000000000000000000D66A0000FBC99800F9C4
      9000F8B77700F7AF6900FAD2AA00F59C4400F4933300F3841700F27C0800F379
      0200F5790000E2700000AB5400000000000000000000D66A0000FBC99800F9C4
      9000F8B77700F7AF6900F6A55600F59C4400F4933300F9C18A00F27C0800F379
      0200F5790000E2700000AB540000000000000000000000000000000000008E7C
      72008E7C720000000000000000008E7C7200ECE2E2008E7C7200000000000000
      000000000000000000000000000000000000B8898900FFEBD800FFEAD700FFEB
      D800FFEBD800FFEBD800C4AAA700C5ABA800CDB5B000CD999900000000000000
      00000000000000000000000000000000000000000000D76A0000FBB97800FBCA
      9A00FBCC9E00FBC79400FABE8300F9B16A00F89E4600F78D2400F6800B00F67B
      0200FB7C0000EA740000B55A00000000000000000000D76A0000FBB97800FBCA
      9A00FBCC9E00FBC79400FABE8300F9B16A00F89E4600F78D2400F6800B00F67B
      0200FB7C0000EA740000B55A0000000000000000000000000000000000008E7C
      72000000000000000000000000008E7C7200F9F5F5008E7C7200000000000000
      000000000000000000000000000000000000B8898900FFE8D200FFE8D200FFE8
      D200FFE8D200FBE4CF00C6ACA900FEFEFE00CD99990000000000000000000000
      0000000000000000000000000000000000000000000000000000DA771700DE86
      3000DE883300DE883300DD842C00DC7F2400DA771700D8700B00D76C0400D66B
      0200D76B0000C963000000000000000000000000000000000000DA771700DE86
      3000DE883300DE883300DD842C00DC7F2400DA771700D8700B00D76C0400D66B
      0200D76B0000C963000000000000000000000000000000000000000000000000
      00000000000000000000000000008E7C72008E7C720000000000000000000000
      000000000000000000000000000000000000B8898900FFE6CF00FFE6CF00FFE6
      CF00FFE6CF00E9CFBF00D2BAB400CD9999000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008E7C72000000000000000000000000000000
      000000000000000000000000000000000000B8898900B8898900B8898900B889
      8900B8898900B8898900CD999900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C2A6A400C2A6
      A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6
      A400C2A6A400C2A6A400000000000000000000000000078DBE00078DBE00078D
      BE00078DBE00078DBE00078DBE00078DBE00078DBE00078DBE00078DBE00078D
      BE00078DBE00078DBE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C2A6A400FEFC
      FB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFC
      FB00FEFCFB00C2A6A4000000000000000000078DBE0025A1D10072C7E70085D7
      FA0066CDF90065CDF90065CDF90065CDF90065CDF80065CDF90065CDF80066CE
      F90039ADD800078DBE000000000000000000000000000000000097433F009743
      3F00B59A9B00B59A9B00B59A9B00B59A9B00B59A9B00B59A9B00B59A9B009330
      300097433F000000000000000000000000000000000000000000000000000000
      000000000000840000008400000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000C2A6A400FEFC
      FB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFC
      FB00FEFCFB00C2A6A4000000000000000000078DBE004CBCE70039A8D100A0E2
      FB006FD4FA006FD4F9006ED4FA006FD4F9006FD4FA006FD4FA006FD4FA006ED4
      F9003EB1D90084D7EB00078DBE00000000000000000097433F00D6686800C660
      6000E5DEDF0092292A0092292A00E4E7E700E0E3E600D9DFE000CCC9CC008F20
      1F00AF46460097433F0000000000000000000000000000000000000000000000
      00008400000084000000FFFFFF00000000000000000000000000848484008484
      8400848484008484840000000000000000000000000000000000C2A6A400FEFA
      F500FEFCFB00FEFAF500FEFAF500FEFCFB00FEFAF500FEFAF500FEFCFB00FEFA
      F500FEFAF500C2A6A4000000000000000000078DBE0072D6FA00078DBE00AEEA
      FC0079DCFB0079DCFB0079DCFB0079DCFB0079DCFB007ADCFB0079DCFA0079DC
      FA0044B5D900AEF1F900078DBE00000000000000000097433F00D0656600C25F
      5F00E9E2E20092292A0092292A00E2E1E300E2E6E800DDE2E400CFCCCF008F22
      2200AD46460097433F0000000000000000000000000000000000840000008400
      0000FFFFFF000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000C2A6A400FEFA
      F500FEFAF500FEFAF500FEFAF500FEFAF500FEFAF500FEFAF500FEFAF500FEFA
      F500FEFAF500C2A6A4000000000000000000078DBE0079DDFB001899C7009ADF
      F30092E7FB0084E4FB0083E4FC0083E4FC0084E4FC0083E4FC0083E4FB0084E5
      FC0048B9DA00B3F4F900078DBE00000000000000000097433F00D0656500C15D
      5D00ECE4E40092292A0092292A00DFDDDF00E1E6E800E0E5E700D3D0D2008A1E
      1E00AB44440097433F000000000000000000000000000000000084000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C2A6A400FEF7
      F000FEF7F000FEF7F000FEF7F000FEF7F000FEF7F000FEF7F000FEF7F000FEF7
      F000FEF7F000C2A6A4000000000000000000078DBE0082E3FC0043B7DC0065C3
      E000ACF0FD008DEBFC008DEBFC008DEBFD008DEBFD008DEBFC008DEBFD000C85
      18004CBBDA00B6F7F9006DCAE000078DBE000000000097433F00D0656500C15B
      5C00EFE6E600EDE5E500E5DEDF00E0DDDF00DFE0E200E0E1E300D6D0D200962A
      2A00B24A4A0097433F000000000000000000000000000000000084000000FFFF
      FF00000000000000000000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000C2A6A400FEF7
      F000FEF7F000FEF7F000FEF7F000FEF3E900FEF7F000FEF7F000FEF3E900FEF7
      F000FEF7F000C2A6A4000000000000000000078DBE008AEAFC0077DCF300229C
      C600FDFFFF00C8F7FE00C9F7FE00C9F7FE00C9F7FE00C8F7FE000C8518003CBC
      5D000C851800DEF9FB00D6F6F900078DBE000000000097433F00CD626300C860
      6000C9676700CC727200CA727100C6696900C4646400CC6D6C00CA666700C55D
      5D00CD65650097433F0000000000000000000000000000000000840000008400
      0000FF000000FF000000FF000000840000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000C2A6A400FEF3
      E900FEF3E900FEF3E900FEF3E900FEF3E900FEF3E900FEF3E900FEF3E900FEF3
      E900FEF3E900C2A6A4000000000000000000078DBE0093F0FE0093F0FD001697
      C500078DBE00078DBE00078DBE00078DBE00078DBE000C85180052D97F0062ED
      970041C465000C851800078DBE00078DBE000000000097433F00B6555300C27B
      7800D39D9C00D7A7A500D8A7A600D8A6A500D7A09F00D5A09F00D7A9A700D8AB
      AB00CC66670097433F000000000000000000000000008484840000000000FF00
      0000FF000000FF000000FF0000008400000000FFFF0000000000848484000000
      0000000000000000000000000000000000000000000000000000C2A6A400FFF0
      E200FFF0E200FEF3E900FFEEDE00FEF3E900FFEEDE00FEF3E900FFEEDE00FEF3
      E900FFEEDE00C2A6A4000000000000000000078DBE009BF5FE009AF6FE009AF6
      FE009BF5FD009BF6FE009AF6FE009BF5FE000C85180046CE6C0059E4880058E1
      880061EB940040C165000C851800000000000000000097433F00CC666700F9F9
      F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9
      F900CC66670097433F0000000000000000000000000000000000FF000000FF00
      0000FF000000FF000000FF0000008400000000FFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000C2A6A400FEF3
      E900FFEEDE00FFF0E200FEF3E900FFEEDE00FFF0E200DDCFC200DDCFC200DDCF
      C200DDCFC200C2A6A4000000000000000000078DBE00FEFEFE00A0FBFF00A0FB
      FE00A0FBFE00A1FAFE00A1FBFE000C8518000C8518000C8518000C85180056E1
      840047CD6E000C8518000C8518000C8518000000000097433F00CC666700F9F9
      F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9
      F900CC66670097433F000000000000000000000000000000000084000000FF00
      0000FF000000FF000000FF000000FF0000008400000000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000C2A6A400FFEE
      DE00FFEEDE00FFEEDE00FFEEDE00FFEEDE00FFEEDE00C3B4A800C3B4A800C3B4
      A800C3B4A800C2A6A400000000000000000000000000078DBE00FEFEFE00A5FE
      FF00A5FEFF00A5FEFF00078CB60043B7DC0043B7DC0043B7DC000C8518004EDD
      790036BA54000C85180000000000000000000000000097433F00CC666700F9F9
      F900CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00F9F9
      F900CC66670097433F000000000000000000000000000000000000FFFF008400
      0000FF000000FF000000FF000000FF0000008400000000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000C2A6A400FFEE
      DE00FFEAD700FFEEDE00FFEAD700FFEAD700FFEEDE00B0A29600B0A29600B0A2
      9600B0A29600C2A6A40000000000000000000000000000000000078DBE00078D
      BE00078DBE00078DBE00000000000000000000000000000000000C85180040D0
      65000C8518000000000000000000000000000000000097433F00CC666700F9F9
      F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9
      F900CC66670097433F00000000000000000000000000848484000000000000FF
      FF0000FFFF00FF000000FF00000000FFFF0000FFFF0000000000848484000000
      0000000000000000000000000000000000000000000000000000C2A6A400FFEA
      D700FFEAD700FFEAD700FFEAD700FFEAD700C9B9AC00FEFAF500FEF7F000E6DA
      D900C2A6A4000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000C8518002AB743002DBA
      49000C8518000000000000000000000000000000000097433F00CC666700F9F9
      F900CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00F9F9
      F900CC66670097433F0000000000000000000000000000000000848484000000
      0000FF000000FF000000FF000000FF0000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000C2A6A400FFEA
      D700FFE6D000FFEAD700FFE6D000FFEAD700C5B5A900FEFAF500DDCFC200C2A6
      A400000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000C85180021B538000C85
      1800000000000000000000000000000000000000000097433F00CC666700F9F9
      F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9
      F900CC66670097433F0000000000000000000000000000000000000000008484
      8400000000000000000000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000C2A6A400FFE6
      D000FFE6D000FFE6D000FFE6D000FFE6D000C9B9AC00DDCFC200C2A6A4000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000C8518000C8518000C8518000C8518000000
      000000000000000000000000000000000000000000000000000097433F00F9F9
      F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9
      F90097433F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C2A6A400C2A6
      A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6A400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000C8518000C8518000C8518000C85180000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000938B7D00918A7B00908879008E8677008C8475008B82730089817100877F
      6F00867D6D00847B6B0082796900817867000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002C8E
      4C001680360043985D0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000968E8000E6E4E000DDDBD600D4D1CB00D7D4CE00E2E0DB00ECEBE800F4F3
      F200FAFAF900FEFEFE00FFFFFF00837B6A000000000000000000000000000000
      000000000000000000000000000000000000000000008484840000000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF000000FF00000000000000000000000000
      00000000000000000000000000000000000000000000000000003F9B59000391
      3000359353000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000099918400E6E5E100EFEFEC00F1F1EE00F3F3F100F5F4F300F7F6F500F9F8
      F700FBFAFA00FDFCFC00FFFFFF00867D6D000000000000000000000000000000
      0000000000008484840084848400848484008484840000000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF000000FF000000FF000000FF000000FF000000FF000000000000000000
      000000000000000000000000000000000000000000004CB8620052C333003094
      4700000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009C948700E8E6E30084848400848484008484840084848400848484008484
      84008484840084848400FFFFFF00898071000000000000000000000000000000
      0000C6C6C60000FFFF0000F7FF0021D6F700C6C6C60084848400000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000FF0000000000000000000000FF000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000035B74C0059EF2C003998
      4B00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DA6D040000000000000000000000
      00009E978B00E8E7E300EAE9E600ECEBE700EDEDE900EFEEEC00F1F0EE00F3F2
      F000F4F4F200F6F6F400FFFFFF008C83740084848400F7F7F700EFEFEF000000
      000000FFFF0000FFFF0000F7FF0010E7FF0021CEF70084848400000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000000000000000000000000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000039B8530055EF3A003396
      4C000000000000000000000000000000000042975D0000000000000000000000
      000000000000000000000000000000000000DB710A00DB710A00000000000000
      0000A19A8E00E7E6E20084848400848484008484840084848400848484008484
      84008484840084848400FDFDFD008F8677008484840000000000F7F7F7000000
      000000FFFF0000FFFF0000FFFF0008EFFF0021CEF70084848400000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000042B7690095F2B8003E99
      520000000000000000000000000000000000208540002F8F5000000000000000
      000000000000000000000000000000000000DD741100DD741100DD7411000000
      0000A49D9100F8964400F9964500F8964400F8964400F9964400F9964500FA97
      4500FA984600FB984700FD9B4A0091897B0084848400F7F7F700F7F7F7000000
      000000FFFF0000FFFF0000FFFF0000FFFF0010E7FF00848484000000000018C6
      EF0010B5E70000A5D60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000060BB8200D5F1DC006CCE
      50003D994B00000000000000000000000000288C4A0009983100369656000000
      000000000000000000000000000000000000DF791900DF791900DF7919000000
      0000A7A09500F8964400DA782700DA782700DA782700DA782700DA782700DA78
      2700DA782700DA782700FC994800948C7E0084848400F7F7F700F7F7F700F7F7
      F7000000000000FFFF0000FFFF0000FFFF00C6C6C6000000000029D6FF0029CE
      FF0018BDEF0008ADDE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000054B97700A6FA
      BD0063CF49002491340026884500208246002187340050C3320016A031003292
      550000000000000000000000000000000000E17D2100E17D2100000000000000
      0000AAA39800F8964400FB984700FA984600FA974500F9964500F8964400F896
      4400F8964400F9964400FA984600978F820084848400F7F7F700F7F7F700F7F7
      F700F7F7F700000000000000000000000000000000005ADEFF0031D6FF0029D6
      FF0021CEF70018BDE70000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF000000000000000000000000000000000000000000000054B67400D7EE
      E700BFFFD0006BEB4F0011A63200089F26004ECA24006CD8290056CE3100119D
      310035945500000000000000000000000000E3822A0000000000000000000000
      0000ACA69B00ECEBE80084848400848484008484840084848400848484008484
      84008484840084848400E6E5E2009890830084848400F7F7F700F7F7F7008484
      8400848484008484840000000000BDF7FF0094EFFF0073E7FF0052DEFF0029D6
      FF0029D6FF0021C6F70000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000000000000000
      0000FF00000000000000000000000000000000000000000000000000000067BD
      8100D5ECE100E5FAEC00A4F9C60074F7520079FE420065FB3A0067F9290059D6
      30000D9731003190510000000000000000000000000000000000000000000000
      0000AFA99F00F4F3F100F6F5F400F4F4F200F2F2F000F1F0EE00EBEAE700DBDA
      D600D4D2CE00D5D3CE00D9D8D300968F820084848400F7F7F700F7F7F7008484
      8400F7F7F70000000000EFFFFF00D6F7FF00B5EFFF008CEFFF006BE7FF004ADE
      FF0021D6FF0029D6FF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF00000000000000FF00
      0000FF0000000000000000000000000000000000000000000000000000000000
      000058B775005BB77C00D7EFE300EDF6E700DCF5E400A0FFBF0072FF4C005AE7
      2C003D9D55000000000000000000000000000000000000000000000000000000
      0000B2ACA200FEFEFE0084848400848484008484840084848400EAE9E700CDCC
      C800BEBDB800C8C6C200C8C6C200938D81008484840084848400848484008484
      840000000000F7F7F700F7F7F700EFFFFF00CEF7FF00A5EFFF0084E7FF0063E7
      FF0042DEFF0018D6FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000FF000000FF000000FF000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000061BB7D0046AD690055B27600F1FCFD0098E9BB0041A2
      5900000000000000000000000000000000000000000000000000000000000000
      0000B5AFA600FFFFFF00FBFBFA00F9F9F800F8F8F600F6F6F500EAE9E700D0CE
      CB00ACA79C00B7B3A900C2BEB600CDCAC3000000000000000000000000000000
      0000006363000063630000636300006363000063630000636300006363000063
      6300006363000063630000636300000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004CB46B00D0E6D8005FA478000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B8B2A900FFFFFF00FDFDFD00FCFCFB00FAFAFA00F9F9F800EFEEEC00E0DF
      DD00B7B2A800FFFFFF00E1DFDB00000000000000000000000000000000000000
      0000000000000063630029D6FF000000FF000000FF0029D6FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000036A95A0044995C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BAB5AC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F9F9F900EBEA
      E900C1BDB500E1DFDB0000000000000000000000000000000000000000000000
      0000000000000000000000636300006363000063630000636300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000041AB620000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BDB8B000BBB6AE00BAB4AC00B8B3AA00B6B1A800B5AFA500B0AAA100AAA4
      9A00CCC8C2000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000444144004B37400000000000000000000000
      0000000000000000000000000000000000000063630000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004C4B4B00444A47008A7E85008939790052434900000000000000
      000000000000000000000000000000000000006363000063630000CEFF0000CE
      FF0000CEFF0000CEFF0000C6FF0000BDF70000BDEF0000B5E70000ADE70000AD
      DE00000000000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004C4C
      4C004242420073747400BDBEBD00FAFDFC00DCC5D0007A2A68004F4147000000
      000000000000000000000000000000000000006363009CFFFF000063630000CE
      FF0000CEFF0000CEFF0000C6FF0000C6F70000BDEF0000B5EF0000B5E70000AD
      DE0000A5D6000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F7F7F700EFEFEF00DEDEDE00CECECE00C6C6
      C600B5B5B500A5A5A5009C9C9C0000000000000000004D4D4C00424242007374
      7400BBBBBB00FEFEFE00F1F1F100979D9900ECF4F100E0C8D400792969004F41
      470000000000000000000000000000000000006363009CFFFF00B5EFFF000063
      630000CEFF0000CEFF0000CEFF0000C6F70000BDEF0000B5EF0000B5E70000AD
      DE0000A5DE0000A5D60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF008484
      8400848484008484840084848400FFFFFF00F7F7F70084848400848484008484
      840084848400B5B5B500A5A5A500000000009A446F00776F7300B2B7B400FDFD
      FD00FEFFFE00C0C6C1006F7471003B3438007B7F7D00F8FFFB00E0C8D3007B29
      68004F414700000000000000000000000000006363009CFFFF00C6EFFF00ADEF
      FF000063630000CEFF0000CEFF0000C6F70000BDF70000BDEF0000B5E70000AD
      E70000ADDE0000A5D600009CD60000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000FFFFFF000000
      00000000000000000000000000000000000000000000FFFFFF0094FFFF0073EF
      FF004ADEFF0018C6FF0084848400FFFFFF0094FFFF0073EFFF004ADEFF0018C6
      FF0084848400BDBDBD00ADADAD00000000009B386900D6CDD200FFFFFF00C3C9
      C400777B77004C3942004B1B3200711B6600483441007A847E00F8FFFC00E0C8
      D3007C2B64004F4147000000000000000000006363009CFFFF00D6F7FF00BDEF
      FF00A5EFFF000063630000636300006363000063630000636300006363000063
      630000636300006363000063630000000000000000000000000000000000FFFF
      FF00000000000000000000000000C6C6C6000000000000000000FFFFFF000000
      00000000000000000000000000000000000000000000FFFFFF009CFFFF007BF7
      FF0052DEFF0029CEFF00FFFFFF00FFFFFF009CFFFF007BF7FF0052DEFF0029CE
      FF00D6D6D600C6C6C600B5B5B500000000009F426F00B9B7B500ACB4AE004B44
      4800432F43006E317A0085458E00A933A400801E79003C3135007A847F00F8FF
      FC00DFC7D2007B2B600056444D0000000000006363009CFFFF00E7F7FF00CEF7
      FF00B5EFFF009CEFFF0084E7FF0073DEFF0052DEFF0039D6FF0021D6FF00009C
      CE0000000000000000000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000C6C6C6000000000000000000FFFFFF000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7F700EFEF
      EF00DEDEDE00CECECE00C6C6C60000000000872355004F3B4B0047384B00841E
      7E0089298C002B869D002BD3E40087458A00B628A700851C75003E3036007A84
      8000F9FFFC00DEC6D200792A5A003F373B00006363009CFFFF009CFFFF009CFF
      FF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF008484
      8400848484008484840084848400FFFFFF00FFFFFF0084848400848484008484
      840084848400D6D6D600CECECE0000000000A23D750095248B008D259100A232
      A200A335A40093389C007555A20019879300803E8000A72E9A00821D7100402F
      3600838E8A00E3E6E50053464C00333634000063630000636300006363000063
      6300006363000063630000636300006363000063630000636300006363000063
      6300000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      00000000000000000000000000000000000000000000FFFFFF0094FFFF0073EF
      FF004ADEFF0018C6FF0084848400FFFFFF0094FFFF0073EFFF004ADEFF0018C6
      FF0084848400E7E7E700D6D6D6000000000000000000B6518C00AF2BA3009F33
      A50099329A00AC2197009939A10020C9DC000C919F0022808900963D8A008319
      70004B3E45005B6460003F45420000000000000000000063630000CEFF000000
      FF000000FF000000FF0000CEFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF009CFFFF007BF7
      FF0052DEFF0029CEFF00FFFFFF00FFFFFF009CFFFF007BF7FF0052DEFF0029CE
      FF00F7F7F700EFEFEF00DEDEDE00000000000000000000000000AD4C8100A628
      9B009F32A5009B2F9A00A02E9B007668B3000AD6E10000E3DE001B9396009C36
      8A008C217400452B380041424100000000000000000000000000006363000063
      6300006363000063630000636300000000000000000000000000000000000000
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F7F7F700E7E7E70000000000000000000000000000000000AE4C
      8100A5289B00A729A0009341A5002BC5DF000098A500009BA90019D8DF009A49
      9500B82C9D006712500037383700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000FF000000000000000000000000000000000000000000
      000000000000FFFFFF000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000AD4C8100A7279A00A62DA3007E56AC001CCEE10027D0E60082529700931F
      80007F216200513C43004B4E4D00000000000000000000000000000000000000
      000000000000000000000000000000000000FF00000000000000000000000000
      0000FF00000000000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000084000000000000000000000000000000000000000000
      000000000000AD4D8200A7259900A92BA4009646AE00853C8C00801862004F39
      40004E4E4B000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000AE4F8400B031A60091238700523141004E4E4C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000913268004C3C4A0000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000E00000000100010000000000000700000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFF000000000000FB81000000000000
      F993000000000000C093000000000000D9C3000000000000DBE3000000000000
      DF930000000000008183000000000000C9FF000000000000C9FF000000000000
      C9FF000000000000C1FF000000000000CFFF000000000000CFFF000000000000
      87FF000000000000FFFF000000000000C003BFFFF81FFC3FC003BFFFE0078001
      C003BFFFC003FC3FC003BFFF8001FE7FC003BF038001F81FC003BE010000F00F
      C0039C010000E007C00380010000C003C00380010000C003C00180010000C003
      C00180010000C003C00380018001C003C00780318001C003C00F807DC003E007
      C01F807FE007F00FC03FE1FFF81FF81FF83FF83FFFFFFFFFE00FE00FC003C003
      C007C00780018001800380038001800180038003800180010001000180018001
      0001000180018001000100018001800100010001800180010001000180018001
      80038003800180018003800380018001C007C00780018001E00FE00F80018001
      F83FF83FC003C003FFFFFFFFFFFFFFFFC7FFFFFFFFFCFFFF83FF80039FF9FDFF
      81C700018FF3F8FFC183000187E7E07FE1810001C3CFC03FF1C10001F11FC23F
      F1E10001F83FE71FF1F10001FC7FFF8FF1F10001F83FFFC7F1F10001F19FFFE3
      F0F10001E3CF70C1F0110001C7E70210F00100018FFBA8BEFE0100011FFF8A17
      FFC100013FFFD8C7FFFF8003FFFFFFFFFFFFFFFFC003FFFCFFFFFFFF80019FF9
      FFFFE00F80018FF3FFFFFFFFA00587E7C07FF83F8001C3CFF1FFF39FA005F11F
      F8FFF39F8001F83FFCFFF39FA005FC7FFC7FF39F8001F83FFE7FF39FA005F19F
      FE3FF39F8001E3CFFF1FF39FA005C7E7FC07E10F80018FFBFFFFFFFFA0051FFF
      FFFFFFFF80013FFFFFFFFFFFC003FFFFC0018001C003FFFF00000000C003FFFF
      00000000C003FFFF80010000C003FFFF80010000C003E01FC0030000C003F18F
      C0030000C003F18FE0070000C003F18FE0070000C003F01FF00F0000C003F18F
      F00F0000C001F18FF81F0000C001F18FF81F0000C007E01FFC3F0000C00FFFFF
      FC3F0000C01FFFFFFE7F8001C03FFFFFFFFFFFFFFFFFFC1EFC3FFC3FEFF7F004
      FC3FFC3FC7E3E000FC3FFC3F83C1C000FC3FFC3FC18383E0FC3FFC3FE00787C0
      80018001F00F0F8080018001F81F0FFF80018001F81FFFF080018001F00F01F0
      FC3FFC3FE00703E1FC3FFC3FC18307C1FC3FFC3F83C10003FC3FFC3FC7E30007
      FC3FFC3FEFF7200FFFFFFFFFFFFF783FF83FFFFFFFBFF701E00FC003FF9FE200
      C0078001FF8F800080038001FF87000080038001FF83000000018001C0010000
      0001800180000000000180010000000000018001000000000001800100000000
      80038001000000008003800100000001C00780010000007FE00F80010000007F
      F83FC0038001007FFFFFFFFFC00380FFC0019FFFC003FFFF80010FFFC003E03F
      800107FFC003E03F800183FFC003F8FF8001C1FFC003F8FF8001E10FC003F8FF
      8001F003C003F80F8001FC01C003F8078003FC01C003F8C38003F800C003F8E3
      8003F800C001F8E38003F800C001F8E38003FC01C007F8C38003FC01C00FE007
      C007FE03C01FE00FF83FFF8FC03FFFFFFFFFFFFFFC7FF801C003C003F87FF801
      80018001FB27F80180018001FB43F80180018001F85B000180018001FC1B0001
      80018001FE03000180018001FE07000180018001FC3F000180018001F83F0003
      80018001F03F000780018001E23F000F80018001E63F003F80018001EE3F007F
      C003C003FE7F00FFFFFFFFFFFEFF01FFFFFFC0038003FFFFFE01C0030003C007
      F801C00300018003F001C00300018003C61FC00300018003CFFFC00300008003
      C07FC00300008003C03FC00300008003801FC00300018003801FC00300008003
      801FC00380038003801FC003C3C78003801FC007FF878003C03FC00FFF8F8003
      E07FC01FFE1FC007FFFFC03FF87FFFFFFFE3FFE1FFFFF000FFC7FEEDE3FFF000
      F80FFE6DC7FFF000F01FF0218FFFF000001FE66D8FFF7000001FEEE38F7F3000
      4001EFFF8F3F10000001FFFF871F10000001FFFFC00F3000000133F7C0077000
      0001B7B7E003F00000018727F007F0000001CE0FFC0FF000F001CF3FFF1FF001
      F81FFFBFFF3FF003FC3FFFFFFF7FF007FFFFFFFFFFFFFE7F000783E0FFFFF83F
      000783E00000E01F000383E00000800F00018080000000070000800000000003
      000080000000000100078000000000000007C001000000000007E08300008001
      80FFE0830000C001C1F1F1C70000E001FFF9F1C70000F001FF75F1C70000F807
      FF8FFFFF0000FC1FFFFFFFFFFFFFFE7F00000000000000000000000000000000
      000000000000}
  end
  object USSpellCheck: TUSSpell
    HookCaption = False
    Language = 0
    Left = 440
    Top = 24
  end
  object psCompExec: TIFPS3CompExec
    CompilerOptions = []
    OnCompile = psCompExecCompile
    OnExecute = psCompExecExecute
    OnAfterExecute = psCompExecAfterExecute
    OnCompImport = psCompExecCompImport
    OnExecImport = psCompExecExecImport
    Plugins = <>
    UsePreProcessor = False
    Left = 512
    Top = 24
  end
  object tmrMouseHide: TTimer
    Enabled = False
    Interval = 3000
    OnTimer = tmrMouseHideTimer
    Left = 792
    Top = 40
  end
  object tmrPascalScriptRestoreCursor: TTimer
    Enabled = False
    Interval = 2000
    OnTimer = tmrPascalScriptRestoreCursorTimer
    Left = 536
    Top = 24
  end
  object mnuColumnsPopup: TPopupMenu
    OwnerDraw = True
    Left = 512
    Top = 136
    object mnuColNumPopup: TMenuItem
      AutoCheck = True
      Caption = 'Num'
      Checked = True
      OnClick = mnuColClick
    end
    object mnuColPausePopup: TMenuItem
      Tag = 6
      AutoCheck = True
      Caption = 'Pause'
      Checked = True
      OnClick = mnuColClick
    end
    object mnuColShowPopup: TMenuItem
      Tag = 1
      AutoCheck = True
      Caption = 'Show'
      Checked = True
      OnClick = mnuColClick
    end
    object mnuColHidePopup: TMenuItem
      Tag = 2
      AutoCheck = True
      Caption = 'Hide'
      Checked = True
      OnClick = mnuColClick
    end
    object mnuColDurationPopup: TMenuItem
      Tag = 5
      AutoCheck = True
      Caption = 'Duration'
      Checked = True
      OnClick = mnuColClick
    end
    object mnuColTextPopup: TMenuItem
      Tag = 3
      AutoCheck = True
      Caption = 'Text'
      Checked = True
      OnClick = mnuColClick
    end
    object N43: TMenuItem
      Caption = '-'
    end
    object mnuColTranslationPopup: TMenuItem
      Tag = 4
      AutoCheck = True
      Caption = 'Translation'
      OnClick = mnuColTranslationClick
    end
  end
  object imgLstMenuDisabled: TImageList
    Left = 232
    Top = 160
    Bitmap = {
      494C010131003600040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000040000000E0000000010020000000000000E0
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C9C9C900000000000000000000000000B2B2B2002D2D2D002D2D
      2D00CACACA006060600076767600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000092929200C9C9C90000000000000000004A4A4A00ABABAB000000
      00008E8E8E004A4A4A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F0F0F000B5B5
      B500929292009292920092929200B5B5B5000000000076767600B2B2B2000000
      0000CACACA005555550000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B5B5B5000000
      00000000000092929200C9C9C9000000000000000000000000007D7D7D007D7D
      7D009C9C9C005D5D5D0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000929292000000
      000000000000C9C9C9000000000000000000000000000000000000000000E0E0
      E000A1A1A1006565650000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F0F0F0000000
      00000000000000000000000000000000000000000000A5A5A500A5A5A5000000
      0000A7A7A7006E6E6E0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000099999900292929002929
      29002929290029292900DADADA000000000000000000E0E0E000737373007373
      730073737300D2D2D20000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000047474700C5C5
      C500000000008B8B8B0047474700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000051515100C8C8
      C80000000000C8C8C80051515100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000595959009999
      990000000000CBCBCB0059595900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000616161009292
      92006161610061616100CDCDCD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000068686800D0D0
      D000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006F6F6F00D2D2
      D200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BFBFBF00737373008F8F
      8F00E0E0E0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B3B3B300B3B3
      B300B3B3B300B3B3B300B3B3B300B3B3B300B3B3B300B3B3B300B3B3B300B3B3
      B300B3B3B300B3B3B3000000000000000000000000008F8F8F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D2D2D200989898007A7A7A007A7A7A0096969600CECECE000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000AAAAAA007B7B7B007B7B7B00AAAAAA00000000000000
      0000000000000000000000000000000000000000000000000000B3B3B300FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00B3B3B3000000000000000000000000008F8F8F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D1D1
      D100818181008E8E8E00999999009D9D9D009D9D9D009B9B9B008F8F8F008282
      8200CFCFCF0000000000000000000000000000000000C3C3C300B5B5B5007C7C
      7C004D4D4D003E3E3E0062626200BABABA00BABABA00626262003E3E3E004141
      410069696900A6A6A600C3C3C300000000000000000000000000B3B3B300FCFC
      FC00A9A9A900BBBBBB00C5C5C500DBDBDB00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00B3B3B3000000000000000000000000008F8F8F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CCCCCC008D8D
      8D00A0A0A000A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A0A0
      A0008E8E8E00CCCCCC0000000000000000000000000000000000000000000000
      00000000000000000000B5B5B5007A7A7A007A7A7A00B5B5B500000000000000
      0000000000000000000000000000000000000000000000000000B3B3B300FCFC
      FC00BDBDBD00EBEBEB00E2E2E200D4D4D400B6B6B600FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00B3B3B3000000000000000000000000008F8F8F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D4D4D40093939300A5A5
      A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5
      A500A5A5A50093939300D1D1D100000000000000000000000000000000000000
      0000000000000000000000000000929292009292920000000000000000000000
      0000000000000000000000000000000000000000000000000000B3B3B300F5F5
      F500D2D2D200F1F1F100F3F3F300F0F0F000E2E2E200BCBCBC00F5F5F500F5F5
      F500F5F5F500B3B3B3000000000000000000000000008F8F8F00000000000000
      000000000000000000000000000000000000BDBDBD00B3B3B300A5A5A500A5A5
      A500B4B4B400BDBDBD0000000000000000000000000093939300A9A9A900AAAA
      AA00AAAAAA00AAAAAA00AAAAAA00FEFEFE00FEFEFE00AAAAAA00AAAAAA00AAAA
      AA00AAAAAA00AAAAAA0092929200000000000000000000000000000000000000
      000000000000C3C3C300ADADAD007878780078787800ADADAD00C3C3C3000000
      0000000000000000000000000000000000000000000000000000B3B3B300F5F5
      F500EAEAEA00D0D0D000FDFDFD00EBEBEB00C3C3C300C1C1C100BEBEBE00F5F5
      F500F5F5F500B3B3B3000000000000000000000000008F8F8F00000000000000
      0000000000000000000000000000A4A4A400B9B9B900CDCDCD00E2E2E200D9D9
      D900C0C0C000A5A5A500B0B0B00000000000DADADA00A8A8A800B0B0B000B0B0
      B000B0B0B000B0B0B000B0B0B000FEFEFE00FEFEFE00B0B0B000B0B0B000B0B0
      B000B0B0B000B0B0B000AAAAAA00D2D2D2000000000000000000000000000000
      0000ADADAD00A4A4A400C6C6C600D4D4D400D4D4D400C4C4C400A8A8A800ADAD
      AD00000000000000000000000000000000000000000000000000B3B3B300F5F5
      F500F5F5F500C4C4C400EDEDED00C9C9C900B6B6B600BDBDBD00C1C1C100BFBF
      BF00F5F5F500B3B3B300000000000000000000000000A5A5A500BDBDBD000000
      00000000000000000000BDBDBD00A4A4A400A5A5A500B1B1B100DDDDDD00D6D6
      D600C8C8C800B2B2B200A5A5A50000000000A3A3A300B0B0B000B4B4B400B4B4
      B400B4B4B400B4B4B400B4B4B400FEFEFE00FEFEFE00B4B4B400B4B4B400B4B4
      B400B4B4B400B4B4B400B1B1B100A3A3A300000000000000000000000000A9A9
      A900A6A6A600C6C6C600C8C8C800CBCBCB00CBCBCB00C6C6C600D1D1D100BCBC
      BC00A9A9A9000000000000000000000000000000000000000000B3B3B300F5F5
      F500F5F5F500F5F5F500C4C4C400EDEDED00C1C1C100B6B6B600BDBDBD00C1C1
      C100C1C1C100B3B3B300000000000000000000000000A5A5A500B4B4B400A9A9
      A900A5A5A500A5A5A500ACACAC00B6B6B600A5A5A500B4B4B400DDDDDD00D6D6
      D600C7C7C700B2B2B200A5A5A50000000000A1A1A100BABABA00B9B9B900B9B9
      B900B9B9B900B9B9B900B9B9B900FEFEFE00FEFEFE00B9B9B900B9B9B900B9B9
      B900B9B9B900B9B9B900BABABA00A3A3A3000000000000000000C3C3C3008C8C
      8C00AFAFAF00B2B2B200B7B7B700B9B9B900B9B9B900B2B2B200BEBEBE00D6D6
      D6009C9C9C00C3C3C30000000000000000000000000000000000B3B3B300EDED
      ED00EDEDED00EDEDED00EDEDED00C5C5C500EDEDED00C1C1C100B6B6B600BDBD
      BD00C1C1C100C3C3C300000000000000000000000000A5A5A500CCCCCC00CFCF
      CF00D3D3D300D6D6D600D2D2D200CECECE00A5A5A500B4B4B400DDDDDD00D6D6
      D600C7C7C700B2B2B200A5A5A50000000000A3A3A300C8C8C800BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00FEFEFE00FEFEFE00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00C7C7C700A3A3A3000000000000000000A2A2A2009797
      970099999900A0A0A000A3A3A300A4A4A400A2A2A200ACACAC00A1A1A100C6C6
      C600B7B7B700A2A2A20000000000000000000000000000000000B3B3B300EDED
      ED00EDEDED00EDEDED00EDEDED00EDEDED00C7C7C700EDEDED00C1C1C100B6B6
      B600BDBDBD00C2C2C200C9C9C9000000000000000000A5A5A500CBCBCB00D5D5
      D500E1E1E100E4E4E400DADADA00CCCCCC00A5A5A500B4B4B400DEDEDE00D7D7
      D700C7C7C700B2B2B200A5A5A50000000000A3A3A300D1D1D100C3C3C300C3C3
      C300C3C3C300C3C3C300C3C3C300A8A8A800A8A8A800C3C3C300C3C3C300C3C3
      C300C3C3C300C3C3C300D2D2D200A3A3A3000000000000000000848484009898
      98009898980093939300989898009898980091919100A0A0A000A0A0A000AEAE
      AE009F9F9F008484840000000000000000000000000000000000B3B3B300EDED
      ED00EDEDED00EDEDED00EDEDED00EDEDED00EDEDED00C9C9C900EDEDED00C1C1
      C100B6B6B600C4C4C400C1C1C1000000000000000000A5A5A500CBCBCB00D4D4
      D400DEDEDE00E2E2E200D8D8D800CCCCCC00A5A5A500B4B4B400DCDCDC00D7D7
      D700CACACA00B2B2B200A5A5A50000000000E2E2E200CFCFCF00CBCBCB00C8C8
      C800C8C8C800C8C8C800C8C8C800FFFFFF00FFFFFF00C8C8C800C8C8C800C8C8
      C800C8C8C800CACACA00CFCFCF00E2E2E200000000000000000087878700B1B1
      B100A8A8A8009A9A9A00A1A1A1009F9F9F00B0B0B000CDCDCD00A9A9A9009191
      9100939393008787870000000000000000000000000000000000B3B3B300EDED
      ED00EDEDED00EDEDED00EDEDED00EDEDED00EDEDED00AEAEAE00CCCCCC00EDED
      ED00C8C8C800C6C6C600000000000000000000000000A5A5A500CBCBCB00D4D4
      D400DEDEDE00E2E2E200D8D8D800CCCCCC00A5A5A500A7A7A700A5A5A500A5A5
      A500B6B6B600B1B1B100A5A5A5000000000000000000B2B2B200E2E2E200CCCC
      CC00CBCBCB00CBCBCB00CBCBCB00FFFFFF00FFFFFF00CBCBCB00CBCBCB00CBCB
      CB00CBCBCB00E2E2E200B4B4B400000000000000000000000000ABABAB00AFAF
      AF00A3A3A300B1B1B100B2B2B200B7B7B700C7C7C700ABABAB00DFDFDF00C0C0
      C000A0A0A000ABABAB0000000000000000000000000000000000B3B3B300E4E4
      E400E4E4E400E4E4E400E4E4E400E4E4E400BABABA00FCFCFC00F5F5F500CDCD
      CD00CECECE0000000000000000000000000000000000A5A5A500CBCBCB00D4D4
      D400DEDEDE00E2E2E200D8D8D800CDCDCD00A5A5A500BDBDBD00000000000000
      0000BDBDBD00A8A8A800A5A5A5000000000000000000E4E4E400C7C7C700E7E7
      E700D2D2D200CFCFCF00CFCFCF00ACACAC00ACACAC00CFCFCF00CFCFCF00D1D1
      D100E6E6E600CACACA00E2E2E200000000000000000000000000C3C3C300ACAC
      AC00C9C9C900D9D9D900E6E6E600CACACA00F0F0F000DADADA00ECECEC00E8E8
      E800A1A1A100C3C3C30000000000000000000000000000000000B3B3B300E4E4
      E400E4E4E400E4E4E400E4E4E400EDEDED00BABABA00F5F5F500D1D1D100B3B3
      B3000000000000000000000000000000000000000000A5A5A500CACACA00D7D7
      D700E1E1E100E4E4E400DADADA00CBCBCB00A5A5A50000000000000000000000
      00000000000000000000BDBDBD00000000000000000000000000E0E0E000C8C8
      C800EBEBEB00E3E3E300DDDDDD00D6D6D600D6D6D600DCDCDC00E2E2E200ECEC
      EC00CBCBCB00DFDFDF000000000000000000000000000000000000000000BBBB
      BB00C7C7C700CDCDCD00EFEFEF00D3D3D300DEDEDE00F4F4F400F4F4F400D1D1
      D100BBBBBB000000000000000000000000000000000000000000B3B3B300E4E4
      E400E4E4E400E4E4E400E4E4E400E4E4E400BFBFBF00D1D1D100B3B3B3000000
      00000000000000000000000000000000000000000000BDBDBD00AAAAAA00BABA
      BA00D0D0D000D3D3D300BDBDBD00A5A5A500BDBDBD0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E5E5
      E500BABABA00D6D6D600E2E2E200ECECEC00ECECEC00E2E2E200D8D8D800BBBB
      BB00E4E4E4000000000000000000000000000000000000000000000000000000
      0000C3C3C300BABABA00D3D3D300E2E2E200ECECEC00E6E6E600C7C7C700C3C3
      C300000000000000000000000000000000000000000000000000B3B3B300B3B3
      B300B3B3B300B3B3B300B3B3B300B3B3B300B3B3B300B3B3B300000000000000
      000000000000000000000000000000000000000000000000000000000000BDBD
      BD00B3B3B300B3B3B300BDBDBD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E9E9E900D9D9D900C5C5C500C3C3C300D8D8D800E8E8E8000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C3C3C300BBBBBC00B9B9B900B9B9B900BBBBBC00C3C3C3000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A9A9A900A9A9A900A9A9A900A9A9A900A9A9A900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A9A9A900A9A9A900A9A9A900A9A9A900A9A9A900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A9A9
      A900A9A9A900CBCBCB00D8D8D800DCDCDC00D6D6D600D0D0D000A9A9A900A9A9
      A90000000000000000000000000000000000000000000000000000000000A9A9
      A900A9A9A900CBCBCB00D8D8D800DCDCDC00D6D6D600D0D0D000A9A9A900A9A9
      A900000000000000000000000000000000000000000000000000A0A0A000A0A0
      A0009D9D9D009A9A9A0099999900999999009999990099999900999999009A9A
      9A009A9A9A009696960000000000000000000000000000000000A0A0A000A0A0
      A0009D9D9D009A9A9A0099999900999999009999990099999900999999009A9A
      9A009A9A9A009696960000000000000000000000000000000000A9A9A900BFBF
      BF00D0D0D000EAEAEA00F6F6F600E4E4E400FAFAFA00F2F2F200D8D8D800D9D9
      D900A9A9A9000000000000000000000000000000000000000000A9A9A900BFBF
      BF00D0D0D000EAEAEA00F6F6F600E4E4E400FAFAFA00F2F2F200D8D8D800D9D9
      D900A9A9A90000000000000000000000000000000000AAAAAA00B2B2B200B0B0
      B000AEAEAE00ACACAC00ABABAB00AAAAAA00ABABAB00ABABAB00ABABAB00ABAB
      AB00ACACAC00A4A4A400969696000000000000000000AAAAAA00B2B2B200B0B0
      B000AEAEAE00ACACAC00ABABAB00AAAAAA00ABABAB00ABABAB00ABABAB00ABAB
      AB00ACACAC00A4A4A400969696000000000000000000A9A9A900BEBEBE00D2D2
      D200F1F1F100DADADA00FBFBFB00F0F0F000FBFBFB00DADADA00FAFAFA00DDDD
      DD00CECECE00A9A9A900000000000000000000000000A9A9A900BEBEBE00D2D2
      D200F1F1F100DADADA00FBFBFB00F0F0F000FBFBFB00DADADA00FAFAFA00DDDD
      DD00CECECE00A9A9A900000000000000000000000000B1B1B100B9B9B900B6B6
      B600B5B5B500B3B3B300B1B1B100AFAFAF00AFAFAF00AFAFAF00AFAFAF00AFAF
      AF00B0B0B000ACACAC009A9A9A000000000000000000B1B1B100B9B9B900B6B6
      B600B5B5B500B3B3B300B1B1B100AFAFAF00AFAFAF00AFAFAF00AFAFAF00AFAF
      AF00B0B0B000ACACAC009A9A9A000000000000000000A9A9A900CDCDCD00ECEC
      EC00F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F8F8
      F800D3D3D300A9A9A900000000000000000000000000A9A9A900CDCDCD00ECEC
      EC00F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F8F8
      F800D3D3D300A9A9A900000000000000000000000000B3B3B300BBBBBB00DADA
      DA00F8F8F800F8F8F800B3B3B300B1B1B100AFAFAF00ADADAD00B8B8B800AEAE
      AE00AFAFAF00ABABAB009A9A9A000000000000000000B3B3B300BBBBBB00B8B8
      B800B7B7B700BEBEBE00B3B3B300B1B1B100AFAFAF00ADADAD00F7F7F700F7F7
      F700D5D5D500ABABAB009A9A9A0000000000A9A9A900D6D6D600D8D8D800D8D8
      D800F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700D7D7
      D700ECECEC00D1D1D100A9A9A90000000000A9A9A900D6D6D600D8D8D800D8D8
      D800F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700D7D7
      D700ECECEC00D1D1D100A9A9A9000000000000000000B5B5B500C1C1C100BDBD
      BD00BABABA00F8F8F800B4B4B400B3B3B300B1B1B100BABABA00FBFBFB00AEAE
      AE00AFAFAF00ABABAB00999999000000000000000000B5B5B500C1C1C100BDBD
      BD00BABABA00FBFBFB00BEBEBE00B3B3B300B1B1B100AFAFAF00F7F7F700AEAE
      AE00AFAFAF00ABABAB009999990000000000A9A9A900E4E4E400E0E0E000F5F5
      F500F5F5F500F5F5F500E0E0E000EEEEEE00F5F5F500F5F5F500F5F5F500F4F4
      F400F2F2F200D6D6D600A9A9A90000000000A9A9A900E4E4E400E0E0E000F5F5
      F500F5F5F500F5F5F500E0E0E000EEEEEE00F5F5F500F5F5F500F5F5F500F4F4
      F400F2F2F200D6D6D600A9A9A9000000000000000000B5B5B500C9C9C900C2C2
      C200BEBEBE00F8F8F800B9B9B900B5B5B500BDBDBD00FBFBFB00F8F8F800AEAE
      AE00AFAFAF00ABABAB00999999000000000000000000B5B5B500C9C9C900C2C2
      C200BEBEBE00F9F9F900FBFBFB00BFBFBF00B3B3B300B1B1B100F7F7F700AEAE
      AE00AFAFAF00ABABAB009999990000000000A9A9A900E8E8E800D3D3D300EAEA
      EA00F5F5F500F4F4F400DEDEDE0082828200EDEDED00F4F4F400F3F3F300E8E8
      E800DCDCDC00D8D8D800A9A9A90000000000A9A9A900E8E8E800D3D3D300EAEA
      EA00F5F5F500F4F4F400DEDEDE0082828200EDEDED00F4F4F400F3F3F300E8E8
      E800DCDCDC00D8D8D800A9A9A9000000000000000000B5B5B500D3D3D300C6C6
      C600C0C0C000F9F9F900BABABA00D4D4D400FBFBFB00F9F9F900F7F7F700B1B1
      B100B1B1B100ABABAB009A9A9A000000000000000000B5B5B500D3D3D300C6C6
      C600C0C0C000F9F9F900F9F9F900FBFBFB00D4D4D400B5B5B500F7F7F700B1B1
      B100B1B1B100ABABAB009A9A9A0000000000A9A9A900F1F1F100DFDFDF00F3F3
      F300F3F3F300F4F4F400F3F3F300979797009C9C9C00EAEAEA00F1F1F100F1F1
      F100ECECEC00D6D6D600A9A9A90000000000A9A9A900F1F1F100DFDFDF00F3F3
      F300F3F3F300F4F4F400F3F3F300979797009C9C9C00EAEAEA00F1F1F100F1F1
      F100ECECEC00D6D6D600A9A9A9000000000000000000B5B5B500D9D9D900C9C9
      C900C2C2C200F9F9F900CFCFCF00FCFCFC00FAFAFA00F8F8F800F8F8F800B3B3
      B300B3B3B300ADADAD009C9C9C000000000000000000B5B5B500D9D9D900C9C9
      C900C2C2C200F9F9F900F8F8F800FAFAFA00FBFBFB00CCCCCC00F8F8F800B3B3
      B300B3B3B300ADADAD009C9C9C0000000000A9A9A900F1F1F100D8D8D800D4D4
      D400F2F2F200F3F3F300F2F2F200A2A2A200DDDDDD00A6A6A600EAEAEA00D2D2
      D200E2E2E200D7D7D700A9A9A90000000000A9A9A900F1F1F100D8D8D800D4D4
      D400F2F2F200F3F3F300F2F2F200A2A2A200DDDDDD00A6A6A600EAEAEA00D2D2
      D200E2E2E200D7D7D700A9A9A9000000000000000000B5B5B500DCDCDC00CCCC
      CC00C5C5C500F9F9F900C0C0C000DEDEDE00FBFBFB00F9F9F900F8F8F800B5B5
      B500B5B5B500B0B0B000A0A0A0000000000000000000B5B5B500DCDCDC00CCCC
      CC00C5C5C500F9F9F900FAFAFA00FBFBFB00DDDDDD00BBBBBB00F8F8F800B5B5
      B500B5B5B500B0B0B000A0A0A0000000000000000000A9A9A900E9E9E900E4E4
      E400F2F2F200F2F2F200F1F1F100ACACAC00EFEFEF00DFDFDF00BCBCBC00E2E2
      E200D9D9D900A9A9A900000000000000000000000000A9A9A900E9E9E900E4E4
      E400F2F2F200F2F2F200F1F1F100ACACAC00EFEFEF00DFDFDF00BCBCBC00E2E2
      E200D9D9D900A9A9A900000000000000000000000000B5B5B500DFDFDF00CFCF
      CF00C9C9C900F9F9F900C3C3C300C0C0C000CBCBCB00FBFBFB00F9F9F900B8B8
      B800B8B8B800B2B2B200A3A3A3000000000000000000B5B5B500DFDFDF00CFCF
      CF00C9C9C900FAFAFA00FCFCFC00CBCBCB00BFBFBF00BCBCBC00F8F8F800B8B8
      B800B8B8B800B2B2B200A3A3A3000000000000000000A9A9A900F2F2F200E6E6
      E600EBEBEB00D5D5D500F0F0F000D6D6D600EEEEEE00D0D0D000D9D9D900D2D2
      D200DADADA00A9A9A900000000000000000000000000A9A9A900F2F2F200E6E6
      E600EBEBEB00D5D5D500F0F0F000D6D6D600EEEEEE00D0D0D000D9D9D900D2D2
      D200DADADA00A9A9A900000000000000000000000000B5B5B500E3E3E300D5D5
      D500CBCBCB00FAFAFA00C5C5C500C3C3C300C2C2C200CBCBCB00FBFBFB00BBBB
      BB00BABABA00B5B5B500A7A7A7000000000000000000B5B5B500E3E3E300D5D5
      D500CBCBCB00FCFCFC00CFCFCF00C3C3C300C2C2C200BFBFBF00F8F8F800BBBB
      BB00BABABA00B5B5B500A7A7A700000000000000000000000000A9A9A900F6F6
      F600F7F7F700E5E5E500E0E0E000D2D2D200DDDDDD00D8D8D800DFDFDF00DEDE
      DE00A9A9A9000000000000000000000000000000000000000000A9A9A900F6F6
      F600F7F7F700E5E5E500E0E0E000D2D2D200DDDDDD00D8D8D800DFDFDF00DEDE
      DE00A9A9A90000000000000000000000000000000000B5B5B500E4E4E400E1E1
      E100DBDBDB00F4F4F400D2D2D200CDCDCD00C9C9C900C2C2C200CACACA00BCBC
      BC00BCBCBC00B8B8B800AAAAAA000000000000000000B5B5B500E4E4E400E1E1
      E100DBDBDB00DEDEDE00D2D2D200CDCDCD00C9C9C900C2C2C200ECECEC00BCBC
      BC00BCBCBC00B8B8B800AAAAAA0000000000000000000000000000000000A9A9
      A900A9A9A900F8F8F800F3F3F300ECECEC00EEEEEE00EAEAEA00A9A9A900A9A9
      A90000000000000000000000000000000000000000000000000000000000A9A9
      A900A9A9A900F8F8F800F3F3F300ECECEC00EEEEEE00EAEAEA00A9A9A900A9A9
      A9000000000000000000000000000000000000000000B5B5B500DCDCDC00E4E4
      E400E5E5E500E3E3E300DEDEDE00D8D8D800CFCFCF00C6C6C600BFBFBF00BDBD
      BD00BEBEBE00BABABA00ACACAC000000000000000000B5B5B500DCDCDC00E4E4
      E400E5E5E500E3E3E300DEDEDE00D8D8D800CFCFCF00C6C6C600BFBFBF00BDBD
      BD00BEBEBE00BABABA00ACACAC00000000000000000000000000000000000000
      000000000000A9A9A900A9A9A900A9A9A900A9A9A900A9A9A900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A9A9A900A9A9A900A9A9A900A9A9A900A9A9A900000000000000
      0000000000000000000000000000000000000000000000000000BBBBBB00C3C3
      C300C3C3C300C3C3C300C1C1C100BFBFBF00BBBBBB00B8B8B800B6B6B600B5B5
      B500B5B5B500B1B1B10000000000000000000000000000000000BBBBBB00C3C3
      C300C3C3C300C3C3C300C1C1C100BFBFBF00BBBBBB00B8B8B800B6B6B600B5B5
      B500B5B5B500B1B1B10000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BABABA00B9B9
      B900BABABA000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000ABABAB00ABABAB000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B9B9B900BDBDBD00BFBF
      BF00BDBDBD00B9B9B90000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AEAEAE00ADADAD00ADAD
      AD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADAD
      AD00ADADAD00AEAEAE00000000000000000000000000ABABAB00ABABAB000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000ABABAB00ABABAB00000000000000000000000000000000000000
      00000000000000000000AFAFAF00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BABABA00C2C2C200C1C1
      C100C2C2C200BFBFBF00BABABA00000000000000000000000000BABABA00BABA
      BA00BABABA00000000000000000000000000B2B2B200F9F9F900F6F6F600F4F4
      F400F2F2F200F0F0F000EFEFEF00EDEDED00ECECEC00ECECEC00ECECEC00ECEC
      EC00ECECEC00ECECEC00ACACAC000000000000000000ADADAD00ADADAD00ADAD
      AD00000000000000000000000000000000000000000000000000000000000000
      0000ADADAD00ADADAD0000000000000000000000000000000000000000000000
      000000000000AFAFAF00BBBBBB00B7B7B7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BABABA00FFFF
      FF00C5C5C500C5C5C500BABABA000000000000000000BABABA00BFBFBF00C5C5
      C500C2C2C200BABABA000000000000000000B2B2B200FBFBFB00E3E3E300E3E3
      E300E3E3E300F3F3F300B8B8B800B8B8B800B8B8B800ECECEC00A9A9A900A9A9
      A900A9A9A900ECECEC00ACACAC000000000000000000A3A3A300A3A3A300A3A3
      A300A3A3A300000000000000000000000000000000000000000000000000A3A3
      A300A3A3A300000000000000000000000000000000000000000000000000C8C8
      C800B3B3B300C3C3C300C7C7C700BFBFBF00B7B7B70000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BABA
      BA00BABABA00C9C9C900BABABA000000000000000000BBBBBB00C9C9C900C9C9
      C900C9C9C900C5C5C500BABABA0000000000B2B2B200FDFDFD00E3E3E300E3E3
      E300E3E3E300F5F5F500B8B8B800B8B8B800B8B8B800EEEEEE00A9A9A900A9A9
      A900A9A9A900ECECEC00ACACAC00000000000000000000000000A4A4A400A4A4
      A400A4A4A400A4A4A40000000000000000000000000000000000A4A4A400A4A4
      A400000000000000000000000000000000000000000000000000BABABA00BBBB
      BB00CBCBCB00DBDBDB00D3D3D300D3D3D300BFBFBF00C5C5C500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BBBBBB00CDCDCD00BBBBBB00000000000000000000000000BBBBBB00FFFF
      FF00CDCDCD00CDCDCD00BBBBBB0000000000B2B2B200FEFEFE00E3E3E300E3E3
      E300E3E3E300F8F8F800B8B8B800B8B8B800B8B8B800F0F0F000A9A9A900A9A9
      A900A9A9A900ECECEC00ACACAC00000000000000000000000000000000000000
      0000AFAFAF00AFAFAF00AFAFAF0000000000AFAFAF00AFAFAF00AFAFAF000000
      0000000000000000000000000000000000000000000000000000DFDFDF00DBDB
      DB00DBDBDB00D6D6D60000000000DADADA00DBDBDB00BBBBBB00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BBBBBB00D1D1D100BBBBBB0000000000000000000000000000000000BBBB
      BB00BBBBBB00D1D1D100BBBBBB0000000000B2B2B200FEFEFE00FEFEFE00FDFD
      FD00FCFCFC00FAFAFA00F8F8F800F7F7F700F4F4F400F2F2F200F0F0F000EEEE
      EE00EDEDED00ECECEC00ACACAC00000000000000000000000000000000000000
      000000000000B8B8B800B8B8B800B8B8B800B8B8B800B8B8B800000000000000
      000000000000000000000000000000000000000000000000000000000000E3E3
      E300DFDFDF00000000000000000000000000DCDCDC00D3D3D300BABABA000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BBBBBB00D5D5D500BBBBBB00000000000000000000000000000000000000
      0000BCBCBC00D5D5D500BBBBBB0000000000B2B2B200FEFEFE00D2D2D200D2D2
      D200D2D2D200FDFDFD00A6A6A600A6A6A600A6A6A600F5F5F500959595009595
      950095959500EEEEEE00ACACAC00000000000000000000000000000000000000
      00000000000000000000BFBFBF00BFBFBF00BFBFBF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D6D6D600CFCFCF00C2C2
      C200000000000000000000000000000000000000000000000000000000000000
      0000BCBCBC00DADADA00BCBCBC00000000000000000000000000000000000000
      0000BCBCBC00DADADA00BCBCBC0000000000B2B2B200FEFEFE00D2D2D200D2D2
      D200D2D2D200FEFEFE00A6A6A600A6A6A600A6A6A600F8F8F800959595009595
      950095959500EFEFEF00ACACAC00000000000000000000000000000000000000
      000000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DADADA00C7C7
      C700C3C3C3000000000000000000000000000000000000000000000000000000
      0000BCBCBC00DDDDDD00BCBCBC00000000000000000000000000000000000000
      0000BCBCBC00DDDDDD00BCBCBC0000000000B2B2B200FEFEFE00D2D2D200D2D2
      D200D2D2D200FEFEFE00A6A6A600A6A6A600A6A6A600FAFAFA00959595009595
      950095959500F2F2F200ABABAB00000000000000000000000000000000000000
      0000BFBFBF00BFBFBF00BFBFBF000000000000000000BFBFBF00BFBFBF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DDDD
      DD00C7C7C700C3C3C30000000000000000000000000000000000000000000000
      0000BCBCBC00E1E1E100BCBCBC00BCBCBC000000000000000000000000000000
      0000BCBCBC00E1E1E100BCBCBC0000000000B2B2B200FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FCFCFC00FAFAFA00F8F8
      F800F5F5F500F2F2F200ABABAB0000000000000000000000000000000000BFBF
      BF00BFBFBF00BFBFBF0000000000000000000000000000000000BFBFBF00BFBF
      BF00000000000000000000000000000000009797970000000000000000000000
      00008D8D8D008686860094949400A3A3A3000000000000000000949494008D8D
      8D0087878700BBBBBB00C2C2C200000000000000000000000000000000000000
      0000BCBCBC00E4E4E400E3E3E300E4E4E400BCBCBC00BCBCBC00BDBDBD000000
      0000BCBCBC00E4E4E400BCBCBC0000000000B2B2B200FEFEFE00BFBFBF00BFBF
      BF00BFBFBF00FEFEFE00DEDEDE00DEDEDE00DEDEDE00FEFEFE00BFBFBF00BFBF
      BF00BFBFBF00F5F5F500ABABAB00000000000000000000000000BFBFBF00BFBF
      BF00BFBFBF00000000000000000000000000000000000000000000000000BFBF
      BF00BFBFBF00000000000000000000000000C8C8C8008D8D8D00949494009494
      9400C1C1C100A3A3A30000000000C5C5C500AAAAAA00A3A3A300C8C8C8000000
      0000BBBBBB00B8B8B800CACACA00CFCFCF000000000000000000000000000000
      0000BDBDBD00BDBDBD00BDBDBD00E6E6E600E6E6E600E6E6E600E6E6E600BDBD
      BD00BDBDBD00E6E6E600BDBDBD0000000000B2B2B200FEFEFE00BFBFBF00BFBF
      BF00BFBFBF00FEFEFE00DEDEDE00DEDEDE00DEDEDE00FEFEFE00BFBFBF00BFBF
      BF00BFBFBF00F8F8F800ABABAB000000000000000000BFBFBF00BFBFBF00BFBF
      BF00000000000000000000000000000000000000000000000000000000000000
      000000000000BFBFBF00000000000000000000000000ABABAB00000000009393
      930000000000868686009B9B9B00B7B7B70000000000B2B2B200000000000000
      0000000000000000000000000000D6D6D6000000000000000000000000000000
      0000000000000000000000000000BDBDBD00BDBDBD00BDBDBD00E6E6E600E6E6
      E600E6E6E600E6E6E600BDBDBD0000000000B2B2B200FEFEFE00BFBFBF00BFBF
      BF00BFBFBF00FEFEFE00DEDEDE00DEDEDE00DEDEDE00FEFEFE00BFBFBF00BFBF
      BF00BFBFBF00FAFAFA00ABABAB0000000000BFBFBF00BFBFBF00BFBFBF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DDDDDD00BCBCBC00DDDD
      DD0000000000ACACAC0000000000CDCDCD00C9C9C900B0B0B000D0D0D0000000
      0000BABABA000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD0000000000B2B2B200FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FCFCFC00ABABAB0000000000BFBFBF00BFBFBF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BFBFBF000000
      000000000000AAAAAA00B4B4B400C5C5C5000000000000000000ADADAD00A7A7
      A700A2A2A2000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B2B2B200B2B2B200B2B2
      B200B2B2B200B2B2B200B2B2B200B2B2B200B2B2B200B2B2B200B2B2B200B2B2
      B200B2B2B200B2B2B20000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000868686008787
      8700898989008989890089898900898989008B8B8B008B8B8B008B8B8B008B8B
      8B00898989008787870000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000081818100818181000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008C8C8C008A8A8A008C8C
      8C00B1B1B100B1B1B100B0B0B000AFAFAF00A9A9A900A8A8A800A8A8A800A6A6
      A6008D8D8D00898989008B8B8B00000000000000000081818100818181000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008181810081818100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F0000000000000000000000000000000000000000008F8F8F00939393008F8F
      8F00D7D7D700D4D4D400D4D4D400D3D3D300D2D2D200D1D1D100D0D0D000CECE
      CE008E8E8E00919191008F8F8F00000000000000000081818100818181008181
      8100000000000000000000000000000000000000000000000000000000000000
      0000818181008181810000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000093939300000000009292
      9200DCDCDC00D8D8D800D8D8D800D7D7D700D5D5D500D3D3D300D2D2D200CFCF
      CF0090909000000000008F8F8F00000000000000000081818100818181008181
      8100818181000000000000000000000000000000000000000000000000008181
      8100818181000000000000000000000000000000000000000000868A86007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000868A86007F7F7F007F7F7F007F7F7F00868A8600000000000000
      000000000000000000000000000000000000000000009A9A9A009A9A9A009696
      9600DFDFDF00DDDDDD00DCDCDC00DCDCDC00DADADA00D8D8D800D5D5D500D1D1
      D100909090009393930090909000000000000000000000000000888888008282
      8200818181008181810000000000000000000000000000000000818181008181
      8100000000000000000000000000000000000000000000000000000000000000
      0000868A86007F7F7F007F7F7F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000868A86007F7F7F000000000000000000000000007F7F7F00868A86000000
      000000000000000000000000000000000000000000009D9D9D00000000009999
      9900E3E3E300E2E2E200E1E1E100E0E0E000DEDEDE00DCDCDC00D9D9D900D4D4
      D400939393000000000095959500000000000000000000000000000000000000
      0000818181008181810081818100000000008181810081818100818181000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000868A86007F7F7F00868A86000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007F7F7F007F7F7F000000000000000000000000007F7F7F007F7F7F000000
      00000000000000000000000000000000000000000000A1A1A1009F9F9F009B9B
      9B00E6E6E600E6E6E600E5E5E500E3E3E300E0E0E000DEDEDE00DCDCDC00D8D8
      D800969696009696960098989800000000000000000000000000000000000000
      0000000000008181810085858500858585008686860080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007F7F7F007F7F7F000000000000000000000000007F7F7F007F7F7F000000
      00000000000000000000000000000000000000000000A1A1A100000000009898
      9800A1A1A100A3A3A300A3A3A300A1A1A100A1A1A1009E9E9E009B9B9B009999
      990092929200000000009E9E9E00000000000000000000000000000000000000
      0000000000000000000083838300848484008989890000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000868A86007F7F7F00868A860000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007F7F7F007F7F7F000000000000000000000000007F7F7F007F7F7F000000
      00000000000000000000000000000000000000000000A0A0A000A2A2A2009D9D
      9D00AFAFAF00B0B0B000AFAFAF00AFAFAF00ABABAB00A8A8A800A8A8A800A6A6
      A600959595009898980098989800000000000000000000000000000000000000
      000000000000818181008888880086868600888888008B8B8B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000007F7F7F007F7F7F0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007F7F7F007F7F7F000000000000000000000000007F7F7F007F7F7F000000
      00000000000000000000000000000000000000000000A4A4A40000000000A3A3
      A300E5E5E500E3E3E300E4E4E400E4E4E400DFDFDF00DDDDDD00DDDDDD00DBDB
      DB0097979700000000009E9E9E00000000000000000000000000000000000000
      00008B8B8B00898989008787870000000000000000008B8B8B008C8C8C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000868A86007F7F7F00868A8600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007F7F7F007F7F7F000000000000000000000000007F7F7F007F7F7F000000
      00000000000000000000000000000000000000000000A1A1A100A5A5A500A7A7
      A700E4E4E400E3E3E300E4E4E400E4E4E400E1E1E100E0E0E000DFDFDF00DBDB
      DB009F9F9F009A9A9A0095959500000000000000000000000000000000008E8E
      8E00898989008D8D8D00000000000000000000000000000000008E8E8E008E8E
      8E00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007F7F7F007F7F7F00868A86000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007F7F7F007F7F7F000000000000000000000000007F7F7F007F7F7F000000
      00000000000000000000000000000000000000000000AEAEAE0000000000BABA
      BA00EAEAEA00E7E7E700E7E7E700E7E7E700E4E4E400E2E2E200E1E1E100DFDF
      DF00A9A9A90000000000A5A5A5000000000000000000000000008E8E8E008E8E
      8E008E8E8E000000000000000000000000000000000000000000000000008E8E
      8E008E8E8E000000000000000000000000000000000000000000000000000000
      00000000000000000000868A86007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F00868A86000000000000000000000000000000000000000000000000007F7F
      7F007F7F7F007F7F7F007F7F7F00000000007F7F7F007F7F7F007F7F7F007F7F
      7F000000000000000000000000000000000000000000B4B4B400C1C1C100C1C1
      C100EDEDED00EAEAEA00EAEAEA00E9E9E900E7E7E700E5E5E500E3E3E300DFDF
      DF00ABABAB00AAAAAA00A7A7A70000000000000000008E8E8E008E8E8E008E8E
      8E00000000000000000000000000000000000000000000000000000000000000
      0000000000008E8E8E0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C5C5C50000000000C2C2
      C200EEEEEE00ECECEC00ECECEC00EBEBEB00E9E9E900E7E7E700E5E5E500E2E2
      E200ACACAC0000000000B2B2B200000000008E8E8E008E8E8E008E8E8E000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C2C2C200B9B9B900C2C2
      C200D8D8D800D8D8D800D7D7D700D5D5D500CDCDCD00C9C9C900C6C6C600C1C1
      C100AEAEAE00A5A5A500ACACAC00000000008E8E8E008E8E8E00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CECECE00CBCB
      CB00C9C9C900CBCBCB00CBCBCB00C9C9C900C6C6C600C2C2C200BDBDBD00BABA
      BA00B8B8B800B8B8B80000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B0B0B000B0B0
      B000B0B0B000B0B0B000B0B0B000B0B0B000B0B0B000B0B0B000B0B0B000B0B0
      B000B0B0B000B0B0B000B0B0B0000000000000000000A6A6A600A6A6A600A6A6
      A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6
      A600A6A6A600A6A6A600A6A6A600000000000000000000000000B3B3B300B3B3
      B300B3B3B300B3B3B300B3B3B300B3B3B300B3B3B300B3B3B300B3B3B300B3B3
      B300B3B3B300B3B3B30000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B1B1B100BDBDBD00C1C1C100C1C1
      C100C1C1C100C1C1C100C1C1C100C1C1C100C1C1C100C1C1C100C1C1C100C1C1
      C100C1C1C100C1C1C100BBBBBB00B1B1B100A7A7A700B0B0B000BABABA00BABA
      BA00BABABA00BABABA00BABABA00B9B9B900B9B9B900BABABA00BABABA00BABA
      BA00BABABA00BBBBBB00AFAFAF00A7A7A7000000000000000000B3B3B300FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00B3B3B30000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B2B2B200BEBEBE00C3C3C300C3C3
      C300C3C3C300C4C4C400C3C3C3007F7F7F007F7F7F00C4C4C400C4C4C400C3C3
      C300C3C3C300C3C3C300BDBDBD00B2B2B200A7A7A700BABABA00B9B9B900BABA
      BA00BABABA00B9B9B900B7B7B700C5C5C500C8C8C800B8B8B800B9B9B900BABA
      BA00BABABA00B9B9B900BABABA00A7A7A7000000000000000000B3B3B300FCFC
      FC00888888008888880088888800888888008888880088888800888888008888
      8800FCFCFC00B3B3B30000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B4B4B400C6C6C600C6C6
      C600C7C7C700C7C7C700C7C7C7007F7F7F007F7F7F00C7C7C700C7C7C700C7C7
      C700C7C7C700C7C7C700B4B4B40000000000A8A8A800BABABA00BBBBBB00BBBB
      BB00BBBBBB00BABABA00B6B6B600F3F3F300FDFDFD00BABABA00B9B9B900BCBC
      BC00BBBBBB00BBBBBB00BBBBBB00A8A8A8000000000000000000B3B3B300FAFA
      FA0088888800FEFEFE00FEFEFE00FEFEFE00D9D9D900DADADA00FEFEFE008888
      8800FAFAFA00B3B3B30000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B5B5B500C1C1C100CACA
      CA00CACACA00CACACA00CACACA00CACACA00CACACA00CACACA00CACACA00CACA
      CA00CACACA00C1C1C100B5B5B50000000000A9A9A900BCBCBC00BDBDBD00BDBD
      BD00BDBDBD00BCBCBC00B6B6B600EEEEEE00F8F8F800BABABA00BBBBBB00BEBE
      BE00BDBDBD00BCBCBC00BDBDBD00A9A9A9000000000000000000B3B3B300F9F9
      F90088888800FEFEFE00FCFCFC00D1D1D10093939300BEBEBE00FEFEFE008888
      8800F9F9F900B3B3B30000000000000000000000000000000000000000007F83
      7F007F837F007F837F007F837F007F837F007F837F007F837F00868A86000000
      0000000000000000000000000000000000000000000000000000B7B7B700CECE
      CE00CECECE00CECECE00CECECE007F7F7F007F7F7F00CECECE00CECECE00CECE
      CE00CECECE00B7B7B7000000000000000000AAAAAA00BEBEBE00BEBEBE00BFBF
      BF00BFBFBF00BDBDBD00B7B7B700F0F0F000F7F7F700BCBCBC00BDBDBD00C0C0
      C000BFBFBF00BEBEBE00BEBEBE00AAAAAA000000000000000000B3B3B300F7F7
      F70088888800EAEAEA00B3B3B30093939300B2B2B20093939300EBEBEB008888
      8800F7F7F700B3B3B30000000000000000000000000000000000000000000000
      00007F837F007F837F007F837F0000000000000000007F837F007F7F7F00868A
      8600000000000000000000000000000000000000000000000000B9B9B900CACA
      CA00D2D2D200D2D2D200D2D2D2007F7F7F007F7F7F00D3D3D300D2D2D200D2D2
      D200CBCBCB00B8B8B8000000000000000000ABABAB00BFBFBF00C0C0C000C1C1
      C100C2C2C200C0C0C000B9B9B900EFEFEF00F8F8F800BCBCBC00BEBEBE00C2C2
      C200C0C0C000C0C0C000C0C0C000ABABAB000000000000000000B3B3B300F5F5
      F50088888800BBBBBB009B9B9B00DCDCDC00F6F6F6009E9E9E00B9B9B9008888
      8800F5F5F500B3B3B30000000000000000000000000000000000000000000000
      00007F837F007F837F007F837F0000000000000000007F837F007F7F7F00868A
      860000000000000000000000000000000000000000000000000000000000BABA
      BA00D7D7D700D7D7D700D7D7D7007F7F7F007F7F7F00D7D7D700D7D7D700D7D7
      D700BABABA00000000000000000000000000ACACAC00C1C1C100C2C2C200C3C3
      C300C4C4C400C2C2C200B5B5B500EDEDED00F9F9F900BFBFBF00C0C0C000C4C4
      C400C3C3C300C3C3C300C2C2C200ACACAC000000000000000000B3B3B300F3F3
      F30088888800F1F1F100EBEBEB00FEFEFE00FEFEFE00CACACA00939393008888
      8800F3F3F300B3B3B30000000000000000000000000000000000000000000000
      00007F837F007F837F007F837F0000000000000000007F837F007F7F7F00868A
      860000000000000000000000000000000000000000000000000000000000BCBC
      BC00D5D5D500DBDBDB00DBDBDB007F7F7F007F7F7F00DBDBDB00DBDBDB00D5D5
      D500BCBCBC00000000000000000000000000ADADAD00C8C8C800C9C9C900CACA
      CA00CACACA00C5C5C500D5D5D500F7F7F700F7F7F700C6C6C600C7C7C700CBCB
      CB00CACACA00C9C9C900C8C8C800ADADAD000000000000000000B3B3B300F2F2
      F20088888800FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00BDBDBD009393
      9300F2F2F200B3B3B30000000000000000000000000000000000000000000000
      00007F837F007F837F007F837F007F837F007F837F007F837F00868A86000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BEBEBE00DFDFDF00DFDFDF007F7F7F007F7F7F00DFDFDF00DFDFDF00BDBD
      BD0000000000000000000000000000000000AEAEAE00CBCBCB00CCCCCC00CCCC
      CC00CCCCCC00C6C6C600F4F4F400FFFFFF00F8F8F800CBCBCB00CBCBCB00CECE
      CE00CDCDCD00CDCDCD00CBCBCB00AEAEAE000000000000000000B3B3B300F0F0
      F000888888008888880088888800888888008888880088888800888888008989
      890093939300B3B3B30000000000000000000000000000000000000000000000
      00007F837F007F837F007F837F0000000000000000007F837F007F7F7F00868A
      8600000000000000000000000000000000000000000000000000000000000000
      0000BFBFBF00DBDBDB00E3E3E3007F7F7F007F7F7F00E3E3E300DBDBDB00BFBF
      BF0000000000000000000000000000000000AFAFAF00CDCDCD00CDCDCD00CECE
      CE00CECECE00CBCBCB00CECECE00CCCCCC00CDCDCD00C7C7C700CECECE00CFCF
      CF00CECECE00CECECE00CCCCCC00AFAFAF000000000000000000B3B3B300EEEE
      EE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00B7B7B700B5B5B500B4B4
      B400939393009393930093939300000000000000000000000000000000000000
      00007F837F007F837F007F837F0000000000000000007F837F007F7F7F00868A
      8600000000000000000000000000000000000000000000000000000000000000
      000000000000C0C0C000E6E6E6007F7F7F007F7F7F00E6E6E600C1C1C1000000
      000000000000000000000000000000000000B0B0B000CFCFCF00CFCFCF00D0D0
      D000D0D0D000CFCFCF00C7C7C700DEDEDE00EBEBEB00CDCDCD00CECECE00D0D0
      D000D1D1D100D0D0D000CFCFCF00B0B0B0000000000000000000B3B3B300ECEC
      EC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00A3A3A300A3A3A300A3A3
      A300A3A3A300B3B3B30093939300000000000000000000000000000000000000
      00007F837F007F837F007F837F0000000000000000007F837F007F7F7F00868A
      8600000000000000000000000000000000000000000000000000000000000000
      000000000000C2C2C200DFDFDF00E8E8E800E8E8E800DFDFDF00C2C2C2000000
      000000000000000000000000000000000000B1B1B100D0D0D000D1D1D100D1D1
      D100D2D2D200D1D1D100CBCBCB00F4F4F400FEFEFE00D1D1D100CFCFCF00D1D1
      D100D1D1D100D2D2D200D0D0D000B1B1B1000000000000000000B3B3B300EBEB
      EB00EBEBEB00EBEBEB00EBEBEB00EBEBEB00BABABA00F7F7F700F7F7F700DFDF
      DF00B3B3B3000000000000000000000000000000000000000000000000007F83
      7F007F837F007F837F007F837F007F837F007F837F007F837F00868A86000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C3C3C300E8E8E800E8E8E800C3C3C300000000000000
      000000000000000000000000000000000000B2B2B200D1D1D100D2D2D200D3D3
      D300D3D3D300D3D3D300D0D0D000D4D4D400D9D9D900CFCFCF00D2D2D200D3D3
      D300D3D3D300D2D2D200D2D2D200B2B2B2000000000000000000B3B3B300E9E9
      E900E9E9E900E9E9E900E9E9E900E9E9E900BABABA00F7F7F700D3D3D300B3B3
      B300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C4C4C400DFDFDF00DFDFDF00C4C4C400000000000000
      000000000000000000000000000000000000B2B2B200C3C3C300D2D2D200D2D2
      D200D2D2D200D2D2D200D2D2D200D0D0D000CFCFCF00D1D1D100D2D2D200D2D2
      D200D2D2D200D2D2D200C3C3C300B2B2B2000000000000000000B3B3B300E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700BABABA00D3D3D300B3B3B3000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C4C4C400C4C4C40000000000000000000000
      00000000000000000000000000000000000000000000B3B3B300B3B3B300B3B3
      B300B3B3B300B3B3B300B3B3B300B3B3B300B3B3B300B3B3B300B3B3B300B3B3
      B300B3B3B300B3B3B300B3B3B300000000000000000000000000B3B3B300B3B3
      B300B3B3B300B3B3B300B3B3B300B3B3B300B3B3B300B3B3B300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B2B2B200B0B0B000B0B0B000B2B2B200BDBDBD000000
      0000000000000000000000000000AFAFAF000000000000000000000000000000
      00000000000000000000A7A7A700A7A7A700A7A7A700A7A7A700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A7A7A700A7A7A700A7A7A700A7A7A700000000000000
      000000000000000000000000000000000000000000000000000000000000AFAF
      AF00000000000000000000000000000000000000000000000000000000000000
      0000AFAFAF000000000000000000000000000000000000000000000000000000
      0000B0B0B000BABABA00C3C3C300D8D8D800D8D8D800C3C3C300BABABA00B0B0
      B000BDBDBD0000000000AFAFAF00AFAFAF000000000000000000000000000000
      00000000000000000000A7A7A700B0B0B000B0B0B000A7A7A700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A7A7A700B0B0B000B0B0B000A7A7A700000000000000
      0000000000000000000000000000000000000000000000000000B0B0B000BFBF
      BF00B0B0B000000000000000000000000000000000000000000000000000B0B0
      B000BFBFBF00B0B0B0000000000000000000000000000000000000000000AFAF
      AF00CBCBCB00D8D8D800D8D8D800CBCBCB00CBCBCB00D8D8D800D8D8D800CBCB
      CB00BABABA00AFAFAF00CBCBCB00AFAFAF000000000000000000000000000000
      00000000000000000000A7A7A700B3B3B300B3B3B300A7A7A700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A7A7A700B3B3B300B3B3B300A7A7A700000000000000
      00000000000000000000000000000000000000000000B1B1B100C2C2C200C2C2
      C200C2C2C200B1B1B10000000000000000000000000000000000B0B0B000C2C2
      C200C1C1C100C2C2C200B1B1B100000000000000000000000000AFAFAF00CACA
      CA00D6D6D600BABABA00AFAFAF00AFAFAF00AFAFAF00AFAFAF00BABABA00CACA
      CA00D6D6D600CACACA00D6D6D600AEAEAE000000000000000000000000000000
      00000000000000000000A7A7A700B6B6B600B5B5B500A7A7A700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A7A7A700B6B6B600B5B5B500A7A7A700000000000000
      0000000000000000000000000000000000000000000000000000B2B2B200C5C5
      C500C6C6C600C5C5C500B1B1B1000000000000000000B1B1B100C5C5C500C5C5
      C500C5C5C500B3B3B300000000000000000000000000AFAFAF00C8C8C800D3D3
      D300BABABA00B2B2B2000000000000000000000000000000000000000000AEAE
      AE00C7C7C700D3D3D300D3D3D300AEAEAE000000000000000000000000000000
      00000000000000000000A7A7A700B8B8B800B8B8B800A7A7A700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A7A7A700B8B8B800B8B8B800A7A7A700000000000000
      000000000000000000000000000000000000000000000000000000000000B3B3
      B300C9C9C900C9C9C900C9C9C900B2B2B200B3B3B300C9C9C900C9C9C900C9C9
      C900B3B3B30000000000000000000000000000000000B7B7B700D0D0D000B9B9
      B900B2B2B2000000000000000000000000000000000000000000AEAEAE00C5C5
      C500D0D0D000D0D0D000D0D0D000ADADAD0000000000A7A7A700A7A7A700A7A7
      A700A7A7A700A7A7A700A7A7A700BABABA00BABABA00A7A7A700A7A7A700A7A7
      A700A7A7A700A7A7A700A7A7A7000000000000000000A7A7A700A7A7A700A7A7
      A700A7A7A700A7A7A700A7A7A700BABABA00BABABA00A7A7A700A7A7A700A7A7
      A700A7A7A700A7A7A700A7A7A700000000000000000000000000000000000000
      0000B4B4B400CDCDCD00CDCDCD00CECECE00CDCDCD00CDCDCD00CDCDCD00B4B4
      B40000000000000000000000000000000000B0B0B000C2C2C200CCCCCC00ADAD
      AD000000000000000000000000000000000000000000ADADAD00ADADAD00ADAD
      AD00ADADAD00ADADAD00ADADAD00ADADAD0000000000A7A7A700C1C1C100BEBE
      BE00BEBEBE00BEBEBE00BEBEBE00BDBDBD00BDBDBD00BDBDBD00BEBEBE00BEBE
      BE00BEBEBE00BFBFBF00A7A7A7000000000000000000A7A7A700C1C1C100BEBE
      BE00BEBEBE00BEBEBE00BEBEBE00BDBDBD00BDBDBD00BDBDBD00BEBEBE00BEBE
      BE00BEBEBE00BFBFBF00A7A7A700000000000000000000000000000000000000
      000000000000B5B5B500D2D2D200D2D2D200D2D2D200D2D2D200B5B5B5000000
      000000000000000000000000000000000000B0B0B000B0B0B000ACACAC00ACAC
      AC00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A7A7A700C5C5C500C2C2
      C200C2C2C200C2C2C200C1C1C100C0C0C000C0C0C000C0C0C000C2C2C200C2C2
      C200C2C2C200C3C3C300A7A7A7000000000000000000A7A7A700C5C5C500C2C2
      C200C2C2C200C2C2C200C1C1C100C0C0C000C0C0C000C0C0C000C2C2C200C2C2
      C200C2C2C200C3C3C300A7A7A700000000000000000000000000000000000000
      000000000000B6B6B600D6D6D600D6D6D600D6D6D600D6D6D600B6B6B6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000ADADAD00ADADAD00B0B0B000B0B0B00000000000A7A7A700A7A7A700A7A7
      A700A7A7A700A7A7A700A7A7A700C4C4C400C4C4C400A7A7A700A7A7A700A7A7
      A700A7A7A700A7A7A700A7A7A7000000000000000000A7A7A700A7A7A700A7A7
      A700A7A7A700A7A7A700A7A7A700C4C4C400C4C4C400A7A7A700A7A7A700A7A7
      A700A7A7A700A7A7A700A7A7A700000000000000000000000000000000000000
      0000B7B7B700DADADA00DADADA00DADADA00DADADA00DADADA00DADADA00B7B7
      B70000000000000000000000000000000000ADADAD00ADADAD00ADADAD00ADAD
      AD00ADADAD00ADADAD00ADADAD00000000000000000000000000000000000000
      0000ADADAD00CCCCCC00C2C2C200B0B0B0000000000000000000000000000000
      00000000000000000000A7A7A700C8C8C800C8C8C800A7A7A700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A7A7A700C8C8C800C8C8C800A7A7A700000000000000
      000000000000000000000000000000000000000000000000000000000000B8B8
      B800DEDEDE00DEDEDE00DEDEDE00B9B9B900B9B9B900DEDEDE00DEDEDE00DEDE
      DE00B8B8B800000000000000000000000000ADADAD00D0D0D000D0D0D000D0D0
      D000C5C5C500AEAEAE000000000000000000000000000000000000000000B2B2
      B200B9B9B900D0D0D000B7B7B700000000000000000000000000000000000000
      00000000000000000000A7A7A700CCCCCC00CBCBCB00A7A7A700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A7A7A700CCCCCC00CBCBCB00A7A7A700000000000000
      0000000000000000000000000000000000000000000000000000B9B9B900E1E1
      E100E1E1E100E1E1E100BABABA000000000000000000BABABA00E2E2E200E2E2
      E200E1E1E100B9B9B9000000000000000000AEAEAE00D3D3D300D3D3D300C7C7
      C700AEAEAE000000000000000000000000000000000000000000B2B2B200BABA
      BA00D3D3D300C8C8C800AFAFAF00000000000000000000000000000000000000
      00000000000000000000A7A7A700D0D0D000CFCFCF00A7A7A700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A7A7A700D0D0D000CFCFCF00A7A7A700000000000000
      00000000000000000000000000000000000000000000BABABA00E4E4E400E4E4
      E400E4E4E400BABABA0000000000000000000000000000000000BABABA00E4E4
      E400E4E4E400E4E4E400B9B9B90000000000AEAEAE00D6D6D600CACACA00D6D6
      D600CACACA00BABABA00AFAFAF00AFAFAF00AFAFAF00AFAFAF00BABABA00D6D6
      D600CACACA00AFAFAF0000000000000000000000000000000000000000000000
      00000000000000000000A7A7A700D7D7D700D6D6D600A7A7A700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A7A7A700D7D7D700D6D6D600A7A7A700000000000000
      0000000000000000000000000000000000000000000000000000BBBBBB00E7E7
      E700BBBBBB00000000000000000000000000000000000000000000000000BBBB
      BB00E7E7E700B9B9B9000000000000000000AFAFAF00CBCBCB00AFAFAF00BABA
      BA00CBCBCB00D8D8D800D8D8D800CBCBCB00CBCBCB00D8D8D800D8D8D800CBCB
      CB00AFAFAF000000000000000000000000000000000000000000000000000000
      00000000000000000000A7A7A700A7A7A700A7A7A700A7A7A700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A7A7A700A7A7A700A7A7A700A7A7A700000000000000
      000000000000000000000000000000000000000000000000000000000000BCBC
      BC00000000000000000000000000000000000000000000000000000000000000
      0000BBBBBB00000000000000000000000000AFAFAF00AFAFAF0000000000BDBD
      BD00B0B0B000BABABA00C3C3C300D8D8D800D8D8D800C3C3C300BABABA00B0B0
      B000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000AFAFAF0000000000000000000000
      000000000000BDBDBD00B2B2B200B0B0B000B0B0B000B2B2B200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A9A9A900A9A9A900A9A9A900A9A9A900A9A9A900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A7A7A700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A6A6A600000000000000000000000000A9A9A900A8A8A800A7A7A700A9A9
      A900A9A9A900A7A7A700A8A8A80000000000000000000000000000000000A9A9
      A900A9A9A900CBCBCB00D8D8D800DCDCDC00D6D6D600D0D0D000A9A9A900A9A9
      A900000000000000000000000000000000000000000000000000A0A0A0009F9F
      9F009D9D9D009A9A9A0099999900999999009999990099999900999999009999
      9900999999009595950000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A7A7A700A7A7A7000000
      000000000000000000000000000000000000000000000000000000000000A6A6
      A600A6A6A600A6A6A60000000000AFAFAF00A6A6A600C3C3C300D8D8D800B7B7
      B700B1B1B100D2D2D200B8B8B800A8A8A8000000000000000000A9A9A900BFBF
      BF00D0D0D000EAEAEA00F6F6F600E4E4E400FAFAFA00F2F2F200D8D8D800D9D9
      D900A9A9A90000000000000000000000000000000000AAAAAA00B2B2B200B0B0
      B000AEAEAE00ACACAC00ABABAB00AAAAAA00AAAAAA00AAAAAA00AAAAAA00AAAA
      AA00ACACAC00A4A4A40095959500000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A7A7A700E7E7E700A7A7
      A7000000000000000000000000000000000000000000A6A6A600A4A4A400A6A6
      A600A6A6A600A6A6A600A6A6A600B1B1B100BBBBBB00FDFDFD00EAEAEA00D3D3
      D300E3E3E300FFFFFF00D1D1D100B0B0B00000000000A9A9A900BEBEBE00D2D2
      D200F1F1F100DADADA00FBFBFB00F0F0F000FBFBFB00DADADA00FAFAFA00DDDD
      DD00CECECE00A9A9A900000000000000000000000000B1B1B100B9B9B900B6B6
      B600B4B4B400CBCBCB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00BEBEBE00AFAF
      AF00B0B0B000ACACAC0099999900000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A8A8A800F6F6F600E7E7
      E700A8A8A800000000000000000000000000A6A6A600A7A7A700B1B1B100B0B0
      B000A6A6A600A6A6A600CBCBCB00AFAFAF00D1D1D100FDFDFD00B1B1B100A9A9
      A900E5E5E500F4F4F400AEAEAE00AFAFAF0000000000A9A9A900CDCDCD00ECEC
      EC00F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F8F8
      F800D3D3D300A9A9A900000000000000000000000000B3B3B300BBBBBB00B8B8
      B800B6B6B600BCBBBA00C0BFBD00F6F6F600F1F1F100BBBAB800B6B5B400ADAD
      AD00AFAFAF00AAAAAA0099999900000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A8A8A800F6F6F600F6F6
      F600E7E7E700A8A8A8000000000000000000A6A6A600CDCDCD00EDEDED00E9E9
      E900A6A6A600D3D3D300EEEEEE00AEAEAE00CACACA00F9F9F900B1B1B100AAAA
      AA00D7D7D700F5F5F500B0B0B000AFAFAF00A9A9A900D6D6D600D8D8D800D8D8
      D800F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700D7D7
      D700ECECEC00D1D1D100A9A9A9000000000000000000B4B4B400C0C0C000BDBD
      BD00BABABA00B6B6B600B4B4B400F6F6F600ECECEC00AFAFAF00AEAEAE00ADAD
      AD00AFAFAF00AAAAAA0099999900000000000000000000000000A9A9A900A9A9
      A900A9A9A900A9A9A900A9A9A900A9A9A900A9A9A900BBBBBB00F6F6F600F6F6
      F600F6F6F600E8E8E800A9A9A90000000000DBDBDB00CFCFCF00C8C8C800CECE
      CE00E3E3E300F2F2F200ECECEC00B3B3B300B1B1B100E7E7E700D5D5D500ABAB
      AB00D8D8D800F6F6F600B2B2B200B1B1B100A9A9A900E4E4E400E0E0E000F5F5
      F500F5F5F500F5F5F500E0E0E000EEEEEE00F5F5F500F5F5F500F5F5F500F4F4
      F400F2F2F200D6D6D600A9A9A9000000000000000000B4B4B400C2C2C200C0C0
      C000BEBEBE00B9B9B900B9B9B900F6F6F600EDEDED00B1B1B100B0B0B000AEAE
      AE00AFAFAF00AAAAAA00999999000000000000000000AAAAAA00E9E9E900F6F6
      F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6
      F600F6F6F600F6F6F600E9E9E900AAAAAA00EFEFEF00E4E4E400B2B2B200BABA
      BA00F0F0F000F4F4F400D8D8D800B1B1B100AFAFAF00AFAFAF00D6D6D600D1D1
      D100E3E3E300F4F4F400B3B3B300B3B3B300A9A9A900E8E8E800D3D3D300EAEA
      EA00F5F5F500F4F4F400DEDEDE0082828200EDEDED00F4F4F400F3F3F300E8E8
      E800DCDCDC00D8D8D800A9A9A9000000000000000000B4B4B400C5C5C500C2C2
      C200C0C0C000BDBDBD00BABABA00F7F7F700EEEEEE00B5B5B500B1B1B100B1B1
      B100B0B0B000ABABAB009999990000000000ABABAB00EBEBEB00F6F6F600F6F6
      F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6
      F600F6F6F600F6F6F600F6F6F600ABABAB00F1F1F100D0D0D000B0B0B000D8D8
      D800F6F6F600E1E1E100B3B3B300B1B1B100B7B7B700CFCFCF00B4B4B400BDBD
      BD00E8E8E800F5F5F500B5B5B500B4B4B400A9A9A900F1F1F100DFDFDF00F3F3
      F300F3F3F300F4F4F400F3F3F300979797009C9C9C00EAEAEA00F1F1F100F1F1
      F100ECECEC00D6D6D600A9A9A9000000000000000000B4B4B400C9C9C900C5C5
      C500C2C2C200C0C0C000BBBBBB00F7F7F700EEEEEE00B6B6B600B5B5B500B3B3
      B300B3B3B300ADADAD009C9C9C0000000000ACACAC00F6F6F600F6F6F600F6F6
      F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6
      F600F6F6F600F6F6F600F6F6F600ACACAC00F0F0F000BBBBBB00C2C2C200F6F6
      F600E8E8E800B7B7B700BEBEBE00B6B6B600C1C1C100FFFFFF00C5C5C500B0B0
      B000DDDDDD00F5F5F500B6B6B600B5B5B500A9A9A900F1F1F100D8D8D800D4D4
      D400F2F2F200F3F3F300F2F2F200A2A2A200DDDDDD00A6A6A600EAEAEA00D2D2
      D200E2E2E200D7D7D700A9A9A9000000000000000000B4B4B400CBCBCB00C9C9
      C900C5C5C500C3C3C300C0C0C000F8F8F800EFEFEF00BABABA00B8B8B800B5B5
      B500B5B5B500AFAFAF009F9F9F0000000000ADADAD00F5F5F500F6F6F6009999
      9900999999009999990099999900999999009999990099999900999999009999
      990099999900F5F5F500F5F5F500ADADAD00F4F4F400E1E1E100D3D3D300EEEE
      EE00BCBCBC00B2B2B200E3E3E300BCBCBC00B6B6B600E9E9E900D9D9D900C0C0
      C000F4F4F400DEDEDE00B3B3B300B7B7B70000000000A9A9A900E9E9E900E4E4
      E400F2F2F200F2F2F200F1F1F100ACACAC00EFEFEF00DFDFDF00BCBCBC00E2E2
      E200D9D9D900A9A9A900000000000000000000000000B4B4B400C9C9C900D5D5
      D500EEEEEE00C5C5C500C3C3C300F8F8F800F0F0F000BCBCBC00BABABA00E9E9
      E900C5C5C500B2B2B200A3A3A30000000000AEAEAE00F9F9F900F9F9F900F9F9
      F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9
      F900F9F9F900F9F9F900F9F9F900AEAEAE00F4F4F400FAFAFA00E6E6E600B9B9
      B900B9B9B900DDDDDD00E0E0E000BEBEBE00B5B5B500B9B9B900D2D2D200D8D8
      D800D2D2D200B8B8B800B7B7B700B7B7B70000000000A9A9A900F2F2F200E6E6
      E600EBEBEB00D5D5D500F0F0F000D6D6D600EEEEEE00D0D0D000D9D9D900D2D2
      D200DADADA00A9A9A900000000000000000000000000B4B4B400C9C9C900CCCC
      CC00FCFCFC00E8E8E800E2E2E200F8F8F800F4F4F400DFDFDF00E6E6E600FBFB
      FB00C3C3C300B5B5B500A6A6A60000000000AFAFAF00FCFCFC00FCFCFC009999
      9900999999009999990099999900999999009999990099999900999999009999
      990099999900FCFCFC00FCFCFC00AFAFAF00F7F7F700F7F7F700C9C9C900B1B1
      B100E6E6E600FAFAFA00D3D3D300E0E0E000B6B6B600B5B5B500B5B5B500B5B5
      B500B5B5B500B5B5B500B5B5B500000000000000000000000000A9A9A900F6F6
      F600F7F7F700E5E5E500E0E0E000D2D2D200DDDDDD00D8D8D800DFDFDF00DEDE
      DE00A9A9A90000000000000000000000000000000000B4B4B400C9C9C900CCCC
      CC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00C0C0C000B7B7B700AAAAAA0000000000AFAFAF00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00AFAFAF00F8F8F800D1D1D100AFAFAF00DFDF
      DF00FDFDFD00D3D3D300B2B2B200D3D3D300FAFAFA0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A9A9
      A900A9A9A900F8F8F800F3F3F300ECECEC00EEEEEE00EAEAEA00A9A9A900A9A9
      A9000000000000000000000000000000000000000000B5B5B500C9C9C900C9C9
      C900C9C9C900C9C9C900C9C9C900C9C9C900C5C5C500C3C3C300BFBFBF00BDBD
      BD00BEBEBE00B9B9B900ACACAC0000000000B0B0B000EFEFEF00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00EFEFEF00B0B0B000F9F9F900C4C4C400D2D2D200FEFE
      FE00FAFAFA00C2C2C200BABABA00CCCCCC00FAFAFA0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A9A9A900A9A9A900A9A9A900A9A9A900A9A9A900000000000000
      0000000000000000000000000000000000000000000000000000BBBBBB00BBBB
      BB00BBBBBB00BBBBBB00BBBBBB00BBBBBB00BBBBBB00B8B8B800B6B6B600B5B5
      B500B5B5B500B1B1B100000000000000000000000000B0B0B000EFEFEF00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00EFEFEF00B0B0B00000000000FBFBFB00F4F4F400F8F8F800FEFE
      FE00FDFDFD00EFEFEF00F7F7F700FDFDFD00FDFDFD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B0B0B000B0B0
      B000B0B0B000B0B0B000B0B0B000B0B0B000B0B0B000B0B0B000B0B0B000B0B0
      B000B0B0B000B0B0B000000000000000000000000000FCFCFC00FBFBFB00FBFB
      FB00FBFBFB00FCFCFC00FCFCFC00FCFCFC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080008080
      800080808000A0A0A000A0A0A000A0A0A000A0A0A000A0A0A000A0A0A000A0A0
      A000A0A0A000A0A0A000A0A0A000000000000000000077777700BDBDBD000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B3B3B300B3B3
      B300B3B3B300B3B3B300B3B3B300B3B3B300B3B3B300B3B3B300B3B3B300B3B3
      B300B3B3B300B3B3B30000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000B7B7B700B3B3
      B300AFAFAF00A0A0A000FDFDFD00FEFEFE00FDFDFD00FDFDFD00FDFDFD00FDFD
      FD00FDFDFD00FDFDFD00A0A0A00000000000ABABAB00979797008B8B8B00C1C1
      C100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B3B3B300FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00B3B3B3000000000000000000000000000000000000000000A8A8
      A800A8A8A800A8A8A800A8A8A800A8A8A800A8A8A800A8A8A800000000000000
      0000000000000000000000000000000000000000000080808000BCBCBC00B8B8
      B800B5B5B500A0A0A000FBFBFB00929292009292920092929200929292009292
      920092929200FBFBFB00A0A0A00000000000B8B8B800BCBCBC00989898008A8A
      8A00C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B3B3B300FCFC
      FC00888888008888880088888800888888008888880088888800888888008888
      8800FCFCFC00B3B3B3000000000000000000000000000000000000000000AAAA
      AA00AAAAAA00AAAAAA00AAAAAA00AAAAAA00AAAAAA00AAAAAA00000000000000
      0000000000000000000000000000000000000000000080808000C1C1C100BEBE
      BE00BABABA00A0A0A000F8F8F800F5F5F500F6F6F600F7F7F700F9F9F900FAFA
      FA00FBFBFB00F8F8F800A0A0A0000000000000000000BBBBBB00BCBCBC009595
      95008B8B8B00C2C2C20000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B3B3B300FAFA
      FA0088888800FEFEFE00FEFEFE00FEFEFE00D9D9D900DADADA00FEFEFE008888
      8800FAFAFA00B3B3B30000000000000000000000000000000000000000000000
      000000000000ADADAD00ADADAD00ADADAD000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000C7C7C700C3C3
      C300C0C0C000A0A0A000F5F5F500929292009292920092929200929292009292
      920092929200F5F5F500A0A0A000000000000000000000000000BBBBBB00BABA
      BA00969696008C8C8C00BABABA00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B3B3B300F9F9
      F90088888800FEFEFE00FCFCFC00D1D1D10093939300BEBEBE00FEFEFE008888
      8800F9F9F900B3B3B30000000000000000000000000000000000000000000000
      000000000000B0B0B000B0B0B000B0B0B0000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000CCCCCC00C8C8
      C800C4C4C400A0A0A000F1F1F100F1F1F100F1F1F100F2F2F200F2F2F200F4F4
      F400F5F5F500F1F1F100A0A0A00000000000000000000000000000000000BCBC
      BC00B9B9B900949494007E7E7E000000000097979700AAAAAA00ABABAB00A5A5
      A500000000000000000000000000000000000000000000000000B3B3B300F7F7
      F70088888800EAEAEA00B3B3B30093939300B2B2B20093939300EBEBEB008888
      8800F7F7F700B3B3B30000000000000000000000000000000000000000000000
      000000000000B3B3B300B3B3B300B3B3B3000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000D1D1D100CDCD
      CD00CACACA00A0A0A000EEEEEE0092929200929292009292920092929200B5B5
      B500B5B5B500C8C8C800A0A0A000000000000000000000000000000000000000
      0000BEBEBE00D1D1D100A8A8A800A3A3A300D4D4D400F1F1F100F2F2F200EBEB
      EB00C5C5C5009D9D9D0000000000000000000000000000000000B3B3B300F5F5
      F50088888800BBBBBB009B9B9B00DCDCDC00F6F6F6009E9E9E00B9B9B9008888
      8800F5F5F500B3B3B30000000000000000000000000000000000000000000000
      000000000000B6B6B600B6B6B600B6B6B600B6B6B600B6B6B600B6B6B600B6B6
      B600000000000000000000000000000000000000000080808000D5D5D500D2D2
      D200CFCFCF00A0A0A000EBEBEB00EBEBEB00EBEBEB00EBEBEB00EBEBEB00B5B5
      B500B6B6B600BEBEBE00B3B3B300000000000000000000000000000000000000
      00000000000000000000B1B1B100DDDDDD00EBEBEB00ECECEC00EDEDED00F2F2
      F200FDFDFD00E3E3E30096969600000000000000000000000000B3B3B300F3F3
      F30088888800F1F1F100EBEBEB00FEFEFE00FEFEFE00CACACA00939393008888
      8800F3F3F300B3B3B30000000000000000000000000000000000000000000000
      000000000000BABABA00BABABA00BABABA00BABABA00BABABA00BABABA00BABA
      BA00BABABA000000000000000000000000000000000080808000DADADA00D6D6
      D600D3D3D300A0A0A000E8E8E800E8E8E800E8E8E800E8E8E800E5E5E500B7B7
      B700FEFEFE00B3B3B30000000000000000000000000000000000000000000000
      00000000000000000000A9A9A900D1D1D100E7E7E700EDEDED00F1F1F100FBFB
      FB00FEFEFE00FEFEFE00B1B1B100000000000000000000000000B3B3B300F2F2
      F20088888800FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00BDBDBD009393
      9300F2F2F200B3B3B30000000000000000000000000000000000000000000000
      000000000000BDBDBD00BDBDBD00BDBDBD000000000000000000BDBDBD00BDBD
      BD00BDBDBD00BDBDBD0000000000000000000000000080808000DDDDDD00DBDB
      DB00D7D7D700A0A0A000E7E7E700E7E7E700E7E7E700E7E7E700D4D4D400C3C3
      C300B3B3B3008080800000000000000000000000000000000000000000000000
      000000000000A9A9A900D5D5D500C1C1C100E3E3E300EEEEEE00F1F1F100FBFB
      FB00FBFBFB00F4F4F400DCDCDC00A2A2A2000000000000000000B3B3B300F0F0
      F000888888008888880088888800888888008888880088888800888888008989
      890093939300B3B3B30000000000000000000000000000000000000000000000
      000000000000C0C0C000C0C0C000C0C0C000000000000000000000000000C0C0
      C000C0C0C000C0C0C00000000000000000000000000080808000E0E0E000DDDD
      DD00DCDCDC00A0A0A000A0A0A000A0A0A000A0A0A000A0A0A000A0A0A000B3B3
      B300C4C4C4008080800000000000000000000000000000000000000000000000
      000000000000A9A9A900D6D6D600B7B7B700D2D2D200EBEBEB00EFEFEF00F1F1
      F100F1F1F100EFEFEF00E2E2E200A4A4A4000000000000000000B3B3B300EEEE
      EE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00B7B7B700B5B5B500B4B4
      B400939393009393930093939300000000000000000000000000000000000000
      000000000000C4C4C400C4C4C400C4C4C400000000000000000000000000C4C4
      C400C4C4C400C4C4C40000000000000000000000000080808000E3E3E300E1E1
      E100DFDFDF00DFDFDF00DCDCDC00D9D9D900D4D4D400D0D0D000CBCBCB00C7C7
      C700C4C4C4008080800000000000000000000000000000000000000000000000
      000000000000A4A4A400D9D9D900C2C2C200C3C3C300D8D8D800EBEBEB00EEEE
      EE00EDEDED00EFEFEF00CECECE009E9E9E000000000000000000B3B3B300ECEC
      EC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00A3A3A300A3A3A300A3A3
      A300A3A3A300B3B3B30093939300000000000000000000000000000000000000
      000000000000C6C6C600C6C6C600C6C6C600000000000000000000000000C6C6
      C600C6C6C600C6C6C60000000000000000000000000080808000E4E4E400E4E4
      E40080808000808080008080800080808000808080008080800080808000CDCD
      CD00CACACA008080800000000000000000000000000000000000000000000000
      00000000000000000000C1C1C100F2F2F200D7D7D700C3C3C300CDCDCD00DBDB
      DB00E3E3E300E9E9E9009F9F9F00000000000000000000000000B3B3B300EBEB
      EB00EBEBEB00EBEBEB00EBEBEB00EBEBEB00BABABA00F7F7F700F7F7F700DFDF
      DF00B3B3B3000000000000000000000000000000000000000000000000000000
      000000000000C9C9C900C9C9C900C9C9C9000000000000000000C9C9C900C9C9
      C900C9C9C900C9C9C90000000000000000000000000080808000E4E4E400E4E4
      E40080808000BABABA00BABABA00BABABA00BABABA00B8B8B80080808000D3D3
      D300CECECE008080800000000000000000000000000000000000000000000000
      000000000000000000009D9D9D00E2E2E200F8F8F800CECECE00C0C0C000CCCC
      CC00DADADA00B7B7B7009F9F9F00000000000000000000000000B3B3B300E9E9
      E900E9E9E900E9E9E900E9E9E900E9E9E900BABABA00F7F7F700D3D3D300B3B3
      B30000000000000000000000000000000000000000000000000000000000CBCB
      CB00CBCBCB00CBCBCB00CBCBCB00CBCBCB00CBCBCB00CBCBCB00CBCBCB00CBCB
      CB00CBCBCB000000000000000000000000000000000000000000808080008080
      800080808000CDCDCD00E9E9E900E8E8E800E8E8E800BCBCBC00808080008080
      8000808080000000000000000000000000000000000000000000000000000000
      000000000000000000000000000096969600B3B3B300D3D3D300D0D0D000C9C9
      C9009F9F9F009F9F9F0000000000000000000000000000000000B3B3B300E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700BABABA00D3D3D300B3B3B3000000
      000000000000000000000000000000000000000000000000000000000000CDCD
      CD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCD
      CD00000000000000000000000000000000000000000000000000000000000000
      0000000000008080800080808000808080008080800080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A2A2A200A3A3A3009F9F
      9F00000000000000000000000000000000000000000000000000B3B3B300B3B3
      B300B3B3B300B3B3B300B3B3B300B3B3B300B3B3B300B3B3B300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000088888800898989008787870000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A0A0A000A0A0A000A0A0A000A0A0A000A0A0A000A0A0A000A0A0
      A000A0A0A000A0A0A000A0A0A000000000000000000000000000878787008787
      8700828282007F7F7F007E7E7E007E7E7E007E7E7E007E7E7E007E7E7E007E7E
      7E007E7E7E007979790000000000000000000000000000000000878787008787
      8700828282007F7F7F007E7E7E007E7E7E007E7E7E007E7E7E007E7E7E007E7E
      7E007E7E7E007979790000000000000000000000000000000000000000000000
      0000000000008787870088888800878787008888880000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A0A0A000FDFDFD00FEFEFE00FDFDFD00FDFDFD00FDFDFD00FDFD
      FD00FDFDFD00FDFDFD00A0A0A000000000000000000095959500A0A0A0009E9E
      9E009B9B9B009898980096969600959595009696960096969600969696009696
      9600989898008D8D8D0079797900000000000000000095959500A0A0A0009E9E
      9E009B9B9B009898980096969600959595009696960096969600969696009696
      9600989898008D8D8D0079797900000000000000000000000000000000000000
      0000000000008989890000000000000000008787870087878700000000008787
      8700898989000000000000000000000000000000000000000000000000000000
      000000000000A0A0A000FBFBFB00929292009292920092929200929292009292
      920092929200FBFBFB00A0A0A00000000000000000009F9F9F00AAAAAA00A6A6
      A600A4A4A400A2A2A2009F9F9F009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009E9E9E00989898007E7E7E0000000000000000009F9F9F00AAAAAA00A6A6
      A600A4A4A400A2A2A2009F9F9F009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009E9E9E00989898007E7E7E00000000000000000000000000000000000000
      0000000000008989890000000000000000008787870000000000878787008787
      8700878787008888880000000000000000000000000000000000000000000000
      000000000000A0A0A000F8F8F800FAFAFA00F8F8F800F8F8F800F8F8F800F8F8
      F800F8F8F800F8F8F800A0A0A0000000000000000000A2A2A200ADADAD00A9A9
      A900A7A7A700A3A3A300BBBBBB00C5C5C500C4C4C400BCBCBC00A8A8A8009A9A
      9A009C9C9C00969696007E7E7E000000000000000000A2A2A200ADADAD00A9A9
      A900A7A7A700B1B1B100C0C0C000C6C6C600C4C4C400B6B6B6009A9A9A009A9A
      9A009C9C9C00969696007E7E7E00000000000000000000000000000000000000
      0000000000008888880087878700878787008787870000000000878787000000
      000000000000888888000000000000000000A0A0A000A0A0A000A0A0A000A0A0
      A000A0A0A000A0A0A000F5F5F500929292009292920092929200929292009292
      920092929200F5F5F500A0A0A0000000000000000000A4A4A400B5B5B500B0B0
      B000ABABAB00A7A7A700E5E5E500FFFFFF00FFFFFF00FFFFFF00FFFFFF00C1C1
      C1009C9C9C00969696007E7E7E000000000000000000A4A4A400B5B5B500B0B0
      B000CCCCCC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E2E2E2009B9B9B009A9A
      9A009C9C9C00969696007E7E7E00000000000000000000000000000000000000
      0000000000000000000087878700898989008888880087878700888888000000
      000000000000878787000000000000000000A0A0A000FDFDFD00FEFEFE00FDFD
      FD00FDFDFD00A0A0A000F3F3F300F4F4F400F3F3F300F3F3F300F3F3F300F3F3
      F300F3F3F300F3F3F300A0A0A0000000000000000000A4A4A400C1C1C100B7B7
      B700B1B1B100ABABAB00AAAAAA00ADADAD00ADADAD00ADADAD00DBDBDB00FFFF
      FF009C9C9C00969696007E7E7E000000000000000000A4A4A400C1C1C100B7B7
      B700FFFFFF00E1E1E100B3B3B300AFAFAF00ABABAB00A3A3A3009E9E9E009B9B
      9B009C9C9C00969696007E7E7E00000000000000000000000000000000000000
      0000000000000000000000000000878787009393930087878700898989008888
      880088888800878787000000000000000000A0A0A000FBFBFB00929292009292
      920092929200A0A0A000F1F1F100929292009292920092929200929292009292
      920092929200F1F1F100A0A0A0000000000000000000A4A4A400CECECE00BDBD
      BD00B4B4B400B0B0B000E7E7E700A9A9A900A7A7A700A4A4A400AAAAAA00FFFF
      FF009F9F9F00979797007E7E7E000000000000000000A4A4A400CECECE00BDBD
      BD00FFFFFF00B7B7B700ABABAB00A9A9A900A7A7A700E4E4E400A1A1A1009F9F
      9F009F9F9F00979797007E7E7E00000000000000000000000000000000000000
      00000000000000000000000000008F8F8F008686860079797900878787008787
      870087878700000000000000000000000000A0A0A000F8F8F800FAFAFA00F8F8
      F800F8F8F800A0A0A000EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00D9D9
      D900D8D8D800C8C8C800A0A0A0000000000000000000A4A4A400D7D7D700C1C1
      C100B6B6B600E6E6E600FFFFFF00ADADAD00AAAAAA00A7A7A700C9C9C900FFFF
      FF00A1A1A1009A9A9A00818181000000000000000000A4A4A400D7D7D700C1C1
      C100FFFFFF00D1D1D100AEAEAE00ADADAD00AAAAAA00FFFFFF00E1E1E100A2A2
      A200A1A1A1009A9A9A0081818100000000000000000000000000000000000000
      000000000000000000008A8A8A00A7A7A7008A8A8A008A8A8A00000000000000
      000000000000000000000000000000000000A0A0A000F5F5F500929292009292
      920092929200A0A0A000EBEBEB00EBEBEB00EBEBEB00EBEBEB00EBEBEB00B5B5
      B500B6B6B600BEBEBE00B3B3B3000000000000000000A4A4A400DCDCDC00C5C5
      C500F3F3F300FFFFFF00FFFFFF00FFFFFF00F7F7F700F6F6F600FFFFFF00DEDE
      DE00A5A5A5009D9D9D00878787000000000000000000A4A4A400DCDCDC00C5C5
      C500E7E7E700FFFFFF00F7F7F700F7F7F700FFFFFF00FFFFFF00FFFFFF00ECEC
      EC00A5A5A5009D9D9D0087878700000000000000000000000000000000000000
      0000000000008A8A8A00D2D2D2008A8A8A00A8A8A8008A8A8A00000000000000
      000000000000000000000000000000000000A0A0A000F3F3F300F4F4F400F3F3
      F300F3F3F300A0A0A000E8E8E800E8E8E800E8E8E800E8E8E800E5E5E500B7B7
      B700FEFEFE00B3B3B300000000000000000000000000A4A4A400DFDFDF00C9C9
      C900F1F1F100FFFFFF00FFFFFF00F6F6F600E7E7E700E6E6E600CDCDCD00A9A9
      A900A8A8A800A1A1A1008C8C8C000000000000000000A4A4A400DFDFDF00C9C9
      C900C0C0C000D7D7D700E9E9E900E8E8E800F5F5F500FFFFFF00FFFFFF00E9E9
      E900A8A8A800A1A1A1008C8C8C00000000000000000000000000000000000000
      00008A8A8A00EDEDED008A8A8A00A6A6A600D0D0D0008A8A8A00000000000000
      000000000000000000000000000000000000A0A0A000F1F1F100929292009292
      920092929200A0A0A000E7E7E700E7E7E700E7E7E700E7E7E700D4D4D400C3C3
      C300B3B3B30000000000000000000000000000000000A4A4A400E5E5E500D2D2
      D200C4C4C400E9E9E900FFFFFF00B8B8B800B6B6B600B2B2B200AFAFAF00ADAD
      AD00ABABAB00A4A4A400909090000000000000000000A4A4A400E5E5E500D2D2
      D200C4C4C400C0C0C000BBBBBB00B8B8B800B6B6B600FFFFFF00E1E1E100ADAD
      AD00ABABAB00A4A4A40090909000000000000000000000000000000000008A8A
      8A00FFFFFF008A8A8A00000000008A8A8A00E0E0E0008A8A8A00000000000000
      000000000000000000000000000000000000A0A0A000EEEEEE00EEEEEE00EEEE
      EE00EEEEEE00A0A0A000A0A0A000A0A0A000A0A0A000A0A0A000A0A0A000B3B3
      B3000000000000000000000000000000000000000000A4A4A400E6E6E600E3E3
      E300DADADA00D5D5D500ECECEC00C7C7C700C0C0C000B6B6B600B1B1B100AFAF
      AF00AFAFAF00A8A8A800959595000000000000000000A4A4A400E6E6E600E3E3
      E300DADADA00D5D5D500CECECE00C7C7C700C0C0C000E1E1E100B1B1B100AFAF
      AF00AFAFAF00A8A8A80095959500000000000000000000000000000000008A8A
      8A008A8A8A0000000000000000008A8A8A00F1F1F1008A8A8A00000000000000
      000000000000000000000000000000000000A0A0A000EBEBEB00EBEBEB00EBEB
      EB00EBEBEB00EBEBEB00B5B5B500B6B6B600BEBEBE00B3B3B300000000000000
      00000000000000000000000000000000000000000000A4A4A400DBDBDB00E7E7
      E700E8E8E800E5E5E500DEDEDE00D5D5D500C9C9C900BCBCBC00B3B3B300B0B0
      B000B1B1B100ABABAB00989898000000000000000000A4A4A400DBDBDB00E7E7
      E700E8E8E800E5E5E500DEDEDE00D5D5D500C9C9C900BCBCBC00B3B3B300B0B0
      B000B1B1B100ABABAB0098989800000000000000000000000000000000008A8A
      8A000000000000000000000000008A8A8A00FFFFFF008A8A8A00000000000000
      000000000000000000000000000000000000A0A0A000E8E8E800E8E8E800E8E8
      E800E8E8E800E5E5E500B7B7B700FEFEFE00B3B3B30000000000000000000000
      0000000000000000000000000000000000000000000000000000ADADAD00B8B8
      B800B9B9B900B9B9B900B6B6B600B3B3B300ADADAD00A8A8A800A6A6A600A5A5
      A500A4A4A4009F9F9F0000000000000000000000000000000000ADADAD00B8B8
      B800B9B9B900B9B9B900B6B6B600B3B3B300ADADAD00A8A8A800A6A6A600A5A5
      A500A4A4A4009F9F9F0000000000000000000000000000000000000000000000
      00000000000000000000000000008A8A8A008A8A8A0000000000000000000000
      000000000000000000000000000000000000A0A0A000E7E7E700E7E7E700E7E7
      E700E7E7E700D4D4D400C3C3C300B3B3B3000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008A8A8A000000000000000000000000000000
      000000000000000000000000000000000000A0A0A000A0A0A000A0A0A000A0A0
      A000A0A0A000A0A0A000B3B3B300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B3B3B300B3B3
      B300B3B3B300B3B3B300B3B3B300B3B3B300B3B3B300B3B3B300B3B3B300B3B3
      B300B3B3B300B3B3B30000000000000000000000000091919100919191009191
      9100919191009191910091919100919191009191910091919100919191009191
      9100919191009191910000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B3B3B300FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00B3B3B3000000000000000000919191009D9D9D00C4C4C400D4D4
      D400C7C7C700C7C7C700C7C7C700C7C7C700C6C6C600C7C7C700C6C6C600C7C7
      C700A8A8A80091919100000000000000000000000000000000008E8E8E008E8E
      8E00BEBEBE00BEBEBE00BEBEBE00BEBEBE00BEBEBE00BEBEBE00BEBEBE008686
      86008E8E8E000000000000000000000000000000000000000000000000000000
      000000000000840000008400000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000B3B3B300FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00B3B3B300000000000000000091919100B5B5B500A5A5A500DFDF
      DF00CBCBCB00CBCBCB00CBCBCB00CBCBCB00CBCBCB00CBCBCB00CBCBCB00CACA
      CA00AAAAAA00CDCDCD009191910000000000000000008E8E8E00B8B8B800AEAE
      AE00ECECEC008383830083838300F0F0F000EEEEEE00E8E8E800DADADA007E7E
      7E009A9A9A008E8E8E0000000000000000000000000000000000000000000000
      00008400000084000000FFFFFF00000000000000000000000000848484008484
      8400848484008484840000000000000000000000000000000000B3B3B300FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00B3B3B300000000000000000091919100CCCCCC0089898900E5E5
      E500D0D0D000D0D0D000D0D0D000D0D0D000D0D0D000D0D0D000CFCFCF00CFCF
      CF00ACACAC00E4E4E4009191910000000000000000008E8E8E00B4B4B400ACAC
      AC00F0F0F0008383830083838300EDEDED00F0F0F000ECECEC00DCDCDC007F7F
      7F00999999008E8E8E0000000000000000000000000000000000840000008400
      0000FFFFFF000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000B3B3B300F5F5
      F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5
      F500F5F5F500B3B3B300000000000000000091919100D0D0D00094949400D9D9
      D900D9D9D900D4D4D400D4D4D400D4D4D400D4D4D400D4D4D400D4D4D400D4D4
      D400AFAFAF00E6E6E6009191910000000000000000008E8E8E00B4B4B400ABAB
      AB00F2F2F2008383830083838300EAEAEA00EFEFEF00EEEEEE00E0E0E0007C7C
      7C00989898008E8E8E000000000000000000000000000000000084000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B3B3B300F5F5
      F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5
      F500F5F5F500B3B3B300000000000000000091919100D4D4D400ADADAD00BCBC
      BC00E4E4E400D8D8D800D8D8D800D8D8D800D8D8D800D8D8D800D8D8D8008888
      8800B0B0B000E7E7E700C0C0C00091919100000000008E8E8E00B4B4B400AAAA
      AA00F4F4F400F3F3F300ECECEC00EAEAEA00ECECEC00ECECEC00E1E1E1008585
      85009D9D9D008E8E8E000000000000000000000000000000000084000000FFFF
      FF00000000000000000000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000B3B3B300F5F5
      F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5
      F500F5F5F500B3B3B300000000000000000091919100D7D7D700CCCCCC009898
      9800FFFFFF00F0F0F000F0F0F000F0F0F000F0F0F000F0F0F00088888800B2B2
      B20088888800F8F8F800F4F4F40091919100000000008E8E8E00B1B1B100AFAF
      AF00B2B2B200B8B8B800B6B6B600B1B1B100AFAFAF00B5B5B500B2B2B200ACAC
      AC00B3B3B3008E8E8E0000000000000000000000000000000000840000008400
      0000FF000000FF000000FF000000840000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000B3B3B300F5F5
      F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5
      F500F5F5F500B3B3B300000000000000000091919100DBDBDB00DBDBDB009292
      9200898989008989890089898900898989008989890088888800C6C6C600D4D4
      D400B7B7B700888888008989890091919100000000008E8E8E00A2A2A200B6B6
      B600CBCBCB00D0D0D000D1D1D100D0D0D000CECECE00CDCDCD00D1D1D100D3D3
      D300B3B3B3008E8E8E000000000000000000000000008484840000000000FF00
      0000FF000000FF000000FF0000008400000000FFFF0000000000848484000000
      0000000000000000000000000000000000000000000000000000B3B3B300EDED
      ED00EDEDED00EDEDED00EDEDED00EDEDED00EDEDED00EDEDED00EDEDED00EDED
      ED00EDEDED00B3B3B300000000000000000091919100DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE0088888800BDBDBD00CDCDCD00CCCC
      CC00D4D4D400B5B5B5008888880000000000000000008E8E8E00B3B3B300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00B3B3B3008E8E8E0000000000000000000000000000000000FF000000FF00
      0000FF000000FF000000FF0000008400000000FFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000B3B3B300EDED
      ED00EDEDED00EDEDED00EDEDED00EDEDED00EDEDED00D1D1D100D1D1D100D1D1
      D100D1D1D100B3B3B300000000000000000091919100FFFFFF00E0E0E000E0E0
      E000E0E0E000E0E0E000E0E0E00088888800888888008888880088888800CBCB
      CB00BDBDBD00888888008888880088888800000000008E8E8E00B3B3B300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00B3B3B3008E8E8E000000000000000000000000000000000084000000FF00
      0000FF000000FF000000FF000000FF0000008400000000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000B3B3B300EDED
      ED00EDEDED00EDEDED00EDEDED00EDEDED00EDEDED00BABABA00BABABA00BABA
      BA00BABABA00B3B3B30000000000000000000000000091919100FFFFFF00E3E3
      E300E3E3E300E3E3E30091919100ADADAD00ADADAD00ADADAD0088888800C6C6
      C600AFAFAF00888888000000000000000000000000008E8E8E00B3B3B300FFFF
      FF00DCDCDC00DCDCDC00DCDCDC00DCDCDC00DCDCDC00DCDCDC00DCDCDC00FFFF
      FF00B3B3B3008E8E8E000000000000000000000000000000000000FFFF008400
      0000FF000000FF000000FF000000FF0000008400000000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000B3B3B300EDED
      ED00EDEDED00EDEDED00EDEDED00EDEDED00EDEDED00AEAEAE00AEAEAE00AEAE
      AE00AEAEAE00B3B3B30000000000000000000000000000000000919191009191
      910091919100919191000000000000000000000000000000000088888800BCBC
      BC0088888800000000000000000000000000000000008E8E8E00B3B3B300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00B3B3B3008E8E8E00000000000000000000000000848484000000000000FF
      FF0000FFFF00FF000000FF00000000FFFF0000FFFF0000000000848484000000
      0000000000000000000000000000000000000000000000000000B3B3B300E4E4
      E400E4E4E400E4E4E400E4E4E400E4E4E400BABABA00FCFCFC00F5F5F500DDDD
      DD00B3B3B3000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000088888800A8A8A800ABAB
      AB0088888800000000000000000000000000000000008E8E8E00B3B3B300FFFF
      FF00DCDCDC00DCDCDC00DCDCDC00DCDCDC00DCDCDC00DCDCDC00DCDCDC00FFFF
      FF00B3B3B3008E8E8E0000000000000000000000000000000000848484000000
      0000FF000000FF000000FF000000FF0000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000B3B3B300E4E4
      E400E4E4E400E4E4E400E4E4E400EDEDED00BABABA00F5F5F500D1D1D100B3B3
      B300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000088888800A4A4A4008888
      880000000000000000000000000000000000000000008E8E8E00B3B3B300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00B3B3B3008E8E8E0000000000000000000000000000000000000000008484
      8400000000000000000000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000B3B3B300E4E4
      E400E4E4E400E4E4E400E4E4E400E4E4E400BFBFBF00D1D1D100B3B3B3000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000888888008888880088888800888888000000
      00000000000000000000000000000000000000000000000000008E8E8E00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF008E8E8E000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B3B3B300B3B3
      B300B3B3B300B3B3B300B3B3B300B3B3B300B3B3B300B3B3B300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008888880088888800888888008888880000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007F7F
      7F007F7F7F00BFBFBF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007F7F
      7F007F7F7F007F7F7F007F7F7F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C3C3C300C2C2C200C1C1C100C0C0C000BFBFBF00BFBFBF00BEBEBE00BDBD
      BD00BCBCBC00BBBBBB00BABABA00B9B9B9000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F007F7F
      7F00BFBFBF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BFBFBF000000000000000000000000007F7F
      7F0000000000000000007F7F7F00000000000000000000000000000000007F7F
      7F00676767009494940000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C4C4C400F0F0F000ECECEC00E7E7E700E8E8E800EEEEEE00F4F4F400F8F8
      F800FCFCFC00FEFEFE00FFFFFF00BABABA000000000000000000000000000000
      0000000000007F7F7F007F7F7F007F7F7F007F7F7F00C1C1C1007F7F7F00BFBF
      BF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BFBFBF00BFBFBF0000000000000000007F7F
      7F0000000000000000007F7F7F00000000000000000000000000949494006565
      6500898989000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600F1F1F100F6F6F600F7F7F700F8F8F800F9F9F900FAFAFA00FBFB
      FB00FCFCFC00FDFDFD00FFFFFF00BCBCBC000000000000000000000000000000
      00007F7F7F00C1C1C100C1C1C100C1C1C100C1C1C1007F7F7F00BFBFBF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00000000007F7F
      7F007F7F7F007F7F7F007F7F7F000000000000000000ADADAD00A5A5A5008686
      8600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C8C8C800F2F2F200C1C1C100C1C1C100C1C1C100C1C1C100C1C1C100C1C1
      C100C1C1C100C1C1C100FFFFFF00BEBEBE007F7F7F007F7F7F007F7F7F007F7F
      7F00E2E2E200BFBFBF00BFBFBF00C5C5C500E2E2E200C1C1C1007F7F7F000000
      000000000000000000000000000000000000000000000000000000000000BFBF
      BF00BFBFBF000000000000000000BFBFBF00BFBFBF0000000000000000007F7F
      7F0000000000000000007F7F7F000000000000000000A0A0A000B9B9B9008E8E
      8E00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B6B6B60000000000000000000000
      0000C9C9C900F2F2F200F3F3F300F4F4F400F5F5F500F6F6F600F7F7F700F8F8
      F800F8F8F800F9F9F900FFFFFF00BFBFBF00C1C1C100FBFBFB00F7F7F7007F7F
      7F00BFBFBF00BFBFBF00BFBFBF00C3C3C300C5C5C500C1C1C1007F7F7F000000
      000000000000000000000000000000000000000000000000000000000000BFBF
      BF00000000000000000000000000BFBFBF000000000000000000000000007F7F
      7F007F7F7F007F7F7F00000000000000000000000000A2A2A200C0C0C0008989
      8900000000000000000000000000000000009393930000000000000000000000
      000000000000000000000000000000000000B8B8B800B8B8B800000000000000
      0000CBCBCB00F1F1F100C1C1C100C1C1C100C1C1C100C1C1C100C1C1C100C1C1
      C100C1C1C100C1C1C100FEFEFE00C1C1C100C1C1C10000000000FBFBFB007F7F
      7F00BFBFBF00BFBFBF00BFBFBF00C1C1C100C5C5C500C1C1C1007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F0000000000000000000000000000000000BFBF
      BF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A7A7A700E6E6E6009292
      9200000000000000000000000000000000007070700082828200000000000000
      000000000000000000000000000000000000BBBBBB00BBBBBB00BBBBBB000000
      0000CCCCCC00CECECE00CFCFCF00CECECE00CECECE00CECECE00CFCFCF00CFCF
      CF00CFCFCF00D0D0D000D1D1D100C2C2C200C1C1C100FBFBFB00FBFBFB007F7F
      7F00BFBFBF00BFBFBF00BFBFBF00BFBFBF00C3C3C300C1C1C1007F7F7F00C1C1
      C100BDBDBD00B5B5B5007F7F7F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B9B9B900F7F7F700BBBB
      BB00929292000000000000000000000000007B7B7B006E6E6E008B8B8B000000
      000000000000000000000000000000000000BDBDBD00BDBDBD00BDBDBD000000
      0000CECECE00CECECE00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00D0D0D000C3C3C300C1C1C100FBFBFB00FBFBFB00FBFB
      FB007F7F7F00BFBFBF00BFBFBF00BFBFBF00E2E2E2007F7F7F00C9C9C900C9C9
      C900C1C1C100B9B9B9007F7F7F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B2B2B200EEEE
      EE00B8B8B8007B7B7B00777777006F6F6F0073737300A4A4A4007D7D7D008686
      860000000000000000000000000000000000C0C0C000C0C0C000000000000000
      0000CFCFCF00CECECE00D0D0D000CFCFCF00CFCFCF00CFCFCF00CECECE00CECE
      CE00CECECE00CECECE00CFCFCF00C5C5C500C1C1C100FBFBFB00FBFBFB00FBFB
      FB00FBFBFB007F7F7F007F7F7F007F7F7F007F7F7F00D5D5D500CBCBCB00C9C9
      C900C5C5C500BFBFBF007F7F7F00000000007F7F7F007F7F7F00000000000000
      00007F7F7F007F7F7F0000000000000000000000000000000000000000000000
      0000BFBFBF000000000000000000000000000000000000000000B1B1B100F6F6
      F600F5F5F500C9C9C9007D7D7D0072727200A1A1A100ABABAB00AAAAAA007777
      770089898900000000000000000000000000C2C2C20000000000000000000000
      0000D1D1D100F4F4F400C1C1C100C1C1C100C1C1C100C1C1C100C1C1C100C1C1
      C100C1C1C100C1C1C100F1F1F100C6C6C600C1C1C100FBFBFB00FBFBFB00C1C1
      C100C1C1C100C1C1C1007F7F7F00EEEEEE00E4E4E400DCDCDC00D3D3D300C9C9
      C900C9C9C900C5C5C5007F7F7F0000000000000000007F7F7F00000000000000
      00007F7F7F0000000000000000000000000000000000BFBFBF00000000000000
      0000BFBFBF00000000000000000000000000000000000000000000000000BEBE
      BE00F6F6F600FBFBFB00EDEDED00CFCFCF00CBCBCB00C6C6C600BDBDBD00AEAE
      AE00707070008484840000000000000000000000000000000000000000000000
      0000D3D3D300F8F8F800F9F9F900F8F8F800F7F7F700F7F7F700F4F4F400EBEB
      EB00E7E7E700E8E8E800EAEAEA00C5C5C500C1C1C100FBFBFB00FBFBFB00C1C1
      C100FBFBFB007F7F7F00FBFBFB00F4F4F400ECECEC00E2E2E200DADADA00D1D1
      D100C7C7C700C9C9C9007F7F7F0000000000000000007F7F7F007F7F7F007F7F
      7F007F7F7F00000000000000000000000000BFBFBF00BFBFBF0000000000BFBF
      BF00BFBFBF000000000000000000000000000000000000000000000000000000
      0000B3B3B300B5B5B500F7F7F700FBFBFB00F9F9F900EDEDED00D0D0D000B5B5
      B500949494000000000000000000000000000000000000000000000000000000
      0000D4D4D400FEFEFE00C1C1C100C1C1C100C1C1C100C1C1C100F3F3F300E4E4
      E400DCDCDC00E1E1E100E1E1E100C4C4C400C1C1C100C1C1C100C1C1C100C1C1
      C1007F7F7F00FBFBFB00FBFBFB00FBFBFB00F2F2F200E8E8E800E0E0E000D8D8
      D800CFCFCF00C5C5C5007F7F7F000000000000000000000000007F7F7F007F7F
      7F00000000000000000000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BABABA00A3A3A300AEAEAE00FDFDFD00E4E4E4009999
      9900000000000000000000000000000000000000000000000000000000000000
      0000D6D6D600FFFFFF00FCFCFC00FBFBFB00FAFAFA00FAFAFA00F3F3F300E6E6
      E600D1D1D100D7D7D700DDDDDD00E3E3E3000000000000000000000000000000
      0000989898009898980098989800989898009898980098989800989898009898
      98009898980098989800989898000000000000000000000000007F7F7F007F7F
      7F0000000000000000000000000000000000BFBFBF00BFBFBF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000ABABAB00F3F3F300ACACAC000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D7D7D700FFFFFF00FEFEFE00FDFDFD00FCFCFC00FBFBFB00F6F6F600EEEE
      EE00D7D7D700FFFFFF00EEEEEE00000000000000000000000000000000000000
      00000000000098989800C9C9C900BFBFBF00BFBFBF00C9C9C9007F7F7F000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BFBFBF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009797970096969600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D8D8D800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCFCFC00F4F4
      F400DDDDDD00EEEEEE0000000000000000000000000000000000000000000000
      0000000000000000000098989800989898009898980098989800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009D9E9E0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000DADADA00D9D9D900D8D8D800D7D7D700D6D6D600D6D6D600D3D3D300D0D0
      D000E2E2E2000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000444144004B37400000000000000000000000
      0000000000000000000000000000000000000063630000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004C4B4B00444A47008A7E85008939790052434900000000000000
      000000000000000000000000000000000000006363000063630000CEFF0000CE
      FF0000CEFF0000CEFF0000C6FF0000BDF70000BDEF0000B5E70000ADE70000AD
      DE00000000000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004C4C
      4C004242420073747400BDBEBD00FAFDFC00DCC5D0007A2A68004F4147000000
      000000000000000000000000000000000000006363009CFFFF000063630000CE
      FF0000CEFF0000CEFF0000C6FF0000C6F70000BDEF0000B5EF0000B5E70000AD
      DE0000A5D6000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F7F7F700EFEFEF00DEDEDE00CECECE00C6C6
      C600B5B5B500A5A5A5009C9C9C0000000000000000004D4D4C00424242007374
      7400BBBBBB00FEFEFE00F1F1F100979D9900ECF4F100E0C8D400792969004F41
      470000000000000000000000000000000000006363009CFFFF00B5EFFF000063
      630000CEFF0000CEFF0000CEFF0000C6F70000BDEF0000B5EF0000B5E70000AD
      DE0000A5DE0000A5D60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF008484
      8400848484008484840084848400FFFFFF00F7F7F70084848400848484008484
      840084848400B5B5B500A5A5A500000000009A446F00776F7300B2B7B400FDFD
      FD00FEFFFE00C0C6C1006F7471003B3438007B7F7D00F8FFFB00E0C8D3007B29
      68004F414700000000000000000000000000006363009CFFFF00C6EFFF00ADEF
      FF000063630000CEFF0000CEFF0000C6F70000BDF70000BDEF0000B5E70000AD
      E70000ADDE0000A5D600009CD60000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000FFFFFF000000
      00000000000000000000000000000000000000000000FFFFFF0094FFFF0073EF
      FF004ADEFF0018C6FF0084848400FFFFFF0094FFFF0073EFFF004ADEFF0018C6
      FF0084848400BDBDBD00ADADAD00000000009B386900D6CDD200FFFFFF00C3C9
      C400777B77004C3942004B1B3200711B6600483441007A847E00F8FFFC00E0C8
      D3007C2B64004F4147000000000000000000006363009CFFFF00D6F7FF00BDEF
      FF00A5EFFF000063630000636300006363000063630000636300006363000063
      630000636300006363000063630000000000000000000000000000000000FFFF
      FF00000000000000000000000000C6C6C6000000000000000000FFFFFF000000
      00000000000000000000000000000000000000000000FFFFFF009CFFFF007BF7
      FF0052DEFF0029CEFF00FFFFFF00FFFFFF009CFFFF007BF7FF0052DEFF0029CE
      FF00D6D6D600C6C6C600B5B5B500000000009F426F00B9B7B500ACB4AE004B44
      4800432F43006E317A0085458E00A933A400801E79003C3135007A847F00F8FF
      FC00DFC7D2007B2B600056444D0000000000006363009CFFFF00E7F7FF00CEF7
      FF00B5EFFF009CEFFF0084E7FF0073DEFF0052DEFF0039D6FF0021D6FF00009C
      CE0000000000000000000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000C6C6C6000000000000000000FFFFFF000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7F700EFEF
      EF00DEDEDE00CECECE00C6C6C60000000000872355004F3B4B0047384B00841E
      7E0089298C002B869D002BD3E40087458A00B628A700851C75003E3036007A84
      8000F9FFFC00DEC6D200792A5A003F373B00006363009CFFFF009CFFFF009CFF
      FF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF008484
      8400848484008484840084848400FFFFFF00FFFFFF0084848400848484008484
      840084848400D6D6D600CECECE0000000000A23D750095248B008D259100A232
      A200A335A40093389C007555A20019879300803E8000A72E9A00821D7100402F
      3600838E8A00E3E6E50053464C00333634000063630000636300006363000063
      6300006363000063630000636300006363000063630000636300006363000063
      6300000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      00000000000000000000000000000000000000000000FFFFFF0094FFFF0073EF
      FF004ADEFF0018C6FF0084848400FFFFFF0094FFFF0073EFFF004ADEFF0018C6
      FF0084848400E7E7E700D6D6D6000000000000000000B6518C00AF2BA3009F33
      A50099329A00AC2197009939A10020C9DC000C919F0022808900963D8A008319
      70004B3E45005B6460003F45420000000000000000000063630000CEFF000000
      FF000000FF000000FF0000CEFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF009CFFFF007BF7
      FF0052DEFF0029CEFF00FFFFFF00FFFFFF009CFFFF007BF7FF0052DEFF0029CE
      FF00F7F7F700EFEFEF00DEDEDE00000000000000000000000000AD4C8100A628
      9B009F32A5009B2F9A00A02E9B007668B3000AD6E10000E3DE001B9396009C36
      8A008C217400452B380041424100000000000000000000000000006363000063
      6300006363000063630000636300000000000000000000000000000000000000
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F7F7F700E7E7E70000000000000000000000000000000000AE4C
      8100A5289B00A729A0009341A5002BC5DF000098A500009BA90019D8DF009A49
      9500B82C9D006712500037383700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000FF000000000000000000000000000000000000000000
      000000000000FFFFFF000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000AD4C8100A7279A00A62DA3007E56AC001CCEE10027D0E60082529700931F
      80007F216200513C43004B4E4D00000000000000000000000000000000000000
      000000000000000000000000000000000000FF00000000000000000000000000
      0000FF00000000000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000084000000000000000000000000000000000000000000
      000000000000AD4D8200A7259900A92BA4009646AE00853C8C00801862004F39
      40004E4E4B000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000AE4F8400B031A60091238700523141004E4E4C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000913268004C3C4A0000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000E00000000100010000000000000700000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFF000000000000FB81000000000000
      F993000000000000C093000000000000D9C3000000000000DBE3000000000000
      DF930000000000008183000000000000C9FF000000000000C9FF000000000000
      C9FF000000000000C1FF000000000000CFFF000000000000CFFF000000000000
      87FF000000000000FFFF000000000000C003BFFFF81FFC3FC003BFFFE0078001
      C003BFFFC003FC3FC003BFFF8001FE7FC003BF038001F81FC003BE010000F00F
      C0039C010000E007C00380010000C003C00380010000C003C00180010000C003
      C00180010000C003C00380018001C003C00780318001C003C00F807DC003E007
      C01F807FE007F00FC03FE1FFF81FF81FF83FF83FFFFFFFFFE00FE00FC003C003
      C007C00780018001800380038001800180038003800180010001000180018001
      0001000180018001000100018001800100010001800180010001000180018001
      80038003800180018003800380018001C007C00780018001E00FE00F80018001
      F83FF83FC003C003FFFFFFFFFFFFFFFFC7FFFFFFFFFCFFFF83FF80039FF9FDFF
      81C700018FF3F8FFC183000187E7E07FE1810001C3CFC03FF1C10001F11FC23F
      F1E10001F83FE71FF1F10001FC7FFF8FF1F10001F83FFFC7F1F10001F19FFFE3
      F0F10001E3CF70C1F0110001C7E70210F00100018FFBA8BEFE0100011FFF8A17
      FFC100013FFFD8C7FFFF8003FFFFFFFFFFFFFFFFC003FFFCFFFFFFFF80019FF9
      FFFFE00F80018FF3FFFFFFFFA00587E7C07FF83F8001C3CFF1FFF39FA005F11F
      F8FFF39F8001F83FFCFFF39FA005FC7FFC7FF39F8001F83FFE7FF39FA005F19F
      FE3FF39F8001E3CFFF1FF39FA005C7E7FC07E10F80018FFBFFFFFFFFA0051FFF
      FFFFFFFF80013FFFFFFFFFFFC003FFFFC0018001C003FFFF00000000C003FFFF
      00000000C003FFFF80010000C003FFFF80010000C003E01FC0030000C003F18F
      C0030000C003F18FE0070000C003F18FE0070000C003F01FF00F0000C003F18F
      F00F0000C001F18FF81F0000C001F18FF81F0000C007E01FFC3F0000C00FFFFF
      FC3F0000C01FFFFFFE7F8001C03FFFFFFFFFFFFFFFFFFC1EFC3FFC3FEFF7F004
      FC3FFC3FC7E3E000FC3FFC3F83C1C000FC3FFC3FC18383E0FC3FFC3FE00787C0
      80018001F00F0F8080018001F81F0FFF80018001F81FFFF080018001F00F01F0
      FC3FFC3FE00703E1FC3FFC3FC18307C1FC3FFC3F83C10003FC3FFC3FC7E30007
      FC3FFC3FEFF7200FFFFFFFFFFFFF783FF83FFFFFFFBFF701E00FC003FF9FE200
      C0078001FF8F800080038001FF87000080038001FF83000000018001C0010000
      0001800180000000000180010000000000018001000000000001800100000000
      80038001000000008003800100000001C00780010000007FE00F80010000007F
      F83FC0038001007FFFFFFFFFC00380FFC0019FFFC003FFFF80010FFFC003E03F
      800107FFC003E03F800183FFC003F8FF8001C1FFC003F8FF8001E10FC003F8FF
      8001F003C003F80F8001FC01C003F8078003FC01C003F8C38003F800C003F8E3
      8003F800C001F8E38003F800C001F8E38003FC01C007F8C38003FC01C00FE007
      C007FE03C01FE00FF83FFF8FC03FFFFFFFFFFFFFFC7FF801C003C003F87FF801
      80018001FB27F80180018001FB43F80180018001F85B000180018001FC1B0001
      80018001FE03000180018001FE07000180018001FC3F000180018001F83F0003
      80018001F03F000780018001E23F000F80018001E63F003F80018001EE3F007F
      C003C003FE7F00FFFFFFFFFFFEFF01FFFFFFC0038003FFFFFE01C0030003C007
      F801C00300018003F001C00300018003C61FC00300018003CFFFC00300008003
      C07FC00300008003C03FC00300008003801FC00300018003801FC00300008003
      801FC00380038003801FC003C3C78003801FC007FF878003C03FC00FFF8F8003
      E07FC01FFE1FC007FFFFC03FF87FFFFFFFE3FFE1FFFFF000FFC7FEEDE3FFF000
      F80FFE6DC7FFF000F01FF0218FFFF000001FE66D8FFF7000001FEEE38F7F3000
      4001EFFF8F3F10000001FFFF871F10000001FFFFC00F3000000133F7C0077000
      0001B7B7E003F00000018727F007F0000001CE0FFC0FF000F001CF3FFF1FF001
      F81FFFBFFF3FF003FC3FFFFFFF7FF007FFFFFFFFFFFFFE7F000783E0FFFFF83F
      000783E00000E01F000383E00000800F00018080000000070000800000000003
      000080000000000100078000000000000007C001000000000007E08300008001
      80FFE0830000C001C1F1F1C70000E001FFF9F1C70000F001FF75F1C70000F807
      FF8FFFFF0000FC1FFFFFFFFFFFFFFE7F00000000000000000000000000000000
      000000000000}
  end
  object mnuUndoDropdown: TPopupMenu
    AutoHotkeys = maManual
    OnPopup = mnuUndoDropdownPopup
    Left = 104
    Top = 24
  end
  object mnuRedoDropdown: TPopupMenu
    AutoHotkeys = maManual
    OnPopup = mnuRedoDropdownPopup
    Left = 144
    Top = 24
  end
  object mnuPascalScriptsDropdown: TPopupMenu
    AutoHotkeys = maManual
    Left = 488
    Top = 24
  end
  object mnuRecentDropdown: TPopupMenu
    AutoHotkeys = maManual
    OnPopup = mnuRecentDropdownPopup
    Left = 56
    Top = 24
  end
  object tmrSeekbarMouseOver: TTimer
    Enabled = False
    Interval = 25
    OnTimer = tmrSeekbarMouseOverTimer
    Left = 672
    Top = 80
  end
  object sdSymbolDialogue: TSymbolDlg
    Zoom = True
    PanelColor = clWhite
    PanelFontColor = clWindowText
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Caption = 'Insert symbol'
    btnInsert = '&Insert'
    btnCancel = '&Close'
    lblFont = '&Font:'
    tabSymbols = 'Symbols'
    Modal = False
    OnInsertSymbol = sdSymbolDialogueInsertSymbol
    OnFormActivate = sdSymbolDialogueFormActivate
    OnFormDeactivate = sdSymbolDialogueFormDeactivate
    Left = 136
    Top = 201
  end
  object tmrFastTypingUndoBind: TTimer
    Enabled = False
    Interval = 2000
    OnTimer = tmrFastTypingUndoBindTimer
    Left = 584
    Top = 345
  end
  object mnuVideoPopup: TPopupMenu
    Images = imgLstMenu
    OwnerDraw = True
    OnPopup = mnuVideoPopupPopup
    Left = 728
    Top = 40
    object mnuOpenMoviePopup: TMenuItem
      Caption = 'Open movie...'
      OnClick = mnuOpenMoviePopupClick
    end
    object mnuCloseMoviePopup: TMenuItem
      Caption = 'Close movie'
      OnClick = mnuCloseMoviePopupClick
    end
    object N47: TMenuItem
      Caption = '-'
    end
    object mnuZoomTo25percent: TMenuItem
      Caption = 'Zoom to 25%'
      OnClick = mnuZoomTo25percentClick
    end
    object mnuZoomTo50percent: TMenuItem
      Caption = 'Zoom to 50%'
      OnClick = mnuZoomTo50percentClick
    end
    object mnuZoomTo75percent: TMenuItem
      Caption = 'Zoom to 75%'
      OnClick = mnuZoomTo75percentClick
    end
    object mnuZoomTo100percent: TMenuItem
      Caption = 'Zoom to 100%'
      OnClick = mnuZoomTo100percentClick
    end
    object mnuZoomTo150percent: TMenuItem
      Caption = 'Zoom to 150%'
      OnClick = mnuZoomTo150percentClick
    end
    object mnuZoomTo200percent: TMenuItem
      Caption = 'Zoom to 200%'
      OnClick = mnuZoomTo200percentClick
    end
    object mnuToggleFullscreen: TMenuItem
      Caption = 'Enter full screen'
      OnClick = mnuToggleFullscreenClick
    end
    object N60: TMenuItem
      Caption = '-'
    end
    object mnuAspectRatio: TMenuItem
      Caption = 'Aspect ratio'
      object mnuAROriginal: TMenuItem
        AutoCheck = True
        Caption = 'Original'
        Checked = True
        RadioItem = True
        OnClick = mnuAROriginalClick
      end
      object N61: TMenuItem
        Caption = '-'
      end
      object mnuAR4_3: TMenuItem
        AutoCheck = True
        Caption = '4:3'
        RadioItem = True
        OnClick = mnuAR4_3Click
      end
      object mnuAR16_9: TMenuItem
        AutoCheck = True
        Caption = '16:9'
        RadioItem = True
        OnClick = mnuAR16_9Click
      end
      object mnuAR185_1: TMenuItem
        AutoCheck = True
        Caption = '1.85:1'
        RadioItem = True
        OnClick = mnuAR185_1Click
      end
      object mnuAR235_1: TMenuItem
        AutoCheck = True
        Caption = '2.35:1'
        RadioItem = True
        OnClick = mnuAR235_1Click
      end
    end
    object N52: TMenuItem
      Caption = '-'
    end
    object mnuVideoRendererPopup: TMenuItem
      Caption = 'Video renderer'
      object mnuDefaultVidRendPopup: TMenuItem
        Caption = 'Default'
        Checked = True
        RadioItem = True
        OnClick = mnuDefaultVidRendClick
      end
      object mnuVMR9VidRendPopup: TMenuItem
        Caption = 'VMR9'
        RadioItem = True
        OnClick = mnuVMR9VidRendClick
      end
    end
    object mnuAudioStreamPopup: TMenuItem
      Caption = 'Audio stream'
      ImageIndex = 36
    end
    object N48: TMenuItem
      Caption = '-'
    end
    object mnuShowSubtitlesPopup: TMenuItem
      AutoCheck = True
      Caption = 'Show subtitles'
      OnClick = mnuShowSubtitlesPopupClick
    end
    object mnuSubtitleToDisplayPopup: TMenuItem
      Caption = 'Display'
      object mnuDisplayOriginalPopup: TMenuItem
        AutoCheck = True
        Caption = 'Original'
        Checked = True
        RadioItem = True
        OnClick = mnuDisplayOriginalClick
      end
      object mnuDisplayTranslationPopup: TMenuItem
        AutoCheck = True
        Caption = 'Translation'
        RadioItem = True
        OnClick = mnuDisplayTranslationClick
      end
    end
    object mnuResetSubVerticalPos: TMenuItem
      Caption = 'Reset subtitle vertical position'
      OnClick = mnuResetSubVerticalPosClick
    end
    object N49: TMenuItem
      Caption = '-'
    end
    object mnuMovieInfoPopup: TMenuItem
      Caption = 'Movie information...'
      OnClick = mnuMovieInfoPopupClick
    end
  end
  object tmrTimesMouseWheelUndoBind: TTimer
    Enabled = False
    Interval = 200
    OnTimer = tmrTimesMouseWheelUndoBindTimer
    Left = 240
    Top = 361
  end
  object mnuTextTransPopup: TPopupMenu
    Images = imgLstMenu
    OwnerDraw = True
    OnPopup = mnuTextTransPopupPopup
    Left = 584
    Top = 384
    object mnuCutPopup: TMenuItem
      Caption = 'Cut'
      ImageIndex = 14
      OnClick = mnuCutClick
    end
    object mnuCopyPopup: TMenuItem
      Caption = 'Copy'
      ImageIndex = 15
      OnClick = mnuCopyClick
    end
    object mnuPastePopup: TMenuItem
      Caption = 'Paste'
      ImageIndex = 16
      OnClick = mnuPasteClick
    end
    object mnuDeletePopup: TMenuItem
      Caption = 'Delete'
      OnClick = mnuDeletePopupClick
    end
    object N57: TMenuItem
      Caption = '-'
    end
    object mnuSelectAllPopup: TMenuItem
      Caption = 'Select all'
      OnClick = mnuSelectAllClick
    end
    object MenuItem4: TMenuItem
      Caption = '-'
    end
    object mnuItalicPopup2: TMenuItem
      Caption = 'Italic'
      ImageIndex = 32
      OnClick = mnuItalicClick
    end
    object mnuBoldPopup2: TMenuItem
      Caption = 'Bold'
      ImageIndex = 31
      OnClick = mnuBoldClick
    end
    object mnuUnderlinePopup2: TMenuItem
      Caption = 'Underline'
      ImageIndex = 33
      OnClick = mnuUnderlineClick
    end
    object mnuSetColorPopup2: TMenuItem
      Caption = 'Set color'
      ImageIndex = 37
      OnClick = mnuSetColorClick
    end
    object mnuRemoveColorTagsPopup2: TMenuItem
      Caption = 'Remove color tags'
      ImageIndex = 38
      OnClick = mnuRemoveColorTagsClick
    end
    object mnuRemoveAllTagsPopup2: TMenuItem
      Caption = 'Remove all tags'
      ImageIndex = 35
      OnClick = mnuRemoveAllTagsClick
    end
  end
end
