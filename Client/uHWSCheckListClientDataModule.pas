unit uHWSCheckListClientDataModule;

interface

uses
  System.SysUtils, System.Classes, uHWSCheckListClientClientClassesRest, IndyPeerImpl,
  Datasnap.DSClientRest, Data.FMTBcd, Data.DB, Data.SqlExpr, Data.DBXDataSnap,
  Data.DBXCommon, Datasnap.DBClient, Datasnap.DSConnect, Datasnap.DSHTTPLayer,
  Datasnap.Provider, MidasLib,   System.IniFiles,  IWSystem;

type
  THWS_ClientModule = class(TDataModule)
    HWS_SqlServerMethod_F_HWS_ConectaBancoCliente: TSqlServerMethod;
    HWS_DSRestConnection: TDSRestConnection;
    HWS_SQLConnectionDataSnap: TSQLConnection;
    HWSDSProviderConnection: TDSProviderConnection;
    HWS_SqlServerMethod_F_HWS_RetornaStatusDoCliente: TSqlServerMethod;
    HWS_ClientDataSet_AA01: TClientDataSet;
    HWS_ClientDataSet_AA01AA_CODIGO: TIntegerField;
    HWS_ClientDataSet_AA01AA_DESC: TStringField;
    HWS_ClientDataSet_AB01: TClientDataSet;
    HWS_ClientDataSet_AB01AB_CODIGO: TIntegerField;
    HWS_ClientDataSet_AB01AB_DESC: TStringField;
    HWS_ClientDataSet_AC01: TClientDataSet;
    HWS_ClientDataSet_AC01AC_CODTIPO: TIntegerField;
    HWS_ClientDataSet_AC01AC_CODGRUPO: TIntegerField;
    HWS_ClientDataSet_AD01: TClientDataSet;
    HWS_ClientDataSet_AD01AD_PERGUNTA: TStringField;
    HWS_ClientDataSet_AE01: TClientDataSet;
    HWS_ClientDataSet_AE01AE_GRUPO: TIntegerField;
    HWS_ClientDataSet_AE01AE_CODPER: TIntegerField;
    HWS_ClientDataSet_AF01: TClientDataSet;
    HWS_ClientDataSet_AF01AF_CODIGO: TIntegerField;
    HWS_ClientDataSet_AG01: TClientDataSet;
    HWS_ClientDataSet_AG01AG_PERPAI: TIntegerField;
    HWS_ClientDataSet_AG01AG_PERFILHA: TIntegerField;
    HWS_ClientDataSet_AG01AG_CODRESPAI: TIntegerField;
    HWS_ClientDataSet_AH01: TClientDataSet;
    HWS_ClientDataSet_AH01AH_CODPER: TIntegerField;
    HWS_ClientDataSet_AH01AH_CODRES: TIntegerField;
    HWS_ClientDataSet_AH01AH_ID: TIntegerField;
    HWS_ClientDataSet_HA01: TClientDataSet;
    HWS_ClientDataSet_HA01HA_CODIGO: TIntegerField;
    HWS_ClientDataSet_HA01HA_RAZAO: TStringField;
    HWS_ClientDataSet_HA01HA_FANTASIA: TStringField;
    HWS_ClientDataSet_HA01HA_TIPO: TStringField;
    HWS_ClientDataSet_HA01HA_CNPJ: TStringField;
    HWS_ClientDataSet_HA01HA_DATATRACKING: TStringField;
    HWS_ClientDataSet_HA01HD_DATACHECKLIST: TStringField;
    HWS_ClientDataSet_HA01HA_STATUS: TStringField;
    HWS_ClientDataSet_HD01: TClientDataSet;
    HWS_ClientDataSet_HD01HD_CODCLI: TIntegerField;
    HWS_ClientDataSet_HD01HD_CHIP: TStringField;
    HWS_ClientDataSet_HD01HD_DESC: TStringField;
    HWS_ClientDataSet_HD01HD_STATUS: TStringField;
    HWS_DataSource_AA01: TDataSource;
    HWS_SqlServerMethod_F_HWS_ProximoAutoIncBancoCliente: TSqlServerMethod;
    HWS_DataSource_AB01: TDataSource;
    HWS_DataSource_AD01: TDataSource;
    HWS_ClientDataSet_AD01AD_CODIGO: TIntegerField;
    HWS_DataSource_AF01: TDataSource;
    HWS_ClientDataSet_AD01AD_TIPO: TStringField;
    HWS_SqlServerMethod_F_HWS_GravaPerguntasXRespostas: TSqlServerMethod;
    HWS_ClientDataSet_AD01AD_STATUS: TStringField;
    HWS_ClientDataSet_A901: TClientDataSet;
    HWS_DataSource_A901: TDataSource;
    HWS_ClientDataSet_A901A9_CODIGO: TIntegerField;
    HWS_ClientDataSet_A901A9_DESC: TStringField;
    HWS_ClientDataSet_A901A9_STATUS: TStringField;
    HWS_ClientDataSet_A901A9_CODREV: TIntegerField;
    HWS_ClientDataSet_AA01AA_CODCHK: TIntegerField;
    HWS_ClientDataSet_AB01AB_CODCHK: TIntegerField;
    HWS_ClientDataSet_AC01AC_CODCHK: TIntegerField;
    HWS_ClientDataSet_AD01AD_CODCHK: TIntegerField;
    HWS_ClientDataSet_AE01AE_CODCHK: TIntegerField;
    HWS_ClientDataSet_AF01AF_CODCHK: TIntegerField;
    HWS_ClientDataSet_AF01AF_RESPOSTA: TStringField;
    HWS_ClientDataSet_AG01AG_CODCHK: TIntegerField;
    HWS_ClientDataSet_AH01AH_CODCHK: TIntegerField;
    HWS_ClientDataSet_AA01AA_CODANT: TIntegerField;
    HWS_ClientDataSet_AB01AB_CODANT: TIntegerField;
    HWS_ClientDataSet_AD01AD_CODANT: TIntegerField;
    HWS_ClientDataSet_AF01AF_CODANT: TIntegerField;
    HWS_ClientDataSet_AH01AH_IDANT: TIntegerField;
    HWS_SqlServerMethod_F_HWS_RevisarCheckList: TSqlServerMethod;
    HWS_ClientDataSet_AI01: TClientDataSet;
    HWS_ClientDataSet_AI01AI_CODCHK: TIntegerField;
    HWS_ClientDataSet_AI01AI_CODPER: TIntegerField;
    HWS_ClientDataSet_AI01AI_CODRES: TIntegerField;
    HWS_ClientDataSet_AI01AD_PERGUNTA: TWideStringField;
    HWS_ClientDataSet_AI01AF_RESPOSTA: TWideStringField;
    HWS_DataSource_AI01: TDataSource;
    HWS_ClientDataSet_AJ01: TClientDataSet;
    HWS_ClientDataSet_AJ01AJ_CODCHK: TIntegerField;
    HWS_ClientDataSet_AJ01AJ_CODGRP: TIntegerField;
    HWS_ClientDataSet_AJ01AJ_CODRES: TIntegerField;
    HWS_ClientDataSet_AJ01AJ_QTDRESTR: TIntegerField;
    HWS_ClientDataSet_AJ01AB_DESC: TWideStringField;
    HWS_ClientDataSet_AJ01AF_RESPOSTA: TWideStringField;
    HWS_DataSource_AJ01: TDataSource;
    HWS_DataSource_AG01: TDataSource;
    HWS_ClientDataSet_AG01AD_PERGUNTA: TWideStringField;
    HWS_ClientDataSet_AG01AF_RESPOSTA: TWideStringField;
    HWS_ClientDataSet_A901A9_APP: TIntegerField;
    HWS_ClientDataSet_AA01AA_CODERP: TIntegerField;
    HWS_DataSource_HD01: TDataSource;
    HWS_SqlServerMethod_F_HWS_RetornaEstruturaDasPerguntas: TSqlServerMethod;
    HWS_ClientDataSet_F_HWS_RetornaEstruturaDasPerguntas: TClientDataSet;
    HWS_DataSetProvider_F_HWS_RetornaEstruturaDasPerguntas: TDataSetProvider;
    HWS_SqlServerMethod_F_HWS_PodeExcluirPerguntaFilha: TSqlServerMethod;
    HWS_SqlServerMethod_F_HWS_ExcluirPerguntaFilha: TSqlServerMethod;
    HWS_SqlServerMethod_F_HWS_PodeExcluirPerguntaReprovacao: TSqlServerMethod;
    HWS_SqlServerMethod_F_HWS_PodeExcluirRestricao: TSqlServerMethod;
    HWS_ClientDataSet_HG01: TClientDataSet;
    HWS_ClientDataSet_HG01HG_CODIGO: TIntegerField;
    HWS_ClientDataSet_HG01HG_CODEMP: TIntegerField;
    HWS_ClientDataSet_HG01HG_NOME: TStringField;
    HWS_ClientDataSet_HG01HG_EMAIL: TStringField;
    HWS_ClientDataSet_HG01HG_USER: TStringField;
    HWS_ClientDataSet_HG01HG_SENHA: TStringField;
    HWS_ClientDataSet_HG01HG_DATACAD: TSQLTimeStampField;
    HWS_ClientDataSet_HG01HG_DATAUPD: TSQLTimeStampField;
    HWS_DataSource_HG01: TDataSource;
    HWS_ClientDataSet_HI01: TClientDataSet;
    HWS_ClientDataSet_HI01HI_CODIGO: TIntegerField;
    HWS_ClientDataSet_HI01HI_CODEMP: TIntegerField;
    HWS_ClientDataSet_HI01HI_NOME: TStringField;
    HWS_ClientDataSet_HI01HI_EMAIL: TStringField;
    HWS_ClientDataSet_HI01HI_USER: TStringField;
    HWS_ClientDataSet_HI01HI_SENHA: TStringField;
    HWS_ClientDataSet_HI01HI_DATACAD: TSQLTimeStampField;
    HWS_ClientDataSet_HI01HI_DATAUPD: TSQLTimeStampField;
    HWS_DataSource_HI01: TDataSource;
    HWS_SqlServerMethod_F_HWS_ProximoAutoIncBancoHWS: TSqlServerMethod;
    HWS_ClientDataSet_HG01HG_RESENHA: TStringField;
    HWS_ClientDataSet_HI01HI_RESENHA: TStringField;
    HWS_SqlServerMethod_F_HWS_RetornaCheckListsRealizados: TSqlServerMethod;
    HWS_DataSetProvider_F_HWS_RetornaCheckListsRealizados: TDataSetProvider;
    HWS_ClientDataSet_F_HWS_RetornaCheckListsRealizados: TClientDataSet;
    HWS_DataSource_F_HWS_RetornaCheckListsRealizados: TDataSource;
    HWS_SqlServerMethod_F_HWS_InserirVeiculosNaInclusaoDoChip: TSqlServerMethod;
    HWS_ClientDataSet_F_HWS_ImpressaoCheckListsAnalitico_Detalhe: TClientDataSet;
    HWS_ClientDataSet_F_HWS_ImpressaoCheckListsAnalitico_DetalheBB_CODIGO: TIntegerField;
    HWS_ClientDataSet_F_HWS_ImpressaoCheckListsAnalitico_DetalheBB_PLACA: TStringField;
    HWS_ClientDataSet_F_HWS_ImpressaoCheckListsAnalitico_DetalheAD_CODIGO: TIntegerField;
    HWS_ClientDataSet_F_HWS_ImpressaoCheckListsAnalitico_DetalheAD_PERGUNTA: TStringField;
    HWS_ClientDataSet_F_HWS_ImpressaoCheckListsAnalitico_DetalheAD_TIPO: TStringField;
    HWS_ClientDataSet_F_HWS_ImpressaoCheckListsAnalitico_DetalheAG_PERPAI: TIntegerField;
    HWS_ClientDataSet_F_HWS_ImpressaoCheckListsAnalitico_DetalheBB_DTCHECK: TDateField;
    HWS_ClientDataSet_F_HWS_ImpressaoCheckListsAnalitico_DetalheBB_HRCHECK: TStringField;
    HWS_ClientDataSet_F_HWS_ImpressaoCheckListsAnalitico_DetalheBB_OBS: TStringField;
    HWS_ClientDataSet_F_HWS_ImpressaoCheckListsAnalitico_DetalheBB_STATUS: TStringField;
    HWS_ClientDataSet_F_HWS_ImpressaoCheckListsAnalitico_DetalheHI_USER: TStringField;
    HWS_ClientDataSet_F_HWS_ImpressaoCheckListsAnalitico_DetalheOK: TStringField;
    HWS_ClientDataSet_F_HWS_ImpressaoCheckListsAnalitico_Detalhe—_OK: TStringField;
    HWS_ClientDataSet_F_HWS_ImpressaoCheckListsAnalitico_DetalheSim: TStringField;
    HWS_ClientDataSet_F_HWS_ImpressaoCheckListsAnalitico_DetalheN„o: TStringField;
    HWS_ClientDataSet_F_HWS_ImpressaoCheckListsAnalitico_Detalhe—_ObrigatÛrio: TStringField;
    HWS_DataSetProvider_F_HWS_ImpressaoCheckListsAnalitico_Detalhe: TDataSetProvider;
    HWS_SqlServerMethod_F_HWS_ImpressaoCheckListsAnalitico_Detalhe: TSqlServerMethod;
    HWS_ClientDataSet_AH01AH_FOTO: TStringField;
    SqlServerMethod1: TSqlServerMethod;
  private
    FInstanceOwner: Boolean;
    FHWS_ServerMethodsClient: THWS_ServerMethodsClient;
    function GetHWS_ServerMethodsClient: THWS_ServerMethodsClient;
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property InstanceOwner: Boolean read FInstanceOwner write FInstanceOwner;
    property HWS_ServerMethodsClient: THWS_ServerMethodsClient read GetHWS_ServerMethodsClient write FHWS_ServerMethodsClient;

end;

var
  HWS_ClientModule: THWS_ClientModule;

implementation

{$R *.dfm}

{%CLASSGROUP 'System.Classes.TPersistent'}

constructor THWS_ClientModule.Create(AOwner: TComponent);
begin
  inherited;
  FInstanceOwner := True;
end;

destructor THWS_ClientModule.Destroy;
begin
  FHWS_ServerMethodsClient.Free;
  inherited;
end;

function THWS_ClientModule.GetHWS_ServerMethodsClient: THWS_ServerMethodsClient;
begin
  if FHWS_ServerMethodsClient = nil then
    FHWS_ServerMethodsClient:= THWS_ServerMethodsClient.Create(HWS_DSRestConnection, FInstanceOwner);
  Result := FHWS_ServerMethodsClient;
end;

end.
