object frmVariousInfo: TfrmVariousInfo
  Left = 370
  Top = 558
  Width = 608
  Height = 336
  BorderIcons = [biSystemMenu]
  Caption = 'frmVariousInfo'
  Color = clBtnFace
  Constraints.MinHeight = 336
  Constraints.MinWidth = 513
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnResize = FormResize
  OnShow = FormShow
  DesignSize = (
    600
    302)
  PixelsPerInch = 96
  TextHeight = 13
  object pgeCtrl: TPageControl
    Left = 8
    Top = 8
    Width = 585
    Height = 255
    ActivePage = pgeInformation
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    object pgeInformation: TTabSheet
      Caption = 'pgeInformation'
      DesignSize = (
        577
        227)
      object lstInfo: TVirtualStringTree
        Left = 8
        Top = 8
        Width = 561
        Height = 209
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
        Header.Options = [hoAutoResize, hoColumnResize, hoDrag, hoRestrictDrag]
        Header.Style = hsPlates
        HintMode = hmHintAndDefault
        ParentShowHint = False
        ScrollBarOptions.ScrollBars = ssVertical
        ShowHint = False
        TabOrder = 0
        TreeOptions.AutoOptions = [toAutoDropExpand, toAutoScroll, toAutoTristateTracking, toAutoDeleteMovedNodes]
        TreeOptions.MiscOptions = [toAcceptOLEDrop, toFullRepaintOnResize, toInitOnSave, toReportMode, toToggleOnDblClick, toWheelPanning]
        TreeOptions.PaintOptions = [toShowButtons, toShowDropmark, toShowHorzGridLines, toShowTreeLines, toShowVertGridLines, toThemeAware, toUseBlendedImages]
        TreeOptions.SelectionOptions = [toFullRowSelect]
        OnDblClick = lstInfoDblClick
        OnFreeNode = lstInfoFreeNode
        OnGetText = lstInfoGetText
        OnPaintText = lstInfoPaintText
        OnGetNodeDataSize = lstInfoGetNodeDataSize
        OnInitNode = lstInfoInitNode
        Columns = <
          item
            Position = 0
            Width = 230
            WideText = 'Info'
          end
          item
            Position = 1
            Width = 327
            WideText = 'Description'
          end>
      end
    end
    object pgeExtras: TTabSheet
      Caption = 'pgeExtras'
      ImageIndex = 1
      object gbBestFontSize: TGroupBox
        Left = 8
        Top = 12
        Width = 249
        Height = 205
        Caption = 'Best font size for playback'
        TabOrder = 0
        object lblFontName: TLabel
          Left = 16
          Top = 72
          Width = 55
          Height = 13
          Caption = 'Font name:'
        end
        object edtWidth: TLabeledEdit
          Left = 16
          Top = 40
          Width = 89
          Height = 21
          EditLabel.Width = 83
          EditLabel.Height = 13
          EditLabel.Caption = 'Resolution width:'
          TabOrder = 0
          OnKeyPress = edtWidthKeyPress
        end
        object btnFromAVI: TButton
          Left = 112
          Top = 37
          Width = 129
          Height = 25
          Caption = 'From video'
          TabOrder = 1
          OnClick = btnFromAVIClick
        end
        object cmbFonts: TComboBox
          Left = 16
          Top = 88
          Width = 225
          Height = 21
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 2
        end
        object chkBold: TCheckBox
          Left = 16
          Top = 120
          Width = 225
          Height = 17
          Caption = 'Bold'
          TabOrder = 3
        end
        object chkItalic: TCheckBox
          Left = 16
          Top = 136
          Width = 225
          Height = 17
          Caption = 'Italic'
          TabOrder = 4
        end
        object btnCalculate: TButton
          Left = 64
          Top = 168
          Width = 121
          Height = 25
          Caption = 'Calculate'
          TabOrder = 5
          OnClick = btnCalculateClick
        end
      end
    end
  end
  object btnOk: TButton
    Left = 504
    Top = 270
    Width = 89
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = '&Ok'
    Default = True
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
  object btnRefreshInfo: TButton
    Left = 8
    Top = 270
    Width = 129
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Refresh info'
    TabOrder = 2
    OnClick = btnRefreshInfoClick
  end
  object dlgOpenAVI: TOpenDialog
    Filter = 'AVI Files (*.avi)|*.avi'
    Left = 144
    Top = 272
  end
end
