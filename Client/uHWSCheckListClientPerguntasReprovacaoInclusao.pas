unit uHWSCheckListClientPerguntasReprovacaoInclusao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons;

type
  THWS_Form_PerguntasReprovacaoInclusao = class(TForm)
    GroupBox1: TGroupBox;
    HWS_Edit_CodigoPergunta: TEdit;
    Button1: TButton;
    HWS_Edit_Descricao: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    HWS_ComboBox_Resposta: TComboBox;
    StatusBar1: TStatusBar;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HWS_Form_PerguntasReprovacaoInclusao: THWS_Form_PerguntasReprovacaoInclusao;

implementation

uses uHWSFuncoes, uHWSCheckListClientDataModule,
  uHWSCheckListClientPerguntasReprovacao;

{$R *.dfm}

procedure THWS_Form_PerguntasReprovacaoInclusao.BitBtn1Click(Sender: TObject);
begin
   if F_HWS_ValidaDadosFormulario(HWS_ClientModule.HWS_ClientDataSet_AI01,'I','AI_CODCHK;AI_CODPER;AI_CODRES',
      VarArrayOf([
      HWS_Form_PerguntasReprovacao.HWS_ComboBox_CheckList.Items.Names[HWS_Form_PerguntasReprovacao.HWS_ComboBox_CheckList.ItemIndex],
      HWS_Edit_CodigoPergunta.Text,
      HWS_ComboBox_Resposta.Items.Names[HWS_ComboBox_Resposta.ItemIndex]
      ]),HWS_Form_PerguntasReprovacaoInclusao) then begin
      // Veirifica o tipo da pergunta, caso se unica escolha nao deixa cadastrar mais de uma reposta de reprovaçao
      if HWS_ClientModule.HWS_ClientDataSet_AD01.Locate('AD_CODCHK;AD_CODIGO',
         VarArrayOf([HWS_Form_PerguntasReprovacao.HWS_ComboBox_CheckList.Items.Names[HWS_Form_PerguntasReprovacao.HWS_ComboBox_CheckList.ItemIndex],
                     HWS_Edit_CodigoPergunta.Text]),[]) then begin
         if HWS_ClientModule.HWS_ClientDataSet_AD01AD_TIPO.AsString = 'U' then begin
            if HWS_ClientModule.HWS_ClientDataSet_AI01.Locate('AI_CODCHK;AI_CODPER',
               VarArrayOf([HWS_Form_PerguntasReprovacao.HWS_ComboBox_CheckList.Items.Names[HWS_Form_PerguntasReprovacao.HWS_ComboBox_CheckList.ItemIndex],
                           HWS_Edit_CodigoPergunta.Text]),[]) then begin
               MessageDlg('A pergunta informada é do tipo única escolha, portanto não é possível incluir mais que uma resposta de reprovação.' ,mtError,[mbOK],0);
               Exit;
            end;
         end;
      end;
      try
         HWS_ClientModule.HWS_ClientDataSet_AI01.Insert;
         HWS_ClientModule.HWS_ClientDataSet_AI01AI_CODCHK.AsString      := HWS_Form_PerguntasReprovacao.HWS_ComboBox_CheckList.Items.Names[HWS_Form_PerguntasReprovacao.HWS_ComboBox_CheckList.ItemIndex];
         HWS_ClientModule.HWS_ClientDataSet_AI01AI_CODPER.AsString      := HWS_Edit_CodigoPergunta.Text;
         HWS_ClientModule.HWS_ClientDataSet_AI01AI_CODRES.AsString      := HWS_ComboBox_Resposta.Items.Names[HWS_ComboBox_Resposta.ItemIndex];
         HWS_ClientModule.HWS_ClientDataSet_AI01.Post;
         HWS_ClientModule.HWS_ClientDataSet_AI01.ApplyUpdates(-1);
         Close;
      except on E: Exception do
         MessageDlg(E.ToString,mtError,[mbOK],0);
      end;
   end;

