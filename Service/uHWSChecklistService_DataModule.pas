unit uHWSChecklistService_DataModule;

interface

uses
  System.SysUtils, System.Classes, uHWSChecklistService_functions, Data.DBXJSON, WinAPI.Windows,
  IndyPeerImpl, Vcl.ExtCtrls, Datasnap.DSClientRest, Data.DBXDataSnap, Vcl.Forms, System.IniFiles,
  Data.DBXCommon, Data.FMTBcd, Datasnap.Provider, Datasnap.DBClient, Data.DB, Data.SqlExpr,
  Data.DBXJSONReflect, MidasLib;

type
  TxfileIni = Record
      //geral
      xfilename: String;
      xidentidade: String;
      xlog_on: Boolean;
      xlog_dir: String;
      xlog_file: String;
      xdir_temp: String;
      //exportar
      xexp_delimitador: String;
      xexp_timerseg: Integer;
      xreexp_timerseg: Integer;
      xexportdir: String;
      xexportdir_recebidos: String;
      xexportdir_invalidos: String;
      //importar
      ximp_delimitador: String;
      ximp_timerseg: Integer;
      ximportdir: String;
      ximportdir_recebidos: String;
      ximportdir_invalidos: String;
  End;
  THWS_ClientModule = class(TDataModule)
    HWS_DSRestConnection: TDSRestConnection;
    HWS_SQLConnection: TSQLConnection;
    HWS_SqlServerMethod_F_HWS_RetornaChkExp: TSqlServerMethod;
    HWS_SqlServerMethod_F_HWS_InsertChkExp: TSqlServerMethod;
    HWS_ClientDataSet_F_HWS_RetornaChkExp: TClientDataSet;
    HWS_DataSetProvider_F_HWS_RetornaChkExp: TDataSetProvider;
    HWS_SqlServerMethod_F_HWS_RetornaReExp: TSqlServerMethod;
    HWS_ClientDataSet_F_HWS_RetornaReExp: TClientDataSet;
    HWS_DataSetProvider_F_HWS_RetornaReExp: TDataSetProvider;
    HWS_SqlServerMethod_F_HWS_InsertChkPlacas: TSqlServerMethod;
    function HWS_Export(HWS_CodIniSet, HWS_CodEndSet, HWS_IdExpSet: String): Boolean;
    function HWS_RE_Export: Boolean;
    function HWS_Import: Boolean;
    procedure HWS_geraLog(xmensa:String);
  private
    FInstanceOwner: Boolean;
    FHWS_ServerMethodsClient: THWS_ServerMethodsClient;
    function GetHWS_ServerMethodsClient: THWS_ServerMethodsClient;
    procedure HWS_LocalizarArquivos(HWS_BuscaRecursiva: Boolean; HWS_diretorio, HWS_pesquisa: String; var HWS_listaRetorno: TStringList);
    { Private declarations }
  public
    xfileIni: TxfileIni;
    xfileIniOpen: Boolean;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property InstanceOwner: Boolean read FInstanceOwner write FInstanceOwner;
    property HWS_ServerMethodsClient: THWS_ServerMethodsClient read GetHWS_ServerMethodsClient write FHWS_ServerMethodsClient;

end;

var
  HWS_ClientModule: THWS_ClientModule;

implementation

Uses uHWSJsonSrv;

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

function THWS_ClientModule.HWS_Export(HWS_CodIniSet, HWS_CodEndSet, HWS_IdExpSet: String): Boolean;
var HWS_File_Export: TextFile;
    HWS_File_Delimit: String;
    HWS_File_New,HWS_File_Pasta,HWS_File_Temp,xfiletmpDT,HWS_Observacoes: String;
    HWS_CodIni, HWS_CodEnd, HWS_IdExp: String;
    HWS_Retorno: TJSONArray;
