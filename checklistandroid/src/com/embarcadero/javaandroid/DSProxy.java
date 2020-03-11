// 
// Created by the DataSnap proxy generator.
// 25/05/2012 19:49:03
// 

package com.embarcadero.javaandroid;

import java.util.Date;

public class DSProxy {
  public static class THWS_ServerMethods extends DSAdmin {
    public THWS_ServerMethods(DSRESTConnection Connection) {
      super(Connection);
    }
    
    
    private DSRESTParameterMetaData[] THWS_ServerMethods_DSServerModuleCreate_Metadata;
    private DSRESTParameterMetaData[] get_THWS_ServerMethods_DSServerModuleCreate_Metadata() {
      if (THWS_ServerMethods_DSServerModuleCreate_Metadata == null) {
        THWS_ServerMethods_DSServerModuleCreate_Metadata = new DSRESTParameterMetaData[]{
          new DSRESTParameterMetaData("Sender", DSRESTParamDirection.Input, DBXDataTypes.JsonValueType, "TObject"),
        };
      }
      return THWS_ServerMethods_DSServerModuleCreate_Metadata;
    }

    /**
     * @param Sender [in] - Type on server: TObject
     */
    public void DSServerModuleCreate(TJSONObject Sender) throws DBXException {
      DSRESTCommand cmd = getConnection().CreateCommand();
      cmd.setRequestType(DSHTTPRequestType.POST);
      cmd.setText("THWS_ServerMethods.DSServerModuleCreate");
      cmd.prepare(get_THWS_ServerMethods_DSServerModuleCreate_Metadata());
      cmd.getParameter(0).getValue().SetAsJSONValue(Sender);
      getConnection().execute(cmd);
      return;
    }
    
    
    private DSRESTParameterMetaData[] THWS_ServerMethods_DSServerModuleDestroy_Metadata;
    private DSRESTParameterMetaData[] get_THWS_ServerMethods_DSServerModuleDestroy_Metadata() {
      if (THWS_ServerMethods_DSServerModuleDestroy_Metadata == null) {
        THWS_ServerMethods_DSServerModuleDestroy_Metadata = new DSRESTParameterMetaData[]{
          new DSRESTParameterMetaData("Sender", DSRESTParamDirection.Input, DBXDataTypes.JsonValueType, "TObject"),
        };
      }
      return THWS_ServerMethods_DSServerModuleDestroy_Metadata;
    }

    /**
     * @param Sender [in] - Type on server: TObject
     */
    public void DSServerModuleDestroy(TJSONObject Sender) throws DBXException {
      DSRESTCommand cmd = getConnection().CreateCommand();
      cmd.setRequestType(DSHTTPRequestType.POST);
      cmd.setText("THWS_ServerMethods.DSServerModuleDestroy");
      cmd.prepare(get_THWS_ServerMethods_DSServerModuleDestroy_Metadata());
      cmd.getParameter(0).getValue().SetAsJSONValue(Sender);
      getConnection().execute(cmd);
      return;
    }
    
    
    private DSRESTParameterMetaData[] THWS_ServerMethods_F_HWS_RetornaStatusDoCliente_Metadata;
    private DSRESTParameterMetaData[] get_THWS_ServerMethods_F_HWS_RetornaStatusDoCliente_Metadata() {
      if (THWS_ServerMethods_F_HWS_RetornaStatusDoCliente_Metadata == null) {
        THWS_ServerMethods_F_HWS_RetornaStatusDoCliente_Metadata = new DSRESTParameterMetaData[]{
          new DSRESTParameterMetaData("HWS_CodCliente", DSRESTParamDirection.Input, DBXDataTypes.WideStringType, "string"),
          new DSRESTParameterMetaData("", DSRESTParamDirection.ReturnValue, DBXDataTypes.JsonValueType, "TJSONArray"),
        };
      }
      return THWS_ServerMethods_F_HWS_RetornaStatusDoCliente_Metadata;
    }

