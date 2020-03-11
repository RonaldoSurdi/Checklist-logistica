unit uHWSCheckListClientPerguntasReprovacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.Buttons, Vcl.ExtCtrls;

type
  THWS_Form_PerguntasReprovacao = class(TForm)
    GroupBox3: TGroupBox;
    HWS_ComboBox_CheckList: TComboBox;
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    HWS_BitBtn_Incluir: TBitBtn;
    HWS_BitBtn_Excluir: TBitBtn;
    BitBtn4: TBitBtn;
    procedure BitBtn4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure HWS_ComboBox_CheckListChange(Sender: TObject);
    procedure HWS_BitBtn_IncluirClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure HWS_BitBtn_ExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HWS_Form_PerguntasReprovacao: THWS_Form_PerguntasReprovacao;

implementation

uses uHWSCheckListClientDataModule, uHWSFuncoes,
  uHWSCheckListClientPerguntasReprovacaoInclusao;

{$R *.dfm}

procedure THWS_Form_PerguntasReprovacao.HWS_BitBtn_ExcluirClick(
  Sender: TObject);
var HWS_Retorno: String;
begin
   HWS_ClientModule.HWS_SqlServerMethod_F_HWS_PodeExcluirPerguntaReprovacao.ParamByName('HWS_CheckList').AsString := HWS_ComboBox_CheckList.Items.Names[HWS_ComboBox_CheckList.ItemIndex];
   HWS_ClientModule.HWS_SqlServerMethod_F_HWS_PodeExcluirPerguntaReprovacao.ParamByName('HWS_Pergunta').AsString := HWS_ClientModule.HWS_ClientDataSet_AI01AI_CODPER.AsString;
   HWS_ClientModule.HWS_SqlServerMethod_F_HWS_PodeExcluirPerguntaReprovacao.ExecuteMethod;
   HWS_Retorno := HWS_ClientModule.HWS_SqlServerMethod_F_HWS_PodeExcluirPerguntaReprovacao.ParamByName('Retorno').AsString;
   if HWS_Retorno = 'N' then
      MessageDlg('Não é possível excluir a pergunta: ' + Chr(13) + Chr(13) +
                  HWS_ClientModule.HWS_ClientDataSet_AI01AD_PERGUNTA.AsString + Chr(13) + Chr(13) +
                  'pois ela ja está em um CheckList respondido.' ,mtError,[mbOK],0)
   else begin
      if (MessageDlg('Tem certeza que deseja excluir a pergunta ' + Chr(13) + HWS_ClientModule.HWS_ClientDataSet_AI01AD_PERGUNTA.AsString + '?',mtInformation,[mbYes,mbNO],0) = mrYes) then begin
         HWS_ClientModule.HWS_ClientDataSet_AI01.Delete;
         HWS_ClientModule.HWS_ClientDataSet_AI01.ApplyUpdates(-1);
      end;
   end;
end;

procedure THWS_Form_PerguntasReprovacao.HWS_BitBtn_IncluirClick(Sender: TObject);
begin
   Application.CreateForm(THWS_Form_PerguntasReprovacaoInclusao, HWS_Form_PerguntasReprovacaoInclusao);
   HWS_Form_PerguntasReprovacaoInclusao.ShowModal;
end;

procedure THWS_Form_PerguntasReprovacao.BitBtn4Click(Sender: TObject);
begin
   Close;
end;

procedure THWS_Form_PerguntasReprovacao.DBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if (Shift = [ssCtrl]) and (Key = 46) then
      Key := 0;
end;

procedure THWS_Form_PerguntasReprovacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   HWS_ClientModule.HWS_ClientDataSet_AI01.Close;
   HWS_ClientModule.HWS_ClientDataSet_AH01.Close;
   HWS_ClientModule.HWS_ClientDataSet_AD01.Close;
   HWS_ClientModule.HWS_ClientDataSet_AF01.Close;
end;

procedure THWS_Form_PerguntasReprovacao.FormCreate(Sender: TObject);
begin
   HWS_ClientModule.HWS_ClientDataSet_AD01.Open;
   HWS_ClientModule.HWS_ClientDataSet_AF01.Open;
   HWS_ClientModule.HWS_ClientDataSet_AI01.Open;
   HWS_ClientModule.HWS_ClientDataSet_AH01.Open;
   F_HWS_RetornaCheckLists(HWS_ComboBox_CheckList);
   HWS_ComboBox_CheckListChange(HWS_ComboBox_CheckList);
end;

procedure THWS_Form_PerguntasReprovacao.HWS_ComboBox_CheckListChange(
  Sender: TObject);
var HWS_PodeAlterarCheckList: Boolean;
begin
   F_HWS_FiltraTabela(HWS_ComboBox_CheckList,HWS_ClientModule.HWS_ClientDataSet_AI01,'AI_CODCHK');
   HWS_PodeAlterarCheckList := F_HWS_CheckListPodeSerAlerado(HWS_ComboBox_CheckList.Items.Names[HWS_ComboBox_CheckList.ItemIndex]);
   HWS_BitBtn_Incluir.Enabled := HWS_PodeAlterarCheckList;
   HWS_BitBtn_Excluir.Enabled := HWS_PodeAlterarCheckList;
end;

end.
