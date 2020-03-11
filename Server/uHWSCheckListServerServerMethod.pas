unit uHWSCheckListServerServerMethod;

interface

uses System.SysUtils, System.Classes, Datasnap.DSServer, Datasnap.DSAuth,
  Data.DBXMySQL, Data.DB, Data.SqlExpr, Data.FMTBcd, Data.DBXJSON,
  Datasnap.Provider, Data.DBXJSONReflect, Data.DBXCommon, MidasLib, Vcl.AppEvnts, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg, IdCoderMIME, EncdDecd;

type
  [TRoleAuth('admin')]
  THWS_ServerMethods = class(TDSServerModule)
    HWS_SQLConnection_Banco_Cliente: TSQLConnection;
    HWS_SQLTable_AA01: TSQLTable;
    HWS_SQLTable_AB01: TSQLTable;
    HWS_SQLTable_AC01: TSQLTable;
    HWS_SQLTable_AD01: TSQLTable;
    HWS_SQLTable_AE01: TSQLTable;
    HWS_SQLTable_AF01: TSQLTable;
    HWS_SQLTable_AG01: TSQLTable;
    HWS_SQLTable_AH01: TSQLTable;
    HWS_SQLTable_AA01AA_CODIGO: TIntegerField;
    HWS_SQLTable_AA01AA_DESC: TStringField;
    HWS_SQLTable_AB01AB_CODIGO: TIntegerField;
    HWS_SQLTable_AB01AB_DESC: TStringField;
    HWS_SQLTable_AC01AC_CODTIPO: TIntegerField;
    HWS_SQLTable_AC01AC_CODGRUPO: TIntegerField;
    HWS_SQLTable_AD01AD_PERGUNTA: TStringField;
    HWS_SQLTable_AE01AE_GRUPO: TIntegerField;
    HWS_SQLTable_AE01AE_CODPER: TIntegerField;
    HWS_SQLTable_AF01AF_CODIGO: TIntegerField;
    HWS_SQLTable_AG01AG_PERPAI: TIntegerField;
    HWS_SQLTable_AG01AG_PERFILHA: TIntegerField;
    HWS_SQLTable_AG01AG_CODRESPAI: TIntegerField;
    HWS_SQLTable_AH01AH_CODPER: TIntegerField;
    HWS_SQLTable_AH01AH_CODRES: TIntegerField;
    HWS_SQLTable_AH01AH_ID: TIntegerField;
    HWS_SQLTable_HA01: TSQLTable;
    HWS_SQLConnection_Banco_HWS: TSQLConnection;
    HWS_SQLTable_HA01HA_CODIGO: TIntegerField;
    HWS_SQLTable_HA01HA_RAZAO: TStringField;
    HWS_SQLTable_HA01HA_FANTASIA: TStringField;
    HWS_SQLTable_HA01HA_TIPO: TStringField;
    HWS_SQLTable_HA01HA_CNPJ: TStringField;
    HWS_SQLTable_HA01HA_STATUS: TStringField;
    HWS_DataSetProvider_AA01: TDataSetProvider;
    HWS_DataSetProvider_AB01: TDataSetProvider;
    HWS_DataSetProvider_AC01: TDataSetProvider;
    HWS_DataSetProvider_AD01: TDataSetProvider;
    HWS_DataSetProvider_AE01: TDataSetProvider;
    HWS_DataSetProvider_AF01: TDataSetProvider;
    HWS_DataSetProvider_AG01: TDataSetProvider;
    HWS_DataSetProvider_AH01: TDataSetProvider;
    HWS_DataSetProvider_HA01: TDataSetProvider;
    HWS_DataSetProvider_HD01: TDataSetProvider;
    HWS_SQLTable_HA01HA_DATATRACKING: TStringField;
    HWS_SQLTable_HA01HA_DATACHECKLIST: TStringField;
    HWS_SQLTable_AD01AD_CODIGO: TIntegerField;
    HWS_SQLTable_AD01AD_TIPO: TStringField;
    HWS_SQLTable_AD01AD_STATUS: TStringField;
    HWS_SQLTable_A901: TSQLTable;
    HWS_SQLTable_A901A9_CODIGO: TIntegerField;
    HWS_SQLTable_A901A9_DESC: TStringField;
    HWS_SQLTable_A901A9_STATUS: TStringField;
    HWS_DataSetProvider_A901: TDataSetProvider;
    HWS_SQLTable_A901A9_CODREV: TIntegerField;
    HWS_SQLTable_AA01AA_CODCHK: TIntegerField;
    HWS_SQLTable_AB01AB_CODCHK: TIntegerField;
    HWS_SQLTable_AC01AC_CODCHK: TIntegerField;
    HWS_SQLTable_AD01AD_CODCHK: TIntegerField;
    HWS_SQLTable_AE01AE_CODCHK: TIntegerField;
    HWS_SQLTable_AF01AF_CODCHK: TIntegerField;
    HWS_SQLTable_AG01AG_CODCHK: TIntegerField;
    HWS_SQLTable_AH01AH_CODCHK: TIntegerField;
    HWS_SQLTable_AF01AF_RESPOSTA: TStringField;
    HWS_SQLTable_AA01AA_CODANT: TIntegerField;
    HWS_SQLTable_AB01AB_CODANT: TIntegerField;
    HWS_SQLTable_AD01AD_CODANT: TIntegerField;
    HWS_SQLTable_AF01AF_CODANT: TIntegerField;
    HWS_SQLTable_AH01AH_IDANT: TIntegerField;
    HWS_SQLTable_AI01: TSQLTable;
    HWS_SQLTable_AI01AI_CODCHK: TIntegerField;
    HWS_SQLTable_AI01AI_CODPER: TIntegerField;
    HWS_SQLTable_AI01AI_CODRES: TIntegerField;
    HWS_DataSetProvider_AI01: TDataSetProvider;
    HWS_SQLTable_AJ01: TSQLTable;
    HWS_SQLTable_AJ01AJ_CODCHK: TIntegerField;
    HWS_SQLTable_AJ01AJ_CODGRP: TIntegerField;
    HWS_SQLTable_AJ01AJ_CODRES: TIntegerField;
    HWS_SQLTable_AJ01AJ_QTDRESTR: TIntegerField;
    HWS_DataSetProvider_AJ01: TDataSetProvider;
    HWS_SQLTable_A901A9_APP: TIntegerField;
    HWS_SQLTable_AA01AA_CODERP: TIntegerField;
    HWS_DataSetProvider_HG01: TDataSetProvider;
    HWS_DataSetProvider_HI01: TDataSetProvider;
    HWS_SQLTable_HG01: TSQLTable;
    HWS_SQLTable_HG01HG_CODIGO: TIntegerField;
    HWS_SQLTable_HG01HG_CODEMP: TIntegerField;
    HWS_SQLTable_HG01HG_NOME: TStringField;
    HWS_SQLTable_HG01HG_EMAIL: TStringField;
    HWS_SQLTable_HG01HG_USER: TStringField;
    HWS_SQLTable_HG01HG_SENHA: TStringField;
    HWS_SQLTable_HG01HG_DATACAD: TSQLTimeStampField;
    HWS_SQLTable_HG01HG_DATAUPD: TSQLTimeStampField;
    HWS_SQLTable_HI01: TSQLTable;
    HWS_SQLTable_HI01HI_CODIGO: TIntegerField;
    HWS_SQLTable_HI01HI_CODEMP: TIntegerField;
    HWS_SQLTable_HI01HI_NOME: TStringField;
    HWS_SQLTable_HI01HI_EMAIL: TStringField;
    HWS_SQLTable_HI01HI_USER: TStringField;
    HWS_SQLTable_HI01HI_SENHA: TStringField;
    HWS_SQLTable_HI01HI_DATACAD: TSQLTimeStampField;
    HWS_SQLTable_HI01HI_DATAUPD: TSQLTimeStampField;
    HWS_SQLTable_HG01HG_RESENHA: TStringField;
    HWS_SQLTable_HI01HI_RESENHA: TStringField;
    HWS_SQLTable_HD01: TSQLTable;
    HWS_SQLTable_HD01HD_CODCLI: TIntegerField;
    HWS_SQLTable_HD01HD_CHIP: TStringField;
    HWS_SQLTable_HD01HD_DESC: TStringField;
    HWS_SQLTable_HD01HD_STATUS: TStringField;
    HWS_SQLTable_AH01AH_FOTO: TStringField;
    procedure DSServerModuleCreate(Sender: TObject);
    procedure DSServerModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    //function F_HWS_ConectaBancoCliente(HWS_CodCliente: string): TJSONArray;
    function F_HWS_RetornaStatusDoCliente(HWS_CodCliente: string): TJSONArray;
    function F_HWS_ProximoAutoIncBancoCliente(Tabela, Campo, Formato: String): String;
    function F_HWS_GravaPerguntasXRespostas(HWS_PerXRes: TJSONValue): TJSONArray;
    function F_HWS_RevisarCheckList(HWS_Codigo: String): TJSONArray;
    function F_HWS_RetornaCheckListPerguntas(HWS_App: String): TDBXReader;
    function F_HWS_RetornaStatusChip(HWS_Chip: String): TJSONArray;
    function F_HWS_RetornaVeiculos(HWS_Chip: String; HWS_MaxId: String) : TDBXReader;
    function F_HWS_GravaCheckListRealizado(HWS_Chip: String; HWS_Dados: TJSONArray): TJSONArray;
    function F_HWS_RetornaCheckListAtivo(HWS_App: String): String;
    function F_HWS_ExisteNovoCheckList(HWS_App: String; HWS_CheckListAtual: String): TJSONArray;
    function F_HWS_RetornaEstruturaDasPerguntas(HWS_CheckList: String): TDBXReader;
    function F_HWS_PodeExcluirPerguntaFilha(HWS_CheckList: String; HWS_Pergunta: String): String;
    function F_HWS_ExcluirPerguntaFilha(HWS_CheckList: String; HWS_PerguntaPai: String; HWS_PerguntaFilha: String): TJSONArray;
    function F_HWS_PodeExcluirPerguntaReprovacao(HWS_CheckList: String; HWS_Pergunta: String): String;
    function F_HWS_PodeExcluirRestricao(HWS_CheckList: String; HWS_GrupoPergunta: String): String;
    function F_HWS_ProximoAutoIncBancoHWS(Tabela, Campo, Formato: String): String;
    function F_HWS_RetornaUsuarioDoMobile(HWS_CodCliente: String): TDBXReader;
    function F_HWS_RetornaCheckListsRealizados(HWS_DaData, HWS_AteData, HWS_DaPlaca, HWS_AtePlaca, HWS_DoStatus, HWS_AteStatus: String) : TDBXReader;
    function F_HWS_RetornaChkExp(HWS_CodEmpresa, HWS_tipoIni, HWS_tipoEnd:String) : TDBXReader;
    function F_HWS_RetornaReExp : TDBXReader;
    function F_HWS_InsertChkExp(HWS_ChkCodIni, HWS_ChkCodEnd, HWS_ChkIdExp: String): TJSONArray;
    function F_HWS_InsertChkPlacas(HWS_filePlacas: TJSONValue): TJSONArray;
    function F_HWS_InserirVeiculosNaInclusaoDoChip(HWS_Chip: String; HWS_CodCliente: String): TJSONArray;
    function F_HWS_ImpressaoCheckListsAnalitico_Detalhe(HWS_CodEmpresa, HWS_CheckList, HWS_DaData, HWS_AteData, HWS_DaPlaca, HWS_AtePlaca, HWS_DoStatus, HWS_AteStatus: String): TDBXReader;
    function F_HWS_RecebeImagens(HWS_Imagem: TJSONObject;  HWS_Tamanho: Integer): TJSONArray;

    //function F_HWS_ImpressaoCheckListsAnalitico_Master(HWS_CodEmpresa, HWS_CheckList, HWS_DaData, HWS_AteData, HWS_DaPlaca, HWS_AtePlaca, HWS_DoStatus, HWS_AteStatus: String): TDBXReader;

  end;

