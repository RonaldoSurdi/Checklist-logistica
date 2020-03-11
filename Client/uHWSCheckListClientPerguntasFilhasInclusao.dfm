object HWS_Form_PerguntasFilhasInclusao: THWS_Form_PerguntasFilhasInclusao
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Inclus'#227'o de Perguntas Filhas'
  ClientHeight = 572
  ClientWidth = 794
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
    Width = 794
    Height = 83
    Align = alTop
    Caption = 'Caso a pegunta for:'
    TabOrder = 0
    object HWS_Memo_PerguntaPai: TMemo
      Left = 2
      Top = 20
      Width = 790
      Height = 61
      Align = alClient
      Enabled = False
      TabOrder = 0
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 132
    Width = 794
    Height = 380
    Align = alTop
    Caption = 'A(s) pergunta(s) filha(s) ser'#225'('#227'o):'
    TabOrder = 1
    object HWS_CheckListBox_PerguntasFilhas: TCheckListBox
      Left = 2
      Top = 20
      Width = 790
      Height = 358
      Align = alClient
      ItemHeight = 18
      TabOrder = 0
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 553
    Width = 794
    Height = 19
    Panels = <>
    SimplePanel = True
    SizeGrip = False
  end
  object BitBtn1: TBitBtn
    Left = 672
    Top = 512
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
  object BitBtn2: TBitBtn
    Left = 550
    Top = 512
    Width = 120
    Height = 40
    Caption = 'Gravar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = BitBtn2Click
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 83
    Width = 794
    Height = 49
    Align = alTop
    Caption = 'Caso a resposta selecionada da pergunta acima for:'
    TabOrder = 5
    object HWS_Label_RespostaPai: TLabel
      Left = 11
      Top = 22
      Width = 190
      Height = 18
      Caption = 'HWS_Label_RespostaPai'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
end
