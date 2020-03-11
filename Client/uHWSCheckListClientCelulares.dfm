object HWS_Form_Celulares: THWS_Form_Celulares
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'HWSTracking - Cadastro de Chips'
  ClientHeight = 572
  ClientWidth = 794
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
    Top = 0
    Width = 794
    Height = 503
    Align = alClient
    Caption = 'Lista de Chips Cadastrados'
    TabOrder = 0
    object DBGrid1: TDBGrid
      AlignWithMargins = True
      Left = 7
      Top = 25
      Width = 780
      Height = 471
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alClient
      DataSource = HWS_ClientModule.HWS_DataSource_HD01
      GradientEndColor = clOlive
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
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
          FieldName = 'HD_CHIP'
          Title.Caption = 'Chip'
          Width = 147
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'HD_DESC'
          Title.Caption = 'Descri'#231#227'o'
          Width = 464
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'HD_STATUS'
          Title.Caption = 'Status'
          Width = 143
          Visible = True
        end>
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 503
    Width = 794
    Height = 69
    Align = alBottom
    TabOrder = 1
    object Pesquisar: TButton
      Left = 7
      Top = 6
      Width = 120
      Height = 40
      Caption = 'Pesquisar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object Button1: TButton
      Left = 136
      Top = 6
      Width = 120
      Height = 40
      Caption = 'Incluir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 262
      Top = 6
      Width = 120
      Height = 40
      Caption = 'Alterar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = Button2Click
    end
    object Button4: TButton
      Left = 657
      Top = 6
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
      OnClick = Button4Click
    end
    object StatusBar1: TStatusBar
      Left = 1
      Top = 49
      Width = 792
      Height = 19
      Panels = <>
    end
  end
end