implementation

{$R *.dfm}

uses System.StrUtils, uHWSCheckListServerServerContainer, uHWSJson, uHWSJsonSrv;

procedure THWS_ServerMethods.DSServerModuleCreate(Sender: TObject);
begin
   HWS_SQLConnection_Banco_HWS.Open;
   HWS_SQLConnection_Banco_Cliente.Open;
end;

procedure THWS_ServerMethods.DSServerModuleDestroy(Sender: TObject);
begin
   HWS_SQLConnection_Banco_HWS.Close;
   HWS_SQLConnection_Banco_Cliente.Close;
end;

{
function THWS_ServerMethods.F_HWS_ConectaBancoCliente(HWS_CodCliente: string): TJSONArray;
begin
   // Conectando todos os datasets no banco do cliente
   HWS_CodCliente := 'CK' + FormatFloat('00000', StrToIntDef(HWS_CodCliente,0));
   Result := TJSONArray.Create;
   try
      HWS_SQLTable_A901.SQLConnection := HWS_SQLConnection_Banco_Cliente;
      HWS_SQLTable_AA01.SQLConnection := HWS_SQLConnection_Banco_Cliente;
      HWS_SQLTable_AB01.SQLConnection := HWS_SQLConnection_Banco_Cliente;
      HWS_SQLTable_AC01.SQLConnection := HWS_SQLConnection_Banco_Cliente;
      HWS_SQLTable_AD01.SQLConnection := HWS_ServerContainer.HWSGetConnection(HWS_CodCliente);
      HWS_SQLTable_AE01.SQLConnection := HWS_ServerContainer.HWSGetConnection(HWS_CodCliente);
      HWS_SQLTable_AF01.SQLConnection := HWS_ServerContainer.HWSGetConnection(HWS_CodCliente);
      HWS_SQLTable_AG01.SQLConnection := HWS_ServerContainer.HWSGetConnection(HWS_CodCliente);
      HWS_SQLTable_AH01.SQLConnection := HWS_ServerContainer.HWSGetConnection(HWS_CodCliente);
      HWS_SQLTable_AI01.SQLConnection := HWS_ServerContainer.HWSGetConnection(HWS_CodCliente);
      HWS_SQLTable_AJ01.SQLConnection := HWS_ServerContainer.HWSGetConnection(HWS_CodCliente);
      HWS_ServerContainer.HWSGetConnection(HWS_CodCliente).Open;
      Result.Add('S');
      Result.Add('');
   except on E: Exception
      do begin
         Result.Add('N');
         Result.Add(E.ToString);
      end;
   end;
end;
}

function THWS_ServerMethods.F_HWS_RetornaStatusDoCliente(HWS_CodCliente: string): TJSONArray;
begin
   // Esta Funcao sera a primeira funcao chamado pelo Client
   // Ela sera responsavel pela conexao do banco de dados do cliente
   // Esta funcao sera chamada pelo client em um componente TSQLServerMethod
   WriteLn('teste');
   Result := TJSONArray.Create;
   try
      // Verificando se existe o cliente cadastro e se o mesmo tem permissao para acessar o sistema
      HWS_SQLTable_HA01.Open;
      if HWS_SQLTable_HA01.Locate('HA_CODIGO',HWS_CodCliente,[]) then begin
         // Status = 1 - Cliente Ativo
         // Status = 2 - Cliente Inativo
         // Status = 3 - Cliente Bloqueado por algum motivo
         if HWS_SQLTable_HA01.FieldByName('HA_STATUS').AsString = '1' then begin
            Result.Add('S');
            Result.Add(HWS_SQLTable_HA01.FieldByName('HA_DATACHECKLIST').AsString);
         end else if HWS_SQLTable_HA01.FieldByName('HA_STATUS').AsString = '2' then begin
            Result.Add('N');
            Result.Add('Cliente desativado do sistema');
         end else if HWS_SQLTable_HA01.FieldByName('HA_STATUS').AsString = '3' then begin
            Result.Add('N');
            Result.Add('Cliente bloqueado. Entre em contato com a HWS Soluções Web.');
         end;
      end else begin
         Result.Add('N');
         Result.Add('Cliente não cadastrado no sistema.');
      end;
      HWS_SQLTable_HA01.Close;
   except on E: Exception do
      begin
         Result.Add('N');
         Result.Add(E.ToString);
      end;
   end;
end;

function THWS_ServerMethods.F_HWS_ProximoAutoIncBancoCliente(Tabela, Campo, Formato: String): String;
var HWS_Query: TSQLQuery;
begin
   // Retorna o Proximo Codigo de um Campo
   try
      Formato   := StringReplace(Formato,'_','',[rfReplaceAll]);
      HWS_Query := TSQLQuery.Create(Self);
      HWS_Query.SQLConnection := HWS_SQLConnection_Banco_Cliente;
      HWS_Query.SQL.Text := 'select (case when max('+Campo+') is null then 1 else max('+Campo+') + 1 end) as CAMPO  from ' + Tabela;
      HWS_Query.Open;
      Result := FormatFloat(Formato,HWS_Query.FieldByName('CAMPO').AsInteger);
   finally
      HWS_Query.Free;
   end;
end;

function THWS_ServerMethods.F_HWS_ProximoAutoIncBancoHWS(Tabela, Campo, Formato: String): String;
var HWS_Query: TSQLQuery;
begin
   // Retorna o Proximo Codigo de um Campo
   try
      Formato   := StringReplace(Formato,'_','',[rfReplaceAll]);
      HWS_Query := TSQLQuery.Create(Self);
      HWS_Query.SQLConnection := HWS_SQLConnection_Banco_HWS;
      HWS_Query.SQL.Text := 'select (case when max('+Campo+') is null then 1 else max('+Campo+') + 1 end) as CAMPO  from ' + Tabela;
      HWS_Query.Open;
      Result := FormatFloat(Formato,HWS_Query.FieldByName('CAMPO').AsInteger);
   finally
      HWS_Query.Free;
   end;
end;

function THWS_ServerMethods.F_HWS_GravaPerguntasXRespostas(HWS_PerXRes: TJSONValue): TJSONArray;
var   HWS_PerguntasXRespostas: TPerguntasXRespostas;
      HWS_Reverte: TJSONUnMarshal;
      HWS_Query, HWS_QueryExcluir: TSQLQuery;
      X: Integer;
      HWS_Existe: Boolean;
      HWS_Transacao: TTransactionDesc;
