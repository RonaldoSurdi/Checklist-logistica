object HWS_Form_GrupodePerguntasXPerguntas: THWS_Form_GrupodePerguntasXPerguntas
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Grupo de Perguntas X Perguntas'
  ClientHeight = 561
  ClientWidth = 857
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 18
  object GroupBox1: TGroupBox
    Left = 0
    Top = 38
    Width = 369
    Height = 461
    Align = alLeft
    Caption = 'Grupo de Perguntas:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object HWS_ListBox_GrupoPerguntas: TListBox
      Left = 2
      Top = 20
      Width = 365
      Height = 439
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemHeight = 18
      ParentFont = False
      TabOrder = 0
      OnClick = HWS_ListBox_GrupoPerguntasClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 542
    Width = 857
    Height = 19
    Panels = <>
    SimplePanel = True
    SizeGrip = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 499
    Width = 857
    Height = 43
    Align = alBottom
    TabOrder = 2
    DesignSize = (
      857
      43)
    object HWS_BitBtn_Salvar: TBitBtn
      Left = 614
      Top = 0
      Width = 120
      Height = 40
      Anchors = [akRight]
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
      Left = 734
      Top = 0
      Width = 120
      Height = 40
      Anchors = [akRight]
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
    Left = 369
    Top = 38
    Width = 488
    Height = 461
    Align = alClient
    Caption = 'Perguntas:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    object HWS_CheckListBox_Perguntas: TCheckListBox
      Left = 2
      Top = 20
      Width = 484
      Height = 439
      OnClickCheck = HWS_CheckListBox_PerguntasClickCheck
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemHeight = 18
      ParentFont = False
      TabOrder = 0
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 0
    Width = 857
    Height = 38
    Align = alTop
    TabOrder = 4
    DesignSize = (
      857
      38)
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 72
      Height = 18
      Caption = 'CheckLists:'
    end
    object HWS_ComboBox_CheckList: TComboBox
      Left = 86
      Top = 5
      Width = 764
      Height = 26
      Style = csDropDownList
      Anchors = [akLeft, akRight]
      TabOrder = 0
      OnChange = HWS_ComboBox_CheckListChange
    end
  end
end
