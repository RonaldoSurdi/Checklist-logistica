unit uHWSCheckListClientAutenticacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Data.DBXJSON, System.IniFiles,  IWSystem;

type
  THWS_Form_Autenticacao = class(TForm)
    GroupBox1: TGroupBox;
    Label2: TLabel;
    HWS_Edit_Usuario: TEdit;
    Label3: TLabel;
    HWS_Edit_Senha: TEdit;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    Image1: TImage;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
   HWS_Form_Autenticacao: THWS_Form_Autenticacao;
   HWS_PUBLIC_CODCLIENTE: string;


implementation

uses uHWSCheckListClientMenu, uHWSCheckListClientDataModule, uHWSFuncoes;

{$R *.dfm}

procedure THWS_Form_Autenticacao.BitBtn1Click(Sender: TObject);
var HWS_RetornoHWS,HWS_RetornoCliente: TJSONArray;
    HWS_CodCli: String;
begin
   // Conecta o sistema com o banco de dados do cliente
   HWS_CodCli  := '999999';
   HWS_RetornoHWS := TJSONArray.Create;
   HWS_RetornoCliente := TJSONArray.Create;
   try
      //Verifica o status do cliente no cadastro
      HWS_ClientModule.HWS_SqlServerMethod_F_HWS_RetornaStatusDoCliente.ParamByName('HWS_CodCliente').AsString := HWS_CodCli;
      HWS_ClientModule.HWS_SqlServerMethod_F_HWS_RetornaStatusDoCliente.ExecuteMethod;
      HWS_RetornoHWS := (HWS_ClientModule.HWS_SqlServerMethod_F_HWS_RetornaStatusDoCliente.ParamByName('Retorno').AsObject as TJSONArray);
      if HWS_RetornoHWS.Get(0).Value = 'S' then begin
         HWS_PUBLIC_CODCLIENTE := HWS_CodCli;
         // Verifica usuario e senha
         if HWS_ClientModule.HWS_ClientDataSet_HG01.Locate('HG_CODEMP;HG_USER',
            VarArrayOf([HWS_PUBLIC_CODCLIENTE, HWS_Edit_Usuario.Text]),[]) then begin
            if HWS_ClientModule.HWS_ClientDataSet_HG01HG_SENHA.AsString = F_HWS_Criptografa_MD5(HWS_Edit_Senha.Text) then begin
               Application.CreateForm(THWS_Form_Menu, HWS_Form_Menu);
               HWS_Form_Menu.Caption := HWS_Form_Menu.Caption + ' - ' + HWS_PUBLIC_CODCLIENTE;
               HWS_Form_Menu.StatusBar1.Panels[0].Text := HWS_PUBLIC_CODCLIENTE;
               HWS_Form_Menu.ShowModal;
               HWS_Form_Autenticacao.Close;
            end else begin
               MessageDlg('Usuário não cadastrado no sistema.',mtError,[mbOK],0);
            end;
         end else begin
            MessageDlg('Usuário não cadastrado no sistema.',mtError,[mbOK],0);
            HWS_Edit_Usuario.SelectAll;
            HWS_Edit_Usuario.SetFocus;
         end;
      end else begin
         ShowMessage(HWS_RetornoHWS.Get(1).Value);
      end;
   except on E: Exception do
      ShowMessage(E.ToString);
   end;
end;

procedure THWS_Form_Autenticacao.BitBtn2Click(Sender: TObject);
begin
   Close;
end;

procedure THWS_Form_Autenticacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   HWS_ClientModule.HWS_ClientDataSet_HG01.Close;
end;

procedure THWS_Form_Autenticacao.FormCreate(Sender: TObject);
begin
   HWS_ClientModule.HWS_ClientDataSet_HG01.Open;
end;

end.
