object HWS_Form_PerguntasRestricao: THWS_Form_PerguntasRestricao
  Left = 0
  Top = 0
  Caption = 'Perguntas de Restri'#231#227'o'
  ClientHeight = 556
  ClientWidth = 784
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
  object GroupBox3: TGroupBox
    Left = 0
    Top = 0
    Width = 784
    Height = 51
    Align = alTop
    Caption = 'CheckLists:'
    TabOrder = 0
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
  object GroupBox1: TGroupBox
    Left = 0
    Top = 51
    Width = 784
    Height = 445
    Align = alClient
    Caption = 'Grupos de Perguntas:'
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 2
      Top = 20
      Width = 780
      Height = 423
      Align = alClient
      DataSource = HWS_ClientModule.HWS_DataSource_AJ01
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -15
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnKeyDown = DBGrid1KeyDown
      Columns = <
        item
          Expanded = False
          FieldName = 'AJ_CODGRP'
          Title.Caption = 'C'#243'digo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AB_DESC'
          Title.Caption = 'Descri'#231#227'o do Grupo'
          Width = 227
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AJ_CODRES'
          Title.Caption = 'C'#243'digo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AF_RESPOSTA'
          Title.Caption = 'Descri'#231#227'o da Resposta'
          Width = 268
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AJ_QTDRESTR'
          Title.Caption = 'Qtd desta Resposta'
          Width = 139
          Visible = True
        end>
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 537
    Width = 784
    Height = 19
    Panels = <>
    SimplePanel = True
    SizeGrip = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 496
    Width = 784
    Height = 41
    Align = alBottom
    TabOrder = 3
    DesignSize = (
      784
      41)
    object HWS_BitBtn_Incluir: TBitBtn
      Left = 1
      Top = -1
      Width = 119
      Height = 40
      Anchors = [akLeft]
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
    object HWS_BitBtn_Excluir: TBitBtn
      Left = 121
      Top = -1
      Width = 119
      Height = 40
      Anchors = [akLeft]
      Caption = 'Excluir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = HWS_BitBtn_ExcluirClick
    end
    object BitBtn4: TBitBtn
      Left = 663
      Top = -1
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
      TabOrder = 2
      OnClick = BitBtn4Click
    end
  end
end
