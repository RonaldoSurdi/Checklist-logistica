unit uHWSCheckListClientPerguntasInclusao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons,
  Vcl.ExtCtrls;

type
  THWS_Form_Perguntas_Inclusao = class(TForm)
    GroupBox1: TGroupBox;
    StatusBar1: TStatusBar;
    Label1: TLabel;
    HWS_Edit_Codigo: TEdit;
    Label2: TLabel;
    HWS_Memo_Pergunta: TMemo;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    HWS_RadioGroup_Tipo: TRadioGroup;
    HWS_RadioGroup_Status: TRadioGroup;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HWS_Form_Perguntas_Inclusao: THWS_Form_Perguntas_Inclusao;

implementation

uses uHWSCheckListClientDataModule, uHWSFuncoes, uHWSCheckListClientPerguntas;

{$R *.dfm}

procedure THWS_Form_Perguntas_Inclusao.BitBtn1Click(Sender: TObject);
begin
   Close;
end;

procedure THWS_Form_Perguntas_Inclusao.BitBtn2Click(Sender: TObject);
var HWS_Tipo, HWS_Status: String;
begin
   if HWS_RadioGroup_Tipo.ItemIndex = 0 then
      HWS_Tipo := 'U'
   else
      HWS_Tipo := 'M';
   if HWS_RadioGroup_Status.ItemIndex = 0 then
      HWS_Status := 'A'
   else
      HWS_Status := 'D';
   if F_HWS_ValidaDadosFormulario(HWS_ClientModule.HWS_ClientDataSet_AD01,'I','AD_CODIGO',HWS_Edit_Codigo.Text,HWS_Form_Perguntas_Inclusao) then begin
      try
         HWS_ClientModule.HWS_ClientDataSet_AD01.Insert;
         HWS_ClientModule.HWS_ClientDataSet_AD01AD_CODCHK.AsString      := HWS_Form_Perguntas.HWS_ComboBox_CheckList.Items.Names[HWS_Form_Perguntas.HWS_ComboBox_CheckList.ItemIndex];
         HWS_ClientModule.HWS_ClientDataSet_AD01AD_CODIGO.AsString      := HWS_Edit_Codigo.Text;
         HWS_ClientModule.HWS_ClientDataSet_AD01AD_PERGUNTA.AsString    := HWS_Memo_Pergunta.Text;
         HWS_ClientModule.HWS_ClientDataSet_AD01AD_TIPO.AsString        := HWS_Tipo;
         HWS_ClientModule.HWS_ClientDataSet_AD01AD_STATUS.AsString      := HWS_Status;
         HWS_ClientModule.HWS_ClientDataSet_AD01.Post;
         HWS_ClientModule.HWS_ClientDataSet_AD01.ApplyUpdates(-1);
         Close;
      except on E: Exception do
         MessageDlg(E.ToString,mtError,[mbOK],0);
      end;
   end;
end;

procedure THWS_Form_Perguntas_Inclusao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   HWS_ClientModule.HWS_ClientDataSet_AD01.Refresh;
end;

procedure THWS_Form_Perguntas_Inclusao.FormCreate(Sender: TObject);
begin
   HWS_ClientModule.HWS_SqlServerMethod_F_HWS_ProximoAutoIncBancoCliente.ParamByName('Tabela').AsString  := 'AD01';
   HWS_ClientModule.HWS_SqlServerMethod_F_HWS_ProximoAutoIncBancoCliente.ParamByName('Campo').AsString   := 'AD_CODIGO';
   HWS_ClientModule.HWS_SqlServerMethod_F_HWS_ProximoAutoIncBancoCliente.ParamByName('Formato').AsString := '_000000';
   HWS_ClientModule.HWS_SqlServerMethod_F_HWS_ProximoAutoIncBancoCliente.ExecuteMethod;
   HWS_Edit_Codigo.Text := HWS_ClientModule.HWS_SqlServerMethod_F_HWS_ProximoAutoIncBancoCliente.ParamByName('Retorno').AsString;
   HWS_Memo_Pergunta.TextHint := 'Digite a Pergunta.';
end;

end.
