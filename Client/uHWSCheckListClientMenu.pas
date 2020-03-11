unit uHWSCheckListClientMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ComCtrls, Vcl.Grids,
  Vcl.DBGrids;

type
  THWS_Form_Menu = class(TForm)
    MainMenu1: TMainMenu;
    Cadastri1: TMenuItem;
    ipos1: TMenuItem;
    GruposdePerguntas1: TMenuItem;
    GruposdePergutasXTipos1: TMenuItem;
    Perguntas1: TMenuItem;
    PerguntasXGruposdePerguntas1: TMenuItem;
    Respostas1: TMenuItem;
    PerguntasFilhas1: TMenuItem;
    PerguntasXRespostas1: TMenuItem;
    N1: TMenuItem;
    Usurios1: TMenuItem;
    N2: TMenuItem;
    Sair1: TMenuItem;
    CheckList1: TMenuItem;
    Checklist2: TMenuItem;
    Sair2: TMenuItem;
    StatusBar1: TStatusBar;
    CheckLists1: TMenuItem;
    PerguntasdeReprovao1: TMenuItem;
    CritriosdeAprovao1: TMenuItem;
    PerguntasdeRestrio1: TMenuItem;
    Celulares1: TMenuItem;
    OrganizarGruposePerguntas1: TMenuItem;
    CheckListsRealizadosAnaltico1: TMenuItem;
    procedure ipos1Click(Sender: TObject);
    procedure GruposdePerguntas1Click(Sender: TObject);
    procedure GruposdePergutasXTipos1Click(Sender: TObject);
    procedure Perguntas1Click(Sender: TObject);
    procedure PerguntasXGruposdePerguntas1Click(Sender: TObject);
    procedure Respostas1Click(Sender: TObject);
    procedure PerguntasXRespostas1Click(Sender: TObject);
    procedure CheckLists1Click(Sender: TObject);
    procedure PerguntasdeReprovao1Click(Sender: TObject);
    procedure PerguntasdeRestrio1Click(Sender: TObject);
    procedure PerguntasFilhas1Click(Sender: TObject);
    procedure Celulares1Click(Sender: TObject);
    procedure OrganizarGruposePerguntas1Click(Sender: TObject);
    procedure Usurios1Click(Sender: TObject);
    procedure Checklist2Click(Sender: TObject);
    procedure Sair2Click(Sender: TObject);
    procedure CheckListsRealizadosAnaltico1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HWS_Form_Menu: THWS_Form_Menu;

implementation

uses uHWSCheckListClientDataModule, uHWSCheckListClientTiposImplementos,
  uHWSCheckListClientGruposPerguntas,
  uHWSCheckListClientGruposPerguntasXTiposImplementos,
  uHWSCheckListClientPerguntas, uHWSCheckListClientGruposPerguntasXPerguntas,
  uHWSCheckListClientRespostas, uHWSCheckListClientPerguntasXRespostas,
  uHWSCheckListClientCheckList, uHWSCheckListClientPerguntasReprovacao,
  uHWSCheckListClientPerguntasRestricao,
  uHWSCheckListClientPerguntasFilhas, uHWSCheckListClientCelulares,
  uHWSCheckListClientOrganizarSequenciaDasPerguntas,
  uHWSCheckListClientUsuarios,
  uHWSCheckListClientRelatorioCheckListsRealizadosParametros,
  uHWSCheckListClientRelatorioCheckListsRealizadosAnaliticoParametros, unit1;

{$R *.dfm}

procedure THWS_Form_Menu.Celulares1Click(Sender: TObject);
begin
  Application.CreateForm(THWS_Form_Celulares, HWS_Form_Celulares);
  HWS_Form_Celulares.ShowModal;
end;

procedure THWS_Form_Menu.Checklist2Click(Sender: TObject);
begin
   Application.CreateForm(THWS_Form_Relatorio_CheckLists_Realizados_Parametros, HWS_Form_Relatorio_CheckLists_Realizados_Parametros);
   HWS_Form_Relatorio_CheckLists_Realizados_Parametros.ShowModal;
end;

procedure THWS_Form_Menu.CheckLists1Click(Sender: TObject);
begin
  Application.CreateForm(THWS_Form_CheckList, HWS_Form_CheckList);
  HWS_Form_CheckList.ShowModal;
