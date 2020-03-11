//
// Created by the DataSnap proxy generator.
// 11/04/2012 15:10:52
//

unit uHWSCheckListClientClientClassesDataSnap;

interface

uses Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, DSProxy, Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXJSONReflect;

type
  THWS_ServerMethodsClient = class(TDSAdminClient)
  private
    FDSServerModuleCreateCommand: TDBXCommand;
    FDSServerModuleDestroyCommand: TDBXCommand;
    FF_HWS_ConectaBancoClienteCommand: TDBXCommand;
    FF_HWS_RetornaStatusDoClienteCommand: TDBXCommand;
    FF_HWS_ProximoAutoIncCommand: TDBXCommand;
    FF_HWS_GravaPerguntasXRespostasCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    procedure DSServerModuleCreate(Sender: TObject);
    procedure DSServerModuleDestroy(Sender: TObject);
    function F_HWS_ConectaBancoCliente(HWS_CodCliente: string): TJSONArray;
    function F_HWS_RetornaStatusDoCliente(HWS_CodCliente: string): TJSONArray;
    function F_HWS_ProximoAutoInc(Tabela: string; Campo: string; Formato: string): string;
    function F_HWS_GravaPerguntasXRespostas(HWS_PerXRes: TJSONValue): TJSONArray;
  end;

implementation

procedure THWS_ServerMethodsClient.DSServerModuleCreate(Sender: TObject);
begin
  if FDSServerModuleCreateCommand = nil then
  begin
    FDSServerModuleCreateCommand := FDBXConnection.CreateCommand;
    FDSServerModuleCreateCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FDSServerModuleCreateCommand.Text := 'THWS_ServerMethods.DSServerModuleCreate';
    FDSServerModuleCreateCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FDSServerModuleCreateCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FDSServerModuleCreateCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDSServerModuleCreateCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDSServerModuleCreateCommand.ExecuteUpdate;
end;

procedure THWS_ServerMethodsClient.DSServerModuleDestroy(Sender: TObject);
begin
  if FDSServerModuleDestroyCommand = nil then
  begin
    FDSServerModuleDestroyCommand := FDBXConnection.CreateCommand;
    FDSServerModuleDestroyCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FDSServerModuleDestroyCommand.Text := 'THWS_ServerMethods.DSServerModuleDestroy';
    FDSServerModuleDestroyCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FDSServerModuleDestroyCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FDSServerModuleDestroyCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDSServerModuleDestroyCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDSServerModuleDestroyCommand.ExecuteUpdate;
end;

function THWS_ServerMethodsClient.F_HWS_ConectaBancoCliente(HWS_CodCliente: string): TJSONArray;
begin
  if FF_HWS_ConectaBancoClienteCommand = nil then
  begin
    FF_HWS_ConectaBancoClienteCommand := FDBXConnection.CreateCommand;
    FF_HWS_ConectaBancoClienteCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FF_HWS_ConectaBancoClienteCommand.Text := 'THWS_ServerMethods.F_HWS_ConectaBancoCliente';
    FF_HWS_ConectaBancoClienteCommand.Prepare;
  end;
  FF_HWS_ConectaBancoClienteCommand.Parameters[0].Value.SetWideString(HWS_CodCliente);
  FF_HWS_ConectaBancoClienteCommand.ExecuteUpdate;
  Result := TJSONArray(FF_HWS_ConectaBancoClienteCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
end;

function THWS_ServerMethodsClient.F_HWS_RetornaStatusDoCliente(HWS_CodCliente: string): TJSONArray;
begin
  if FF_HWS_RetornaStatusDoClienteCommand = nil then
  begin
    FF_HWS_RetornaStatusDoClienteCommand := FDBXConnection.CreateCommand;
    FF_HWS_RetornaStatusDoClienteCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FF_HWS_RetornaStatusDoClienteCommand.Text := 'THWS_ServerMethods.F_HWS_RetornaStatusDoCliente';
    FF_HWS_RetornaStatusDoClienteCommand.Prepare;
  end;
  FF_HWS_RetornaStatusDoClienteCommand.Parameters[0].Value.SetWideString(HWS_CodCliente);
  FF_HWS_RetornaStatusDoClienteCommand.ExecuteUpdate;
  Result := TJSONArray(FF_HWS_RetornaStatusDoClienteCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
end;

function THWS_ServerMethodsClient.F_HWS_ProximoAutoInc(Tabela: string; Campo: string; Formato: string): string;
begin
  if FF_HWS_ProximoAutoIncCommand = nil then
  begin
    FF_HWS_ProximoAutoIncCommand := FDBXConnection.CreateCommand;
    FF_HWS_ProximoAutoIncCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FF_HWS_ProximoAutoIncCommand.Text := 'THWS_ServerMethods.F_HWS_ProximoAutoInc';
    FF_HWS_ProximoAutoIncCommand.Prepare;
  end;
  FF_HWS_ProximoAutoIncCommand.Parameters[0].Value.SetWideString(Tabela);
  FF_HWS_ProximoAutoIncCommand.Parameters[1].Value.SetWideString(Campo);
  FF_HWS_ProximoAutoIncCommand.Parameters[2].Value.SetWideString(Formato);
  FF_HWS_ProximoAutoIncCommand.ExecuteUpdate;
  Result := FF_HWS_ProximoAutoIncCommand.Parameters[3].Value.GetWideString;
end;

function THWS_ServerMethodsClient.F_HWS_GravaPerguntasXRespostas(HWS_PerXRes: TJSONValue): TJSONArray;
begin
  if FF_HWS_GravaPerguntasXRespostasCommand = nil then
  begin
    FF_HWS_GravaPerguntasXRespostasCommand := FDBXConnection.CreateCommand;
    FF_HWS_GravaPerguntasXRespostasCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FF_HWS_GravaPerguntasXRespostasCommand.Text := 'THWS_ServerMethods.F_HWS_GravaPerguntasXRespostas';
    FF_HWS_GravaPerguntasXRespostasCommand.Prepare;
  end;
  FF_HWS_GravaPerguntasXRespostasCommand.Parameters[0].Value.SetJSONValue(HWS_PerXRes, FInstanceOwner);
  FF_HWS_GravaPerguntasXRespostasCommand.ExecuteUpdate;
  Result := TJSONArray(FF_HWS_GravaPerguntasXRespostasCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
end;


constructor THWS_ServerMethodsClient.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;


constructor THWS_ServerMethodsClient.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;


destructor THWS_ServerMethodsClient.Destroy;
begin
  FreeAndNil(FDSServerModuleCreateCommand);
  FreeAndNil(FDSServerModuleDestroyCommand);
  FreeAndNil(FF_HWS_ConectaBancoClienteCommand);
  FreeAndNil(FF_HWS_RetornaStatusDoClienteCommand);
  FreeAndNil(FF_HWS_ProximoAutoIncCommand);
  FreeAndNil(FF_HWS_GravaPerguntasXRespostasCommand);
  inherited;
end;

end.