begin
   try
      Result := TJSONArray.Create;
      HWS_Transacao.TransactionID := 20;
      // Inicia a Transacao
      HWS_SQLConnection_Banco_Cliente.StartTransaction(HWS_Transacao);
      HWS_Query         := TSQLQuery.Create(Self);
      HWS_QueryExcluir  := TSQLQuery.Create(Self);
      HWS_Query.SQLConnection := HWS_SQLConnection_Banco_Cliente;
      HWS_QueryExcluir.SQLConnection := HWS_SQLConnection_Banco_Cliente;
      HWS_Reverte := TJSONUnMarshal.Create;
      HWS_PerguntasXRespostas := HWS_Reverte.Unmarshal(HWS_PerXRes) as TPerguntasXRespostas;
      try
         //Selecionando todos os registros que se encontram no banco de dados atualmente
         HWS_Query.SQL.Text := 'select ' +
                               'AH_CODCHK, ' +
                               'AH_CODPER, ' +
                               'AH_CODRES ' +
                               'from ' +
                               'AH01 ' +
                               'where ' +
                               'AH_CODCHK = ' + QuotedStr(HWS_PerguntasXRespostas.AH_CODCHK) +
                               ' order by ' +
                               'AH_CODCHK, ' +
                               'AH_CODPER, ' +
                               'AH_CODRES';
         HWS_Query.Open;
         while not HWS_Query.Eof do begin
            // Verifica se o registro esta na lista que veio para a funcao
            // Caso nao esteja deleta o resgistro no banco
            HWS_Existe := False;
            for X:= 0 to HWS_PerguntasXRespostas.ListaPerguntasXRespostas.Count - 1 do begin
               if (Trim(HWS_PerguntasXRespostas.ListaPerguntasXRespostas[X].AH_CODCHK) = Trim(HWS_Query.FieldByName('AH_CODCHK').AsString)) and
                  (Trim(HWS_PerguntasXRespostas.ListaPerguntasXRespostas[X].AH_CODPER) = Trim(HWS_Query.FieldByName('AH_CODPER').AsString)) and
                  (Trim(HWS_PerguntasXRespostas.ListaPerguntasXRespostas[X].AH_CODRES) = Trim(HWS_Query.FieldByName('AH_CODRES').AsString)) then begin
                  HWS_Existe := True;
                  Exit;
               end;
            end;
            if not HWS_Existe then begin
               // Exclui do banco
               HWS_QueryExcluir.Close;
               HWS_QueryExcluir.SQL.Text := 'delete ' +
                                            'from ' +
                                            'AH01 ' +
                                            'where '+
                                            'AH_CODCHK = ' + QuotedStr(HWS_Query.FieldByName('AH_CODCHK').AsString) + ' and ' +
                                            'AH_CODPER = ' + QuotedStr(HWS_Query.FieldByName('AH_CODPER').AsString) + ' and ' +
                                            'AH_CODRES = ' + QuotedStr(HWS_Query.FieldByName('AH_CODRES').AsString);
               HWS_QueryExcluir.ExecSQL();
            end;
            HWS_Query.Next;
         end;
         // Verifica se nao existir no banco entao inclui no banco
         for X := 0 to HWS_PerguntasXRespostas.ListaPerguntasXRespostas.Count-1 do begin
            HWS_Query.Close;
            HWS_Query.SQL.Text := 'select ' +
                                  'AH_CODPER ' +
                                  'from ' +
                                  'AH01 ' +
                                  'where ' +
                                  'AH_CODCHK = ' + QuotedStr(HWS_PerguntasXRespostas.ListaPerguntasXRespostas[X].AH_CODCHK) + ' and ' +
                                  'AH_CODPER = ' + QuotedStr(HWS_PerguntasXRespostas.ListaPerguntasXRespostas[X].AH_CODPER) + ' and ' +
                                  'AH_CODRES = ' + QuotedStr(HWS_PerguntasXRespostas.ListaPerguntasXRespostas[X].AH_CODRES);
            HWS_Query.Open;
            if HWS_Query.Eof then begin
               HWS_QueryExcluir.Close;
               HWS_QueryExcluir.SQL.Text := 'insert into ' +
                                            'AH01 ' +
                                            '(AH_CODCHK, AH_CODPER, AH_CODRES, AH_FOTO) ' +
                                            'values ' +
                                            '(:AH_CODCHK, :AH_CODPER, :AH_CODRES, :AH_FOTO)';
               HWS_QueryExcluir.ParamByName('AH_CODCHK').AsString := HWS_PerguntasXRespostas.ListaPerguntasXRespostas[X].AH_CODCHK;
               HWS_QueryExcluir.ParamByName('AH_CODPER').AsString := HWS_PerguntasXRespostas.ListaPerguntasXRespostas[X].AH_CODPER;
               HWS_QueryExcluir.ParamByName('AH_CODRES').AsString := HWS_PerguntasXRespostas.ListaPerguntasXRespostas[X].AH_CODRES;
               HWS_QueryExcluir.ParamByName('AH_FOTO').AsString   := HWS_PerguntasXRespostas.ListaPerguntasXRespostas[X].AH_FOTO;
               WriteLn('antes');
               HWS_QueryExcluir.ExecSQL();
               WriteLn('depois');
            end;
         end;
         //Confirma a transacao
         HWS_SQLConnection_Banco_Cliente.Commit(HWS_Transacao);
         Result.Add('S');
         Result.Add('');
      except on E: Exception do
         begin
            // Cancela a Transacao
            HWS_SQLConnection_Banco_Cliente.Rollback(HWS_Transacao);
            Result.Add('N');
            Result.Add(E.ToString);
         end;
      end;
   finally
      HWS_Query.Free;
      HWS_QueryExcluir.Free;
      HWS_Reverte.Free;
      HWS_PerguntasXRespostas.Free;
   end;
end;

function THWS_ServerMethods.F_HWS_RevisarCheckList(HWS_Codigo: String): TJSONArray;
var HWS_Query,HWS_Query_Insert: TSQLQuery;
    HWS_Novo_CheckList: String;
    HWS_Transacao: TTransactionDesc;
