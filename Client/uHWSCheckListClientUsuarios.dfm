object HWS_Form_Usuarios: THWS_Form_Usuarios
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Cadastro de Usu'#225'rios'
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
    Height = 512
    Align = alTop
    Caption = 'Cadastro de Usu'#225'rios:'
    TabOrder = 0
    object PageControl1: TPageControl
      Left = 2
      Top = 20
      Width = 790
      Height = 490
      ActivePage = TabSheet2
      Align = alClient
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = 'Usu'#225'rios do Sistema'
        object HWS_DBGrid_UsuariosSistema: TDBGrid
          Left = 0
          Top = 0
          Width = 782
          Height = 414
          Align = alClient
          DataSource = HWS_ClientModule.HWS_DataSource_HG01
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -15
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnKeyDown = HWS_DBGrid_UsuariosSistemaKeyDown
          Columns = <
            item
              Expanded = False
              FieldName = 'HG_CODIGO'
              Title.Caption = 'C'#243'digo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'HG_NOME'
              Title.Caption = 'Nome'
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'HG_EMAIL'
              Title.Caption = 'E-Mail'
              Width = 243
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'HG_USER'
              Title.Caption = 'Usu'#225'rio'
              Width = 117
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'HG_DATACAD'
              Title.Caption = 'DataCadastro'
              Width = 177
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'HG_DATAUPD'
              Title.Caption = 'Data'#218'ltimaAltera'#231#227'o'
              Width = 147
              Visible = True
            end>
        end
        object Panel1: TPanel
          Left = 0
          Top = 414
          Width = 782
          Height = 43
          Align = alBottom
          TabOrder = 1
          object HWS_BitBtn_Incluir_Sistema: TBitBtn
            Left = 0
            Top = 1
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
            OnClick = HWS_BitBtn_Incluir_SistemaClick
          end
          object HWS_BitBtn_Alterar_Sistema: TBitBtn
            Left = 122
            Top = 1
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
            OnClick = HWS_BitBtn_Alterar_SistemaClick
          end
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Usu'#225'rios do Mobile'
        ImageIndex = 1
        object HWS_DBGrid_UsuariosMobile: TDBGrid
          Left = 0
          Top = 0
          Width = 782
          Height = 414
          Align = alClient
          DataSource = HWS_ClientModule.HWS_DataSource_HI01
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -15
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnKeyDown = HWS_DBGrid_UsuariosMobileKeyDown
          Columns = <
            item
              Expanded = False
              FieldName = 'HI_CODIGO'
              Title.Caption = 'C'#243'digo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'HI_NOME'
              Title.Caption = 'Nome'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'HI_EMAIL'
              Title.Caption = 'E-Mail'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'HI_USER'
              Title.Caption = 'Usu'#225'rio'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'HI_DATACAD'
              Title.Caption = 'DataCadastro'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'HI_DATAUPD'
              Title.Caption = 'Data'#218'ltimaAltera'#231#227'o'
              Visible = True
            end>
        end
        object Panel2: TPanel
          Left = 0
          Top = 414
          Width = 782
          Height = 43
          Align = alBottom
          TabOrder = 1
          object HWS_BitBtn_Incluir_Mobile: TBitBtn
            Left = 0
            Top = 1
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
            OnClick = HWS_BitBtn_Incluir_MobileClick
          end
          object HWS_BitBtn_Alterar_Mobile: TBitBtn
            Left = 122
            Top = 1
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
            OnClick = HWS_BitBtn_Alterar_MobileClick
          end
        end
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 553
    Width = 794
    Height = 19
    Panels = <>
    SimplePanel = True
    SizeGrip = False
  end
  object HWS_Sair: TBitBtn
    Left = 672
    Top = 512
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
    OnClick = HWS_SairClick
  end
end
