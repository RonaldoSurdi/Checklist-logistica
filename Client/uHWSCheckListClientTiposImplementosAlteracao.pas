unit uHWSCheckListClientTiposImplementosAlteracao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls;

type
  THWS_Form_TiposImplementos_Alteracao = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    HWS_Edit_Codigo: TEdit;
    HWS_Edit_Descricao: TEdit;
    StatusBar1: TStatusBar;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    Label3: TLabel;
    HWS_Edit_CodigoERP: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HWS_Form_TiposImplementos_Alteracao: THWS_Form_TiposImplementos_Alteracao;

implementation

uses uHWSCheckListClientDataModule, uHWSFuncoes, uHWSCheckListClientTiposImplementos;

{$R *.dfm}

procedure THWS_Form_TiposImplementos_Alteracao.BitBtn1Click(Sender: TObject);
begin
   Close;
end;

procedure THWS_Form_TiposImplementos_Alteracao.BitBtn2Click(Sender: TObject);
begin
   if F_HWS_ValidaDadosFormulario(HWS_ClientModule.HWS_ClientDataSet_AA01,'A','AA_CODIGO',HWS_Edit_Codigo.Text,HWS_Form_TiposImplementos_Alteracao) then begin
      try
         HWS_ClientModule.HWS_ClientDataSet_AA01.Edit;
         HWS_ClientModule.HWS_ClientDataSet_AA01AA_CODCHK.AsString      := HWS_Form_TiposImplementos.HWS_ComboBox_CheckList.Items.Names[HWS_Form_TiposImplementos.HWS_ComboBox_CheckList.ItemIndex];
         HWS_ClientModule.HWS_ClientDataSet_AA01AA_CODIGO.AsString      := HWS_Edit_Codigo.Text;
         HWS_ClientModule.HWS_ClientDataSet_AA01AA_DESC.AsString        := HWS_Edit_Descricao.Text;
         HWS_ClientModule.HWS_ClientDataSet_AA01AA_CODERP.AsString      := HWS_Edit_CodigoERP.Text;
         HWS_ClientModule.HWS_ClientDataSet_AA01.Post;
         HWS_ClientModule.HWS_ClientDataSet_AA01.ApplyUpdates(-1);
         Close;
      except on E: Exception do
         MessageDlg(E.ToString,mtError,[mbOK],0);
      end;
   end;
end;

procedure THWS_Form_TiposImplementos_Alteracao.FormCreate(Sender: TObject);
begin
   HWS_Edit_Codigo.Text    := FormatFloat('000000',HWS_ClientModule.HWS_ClientDataSet_AA01AA_CODIGO.AsInteger);
   HWS_Edit_Descricao.Text := HWS_ClientModule.HWS_ClientDataSet_AA01AA_DESC.AsString;
   HWS_Edit_CodigoERP.Text := FormatFloat('000000',HWS_ClientModule.HWS_ClientDataSet_AA01AA_CODERP.AsInteger);
end;

end.