begin
   try
      HWS_Transacao.TransactionID := 10;
      HWS_Query_Insert := TSQLQuery.Create(Self);
      HWS_Query_Insert.SQLConnection := HWS_SQLConnection_Banco_Cliente;
      HWS_SQLConnection_Banco_Cliente.StartTransaction(HWS_Transacao);
      try
         Result := TJSONArray.Create;
         // Inserindo o no CheckList
         HWS_Query_Insert.Close;
         HWS_Query_Insert.SQL.Text   :=   'insert into '+
                                          'A901 ' +
                                          '(A9_DESC, A9_STATUS, A9_CODREV, A9_APP) ' +
                                          'select ' +
                                          'A9.A9_DESC, ' +
                                          QuotedStr('3') + ',' +
                                          'A9.A9_CODIGO, ' +
                                          'A9.A9_APP ' +
                                          'from ' +
                                          'A901 as A9 ' +
                                          'where ' +
                                          'A9.A9_CODIGO = ' + QuotedStr(HWS_Codigo);
         HWS_Query_Insert.ExecSQL();
         // Pegando o novo codigo do checklist  gerado
         HWS_Query_Insert.Close;
         HWS_Query_Insert.SQL.Text := 'select ' +
                               'A9_CODIGO ' +
                               'from ' +
                               'A901 ' +
                               'where ' +
                               'A9_CODREV = ' + QuotedStr(HWS_Codigo);
         HWS_Query_Insert.Open;
         HWS_Novo_CheckList := HWS_Query_Insert.FieldByName('A9_CODIGO').AsString;
         // Inserindo os novos tipos de implemento
         HWS_Query_Insert.Close;
         HWS_Query_Insert.SQL.Text := 'insert into ' +
                                      'AA01 ' +
                                      '(AA_CODCHK,AA_DESC,AA_CODERP,AA_CODANT) ' +
                                      'select ' +
                                      QuotedStr(HWS_Novo_CheckList) + ',' +
                                      'AA_DESC, ' +
                                      'AA_CODERP, ' +
                                      'AA_CODIGO ' +
                                      'from ' +
                                      'AA01 ' +
                                      'where ' +
                                      'AA_CODCHK = ' + QuotedStr(HWS_Codigo);
         HWS_Query_Insert.ExecSQL();
         // Inserindo os novos grupos de respostas
         HWS_Query_Insert.Close;
         HWS_Query_Insert.SQL.Text := 'insert into ' +
                                      'AB01 ' +
                                      '(AB_CODCHK, AB_DESC, AB_CODANT) ' +
                                      'select ' +
                                      QuotedStr(HWS_Novo_CheckList) + ',' +
                                      'AB_DESC, ' +
                                      'AB_CODIGO ' +
                                      'from ' +
                                      'AB01 ' +
                                      'where ' +
                                      'AB_CODCHK = ' + QuotedStr(HWS_Codigo);
         HWS_Query_Insert.ExecSQL();
         // Inserindo os novos relacao grupos de respostas com Implementos
         HWS_Query_Insert.Close;
         HWS_Query_Insert.SQL.Text := 'insert into ' +
                                      'AC01 ' +
                                      '(AC_CODCHK,AC_CODTIPO,AC_CODGRUPO) ' +
                                      'select '+
                                      'AA_CODCHK, '+
                                      'AA_CODIGO, '+
                                      'AB_CODIGO ' +
                                      'from '+
                                      'AC01 ' +
                                      'inner join AA01 on AA_CODCHK = '+ QuotedStr(HWS_Novo_CheckList)+' and AA_CODANT = AC_CODTIPO ' +
                                      'inner join AB01 on AB_CODCHK = '+ QuotedStr(HWS_Novo_CheckList)+' and AB_CODANT = AC_CODGRUPO ' +
                                      'where ' +
                                      'AC_CODCHK = ' + QuotedStr(HWS_Codigo) +
                                      ' order by ' +
                                      'AA_CODIGO, '+
                                      'AB_CODIGO ';
         HWS_Query_Insert.ExecSQL();
         // Inserindo as novas perguntas
         HWS_Query_Insert.Close;
         HWS_Query_Insert.SQL.Text := 'insert into ' +
                                      'AD01 ' +
                                      '(AD_CODCHK, AD_PERGUNTA, AD_TIPO, AD_STATUS, AD_SEQ, AD_CODANT) ' +
                                      'select ' +
                                      QuotedStr(HWS_Novo_CheckList) + ',' +
                                      'AD_PERGUNTA,' +
                                      'AD_TIPO, ' +
                                      'AD_STATUS, ' +
                                      'AD_SEQ, ' +
                                      'AD_CODIGO ' +
                                      'from ' +
                                      'AD01 ' +
                                      'where ' +
                                      'AD_CODCHK = ' + QuotedStr(HWS_Codigo);
         HWS_Query_Insert.ExecSQL();
         // Inserindo as novos relacionamentos de perguntas com o grupo de perguntas
         HWS_Query_Insert.Close;
         HWS_Query_Insert.SQL.Text := 'insert into ' +
                                      'AE01 ' +
                                      '(AE_CODCHK, AE_GRUPO, AE_CODPER) ' +
                                      'select ' +
                                      'AD_CODCHK, ' +
                                      'AB_CODIGO, ' +
                                      'AD_CODIGO ' +
                                      'from ' +
                                      'AE01 ' +
                                      'inner join AD01 on AD_CODCHK = '+QuotedStr(HWS_Novo_CheckList)+' and AD_CODANT = AE_CODPER ' +
                                      'inner join AB01 on AB_CODCHK = '+QuotedStr(HWS_Novo_CheckList)+' and AB_CODANT = AE_GRUPO ' +
                                      'where ' +
                                      'AE_CODCHK = '+QuotedStr(HWS_Codigo);
         HWS_Query_Insert.ExecSQL();
         // Inserindo as novas respostas
         HWS_Query_Insert.Close;
         HWS_Query_Insert.SQL.Text := 'insert into ' +
                                      'AF01 ' +
                                      '(AF_CODCHK, AF_RESPOSTA, AF_CODANT) ' +
                                      'select '+
                                      QuotedStr(HWS_Novo_CheckList) + ',' +
                                      'AF_RESPOSTA, ' +
                                      'AF_CODIGO ' +
                                      'from ' +
                                      'AF01 ' +
                                      'where ' +
                                      'AF_CODCHK = ' + QuotedStr(HWS_Codigo);
         HWS_Query_Insert.ExecSQL();
         // Inserindo os novos relacionamentos de perguntas X repostas
         HWS_Query_Insert.Close;
         HWS_Query_Insert.SQL.Text := 'insert into ' +
                                      'AH01 ' +
                                      '(AH_CODCHK, AH_CODPER, AH_CODRES, AH_FOTO, AH_IDANT) ' +
                                      'select ' +
                                      'AD_CODCHK, ' +
                                      'AD_CODIGO, ' +
                                      'AF_CODIGO, ' +
                                      'AH_FOTO, ' +
                                      'AH_ID ' +
                                      'from ' +
                                      'AH01 ' +
                                      'inner join AD01 on AD_CODCHK = '+QuotedStr(HWS_Novo_CheckList)+' and AD_CODANT = AH_CODPER ' +
                                      'inner join AF01 on AF_CODCHK = '+QuotedStr(HWS_Novo_CheckList)+' and AF_CODANT = AH_CODRES ' +
                                      'where ' +
                                      'AH_CODCHK = '+QuotedStr(HWS_Codigo);
         HWS_Query_Insert.ExecSQL();
         // Inserindo o relacionamento das perguntas pai X peruntas filhas
         HWS_Query_Insert.Close;
         HWS_Query_Insert.SQL.Text := 'insert into ' +
                                      'AG01 ' +
                                      '(AG_CODCHK, AG_PERPAI, AG_PERFILHA, AG_CODRESPAI) ' +
                                      'select ' +
                                      'PAI.AD_CODCHK, ' +
                                      'PAI.AD_CODIGO, ' +
                                      'FILHA.AD_CODIGO, ' +
                                      'AF_CODIGO ' +
                                      'from ' +
                                      'AG01 ' +
                                      'inner join AD01 as PAI on PAI.AD_CODCHK = '+QuotedStr(HWS_Novo_CheckList)+' and PAI.AD_CODANT = AG_PERPAI ' +
                                      'inner join AD01 as FILHA on FILHA.AD_CODCHK = '+QuotedStr(HWS_Novo_CheckList)+' and FILHA.AD_CODANT = AG_PERFILHA ' +
                                      'inner join AF01 on AF_CODCHK = '+QuotedStr(HWS_Novo_CheckList)+' and AF_CODANT = AG_CODRESPAI ' +
                                      'where ' +
                                      'AG_CODCHK = ' + QuotedStr(HWS_Codigo);
         HWS_Query_Insert.ExecSQL();
         // Inserindo as perguntas de reprovacao do checklist
         HWS_Query_Insert.Close;
         HWS_Query_Insert.SQL.Text := 'insert into ' +
                                      'AI01 ' +
                                      '(AI_CODCHK, AI_CODPER, AI_CODRES) ' +
                                      'select ' +
                                      QuotedStr(HWS_Novo_CheckList) + ',' +
                                      'AD_CODIGO, ' +
                                      'AF_CODIGO ' +
                                      'from ' +
                                      'AI01 ' +
                                      'inner join AD01 on AD_CODCHK = '+QuotedStr(HWS_Novo_CheckList)+' and AD_CODANT = AI_CODPER ' +
                                      'inner join AF01 on AF_CODCHK = '+QuotedStr(HWS_Novo_CheckList)+' and AF_CODANT = AI_CODRES ' +
                                      'where ' +
                                      'AI_CODCHK = ' + QuotedStr(HWS_Codigo);
         HWS_Query_Insert.ExecSQL();
         // Inserindo as perguntas de restricoes do checklist
         HWS_Query_Insert.Close;
         HWS_Query_Insert.SQL.Text := 'insert into ' +
                                      'AJ01 ' +
                                      '(AJ_CODCHK, AJ_CODGRP, AJ_CODRES, AJ_QTDRESTR) ' +
                                      'select ' +
                                      QuotedStr(HWS_Novo_CheckList) + ',' +
                                      'AB_CODIGO, ' +
                                      'AF_CODIGO, ' +
                                      'AJ_QTDRESTR ' +
                                      'from ' +
                                      'AJ01 ' +
                                      'inner join AB01 on AB_CODCHK = '+QuotedStr(HWS_Novo_CheckList)+' and AB_CODANT = AJ_CODGRP ' +
                                      'inner join AF01 on AF_CODCHK = '+QuotedStr(HWS_Novo_CheckList)+' and AF_CODANT = AJ_CODRES ' +
                                      'where ' +
                                      'AJ_CODCHK = ' + QuotedStr(HWS_Codigo);
         HWS_Query_Insert.ExecSQL();
         Result.Add('S');
         Result.Add('');
         // Confirma a transacao
         HWS_SQLConnection_Banco_Cliente.Commit(HWS_Transacao);
         except on E: Exception do
            begin
               // Cancela a Transacao
               HWS_SQLConnection_Banco_Cliente.Rollback(HWS_Transacao);
               Result.Add('N');
               Result.Add(E.ToString);
         end;
      end;
   finally
      HWS_Query.Free;
      HWS_Query_Insert.Free;
   end;
end;

function THWS_ServerMethods.F_HWS_RetornaCheckListPerguntas(HWS_App: String): TDBXReader;
var HWS_Comando: TDBXCommand;
begin
   HWS_Comando := HWS_SQLConnection_Banco_Cliente.DBXConnection.CreateCommand;
   HWS_Comando.CommandType := TDBXCommandTypes.DbxSQL;
   HWS_Comando.Text :=  'select ' +
                        'cast(A9_CODIGO as char) as A9_CODIGO, ' +
                        'A9_DESC, ' +
                        'cast(AA_CODIGO as char) as AA_CODIGO, ' +
                        'cast(AA_CODERP as char) as AA_CODERP, ' +
                        'AA_DESC, ' +
                        'cast(AB_CODIGO as char) as AB_CODIGO, ' +
                        'AB_DESC, ' +
                        'cast(AD_CODIGO as char) as AD_CODIGO, ' +
                        'AD_PERGUNTA, ' +
                        'AD_TIPO, ' +
                        'cast(AF_CODIGO as char) as AF_CODIGO, ' +
                        'AF_RESPOSTA, ' +
                        'cast(AH_ID as char) as AH_ID, ' +
                        'case when isnull(AG_PERFILHA) then '+QuotedStr('')+' else cast(AG_PERFILHA as char) end as AG_PERFILHA, ' +
                        'case when isnull(AI_CODPER) then '+QuotedStr('')+' else cast(AI_CODPER as char) end as AI_CODPER,' +
                        'case when isnull(AJ_QTDRESTR) then '+QuotedStr('')+' else cast(AJ_QTDRESTR as char) end as AJ_QTDRESTR, ' +
                        'AH_FOTO ' +
                        'from ' +
                        'A901 ' +
                        'inner join AA01 on AA_CODCHK = A9_CODIGO ' + { Cadastro de Implementos}
                        'inner join AC01 on AC_CODCHK = A9_CODIGO and AC_CODTIPO = AA_CODIGO ' + {Implementos X Grupo de Perguntas}
                        'inner join AB01 on AB_CODCHK = A9_CODIGO and AB_CODIGO = AC_CODGRUPO ' + {Cadastro de Grupos de Perguntas}
                        'inner join AE01 on AE_CODCHK = A9_CODIGO and AE_GRUPO = AB_CODIGO ' + {Grupo de Perguntas X Perguntas}
                        'inner join AD01 on AD_CODCHK = A9_CODIGO and AD_CODIGO = AE_CODPER ' + {Cadastro de Perguntas}
                        'inner join AH01 on AH_CODCHK = A9_CODIGO and AH_CODPER = AD_CODIGO ' + {Perguntas X Respostas}
                        'inner join AF01 on AF_CODCHK = A9_CODIGO and AF_CODIGO = AH_CODRES ' + {Cadastro de Respostas}
                        'left join  AG01 on AG_CODCHK = A9_CODIGO and AG_PERPAI = AD_CODIGO and AG_CODRESPAI = AF_CODIGO ' + {Perguntas Filhas}
                        'left join  AI01 on AI_CODCHK = A9_CODIGO and AI_CODPER = AD_CODIGO and AI_CODRES = AF_CODIGO ' + {Perguntas de Reprovacao}
                        'left join  AJ01 on AJ_CODCHK = A9_CODIGO and AJ_CODGRP = AB_CODIGO and AJ_CODRES = AF_CODIGO ' + {Perguntas de Restricoes}
                        'where ' +
                        'A9_CODIGO = ' + QuotedStr(F_HWS_RetornaCheckListAtivo(HWS_App)) +
                        ' order by ' +
                        'A9_CODIGO, ' +
                        'AA_CODIGO, ' +
                        'AB_CODIGO, ' +
                        'AD_CODIGO, ' +
                        'AF_CODIGO, ' +
                        'AG_PERFILHA, ' +
                        'AI_CODPER, ' +
                        'AJ_QTDRESTR ';
   if not HWS_Comando.IsPrepared then
      HWS_Comando.Prepare;
   Result := HWS_Comando.ExecuteQuery;
