unit uHWSCheckListClientRelatorioCheckListsRealizadosAnaliticoParametros;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.OleAuto,
  frxClass, frxDBSet, Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient, Data.DB,
  frxExportPDF;

type
  THWS_Form_Relatorio_CheckLists_Realizados_Analitico_Parametros = class(TForm)
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    HWS_Edit_DaPlaca: TEdit;
    HWS_Edit_AtePlaca: TEdit;
    HWS_ComboBox_DoStatus: TComboBox;
    HWS_ComboBox_AteStatus: TComboBox;
    HWS_DateTimePicker_DaData: TDateTimePicker;
    HWS_DateTimePicker_AteData: TDateTimePicker;
    StatusBar1: TStatusBar;
    Pesquisar: TButton;
    Button1: TButton;
    Label7: TLabel;
    HWS_ComboBox_CheckLists: TComboBox;
    HWS_frxReport: TfrxReport;
    HWS_frxDBDataset_F_HWS_ImpressaoCheckListsAnalitico_Detalhe: TfrxDBDataset;
    frxPDFExport1: TfrxPDFExport;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure PesquisarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HWS_Form_Relatorio_CheckLists_Realizados_Analitico_Parametros: THWS_Form_Relatorio_CheckLists_Realizados_Analitico_Parametros;

implementation

uses uHWSFuncoes, uHWSCheckListClientDataModule, uHWSCheckListClientAutenticacao;

{$R *.dfm}

procedure THWS_Form_Relatorio_CheckLists_Realizados_Analitico_Parametros.Button1Click(
  Sender: TObject);
begin
   Close;
end;

procedure THWS_Form_Relatorio_CheckLists_Realizados_Analitico_Parametros.FormCreate(
  Sender: TObject);
begin
   HWS_DateTimePicker_DaData.Date := Date;
   HWS_DateTimePicker_AteData.Date := Date;
   F_HWS_RetornaCheckLists(HWS_ComboBox_CheckLists);
end;

procedure THWS_Form_Relatorio_CheckLists_Realizados_Analitico_Parametros.PesquisarClick(
  Sender: TObject);
var HWS_ClientDataSet_Master,HWS_ClientDataSet_Detalhe: TClientDataSet;
    HWS_DataSource_Master,HWS_DataSource_Detalhe: TDataSource;
begin

   HWS_ClientModule.HWS_ClientDataSet_F_HWS_ImpressaoCheckListsAnalitico_Detalhe.Close;
   HWS_ClientModule.HWS_SqlServerMethod_F_HWS_ImpressaoCheckListsAnalitico_Detalhe.Close;
   HWS_ClientModule.HWS_SqlServerMethod_F_HWS_ImpressaoCheckListsAnalitico_Detalhe.ParamByName('HWS_CodEmpresa').AsString  := HWS_PUBLIC_CODCLIENTE;
   HWS_ClientModule.HWS_SqlServerMethod_F_HWS_ImpressaoCheckListsAnalitico_Detalhe.ParamByName('HWS_CheckList').AsString  := HWS_ComboBox_CheckLists.Items.Names[HWS_ComboBox_CheckLists.ItemIndex];
   HWS_ClientModule.HWS_SqlServerMethod_F_HWS_ImpressaoCheckListsAnalitico_Detalhe.ParamByName('HWS_DaData').AsString     := FormatDateTime('yyyy-mm-dd',HWS_DateTimePicker_DaData.Date);
   HWS_ClientModule.HWS_SqlServerMethod_F_HWS_ImpressaoCheckListsAnalitico_Detalhe.ParamByName('HWS_AteData').AsString    := FormatDateTime('yyyy-mm-dd',HWS_DateTimePicker_AteData.Date);
   HWS_ClientModule.HWS_SqlServerMethod_F_HWS_ImpressaoCheckListsAnalitico_Detalhe.ParamByName('HWS_DaPlaca').AsString    := HWS_Edit_DaPlaca.Text;
   HWS_ClientModule.HWS_SqlServerMethod_F_HWS_ImpressaoCheckListsAnalitico_Detalhe.ParamByName('HWS_AtePlaca').AsString   := HWS_Edit_AtePlaca.Text;
   HWS_ClientModule.HWS_SqlServerMethod_F_HWS_ImpressaoCheckListsAnalitico_Detalhe.ParamByName('HWS_DoStatus').AsString   := HWS_ComboBox_DoStatus.Items.Names[HWS_ComboBox_DoStatus.ItemIndex];
   HWS_ClientModule.HWS_SqlServerMethod_F_HWS_ImpressaoCheckListsAnalitico_Detalhe.ParamByName('HWS_AteStatus').AsString  := HWS_ComboBox_AteStatus.Items.Names[HWS_ComboBox_AteStatus.ItemIndex];
   HWS_ClientModule.HWS_ClientDataSet_F_HWS_ImpressaoCheckListsAnalitico_Detalhe.Open;

   //

   HWS_ClientDataSet_Detalhe := TClientDataSet.Create(Self);
   HWS_ClientDataSet_Detalhe.CloneCursor(HWS_ClientModule.HWS_ClientDataSet_F_HWS_ImpressaoCheckListsAnalitico_Detalhe,True);
   HWS_DataSource_Detalhe := TDataSource.Create(Self);
   HWS_DataSource_Detalhe.DataSet := HWS_ClientDataSet_Detalhe;


   HWS_ClientModule.HWS_ClientDataSet_F_HWS_ImpressaoCheckListsAnalitico_Detalhe.Open;

   HWS_frxDBDataset_F_HWS_ImpressaoCheckListsAnalitico_Detalhe.DataSource := HWS_DataSource_Detalhe;

   HWS_frxReport.ShowReport();

   HWS_ClientModule.HWS_ClientDataSet_F_HWS_ImpressaoCheckListsAnalitico_Detalhe.EmptyDataSet;


end;

end.
