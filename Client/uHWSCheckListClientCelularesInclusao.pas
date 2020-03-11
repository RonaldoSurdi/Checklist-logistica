unit uHWSCheckListClientCelularesInclusao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Mask, Data.DBXJSON;

type
  THWS_Form_Celulares_Inclusao = class(TForm)
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    HWS_Edit_Descricao: TEdit;
    HWS_ComboBox_Status: TComboBox;
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    HWS_Edit_Numero: TEdit;
    Button2: TButton;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HWS_Form_Celulares_Inclusao: THWS_Form_Celulares_Inclusao;

implementation

uses uHWSFuncoes, uHWSCheckListClientDataModule, uHWSCheckListClientAutenticacao;

{$R *.dfm}

procedure THWS_Form_Celulares_Inclusao.Button1Click(Sender: TObject);
var HWS_Retorno: TJSONArray;
begin
   if F_HWS_ValidaDadosFormulario(HWS_ClientModule.HWS_ClientDataSet_HD01,'I','HD_CHIP',HWS_Edit_Numero.Text,HWS_Form_Celulares_Inclusao) then begin
      try
         HWS_ClientModule.HWS_ClientDataSet_HD01.Insert;
         HWS_ClientModule.HWS_ClientDataSet_HD01HD_CODCLI.AsString   := HWS_PUBLIC_CODCLIENTE;
         HWS_ClientModule.HWS_ClientDataSet_HD01HD_CHIP.AsString     := HWS_Edit_Numero.Text;
         HWS_ClientModule.HWS_ClientDataSet_HD01HD_DESC.AsString     := HWS_Edit_Descricao.Text;
         HWS_ClientModule.HWS_ClientDataSet_HD01HD_STATUS.AsString   := HWS_ComboBox_Status.Items.Names[HWS_ComboBox_Status.ItemIndex];
         HWS_ClientModule.HWS_ClientDataSet_HD01.Post;
         // Inclusao as placas para o novo celular
         HWS_ClientModule.HWS_SqlServerMethod_F_HWS_InserirVeiculosNaInclusaoDoChip.ParamByName('HWS_Chip').AsString := HWS_Edit_Numero.Text;
         HWS_ClientModule.HWS_SqlServerMethod_F_HWS_InserirVeiculosNaInclusaoDoChip.ParamByName('HWS_CodCliente').AsString := HWS_PUBLIC_CODCLIENTE;
         HWS_ClientModule.HWS_SqlServerMethod_F_HWS_InserirVeiculosNaInclusaoDoChip.ExecuteMethod;
         HWS_Retorno := (HWS_ClientModule.HWS_SqlServerMethod_F_HWS_InserirVeiculosNaInclusaoDoChip.ParamByName('Retorno').AsObject) as TJSONArray;
         if HWS_Retorno.Get(0).Value = 'N' then
            MessageDlg(HWS_Retorno.Get(1).Value,mtError,[mbOK],0)
         else begin
            HWS_ClientModule.HWS_ClientDataSet_HD01.ApplyUpdates(-1);
            Close;
         end;
      except on E: Exception do
         MessageDlg(E.ToString,mtError,[mbOK],0);
      end;
   end;
end;

procedure THWS_Form_Celulares_Inclusao.Button2Click(Sender: TObject);
begin
   Close;
end;

end.