end;

function THWS_ServerMethods.F_HWS_RetornaStatusChip(HWS_Chip: String): TJSONArray;
var HWS_Query: TSQLQuery;
begin
   Result := TJSONArray.Create;
   try
      HWS_Query := TSQLQuery.Create(Self);
      // Retorna o Status do Chip
      HWS_Query.SQLConnection := HWS_SQLConnection_Banco_HWS;
      HWS_Query.SQL.Text := 'select ' +
                            'HD_CODCLI,' +
                            'HD_STATUS ' +
                            'from '+
                            'HD01 '+
                            'where '+
                            'HD_CHIP = '+ QuotedStr(Trim(HWS_Chip));
      HWS_Query.Open;
      if HWS_Query.Eof then begin
         Result.Add('N');
         Result.Add('O chip ' + HWS_Chip + ' não está cadastrado no sistema. Entre em contato com o Administrador do Sistema.');
      end else if HWS_Query.FieldByName('HD_STATUS').AsString = '2' then begin
         Result.Add('N');
         Result.Add('O chip ' + HWS_Chip + ' está desabilitado. Entre em contato com o Administrador do Sistema.');
      end else begin
         Result.Add('S');
         Result.Add(HWS_Query.FieldByName('HD_CODCLI').AsString);
      end;
   finally
      HWS_Query.Free;
   end;
end;


function THWS_ServerMethods.F_HWS_GravaCheckListRealizado(HWS_Chip: String; HWS_Dados: TJSONArray): TJSONArray;
var X: Integer;
    HWS_Registro: TJSONArray;
    HWS_Query: TSQLQuery;
    HWS_Max: String;
    HWS_Transacao: TTransactionDesc;
    HWS_BB_PLACA,HWS_BB_PERGUNTA,HWS_BB_ID, HWS_A9_CODIGO, HWS_BB_OBS, HWS_BB_STATUS, HWS_BB_CODUSER: String;
begin
   Writeln('1');
   Result := TJSONArray.Create;
   Writeln('2');
   HWS_Transacao.TransactionID := 30;
   Writeln('3');
   HWS_SQLConnection_Banco_Cliente.StartTransaction(HWS_Transacao);
   Writeln('4');
   try
      HWS_Query := TSQLQuery.Create(Self);
      HWS_Query.SQLConnection := HWS_SQLConnection_Banco_Cliente;
      Writeln('5');
      HWS_Registro := TJSONArray.Create;
      for X := 0 to HWS_Dados.Size-1 do begin
         HWS_Registro := (HWS_Dados.Get(X) as TJSONArray);
         HWS_BB_PLACA      := HWS_Registro.Get(0).Value;
         HWS_BB_PERGUNTA   := HWS_Registro.Get(1).Value;
         HWS_BB_ID         := HWS_Registro.Get(2).Value;
         HWS_A9_CODIGO     := HWS_Registro.Get(3).Value;
         HWS_BB_OBS        := HWS_Registro.Get(4).Value;
         HWS_BB_STATUS     := HWS_Registro.Get(5).Value;
         HWS_BB_CODUSER    := HWS_Registro.Get(6).Value;
         if X = 0 then begin
            // Inserindo na tabela BB01
            HWS_Query.Close;
            HWS_Query.SQL.Text := 'insert into ' +
                                  'BB01 ' +
                                  '(BB_CODCHK, BB_PLACA, BB_CHIP, BB_DTCHECK, BB_HRCHECK, BB_OBS, BB_STATUS, BB_CODUSER) ' +
                                  'values ' +
                                  '(:BB_CODCHK, :BB_PLACA, :BB_CHIP, :BB_DTCHECK, :BB_HRCHECK, :BB_OBS, :BB_STATUS, :BB_CODUSER)';
            HWS_Query.ParamByName('BB_CODCHK').AsString  := HWS_A9_CODIGO;
            HWS_Query.ParamByName('BB_PLACA').AsString   := HWS_BB_PLACA;
            HWS_Query.ParamByName('BB_CHIP').AsString    := HWS_Chip;
            HWS_Query.ParamByName('BB_DTCHECK').AsDate   := Date;
            HWS_Query.ParamByName('BB_HRCHECK').AsString := Copy(TimeToStr(Time),1,5);
            HWS_Query.ParamByName('BB_OBS').AsString     := HWS_BB_OBS;
            HWS_Query.ParamByName('BB_STATUS').AsString  := HWS_BB_STATUS;
            HWS_Query.ParamByName('BB_CODUSER').AsString  := HWS_BB_CODUSER;
            Writeln('6');
            HWS_Query.ExecSQL();
            Writeln('7');
            // Buscando o codigo que foi gerado
            HWS_Query.Close;
            HWS_Query.SQL.Text := 'select ' +
                                  'max(BB_CODIGO) as BB_CODIGO ' +
                                  'from ' +
                                  'BB01 ' +
                                  'where ' +
                                  'BB_CODCHK    = :BB_CODCHK and ' +
                                  'BB_CHIP      = :BB_CHIP and ' +
                                  'BB_PLACA     = :BB_PLACA and ' +
                                  'BB_DTCHECK   = :BB_DTCHECK';
            HWS_Query.ParamByName('BB_CODCHK').AsString  := HWS_A9_CODIGO;
            HWS_Query.ParamByName('BB_CHIP').AsString    := HWS_Chip;
            HWS_Query.ParamByName('BB_PLACA').AsString   := HWS_BB_PLACA;
            HWS_Query.ParamByName('BB_DTCHECK').AsDate   := Date;
            Writeln('8');
            HWS_Query.Open;
            Writeln('9');
            HWS_Max := HWS_Query.FieldByName('BB_CODIGO').AsString;
         end;
         HWS_Query.Close;
         HWS_Query.SQL.Text := 'insert into ' +
                               'BC01 ' +
                               '(BC_CODCHK, BC_CODIGO, BC_CODPER, BC_ID) ' +
                               'values ' +
                               '(:BC_CODCHK, :BC_CODIGO, :BC_CODPER, :BC_ID)';
         HWS_Query.ParamByName('BC_CODCHK').AsString  := HWS_A9_CODIGO;
         HWS_Query.ParamByName('BC_CODIGO').AsString  := HWS_Max;
         HWS_Query.ParamByName('BC_CODPER').AsString  := HWS_BB_PERGUNTA;
         HWS_Query.ParamByName('BC_ID').AsString      := HWS_BB_ID;
         Writeln('10');
         HWS_Query.ExecSQL();
         Writeln('11');
      end;
      // Confirma a Transacao
      Writeln('12');
      HWS_SQLConnection_Banco_Cliente.Commit(HWS_Transacao);
      Writeln('13');
      Result.Add('S');
      Result.Add('');
   except on E: Exception do
      begin
         // Cancela a Transacao
         Writeln('14');
         HWS_SQLConnection_Banco_Cliente.Rollback(HWS_Transacao);
         Writeln('15');
         Result.Add('N');
         Result.Add(E.ToString);
      end;
   end;
end;

function THWS_ServerMethods.F_HWS_RetornaCheckListAtivo(HWS_App: String): String;
var HWS_Query: TSQLQuery;
begin
   try
      HWS_Query := TSQLQuery.Create(Self);
      HWS_Query.SQLConnection := HWS_SQLConnection_Banco_Cliente;
      HWS_Query.SQL.Text := 'select ' +
                            'A9_CODIGO ' +
                            'from ' +
                            'A901 ' +
                            'where ' +
                            'A9_APP = ' + QuotedStr(HWS_App) + ' and ' +
                            'A9_STATUS = ' + QuotedStr('1'); //Ativo
      HWS_Query.Open;
      Result := HWS_Query.FieldByName('A9_CODIGO').AsString;
   finally
      HWS_Query.Free;
   end;
end;

function THWS_ServerMethods.F_HWS_ExisteNovoCheckList(HWS_App: String; HWS_CheckListAtual: String): TJSONArray;
begin
   Result := TJSONArray.Create;
   if Trim(F_HWS_RetornaCheckListAtivo(HWS_App)) <> Trim(HWS_CheckListAtual) then
      Result.Add('S')
   else
      Result.Add('N');
end;