    /**
     * @param HWS_CodCliente [in] - Type on server: string
     * @return result - Type on server: TJSONArray
     */
    public TJSONArray F_HWS_RetornaStatusDoCliente(String HWS_CodCliente) throws DBXException {
      DSRESTCommand cmd = getConnection().CreateCommand();
      cmd.setRequestType(DSHTTPRequestType.GET);
      cmd.setText("THWS_ServerMethods.F_HWS_RetornaStatusDoCliente");
      cmd.prepare(get_THWS_ServerMethods_F_HWS_RetornaStatusDoCliente_Metadata());
      cmd.getParameter(0).getValue().SetAsString(HWS_CodCliente);
      getConnection().execute(cmd);
      return (TJSONArray) cmd.getParameter(1).getValue().GetAsJSONValue();
    }
    
    
    private DSRESTParameterMetaData[] THWS_ServerMethods_F_HWS_ProximoAutoIncBancoCliente_Metadata;
    private DSRESTParameterMetaData[] get_THWS_ServerMethods_F_HWS_ProximoAutoIncBancoCliente_Metadata() {
      if (THWS_ServerMethods_F_HWS_ProximoAutoIncBancoCliente_Metadata == null) {
        THWS_ServerMethods_F_HWS_ProximoAutoIncBancoCliente_Metadata = new DSRESTParameterMetaData[]{
          new DSRESTParameterMetaData("Tabela", DSRESTParamDirection.Input, DBXDataTypes.WideStringType, "string"),
          new DSRESTParameterMetaData("Campo", DSRESTParamDirection.Input, DBXDataTypes.WideStringType, "string"),
          new DSRESTParameterMetaData("Formato", DSRESTParamDirection.Input, DBXDataTypes.WideStringType, "string"),
          new DSRESTParameterMetaData("", DSRESTParamDirection.ReturnValue, DBXDataTypes.WideStringType, "string"),
        };
      }
      return THWS_ServerMethods_F_HWS_ProximoAutoIncBancoCliente_Metadata;
    }

    /**
     * @param Tabela [in] - Type on server: string
     * @param Campo [in] - Type on server: string
     * @param Formato [in] - Type on server: string
     * @return result - Type on server: string
     */
    public String F_HWS_ProximoAutoIncBancoCliente(String Tabela, String Campo, String Formato) throws DBXException {
      DSRESTCommand cmd = getConnection().CreateCommand();
      cmd.setRequestType(DSHTTPRequestType.GET);
      cmd.setText("THWS_ServerMethods.F_HWS_ProximoAutoIncBancoCliente");
      cmd.prepare(get_THWS_ServerMethods_F_HWS_ProximoAutoIncBancoCliente_Metadata());
      cmd.getParameter(0).getValue().SetAsString(Tabela);
      cmd.getParameter(1).getValue().SetAsString(Campo);
      cmd.getParameter(2).getValue().SetAsString(Formato);
      getConnection().execute(cmd);
      return  cmd.getParameter(3).getValue().GetAsString();
    }
    
    
    private DSRESTParameterMetaData[] THWS_ServerMethods_F_HWS_GravaPerguntasXRespostas_Metadata;
    private DSRESTParameterMetaData[] get_THWS_ServerMethods_F_HWS_GravaPerguntasXRespostas_Metadata() {
      if (THWS_ServerMethods_F_HWS_GravaPerguntasXRespostas_Metadata == null) {
        THWS_ServerMethods_F_HWS_GravaPerguntasXRespostas_Metadata = new DSRESTParameterMetaData[]{
          new DSRESTParameterMetaData("HWS_PerXRes", DSRESTParamDirection.Input, DBXDataTypes.JsonValueType, "TJSONValue"),
          new DSRESTParameterMetaData("", DSRESTParamDirection.ReturnValue, DBXDataTypes.JsonValueType, "TJSONArray"),
        };
      }
      return THWS_ServerMethods_F_HWS_GravaPerguntasXRespostas_Metadata;
    }

    /**
     * @param HWS_PerXRes [in] - Type on server: TJSONValue
     * @return result - Type on server: TJSONArray
     */
    public TJSONArray F_HWS_GravaPerguntasXRespostas(TJSONValue HWS_PerXRes) throws DBXException {
      DSRESTCommand cmd = getConnection().CreateCommand();
      cmd.setRequestType(DSHTTPRequestType.POST);
      cmd.setText("THWS_ServerMethods.F_HWS_GravaPerguntasXRespostas");
      cmd.prepare(get_THWS_ServerMethods_F_HWS_GravaPerguntasXRespostas_Metadata());
      cmd.getParameter(0).getValue().SetAsJSONValue(HWS_PerXRes);
      getConnection().execute(cmd);
      return (TJSONArray) cmd.getParameter(1).getValue().GetAsJSONValue();
    }
    
    
    private DSRESTParameterMetaData[] THWS_ServerMethods_F_HWS_RevisarCheckList_Metadata;
    private DSRESTParameterMetaData[] get_THWS_ServerMethods_F_HWS_RevisarCheckList_Metadata() {
      if (THWS_ServerMethods_F_HWS_RevisarCheckList_Metadata == null) {
        THWS_ServerMethods_F_HWS_RevisarCheckList_Metadata = new DSRESTParameterMetaData[]{
          new DSRESTParameterMetaData("HWS_Codigo", DSRESTParamDirection.Input, DBXDataTypes.WideStringType, "string"),
          new DSRESTParameterMetaData("", DSRESTParamDirection.ReturnValue, DBXDataTypes.JsonValueType, "TJSONArray"),
        };
      }
      return THWS_ServerMethods_F_HWS_RevisarCheckList_Metadata;
    }

