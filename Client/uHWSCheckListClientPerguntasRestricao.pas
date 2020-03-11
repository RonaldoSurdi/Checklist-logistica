unit uHWSCheckListClientPerguntasRestricao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.ComCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  THWS_Form_PerguntasRestricao = class(TForm)
    GroupBox3: TGroupBox;
    HWS_ComboBox_CheckList: TComboBox;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    HWS_BitBtn_Incluir: TBitBtn;
    HWS_BitBtn_Excluir: TBitBtn;
    BitBtn4: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure HWS_ComboBox_CheckListChange(Sender: TObject);
    procedure HWS_BitBtn_IncluirClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure HWS_BitBtn_ExcluirClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HWS_Form_PerguntasRestricao: THWS_Form_PerguntasRestricao;

implementation

uses uHWSFuncoes, uHWSCheckListClientDataModule,
  uHWSCheckListClientPerguntasRestricaoInclusao;

{$R *.dfm}

procedure THWS_Form_PerguntasRestricao.HWS_BitBtn_ExcluirClick(Sender: TObject);
var HWS_Retorno: String;
begin
   HWS_ClientModule.HWS_SqlServerMethod_F_HWS_PodeExcluirRestricao.ParamByName('HWS_CheckList').AsString       := HWS_ComboBox_CheckList.Items.Names[HWS_ComboBox_CheckList.ItemIndex];
   HWS_ClientModule.HWS_SqlServerMethod_F_HWS_PodeExcluirRestricao.ParamByName('HWS_GrupoPergunta').AsString   := HWS_ClientModule.HWS_ClientDataSet_AJ01AJ_CODGRP.AsString;
   HWS_ClientModule.HWS_SqlServerMethod_F_HWS_PodeExcluirRestricao.ExecuteMethod;
   HWS_Retorno := HWS_ClientModule.HWS_SqlServerMethod_F_HWS_PodeExcluirRestricao.ParamByName('Retorno').AsString;
   if HWS_Retorno = 'N' then
      MessageDlg('Não é possível excluir a restrição pois ela ja está em um CheckList respondido.' ,mtError,[mbOK],0)
   else begin
      if (MessageDlg('Tem certeza que deseja excluir a restrição selecionada?',mtInformation,[mbYes,mbNO],0) = mrYes) then begin
         HWS_ClientModule.HWS_ClientDataSet_AJ01.Delete;
         HWS_ClientModule.HWS_ClientDataSet_AJ01.ApplyUpdates(-1);
      end;
   end;
end;

procedure THWS_Form_PerguntasRestricao.HWS_BitBtn_IncluirClick(Sender: TObject);
begin
   Application.CreateForm(THWS_Form_RestricaoInclusao, HWS_Form_RestricaoInclusao);
   HWS_Form_RestricaoInclusao.ShowModal;
end;

procedure THWS_Form_PerguntasRestricao.BitBtn4Click(Sender: TObject);
begin
   Close;
end;

procedure THWS_Form_PerguntasRestricao.DBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if (Shift = [ssCtrl]) and (Key = 46) then
      Key := 0;
end;

procedure THWS_Form_PerguntasRestricao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   HWS_ClientModule.HWS_ClientDataSet_AB01.Close;
   HWS_ClientModule.HWS_ClientDataSet_AF01.Close;
   HWS_ClientModule.HWS_ClientDataSet_AJ01.Close;
   HWS_ClientModule.HWS_ClientDataSet_AE01.Close;
   HWS_ClientModule.HWS_ClientDataSet_AH01.Close;
end;

procedure THWS_Form_PerguntasRestricao.FormCreate(Sender: TObject);
begin
   HWS_ClientModule.HWS_ClientDataSet_AB01.Open;
   HWS_ClientModule.HWS_ClientDataSet_AF01.Open;
   HWS_ClientModule.HWS_ClientDataSet_AJ01.Open;
   HWS_ClientModule.HWS_ClientDataSet_AE01.Open;
   HWS_ClientModule.HWS_ClientDataSet_AH01.Open;
   F_HWS_RetornaCheckLists(HWS_ComboBox_CheckList);
   HWS_ComboBox_CheckListChange(HWS_ComboBox_CheckList);
end;

procedure THWS_Form_PerguntasRestricao.HWS_ComboBox_CheckListChange(
  Sender: TObject);
var HWS_PodeAlterarCheckList: Boolean;
begin
   F_HWS_FiltraTabela(HWS_ComboBox_CheckList,HWS_ClientModule.HWS_ClientDataSet_AJ01,'AJ_CODCHK');
   HWS_PodeAlterarCheckList   := F_HWS_CheckListPodeSerAlerado(HWS_ComboBox_CheckList.Items.Names[HWS_ComboBox_CheckList.ItemIndex]);
   HWS_BitBtn_Incluir.Enabled := HWS_PodeAlterarCheckList;
   HWS_BitBtn_Excluir.Enabled := HWS_PodeAlterarCheckList;
end;

end.