end;

procedure THWS_Form_Menu.CheckListsRealizadosAnaltico1Click(Sender: TObject);
begin
   Application.CreateForm(THWS_Form_Relatorio_CheckLists_Realizados_Analitico_Parametros, HWS_Form_Relatorio_CheckLists_Realizados_Analitico_Parametros);
   HWS_Form_Relatorio_CheckLists_Realizados_Analitico_Parametros.ShowModal;
end;

procedure THWS_Form_Menu.FormCreate(Sender: TObject);
begin
   Application.CreateForm(TForm1, Form1);
   Form1.ShowModal;
end;

procedure THWS_Form_Menu.GruposdePerguntas1Click(Sender: TObject);
begin
   Application.CreateForm(THWS_Form_GruposPerguntas, HWS_Form_GruposPerguntas);
   HWS_Form_GruposPerguntas.ShowModal;
end;

procedure THWS_Form_Menu.GruposdePergutasXTipos1Click(Sender: TObject);
begin
   Application.CreateForm(THWS_Form_GrupoPerguntasXTiposImplementos, HWS_Form_GrupoPerguntasXTiposImplementos);
   HWS_Form_GrupoPerguntasXTiposImplementos.ShowModal;
end;

procedure THWS_Form_Menu.ipos1Click(Sender: TObject);
begin
   Application.CreateForm(THWS_Form_TiposImplementos, HWS_Form_TiposImplementos);
   HWS_Form_TiposImplementos.ShowModal;
end;

procedure THWS_Form_Menu.OrganizarGruposePerguntas1Click(Sender: TObject);
begin
   Application.CreateForm(THWS_Form_OrganizarSequenciaDasPerguntas, HWS_Form_OrganizarSequenciaDasPerguntas);
   HWS_Form_OrganizarSequenciaDasPerguntas.ShowModal;
end;

procedure THWS_Form_Menu.Perguntas1Click(Sender: TObject);
begin
   Application.CreateForm(THWS_Form_Perguntas, HWS_Form_Perguntas);
   HWS_Form_Perguntas.ShowModal;
end;

procedure THWS_Form_Menu.PerguntasdeReprovao1Click(Sender: TObject);
begin
   Application.CreateForm(THWS_Form_PerguntasReprovacao, HWS_Form_PerguntasReprovacao);
   HWS_Form_PerguntasReprovacao.ShowModal;
end;

procedure THWS_Form_Menu.PerguntasdeRestrio1Click(Sender: TObject);
begin
   Application.CreateForm(THWS_Form_PerguntasRestricao, HWS_Form_PerguntasRestricao);
   HWS_Form_PerguntasRestricao.ShowModal;
end;

procedure THWS_Form_Menu.PerguntasFilhas1Click(Sender: TObject);
begin
   Application.CreateForm(THWS_Form_PerguntasFilhas, HWS_Form_PerguntasFilhas);
   HWS_Form_PerguntasFilhas.ShowModal;
end;

procedure THWS_Form_Menu.PerguntasXGruposdePerguntas1Click(Sender: TObject);
begin
   Application.CreateForm(THWS_Form_GrupodePerguntasXPerguntas, HWS_Form_GrupodePerguntasXPerguntas);
   HWS_Form_GrupodePerguntasXPerguntas.ShowModal;
end;

procedure THWS_Form_Menu.PerguntasXRespostas1Click(Sender: TObject);
begin
   Application.CreateForm(THWS_Form_PerguntasXRespostas, HWS_Form_PerguntasXRespostas);
   HWS_Form_PerguntasXRespostas.ShowModal;
end;

procedure THWS_Form_Menu.Respostas1Click(Sender: TObject);
begin
   Application.CreateForm(THWS_Form_Respostas, HWS_Form_Respostas);
   HWS_Form_Respostas.ShowModal;
end;

procedure THWS_Form_Menu.Sair2Click(Sender: TObject);
begin
   Close;
end;

procedure THWS_Form_Menu.Usurios1Click(Sender: TObject);
begin
   Application.CreateForm(THWS_Form_Usuarios, HWS_Form_Usuarios);
   HWS_Form_Usuarios.ShowModal;
end;

end.
