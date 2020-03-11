unit uHWSCheckListClientManutencao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Grids,
  Vcl.Buttons, Data.DBXJSON;

type
  THWS_Form_Manutencao = class(TForm)
    GroupBox1: TGroupBox;
    StatusBar1: TStatusBar;
    BitBtn4: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    ListBox1: TListBox;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HWS_Form_Manutencao: THWS_Form_Manutencao;

implementation

uses uHWSCheckListClientDataModule;

{$R *.dfm}

procedure THWS_Form_Manutencao.FormCreate(Sender: TObject);
var HWS_Retorno: TJSONArray;
begin
   HWS_ClientModule.SqlServerMethod1.ExecuteMethod;
   //ListBox1.Items.AddStrings((HWS_ClientModule.SqlServerMethod1.ParamByName('Retorno').AsObject as TStrings));
   HWS_Retorno := (HWS_ClientModule.SqlServerMethod1.ParamByName('Retorno').AsObject as TJSONArray);
   ShowMessage('TESTE');
end;

end.
