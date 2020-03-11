object HWS_Form_ConsultasGenericas: THWS_Form_ConsultasGenericas
  Left = 0
  Top = 0
  ActiveControl = HWS_Edit_Pesquisa
  BorderStyle = bsDialog
  Caption = 'HWS_Form_ConsultasGenericas'
  ClientHeight = 544
  ClientWidth = 688
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
    Width = 688
    Height = 81
    Align = alTop
    Caption = 'Consultar:'
    TabOrder = 0
    object Label1: TLabel
      Left = 10
      Top = 22
      Width = 44
      Height = 18
      Caption = #205'ndice:'
    end
    object Label2: TLabel
      Left = 10
      Top = 54
      Width = 66
      Height = 18
      Caption = 'Pesquisar:'
    end
    object HWS_ComboBox_Nome_Indice: TComboBox
      Left = 79
      Top = 19
      Width = 482
      Height = 26
      Style = csDropDownList
      TabOrder = 0
    end
    object HWS_Edit_Pesquisa: TEdit
      Left = 79
      Top = 48
      Width = 482
      Height = 26
      TabOrder = 1
      OnKeyPress = HWS_Edit_PesquisaKeyPress
    end
    object Button1: TButton
      Left = 567
      Top = 20
      Width = 98
      Height = 25
      Caption = 'OK'
      TabOrder = 2
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 567
      Top = 49
      Width = 98
      Height = 25
      Caption = 'Sair'
      TabOrder = 3
      OnClick = Button2Click
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 525
    Width = 688
    Height = 19
    Panels = <>
  end
  object HWS_DBGrid_Pesquisa: TDBGrid
    Left = 0
    Top = 81
    Width = 688
    Height = 444
    Align = alClient
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -15
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = HWS_DBGrid_PesquisaDblClick
    OnKeyPress = HWS_DBGrid_PesquisaKeyPress
  end
end
