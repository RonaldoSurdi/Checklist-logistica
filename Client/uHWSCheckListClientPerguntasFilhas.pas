unit uHWSCheckListClientPerguntasFilhas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons,
  Vcl.CheckLst, Vcl.Grids, Vcl.DBGrids, Data.DBXJSON;

type
  THWS_Form_PerguntasFilhas = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    StatusBar1: TStatusBar;
    BitBtn1: TBitBtn;
    GroupBox3: TGroupBox;
    HWS_ComboBox_CheckList: TComboBox;
    HWS_ListBox_PerguntasPai: TListBox;
    HWS_ListBox_PerguntasFilhas: TListBox;
    HWS_BitBtn_Incluir: TBitBtn;
    HWS_BitBtn_Excluir: TBitBtn;
    GroupBox4: TGroupBox;
    HWS_ListBox_RespostasPai: TListBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure HWS_ComboBox_CheckListChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure HWS_ListBox_PerguntasPaiClick(Sender: TObject);
    procedure HWS_BitBtn_IncluirClick(Sender: TObject);
    procedure HWS_ListBox_RespostasPaiClick(Sender: TObject);
    procedure HWS_BitBtn_ExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HWS_Form_PerguntasFilhas: THWS_Form_PerguntasFilhas;
  HWS_StringList_Checkados: TStrings;

implementation

uses uHWSCheckListClientDataModule, uHWSFuncoes,
  uHWSCheckListClientPerguntasFilhasInclusao;

{$R *.dfm}

procedure THWS_Form_PerguntasFilhas.BitBtn1Click(Sender: TObject);
begin
   Close;
end;

procedure THWS_Form_PerguntasFilhas.HWS_BitBtn_ExcluirClick(Sender: TObject);
var HWS_Retorno: TJSONArray;
begin
   HWS_ClientModule.HWS_SqlServerMethod_F_HWS_PodeExcluirPerguntaFilha.ParamByName('HWS_CheckList').AsString := HWS_ComboBox_CheckList.Items.Names[HWS_ComboBox_CheckList.ItemIndex];
   HWS_ClientModule.HWS_SqlServerMethod_F_HWS_PodeExcluirPerguntaFilha.ParamByName('HWS_Pergunta').AsString  := HWS_ListBox_PerguntasFilhas.Items.Names[HWS_ListBox_PerguntasFilhas.ItemIndex];
   HWS_ClientModule.HWS_SqlServerMethod_F_HWS_PodeExcluirPerguntaFilha.ExecuteMethod;
   if HWS_ClientModule.HWS_SqlServerMethod_F_HWS_PodeExcluirPerguntaFilha.ParamByName('Retorno').AsString = 'N' then begin
      MessageDlg('Não é possível excluir a pergunta filha ' + Chr(13) +
                 HWS_ListBox_PerguntasFilhas.Items.ValueFromIndex[HWS_ListBox_PerguntasFilhas.ItemIndex] + Chr(13) +
                 'pois ela já existe em um Checklist respondido.',mtError,[mbOK],0);
   end else begin
      if (MessageDlg('Tem certeza que deseja excluir a pergunta filha: ' + Chr(13) + Chr(13) + HWS_ListBox_PerguntasFilhas.Items.ValueFromIndex[HWS_ListBox_PerguntasFilhas.ItemIndex] + '?',mtInformation,[mbYes,mbNO],0) = mrYes) then begin
         HWS_ClientModule.HWS_SqlServerMethod_F_HWS_ExcluirPerguntaFilha.ParamByName('HWS_CheckList').AsString    := HWS_ComboBox_CheckList.Items.Names[HWS_ComboBox_CheckList.ItemIndex];
         HWS_ClientModule.HWS_SqlServerMethod_F_HWS_ExcluirPerguntaFilha.ParamByName('HWS_PerguntaPai').AsString  := HWS_ListBox_PerguntasPai.Items.Names[HWS_ListBox_PerguntasPai.ItemIndex];
         HWS_ClientModule.HWS_SqlServerMethod_F_HWS_ExcluirPerguntaFilha.ParamByName('HWS_PerguntaFilha').AsString  := HWS_ListBox_PerguntasFilhas.Items.Names[HWS_ListBox_PerguntasFilhas.ItemIndex];
         HWS_ClientModule.HWS_SqlServerMethod_F_HWS_ExcluirPerguntaFilha.ExecuteMethod;
         HWS_Retorno := (HWS_ClientModule.HWS_SqlServerMethod_F_HWS_ExcluirPerguntaFilha.ParamByName('Retorno').AsObject as TJSONArray);
         if HWS_Retorno.Get(0).Value = 'N' then
            MessageDlg('Erro: (' + HWS_Retorno.Get(1).Value + ')',mtError,[mbOK],0)
         else begin
            HWS_ClientModule.HWS_ClientDataSet_AG01.Refresh;
            //HWS_ListBox_PerguntasPaiClick(HWS_ListBox_PerguntasPai);
            HWS_ComboBox_CheckListChange(HWS_ComboBox_CheckList);
         end;
      end;
   end;
