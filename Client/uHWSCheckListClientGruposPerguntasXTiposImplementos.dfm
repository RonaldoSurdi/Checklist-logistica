object HWS_Form_GrupoPerguntasXTiposImplementos: THWS_Form_GrupoPerguntasXTiposImplementos
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Grupos de Perguntas X Tipos de Implementos'
  ClientHeight = 572
  ClientWidth = 799
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
    Width = 377
    Height = 458
    Align = alLeft
    Caption = 'Grupos de Perguntas:'
    TabOrder = 0
    object HWS_ListBox_GrupoPerguntas: TListBox
      Left = 2
      Top = 20
      Width = 373
      Height = 436
      Align = alClient
      ItemHeight = 18
      TabOrder = 0
      OnClick = HWS_ListBox_GrupoPerguntasClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 553
    Width = 799
    Height = 19
    Panels = <>
    SimplePanel = True
    SizeGrip = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 509
    Width = 799
    Height = 44
    Align = alBottom
    TabOrder = 2
    object HWS_BitBtn_Salvar: TBitBtn
      Left = 547
      Top = 1
      Width = 120
      Height = 40
      Caption = 'Gravar'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = HWS_BitBtn_SalvarClick
    end
    object BitBtn1: TBitBtn
      Left = 673
      Top = 1
      Width = 120
      Height = 40
      Caption = 'Sair'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = BitBtn1Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 377
    Top = 51
    Width = 422
    Height = 458
    Align = alClient
    Caption = 'Tipos de Implementos:'
    TabOrder = 3
    object HWS_CheckListBox_TiposImplementos: TCheckListBox
      Left = 2
      Top = 20
      Width = 418
      Height = 436
      OnClickCheck = HWS_CheckListBox_TiposImplementosClickCheck
      Align = alClient
      ItemHeight = 18
      TabOrder = 0
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 0
    Width = 799
    Height = 51
    Align = alTop
    Caption = 'CheckLists:'
    TabOrder = 4
    object HWS_ComboBox_CheckList: TComboBox
      Left = 6
      Top = 20
      Width = 787
      Height = 26
      Style = csDropDownList
      TabOrder = 0
      OnChange = HWS_ComboBox_CheckListChange
    end
  end
end
