//
// Created by the DataSnap proxy generator.
// 28/05/2012 18:34:58
// 

unit uHWSChecklistService_functions;

interface

uses Datasnap.DSProxyRest, Datasnap.DSClientRest, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, DSProxy, Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXJSONReflect;

type
  THWS_ServerMethodsClient = class(TDSAdminRestClient)
  private
    FDSServerModuleCreateCommand: TDSRestCommand;
    FDSServerModuleDestroyCommand: TDSRestCommand;
    FF_HWS_RetornaStatusDoClienteCommand: TDSRestCommand;
    FF_HWS_RetornaStatusDoClienteCommand_Cache: TDSRestCommand;
    FF_HWS_ProximoAutoIncBancoClienteCommand: TDSRestCommand;
    FF_HWS_GravaPerguntasXRespostasCommand: TDSRestCommand;
    FF_HWS_GravaPerguntasXRespostasCommand_Cache: TDSRestCommand;
    FF_HWS_RevisarCheckListCommand: TDSRestCommand;
    FF_HWS_RevisarCheckListCommand_Cache: TDSRestCommand;
    FF_HWS_RetornaCheckListPerguntasCommand: TDSRestCommand;
    FF_HWS_RetornaCheckListPerguntasCommand_Cache: TDSRestCommand;
    FF_HWS_RetornaStatusChipCommand: TDSRestCommand;
    FF_HWS_RetornaStatusChipCommand_Cache: TDSRestCommand;
    FF_HWS_RetornaVeiculosCommand: TDSRestCommand;
    FF_HWS_RetornaVeiculosCommand_Cache: TDSRestCommand;
    FF_HWS_GravaCheckListRealizadoCommand: TDSRestCommand;
    FF_HWS_GravaCheckListRealizadoCommand_Cache: TDSRestCommand;
    FF_HWS_RetornaCheckListAtivoCommand: TDSRestCommand;
    FF_HWS_ExisteNovoCheckListCommand: TDSRestCommand;
    FF_HWS_ExisteNovoCheckListCommand_Cache: TDSRestCommand;
    FF_HWS_RetornaEstruturaDasPerguntasCommand: TDSRestCommand;
    FF_HWS_RetornaEstruturaDasPerguntasCommand_Cache: TDSRestCommand;
    FF_HWS_PodeExcluirPerguntaFilhaCommand: TDSRestCommand;
    FF_HWS_ExcluirPerguntaFilhaCommand: TDSRestCommand;
    FF_HWS_ExcluirPerguntaFilhaCommand_Cache: TDSRestCommand;
    FF_HWS_PodeExcluirPerguntaReprovacaoCommand: TDSRestCommand;
    FF_HWS_PodeExcluirRestricaoCommand: TDSRestCommand;
    FF_HWS_ProximoAutoIncBancoHWSCommand: TDSRestCommand;
    FF_HWS_RetornaUsuarioDoMobileCommand: TDSRestCommand;
    FF_HWS_RetornaUsuarioDoMobileCommand_Cache: TDSRestCommand;
    FF_HWS_RetornaCheckListsRealizadosCommand: TDSRestCommand;
    FF_HWS_RetornaCheckListsRealizadosCommand_Cache: TDSRestCommand;
    FF_HWS_RetornaChkExpCommand: TDSRestCommand;
    FF_HWS_RetornaChkExpCommand_Cache: TDSRestCommand;
    FF_HWS_RetornaReExpCommand: TDSRestCommand;
    FF_HWS_RetornaReExpCommand_Cache: TDSRestCommand;
    FF_HWS_InsertChkExpCommand: TDSRestCommand;
    FF_HWS_InsertChkExpCommand_Cache: TDSRestCommand;
    FF_HWS_InsertChkPlacasCommand: TDSRestCommand;
    FF_HWS_InsertChkPlacasCommand_Cache: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    procedure DSServerModuleCreate(Sender: TObject);
    procedure DSServerModuleDestroy(Sender: TObject);
    function F_HWS_RetornaStatusDoCliente(HWS_CodCliente: string; const ARequestFilter: string = ''): TJSONArray;
    function F_HWS_RetornaStatusDoCliente_Cache(HWS_CodCliente: string; const ARequestFilter: string = ''): IDSRestCachedJSONArray;
    function F_HWS_ProximoAutoIncBancoCliente(Tabela: string; Campo: string; Formato: string; const ARequestFilter: string = ''): string;
    function F_HWS_GravaPerguntasXRespostas(HWS_PerXRes: TJSONValue; const ARequestFilter: string = ''): TJSONArray;
    function F_HWS_GravaPerguntasXRespostas_Cache(HWS_PerXRes: TJSONValue; const ARequestFilter: string = ''): IDSRestCachedJSONArray;
    function F_HWS_RevisarCheckList(HWS_Codigo: string; const ARequestFilter: string = ''): TJSONArray;
    function F_HWS_RevisarCheckList_Cache(HWS_Codigo: string; const ARequestFilter: string = ''): IDSRestCachedJSONArray;
    function F_HWS_RetornaCheckListPerguntas(HWS_App: string; const ARequestFilter: string = ''): TDBXReader;
    function F_HWS_RetornaCheckListPerguntas_Cache(HWS_App: string; const ARequestFilter: string = ''): IDSRestCachedDBXReader;
    function F_HWS_RetornaStatusChip(HWS_Chip: string; const ARequestFilter: string = ''): TJSONArray;
    function F_HWS_RetornaStatusChip_Cache(HWS_Chip: string; const ARequestFilter: string = ''): IDSRestCachedJSONArray;
    function F_HWS_RetornaVeiculos(HWS_Chip: string; HWS_MaxId: string; const ARequestFilter: string = ''): TDBXReader;
    function F_HWS_RetornaVeiculos_Cache(HWS_Chip: string; HWS_MaxId: string; const ARequestFilter: string = ''): IDSRestCachedDBXReader;
    function F_HWS_GravaCheckListRealizado(HWS_Chip: string; HWS_Dados: TJSONArray; const ARequestFilter: string = ''): TJSONArray;
    function F_HWS_GravaCheckListRealizado_Cache(HWS_Chip: string; HWS_Dados: TJSONArray; const ARequestFilter: string = ''): IDSRestCachedJSONArray;
    function F_HWS_RetornaCheckListAtivo(HWS_App: string; const ARequestFilter: string = ''): string;
    function F_HWS_ExisteNovoCheckList(HWS_App: string; HWS_CheckListAtual: string; const ARequestFilter: string = ''): TJSONArray;
    function F_HWS_ExisteNovoCheckList_Cache(HWS_App: string; HWS_CheckListAtual: string; const ARequestFilter: string = ''): IDSRestCachedJSONArray;
    function F_HWS_RetornaEstruturaDasPerguntas(HWS_CheckList: string; const ARequestFilter: string = ''): TDBXReader;
    function F_HWS_RetornaEstruturaDasPerguntas_Cache(HWS_CheckList: string; const ARequestFilter: string = ''): IDSRestCachedDBXReader;
    function F_HWS_PodeExcluirPerguntaFilha(HWS_CheckList: string; HWS_Pergunta: string; const ARequestFilter: string = ''): string;
    function F_HWS_ExcluirPerguntaFilha(HWS_CheckList: string; HWS_PerguntaPai: string; HWS_PerguntaFilha: string; const ARequestFilter: string = ''): TJSONArray;
    function F_HWS_ExcluirPerguntaFilha_Cache(HWS_CheckList: string; HWS_PerguntaPai: string; HWS_PerguntaFilha: string; const ARequestFilter: string = ''): IDSRestCachedJSONArray;
    function F_HWS_PodeExcluirPerguntaReprovacao(HWS_CheckList: string; HWS_Pergunta: string; const ARequestFilter: string = ''): string;
    function F_HWS_PodeExcluirRestricao(HWS_CheckList: string; HWS_GrupoPergunta: string; const ARequestFilter: string = ''): string;
    function F_HWS_ProximoAutoIncBancoHWS(Tabela: string; Campo: string; Formato: string; const ARequestFilter: string = ''): string;
    function F_HWS_RetornaUsuarioDoMobile(HWS_CodCliente: string; const ARequestFilter: string = ''): TDBXReader;
    function F_HWS_RetornaUsuarioDoMobile_Cache(HWS_CodCliente: string; const ARequestFilter: string = ''): IDSRestCachedDBXReader;
    function F_HWS_RetornaCheckListsRealizados(HWS_DaData: string; HWS_AteData: string; HWS_DaPlaca: string; HWS_AtePlaca: string; HWS_DoStatus: string; HWS_AteStatus: string; const ARequestFilter: string = ''): TDBXReader;
    function F_HWS_RetornaCheckListsRealizados_Cache(HWS_DaData: string; HWS_AteData: string; HWS_DaPlaca: string; HWS_AtePlaca: string; HWS_DoStatus: string; HWS_AteStatus: string; const ARequestFilter: string = ''): IDSRestCachedDBXReader;
    function F_HWS_RetornaChkExp(HWS_tipoIni: string; HWS_tipoEnd: string; const ARequestFilter: string = ''): TDBXReader;
    function F_HWS_RetornaChkExp_Cache(HWS_tipoIni: string; HWS_tipoEnd: string; const ARequestFilter: string = ''): IDSRestCachedDBXReader;
    function F_HWS_RetornaReExp(const ARequestFilter: string = ''): TDBXReader;
    function F_HWS_RetornaReExp_Cache(const ARequestFilter: string = ''): IDSRestCachedDBXReader;
    function F_HWS_InsertChkExp(HWS_ChkCodIni: string; HWS_ChkCodEnd: string; HWS_ChkIdExp: string; const ARequestFilter: string = ''): TJSONArray;
    function F_HWS_InsertChkExp_Cache(HWS_ChkCodIni: string; HWS_ChkCodEnd: string; HWS_ChkIdExp: string; const ARequestFilter: string = ''): IDSRestCachedJSONArray;
    function F_HWS_InsertChkPlacas(HWS_filePlacas: TJSONValue; const ARequestFilter: string = ''): TJSONArray;
    function F_HWS_InsertChkPlacas_Cache(HWS_filePlacas: TJSONValue; const ARequestFilter: string = ''): IDSRestCachedJSONArray;
  end;

