unit uHWSCheckListClientPerguntasXRespostas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.CheckLst,
  Vcl.Buttons, Vcl.ExtCtrls, Data.DBXJSONReflect, Data.DBXJSON, System.Generics.Collections,
  Vcl.Menus;

type
  THWS_Form_PerguntasXRespostas = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    StatusBar1: TStatusBar;
    HWS_ListBox_Perguntas: TListBox;
    HWS_CheckListBox_Respostas: TCheckListBox;
    Panel1: TPanel;
    HWS_BitBtn_Gravar: TBitBtn;
    BitBtn1: TBitBtn;
    GroupBox3: TGroupBox;
    HWS_ComboBox_CheckList: TComboBox;
    Splitter1: TSplitter;
    HWS_PopupMenu_Respostas: TPopupMenu;
    Definirarespostaselecionadaparatodasasperguntas1: TMenuItem;
    Marcararespostaselecionadaparatodasasperguntas1: TMenuItem;
    GroupBox4: TGroupBox;
    HWS_CheckListBox_Foto: TCheckListBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure HWS_CheckListBox_RespostasClickCheck(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure HWS_ListBox_PerguntasClick(Sender: TObject);
    procedure HWS_BitBtn_GravarClick(Sender: TObject);
    procedure HWS_ComboBox_CheckListChange(Sender: TObject);
    procedure Definirarespostaselecionadaparatodasasperguntas1Click(
      Sender: TObject);
    procedure HWS_CheckListBox_FotoClickCheck(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HWS_Form_PerguntasXRespostas: THWS_Form_PerguntasXRespostas;
  //HWS_StringList_Checkados: TStrings;
  //HWS_StringList_CadastroDePergunats: TStrings;
  HWS_Dicionario_TStringList_AD      : TObjectDictionary<Integer,TStringList>;
  HWS_Dicionario_TStringList_AF      : TObjectDictionary<Integer,TStringList>;
  HWS_Dicionario_TStringList_AH      : TObjectDictionary<Integer,TStringList>;
  HWS_Dicionario_TStringList_AH_Foto : TObjectDictionary<Integer,TStringList>;
  HWS_PodeAlterarCheckList      : Boolean;


implementation

uses uHWSCheckListClientDataModule, uHWSJson, uHWSFuncoes;

{$R *.dfm}

procedure THWS_Form_PerguntasXRespostas.BitBtn1Click(Sender: TObject);
begin
   Close;
end;

procedure THWS_Form_PerguntasXRespostas.Definirarespostaselecionadaparatodasasperguntas1Click(
  Sender: TObject);
var X: Integer;
begin
   if (MessageDlg('Tem certeza que deseja marcar a resposta ' + Chr(13) +
                  HWS_CheckListBox_Respostas.Items.ValueFromIndex[HWS_CheckListBox_Respostas.ItemIndex] + Chr(13) +
                  'para todas as perguntas do checklist ' + Chr(13) +
                  HWS_ComboBox_CheckList.Items.ValueFromIndex[HWS_ComboBox_CheckList.ItemIndex] + ' ?',mtConfirmation,[mbYes,mbNO],0) = mrYes) then begin
      // Procura se ja nao existe uma resposta com a pergunta a ser replicada
      for X := 0 to HWS_ListBox_Perguntas.Count-1 do begin
         if HWS_Dicionario_TStringList_AH[HWS_ComboBox_CheckList.ItemIndex].IndexOf(HWS_ListBox_Perguntas.Items.Names[X] + '=' + HWS_CheckListBox_Respostas.Items.Names[HWS_CheckListBox_Respostas.ItemIndex]) = -1 then begin
            // Se nao encontrar entao inclui
            HWS_Dicionario_TStringList_AH[HWS_ComboBox_CheckList.ItemIndex].Add(HWS_ListBox_Perguntas.Items.Names[X] + '=' + HWS_CheckListBox_Respostas.Items.Names[HWS_CheckListBox_Respostas.ItemIndex]);
         end;
      end;
   end;

end;

procedure THWS_Form_PerguntasXRespostas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   HWS_ClientModule.HWS_ClientDataSet_AD01.Close;
   HWS_ClientModule.HWS_ClientDataSet_AF01.Close;
   HWS_ClientModule.HWS_ClientDataSet_AH01.Close;
   HWS_ClientModule.HWS_ClientDataSet_AG01.Close;
   HWS_ClientModule.HWS_ClientDataSet_AI01.Close;
   HWS_ClientModule.HWS_ClientDataSet_AE01.Close;
   HWS_ClientModule.HWS_ClientDataSet_AJ01.Close;
end;

procedure THWS_Form_PerguntasXRespostas.FormCreate(Sender: TObject);
var X: Integer;
    HWS_StringList_AD, HWS_StringList_AF, HWS_StringList_AH, HWS_StringList_AH_FOTO: TStringList;
begin
   HWS_ClientModule.HWS_ClientDataSet_AD01.Open;
   HWS_ClientModule.HWS_ClientDataSet_AF01.Open;
   HWS_ClientModule.HWS_ClientDataSet_AH01.Open;
   HWS_ClientModule.HWS_ClientDataSet_AG01.Open;
   HWS_ClientModule.HWS_ClientDataSet_AI01.Open;
   HWS_ClientModule.HWS_ClientDataSet_AE01.Open;
   HWS_ClientModule.HWS_ClientDataSet_AJ01.Open;
   HWS_Dicionario_TStringList_AD      := TObjectDictionary<Integer,TStringList>.Create;
   HWS_Dicionario_TStringList_AF      := TObjectDictionary<Integer,TStringList>.Create;
   HWS_Dicionario_TStringList_AH      := TObjectDictionary<Integer,TStringList>.Create;
   HWS_Dicionario_TStringList_AH_Foto  := TObjectDictionary<Integer,TStringList>.Create;
   F_HWS_RetornaCheckLists(HWS_ComboBox_CheckList);
   for X := 0 to HWS_ComboBox_CheckList.Items.Count -1 do begin
      ///////////////////////////////////////////////////////////////////////////////////////////
      ///   Montando o Dicionario para guardar os relacionamentos perguntas X respostas    //////
      ///////////////////////////////////////////////////////////////////////////////////////////
      HWS_StringList_AH       := TStringList.Create;
      HWS_StringList_AH_FOTO  := TStringList.Create;
      // Grupo de Perguntas X Tipos de Implementos
      HWS_ClientModule.HWS_ClientDataSet_AH01.Filtered := False;
      HWS_ClientModule.HWS_ClientDataSet_AH01.Filter   := 'AH_CODCHK = ' + QuotedStr(HWS_ComboBox_CheckList.Items.Names[X]);
      HWS_ClientModule.HWS_ClientDataSet_AH01.Filtered := True;
      while not HWS_ClientModule.HWS_ClientDataSet_AH01.Eof do begin
         HWS_StringList_AH.Add(FormatFloat('000000',HWS_ClientModule.HWS_ClientDataSet_AH01AH_CODPER.AsInteger) + '=' + FormatFloat('000000',HWS_ClientModule.HWS_ClientDataSet_AH01AH_CODRES.AsInteger));
         if HWS_ClientModule.HWS_ClientDataSet_AH01AH_FOTO.AsString = 'S' then
            HWS_StringList_AH_FOTO.Add(FormatFloat('000000',HWS_ClientModule.HWS_ClientDataSet_AH01AH_CODPER.AsInteger) + '=' + FormatFloat('000000',HWS_ClientModule.HWS_ClientDataSet_AH01AH_CODRES.AsInteger));
         HWS_ClientModule.HWS_ClientDataSet_AH01.Next;
      end;
      // Criando o dicionario
      HWS_Dicionario_TStringList_AH.Add(X, HWS_StringList_AH);
      HWS_Dicionario_TStringList_AH_Foto.Add(X, HWS_StringList_AH_FOTO);
      ///////////////////////////////////////////////////////////////////////////////////////////
      ///   Montando o Dicionario para guardar o cadastro de perguntas                     //////
      ///////////////////////////////////////////////////////////////////////////////////////////
      HWS_StringList_AD := TStringList.Create;
      HWS_ClientModule.HWS_ClientDataSet_AD01.Filtered := False;
      HWS_ClientModule.HWS_ClientDataSet_AD01.Filter   := 'AD_CODCHK = ' + QuotedStr(HWS_ComboBox_CheckList.Items.Names[X]);
      HWS_ClientModule.HWS_ClientDataSet_AD01.Filtered := True;
      while not HWS_ClientModule.HWS_ClientDataSet_AD01.Eof do begin
         HWS_StringList_AD.Add(FormatFloat('000000',HWS_ClientModule.HWS_ClientDataSet_AD01AD_CODIGO.AsInteger) + '=' + HWS_ClientModule.HWS_ClientDataSet_AD01AD_PERGUNTA.AsString);
         HWS_ClientModule.HWS_ClientDataSet_AD01.Next;
      end;
      // Criando o dicionario
      HWS_Dicionario_TStringList_AD.Add(X, HWS_StringList_AD);
      ///////////////////////////////////////////////////////////////////////////////////////////
      ///   Montando o Dicionario para guardar o cadastro de  respostas                    //////
      ///////////////////////////////////////////////////////////////////////////////////////////
      HWS_StringList_AF := TStringList.Create;
      HWS_ClientModule.HWS_ClientDataSet_AF01.Filtered := False;
      HWS_ClientModule.HWS_ClientDataSet_AF01.Filter   := 'AF_CODCHK = ' + QuotedStr(HWS_ComboBox_CheckList.Items.Names[X]);
      HWS_ClientModule.HWS_ClientDataSet_AF01.Filtered := True;
      while not HWS_ClientModule.HWS_ClientDataSet_AF01.Eof do begin
         HWS_StringList_AF.Add(FormatFloat('000000',HWS_ClientModule.HWS_ClientDataSet_AF01AF_CODIGO.AsInteger) + '=' + HWS_ClientModule.HWS_ClientDataSet_AF01AF_RESPOSTA.AsString);
         HWS_ClientModule.HWS_ClientDataSet_AF01.Next;
      end;
      // Criando o dicionario
      HWS_Dicionario_TStringList_AF.Add(X, HWS_StringList_AF);
   end;
   HWS_ListBox_Perguntas.ItemIndex := 0;
   HWS_ComboBox_CheckListChange(HWS_ComboBox_CheckList);
end;

procedure THWS_Form_PerguntasXRespostas.HWS_BitBtn_GravarClick(Sender: TObject);
var X,Y,W: Integer;
   HWS_PerguntasXRespostas: TPerguntasXRespostas;
   HWS_ListaPerguntasXRespostas: TListaPerguntaXRespostas;
   HWS_Conversor: TJSONMarshal;
   HWS_Retorno: TJSONArray;
   HWS_Reverte : TJSONUnMarshal;
begin
   for Y := 0 to HWS_Dicionario_TStringList_AH.Count - 1 do begin
      HWS_PerguntasXRespostas := TPerguntasXRespostas.Create;
      HWS_PerguntasXRespostas.AH_CODCHK := HWS_ComboBox_CheckList.Items.Names[Y];
      for X := 0 to HWS_Dicionario_TStringList_AH[Y].Count-1 do begin
         HWS_ListaPerguntasXRespostas := TListaPerguntaXRespostas.Create;
         HWS_ListaPerguntasXRespostas.AH_CODCHK := HWS_ComboBox_CheckList.Items.Names[Y];
         HWS_ListaPerguntasXRespostas.AH_CODPER := HWS_Dicionario_TStringList_AH[Y].Names[X];
         HWS_ListaPerguntasXRespostas.AH_CODRES := HWS_Dicionario_TStringList_AH[Y].ValueFromIndex[X];
         if HWS_Dicionario_TStringList_AH_Foto[Y].IndexOf(HWS_Dicionario_TStringList_AH[Y].Strings[X]) <> -1 then
            HWS_ListaPerguntasXRespostas.AH_FOTO := 'S'
         else
            HWS_ListaPerguntasXRespostas.AH_FOTO := 'N';
         HWS_PerguntasXRespostas.ListaPerguntasXRespostas.Add(HWS_ListaPerguntasXRespostas);
     end;
      HWS_Conversor := TJSONMarshal.Create;
      HWS_Reverte := TJSONUnMarshal.Create;
      HWS_ClientModule.HWS_SqlServerMethod_F_HWS_GravaPerguntasXRespostas.ParamByName('HWS_PerXRes').AsObject := HWS_Conversor.Marshal(HWS_PerguntasXRespostas);
      HWS_ClientModule.HWS_SqlServerMethod_F_HWS_GravaPerguntasXRespostas.ExecuteMethod;
      HWS_Retorno := (HWS_ClientModule.HWS_SqlServerMethod_F_HWS_GravaPerguntasXRespostas.ParamByName('Retorno').AsObject as TJSONArray);
      if HWS_Retorno.Get(0).Value = 'N' then
         MessageDlg('Erro: (' + HWS_Retorno.Get(1).Value + ')',mtError,[mbOK],0)
   end;
   Close;
end;

procedure THWS_Form_PerguntasXRespostas.HWS_CheckListBox_FotoClickCheck(Sender: TObject);
var X, HWS_Deleta: Integer;
begin
   if not HWS_PodeAlterarCheckList then begin
      HWS_CheckListBox_Foto.Checked[HWS_CheckListBox_Foto.ItemIndex] := not HWS_CheckListBox_Foto.Checked[HWS_CheckListBox_Foto.ItemIndex];
      MessageDlg('O CheckList selecionado não pode ser alterado pois não está em revisão.',mtError,[mbOK],0);
      Exit;
   end;
   if not HWS_CheckListBox_Respostas.Checked[HWS_CheckListBox_Foto.ItemIndex] then begin
      MessageDlg('Não é possível marcar que esta resposta terá foto pois ela não foi selecionada como resposta da pergunta.',mtError,[mbOK],0);
      HWS_CheckListBox_Foto.Checked[HWS_CheckListBox_Foto.ItemIndex] := False;
      Exit;
   end;
   if HWS_Dicionario_TStringList_AH_Foto.ContainsKey(HWS_ComboBox_CheckList.ItemIndex) then begin
      if HWS_CheckListBox_Foto.Checked[HWS_CheckListBox_Foto.ItemIndex] then begin
         if HWS_Dicionario_TStringList_AH_Foto[HWS_ComboBox_CheckList.ItemIndex].IndexOf(HWS_ListBox_Perguntas.Items.Names[HWS_ListBox_Perguntas.ItemIndex] + '=' + HWS_CheckListBox_Foto.Items.Names[HWS_CheckListBox_Foto.ItemIndex]) = -1 then
            HWS_Dicionario_TStringList_AH_Foto[HWS_ComboBox_CheckList.ItemIndex].Add(HWS_ListBox_Perguntas.Items.Names[HWS_ListBox_Perguntas.ItemIndex] + '=' + HWS_CheckListBox_Foto.Items.Names[HWS_CheckListBox_Foto.ItemIndex]);
      end else begin
         if HWS_Dicionario_TStringList_AH_Foto[HWS_ComboBox_CheckList.ItemIndex].IndexOf(HWS_ListBox_Perguntas.Items.Names[HWS_ListBox_Perguntas.ItemIndex] + '=' + HWS_CheckListBox_Foto.Items.Names[HWS_CheckListBox_Foto.ItemIndex]) <> -1 then
            HWS_Dicionario_TStringList_AH_Foto[HWS_ComboBox_CheckList.ItemIndex].Delete(HWS_Dicionario_TStringList_AH_Foto[HWS_ComboBox_CheckList.ItemIndex].IndexOf(HWS_ListBox_Perguntas.Items.Names[HWS_ListBox_Perguntas.ItemIndex] + '=' + HWS_CheckListBox_Foto.Items.Names[HWS_CheckListBox_Foto.ItemIndex]));
      end;
   end;
end;

procedure THWS_Form_PerguntasXRespostas.HWS_CheckListBox_RespostasClickCheck(Sender: TObject);
var HWS_GrupoPergunta: String;
    X: Integer;
begin
    if not HWS_PodeAlterarCheckList then begin
      HWS_CheckListBox_Respostas.Checked[HWS_CheckListBox_Respostas.ItemIndex] := not HWS_CheckListBox_Respostas.Checked[HWS_CheckListBox_Respostas.ItemIndex];
      MessageDlg('O CheckList selecionado não pode ser alterado pois não está em revisão.',mtError,[mbOK],0);
      Exit;
   end;
   // Verificando se a resposta esta nas peruntas e respostas filhas
   if HWS_ClientModule.HWS_ClientDataSet_AG01.Locate('AG_CODCHK;AG_PERPAI;AG_CODRESPAI',
      VarArrayOf([HWS_ComboBox_CheckList.Items.Names[HWS_ComboBox_CheckList.ItemIndex],
                  HWS_ListBox_Perguntas.Items.Names[HWS_ListBox_Perguntas.ItemIndex],
                  HWS_CheckListBox_Respostas.Items.Names[HWS_CheckListBox_Respostas.ItemIndex]]),[]) then begin
      HWS_CheckListBox_Respostas.Checked[HWS_CheckListBox_Respostas.ItemIndex] := not HWS_CheckListBox_Respostas.Checked[HWS_CheckListBox_Respostas.ItemIndex];
      MessageDlg('Não é possível desmarcar esta resposta pois ela faz parte das perguntas filhas.',mtError,[mbOK],0);
      Exit;
   end;
   // Verificando se a resposta esta nas peruntas e respostas filhas
   if HWS_ClientModule.HWS_ClientDataSet_AG01.Locate('AG_CODCHK;AG_PERFILHA;AG_CODRESPAI',
      VarArrayOf([HWS_ComboBox_CheckList.Items.Names[HWS_ComboBox_CheckList.ItemIndex],
                  HWS_ListBox_Perguntas.Items.Names[HWS_ListBox_Perguntas.ItemIndex],
                  HWS_CheckListBox_Respostas.Items.Names[HWS_CheckListBox_Respostas.ItemIndex]]),[]) then begin
      HWS_CheckListBox_Respostas.Checked[HWS_CheckListBox_Respostas.ItemIndex] := not HWS_CheckListBox_Respostas.Checked[HWS_CheckListBox_Respostas.ItemIndex];
      MessageDlg('Não é possível desmarcar esta resposta pois ela faz parte das perguntas filhas.',mtError,[mbOK],0);
      Exit;
   end;
   // Verificando se a resposta nao faz parte das perguntas de reprovacao
   if HWS_ClientModule.HWS_ClientDataSet_AI01.Locate('AI_CODCHK;AI_CODPER;AI_CODRES',
      VarArrayOf([HWS_ComboBox_CheckList.Items.Names[HWS_ComboBox_CheckList.ItemIndex],
                  HWS_ListBox_Perguntas.Items.Names[HWS_ListBox_Perguntas.ItemIndex],
                  HWS_CheckListBox_Respostas.Items.Names[HWS_CheckListBox_Respostas.ItemIndex]]),[]) then begin
      HWS_CheckListBox_Respostas.Checked[HWS_CheckListBox_Respostas.ItemIndex] := not HWS_CheckListBox_Respostas.Checked[HWS_CheckListBox_Respostas.ItemIndex];
      MessageDlg('Não é possível desmarcar esta resposta pois ela faz parte das perguntas de reprovação.',mtError,[mbOK],0);
      Exit;
   end;
   if HWS_Dicionario_TStringList_AH.ContainsKey(HWS_ComboBox_CheckList.ItemIndex) then begin
      if HWS_CheckListBox_Respostas.Checked[HWS_CheckListBox_Respostas.ItemIndex] then begin
         if HWS_Dicionario_TStringList_AH[HWS_ComboBox_CheckList.ItemIndex].IndexOf(HWS_ListBox_Perguntas.Items.Names[HWS_ListBox_Perguntas.ItemIndex] + '=' + HWS_CheckListBox_Respostas.Items.Names[HWS_CheckListBox_Respostas.ItemIndex]) = -1 then
            HWS_Dicionario_TStringList_AH[HWS_ComboBox_CheckList.ItemIndex].Add(HWS_ListBox_Perguntas.Items.Names[HWS_ListBox_Perguntas.ItemIndex] + '=' + HWS_CheckListBox_Respostas.Items.Names[HWS_CheckListBox_Respostas.ItemIndex]);
      end else begin
         if HWS_Dicionario_TStringList_AH[HWS_ComboBox_CheckList.ItemIndex].IndexOf(HWS_ListBox_Perguntas.Items.Names[HWS_ListBox_Perguntas.ItemIndex] + '=' + HWS_CheckListBox_Respostas.Items.Names[HWS_CheckListBox_Respostas.ItemIndex]) <> -1 then
            HWS_Dicionario_TStringList_AH[HWS_ComboBox_CheckList.ItemIndex].Delete(HWS_Dicionario_TStringList_AH[HWS_ComboBox_CheckList.ItemIndex].IndexOf(HWS_ListBox_Perguntas.Items.Names[HWS_ListBox_Perguntas.ItemIndex] + '=' + HWS_CheckListBox_Respostas.Items.Names[HWS_CheckListBox_Respostas.ItemIndex]));
         if HWS_Dicionario_TStringList_AH_Foto[HWS_ComboBox_CheckList.ItemIndex].IndexOf(HWS_ListBox_Perguntas.Items.Names[HWS_ListBox_Perguntas.ItemIndex] + '=' + HWS_CheckListBox_Foto.Items.Names[HWS_CheckListBox_Respostas.ItemIndex]) <> -1 then begin
            HWS_CheckListBox_Foto.Checked[HWS_CheckListBox_Respostas.ItemIndex] := False;
            HWS_Dicionario_TStringList_AH_Foto[HWS_ComboBox_CheckList.ItemIndex].Delete(HWS_Dicionario_TStringList_AH_Foto[HWS_ComboBox_CheckList.ItemIndex].IndexOf(HWS_ListBox_Perguntas.Items.Names[HWS_ListBox_Perguntas.ItemIndex] + '=' + HWS_CheckListBox_Respostas.Items.Names[HWS_CheckListBox_Respostas.ItemIndex]));
         end;
      end;
   end;
end;

procedure THWS_Form_PerguntasXRespostas.HWS_ComboBox_CheckListChange(
  Sender: TObject);
begin
   // Preenchendo com o cadastro de perguntas
   if HWS_Dicionario_TStringList_AD.ContainsKey(HWS_ComboBox_CheckList.ItemIndex) then begin
      HWS_ListBox_Perguntas.Clear;
      HWS_ListBox_Perguntas.Items := HWS_Dicionario_TStringList_AD[HWS_ComboBox_CheckList.ItemIndex];
   end;
   // Preenchendo com o cadastro respostas
   if HWS_Dicionario_TStringList_AF.ContainsKey(HWS_ComboBox_CheckList.ItemIndex) then begin
      HWS_CheckListBox_Respostas.Clear;
      HWS_CheckListBox_Respostas.Items := HWS_Dicionario_TStringList_AF[HWS_ComboBox_CheckList.ItemIndex];
      HWS_CheckListBox_Foto.Items      := HWS_Dicionario_TStringList_AF[HWS_ComboBox_CheckList.ItemIndex];
   end;
   HWS_ListBox_Perguntas.ItemIndex := 0;
   HWS_ListBox_PerguntasClick(HWS_ListBox_Perguntas);
   HWS_PodeAlterarCheckList := F_HWS_CheckListPodeSerAlerado(HWS_ComboBox_CheckList.Items.Names[HWS_ComboBox_CheckList.ItemIndex]);
   HWS_BitBtn_Gravar.Enabled := HWS_PodeAlterarCheckList;
end;

procedure THWS_Form_PerguntasXRespostas.HWS_ListBox_PerguntasClick(Sender: TObject);
var X: Integer;
begin
   HWS_CheckListBox_Respostas.CheckAll(cbUnchecked,True,True);
   HWS_CheckListBox_Foto.CheckAll(cbUnchecked,True,True);
   // Selecionando as respostas selecionadas para as perguntas.
   if HWS_Dicionario_TStringList_AH.ContainsKey(HWS_ComboBox_CheckList.ItemIndex) then begin
      for X := 0 to HWS_Dicionario_TStringList_AH[HWS_ComboBox_CheckList.ItemIndex].Count-1 do begin
         if HWS_Dicionario_TStringList_AH[HWS_ComboBox_CheckList.ItemIndex].Names[X] = HWS_ListBox_Perguntas.Items.Names[HWS_ListBox_Perguntas.ItemIndex]  then
            HWS_CheckListBox_Respostas.Checked[HWS_CheckListBox_Respostas.Items.IndexOfName(HWS_Dicionario_TStringList_AH[HWS_ComboBox_CheckList.ItemIndex].ValueFromIndex[X])] := True;
      end;
      for X := 0 to HWS_Dicionario_TStringList_AH_Foto[HWS_ComboBox_CheckList.ItemIndex].Count-1 do begin
         if HWS_Dicionario_TStringList_AH_Foto[HWS_ComboBox_CheckList.ItemIndex].Names[X] = HWS_ListBox_Perguntas.Items.Names[HWS_ListBox_Perguntas.ItemIndex]  then
            HWS_CheckListBox_Foto.Checked[HWS_CheckListBox_Foto.Items.IndexOfName(HWS_Dicionario_TStringList_AH_Foto[HWS_ComboBox_CheckList.ItemIndex].ValueFromIndex[X])] := True;
      end;
   end;
end;

end.

