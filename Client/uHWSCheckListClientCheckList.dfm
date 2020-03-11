object HWS_Form_CheckList: THWS_Form_CheckList
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Cadastro de CheckLists'
  ClientHeight = 497
  ClientWidth = 805
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
  object Label7: TLabel
    Left = 173
    Top = 414
    Width = 111
    Height = 18
    Caption = 'CheckLists Ativos'
  end
  object Label1: TLabel
    Left = 496
    Top = 415
    Width = 148
    Height = 18
    Caption = 'CheckLists em Revis'#227'o'
  end
  object Label2: TLabel
    Left = 316
    Top = 415
    Width = 147
    Height = 18
    Caption = 'CheckLists j'#225' Revisado'
  end
  object Label3: TLabel
    Left = 29
    Top = 415
    Width = 113
    Height = 18
    Caption = 'CheckLists Novos'
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 805
    Height = 413
    Align = alTop
    Caption = 'Cadastro de CheckLists'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object HWS_DBGrid_CheckLists: TDBGrid
      Left = 2
      Top = 20
      Width = 801
      Height = 391
      Align = alClient
      DataSource = HWS_ClientModule.HWS_DataSource_A901
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -15
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = HWS_DBGrid_CheckListsDrawColumnCell
      OnKeyDown = HWS_DBGrid_CheckListsKeyDown
      Columns = <
        item
          Expanded = False
          FieldName = 'A9_STATUS'
          Width = 21
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'A9_CODIGO'
          Title.Caption = 'C'#243'digo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'A9_DESC'
          Title.Caption = 'Descri'#231#227'o'
          Width = 539
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'A9_CODREV'
          Title.Caption = 'CheckList Origem'
          Width = 132
          Visible = True
        end>
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 478
    Width = 805
    Height = 19
    Panels = <>
    SimplePanel = True
    SizeGrip = False
  end
  object BitBtn2: TBitBtn
    Left = 4
    Top = 435
    Width = 120
    Height = 40
    Caption = 'Incluir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = BitBtn2Click
  end
  object BitBtn1: TBitBtn
    Left = 125
    Top = 435
    Width = 120
    Height = 40
    Caption = 'Alterar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = BitBtn1Click
  end
  object BitBtn3: TBitBtn
    Left = 247
    Top = 435
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
    OnClick = BitBtn3Click
  end
  object BitBtn4: TBitBtn
    Left = 368
    Top = 435
    Width = 120
    Height = 40
    Caption = 'Revisar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = BitBtn4Click
  end
  object BitBtn5: TBitBtn
    Left = 682
    Top = 435
    Width = 120
    Height = 40
    Caption = 'Sair'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = BitBtn5Click
  end
  object BitBtn6: TBitBtn
    Left = 489
    Top = 435
    Width = 120
    Height = 40
    Caption = 'Efetivar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnClick = BitBtn6Click
  end
  object Panel5: TPanel
    Left = 151
    Top = 415
    Width = 19
    Height = 16
    Color = clGreen
    ParentBackground = False
    TabOrder = 8
  end
  object Panel1: TPanel
    Left = 474
    Top = 416
    Width = 19
    Height = 16
    Color = clRed
    ParentBackground = False
    TabOrder = 9
  end
  object Panel2: TPanel
    Left = 294
    Top = 416
    Width = 19
    Height = 16
    Color = clGray
    ParentBackground = False
    TabOrder = 10
  end
  object Panel3: TPanel
    Left = 7
    Top = 416
    Width = 19
    Height = 16
    Color = clYellow
    ParentBackground = False
    TabOrder = 11
  end
end
