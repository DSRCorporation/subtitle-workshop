object frmOutputSettings: TfrmOutputSettings
  Left = 303
  Top = 680
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmOutputSettings'
  ClientHeight = 409
  ClientWidth = 609
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
    609
    409)
  PixelsPerInch = 96
  TextHeight = 13
  object bvlSeparate1: TBevel
    Left = 8
    Top = 368
    Width = 595
    Height = 9
    Anchors = [akLeft, akRight, akBottom]
    Shape = bsTopLine
  end
  object tvFormats: TTreeView
    Left = 8
    Top = 8
    Width = 209
    Height = 329
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    HideSelection = False
    HotTrack = True
    Indent = 19
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    OnClick = tvFormatsClick
    OnKeyUp = tvFormatsKeyUp
  end
  object pgeFormats: TPageControl
    Left = 224
    Top = 40
    Width = 385
    Height = 327
    ActivePage = pgeTMPlayer
    Style = tsFlatButtons
    TabOrder = 1
    object pgeAdvancedSubStationAlpha: TTabSheet
      Caption = 'Advanced SubStation Alpha (*.ass)'
      ImageIndex = 8
      TabVisible = False
      DesignSize = (
        377
        317)
      object bvlASS: TBevel
        Left = 0
        Top = 289
        Width = 372
        Height = 9
        Anchors = [akLeft, akRight, akBottom]
        Shape = bsTopLine
      end
      object chkASSAlwaysShow: TCheckBox
        Left = 0
        Top = 299
        Width = 369
        Height = 17
        Anchors = [akLeft, akRight, akBottom]
        Caption = 'Always show Output Settings when saving'
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object edtASSScript: TLabeledEdit
        Left = 88
        Top = 24
        Width = 281
        Height = 21
        EditLabel.Width = 31
        EditLabel.Height = 13
        EditLabel.Caption = 'Script:'
        LabelPosition = lpLeft
        TabOrder = 1
      end
      object edtASSTitle: TLabeledEdit
        Left = 88
        Top = 0
        Width = 281
        Height = 21
        EditLabel.Width = 24
        EditLabel.Height = 13
        EditLabel.Caption = 'Title:'
        LabelPosition = lpLeft
        TabOrder = 2
      end
      object pgeCtrlASS: TPageControl
        Left = 0
        Top = 56
        Width = 369
        Height = 232
        ActivePage = pgeASSAdvanced
        Style = tsFlatButtons
        TabOrder = 3
        object pgeASSCosmetics: TTabSheet
          Caption = 'Cosmetics'
          object lblASSColor: TLabel
            Left = 280
            Top = 0
            Width = 81
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Color'
          end
          object lblASSPrimary: TLabel
            Left = 176
            Top = 21
            Width = 97
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Primary:'
            Transparent = True
          end
          object lblASSSecondary: TLabel
            Left = 176
            Top = 53
            Width = 97
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Secondary:'
            Transparent = True
          end
          object lblASSTertiary: TLabel
            Left = 176
            Top = 85
            Width = 97
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Outline:'
            Transparent = True
          end
          object lblASSShadow: TLabel
            Left = 176
            Top = 117
            Width = 97
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Shadow:'
            Transparent = True
          end
          object lblASSBorderStyle: TLabel
            Left = 0
            Top = 112
            Width = 62
            Height = 13
            Caption = 'Border style:'
          end
          object pnlASSSample: TPanel
            Left = 0
            Top = 41
            Width = 169
            Height = 56
            Caption = 'SAMPLE'
            Color = clBlack
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object btnASSSetFont: TButton
            Left = 0
            Top = 9
            Width = 113
            Height = 25
            Caption = 'Set font'
            TabOrder = 1
            OnClick = btnASSSetFontClick
          end
          object pnlASSShadow: TPanel
            Left = 280
            Top = 113
            Width = 81
            Height = 25
            Color = clWhite
            TabOrder = 2
            OnClick = pnlASSShadowClick
          end
          object pnlASSTertiary: TPanel
            Left = 280
            Top = 81
            Width = 81
            Height = 25
            Color = clWhite
            TabOrder = 3
            OnClick = pnlASSTertiaryClick
          end
          object pnlASSSecondary: TPanel
            Left = 280
            Top = 49
            Width = 81
            Height = 25
            Color = clWhite
            TabOrder = 4
            OnClick = pnlASSSecondaryClick
          end
          object pnlASSPrimary: TPanel
            Left = 280
            Top = 16
            Width = 81
            Height = 25
            Color = clWhite
            TabOrder = 5
            OnClick = pnlASSPrimaryClick
          end
          object cmbASSBorderStyle: TComboBox
            Left = 0
            Top = 128
            Width = 177
            Height = 21
            Style = csDropDownList
            ItemHeight = 0
            TabOrder = 6
          end
        end
        object pgeASSOthers: TTabSheet
          Caption = 'Others'
          ImageIndex = 1
          object lblASSEncoding: TLabel
            Left = 224
            Top = 80
            Width = 47
            Height = 13
            Caption = 'Encoding:'
          end
          object lblASSShadowPos: TLabel
            Left = 0
            Top = 180
            Width = 105
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Shadow:'
          end
          object lblASSOutline: TLabel
            Left = 0
            Top = 156
            Width = 105
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Outline:'
          end
          object lblASSRightMargin: TLabel
            Left = 0
            Top = 44
            Width = 105
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Right margin:'
          end
          object lblASSLeftMargin: TLabel
            Left = 0
            Top = 20
            Width = 105
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Left margin:'
          end
          object lblASSVerticalMargin: TLabel
            Left = 0
            Top = 68
            Width = 105
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Vertical margin:'
          end
          object lblASSAlignment: TLabel
            Left = 224
            Top = 0
            Width = 51
            Height = 13
            Caption = 'Alignment:'
          end
          object lblASSPlayResX: TLabel
            Left = 0
            Top = 100
            Width = 105
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Play resolution X:'
          end
          object lblASSPlayResY: TLabel
            Left = 0
            Top = 124
            Width = 105
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Play resolution Y:'
          end
          object lblASSTimer: TLabel
            Left = 224
            Top = 160
            Width = 30
            Height = 13
            Caption = 'Timer:'
          end
          object lblASSCollisions: TLabel
            Left = 224
            Top = 120
            Width = 47
            Height = 13
            Caption = 'Collisions:'
          end
          object lblASSpx1: TLabel
            Left = 184
            Top = 20
            Width = 12
            Height = 13
            Caption = 'px'
          end
          object lblASSpx2: TLabel
            Left = 184
            Top = 44
            Width = 12
            Height = 13
            Caption = 'px'
          end
          object lblASSpx3: TLabel
            Left = 184
            Top = 68
            Width = 12
            Height = 13
            Caption = 'px'
          end
          object lblASSpx4: TLabel
            Left = 184
            Top = 100
            Width = 12
            Height = 13
            Caption = 'px'
          end
          object lblASSpx5: TLabel
            Left = 184
            Top = 124
            Width = 12
            Height = 13
            Caption = 'px'
          end
          object lblASSpercent1: TLabel
            Left = 344
            Top = 180
            Width = 11
            Height = 13
            Caption = '%'
          end
          object cmbASSEncoding: TComboBox
            Left = 224
            Top = 96
            Width = 113
            Height = 21
            Style = csDropDownList
            ItemHeight = 0
            TabOrder = 0
          end
          object seASSShadow: TSpinEdit
            Left = 112
            Top = 176
            Width = 65
            Height = 22
            MaxValue = 4
            MinValue = 0
            TabOrder = 1
            Value = 0
          end
          object seASSOutline: TSpinEdit
            Left = 112
            Top = 152
            Width = 65
            Height = 22
            MaxValue = 4
            MinValue = 0
            TabOrder = 2
            Value = 0
          end
          object seASSRightMargin: TSpinEdit
            Left = 112
            Top = 40
            Width = 65
            Height = 22
            MaxValue = 1000
            MinValue = 0
            TabOrder = 3
            Value = 0
          end
          object seASSLeftMargin: TSpinEdit
            Left = 112
            Top = 16
            Width = 65
            Height = 22
            MaxValue = 1000
            MinValue = 0
            TabOrder = 4
            Value = 0
          end
          object seASSVerticalMargin: TSpinEdit
            Left = 112
            Top = 64
            Width = 65
            Height = 22
            MaxValue = 1000
            MinValue = 0
            TabOrder = 5
            Value = 0
          end
          object cmbASSAlignment: TComboBox
            Left = 224
            Top = 16
            Width = 113
            Height = 21
            Style = csDropDownList
            ItemHeight = 0
            TabOrder = 6
          end
          object cmbASSSubTopMidTitle: TComboBox
            Left = 224
            Top = 40
            Width = 113
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 7
            Items.Strings = (
              'SubTitle'
              'TopTitle'
              'MidTitle')
          end
          object seASSPlayResX: TSpinEdit
            Left = 112
            Top = 96
            Width = 65
            Height = 22
            MaxValue = 10000
            MinValue = 0
            TabOrder = 8
            Value = 0
          end
          object seASSPlayResY: TSpinEdit
            Left = 112
            Top = 120
            Width = 65
            Height = 22
            MaxValue = 10000
            MinValue = 0
            TabOrder = 9
            Value = 0
          end
          object tmeASSTimer: TMaskEdit
            Left = 224
            Top = 176
            Width = 113
            Height = 21
            EditMask = '!999.9999;1;0'
            MaxLength = 8
            TabOrder = 10
            Text = '1  .    '
          end
          object cmbASSCollisions: TComboBox
            Left = 224
            Top = 136
            Width = 113
            Height = 21
            Style = csDropDownList
            ItemHeight = 0
            TabOrder = 11
          end
        end
        object pgeASSAdvanced: TTabSheet
          Caption = 'Advanced'
          ImageIndex = 2
          object lblASSScaleX: TLabel
            Left = 0
            Top = 52
            Width = 105
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Scale X:'
          end
          object lblASSpercent2: TLabel
            Left = 184
            Top = 52
            Width = 11
            Height = 13
            Caption = '%'
          end
          object lblASSScaleY: TLabel
            Left = 0
            Top = 76
            Width = 105
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Scale Y:'
          end
          object lblASSpercent3: TLabel
            Left = 184
            Top = 76
            Width = 11
            Height = 13
            Caption = '%'
          end
          object lblASSSpacing: TLabel
            Left = 0
            Top = 108
            Width = 105
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Spacing:'
          end
          object lblASSpx6: TLabel
            Left = 184
            Top = 108
            Width = 12
            Height = 13
            Caption = 'px'
          end
          object lblASSAngle: TLabel
            Left = 0
            Top = 140
            Width = 105
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Angle:'
          end
          object lblASSdegrees: TLabel
            Left = 184
            Top = 140
            Width = 39
            Height = 13
            Caption = 'degrees'
          end
          object chkASSUnderline: TCheckBox
            Left = 112
            Top = 8
            Width = 249
            Height = 17
            Caption = 'Underline'
            TabOrder = 0
          end
          object chkASSStrikeout: TCheckBox
            Left = 112
            Top = 24
            Width = 249
            Height = 17
            Caption = 'StrikeOut'
            TabOrder = 1
          end
          object seASSScaleX: TSpinEdit
            Left = 112
            Top = 48
            Width = 65
            Height = 22
            MaxValue = 10000
            MinValue = 0
            TabOrder = 2
            Value = 100
          end
          object seASSScaleY: TSpinEdit
            Left = 112
            Top = 72
            Width = 65
            Height = 22
            MaxValue = 10000
            MinValue = 0
            TabOrder = 3
            Value = 100
          end
          object seASSSpacing: TSpinEdit
            Left = 112
            Top = 104
            Width = 65
            Height = 22
            MaxValue = 1000
            MinValue = 0
            TabOrder = 4
            Value = 0
          end
          object tmeASSAngle: TMaskEdit
            Left = 112
            Top = 136
            Width = 63
            Height = 21
            EditMask = '!999.99;1;0'
            MaxLength = 6
            TabOrder = 5
            Text = '   .  '
          end
        end
      end
    end
    object pgeXAS: TTabSheet
      Caption = 'Advanced Subtitles (*.xas)'
      ImageIndex = 7
      TabVisible = False
      DesignSize = (
        377
        317)
      object bvlXAS: TBevel
        Left = 0
        Top = 289
        Width = 372
        Height = 9
        Anchors = [akLeft, akRight, akBottom]
        Shape = bsTopLine
      end
      object gbXASFont: TGroupBox
        Left = 0
        Top = 0
        Width = 189
        Height = 166
        Caption = 'Font'
        TabOrder = 0
        object lblXASFontSize: TLabel
          Left = 8
          Top = 48
          Width = 23
          Height = 13
          Caption = 'Size:'
        end
        object lblXASTransparency: TLabel
          Left = 8
          Top = 96
          Width = 70
          Height = 13
          Caption = 'Transparency:'
        end
        object lblXASTextColor: TLabel
          Left = 8
          Top = 76
          Width = 52
          Height = 13
          Caption = 'Text color:'
        end
        object lblXAS0Transparent: TLabel
          Left = 8
          Top = 112
          Width = 81
          Height = 13
          Caption = '(0 - transparent)'
        end
        object edtXASFontsize: TEdit
          Left = 124
          Top = 44
          Width = 41
          Height = 21
          TabOrder = 1
          Text = '60'
        end
        object pnlXASTextColor: TPanel
          Left = 124
          Top = 69
          Width = 57
          Height = 25
          Cursor = crHandPoint
          Color = clWhite
          TabOrder = 3
          OnClick = pnlXASTextColorClick
        end
        object udXASTransparency: TUpDown
          Left = 165
          Top = 102
          Width = 16
          Height = 21
          Associate = edtXASTransparency
          Max = 255
          Position = 255
          TabOrder = 0
        end
        object edtXASTransparency: TEdit
          Left = 124
          Top = 102
          Width = 41
          Height = 21
          TabOrder = 2
          Text = '255'
        end
        object udXASFontSize: TUpDown
          Left = 165
          Top = 44
          Width = 16
          Height = 21
          Associate = edtXASFontsize
          Min = 5
          Max = 300
          Position = 60
          TabOrder = 4
        end
        object pnFont: TPanel
          Left = 52
          Top = 43
          Width = 69
          Height = 22
          BevelOuter = bvNone
          Ctl3D = True
          ParentCtl3D = False
          TabOrder = 5
          object rdoXASFontPercent: TRadioButton
            Left = 4
            Top = 4
            Width = 33
            Height = 17
            Caption = '%'
            TabOrder = 0
            OnClick = rdoXASClick
          end
          object rdoXASFontPx: TRadioButton
            Left = 32
            Top = 4
            Width = 33
            Height = 17
            Caption = 'px'
            Checked = True
            TabOrder = 1
            TabStop = True
            OnClick = rdoXASClick
          end
        end
        object edtXASFontName: TEdit
          Left = 8
          Top = 16
          Width = 173
          Height = 21
          TabOrder = 6
          Text = 'arialbd.ttf'
        end
        object chkXASSimulateShadow: TCheckBox
          Left = 8
          Top = 135
          Width = 109
          Height = 17
          Caption = 'Shadow:'
          Checked = True
          State = cbChecked
          TabOrder = 7
        end
        object pnlXASShadowColor: TPanel
          Left = 123
          Top = 131
          Width = 57
          Height = 25
          Color = clBlack
          TabOrder = 8
          OnClick = pnlXASShadowColorClick
        end
      end
      object gbXASPosition: TGroupBox
        Left = 196
        Top = 0
        Width = 177
        Height = 166
        Caption = 'Position'
        TabOrder = 1
        object lblXASX: TLabel
          Left = 8
          Top = 20
          Width = 10
          Height = 13
          Caption = 'X:'
        end
        object lblXASY: TLabel
          Left = 8
          Top = 48
          Width = 10
          Height = 13
          Caption = 'Y:'
        end
        object lblXASWidth: TLabel
          Left = 8
          Top = 76
          Width = 32
          Height = 13
          Caption = 'Width:'
        end
        object lblXASHeight: TLabel
          Left = 8
          Top = 104
          Width = 35
          Height = 13
          Caption = 'Height:'
        end
        object lblXASAlignment: TLabel
          Left = 8
          Top = 136
          Width = 51
          Height = 13
          Caption = 'Alignment:'
        end
        object edtXASX: TEdit
          Left = 120
          Top = 16
          Width = 33
          Height = 21
          TabOrder = 7
          Text = '10'
        end
        object edtXASY: TEdit
          Left = 120
          Top = 44
          Width = 33
          Height = 21
          TabOrder = 0
          Text = '89'
        end
        object edtXASWidth: TEdit
          Left = 120
          Top = 72
          Width = 33
          Height = 21
          TabOrder = 1
          Text = '80'
        end
        object edtXASHeight: TEdit
          Left = 120
          Top = 100
          Width = 33
          Height = 21
          TabOrder = 2
          Text = '11'
        end
        object udXASX: TUpDown
          Left = 153
          Top = 16
          Width = 16
          Height = 21
          Associate = edtXASX
          Max = 10000
          Position = 10
          TabOrder = 8
          Thousands = False
        end
        object udXASY: TUpDown
          Left = 153
          Top = 44
          Width = 16
          Height = 21
          Associate = edtXASY
          Max = 10000
          Position = 89
          TabOrder = 4
          Thousands = False
        end
        object udXASWidth: TUpDown
          Left = 153
          Top = 72
          Width = 16
          Height = 21
          Associate = edtXASWidth
          Max = 10000
          Position = 80
          TabOrder = 5
          Thousands = False
        end
        object udXASHeight: TUpDown
          Left = 153
          Top = 100
          Width = 16
          Height = 21
          Associate = edtXASHeight
          Max = 10000
          Position = 11
          TabOrder = 6
          Thousands = False
        end
        object cmbXASAlignment: TComboBox
          Left = 88
          Top = 132
          Width = 83
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 3
          Text = 'center'
          Items.Strings = (
            'center'
            'left'
            'right')
        end
        object pnlXASX: TPanel
          Left = 57
          Top = 16
          Width = 62
          Height = 22
          BevelOuter = bvNone
          TabOrder = 10
          object rdoXASXPercent: TRadioButton
            Left = 0
            Top = 4
            Width = 29
            Height = 17
            Caption = '%'
            TabOrder = 0
          end
          object rdoXASXPx: TRadioButton
            Left = 29
            Top = 4
            Width = 33
            Height = 17
            Caption = 'px'
            Checked = True
            TabOrder = 1
            TabStop = True
          end
        end
        object pnlXASY: TPanel
          Left = 57
          Top = 42
          Width = 62
          Height = 22
          BevelOuter = bvNone
          TabOrder = 12
          object rdoXASYPercent: TRadioButton
            Left = 0
            Top = 4
            Width = 29
            Height = 17
            Caption = '%'
            TabOrder = 0
          end
          object rdoXASYPx: TRadioButton
            Left = 29
            Top = 4
            Width = 33
            Height = 17
            Caption = 'px'
            Checked = True
            TabOrder = 1
            TabStop = True
          end
        end
        object pnlXASWidth: TPanel
          Left = 57
          Top = 70
          Width = 62
          Height = 22
          BevelOuter = bvNone
          TabOrder = 9
          object rdoXASWidthPercent: TRadioButton
            Left = 0
            Top = 4
            Width = 29
            Height = 17
            Caption = '%'
            TabOrder = 0
          end
          object rdoXASWidthPx: TRadioButton
            Left = 29
            Top = 4
            Width = 33
            Height = 17
            Caption = 'px'
            Checked = True
            TabOrder = 1
            TabStop = True
          end
        end
        object pnlXASHeight: TPanel
          Left = 57
          Top = 98
          Width = 62
          Height = 22
          BevelOuter = bvNone
          TabOrder = 11
          object rdoXASHeightPercent: TRadioButton
            Left = 0
            Top = 4
            Width = 29
            Height = 17
            Caption = '%'
            TabOrder = 0
          end
          object rdoXASHeightPx: TRadioButton
            Left = 29
            Top = 4
            Width = 33
            Height = 17
            Caption = 'px'
            Checked = True
            TabOrder = 1
            TabStop = True
          end
        end
      end
      object gbXASLanguage: TGroupBox
        Left = 0
        Top = 180
        Width = 189
        Height = 73
        Caption = 'Language'
        TabOrder = 2
        object lblXASEncoding: TLabel
          Left = 8
          Top = 20
          Width = 47
          Height = 13
          Caption = 'Encoding:'
        end
        object lblXASLanguage: TLabel
          Left = 8
          Top = 48
          Width = 51
          Height = 13
          Caption = 'Language:'
        end
        object edtXASEncoding: TEdit
          Left = 68
          Top = 17
          Width = 113
          Height = 21
          TabOrder = 0
          Text = 'windows-1252'
        end
        object edtXASLanguage: TEdit
          Left = 140
          Top = 44
          Width = 41
          Height = 21
          TabOrder = 1
          Text = 'en'
        end
      end
      object gbXASJoin: TGroupBox
        Left = 196
        Top = 180
        Width = 177
        Height = 73
        Caption = 'Join'
        TabOrder = 3
        object edtXASWrapLines: TEdit
          Left = 112
          Top = 44
          Width = 41
          Height = 21
          TabOrder = 0
          Text = '50'
        end
        object chkXASJoinShort: TCheckBox
          Left = 8
          Top = 19
          Width = 161
          Height = 17
          Caption = 'Join short lines'
          Checked = True
          State = cbChecked
          TabOrder = 1
        end
        object chkXASWrapLines: TCheckBox
          Left = 8
          Top = 47
          Width = 101
          Height = 17
          Caption = 'Wrap lines to:'
          TabOrder = 2
        end
        object udXASWrapLines: TUpDown
          Left = 153
          Top = 44
          Width = 16
          Height = 21
          Associate = edtXASWrapLines
          Min = 1
          Max = 200
          Position = 50
          TabOrder = 3
          Thousands = False
        end
      end
      object chkXASAlwaysShow: TCheckBox
        Left = 0
        Top = 299
        Width = 369
        Height = 17
        Anchors = [akLeft, akRight, akBottom]
        Caption = 'Always show Output Settings when saving'
        Checked = True
        State = cbChecked
        TabOrder = 4
      end
    end
    object pgeDVDSubtitle: TTabSheet
      Caption = 'DVDSubtitle (*.sub)'
      TabVisible = False
      DesignSize = (
        377
        317)
      object bvlDVDSubtitle: TBevel
        Left = 0
        Top = 289
        Width = 372
        Height = 9
        Anchors = [akLeft, akRight, akBottom]
        Shape = bsTopLine
      end
      object edtDVDSubtitleDiskId: TLabeledEdit
        Left = 88
        Top = 0
        Width = 281
        Height = 21
        EditLabel.Width = 37
        EditLabel.Height = 13
        EditLabel.Caption = 'Disk ID:'
        LabelPosition = lpLeft
        TabOrder = 0
      end
      object edtDVDSubtitleDVDTitle: TLabeledEdit
        Left = 88
        Top = 24
        Width = 281
        Height = 21
        EditLabel.Width = 47
        EditLabel.Height = 13
        EditLabel.Caption = 'DVD Title:'
        LabelPosition = lpLeft
        TabOrder = 1
      end
      object edtDVDSubtitleLanguage: TLabeledEdit
        Left = 88
        Top = 48
        Width = 281
        Height = 21
        EditLabel.Width = 51
        EditLabel.Height = 13
        EditLabel.Caption = 'Language:'
        LabelPosition = lpLeft
        TabOrder = 2
      end
      object edtDVDSubtitleAuthor: TLabeledEdit
        Left = 88
        Top = 72
        Width = 281
        Height = 21
        EditLabel.Width = 37
        EditLabel.Height = 13
        EditLabel.Caption = 'Author:'
        LabelPosition = lpLeft
        TabOrder = 3
      end
      object edtDVDSubtitleWeb: TLabeledEdit
        Left = 88
        Top = 96
        Width = 281
        Height = 21
        EditLabel.Width = 26
        EditLabel.Height = 13
        EditLabel.Caption = 'Web:'
        LabelPosition = lpLeft
        TabOrder = 4
      end
      object edtDVDSubtitleInfo: TLabeledEdit
        Left = 88
        Top = 120
        Width = 281
        Height = 21
        EditLabel.Width = 24
        EditLabel.Height = 13
        EditLabel.Caption = 'Info:'
        LabelPosition = lpLeft
        TabOrder = 5
      end
      object edtDVDSubtitleLicense: TLabeledEdit
        Left = 88
        Top = 144
        Width = 281
        Height = 21
        EditLabel.Width = 39
        EditLabel.Height = 13
        EditLabel.Caption = 'License:'
        LabelPosition = lpLeft
        TabOrder = 6
      end
      object chkDVDSubtitleAlwaysShow: TCheckBox
        Left = 0
        Top = 299
        Width = 369
        Height = 17
        Anchors = [akLeft, akRight, akBottom]
        Caption = 'Always show Output Settings when saving'
        Checked = True
        State = cbChecked
        TabOrder = 7
      end
    end
    object pgeSAMI: TTabSheet
      Caption = 'SAMI (*.smi)'
      ImageIndex = 3
      TabVisible = False
      DesignSize = (
        377
        317)
      object lblSAMISubtitle: TLabel
        Left = 0
        Top = 88
        Width = 40
        Height = 13
        Caption = 'Subtitle:'
      end
      object lblSAMIBackground: TLabel
        Left = 112
        Top = 88
        Width = 60
        Height = 13
        Caption = 'Background:'
      end
      object lblSAMIAlign: TLabel
        Left = 232
        Top = 32
        Width = 51
        Height = 13
        Caption = 'Alignment:'
      end
      object bvlSAMI: TBevel
        Left = 0
        Top = 289
        Width = 372
        Height = 9
        Anchors = [akLeft, akRight, akBottom]
        Shape = bsTopLine
      end
      object pnlSAMISubtitleColor: TPanel
        Left = 0
        Top = 104
        Width = 105
        Height = 33
        Color = 253436
        TabOrder = 0
        OnClick = pnlSAMISubtitleColorClick
      end
      object pnlSAMIBackgroundColor: TPanel
        Left = 112
        Top = 104
        Width = 105
        Height = 33
        Color = clBlack
        TabOrder = 1
        OnClick = pnlSAMIBackgroundColorClick
      end
      object rdoSAMILeft: TRadioButton
        Left = 232
        Top = 48
        Width = 145
        Height = 17
        Caption = 'Left'
        TabOrder = 2
        OnClick = rdoSAMILeftClick
      end
      object rdoSAMICenter: TRadioButton
        Left = 232
        Top = 64
        Width = 145
        Height = 17
        Caption = 'Center'
        TabOrder = 3
        OnClick = rdoSAMICenterClick
      end
      object rdoSAMIRight: TRadioButton
        Left = 232
        Top = 80
        Width = 145
        Height = 17
        Caption = 'Right'
        TabOrder = 4
        OnClick = rdoSAMIRightClick
      end
      object pnlSAMISample: TPanel
        Left = 0
        Top = 0
        Width = 225
        Height = 81
        Caption = 'SAMPLE'
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
      end
      object btnSAMISetFont: TButton
        Left = 232
        Top = 0
        Width = 105
        Height = 25
        Caption = 'Set font'
        TabOrder = 6
        OnClick = btnSAMISetFontClick
      end
      object chkSAMIAlwaysShow: TCheckBox
        Left = 0
        Top = 299
        Width = 369
        Height = 17
        Anchors = [akLeft, akRight, akBottom]
        Caption = 'Always show Output Settings when saving'
        Checked = True
        State = cbChecked
        TabOrder = 7
      end
    end
    object pgeSonicScenarist: TTabSheet
      Caption = 'Sonic Scenarist (*.sst)'
      ImageIndex = 4
      TabVisible = False
      DesignSize = (
        377
        317)
      object lblScenaristColor0: TLabel
        Left = 0
        Top = 64
        Width = 169
        Height = 13
        AutoSize = False
        Caption = 'Color 0 (background):'
      end
      object lblScenaristColor1: TLabel
        Left = 0
        Top = 96
        Width = 169
        Height = 13
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = 'Color 1 (Font):'
        ParentBiDiMode = False
      end
      object lblScenaristColor2: TLabel
        Left = 0
        Top = 128
        Width = 169
        Height = 13
        AutoSize = False
        Caption = 'Color 2 (outline):'
      end
      object lblScenaristColor3: TLabel
        Left = 0
        Top = 160
        Width = 169
        Height = 13
        AutoSize = False
        Caption = 'Color 3 (antialiasing):'
      end
      object lblScenaristPaletteNumber: TLabel
        Left = 144
        Top = 40
        Width = 129
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Palette color n'#176':'
      end
      object lblScenaristContrast: TLabel
        Left = 272
        Top = 40
        Width = 97
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Contrast'
      end
      object lblScenaristFramerate: TLabel
        Left = 0
        Top = 0
        Width = 54
        Height = 13
        Caption = 'Framerate:'
      end
      object bvlScenarist: TBevel
        Left = 0
        Top = 289
        Width = 372
        Height = 9
        Anchors = [akLeft, akRight, akBottom]
        Shape = bsTopLine
      end
      object seScenaristContrast0: TSpinEdit
        Left = 288
        Top = 56
        Width = 65
        Height = 22
        MaxValue = 15
        MinValue = 0
        TabOrder = 6
        Value = 0
      end
      object seScenaristContrast1: TSpinEdit
        Left = 288
        Top = 88
        Width = 65
        Height = 22
        MaxValue = 15
        MinValue = 0
        TabOrder = 7
        Value = 0
      end
      object seScenaristContrast2: TSpinEdit
        Left = 288
        Top = 120
        Width = 65
        Height = 22
        MaxValue = 15
        MinValue = 0
        TabOrder = 8
        Value = 0
      end
      object seScenaristContrast3: TSpinEdit
        Left = 288
        Top = 152
        Width = 65
        Height = 22
        MaxValue = 15
        MinValue = 0
        TabOrder = 9
        Value = 0
      end
      object cmbScenaristFPS: TComboBox
        Left = 0
        Top = 16
        Width = 137
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 0
        Text = '25.000 PAL'
        OnChange = cmbScenaristFPSChange
        Items.Strings = (
          '25.000 PAL'
          '30.000 NTSC')
      end
      object seScenaristColor0: TSpinEdit
        Left = 176
        Top = 56
        Width = 65
        Height = 22
        MaxValue = 16
        MinValue = 1
        TabOrder = 2
        Value = 1
      end
      object seScenaristColor1: TSpinEdit
        Left = 176
        Top = 88
        Width = 65
        Height = 22
        MaxValue = 16
        MinValue = 1
        TabOrder = 3
        Value = 1
      end
      object seScenaristColor2: TSpinEdit
        Left = 176
        Top = 120
        Width = 65
        Height = 22
        MaxValue = 16
        MinValue = 1
        TabOrder = 4
        Value = 1
      end
      object seScenaristColor3: TSpinEdit
        Left = 176
        Top = 152
        Width = 65
        Height = 22
        MaxValue = 16
        MinValue = 1
        TabOrder = 5
        Value = 1
      end
      object chkScenaristDropFrame: TCheckBox
        Left = 144
        Top = 16
        Width = 217
        Height = 17
        Caption = 'Drop frame'
        TabOrder = 1
      end
      object chkScenaristAlwaysShow: TCheckBox
        Left = 0
        Top = 299
        Width = 369
        Height = 17
        Anchors = [akLeft, akRight, akBottom]
        Caption = 'Always show Output Settings when saving'
        Checked = True
        State = cbChecked
        TabOrder = 10
      end
    end
    object pgeSubStationAlpha: TTabSheet
      Caption = 'SubStation Alpha (*.ssa)'
      ImageIndex = 6
      TabVisible = False
      DesignSize = (
        377
        317)
      object bvlSSA: TBevel
        Left = 0
        Top = 289
        Width = 372
        Height = 9
        Anchors = [akLeft, akRight, akBottom]
        Shape = bsTopLine
      end
      object edtSSATitle: TLabeledEdit
        Left = 88
        Top = 0
        Width = 281
        Height = 21
        EditLabel.Width = 24
        EditLabel.Height = 13
        EditLabel.Caption = 'Title:'
        LabelPosition = lpLeft
        TabOrder = 0
      end
      object edtSSAScript: TLabeledEdit
        Left = 88
        Top = 24
        Width = 281
        Height = 21
        EditLabel.Width = 31
        EditLabel.Height = 13
        EditLabel.Caption = 'Script:'
        LabelPosition = lpLeft
        TabOrder = 1
      end
      object pgeCtrlSSA: TPageControl
        Left = 0
        Top = 56
        Width = 369
        Height = 232
        ActivePage = pgeSSAOthers
        Style = tsFlatButtons
        TabOrder = 2
        object pgeSSACosmetics: TTabSheet
          Caption = 'Cosmetics'
          object lblSSAColor: TLabel
            Left = 280
            Top = 0
            Width = 81
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Color'
          end
          object lblSSAPrimary: TLabel
            Left = 176
            Top = 21
            Width = 97
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Primary:'
            Transparent = True
          end
          object lblSSASecondary: TLabel
            Left = 176
            Top = 53
            Width = 97
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Secondary:'
            Transparent = True
          end
          object lblSSATertiary: TLabel
            Left = 176
            Top = 85
            Width = 97
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Outline:'
            Transparent = True
          end
          object lblSSAShadow: TLabel
            Left = 176
            Top = 117
            Width = 97
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Shadow:'
            Transparent = True
          end
          object lblSSABorderStyle: TLabel
            Left = 0
            Top = 112
            Width = 62
            Height = 13
            Caption = 'Border style:'
          end
          object pnlSSASample: TPanel
            Left = 0
            Top = 41
            Width = 169
            Height = 56
            Caption = 'SAMPLE'
            Color = clBlack
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object btnSSASetFont: TButton
            Left = 0
            Top = 9
            Width = 113
            Height = 25
            Caption = 'Set font'
            TabOrder = 1
            OnClick = btnSSASetFontClick
          end
          object pnlSSAShadow: TPanel
            Left = 280
            Top = 113
            Width = 81
            Height = 25
            Color = clWhite
            TabOrder = 2
            OnClick = pnlSSAShadowClick
          end
          object pnlSSATertiary: TPanel
            Left = 280
            Top = 81
            Width = 81
            Height = 25
            Color = clWhite
            TabOrder = 3
            OnClick = pnlSSATertiaryClick
          end
          object pnlSSASecondary: TPanel
            Left = 280
            Top = 49
            Width = 81
            Height = 25
            Color = clWhite
            TabOrder = 4
            OnClick = pnlSSASecondaryClick
          end
          object pnlSSAPrimary: TPanel
            Left = 280
            Top = 16
            Width = 81
            Height = 25
            Color = clWhite
            TabOrder = 5
            OnClick = pnlSSAPrimaryClick
          end
          object cmbSSABorderStyle: TComboBox
            Left = 0
            Top = 128
            Width = 177
            Height = 21
            Style = csDropDownList
            ItemHeight = 0
            TabOrder = 6
          end
        end
        object pgeSSAOthers: TTabSheet
          Caption = 'Others'
          ImageIndex = 1
          object lblSSAEncoding: TLabel
            Left = 224
            Top = 80
            Width = 47
            Height = 13
            Caption = 'Encoding:'
          end
          object lblSSAShadowPos: TLabel
            Left = 0
            Top = 180
            Width = 105
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Shadow:'
          end
          object lblSSAOutline: TLabel
            Left = 0
            Top = 156
            Width = 105
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Outline:'
          end
          object lblSSARightMargin: TLabel
            Left = 0
            Top = 44
            Width = 105
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Right margin:'
          end
          object lblSSALeftMargin: TLabel
            Left = 0
            Top = 20
            Width = 105
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Left margin:'
          end
          object lblSSAVerticalMargin: TLabel
            Left = 0
            Top = 68
            Width = 105
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Vertical margin:'
          end
          object lblSSAAlignment: TLabel
            Left = 224
            Top = 0
            Width = 51
            Height = 13
            Caption = 'Alignment:'
          end
          object lblSSAPlayResX: TLabel
            Left = 0
            Top = 100
            Width = 105
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Play resolution X:'
          end
          object lblSSAPlayResY: TLabel
            Left = 0
            Top = 124
            Width = 105
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Play resolution Y:'
          end
          object lblSSATimer: TLabel
            Left = 224
            Top = 160
            Width = 30
            Height = 13
            Caption = 'Timer:'
          end
          object lblSSACollisions: TLabel
            Left = 224
            Top = 120
            Width = 47
            Height = 13
            Caption = 'Collisions:'
          end
          object lblSSApx1: TLabel
            Left = 184
            Top = 20
            Width = 12
            Height = 13
            Caption = 'px'
          end
          object lblSSApx2: TLabel
            Left = 184
            Top = 44
            Width = 12
            Height = 13
            Caption = 'px'
          end
          object lblSSApx3: TLabel
            Left = 184
            Top = 68
            Width = 12
            Height = 13
            Caption = 'px'
          end
          object lblSSApercent: TLabel
            Left = 344
            Top = 180
            Width = 11
            Height = 13
            Caption = '%'
          end
          object lblSSApx4: TLabel
            Left = 184
            Top = 100
            Width = 12
            Height = 13
            Caption = 'px'
          end
          object lblSSApx5: TLabel
            Left = 184
            Top = 124
            Width = 12
            Height = 13
            Caption = 'px'
          end
          object cmbSSAEncoding: TComboBox
            Left = 224
            Top = 96
            Width = 113
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 9
          end
          object seSSAShadow: TSpinEdit
            Left = 112
            Top = 176
            Width = 65
            Height = 22
            MaxValue = 4
            MinValue = 0
            TabOrder = 6
            Value = 0
          end
          object seSSAOutline: TSpinEdit
            Left = 112
            Top = 152
            Width = 65
            Height = 22
            MaxValue = 4
            MinValue = 0
            TabOrder = 5
            Value = 0
          end
          object seSSARightMargin: TSpinEdit
            Left = 112
            Top = 40
            Width = 65
            Height = 22
            MaxValue = 1000
            MinValue = 0
            TabOrder = 1
            Value = 0
          end
          object seSSALeftMargin: TSpinEdit
            Left = 112
            Top = 16
            Width = 65
            Height = 22
            MaxValue = 1000
            MinValue = 0
            TabOrder = 0
            Value = 0
          end
          object seSSAVerticalMargin: TSpinEdit
            Left = 112
            Top = 64
            Width = 65
            Height = 22
            MaxValue = 1000
            MinValue = 0
            TabOrder = 2
            Value = 0
          end
          object cmbSSAAlignment: TComboBox
            Left = 224
            Top = 16
            Width = 113
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 7
          end
          object cmbSSASubTopMidTitle: TComboBox
            Left = 224
            Top = 40
            Width = 113
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 8
            Items.Strings = (
              'SubTitle'
              'TopTitle'
              'MidTitle')
          end
          object seSSAPlayResX: TSpinEdit
            Left = 112
            Top = 96
            Width = 65
            Height = 22
            MaxValue = 10000
            MinValue = 0
            TabOrder = 3
            Value = 0
          end
          object seSSAPlayResY: TSpinEdit
            Left = 112
            Top = 120
            Width = 65
            Height = 22
            MaxValue = 10000
            MinValue = 0
            TabOrder = 4
            Value = 0
          end
          object tmeSSATimer: TMaskEdit
            Left = 224
            Top = 176
            Width = 113
            Height = 21
            EditMask = '!999.9999;1;0'
            MaxLength = 8
            TabOrder = 11
            Text = '1  .    '
          end
          object cmbSSACollisions: TComboBox
            Left = 224
            Top = 136
            Width = 113
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 10
          end
        end
      end
      object chkSSAAlwaysShow: TCheckBox
        Left = 0
        Top = 299
        Width = 369
        Height = 17
        Anchors = [akLeft, akRight, akBottom]
        Caption = 'Always show Output Settings when saving'
        Checked = True
        State = cbChecked
        TabOrder = 3
      end
    end
    object pgeSubViewer: TTabSheet
      Caption = 'SubViewer (*.sub)'
      ImageIndex = 7
      TabVisible = False
      DesignSize = (
        377
        317)
      object lblSubViewer1Delay: TLabel
        Left = 50
        Top = 126
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Delay:'
      end
      object bvlSubViewer1: TBevel
        Left = 0
        Top = 289
        Width = 372
        Height = 9
        Anchors = [akLeft, akRight, akBottom]
        Shape = bsTopLine
      end
      object edtSubViewer1Title: TLabeledEdit
        Left = 88
        Top = 0
        Width = 281
        Height = 21
        EditLabel.Width = 24
        EditLabel.Height = 13
        EditLabel.Caption = 'Title:'
        LabelPosition = lpLeft
        TabOrder = 0
      end
      object edtSubViewer1Author: TLabeledEdit
        Left = 88
        Top = 24
        Width = 281
        Height = 21
        EditLabel.Width = 37
        EditLabel.Height = 13
        EditLabel.Caption = 'Author:'
        LabelPosition = lpLeft
        TabOrder = 1
      end
      object edtSubViewer1Source: TLabeledEdit
        Left = 88
        Top = 48
        Width = 281
        Height = 21
        EditLabel.Width = 37
        EditLabel.Height = 13
        EditLabel.Caption = 'Source:'
        LabelPosition = lpLeft
        TabOrder = 2
      end
      object edtSubViewer1Program: TLabeledEdit
        Left = 88
        Top = 72
        Width = 281
        Height = 21
        EditLabel.Width = 44
        EditLabel.Height = 13
        EditLabel.Caption = 'Program:'
        LabelPosition = lpLeft
        TabOrder = 3
      end
      object edtSubViewer1Path: TLabeledEdit
        Left = 88
        Top = 96
        Width = 281
        Height = 21
        EditLabel.Width = 26
        EditLabel.Height = 13
        EditLabel.Caption = 'Path:'
        LabelPosition = lpLeft
        TabOrder = 4
      end
      object seSubViewer1Delay: TSpinEdit
        Left = 88
        Top = 123
        Width = 57
        Height = 22
        MaxValue = 65535
        MinValue = 0
        TabOrder = 5
        Value = 0
      end
      object chkSubViewer1AlwaysShow: TCheckBox
        Left = 0
        Top = 299
        Width = 369
        Height = 17
        Anchors = [akLeft, akRight, akBottom]
        Caption = 'Always show Output Settings when saving'
        Checked = True
        State = cbChecked
        TabOrder = 6
      end
    end
    object pgeSubViewer2: TTabSheet
      Caption = 'SubViewer 2 (*.sub)'
      ImageIndex = 8
      TabVisible = False
      DesignSize = (
        377
        317)
      object lblSubViewer2Delay: TLabel
        Left = 0
        Top = 126
        Width = 81
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Delay:'
      end
      object lblSubViewer2CDTrack: TLabel
        Left = 152
        Top = 126
        Width = 105
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'CD-Track:'
      end
      object bvlSubViewer2: TBevel
        Left = 0
        Top = 289
        Width = 372
        Height = 9
        Anchors = [akLeft, akRight, akBottom]
        Shape = bsTopLine
      end
      object edtSubViewer2Title: TLabeledEdit
        Left = 88
        Top = 0
        Width = 281
        Height = 21
        EditLabel.Width = 24
        EditLabel.Height = 13
        EditLabel.Caption = 'Title:'
        LabelPosition = lpLeft
        TabOrder = 0
      end
      object edtSubViewer2Author: TLabeledEdit
        Left = 88
        Top = 24
        Width = 281
        Height = 21
        EditLabel.Width = 37
        EditLabel.Height = 13
        EditLabel.Caption = 'Author:'
        LabelPosition = lpLeft
        TabOrder = 1
      end
      object edtSubViewer2Source: TLabeledEdit
        Left = 88
        Top = 48
        Width = 281
        Height = 21
        EditLabel.Width = 37
        EditLabel.Height = 13
        EditLabel.Caption = 'Source:'
        LabelPosition = lpLeft
        TabOrder = 2
      end
      object edtSubViewer2Program: TLabeledEdit
        Left = 88
        Top = 72
        Width = 281
        Height = 21
        EditLabel.Width = 44
        EditLabel.Height = 13
        EditLabel.Caption = 'Program:'
        LabelPosition = lpLeft
        TabOrder = 3
      end
      object edtSubViewer2Path: TLabeledEdit
        Left = 88
        Top = 96
        Width = 281
        Height = 21
        EditLabel.Width = 26
        EditLabel.Height = 13
        EditLabel.Caption = 'Path:'
        LabelPosition = lpLeft
        TabOrder = 4
      end
      object seSubViewer2Delay: TSpinEdit
        Left = 88
        Top = 123
        Width = 57
        Height = 22
        MaxValue = 65535
        MinValue = 0
        TabOrder = 5
        Value = 0
      end
      object seSubViewer2CDTrack: TSpinEdit
        Left = 264
        Top = 123
        Width = 57
        Height = 22
        MaxValue = 65535
        MinValue = 0
        TabOrder = 6
        Value = 0
      end
      object edtSubViewer2Comment: TLabeledEdit
        Left = 88
        Top = 152
        Width = 281
        Height = 21
        EditLabel.Width = 49
        EditLabel.Height = 13
        EditLabel.Caption = 'Comment:'
        LabelPosition = lpLeft
        TabOrder = 7
      end
      object btnSubViewer2SetFont: TButton
        Left = 8
        Top = 192
        Width = 113
        Height = 25
        Caption = 'Set font'
        TabOrder = 8
        OnClick = btnSubViewer2SetFontClick
      end
      object pnlSubViewer2Sample: TPanel
        Left = 128
        Top = 192
        Width = 241
        Height = 57
        Caption = 'SAMPLE'
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
      end
      object chkSubViewer2AlwaysShow: TCheckBox
        Left = 0
        Top = 299
        Width = 369
        Height = 17
        Anchors = [akLeft, akRight, akBottom]
        Caption = 'Always show Output Settings when saving'
        Checked = True
        State = cbChecked
        TabOrder = 10
      end
    end
    object pgeTMPlayer: TTabSheet
      Caption = 'TMPlayer (*.txt)'
      ImageIndex = 9
      TabVisible = False
      DesignSize = (
        377
        317)
      object bvlTMPlayer: TBevel
        Left = 0
        Top = 289
        Width = 372
        Height = 9
        Anchors = [akLeft, akRight, akBottom]
        Shape = bsTopLine
      end
      object gbTMPlayerFormat: TGroupBox
        Left = 0
        Top = 0
        Width = 369
        Height = 65
        Caption = 'TMPlayer Format'
        TabOrder = 0
      end
      object gbTMPlayerMasFormat: TGroupBox
        Left = 0
        Top = 72
        Width = 369
        Height = 65
        Caption = 'TMPlayer+ Format'
        TabOrder = 1
      end
      object gbTMPlayerMultilineFormat: TGroupBox
        Left = 0
        Top = 144
        Width = 369
        Height = 65
        Caption = 'TMPlayer Multiline Format'
        TabOrder = 2
        object lblTMPlayerMultiline: TLabel
          Left = 34
          Top = 40
          Width = 64
          Height = 13
          Caption = 'hh:mm:ss,2='
          OnClick = lblTMPlayerMultilineClick
        end
      end
      object rdoTMPlayerFormat2: TRadioButton
        Left = 16
        Top = 40
        Width = 345
        Height = 17
        Caption = 'h:mm:ss:'
        TabOrder = 3
      end
      object rdoTMPlayerFormat1: TRadioButton
        Left = 16
        Top = 23
        Width = 345
        Height = 17
        Caption = 'hh:mm:ss:'
        TabOrder = 4
      end
      object rdoTMPlayerPlusFormat2: TRadioButton
        Left = 16
        Top = 112
        Width = 345
        Height = 17
        Caption = 'h:mm:ss='
        TabOrder = 5
      end
      object rdoTMPlayerPlusFormat1: TRadioButton
        Left = 16
        Top = 95
        Width = 345
        Height = 17
        Caption = 'hh:mm:ss='
        TabOrder = 6
      end
      object rdoTMPlayerMultiline: TRadioButton
        Left = 16
        Top = 167
        Width = 345
        Height = 17
        Caption = 'hh:mm:ss,1='
        Checked = True
        TabOrder = 7
        TabStop = True
      end
      object chkTMPlayerAlwaysShow: TCheckBox
        Left = 0
        Top = 299
        Width = 369
        Height = 17
        Anchors = [akLeft, akRight, akBottom]
        Caption = 'Always show Output Settings when saving'
        Checked = True
        State = cbChecked
        TabOrder = 8
      end
    end
  end
  object btnOk: TButton
    Left = 432
    Top = 376
    Width = 81
    Height = 25
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
    Left = 520
    Top = 376
    Width = 81
    Height = 25
    Cancel = True
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 3
  end
  object pnlHeading: TPanel
    Left = 224
    Top = 8
    Width = 377
    Height = 25
    BevelInner = bvLowered
    Caption = 'Heading'
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
  end
  object clrDlg: TColorDialog
    Left = 8
    Top = 376
  end
  object fntDlg: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Left = 40
    Top = 376
  end
end