const
  THWS_ServerMethods_DSServerModuleCreate: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: 'Sender'; Direction: 1; DBXType: 37; TypeName: 'TObject')
  );

  THWS_ServerMethods_DSServerModuleDestroy: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: 'Sender'; Direction: 1; DBXType: 37; TypeName: 'TObject')
  );

  THWS_ServerMethods_F_HWS_RetornaStatusDoCliente: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'HWS_CodCliente'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TJSONArray')
  );

  THWS_ServerMethods_F_HWS_RetornaStatusDoCliente_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'HWS_CodCliente'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  THWS_ServerMethods_F_HWS_ProximoAutoIncBancoCliente: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'Tabela'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'Campo'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'Formato'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  THWS_ServerMethods_F_HWS_GravaPerguntasXRespostas: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'HWS_PerXRes'; Direction: 1; DBXType: 37; TypeName: 'TJSONValue'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TJSONArray')
  );

  THWS_ServerMethods_F_HWS_GravaPerguntasXRespostas_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'HWS_PerXRes'; Direction: 1; DBXType: 37; TypeName: 'TJSONValue'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  THWS_ServerMethods_F_HWS_RevisarCheckList: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'HWS_Codigo'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TJSONArray')
  );

  THWS_ServerMethods_F_HWS_RevisarCheckList_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'HWS_Codigo'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  THWS_ServerMethods_F_HWS_RetornaCheckListPerguntas: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'HWS_App'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDBXReader')
  );

  THWS_ServerMethods_F_HWS_RetornaCheckListPerguntas_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'HWS_App'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  THWS_ServerMethods_F_HWS_RetornaStatusChip: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'HWS_Chip'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TJSONArray')
  );

  THWS_ServerMethods_F_HWS_RetornaStatusChip_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'HWS_Chip'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  THWS_ServerMethods_F_HWS_RetornaVeiculos: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'HWS_Chip'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'HWS_MaxId'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDBXReader')
  );

  THWS_ServerMethods_F_HWS_RetornaVeiculos_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'HWS_Chip'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'HWS_MaxId'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  THWS_ServerMethods_F_HWS_GravaCheckListRealizado: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'HWS_Chip'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'HWS_Dados'; Direction: 1; DBXType: 37; TypeName: 'TJSONArray'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TJSONArray')
  );

  THWS_ServerMethods_F_HWS_GravaCheckListRealizado_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'HWS_Chip'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'HWS_Dados'; Direction: 1; DBXType: 37; TypeName: 'TJSONArray'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  THWS_ServerMethods_F_HWS_RetornaCheckListAtivo: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'HWS_App'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  THWS_ServerMethods_F_HWS_ExisteNovoCheckList: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'HWS_App'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'HWS_CheckListAtual'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TJSONArray')
  );

  THWS_ServerMethods_F_HWS_ExisteNovoCheckList_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'HWS_App'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'HWS_CheckListAtual'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  THWS_ServerMethods_F_HWS_RetornaEstruturaDasPerguntas: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'HWS_CheckList'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDBXReader')
  );

  THWS_ServerMethods_F_HWS_RetornaEstruturaDasPerguntas_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'HWS_CheckList'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  THWS_ServerMethods_F_HWS_PodeExcluirPerguntaFilha: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'HWS_CheckList'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'HWS_Pergunta'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  THWS_ServerMethods_F_HWS_ExcluirPerguntaFilha: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'HWS_CheckList'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'HWS_PerguntaPai'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'HWS_PerguntaFilha'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TJSONArray')
  );

  THWS_ServerMethods_F_HWS_ExcluirPerguntaFilha_Cache: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'HWS_CheckList'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'HWS_PerguntaPai'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'HWS_PerguntaFilha'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  THWS_ServerMethods_F_HWS_PodeExcluirPerguntaReprovacao: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'HWS_CheckList'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'HWS_Pergunta'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  THWS_ServerMethods_F_HWS_PodeExcluirRestricao: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'HWS_CheckList'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'HWS_GrupoPergunta'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  THWS_ServerMethods_F_HWS_ProximoAutoIncBancoHWS: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'Tabela'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'Campo'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'Formato'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  THWS_ServerMethods_F_HWS_RetornaUsuarioDoMobile: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'HWS_CodCliente'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDBXReader')
  );

  THWS_ServerMethods_F_HWS_RetornaUsuarioDoMobile_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'HWS_CodCliente'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  THWS_ServerMethods_F_HWS_RetornaCheckListsRealizados: array [0..6] of TDSRestParameterMetaData =
  (
    (Name: 'HWS_DaData'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'HWS_AteData'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'HWS_DaPlaca'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'HWS_AtePlaca'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'HWS_DoStatus'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'HWS_AteStatus'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDBXReader')
  );

  THWS_ServerMethods_F_HWS_RetornaCheckListsRealizados_Cache: array [0..6] of TDSRestParameterMetaData =
  (
    (Name: 'HWS_DaData'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'HWS_AteData'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'HWS_DaPlaca'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'HWS_AtePlaca'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'HWS_DoStatus'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'HWS_AteStatus'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  THWS_ServerMethods_F_HWS_RetornaChkExp: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'HWS_tipoIni'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'HWS_tipoEnd'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDBXReader')
  );

  THWS_ServerMethods_F_HWS_RetornaChkExp_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'HWS_tipoIni'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'HWS_tipoEnd'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  THWS_ServerMethods_F_HWS_RetornaReExp: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDBXReader')
  );

  THWS_ServerMethods_F_HWS_RetornaReExp_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  THWS_ServerMethods_F_HWS_InsertChkExp: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'HWS_ChkCodIni'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'HWS_ChkCodEnd'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'HWS_ChkIdExp'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TJSONArray')
  );

  THWS_ServerMethods_F_HWS_InsertChkExp_Cache: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'HWS_ChkCodIni'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'HWS_ChkCodEnd'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'HWS_ChkIdExp'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  THWS_ServerMethods_F_HWS_InsertChkPlacas: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'HWS_filePlacas'; Direction: 1; DBXType: 37; TypeName: 'TJSONValue'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TJSONArray')
  );

  THWS_ServerMethods_F_HWS_InsertChkPlacas_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'HWS_filePlacas'; Direction: 1; DBXType: 37; TypeName: 'TJSONValue'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

implementation

procedure THWS_ServerMethodsClient.DSServerModuleCreate(Sender: TObject);
begin
  if FDSServerModuleCreateCommand = nil then
  begin
    FDSServerModuleCreateCommand := FConnection.CreateCommand;
    FDSServerModuleCreateCommand.RequestType := 'POST';
    FDSServerModuleCreateCommand.Text := 'THWS_ServerMethods."DSServerModuleCreate"';
    FDSServerModuleCreateCommand.Prepare(THWS_ServerMethods_DSServerModuleCreate);
  end;
  if not Assigned(Sender) then
    FDSServerModuleCreateCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDSServerModuleCreateCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDSServerModuleCreateCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDSServerModuleCreateCommand.Execute;
