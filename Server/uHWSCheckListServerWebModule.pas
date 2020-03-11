unit uHWSCheckListServerWebModule;

interface

uses
  System.SysUtils, System.Classes, Web.HTTPApp, Datasnap.DSHTTPCommon,
  Datasnap.DSHTTPWebBroker, Datasnap.DSServer,
  Web.WebFileDispatcher, Web.HTTPProd,
  DSAuth,
  Datasnap.DSProxyDispatcher, Datasnap.DSProxyJavaAndroid,
  Datasnap.DSProxyJavaBlackBerry, Datasnap.DSProxyObjectiveCiOS,
  Datasnap.DSProxyCsharpSilverlight,
  Datasnap.DSProxyJavaScript, IndyPeerImpl, Datasnap.DSClientMetadata,
  Datasnap.DSCommonServer,  System.IniFiles, IWSystem;


type
  THWS_WebModule = class(TWebModule)
    HWS_DSHTTPWebDispatcher: TDSHTTPWebDispatcher;
    HWS_WebFileDispatcher: TWebFileDispatcher;
    HWS_DSProxyGenerator: TDSProxyGenerator;
    HWS_DSServerMetaDataProvider: TDSServerMetaDataProvider;
    HWS_DSProxyDispatcher: TDSProxyDispatcher;
    procedure ServerFunctionInvokerHTMLTag(Sender: TObject; Tag: TTag;
      const TagString: string; TagParams: TStrings; var ReplaceText: string);
    procedure WebModuleDefaultAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModuleBeforeDispatch(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure HWS_WebFileDispatcherBeforeDispatch(Sender: TObject;
      const AFileName: string; Request: TWebRequest; Response: TWebResponse;
      var Handled: Boolean);
    procedure WebModuleCreate(Sender: TObject);
  private
    { Private declarations }
    FServerFunctionInvokerAction: TWebActionItem;
    function AllowServerFunctionInvoker: Boolean;
  public
    { Public declarations }
  end;

var
  WebModuleClass: TComponentClass = THWS_WebModule;

implementation

uses uHWSCheckListServerServerMethod, uHWSCheckListServerServerContainer, Web.WebReq;

{$R *.dfm}

procedure THWS_WebModule.ServerFunctionInvokerHTMLTag(Sender: TObject; Tag: TTag;
  const TagString: string; TagParams: TStrings; var ReplaceText: string);
begin
  if SameText(TagString, 'urlpath') then
    ReplaceText := string(Request.InternalScriptName)
  else if SameText(TagString, 'port') then
    ReplaceText := IntToStr(Request.ServerPort)
  else if SameText(TagString, 'host') then
    ReplaceText := string(Request.Host)
  else if SameText(TagString, 'classname') then
    ReplaceText := uHWSCheckListServerServerMethod.THWS_ServerMethods.ClassName
  else if SameText(TagString, 'loginrequired') then
    if HWS_DSHTTPWebDispatcher.AuthenticationManager <> nil then
      ReplaceText := 'true'
    else
      ReplaceText := 'false'
  else if SameText(TagString, 'serverfunctionsjs') then
    ReplaceText := string(Request.InternalScriptName) + '/js/serverfunctions.js'
  else if SameText(TagString, 'servertime') then
    ReplaceText := DateTimeToStr(Now)
  else if SameText(TagString, 'serverfunctioninvoker') then
    if AllowServerFunctionInvoker then
      ReplaceText :=
      '<div><a href="' + string(Request.InternalScriptName) +
      '/ServerFunctionInvoker" target="_blank">Server Functions</a></div>'
    else
      ReplaceText := '';
end;

procedure THWS_WebModule.WebModuleDefaultAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
{
  if (Request.InternalPathInfo = '') or (Request.InternalPathInfo = '/')then
    Response.Content := ReverseString.Content
  else
    Response.SendRedirect(Request.InternalScriptName + '/');
}
end;

procedure THWS_WebModule.WebModuleBeforeDispatch(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  if FServerFunctionInvokerAction <> nil then
    FServerFunctionInvokerAction.Enabled := AllowServerFunctionInvoker;
end;

function THWS_WebModule.AllowServerFunctionInvoker: Boolean;
begin
  Result := (Request.RemoteAddr = '127.0.0.1') or
    (Request.RemoteAddr = '0:0:0:0:0:0:0:1') or (Request.RemoteAddr = '::1');
end;

procedure THWS_WebModule.HWS_WebFileDispatcherBeforeDispatch(Sender: TObject;
  const AFileName: string; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
var
  D1, D2: TDateTime;
begin
  Handled := False;
  if SameFileName(ExtractFileName(AFileName), 'serverfunctions.js') then
    if not FileExists(AFileName) or (FileAge(AFileName, D1) and FileAge(WebApplicationFileName, D2) and (D1 < D2)) then
    begin
      HWS_DSProxyGenerator.TargetDirectory := ExtractFilePath(AFileName);
      HWS_DSProxyGenerator.TargetUnitName := ExtractFileName(AFileName);
      HWS_DSProxyGenerator.Write;
    end;
end;

procedure THWS_WebModule.WebModuleCreate(Sender: TObject);
begin
   FServerFunctionInvokerAction := ActionByName('ServerFunctionInvokerAction');
   HWS_DSServerMetaDataProvider.Server := DSServer;
   HWS_DSHTTPWebDispatcher.Server := DSServer;
   HWS_DSHTTPWebDispatcher.AuthenticationManager := DSAuthenticationManager;
end;

initialization
finalization
  Web.WebReq.FreeWebModules;

end.

