object HWS_Form_PerguntasReprovacao: THWS_Form_PerguntasReprovacao
  Left = 0
  Top = 0
  Caption = 'Perguntas de Reprova'#231#227'o'
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
  object StatusBar1: TStatusBar
    Left = 0
    Top = 543
    Width = 784
    Height = 19
    Panels = <>
    SimplePanel = True
    SizeGrip = False
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 51
    Width = 784
    Height = 450
    Align = alClient
    Caption = 'Perguntas que reprovam o CheckList:'
    TabOrder = 2
    object DBGrid1: TDBGrid
      Left = 2
      Top = 20
      Width = 780
      Height = 428
      Align = alClient
      DataSource = HWS_ClientModule.HWS_DataSource_AI01
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
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
          FieldName = 'AI_CODPER'
          Title.Caption = 'C'#243'digo'
          Width = 61
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AD_PERGUNTA'
          Title.Caption = 'Pergunta'
          Width = 421
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AI_CODRES'
          Title.Caption = 'C'#243'digo'
          Width = 67
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AF_RESPOSTA'
          Title.Caption = 'Resposta'
          Width = 190
          Visible = True
        end>
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 501
    Width = 784
    Height = 42
    Align = alBottom
    TabOrder = 3
    DesignSize = (
      784
      42)
    object HWS_BitBtn_Incluir: TBitBtn
      Left = 2
      Top = 0
      Width = 119
      Height = 40
      Anchors = [akRight]
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
      Left = 122
      Top = 0
      Width = 119
      Height = 40
      Anchors = [akRight]
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
      Top = 0
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
