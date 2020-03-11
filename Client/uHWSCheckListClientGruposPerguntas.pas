unit uHWSCheckListClientGruposPerguntas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls,
  Vcl.Grids, Vcl.DBGrids, Data.DB;

type
  THWS_Form_GruposPerguntas = class(TForm)
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    StatusBar1: TStatusBar;
    BitBtn2: TBitBtn;
    GroupBox2: TGroupBox;
    HWS_ComboBox_CheckList: TComboBox;
    HWS_BitBtn_Excluir: TBitBtn;
    HWS_BitBtn_Incluir: TBitBtn;
    HWS_BitBtn_Alterar: TBitBtn;
    procedure HWS_BitBtn_ExcluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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
  HWS_Form_GruposPerguntas: THWS_Form_GruposPerguntas;

implementation

uses uHWSCheckListClientDataModule, uHWSFuncoes,
  uHWSCheckListClientGruposPerguntasInclusao,
  uHWSCheckListClientGruposPerguntasAlteracao;

{$R *.dfm}

procedure THWS_Form_GruposPerguntas.HWS_BitBtn_ExcluirClick(Sender: TObject);
begin
   if HWS_ClientModule.HWS_ClientDataSet_AC01.Locate('AC_CODGRUPO',HWS_ClientModule.HWS_ClientDataSet_AB01AB_CODIGO.AsInteger,[]) then begin
       MessageDlg('Não é possível excluir o grupo: ' + Chr(13) + Chr(13) +
                  HWS_ClientModule.HWS_ClientDataSet_AB01AB_DESC.AsString + Chr(13) + Chr(13) +
                  'pois ele está associado a um tipo de implemento.' ,mtInformation,[mbOK],0);
       Exit;
   end;
   if (MessageDlg('Tem certeza que deseja excluir o grupo ' + HWS_ClientModule.HWS_ClientDataSet_AB01AB_DESC.AsString + '?',mtInformation,[mbYes,mbNO],0) = mrYes) then begin
      try
         HWS_ClientModule.HWS_ClientDataSet_AB01.Delete;
         HWS_ClientModule.HWS_ClientDataSet_AB01.ApplyUpdates(-1);
      except on E: Exception do
         MessageDlg(E.ToString,mtError,[mbOK],0);
      end;
   end;
end;

procedure THWS_Form_GruposPerguntas.BitBtn2Click(Sender: TObject);
begin
   Close;
end;

procedure THWS_Form_GruposPerguntas.HWS_BitBtn_IncluirClick(Sender: TObject);
begin
   Application.CreateForm(THWS_Form_GrupoPerguntasInclusao, HWS_Form_GrupoPerguntasInclusao);
   HWS_Form_GrupoPerguntasInclusao.ShowModal;
end;

procedure THWS_Form_GruposPerguntas.HWS_BitBtn_AlterarClick(Sender: TObject);
begin
   Application.CreateForm(THWS_Form_GrupoPergumtasAlteracao, HWS_Form_GrupoPergumtasAlteracao);
   HWS_Form_GrupoPergumtasAlteracao.ShowModal;
end;

procedure THWS_Form_GruposPerguntas.DBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if (Shift = [ssCtrl]) and (Key = 46) then
      Key := 0;
end;

procedure THWS_Form_GruposPerguntas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   HWS_ClientModule.HWS_ClientDataSet_AB01.Close;
   HWS_ClientModule.HWS_ClientDataSet_AC01.Close;
end;

procedure THWS_Form_GruposPerguntas.FormCreate(Sender: TObject);
begin
   HWS_ClientModule.HWS_ClientDataSet_AB01.Open;
   HWS_ClientModule.HWS_ClientDataSet_AC01.Open;
   F_HWS_RetornaCheckLists(HWS_ComboBox_CheckList);
   HWS_ComboBox_CheckListChange(HWS_ComboBox_CheckList);
end;

procedure THWS_Form_GruposPerguntas.HWS_ComboBox_CheckListChange(
  Sender: TObject);
var HWS_PodeAlterarCheckList: Boolean;
begin
   F_HWS_FiltraTabela(HWS_ComboBox_CheckList,HWS_ClientModule.HWS_ClientDataSet_AB01,'AB_CODCHK');
   HWS_PodeAlterarCheckList := F_HWS_CheckListPodeSerAlerado(HWS_ComboBox_CheckList.Items.Names[HWS_ComboBox_CheckList.ItemIndex]);
   HWS_BitBtn_Incluir.Enabled := HWS_PodeAlterarCheckList;
   HWS_BitBtn_Alterar.Enabled := HWS_PodeAlterarCheckList;
   HWS_BitBtn_Excluir.Enabled := HWS_PodeAlterarCheckList;
end;

end.