function THWS_ServerMethods.F_HWS_RetornaEstruturaDasPerguntas(HWS_CheckList: String): TDBXReader;
var HWS_Comando: TDBXCommand;
begin
   HWS_Comando := HWS_SQLConnection_Banco_Cliente.DBXConnection.CreateCommand;
   HWS_Comando.CommandType := TDBXCommandTypes.DbxSQL;
   HWS_Comando.Text :=  '/*PERGUNTA PAI*/ ' +
                        'select ' +
                        'AD_SEQ, ' +
                        'AE_GRUPO, ' +
                        'AD_CODIGO as PAI, ' +
                        QuotedStr('') + ' as FILHA,' +
                        QuotedStr('') + ' as FILHADAFILHA,' +
                        'AD_PERGUNTA,' +
                        QuotedStr('01') + ' as NIVEL ' +
                        'from ' +
                        'AD01 ' +
                        'inner join AE01 on AE_CODCHK = AD_CODCHK and AE_CODPER = AD_CODIGO ' +
                        'where ' +
                        'AD_CODCHK = ' + QuotedStr(HWS_CheckList)+ ' and ' +
                        'AD_CODIGO not in ' +
                        '( ' +
                        ' select ' +
                        ' AG_PERFILHA ' +
                        ' from ' +
                        ' AG01 ' +
                        ' where AG_CODCHK = ' + QuotedStr(HWS_CheckList) +
                        ') ' +
                        '' +
                        ' union all ' +
                        '' +
                        '/*PERGUNTA FILHAS DA PAI*/' +
                        'select ' +
                        'AD_SEQ, ' +
                        'AE_GRUPO, ' +
                        'A.AG_PERPAI as PAI, ' +
                        'A.AG_PERFILHA as FILHA, ' +
                        QuotedStr('') +  ' as FILHADAFILHA,' +
                        'AD_PERGUNTA, ' +
                        QuotedStr('02') + ' as NIVEL ' +
                        'from ' +
                        'AG01 as A ' +
                        'inner join AD01 on AD_CODCHK = A.AG_CODCHK and AD_CODIGO = A.AG_PERFILHA ' +
                        'inner join AE01 on AE_CODCHK = A.AG_CODCHK and AE_CODPER = A.AG_PERFILHA ' +
                        'where ' +
                        'A.AG_CODCHK = ' + QuotedStr(HWS_CheckList) + ' and ' +
                        'A.AG_PERPAI in ' +
                        '(' +
                        '	select ' +
                        '	P.AD_CODIGO ' +
                        '	from ' +
                        '	AD01 as P ' +
                        '	where ' +
                        '	P.AD_CODCHK = ' + QuotedStr(HWS_CheckList) + ' and ' +
                        '	P.AD_CODIGO not in ' +
                        '	(' +
                        '	 select ' +
                        '	 S.AG_PERFILHA ' +
                        '	 from ' +
                        '	 AG01 as S ' +
                        '	 where ' +
                        '	 S.AG_CODCHK = ' + QuotedStr(HWS_CheckList) +
                        '	) ' +
                        ') ' +
                        '' +
                        ' union all ' +
                        '' +
                        '/*PERGUNTA FILHAS DA FILHAS*/ ' +
                        'select ' +
                        'D.AD_SEQ, ' +
                        'AE_GRUPO, ' +
                        'Z.AG_PERPAI as PAI, ' +
                        'H.AG_PERPAI as FILHA, ' +
                        'H.AG_PERFILHA as FILHADAFILHA, ' +
                        'D.AD_PERGUNTA, ' +
                        QuotedStr('03') + ' as NIVEL ' +
                        'from ' +
                        'AG01 as H ' +
                        'inner join AD01 as D on D.AD_CODCHK = H.AG_CODCHK and D.AD_CODIGO = H.AG_PERFILHA ' +
                        'inner join AG01 as Z on Z.AG_CODCHK = H.AG_CODCHK and Z.AG_PERFILHA = H.AG_PERPAI ' +
                        'inner join AE01 on AE_CODCHK = H.AG_CODCHK and AE_CODPER = H.AG_PERFILHA ' +
                        'where ' +
                        'H.AG_CODCHK = ' + QuotedStr(HWS_CheckList) + ' and ' +
                        'H.AG_PERPAI in ' +
                        '( ' +
                        '	select ' +
                        '	A.AG_PERFILHA ' +
                        '	from ' +
                        '	AG01 as A ' +
                        '	inner join AD01 on AD_CODCHK = A.AG_CODCHK and AD_CODIGO = A.AG_PERFILHA ' +
                        '	where ' +
                        '	A.AG_CODCHK = ' + QuotedStr(HWS_CheckList) + ' and ' +
                        '	A.AG_PERPAI in ' +
                        '	(' +
                        '		select ' +
                        '		P.AD_CODIGO ' +
                        '		from ' +
                        '		AD01 as P ' +
                        '		where ' +
                        '		P.AD_CODCHK = ' +QuotedStr(HWS_CheckList) + ' and ' +
                        '		P.AD_CODIGO not in ' +
                        '		( ' +
                        '		 select ' +
                        '		 S.AG_PERFILHA ' +
                        '		 from ' +
                        '		 AG01 as S ' +
                        '		 where ' +
                        '		 S.AG_CODCHK = '+ QuotedStr(HWS_CheckList) +
                        '		) ' +
                        '	) ' +
                        ') ' +
                        ' order by AD_SEQ,AE_GRUPO,PAI,FILHA,FILHADAFILHA ';
   if not HWS_Comando.IsPrepared then
      HWS_Comando.Prepare;
   Result := HWS_Comando.ExecuteQuery;
end;

function THWS_ServerMethods.F_HWS_PodeExcluirPerguntaFilha(HWS_CheckList: String; HWS_Pergunta: String): String;
var HWS_Query: TSQLQuery;
begin
   try
      HWS_Query := TSQLQuery.Create(Self);
      HWS_Query.SQLConnection := HWS_SQLConnection_Banco_Cliente;
      HWS_Query.SQL.Text := 'select ' +
                            'count(*) as AH_CODPER ' +
                            'from ' +
                            'AH01 ' +
                            'inner join BC01 on BC_CODCHK = AH_CODCHK and BC_ID = AH_ID ' +
                            'where ' +
                            'AH_CODCHK = ' + QuotedStr(HWS_CheckList) + ' and ' +
                            'AH_CODPER = ' + QuotedStr(HWS_Pergunta);
      HWS_Query.Open;
      if HWS_Query.FieldByName('AH_CODPER').AsInteger > 0 then
         Result := 'N'
      else
         Result := 'S';
   finally
      HWS_Query.Free;
   end;
end;

function THWS_ServerMethods.F_HWS_ExcluirPerguntaFilha(HWS_CheckList: String; HWS_PerguntaPai: String; HWS_PerguntaFilha: String): TJSONArray;
var HWS_Query: TSQLQuery;
    HWS_Transacao: TTransactionDesc;
begin
   HWS_Transacao.TransactionID := 40;
   Result := TJSONArray.Create;
   try
      try
         HWS_SQLConnection_Banco_Cliente.StartTransaction(HWS_Transacao);
         HWS_Query := TSQLQuery.Create(Self);
         HWS_Query.SQLConnection := HWS_SQLConnection_Banco_Cliente;
         HWS_Query.SQL.Text := 'delete ' +
                               'from ' +
                               'AG01 ' +
                               'where ' +
                               'AG_CODCHK = ' + QuotedStr(HWS_CheckList) + ' and ' +
                               'AG_PERPAI = ' + QuotedStr(HWS_PerguntaPai) + ' and ' +
                               'AG_PERFILHA = ' + QuotedStr(HWS_PerguntaFilha);
         HWS_Query.ExecSQL();
         Result.Add('S');
         Result.Add('');
         HWS_SQLConnection_Banco_Cliente.Commit(HWS_Transacao);
      except on E: Exception do
         begin
            HWS_SQLConnection_Banco_Cliente.Rollback(HWS_Transacao);
            Result.Add('N');
            Result.Add(E.ToString);
         end;
      end;
   finally
      HWS_Query.Free;
   end;
end;

function THWS_ServerMethods.F_HWS_PodeExcluirPerguntaReprovacao(HWS_CheckList: String; HWS_Pergunta: String): String;
var HWS_Query: TSQLQuery;
begin
   try
      HWS_Query := TSQLQuery.Create(Self);
      HWS_Query.SQLConnection := HWS_SQLConnection_Banco_Cliente;
      HWS_Query.SQL.Text := 'select ' +
                            'count(*) as AI_CODPER ' +
                            'from ' +
                            'AI01 ' +
                            'inner join AH01 on AH_CODCHK = AI_CODCHK and AH_CODPER = AI_CODPER ' +
                            'inner join BC01 on BC_CODCHK = AI_CODCHK and BC_ID = AH_ID ' +
                            'where ' +
                            'AI_CODCHK = ' + QuotedStr(HWS_CheckList) +' and ' +
                            'AI_CODPER = ' + QuotedStr(HWS_Pergunta);
      HWS_Query.Open;
      if HWS_Query.FieldByName('AI_CODPER').AsInteger > 0 then
         Result := 'N'
      else
         Result := 'S';
   finally
      HWS_Query.Free;
   end;
end;

function THWS_ServerMethods.F_HWS_PodeExcluirRestricao(HWS_CheckList: String; HWS_GrupoPergunta: String): String;
var HWS_Query: TSQLQuery;
begin
   try
      HWS_Query := TSQLQuery.Create(Self);
      HWS_Query.SQLConnection := HWS_SQLConnection_Banco_Cliente;
      HWS_Query.SQL.Text := 'select ' +
                            'count(*) as AJ_CODGRP ' +
                            'from ' +
                            'AJ01 ' +
                            'inner join AE01 on AE_CODCHK = AJ_CODCHK and AE_GRUPO = AJ_CODGRP ' +
                            'inner join AH01 on AH_CODCHK = AJ_CODCHK and AH_CODPER = AE_CODPER ' +
                            'inner join BC01 on BC_CODCHK = AJ_CODCHK and BC_ID = AH_ID ' +
                            'where ' +
                            'AJ_CODCHK = '+QuotedStr(HWS_CheckList)+' and ' +
                            'AJ_CODGRP = '+QuotedStr(HWS_GrupoPergunta);
      HWS_Query.Open;
      if HWS_Query.FieldByName('AJ_CODGRP').AsInteger > 0 then
         Result := 'N'
      else
         Result := 'S';
   finally
      HWS_Query.Free;
   end;
end;

