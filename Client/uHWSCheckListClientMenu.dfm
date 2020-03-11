object HWS_Form_Menu: THWS_Form_Menu
  Left = 0
  Top = 0
  Caption = 'HWS - CheckList'
  ClientHeight = 524
  ClientWidth = 829
  Color = clGray
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesigned
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 505
    Width = 829
    Height = 19
    Panels = <
      item
        Width = 150
      end
      item
        Width = 50
      end>
    SimplePanel = True
    SizeGrip = False
  end
  object MainMenu1: TMainMenu
    Left = 400
    Top = 72
    object Cadastri1: TMenuItem
      Caption = 'Cadastros'
      object CheckLists1: TMenuItem
        Caption = 'CheckLists'
        OnClick = CheckLists1Click
      end
      object ipos1: TMenuItem
        Caption = 'Implementos'
        OnClick = ipos1Click
      end
      object GruposdePerguntas1: TMenuItem
        Caption = 'Grupos de Perguntas'
        OnClick = GruposdePerguntas1Click
      end
      object GruposdePergutasXTipos1: TMenuItem
        Caption = 'Grupos de Perguntas X Implementos'
        OnClick = GruposdePergutasXTipos1Click
      end
      object Perguntas1: TMenuItem
        Caption = 'Perguntas'
        OnClick = Perguntas1Click
      end
      object PerguntasXGruposdePerguntas1: TMenuItem
        Caption = 'Perguntas X Grupos de Perguntas'
        OnClick = PerguntasXGruposdePerguntas1Click
      end
      object Respostas1: TMenuItem
        Caption = 'Respostas'
        OnClick = Respostas1Click
      end
      object PerguntasXRespostas1: TMenuItem
        Caption = 'Perguntas X Respostas'
        OnClick = PerguntasXRespostas1Click
      end
      object PerguntasFilhas1: TMenuItem
        Caption = 'Perguntas Filhas'
        OnClick = PerguntasFilhas1Click
      end
      object CritriosdeAprovao1: TMenuItem
        Caption = 'Crit'#233'rios de Aprova'#231#227'o'
        object PerguntasdeReprovao1: TMenuItem
          Caption = 'Perguntas de Reprova'#231#227'o'
          OnClick = PerguntasdeReprovao1Click
        end
        object PerguntasdeRestrio1: TMenuItem
          Caption = 'Perguntas de Restri'#231#227'o'
          OnClick = PerguntasdeRestrio1Click
        end
      end
      object OrganizarGruposePerguntas1: TMenuItem
        Caption = 'Organizar Grupos e Perguntas'
        Visible = False
        OnClick = OrganizarGruposePerguntas1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Celulares1: TMenuItem
        Caption = 'Celulares'
        OnClick = Celulares1Click
      end
      object Usurios1: TMenuItem
        Caption = 'Usu'#225'rios'
        OnClick = Usurios1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object Sair1: TMenuItem
        Caption = 'Sair'
      end
    end
    object CheckList1: TMenuItem
      Caption = 'Relat'#243'rios'
      object Checklist2: TMenuItem
        Caption = 'Checklists Realizados'
        OnClick = Checklist2Click
      end
      object CheckListsRealizadosAnaltico1: TMenuItem
        Caption = 'CheckLists Realizados Anal'#237'tico'
        OnClick = CheckListsRealizadosAnaltico1Click
      end
    end
    object Sair2: TMenuItem
      Caption = 'Sair'
      OnClick = Sair2Click
    end
  end
end
