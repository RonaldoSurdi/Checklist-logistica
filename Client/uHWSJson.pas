unit uHWSJson;

interface

uses System.Generics.Collections;

type
  TListaPerguntaXRespostas = class
  private
    FAH_CODCHK: string;
    FAH_CODPER: string;
    FAH_CODRES: string;
    FAH_FOTO:   string;
  public
    property AH_CODCHK: string read FAH_CODCHK write FAH_CODCHK;
    property AH_CODPER: string read FAH_CODPER write FAH_CODPER;
    property AH_CODRES: string read FAH_CODRES write FAH_CODRES;
    property AH_FOTO:   string read FAH_FOTO write FAH_FOTO;
  end;

  TPerguntasXRespostas = class
  private
    FAH_CODCHK: string;
    FListaPerguntaXRespostas: TList<TListaPerguntaXRespostas>;
  public
    property AH_CODCHK: string read FAH_CODCHK write FAH_CODCHK;
    property ListaPerguntasXRespostas: TList<TListaPerguntaXRespostas> read FListaPerguntaXRespostas;
    constructor Create;
    destructor Destroy;
  end;

implementation

constructor TPerguntasXRespostas.Create;
begin
  FListaPerguntaXRespostas := TList<TListaPerguntaXRespostas>.Create;
end;

destructor TPerguntasXRespostas.Destroy;
begin
  FListaPerguntaXRespostas.Free;
end;

end.