function THWS_ServerMethods.F_HWS_RetornaUsuarioDoMobile(HWS_CodCliente: String): TDBXReader;
var HWS_Comando: TDBXCommand;
begin
   HWS_Comando := HWS_SQLConnection_Banco_HWS.DBXConnection.CreateCommand;
   HWS_Comando.CommandType := TDBXCommandTypes.DbxSQL;
   HWS_Comando.Text :=  'select ' +
                        'cast(HI_CODIGO as char) as HI_CODIGO, ' +
                        'HI_NOME, ' +
                        'HI_EMAIL,' +
                        'HI_USER, ' +
                        'HI_SENHA, ' +
                        'HI_RESENHA ' +
                        'from ' +
                        'HI01 ' +
                        'where ' +
                        'HI_CODEMP = ' + QuotedStr(HWS_CodCliente);
   if not HWS_Comando.IsPrepared then
      HWS_Comando.Prepare;
   Result := HWS_Comando.ExecuteQuery;
end;

function THWS_ServerMethods.F_HWS_RetornaVeiculos(HWS_Chip: String; HWS_MaxId: String) : TDBXReader;
var HWS_Comando: TDBXCommand;
begin
   HWS_Comando := HWS_SQLConnection_Banco_Cliente.DBXConnection.CreateCommand;
   HWS_Comando.CommandType := TDBXCommandTypes.DbxSQL;
   HWS_Comando.Text :=  'select ' +
                        'BA_PLACA, ' +
                        'cast(BA_TIPO as char) as BA_TIPO, ' +
                        'BA_DESC, ' +
                        'cast(BA_ID as char) as BA_ID ' +
                        'from ' +
                        'BA01 ' +
                        'where ' +
                        'BA_CHIP = ' + QuotedStr(HWS_Chip) + ' and ' +
                        'BA_ID > ' + HWS_MaxId +
                        ' order by ' +
                        'BA_PLACA ';
   if not HWS_Comando.IsPrepared then
      HWS_Comando.Prepare;
   Result := HWS_Comando.ExecuteQuery;
end;

function THWS_ServerMethods.F_HWS_RetornaCheckListsRealizados(HWS_DaData, HWS_AteData, HWS_DaPlaca, HWS_AtePlaca, HWS_DoStatus, HWS_AteStatus: String) : TDBXReader;
var HWS_Comando: TDBXCommand;
begin
   HWS_Comando := HWS_SQLConnection_Banco_Cliente.DBXConnection.CreateCommand;
   HWS_Comando.CommandType := TDBXCommandTypes.DbxSQL;
   HWS_Comando.Text :=  'select ' +
                        'BB_PLACA,' +
                        'HI_USER,' +
                        'cast(BB_DTCHECK as char) as BB_DTCHECK,'+
                        'BB_HRCHECK,'+
                        'BB_OBS,'+
                        'case when BB_STATUS = ' + QuotedStr('01') + ' then ' + QuotedStr('01-CheckList Aprovado') + ' else ' +
                        'case when BB_STATUS = ' + QuotedStr('02') + ' then ' + QuotedStr('02-CheckList Aprovado com Restrições') + ' else ' +
                        'case when BB_STATUS = ' + QuotedStr('03') + ' then ' + QuotedStr('03-CheckList Reprovado') + ' end end end as BB_STATUS ' +
                        'from ' +
                        'BB01 ' +
                        'inner join `hwsmobile`.hi01 on HI_CODIGO = BB_CODUSER ' +
                        'where ' +
                        'BB_DTCHECK between '+QuotedStr(FormatDateTime('yyyy-mm-dd', StrToDate(HWS_DaData))) +' and '+QuotedStr(FormatDateTime('yyyy-mm-dd', StrToDate(HWS_AteData)))+' and ' +
                        'BB_PLACA between '+QuotedStr(HWS_DaPlaca)+' and '+QuotedStr(HWS_AtePlaca)+' and ' +
                        'BB_STATUS between '+QuotedStr(HWS_DoStatus)+' and '+QuotedStr(HWS_AteStatus) +
                        ' order by ' +
                        'BB_PLACA,'+
                        'BB_DTCHECK,'+
                        'BB_HRCHECK ';
   if not HWS_Comando.IsPrepared then
      HWS_Comando.Prepare;
   Result := HWS_Comando.ExecuteQuery;
end;

function THWS_ServerMethods.F_HWS_RetornaChkExp(HWS_CodEmpresa, HWS_tipoIni, HWS_tipoEnd:String) : TDBXReader;
var HWS_Comando: TDBXCommand;
    HWS_wherelen: String;
begin
   if (HWS_tipoIni<>'') then
      HWS_wherelen:= 'BB_CODIGO between '+HWS_tipoIni+' and '+HWS_tipoEnd
   else HWS_wherelen:= 'BB_CODIGO > (select case when max(EX_COD_END) is null then 0 else max(EX_COD_END) end from EX01)';
   HWS_Comando := HWS_SQLConnection_Banco_Cliente.DBXConnection.CreateCommand;
   HWS_Comando.CommandType := TDBXCommandTypes.DbxSQL;
   HWS_Comando.Text :=  'select ' +
                        'LPAD(cast(BB_CODIGO as char),8,0) AS BB_CODIGO, BB_PLACA, cast(BB_DTCHECK as char) AS BB_DTCHECK, cast(BB_HRCHECK as char) AS BB_HRCHECK, BB_OBS, BB_STATUS, HI_USER ' +
                        'from ' +
                        'BB01 ' +
                        'inner join `hwsmobile`.HI01 on HI_CODEMP = ' +  QuotedStr(HWS_CodEmpresa) + ' and HI_CODIGO = BB_CODUSER ' +
                        'where ' +
                        HWS_wherelen +
                        ' order by ' +
                        'BB_CODIGO ';
   if not HWS_Comando.IsPrepared then
      HWS_Comando.Prepare;
   Result := HWS_Comando.ExecuteQuery;
end;

function THWS_ServerMethods.F_HWS_RetornaReExp : TDBXReader;
var HWS_Comando: TDBXCommand;
begin
   HWS_Comando := HWS_SQLConnection_Banco_Cliente.DBXConnection.CreateCommand;
   HWS_Comando.CommandType := TDBXCommandTypes.DbxSQL;
   HWS_Comando.Text :=  'select ' +
                        'LPAD(cast(EX_ID as char),8,0) AS EX_ID, cast(EX_COD_INI as char) AS EX_COD_INI, cast(EX_COD_END as char) AS EX_COD_END ' +
                        'from ' +
                        'EX01 ' +
                        'where ' +
                        'EX_REEXP = '+QuotedStr('-1')+
                        ' order by ' +
                        'EX_ID ';
   if not HWS_Comando.IsPrepared then
      HWS_Comando.Prepare;
   Result := HWS_Comando.ExecuteQuery;
end;

function THWS_ServerMethods.F_HWS_InsertChkExp(HWS_ChkCodIni, HWS_ChkCodEnd, HWS_ChkIdExp: String): TJSONArray;
var HWS_Query: TSQLQuery;
    HWS_Transacao: TTransactionDesc;
    HWS_DataHora: TDateTime;
begin
   HWS_Transacao.TransactionID := 50;
   HWS_DataHora := Now;
   Result := TJSONArray.Create;
   try
      try
         HWS_SQLConnection_Banco_Cliente.StartTransaction(HWS_Transacao);
         HWS_Query := TSQLQuery.Create(Self);
         HWS_Query.SQLConnection := HWS_SQLConnection_Banco_Cliente;
         HWS_Query.SQL.Text := 'insert ' +
                               'into ' +
                               'EX01 ' +
                               '(EX_COD_INI, EX_COD_END, EX_DATA, EX_REEXP) ' +
                               'values('+QuotedStr(HWS_ChkCodIni)+','+
                                         QuotedStr(HWS_ChkCodEnd)+','+
                                         QuotedStr(FormatDateTime('yyyy-mm-dd hh:nn:ss', HWS_DataHora))+','+
                                         QuotedStr('0')+')';
         HWS_Query.ExecSQL();
         ///////////
         if (HWS_ChkIdExp<>'') then begin
            HWS_Query.Close;
            HWS_Query.SQLConnection := HWS_SQLConnection_Banco_Cliente;
            HWS_Query.SQL.Text := 'update ' +
                                  'EX01 ' +
                                  'set EX_REEXP='+QuotedStr('0')+' '+
                                  'where EX_ID='+QuotedStr(HWS_ChkIdExp);
            HWS_Query.ExecSQL();
         end;
         ///////////
         HWS_Query.Close;
         HWS_Query.SQL.Text := 'select max(EX_ID) as EX_ID from EX01';
         HWS_Query.Open;
         Result.Add('S');
         Result.Add(FormatFloat('00000000',HWS_Query.FieldByName('EX_ID').AsInteger));
         Result.Add(FormatDateTime('yyyymmddhhnn', HWS_DataHora));
         HWS_SQLConnection_Banco_Cliente.Commit(HWS_Transacao);
      except on E: Exception do
         begin
            HWS_SQLConnection_Banco_Cliente.Rollback(HWS_Transacao);
            Result.Add('N');
            Result.Add(E.ToString);
         end;
      end;
   finally
      HWS_Query.Free;
   end;
end;

function THWS_ServerMethods.F_HWS_InsertChkPlacas(HWS_filePlacas: TJSONValue): TJSONArray;
var   HWS_ListaPlacas: TPlacasImport;
      HWS_Reverte: TJSONUnMarshal;
      HWS_Query: TSQLQuery;
      X: Integer;
      HWS_Transacao: TTransactionDesc;
      HWS_CODCLI,HWS_FILENAME,HWS_FILELINES,HWS_Placa,HWS_Operacao,HWS_CodErp,HWS_DescTipo: String;
      HWS_DataHora: TDateTime;
      procedure HWS_AjustFieldSize(var HWS_FieldValue:String; HWSFieldSize:Integer);
      var AjustLength:Integer;
      begin
          AjustLength:=Length(HWS_FieldValue);
          if AjustLength>HWSFieldSize then
             HWS_FieldValue:=Copy(HWS_FieldValue,0,HWSFieldSize);
      end;
