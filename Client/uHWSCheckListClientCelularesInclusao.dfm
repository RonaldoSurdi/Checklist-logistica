object HWS_Form_Celulares_Inclusao: THWS_Form_Celulares_Inclusao
  Left = 0
  Top = 0
  Caption = 'HWSTracking - Inclus'#227'o de Celulares'
  ClientHeight = 200
  ClientWidth = 616
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 18
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 616
    Height = 130
    Align = alClient
    Caption = 'Inclus'#227'o de Celulares:'
    TabOrder = 0
    object Label2: TLabel
      Left = 16
      Top = 32
      Width = 57
      Height = 18
      Caption = 'N'#250'mero:'
    end
    object Label3: TLabel
      Left = 16
      Top = 64
      Width = 67
      Height = 18
      Caption = 'Descri'#231#227'o:'
    end
    object Label1: TLabel
      Left = 15
      Top = 96
      Width = 46
      Height = 18
      Caption = 'Status:'
    end
    object HWS_Edit_Descricao: TEdit
      Tag = 10
      Left = 100
      Top = 61
      Width = 507
      Height = 26
      TabOrder = 0
      TextHint = 'Digite a Descri'#231#227'o do Celular'
    end
    object HWS_ComboBox_Status: TComboBox
      Tag = 10
      Left = 100
      Top = 93
      Width = 507
      Height = 26
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 1
      Text = '1=Ativo'
      TextHint = 'Selecione o Status do Celular'
      Items.Strings = (
        '1=Ativo'
        '2=Desativado')
    end
    object HWS_Edit_Numero: TEdit
      Left = 100
      Top = 29
      Width = 197
      Height = 26
      TabOrder = 2
      TextHint = 'Informe o n'#250'mero de s'#233'rie do Celular'
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 130
    Width = 616
    Height = 70
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object StatusBar1: TStatusBar
      Left = 0
      Top = 51
      Width = 616
      Height = 19
      Panels = <>
    end
    object Button2: TButton
      Left = 492
      Top = 7
      Width = 120
      Height = 40
      Caption = 'Sair'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button1: TButton
      Left = 369
      Top = 7
      Width = 120
      Height = 40
      Caption = 'Salvar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = Button1Click
    end
  end
end
