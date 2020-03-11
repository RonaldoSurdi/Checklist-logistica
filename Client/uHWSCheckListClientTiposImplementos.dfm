object HWS_Form_TiposImplementos: THWS_Form_TiposImplementos
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Cadastro de Tipos de Implementos'
  ClientHeight = 426
  ClientWidth = 641
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 18
  object GroupBox1: TGroupBox
    Left = 0
    Top = 51
    Width = 641
    Height = 314
    Align = alTop
    Caption = 'Cadastro de Tipos:'
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 2
      Top = 20
      Width = 637
      Height = 292
      Align = alClient
      DataSource = HWS_ClientModule.HWS_DataSource_AA01
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
          FieldName = 'AA_CODIGO'
          ReadOnly = True
          Title.Caption = 'C'#243'digo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AA_DESC'
          Title.Caption = 'Descri'#231#227'o'
          Width = 514
          Visible = True
        end>
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 407
    Width = 641
    Height = 19
    Panels = <>
    SimplePanel = True
    SizeGrip = False
  end
  object HWS_BitBtn_Excluir: TBitBtn
    Left = 246
    Top = 365
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
    Left = 519
    Top = 366
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
    Width = 641
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
    Top = 365
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
    Top = 365
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
