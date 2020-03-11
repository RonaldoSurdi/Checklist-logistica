object HWS_Form_Usuarios_Mobile_Alteracao: THWS_Form_Usuarios_Mobile_Alteracao
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Altera'#231#227'o de Usu'#225'rios do Mobile'
  ClientHeight = 347
  ClientWidth = 795
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 18
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 795
    Height = 281
    Align = alTop
    Caption = 'Altera'#231#227'o de Usu'#225'rios do Mobile:'
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 27
      Width = 48
      Height = 18
      Caption = 'C'#243'digo:'
    end
    object Label2: TLabel
      Left = 8
      Top = 57
      Width = 44
      Height = 18
      Caption = 'Nome:'
    end
    object Label3: TLabel
      Left = 8
      Top = 87
      Width = 42
      Height = 18
      Caption = 'E-Mail:'
    end
    object HWS_Edit_Codigo: TEdit
      Tag = 10
      Left = 89
      Top = 24
      Width = 92
      Height = 26
      Enabled = False
      TabOrder = 0
      TextHint = 'Informe o C'#243'digo do Usu'#225'rio'
    end
    object HWS_Edit_Nome: TEdit
      Tag = 10
      Left = 89
      Top = 54
      Width = 688
      Height = 26
      TabOrder = 1
      TextHint = 'Informe o nome do Usu'#225'rio'
    end
    object HWS_Edit_EMail: TEdit
      Tag = 10
      Left = 89
      Top = 84
      Width = 688
      Height = 26
      TabOrder = 2
      TextHint = 'Informe o e-mail do Usu'#225'rio'
    end
    object GroupBox2: TGroupBox
      Left = 89
      Top = 116
      Width = 688
      Height = 149
      Caption = 'Login do Mobile:'
      TabOrder = 3
      object Label4: TLabel
        Left = 8
        Top = 27
        Width = 53
        Height = 18
        Caption = 'Usu'#225'rio:'
      end
      object Label5: TLabel
        Left = 8
        Top = 57
        Width = 45
        Height = 18
        Caption = 'Senha:'
      end
      object Label6: TLabel
        Left = 8
        Top = 87
        Width = 112
        Height = 18
        Caption = 'Confirmar senha:'
      end
      object HWS_Edit_Usuario: TEdit
        Tag = 10
        Left = 124
        Top = 24
        Width = 240
        Height = 26
        Enabled = False
        TabOrder = 0
        TextHint = 'Informe o usu'#225'rio para logon no sistema'
      end
      object HWS_Edit_Senha: TEdit
        Tag = 10
        Left = 124
        Top = 54
        Width = 240
        Height = 26
        PasswordChar = '*'
        TabOrder = 1
        TextHint = 'Informe a senha para logon no sistema'
      end
      object HWS_Edit_SenhaRedigite: TEdit
        Tag = 10
        Left = 124
        Top = 84
        Width = 240
        Height = 26
        PasswordChar = '*'
        TabOrder = 2
        TextHint = 'Redigite a senha para logon no sistema'
      end
      object HWS_CheckBox_AlterarSenha: TCheckBox
        Left = 8
        Top = 118
        Width = 321
        Height = 20
        Caption = 'Alterar a senha no pr'#243'ximo logon no mobile'
        TabOrder = 3
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 328
    Width = 795
    Height = 19
    Panels = <>
    SimplePanel = True
    SizeGrip = False
  end
  object HWS_BitBtn_Gravar: TBitBtn
    Left = 551
    Top = 285
    Width = 120
    Height = 40
    Caption = 'Gravar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = HWS_BitBtn_GravarClick
  end
  object BitBtn1: TBitBtn
    Left = 673
    Top = 285
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
    OnClick = BitBtn1Click
  end
end
