unit uHWSCheckListClientCheckListAlteracao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls;

type
  THWS_Form_CheckList_Alteracao = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    HWS_Edit_Codigo: TEdit;
    HWS_Edit_Descricao: TEdit;
    StatusBar1: TStatusBar;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HWS_Form_CheckList_Alteracao: THWS_Form_CheckList_Alteracao;

implementation

uses uHWSCheckListClientDataModule, uHWSFuncoes;

{$R *.dfm}

procedure THWS_Form_CheckList_Alteracao.BitBtn1Click(Sender: TObject);
begin
   Close;
end;

procedure THWS_Form_CheckList_Alteracao.BitBtn2Click(Sender: TObject);
begin
   if F_HWS_ValidaDadosFormulario(HWS_ClientModule.HWS_ClientDataSet_A901,'A','A9_CODIGO',HWS_Edit_Codigo.Text,HWS_Form_CheckList_Alteracao) then begin
      try
         HWS_ClientModule.HWS_ClientDataSet_A901.Edit;
         HWS_ClientModule.HWS_ClientDataSet_A901A9_DESC.AsString        := HWS_Edit_Codigo.Text;
         HWS_ClientModule.HWS_ClientDataSet_A901A9_DESC.AsString        := HWS_Edit_Descricao.Text;
         HWS_ClientModule.HWS_ClientDataSet_A901.Post;
         HWS_ClientModule.HWS_ClientDataSet_A901.ApplyUpdates(-1);
         Close;
      except on E: Exception do
         MessageDlg(E.ToString,mtError,[mbOK],0);
      end;
   end;
end;

procedure THWS_Form_CheckList_Alteracao.FormCreate(Sender: TObject);
begin
   HWS_Edit_Codigo.Text    := FormatFloat('000000',HWS_ClientModule.HWS_ClientDataSet_A901A9_CODIGO.AsInteger);
   HWS_Edit_Descricao.Text := HWS_ClientModule.HWS_ClientDataSet_A901A9_DESC.AsString;
end;

end.
