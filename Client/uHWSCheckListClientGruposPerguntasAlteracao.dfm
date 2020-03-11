object HWS_Form_GrupoPergumtasAlteracao: THWS_Form_GrupoPergumtasAlteracao
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Altera'#231#227'o de Grupo de Perguntas'
  ClientHeight = 159
  ClientWidth = 674
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 18
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 674
    Height = 97
    Align = alTop
    Caption = 'Altera'#231#227'o de Grupo de Perguntas'
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 24
      Width = 48
      Height = 18
      Caption = 'C'#243'digo:'
    end
    object Label2: TLabel
      Left = 8
      Top = 53
      Width = 67
      Height = 18
      Caption = 'Descri'#231#227'o:'
    end
    object HWS_Edit_Codigo: TEdit
      Tag = 10
      Left = 79
      Top = 21
      Width = 83
      Height = 26
      Enabled = False
      TabOrder = 0
      TextHint = 'Informe o C'#243'digo do Grupo de Perguntas'
    end
    object HWS_Edit_Descricao: TEdit
      Tag = 10
      Left = 79
      Top = 50
      Width = 588
      Height = 26
      TabOrder = 1
      TextHint = 'Informe a Descri'#231#227'o do Grupo de Perguntas'
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 140
    Width = 674
    Height = 19
    Panels = <>
    SimplePanel = True
    SizeGrip = False
  end
  object BitBtn2: TBitBtn
    Left = 432
    Top = 98
    Width = 120
    Height = 40
    Caption = 'Gravar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = BitBtn2Click
  end
  object BitBtn1: TBitBtn
    Left = 553
    Top = 98
    Width = 120
    Height = 40
    Caption = 'Sair'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = BitBtn1Click
  end
end
