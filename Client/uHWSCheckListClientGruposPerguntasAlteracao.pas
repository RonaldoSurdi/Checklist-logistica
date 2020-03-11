unit uHWSCheckListClientGruposPerguntasAlteracao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls;

type
  THWS_Form_GrupoPergumtasAlteracao = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    HWS_Edit_Codigo: TEdit;
    HWS_Edit_Descricao: TEdit;
    StatusBar1: TStatusBar;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HWS_Form_GrupoPergumtasAlteracao: THWS_Form_GrupoPergumtasAlteracao;

implementation

{$R *.dfm}

uses uHWSCheckListClientDataModule, uHWSFuncoes, uHWSCheckListClientGruposPerguntas;

procedure THWS_Form_GrupoPergumtasAlteracao.BitBtn1Click(Sender: TObject);
begin
   Close;
end;

procedure THWS_Form_GrupoPergumtasAlteracao.BitBtn2Click(Sender: TObject);
begin
   if F_HWS_ValidaDadosFormulario(HWS_ClientModule.HWS_ClientDataSet_AB01,'A','AB_CODIGO',HWS_Edit_Codigo.Text,HWS_Form_GrupoPergumtasAlteracao) then begin
      try
         HWS_ClientModule.HWS_ClientDataSet_AB01.Edit;
         HWS_ClientModule.HWS_ClientDataSet_AB01AB_CODCHK.AsString      := HWS_Form_GruposPerguntas.HWS_ComboBox_CheckList.Items.Names[HWS_Form_GruposPerguntas.HWS_ComboBox_CheckList.ItemIndex];
         HWS_ClientModule.HWS_ClientDataSet_AB01AB_CODIGO.AsString      := HWS_Edit_Codigo.Text;
         HWS_ClientModule.HWS_ClientDataSet_AB01AB_DESC.AsString        := HWS_Edit_Descricao.Text;
         HWS_ClientModule.HWS_ClientDataSet_AB01.Post;
         HWS_ClientModule.HWS_ClientDataSet_AB01.ApplyUpdates(-1);
         Close;
      except on E: Exception do
         MessageDlg(E.ToString,mtError,[mbOK],0);
      end;
   end;
end;

procedure THWS_Form_GrupoPergumtasAlteracao.FormCreate(Sender: TObject);
begin
   HWS_Edit_Codigo.Text    := FormatFloat('000000',HWS_ClientModule.HWS_ClientDataSet_AB01AB_CODIGO.AsInteger);
   HWS_Edit_Descricao.Text := HWS_ClientModule.HWS_ClientDataSet_AB01AB_DESC.AsString;
end;

end.