    /**
     * @param HWS_Codigo [in] - Type on server: string
     * @return result - Type on server: TJSONArray
     */
    public TJSONArray F_HWS_RevisarCheckList(String HWS_Codigo) throws DBXException {
      DSRESTCommand cmd = getConnection().CreateCommand();
      cmd.setRequestType(DSHTTPRequestType.GET);
      cmd.setText("THWS_ServerMethods.F_HWS_RevisarCheckList");
      cmd.prepare(get_THWS_ServerMethods_F_HWS_RevisarCheckList_Metadata());
      cmd.getParameter(0).getValue().SetAsString(HWS_Codigo);
      getConnection().execute(cmd);
      return (TJSONArray) cmd.getParameter(1).getValue().GetAsJSONValue();
    }
    
    
    private DSRESTParameterMetaData[] THWS_ServerMethods_F_HWS_RetornaCheckListPerguntas_Metadata;
    private DSRESTParameterMetaData[] get_THWS_ServerMethods_F_HWS_RetornaCheckListPerguntas_Metadata() {
      if (THWS_ServerMethods_F_HWS_RetornaCheckListPerguntas_Metadata == null) {
        THWS_ServerMethods_F_HWS_RetornaCheckListPerguntas_Metadata = new DSRESTParameterMetaData[]{
          new DSRESTParameterMetaData("HWS_App", DSRESTParamDirection.Input, DBXDataTypes.WideStringType, "string"),
          new DSRESTParameterMetaData("", DSRESTParamDirection.ReturnValue, DBXDataTypes.TableType, "TDBXReader"),
        };
      }
      return THWS_ServerMethods_F_HWS_RetornaCheckListPerguntas_Metadata;
    }

    /**
     * @param HWS_App [in] - Type on server: string
     * @return result - Type on server: TDBXReader
     */
    public TDBXReader F_HWS_RetornaCheckListPerguntas(String HWS_App) throws DBXException {
      DSRESTCommand cmd = getConnection().CreateCommand();
      cmd.setRequestType(DSHTTPRequestType.GET);
      cmd.setText("THWS_ServerMethods.F_HWS_RetornaCheckListPerguntas");
      cmd.prepare(get_THWS_ServerMethods_F_HWS_RetornaCheckListPerguntas_Metadata());
      cmd.getParameter(0).getValue().SetAsString(HWS_App);
      getConnection().execute(cmd);
      return (TDBXReader) cmd.getParameter(1).getValue().GetAsTable();
    }
    
    
    private DSRESTParameterMetaData[] THWS_ServerMethods_F_HWS_RetornaStatusChip_Metadata;
    private DSRESTParameterMetaData[] get_THWS_ServerMethods_F_HWS_RetornaStatusChip_Metadata() {
      if (THWS_ServerMethods_F_HWS_RetornaStatusChip_Metadata == null) {
        THWS_ServerMethods_F_HWS_RetornaStatusChip_Metadata = new DSRESTParameterMetaData[]{
          new DSRESTParameterMetaData("HWS_Chip", DSRESTParamDirection.Input, DBXDataTypes.WideStringType, "string"),
          new DSRESTParameterMetaData("", DSRESTParamDirection.ReturnValue, DBXDataTypes.JsonValueType, "TJSONArray"),
        };
      }
      return THWS_ServerMethods_F_HWS_RetornaStatusChip_Metadata;
    }

    /**
     * @param HWS_Chip [in] - Type on server: string
     * @return result - Type on server: TJSONArray
     */
    public TJSONArray F_HWS_RetornaStatusChip(String HWS_Chip) throws DBXException {
      DSRESTCommand cmd = getConnection().CreateCommand();
      cmd.setRequestType(DSHTTPRequestType.GET);
      cmd.setText("THWS_ServerMethods.F_HWS_RetornaStatusChip");
      cmd.prepare(get_THWS_ServerMethods_F_HWS_RetornaStatusChip_Metadata());
      cmd.getParameter(0).getValue().SetAsString(HWS_Chip);
      getConnection().execute(cmd);
      return (TJSONArray) cmd.getParameter(1).getValue().GetAsJSONValue();
    }
    
    
    private DSRESTParameterMetaData[] THWS_ServerMethods_F_HWS_RetornaVeiculos_Metadata;
    private DSRESTParameterMetaData[] get_THWS_ServerMethods_F_HWS_RetornaVeiculos_Metadata() {
      if (THWS_ServerMethods_F_HWS_RetornaVeiculos_Metadata == null) {
        THWS_ServerMethods_F_HWS_RetornaVeiculos_Metadata = new DSRESTParameterMetaData[]{
          new DSRESTParameterMetaData("HWS_Chip", DSRESTParamDirection.Input, DBXDataTypes.WideStringType, "string"),
          new DSRESTParameterMetaData("HWS_MaxId", DSRESTParamDirection.Input, DBXDataTypes.WideStringType, "string"),
          new DSRESTParameterMetaData("", DSRESTParamDirection.ReturnValue, DBXDataTypes.TableType, "TDBXReader"),
        };
      }
      return THWS_ServerMethods_F_HWS_RetornaVeiculos_Metadata;
    }

