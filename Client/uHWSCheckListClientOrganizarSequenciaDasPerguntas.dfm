object HWS_Form_OrganizarSequenciaDasPerguntas: THWS_Form_OrganizarSequenciaDasPerguntas
  Left = 0
  Top = 0
  Caption = 'Organizar Perguntas:'
  ClientHeight = 514
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
    Top = 51
    Width = 795
    Height = 185
    Align = alTop
    Caption = 'Grupo de Perguntas:'
    TabOrder = 0
    object HWS_StringGrid_GrupoPerguntas: TStringGrid
      Left = 2
      Top = 20
      Width = 791
      Height = 163
      Align = alClient
      ColCount = 3
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowMoving, goRowSelect]
      TabOrder = 0
      OnClick = HWS_StringGrid_GrupoPerguntasClick
      ColWidths = (
        78
        94
        604)
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 236
    Width = 795
    Height = 215
    Align = alClient
    Caption = 'Perguntas do Grupo:'
    TabOrder = 1
    object HWS_StringGrid_Perguntas: TStringGrid
      Left = 2
      Top = 20
      Width = 791
      Height = 193
      Align = alClient
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowMoving, goRowSelect]
      TabOrder = 0
      OnMouseActivate = HWS_StringGrid_PerguntasMouseActivate
      OnRowMoved = HWS_StringGrid_PerguntasRowMoved
      ColWidths = (
        92
        83
        83
        80
        610)
      RowHeights = (
        24
        24)
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 495
    Width = 795
    Height = 19
    Panels = <>
    SimplePanel = True
    SizeGrip = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 451
    Width = 795
    Height = 44
    Align = alBottom
    TabOrder = 3
    object HWS_BitBtn_Gravar: TBitBtn
      Left = 551
      Top = 1
      Width = 120
      Height = 40
      Caption = 'Gravar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object BitBtn1: TBitBtn
      Left = 672
      Top = 1
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
      OnClick = BitBtn1Click
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 0
    Width = 795
    Height = 51
    Align = alTop
    Caption = 'CheckLists:'
    TabOrder = 4
    object HWS_ComboBox_CheckList: TComboBox
      Left = 6
      Top = 20
      Width = 779
      Height = 26
      Style = csDropDownList
      TabOrder = 0
      OnChange = HWS_ComboBox_CheckListChange
    end
  end
end
