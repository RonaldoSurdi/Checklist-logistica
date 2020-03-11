object HWS_Form_TiposImplementos_Alteracao: THWS_Form_TiposImplementos_Alteracao
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Altera'#231#227'o dos Tipos de Implementos'
  ClientHeight = 179
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
    Height = 113
    Align = alTop
    Caption = 'Altera'#231#227'o de Tipos de Implementos'
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
    object Label3: TLabel
      Left = 8
      Top = 82
      Width = 78
      Height = 18
      Caption = 'C'#243'digo ERP:'
    end
    object HWS_Edit_Codigo: TEdit
      Tag = 10
      Left = 86
      Top = 21
      Width = 83
      Height = 26
      Enabled = False
      TabOrder = 0
      TextHint = 'Informe o C'#243'digo do Implemento'
    end
    object HWS_Edit_Descricao: TEdit
      Tag = 10
      Left = 86
      Top = 50
      Width = 583
      Height = 26
      TabOrder = 1
      TextHint = 'Informe a Descri'#231#227'o do Implemento'
    end
    object HWS_Edit_CodigoERP: TEdit
      Tag = 10
      Left = 86
      Top = 79
      Width = 83
      Height = 26
      Enabled = False
      TabOrder = 2
      TextHint = 'Informe o C'#243'digo ERP do Implemento'
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 160
    Width = 674
    Height = 19
    Panels = <>
    SimplePanel = True
    SizeGrip = False
    ExplicitTop = 139
  end
  object BitBtn2: TBitBtn
    Left = 432
    Top = 116
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
    Top = 116
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
