object HWS_Form_Perguntas_Inclusao: THWS_Form_Perguntas_Inclusao
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Inclus'#227'o de Perguntas'
  ClientHeight = 363
  ClientWidth = 634
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 18
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 634
    Height = 301
    Align = alTop
    Caption = 'Inclus'#227'o de Perguntas:'
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
      Top = 52
      Width = 63
      Height = 18
      Caption = 'Pergunta:'
    end
    object HWS_Edit_Codigo: TEdit
      Tag = 10
      Left = 77
      Top = 21
      Width = 83
      Height = 26
      Enabled = False
      TabOrder = 0
      TextHint = 'Informe o C'#243'digo da Pergunta'
    end
    object HWS_Memo_Pergunta: TMemo
      Tag = 10
      Left = 77
      Top = 49
      Width = 552
      Height = 103
      MaxLength = 300
      TabOrder = 1
      WantReturns = False
    end
    object HWS_RadioGroup_Tipo: TRadioGroup
      Left = 77
      Top = 150
      Width = 552
      Height = 72
      Caption = 'Tipo:'
      ItemIndex = 0
      Items.Strings = (
        #218'nica Escolha'
        'M'#250'ltipla Escolha')
      TabOrder = 2
    end
    object HWS_RadioGroup_Status: TRadioGroup
      Left = 77
      Top = 222
      Width = 552
      Height = 72
      Caption = 'Status:'
      ItemIndex = 0
      Items.Strings = (
        'Ativa'
        'Desativada')
      TabOrder = 3
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 344
    Width = 634
    Height = 19
    Panels = <>
    SimplePanel = True
    SizeGrip = False
  end
  object BitBtn2: TBitBtn
    Left = 391
    Top = 303
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
    Left = 512
    Top = 303
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