    /**
     * @param HWS_Chip [in] - Type on server: string
     * @param HWS_MaxId [in] - Type on server: string
     * @return result - Type on server: TDBXReader
     */
    public TDBXReader F_HWS_RetornaVeiculos(String HWS_Chip, String HWS_MaxId) throws DBXException {
      DSRESTCommand cmd = getConnection().CreateCommand();
      cmd.setRequestType(DSHTTPRequestType.GET);
      cmd.setText("THWS_ServerMethods.F_HWS_RetornaVeiculos");
      cmd.prepare(get_THWS_ServerMethods_F_HWS_RetornaVeiculos_Metadata());
      cmd.getParameter(0).getValue().SetAsString(HWS_Chip);
      cmd.getParameter(1).getValue().SetAsString(HWS_MaxId);
      getConnection().execute(cmd);
      return (TDBXReader) cmd.getParameter(2).getValue().GetAsTable();
    }
    
    
    private DSRESTParameterMetaData[] THWS_ServerMethods_F_HWS_GravaCheckListRealizado_Metadata;
    private DSRESTParameterMetaData[] get_THWS_ServerMethods_F_HWS_GravaCheckListRealizado_Metadata() {
      if (THWS_ServerMethods_F_HWS_GravaCheckListRealizado_Metadata == null) {
        THWS_ServerMethods_F_HWS_GravaCheckListRealizado_Metadata = new DSRESTParameterMetaData[]{
          new DSRESTParameterMetaData("HWS_Chip", DSRESTParamDirection.Input, DBXDataTypes.WideStringType, "string"),
          new DSRESTParameterMetaData("HWS_Dados", DSRESTParamDirection.Input, DBXDataTypes.JsonValueType, "TJSONArray"),
          new DSRESTParameterMetaData("", DSRESTParamDirection.ReturnValue, DBXDataTypes.JsonValueType, "TJSONArray"),
        };
      }
      return THWS_ServerMethods_F_HWS_GravaCheckListRealizado_Metadata;
    }

    /**
     * @param HWS_Chip [in] - Type on server: string
     * @param HWS_Dados [in] - Type on server: TJSONArray
     * @return result - Type on server: TJSONArray
     */
    public TJSONArray F_HWS_GravaCheckListRealizado(String HWS_Chip, TJSONArray HWS_Dados) throws DBXException {
      DSRESTCommand cmd = getConnection().CreateCommand();
      cmd.setRequestType(DSHTTPRequestType.POST);
      cmd.setText("THWS_ServerMethods.F_HWS_GravaCheckListRealizado");
      cmd.prepare(get_THWS_ServerMethods_F_HWS_GravaCheckListRealizado_Metadata());
      cmd.getParameter(0).getValue().SetAsString(HWS_Chip);
      cmd.getParameter(1).getValue().SetAsJSONValue(HWS_Dados);
      getConnection().execute(cmd);
      return (TJSONArray) cmd.getParameter(2).getValue().GetAsJSONValue();
    }
    
    
    private DSRESTParameterMetaData[] THWS_ServerMethods_F_HWS_RetornaCheckListAtivo_Metadata;
    private DSRESTParameterMetaData[] get_THWS_ServerMethods_F_HWS_RetornaCheckListAtivo_Metadata() {
      if (THWS_ServerMethods_F_HWS_RetornaCheckListAtivo_Metadata == null) {
        THWS_ServerMethods_F_HWS_RetornaCheckListAtivo_Metadata = new DSRESTParameterMetaData[]{
          new DSRESTParameterMetaData("HWS_App", DSRESTParamDirection.Input, DBXDataTypes.WideStringType, "string"),
          new DSRESTParameterMetaData("", DSRESTParamDirection.ReturnValue, DBXDataTypes.WideStringType, "string"),
        };
      }
      return THWS_ServerMethods_F_HWS_RetornaCheckListAtivo_Metadata;
    }

