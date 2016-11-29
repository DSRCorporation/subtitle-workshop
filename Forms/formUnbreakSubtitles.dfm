object frmUnbreakSubtitles: TfrmUnbreakSubtitles
  Left = 367
  Top = 778
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Unbreak subtitles'
  ClientHeight = 225
  ClientWidth = 329
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object gbCharactersLimit: TGroupBox
    Left = 8
    Top = 8
    Width = 313
    Height = 97
    Caption = 'Characters limit'
    TabOrder = 0
    object lblCharacters: TLabel
      Left = 88
      Top = 64
      Width = 50
      Height = 13
      Caption = 'characters'
    end
    object rdoNoLimit: TRadioButton
      Left = 8
      Top = 24
      Width = 297
      Height = 17
      Caption = 'No limit'
      TabOrder = 0
    end
    object rdoLimit: TRadioButton
      Left = 8
      Top = 40
      Width = 297
      Height = 17
      Caption = 'Don'#39't unbreak if line length exceeds:'
      Checked = True
      TabOrder = 1
      TabStop = True
    end
    object edtCharacters: TEdit
      Left = 24
      Top = 60
      Width = 41
      Height = 21
      TabOrder = 2
      Text = '45'
    end
    object udCharacters: TUpDown
      Left = 65
      Top = 60
      Width = 16
      Height = 21
      Associate = edtCharacters
      Max = 200
      Position = 45
      TabOrder = 3
    end
  end
  object btnApply: TButton
    Left = 136
    Top = 192
    Width = 97
    Height = 25
    Caption = '&Apply'
    Default = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ModalResult = 1
    ParentFont = False
    TabOrder = 1
    OnClick = btnApplyClick
  end
  object btnCancel: TButton
    Left = 240
    Top = 192
    Width = 81
    Height = 25
    Cancel = True
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 2
  end
  object pnlUnbreakSubtitles: TPanel
    Left = 8
    Top = 136
    Width = 313
    Height = 49
    BevelOuter = bvLowered
    TabOrder = 3
    object rdoAllSubs: TRadioButton
      Left = 8
      Top = 8
      Width = 199
      Height = 17
      Caption = 'For all the subtitles'
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object rdoSelSubs: TRadioButton
      Left = 8
      Top = 24
      Width = 199
      Height = 17
      Caption = 'For the selected subtitles'
      TabOrder = 1
    end
  end
  object chkDashCheck: TCheckBox
    Left = 16
    Top = 112
    Width = 305
    Height = 17
    Caption = 'Don'#39't unbreak subtitles with "'#8212'" on second line'
    Checked = True
    State = cbChecked
    TabOrder = 4
  end
end
