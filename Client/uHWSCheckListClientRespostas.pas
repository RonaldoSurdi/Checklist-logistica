unit uHWSCheckListClientRespostas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls,
  Vcl.Grids, Vcl.DBGrids, Data.DB;

type
  THWS_Form_Respostas = class(TForm)
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    StatusBar1: TStatusBar;
    HWS_BitBtn_Excluir: TBitBtn;
    BitBtn2: TBitBtn;
    GroupBox2: TGroupBox;
    HWS_ComboBox_CheckList: TComboBox;
    HWS_BitBtn_Incluir: TBitBtn;
    HWS_BitBtn_Alterar: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure HWS_BitBtn_ExcluirClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure HWS_ComboBox_CheckListChange(Sender: TObject);
    procedure HWS_BitBtn_IncluirClick(Sender: TObject);
    procedure HWS_BitBtn_AlterarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HWS_Form_Respostas: THWS_Form_Respostas;

implementation

uses uHWSCheckListClientDataModule, uHWSFuncoes,
  uHWSCheckListClientRespostasInclusao, uHWSCheckListClientRespostasAlteracao;

{$R *.dfm}

procedure THWS_Form_Respostas.HWS_BitBtn_ExcluirClick(Sender: TObject);
begin
   if HWS_ClientModule.HWS_ClientDataSet_AH01.Locate('AH_CODPER',HWS_ClientModule.HWS_ClientDataSet_AF01AF_CODIGO.AsInteger,[]) then begin
       MessageDlg('Não é possível excluir a resposta: ' + Chr(13) + Chr(13) +
                  HWS_ClientModule.HWS_ClientDataSet_AF01AF_RESPOSTA.AsString + Chr(13) + Chr(13) +
                  'pois ela está associada a uma pergunta.' ,mtInformation,[mbOK],0);
       Exit;
   end;
   // Buscando o grupo da pergunta
   // Verificando se a resposta nao faz parte das perguntas de restricao
   if HWS_ClientModule.HWS_ClientDataSet_AJ01.Locate('AJ_CODCHK;AJ_CODRES',
         VarArrayOf([HWS_ComboBox_CheckList.Items.Names[HWS_ComboBox_CheckList.ItemIndex],
                     HWS_ClientModule.HWS_ClientDataSet_AF01AF_CODIGO.AsInteger]),[]) then begin
      MessageDlg('Não é possível excluir esta resposta pois ela faz parte das perguntas de restrição.',mtError,[mbOK],0);
      Exit;
   end;
   if (MessageDlg('Tem certeza que deseja excluir a resposta ' + HWS_ClientModule.HWS_ClientDataSet_AF01AF_RESPOSTA.AsString + '?',mtInformation,[mbYes,mbNO],0) = mrYes) then begin
      try
         HWS_ClientModule.HWS_ClientDataSet_AF01.Delete;
         HWS_ClientModule.HWS_ClientDataSet_AF01.ApplyUpdates(-1);
      except on E: Exception do
         MessageDlg(E.ToString,mtError,[mbOK],0);
      end;
   end;
end;

procedure THWS_Form_Respostas.BitBtn2Click(Sender: TObject);
begin
   Close;
end;

procedure THWS_Form_Respostas.HWS_BitBtn_IncluirClick(Sender: TObject);
begin
   Application.CreateForm(THWS_Form_RespostasInclusao, HWS_Form_RespostasInclusao);
   HWS_Form_RespostasInclusao.ShowModal;
end;

procedure THWS_Form_Respostas.HWS_BitBtn_AlterarClick(Sender: TObject);
begin
   Application.CreateForm(THWS_Form_RespostasAlteracao, HWS_Form_RespostasAlteracao);
   HWS_Form_RespostasAlteracao.ShowModal;
end;

procedure THWS_Form_Respostas.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (Shift = [ssCtrl]) and (Key = 46) then
      Key := 0;
end;

procedure THWS_Form_Respostas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   HWS_ClientModule.HWS_ClientDataSet_AF01.Close;
   HWS_ClientModule.HWS_ClientDataSet_AH01.Close;
   HWS_ClientModule.HWS_ClientDataSet_AJ01.Close;
end;

procedure THWS_Form_Respostas.FormCreate(Sender: TObject);
begin
   HWS_ClientModule.HWS_ClientDataSet_AF01.Open;
   HWS_ClientModule.HWS_ClientDataSet_AH01.Open;
   HWS_ClientModule.HWS_ClientDataSet_AJ01.Open;
   F_HWS_RetornaCheckLists(HWS_ComboBox_CheckList);
   HWS_ComboBox_CheckListChange(HWS_ComboBox_CheckList);
end;

procedure THWS_Form_Respostas.HWS_ComboBox_CheckListChange(Sender: TObject);
var HWS_PodeAlterarCheckList: Boolean;
begin
   F_HWS_FiltraTabela(HWS_ComboBox_CheckList,HWS_ClientModule.HWS_ClientDataSet_AF01,'AF_CODCHK');
   HWS_PodeAlterarCheckList := F_HWS_CheckListPodeSerAlerado(HWS_ComboBox_CheckList.Items.Names[HWS_ComboBox_CheckList.ItemIndex]);
   HWS_BitBtn_Incluir.Enabled := HWS_PodeAlterarCheckList;
   HWS_BitBtn_Alterar.Enabled := HWS_PodeAlterarCheckList;
   HWS_BitBtn_Excluir.Enabled := HWS_PodeAlterarCheckList;
end;

end.
