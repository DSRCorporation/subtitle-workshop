object frmConvertCase: TfrmConvertCase
  Left = 339
  Top = 705
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmConvertCase'
  ClientHeight = 242
  ClientWidth = 289
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
  object btnApply: TButton
    Left = 96
    Top = 209
    Width = 96
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
    TabOrder = 0
    OnClick = btnApplyClick
  end
  object btnCancel: TButton
    Left = 200
    Top = 209
    Width = 80
    Height = 25
    Cancel = True
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 1
  end
  object pnlConvertCase: TPanel
    Left = 8
    Top = 8
    Width = 273
    Height = 137
    TabOrder = 2
    object rdoSentenceType: TRadioButton
      Left = 8
      Top = 8
      Width = 225
      Height = 17
      Caption = 'Sentence type.'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = rdoSentenceTypeClick
    end
    object chkOnlyFirstLetterOfFirstWord: TCheckBox
      Left = 24
      Top = 24
      Width = 209
      Height = 17
      Caption = 'Only first letter of first word'
      TabOrder = 6
    end
    object chkDotsDetection: TCheckBox
      Left = 24
      Top = 40
      Width = 209
      Height = 17
      Caption = '"..." detection'
      TabOrder = 5
    end
    object rdoLowerCase: TRadioButton
      Left = 8
      Top = 64
      Width = 225
      Height = 17
      Caption = 'lowercase'
      TabOrder = 1
      OnClick = rdoSentenceTypeClick
    end
    object rdoUpperCase: TRadioButton
      Left = 8
      Top = 80
      Width = 225
      Height = 17
      Caption = 'UPPERCASE'
      TabOrder = 2
      OnClick = rdoSentenceTypeClick
    end
    object rdoTitleType: TRadioButton
      Left = 8
      Top = 96
      Width = 225
      Height = 17
      Caption = 'Title Type'
      TabOrder = 3
      OnClick = rdoSentenceTypeClick
    end
    object rdoInverseType: TRadioButton
      Left = 8
      Top = 112
      Width = 225
      Height = 17
      Caption = 'iNVERSE tYPE'
      TabOrder = 4
      OnClick = rdoSentenceTypeClick
    end
  end
  object pnlWhere: TPanel
    Left = 8
    Top = 152
    Width = 273
    Height = 49
    TabOrder = 3
    object rdoAllSubs: TRadioButton
      Left = 8
      Top = 8
      Width = 225
      Height = 17
      Caption = 'All subtitles'
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object rdoSelectedSubs: TRadioButton
      Left = 8
      Top = 24
      Width = 225
      Height = 17
      Caption = 'Selected subtitles only'
      TabOrder = 1
    end
  end
end
