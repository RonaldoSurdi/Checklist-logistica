unit uHWSCheckListServerServerContainer;

interface

uses System.SysUtils, System.Classes,
  Datasnap.DSServer, Datasnap.DSCommonServer,
  Datasnap.DSClientMetadata, Datasnap.DSHTTPServiceProxyDispatcher,
  Datasnap.DSProxyJavaAndroid, Datasnap.DSProxyJavaBlackBerry,
  Datasnap.DSProxyObjectiveCiOS, Datasnap.DSProxyCsharpSilverlight,
  Datasnap.DSAuth, System.Generics.Collections, Data.SqlExpr, Datasnap.DSService,
  IndyPeerImpl, Datasnap.DSTCPServerTransport,  System.IniFiles, IWSystem;


type
  THWS_ServerContainer = class(TDataModule)
    HWS_DSServer: TDSServer;
    HWS_DSAuthenticationManager: TDSAuthenticationManager;
    HWS_DSServerClass: TDSServerClass;
    HWS_DSTCPServerTransport: TDSTCPServerTransport;
    procedure HWS_DSServerClassGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure HWS_DSAuthenticationManagerUserAuthorize(Sender: TObject;
      EventObject: TDSAuthorizeEventObject; var valid: Boolean);
    procedure HWS_DSAuthenticationManagerUserAuthenticate(Sender: TObject;
      const Protocol, Context, User, Password: string; var valid: Boolean;
      UserRoles: TStrings);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
//    function HWSGetConnection(HWS_BancoDoCliente: String) : TSQLConnection;
  end;

function DSServer: TDSServer;
function DSAuthenticationManager: TDSAuthenticationManager;

var
   HWS_ServerContainer: THWS_ServerContainer;
 //  ListofConnection : TDictionary<Integer,TSQLConnection>;


implementation

uses Winapi.Windows, uHWSCheckListServerServerMethod;

{$R *.dfm}

var
  FModule: TComponent;
  FDSServer: TDSServer;
  FDSAuthenticationManager: TDSAuthenticationManager;


function DSServer: TDSServer;
begin
  Result := FDSServer;
end;

function DSAuthenticationManager: TDSAuthenticationManager;
begin
  Result := FDSAuthenticationManager;
end;

constructor THWS_ServerContainer.Create(AOwner: TComponent);
begin
  inherited;
  FDSServer := HWS_DSServer;
  FDSAuthenticationManager := HWS_DSAuthenticationManager;
end;

procedure THWS_ServerContainer.DataModuleCreate(Sender: TObject);
begin
   HWS_DSServer.Start;
end;

destructor THWS_ServerContainer.Destroy;
begin
  inherited;
  FDSServer := nil;
  FDSAuthenticationManager := nil;
end;

