unit uHWSCheckListClientPerguntasAlteracao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls,
  Vcl.ExtCtrls;

type
  THWS_Form_Perguntas_Alteracao = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    HWS_Edit_Codigo: TEdit;
    HWS_Memo_Pergunta: TMemo;
    StatusBar1: TStatusBar;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    HWS_RadioGroup_Tipo: TRadioGroup;
    HWS_RadioGroup_Status: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HWS_Form_Perguntas_Alteracao: THWS_Form_Perguntas_Alteracao;

implementation

uses uHWSCheckListClientDataModule, uHWSFuncoes, uHWSCheckListClientPerguntas;

{$R *.dfm}

procedure THWS_Form_Perguntas_Alteracao.BitBtn1Click(Sender: TObject);
begin
   Close;
end;

procedure THWS_Form_Perguntas_Alteracao.BitBtn2Click(Sender: TObject);
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
   if F_HWS_ValidaDadosFormulario(HWS_ClientModule.HWS_ClientDataSet_AD01,'A','AD_CODIGO',HWS_Edit_Codigo.Text,HWS_Form_Perguntas_Alteracao) then begin
      try
         HWS_ClientModule.HWS_ClientDataSet_AD01.Edit;
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

procedure THWS_Form_Perguntas_Alteracao.FormCreate(Sender: TObject);
begin
   HWS_Edit_Codigo.Text       := FormatFloat('000000',HWS_ClientModule.HWS_ClientDataSet_AD01AD_CODIGO.AsInteger);
   HWS_Memo_Pergunta.Text     := HWS_ClientModule.HWS_ClientDataSet_AD01AD_PERGUNTA.AsString;
   ////////////////////////////////////////////////////////////////////////////////////////
   if HWS_ClientModule.HWS_ClientDataSet_AD01AD_TIPO.AsString = 'U' then
      HWS_RadioGroup_Tipo.ItemIndex := 0
   else
      HWS_RadioGroup_Tipo.ItemIndex := 1;
   ////////////////////////////////////////////////////////////////////////////////////////
   if HWS_ClientModule.HWS_ClientDataSet_AD01AD_STATUS.AsString = 'A' then
      HWS_RadioGroup_Status.ItemIndex := 0
   else
      HWS_RadioGroup_Status.ItemIndex := 1;
   HWS_Memo_Pergunta.TextHint := 'Digite a Pergunta.';
end;

end.
