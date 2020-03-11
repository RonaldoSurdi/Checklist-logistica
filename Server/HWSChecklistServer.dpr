program HWSChecklistServer;
{$APPTYPE CONSOLE}

{$R *.dres}

uses
  System.SysUtils,
  Winapi.Windows,
  IdHTTPWebBrokerBridge,
  Web.WebReq,
  Web.WebBroker,
  System.IniFiles,
  IWSystem,
  Datasnap.DSService,
  uHWSCheckListServerServerMethod in 'uHWSCheckListServerServerMethod.pas' {HWS_ServerMethods: TDSServerModule},
  uHWSCheckListServerServerContainer in 'uHWSCheckListServerServerContainer.pas' {HWS_ServerContainer: TDataModule},
  uHWSCheckListServerWebModule in 'uHWSCheckListServerWebModule.pas' {HWS_WebModule: TWebModule},
  uHWSJson in '..\Client\uHWSJson.pas',
  uHWSJsonSrv in 'uHWSJsonSrv.pas';

{$R *.res}

var HWS_Porta01: Integer;

procedure TerminateThreads;
begin
  if TDSSessionManager.Instance <> nil then
    TDSSessionManager.Instance.TerminateAllSessions;
end;

procedure RunServer(APort: Integer);
var
  LInputRecord: TInputRecord;
  LEvent: DWord;
  LHandle: THandle;
  LServer: TIdHTTPWebBrokerBridge;
begin
  Writeln(Format('Starting HTTP Server or port %d', [APort]));
  LServer := TIdHTTPWebBrokerBridge.Create(nil);
  try
    LServer.DefaultPort := APort;
    LServer.Active := True;
    Writeln('Press ESC to stop the server');
    LHandle := GetStdHandle(STD_INPUT_HANDLE);
    while True do
    begin
      Win32Check(ReadConsoleInput(LHandle, LInputRecord, 1, LEvent));
      if (LInputRecord.EventType = KEY_EVENT) and
      LInputRecord.Event.KeyEvent.bKeyDown and
      (LInputRecord.Event.KeyEvent.wVirtualKeyCode = VK_ESCAPE) then
        break;
    end;
    TerminateThreads();
  finally
    LServer.Free;
  end;
end;

begin
  try
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;
    RunServer(8090);
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end
end.
