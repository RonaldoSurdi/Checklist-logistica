object HWS_Form_PerguntasReprovacaoInclusao: THWS_Form_PerguntasReprovacaoInclusao
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Inclus'#227'o de Perguntas de Reprova'#231#227'o do CheckList'
  ClientHeight = 199
  ClientWidth = 794
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  DesignSize = (
    794
    199)
  PixelsPerInch = 96
  TextHeight = 18
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 794
    Height = 137
    Align = alTop
    Caption = 'Inclus'#227'o de Perguntas de Reprova'#231#227'o do CheckList:'
    TabOrder = 0
    object Label1: TLabel
      Left = 12
      Top = 24
      Width = 63
      Height = 18
      Caption = 'Pergunta:'
    end
    object Label2: TLabel
      Left = 12
      Top = 80
      Width = 65
      Height = 18
      Caption = 'Resposta:'
    end
    object HWS_Edit_CodigoPergunta: TEdit
      Tag = 10
      Left = 12
      Top = 48
      Width = 73
      Height = 26
      Ctl3D = True
      Enabled = False
      ParentCtl3D = False
      TabOrder = 0
      TextHint = 'Informe o c'#243'digo da pergunta'
    end
    object Button1: TButton
      Left = 86
      Top = 48
      Width = 28
      Height = 26
      Caption = '...'
      TabOrder = 1
      OnClick = Button1Click
    end
    object HWS_Edit_Descricao: TEdit
      Tag = 10
      Left = 117
      Top = 48
      Width = 674
      Height = 26
      Enabled = False
      TabOrder = 2
      TextHint = 'Informe a Pergunta'
    end
    object HWS_ComboBox_Resposta: TComboBox
      Tag = 10
      Left = 12
      Top = 101
      Width = 779
      Height = 26
      Style = csDropDownList
      TabOrder = 3
      TextHint = 'Informe a Resposta'
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 180
    Width = 794
    Height = 19
    Panels = <>
    SimplePanel = True
    SizeGrip = False
  end
  object BitBtn1: TBitBtn
    Left = 554
    Top = 138
    Width = 119
    Height = 40
    Anchors = [akRight]
    Caption = 'Gravar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 674
    Top = 138
    Width = 119
    Height = 40
    Anchors = [akRight]
    Caption = 'Sair'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = BitBtn2Click
  end
end