    /**
     * @param HWS_App [in] - Type on server: string
     * @return result - Type on server: string
     */
    public String F_HWS_RetornaCheckListAtivo(String HWS_App) throws DBXException {
      DSRESTCommand cmd = getConnection().CreateCommand();
      cmd.setRequestType(DSHTTPRequestType.GET);
      cmd.setText("THWS_ServerMethods.F_HWS_RetornaCheckListAtivo");
      cmd.prepare(get_THWS_ServerMethods_F_HWS_RetornaCheckListAtivo_Metadata());
      cmd.getParameter(0).getValue().SetAsString(HWS_App);
      getConnection().execute(cmd);
      return  cmd.getParameter(1).getValue().GetAsString();
    }
    
    
    private DSRESTParameterMetaData[] THWS_ServerMethods_F_HWS_ExisteNovoCheckList_Metadata;
    private DSRESTParameterMetaData[] get_THWS_ServerMethods_F_HWS_ExisteNovoCheckList_Metadata() {
      if (THWS_ServerMethods_F_HWS_ExisteNovoCheckList_Metadata == null) {
        THWS_ServerMethods_F_HWS_ExisteNovoCheckList_Metadata = new DSRESTParameterMetaData[]{
          new DSRESTParameterMetaData("HWS_App", DSRESTParamDirection.Input, DBXDataTypes.WideStringType, "string"),
          new DSRESTParameterMetaData("HWS_CheckListAtual", DSRESTParamDirection.Input, DBXDataTypes.WideStringType, "string"),
          new DSRESTParameterMetaData("", DSRESTParamDirection.ReturnValue, DBXDataTypes.JsonValueType, "TJSONArray"),
        };
      }
      return THWS_ServerMethods_F_HWS_ExisteNovoCheckList_Metadata;
    }

    /**
     * @param HWS_App [in] - Type on server: string
     * @param HWS_CheckListAtual [in] - Type on server: string
     * @return result - Type on server: TJSONArray
     */
    public TJSONArray F_HWS_ExisteNovoCheckList(String HWS_App, String HWS_CheckListAtual) throws DBXException {
      DSRESTCommand cmd = getConnection().CreateCommand();
      cmd.setRequestType(DSHTTPRequestType.GET);
      cmd.setText("THWS_ServerMethods.F_HWS_ExisteNovoCheckList");
      cmd.prepare(get_THWS_ServerMethods_F_HWS_ExisteNovoCheckList_Metadata());
      cmd.getParameter(0).getValue().SetAsString(HWS_App);
      cmd.getParameter(1).getValue().SetAsString(HWS_CheckListAtual);
      getConnection().execute(cmd);
      return (TJSONArray) cmd.getParameter(2).getValue().GetAsJSONValue();
    }
    
    
    private DSRESTParameterMetaData[] THWS_ServerMethods_F_HWS_RetornaEstruturaDasPerguntas_Metadata;
    private DSRESTParameterMetaData[] get_THWS_ServerMethods_F_HWS_RetornaEstruturaDasPerguntas_Metadata() {
      if (THWS_ServerMethods_F_HWS_RetornaEstruturaDasPerguntas_Metadata == null) {
        THWS_ServerMethods_F_HWS_RetornaEstruturaDasPerguntas_Metadata = new DSRESTParameterMetaData[]{
          new DSRESTParameterMetaData("HWS_CheckList", DSRESTParamDirection.Input, DBXDataTypes.WideStringType, "string"),
          new DSRESTParameterMetaData("", DSRESTParamDirection.ReturnValue, DBXDataTypes.TableType, "TDBXReader"),
        };
      }
      return THWS_ServerMethods_F_HWS_RetornaEstruturaDasPerguntas_Metadata;
    }

    /**
     * @param HWS_CheckList [in] - Type on server: string
     * @return result - Type on server: TDBXReader
     */
    public TDBXReader F_HWS_RetornaEstruturaDasPerguntas(String HWS_CheckList) throws DBXException {
      DSRESTCommand cmd = getConnection().CreateCommand();
      cmd.setRequestType(DSHTTPRequestType.GET);
      cmd.setText("THWS_ServerMethods.F_HWS_RetornaEstruturaDasPerguntas");
      cmd.prepare(get_THWS_ServerMethods_F_HWS_RetornaEstruturaDasPerguntas_Metadata());
      cmd.getParameter(0).getValue().SetAsString(HWS_CheckList);
      getConnection().execute(cmd);
      return (TDBXReader) cmd.getParameter(1).getValue().GetAsTable();
    }
    
    
    private DSRESTParameterMetaData[] THWS_ServerMethods_F_HWS_PodeExcluirPerguntaFilha_Metadata;
    private DSRESTParameterMetaData[] get_THWS_ServerMethods_F_HWS_PodeExcluirPerguntaFilha_Metadata() {
      if (THWS_ServerMethods_F_HWS_PodeExcluirPerguntaFilha_Metadata == null) {
        THWS_ServerMethods_F_HWS_PodeExcluirPerguntaFilha_Metadata = new DSRESTParameterMetaData[]{
          new DSRESTParameterMetaData("HWS_CheckList", DSRESTParamDirection.Input, DBXDataTypes.WideStringType, "string"),
          new DSRESTParameterMetaData("HWS_Pergunta", DSRESTParamDirection.Input, DBXDataTypes.WideStringType, "string"),
          new DSRESTParameterMetaData("", DSRESTParamDirection.ReturnValue, DBXDataTypes.WideStringType, "string"),
        };
      }
      return THWS_ServerMethods_F_HWS_PodeExcluirPerguntaFilha_Metadata;
    }

