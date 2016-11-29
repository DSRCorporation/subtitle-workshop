object frmSymbolDlg: TfrmSymbolDlg
  Left = 310
  Top = 769
  BorderStyle = bsDialog
  Caption = 'Insert symbol'
  ClientHeight = 279
  ClientWidth = 563
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnDeactivate = FormDeactivate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl: TPageControl
    Left = 16
    Top = 8
    Width = 533
    Height = 217
    ActivePage = Tab_Symbols
    TabOrder = 0
    object Tab_Symbols: TTabSheet
      Caption = 'Symbols'
      object lbl_Font: TLabel
        Left = 8
        Top = -2
        Width = 24
        Height = 13
        Caption = '&Font:'
        Visible = False
      end
      object DrawGrid: TDrawGrid
        Left = 8
        Top = 12
        Width = 507
        Height = 163
        ColCount = 28
        Ctl3D = True
        DefaultColWidth = 17
        DefaultRowHeight = 19
        FixedCols = 0
        RowCount = 8
        FixedRows = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine]
        ParentCtl3D = False
        ParentFont = False
        ScrollBars = ssNone
        TabOrder = 0
        OnDblClick = DoubleClick
        OnDrawCell = DrawGridDrawCell
        OnKeyUp = DrawGridKeyUp
        OnMouseDown = DrawGridMouseDown
        OnSelectCell = DrawGridSelectCell
      end
    end
  end
  object btn_Insert: TButton
    Left = 392
    Top = 240
    Width = 75
    Height = 25
    Caption = '&Insert'
    Default = True
    TabOrder = 1
    OnClick = btn_InsertClick
  end
  object btn_Cancel: TButton
    Left = 474
    Top = 240
    Width = 75
    Height = 25
    Cancel = True
    Caption = '&Close'
    ModalResult = 2
    TabOrder = 2
    OnClick = btn_CancelClick
  end
  object Panel: TPanel
    Left = 48
    Top = 88
    Width = 65
    Height = 65
    BevelInner = bvLowered
    Caption = 'S'
    Color = clWhite
    Ctl3D = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -32
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 3
    Visible = False
    OnDblClick = DoubleClick
    OnMouseDown = PanelMouseDown
  end
  object tmrDoubleClick: TTimer
    Enabled = False
    Interval = 400
    OnTimer = tmrDoubleClickTimer
    Left = 16
    Top = 240
  end
end
