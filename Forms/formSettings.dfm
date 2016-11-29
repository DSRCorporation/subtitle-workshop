object frmSettings: TfrmSettings
  Left = 287
  Top = 507
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmSettings'
  ClientHeight = 551
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
  DesignSize = (
    577
    551)
  PixelsPerInch = 96
  TextHeight = 13
  object bvlSeparate1: TBevel
    Left = 8
    Top = 502
    Width = 577
    Height = 9
    Anchors = [akLeft, akRight, akBottom]
    Shape = bsBottomLine
  end
  object pgeCtrl: TPageControl
    Left = 200
    Top = 64
    Width = 369
    Height = 441
    ActivePage = pgeVideoPreview
    Style = tsButtons
    TabOrder = 4
    object pgeGeneral: TTabSheet
      Caption = 'pgeGeneral'
      TabVisible = False
      object bvlSeparate2: TBevel
        Left = 0
        Top = 152
        Width = 361
        Height = 9
        Shape = bsTopLine
      end
      object lblTagsMode: TLabel
        Left = 0
        Top = 160
        Width = 56
        Height = 13
        Caption = 'Tags mode:'
      end
      object chkAlwaysOnTop: TCheckBox
        Left = 0
        Top = 0
        Width = 361
        Height = 17
        Caption = 'Always on top'
        TabOrder = 0
      end
      object chkInstance: TCheckBox
        Left = 0
        Top = 16
        Width = 361
        Height = 17
        Caption = 'Allow more than one instance running'
        TabOrder = 1
      end
      object chkConfirmDelete: TCheckBox
        Left = 0
        Top = 32
        Width = 361
        Height = 17
        Caption = 'Confirm when deleting subtitles'
        TabOrder = 2
      end
      object chkInterpretInvalid: TCheckBox
        Left = 0
        Top = 48
        Width = 361
        Height = 17
        Caption = 'Interpret invalid files as plain text'
        TabOrder = 3
      end
      object chkAutosearchMovie: TCheckBox
        Left = 0
        Top = 64
        Width = 361
        Height = 17
        Caption = 'Autosearch for movie'
        TabOrder = 4
      end
      object chkForceWorkingTime: TCheckBox
        Left = 0
        Top = 80
        Width = 361
        Height = 17
        Caption = 'Force working in time mode'
        TabOrder = 5
      end
      object chkKeepOrderOfLines: TCheckBox
        Left = 0
        Top = 96
        Width = 361
        Height = 17
        Caption = 'Keep order of lines when reverse text'
        TabOrder = 6
      end
      object chkSelectTextNL: TCheckBox
        Left = 0
        Top = 112
        Width = 361
        Height = 17
        Caption = 'Select text on jump to next line'
        TabOrder = 7
      end
      object chkSelectTextPL: TCheckBox
        Left = 0
        Top = 128
        Width = 361
        Height = 17
        Caption = 'Select text on jump to previous line'
        TabOrder = 8
      end
      object edtRFLimit: TLabeledEdit
        Left = 0
        Top = 270
        Width = 41
        Height = 21
        EditLabel.Width = 81
        EditLabel.Height = 13
        EditLabel.Caption = 'Recent files limit:'
        ReadOnly = True
        TabOrder = 9
        Text = '0'
      end
      object udRFLimit: TUpDown
        Left = 41
        Top = 270
        Width = 15
        Height = 21
        Associate = edtRFLimit
        Max = 20
        TabOrder = 10
      end
      object rdoNoInteractionWithTags: TRadioButton
        Left = 0
        Top = 176
        Width = 361
        Height = 17
        Caption = 'No interaction with tags'
        TabOrder = 11
        OnClick = rdoTagsModeClick
      end
      object rdoMultipleTagsMode: TRadioButton
        Left = 0
        Top = 192
        Width = 361
        Height = 17
        Caption = 'Multiple tags mode'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 12
        OnClick = rdoTagsModeClick
      end
      object rdoSingleTagsMode: TRadioButton
        Left = 0
        Top = 208
        Width = 361
        Height = 17
        Caption = 'Single tags mode (the old mode)'
        TabOrder = 13
        OnClick = rdoTagsModeClick
      end
      object rdoAutoDeleteTags: TRadioButton
        Left = 0
        Top = 224
        Width = 361
        Height = 17
        Caption = 'Auto delete tags'
        TabOrder = 14
        OnClick = rdoTagsModeClick
      end
    end
    object pgeAdvanced: TTabSheet
      Caption = 'pgeAdvanced'
      ImageIndex = 12
      TabVisible = False
      object lblCharacters3: TLabel
        Left = 62
        Top = 186
        Width = 51
        Height = 13
        Caption = 'characters'
      end
      object lblMilliseconds: TLabel
        Left = 70
        Top = 228
        Width = 55
        Height = 13
        Caption = 'milliseconds'
      end
      object lblMilliseconds2: TLabel
        Left = 262
        Top = 186
        Width = 55
        Height = 13
        Caption = 'milliseconds'
      end
      object lblMilliseconds3: TLabel
        Left = 262
        Top = 228
        Width = 55
        Height = 13
        Caption = 'milliseconds'
      end
      object lblMilliseconds4: TLabel
        Left = 70
        Top = 284
        Width = 55
        Height = 13
        Caption = 'milliseconds'
      end
      object lblFrames: TLabel
        Left = 262
        Top = 284
        Width = 33
        Height = 13
        Caption = 'frames'
      end
      object lblMilliseconds5: TLabel
        Left = 70
        Top = 338
        Width = 55
        Height = 13
        Caption = 'milliseconds'
      end
      object lblMilliseconds9: TLabel
        Left = 70
        Top = 392
        Width = 55
        Height = 13
        Caption = 'milliseconds'
      end
      object gbFastSmartLineAdjust: TGroupBox
        Left = 0
        Top = 0
        Width = 361
        Height = 78
        Caption = ' Fast smart line adjust '
        TabOrder = 0
        object lblCharacters1: TLabel
          Left = 74
          Top = 39
          Width = 51
          Height = 13
          Caption = 'characters'
        end
        object edtTwoLinesIfLongerThan: TLabeledEdit
          Left = 12
          Top = 33
          Width = 41
          Height = 21
          EditLabel.Width = 115
          EditLabel.Height = 13
          EditLabel.Caption = 'Two lines if longer than:'
          TabOrder = 0
          Text = '40'
        end
        object udTwoLinesIfLongerThan: TUpDown
          Left = 53
          Top = 33
          Width = 15
          Height = 21
          Associate = edtTwoLinesIfLongerThan
          Min = 20
          Max = 120
          Position = 40
          TabOrder = 1
        end
        object chkToggleBreakPoint: TCheckBox
          Left = 12
          Top = 57
          Width = 341
          Height = 17
          Caption = 'Toggle breakpoint'
          TabOrder = 2
        end
      end
      object gbDivideLines: TGroupBox
        Left = 0
        Top = 81
        Width = 361
        Height = 78
        Caption = ' Divide lines '
        TabOrder = 1
        object lblCharacters2: TLabel
          Left = 74
          Top = 39
          Width = 51
          Height = 13
          Caption = 'characters'
        end
        object edtBreakLineAfter: TLabeledEdit
          Left = 12
          Top = 33
          Width = 41
          Height = 21
          EditLabel.Width = 77
          EditLabel.Height = 13
          EditLabel.Caption = 'Break line after:'
          TabOrder = 0
          Text = '40'
        end
        object udBreakLineAfter: TUpDown
          Left = 53
          Top = 33
          Width = 15
          Height = 21
          Associate = edtBreakLineAfter
          Min = 20
          Max = 120
          Position = 40
          TabOrder = 1
        end
        object chkSLAAutomatically: TCheckBox
          Left = 12
          Top = 57
          Width = 341
          Height = 17
          Caption = 'Smart line adjust automatically'
          TabOrder = 2
        end
      end
      object edtMaxLineLength: TLabeledEdit
        Left = 0
        Top = 180
        Width = 41
        Height = 21
        EditLabel.Width = 100
        EditLabel.Height = 13
        EditLabel.Caption = 'Maximum line length:'
        TabOrder = 2
        Text = '45'
      end
      object udMaxLineLength: TUpDown
        Left = 41
        Top = 180
        Width = 15
        Height = 21
        Associate = edtMaxLineLength
        Min = 20
        Max = 120
        Position = 45
        TabOrder = 3
      end
      object edtShiftTime: TLabeledEdit
        Left = 0
        Top = 222
        Width = 49
        Height = 21
        EditLabel.Width = 49
        EditLabel.Height = 13
        EditLabel.Caption = 'Shift time:'
        TabOrder = 4
        Text = '100'
      end
      object udShiftTime: TUpDown
        Left = 49
        Top = 222
        Width = 16
        Height = 21
        Associate = edtShiftTime
        Min = 1
        Max = 9999
        Increment = 10
        Position = 100
        TabOrder = 5
        Thousands = False
      end
      object edtDefaultSubDuration: TLabeledEdit
        Left = 192
        Top = 180
        Width = 49
        Height = 21
        EditLabel.Width = 120
        EditLabel.Height = 13
        EditLabel.Caption = 'Default subtitle duration:'
        TabOrder = 6
        Text = '1000'
      end
      object udDefaultSubDuration: TUpDown
        Left = 241
        Top = 180
        Width = 17
        Height = 21
        Associate = edtDefaultSubDuration
        Min = 1
        Max = 30000
        Increment = 100
        Position = 1000
        TabOrder = 7
        Thousands = False
      end
      object edtDefaultSubPause: TLabeledEdit
        Left = 192
        Top = 222
        Width = 49
        Height = 21
        EditLabel.Width = 109
        EditLabel.Height = 13
        EditLabel.Caption = 'Default subtitle pause:'
        TabOrder = 8
        Text = '1'
      end
      object udDefaultSubPause: TUpDown
        Left = 241
        Top = 222
        Width = 16
        Height = 21
        Associate = edtDefaultSubPause
        Min = 1
        Max = 9999
        Increment = 10
        Position = 1
        TabOrder = 9
        Thousands = False
      end
      object edtIncreaseStepTime: TLabeledEdit
        Left = 0
        Top = 278
        Width = 49
        Height = 21
        EditLabel.Width = 101
        EditLabel.Height = 13
        EditLabel.Caption = 'Increase step (time):'
        TabOrder = 10
        Text = '100'
      end
      object udIncreaseStepTime: TUpDown
        Left = 49
        Top = 278
        Width = 16
        Height = 21
        Associate = edtIncreaseStepTime
        Min = 1
        Max = 10000
        Increment = 10
        Position = 100
        TabOrder = 11
        Thousands = False
      end
      object edtIncreaseStepFranes: TLabeledEdit
        Left = 192
        Top = 278
        Width = 49
        Height = 21
        EditLabel.Width = 114
        EditLabel.Height = 13
        EditLabel.Caption = 'Increase step (frames):'
        TabOrder = 12
        Text = '1'
      end
      object udIncreaseStepFrames: TUpDown
        Left = 241
        Top = 278
        Width = 16
        Height = 21
        Associate = edtIncreaseStepFranes
        Min = 1
        Max = 1000
        Position = 1
        TabOrder = 13
        Thousands = False
      end
      object chkKeepMinDur: TCheckBox
        Left = 0
        Top = 316
        Width = 361
        Height = 17
        Caption = 'Keep min duration of:'
        TabOrder = 14
        OnClick = chkKeepMinDurClick
      end
      object udKeepMinDur: TUpDown
        Left = 49
        Top = 332
        Width = 16
        Height = 21
        Associate = edtKeepMinDur
        Max = 10000
        Increment = 10
        Position = 1000
        TabOrder = 15
        Thousands = False
      end
      object edtKeepMinDur: TEdit
        Left = 0
        Top = 332
        Width = 49
        Height = 21
        TabOrder = 16
        Text = '1000'
      end
      object chkDontAllowOverlaps: TCheckBox
        Left = 152
        Top = 337
        Width = 209
        Height = 17
        Caption = 'but don'#39't allow overlaps'
        TabOrder = 17
      end
      object udAutoRoundTimeVals: TUpDown
        Left = 49
        Top = 386
        Width = 16
        Height = 21
        Associate = edtAutoRoundTimeVals
        Min = 2
        Max = 10000
        Increment = 10
        Position = 100
        TabOrder = 18
        Thousands = False
      end
      object edtAutoRoundTimeVals: TEdit
        Left = 0
        Top = 386
        Width = 49
        Height = 21
        TabOrder = 19
        Text = '100'
      end
      object chkAutoRoundTimeVals: TCheckBox
        Left = 0
        Top = 370
        Width = 361
        Height = 17
        Caption = 'Automatically round time values to:'
        TabOrder = 20
        OnClick = chkAutoRoundTimeValsClick
      end
      object chkRoundOnSubLoad: TCheckBox
        Left = 0
        Top = 415
        Width = 361
        Height = 17
        Caption = 'Round time values on subtitle load'
        TabOrder = 21
        OnClick = chkAutoRoundTimeValsClick
      end
    end
    object pgeCharsets: TTabSheet
      Caption = 'pgeCharsets'
      ImageIndex = 11
      TabVisible = False
      object lblNotesCharset: TLabel
        Left = 0
        Top = 160
        Width = 71
        Height = 13
        Caption = 'Notes charset:'
      end
      object cmbNotesCharset: TComboBox
        Left = 0
        Top = 178
        Width = 145
        Height = 21
        Style = csDropDownList
        ItemHeight = 0
        TabOrder = 0
      end
      object gbCharsets: TGroupBox
        Left = 0
        Top = 0
        Width = 361
        Height = 145
        TabOrder = 1
        object lblTransCharset: TLabel
          Left = 8
          Top = 96
          Width = 96
          Height = 13
          Caption = 'Translation charset:'
        end
        object lblOrgCharset: TLabel
          Left = 8
          Top = 48
          Width = 79
          Height = 13
          Caption = 'Original charset:'
        end
        object cmbTransCharset: TComboBox
          Left = 8
          Top = 114
          Width = 145
          Height = 21
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 0
        end
        object cmbOrgCharset: TComboBox
          Left = 8
          Top = 64
          Width = 145
          Height = 21
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 1
        end
        object chkShowInMainForm: TCheckBox
          Left = 8
          Top = 16
          Width = 345
          Height = 17
          Caption = 'Show in main form'
          TabOrder = 2
        end
      end
    end
    object pgeFormats: TTabSheet
      Caption = 'pgeFormats'
      ImageIndex = 1
      TabVisible = False
      object lblDefaultFormat: TLabel
        Left = 0
        Top = 0
        Width = 74
        Height = 13
        Caption = 'Default format:'
      end
      object lblFormatsToShow: TLabel
        Left = 0
        Top = 48
        Width = 162
        Height = 13
        Caption = 'Formats to show when "Save as":'
      end
      object cmbDefaultFormat: TComboBox
        Left = 0
        Top = 16
        Width = 241
        Height = 21
        Style = csDropDownList
        ItemHeight = 0
        TabOrder = 0
      end
      object chkLstFormatsToShow: TCheckListBox
        Left = 0
        Top = 64
        Width = 361
        Height = 313
        ItemHeight = 13
        TabOrder = 1
      end
      object chkShowCustomFormats: TCheckBox
        Left = 0
        Top = 412
        Width = 361
        Height = 17
        Caption = 'Show custom formats'
        TabOrder = 2
      end
      object btnSelectAllFormat: TButton
        Left = 144
        Top = 380
        Width = 105
        Height = 25
        Caption = 'Select &all'
        TabOrder = 3
        OnClick = btnSelectAllFormatClick
      end
      object btnSelectZeroFormat: TButton
        Left = 256
        Top = 380
        Width = 105
        Height = 25
        Caption = 'Select &zero'
        TabOrder = 4
        OnClick = btnSelectZeroFormatClick
      end
    end
    object pgeFileTypes: TTabSheet
      Caption = 'pgeFileTypes'
      ImageIndex = 2
      TabVisible = False
      object chkRegExtOnStart: TCheckBox
        Left = 0
        Top = 16
        Width = 361
        Height = 17
        Caption = 'Register extensions on start'
        TabOrder = 0
      end
      object chkAssociateExtensions: TCheckBox
        Left = 0
        Top = 32
        Width = 361
        Height = 17
        Caption = 'Associate with most supported subtitle extensions'
        TabOrder = 1
        OnClick = chkAssociateExtensionsClick
      end
      object chklstExtensions: TCheckListBox
        Left = 0
        Top = 56
        Width = 361
        Height = 345
        Enabled = False
        ItemHeight = 13
        Sorted = True
        TabOrder = 2
      end
      object btnSelectAllExt: TButton
        Left = 144
        Top = 404
        Width = 105
        Height = 25
        Caption = 'Select &all'
        TabOrder = 3
        OnClick = btnSelectAllExtClick
      end
      object btnSelectZeroExt: TButton
        Left = 256
        Top = 404
        Width = 105
        Height = 25
        Caption = 'Select &zero'
        TabOrder = 4
        OnClick = btnSelectZeroExtClick
      end
      object chkAddOpenWithSWToShell: TCheckBox
        Left = 0
        Top = 0
        Width = 361
        Height = 17
        Caption = 'Add "Open with Subtitle Workshop" to shell context menu'
        TabOrder = 5
      end
    end
    object pgeSave: TTabSheet
      Caption = 'pgeSave'
      ImageIndex = 3
      TabVisible = False
      object lblMinutes: TLabel
        Left = 83
        Top = 39
        Width = 41
        Height = 13
        Caption = 'minutes.'
        Enabled = False
      end
      object chkAskToSave: TCheckBox
        Left = 0
        Top = 0
        Width = 361
        Height = 17
        Caption = 'Ask to save on exit program/close subtitle'
        TabOrder = 0
      end
      object chkSaveAutomatically: TCheckBox
        Left = 0
        Top = 16
        Width = 361
        Height = 17
        Caption = 'Save work automatically every'
        TabOrder = 1
        OnClick = chkSaveAutomaticallyClick
      end
      object edtMinutes: TEdit
        Left = 32
        Top = 32
        Width = 33
        Height = 21
        Enabled = False
        TabOrder = 2
        Text = '1'
      end
      object updMins: TUpDown
        Left = 65
        Top = 32
        Width = 15
        Height = 21
        Associate = edtMinutes
        Enabled = False
        Min = 1
        Max = 30
        Position = 1
        TabOrder = 3
      end
      object btnOutputSettings: TButton
        Left = 0
        Top = 128
        Width = 153
        Height = 33
        Caption = 'Output settings...'
        TabOrder = 4
        OnClick = btnOutputSettingsClick
      end
      object chkSaveAsBackup: TCheckBox
        Left = 16
        Top = 56
        Width = 345
        Height = 17
        Caption = 'Save as backup'
        TabOrder = 5
        OnClick = chkSaveAutomaticallyClick
      end
      object chkAskToSaveNewSubs: TCheckBox
        Left = 16
        Top = 72
        Width = 345
        Height = 17
        Caption = 'Ask to save new subttiles'
        TabOrder = 6
        OnClick = chkSaveAutomaticallyClick
      end
      object chkSaveEmptyLines: TCheckBox
        Left = 0
        Top = 96
        Width = 361
        Height = 17
        Caption = 'Save empty lines'
        TabOrder = 7
        OnClick = chkSaveAutomaticallyClick
      end
    end
    object pgeVideoPreview: TTabSheet
      Caption = 'pgeVideoPreview'
      ImageIndex = 4
      TabVisible = False
      object lblDoubleClickInSub: TLabel
        Left = 0
        Top = 0
        Width = 117
        Height = 13
        Caption = 'Double click in a subtitle:'
      end
      object lblShiftDoubleClickInSub: TLabel
        Left = 0
        Top = 72
        Width = 164
        Height = 13
        Caption = 'Shift-double click click in a subtitle:'
      end
      object Bevel2: TBevel
        Left = 0
        Top = 136
        Width = 361
        Height = 9
        Shape = bsBottomLine
      end
      object lblSeconds: TLabel
        Left = 56
        Top = 175
        Width = 43
        Height = 13
        Caption = 'seconds.'
      end
      object lblRewindAndForward: TLabel
        Left = 0
        Top = 152
        Width = 124
        Height = 13
        Caption = 'Rewind and forward time:'
      end
      object lblDefaultAltPlayRate: TLabel
        Left = 0
        Top = 200
        Width = 144
        Height = 13
        Caption = 'Default altered playback rate:'
      end
      object lblVisSubReprColor: TLabel
        Left = 156
        Top = 388
        Width = 169
        Height = 13
        Alignment = taRightJustify
        Caption = 'Visual subtitle representation color:'
      end
      object cmbDoubleClickInSub: TComboBox
        Left = 0
        Top = 16
        Width = 361
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 2
        TabOrder = 0
        Text = 'Go N second(s) before subtitle in video'
        Items.Strings = (
          'Go subtitle'#39's time in video'
          'Focus text box'
          'Go N second(s) before subtitle in video')
      end
      object edtSecsToJump1: TLabeledEdit
        Left = 312
        Top = 44
        Width = 33
        Height = 21
        EditLabel.Width = 83
        EditLabel.Height = 13
        EditLabel.Caption = 'Seconds to jump:'
        LabelPosition = lpLeft
        TabOrder = 1
        Text = '1'
        OnChange = edtBorderWidthChange
      end
      object udSecsToJump1: TUpDown
        Left = 345
        Top = 44
        Width = 16
        Height = 21
        Associate = edtSecsToJump1
        Min = 1
        Max = 10
        Position = 1
        TabOrder = 2
      end
      object cmbShiftDoubleClickInSub: TComboBox
        Left = 0
        Top = 88
        Width = 361
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 3
        Text = 'Go subtitle'#39's time in video'
        Items.Strings = (
          'Go subtitle'#39's time in video'
          'Focus text box'
          'Go N second(s) before subtitle in video')
      end
      object edtSecsToJump2: TLabeledEdit
        Left = 312
        Top = 116
        Width = 33
        Height = 21
        EditLabel.Width = 83
        EditLabel.Height = 13
        EditLabel.Caption = 'Seconds to jump:'
        LabelPosition = lpLeft
        TabOrder = 4
        Text = '1'
        OnChange = edtBorderWidthChange
      end
      object udSecsToJump2: TUpDown
        Left = 345
        Top = 116
        Width = 16
        Height = 21
        Associate = edtSecsToJump2
        Min = 1
        Max = 10
        Position = 1
        TabOrder = 5
      end
      object edtRewindAndForwardTime: TMaskEdit
        Left = 0
        Top = 168
        Width = 49
        Height = 21
        EditMask = '9,999;1;0'
        MaxLength = 5
        TabOrder = 6
        Text = ' ,5  '
      end
      object cmbDefaultAltPlayRate: TComboBox
        Left = 0
        Top = 216
        Width = 97
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 4
        TabOrder = 7
        Text = '50%'
        Items.Strings = (
          '10%'
          '20%'
          '30%'
          '40%'
          '50%'
          '60%'
          '70%'
          '80%'
          '90%'
          '150%'
          '200%'
          '300%'
          '400%')
      end
      object chkVertVideoAlign: TCheckBox
        Left = 0
        Top = 248
        Width = 361
        Height = 17
        Caption = 'Vertical video center align'
        TabOrder = 8
      end
      object chkVolumeControls: TCheckBox
        Left = 0
        Top = 416
        Width = 129
        Height = 17
        Caption = 'Show volume controls'
        TabOrder = 9
        Visible = False
      end
      object chkFullScreenOnDblClick: TCheckBox
        Left = 0
        Top = 264
        Width = 361
        Height = 17
        Caption = 'Enter full screen on double click'
        TabOrder = 10
      end
      object gbShowHideVals: TGroupBox
        Left = 0
        Top = 304
        Width = 361
        Height = 73
        Caption = ' Setting Show and Hide times'
        TabOrder = 11
        object lblMilliseconds7: TLabel
          Left = 268
          Top = 46
          Width = 55
          Height = 13
          Caption = 'milliseconds'
        end
        object lblMilliseconds6: TLabel
          Left = 268
          Top = 22
          Width = 55
          Height = 13
          Caption = 'milliseconds'
        end
        object edtShiftHideVal: TLabeledEdit
          Left = 208
          Top = 42
          Width = 41
          Height = 21
          EditLabel.Width = 79
          EditLabel.Height = 13
          EditLabel.Caption = 'Shift Hide value:'
          LabelPosition = lpLeft
          TabOrder = 0
          Text = '0'
          OnChange = edtBorderWidthChange
        end
        object udShiftHideVal: TUpDown
          Left = 249
          Top = 42
          Width = 16
          Height = 21
          Associate = edtShiftHideVal
          Min = -10000
          Max = 10000
          Increment = 50
          TabOrder = 1
        end
        object edtShiftShowVal: TLabeledEdit
          Left = 208
          Top = 18
          Width = 41
          Height = 21
          EditLabel.Width = 84
          EditLabel.Height = 13
          EditLabel.Caption = 'Shift Show value:'
          LabelPosition = lpLeft
          TabOrder = 2
          Text = '0'
          OnChange = edtBorderWidthChange
        end
        object udShiftShowVal: TUpDown
          Left = 249
          Top = 18
          Width = 16
          Height = 21
          Associate = edtShiftShowVal
          Min = -5000
          Max = 5000
          Increment = 50
          TabOrder = 3
        end
      end
      object chkPlayVideoOnLoad: TCheckBox
        Left = 0
        Top = 280
        Width = 361
        Height = 17
        Caption = 'Play video on load'
        TabOrder = 12
      end
      object pnlVisSubReprColor: TPanel
        Left = 328
        Top = 386
        Width = 33
        Height = 17
        Color = 13553358
        Font.Charset = ANSI_CHARSET
        Font.Color = 13553358
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 13
        OnMouseDown = pnlUnTransColorMouseDown
      end
    end
    object pgeVideoPreviewSubs: TTabSheet
      Caption = 'pgeVideoPreviewSubs'
      ImageIndex = 5
      TabVisible = False
      object chkDrawBorder: TCheckBox
        Left = 0
        Top = 0
        Width = 361
        Height = 17
        Caption = 'Draw outline'
        TabOrder = 0
        OnClick = chkDrawBorderClick
      end
      object chkDrawShadow: TCheckBox
        Left = 0
        Top = 16
        Width = 361
        Height = 17
        Caption = 'Draw shadow'
        TabOrder = 1
        OnClick = chkDrawShadowClick
      end
      object chkTransparent: TCheckBox
        Left = 0
        Top = 40
        Width = 361
        Height = 17
        BiDiMode = bdLeftToRight
        Caption = 'Try transparent background'
        ParentBiDiMode = False
        TabOrder = 2
        OnClick = chkTransparentClick
      end
      object btnSubFont: TButton
        Left = 8
        Top = 172
        Width = 113
        Height = 25
        Caption = 'Font...'
        TabOrder = 3
        OnClick = btnSubFontClick
      end
      object btnSubColor: TButton
        Left = 128
        Top = 172
        Width = 113
        Height = 25
        Caption = 'Color...'
        TabOrder = 4
        OnClick = btnSubColorClick
      end
      object btnBackground: TButton
        Left = 248
        Top = 172
        Width = 113
        Height = 25
        Caption = 'Background...'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        OnClick = btnBackgroundClick
      end
      object edtBorderWidth: TLabeledEdit
        Left = 280
        Top = 201
        Width = 25
        Height = 21
        EditLabel.Width = 67
        EditLabel.Height = 13
        EditLabel.Caption = 'Outline width:'
        LabelPosition = lpLeft
        TabOrder = 6
        Text = '1'
        OnChange = edtBorderWidthChange
      end
      object edtShadowWidth: TLabeledEdit
        Left = 280
        Top = 226
        Width = 25
        Height = 21
        EditLabel.Width = 71
        EditLabel.Height = 13
        EditLabel.Caption = 'Shadow width:'
        LabelPosition = lpLeft
        TabOrder = 7
        Text = '1'
        OnChange = edtShadowWidthChange
      end
      object udShadowWidth: TUpDown
        Left = 305
        Top = 226
        Width = 15
        Height = 21
        Associate = edtShadowWidth
        Min = 1
        Max = 5
        Position = 1
        TabOrder = 8
      end
      object udBorderWidth: TUpDown
        Left = 305
        Top = 201
        Width = 15
        Height = 21
        Associate = edtBorderWidth
        ArrowKeys = False
        Min = 1
        Max = 5
        Position = 1
        TabOrder = 9
      end
      object pnlSubSample: TPanel
        Left = 0
        Top = 260
        Width = 361
        Height = 73
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 10
        OnMouseDown = pnlSubSampleMouseDown
        object subSample: TMiSubtitulo
          Left = 121
          Top = 16
          Width = 120
          Height = 28
          Text = 'subSAMPLE'
          Shadow = True
          Border = True
          UsarTags = False
          TextColor = clWhite
          BackgroundColor = clBtnFace
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
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          OnMouseDown = subSampleMouseDown
        end
      end
      object chkForceUsingRegions: TCheckBox
        Left = 16
        Top = 60
        Width = 313
        Height = 17
        BiDiMode = bdLeftToRight
        Caption = 'Force using regions (may be slow)'
        ParentBiDiMode = False
        TabOrder = 11
      end
      object chkAlignLeftLineWithDash: TCheckBox
        Left = 0
        Top = 88
        Width = 361
        Height = 17
        BiDiMode = bdLeftToRight
        Caption = 'Align left when subtitles contain a new line starting with "-"'
        ParentBiDiMode = False
        TabOrder = 12
      end
      object chkRelativeFontSize: TCheckBox
        Left = 0
        Top = 104
        Width = 361
        Height = 17
        BiDiMode = bdLeftToRight
        Caption = 'Relative font size'
        ParentBiDiMode = False
        TabOrder = 13
      end
      object chkKeepSubOnVideo: TCheckBox
        Left = 0
        Top = 120
        Width = 361
        Height = 17
        BiDiMode = bdLeftToRight
        Caption = 'Keep subtitle on video'
        ParentBiDiMode = False
        TabOrder = 14
      end
      object pnlBorderColor: TPanel
        Left = 328
        Top = 202
        Width = 33
        Height = 17
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 15
        OnMouseDown = pnlBorderColorMouseDown
      end
      object pnlShadowColor: TPanel
        Left = 328
        Top = 227
        Width = 33
        Height = 17
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 16
        OnMouseDown = pnlShadowColorMouseDown
      end
      object chkAntialiasing: TCheckBox
        Left = 0
        Top = 138
        Width = 361
        Height = 17
        BiDiMode = bdLeftToRight
        Caption = 'Try antialiasing (Force using regions must be off)'
        ParentBiDiMode = False
        TabOrder = 17
        OnClick = chkAntialiasingClick
      end
      object pnlTransparencyColor: TPanel
        Left = 328
        Top = 58
        Width = 33
        Height = 17
        Color = 65793
        Font.Charset = ANSI_CHARSET
        Font.Color = 65793
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 18
        OnMouseDown = pnlTransparencyColorMouseDown
      end
    end
    object pgeExternalPreviewGeneral: TTabSheet
      Caption = 'pgeExternalPreviewGeneral'
      ImageIndex = 6
      TabVisible = False
      object edtVidPlayer: TLabeledEdit
        Left = 0
        Top = 16
        Width = 361
        Height = 21
        EditLabel.Width = 116
        EditLabel.Height = 13
        EditLabel.Caption = 'Exe of the video player:'
        TabOrder = 0
      end
      object btnBrowse: TButton
        Left = 0
        Top = 40
        Width = 97
        Height = 25
        Caption = 'Browse'
        TabOrder = 1
        OnClick = btnBrowseClick
      end
      object btnDetect: TButton
        Left = 104
        Top = 40
        Width = 257
        Height = 25
        Caption = 'Detect associated program'
        TabOrder = 2
        OnClick = btnDetectClick
      end
      object rdoAskForDifferentVideo: TRadioButton
        Left = 0
        Top = 80
        Width = 361
        Height = 17
        Caption = 'Ask for a different video each time'
        Checked = True
        TabOrder = 3
        TabStop = True
        OnClick = rdoAskForDifferentVideoClick
      end
      object rdoTestWithVideo: TRadioButton
        Left = 0
        Top = 96
        Width = 361
        Height = 17
        Caption = 'Always test with video:'
        TabOrder = 4
        OnClick = rdoTestWithVideoClick
      end
      object edtAVIFile: TEdit
        Left = 0
        Top = 120
        Width = 361
        Height = 21
        Enabled = False
        TabOrder = 5
      end
      object btnBrowse2: TButton
        Left = 0
        Top = 144
        Width = 97
        Height = 25
        Caption = 'Browse'
        Enabled = False
        TabOrder = 6
        OnClick = btnBrowse2Click
      end
    end
    object pgeExternalPreviewAdvanced: TTabSheet
      Caption = 'pgeExternalPreviewAdvanced'
      ImageIndex = 7
      TabVisible = False
      object lblParamDescription: TLabel
        Left = 0
        Top = 128
        Width = 361
        Height = 137
        AutoSize = False
        Caption = 
          'VIDEO_FILE represents the video file in which you are going to t' +
          'est the subtitles. SUBT_FILE is the parameter in which the tempo' +
          'rary subtitle file will be sent to the video player. You may add' +
          ' other parameters like full screen, etc.'
        WordWrap = True
      end
      object lblSaveTempSubInFormat: TLabel
        Left = 0
        Top = 0
        Width = 165
        Height = 13
        Caption = 'Save temporary subtitle in format:'
      end
      object edtParameter: TLabeledEdit
        Left = 0
        Top = 104
        Width = 361
        Height = 21
        EditLabel.Width = 187
        EditLabel.Height = 13
        EditLabel.Caption = 'Parameter to send to the video player:'
        TabOrder = 0
      end
      object cmbFormats: TComboBox
        Left = 0
        Top = 49
        Width = 217
        Height = 21
        Style = csDropDownList
        Enabled = False
        ItemHeight = 0
        Sorted = True
        TabOrder = 1
      end
      object rdoCustomFormat: TRadioButton
        Left = 0
        Top = 32
        Width = 361
        Height = 17
        Caption = 'Custom format:'
        TabOrder = 2
        OnClick = rdoCustomFormatClick
      end
      object rdoOriginalFormat: TRadioButton
        Left = 0
        Top = 16
        Width = 361
        Height = 17
        Caption = 'Original format'
        Checked = True
        TabOrder = 3
        TabStop = True
        OnClick = rdoOriginalFormatClick
      end
    end
    object pgeProgramLook: TTabSheet
      Caption = 'pgeProgramLook'
      ImageIndex = 8
      TabVisible = False
      object lblFontToUse: TLabel
        Left = 0
        Top = 0
        Width = 132
        Height = 13
        Caption = 'Font to use in the program:'
      end
      object lblFontSize: TLabel
        Left = 0
        Top = 48
        Width = 47
        Height = 13
        Caption = 'Font size:'
      end
      object lblTextAndTransFieldsAlign: TLabel
        Left = 0
        Top = 104
        Width = 172
        Height = 13
        Caption = '"Text" and "Translation" fields align:'
      end
      object cmbFonts: TComboBox
        Left = 0
        Top = 16
        Width = 361
        Height = 22
        Style = csOwnerDrawFixed
        ItemHeight = 16
        TabOrder = 0
        OnDrawItem = cmbFontsDrawItem
      end
      object edtFontSize: TEdit
        Left = 0
        Top = 64
        Width = 57
        Height = 21
        TabOrder = 1
        Text = '8'
      end
      object udFontSize: TUpDown
        Left = 57
        Top = 64
        Width = 15
        Height = 21
        Associate = edtFontSize
        Min = 6
        Max = 50
        Position = 8
        TabOrder = 2
      end
      object cmbTextAlign: TComboBox
        Left = 0
        Top = 120
        Width = 169
        Height = 21
        Style = csDropDownList
        ItemHeight = 0
        TabOrder = 3
      end
      object chkSmartResize: TCheckBox
        Left = 0
        Top = 184
        Width = 361
        Height = 17
        Caption = 'Smart main window and subtitle list resize'
        TabOrder = 4
      end
      object chkSmartResizeColumns: TCheckBox
        Left = 0
        Top = 200
        Width = 361
        Height = 17
        Caption = 'Resize subtitle list columns when resizing form'
        TabOrder = 5
      end
      object chkUseOfficeXPStyleMenu: TCheckBox
        Left = 0
        Top = 232
        Width = 361
        Height = 17
        Caption = 'Use Office XP style menu'
        TabOrder = 6
        OnClick = chkUseOfficeXPStyleMenuClick
      end
      object chkUseGradientMenu: TCheckBox
        Left = 0
        Top = 248
        Width = 361
        Height = 17
        Caption = 'Use gradient menu'
        TabOrder = 7
      end
      object chkTagsHighlight: TCheckBox
        Left = 0
        Top = 148
        Width = 329
        Height = 17
        Caption = 'Hilight tags in "Text" and "Translation" fields:'
        TabOrder = 8
      end
      object pnlTagsHighlightColor: TPanel
        Left = 328
        Top = 146
        Width = 33
        Height = 17
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
        OnMouseDown = pnlUnTransColorMouseDown
      end
    end
    object pgeListLook: TTabSheet
      Caption = 'pgeListLook'
      ImageIndex = 9
      TabVisible = False
      object chkMarkUnTransSubs: TCheckBox
        Left = 0
        Top = 36
        Width = 329
        Height = 17
        Caption = 'Mark untranslated subtitles with color:'
        TabOrder = 0
      end
      object chkApplyStyle: TCheckBox
        Left = 0
        Top = 18
        Width = 361
        Height = 17
        Caption = 'Apply style to subtitles'
        TabOrder = 1
      end
      object chkShowGridLines: TCheckBox
        Left = 0
        Top = 0
        Width = 361
        Height = 17
        Caption = 'Show grid lines'
        TabOrder = 2
      end
      object pnlUnTransColor: TPanel
        Left = 328
        Top = 36
        Width = 33
        Height = 17
        Color = clRed
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnMouseDown = pnlUnTransColorMouseDown
      end
      object chkShowHorzScrollBar: TCheckBox
        Left = 0
        Top = 76
        Width = 361
        Height = 17
        Caption = 'Show horizontal scrollbar'
        TabOrder = 4
      end
      object pnlUnTransBckgr: TPanel
        Left = 328
        Top = 56
        Width = 33
        Height = 17
        Color = 15527167
        Font.Charset = ANSI_CHARSET
        Font.Color = 15527167
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        OnMouseDown = pnlUnTransColorMouseDown
      end
      object chkMarkUnTransSubsBckgr: TCheckBox
        Left = 0
        Top = 56
        Width = 329
        Height = 17
        Caption = 'Mark untranslated subtitles with background:'
        TabOrder = 6
      end
      object edtRowHeight: TLabeledEdit
        Left = 0
        Top = 140
        Width = 41
        Height = 21
        EditLabel.Width = 58
        EditLabel.Height = 13
        EditLabel.Caption = 'Row height:'
        TabOrder = 7
        Text = '18'
      end
      object udRowHeight: TUpDown
        Left = 41
        Top = 140
        Width = 16
        Height = 21
        Associate = edtRowHeight
        Min = 8
        Max = 50
        Position = 18
        TabOrder = 8
      end
      object gbColumnsAlign: TGroupBox
        Left = 0
        Top = 220
        Width = 361
        Height = 211
        Caption = ' Columns '
        TabOrder = 9
        object lblNumCol: TLabel
          Left = 78
          Top = 38
          Width = 21
          Height = 13
          Alignment = taRightJustify
          Caption = 'Num'
        end
        object lblShowCol: TLabel
          Left = 73
          Top = 86
          Width = 26
          Height = 13
          Alignment = taRightJustify
          Caption = 'Show'
        end
        object lblHideCol: TLabel
          Left = 78
          Top = 110
          Width = 21
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hide'
        end
        object lblAlign: TLabel
          Left = 104
          Top = 16
          Width = 27
          Height = 13
          Caption = 'Align:'
        end
        object lblDurCol: TLabel
          Left = 58
          Top = 134
          Width = 41
          Height = 13
          Alignment = taRightJustify
          Caption = 'Duration'
        end
        object lblTextCol: TLabel
          Left = 77
          Top = 158
          Width = 22
          Height = 13
          Alignment = taRightJustify
          Caption = 'Text'
        end
        object lblTransCol: TLabel
          Left = 46
          Top = 182
          Width = 53
          Height = 13
          Alignment = taRightJustify
          Caption = 'Translation'
        end
        object lblDisplayStyle: TLabel
          Left = 216
          Top = 16
          Width = 64
          Height = 13
          Caption = 'Display style:'
        end
        object lblPauseCol: TLabel
          Left = 70
          Top = 62
          Width = 29
          Height = 13
          Alignment = taRightJustify
          Caption = 'Pause'
        end
        object cmbNumColAlign: TComboBox
          Left = 104
          Top = 36
          Width = 105
          Height = 21
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 0
        end
        object cmbShowColAlign: TComboBox
          Left = 104
          Top = 84
          Width = 105
          Height = 21
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 1
        end
        object cmbHideColAlign: TComboBox
          Left = 104
          Top = 108
          Width = 105
          Height = 21
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 2
        end
        object cmbDurColAlign: TComboBox
          Left = 104
          Top = 132
          Width = 105
          Height = 21
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 3
        end
        object cmbTransColAlign: TComboBox
          Left = 104
          Top = 180
          Width = 105
          Height = 21
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 4
        end
        object cmbTextColAlign: TComboBox
          Left = 104
          Top = 156
          Width = 105
          Height = 21
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 5
        end
        object cmbDurColStyle: TComboBox
          Left = 216
          Top = 132
          Width = 105
          Height = 21
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 6
        end
        object cmbHideColStyle: TComboBox
          Left = 216
          Top = 108
          Width = 105
          Height = 21
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 7
        end
        object cmbShowColStyle: TComboBox
          Left = 216
          Top = 84
          Width = 105
          Height = 21
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 8
        end
        object cmbNumColStyle: TComboBox
          Left = 216
          Top = 36
          Width = 105
          Height = 21
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 9
        end
        object cmbPauseColAlign: TComboBox
          Left = 104
          Top = 60
          Width = 105
          Height = 21
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 10
        end
        object cmbPauseColStyle: TComboBox
          Left = 216
          Top = 60
          Width = 105
          Height = 21
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 11
        end
      end
      object edtTextMargin: TLabeledEdit
        Left = 0
        Top = 182
        Width = 41
        Height = 21
        EditLabel.Width = 61
        EditLabel.Height = 13
        EditLabel.Caption = 'Text margin:'
        TabOrder = 10
        Text = '8'
      end
      object udTextMargin: TUpDown
        Left = 41
        Top = 182
        Width = 16
        Height = 21
        Associate = edtTextMargin
        Max = 20
        Position = 8
        TabOrder = 11
      end
      object gbSelection: TGroupBox
        Left = 136
        Top = 124
        Width = 225
        Height = 81
        Caption = ' Selection '
        TabOrder = 12
        object lblSelColor: TLabel
          Left = 72
          Top = 24
          Width = 29
          Height = 13
          Caption = 'Color:'
        end
        object lblSelTranspPercent: TLabel
          Left = 191
          Top = 43
          Width = 11
          Height = 13
          Caption = '%'
        end
        object lblSelTextColor: TLabel
          Left = 16
          Top = 24
          Width = 26
          Height = 13
          Caption = 'Text:'
        end
        object edtSelTransp: TLabeledEdit
          Left = 128
          Top = 40
          Width = 41
          Height = 21
          EditLabel.Width = 70
          EditLabel.Height = 13
          EditLabel.Caption = 'Transparency:'
          TabOrder = 0
          Text = '0'
        end
        object udSelTransp: TUpDown
          Left = 169
          Top = 40
          Width = 16
          Height = 21
          Associate = edtSelTransp
          TabOrder = 1
        end
        object pnlSelColor: TPanel
          Left = 72
          Top = 44
          Width = 33
          Height = 17
          Color = clHighlight
          Font.Charset = ANSI_CHARSET
          Font.Color = clHighlight
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnMouseDown = pnlUnTransColorMouseDown
        end
        object pnlSelTextColor: TPanel
          Left = 16
          Top = 44
          Width = 33
          Height = 17
          Color = clHighlightText
          Font.Charset = ANSI_CHARSET
          Font.Color = clHighlightText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnMouseDown = pnlUnTransColorMouseDown
        end
      end
      object chkRightClickSel: TCheckBox
        Left = 0
        Top = 96
        Width = 361
        Height = 17
        Caption = 'Right click selection'
        TabOrder = 13
      end
    end
    object pgeMarking: TTabSheet
      Caption = 'pgeMarking'
      ImageIndex = 13
      TabVisible = False
      object lblColumnsToMark: TLabel
        Left = 0
        Top = 47
        Width = 83
        Height = 13
        Caption = 'Columns to mark:'
      end
      object lblMarkingPriority: TLabel
        Left = 0
        Top = 172
        Width = 78
        Height = 13
        Caption = 'Marking priority:'
      end
      object chkMarkingWithColor: TCheckBox
        Left = 0
        Top = 2
        Width = 329
        Height = 17
        Caption = 'Marking with color:'
        TabOrder = 0
      end
      object chkMarkingWithBckgr: TCheckBox
        Left = 0
        Top = 20
        Width = 329
        Height = 17
        Caption = 'Marking with background:'
        TabOrder = 1
      end
      object pnlMarkingBckgr: TPanel
        Left = 328
        Top = 20
        Width = 33
        Height = 17
        Color = 4227072
        Font.Charset = ANSI_CHARSET
        Font.Color = 4227072
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnMouseDown = pnlUnTransColorMouseDown
      end
      object pnlMarkingColor: TPanel
        Left = 328
        Top = 2
        Width = 33
        Height = 17
        Color = 15531993
        Font.Charset = ANSI_CHARSET
        Font.Color = 15531993
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnMouseDown = pnlUnTransColorMouseDown
      end
      object chkMarkingColNum: TCheckBox
        Left = 0
        Top = 62
        Width = 361
        Height = 17
        Caption = 'Mark column "Num"'
        TabOrder = 4
      end
      object chkMarkingColShow: TCheckBox
        Left = 0
        Top = 94
        Width = 361
        Height = 17
        Caption = 'Mark column "Show"'
        TabOrder = 5
      end
      object chkMarkingColHide: TCheckBox
        Left = 0
        Top = 110
        Width = 361
        Height = 17
        Caption = 'Mark column "Hide"'
        TabOrder = 6
      end
      object chkMarkingColText: TCheckBox
        Left = 0
        Top = 142
        Width = 361
        Height = 17
        Caption = 'Mark column "Text"'
        TabOrder = 7
      end
      object rdoMarkingPriorityLow: TRadioButton
        Left = 0
        Top = 188
        Width = 361
        Height = 17
        Caption = 'Low (before error marking)'
        TabOrder = 8
      end
      object rdoMarkingPriorityHigh: TRadioButton
        Left = 0
        Top = 204
        Width = 361
        Height = 17
        Caption = 'High (after error marking)'
        TabOrder = 9
      end
      object chkMarkingInVideoPreview: TCheckBox
        Left = 0
        Top = 234
        Width = 329
        Height = 17
        Caption = 'Marked subtitle color in video preview:'
        TabOrder = 10
      end
      object pnlMarkingColorVideoPreview: TPanel
        Left = 328
        Top = 234
        Width = 33
        Height = 17
        Color = 8965443
        Font.Charset = ANSI_CHARSET
        Font.Color = 8965443
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 11
        OnMouseDown = pnlUnTransColorMouseDown
      end
      object gbMarkingFile: TGroupBox
        Left = 0
        Top = 264
        Width = 361
        Height = 105
        Caption = ' Marking file '
        TabOrder = 12
        object rdoMarkingSaveDonot: TRadioButton
          Left = 8
          Top = 24
          Width = 345
          Height = 17
          Caption = 'Do not save marking file'
          TabOrder = 0
        end
        object rdoMarkingSaveAsk: TRadioButton
          Left = 8
          Top = 40
          Width = 345
          Height = 17
          Caption = 'Ask each time to save marking file'
          TabOrder = 1
        end
        object rdoMarkingSaveAuto: TRadioButton
          Left = 8
          Top = 56
          Width = 345
          Height = 17
          Caption = 'Automatically save marking file on subtitle save'
          TabOrder = 2
        end
        object chkMarkingLoadAuto: TCheckBox
          Left = 8
          Top = 81
          Width = 345
          Height = 17
          Caption = 'Automatically load marking file'
          TabOrder = 3
        end
      end
      object chkMarkingColPause: TCheckBox
        Left = 0
        Top = 78
        Width = 361
        Height = 17
        Caption = 'Mark column "Pause"'
        TabOrder = 13
      end
      object chkMarkingColDur: TCheckBox
        Left = 0
        Top = 126
        Width = 361
        Height = 17
        Caption = 'Mark column "Duration"'
        TabOrder = 14
      end
    end
  end
  object pnlHeading: TPanel
    Left = 0
    Top = 0
    Width = 577
    Height = 65
    Align = alTop
    Color = clWhite
    TabOrder = 0
    DesignSize = (
      577
      65)
    object imgDrawing: TImage
      Left = 516
      Top = 10
      Width = 54
      Height = 47
      Anchors = [akTop, akRight]
      Picture.Data = {
        07544269746D6170961D0000424D961D00000000000036000000280000003500
        00002F0000000100180000000000601D0000C40E0000C40E0000000000000000
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFFFFFFFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF00FFFFFFFFFFFFFFFFFFFFFFFFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFF
        FF00FFFFFFFFFFFFFFFFFFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFFFFFFFFFFFFFFFFF
        FF00FFFFFFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFFFFF
        FF00BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BF00BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBF
        BFBFBFBFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFBFBFBF
        BFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBF
        BFBFBFBFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFBFBFBF
        BFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBF
        BFBFBFBFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFBFBFBF
        BFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBF
        BFBFBFBFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFBFBFBF
        BFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBF
        BFBFBFBFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFBFBFBF
        BFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBF
        BFBFBFBFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFBFBFBF
        BFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBF
        BFBFBFBFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFBFBFBF
        BFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBF
        BFBFBFBFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFBFBFBF
        BFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBF
        BFBFBFBFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFBFBFBF
        BFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBF
        BFBFBFBFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFBFBFBF
        BFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBF
        BFBFBFBFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFBFBFBF
        BFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBF
        BFBFBFBFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFBFBFBF
        BFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBF
        BFBFBFBFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFBFBFBF
        BFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBF
        BFBFBFBFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFBFBFBF
        BFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBF
        BFBFBFBFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFBFBFBF
        BFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBF
        BFBFBFBFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFBFBFBF
        BFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBF
        BFBFBFBFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFBFBFBF
        BFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBF
        BFBFBFBFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFBFBFBF
        BFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBF
        BFBFBFBFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFBFBFBF
        BFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBF
        BFBFBFBFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFBFBFBF
        BFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBF
        BFBFBFBFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFBFBFBF
        BFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBF
        BFBFBFBFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFBFBFBF
        BFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBF
        BFBFBFBFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFBFBFBF
        BFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBF
        BFBFBFBFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFBFBFBF
        BFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBF
        BFBFBFBFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFBFBFBF
        BFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF00}
      Proportional = True
    end
    object lblTitle: TLabel
      Left = 16
      Top = 8
      Width = 47
      Height = 13
      Caption = 'Settings'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblDescription: TLabel
      Left = 18
      Top = 32
      Width = 431
      Height = 33
      AutoSize = False
      Caption = 'Modify the program configuration'
      WordWrap = True
    end
    object bvlSeparator: TBevel
      Left = -8
      Top = 63
      Width = 585
      Height = 9
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
  end
  object tvSettings: TTreeView
    Left = 8
    Top = 72
    Width = 185
    Height = 430
    Anchors = [akLeft, akTop, akBottom]
    HideSelection = False
    HotTrack = True
    Indent = 19
    ReadOnly = True
    ShowButtons = False
    TabOrder = 1
    OnClick = tvSettingsClick
    OnCollapsing = tvSettingsCollapsing
    OnKeyUp = tvSettingsKeyUp
  end
  object btnOk: TButton
    Left = 400
    Top = 519
    Width = 82
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Ok'
    Default = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ModalResult = 1
    ParentFont = False
    TabOrder = 2
    OnClick = btnOkClick
  end
  object btnCancel: TButton
    Left = 489
    Top = 519
    Width = 81
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 3
  end
  object dlgBrowse: TOpenDialog
    Left = 8
    Top = 512
  end
  object dlgSetColor: TColorDialog
    Options = [cdFullOpen]
    Left = 72
    Top = 512
  end
  object dlgSetFont: TFontDialog
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Options = []
    Left = 40
    Top = 512
  end
end
