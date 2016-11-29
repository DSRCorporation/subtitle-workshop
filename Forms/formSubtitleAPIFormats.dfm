object frmSubtitleAPIFormats: TfrmSubtitleAPIFormats
  Left = 434
  Top = 353
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmSubtitleAPIFormats'
  ClientHeight = 561
  ClientWidth = 489
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    489
    561)
  PixelsPerInch = 96
  TextHeight = 13
  object btnOk: TButton
    Left = 224
    Top = 528
    Width = 81
    Height = 25
    Anchors = [akLeft, akBottom]
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
  end
  object lstFormats: TVirtualStringTree
    Left = 8
    Top = 8
    Width = 473
    Height = 513
    Anchors = [akLeft, akTop, akRight, akBottom]
    Header.AutoSizeIndex = 0
    Header.DefaultHeight = 17
    Header.Font.Charset = DEFAULT_CHARSET
    Header.Font.Color = clWindowText
    Header.Font.Height = -11
    Header.Font.Name = 'MS Sans Serif'
    Header.Font.Style = []
    Header.MainColumn = 1
    Header.Options = [hoAutoResize, hoRestrictDrag, hoShowSortGlyphs, hoAutoSpring]
    Header.SortColumn = 1
    Header.Style = hsPlates
    TabOrder = 1
    TreeOptions.PaintOptions = [toShowButtons, toShowDropmark, toShowHorzGridLines, toShowTreeLines, toShowVertGridLines, toThemeAware, toUseBlendedImages]
    TreeOptions.SelectionOptions = [toDisableDrawSelection, toExtendedFocus, toFullRowSelect, toSimpleDrawSelection]
    OnFreeNode = lstFormatsFreeNode
    OnGetText = lstFormatsGetText
    OnGetNodeDataSize = lstFormatsGetNodeDataSize
    OnInitNode = lstFormatsInitNode
    Columns = <
      item
        Alignment = taCenter
        Options = [coAllowClick, coDraggable, coEnabled, coParentBidiMode, coParentColor, coResizable, coShowDropMark, coVisible, coFixed, coAllowFocus]
        Position = 0
        Width = 52
        WideText = 'Num'
      end
      item
        Options = [coAllowClick, coDraggable, coEnabled, coParentBidiMode, coParentColor, coResizable, coShowDropMark, coVisible, coAutoSpring, coSmartResize, coAllowFocus]
        Position = 1
        Width = 317
        WideText = 'Format name'
      end
      item
        Options = [coAllowClick, coDraggable, coEnabled, coParentBidiMode, coParentColor, coResizable, coShowDropMark, coVisible, coFixed, coAllowFocus]
        Position = 2
        Width = 100
        WideText = 'Format extensions'
      end>
  end
end