begin
   try
      HWS_DataHora := Now;
      Result := TJSONArray.Create;
      HWS_Transacao.TransactionID := 60;
      // Inicia a Transacao
      HWS_SQLConnection_Banco_Cliente.StartTransaction(HWS_Transacao);
      HWS_Query := TSQLQuery.Create(Self);
      HWS_Query.SQLConnection := HWS_SQLConnection_Banco_Cliente;
      HWS_Reverte := TJSONUnMarshal.Create;
      HWS_ListaPlacas := HWS_Reverte.Unmarshal(HWS_filePlacas) as TPlacasImport;
      try
         if not HWS_SQLTable_AA01.Active then
            HWS_SQLTable_AA01.Open;
         HWS_CODCLI:= UpperCase(HWS_ListaPlacas.IM_CODCLI);
         HWS_FILENAME:= HWS_ListaPlacas.IM_FILENAME;
         HWS_FILELINES:= IntToStr(HWS_ListaPlacas.ListaPlacasImport.Count);
         for X:= 0 to HWS_ListaPlacas.ListaPlacasImport.Count - 1 do begin
             HWS_Placa:= UpperCase(HWS_ListaPlacas.ListaPlacasImport[X].IM_PLACA);
             HWS_AjustFieldSize(HWS_Placa,8);
             HWS_Operacao:= UpperCase(HWS_ListaPlacas.ListaPlacasImport[X].IM_OPERACAO);
             HWS_AjustFieldSize(HWS_Operacao,1);
             HWS_CodErp:= HWS_ListaPlacas.ListaPlacasImport[X].IM_CODTIPO;
             HWS_AjustFieldSize(HWS_CodErp,11);
             if HWS_SQLTable_AA01.Locate('AA_CODERP',HWS_CodErp,[]) then
                HWS_DescTipo:= HWS_SQLTable_AA01.FieldByName('AA_DESC').AsString
             else begin
                HWS_DescTipo:= HWS_ListaPlacas.ListaPlacasImport[X].IM_DESCTIPO;
                HWS_AjustFieldSize(HWS_DescTipo,120);
                HWS_Query.SQL.Text := 'insert ' +
                                      'into ' +
                                      'AA01 ' +
                                      '(AA_CODCHK, AA_DESC, AA_CODERP) ' +
                                      'values('+QuotedStr('1')+','+
                                                QuotedStr(HWS_DescTipo)+','+
                                                QuotedStr(HWS_CodErp)+')';
                HWS_Query.ExecSQL();
             end;
             HWS_Query.Close;
             if (HWS_Operacao = 'I') then begin
               HWS_Query.SQL.Text := 'select BA_PLACA from BA01 where BA_PLACA = ' + QuotedStr(HWS_Placa);
               HWS_Query.Open;
               if HWS_Query.Eof then begin
                 //insert
                 HWS_Query.SQL.Text := 'insert into ' +
                                       'BA01 ' +
                                       'select ' +
                                       'null as BA_ID, ' +
                                       QuotedStr(UpperCase(HWS_Placa))+' as BA_PLACA, ' +
                                       'HD_CHIP as BA_CHIP, ' +
                                       QuotedStr(HWS_CodErp)+' as BA_TIPO, ' +
                                       QuotedStr(HWS_DescTipo)+' as BA_DESC ' +
                                       'from ' +
                                       '`hwsmobile`.HD01 ' +
                                       'where ' +
                                       'HD_CODCLI = '+QuotedStr(HWS_CODCLI)+' and ' +
                                       QuotedStr(HWS_Placa)+' not in (select BA_PLACA from BA01 where BA_PLACA = '+QuotedStr(HWS_Placa)+' and BA_CHIP = HD_CHIP)';
                 HWS_Query.ExecSQL();
               end;
             end else if (HWS_Operacao = 'A') then begin
                //update
                 HWS_Query.SQL.Text := 'update ' +
                                       'BA01 ' +
                                       'set ' +
                                       'BA_TIPO = '+QuotedStr(HWS_CodErp)+', ' +
                                       'BA_DESC = '+QuotedStr(HWS_DescTipo) +
                                       'where ' +
                                       'BA_PLACA = '+QuotedStr(HWS_Placa);
                 HWS_Query.ExecSQL();
             end;
         end;
         HWS_Query.Close;
         HWS_Query.SQL.Text := 'insert ' +
                               'into ' +
                               'IM01 ' +
                               '(IM_FILE, IM_LINES, IM_DATA) ' +
                               'values('+QuotedStr(HWS_FILENAME)+','+
                                         QuotedStr(HWS_FILELINES)+','+
                                         QuotedStr(FormatDateTime('yyyy-mm-dd hh:nn:ss', HWS_DataHora))+
                                      ')';
         HWS_Query.ExecSQL();
         //Confirma a transacao
         HWS_SQLConnection_Banco_Cliente.Commit(HWS_Transacao);
         Result.Add('S');
         Result.Add('');
      except on E: Exception do
         begin
            // Cancela a Transacao
            HWS_SQLConnection_Banco_Cliente.Rollback(HWS_Transacao);
            Result.Add('N');
            Result.Add(E.ToString);
         end;
      end;
   finally
      HWS_SQLTable_AA01.Close;
      HWS_Query.Free;
      HWS_Reverte.Free;
      HWS_ListaPlacas.Free;
   end;
end;

function THWS_ServerMethods.F_HWS_InserirVeiculosNaInclusaoDoChip(HWS_Chip: String; HWS_CodCliente: String): TJSONArray;
var HWS_Query: TSQLQuery;
    HWS_Transacao: TTransactionDesc;
begin
   Result := TJSONArray.Create;
   HWS_Transacao.TransactionID := 70;
   HWS_SQLConnection_Banco_Cliente.StartTransaction(HWS_Transacao);
   try
      HWS_Query := TSQLQuery.Create(Self);
      HWS_Query.SQLConnection := HWS_SQLConnection_Banco_Cliente;
      HWS_Query.SQL.Text := 'insert ' +
                            'into ' +
                            'BA01 ' +
                            'select ' +
                            'null as BA_ID, ' +
                            'BA_PLACA, ' +
                            QuotedStr(HWS_Chip) + ' as BA_CHIP,' +
                            'BA_TIPO,' +
                            'BA_DESC ' +
                            'from ' +
                            'BA01 ' +
                            'where ' +
                            'BA_CHIP = (select HD_CHIP from `hwsmobile`.HD01 inner join BA01 as B on B.BA_CHIP = HD_CHIP where HD_CODCLI = ' + QuotedStr(HWS_CodCliente) + ' limit 1)';
      HWS_Query.ExecSQL();
      Result.Add('S');
      Result.Add('');
      HWS_SQLConnection_Banco_Cliente.Commit(HWS_Transacao);
   except on E: Exception do
      begin
         HWS_SQLConnection_Banco_Cliente.Rollback(HWS_Transacao);
         Result.Add('N');
         Result.Add(E.ToString);
      end;
   end;
end;

function THWS_ServerMethods.F_HWS_ImpressaoCheckListsAnalitico_Detalhe(HWS_CodEmpresa, HWS_CheckList, HWS_DaData, HWS_AteData, HWS_DaPlaca, HWS_AtePlaca, HWS_DoStatus, HWS_AteStatus: String): TDBXReader;
var HWS_Comando: TDBXCommand;
begin
   HWS_Comando := HWS_SQLConnection_Banco_Cliente.DBXConnection.CreateCommand;
   HWS_Comando.CommandType := TDBXCommandTypes.DbxSQL;
   HWS_Comando.Text :=  'call hws_retornarespostasdochecklist(' + HWS_CodEmpresa + ',' +
                                                                  HWS_CheckList  + ',' +
                                                                  QuotedStr(HWS_DaData)     + ',' +
                                                                  QuotedStr(HWS_AteData)    + ',' +
                                                                  QuotedStr(HWS_DaPlaca)    + ',' +
                                                                  QuotedStr(HWS_AtePlaca)    + ',' +
                                                                  QuotedStr(HWS_DoStatus)   + ',' +
                                                                  QuotedStr(HWS_AteStatus)  + ')';
   if not HWS_Comando.IsPrepared then
      HWS_Comando.Prepare;
   Result := HWS_Comando.ExecuteQuery;
   WriteLn(HWS_Comando.Text);
end;

function THWS_ServerMethods.F_HWS_RecebeImagens(HWS_Imagem: TJSONObject; HWS_Tamanho: Integer): TJSONArray;
var HWS_GravaImagem: TJPEGImage;
    HWS_MStream: TMemoryStream;
    HWS_DataBytes: TArray<Byte>;
    HWS_ByteStream: TBytesStream;
    HWS_JSONPairNomeDaImagem: TJSONPair;
    HWS_JSONPairImagem: TJSONPair;
    HWS_DecoderString: String;
begin
   SetLength(HWS_DataBytes,HWS_Tamanho);
   HWS_JSONPairImagem := TJSONPair.Create;
   HWS_JSONPairImagem := HWS_Imagem.Get('imagem');

   HWS_JSONPairNomeDaImagem := TJSONPair.Create;
   HWS_JSONPairNomeDaImagem := HWS_Imagem.Get('nome');

   HWS_DecoderString := DecodeString(HWS_JSONPairImagem.JsonValue.ToString);
   HWS_DataBytes  := BytesOf(HWS_DecoderString);
   HWS_ByteStream := TBytesStream.Create(HWS_DataBytes);

   HWS_MStream := TMemoryStream.Create;
   HWS_MStream.LoadFromStream(HWS_ByteStream);

   HWS_ByteStream.SaveToFile(StringReplace(HWS_JSONPairNomeDaImagem.JsonValue.ToString,'"','',[rfReplaceAll]));
   Result := TJSONArray.Create;

end;

end.