end;

procedure THWS_Form_PerguntasReprovacaoInclusao.BitBtn2Click(Sender: TObject);
begin
   Close;
end;

procedure THWS_Form_PerguntasReprovacaoInclusao.Button1Click(Sender: TObject);
var HWS_Nome_Indices, HWS_Campos_Indices,HWS_Campos_Para_DBGrid, HWS_Campos_Retorno : TStringList;
begin

   HWS_Nome_Indices        := TStringList.Create;
   HWS_Campos_Indices      := TStringList.Create;
   HWS_Campos_Para_DBGrid  := TStringList.Create;
   HWS_Campos_Retorno      := TStringList.Create;

   HWS_Nome_Indices.Add('Descrição');

   HWS_Campos_Indices.Add('AD_PERGUNTA');

   HWS_Campos_Para_DBGrid.Add('AD_CODIGO');
   HWS_Campos_Para_DBGrid.Add('AD_PERGUNTA');

   HWS_Campos_Retorno.Add('AD_CODIGO');
   HWS_Campos_Retorno.Add('AD_PERGUNTA');

   HWS_ClientModule.HWS_ClientDataSet_AD01.Filtered   := False;
   HWS_ClientModule.HWS_ClientDataSet_AD01.Filter     := 'AD_CODCHK = ' + QuotedStr(HWS_Form_PerguntasReprovacao.HWS_ComboBox_CheckList.Items.Names[HWS_Form_PerguntasReprovacao.HWS_ComboBox_CheckList.ItemIndex]);
   HWS_ClientModule.HWS_ClientDataSet_AD01.Filtered   := True;

   HWS_Campos_Retorno := F_HWS_ConsultaGenerica(HWS_ClientModule.HWS_DataSource_AD01,HWS_Nome_Indices,HWS_Campos_Indices,HWS_Campos_Para_DBGrid,HWS_Campos_Retorno);

   if HWS_Campos_Retorno.Count > 1 then begin
      HWS_Edit_CodigoPergunta.Text  := FormatFloat('000000',StrToIntDef(HWS_Campos_Retorno.Strings[0],0));
      HWS_Edit_Descricao.Text       := HWS_Campos_Retorno.Strings[1];
      ////////////////////////////////////////////////////////////////////
      HWS_ClientModule.HWS_ClientDataSet_AH01.Filtered   := False;
      HWS_ClientModule.HWS_ClientDataSet_AH01.Filter     := 'AH_CODCHK = ' + QuotedStr(HWS_Form_PerguntasReprovacao.HWS_ComboBox_CheckList.Items.Names[HWS_Form_PerguntasReprovacao.HWS_ComboBox_CheckList.ItemIndex]) + ' and AH_CODPER = ' + QuotedStr(HWS_Edit_CodigoPergunta.Text);
      HWS_ClientModule.HWS_ClientDataSet_AH01.Filtered   := True;
      HWS_ComboBox_Resposta.Clear;
      While not HWS_ClientModule.HWS_ClientDataSet_AH01.Eof do begin
         if HWS_ClientModule.HWS_ClientDataSet_AF01.Locate('AF_CODCHK;AF_CODIGO',
                                                           VarArrayOf([HWS_ClientModule.HWS_ClientDataSet_AH01AH_CODCHK.AsInteger,HWS_ClientModule.HWS_ClientDataSet_AH01AH_CODRES.AsInteger]),[]) then begin
            HWS_ComboBox_Resposta.Items.Add(FormatFloat('000000',HWS_ClientModule.HWS_ClientDataSet_AF01AF_CODIGO.AsInteger) + '=' + HWS_ClientModule.HWS_ClientDataSet_AF01AF_RESPOSTA.AsString);
         end;
         HWS_ClientModule.HWS_ClientDataSet_AH01.Next;
      end;
      if HWS_ComboBox_Resposta.Items.Count > 0 then
         HWS_ComboBox_Resposta.ItemIndex := 0;
   end;
end;

end.
