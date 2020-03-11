object HWS_Form_Relatorio_CheckLists_Realizados_Parametros: THWS_Form_Relatorio_CheckLists_Realizados_Parametros
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Relat'#243'rio de CheckLists Realizados'
  ClientHeight = 282
  ClientWidth = 615
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
    Width = 615
    Height = 217
    Align = alTop
    Caption = 'Par'#226'metros:'
    TabOrder = 0
    object Label3: TLabel
      Left = 16
      Top = 88
      Width = 61
      Height = 18
      Caption = 'Da Placa:'
    end
    object Label4: TLabel
      Left = 16
      Top = 120
      Width = 65
      Height = 18
      Caption = 'At'#233' Placa:'
    end
    object Label5: TLabel
      Left = 16
      Top = 152
      Width = 69
      Height = 18
      Caption = 'Do Status:'
    end
    object Label6: TLabel
      Left = 16
      Top = 184
      Width = 73
      Height = 18
      Caption = 'At'#233' Status:'
    end
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 59
      Height = 18
      Caption = 'Da Data:'
    end
    object Label2: TLabel
      Left = 16
      Top = 56
      Width = 63
      Height = 18
      Caption = 'At'#233' Data:'
    end
    object HWS_Edit_DaPlaca: TEdit
      Left = 136
      Top = 85
      Width = 97
      Height = 26
      TabOrder = 2
    end
    object HWS_Edit_AtePlaca: TEdit
      Left = 136
      Top = 117
      Width = 97
      Height = 26
      TabOrder = 3
      Text = 'ZZZZZZZ'
    end
    object HWS_ComboBox_DoStatus: TComboBox
      Left = 136
      Top = 149
      Width = 217
      Height = 26
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 4
      Text = '01=Aprovados'
      Items.Strings = (
        '01=Aprovados'
        '02=Aprovados com Restri'#231#227'o'
        '03=Reprovados')
    end
    object HWS_ComboBox_AteStatus: TComboBox
      Left = 136
      Top = 181
      Width = 217
      Height = 26
      Style = csDropDownList
      ItemIndex = 2
      TabOrder = 5
      Text = '03=Reprovados'
      Items.Strings = (
        '01=Aprovados'
        '02=Aprovados com Restri'#231#227'o'
        '03=Reprovados')
    end
    object HWS_DateTimePicker_DaData: TDateTimePicker
      Left = 137
      Top = 21
      Width = 186
      Height = 26
      Date = 41049.893324166670000000
      Time = 41049.893324166670000000
      TabOrder = 0
    end
    object HWS_DateTimePicker_AteData: TDateTimePicker
      Left = 137
      Top = 53
      Width = 186
      Height = 26
      Date = 41049.893324166670000000
      Time = 41049.893324166670000000
      TabOrder = 1
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 263
    Width = 615
    Height = 19
    Panels = <>
  end
  object Pesquisar: TButton
    Left = 371
    Top = 221
    Width = 120
    Height = 40
    Caption = 'Confirmar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = PesquisarClick
  end
  object Button1: TButton
    Left = 493
    Top = 221
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
    OnClick = Button1Click
  end
end
