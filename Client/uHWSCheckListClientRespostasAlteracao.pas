unit uHWSCheckListClientRespostasAlteracao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls;

type
  THWS_Form_RespostasAlteracao = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    HWS_Edit_Codigo: TEdit;
    HWS_Edit_Descricao: TEdit;
    StatusBar1: TStatusBar;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HWS_Form_RespostasAlteracao: THWS_Form_RespostasAlteracao;

implementation

{$R *.dfm}

uses uHWSCheckListClientDataModule, uHWSFuncoes, uHWSCheckListClientRespostas;

procedure THWS_Form_RespostasAlteracao.BitBtn1Click(Sender: TObject);
begin
   Close;
end;

procedure THWS_Form_RespostasAlteracao.BitBtn2Click(Sender: TObject);
begin
   if F_HWS_ValidaDadosFormulario(HWS_ClientModule.HWS_ClientDataSet_AF01,'A','AF_CODIGO',HWS_Edit_Codigo.Text,HWS_Form_RespostasAlteracao) then begin
      try
         HWS_ClientModule.HWS_ClientDataSet_AF01.Edit;
         HWS_ClientModule.HWS_ClientDataSet_AF01AF_CODCHK.AsString      := HWS_Form_Respostas.HWS_ComboBox_CheckList.Items.Names[HWS_Form_Respostas.HWS_ComboBox_CheckList.ItemIndex];
         HWS_ClientModule.HWS_ClientDataSet_AF01AF_CODIGO.AsString      := HWS_Edit_Codigo.Text;
         HWS_ClientModule.HWS_ClientDataSet_AF01AF_RESPOSTA.AsString    := HWS_Edit_Descricao.Text;
         HWS_ClientModule.HWS_ClientDataSet_AF01.Post;
         HWS_ClientModule.HWS_ClientDataSet_AF01.ApplyUpdates(-1);
         Close;
      except on E: Exception do
         MessageDlg(E.ToString,mtError,[mbOK],0);
      end;
   end;
end;

procedure THWS_Form_RespostasAlteracao.FormCreate(Sender: TObject);
begin
   HWS_Edit_Codigo.Text    := FormatFloat('000000',HWS_ClientModule.HWS_ClientDataSet_AF01AF_CODIGO.AsInteger);
   HWS_Edit_Descricao.Text := HWS_ClientModule.HWS_ClientDataSet_AF01AF_RESPOSTA.AsString;
end;

end.
