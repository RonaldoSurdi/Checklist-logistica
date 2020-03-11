object HWS_Form_PerguntasXRespostas: THWS_Form_PerguntasXRespostas
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Perguntas X Respostas'
  ClientHeight = 562
  ClientWidth = 784
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
  object Splitter1: TSplitter
    Left = 416
    Top = 51
    Width = 0
    Height = 447
    Align = alRight
    ExplicitLeft = 616
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 51
    Width = 416
    Height = 447
    Align = alClient
    Caption = 'Perguntas:'
    TabOrder = 0
    object HWS_ListBox_Perguntas: TListBox
      Left = 2
      Top = 20
      Width = 412
      Height = 425
      Align = alClient
      ItemHeight = 18
      TabOrder = 0
      OnClick = HWS_ListBox_PerguntasClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 416
    Top = 51
    Width = 368
    Height = 447
    Align = alRight
    Caption = 'Respostas:'
    TabOrder = 1
    object HWS_CheckListBox_Respostas: TCheckListBox
      Left = 2
      Top = 20
      Width = 364
      Height = 217
      OnClickCheck = HWS_CheckListBox_RespostasClickCheck
      Align = alClient
      ItemHeight = 18
      PopupMenu = HWS_PopupMenu_Respostas
      TabOrder = 0
      ExplicitLeft = 3
    end
    object GroupBox4: TGroupBox
      Left = 2
      Top = 237
      Width = 364
      Height = 208
      Align = alBottom
      Caption = 'Resposta que ter'#225' foto:'
      TabOrder = 1
      object HWS_CheckListBox_Foto: TCheckListBox
        Left = 2
        Top = 20
        Width = 360
        Height = 186
        OnClickCheck = HWS_CheckListBox_FotoClickCheck
        Align = alClient
        ItemHeight = 18
        TabOrder = 0
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 543
    Width = 784
    Height = 19
    Panels = <>
    SimplePanel = True
    SizeGrip = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 498
    Width = 784
    Height = 45
    Align = alBottom
    TabOrder = 3
    DesignSize = (
      784
      45)
    object HWS_BitBtn_Gravar: TBitBtn
      Left = 542
      Top = 3
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
      OnClick = HWS_BitBtn_GravarClick
    end
    object BitBtn1: TBitBtn
      Left = 663
      Top = 3
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
      TabOrder = 1
      OnClick = BitBtn1Click
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 0
    Width = 784
    Height = 51
    Align = alTop
    Caption = 'CheckLists:'
    TabOrder = 4
    DesignSize = (
      784
      51)
    object HWS_ComboBox_CheckList: TComboBox
      Left = 6
      Top = 20
      Width = 771
      Height = 26
      Style = csDropDownList
      Anchors = [akLeft, akRight]
      TabOrder = 0
      OnChange = HWS_ComboBox_CheckListChange
    end
  end
  object HWS_PopupMenu_Respostas: TPopupMenu
    Left = 528
    Top = 128
    object Definirarespostaselecionadaparatodasasperguntas1: TMenuItem
      Caption = 'Marcar a resposta selecionada para todas as perguntas'
      OnClick = Definirarespostaselecionadaparatodasasperguntas1Click
    end
    object Marcararespostaselecionadaparatodasasperguntas1: TMenuItem
      Caption = 'Desmarcar a resposta selecionada para todas as perguntas'
    end
  end
end