    /**
     * @param HWS_CheckList [in] - Type on server: string
     * @param HWS_Pergunta [in] - Type on server: string
     * @return result - Type on server: string
     */
    public String F_HWS_PodeExcluirPerguntaFilha(String HWS_CheckList, String HWS_Pergunta) throws DBXException {
      DSRESTCommand cmd = getConnection().CreateCommand();
      cmd.setRequestType(DSHTTPRequestType.GET);
      cmd.setText("THWS_ServerMethods.F_HWS_PodeExcluirPerguntaFilha");
      cmd.prepare(get_THWS_ServerMethods_F_HWS_PodeExcluirPerguntaFilha_Metadata());
      cmd.getParameter(0).getValue().SetAsString(HWS_CheckList);
      cmd.getParameter(1).getValue().SetAsString(HWS_Pergunta);
      getConnection().execute(cmd);
      return  cmd.getParameter(2).getValue().GetAsString();
    }
    
    
    private DSRESTParameterMetaData[] THWS_ServerMethods_F_HWS_ExcluirPerguntaFilha_Metadata;
    private DSRESTParameterMetaData[] get_THWS_ServerMethods_F_HWS_ExcluirPerguntaFilha_Metadata() {
      if (THWS_ServerMethods_F_HWS_ExcluirPerguntaFilha_Metadata == null) {
        THWS_ServerMethods_F_HWS_ExcluirPerguntaFilha_Metadata = new DSRESTParameterMetaData[]{
          new DSRESTParameterMetaData("HWS_CheckList", DSRESTParamDirection.Input, DBXDataTypes.WideStringType, "string"),
          new DSRESTParameterMetaData("HWS_PerguntaPai", DSRESTParamDirection.Input, DBXDataTypes.WideStringType, "string"),
          new DSRESTParameterMetaData("HWS_PerguntaFilha", DSRESTParamDirection.Input, DBXDataTypes.WideStringType, "string"),
          new DSRESTParameterMetaData("", DSRESTParamDirection.ReturnValue, DBXDataTypes.JsonValueType, "TJSONArray"),
        };
      }
      return THWS_ServerMethods_F_HWS_ExcluirPerguntaFilha_Metadata;
    }

    /**
     * @param HWS_CheckList [in] - Type on server: string
     * @param HWS_PerguntaPai [in] - Type on server: string
     * @param HWS_PerguntaFilha [in] - Type on server: string
     * @return result - Type on server: TJSONArray
     */
    public TJSONArray F_HWS_ExcluirPerguntaFilha(String HWS_CheckList, String HWS_PerguntaPai, String HWS_PerguntaFilha) throws DBXException {
      DSRESTCommand cmd = getConnection().CreateCommand();
      cmd.setRequestType(DSHTTPRequestType.GET);
      cmd.setText("THWS_ServerMethods.F_HWS_ExcluirPerguntaFilha");
      cmd.prepare(get_THWS_ServerMethods_F_HWS_ExcluirPerguntaFilha_Metadata());
      cmd.getParameter(0).getValue().SetAsString(HWS_CheckList);
      cmd.getParameter(1).getValue().SetAsString(HWS_PerguntaPai);
      cmd.getParameter(2).getValue().SetAsString(HWS_PerguntaFilha);
      getConnection().execute(cmd);
      return (TJSONArray) cmd.getParameter(3).getValue().GetAsJSONValue();
    }
    
    
    private DSRESTParameterMetaData[] THWS_ServerMethods_F_HWS_PodeExcluirPerguntaReprovacao_Metadata;
    private DSRESTParameterMetaData[] get_THWS_ServerMethods_F_HWS_PodeExcluirPerguntaReprovacao_Metadata() {
      if (THWS_ServerMethods_F_HWS_PodeExcluirPerguntaReprovacao_Metadata == null) {
        THWS_ServerMethods_F_HWS_PodeExcluirPerguntaReprovacao_Metadata = new DSRESTParameterMetaData[]{
          new DSRESTParameterMetaData("HWS_CheckList", DSRESTParamDirection.Input, DBXDataTypes.WideStringType, "string"),
          new DSRESTParameterMetaData("HWS_Pergunta", DSRESTParamDirection.Input, DBXDataTypes.WideStringType, "string"),
          new DSRESTParameterMetaData("", DSRESTParamDirection.ReturnValue, DBXDataTypes.WideStringType, "string"),
        };
      }
      return THWS_ServerMethods_F_HWS_PodeExcluirPerguntaReprovacao_Metadata;
    }