end;

procedure THWS_Form_PerguntasFilhas.HWS_BitBtn_IncluirClick(Sender: TObject);
begin
   Application.CreateForm(THWS_Form_PerguntasFilhasInclusao, HWS_Form_PerguntasFilhasInclusao);
   HWS_Form_PerguntasFilhasInclusao.ShowModal;
end;

procedure THWS_Form_PerguntasFilhas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   HWS_ClientModule.HWS_ClientDataSet_AD01.Close;
   HWS_ClientModule.HWS_ClientDataSet_AG01.Close;
   HWS_ClientModule.HWS_ClientDataSet_AH01.Close;
   HWS_ClientModule.HWS_ClientDataSet_AF01.Close;
   HWS_ClientModule.HWS_ClientDataSet_AE01.Close;
end;

procedure THWS_Form_PerguntasFilhas.FormCreate(Sender: TObject);
begin
   HWS_ClientModule.HWS_ClientDataSet_AD01.Open;
   HWS_ClientModule.HWS_ClientDataSet_AG01.Open;
   HWS_ClientModule.HWS_ClientDataSet_AH01.Open;
   HWS_ClientModule.HWS_ClientDataSet_AF01.Open;
   HWS_ClientModule.HWS_ClientDataSet_AE01.Open;
   F_HWS_RetornaCheckLists(HWS_ComboBox_CheckList);
   HWS_ComboBox_CheckListChange(HWS_ComboBox_CheckList);
end;

procedure THWS_Form_PerguntasFilhas.HWS_ComboBox_CheckListChange(
  Sender: TObject);
var HWS_PodeAlterarCheckList: Boolean;
begin
   F_HWS_FiltraTabela(HWS_ComboBox_CheckList,HWS_ClientModule.HWS_ClientDataSet_AD01,'AD_CODCHK');
   HWS_PodeAlterarCheckList := F_HWS_CheckListPodeSerAlerado(HWS_ComboBox_CheckList.Items.Names[HWS_ComboBox_CheckList.ItemIndex]);
   HWS_BitBtn_Incluir.Enabled := HWS_PodeAlterarCheckList;
   HWS_BitBtn_Excluir.Enabled := HWS_PodeAlterarCheckList;


   HWS_ListBox_PerguntasPai.Clear;
   While not HWS_ClientModule.HWS_ClientDataSet_AD01.Eof do begin
      HWS_ListBox_PerguntasPai.Items.Add(FormatFloat('000000',HWS_ClientModule.HWS_ClientDataSet_AD01AD_CODIGO.AsInteger) + '=' + HWS_ClientModule.HWS_ClientDataSet_AD01AD_PERGUNTA.AsString);
      HWS_ClientModule.HWS_ClientDataSet_AD01.Next;
   end;
   if HWS_ListBox_PerguntasPai.Count > 0 then begin
      HWS_ListBox_PerguntasPai.ItemIndex := 0;
      HWS_ListBox_PerguntasPaiClick(HWS_ListBox_PerguntasPai);
   end;
