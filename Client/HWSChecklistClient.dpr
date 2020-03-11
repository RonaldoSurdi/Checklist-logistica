program HWSChecklistClient;



uses
  Vcl.Forms,
  uHWSCheckListClientMenu in 'uHWSCheckListClientMenu.pas' {HWS_Form_Menu},
  uHWSCheckListClientAutenticacao in 'uHWSCheckListClientAutenticacao.pas' {HWS_Form_Autenticacao},
  uHWSCheckListClientDataModule in 'uHWSCheckListClientDataModule.pas' {HWS_ClientModule: TDataModule},
  uHWSCheckListClientClientClassesRest in 'uHWSCheckListClientClientClassesRest.pas',
  uHWSCheckListClientClientClassesDataSnap in 'uHWSCheckListClientClientClassesDataSnap.pas',
  uHWSCheckListClientTiposImplementos in 'uHWSCheckListClientTiposImplementos.pas' {HWS_Form_TiposImplementos},
  uHWSCheckListClientGruposPerguntas in 'uHWSCheckListClientGruposPerguntas.pas' {HWS_Form_GruposPerguntas},
  uHWSCheckListClientGruposPerguntasXTiposImplementos in 'uHWSCheckListClientGruposPerguntasXTiposImplementos.pas' {HWS_Form_GrupoPerguntasXTiposImplementos},
  uHWSCheckListClientPerguntas in 'uHWSCheckListClientPerguntas.pas' {HWS_Form_Perguntas},
  uHWSCheckListClientPerguntasInclusao in 'uHWSCheckListClientPerguntasInclusao.pas' {HWS_Form_Perguntas_Inclusao},
  uHWSCheckListClientPerguntasAlteracao in 'uHWSCheckListClientPerguntasAlteracao.pas' {HWS_Form_Perguntas_Alteracao},
  uHWSCheckListClientGruposPerguntasXPerguntas in 'uHWSCheckListClientGruposPerguntasXPerguntas.pas' {HWS_Form_GrupodePerguntasXPerguntas},
  uHWSCheckListClientRespostas in 'uHWSCheckListClientRespostas.pas' {HWS_Form_Respostas},
  uHWSCheckListClientPerguntasXRespostas in 'uHWSCheckListClientPerguntasXRespostas.pas' {HWS_Form_PerguntasXRespostas},
  uHWSJson in 'uHWSJson.pas',
  uHWSCheckListClientCheckList in 'uHWSCheckListClientCheckList.pas' {HWS_Form_CheckList},
  uHWSCheckListClientCheckListInclusao in 'uHWSCheckListClientCheckListInclusao.pas' {HWS_Form_CheckList_Inclusao},
  uHWSCheckListClientCheckListAlteracao in 'uHWSCheckListClientCheckListAlteracao.pas' {HWS_Form_CheckList_Alteracao},
  uHWSFuncoes in 'uHWSFuncoes.pas',
  uHWSCheckListClientConsultasGenericas in 'uHWSCheckListClientConsultasGenericas.pas' {HWS_Form_ConsultasGenericas},
  uHWSCheckListClientTiposImplementosInclusao in 'uHWSCheckListClientTiposImplementosInclusao.pas' {HWS_Form_TiposImplementos_Inclusao},
  uHWSCheckListClientTiposImplementosAlteracao in 'uHWSCheckListClientTiposImplementosAlteracao.pas' {HWS_Form_TiposImplementos_Alteracao},
  uHWSCheckListClientGruposPerguntasInclusao in 'uHWSCheckListClientGruposPerguntasInclusao.pas' {HWS_Form_GrupoPerguntasInclusao},
  uHWSCheckListClientGruposPerguntasAlteracao in 'uHWSCheckListClientGruposPerguntasAlteracao.pas' {HWS_Form_GrupoPergumtasAlteracao},
  uHWSCheckListClientRespostasInclusao in 'uHWSCheckListClientRespostasInclusao.pas' {HWS_Form_RespostasInclusao},
  uHWSCheckListClientRespostasAlteracao in 'uHWSCheckListClientRespostasAlteracao.pas' {HWS_Form_RespostasAlteracao},
  uHWSCheckListClientPerguntasReprovacao in 'uHWSCheckListClientPerguntasReprovacao.pas' {HWS_Form_PerguntasReprovacao},
  uHWSCheckListClientPerguntasReprovacaoInclusao in 'uHWSCheckListClientPerguntasReprovacaoInclusao.pas' {HWS_Form_PerguntasReprovacaoInclusao},
  uHWSCheckListClientPerguntasRestricao in 'uHWSCheckListClientPerguntasRestricao.pas' {HWS_Form_PerguntasRestricao},
  uHWSCheckListClientPerguntasRestricaoInclusao in 'uHWSCheckListClientPerguntasRestricaoInclusao.pas' {HWS_Form_RestricaoInclusao},
  uHWSCheckListClientPerguntasFilhas in 'uHWSCheckListClientPerguntasFilhas.pas' {HWS_Form_PerguntasFilhas},
  uHWSCheckListClientPerguntasFilhasInclusao in 'uHWSCheckListClientPerguntasFilhasInclusao.pas' {HWS_Form_PerguntasFilhasInclusao},
  uHWSCheckListClientCelulares in 'uHWSCheckListClientCelulares.pas' {HWS_Form_Celulares},
  uHWSCheckListClientCelularesAlteracao in 'uHWSCheckListClientCelularesAlteracao.pas' {HWS_Form_Celulares_Alteracao},
  uHWSCheckListClientCelularesInclusao in 'uHWSCheckListClientCelularesInclusao.pas' {HWS_Form_Celulares_Inclusao},
  uHWSCheckListClientOrganizarSequenciaDasPerguntas in 'uHWSCheckListClientOrganizarSequenciaDasPerguntas.pas' {HWS_Form_OrganizarSequenciaDasPerguntas},
  uHWSCheckListClientUsuarios in 'uHWSCheckListClientUsuarios.pas' {HWS_Form_Usuarios},
  uHWSCheckListClientUsuariosSistemasInclusao in 'uHWSCheckListClientUsuariosSistemasInclusao.pas' {HWS_Form_Usuario_Sistema_Inclusao},
  uHWSCheckListClientUsuariosSistemasAlteracao in 'uHWSCheckListClientUsuariosSistemasAlteracao.pas' {HWS_Form_Usuarios_Sistema_Alteracao},
  uHWSCheckListClientUsuariosMobileInclusao in 'uHWSCheckListClientUsuariosMobileInclusao.pas' {HWS_Form_Usuarios_Mobile_Inclusao},
  uHWSCheckListClientUsuariosMobileAlteracao in 'uHWSCheckListClientUsuariosMobileAlteracao.pas' {HWS_Form_Usuarios_Mobile_Alteracao},
  uHWSCheckListClientRelatorioCheckListsRealizadosParametros in 'uHWSCheckListClientRelatorioCheckListsRealizadosParametros.pas' {HWS_Form_Relatorio_CheckLists_Realizados_Parametros},
  uHWSCheckListClientRelatorioCheckListsRealizadosAnaliticoParametros in 'uHWSCheckListClientRelatorioCheckListsRealizadosAnaliticoParametros.pas' {HWS_Form_Relatorio_CheckLists_Realizados_Analitico_Parametros},
  Unit1 in 'Unit1.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(THWS_ClientModule, HWS_ClientModule);
  Application.CreateForm(THWS_Form_Autenticacao, HWS_Form_Autenticacao);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
