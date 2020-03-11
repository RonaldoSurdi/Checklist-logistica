object HWS_Form_GruposPerguntas: THWS_Form_GruposPerguntas
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Cadastro de Grupos de Perguntas'
  ClientHeight = 479
  ClientWidth = 667
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
    Width = 667
    Height = 368
    Align = alTop
    Caption = 'Grupos de Perguntas:'
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 2
      Top = 20
      Width = 663
      Height = 346
      Align = alClient
      DataSource = HWS_ClientModule.HWS_DataSource_AB01
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
          FieldName = 'AB_CODIGO'
          ReadOnly = True
          Title.Caption = 'C'#243'digo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AB_DESC'
          Title.Caption = 'Descri'#231#227'o'
          Width = 537
          Visible = True
        end>
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 460
    Width = 667
    Height = 19
    Panels = <>
    SimplePanel = True
    SizeGrip = False
  end
  object BitBtn2: TBitBtn
    Left = 546
    Top = 419
    Width = 120
    Height = 40
    Caption = 'Sair'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = BitBtn2Click
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 0
    Width = 667
    Height = 51
    Align = alTop
    Caption = 'CheckLists:'
    TabOrder = 3
    object HWS_ComboBox_CheckList: TComboBox
      Left = 6
      Top = 20
      Width = 656
      Height = 26
      Style = csDropDownList
      TabOrder = 0
      OnChange = HWS_ComboBox_CheckListChange
    end
  end
  object HWS_BitBtn_Excluir: TBitBtn
    Left = 245
    Top = 419
    Width = 120
    Height = 40
    Caption = 'Excluir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = HWS_BitBtn_ExcluirClick
  end
  object HWS_BitBtn_Incluir: TBitBtn
    Left = 2
    Top = 419
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
    Top = 419
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
