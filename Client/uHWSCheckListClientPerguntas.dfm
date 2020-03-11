object HWS_Form_Perguntas: THWS_Form_Perguntas
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Cadastro de Perguntas'
  ClientHeight = 559
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
  object GroupBox1: TGroupBox
    Left = 0
    Top = 38
    Width = 784
    Height = 461
    Align = alClient
    Caption = 'Cadastro de Perguntas:'
    TabOrder = 0
    object HWS_DBGrid_Perguntas: TDBGrid
      Left = 2
      Top = 20
      Width = 780
      Height = 439
      Align = alClient
      DataSource = HWS_ClientModule.HWS_DataSource_AD01
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -15
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnKeyDown = HWS_DBGrid_PerguntasKeyDown
      Columns = <
        item
          Expanded = False
          FieldName = 'AD_CODIGO'
          Title.Caption = 'C'#243'digo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AD_PERGUNTA'
          Title.Caption = 'Pergunta'
          Width = 1300
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AD_TIPO'
          Title.Caption = 'Tipo da Pergunta'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AD_STATUS'
          Title.Caption = 'Status'
          Width = 106
          Visible = True
        end>
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 540
    Width = 784
    Height = 19
    Panels = <>
    SimplePanel = True
    SizeGrip = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 499
    Width = 784
    Height = 41
    Align = alBottom
    TabOrder = 2
    DesignSize = (
      784
      41)
    object HWS_BitBtn_Incluir: TBitBtn
      Left = 1
      Top = 0
      Width = 120
      Height = 40
      Caption = 'Incluir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = HWS_BitBtn_IncluirClick
    end
    object HWS_BitBtn_Alterar: TBitBtn
      Left = 123
      Top = 0
      Width = 120
      Height = 40
      Caption = 'Alterar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = HWS_BitBtn_AlterarClick
    end
    object HWS_BitBtn_Excluir: TBitBtn
      Left = 245
      Top = 0
      Width = 120
      Height = 40
      Caption = 'Excluir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = HWS_BitBtn_ExcluirClick
    end
    object BitBtn3: TBitBtn
      Left = 662
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
      TabOrder = 3
      OnClick = BitBtn3Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 0
    Width = 784
    Height = 38
    Align = alTop
    TabOrder = 3
    DesignSize = (
      784
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
      Width = 692
      Height = 26
      Style = csDropDownList
      Anchors = [akLeft, akRight]
      TabOrder = 0
      OnChange = HWS_ComboBox_CheckListChange
    end
  end
end
