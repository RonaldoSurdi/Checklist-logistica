object HWS_Form_Tipos: THWS_Form_Tipos
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Cadastro de Tipos'
  ClientHeight = 331
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
    Top = 0
    Width = 641
    Height = 265
    Align = alTop
    Caption = 'Cadastro de Tipos:'
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 2
      Top = 20
      Width = 637
      Height = 243
      Align = alClient
      DataSource = HWS_ClientModule.HWS_DataSource_AA01
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -15
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
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
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          Title.Caption = 'Descri'#231#227'o'
          Width = 514
          Visible = True
        end>
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 312
    Width = 641
    Height = 19
    Panels = <>
    SimplePanel = True
    SizeGrip = False
    ExplicitLeft = 448
    ExplicitTop = 352
    ExplicitWidth = 0
  end
  object BitBtn1: TBitBtn
    Left = 2
    Top = 266
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
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 520
    Top = 266
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
end