end;

procedure THWS_Form_PerguntasFilhas.HWS_ListBox_PerguntasPaiClick(
  Sender: TObject);
begin
   // Pegando as respostas da pergunta pai
   HWS_ClientModule.HWS_ClientDataSet_AH01.Filtered := False;
   HWS_ClientModule.HWS_ClientDataSet_AH01.Filter   := 'AH_CODCHK = ' + QuotedStr(HWS_ComboBox_CheckList.Items.Names[HWS_ComboBox_CheckList.ItemIndex]) + ' and AH_CODPER = ' + QuotedStr(HWS_ListBox_PerguntasPai.Items.Names[HWS_ListBox_PerguntasPai.ItemIndex]);
   HWS_ClientModule.HWS_ClientDataSet_AH01.Filtered := True;
   HWS_ListBox_RespostasPai.Clear;
   while not HWS_ClientModule.HWS_ClientDataSet_AH01.Eof do begin
      if HWS_ClientModule.HWS_ClientDataSet_AF01.Locate('AF_CODCHK;AF_CODIGO',
         VarArrayOf([HWS_ClientModule.HWS_ClientDataSet_AH01AH_CODCHK.AsInteger,
                     HWS_ClientModule.HWS_ClientDataSet_AH01AH_CODRES.AsInteger]),[]) then begin
         HWS_ListBox_RespostasPai.Items.Add(FormatFloat('000000',HWS_ClientModule.HWS_ClientDataSet_AF01AF_CODIGO.AsInteger) + '=' + HWS_ClientModule.HWS_ClientDataSet_AF01AF_RESPOSTA.AsString);
      end;
      HWS_ClientModule.HWS_ClientDataSet_AH01.Next;
   end;
   if HWS_ListBox_RespostasPai.Count > 0 then begin
      HWS_ListBox_RespostasPai.ItemIndex := 0;
      HWS_ListBox_RespostasPaiClick(HWS_ListBox_RespostasPai);
   end;
end;

procedure THWS_Form_PerguntasFilhas.HWS_ListBox_RespostasPaiClick(
  Sender: TObject);
begin
   //Selecioando as perguntas filhas da pergunta pai e da resposta pai já cadastradas
   HWS_ClientModule.HWS_ClientDataSet_AG01.Filtered   := False;
   HWS_ClientModule.HWS_ClientDataSet_AG01.Filter     := 'AG_CODCHK = ' + QuotedStr(HWS_ComboBox_CheckList.Items.Names[HWS_ComboBox_CheckList.ItemIndex]) + ' and AG_PERPAI = ' + QuotedStr(HWS_ListBox_PerguntasPai.Items.Names[HWS_ListBox_PerguntasPai.ItemIndex]) + ' and AG_CODRESPAI = ' + QuotedStr(HWS_ListBox_RespostasPai.Items.Names[HWS_ListBox_RespostasPai.ItemIndex]);
   HWS_ClientModule.HWS_ClientDataSet_AG01.Filtered   := True;
   HWS_ListBox_PerguntasFilhas.Clear;
   While not HWS_ClientModule.HWS_ClientDataSet_AG01.Eof do begin
      HWS_ListBox_PerguntasFilhas.Items.Add(FormatFloat('000000',HWS_ClientModule.HWS_ClientDataSet_AG01AG_PERFILHA.AsInteger) + '=' + HWS_ClientModule.HWS_ClientDataSet_AG01AD_PERGUNTA.AsString);
      HWS_ClientModule.HWS_ClientDataSet_AG01.Next;
   end;
   if HWS_ListBox_PerguntasFilhas.Count > 0 then
      HWS_ListBox_PerguntasFilhas.ItemIndex := 0;
end;

end.