    /**
     * @param HWS_CheckList [in] - Type on server: string
     * @param HWS_Pergunta [in] - Type on server: string
     * @return result - Type on server: string
     */
    public String F_HWS_PodeExcluirPerguntaReprovacao(String HWS_CheckList, String HWS_Pergunta) throws DBXException {
      DSRESTCommand cmd = getConnection().CreateCommand();
      cmd.setRequestType(DSHTTPRequestType.GET);
      cmd.setText("THWS_ServerMethods.F_HWS_PodeExcluirPerguntaReprovacao");
      cmd.prepare(get_THWS_ServerMethods_F_HWS_PodeExcluirPerguntaReprovacao_Metadata());
      cmd.getParameter(0).getValue().SetAsString(HWS_CheckList);
      cmd.getParameter(1).getValue().SetAsString(HWS_Pergunta);
      getConnection().execute(cmd);
      return  cmd.getParameter(2).getValue().GetAsString();
    }
    
    
    private DSRESTParameterMetaData[] THWS_ServerMethods_F_HWS_PodeExcluirRestricao_Metadata;
    private DSRESTParameterMetaData[] get_THWS_ServerMethods_F_HWS_PodeExcluirRestricao_Metadata() {
      if (THWS_ServerMethods_F_HWS_PodeExcluirRestricao_Metadata == null) {
        THWS_ServerMethods_F_HWS_PodeExcluirRestricao_Metadata = new DSRESTParameterMetaData[]{
          new DSRESTParameterMetaData("HWS_CheckList", DSRESTParamDirection.Input, DBXDataTypes.WideStringType, "string"),
          new DSRESTParameterMetaData("HWS_GrupoPergunta", DSRESTParamDirection.Input, DBXDataTypes.WideStringType, "string"),
          new DSRESTParameterMetaData("", DSRESTParamDirection.ReturnValue, DBXDataTypes.WideStringType, "string"),
        };
      }
      return THWS_ServerMethods_F_HWS_PodeExcluirRestricao_Metadata;
    }

    /**
     * @param HWS_CheckList [in] - Type on server: string
     * @param HWS_GrupoPergunta [in] - Type on server: string
     * @return result - Type on server: string
     */
    public String F_HWS_PodeExcluirRestricao(String HWS_CheckList, String HWS_GrupoPergunta) throws DBXException {
      DSRESTCommand cmd = getConnection().CreateCommand();
      cmd.setRequestType(DSHTTPRequestType.GET);
      cmd.setText("THWS_ServerMethods.F_HWS_PodeExcluirRestricao");
      cmd.prepare(get_THWS_ServerMethods_F_HWS_PodeExcluirRestricao_Metadata());
      cmd.getParameter(0).getValue().SetAsString(HWS_CheckList);
      cmd.getParameter(1).getValue().SetAsString(HWS_GrupoPergunta);
      getConnection().execute(cmd);
      return  cmd.getParameter(2).getValue().GetAsString();
    }
    
    
    private DSRESTParameterMetaData[] THWS_ServerMethods_F_HWS_ProximoAutoIncBancoHWS_Metadata;
    private DSRESTParameterMetaData[] get_THWS_ServerMethods_F_HWS_ProximoAutoIncBancoHWS_Metadata() {
      if (THWS_ServerMethods_F_HWS_ProximoAutoIncBancoHWS_Metadata == null) {
        THWS_ServerMethods_F_HWS_ProximoAutoIncBancoHWS_Metadata = new DSRESTParameterMetaData[]{
          new DSRESTParameterMetaData("Tabela", DSRESTParamDirection.Input, DBXDataTypes.WideStringType, "string"),
          new DSRESTParameterMetaData("Campo", DSRESTParamDirection.Input, DBXDataTypes.WideStringType, "string"),
          new DSRESTParameterMetaData("Formato", DSRESTParamDirection.Input, DBXDataTypes.WideStringType, "string"),
          new DSRESTParameterMetaData("", DSRESTParamDirection.ReturnValue, DBXDataTypes.WideStringType, "string"),
        };
      }
      return THWS_ServerMethods_F_HWS_ProximoAutoIncBancoHWS_Metadata;
    }

    /**
     * @param Tabela [in] - Type on server: string
     * @param Campo [in] - Type on server: string
     * @param Formato [in] - Type on server: string
     * @return result - Type on server: string
     */
    public String F_HWS_ProximoAutoIncBancoHWS(String Tabela, String Campo, String Formato) throws DBXException {
      DSRESTCommand cmd = getConnection().CreateCommand();
      cmd.setRequestType(DSHTTPRequestType.GET);
      cmd.setText("THWS_ServerMethods.F_HWS_ProximoAutoIncBancoHWS");
      cmd.prepare(get_THWS_ServerMethods_F_HWS_ProximoAutoIncBancoHWS_Metadata());
      cmd.getParameter(0).getValue().SetAsString(Tabela);
      cmd.getParameter(1).getValue().SetAsString(Campo);
      cmd.getParameter(2).getValue().SetAsString(Formato);
      getConnection().execute(cmd);
      return  cmd.getParameter(3).getValue().GetAsString();
    }
    
    
    private DSRESTParameterMetaData[] THWS_ServerMethods_F_HWS_RetornaUsuarioDoMobile_Metadata;
    private DSRESTParameterMetaData[] get_THWS_ServerMethods_F_HWS_RetornaUsuarioDoMobile_Metadata() {
      if (THWS_ServerMethods_F_HWS_RetornaUsuarioDoMobile_Metadata == null) {
        THWS_ServerMethods_F_HWS_RetornaUsuarioDoMobile_Metadata = new DSRESTParameterMetaData[]{
          new DSRESTParameterMetaData("HWS_CodCliente", DSRESTParamDirection.Input, DBXDataTypes.WideStringType, "string"),
          new DSRESTParameterMetaData("", DSRESTParamDirection.ReturnValue, DBXDataTypes.TableType, "TDBXReader"),
        };
      }
      return THWS_ServerMethods_F_HWS_RetornaUsuarioDoMobile_Metadata;
    }

