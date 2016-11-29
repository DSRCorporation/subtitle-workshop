object frmInfoErrorsSettings: TfrmInfoErrorsSettings
  Left = 296
  Top = 396
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmInfoErrorsSettings'
  ClientHeight = 641
  ClientWidth = 473
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pgeCtrl: TPageControl
    Left = 8
    Top = 8
    Width = 457
    Height = 593
    ActivePage = pgeGeneral
    TabOrder = 0
    object pgeGeneral: TTabSheet
      Caption = 'General'
      ImageIndex = 3
      object lblOCRDefFile: TLabel
        Left = 8
        Top = 216
        Width = 90
        Height = 13
        Caption = 'OCR definition file:'
      end
      object bvlSep1: TBevel
        Left = 8
        Top = 32
        Width = 433
        Height = 3
        Shape = bsTopLine
      end
      object chkMarkErrorsInList: TCheckBox
        Left = 8
        Top = 472
        Width = 361
        Height = 17
        Caption = 'Mark errors in main form'#39's list'
        TabOrder = 0
        Visible = False
      end
      object chkBold: TCheckBox
        Left = 24
        Top = 496
        Width = 177
        Height = 17
        Caption = 'Bold'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        Visible = False
      end
      object chkItalic: TCheckBox
        Left = 24
        Top = 512
        Width = 177
        Height = 17
        Caption = 'Italic'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsItalic]
        ParentFont = False
        TabOrder = 2
        Visible = False
      end
      object chkUnderline: TCheckBox
        Left = 24
        Top = 528
        Width = 177
        Height = 17
        Caption = 'Underline'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsUnderline]
        ParentFont = False
        TabOrder = 3
        Visible = False
      end
      object chkFixOnLoad: TCheckBox
        Left = 8
        Top = 164
        Width = 401
        Height = 17
        Caption = 'Fix errors on load subtitle'
        TabOrder = 4
      end
      object btnEdit: TButton
        Left = 344
        Top = 232
        Width = 97
        Height = 22
        Caption = 'Edit'
        TabOrder = 5
        OnClick = btnEditClick
      end
      object chkFixOneUnitOverlap: TCheckBox
        Left = 8
        Top = 184
        Width = 401
        Height = 17
        Caption = 'Fix one unit overlap at load'
        TabOrder = 6
      end
      object cmbOCRFiles: TComboBox
        Left = 8
        Top = 232
        Width = 329
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 7
      end
      object chkShowConfInMainForm: TCheckBox
        Left = 8
        Top = 8
        Width = 353
        Height = 17
        Caption = 'Show confirmations in main form on fix'
        TabOrder = 8
      end
      object chkIndicTooLongLines: TCheckBox
        Left = 8
        Top = 272
        Width = 361
        Height = 17
        Caption = 'Indicate too long lines in Text and Translation labels'
        TabOrder = 9
      end
      object pnlIndicTooLongLinesColor: TPanel
        Left = 372
        Top = 272
        Width = 33
        Height = 17
        Hint = 'Text color'
        Color = clRed
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 10
        OnDragDrop = ColorPanelsDragDrop
        OnDragOver = ColorPanelsDragOver
        OnEndDrag = ColorPanelsEndDrag
        OnMouseDown = ColorPanelsMouseDown
      end
      object pnlIndicTooLongLinesBackground: TPanel
        Left = 408
        Top = 272
        Width = 33
        Height = 17
        Hint = 'Background color'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBtnFace
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 11
        OnDragDrop = ColorPanelsDragDrop
        OnDragOver = ColorPanelsDragOver
        OnEndDrag = ColorPanelsEndDrag
        OnMouseDown = ColorPanelsMouseDown
      end
      object pnlMarkErrorsInListColor: TPanel
        Left = 372
        Top = 472
        Width = 33
        Height = 17
        Hint = 'Text color'
        Color = clRed
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 12
        Visible = False
        OnDragDrop = ColorPanelsDragDrop
        OnDragOver = ColorPanelsDragOver
        OnEndDrag = ColorPanelsEndDrag
        OnMouseDown = ColorPanelsMouseDown
      end
      object pnlMarkErrorsInListBackground: TPanel
        Left = 408
        Top = 472
        Width = 33
        Height = 17
        Hint = 'Background color'
        Color = 15527167
        Font.Charset = ANSI_CHARSET
        Font.Color = 15527167
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 13
        Visible = False
        OnDragDrop = ColorPanelsDragDrop
        OnDragOver = ColorPanelsDragOver
        OnEndDrag = ColorPanelsEndDrag
        OnMouseDown = ColorPanelsMouseDown
      end
      object chkOriginalTextColor: TCheckBox
        Left = 200
        Top = 496
        Width = 209
        Height = 17
        Caption = 'Don'#39't change text color'
        TabOrder = 14
        Visible = False
      end
      object chkOnlyIfThereIsAColorTag: TCheckBox
        Left = 216
        Top = 512
        Width = 193
        Height = 17
        Caption = 'Only if there is a color tag'
        TabOrder = 15
        Visible = False
      end
      object chkOriginalBackground: TCheckBox
        Left = 200
        Top = 528
        Width = 209
        Height = 17
        Caption = 'Don'#39't change background'
        TabOrder = 16
        Visible = False
      end
      object chkOriginalTextStyle: TCheckBox
        Left = 200
        Top = 544
        Width = 209
        Height = 17
        Caption = 'Don'#39't change text style'
        TabOrder = 17
        Visible = False
      end
      object chkIndicTooShortDuration: TCheckBox
        Left = 8
        Top = 292
        Width = 361
        Height = 17
        Caption = 'Indicate too short duration in Duration box'
        TabOrder = 18
      end
      object chkIndicTooLongDuration: TCheckBox
        Left = 8
        Top = 312
        Width = 361
        Height = 17
        Caption = 'Indicate too long duration in Duration box'
        TabOrder = 19
      end
      object pnlIndicTooLongDurationColor: TPanel
        Left = 372
        Top = 312
        Width = 33
        Height = 17
        Hint = 'Text color'
        Color = 2949269
        Font.Charset = ANSI_CHARSET
        Font.Color = 2949269
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 20
        OnDragDrop = ColorPanelsDragDrop
        OnDragOver = ColorPanelsDragOver
        OnEndDrag = ColorPanelsEndDrag
        OnMouseDown = ColorPanelsMouseDown
      end
      object pnlIndicTooLongDurationBackground: TPanel
        Left = 408
        Top = 312
        Width = 33
        Height = 17
        Hint = 'Background color'
        Color = 15393530
        Font.Charset = ANSI_CHARSET
        Font.Color = 15393530
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 21
        OnDragDrop = ColorPanelsDragDrop
        OnDragOver = ColorPanelsDragOver
        OnEndDrag = ColorPanelsEndDrag
        OnMouseDown = ColorPanelsMouseDown
      end
      object pnlIndicTooShortDurationColor: TPanel
        Left = 372
        Top = 292
        Width = 33
        Height = 17
        Hint = 'Text color'
        Color = 27865
        Font.Charset = ANSI_CHARSET
        Font.Color = 27865
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 22
        OnDragDrop = ColorPanelsDragDrop
        OnDragOver = ColorPanelsDragOver
        OnEndDrag = ColorPanelsEndDrag
        OnMouseDown = ColorPanelsMouseDown
      end
      object pnlIndicTooShortDurationBackground: TPanel
        Left = 408
        Top = 292
        Width = 33
        Height = 17
        Hint = 'Background color'
        Color = 14807295
        Font.Charset = ANSI_CHARSET
        Font.Color = 14807295
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 23
        OnDragDrop = ColorPanelsDragDrop
        OnDragOver = ColorPanelsDragOver
        OnEndDrag = ColorPanelsEndDrag
        OnMouseDown = ColorPanelsMouseDown
      end
      object chkIndicBadValues: TCheckBox
        Left = 8
        Top = 376
        Width = 361
        Height = 17
        Caption = 'Indicate bad values in Show and Hide boxes'
        TabOrder = 24
      end
      object pnlIndicBadValuesColor: TPanel
        Left = 372
        Top = 376
        Width = 33
        Height = 17
        Hint = 'Text color'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 25
        OnDragDrop = ColorPanelsDragDrop
        OnDragOver = ColorPanelsDragOver
        OnEndDrag = ColorPanelsEndDrag
        OnMouseDown = ColorPanelsMouseDown
      end
      object pnlIndicBadValuesBackground: TPanel
        Left = 408
        Top = 376
        Width = 33
        Height = 17
        Hint = 'Background color'
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 26
        OnDragDrop = ColorPanelsDragDrop
        OnDragOver = ColorPanelsDragOver
        OnEndDrag = ColorPanelsEndDrag
        OnMouseDown = ColorPanelsMouseDown
      end
      object chkIndicOverTwoLines: TCheckBox
        Left = 8
        Top = 396
        Width = 361
        Height = 17
        Caption = 'Indicate subtitles over two lines in lines counter labels'
        TabOrder = 27
      end
      object pnlIndicOverTwoLinesColor: TPanel
        Left = 372
        Top = 396
        Width = 33
        Height = 17
        Hint = 'Text color'
        Color = clRed
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 28
        OnDragDrop = ColorPanelsDragDrop
        OnDragOver = ColorPanelsDragOver
        OnEndDrag = ColorPanelsEndDrag
        OnMouseDown = ColorPanelsMouseDown
      end
      object pnlIndicOverTwoLinesBackground: TPanel
        Left = 408
        Top = 396
        Width = 33
        Height = 17
        Hint = 'Background color'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBtnFace
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 29
        OnDragDrop = ColorPanelsDragDrop
        OnDragOver = ColorPanelsDragOver
        OnEndDrag = ColorPanelsEndDrag
        OnMouseDown = ColorPanelsMouseDown
      end
      object chkAutoRecheckErrors: TCheckBox
        Left = 8
        Top = 88
        Width = 401
        Height = 17
        Caption = 'Automatically recheck errors'
        TabOrder = 30
      end
      object rdoRecheckOnScriptsNo: TRadioButton
        Left = 24
        Top = 104
        Width = 425
        Height = 17
        Caption = 'Do not recheck on Pascal scripts'
        TabOrder = 31
      end
      object rdoRecheckOnScriptsMethod1: TRadioButton
        Left = 24
        Top = 120
        Width = 425
        Height = 17
        Caption = 'Recheck all once after a Pascal script executes'
        TabOrder = 32
      end
      object rdoRecheckOnScriptsMethod2: TRadioButton
        Left = 24
        Top = 136
        Width = 425
        Height = 17
        Caption = 'Recheck on each change made by a Pascal script (might be slow)'
        TabOrder = 33
      end
      object chkIndicTooSHortPause: TCheckBox
        Left = 8
        Top = 332
        Width = 361
        Height = 17
        Caption = 'Indicate too short pause in Pause box'
        TabOrder = 34
      end
      object pnlIndicTooShortPauseColor: TPanel
        Left = 372
        Top = 332
        Width = 33
        Height = 17
        Hint = 'Text color'
        Color = 5123082
        Font.Charset = ANSI_CHARSET
        Font.Color = 5123082
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 35
        OnDragDrop = ColorPanelsDragDrop
        OnDragOver = ColorPanelsDragOver
        OnEndDrag = ColorPanelsEndDrag
        OnMouseDown = ColorPanelsMouseDown
      end
      object pnlIndicTooShortPauseBackground: TPanel
        Left = 408
        Top = 332
        Width = 33
        Height = 17
        Hint = 'Background color'
        Color = 15124908
        Font.Charset = ANSI_CHARSET
        Font.Color = 15124908
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 36
        OnDragDrop = ColorPanelsDragDrop
        OnDragOver = ColorPanelsDragOver
        OnEndDrag = ColorPanelsEndDrag
        OnMouseDown = ColorPanelsMouseDown
      end
      object chkIndicOverlapping: TCheckBox
        Left = 8
        Top = 354
        Width = 361
        Height = 17
        Caption = 'Indicate overlapping subtitles in Pause box'
        TabOrder = 37
      end
      object pnlIndicOverlappingColor: TPanel
        Left = 372
        Top = 354
        Width = 33
        Height = 17
        Hint = 'Text color'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 38
        OnDragDrop = ColorPanelsDragDrop
        OnDragOver = ColorPanelsDragOver
        OnEndDrag = ColorPanelsEndDrag
        OnMouseDown = ColorPanelsMouseDown
      end
      object pnlIndicOverlappingBackground: TPanel
        Left = 408
        Top = 354
        Width = 33
        Height = 17
        Hint = 'Background color'
        Color = 2425019
        Font.Charset = ANSI_CHARSET
        Font.Color = 2425019
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 39
        OnDragDrop = ColorPanelsDragDrop
        OnDragOver = ColorPanelsDragOver
        OnEndDrag = ColorPanelsEndDrag
        OnMouseDown = ColorPanelsMouseDown
      end
      object chkMarkEnable: TCheckBox
        Left = 8
        Top = 40
        Width = 433
        Height = 17
        Caption = 'Mark errors in main form'#39's list'
        TabOrder = 40
      end
      object chkMarkOnLoad: TCheckBox
        Left = 8
        Top = 60
        Width = 433
        Height = 17
        Caption = 'Mark errors on load subtitle'
        TabOrder = 41
      end
    end
    object pgeAdvanced: TTabSheet
      Caption = 'Advanced'
      ImageIndex = 4
      object lblMilliseconds: TLabel
        Left = 88
        Top = 128
        Width = 59
        Height = 13
        Caption = 'milliseconds.'
      end
      object lblMilliseconds2: TLabel
        Left = 360
        Top = 30
        Width = 55
        Height = 13
        Caption = 'milliseconds'
      end
      object lblMilliseconds3: TLabel
        Left = 360
        Top = 78
        Width = 55
        Height = 13
        Caption = 'milliseconds'
      end
      object lblCharacters: TLabel
        Left = 360
        Top = 126
        Width = 51
        Height = 13
        Caption = 'characters'
      end
      object lblMilliseconds4: TLabel
        Left = 360
        Top = 182
        Width = 55
        Height = 13
        Caption = 'milliseconds'
      end
      object edtRepeatableChars: TLabeledEdit
        Left = 8
        Top = 24
        Width = 249
        Height = 21
        EditLabel.Width = 113
        EditLabel.Height = 13
        EditLabel.Caption = 'Repeatable characters:'
        TabOrder = 0
      end
      object edtProhibitedChars: TLabeledEdit
        Left = 8
        Top = 72
        Width = 249
        Height = 21
        EditLabel.Width = 106
        EditLabel.Height = 13
        EditLabel.Caption = 'Prohibited characters:'
        TabOrder = 1
      end
      object edtToleranceRepeatedSubs: TLabeledEdit
        Left = 8
        Top = 120
        Width = 57
        Height = 21
        EditLabel.Width = 158
        EditLabel.Height = 13
        EditLabel.Caption = 'Tolerance for repeated subtitles:'
        TabOrder = 2
        Text = '100'
      end
      object udToleranceRepeatedSubs: TUpDown
        Left = 65
        Top = 120
        Width = 16
        Height = 21
        Associate = edtToleranceRepeatedSubs
        Max = 700
        Position = 100
        TabOrder = 3
        Thousands = False
      end
      object edtSpaceAfterChars: TLabeledEdit
        Left = 8
        Top = 176
        Width = 249
        Height = 21
        EditLabel.Width = 114
        EditLabel.Height = 13
        EditLabel.Caption = 'Space after characters:'
        TabOrder = 4
      end
      object edtSpaceBeforeChars: TLabeledEdit
        Left = 8
        Top = 224
        Width = 249
        Height = 21
        EditLabel.Width = 122
        EditLabel.Height = 13
        EditLabel.Caption = 'Space before characters:'
        TabOrder = 5
      end
      object edtTooLongDuration: TLabeledEdit
        Left = 280
        Top = 24
        Width = 57
        Height = 21
        EditLabel.Width = 113
        EditLabel.Height = 13
        EditLabel.Caption = 'Too long duration over:'
        TabOrder = 6
        Text = '6000'
      end
      object udTooLongDur: TUpDown
        Left = 337
        Top = 24
        Width = 16
        Height = 21
        Associate = edtTooLongDuration
        Min = 1000
        Max = 30000
        Position = 6000
        TabOrder = 7
        Thousands = False
      end
      object edtTooShortDuration: TLabeledEdit
        Left = 280
        Top = 72
        Width = 57
        Height = 21
        EditLabel.Width = 124
        EditLabel.Height = 13
        EditLabel.Caption = 'Too short duration under:'
        TabOrder = 8
        Text = '700'
      end
      object udTooShortDur: TUpDown
        Left = 337
        Top = 72
        Width = 16
        Height = 21
        Associate = edtTooShortDuration
        Min = 1
        Max = 3000
        Position = 700
        TabOrder = 9
        Thousands = False
      end
      object edtTooLongLine: TLabeledEdit
        Left = 280
        Top = 120
        Width = 57
        Height = 21
        EditLabel.Width = 64
        EditLabel.Height = 13
        EditLabel.Caption = 'Too long line:'
        TabOrder = 10
        Text = '50'
      end
      object udTooLongLine: TUpDown
        Left = 337
        Top = 120
        Width = 15
        Height = 21
        Associate = edtTooLongLine
        Min = 20
        Max = 200
        Position = 50
        TabOrder = 11
        Thousands = False
      end
      object gbCPS: TGroupBox
        Left = 8
        Top = 256
        Width = 433
        Height = 177
        Caption = 'Characters per second (CPS)'
        TabOrder = 12
        object lblCharactersPerSecond: TLabel
          Left = 90
          Top = 42
          Width = 107
          Height = 13
          Caption = 'characters per second'
        end
        object lblNormalCPSColors: TLabel
          Left = 236
          Top = 60
          Width = 111
          Height = 13
          Alignment = taRightJustify
          Caption = 'Normal CPS box colors:'
        end
        object lblTooMuchCPSColors: TLabel
          Left = 222
          Top = 80
          Width = 125
          Height = 13
          Alignment = taRightJustify
          Caption = 'Too many CPS box colors:'
        end
        object edtTooMuchCPS: TLabeledEdit
          Left = 8
          Top = 36
          Width = 57
          Height = 21
          EditLabel.Width = 98
          EditLabel.Height = 13
          EditLabel.Caption = 'Too many CPS over:'
          TabOrder = 0
          Text = '20'
        end
        object udTooMuchCPS: TUpDown
          Left = 65
          Top = 36
          Width = 16
          Height = 21
          Associate = edtTooMuchCPS
          Min = 1
          Max = 500
          Position = 20
          TabOrder = 1
          Thousands = False
        end
        object pnlTooMuchCPSColor: TPanel
          Left = 356
          Top = 80
          Width = 33
          Height = 17
          Hint = 'Text Color'
          Color = clBlack
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnDragDrop = ColorPanelsDragDrop
          OnDragOver = ColorPanelsDragOver
          OnEndDrag = ColorPanelsEndDrag
          OnMouseDown = ColorPanelsMouseDown
        end
        object pnlTooMuchCPSBckgr: TPanel
          Left = 392
          Top = 80
          Width = 33
          Height = 17
          Hint = 'Background Color'
          Color = 14807295
          Font.Charset = ANSI_CHARSET
          Font.Color = 14807295
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          OnDragDrop = ColorPanelsDragDrop
          OnDragOver = ColorPanelsDragOver
          OnEndDrag = ColorPanelsEndDrag
          OnMouseDown = ColorPanelsMouseDown
        end
        object pnlNormalCPSColor: TPanel
          Left = 356
          Top = 60
          Width = 33
          Height = 17
          Hint = 'Text Color'
          Color = clBlack
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          OnDragDrop = ColorPanelsDragDrop
          OnDragOver = ColorPanelsDragOver
          OnEndDrag = ColorPanelsEndDrag
          OnMouseDown = ColorPanelsMouseDown
        end
        object pnlNormalCPSBckgr: TPanel
          Left = 392
          Top = 60
          Width = 33
          Height = 17
          Hint = 'Background Color'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
          OnDragDrop = ColorPanelsDragDrop
          OnDragOver = ColorPanelsDragOver
          OnEndDrag = ColorPanelsEndDrag
          OnMouseDown = ColorPanelsMouseDown
        end
        object chkPercentageInCPSHintBox: TCheckBox
          Left = 8
          Top = 104
          Width = 417
          Height = 17
          Caption = 'Display percantage in CPS box'
          TabOrder = 6
        end
        object chkCurCPSInCPSHintBox: TCheckBox
          Left = 8
          Top = 120
          Width = 417
          Height = 17
          Caption = 'Display current CPS in CPS box'
          TabOrder = 7
        end
        object chkMinTimeInCPSHintBox: TCheckBox
          Left = 8
          Top = 136
          Width = 417
          Height = 17
          Caption = 'Display minimum time in CPS box'
          TabOrder = 8
        end
        object chkMaxCharInCPSHintBox: TCheckBox
          Left = 8
          Top = 152
          Width = 417
          Height = 17
          Caption = 'Display maximum characters in CPS box'
          TabOrder = 9
        end
      end
      object edtTooShortPause: TLabeledEdit
        Left = 280
        Top = 176
        Width = 57
        Height = 21
        EditLabel.Width = 113
        EditLabel.Height = 13
        EditLabel.Caption = 'Too short pause under:'
        TabOrder = 13
        Text = '1'
      end
      object udTooShortPause: TUpDown
        Left = 337
        Top = 176
        Width = 16
        Height = 21
        Associate = edtTooShortPause
        Min = 1
        Max = 5000
        Position = 1
        TabOrder = 14
        Thousands = False
      end
    end
    object pgeCheckFor: TTabSheet
      Caption = 'Check for'
      object bvlSep2: TBevel
        Left = 8
        Top = 80
        Width = 433
        Height = 9
        Shape = bsTopLine
      end
      object bvlSep3: TBevel
        Left = 8
        Top = 216
        Width = 433
        Height = 9
        Shape = bsTopLine
      end
      object chkCheckOverlapping: TCheckBox
        Left = 8
        Top = 88
        Width = 433
        Height = 17
        Caption = 'Overlapping subtitles'
        TabOrder = 1
      end
      object chkCheckBadValues: TCheckBox
        Left = 8
        Top = 104
        Width = 433
        Height = 17
        Caption = 'Bad values'
        TabOrder = 2
      end
      object chkCheckHearingImpaired: TCheckBox
        Left = 8
        Top = 224
        Width = 433
        Height = 17
        Caption = 'Hearing impaired subtitles'
        TabOrder = 3
      end
      object chkCheckTextBeforeColon: TCheckBox
        Left = 8
        Top = 240
        Width = 433
        Height = 17
        Caption = 'Text before colon (":")'
        TabOrder = 4
        OnClick = chkCheckTextBeforeColonClick
      end
      object chkCheckOnlyIfCapitalLetters: TCheckBox
        Left = 24
        Top = 256
        Width = 417
        Height = 17
        BiDiMode = bdLeftToRight
        Caption = 'Only if text is in capital letters'
        ParentBiDiMode = False
        TabOrder = 5
        OnClick = chkCheckOnlyIfCapitalLettersClick
      end
      object chkCheckUnnecessaryDots: TCheckBox
        Left = 8
        Top = 272
        Width = 433
        Height = 17
        Caption = 'Unnecessary dots'
        TabOrder = 6
      end
      object chkCheckProhibitedChars: TCheckBox
        Left = 8
        Top = 288
        Width = 433
        Height = 17
        Caption = 'Prohibited characters'
        TabOrder = 8
      end
      object chkCheckRepeatedChars: TCheckBox
        Left = 8
        Top = 304
        Width = 433
        Height = 17
        Caption = 'Repeated characters'
        TabOrder = 9
      end
      object chkCheckRepeatedSubs: TCheckBox
        Left = 8
        Top = 320
        Width = 433
        Height = 17
        Caption = 'Repeated subtitles'
        TabOrder = 10
      end
      object chkCheckTooLongDur: TCheckBox
        Left = 8
        Top = 144
        Width = 433
        Height = 17
        Caption = 'Too long durations'
        TabOrder = 15
      end
      object chkCheckTooShortDur: TCheckBox
        Left = 8
        Top = 160
        Width = 433
        Height = 17
        Caption = 'Too short durations'
        TabOrder = 16
      end
      object chkCheckTooLongLines: TCheckBox
        Left = 8
        Top = 176
        Width = 433
        Height = 17
        Caption = 'Too long lines'
        TabOrder = 17
      end
      object chkCheckLinesWithoutLetters: TCheckBox
        Left = 8
        Top = 40
        Width = 433
        Height = 17
        Caption = 'Lines without letters'
        TabOrder = 18
      end
      object chkCheckOpnDlgInSubsWithOneLine: TCheckBox
        Left = 8
        Top = 360
        Width = 433
        Height = 17
        Caption = '"- " in subtitles with one line'
        TabOrder = 19
      end
      object chkCheckDashOnFirstLine: TCheckBox
        Left = 8
        Top = 376
        Width = 433
        Height = 17
        Caption = '"- " on first line'
        TabOrder = 21
      end
      object chkCheckOnlyIfNoDashOnSecondLine: TCheckBox
        Left = 24
        Top = 392
        Width = 417
        Height = 17
        BiDiMode = bdLeftToRight
        Caption = 'Only if there is no "- " on second line'
        ParentBiDiMode = False
        TabOrder = 22
        OnClick = chkCheckOnlyIfNoDashOnSecondLineClick
      end
      object chkCheckTooMuchCPS: TCheckBox
        Left = 8
        Top = 496
        Width = 433
        Height = 17
        Caption = 'Too many characters per second'
        TabOrder = 23
      end
      object chkCheckTooShortPause: TCheckBox
        Left = 8
        Top = 120
        Width = 433
        Height = 17
        Caption = 'Too short pauses'
        TabOrder = 24
      end
      object chkCheckDialogueOnOneLine: TCheckBox
        Left = 8
        Top = 408
        Width = 433
        Height = 17
        Caption = 'Dialogue on one line'
        TabOrder = 25
      end
      object chkCheckEmptySubtitles: TCheckBox
        Left = 8
        Top = 56
        Width = 433
        Height = 17
        Caption = 'Empty subtitles'
        TabOrder = 0
      end
      object chkCheckOverTwoLines: TCheckBox
        Left = 8
        Top = 192
        Width = 433
        Height = 17
        Caption = 'Subtitles over two lines'
        TabOrder = 7
      end
      object chkCheckOCRErrors: TCheckBox
        Left = 8
        Top = 336
        Width = 433
        Height = 17
        Caption = 'OCR Errors'
        TabOrder = 11
      end
      object chkCheckSpaceAfterCustomChars: TCheckBox
        Left = 8
        Top = 424
        Width = 433
        Height = 17
        Caption = 'Missing spaces after custom characters'
        TabOrder = 13
      end
      object chkCheckSpaceBeforeCustomChars: TCheckBox
        Left = 8
        Top = 440
        Width = 433
        Height = 17
        Caption = 'Missing spaces before custom characters'
        TabOrder = 14
      end
      object chkCheckUnnecessarySpaces: TCheckBox
        Left = 8
        Top = 456
        Width = 433
        Height = 17
        Caption = 'Unnecessary spaces'
        TabOrder = 12
      end
      object chkCheckUnnecessaryTags: TCheckBox
        Left = 8
        Top = 472
        Width = 433
        Height = 17
        Caption = 'Unnecessary tags'
        TabOrder = 20
      end
    end
    object pgeMark: TTabSheet
      Caption = 'Mark'
      ImageIndex = 5
      object bvlSep8: TBevel
        Left = 8
        Top = 216
        Width = 433
        Height = 9
        Shape = bsTopLine
      end
      object bvlSep7: TBevel
        Left = 8
        Top = 80
        Width = 433
        Height = 9
        Shape = bsTopLine
      end
      object bvlSep6: TBevel
        Left = 8
        Top = 32
        Width = 433
        Height = 9
        Shape = bsTopLine
      end
      object sbMarkStrikeOut_6: TSpeedButton
        Left = 377
        Top = 160
        Width = 14
        Height = 17
        Hint = 'Mark as Strikethrough'
        AllowAllUp = True
        Caption = 'S'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsStrikeOut]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkUnderline_6: TSpeedButton
        Left = 363
        Top = 160
        Width = 14
        Height = 16
        Hint = 'Mark as Underline'
        AllowAllUp = True
        Caption = 'U'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsUnderline]
        Margin = 1
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkItalic_6: TSpeedButton
        Left = 349
        Top = 160
        Width = 14
        Height = 16
        Hint = 'Mark as Italic'
        AllowAllUp = True
        Caption = 'I '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkBold_6: TSpeedButton
        Left = 335
        Top = 160
        Width = 14
        Height = 16
        Hint = 'Mark as Bold'
        AllowAllUp = True
        Caption = 'B'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkText_6: TSpeedButton
        Left = 316
        Top = 160
        Width = 14
        Height = 16
        Hint = 'Mark column "Text"'
        AllowAllUp = True
        Caption = 'T'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkHide_6: TSpeedButton
        Tag = 1
        Left = 288
        Top = 160
        Width = 14
        Height = 16
        Hint = 'Mark column "Hide"'
        AllowAllUp = True
        Caption = 'H'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkShow_6: TSpeedButton
        Left = 274
        Top = 160
        Width = 14
        Height = 16
        Hint = 'Mark column "Show"'
        AllowAllUp = True
        Caption = 'S'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkNum_6: TSpeedButton
        Left = 246
        Top = 160
        Width = 14
        Height = 16
        Hint = 'Mark column "Num"'
        AllowAllUp = True
        Caption = 'N'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkNum_5: TSpeedButton
        Left = 246
        Top = 144
        Width = 14
        Height = 16
        Hint = 'Mark column "Num"'
        AllowAllUp = True
        Caption = 'N'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkShow_5: TSpeedButton
        Left = 274
        Top = 144
        Width = 14
        Height = 16
        Hint = 'Mark column "Show"'
        AllowAllUp = True
        Caption = 'S'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkHide_5: TSpeedButton
        Tag = 1
        Left = 288
        Top = 144
        Width = 14
        Height = 16
        Hint = 'Mark column "Hide"'
        AllowAllUp = True
        Caption = 'H'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkText_5: TSpeedButton
        Left = 316
        Top = 144
        Width = 14
        Height = 16
        Hint = 'Mark column "Text"'
        AllowAllUp = True
        Caption = 'T'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkBold_5: TSpeedButton
        Left = 335
        Top = 144
        Width = 14
        Height = 16
        Hint = 'Mark as Bold'
        AllowAllUp = True
        Caption = 'B'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkItalic_5: TSpeedButton
        Left = 349
        Top = 144
        Width = 14
        Height = 16
        Hint = 'Mark as Italic'
        AllowAllUp = True
        Caption = 'I '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkUnderline_5: TSpeedButton
        Left = 363
        Top = 144
        Width = 14
        Height = 16
        Hint = 'Mark as Underline'
        AllowAllUp = True
        Caption = 'U'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsUnderline]
        Margin = 1
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkStrikeOut_5: TSpeedButton
        Left = 377
        Top = 144
        Width = 14
        Height = 16
        Hint = 'Mark as Strikethrough'
        AllowAllUp = True
        Caption = 'S'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsStrikeOut]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkNum_4: TSpeedButton
        Left = 246
        Top = 104
        Width = 14
        Height = 16
        Hint = 'Mark column "Num"'
        AllowAllUp = True
        Caption = 'N'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkShow_4: TSpeedButton
        Tag = 1
        Left = 274
        Top = 104
        Width = 14
        Height = 16
        Hint = 'Mark column "Show"'
        AllowAllUp = True
        Caption = 'S'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkHide_4: TSpeedButton
        Tag = 1
        Left = 288
        Top = 104
        Width = 14
        Height = 16
        Hint = 'Mark column "Hide"'
        AllowAllUp = True
        Caption = 'H'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkText_4: TSpeedButton
        Left = 316
        Top = 104
        Width = 14
        Height = 16
        Hint = 'Mark column "Text"'
        AllowAllUp = True
        Caption = 'T'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkBold_4: TSpeedButton
        Left = 335
        Top = 104
        Width = 14
        Height = 16
        Hint = 'Mark as Bold'
        AllowAllUp = True
        Caption = 'B'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkItalic_4: TSpeedButton
        Left = 349
        Top = 104
        Width = 14
        Height = 16
        Hint = 'Mark as Italic'
        AllowAllUp = True
        Caption = 'I '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkUnderline_4: TSpeedButton
        Left = 363
        Top = 104
        Width = 14
        Height = 16
        Hint = 'Mark as Underline'
        AllowAllUp = True
        Caption = 'U'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsUnderline]
        Margin = 1
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkStrikeOut_4: TSpeedButton
        Left = 377
        Top = 104
        Width = 14
        Height = 16
        Hint = 'Mark as Strikethrough'
        AllowAllUp = True
        Caption = 'S'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsStrikeOut]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkNum_3: TSpeedButton
        Left = 246
        Top = 88
        Width = 14
        Height = 16
        Hint = 'Mark column "Num"'
        AllowAllUp = True
        Caption = 'N'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkShow_3: TSpeedButton
        Tag = 1
        Left = 274
        Top = 88
        Width = 14
        Height = 16
        Hint = 'Mark column "Show"'
        AllowAllUp = True
        Caption = 'S'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkHide_3: TSpeedButton
        Left = 288
        Top = 88
        Width = 14
        Height = 16
        Hint = 'Mark column "Hide"'
        AllowAllUp = True
        Caption = 'H'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkText_3: TSpeedButton
        Left = 316
        Top = 88
        Width = 14
        Height = 16
        Hint = 'Mark column "Text"'
        AllowAllUp = True
        Caption = 'T'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkBold_3: TSpeedButton
        Left = 335
        Top = 88
        Width = 14
        Height = 16
        Hint = 'Mark as Bold'
        AllowAllUp = True
        Caption = 'B'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkItalic_3: TSpeedButton
        Left = 349
        Top = 88
        Width = 14
        Height = 16
        Hint = 'Mark as Italic'
        AllowAllUp = True
        Caption = 'I '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkUnderline_3: TSpeedButton
        Left = 363
        Top = 88
        Width = 14
        Height = 16
        Hint = 'Mark as Underline'
        AllowAllUp = True
        Caption = 'U'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsUnderline]
        Margin = 1
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkStrikeOut_3: TSpeedButton
        Left = 377
        Top = 88
        Width = 14
        Height = 16
        Hint = 'Mark as Strikethrough'
        AllowAllUp = True
        Caption = 'S'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsStrikeOut]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkNum_2: TSpeedButton
        Left = 246
        Top = 56
        Width = 14
        Height = 16
        Hint = 'Mark column "Num"'
        AllowAllUp = True
        Caption = 'N'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkShow_2: TSpeedButton
        Left = 274
        Top = 56
        Width = 14
        Height = 16
        Hint = 'Mark column "Show"'
        AllowAllUp = True
        Caption = 'S'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkHide_2: TSpeedButton
        Left = 288
        Top = 56
        Width = 14
        Height = 16
        Hint = 'Mark column "Hide"'
        AllowAllUp = True
        Caption = 'H'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkText_2: TSpeedButton
        Tag = 1
        Left = 316
        Top = 56
        Width = 14
        Height = 16
        Hint = 'Mark column "Text"'
        AllowAllUp = True
        Caption = 'T'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkBold_2: TSpeedButton
        Left = 335
        Top = 56
        Width = 14
        Height = 16
        Hint = 'Mark as Bold'
        AllowAllUp = True
        Caption = 'B'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkItalic_2: TSpeedButton
        Left = 349
        Top = 56
        Width = 14
        Height = 16
        Hint = 'Mark as Italic'
        AllowAllUp = True
        Caption = 'I '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkUnderline_2: TSpeedButton
        Left = 363
        Top = 56
        Width = 14
        Height = 16
        Hint = 'Mark as Underline'
        AllowAllUp = True
        Caption = 'U'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsUnderline]
        Margin = 1
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkStrikeOut_2: TSpeedButton
        Left = 377
        Top = 56
        Width = 14
        Height = 16
        Hint = 'Mark as Strikethrough'
        AllowAllUp = True
        Caption = 'S'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsStrikeOut]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkNum_1: TSpeedButton
        Left = 246
        Top = 40
        Width = 14
        Height = 16
        Hint = 'Mark column "Num"'
        AllowAllUp = True
        Caption = 'N'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkShow_1: TSpeedButton
        Left = 274
        Top = 40
        Width = 14
        Height = 16
        Hint = 'Mark column "Show"'
        AllowAllUp = True
        Caption = 'S'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkHide_1: TSpeedButton
        Left = 288
        Top = 40
        Width = 14
        Height = 16
        Hint = 'Mark column "Hide"'
        AllowAllUp = True
        Caption = 'H'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkText_1: TSpeedButton
        Tag = 1
        Left = 316
        Top = 40
        Width = 14
        Height = 16
        Hint = 'Mark column "Text"'
        AllowAllUp = True
        Caption = 'T'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkBold_1: TSpeedButton
        Left = 335
        Top = 40
        Width = 14
        Height = 16
        Hint = 'Mark as Bold'
        AllowAllUp = True
        Caption = 'B'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkItalic_1: TSpeedButton
        Left = 349
        Top = 40
        Width = 14
        Height = 16
        Hint = 'Mark as Italic'
        AllowAllUp = True
        Caption = 'I '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkUnderline_1: TSpeedButton
        Left = 363
        Top = 40
        Width = 14
        Height = 16
        Hint = 'Mark as Underline'
        AllowAllUp = True
        Caption = 'U'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsUnderline]
        Margin = 1
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkStrikeOut_1: TSpeedButton
        Left = 377
        Top = 40
        Width = 14
        Height = 16
        Hint = 'Mark as Strikethrough'
        AllowAllUp = True
        Caption = 'S'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsStrikeOut]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkNum_7: TSpeedButton
        Left = 246
        Top = 176
        Width = 14
        Height = 16
        Hint = 'Mark column "Num"'
        AllowAllUp = True
        Caption = 'N'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkShow_7: TSpeedButton
        Left = 274
        Top = 176
        Width = 14
        Height = 16
        Hint = 'Mark column "Show"'
        AllowAllUp = True
        Caption = 'S'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkHide_7: TSpeedButton
        Left = 288
        Top = 176
        Width = 14
        Height = 16
        Hint = 'Mark column "Hide"'
        AllowAllUp = True
        Caption = 'H'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkText_7: TSpeedButton
        Tag = 1
        Left = 316
        Top = 176
        Width = 14
        Height = 16
        Hint = 'Mark column "Text"'
        AllowAllUp = True
        Caption = 'T'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkBold_7: TSpeedButton
        Left = 335
        Top = 176
        Width = 14
        Height = 16
        Hint = 'Mark as Bold'
        AllowAllUp = True
        Caption = 'B'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkItalic_7: TSpeedButton
        Left = 349
        Top = 176
        Width = 14
        Height = 16
        Hint = 'Mark as Italic'
        AllowAllUp = True
        Caption = 'I '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkUnderline_7: TSpeedButton
        Left = 363
        Top = 176
        Width = 14
        Height = 16
        Hint = 'Mark as Underline'
        AllowAllUp = True
        Caption = 'U'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsUnderline]
        Margin = 1
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkStrikeOut_7: TSpeedButton
        Left = 377
        Top = 176
        Width = 14
        Height = 16
        Hint = 'Mark as Strikethrough'
        AllowAllUp = True
        Caption = 'S'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsStrikeOut]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkNum_8: TSpeedButton
        Left = 246
        Top = 192
        Width = 14
        Height = 16
        Hint = 'Mark column "Num"'
        AllowAllUp = True
        Caption = 'N'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkShow_8: TSpeedButton
        Left = 274
        Top = 192
        Width = 14
        Height = 16
        Hint = 'Mark column "Show"'
        AllowAllUp = True
        Caption = 'S'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkHide_8: TSpeedButton
        Left = 288
        Top = 192
        Width = 14
        Height = 16
        Hint = 'Mark column "Hide"'
        AllowAllUp = True
        Caption = 'H'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkText_8: TSpeedButton
        Tag = 1
        Left = 316
        Top = 192
        Width = 14
        Height = 16
        Hint = 'Mark column "Text"'
        AllowAllUp = True
        Caption = 'T'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkBold_8: TSpeedButton
        Left = 335
        Top = 192
        Width = 14
        Height = 16
        Hint = 'Mark as Bold'
        AllowAllUp = True
        Caption = 'B'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkItalic_8: TSpeedButton
        Left = 349
        Top = 192
        Width = 14
        Height = 16
        Hint = 'Mark as Italic'
        AllowAllUp = True
        Caption = 'I '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkUnderline_8: TSpeedButton
        Left = 363
        Top = 192
        Width = 14
        Height = 16
        Hint = 'Mark as Underline'
        AllowAllUp = True
        Caption = 'U'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsUnderline]
        Margin = 1
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkStrikeOut_8: TSpeedButton
        Left = 377
        Top = 192
        Width = 14
        Height = 16
        Hint = 'Mark as Strikethrough'
        AllowAllUp = True
        Caption = 'S'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsStrikeOut]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkNum_9: TSpeedButton
        Left = 246
        Top = 224
        Width = 14
        Height = 16
        Hint = 'Mark column "Num"'
        AllowAllUp = True
        Caption = 'N'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkShow_9: TSpeedButton
        Left = 274
        Top = 224
        Width = 14
        Height = 16
        Hint = 'Mark column "Show"'
        AllowAllUp = True
        Caption = 'S'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkHide_9: TSpeedButton
        Left = 288
        Top = 224
        Width = 14
        Height = 16
        Hint = 'Mark column "Hide"'
        AllowAllUp = True
        Caption = 'H'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkText_9: TSpeedButton
        Left = 316
        Top = 224
        Width = 14
        Height = 16
        Hint = 'Mark column "Text"'
        AllowAllUp = True
        Caption = 'T'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkBold_9: TSpeedButton
        Left = 335
        Top = 224
        Width = 14
        Height = 16
        Hint = 'Mark as Bold'
        AllowAllUp = True
        Caption = 'B'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkItalic_9: TSpeedButton
        Left = 349
        Top = 224
        Width = 14
        Height = 16
        Hint = 'Mark as Italic'
        AllowAllUp = True
        Caption = 'I '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkUnderline_9: TSpeedButton
        Left = 363
        Top = 224
        Width = 14
        Height = 16
        Hint = 'Mark as Underline'
        AllowAllUp = True
        Caption = 'U'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsUnderline]
        Margin = 1
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkStrikeOut_9: TSpeedButton
        Left = 377
        Top = 224
        Width = 14
        Height = 16
        Hint = 'Mark as Strikethrough'
        AllowAllUp = True
        Caption = 'S'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsStrikeOut]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkNum_10: TSpeedButton
        Left = 246
        Top = 240
        Width = 14
        Height = 16
        Hint = 'Mark column "Num"'
        AllowAllUp = True
        Caption = 'N'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkShow_10: TSpeedButton
        Left = 274
        Top = 240
        Width = 14
        Height = 16
        Hint = 'Mark column "Show"'
        AllowAllUp = True
        Caption = 'S'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkHide_10: TSpeedButton
        Left = 288
        Top = 240
        Width = 14
        Height = 16
        Hint = 'Mark column "Hide"'
        AllowAllUp = True
        Caption = 'H'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkText_10: TSpeedButton
        Left = 316
        Top = 240
        Width = 14
        Height = 16
        Hint = 'Mark column "Text"'
        AllowAllUp = True
        Caption = 'T'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkBold_10: TSpeedButton
        Left = 335
        Top = 240
        Width = 14
        Height = 16
        Hint = 'Mark as Bold'
        AllowAllUp = True
        Caption = 'B'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkItalic_10: TSpeedButton
        Left = 349
        Top = 240
        Width = 14
        Height = 16
        Hint = 'Mark as Italic'
        AllowAllUp = True
        Caption = 'I '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkUnderline_10: TSpeedButton
        Left = 363
        Top = 240
        Width = 14
        Height = 16
        Hint = 'Mark as Underline'
        AllowAllUp = True
        Caption = 'U'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsUnderline]
        Margin = 1
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkStrikeOut_10: TSpeedButton
        Left = 377
        Top = 240
        Width = 14
        Height = 16
        Hint = 'Mark as Strikethrough'
        AllowAllUp = True
        Caption = 'S'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsStrikeOut]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkNum_11: TSpeedButton
        Left = 246
        Top = 272
        Width = 14
        Height = 16
        Hint = 'Mark column "Num"'
        AllowAllUp = True
        Caption = 'N'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkShow_11: TSpeedButton
        Left = 274
        Top = 272
        Width = 14
        Height = 16
        Hint = 'Mark column "Show"'
        AllowAllUp = True
        Caption = 'S'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkHide_11: TSpeedButton
        Left = 288
        Top = 272
        Width = 14
        Height = 16
        Hint = 'Mark column "Hide"'
        AllowAllUp = True
        Caption = 'H'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkText_11: TSpeedButton
        Left = 316
        Top = 272
        Width = 14
        Height = 16
        Hint = 'Mark column "Text"'
        AllowAllUp = True
        Caption = 'T'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkBold_11: TSpeedButton
        Left = 335
        Top = 272
        Width = 14
        Height = 16
        Hint = 'Mark as Bold'
        AllowAllUp = True
        Caption = 'B'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkItalic_11: TSpeedButton
        Left = 349
        Top = 272
        Width = 14
        Height = 16
        Hint = 'Mark as Italic'
        AllowAllUp = True
        Caption = 'I '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkUnderline_11: TSpeedButton
        Left = 363
        Top = 272
        Width = 14
        Height = 16
        Hint = 'Mark as Underline'
        AllowAllUp = True
        Caption = 'U'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsUnderline]
        Margin = 1
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkStrikeOut_11: TSpeedButton
        Left = 377
        Top = 272
        Width = 14
        Height = 16
        Hint = 'Mark as Strikethrough'
        AllowAllUp = True
        Caption = 'S'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsStrikeOut]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkNum_12: TSpeedButton
        Left = 246
        Top = 288
        Width = 14
        Height = 16
        Hint = 'Mark column "Num"'
        AllowAllUp = True
        Caption = 'N'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkShow_12: TSpeedButton
        Left = 274
        Top = 288
        Width = 14
        Height = 16
        Hint = 'Mark column "Show"'
        AllowAllUp = True
        Caption = 'S'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkHide_12: TSpeedButton
        Left = 288
        Top = 288
        Width = 14
        Height = 16
        Hint = 'Mark column "Hide"'
        AllowAllUp = True
        Caption = 'H'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkText_12: TSpeedButton
        Left = 316
        Top = 288
        Width = 14
        Height = 16
        Hint = 'Mark column "Text"'
        AllowAllUp = True
        Caption = 'T'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkBold_12: TSpeedButton
        Left = 335
        Top = 288
        Width = 14
        Height = 16
        Hint = 'Mark as Bold'
        AllowAllUp = True
        Caption = 'B'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkItalic_12: TSpeedButton
        Left = 349
        Top = 288
        Width = 14
        Height = 16
        Hint = 'Mark as Italic'
        AllowAllUp = True
        Caption = 'I '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkUnderline_12: TSpeedButton
        Left = 363
        Top = 288
        Width = 14
        Height = 16
        Hint = 'Mark as Underline'
        AllowAllUp = True
        Caption = 'U'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsUnderline]
        Margin = 1
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkStrikeOut_12: TSpeedButton
        Left = 377
        Top = 288
        Width = 14
        Height = 16
        Hint = 'Mark as Strikethrough'
        AllowAllUp = True
        Caption = 'S'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsStrikeOut]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkNum_13: TSpeedButton
        Left = 246
        Top = 304
        Width = 14
        Height = 16
        Hint = 'Mark column "Num"'
        AllowAllUp = True
        Caption = 'N'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkShow_13: TSpeedButton
        Left = 274
        Top = 304
        Width = 14
        Height = 16
        Hint = 'Mark column "Show"'
        AllowAllUp = True
        Caption = 'S'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkHide_13: TSpeedButton
        Left = 288
        Top = 304
        Width = 14
        Height = 16
        Hint = 'Mark column "Hide"'
        AllowAllUp = True
        Caption = 'H'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkText_13: TSpeedButton
        Left = 316
        Top = 304
        Width = 14
        Height = 16
        Hint = 'Mark column "Text"'
        AllowAllUp = True
        Caption = 'T'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkBold_13: TSpeedButton
        Left = 335
        Top = 304
        Width = 14
        Height = 16
        Hint = 'Mark as Bold'
        AllowAllUp = True
        Caption = 'B'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkItalic_13: TSpeedButton
        Left = 349
        Top = 304
        Width = 14
        Height = 16
        Hint = 'Mark as Italic'
        AllowAllUp = True
        Caption = 'I '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkUnderline_13: TSpeedButton
        Left = 363
        Top = 304
        Width = 14
        Height = 16
        Hint = 'Mark as Underline'
        AllowAllUp = True
        Caption = 'U'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsUnderline]
        Margin = 1
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkStrikeOut_13: TSpeedButton
        Left = 377
        Top = 304
        Width = 14
        Height = 16
        Hint = 'Mark as Strikethrough'
        AllowAllUp = True
        Caption = 'S'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsStrikeOut]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkNum_14: TSpeedButton
        Left = 246
        Top = 320
        Width = 14
        Height = 16
        Hint = 'Mark column "Num"'
        AllowAllUp = True
        Caption = 'N'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkShow_14: TSpeedButton
        Left = 274
        Top = 320
        Width = 14
        Height = 16
        Hint = 'Mark column "Show"'
        AllowAllUp = True
        Caption = 'S'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkHide_14: TSpeedButton
        Left = 288
        Top = 320
        Width = 14
        Height = 16
        Hint = 'Mark column "Hide"'
        AllowAllUp = True
        Caption = 'H'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkText_14: TSpeedButton
        Left = 316
        Top = 320
        Width = 14
        Height = 16
        Hint = 'Mark column "Text"'
        AllowAllUp = True
        Caption = 'T'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkBold_14: TSpeedButton
        Left = 335
        Top = 320
        Width = 14
        Height = 16
        Hint = 'Mark as Bold'
        AllowAllUp = True
        Caption = 'B'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkItalic_14: TSpeedButton
        Left = 349
        Top = 320
        Width = 14
        Height = 16
        Hint = 'Mark as Italic'
        AllowAllUp = True
        Caption = 'I '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkUnderline_14: TSpeedButton
        Left = 363
        Top = 320
        Width = 14
        Height = 16
        Hint = 'Mark as Underline'
        AllowAllUp = True
        Caption = 'U'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsUnderline]
        Margin = 1
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkStrikeOut_14: TSpeedButton
        Left = 377
        Top = 320
        Width = 14
        Height = 16
        Hint = 'Mark as Strikethrough'
        AllowAllUp = True
        Caption = 'S'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsStrikeOut]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkNum_15: TSpeedButton
        Left = 246
        Top = 336
        Width = 14
        Height = 16
        Hint = 'Mark column "Num"'
        AllowAllUp = True
        Caption = 'N'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkShow_15: TSpeedButton
        Left = 274
        Top = 336
        Width = 14
        Height = 16
        Hint = 'Mark column "Show"'
        AllowAllUp = True
        Caption = 'S'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkHide_15: TSpeedButton
        Left = 288
        Top = 336
        Width = 14
        Height = 16
        Hint = 'Mark column "Hide"'
        AllowAllUp = True
        Caption = 'H'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkText_15: TSpeedButton
        Left = 316
        Top = 336
        Width = 14
        Height = 16
        Hint = 'Mark column "Text"'
        AllowAllUp = True
        Caption = 'T'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkBold_15: TSpeedButton
        Left = 335
        Top = 336
        Width = 14
        Height = 16
        Hint = 'Mark as Bold'
        AllowAllUp = True
        Caption = 'B'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkItalic_15: TSpeedButton
        Left = 349
        Top = 336
        Width = 14
        Height = 16
        Hint = 'Mark as Italic'
        AllowAllUp = True
        Caption = 'I '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkUnderline_15: TSpeedButton
        Left = 363
        Top = 336
        Width = 14
        Height = 16
        Hint = 'Mark as Underline'
        AllowAllUp = True
        Caption = 'U'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsUnderline]
        Margin = 1
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkStrikeOut_15: TSpeedButton
        Left = 377
        Top = 336
        Width = 14
        Height = 16
        Hint = 'Mark as Strikethrough'
        AllowAllUp = True
        Caption = 'S'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsStrikeOut]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkNum_16: TSpeedButton
        Left = 246
        Top = 360
        Width = 14
        Height = 16
        Hint = 'Mark column "Num"'
        AllowAllUp = True
        Caption = 'N'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkShow_16: TSpeedButton
        Left = 274
        Top = 360
        Width = 14
        Height = 16
        Hint = 'Mark column "Show"'
        AllowAllUp = True
        Caption = 'S'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkHide_16: TSpeedButton
        Left = 288
        Top = 360
        Width = 14
        Height = 16
        Hint = 'Mark column "Hide"'
        AllowAllUp = True
        Caption = 'H'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkText_16: TSpeedButton
        Left = 316
        Top = 360
        Width = 14
        Height = 16
        Hint = 'Mark column "Text"'
        AllowAllUp = True
        Caption = 'T'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkBold_16: TSpeedButton
        Left = 335
        Top = 360
        Width = 14
        Height = 16
        Hint = 'Mark as Bold'
        AllowAllUp = True
        Caption = 'B'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkItalic_16: TSpeedButton
        Left = 349
        Top = 360
        Width = 14
        Height = 16
        Hint = 'Mark as Italic'
        AllowAllUp = True
        Caption = 'I '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkUnderline_16: TSpeedButton
        Left = 363
        Top = 360
        Width = 14
        Height = 16
        Hint = 'Mark as Underline'
        AllowAllUp = True
        Caption = 'U'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsUnderline]
        Margin = 1
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkStrikeOut_16: TSpeedButton
        Left = 377
        Top = 360
        Width = 14
        Height = 16
        Hint = 'Mark as Strikethrough'
        AllowAllUp = True
        Caption = 'S'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsStrikeOut]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkNum_17: TSpeedButton
        Left = 246
        Top = 424
        Width = 14
        Height = 16
        Hint = 'Mark column "Num"'
        AllowAllUp = True
        Caption = 'N'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkShow_17: TSpeedButton
        Left = 274
        Top = 424
        Width = 14
        Height = 16
        Hint = 'Mark column "Show"'
        AllowAllUp = True
        Caption = 'S'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkHide_17: TSpeedButton
        Left = 288
        Top = 424
        Width = 14
        Height = 16
        Hint = 'Mark column "Hide"'
        AllowAllUp = True
        Caption = 'H'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkText_17: TSpeedButton
        Left = 316
        Top = 424
        Width = 14
        Height = 16
        Hint = 'Mark column "Text"'
        AllowAllUp = True
        Caption = 'T'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkBold_17: TSpeedButton
        Left = 335
        Top = 424
        Width = 14
        Height = 16
        Hint = 'Mark as Bold'
        AllowAllUp = True
        Caption = 'B'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkItalic_17: TSpeedButton
        Left = 349
        Top = 424
        Width = 14
        Height = 16
        Hint = 'Mark as Italic'
        AllowAllUp = True
        Caption = 'I '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkUnderline_17: TSpeedButton
        Left = 363
        Top = 424
        Width = 14
        Height = 16
        Hint = 'Mark as Underline'
        AllowAllUp = True
        Caption = 'U'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsUnderline]
        Margin = 1
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkStrikeOut_17: TSpeedButton
        Left = 377
        Top = 424
        Width = 14
        Height = 16
        Hint = 'Mark as Strikethrough'
        AllowAllUp = True
        Caption = 'S'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsStrikeOut]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkNum_18: TSpeedButton
        Left = 246
        Top = 440
        Width = 14
        Height = 16
        Hint = 'Mark column "Num"'
        AllowAllUp = True
        Caption = 'N'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkShow_18: TSpeedButton
        Left = 274
        Top = 440
        Width = 14
        Height = 16
        Hint = 'Mark column "Show"'
        AllowAllUp = True
        Caption = 'S'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkHide_18: TSpeedButton
        Left = 288
        Top = 440
        Width = 14
        Height = 16
        Hint = 'Mark column "Hide"'
        AllowAllUp = True
        Caption = 'H'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkText_18: TSpeedButton
        Left = 316
        Top = 440
        Width = 14
        Height = 16
        Hint = 'Mark column "Text"'
        AllowAllUp = True
        Caption = 'T'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkBold_18: TSpeedButton
        Left = 335
        Top = 440
        Width = 14
        Height = 16
        Hint = 'Mark as Bold'
        AllowAllUp = True
        Caption = 'B'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkItalic_18: TSpeedButton
        Left = 349
        Top = 440
        Width = 14
        Height = 16
        Hint = 'Mark as Italic'
        AllowAllUp = True
        Caption = 'I '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkUnderline_18: TSpeedButton
        Left = 363
        Top = 440
        Width = 14
        Height = 16
        Hint = 'Mark as Underline'
        AllowAllUp = True
        Caption = 'U'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsUnderline]
        Margin = 1
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkStrikeOut_18: TSpeedButton
        Left = 377
        Top = 440
        Width = 14
        Height = 16
        Hint = 'Mark as Strikethrough'
        AllowAllUp = True
        Caption = 'S'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsStrikeOut]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkNum_19: TSpeedButton
        Left = 246
        Top = 456
        Width = 14
        Height = 16
        Hint = 'Mark column "Num"'
        AllowAllUp = True
        Caption = 'N'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkShow_19: TSpeedButton
        Left = 274
        Top = 456
        Width = 14
        Height = 16
        Hint = 'Mark column "Show"'
        AllowAllUp = True
        Caption = 'S'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkHide_19: TSpeedButton
        Left = 288
        Top = 456
        Width = 14
        Height = 16
        Hint = 'Mark column "Hide"'
        AllowAllUp = True
        Caption = 'H'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkText_19: TSpeedButton
        Left = 316
        Top = 456
        Width = 14
        Height = 16
        Hint = 'Mark column "Text"'
        AllowAllUp = True
        Caption = 'T'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkBold_19: TSpeedButton
        Left = 335
        Top = 456
        Width = 14
        Height = 16
        Hint = 'Mark as Bold'
        AllowAllUp = True
        Caption = 'B'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkItalic_19: TSpeedButton
        Left = 349
        Top = 456
        Width = 14
        Height = 16
        Hint = 'Mark as Italic'
        AllowAllUp = True
        Caption = 'I '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkUnderline_19: TSpeedButton
        Left = 363
        Top = 456
        Width = 14
        Height = 16
        Hint = 'Mark as Underline'
        AllowAllUp = True
        Caption = 'U'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsUnderline]
        Margin = 1
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkStrikeOut_19: TSpeedButton
        Left = 377
        Top = 456
        Width = 14
        Height = 16
        Hint = 'Mark as Strikethrough'
        AllowAllUp = True
        Caption = 'S'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsStrikeOut]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkNum_0: TSpeedButton
        Left = 246
        Top = 8
        Width = 14
        Height = 16
        Hint = 'Mark column "Num"'
        AllowAllUp = True
        Caption = 'N'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkShow_0: TSpeedButton
        Left = 274
        Top = 8
        Width = 14
        Height = 16
        Hint = 'Mark column "Show"'
        AllowAllUp = True
        Caption = 'S'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkHide_0: TSpeedButton
        Left = 288
        Top = 8
        Width = 14
        Height = 16
        Hint = 'Mark column "Hide"'
        AllowAllUp = True
        Caption = 'H'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkText_0: TSpeedButton
        Tag = 1
        Left = 316
        Top = 8
        Width = 14
        Height = 16
        Hint = 'Mark column "Text"'
        AllowAllUp = True
        Caption = 'T'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkBold_0: TSpeedButton
        Left = 335
        Top = 8
        Width = 14
        Height = 16
        Hint = 'Mark as Bold'
        AllowAllUp = True
        Caption = 'B'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkItalic_0: TSpeedButton
        Left = 349
        Top = 8
        Width = 14
        Height = 16
        Hint = 'Mark as Italic'
        AllowAllUp = True
        Caption = 'I '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkUnderline_0: TSpeedButton
        Left = 363
        Top = 8
        Width = 14
        Height = 16
        Hint = 'Mark as Underline'
        AllowAllUp = True
        Caption = 'U'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsUnderline]
        Margin = 1
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkStrikeOut_0: TSpeedButton
        Left = 377
        Top = 8
        Width = 14
        Height = 16
        Hint = 'Mark as Strikethrough'
        AllowAllUp = True
        Caption = 'S'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsStrikeOut]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkNum_20: TSpeedButton
        Left = 246
        Top = 472
        Width = 14
        Height = 16
        Hint = 'Mark column "Num"'
        AllowAllUp = True
        Caption = 'N'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkShow_20: TSpeedButton
        Left = 274
        Top = 472
        Width = 14
        Height = 16
        Hint = 'Mark column "Show"'
        AllowAllUp = True
        Caption = 'S'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkHide_20: TSpeedButton
        Left = 288
        Top = 472
        Width = 14
        Height = 16
        Hint = 'Mark column "Hide"'
        AllowAllUp = True
        Caption = 'H'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkText_20: TSpeedButton
        Left = 316
        Top = 472
        Width = 14
        Height = 16
        Hint = 'Mark column "Text"'
        AllowAllUp = True
        Caption = 'T'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkBold_20: TSpeedButton
        Left = 335
        Top = 472
        Width = 14
        Height = 16
        Hint = 'Mark as Bold'
        AllowAllUp = True
        Caption = 'B'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkItalic_20: TSpeedButton
        Left = 349
        Top = 472
        Width = 14
        Height = 16
        Hint = 'Mark as Italic'
        AllowAllUp = True
        Caption = 'I '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkUnderline_20: TSpeedButton
        Left = 363
        Top = 472
        Width = 14
        Height = 16
        Hint = 'Mark as Underline'
        AllowAllUp = True
        Caption = 'U'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsUnderline]
        Margin = 1
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkStrikeOut_20: TSpeedButton
        Left = 377
        Top = 472
        Width = 14
        Height = 16
        Hint = 'Mark as Strikethrough'
        AllowAllUp = True
        Caption = 'S'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsStrikeOut]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkNum_21: TSpeedButton
        Left = 246
        Top = 376
        Width = 14
        Height = 16
        Hint = 'Mark column "Num"'
        AllowAllUp = True
        Caption = 'N'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkShow_21: TSpeedButton
        Left = 274
        Top = 376
        Width = 14
        Height = 16
        Hint = 'Mark column "Show"'
        AllowAllUp = True
        Caption = 'S'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkHide_21: TSpeedButton
        Left = 288
        Top = 376
        Width = 14
        Height = 16
        Hint = 'Mark column "Hide"'
        AllowAllUp = True
        Caption = 'H'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkText_21: TSpeedButton
        Left = 316
        Top = 376
        Width = 14
        Height = 16
        Hint = 'Mark column "Text"'
        AllowAllUp = True
        Caption = 'T'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkBold_21: TSpeedButton
        Left = 335
        Top = 376
        Width = 14
        Height = 16
        Hint = 'Mark as Bold'
        AllowAllUp = True
        Caption = 'B'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkItalic_21: TSpeedButton
        Left = 349
        Top = 376
        Width = 14
        Height = 16
        Hint = 'Mark as Italic'
        AllowAllUp = True
        Caption = 'I '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkUnderline_21: TSpeedButton
        Left = 363
        Top = 376
        Width = 14
        Height = 16
        Hint = 'Mark as Underline'
        AllowAllUp = True
        Caption = 'U'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsUnderline]
        Margin = 1
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkStrikeOut_21: TSpeedButton
        Left = 377
        Top = 376
        Width = 14
        Height = 16
        Hint = 'Mark as Strikethrough'
        AllowAllUp = True
        Caption = 'S'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsStrikeOut]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkNum_22: TSpeedButton
        Left = 246
        Top = 496
        Width = 14
        Height = 16
        Hint = 'Mark column "Num"'
        AllowAllUp = True
        Caption = 'N'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkShow_22: TSpeedButton
        Left = 274
        Top = 496
        Width = 14
        Height = 16
        Hint = 'Mark column "Show"'
        AllowAllUp = True
        Caption = 'S'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkHide_22: TSpeedButton
        Left = 288
        Top = 496
        Width = 14
        Height = 16
        Hint = 'Mark column "Hide"'
        AllowAllUp = True
        Caption = 'H'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkText_22: TSpeedButton
        Left = 316
        Top = 496
        Width = 14
        Height = 16
        Hint = 'Mark column "Text"'
        AllowAllUp = True
        Caption = 'T'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkBold_22: TSpeedButton
        Left = 335
        Top = 496
        Width = 14
        Height = 16
        Hint = 'Mark as Bold'
        AllowAllUp = True
        Caption = 'B'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkItalic_22: TSpeedButton
        Left = 349
        Top = 496
        Width = 14
        Height = 16
        Hint = 'Mark as Italic'
        AllowAllUp = True
        Caption = 'I '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkUnderline_22: TSpeedButton
        Left = 363
        Top = 496
        Width = 14
        Height = 16
        Hint = 'Mark as Underline'
        AllowAllUp = True
        Caption = 'U'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsUnderline]
        Margin = 1
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkStrikeOut_22: TSpeedButton
        Left = 377
        Top = 496
        Width = 14
        Height = 16
        Hint = 'Mark as Strikethrough'
        AllowAllUp = True
        Caption = 'S'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsStrikeOut]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkNum_23: TSpeedButton
        Left = 246
        Top = 120
        Width = 14
        Height = 16
        Hint = 'Mark column "Num"'
        AllowAllUp = True
        Caption = 'N'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkShow_23: TSpeedButton
        Tag = 1
        Left = 274
        Top = 120
        Width = 14
        Height = 16
        Hint = 'Mark column "Show"'
        AllowAllUp = True
        Caption = 'S'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkHide_23: TSpeedButton
        Left = 288
        Top = 120
        Width = 14
        Height = 16
        Hint = 'Mark column "Hide"'
        AllowAllUp = True
        Caption = 'H'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkText_23: TSpeedButton
        Left = 316
        Top = 120
        Width = 14
        Height = 16
        Hint = 'Mark column "Text"'
        AllowAllUp = True
        Caption = 'T'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkItalic_23: TSpeedButton
        Left = 349
        Top = 120
        Width = 14
        Height = 16
        Hint = 'Mark as Italic'
        AllowAllUp = True
        Caption = 'I '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkBold_23: TSpeedButton
        Left = 335
        Top = 120
        Width = 14
        Height = 16
        Hint = 'Mark as Bold'
        AllowAllUp = True
        Caption = 'B'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkUnderline_23: TSpeedButton
        Left = 363
        Top = 120
        Width = 14
        Height = 16
        Hint = 'Mark as Underline'
        AllowAllUp = True
        Caption = 'U'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsUnderline]
        Margin = 1
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkStrikeOut_23: TSpeedButton
        Left = 377
        Top = 120
        Width = 14
        Height = 16
        Hint = 'Mark as Strikethrough'
        AllowAllUp = True
        Caption = 'S'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsStrikeOut]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkNum_24: TSpeedButton
        Left = 246
        Top = 408
        Width = 14
        Height = 16
        Hint = 'Mark column "Num"'
        AllowAllUp = True
        Caption = 'N'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkShow_24: TSpeedButton
        Left = 274
        Top = 408
        Width = 14
        Height = 16
        Hint = 'Mark column "Show"'
        AllowAllUp = True
        Caption = 'S'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkHide_24: TSpeedButton
        Left = 288
        Top = 408
        Width = 14
        Height = 16
        Hint = 'Mark column "Hide"'
        AllowAllUp = True
        Caption = 'H'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkText_24: TSpeedButton
        Left = 316
        Top = 408
        Width = 14
        Height = 16
        Hint = 'Mark column "Text"'
        AllowAllUp = True
        Caption = 'T'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkBold_24: TSpeedButton
        Left = 335
        Top = 408
        Width = 14
        Height = 16
        Hint = 'Mark as Bold'
        AllowAllUp = True
        Caption = 'B'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkItalic_24: TSpeedButton
        Left = 349
        Top = 408
        Width = 14
        Height = 16
        Hint = 'Mark as Italic'
        AllowAllUp = True
        Caption = 'I '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkUnderline_24: TSpeedButton
        Left = 363
        Top = 408
        Width = 14
        Height = 16
        Hint = 'Mark as Underline'
        AllowAllUp = True
        Caption = 'U'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsUnderline]
        Margin = 1
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkStrikeOut_24: TSpeedButton
        Left = 377
        Top = 408
        Width = 14
        Height = 16
        Hint = 'Mark as Strikethrough'
        AllowAllUp = True
        Caption = 'S'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsStrikeOut]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkPause_0: TSpeedButton
        Left = 260
        Top = 8
        Width = 14
        Height = 16
        Hint = 'Mark column "Pause"'
        AllowAllUp = True
        Caption = 'P'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkPause_1: TSpeedButton
        Left = 260
        Top = 40
        Width = 14
        Height = 16
        Hint = 'Mark column "Pause"'
        AllowAllUp = True
        Caption = 'P'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkPause_2: TSpeedButton
        Left = 260
        Top = 56
        Width = 14
        Height = 16
        Hint = 'Mark column "Pause"'
        AllowAllUp = True
        Caption = 'P'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkPause_3: TSpeedButton
        Tag = 1
        Left = 260
        Top = 88
        Width = 14
        Height = 16
        Hint = 'Mark column "Pause"'
        AllowAllUp = True
        Caption = 'P'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkPause_4: TSpeedButton
        Left = 260
        Top = 104
        Width = 14
        Height = 16
        Hint = 'Mark column "Pause"'
        AllowAllUp = True
        Caption = 'P'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkPause_23: TSpeedButton
        Tag = 1
        Left = 260
        Top = 120
        Width = 14
        Height = 16
        Hint = 'Mark column "Pause"'
        AllowAllUp = True
        Caption = 'P'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkPause_5: TSpeedButton
        Left = 260
        Top = 144
        Width = 14
        Height = 16
        Hint = 'Mark column "Pause"'
        AllowAllUp = True
        Caption = 'P'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkPause_6: TSpeedButton
        Left = 260
        Top = 160
        Width = 14
        Height = 16
        Hint = 'Mark column "Pause"'
        AllowAllUp = True
        Caption = 'P'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkPause_7: TSpeedButton
        Left = 260
        Top = 176
        Width = 14
        Height = 16
        Hint = 'Mark column "Pause"'
        AllowAllUp = True
        Caption = 'P'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkPause_8: TSpeedButton
        Left = 260
        Top = 192
        Width = 14
        Height = 16
        Hint = 'Mark column "Pause"'
        AllowAllUp = True
        Caption = 'P'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkPause_9: TSpeedButton
        Left = 260
        Top = 224
        Width = 14
        Height = 16
        Hint = 'Mark column "Pause"'
        AllowAllUp = True
        Caption = 'P'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkPause_10: TSpeedButton
        Left = 260
        Top = 240
        Width = 14
        Height = 16
        Hint = 'Mark column "Pause"'
        AllowAllUp = True
        Caption = 'P'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkPause_11: TSpeedButton
        Left = 260
        Top = 272
        Width = 14
        Height = 16
        Hint = 'Mark column "Pause"'
        AllowAllUp = True
        Caption = 'P'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkPause_12: TSpeedButton
        Left = 260
        Top = 288
        Width = 14
        Height = 16
        Hint = 'Mark column "Pause"'
        AllowAllUp = True
        Caption = 'P'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkPause_13: TSpeedButton
        Left = 260
        Top = 304
        Width = 14
        Height = 16
        Hint = 'Mark column "Pause"'
        AllowAllUp = True
        Caption = 'P'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkPause_14: TSpeedButton
        Left = 260
        Top = 320
        Width = 14
        Height = 16
        Hint = 'Mark column "Pause"'
        AllowAllUp = True
        Caption = 'P'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkPause_15: TSpeedButton
        Left = 260
        Top = 336
        Width = 14
        Height = 16
        Hint = 'Mark column "Pause"'
        AllowAllUp = True
        Caption = 'P'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkPause_16: TSpeedButton
        Left = 260
        Top = 360
        Width = 14
        Height = 16
        Hint = 'Mark column "Pause"'
        AllowAllUp = True
        Caption = 'P'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkPause_21: TSpeedButton
        Left = 260
        Top = 376
        Width = 14
        Height = 16
        Hint = 'Mark column "Pause"'
        AllowAllUp = True
        Caption = 'P'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkPause_24: TSpeedButton
        Left = 260
        Top = 408
        Width = 14
        Height = 16
        Hint = 'Mark column "Pause"'
        AllowAllUp = True
        Caption = 'P'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkPause_17: TSpeedButton
        Left = 260
        Top = 424
        Width = 14
        Height = 16
        Hint = 'Mark column "Pause"'
        AllowAllUp = True
        Caption = 'P'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkPause_18: TSpeedButton
        Left = 260
        Top = 440
        Width = 14
        Height = 16
        Hint = 'Mark column "Pause"'
        AllowAllUp = True
        Caption = 'P'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkPause_19: TSpeedButton
        Left = 260
        Top = 456
        Width = 14
        Height = 16
        Hint = 'Mark column "Pause"'
        AllowAllUp = True
        Caption = 'P'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkPause_20: TSpeedButton
        Left = 260
        Top = 472
        Width = 14
        Height = 16
        Hint = 'Mark column "Pause"'
        AllowAllUp = True
        Caption = 'P'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkPause_22: TSpeedButton
        Left = 260
        Top = 496
        Width = 14
        Height = 16
        Hint = 'Mark column "Pause"'
        AllowAllUp = True
        Caption = 'P'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkDur_0: TSpeedButton
        Left = 302
        Top = 8
        Width = 14
        Height = 16
        Hint = 'Mark column "Duration"'
        AllowAllUp = True
        Caption = 'D'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkDur_1: TSpeedButton
        Left = 302
        Top = 40
        Width = 14
        Height = 16
        Hint = 'Mark column "Duration"'
        AllowAllUp = True
        Caption = 'D'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkDur_2: TSpeedButton
        Left = 302
        Top = 56
        Width = 14
        Height = 16
        Hint = 'Mark column "Duration"'
        AllowAllUp = True
        Caption = 'D'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkDur_3: TSpeedButton
        Left = 302
        Top = 88
        Width = 14
        Height = 16
        Hint = 'Mark column "Duration"'
        AllowAllUp = True
        Caption = 'D'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkDur_4: TSpeedButton
        Left = 302
        Top = 104
        Width = 14
        Height = 16
        Hint = 'Mark column "Duration"'
        AllowAllUp = True
        Caption = 'D'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkDur_23: TSpeedButton
        Left = 302
        Top = 120
        Width = 14
        Height = 16
        Hint = 'Mark column "Duration"'
        AllowAllUp = True
        Caption = 'D'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkDur_5: TSpeedButton
        Tag = 1
        Left = 302
        Top = 144
        Width = 14
        Height = 16
        Hint = 'Mark column "Duration"'
        AllowAllUp = True
        Caption = 'D'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkDur_6: TSpeedButton
        Tag = 1
        Left = 302
        Top = 160
        Width = 14
        Height = 16
        Hint = 'Mark column "Duration"'
        AllowAllUp = True
        Caption = 'D'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkDur_7: TSpeedButton
        Left = 302
        Top = 176
        Width = 14
        Height = 16
        Hint = 'Mark column "Duration"'
        AllowAllUp = True
        Caption = 'D'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkDur_8: TSpeedButton
        Left = 302
        Top = 192
        Width = 14
        Height = 16
        Hint = 'Mark column "Duration"'
        AllowAllUp = True
        Caption = 'D'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkDur_9: TSpeedButton
        Left = 302
        Top = 224
        Width = 14
        Height = 16
        Hint = 'Mark column "Duration"'
        AllowAllUp = True
        Caption = 'D'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkDur_10: TSpeedButton
        Left = 302
        Top = 240
        Width = 14
        Height = 16
        Hint = 'Mark column "Duration"'
        AllowAllUp = True
        Caption = 'D'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkDur_11: TSpeedButton
        Left = 302
        Top = 272
        Width = 14
        Height = 16
        Hint = 'Mark column "Duration"'
        AllowAllUp = True
        Caption = 'D'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkDur_12: TSpeedButton
        Left = 302
        Top = 288
        Width = 14
        Height = 16
        Hint = 'Mark column "Duration"'
        AllowAllUp = True
        Caption = 'D'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkDur_13: TSpeedButton
        Left = 302
        Top = 304
        Width = 14
        Height = 16
        Hint = 'Mark column "Duration"'
        AllowAllUp = True
        Caption = 'D'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkDur_14: TSpeedButton
        Left = 302
        Top = 320
        Width = 14
        Height = 16
        Hint = 'Mark column "Duration"'
        AllowAllUp = True
        Caption = 'D'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkDur_15: TSpeedButton
        Left = 302
        Top = 336
        Width = 14
        Height = 16
        Hint = 'Mark column "Duration"'
        AllowAllUp = True
        Caption = 'D'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkDur_16: TSpeedButton
        Left = 302
        Top = 360
        Width = 14
        Height = 16
        Hint = 'Mark column "Duration"'
        AllowAllUp = True
        Caption = 'D'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkDur_21: TSpeedButton
        Left = 302
        Top = 376
        Width = 14
        Height = 16
        Hint = 'Mark column "Duration"'
        AllowAllUp = True
        Caption = 'D'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkDur_24: TSpeedButton
        Left = 302
        Top = 408
        Width = 14
        Height = 16
        Hint = 'Mark column "Duration"'
        AllowAllUp = True
        Caption = 'D'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkDur_17: TSpeedButton
        Left = 302
        Top = 424
        Width = 14
        Height = 16
        Hint = 'Mark column "Duration"'
        AllowAllUp = True
        Caption = 'D'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkDur_18: TSpeedButton
        Left = 302
        Top = 440
        Width = 14
        Height = 16
        Hint = 'Mark column "Duration"'
        AllowAllUp = True
        Caption = 'D'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkDur_19: TSpeedButton
        Left = 302
        Top = 456
        Width = 14
        Height = 16
        Hint = 'Mark column "Duration"'
        AllowAllUp = True
        Caption = 'D'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkDur_20: TSpeedButton
        Left = 302
        Top = 472
        Width = 14
        Height = 16
        Hint = 'Mark column "Duration"'
        AllowAllUp = True
        Caption = 'D'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sbMarkDur_22: TSpeedButton
        Left = 302
        Top = 496
        Width = 14
        Height = 16
        Hint = 'Mark column "Duration"'
        AllowAllUp = True
        Caption = 'D'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object pnlMarkBckgr_6: TPanel
        Left = 419
        Top = 160
        Width = 22
        Height = 16
        Hint = 'Mark the Background Color'
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = 14807295
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 20
        OnDragDrop = ColorPanelsDragDrop
        OnDragOver = ColorPanelsDragOver
        OnEndDrag = ColorPanelsEndDrag
        OnMouseDown = MarkBckgrColorPanelsMouseDown
      end
      object pnlMarkColor_6: TPanel
        Left = 395
        Top = 160
        Width = 22
        Height = 16
        Hint = 'Mark the Text Color'
        Color = clWindowText
        Font.Charset = ANSI_CHARSET
        Font.Color = 21156
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 21
        OnDragDrop = ColorPanelsDragDrop
        OnDragOver = ColorPanelsDragOver
        OnEndDrag = ColorPanelsEndDrag
        OnMouseDown = MarkTextColorPanelsMouseDown
      end
      object pnlMarkColor_5: TPanel
        Left = 395
        Top = 144
        Width = 22
        Height = 16
        Hint = 'Mark the Text Color'
        Color = clWindowText
        Font.Charset = ANSI_CHARSET
        Font.Color = 2162799
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 22
        OnDragDrop = ColorPanelsDragDrop
        OnDragOver = ColorPanelsDragOver
        OnEndDrag = ColorPanelsEndDrag
        OnMouseDown = MarkTextColorPanelsMouseDown
      end
      object pnlMarkBckgr_5: TPanel
        Left = 419
        Top = 144
        Width = 22
        Height = 17
        Hint = 'Mark the Background Color'
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = 14273525
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 23
        OnDragDrop = ColorPanelsDragDrop
        OnDragOver = ColorPanelsDragOver
        OnEndDrag = ColorPanelsEndDrag
        OnMouseDown = MarkBckgrColorPanelsMouseDown
      end
      object pnlMarkColor_4: TPanel
        Left = 395
        Top = 104
        Width = 22
        Height = 16
        Hint = 'Mark the Text Color'
        Color = clWindowText
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 24
        OnDragDrop = ColorPanelsDragDrop
        OnDragOver = ColorPanelsDragOver
        OnEndDrag = ColorPanelsEndDrag
        OnMouseDown = MarkTextColorPanelsMouseDown
      end
      object pnlMarkBckgr_4: TPanel
        Left = 419
        Top = 104
        Width = 22
        Height = 16
        Hint = 'Mark the Background Color'
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 25
        OnDragDrop = ColorPanelsDragDrop
        OnDragOver = ColorPanelsDragOver
        OnEndDrag = ColorPanelsEndDrag
        OnMouseDown = MarkBckgrColorPanelsMouseDown
      end
      object pnlMarkColor_3: TPanel
        Left = 395
        Top = 88
        Width = 22
        Height = 16
        Hint = 'Mark the Text Color'
        Color = clWindowText
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 26
        OnDragDrop = ColorPanelsDragDrop
        OnDragOver = ColorPanelsDragOver
        OnEndDrag = ColorPanelsEndDrag
        OnMouseDown = MarkTextColorPanelsMouseDown
      end
      object pnlMarkBckgr_3: TPanel
        Left = 419
        Top = 88
        Width = 22
        Height = 16
        Hint = 'Mark the Background Color'
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = 2425019
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 27
        OnDragDrop = ColorPanelsDragDrop
        OnDragOver = ColorPanelsDragOver
        OnEndDrag = ColorPanelsEndDrag
        OnMouseDown = MarkBckgrColorPanelsMouseDown
      end
      object pnlMarkColor_2: TPanel
        Left = 395
        Top = 56
        Width = 22
        Height = 16
        Hint = 'Mark the Text Color'
        Color = clWindowText
        ParentShowHint = False
        ShowHint = True
        TabOrder = 28
        OnDragDrop = ColorPanelsDragDrop
        OnDragOver = ColorPanelsDragOver
        OnEndDrag = ColorPanelsEndDrag
        OnMouseDown = MarkTextColorPanelsMouseDown
      end
      object pnlMarkBckgr_2: TPanel
        Left = 419
        Top = 56
        Width = 22
        Height = 16
        Hint = 'Mark the Background Color'
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 29
        OnDragDrop = ColorPanelsDragDrop
        OnDragOver = ColorPanelsDragOver
        OnEndDrag = ColorPanelsEndDrag
        OnMouseDown = MarkBckgrColorPanelsMouseDown
      end
      object pnlMarkColor_1: TPanel
        Left = 395
        Top = 40
        Width = 22
        Height = 16
        Hint = 'Mark the Text Color'
        Color = clWindowText
        ParentShowHint = False
        ShowHint = True
        TabOrder = 30
        OnDragDrop = ColorPanelsDragDrop
        OnDragOver = ColorPanelsDragOver
        OnEndDrag = ColorPanelsEndDrag
        OnMouseDown = MarkTextColorPanelsMouseDown
      end
      object pnlMarkBckgr_1: TPanel
        Left = 419
        Top = 40
        Width = 22
        Height = 16
        Hint = 'Mark the Background Color'
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = 13619151
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 31
        OnDragDrop = ColorPanelsDragDrop
        OnDragOver = ColorPanelsDragOver
        OnEndDrag = ColorPanelsEndDrag
        OnMouseDown = MarkBckgrColorPanelsMouseDown
      end
      object pnlMarkColor_7: TPanel
        Left = 395
        Top = 176
        Width = 22
        Height = 16
        Hint = 'Mark the Text Color'
        Color = clWindowText
        ParentShowHint = False
        ShowHint = True
        TabOrder = 32
        OnDragDrop = ColorPanelsDragDrop
        OnDragOver = ColorPanelsDragOver
        OnEndDrag = ColorPanelsEndDrag
        OnMouseDown = MarkTextColorPanelsMouseDown
      end
      object pnlMarkBckgr_7: TPanel
        Left = 419
        Top = 176
        Width = 22
        Height = 16
        Hint = 'Mark the Background Color'
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = 10987248
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 33
        OnDragDrop = ColorPanelsDragDrop
        OnDragOver = ColorPanelsDragOver
        OnEndDrag = ColorPanelsEndDrag
        OnMouseDown = MarkBckgrColorPanelsMouseDown
      end
      object pnlMarkColor_8: TPanel
        Left = 395
        Top = 192
        Width = 22
        Height = 16
        Hint = 'Mark the Text Color'
        Color = clWindowText
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 34
        OnDragDrop = ColorPanelsDragDrop
        OnDragOver = ColorPanelsDragOver
        OnEndDrag = ColorPanelsEndDrag
        OnMouseDown = MarkTextColorPanelsMouseDown
      end
      object pnlMarkBckgr_8: TPanel
        Left = 419
        Top = 192
        Width = 22
        Height = 16
        Hint = 'Mark the Background Color'
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindow
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 35
        OnDragDrop = ColorPanelsDragDrop
        OnDragOver = ColorPanelsDragOver
        OnEndDrag = ColorPanelsEndDrag
        OnMouseDown = MarkBckgrColorPanelsMouseDown
      end
      object pnlMarkColor_9: TPanel
        Left = 395
        Top = 224
        Width = 22
        Height = 16
        Hint = 'Mark the Text Color'
        Color = clWindowText
        ParentShowHint = False
        ShowHint = True
        TabOrder = 36
        OnDragDrop = ColorPanelsDragDrop
        OnDragOver = ColorPanelsDragOver
        OnEndDrag = ColorPanelsEndDrag
        OnMouseDown = MarkTextColorPanelsMouseDown
      end
      object pnlMarkBckgr_9: TPanel
        Left = 419
        Top = 224
        Width = 22
        Height = 16
        Hint = 'Mark the Background Color'
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindow
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 37
        OnDragDrop = ColorPanelsDragDrop
        OnDragOver = ColorPanelsDragOver
        OnEndDrag = ColorPanelsEndDrag
        OnMouseDown = MarkBckgrColorPanelsMouseDown
      end
      object pnlMarkColor_10: TPanel
        Left = 395
        Top = 240
        Width = 22
        Height = 16
        Hint = 'Mark the Text Color'
        Color = clWindowText
        ParentShowHint = False
        ShowHint = True
        TabOrder = 38
        OnDragDrop = ColorPanelsDragDrop
        OnDragOver = ColorPanelsDragOver
        OnEndDrag = ColorPanelsEndDrag
        OnMouseDown = MarkTextColorPanelsMouseDown
      end
      object pnlMarkBckgr_10: TPanel
        Left = 419
        Top = 240
        Width = 22
        Height = 16
        Hint = 'Mark the Background Color'
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindow
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 39
        OnDragDrop = ColorPanelsDragDrop
        OnDragOver = ColorPanelsDragOver
        OnEndDrag = ColorPanelsEndDrag
        OnMouseDown = MarkBckgrColorPanelsMouseDown
      end
      object pnlMarkColor_11: TPanel
        Left = 395
        Top = 272
        Width = 22
        Height = 16
        Hint = 'Mark the Text Color'
        Color = clWindowText
        ParentShowHint = False
        ShowHint = True
        TabOrder = 40
        OnDragDrop = ColorPanelsDragDrop
        OnDragOver = ColorPanelsDragOver
        OnEndDrag = ColorPanelsEndDrag
        OnMouseDown = MarkTextColorPanelsMouseDown
      end
      object pnlMarkBckgr_11: TPanel
        Left = 419
        Top = 272
        Width = 22
        Height = 16
        Hint = 'Mark the Background Color'
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindow
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 41
        OnDragDrop = ColorPanelsDragDrop
        OnDragOver = ColorPanelsDragOver
        OnEndDrag = ColorPanelsEndDrag
        OnMouseDown = MarkBckgrColorPanelsMouseDown
      end
      object pnlMarkColor_12: TPanel
        Left = 395
        Top = 288
        Width = 22
        Height = 16
        Hint = 'Mark the Text Color'
        Color = clWindowText
        ParentShowHint = False
        ShowHint = True
        TabOrder = 42
        OnDragDrop = ColorPanelsDragDrop
        OnDragOver = ColorPanelsDragOver
        OnEndDrag = ColorPanelsEndDrag
        OnMouseDown = MarkTextColorPanelsMouseDown
      end
      object pnlMarkBckgr_12: TPanel
        Left = 419
        Top = 288
        Width = 22
        Height = 16
        Hint = 'Mark the Background Color'
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindow
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 43
        OnDragDrop = ColorPanelsDragDrop
        OnDragOver = ColorPanelsDragOver
        OnEndDrag = ColorPanelsEndDrag
        OnMouseDown = MarkBckgrColorPanelsMouseDown
      end
      object pnlMarkColor_13: TPanel
        Left = 395
        Top = 304
        Width = 22
        Height = 16
        Hint = 'Mark the Text Color'
        Color = clWindowText
        ParentShowHint = False
        ShowHint = True
        TabOrder = 44
        OnDragDrop = ColorPanelsDragDrop
        OnDragOver = ColorPanelsDragOver
        OnEndDrag = ColorPanelsEndDrag
        OnMouseDown = MarkTextColorPanelsMouseDown
      end
      object pnlMarkBckgr_13: TPanel
        Left = 419
        Top = 304
        Width = 22
        Height = 16
        Hint = 'Mark the Background Color'
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindow
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 45
        OnDragDrop = ColorPanelsDragDrop
        OnDragOver = ColorPanelsDragOver
        OnEndDrag = ColorPanelsEndDrag
        OnMouseDown = MarkBckgrColorPanelsMouseDown
      end
      object pnlMarkColor_14: TPanel
        Left = 395
        Top = 320
        Width = 22
        Height = 16
        Hint = 'Mark the Text Color'
        Color = clWindowText
        ParentShowHint = False
        ShowHint = True
        TabOrder = 46
        OnDragDrop = ColorPanelsDragDrop
        OnDragOver = ColorPanelsDragOver
        OnEndDrag = ColorPanelsEndDrag
        OnMouseDown = MarkTextColorPanelsMouseDown
      end
      object pnlMarkBckgr_14: TPanel
        Left = 419
        Top = 320
        Width = 22
        Height = 16
        Hint = 'Mark the Background Color'
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindow
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 47
        OnDragDrop = ColorPanelsDragDrop
        OnDragOver = ColorPanelsDragOver
        OnEndDrag = ColorPanelsEndDrag
        OnMouseDown = MarkBckgrColorPanelsMouseDown
      end
      object pnlMarkColor_15: TPanel
        Left = 395
        Top = 336
        Width = 22
        Height = 16
        Hint = 'Mark the Text Color'
        Color = clWindowText
        ParentShowHint = False
        ShowHint = True
        TabOrder = 48
        OnDragDrop = ColorPanelsDragDrop
        OnDragOver = ColorPanelsDragOver
        OnEndDrag = ColorPanelsEndDrag
        OnMouseDown = MarkTextColorPanelsMouseDown
      end
      object pnlMarkBckgr_15: TPanel
        Left = 419
        Top = 336
        Width = 22
        Height = 16
        Hint = 'Mark the Background Color'
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindow
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 49
        OnDragDrop = ColorPanelsDragDrop
        OnDragOver = ColorPanelsDragOver
        OnEndDrag = ColorPanelsEndDrag
        OnMouseDown = MarkBckgrColorPanelsMouseDown
      end
      object pnlMarkColor_16: TPanel
        Left = 395
        Top = 360
        Width = 22
        Height = 17
        Hint = 'Mark the Text Color'
        Color = clWindowText
        ParentShowHint = False
        ShowHint = True
        TabOrder = 50
        OnDragDrop = ColorPanelsDragDrop
        OnDragOver = ColorPanelsDragOver
        OnEndDrag = ColorPanelsEndDrag
        OnMouseDown = MarkTextColorPanelsMouseDown
      end
      object pnlMarkBckgr_16: TPanel
        Left = 419
        Top = 360
        Width = 22
        Height = 16
        Hint = 'Mark the Background Color'
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindow
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 51
        OnDragDrop = ColorPanelsDragDrop
        OnDragOver = ColorPanelsDragOver
        OnEndDrag = ColorPanelsEndDrag
        OnMouseDown = MarkBckgrColorPanelsMouseDown
      end
      object pnlMarkColor_17: TPanel
        Left = 395
        Top = 424
        Width = 22
        Height = 16
        Hint = 'Mark the Text Color'
        Color = clWindowText
        ParentShowHint = False
        ShowHint = True
        TabOrder = 52
        OnDragDrop = ColorPanelsDragDrop
        OnDragOver = ColorPanelsDragOver
        OnEndDrag = ColorPanelsEndDrag
        OnMouseDown = MarkTextColorPanelsMouseDown
      end
      object pnlMarkBckgr_17: TPanel
        Left = 419
        Top = 424
        Width = 22
        Height = 16
        Hint = 'Mark the Background Color'
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindow
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 53
        OnDragDrop = ColorPanelsDragDrop
        OnDragOver = ColorPanelsDragOver
        OnEndDrag = ColorPanelsEndDrag
        OnMouseDown = MarkBckgrColorPanelsMouseDown
      end
      object pnlMarkColor_18: TPanel
        Left = 395
        Top = 440
        Width = 22
        Height = 16
        Hint = 'Mark the Text Color'
        Color = clWindowText
        ParentShowHint = False
        ShowHint = True
        TabOrder = 54
        OnDragDrop = ColorPanelsDragDrop
        OnDragOver = ColorPanelsDragOver
        OnEndDrag = ColorPanelsEndDrag
        OnMouseDown = MarkTextColorPanelsMouseDown
      end
      object pnlMarkBckgr_18: TPanel
        Left = 419
        Top = 440
        Width = 22
        Height = 16
        Hint = 'Mark the Background Color'
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindow
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 55
        OnDragDrop = ColorPanelsDragDrop
        OnDragOver = ColorPanelsDragOver
        OnEndDrag = ColorPanelsEndDrag
        OnMouseDown = MarkBckgrColorPanelsMouseDown
      end
      object pnlMarkColor_19: TPanel
        Left = 395
        Top = 456
        Width = 22
        Height = 16
        Hint = 'Mark the Text Color'
        Color = clWindowText
        ParentShowHint = False
        ShowHint = True
        TabOrder = 56
        OnDragDrop = ColorPanelsDragDrop
        OnDragOver = ColorPanelsDragOver
        OnEndDrag = ColorPanelsEndDrag
        OnMouseDown = MarkTextColorPanelsMouseDown
      end
      object pnlMarkBckgr_19: TPanel
        Left = 419
        Top = 456
        Width = 22
        Height = 16
        Hint = 'Mark the Background Color'
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindow
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 57
        OnDragDrop = ColorPanelsDragDrop
        OnDragOver = ColorPanelsDragOver
        OnEndDrag = ColorPanelsEndDrag
        OnMouseDown = MarkBckgrColorPanelsMouseDown
      end
      object pnlMarkColor_0: TPanel
        Left = 395
        Top = 8
        Width = 22
        Height = 16
        Hint = 'Mark the text color'
        Color = clWindowText
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 60
        OnDragDrop = ColorPanelsDragDrop
        OnDragOver = ColorPanelsDragOver
        OnEndDrag = ColorPanelsEndDrag
        OnMouseDown = MarkTextColorPanelsMouseDown
      end
      object pnlMarkBckgr_0: TPanel
        Left = 419
        Top = 8
        Width = 22
        Height = 16
        Hint = 'Mark the background color'
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = 15592959
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 61
        OnDragDrop = ColorPanelsDragDrop
        OnDragOver = ColorPanelsDragOver
        OnEndDrag = ColorPanelsEndDrag
        OnMouseDown = MarkBckgrColorPanelsMouseDown
      end
      object btnSetDefaultStyles: TButton
        Left = 246
        Top = 530
        Width = 195
        Height = 25
        Caption = 'Set Default Styles'
        TabOrder = 62
        OnClick = btnSetDefaultStylesClick
      end
      object pnlMarkColor_20: TPanel
        Left = 395
        Top = 472
        Width = 22
        Height = 16
        Hint = 'Mark the Text Color'
        Color = clWindowText
        ParentShowHint = False
        ShowHint = True
        TabOrder = 64
        OnDragDrop = ColorPanelsDragDrop
        OnDragOver = ColorPanelsDragOver
        OnEndDrag = ColorPanelsEndDrag
        OnMouseDown = MarkTextColorPanelsMouseDown
      end
      object pnlMarkBckgr_20: TPanel
        Left = 419
        Top = 472
        Width = 22
        Height = 16
        Hint = 'Mark the Background Color'
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindow
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 65
        OnDragDrop = ColorPanelsDragDrop
        OnDragOver = ColorPanelsDragOver
        OnEndDrag = ColorPanelsEndDrag
        OnMouseDown = MarkBckgrColorPanelsMouseDown
      end
      object pnlMarkColor_21: TPanel
        Left = 395
        Top = 376
        Width = 22
        Height = 17
        Hint = 'Mark the Text Color'
        Color = clWindowText
        ParentShowHint = False
        ShowHint = True
        TabOrder = 68
        OnDragDrop = ColorPanelsDragDrop
        OnDragOver = ColorPanelsDragOver
        OnEndDrag = ColorPanelsEndDrag
        OnMouseDown = MarkTextColorPanelsMouseDown
      end
      object pnlMarkBckgr_21: TPanel
        Left = 419
        Top = 376
        Width = 22
        Height = 16
        Hint = 'Mark the Background Color'
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindow
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 69
        OnDragDrop = ColorPanelsDragDrop
        OnDragOver = ColorPanelsDragOver
        OnEndDrag = ColorPanelsEndDrag
        OnMouseDown = MarkBckgrColorPanelsMouseDown
      end
      object chkMarkDisableStandard: TCheckBox
        Left = 8
        Top = 536
        Width = 238
        Height = 17
        Caption = 'Disable standard error marking'
        TabOrder = 58
        Visible = False
      end
      object chkMarkEnable_0: TCheckBox
        Left = 8
        Top = 8
        Width = 238
        Height = 17
        Caption = 'Default errorr marking'
        TabOrder = 59
      end
      object chkMarkEnable_1: TCheckBox
        Left = 8
        Top = 40
        Width = 238
        Height = 17
        Caption = 'Lines without letters'
        TabOrder = 1
      end
      object chkMarkEnable_2: TCheckBox
        Left = 8
        Top = 56
        Width = 238
        Height = 17
        Caption = 'Empty subtitles'
        TabOrder = 19
      end
      object chkMarkEnable_3: TCheckBox
        Left = 8
        Top = 88
        Width = 238
        Height = 17
        Caption = 'Overlapping subtitles'
        TabOrder = 18
      end
      object chkMarkEnable_4: TCheckBox
        Left = 8
        Top = 104
        Width = 238
        Height = 17
        Caption = 'Bad values'
        TabOrder = 17
      end
      object chkMarkEnable_5: TCheckBox
        Left = 8
        Top = 144
        Width = 238
        Height = 17
        Caption = 'Too long durations'
        TabOrder = 4
      end
      object chkMarkEnable_6: TCheckBox
        Left = 8
        Top = 160
        Width = 238
        Height = 17
        Caption = 'Too short durations'
        TabOrder = 3
      end
      object chkMarkEnable_7: TCheckBox
        Left = 8
        Top = 176
        Width = 238
        Height = 17
        Caption = 'Too long lines'
        TabOrder = 2
      end
      object chkMarkEnable_8: TCheckBox
        Left = 8
        Top = 192
        Width = 238
        Height = 17
        Caption = 'Subtitles over two lines'
        TabOrder = 12
      end
      object chkMarkEnable_9: TCheckBox
        Left = 8
        Top = 224
        Width = 238
        Height = 17
        Caption = 'Hearing impaired subtitles'
        TabOrder = 16
      end
      object chkMarkEnable_10: TCheckBox
        Left = 8
        Top = 240
        Width = 238
        Height = 17
        Caption = 'Text before colon (":")'
        TabOrder = 15
        OnClick = chkCheckTextBeforeColonClick
      end
      object chkMarkOnlyIfCapitalLetters: TCheckBox
        Left = 24
        Top = 256
        Width = 222
        Height = 17
        BiDiMode = bdLeftToRight
        Caption = 'Only if text is in capital letters'
        Enabled = False
        ParentBiDiMode = False
        TabOrder = 14
      end
      object chkMarkEnable_11: TCheckBox
        Left = 8
        Top = 272
        Width = 238
        Height = 17
        Caption = 'Unnecessary dots'
        TabOrder = 13
      end
      object chkMarkEnable_12: TCheckBox
        Left = 8
        Top = 288
        Width = 238
        Height = 17
        Caption = 'Prohibited characters'
        TabOrder = 11
      end
      object chkMarkEnable_13: TCheckBox
        Left = 8
        Top = 304
        Width = 238
        Height = 17
        Caption = 'Repeated characters'
        TabOrder = 10
      end
      object chkMarkEnable_14: TCheckBox
        Left = 8
        Top = 320
        Width = 238
        Height = 17
        Caption = 'Repeated subtitles'
        TabOrder = 8
      end
      object chkMarkEnable_15: TCheckBox
        Left = 8
        Top = 336
        Width = 238
        Height = 17
        Caption = 'OCR Errors'
        TabOrder = 9
      end
      object chkMarkEnable_16: TCheckBox
        Left = 8
        Top = 360
        Width = 238
        Height = 17
        Caption = '"- " in subtitles with one line'
        TabOrder = 0
      end
      object chkMarkEnable_21: TCheckBox
        Left = 8
        Top = 376
        Width = 238
        Height = 17
        Caption = '"- " on first line'
        TabOrder = 66
      end
      object chkMarkOnlyIfNoDashOnSecondLine: TCheckBox
        Left = 24
        Top = 392
        Width = 222
        Height = 17
        BiDiMode = bdLeftToRight
        Caption = 'Only if there is no "- " on second line'
        Enabled = False
        ParentBiDiMode = False
        TabOrder = 67
      end
      object chkMarkEnable_22: TCheckBox
        Left = 8
        Top = 496
        Width = 238
        Height = 17
        Caption = 'Too many characters per second'
        TabOrder = 70
      end
      object pnlMarkColor_22: TPanel
        Left = 395
        Top = 496
        Width = 22
        Height = 16
        Hint = 'Mark the Text Color'
        Color = clWindowText
        ParentShowHint = False
        ShowHint = True
        TabOrder = 71
        OnDragDrop = ColorPanelsDragDrop
        OnDragOver = ColorPanelsDragOver
        OnEndDrag = ColorPanelsEndDrag
        OnMouseDown = MarkTextColorPanelsMouseDown
      end
      object pnlMarkBckgr_22: TPanel
        Left = 419
        Top = 496
        Width = 22
        Height = 16
        Hint = 'Mark the Background Color'
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindow
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 72
        OnDragDrop = ColorPanelsDragDrop
        OnDragOver = ColorPanelsDragOver
        OnEndDrag = ColorPanelsEndDrag
        OnMouseDown = MarkBckgrColorPanelsMouseDown
      end
      object chkMarkCPSHintBox: TCheckBox
        Left = 24
        Top = 512
        Width = 385
        Height = 17
        Caption = 'Mark too much CPS with CPS boxes'
        TabOrder = 73
      end
      object chkMarkEnable_23: TCheckBox
        Left = 8
        Top = 120
        Width = 238
        Height = 17
        Caption = 'Too short pauses'
        TabOrder = 74
      end
      object pnlMarkColor_23: TPanel
        Left = 395
        Top = 120
        Width = 22
        Height = 16
        Hint = 'Mark the Text Color'
        Color = clWindowText
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 75
        OnDragDrop = ColorPanelsDragDrop
        OnDragOver = ColorPanelsDragOver
        OnEndDrag = ColorPanelsEndDrag
        OnMouseDown = MarkTextColorPanelsMouseDown
      end
      object pnlMarkBckgr_23: TPanel
        Left = 419
        Top = 120
        Width = 22
        Height = 16
        Hint = 'Mark the Background Color'
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = 15124908
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 76
        OnDragDrop = ColorPanelsDragDrop
        OnDragOver = ColorPanelsDragOver
        OnEndDrag = ColorPanelsEndDrag
        OnMouseDown = MarkBckgrColorPanelsMouseDown
      end
      object chkMarkEnable_24: TCheckBox
        Left = 8
        Top = 408
        Width = 238
        Height = 17
        Caption = 'Dialogue on one line'
        TabOrder = 77
      end
      object pnlMarkColor_24: TPanel
        Left = 395
        Top = 408
        Width = 22
        Height = 16
        Hint = 'Mark the Text Color'
        Color = clWindowText
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 78
        OnDragDrop = ColorPanelsDragDrop
        OnDragOver = ColorPanelsDragOver
        OnEndDrag = ColorPanelsEndDrag
        OnMouseDown = MarkTextColorPanelsMouseDown
      end
      object pnlMarkBckgr_24: TPanel
        Left = 419
        Top = 408
        Width = 22
        Height = 16
        Hint = 'Mark the Background Color'
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindow
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 79
        OnDragDrop = ColorPanelsDragDrop
        OnDragOver = ColorPanelsDragOver
        OnEndDrag = ColorPanelsEndDrag
        OnMouseDown = MarkBckgrColorPanelsMouseDown
      end
      object chkMarkEnable_17: TCheckBox
        Left = 8
        Top = 424
        Width = 238
        Height = 17
        Caption = 'Missing spaces after custom characters'
        TabOrder = 6
      end
      object chkMarkEnable_18: TCheckBox
        Left = 8
        Top = 440
        Width = 238
        Height = 17
        Caption = 'Missing spaces before custom characters'
        TabOrder = 5
      end
      object chkMarkEnable_19: TCheckBox
        Left = 8
        Top = 456
        Width = 238
        Height = 17
        Caption = 'Unnecessary spaces'
        TabOrder = 7
      end
      object chkMarkEnable_20: TCheckBox
        Left = 8
        Top = 472
        Width = 238
        Height = 17
        Caption = 'Unnecessary tags'
        TabOrder = 63
      end
    end
    object pgeFix: TTabSheet
      Caption = 'Fix'
      ImageIndex = 1
      object bvlSep4: TBevel
        Left = 8
        Top = 80
        Width = 433
        Height = 9
        Shape = bsTopLine
      end
      object bvlSep5: TBevel
        Left = 8
        Top = 216
        Width = 433
        Height = 9
        Shape = bsTopLine
      end
      object chkFixOverlapping: TCheckBox
        Left = 8
        Top = 88
        Width = 433
        Height = 17
        Caption = 'Overlapping subtitles'
        TabOrder = 1
      end
      object chkFixBadValues: TCheckBox
        Left = 8
        Top = 104
        Width = 433
        Height = 17
        Caption = 'Bad values'
        TabOrder = 2
      end
      object chkFixHearingImpaired: TCheckBox
        Left = 8
        Top = 224
        Width = 433
        Height = 17
        Caption = 'Hearing impaired subtitles'
        TabOrder = 3
      end
      object chkFixTextBeforeColon: TCheckBox
        Left = 8
        Top = 240
        Width = 433
        Height = 17
        Caption = 'Text before colon (":")'
        TabOrder = 4
        OnClick = chkFixTextBeforeColonClick
      end
      object chkFixOnlyIfCapitalLetters: TCheckBox
        Left = 24
        Top = 256
        Width = 417
        Height = 17
        Caption = 'Only if text is in capital letters'
        TabOrder = 5
      end
      object chkFixUnnecessaryDots: TCheckBox
        Left = 8
        Top = 272
        Width = 433
        Height = 17
        Caption = 'Unnecessary dots'
        TabOrder = 6
      end
      object chkFixProhibitedChars: TCheckBox
        Left = 8
        Top = 288
        Width = 433
        Height = 17
        Caption = 'Prohibited characters'
        TabOrder = 8
      end
      object chkFixRepeatedChars: TCheckBox
        Left = 8
        Top = 304
        Width = 433
        Height = 17
        Caption = 'Repeated characters'
        TabOrder = 9
      end
      object chkFixRepeatedSubs: TCheckBox
        Left = 8
        Top = 320
        Width = 433
        Height = 17
        Caption = 'Repeated subtitles'
        TabOrder = 10
      end
      object chkFixOCRErrors: TCheckBox
        Left = 8
        Top = 336
        Width = 433
        Height = 17
        Caption = 'OCR Errors'
        TabOrder = 11
      end
      object chkFixLinesWithoutLetters: TCheckBox
        Left = 8
        Top = 40
        Width = 433
        Height = 17
        Caption = 'Lines without letters'
        TabOrder = 15
      end
      object chkFixOpnDlgInSubsWithOneLine: TCheckBox
        Left = 8
        Top = 360
        Width = 433
        Height = 17
        Caption = '"- " in subtitles with one line'
        TabOrder = 16
      end
      object chkFixDashOnFirstLine: TCheckBox
        Left = 8
        Top = 376
        Width = 433
        Height = 17
        Caption = '"- " on first line'
        TabOrder = 18
      end
      object chkFixOnlyIfNoDashOnSecondLine: TCheckBox
        Left = 24
        Top = 392
        Width = 417
        Height = 17
        Caption = 'Only if there is no "- " on second line'
        TabOrder = 19
      end
      object chkFixTooLongDur: TCheckBox
        Left = 8
        Top = 144
        Width = 433
        Height = 17
        Caption = 'Too long durations'
        Enabled = False
        TabOrder = 20
      end
      object chkFixTooShortDur: TCheckBox
        Left = 8
        Top = 160
        Width = 433
        Height = 17
        Caption = 'Too short durations'
        Enabled = False
        TabOrder = 21
      end
      object chkFixTooLongLines: TCheckBox
        Left = 8
        Top = 176
        Width = 433
        Height = 17
        Caption = 'Too long lines'
        Enabled = False
        TabOrder = 22
      end
      object chkFixTooMuchCPS: TCheckBox
        Left = 8
        Top = 496
        Width = 433
        Height = 17
        Caption = 'Too many characters per second'
        Enabled = False
        TabOrder = 23
      end
      object chkFixTooShortPause: TCheckBox
        Left = 8
        Top = 120
        Width = 433
        Height = 17
        Caption = 'Too short pauses'
        Enabled = False
        TabOrder = 24
      end
      object chkFixDialogueOnOneLine: TCheckBox
        Left = 8
        Top = 408
        Width = 433
        Height = 17
        Caption = 'Dialogue on one line'
        TabOrder = 25
      end
      object chkFixEmptySubtitles: TCheckBox
        Left = 8
        Top = 56
        Width = 433
        Height = 17
        Caption = 'Empty subtitles'
        TabOrder = 0
      end
      object chkFixOverTwoLines: TCheckBox
        Left = 8
        Top = 192
        Width = 433
        Height = 17
        Caption = 'Subtitles over two lines'
        TabOrder = 7
      end
      object chkFixSpaceAfterCustomChars: TCheckBox
        Left = 8
        Top = 424
        Width = 433
        Height = 17
        Caption = 'Missing spaces after custom characters'
        TabOrder = 13
      end
      object chkFixSpaceBeforeCustomChars: TCheckBox
        Left = 8
        Top = 440
        Width = 433
        Height = 17
        Caption = 'Missing spaces before custom characters'
        TabOrder = 14
      end
      object chkFixUnnecessarySpaces: TCheckBox
        Left = 8
        Top = 456
        Width = 433
        Height = 17
        Caption = 'Unnecessary spaces'
        TabOrder = 12
      end
      object chkFixUnnecessaryTags: TCheckBox
        Left = 8
        Top = 472
        Width = 433
        Height = 17
        Caption = 'Unnecessary tags'
        TabOrder = 17
      end
    end
    object pgeUnnecessarySpaces: TTabSheet
      Caption = 'Unnecessary spaces'
      ImageIndex = 2
      object lblCheckFor: TLabel
        Left = 8
        Top = 8
        Width = 50
        Height = 13
        Caption = 'Check for:'
      end
      object lblFix: TLabel
        Left = 8
        Top = 160
        Width = 18
        Height = 13
        Caption = 'Fix:'
      end
      object lstSpacesToCheck: TCheckListBox
        Left = 8
        Top = 24
        Width = 433
        Height = 113
        ItemHeight = 13
        Items.Strings = (
          'Enters and spaces at the beginning and end'
          'Spaces between enters (left and right)'
          'Double spaces and enters'
          'Spaces in front of punctuation marks'
          'Spaces after "?" and "?"'
          'Spaces before "?" and "!"'
          'Spaces between numbers')
        TabOrder = 0
      end
      object lstSpacesToFix: TCheckListBox
        Left = 8
        Top = 176
        Width = 433
        Height = 110
        ItemHeight = 13
        Items.Strings = (
          'Enters and spaces at the beginning and end'
          'Spaces between enters (left and right)'
          'Double spaces and enters'
          'Spaces in front of punctuation marks'
          'Spaces after "?" and "?"'
          'Spaces before "?" and "!"'
          'Spaces between numbers')
        TabOrder = 1
      end
    end
  end
  object btnOk: TButton
    Left = 296
    Top = 608
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
    TabOrder = 1
    OnClick = btnOkClick
  end
  object btnCancel: TButton
    Left = 384
    Top = 608
    Width = 81
    Height = 25
    Cancel = True
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 2
  end
  object dlgSetColor: TColorDialog
    Options = [cdFullOpen]
    Left = 40
    Top = 608
  end
  object dlgLoad: TOpenDialog
    Filter = 'OCR (*.ocr)|*.ocr'
    Left = 8
    Top = 608
  end
end
