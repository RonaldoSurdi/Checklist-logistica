object HWS_Form_Respostas: THWS_Form_Respostas
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Cadastro de Respostas'
  ClientHeight = 418
  ClientWidth = 642
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
    Width = 642
    Height = 307
    Align = alTop
    Caption = 'Cadastro de Respostas:'
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 2
      Top = 20
      Width = 638
      Height = 285
      Align = alClient
      DataSource = HWS_ClientModule.HWS_DataSource_AF01
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
          FieldName = 'AF_CODIGO'
          Title.Caption = 'C'#243'digo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AF_RESPOSTA'
          Title.Caption = 'Resposta'
          Width = 519
          Visible = True
        end>
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 399
    Width = 642
    Height = 19
    Panels = <>
    SimplePanel = True
    SizeGrip = False
  end
  object HWS_BitBtn_Excluir: TBitBtn
    Left = 246
    Top = 358
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
  object BitBtn2: TBitBtn
    Left = 520
    Top = 358
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
    OnClick = BitBtn2Click
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 0
    Width = 642
    Height = 51
    Align = alTop
    Caption = 'CheckLists:'
    TabOrder = 4
    object HWS_ComboBox_CheckList: TComboBox
      Left = 6
      Top = 20
      Width = 630
      Height = 26
      Style = csDropDownList
      TabOrder = 0
      OnChange = HWS_ComboBox_CheckListChange
    end
  end
  object HWS_BitBtn_Incluir: TBitBtn
    Left = 2
    Top = 358
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
  object HWS_BitBtn_Alterar: TBitBtn
    Left = 124
    Top = 358
    Width = 120
    Height = 40
    Caption = 'Alterar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = HWS_BitBtn_AlterarClick
  end
end