begin
  try
    HWS_File_Delimit:= xfileIni.xexp_delimitador;
    HWS_File_Pasta:= xfileIni.xexportdir;
    DateTimeToString(xfiletmpDT,'ddmmyyyyhhnnss',Now);
    HWS_File_Temp:= xfileIni.xdir_temp+'HWSCheckList_Exportar_'+xfiletmpDT+'.tmp';
    HWS_SqlServerMethod_F_HWS_RetornaChkExp.Close;
    HWS_SqlServerMethod_F_HWS_RetornaChkExp.ParamByName('HWS_CodEmpresa').AsString := '000001';
    HWS_SqlServerMethod_F_HWS_RetornaChkExp.ParamByName('HWS_TipoIni').AsString    := HWS_CodIniSet;
    HWS_SqlServerMethod_F_HWS_RetornaChkExp.ParamByName('HWS_TipoEnd').AsString    := HWS_CodEndSet;
    HWS_SqlServerMethod_F_HWS_RetornaChkExp.ExecuteMethod;
    HWS_ClientDataSet_F_HWS_RetornaChkExp.Open;
    HWS_IdExp:=HWS_IdExpSet;
    if HWS_ClientDataSet_F_HWS_RetornaChkExp.RecordCount > 0 then begin
      HWS_CodIni  := HWS_ClientDataSet_F_HWS_RetornaChkExp.FieldByName('BB_CODIGO').AsString;
      AssignFile(HWS_File_Export, HWS_File_Temp);
      ReWrite(HWS_File_Export);
      while not HWS_ClientDataSet_F_HWS_RetornaChkExp.Eof do begin
        HWS_Observacoes := HWS_ClientDataSet_F_HWS_RetornaChkExp.FieldByName('BB_OBS').Text;
        HWS_Observacoes := StringReplace(HWS_Observacoes,HWS_File_Delimit,' ',[rfReplaceAll]);
        HWS_Observacoes := StringReplace(HWS_Observacoes,#13#10,' ',[rfReplaceAll]);
        HWS_Observacoes := StringReplace(HWS_Observacoes,#13,' ',[rfReplaceAll]);
        Writeln(HWS_File_Export,
                  HWS_ClientDataSet_F_HWS_RetornaChkExp.FieldByName('BB_PLACA').AsString + HWS_File_Delimit +
                  HWS_ClientDataSet_F_HWS_RetornaChkExp.FieldByName('BB_DTCHECK').AsString  + HWS_File_Delimit +
                  HWS_ClientDataSet_F_HWS_RetornaChkExp.FieldByName('BB_HRCHECK').AsString  + HWS_File_Delimit +
                  HWS_Observacoes   + HWS_File_Delimit +
                  HWS_ClientDataSet_F_HWS_RetornaChkExp.FieldByName('BB_STATUS').AsString + HWS_File_Delimit +
                  HWS_ClientDataSet_F_HWS_RetornaChkExp.FieldByName('HI_USER').AsString);


        HWS_ClientDataSet_F_HWS_RetornaChkExp.Next;
      end;
      HWS_ClientDataSet_F_HWS_RetornaChkExp.Last;
      HWS_CodEnd := HWS_ClientDataSet_F_HWS_RetornaChkExp.FieldByName('BB_CODIGO').AsString;
      //////////////////////////////////
      HWS_SqlServerMethod_F_HWS_InsertChkExp.Close;
      HWS_SqlServerMethod_F_HWS_InsertChkExp.ParamByName('HWS_ChkCodIni').AsString := HWS_CodIni;
      HWS_SqlServerMethod_F_HWS_InsertChkExp.ParamByName('HWS_ChkCodEnd').AsString := HWS_CodEnd;
      HWS_SqlServerMethod_F_HWS_InsertChkExp.ParamByName('HWS_ChkIdExp').AsString := HWS_IdExp;
      HWS_SqlServerMethod_F_HWS_InsertChkExp.ExecuteMethod;
      HWS_Retorno := (HWS_SqlServerMethod_F_HWS_InsertChkExp.ParamByName('Retorno').AsObject as TJSONArray);
      CloseFile(HWS_File_Export);
      if HWS_Retorno.Get(0).Value = 'S' then begin
         HWS_File_New:= HWS_File_Pasta + 'HWSCheckList_' + HWS_Retorno.Get(1).Value + HWS_Retorno.Get(2).Value+'.txt';
         MoveFile(PChar(HWS_File_Temp),PChar(HWS_File_New));
         HWS_geraLog('Arquivo Exportado com sucesso ['+HWS_File_New+']');
      end else begin
         DeleteFile(PChar(HWS_File_Temp));
      end;
    end;
    HWS_SqlServerMethod_F_HWS_RetornaChkExp.Close;
    HWS_ClientDataSet_F_HWS_RetornaChkExp.Close;
  except on E: Exception do begin
    HWS_geraLog(E.ToString);
    CloseFile(HWS_File_Export);
    DeleteFile(PChar(HWS_File_Temp));
  end;
  end;
  Result := True;
end;

function THWS_ClientModule.HWS_RE_Export: Boolean;
var HWS_EXCodIni, HWS_EXCodEnd, HWS_EXIdExp: String;
    HWS_EXIdExpNumb:Integer;
begin
  try
    HWS_SqlServerMethod_F_HWS_RetornaReExp.Close;
    HWS_SqlServerMethod_F_HWS_RetornaReExp.ExecuteMethod;
    HWS_ClientDataSet_F_HWS_RetornaReExp.Open;
    if HWS_ClientDataSet_F_HWS_RetornaReExp.RecordCount > 0 then begin
      while not HWS_ClientDataSet_F_HWS_RetornaReExp.Eof do begin
          HWS_EXCodIni:=HWS_ClientDataSet_F_HWS_RetornaReExp.FieldByName('EX_COD_INI').AsString;
          HWS_EXCodEnd:=HWS_ClientDataSet_F_HWS_RetornaReExp.FieldByName('EX_COD_END').AsString;
          HWS_EXIdExpNumb:=StrToInt(HWS_ClientDataSet_F_HWS_RetornaReExp.FieldByName('EX_ID').AsString);
          HWS_EXIdExp:=IntToStr(HWS_EXIdExpNumb);
          HWS_Export(HWS_EXCodIni,HWS_EXCodEnd,HWS_EXIdExp);
          HWS_ClientDataSet_F_HWS_RetornaReExp.Next;
      end;
    end;
    HWS_SqlServerMethod_F_HWS_RetornaReExp.Close;
    HWS_ClientDataSet_F_HWS_RetornaReExp.Close;
  except on E: Exception do
    HWS_geraLog(E.ToString);
  end;
  Result := True;
end;

function THWS_ClientModule.HWS_Import: Boolean;
var HWS_PlacasImport: TPlacasImport;
    HWS_ListaPlacasImport: TListaPlacasImport;
    HWS_Conversor: TJSONMarshal;
    HWS_Retorno: TJSONArray;
    HWS_Reverte : TJSONUnMarshal;
    HWS_ListFilesImport,HWS_ListVarsFile: TStringList;
    HWS_FileImport: TextFile;
    HWS_FileLine,HWS_FileName,HWS_FileNameNew: String;
    I_file: Integer;
    I_delimiter: String;
begin
   try
      try
          HWS_ListFilesImport:=TStringList.Create;
          HWS_ListVarsFile:=TStringList.Create;
          I_delimiter := xfileIni.ximp_delimitador;
          HWS_LocalizarArquivos(false,xfileIni.ximportdir,'*.txt',HWS_ListFilesImport);
          if HWS_ListFilesImport.Count>0 then
          for I_file := 0 to HWS_ListFilesImport.Count-1 do begin
              HWS_FileName:=HWS_ListFilesImport.Strings[I_file];
              HWS_FileName:=HWS_ListFilesImport.Strings[I_file];
              AssignFile(HWS_FileImport,HWS_FileName);
              Reset(HWS_FileImport);
              HWS_PlacasImport := TPlacasImport.Create;
              HWS_PlacasImport.IM_CODCLI := xfileIni.xidentidade;
              HWS_FileNameNew:=ExtractFileName(HWS_FileName);
              HWS_PlacasImport.IM_FILENAME := HWS_FileNameNew;
              while not eof(HWS_FileImport) do begin
                  HWS_ListVarsFile.Clear;
                  Readln(HWS_FileImport,HWS_FileLine);
                  HWS_ListVarsFile.Text:=StringReplace(HWS_FileLine,I_delimiter,#13,[rfReplaceAll]);
                  HWS_ListaPlacasImport := TListaPlacasImport.Create;
                  HWS_ListaPlacasImport.IM_CODCLI := xfileIni.xidentidade;
                  HWS_ListaPlacasImport.IM_PLACA := HWS_ListVarsFile.Strings[0];
                  HWS_ListaPlacasImport.IM_CODTIPO := HWS_ListVarsFile.Strings[1];
                  HWS_ListaPlacasImport.IM_DESCTIPO := HWS_ListVarsFile.Strings[2];
                  HWS_ListaPlacasImport.IM_OPERACAO := HWS_ListVarsFile.Strings[3];
                  HWS_PlacasImport.ListaPlacasImport.Add(HWS_ListaPlacasImport);
              end;
              Closefile(HWS_FileImport);
              HWS_Conversor := TJSONMarshal.Create;
              HWS_Reverte := TJSONUnMarshal.Create;
              HWS_ClientModule.HWS_SqlServerMethod_F_HWS_InsertChkPlacas.ParamByName('HWS_filePlacas').AsObject := HWS_Conversor.Marshal(HWS_PlacasImport);
              HWS_ClientModule.HWS_SqlServerMethod_F_HWS_InsertChkPlacas.ExecuteMethod;
              HWS_Retorno := (HWS_ClientModule.HWS_SqlServerMethod_F_HWS_InsertChkPlacas.ParamByName('Retorno').AsObject as TJSONArray);
              if HWS_Retorno.Get(0).Value = 'S' then begin
                 HWS_geraLog('Arquivo importado com sucesso [' + HWS_FileName + ']');
                 HWS_FileNameNew:=xfileIni.ximportdir_recebidos+HWS_FileNameNew;
              end else begin
                 HWS_geraLog('Erro ao importar arquivo [' + HWS_FileName + ']');
                 HWS_FileNameNew:=xfileIni.ximportdir_invalidos+HWS_FileNameNew;
              end;
              MoveFile(PChar(HWS_FileName),PChar(HWS_FileNameNew));
          end;
      except on E: Exception do
        HWS_geraLog(E.ToString);
      end;
   finally
      HWS_ListFilesImport.Free;
      HWS_ListVarsFile.Free;
   end;
  Result := True;
end;

procedure THWS_ClientModule.HWS_LocalizarArquivos(HWS_BuscaRecursiva: Boolean; HWS_diretorio, HWS_pesquisa: String; var HWS_listaRetorno: TStringList);
var f: TSearchRec;
    r: integer;
begin
  HWS_listaRetorno.Clear;
  if HWS_diretorio[length(HWS_diretorio)]<>'\'then
     HWS_diretorio := HWS_diretorio+'\';
  if not DirectoryExists(HWS_diretorio) then
     exit;
  r := FindFirst(HWS_diretorio+HWS_pesquisa,faAnyFile,f);
  while (r=0) do begin
     r := FindNext(f);
     if (f.Name = '.') or (f.Name='..') then
        Continue;
     if (HWS_BuscaRecursiva and (f.Attr = fadirectory)) then
        HWS_LocalizarArquivos(true,HWS_diretorio+f.Name,HWS_pesquisa,HWS_listaRetorno)
     else if (f.Attr <> fadirectory) then
        HWS_listaRetorno.Add(HWS_diretorio+f.Name);
  end;
end;

procedure THWS_ClientModule.HWS_geraLog(xmensa:String);
var FLog: TextFile;
    Fini: TextFile;
    S,xtime: string;
    xfilenameDT,xfile_fullname,xfile_name,xpath_file: String;
    HWS_ini: TIniFile;
begin
    if (not xfileIniOpen) then begin
       xfileIniOpen:=True;
       DateTimeToString(xfilenameDT,'ddmmyyyyhhnnss',Now);
       xfile_fullname := ExtractFileName(Application.ExeName);
       xfile_name := copy(xfile_fullname,0,Length(xfile_fullname)-4);
       xpath_file:=ExtractFilePath(Application.ExeName);
       xfileIni.xfilename:=xpath_file+xfile_name+'.ini';
       //HWSCheckList
       xfileIni.xidentidade:= '1';
       xfileIni.xlog_on:= true;
       xfileIni.xlog_dir:= xpath_file+'Logs\';
       xfileIni.xdir_temp:= xpath_file+'Temp\';
       //Exportar
       xfileIni.xexp_delimitador:= '|';
       xfileIni.xexp_timerseg:= 10;
       xfileIni.xreexp_timerseg:= 20;
       xfileIni.xexportdir:= xpath_file+'Exportar\';
       xfileIni.xexportdir_recebidos:= xpath_file+'Exportar\Recebidos\';
       xfileIni.xexportdir_invalidos:= xpath_file+'Exportar\Invalidos\';
       //Importar
       xfileIni.ximp_delimitador:= '|';
       xfileIni.ximp_timerseg:= 60;
       xfileIni.ximportdir:= xpath_file+'Importar\';
       xfileIni.ximportdir_recebidos:= xpath_file+'Importar\Recebidos\';
       xfileIni.ximportdir_invalidos:= xpath_file+'Importar\Invalidos\';
       if not FileExists(xfileIni.xfilename) then begin
          AssignFile(Fini, xfileIni.xfilename);
          ReWrite(Fini);
          Writeln(Fini,'[HWSCheckList]');
          Writeln(Fini,'id='+xfileIni.xidentidade);
          Writeln(Fini,'registrar_log='+BoolToStr(xfileIni.xlog_on));
          Writeln(Fini,'pasta_log='+xfileIni.xlog_dir);
          Writeln(Fini,'pasta_temp='+xfileIni.xdir_temp);
          Writeln(Fini,'[Exportar]');
          Writeln(Fini,'delimitador='+xfileIni.xexp_delimitador);
          Writeln(Fini,'refresh_seg='+IntToStr(xfileIni.xexp_timerseg));
          Writeln(Fini,'re_exportar_seg='+IntToStr(xfileIni.xreexp_timerseg));
          Writeln(Fini,'pasta_entrada='+xfileIni.xexportdir);
          Writeln(Fini,'pasta_recebidos='+xfileIni.xexportdir_recebidos);
          Writeln(Fini,'pasta_invalidos='+xfileIni.xexportdir_invalidos);
          Writeln(Fini,'[Importar]');
          Writeln(Fini,'delimitador='+xfileIni.ximp_delimitador);
          Writeln(Fini,'refresh_seg='+IntToStr(xfileIni.ximp_timerseg));
          Writeln(Fini,'pasta_entrada='+xfileIni.ximportdir);
          Writeln(Fini,'pasta_recebidos='+xfileIni.ximportdir_recebidos);
          Writeln(Fini,'pasta_invalidos='+xfileIni.ximportdir_invalidos);
          CloseFile(Fini);
       end;
       try
          HWS_ini:= TIniFile.Create(xfileIni.xfilename);
          //HWSCheckList
          xfileIni.xidentidade:=HWS_ini.ReadString('HWSCheckList','id',xfileIni.xidentidade);
          xfileIni.xlog_on:=HWS_ini.ReadBool('HWSCheckList','registrar_log',xfileIni.xlog_on);
          xfileIni.xlog_dir:=HWS_ini.ReadString('HWSCheckList','pasta_log',xfileIni.xlog_dir);
          xfileIni.xdir_temp:=HWS_ini.ReadString('HWSCheckList','pasta_temp',xfileIni.xdir_temp);
          //Exportar
          xfileIni.xexp_delimitador:=HWS_ini.ReadString('Exportar','delimitador',xfileIni.xexp_delimitador);
          xfileIni.xexp_timerseg:=HWS_ini.ReadInteger('Exportar','refresh_seg',xfileIni.xexp_timerseg);
          xfileIni.xreexp_timerseg:=HWS_ini.ReadInteger('Exportar','re_exportar_seg',xfileIni.xreexp_timerseg);
          xfileIni.xexportdir:=HWS_ini.ReadString('Exportar','pasta_entrada',xfileIni.xexportdir);
          xfileIni.xexportdir_recebidos:=HWS_ini.ReadString('Exportar','pasta_recebidos',xfileIni.xexportdir_recebidos);
          xfileIni.xexportdir_invalidos:=HWS_ini.ReadString('Exportar','pasta_invalidos',xfileIni.xexportdir_invalidos);
          //Importar
          xfileIni.ximp_delimitador:=HWS_ini.ReadString('Importar','delimitador',xfileIni.ximp_delimitador);
          xfileIni.ximp_timerseg:=HWS_ini.ReadInteger('Importar','refresh_seg',xfileIni.ximp_timerseg);
          xfileIni.ximportdir:=HWS_ini.ReadString('Importar','pasta_entrada',xfileIni.ximportdir);
          xfileIni.ximportdir_recebidos:=HWS_ini.ReadString('Importar','pasta_recebidos',xfileIni.ximportdir_recebidos);
          xfileIni.ximportdir_invalidos:=HWS_ini.ReadString('Importar','pasta_invalidos',xfileIni.ximportdir_invalidos);
       finally
          HWS_ini.Free;
       end;
       //exportar
       if not DirectoryExists(xfileIni.xexportdir) then
          CreateDirectory(PChar(xfileIni.xexportdir),nil);
       if not DirectoryExists(xfileIni.xexportdir_recebidos) then
          CreateDirectory(PChar(xfileIni.xexportdir_recebidos),nil);
       if not DirectoryExists(xfileIni.xexportdir_invalidos) then
          CreateDirectory(PChar(xfileIni.xexportdir_invalidos),nil);
       //importar
       if not DirectoryExists(xfileIni.ximportdir) then
          CreateDirectory(PChar(xfileIni.ximportdir),nil);
       if not DirectoryExists(xfileIni.ximportdir_recebidos) then
          CreateDirectory(PChar(xfileIni.ximportdir_recebidos),nil);
       if not DirectoryExists(xfileIni.ximportdir_invalidos) then
          CreateDirectory(PChar(xfileIni.ximportdir_invalidos),nil);
       //logs
       if not DirectoryExists(xfileIni.xdir_temp) then
          CreateDirectory(PChar(xfileIni.xdir_temp),nil);
       if not DirectoryExists(xfileIni.xlog_dir) then
          CreateDirectory(PChar(xfileIni.xlog_dir),nil);
       xfileIni.xlog_file:=xfileIni.xlog_dir+xfile_name+xfilenameDT+'.log';
    end;
    AssignFile(FLog, xfileIni.xlog_file);
    DateTimeToString(xtime,'yyyy-mm-dd hh:nn:ss',now);
    if FileExists(xfileIni.xlog_file) then Append(FLog)
    else ReWrite(FLog);
    Writeln(FLog,xtime+': '+xmensa);
    CloseFile(FLog);
end;

end.
