unit uHWSJsonSrv;

interface

uses System.Generics.Collections;

type
  TListaPlacasImport = class
  private
    FIM_CODCLI: string;
    FIM_PLACA: string;
    FIM_CODTIPO: string;
    FIM_DESCTIPO: string;
    FIM_OPERACAO: string;
  public
    property IM_CODCLI: string read FIM_CODCLI write FIM_CODCLI;
    property IM_PLACA: string read FIM_PLACA write FIM_PLACA;
    property IM_CODTIPO: string read FIM_CODTIPO write FIM_CODTIPO;
    property IM_DESCTIPO: string read FIM_DESCTIPO write FIM_DESCTIPO;
    property IM_OPERACAO: string read FIM_OPERACAO write FIM_OPERACAO;
  end;

  TPlacasImport = class
  private
    FIM_CODCLI: string;
    FIM_FILENAME: string;
    FListaPlacasImport: TList<TListaPlacasImport>;
  public
    property IM_CODCLI: string read FIM_CODCLI write FIM_CODCLI;
    property IM_FILENAME: string read FIM_FILENAME write FIM_FILENAME;
    property ListaPlacasImport: TList<TListaPlacasImport> read FListaPlacasImport;
    constructor Create;
    destructor Destroy;
  end;

implementation

constructor TPlacasImport.Create;
begin
  FListaPlacasImport := TList<TListaPlacasImport>.Create;
end;

destructor TPlacasImport.Destroy;
begin
  FListaPlacasImport.Free;
end;

end.
