unit uHWSCheckListServiceModule;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.SvcMgr, Vcl.Dialogs,
  Vcl.ExtCtrls;

type
  THWSCheckListServices = class(TService)
    HWS_Timer_INI: TTimer;
    HWS_Timer_Export: TTimer;
    HWS_Timer_RE_Export: TTimer;
    HWS_Timer_Import: TTimer;
    procedure HWS_Timer_INITimer(Sender: TObject);
    procedure HWS_Timer_ExportTimer(Sender: TObject);
    procedure HWS_Timer_ImportTimer(Sender: TObject);
    procedure HWS_Timer_RE_ExportTimer(Sender: TObject);
    procedure ServicePause(Sender: TService; var Paused: Boolean);
    procedure ServiceStop(Sender: TService; var Stopped: Boolean);
    procedure ServiceContinue(Sender: TService; var Continued: Boolean);
    procedure ServiceStart(Sender: TService; var Started: Boolean);
    procedure ServiceCreate(Sender: TObject);
    procedure ServiceDestroy(Sender: TObject);
    procedure ServiceBeforeUninstall(Sender: TService);
    procedure ServiceAfterInstall(Sender: TService);
  private
    HWSserviceON: Boolean;
    procedure HWS_ServceStatus(HWSactiveteService:Boolean);
    { Private declarations }
  public
    function GetServiceController: TServiceController; override;
    { Public declarations }
  end;

var
  HWSCheckListServices: THWSCheckListServices;

implementation

uses uHWSCheckListService_DataModule;

{$R *.DFM}

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  HWSCheckListServices.Controller(CtrlCode);
end;

function THWSCheckListServices.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;

procedure THWSCheckListServices.HWS_Timer_ExportTimer(Sender: TObject);
begin
  if not HWS_Timer_RE_Export.Enabled then exit;
  HWS_Timer_Export.Enabled := False;
  if not HWS_ClientModule.HWS_SQLConnection.Connected then begin
     HWS_Timer_RE_Export.Enabled := False;
     HWS_Timer_Import.Enabled := False;
     HWS_ClientModule.HWS_geraLog('Erro ao Conectar Servidor');
     HWS_Timer_INI.Enabled:=True;
     exit;
  end;
  if HWS_ClientModule.HWS_Export('','','') then
     HWS_Timer_Export.Enabled := HWSserviceON;
end;

procedure THWSCheckListServices.HWS_Timer_RE_ExportTimer(Sender: TObject);
begin
  if not HWS_Timer_Export.Enabled then exit;
  HWS_Timer_RE_Export.Enabled := False;
  if not HWS_ClientModule.HWS_SQLConnection.Connected then begin
     HWS_Timer_Export.Enabled := False;
     HWS_Timer_Import.Enabled := False;
     HWS_ClientModule.HWS_geraLog('Erro ao Conectar Servidor');
     HWS_Timer_INI.Enabled:=True;
     exit;
  end;
  if HWS_ClientModule.HWS_RE_Export then
     HWS_Timer_RE_Export.Enabled := HWSserviceON;
end;

procedure THWSCheckListServices.HWS_ServceStatus(HWSactiveteService:Boolean);
begin
   if (HWSserviceON=HWSactiveteService) then exit;
   HWSserviceON:=HWSactiveteService;
   HWS_Timer_INI.Interval:=5000;
   HWS_Timer_INI.Enabled:=HWSserviceON;
   HWS_Timer_Export.Enabled:=false;
   HWS_Timer_RE_Export.Enabled:=false;
   HWS_Timer_Import.Enabled:=false;
end;

procedure THWSCheckListServices.ServiceAfterInstall(Sender: TService);
begin
    //HWS_ClientModule.HWS_geraLog('AVISO: Serviço Instalado.');
end;

procedure THWSCheckListServices.ServiceBeforeUninstall(Sender: TService);
begin
    //HWS_ClientModule.HWS_geraLog('AVISO: Serviço Desinstalado.');
    //HWS_ServceStatus(false);
end;

procedure THWSCheckListServices.ServiceContinue(Sender: TService;
  var Continued: Boolean);
begin
    //HWS_ServceStatus(true);
    //HWS_ClientModule.HWS_geraLog('AVISO: Continuando Serviço.');
end;

procedure THWSCheckListServices.ServiceCreate(Sender: TObject);
begin
    //HWS_ClientModule.HWS_geraLog('HWSCheckList Service Inicado');
end;

procedure THWSCheckListServices.ServiceDestroy(Sender: TObject);
begin
    //HWS_ClientModule.HWS_geraLog('HWSCheckList Service Finalizado');
end;

procedure THWSCheckListServices.ServicePause(Sender: TService;
  var Paused: Boolean);
begin
    //HWS_ServceStatus(false);
    //HWS_ClientModule.HWS_geraLog('AVISO: Serviço em Pausa.');
end;

procedure THWSCheckListServices.ServiceStart(Sender: TService;
  var Started: Boolean);
begin
    //HWS_ServceStatus(true);
    //HWS_ClientModule.HWS_geraLog('AVISO: Serviço em Execução.');
end;

procedure THWSCheckListServices.ServiceStop(Sender: TService;
  var Stopped: Boolean);
begin
    //HWS_ClientModule.HWS_geraLog('AVISO: Serviço Parado.');
    //HWS_ServceStatus(false);
end;

procedure THWSCheckListServices.HWS_Timer_ImportTimer(Sender: TObject);
begin
  HWS_Timer_Import.Enabled := False;
  if not HWS_ClientModule.HWS_SQLConnection.Connected then begin
     HWS_Timer_Export.Enabled := False;
     HWS_Timer_RE_Export.Enabled := False;
     HWS_ClientModule.HWS_geraLog('Erro ao Conectar Servidor');
     HWS_Timer_INI.Enabled:=True;
     exit;
  end;
  if HWS_ClientModule.HWS_Import then
     HWS_Timer_Import.Enabled := HWSserviceON;
end;

procedure THWSCheckListServices.HWS_Timer_INITimer(Sender: TObject);
var xemptimer:Integer;
begin
    HWSserviceON:=true;
    HWS_Timer_INI.Enabled:=False;
    HWS_Timer_INI.Interval:=30000;
    HWS_ClientModule.HWS_geraLog('HWSCheckList Service Inicado');
    try
       HWS_ClientModule.HWS_SQLConnection.Connected:=true;
       xemptimer:= HWS_ClientModule.xfileIni.xexp_timerseg * 1000;
       HWS_Timer_Export.Interval:=xemptimer;
       xemptimer:= HWS_ClientModule.xfileIni.xreexp_timerseg * 1000;
       HWS_Timer_RE_Export.Interval:=xemptimer;
       xemptimer:= HWS_ClientModule.xfileIni.ximp_timerseg * 1000;
       HWS_Timer_Import.Interval:=xemptimer;
       HWS_Timer_Export.Enabled:=True;
       HWS_Timer_RE_Export.Enabled:=True;
       HWS_Timer_Import.Enabled:=True;
    except
       HWS_ClientModule.HWS_geraLog('Erro ao Conectar Servidor');
       HWS_Timer_INI.Enabled:=True;
    end;
end;

end.