procedure THWS_ServerContainer.HWS_DSServerClassGetClass(
  DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := uHWSCheckListServerServerMethod.THWS_ServerMethods;
end;

procedure THWS_ServerContainer.HWS_DSAuthenticationManagerUserAuthenticate(
  Sender: TObject; const Protocol, Context, User, Password: string;
  var valid: Boolean; UserRoles: TStrings);
begin
  { TODO : Validate the client user and password.
    If role-based authorization is needed, add role names to the UserRoles parameter  }
   if (User = 'hwsadminmobile') and (Password = 'Yd459*jhdD82Klaw82HHww1oPqjd') then begin
      UserRoles.Add('admin');
      valid := True;
   end else
      valid := False;
end;

procedure THWS_ServerContainer.HWS_DSAuthenticationManagerUserAuthorize(
  Sender: TObject; EventObject: TDSAuthorizeEventObject;
  var valid: Boolean);
begin
  { TODO : Authorize a user to execute a method.
    Use values from EventObject such as UserName, UserRoles, AuthorizedRoles and DeniedRoles.
    Use DSAuthenticationManager1.Roles to define Authorized and Denied roles
    for particular server methods. }
  valid := True;
end;

{
function THWS_ServerContainer.HWSGetConnection(HWS_BancoDoCliente: String): TSQLConnection;
var
  dbconn : TSQLConnection;
begin
   WriteLn('=================== Inicio da Funcao =================================');
   WriteLn('Banco do Cliente: ' + HWS_BancoDoCliente);
   WriteLn('Thread: ' + IntToStr(TDSSessionManager.GetThreadSession.Id));
   WriteLn('======================================================================');
   WriteLn('');
   WriteLn('');
   WriteLn('');
   WriteLn('');
   if ListofConnection.ContainsKey(TDSSessionManager.GetThreadSession.Id) then begin
      Result := ListofConnection[TDSSessionManager.GetThreadSession.Id];
      WriteLn('=============== Achou a Thread ====================================');
      WriteLn('Banco do Cliente: ' + Result.Params.ValueFromIndex[Result.Params.IndexOfName('Database')]);
      WriteLn('Thread: ' + IntToStr(TDSSessionManager.GetThreadSession.Id));
      WriteLn('===================================================================');
      WriteLn('');
      WriteLn('');
      WriteLn('');
      WriteLn('');
   end else begin
      WriteLn('=============== Criou o banco de Dados ============================');
      WriteLn('Banco do Cliente: ' + HWS_BancoDoCliente);
      WriteLn('Thread: ' + IntToStr(TDSSessionManager.GetThreadSession.Id));
      WriteLn('===================================================================');
      WriteLn('');
      WriteLn('');
      WriteLn('');
      WriteLn('');
      dbconn            := TSQLConnection.Create(Self);
      dbconn.DriverName := 'MYSQL';
      dbconn.Params.Clear;
      dbconn.Params.Add('DriverUnit=Data.DBXMySQL');
      dbconn.Params.Add('DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver160.bpl');
      dbconn.Params.Add('DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borland.Data.DbxCommonDriver,Version=16.0.0.0,Culture=neutral,PublicKeyToken=91d62ebb5b0d1b1b');
      dbconn.Params.Add('MetaDataPackageLoader=TDBXMySqlMetaDataCommandFactory,DbxMySQLDriver160.bpl');
      dbconn.Params.Add('MetaDataAssemblyLoader=Borland.Data.TDBXMySqlMetaDataCommandFactory,Borland.Data.DbxMySQLDriver,Version=16.0.0.0,Culture=neutral,PublicKeyToken=91d62ebb5b0d1b1b');
      dbconn.Params.Add('GetDriverFunc=getSQLDriverMYSQL');
      dbconn.Params.Add('LibraryName=dbxmys.dll');
      dbconn.Params.Add('LibraryNameOsx=libsqlmys.dylib');
      dbconn.Params.Add('VendorLib=LIBMYSQL.dll');
      dbconn.Params.Add('VendorLibWin64=libmysql.dll');
      dbconn.Params.Add('VendorLibOsx=libmysqlclient.dylib');
      dbconn.Params.Add('HostName=localhost');
      dbconn.Params.Add('Database=' + HWS_BancoDoCliente);
      dbconn.Params.Add('User_Name=user_hwschecklis');
      dbconn.Params.Add('Password=jds8hd4oo21HuSAs9823d');
      dbconn.Params.Add('MaxBlobSize=-1');
      dbconn.Params.Add('LocaleCode=0000');
      dbconn.Params.Add('Compressed=False');
      dbconn.Params.Add('Encrypted=False');
      dbconn.Params.Add('BlobSize=-1');
      dbconn.Params.Add('ErrorResourceFile=');
      dbconn.LoginPrompt := False;
      ListofConnection.Add(TDSSessionManager.GetThreadSession.Id, dbconn);
      Result := dbconn;
  end;
end;
}


initialization
  FModule := THWS_ServerContainer.Create(nil);
finalization
  FModule.Free;
end.

