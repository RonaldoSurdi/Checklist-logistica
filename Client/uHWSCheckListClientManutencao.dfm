object HWS_Form_Manutencao: THWS_Form_Manutencao
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Manuten'#231#227'o do CheckList'
  ClientHeight = 313
  ClientWidth = 692
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
    Width = 692
    Height = 249
    Align = alTop
    Caption = 'Usu'#225'rios Conectados:'
    TabOrder = 0
    object BitBtn4: TBitBtn
      Left = 3
      Top = 204
      Width = 170
      Height = 40
      Caption = 'Desconectar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object BitBtn1: TBitBtn
      Left = 175
      Top = 204
      Width = 170
      Height = 40
      Caption = 'Desconectar todos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object BitBtn6: TBitBtn
      Left = 347
      Top = 204
      Width = 170
      Height = 40
      Caption = 'Atualizar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object ListBox1: TListBox
      Left = 2
      Top = 20
      Width = 688
      Height = 178
      Align = alTop
      ItemHeight = 18
      TabOrder = 3
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 294
    Width = 692
    Height = 19
    Panels = <>
    SimplePanel = True
    SizeGrip = False
  end
  object BitBtn2: TBitBtn
    Left = 268
    Top = 253
    Width = 140
    Height = 40
    Caption = 'Iniciar Servi'#231'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object BitBtn3: TBitBtn
    Left = 409
    Top = 253
    Width = 140
    Height = 40
    Caption = 'Parar Servi'#231'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object BitBtn5: TBitBtn
    Left = 550
    Top = 253
    Width = 140
    Height = 40
    Caption = 'Sair'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
end
