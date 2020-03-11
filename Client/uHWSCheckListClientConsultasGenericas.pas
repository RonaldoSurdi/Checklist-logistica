unit uHWSCheckListClientConsultasGenericas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.ComCtrls, Data.DB;

type
  THWS_Form_ConsultasGenericas = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    HWS_ComboBox_Nome_Indice: TComboBox;
    Label2: TLabel;
    HWS_Edit_Pesquisa: TEdit;
    Button1: TButton;
    Button2: TButton;
    StatusBar1: TStatusBar;
    HWS_DBGrid_Pesquisa: TDBGrid;
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure HWS_Edit_PesquisaKeyPress(Sender: TObject; var Key: Char);
    function F_HWS_LocalizaConsultaGenerica: Boolean;
    procedure Button1Click(Sender: TObject);
    procedure HWS_DBGrid_PesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure HWS_DBGrid_PesquisaDblClick(Sender: TObject);
  private
    { Private declarations }
  public
      HWS_Campos_Do_Indice, HWS_Campos_Para_DBGrid: TStringList;
    { Public declarations }
  end;

var
  HWS_Form_ConsultasGenericas: THWS_Form_ConsultasGenericas;

implementation

{$R *.dfm}

procedure THWS_Form_ConsultasGenericas.Button1Click(Sender: TObject);
begin
   Tag := 1;
   Close;
end;

procedure THWS_Form_ConsultasGenericas.Button2Click(Sender: TObject);
begin
   Tag := 0;
   Close;
end;

procedure THWS_Form_ConsultasGenericas.FormCreate(Sender: TObject);
begin
   HWS_Campos_Do_Indice    := TStringList.Create;
   HWS_Campos_Para_DBGrid  := TStringList.Create;
end;

procedure THWS_Form_ConsultasGenericas.HWS_DBGrid_PesquisaDblClick(
  Sender: TObject);
begin
   Tag := 1;
   Close;
end;

procedure THWS_Form_ConsultasGenericas.HWS_DBGrid_PesquisaKeyPress(
  Sender: TObject; var Key: Char);
begin
   if Key = #13 then begin
      Tag := 1;
      Close;
   end;
end;

procedure THWS_Form_ConsultasGenericas.HWS_Edit_PesquisaKeyPress(
  Sender: TObject; var Key: Char);
begin
   if Key = #13 then
      F_HWS_LocalizaConsultaGenerica;
end;

function THWS_Form_ConsultasGenericas.F_HWS_LocalizaConsultaGenerica: Boolean;
begin
   HWS_DBGrid_Pesquisa.DataSource.DataSet.Locate(HWS_Campos_Do_Indice.Strings[HWS_ComboBox_Nome_Indice.ItemIndex],HWS_Edit_Pesquisa.Text,[loPartialKey,loCaseInsensitive]);
end;


end.
