unit uHWSCheckListClientPerguntas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.Buttons, Vcl.ExtCtrls;

type
  THWS_Form_Perguntas = class(TForm)
    GroupBox1: TGroupBox;
    StatusBar1: TStatusBar;
    HWS_DBGrid_Perguntas: TDBGrid;
    Panel1: TPanel;
    HWS_BitBtn_Incluir: TBitBtn;
    HWS_BitBtn_Alterar: TBitBtn;
    HWS_BitBtn_Excluir: TBitBtn;
    BitBtn3: TBitBtn;
    GroupBox2: TGroupBox;
    HWS_ComboBox_CheckList: TComboBox;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn3Click(Sender: TObject);
    procedure HWS_DBGrid_PerguntasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure HWS_BitBtn_IncluirClick(Sender: TObject);
    procedure HWS_BitBtn_AlterarClick(Sender: TObject);
    procedure HWS_BitBtn_ExcluirClick(Sender: TObject);
    procedure HWS_ComboBox_CheckListChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HWS_Form_Perguntas: THWS_Form_Perguntas;

implementation

uses uHWSCheckListClientDataModule, uHWSCheckListClientPerguntasInclusao,
  uHWSCheckListClientPerguntasAlteracao, uHWSFuncoes;

{$R *.dfm}

procedure THWS_Form_Perguntas.HWS_BitBtn_AlterarClick(Sender: TObject);
begin
   Application.CreateForm(THWS_Form_Perguntas_Alteracao, HWS_Form_Perguntas_Alteracao);
   HWS_Form_Perguntas_Alteracao.ShowModal;
end;

procedure THWS_Form_Perguntas.HWS_BitBtn_ExcluirClick(Sender: TObject);
begin
   HWS_ClientModule.HWS_ClientDataSet_AE01.Open;
   if HWS_ClientModule.HWS_ClientDataSet_AE01.Locate('AE_CODPER',HWS_ClientModule.HWS_ClientDataSet_AD01AD_CODIGO.AsInteger,[]) then begin
      MessageDlg('Não é possível excluir a pergunta: ' + Chr(13) + Chr(13) +
                  HWS_ClientModule.HWS_ClientDataSet_AD01AD_PERGUNTA.AsString + Chr(13) + Chr(13) +
                  'pois ela está associada a um grupo de perguntas.' ,mtInformation,[mbOK],0);
      Exit;
   end;
   if HWS_ClientModule.HWS_ClientDataSet_AG01.Locate('AG_CODCHK;AG_PERFILHA',
      VarArrayOf([HWS_ComboBox_CheckList.Items.Names[HWS_ComboBox_CheckList.ItemIndex],
                  HWS_ClientModule.HWS_ClientDataSet_AD01AD_CODIGO.AsInteger]),[])  then begin
         MessageDlg('Não é possível excluir a pergunta: ' + Chr(13) + Chr(13) +
                  HWS_ClientModule.HWS_ClientDataSet_AD01AD_PERGUNTA.AsString + Chr(13) + Chr(13) +
                  'pois ela está configurada como uma pergunta filha.' ,mtInformation,[mbOK],0);
         Exit;
   end;
   if HWS_ClientModule.HWS_ClientDataSet_AG01.Locate('AG_CODCHK;AG_PERPAI',
      VarArrayOf([HWS_ComboBox_CheckList.Items.Names[HWS_ComboBox_CheckList.ItemIndex],
                  HWS_ClientModule.HWS_ClientDataSet_AD01AD_CODIGO.AsInteger]),[])  then begin
         MessageDlg('Não é possível excluir a pergunta: ' + Chr(13) + Chr(13) +
                  HWS_ClientModule.HWS_ClientDataSet_AD01AD_PERGUNTA.AsString + Chr(13) + Chr(13) +
                  'pois ela está configurada como uma pergunta pai.' ,mtInformation,[mbOK],0);
         Exit;
   end;
   if HWS_ClientModule.HWS_ClientDataSet_AI01.Locate('AI_CODCHK;AI_CODPER',
      VarArrayOf([HWS_ComboBox_CheckList.Items.Names[HWS_ComboBox_CheckList.ItemIndex],
                  HWS_ClientModule.HWS_ClientDataSet_AD01AD_CODIGO.AsInteger]),[])  then begin
         MessageDlg('Não é possível excluir a pergunta: ' + Chr(13) + Chr(13) +
                  HWS_ClientModule.HWS_ClientDataSet_AD01AD_PERGUNTA.AsString + Chr(13) + Chr(13) +
                  'pois ela está configurada como uma pergunta de reprovação.' ,mtInformation,[mbOK],0);
         Exit;
   end;
   if (MessageDlg('Tem certeza que deseja excluir a pergunta ' + Chr(13) + HWS_ClientModule.HWS_ClientDataSet_AD01AD_PERGUNTA.AsString + '?',mtInformation,[mbYes,mbNO],0) = mrYes) then begin
      try
         HWS_ClientModule.HWS_ClientDataSet_AD01.Delete;
         HWS_ClientModule.HWS_ClientDataSet_AD01.ApplyUpdates(-1);
      except on E: Exception do
         MessageDlg(E.ToString,mtError,[mbOK],0);
      end;
   end;
   HWS_ClientModule.HWS_ClientDataSet_AE01.Close;
end;

procedure THWS_Form_Perguntas.BitBtn3Click(Sender: TObject);
begin
   Close;
end;

procedure THWS_Form_Perguntas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   HWS_ClientModule.HWS_ClientDataSet_AD01.Close;
   HWS_ClientModule.HWS_ClientDataSet_AG01.Close;
   HWS_ClientModule.HWS_ClientDataSet_AI01.Close;
end;

procedure THWS_Form_Perguntas.FormCreate(Sender: TObject);
begin
   HWS_ClientModule.HWS_ClientDataSet_AD01.Open;
   HWS_ClientModule.HWS_ClientDataSet_AG01.Open;
   HWS_ClientModule.HWS_ClientDataSet_AI01.Open;
   F_HWS_RetornaCheckLists(HWS_ComboBox_CheckList);
   HWS_ComboBox_CheckListChange(HWS_ComboBox_CheckList);
end;

procedure THWS_Form_Perguntas.HWS_BitBtn_IncluirClick(Sender: TObject);
begin
   Application.CreateForm(THWS_Form_Perguntas_Inclusao, HWS_Form_Perguntas_Inclusao);
   HWS_Form_Perguntas_Inclusao.ShowModal;
end;

procedure THWS_Form_Perguntas.HWS_ComboBox_CheckListChange(Sender: TObject);
var HWS_PodeAlterarCheckList: Boolean;
begin
   F_HWS_FiltraTabela(HWS_ComboBox_CheckList,HWS_ClientModule.HWS_ClientDataSet_AD01,'AD_CODCHK');
   HWS_PodeAlterarCheckList := F_HWS_CheckListPodeSerAlerado(HWS_ComboBox_CheckList.Items.Names[HWS_ComboBox_CheckList.ItemIndex]);
   HWS_BitBtn_Incluir.Enabled := HWS_PodeAlterarCheckList;
   HWS_BitBtn_Alterar.Enabled := HWS_PodeAlterarCheckList;
   HWS_BitBtn_Excluir.Enabled := HWS_PodeAlterarCheckList;

end;

procedure THWS_Form_Perguntas.HWS_DBGrid_PerguntasKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if (Shift = [ssCtrl]) and (Key = 46) then
      Key := 0;
end;

end.