end;

procedure THWS_ServerMethodsClient.DSServerModuleDestroy(Sender: TObject);
begin
  if FDSServerModuleDestroyCommand = nil then
  begin
    FDSServerModuleDestroyCommand := FConnection.CreateCommand;
    FDSServerModuleDestroyCommand.RequestType := 'POST';
    FDSServerModuleDestroyCommand.Text := 'THWS_ServerMethods."DSServerModuleDestroy"';
    FDSServerModuleDestroyCommand.Prepare(THWS_ServerMethods_DSServerModuleDestroy);
  end;
  if not Assigned(Sender) then
    FDSServerModuleDestroyCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDSServerModuleDestroyCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDSServerModuleDestroyCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDSServerModuleDestroyCommand.Execute;
end;

function THWS_ServerMethodsClient.F_HWS_RetornaStatusDoCliente(HWS_CodCliente: string; const ARequestFilter: string): TJSONArray;
begin
  if FF_HWS_RetornaStatusDoClienteCommand = nil then
  begin
    FF_HWS_RetornaStatusDoClienteCommand := FConnection.CreateCommand;
    FF_HWS_RetornaStatusDoClienteCommand.RequestType := 'GET';
    FF_HWS_RetornaStatusDoClienteCommand.Text := 'THWS_ServerMethods.F_HWS_RetornaStatusDoCliente';
    FF_HWS_RetornaStatusDoClienteCommand.Prepare(THWS_ServerMethods_F_HWS_RetornaStatusDoCliente);
  end;
  FF_HWS_RetornaStatusDoClienteCommand.Parameters[0].Value.SetWideString(HWS_CodCliente);
  FF_HWS_RetornaStatusDoClienteCommand.Execute(ARequestFilter);
  Result := TJSONArray(FF_HWS_RetornaStatusDoClienteCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
end;

function THWS_ServerMethodsClient.F_HWS_RetornaStatusDoCliente_Cache(HWS_CodCliente: string; const ARequestFilter: string): IDSRestCachedJSONArray;
begin
  if FF_HWS_RetornaStatusDoClienteCommand_Cache = nil then
  begin
    FF_HWS_RetornaStatusDoClienteCommand_Cache := FConnection.CreateCommand;
    FF_HWS_RetornaStatusDoClienteCommand_Cache.RequestType := 'GET';
    FF_HWS_RetornaStatusDoClienteCommand_Cache.Text := 'THWS_ServerMethods.F_HWS_RetornaStatusDoCliente';
    FF_HWS_RetornaStatusDoClienteCommand_Cache.Prepare(THWS_ServerMethods_F_HWS_RetornaStatusDoCliente_Cache);
  end;
  FF_HWS_RetornaStatusDoClienteCommand_Cache.Parameters[0].Value.SetWideString(HWS_CodCliente);
  FF_HWS_RetornaStatusDoClienteCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedJSONArray.Create(FF_HWS_RetornaStatusDoClienteCommand_Cache.Parameters[1].Value.GetString);
end;

function THWS_ServerMethodsClient.F_HWS_ProximoAutoIncBancoCliente(Tabela: string; Campo: string; Formato: string; const ARequestFilter: string): string;
begin
  if FF_HWS_ProximoAutoIncBancoClienteCommand = nil then
  begin
    FF_HWS_ProximoAutoIncBancoClienteCommand := FConnection.CreateCommand;
    FF_HWS_ProximoAutoIncBancoClienteCommand.RequestType := 'GET';
    FF_HWS_ProximoAutoIncBancoClienteCommand.Text := 'THWS_ServerMethods.F_HWS_ProximoAutoIncBancoCliente';
    FF_HWS_ProximoAutoIncBancoClienteCommand.Prepare(THWS_ServerMethods_F_HWS_ProximoAutoIncBancoCliente);
  end;
  FF_HWS_ProximoAutoIncBancoClienteCommand.Parameters[0].Value.SetWideString(Tabela);
  FF_HWS_ProximoAutoIncBancoClienteCommand.Parameters[1].Value.SetWideString(Campo);
  FF_HWS_ProximoAutoIncBancoClienteCommand.Parameters[2].Value.SetWideString(Formato);
  FF_HWS_ProximoAutoIncBancoClienteCommand.Execute(ARequestFilter);
  Result := FF_HWS_ProximoAutoIncBancoClienteCommand.Parameters[3].Value.GetWideString;
end;

function THWS_ServerMethodsClient.F_HWS_GravaPerguntasXRespostas(HWS_PerXRes: TJSONValue; const ARequestFilter: string): TJSONArray;
begin
  if FF_HWS_GravaPerguntasXRespostasCommand = nil then
  begin
    FF_HWS_GravaPerguntasXRespostasCommand := FConnection.CreateCommand;
    FF_HWS_GravaPerguntasXRespostasCommand.RequestType := 'POST';
    FF_HWS_GravaPerguntasXRespostasCommand.Text := 'THWS_ServerMethods."F_HWS_GravaPerguntasXRespostas"';
    FF_HWS_GravaPerguntasXRespostasCommand.Prepare(THWS_ServerMethods_F_HWS_GravaPerguntasXRespostas);
  end;
  FF_HWS_GravaPerguntasXRespostasCommand.Parameters[0].Value.SetJSONValue(HWS_PerXRes, FInstanceOwner);
  FF_HWS_GravaPerguntasXRespostasCommand.Execute(ARequestFilter);
  Result := TJSONArray(FF_HWS_GravaPerguntasXRespostasCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
end;

function THWS_ServerMethodsClient.F_HWS_GravaPerguntasXRespostas_Cache(HWS_PerXRes: TJSONValue; const ARequestFilter: string): IDSRestCachedJSONArray;
begin
  if FF_HWS_GravaPerguntasXRespostasCommand_Cache = nil then
  begin
    FF_HWS_GravaPerguntasXRespostasCommand_Cache := FConnection.CreateCommand;
    FF_HWS_GravaPerguntasXRespostasCommand_Cache.RequestType := 'POST';
    FF_HWS_GravaPerguntasXRespostasCommand_Cache.Text := 'THWS_ServerMethods."F_HWS_GravaPerguntasXRespostas"';
    FF_HWS_GravaPerguntasXRespostasCommand_Cache.Prepare(THWS_ServerMethods_F_HWS_GravaPerguntasXRespostas_Cache);
  end;
  FF_HWS_GravaPerguntasXRespostasCommand_Cache.Parameters[0].Value.SetJSONValue(HWS_PerXRes, FInstanceOwner);
  FF_HWS_GravaPerguntasXRespostasCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedJSONArray.Create(FF_HWS_GravaPerguntasXRespostasCommand_Cache.Parameters[1].Value.GetString);
end;

function THWS_ServerMethodsClient.F_HWS_RevisarCheckList(HWS_Codigo: string; const ARequestFilter: string): TJSONArray;
begin
  if FF_HWS_RevisarCheckListCommand = nil then
  begin
    FF_HWS_RevisarCheckListCommand := FConnection.CreateCommand;
    FF_HWS_RevisarCheckListCommand.RequestType := 'GET';
    FF_HWS_RevisarCheckListCommand.Text := 'THWS_ServerMethods.F_HWS_RevisarCheckList';
    FF_HWS_RevisarCheckListCommand.Prepare(THWS_ServerMethods_F_HWS_RevisarCheckList);
  end;
  FF_HWS_RevisarCheckListCommand.Parameters[0].Value.SetWideString(HWS_Codigo);
  FF_HWS_RevisarCheckListCommand.Execute(ARequestFilter);
  Result := TJSONArray(FF_HWS_RevisarCheckListCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
end;

function THWS_ServerMethodsClient.F_HWS_RevisarCheckList_Cache(HWS_Codigo: string; const ARequestFilter: string): IDSRestCachedJSONArray;
begin
  if FF_HWS_RevisarCheckListCommand_Cache = nil then
  begin
    FF_HWS_RevisarCheckListCommand_Cache := FConnection.CreateCommand;
    FF_HWS_RevisarCheckListCommand_Cache.RequestType := 'GET';
    FF_HWS_RevisarCheckListCommand_Cache.Text := 'THWS_ServerMethods.F_HWS_RevisarCheckList';
    FF_HWS_RevisarCheckListCommand_Cache.Prepare(THWS_ServerMethods_F_HWS_RevisarCheckList_Cache);
  end;
  FF_HWS_RevisarCheckListCommand_Cache.Parameters[0].Value.SetWideString(HWS_Codigo);
  FF_HWS_RevisarCheckListCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedJSONArray.Create(FF_HWS_RevisarCheckListCommand_Cache.Parameters[1].Value.GetString);
end;

function THWS_ServerMethodsClient.F_HWS_RetornaCheckListPerguntas(HWS_App: string; const ARequestFilter: string): TDBXReader;
begin
  if FF_HWS_RetornaCheckListPerguntasCommand = nil then
  begin
    FF_HWS_RetornaCheckListPerguntasCommand := FConnection.CreateCommand;
    FF_HWS_RetornaCheckListPerguntasCommand.RequestType := 'GET';
    FF_HWS_RetornaCheckListPerguntasCommand.Text := 'THWS_ServerMethods.F_HWS_RetornaCheckListPerguntas';
    FF_HWS_RetornaCheckListPerguntasCommand.Prepare(THWS_ServerMethods_F_HWS_RetornaCheckListPerguntas);
  end;
  FF_HWS_RetornaCheckListPerguntasCommand.Parameters[0].Value.SetWideString(HWS_App);
  FF_HWS_RetornaCheckListPerguntasCommand.Execute(ARequestFilter);
  Result := FF_HWS_RetornaCheckListPerguntasCommand.Parameters[1].Value.GetDBXReader(FInstanceOwner);
end;

function THWS_ServerMethodsClient.F_HWS_RetornaCheckListPerguntas_Cache(HWS_App: string; const ARequestFilter: string): IDSRestCachedDBXReader;
begin
  if FF_HWS_RetornaCheckListPerguntasCommand_Cache = nil then
  begin
    FF_HWS_RetornaCheckListPerguntasCommand_Cache := FConnection.CreateCommand;
    FF_HWS_RetornaCheckListPerguntasCommand_Cache.RequestType := 'GET';
    FF_HWS_RetornaCheckListPerguntasCommand_Cache.Text := 'THWS_ServerMethods.F_HWS_RetornaCheckListPerguntas';
    FF_HWS_RetornaCheckListPerguntasCommand_Cache.Prepare(THWS_ServerMethods_F_HWS_RetornaCheckListPerguntas_Cache);
  end;
  FF_HWS_RetornaCheckListPerguntasCommand_Cache.Parameters[0].Value.SetWideString(HWS_App);
  FF_HWS_RetornaCheckListPerguntasCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDBXReader.Create(FF_HWS_RetornaCheckListPerguntasCommand_Cache.Parameters[1].Value.GetString);
end;

function THWS_ServerMethodsClient.F_HWS_RetornaStatusChip(HWS_Chip: string; const ARequestFilter: string): TJSONArray;
begin
  if FF_HWS_RetornaStatusChipCommand = nil then
  begin
    FF_HWS_RetornaStatusChipCommand := FConnection.CreateCommand;
    FF_HWS_RetornaStatusChipCommand.RequestType := 'GET';
    FF_HWS_RetornaStatusChipCommand.Text := 'THWS_ServerMethods.F_HWS_RetornaStatusChip';
    FF_HWS_RetornaStatusChipCommand.Prepare(THWS_ServerMethods_F_HWS_RetornaStatusChip);
  end;
  FF_HWS_RetornaStatusChipCommand.Parameters[0].Value.SetWideString(HWS_Chip);
  FF_HWS_RetornaStatusChipCommand.Execute(ARequestFilter);
  Result := TJSONArray(FF_HWS_RetornaStatusChipCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
end;

function THWS_ServerMethodsClient.F_HWS_RetornaStatusChip_Cache(HWS_Chip: string; const ARequestFilter: string): IDSRestCachedJSONArray;
begin
  if FF_HWS_RetornaStatusChipCommand_Cache = nil then
  begin
    FF_HWS_RetornaStatusChipCommand_Cache := FConnection.CreateCommand;
    FF_HWS_RetornaStatusChipCommand_Cache.RequestType := 'GET';
    FF_HWS_RetornaStatusChipCommand_Cache.Text := 'THWS_ServerMethods.F_HWS_RetornaStatusChip';
    FF_HWS_RetornaStatusChipCommand_Cache.Prepare(THWS_ServerMethods_F_HWS_RetornaStatusChip_Cache);
  end;
  FF_HWS_RetornaStatusChipCommand_Cache.Parameters[0].Value.SetWideString(HWS_Chip);
  FF_HWS_RetornaStatusChipCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedJSONArray.Create(FF_HWS_RetornaStatusChipCommand_Cache.Parameters[1].Value.GetString);
end;

function THWS_ServerMethodsClient.F_HWS_RetornaVeiculos(HWS_Chip: string; HWS_MaxId: string; const ARequestFilter: string): TDBXReader;
begin
  if FF_HWS_RetornaVeiculosCommand = nil then
  begin
    FF_HWS_RetornaVeiculosCommand := FConnection.CreateCommand;
    FF_HWS_RetornaVeiculosCommand.RequestType := 'GET';
    FF_HWS_RetornaVeiculosCommand.Text := 'THWS_ServerMethods.F_HWS_RetornaVeiculos';
    FF_HWS_RetornaVeiculosCommand.Prepare(THWS_ServerMethods_F_HWS_RetornaVeiculos);
  end;
  FF_HWS_RetornaVeiculosCommand.Parameters[0].Value.SetWideString(HWS_Chip);
  FF_HWS_RetornaVeiculosCommand.Parameters[1].Value.SetWideString(HWS_MaxId);
  FF_HWS_RetornaVeiculosCommand.Execute(ARequestFilter);
  Result := FF_HWS_RetornaVeiculosCommand.Parameters[2].Value.GetDBXReader(FInstanceOwner);
end;

function THWS_ServerMethodsClient.F_HWS_RetornaVeiculos_Cache(HWS_Chip: string; HWS_MaxId: string; const ARequestFilter: string): IDSRestCachedDBXReader;
begin
  if FF_HWS_RetornaVeiculosCommand_Cache = nil then
  begin
    FF_HWS_RetornaVeiculosCommand_Cache := FConnection.CreateCommand;
    FF_HWS_RetornaVeiculosCommand_Cache.RequestType := 'GET';
    FF_HWS_RetornaVeiculosCommand_Cache.Text := 'THWS_ServerMethods.F_HWS_RetornaVeiculos';
    FF_HWS_RetornaVeiculosCommand_Cache.Prepare(THWS_ServerMethods_F_HWS_RetornaVeiculos_Cache);
  end;
  FF_HWS_RetornaVeiculosCommand_Cache.Parameters[0].Value.SetWideString(HWS_Chip);
  FF_HWS_RetornaVeiculosCommand_Cache.Parameters[1].Value.SetWideString(HWS_MaxId);
  FF_HWS_RetornaVeiculosCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDBXReader.Create(FF_HWS_RetornaVeiculosCommand_Cache.Parameters[2].Value.GetString);
end;

function THWS_ServerMethodsClient.F_HWS_GravaCheckListRealizado(HWS_Chip: string; HWS_Dados: TJSONArray; const ARequestFilter: string): TJSONArray;
begin
  if FF_HWS_GravaCheckListRealizadoCommand = nil then
  begin
    FF_HWS_GravaCheckListRealizadoCommand := FConnection.CreateCommand;
    FF_HWS_GravaCheckListRealizadoCommand.RequestType := 'POST';
    FF_HWS_GravaCheckListRealizadoCommand.Text := 'THWS_ServerMethods."F_HWS_GravaCheckListRealizado"';
    FF_HWS_GravaCheckListRealizadoCommand.Prepare(THWS_ServerMethods_F_HWS_GravaCheckListRealizado);
  end;
  FF_HWS_GravaCheckListRealizadoCommand.Parameters[0].Value.SetWideString(HWS_Chip);
  FF_HWS_GravaCheckListRealizadoCommand.Parameters[1].Value.SetJSONValue(HWS_Dados, FInstanceOwner);
  FF_HWS_GravaCheckListRealizadoCommand.Execute(ARequestFilter);
  Result := TJSONArray(FF_HWS_GravaCheckListRealizadoCommand.Parameters[2].Value.GetJSONValue(FInstanceOwner));
end;

function THWS_ServerMethodsClient.F_HWS_GravaCheckListRealizado_Cache(HWS_Chip: string; HWS_Dados: TJSONArray; const ARequestFilter: string): IDSRestCachedJSONArray;
begin
  if FF_HWS_GravaCheckListRealizadoCommand_Cache = nil then
  begin
    FF_HWS_GravaCheckListRealizadoCommand_Cache := FConnection.CreateCommand;
    FF_HWS_GravaCheckListRealizadoCommand_Cache.RequestType := 'POST';
    FF_HWS_GravaCheckListRealizadoCommand_Cache.Text := 'THWS_ServerMethods."F_HWS_GravaCheckListRealizado"';
    FF_HWS_GravaCheckListRealizadoCommand_Cache.Prepare(THWS_ServerMethods_F_HWS_GravaCheckListRealizado_Cache);
  end;
  FF_HWS_GravaCheckListRealizadoCommand_Cache.Parameters[0].Value.SetWideString(HWS_Chip);
  FF_HWS_GravaCheckListRealizadoCommand_Cache.Parameters[1].Value.SetJSONValue(HWS_Dados, FInstanceOwner);
  FF_HWS_GravaCheckListRealizadoCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedJSONArray.Create(FF_HWS_GravaCheckListRealizadoCommand_Cache.Parameters[2].Value.GetString);
end;

function THWS_ServerMethodsClient.F_HWS_RetornaCheckListAtivo(HWS_App: string; const ARequestFilter: string): string;
begin
  if FF_HWS_RetornaCheckListAtivoCommand = nil then
  begin
    FF_HWS_RetornaCheckListAtivoCommand := FConnection.CreateCommand;
    FF_HWS_RetornaCheckListAtivoCommand.RequestType := 'GET';
    FF_HWS_RetornaCheckListAtivoCommand.Text := 'THWS_ServerMethods.F_HWS_RetornaCheckListAtivo';
    FF_HWS_RetornaCheckListAtivoCommand.Prepare(THWS_ServerMethods_F_HWS_RetornaCheckListAtivo);
  end;
  FF_HWS_RetornaCheckListAtivoCommand.Parameters[0].Value.SetWideString(HWS_App);
  FF_HWS_RetornaCheckListAtivoCommand.Execute(ARequestFilter);
  Result := FF_HWS_RetornaCheckListAtivoCommand.Parameters[1].Value.GetWideString;
end;

function THWS_ServerMethodsClient.F_HWS_ExisteNovoCheckList(HWS_App: string; HWS_CheckListAtual: string; const ARequestFilter: string): TJSONArray;
begin
  if FF_HWS_ExisteNovoCheckListCommand = nil then
  begin
    FF_HWS_ExisteNovoCheckListCommand := FConnection.CreateCommand;
    FF_HWS_ExisteNovoCheckListCommand.RequestType := 'GET';
    FF_HWS_ExisteNovoCheckListCommand.Text := 'THWS_ServerMethods.F_HWS_ExisteNovoCheckList';
    FF_HWS_ExisteNovoCheckListCommand.Prepare(THWS_ServerMethods_F_HWS_ExisteNovoCheckList);
  end;
  FF_HWS_ExisteNovoCheckListCommand.Parameters[0].Value.SetWideString(HWS_App);
  FF_HWS_ExisteNovoCheckListCommand.Parameters[1].Value.SetWideString(HWS_CheckListAtual);
  FF_HWS_ExisteNovoCheckListCommand.Execute(ARequestFilter);
  Result := TJSONArray(FF_HWS_ExisteNovoCheckListCommand.Parameters[2].Value.GetJSONValue(FInstanceOwner));
end;

function THWS_ServerMethodsClient.F_HWS_ExisteNovoCheckList_Cache(HWS_App: string; HWS_CheckListAtual: string; const ARequestFilter: string): IDSRestCachedJSONArray;
begin
  if FF_HWS_ExisteNovoCheckListCommand_Cache = nil then
  begin
    FF_HWS_ExisteNovoCheckListCommand_Cache := FConnection.CreateCommand;
    FF_HWS_ExisteNovoCheckListCommand_Cache.RequestType := 'GET';
    FF_HWS_ExisteNovoCheckListCommand_Cache.Text := 'THWS_ServerMethods.F_HWS_ExisteNovoCheckList';
    FF_HWS_ExisteNovoCheckListCommand_Cache.Prepare(THWS_ServerMethods_F_HWS_ExisteNovoCheckList_Cache);
  end;
  FF_HWS_ExisteNovoCheckListCommand_Cache.Parameters[0].Value.SetWideString(HWS_App);
  FF_HWS_ExisteNovoCheckListCommand_Cache.Parameters[1].Value.SetWideString(HWS_CheckListAtual);
  FF_HWS_ExisteNovoCheckListCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedJSONArray.Create(FF_HWS_ExisteNovoCheckListCommand_Cache.Parameters[2].Value.GetString);
end;

function THWS_ServerMethodsClient.F_HWS_RetornaEstruturaDasPerguntas(HWS_CheckList: string; const ARequestFilter: string): TDBXReader;
begin
  if FF_HWS_RetornaEstruturaDasPerguntasCommand = nil then
  begin
    FF_HWS_RetornaEstruturaDasPerguntasCommand := FConnection.CreateCommand;
    FF_HWS_RetornaEstruturaDasPerguntasCommand.RequestType := 'GET';
    FF_HWS_RetornaEstruturaDasPerguntasCommand.Text := 'THWS_ServerMethods.F_HWS_RetornaEstruturaDasPerguntas';
    FF_HWS_RetornaEstruturaDasPerguntasCommand.Prepare(THWS_ServerMethods_F_HWS_RetornaEstruturaDasPerguntas);
  end;
  FF_HWS_RetornaEstruturaDasPerguntasCommand.Parameters[0].Value.SetWideString(HWS_CheckList);
  FF_HWS_RetornaEstruturaDasPerguntasCommand.Execute(ARequestFilter);
  Result := FF_HWS_RetornaEstruturaDasPerguntasCommand.Parameters[1].Value.GetDBXReader(FInstanceOwner);
end;

function THWS_ServerMethodsClient.F_HWS_RetornaEstruturaDasPerguntas_Cache(HWS_CheckList: string; const ARequestFilter: string): IDSRestCachedDBXReader;
begin
  if FF_HWS_RetornaEstruturaDasPerguntasCommand_Cache = nil then
  begin
    FF_HWS_RetornaEstruturaDasPerguntasCommand_Cache := FConnection.CreateCommand;
    FF_HWS_RetornaEstruturaDasPerguntasCommand_Cache.RequestType := 'GET';
    FF_HWS_RetornaEstruturaDasPerguntasCommand_Cache.Text := 'THWS_ServerMethods.F_HWS_RetornaEstruturaDasPerguntas';
    FF_HWS_RetornaEstruturaDasPerguntasCommand_Cache.Prepare(THWS_ServerMethods_F_HWS_RetornaEstruturaDasPerguntas_Cache);
  end;
  FF_HWS_RetornaEstruturaDasPerguntasCommand_Cache.Parameters[0].Value.SetWideString(HWS_CheckList);
  FF_HWS_RetornaEstruturaDasPerguntasCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDBXReader.Create(FF_HWS_RetornaEstruturaDasPerguntasCommand_Cache.Parameters[1].Value.GetString);
end;

function THWS_ServerMethodsClient.F_HWS_PodeExcluirPerguntaFilha(HWS_CheckList: string; HWS_Pergunta: string; const ARequestFilter: string): string;
begin
  if FF_HWS_PodeExcluirPerguntaFilhaCommand = nil then
  begin
    FF_HWS_PodeExcluirPerguntaFilhaCommand := FConnection.CreateCommand;
    FF_HWS_PodeExcluirPerguntaFilhaCommand.RequestType := 'GET';
    FF_HWS_PodeExcluirPerguntaFilhaCommand.Text := 'THWS_ServerMethods.F_HWS_PodeExcluirPerguntaFilha';
    FF_HWS_PodeExcluirPerguntaFilhaCommand.Prepare(THWS_ServerMethods_F_HWS_PodeExcluirPerguntaFilha);
  end;
  FF_HWS_PodeExcluirPerguntaFilhaCommand.Parameters[0].Value.SetWideString(HWS_CheckList);
  FF_HWS_PodeExcluirPerguntaFilhaCommand.Parameters[1].Value.SetWideString(HWS_Pergunta);
  FF_HWS_PodeExcluirPerguntaFilhaCommand.Execute(ARequestFilter);
  Result := FF_HWS_PodeExcluirPerguntaFilhaCommand.Parameters[2].Value.GetWideString;
end;

function THWS_ServerMethodsClient.F_HWS_ExcluirPerguntaFilha(HWS_CheckList: string; HWS_PerguntaPai: string; HWS_PerguntaFilha: string; const ARequestFilter: string): TJSONArray;
begin
  if FF_HWS_ExcluirPerguntaFilhaCommand = nil then
  begin
    FF_HWS_ExcluirPerguntaFilhaCommand := FConnection.CreateCommand;
    FF_HWS_ExcluirPerguntaFilhaCommand.RequestType := 'GET';
    FF_HWS_ExcluirPerguntaFilhaCommand.Text := 'THWS_ServerMethods.F_HWS_ExcluirPerguntaFilha';
    FF_HWS_ExcluirPerguntaFilhaCommand.Prepare(THWS_ServerMethods_F_HWS_ExcluirPerguntaFilha);
  end;
  FF_HWS_ExcluirPerguntaFilhaCommand.Parameters[0].Value.SetWideString(HWS_CheckList);
  FF_HWS_ExcluirPerguntaFilhaCommand.Parameters[1].Value.SetWideString(HWS_PerguntaPai);
  FF_HWS_ExcluirPerguntaFilhaCommand.Parameters[2].Value.SetWideString(HWS_PerguntaFilha);
  FF_HWS_ExcluirPerguntaFilhaCommand.Execute(ARequestFilter);
  Result := TJSONArray(FF_HWS_ExcluirPerguntaFilhaCommand.Parameters[3].Value.GetJSONValue(FInstanceOwner));
end;

function THWS_ServerMethodsClient.F_HWS_ExcluirPerguntaFilha_Cache(HWS_CheckList: string; HWS_PerguntaPai: string; HWS_PerguntaFilha: string; const ARequestFilter: string): IDSRestCachedJSONArray;
begin
  if FF_HWS_ExcluirPerguntaFilhaCommand_Cache = nil then
  begin
    FF_HWS_ExcluirPerguntaFilhaCommand_Cache := FConnection.CreateCommand;
    FF_HWS_ExcluirPerguntaFilhaCommand_Cache.RequestType := 'GET';
    FF_HWS_ExcluirPerguntaFilhaCommand_Cache.Text := 'THWS_ServerMethods.F_HWS_ExcluirPerguntaFilha';
    FF_HWS_ExcluirPerguntaFilhaCommand_Cache.Prepare(THWS_ServerMethods_F_HWS_ExcluirPerguntaFilha_Cache);
  end;
  FF_HWS_ExcluirPerguntaFilhaCommand_Cache.Parameters[0].Value.SetWideString(HWS_CheckList);
  FF_HWS_ExcluirPerguntaFilhaCommand_Cache.Parameters[1].Value.SetWideString(HWS_PerguntaPai);
  FF_HWS_ExcluirPerguntaFilhaCommand_Cache.Parameters[2].Value.SetWideString(HWS_PerguntaFilha);
  FF_HWS_ExcluirPerguntaFilhaCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedJSONArray.Create(FF_HWS_ExcluirPerguntaFilhaCommand_Cache.Parameters[3].Value.GetString);
end;

function THWS_ServerMethodsClient.F_HWS_PodeExcluirPerguntaReprovacao(HWS_CheckList: string; HWS_Pergunta: string; const ARequestFilter: string): string;
begin
  if FF_HWS_PodeExcluirPerguntaReprovacaoCommand = nil then
  begin
    FF_HWS_PodeExcluirPerguntaReprovacaoCommand := FConnection.CreateCommand;
    FF_HWS_PodeExcluirPerguntaReprovacaoCommand.RequestType := 'GET';
    FF_HWS_PodeExcluirPerguntaReprovacaoCommand.Text := 'THWS_ServerMethods.F_HWS_PodeExcluirPerguntaReprovacao';
    FF_HWS_PodeExcluirPerguntaReprovacaoCommand.Prepare(THWS_ServerMethods_F_HWS_PodeExcluirPerguntaReprovacao);
  end;
  FF_HWS_PodeExcluirPerguntaReprovacaoCommand.Parameters[0].Value.SetWideString(HWS_CheckList);
  FF_HWS_PodeExcluirPerguntaReprovacaoCommand.Parameters[1].Value.SetWideString(HWS_Pergunta);
  FF_HWS_PodeExcluirPerguntaReprovacaoCommand.Execute(ARequestFilter);
  Result := FF_HWS_PodeExcluirPerguntaReprovacaoCommand.Parameters[2].Value.GetWideString;
end;

function THWS_ServerMethodsClient.F_HWS_PodeExcluirRestricao(HWS_CheckList: string; HWS_GrupoPergunta: string; const ARequestFilter: string): string;
begin
  if FF_HWS_PodeExcluirRestricaoCommand = nil then
  begin
    FF_HWS_PodeExcluirRestricaoCommand := FConnection.CreateCommand;
    FF_HWS_PodeExcluirRestricaoCommand.RequestType := 'GET';
    FF_HWS_PodeExcluirRestricaoCommand.Text := 'THWS_ServerMethods.F_HWS_PodeExcluirRestricao';
    FF_HWS_PodeExcluirRestricaoCommand.Prepare(THWS_ServerMethods_F_HWS_PodeExcluirRestricao);
  end;
  FF_HWS_PodeExcluirRestricaoCommand.Parameters[0].Value.SetWideString(HWS_CheckList);
  FF_HWS_PodeExcluirRestricaoCommand.Parameters[1].Value.SetWideString(HWS_GrupoPergunta);
  FF_HWS_PodeExcluirRestricaoCommand.Execute(ARequestFilter);
  Result := FF_HWS_PodeExcluirRestricaoCommand.Parameters[2].Value.GetWideString;
end;

function THWS_ServerMethodsClient.F_HWS_ProximoAutoIncBancoHWS(Tabela: string; Campo: string; Formato: string; const ARequestFilter: string): string;
begin
  if FF_HWS_ProximoAutoIncBancoHWSCommand = nil then
  begin
    FF_HWS_ProximoAutoIncBancoHWSCommand := FConnection.CreateCommand;
    FF_HWS_ProximoAutoIncBancoHWSCommand.RequestType := 'GET';
    FF_HWS_ProximoAutoIncBancoHWSCommand.Text := 'THWS_ServerMethods.F_HWS_ProximoAutoIncBancoHWS';
    FF_HWS_ProximoAutoIncBancoHWSCommand.Prepare(THWS_ServerMethods_F_HWS_ProximoAutoIncBancoHWS);
  end;
  FF_HWS_ProximoAutoIncBancoHWSCommand.Parameters[0].Value.SetWideString(Tabela);
  FF_HWS_ProximoAutoIncBancoHWSCommand.Parameters[1].Value.SetWideString(Campo);
  FF_HWS_ProximoAutoIncBancoHWSCommand.Parameters[2].Value.SetWideString(Formato);
  FF_HWS_ProximoAutoIncBancoHWSCommand.Execute(ARequestFilter);
  Result := FF_HWS_ProximoAutoIncBancoHWSCommand.Parameters[3].Value.GetWideString;
end;

function THWS_ServerMethodsClient.F_HWS_RetornaUsuarioDoMobile(HWS_CodCliente: string; const ARequestFilter: string): TDBXReader;
begin
  if FF_HWS_RetornaUsuarioDoMobileCommand = nil then
  begin
    FF_HWS_RetornaUsuarioDoMobileCommand := FConnection.CreateCommand;
    FF_HWS_RetornaUsuarioDoMobileCommand.RequestType := 'GET';
    FF_HWS_RetornaUsuarioDoMobileCommand.Text := 'THWS_ServerMethods.F_HWS_RetornaUsuarioDoMobile';
    FF_HWS_RetornaUsuarioDoMobileCommand.Prepare(THWS_ServerMethods_F_HWS_RetornaUsuarioDoMobile);
  end;
  FF_HWS_RetornaUsuarioDoMobileCommand.Parameters[0].Value.SetWideString(HWS_CodCliente);
  FF_HWS_RetornaUsuarioDoMobileCommand.Execute(ARequestFilter);
  Result := FF_HWS_RetornaUsuarioDoMobileCommand.Parameters[1].Value.GetDBXReader(FInstanceOwner);
end;

function THWS_ServerMethodsClient.F_HWS_RetornaUsuarioDoMobile_Cache(HWS_CodCliente: string; const ARequestFilter: string): IDSRestCachedDBXReader;
begin
  if FF_HWS_RetornaUsuarioDoMobileCommand_Cache = nil then
  begin
    FF_HWS_RetornaUsuarioDoMobileCommand_Cache := FConnection.CreateCommand;
    FF_HWS_RetornaUsuarioDoMobileCommand_Cache.RequestType := 'GET';
    FF_HWS_RetornaUsuarioDoMobileCommand_Cache.Text := 'THWS_ServerMethods.F_HWS_RetornaUsuarioDoMobile';
    FF_HWS_RetornaUsuarioDoMobileCommand_Cache.Prepare(THWS_ServerMethods_F_HWS_RetornaUsuarioDoMobile_Cache);
  end;
  FF_HWS_RetornaUsuarioDoMobileCommand_Cache.Parameters[0].Value.SetWideString(HWS_CodCliente);
  FF_HWS_RetornaUsuarioDoMobileCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDBXReader.Create(FF_HWS_RetornaUsuarioDoMobileCommand_Cache.Parameters[1].Value.GetString);
end;

function THWS_ServerMethodsClient.F_HWS_RetornaCheckListsRealizados(HWS_DaData: string; HWS_AteData: string; HWS_DaPlaca: string; HWS_AtePlaca: string; HWS_DoStatus: string; HWS_AteStatus: string; const ARequestFilter: string): TDBXReader;
begin
  if FF_HWS_RetornaCheckListsRealizadosCommand = nil then
  begin
    FF_HWS_RetornaCheckListsRealizadosCommand := FConnection.CreateCommand;
    FF_HWS_RetornaCheckListsRealizadosCommand.RequestType := 'GET';
    FF_HWS_RetornaCheckListsRealizadosCommand.Text := 'THWS_ServerMethods.F_HWS_RetornaCheckListsRealizados';
    FF_HWS_RetornaCheckListsRealizadosCommand.Prepare(THWS_ServerMethods_F_HWS_RetornaCheckListsRealizados);
  end;
  FF_HWS_RetornaCheckListsRealizadosCommand.Parameters[0].Value.SetWideString(HWS_DaData);
  FF_HWS_RetornaCheckListsRealizadosCommand.Parameters[1].Value.SetWideString(HWS_AteData);
  FF_HWS_RetornaCheckListsRealizadosCommand.Parameters[2].Value.SetWideString(HWS_DaPlaca);
  FF_HWS_RetornaCheckListsRealizadosCommand.Parameters[3].Value.SetWideString(HWS_AtePlaca);
  FF_HWS_RetornaCheckListsRealizadosCommand.Parameters[4].Value.SetWideString(HWS_DoStatus);
  FF_HWS_RetornaCheckListsRealizadosCommand.Parameters[5].Value.SetWideString(HWS_AteStatus);
  FF_HWS_RetornaCheckListsRealizadosCommand.Execute(ARequestFilter);
  Result := FF_HWS_RetornaCheckListsRealizadosCommand.Parameters[6].Value.GetDBXReader(FInstanceOwner);
end;

function THWS_ServerMethodsClient.F_HWS_RetornaCheckListsRealizados_Cache(HWS_DaData: string; HWS_AteData: string; HWS_DaPlaca: string; HWS_AtePlaca: string; HWS_DoStatus: string; HWS_AteStatus: string; const ARequestFilter: string): IDSRestCachedDBXReader;
begin
  if FF_HWS_RetornaCheckListsRealizadosCommand_Cache = nil then
  begin
    FF_HWS_RetornaCheckListsRealizadosCommand_Cache := FConnection.CreateCommand;
    FF_HWS_RetornaCheckListsRealizadosCommand_Cache.RequestType := 'GET';
    FF_HWS_RetornaCheckListsRealizadosCommand_Cache.Text := 'THWS_ServerMethods.F_HWS_RetornaCheckListsRealizados';
    FF_HWS_RetornaCheckListsRealizadosCommand_Cache.Prepare(THWS_ServerMethods_F_HWS_RetornaCheckListsRealizados_Cache);
  end;
  FF_HWS_RetornaCheckListsRealizadosCommand_Cache.Parameters[0].Value.SetWideString(HWS_DaData);
  FF_HWS_RetornaCheckListsRealizadosCommand_Cache.Parameters[1].Value.SetWideString(HWS_AteData);
  FF_HWS_RetornaCheckListsRealizadosCommand_Cache.Parameters[2].Value.SetWideString(HWS_DaPlaca);
  FF_HWS_RetornaCheckListsRealizadosCommand_Cache.Parameters[3].Value.SetWideString(HWS_AtePlaca);
  FF_HWS_RetornaCheckListsRealizadosCommand_Cache.Parameters[4].Value.SetWideString(HWS_DoStatus);
  FF_HWS_RetornaCheckListsRealizadosCommand_Cache.Parameters[5].Value.SetWideString(HWS_AteStatus);
  FF_HWS_RetornaCheckListsRealizadosCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDBXReader.Create(FF_HWS_RetornaCheckListsRealizadosCommand_Cache.Parameters[6].Value.GetString);
end;

function THWS_ServerMethodsClient.F_HWS_RetornaChkExp(HWS_tipoIni: string; HWS_tipoEnd: string; const ARequestFilter: string): TDBXReader;
begin
  if FF_HWS_RetornaChkExpCommand = nil then
  begin
    FF_HWS_RetornaChkExpCommand := FConnection.CreateCommand;
    FF_HWS_RetornaChkExpCommand.RequestType := 'GET';
    FF_HWS_RetornaChkExpCommand.Text := 'THWS_ServerMethods.F_HWS_RetornaChkExp';
    FF_HWS_RetornaChkExpCommand.Prepare(THWS_ServerMethods_F_HWS_RetornaChkExp);
  end;
  FF_HWS_RetornaChkExpCommand.Parameters[0].Value.SetWideString(HWS_tipoIni);
  FF_HWS_RetornaChkExpCommand.Parameters[1].Value.SetWideString(HWS_tipoEnd);
  FF_HWS_RetornaChkExpCommand.Execute(ARequestFilter);
  Result := FF_HWS_RetornaChkExpCommand.Parameters[2].Value.GetDBXReader(FInstanceOwner);
end;

function THWS_ServerMethodsClient.F_HWS_RetornaChkExp_Cache(HWS_tipoIni: string; HWS_tipoEnd: string; const ARequestFilter: string): IDSRestCachedDBXReader;
begin
  if FF_HWS_RetornaChkExpCommand_Cache = nil then
  begin
    FF_HWS_RetornaChkExpCommand_Cache := FConnection.CreateCommand;
    FF_HWS_RetornaChkExpCommand_Cache.RequestType := 'GET';
    FF_HWS_RetornaChkExpCommand_Cache.Text := 'THWS_ServerMethods.F_HWS_RetornaChkExp';
    FF_HWS_RetornaChkExpCommand_Cache.Prepare(THWS_ServerMethods_F_HWS_RetornaChkExp_Cache);
  end;
  FF_HWS_RetornaChkExpCommand_Cache.Parameters[0].Value.SetWideString(HWS_tipoIni);
  FF_HWS_RetornaChkExpCommand_Cache.Parameters[1].Value.SetWideString(HWS_tipoEnd);
  FF_HWS_RetornaChkExpCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDBXReader.Create(FF_HWS_RetornaChkExpCommand_Cache.Parameters[2].Value.GetString);
end;

function THWS_ServerMethodsClient.F_HWS_RetornaReExp(const ARequestFilter: string): TDBXReader;
begin
  if FF_HWS_RetornaReExpCommand = nil then
  begin
    FF_HWS_RetornaReExpCommand := FConnection.CreateCommand;
    FF_HWS_RetornaReExpCommand.RequestType := 'GET';
    FF_HWS_RetornaReExpCommand.Text := 'THWS_ServerMethods.F_HWS_RetornaReExp';
    FF_HWS_RetornaReExpCommand.Prepare(THWS_ServerMethods_F_HWS_RetornaReExp);
  end;
  FF_HWS_RetornaReExpCommand.Execute(ARequestFilter);
  Result := FF_HWS_RetornaReExpCommand.Parameters[0].Value.GetDBXReader(FInstanceOwner);
end;

function THWS_ServerMethodsClient.F_HWS_RetornaReExp_Cache(const ARequestFilter: string): IDSRestCachedDBXReader;
begin
  if FF_HWS_RetornaReExpCommand_Cache = nil then
  begin
    FF_HWS_RetornaReExpCommand_Cache := FConnection.CreateCommand;
    FF_HWS_RetornaReExpCommand_Cache.RequestType := 'GET';
    FF_HWS_RetornaReExpCommand_Cache.Text := 'THWS_ServerMethods.F_HWS_RetornaReExp';
    FF_HWS_RetornaReExpCommand_Cache.Prepare(THWS_ServerMethods_F_HWS_RetornaReExp_Cache);
  end;
  FF_HWS_RetornaReExpCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDBXReader.Create(FF_HWS_RetornaReExpCommand_Cache.Parameters[0].Value.GetString);
end;

function THWS_ServerMethodsClient.F_HWS_InsertChkExp(HWS_ChkCodIni: string; HWS_ChkCodEnd: string; HWS_ChkIdExp: string; const ARequestFilter: string): TJSONArray;
begin
  if FF_HWS_InsertChkExpCommand = nil then
  begin
    FF_HWS_InsertChkExpCommand := FConnection.CreateCommand;
    FF_HWS_InsertChkExpCommand.RequestType := 'GET';
    FF_HWS_InsertChkExpCommand.Text := 'THWS_ServerMethods.F_HWS_InsertChkExp';
    FF_HWS_InsertChkExpCommand.Prepare(THWS_ServerMethods_F_HWS_InsertChkExp);
  end;
  FF_HWS_InsertChkExpCommand.Parameters[0].Value.SetWideString(HWS_ChkCodIni);
  FF_HWS_InsertChkExpCommand.Parameters[1].Value.SetWideString(HWS_ChkCodEnd);
  FF_HWS_InsertChkExpCommand.Parameters[2].Value.SetWideString(HWS_ChkIdExp);
  FF_HWS_InsertChkExpCommand.Execute(ARequestFilter);
  Result := TJSONArray(FF_HWS_InsertChkExpCommand.Parameters[3].Value.GetJSONValue(FInstanceOwner));
end;

function THWS_ServerMethodsClient.F_HWS_InsertChkExp_Cache(HWS_ChkCodIni: string; HWS_ChkCodEnd: string; HWS_ChkIdExp: string; const ARequestFilter: string): IDSRestCachedJSONArray;
begin
  if FF_HWS_InsertChkExpCommand_Cache = nil then
  begin
    FF_HWS_InsertChkExpCommand_Cache := FConnection.CreateCommand;
    FF_HWS_InsertChkExpCommand_Cache.RequestType := 'GET';
    FF_HWS_InsertChkExpCommand_Cache.Text := 'THWS_ServerMethods.F_HWS_InsertChkExp';
    FF_HWS_InsertChkExpCommand_Cache.Prepare(THWS_ServerMethods_F_HWS_InsertChkExp_Cache);
  end;
  FF_HWS_InsertChkExpCommand_Cache.Parameters[0].Value.SetWideString(HWS_ChkCodIni);
  FF_HWS_InsertChkExpCommand_Cache.Parameters[1].Value.SetWideString(HWS_ChkCodEnd);
  FF_HWS_InsertChkExpCommand_Cache.Parameters[2].Value.SetWideString(HWS_ChkIdExp);
  FF_HWS_InsertChkExpCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedJSONArray.Create(FF_HWS_InsertChkExpCommand_Cache.Parameters[3].Value.GetString);
end;

function THWS_ServerMethodsClient.F_HWS_InsertChkPlacas(HWS_filePlacas: TJSONValue; const ARequestFilter: string): TJSONArray;
begin
  if FF_HWS_InsertChkPlacasCommand = nil then
  begin
    FF_HWS_InsertChkPlacasCommand := FConnection.CreateCommand;
    FF_HWS_InsertChkPlacasCommand.RequestType := 'POST';
    FF_HWS_InsertChkPlacasCommand.Text := 'THWS_ServerMethods."F_HWS_InsertChkPlacas"';
    FF_HWS_InsertChkPlacasCommand.Prepare(THWS_ServerMethods_F_HWS_InsertChkPlacas);
  end;
  FF_HWS_InsertChkPlacasCommand.Parameters[0].Value.SetJSONValue(HWS_filePlacas, FInstanceOwner);
  FF_HWS_InsertChkPlacasCommand.Execute(ARequestFilter);
  Result := TJSONArray(FF_HWS_InsertChkPlacasCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
end;

function THWS_ServerMethodsClient.F_HWS_InsertChkPlacas_Cache(HWS_filePlacas: TJSONValue; const ARequestFilter: string): IDSRestCachedJSONArray;
begin
  if FF_HWS_InsertChkPlacasCommand_Cache = nil then
  begin
    FF_HWS_InsertChkPlacasCommand_Cache := FConnection.CreateCommand;
    FF_HWS_InsertChkPlacasCommand_Cache.RequestType := 'POST';
    FF_HWS_InsertChkPlacasCommand_Cache.Text := 'THWS_ServerMethods."F_HWS_InsertChkPlacas"';
    FF_HWS_InsertChkPlacasCommand_Cache.Prepare(THWS_ServerMethods_F_HWS_InsertChkPlacas_Cache);
  end;
  FF_HWS_InsertChkPlacasCommand_Cache.Parameters[0].Value.SetJSONValue(HWS_filePlacas, FInstanceOwner);
  FF_HWS_InsertChkPlacasCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedJSONArray.Create(FF_HWS_InsertChkPlacasCommand_Cache.Parameters[1].Value.GetString);
end;

constructor THWS_ServerMethodsClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor THWS_ServerMethodsClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor THWS_ServerMethodsClient.Destroy;
begin
  FreeAndNil(FDSServerModuleCreateCommand);
  FreeAndNil(FDSServerModuleDestroyCommand);
  FreeAndNil(FF_HWS_RetornaStatusDoClienteCommand);
  FreeAndNil(FF_HWS_RetornaStatusDoClienteCommand_Cache);
  FreeAndNil(FF_HWS_ProximoAutoIncBancoClienteCommand);
  FreeAndNil(FF_HWS_GravaPerguntasXRespostasCommand);
  FreeAndNil(FF_HWS_GravaPerguntasXRespostasCommand_Cache);
  FreeAndNil(FF_HWS_RevisarCheckListCommand);
  FreeAndNil(FF_HWS_RevisarCheckListCommand_Cache);
  FreeAndNil(FF_HWS_RetornaCheckListPerguntasCommand);
  FreeAndNil(FF_HWS_RetornaCheckListPerguntasCommand_Cache);
  FreeAndNil(FF_HWS_RetornaStatusChipCommand);
  FreeAndNil(FF_HWS_RetornaStatusChipCommand_Cache);
  FreeAndNil(FF_HWS_RetornaVeiculosCommand);
  FreeAndNil(FF_HWS_RetornaVeiculosCommand_Cache);
  FreeAndNil(FF_HWS_GravaCheckListRealizadoCommand);
  FreeAndNil(FF_HWS_GravaCheckListRealizadoCommand_Cache);
  FreeAndNil(FF_HWS_RetornaCheckListAtivoCommand);
  FreeAndNil(FF_HWS_ExisteNovoCheckListCommand);
  FreeAndNil(FF_HWS_ExisteNovoCheckListCommand_Cache);
  FreeAndNil(FF_HWS_RetornaEstruturaDasPerguntasCommand);
  FreeAndNil(FF_HWS_RetornaEstruturaDasPerguntasCommand_Cache);
  FreeAndNil(FF_HWS_PodeExcluirPerguntaFilhaCommand);
  FreeAndNil(FF_HWS_ExcluirPerguntaFilhaCommand);
  FreeAndNil(FF_HWS_ExcluirPerguntaFilhaCommand_Cache);
  FreeAndNil(FF_HWS_PodeExcluirPerguntaReprovacaoCommand);
  FreeAndNil(FF_HWS_PodeExcluirRestricaoCommand);
  FreeAndNil(FF_HWS_ProximoAutoIncBancoHWSCommand);
  FreeAndNil(FF_HWS_RetornaUsuarioDoMobileCommand);
  FreeAndNil(FF_HWS_RetornaUsuarioDoMobileCommand_Cache);
  FreeAndNil(FF_HWS_RetornaCheckListsRealizadosCommand);
  FreeAndNil(FF_HWS_RetornaCheckListsRealizadosCommand_Cache);
  FreeAndNil(FF_HWS_RetornaChkExpCommand);
  FreeAndNil(FF_HWS_RetornaChkExpCommand_Cache);
  FreeAndNil(FF_HWS_RetornaReExpCommand);
  FreeAndNil(FF_HWS_RetornaReExpCommand_Cache);
  FreeAndNil(FF_HWS_InsertChkExpCommand);
  FreeAndNil(FF_HWS_InsertChkExpCommand_Cache);
  FreeAndNil(FF_HWS_InsertChkPlacasCommand);
  FreeAndNil(FF_HWS_InsertChkPlacasCommand_Cache);
  inherited;
end;

end.
