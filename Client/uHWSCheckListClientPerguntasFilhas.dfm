object HWS_Form_PerguntasFilhas: THWS_Form_PerguntasFilhas
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Cadastro de Perguntas Filhas'
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
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 18
  object GroupBox1: TGroupBox
    Left = 0
    Top = 51
    Width = 794
    Height = 150
    Align = alTop
    Caption = 'Caso a Pergunta for:'
    TabOrder = 0
    object HWS_ListBox_PerguntasPai: TListBox
      Left = 2
      Top = 20
      Width = 790
      Height = 128
      Align = alClient
      ItemHeight = 18
      TabOrder = 0
      OnClick = HWS_ListBox_PerguntasPaiClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 313
    Width = 794
    Height = 200
    Align = alTop
    Caption = 'A(s) pergunta(s) filha(s) ser'#225'('#227'o)'
    TabOrder = 1
    object HWS_ListBox_PerguntasFilhas: TListBox
      Left = 2
      Top = 20
      Width = 790
      Height = 178
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
  object GroupBox3: TGroupBox
    Left = 0
    Top = 0
    Width = 794
    Height = 51
    Align = alTop
    Caption = 'CheckLists:'
    TabOrder = 4
    DesignSize = (
      794
      51)
    object HWS_ComboBox_CheckList: TComboBox
      Left = 6
      Top = 20
      Width = 781
      Height = 26
      Style = csDropDownList
      Anchors = [akLeft, akRight]
      TabOrder = 0
      OnChange = HWS_ComboBox_CheckListChange
    end
  end
  object HWS_BitBtn_Incluir: TBitBtn
    Left = 2
    Top = 512
    Width = 120
    Height = 40
    Caption = 'Incluir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = HWS_BitBtn_IncluirClick
  end
  object HWS_BitBtn_Excluir: TBitBtn
    Left = 122
    Top = 512
    Width = 120
    Height = 40
    Caption = 'Excluir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = HWS_BitBtn_ExcluirClick
  end
  object GroupBox4: TGroupBox
    Left = 0
    Top = 201
    Width = 794
    Height = 112
    Align = alTop
    Caption = 'Caso a resposta da pergunta for:'
    TabOrder = 7
    object HWS_ListBox_RespostasPai: TListBox
      Left = 2
      Top = 20
      Width = 790
      Height = 90
      Align = alClient
      ItemHeight = 18
      TabOrder = 0
      OnClick = HWS_ListBox_RespostasPaiClick
    end
  end
end
