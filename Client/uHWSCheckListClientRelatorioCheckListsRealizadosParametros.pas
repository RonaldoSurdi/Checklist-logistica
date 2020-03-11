unit uHWSCheckListClientRelatorioCheckListsRealizadosParametros;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids,
  Datasnap.DBClient, Vcl.OleServer, Excel2000, Vcl.Oleauto;

type
  THWS_Form_Relatorio_CheckLists_Realizados_Parametros = class(TForm)
    GroupBox1: TGroupBox;
    StatusBar1: TStatusBar;
    Pesquisar: TButton;
    Button1: TButton;
    Label3: TLabel;
    HWS_Edit_DaPlaca: TEdit;
    Label4: TLabel;
    HWS_Edit_AtePlaca: TEdit;
    Label5: TLabel;
    HWS_ComboBox_DoStatus: TComboBox;
    HWS_ComboBox_AteStatus: TComboBox;
    Label6: TLabel;
    Label1: TLabel;
    HWS_DateTimePicker_DaData: TDateTimePicker;
    Label2: TLabel;
    HWS_DateTimePicker_AteData: TDateTimePicker;
    procedure Button1Click(Sender: TObject);
    procedure PesquisarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HWS_Form_Relatorio_CheckLists_Realizados_Parametros: THWS_Form_Relatorio_CheckLists_Realizados_Parametros;

implementation

uses uHWSCheckListClientDataModule;

{$R *.dfm}

procedure THWS_Form_Relatorio_CheckLists_Realizados_Parametros.Button1Click(
  Sender: TObject);
begin
   Close;
end;

procedure THWS_Form_Relatorio_CheckLists_Realizados_Parametros.FormCreate(
  Sender: TObject);
begin
   HWS_DateTimePicker_DaData.Date   := Date;
   HWS_DateTimePicker_AteData.Date  := Date;
end;

procedure THWS_Form_Relatorio_CheckLists_Realizados_Parametros.PesquisarClick(
  Sender: TObject);
var  coluna, linha: integer;
     excel: variant;
     valor: string;
begin
   HWS_Edit_DaPlaca.Text := UpperCase(HWS_Edit_DaPlaca.Text);
   HWS_Edit_AtePlaca.Text := UpperCase(HWS_Edit_AtePlaca.Text);
   HWS_ClientModule.HWS_SqlServerMethod_F_HWS_RetornaCheckListsRealizados.Close;
   HWS_ClientModule.HWS_ClientDataSet_F_HWS_RetornaCheckListsRealizados.Close;
   HWS_ClientModule.HWS_SqlServerMethod_F_HWS_RetornaCheckListsRealizados.ParamByName('HWS_DaData').AsString := DateToStr(HWS_DateTimePicker_DaData.Date);
   HWS_ClientModule.HWS_SqlServerMethod_F_HWS_RetornaCheckListsRealizados.ParamByName('HWS_AteData').AsString := DateToStr(HWS_DateTimePicker_AteData.Date);
   HWS_ClientModule.HWS_SqlServerMethod_F_HWS_RetornaCheckListsRealizados.ParamByName('HWS_DaPlaca').AsString := HWS_Edit_DaPlaca.Text;
   HWS_ClientModule.HWS_SqlServerMethod_F_HWS_RetornaCheckListsRealizados.ParamByName('HWS_AtePlaca').AsString := HWS_Edit_AtePlaca.Text;
   HWS_ClientModule.HWS_SqlServerMethod_F_HWS_RetornaCheckListsRealizados.ParamByName('HWS_DoStatus').AsString := HWS_ComboBox_DoStatus.Items.Names[HWS_ComboBox_DoStatus.ItemIndex];
   HWS_ClientModule.HWS_SqlServerMethod_F_HWS_RetornaCheckListsRealizados.ParamByName('HWS_AteStatus').AsString := HWS_ComboBox_AteStatus.Items.Names[HWS_ComboBox_AteStatus.ItemIndex];
   HWS_ClientModule.HWS_SqlServerMethod_F_HWS_RetornaCheckListsRealizados.ExecuteMethod;
   HWS_ClientModule.HWS_ClientDataSet_F_HWS_RetornaCheckListsRealizados.Open;
   try
      excel := CreateOleObject('Excel.Application');
      excel.Workbooks.add(1);
   except
      Application.MessageBox ('Versão do Ms-Excel Incompatível','Erro',MB_OK+MB_ICONEXCLAMATION);
   end;
   HWS_ClientModule.HWS_ClientDataSet_F_HWS_RetornaCheckListsRealizados.First;
   try
      for linha := 0 to HWS_ClientModule.HWS_ClientDataSet_F_HWS_RetornaCheckListsRealizados.RecordCount-1 do begin
         for coluna := 1 to HWS_ClientModule.HWS_ClientDataSet_F_HWS_RetornaCheckListsRealizados.FieldCount do begin
            valor:= HWS_ClientModule.HWS_ClientDataSet_F_HWS_RetornaCheckListsRealizados.Fields[coluna-1].AsString;
            excel.cells[linha+2,coluna] := valor;
         end;
         HWS_ClientModule.HWS_ClientDataSet_F_HWS_RetornaCheckListsRealizados.Next;
      end;
      for coluna := 1 to HWS_ClientModule.HWS_ClientDataSet_F_HWS_RetornaCheckListsRealizados.FieldCount do begin
         valor := HWS_ClientModule.HWS_ClientDataSet_F_HWS_RetornaCheckListsRealizados.Fields[coluna-1].DisplayLabel;
         excel.cells[1,coluna]  := valor;
      end;
      excel.columns.AutoFit; // esta linha é para fazer com que o Excel dimencione as células adequadamente.
      excel.visible:=true;
   except
      Application.MessageBox('Ocooreu um erro desconhecido durante a conversão dos dados para o Ms-Excel','Erro',MB_OK+MB_ICONEXCLAMATION);
   end;
end;

end.
