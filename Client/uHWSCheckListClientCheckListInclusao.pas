unit uHWSCheckListClientCheckListInclusao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls,
  Vcl.ExtCtrls;

type
  THWS_Form_CheckList_Inclusao = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    HWS_Edit_Codigo: TEdit;
    StatusBar1: TStatusBar;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    Label2: TLabel;
    HWS_Edit_Descricao: TEdit;
    Label3: TLabel;
    HWS_ComboBox_App: TComboBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HWS_Form_CheckList_Inclusao: THWS_Form_CheckList_Inclusao;

implementation

uses uHWSCheckListClientDataModule, uHWSFuncoes;

{$R *.dfm}

procedure THWS_Form_CheckList_Inclusao.BitBtn1Click(Sender: TObject);
begin
   Close;
end;

procedure THWS_Form_CheckList_Inclusao.BitBtn2Click(Sender: TObject);
begin
   if HWS_ClientModule.HWS_ClientDataSet_A901.Locate('A9_APP',HWS_ComboBox_App.Items.Names[HWS_ComboBox_App.ItemIndex],[]) then begin
      MessageDlg('Não é possível incluir um CheckList com a APP selecionada pois já existe um CheckList com essa APP.',mtError,[mbOK],0);
      Exit;
   end;
   if F_HWS_ValidaDadosFormulario(HWS_ClientModule.HWS_ClientDataSet_A901,'I','A9_CODIGO',HWS_Edit_Codigo.Text,HWS_Form_CheckList_Inclusao) then begin
      try
         HWS_ClientModule.HWS_ClientDataSet_A901.Insert;
         HWS_ClientModule.HWS_ClientDataSet_A901A9_CODIGO.AsString      := HWS_Edit_Codigo.Text;
         HWS_ClientModule.HWS_ClientDataSet_A901A9_DESC.AsString        := HWS_Edit_Descricao.Text;
         HWS_ClientModule.HWS_ClientDataSet_A901A9_STATUS.AsString      := '0';
         HWS_ClientModule.HWS_ClientDataSet_A901A9_APP.AsString         := HWS_ComboBox_App.Items.Names[HWS_ComboBox_App.ItemIndex];
         HWS_ClientModule.HWS_ClientDataSet_A901.Post;
         HWS_ClientModule.HWS_ClientDataSet_A901.ApplyUpdates(-1);
         Close;
      except on E: Exception do
         MessageDlg(E.ToString,mtError,[mbOK],0);
      end;
   end;
end;

procedure THWS_Form_CheckList_Inclusao.FormCreate(Sender: TObject);
begin
   HWS_ClientModule.HWS_SqlServerMethod_F_HWS_ProximoAutoIncBancoCliente.ParamByName('Tabela').AsString  := 'A901';
   HWS_ClientModule.HWS_SqlServerMethod_F_HWS_ProximoAutoIncBancoCliente.ParamByName('Campo').AsString   := 'A9_CODIGO';
   HWS_ClientModule.HWS_SqlServerMethod_F_HWS_ProximoAutoIncBancoCliente.ParamByName('Formato').AsString := '_000000';
   HWS_ClientModule.HWS_SqlServerMethod_F_HWS_ProximoAutoIncBancoCliente.ExecuteMethod;
   HWS_Edit_Codigo.Text := HWS_ClientModule.HWS_SqlServerMethod_F_HWS_ProximoAutoIncBancoCliente.ParamByName('Retorno').AsString;
end;

end.