    /**
     * @param HWS_CodCliente [in] - Type on server: string
     * @return result - Type on server: TDBXReader
     */
    public TDBXReader F_HWS_RetornaUsuarioDoMobile(String HWS_CodCliente) throws DBXException {
      DSRESTCommand cmd = getConnection().CreateCommand();
      cmd.setRequestType(DSHTTPRequestType.GET);
      cmd.setText("THWS_ServerMethods.F_HWS_RetornaUsuarioDoMobile");
      cmd.prepare(get_THWS_ServerMethods_F_HWS_RetornaUsuarioDoMobile_Metadata());
      cmd.getParameter(0).getValue().SetAsString(HWS_CodCliente);
      getConnection().execute(cmd);
      return (TDBXReader) cmd.getParameter(1).getValue().GetAsTable();
    }
    
    
    private DSRESTParameterMetaData[] THWS_ServerMethods_F_HWS_RetornaCheckListsRealizados_Metadata;
    private DSRESTParameterMetaData[] get_THWS_ServerMethods_F_HWS_RetornaCheckListsRealizados_Metadata() {
      if (THWS_ServerMethods_F_HWS_RetornaCheckListsRealizados_Metadata == null) {
        THWS_ServerMethods_F_HWS_RetornaCheckListsRealizados_Metadata = new DSRESTParameterMetaData[]{
          new DSRESTParameterMetaData("HWS_DaData", DSRESTParamDirection.Input, DBXDataTypes.WideStringType, "string"),
          new DSRESTParameterMetaData("HWS_AteData", DSRESTParamDirection.Input, DBXDataTypes.WideStringType, "string"),
          new DSRESTParameterMetaData("HWS_DaPlaca", DSRESTParamDirection.Input, DBXDataTypes.WideStringType, "string"),
          new DSRESTParameterMetaData("HWS_AtePlaca", DSRESTParamDirection.Input, DBXDataTypes.WideStringType, "string"),
          new DSRESTParameterMetaData("HWS_DoStatus", DSRESTParamDirection.Input, DBXDataTypes.WideStringType, "string"),
          new DSRESTParameterMetaData("HWS_AteStatus", DSRESTParamDirection.Input, DBXDataTypes.WideStringType, "string"),
          new DSRESTParameterMetaData("", DSRESTParamDirection.ReturnValue, DBXDataTypes.TableType, "TDBXReader"),
        };
      }
      return THWS_ServerMethods_F_HWS_RetornaCheckListsRealizados_Metadata;
    }

    /**
     * @param HWS_DaData [in] - Type on server: string
     * @param HWS_AteData [in] - Type on server: string
     * @param HWS_DaPlaca [in] - Type on server: string
     * @param HWS_AtePlaca [in] - Type on server: string
     * @param HWS_DoStatus [in] - Type on server: string
     * @param HWS_AteStatus [in] - Type on server: string
     * @return result - Type on server: TDBXReader
     */
    public TDBXReader F_HWS_RetornaCheckListsRealizados(String HWS_DaData, String HWS_AteData, String HWS_DaPlaca, String HWS_AtePlaca, String HWS_DoStatus, String HWS_AteStatus) throws DBXException {
      DSRESTCommand cmd = getConnection().CreateCommand();
      cmd.setRequestType(DSHTTPRequestType.GET);
      cmd.setText("THWS_ServerMethods.F_HWS_RetornaCheckListsRealizados");
      cmd.prepare(get_THWS_ServerMethods_F_HWS_RetornaCheckListsRealizados_Metadata());
      cmd.getParameter(0).getValue().SetAsString(HWS_DaData);
      cmd.getParameter(1).getValue().SetAsString(HWS_AteData);
      cmd.getParameter(2).getValue().SetAsString(HWS_DaPlaca);
      cmd.getParameter(3).getValue().SetAsString(HWS_AtePlaca);
      cmd.getParameter(4).getValue().SetAsString(HWS_DoStatus);
      cmd.getParameter(5).getValue().SetAsString(HWS_AteStatus);
      getConnection().execute(cmd);
      return (TDBXReader) cmd.getParameter(6).getValue().GetAsTable();
    }
  }

}
