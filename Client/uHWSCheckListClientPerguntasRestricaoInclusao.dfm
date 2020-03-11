object HWS_Form_RestricaoInclusao: THWS_Form_RestricaoInclusao
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Inclus'#227'o de Restri'#231#227'o de Perguntas'
  ClientHeight = 572
  ClientWidth = 796
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    796
    572)
  PixelsPerInch = 96
  TextHeight = 18
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 796
    Height = 217
    Align = alTop
    Caption = 'Grupos de Perguntas:'
    TabOrder = 0
    object HWS_ListBox_GrupoPerguntas: TListBox
      Left = 2
      Top = 20
      Width = 792
      Height = 195
      Align = alClient
      ItemHeight = 18
      TabOrder = 0
      OnClick = HWS_ListBox_GrupoPerguntasClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 217
    Width = 796
    Height = 184
    Align = alTop
    Caption = 'Respostas do Grupo:'
    TabOrder = 1
    object HWS_ListBox_RespostasDoGrupo: TListBox
      Left = 2
      Top = 20
      Width = 792
      Height = 162
      Align = alClient
      ItemHeight = 18
      TabOrder = 0
      OnClick = HWS_ListBox_RespostasDoGrupoClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 553
    Width = 796
    Height = 19
    Panels = <>
    SimplePanel = True
    SizeGrip = False
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 401
    Width = 796
    Height = 110
    Align = alTop
    Caption = 'Defini'#231#227'o da Restri'#231#227'o'
    TabOrder = 3
    object HWS_Label_GrupoPerguntas: TLabel
      Left = 185
      Top = 24
      Width = 218
      Height = 18
      Caption = 'HWS_Label_GrupoPerguntas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object HWS_Label_RespostaDoGrupo: TLabel
      Left = 210
      Top = 48
      Width = 231
      Height = 18
      Caption = 'HWS_Label_RespostaDoGrupo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 10
      Top = 24
      Width = 167
      Height = 18
      Caption = 'Se o grupo de perguntas:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 10
      Top = 48
      Width = 41
      Height = 18
      Caption = 'conter'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 127
      Top = 48
      Width = 75
      Height = 18
      Caption = 'resposta(s)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 10
      Top = 72
      Width = 277
      Height = 18
      Caption = 'o CheckList ser'#225' aprovado com restri'#231#245'es.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object UpDown1: TUpDown
      Left = 105
      Top = 45
      Width = 16
      Height = 26
      Associate = HWS_Edit_QtdRespostas
      Min = 1
      Position = 1
      TabOrder = 0
    end
    object HWS_Edit_QtdRespostas: TEdit
      Left = 64
      Top = 45
      Width = 41
      Height = 26
      NumbersOnly = True
      TabOrder = 1
      Text = '1'
    end
  end
  object BitBtn4: TBitBtn
    Left = 675
    Top = 512
    Width = 119
    Height = 40
    Anchors = [akRight]
    Caption = 'Sair'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = BitBtn4Click
  end
  object BitBtn1: TBitBtn
    Left = 556
    Top = 512
    Width = 119
    Height = 40
    Anchors = [akRight]
    Caption = 'Gravar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = BitBtn1Click
  end
end
