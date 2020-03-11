unit uHWSCheckListClientGruposPerguntasXPerguntas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls,
  Vcl.CheckLst, Vcl.ExtCtrls, System.Generics.Collections;

type
  THWS_Form_GrupodePerguntasXPerguntas = class(TForm)
    GroupBox1: TGroupBox;
    StatusBar1: TStatusBar;
    HWS_ListBox_GrupoPerguntas: TListBox;
    Panel1: TPanel;
    HWS_BitBtn_Salvar: TBitBtn;
    BitBtn1: TBitBtn;
    GroupBox2: TGroupBox;
    HWS_CheckListBox_Perguntas: TCheckListBox;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    HWS_ComboBox_CheckList: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure HWS_ListBox_GrupoPerguntasClick(Sender: TObject);
    procedure HWS_CheckListBox_PerguntasClickCheck(Sender: TObject);
    procedure HWS_BitBtn_SalvarClick(Sender: TObject);
    procedure HWS_ComboBox_CheckListChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HWS_Form_GrupodePerguntasXPerguntas: THWS_Form_GrupodePerguntasXPerguntas;
  HWS_Dicionario_TStringList_AB : TObjectDictionary<Integer,TStringList>;
  HWS_Dicionario_TStringList_AD : TObjectDictionary<Integer,TStringList>;
  HWS_Dicionario_TStringList_AE : TObjectDictionary<Integer,TStringList>;
  HWS_PodeAlterarCheckList      : Boolean;


implementation

uses uHWSCheckListClientDataModule, uHWSFuncoes;

{$R *.dfm}

procedure THWS_Form_GrupodePerguntasXPerguntas.BitBtn1Click(Sender: TObject);
begin
   Close;
end;

procedure THWS_Form_GrupodePerguntasXPerguntas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   HWS_ClientModule.HWS_ClientDataSet_AD01.Close;
   HWS_ClientModule.HWS_ClientDataSet_AB01.Close;
   HWS_ClientModule.HWS_ClientDataSet_AE01.Close;
end;

procedure THWS_Form_GrupodePerguntasXPerguntas.FormCreate(Sender: TObject);
var X: Integer;
    HWS_StringList_AB, HWS_StringList_AD, HWS_StringList_AE: TStringList;
begin
   HWS_ClientModule.HWS_ClientDataSet_AB01.Open;
   HWS_ClientModule.HWS_ClientDataSet_AD01.Open;
   HWS_ClientModule.HWS_ClientDataSet_AE01.Open;
   HWS_Dicionario_TStringList_AB := TObjectDictionary<Integer,TStringList>.Create;
   HWS_Dicionario_TStringList_AD := TObjectDictionary<Integer,TStringList>.Create;
   HWS_Dicionario_TStringList_AE := TObjectDictionary<Integer,TStringList>.Create;
   F_HWS_RetornaCheckLists(HWS_ComboBox_CheckList);
   for X := 0 to HWS_ComboBox_CheckList.Items.Count -1 do begin
      ///////////////////////////////////////////////////////////////////////////////////////////
      ///   Montando o Dicionario para guardar os relacionamentos grupos perguntas X perguntas //////
      ///////////////////////////////////////////////////////////////////////////////////////////
      HWS_StringList_AE := TStringList.Create;
      // Grupo de Perguntas X Tipos de Implementos
      HWS_ClientModule.HWS_ClientDataSet_AE01.Filtered := False;
      HWS_ClientModule.HWS_ClientDataSet_AE01.Filter   := 'AE_CODCHK = ' + QuotedStr(HWS_ComboBox_CheckList.Items.Names[X]);
      HWS_ClientModule.HWS_ClientDataSet_AE01.Filtered := True;
      while not HWS_ClientModule.HWS_ClientDataSet_AE01.Eof do begin
         HWS_StringList_AE.Add(FormatFloat('000000',HWS_ClientModule.HWS_ClientDataSet_AE01AE_GRUPO.AsInteger) + '=' + FormatFloat('000000',HWS_ClientModule.HWS_ClientDataSet_AE01AE_CODPER.AsInteger));
         HWS_ClientModule.HWS_ClientDataSet_AE01.Next;
      end;
      // Criando o dicionario
      HWS_Dicionario_TStringList_AE.Add(X, HWS_StringList_AE);
      ///////////////////////////////////////////////////////////////////////////////////////////
      ///   Montando o Dicionario para guardar o cadastro de  grupo de perguntas           //////
      ///////////////////////////////////////////////////////////////////////////////////////////
      HWS_StringList_AB := TStringList.Create;
      HWS_ClientModule.HWS_ClientDataSet_AB01.Filtered := False;
      HWS_ClientModule.HWS_ClientDataSet_AB01.Filter   := 'AB_CODCHK = ' + QuotedStr(HWS_ComboBox_CheckList.Items.Names[X]);
      HWS_ClientModule.HWS_ClientDataSet_AB01.Filtered := True;
      while not HWS_ClientModule.HWS_ClientDataSet_AB01.Eof do begin
         HWS_StringList_AB.Add(FormatFloat('000000',HWS_ClientModule.HWS_ClientDataSet_AB01AB_CODIGO.AsInteger) + '=' + HWS_ClientModule.HWS_ClientDataSet_AB01AB_DESC.AsString);
         HWS_ClientModule.HWS_ClientDataSet_AB01.Next;
      end;
      // Criando o dicionario
      HWS_Dicionario_TStringList_AB.Add(X, HWS_StringList_AB);
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
   end;
   HWS_ListBox_GrupoPerguntas.ItemIndex := 0;
   HWS_ComboBox_CheckListChange(HWS_ComboBox_CheckList);
end;

procedure THWS_Form_GrupodePerguntasXPerguntas.HWS_BitBtn_SalvarClick(
  Sender: TObject);
var X,Y: Integer;
begin
   for Y := 0 to HWS_Dicionario_TStringList_AE.Count-1 do begin
      // Excluindo os registros desmarcados na lista
      HWS_ClientModule.HWS_ClientDataSet_AE01.Filtered := False;
      HWS_ClientModule.HWS_ClientDataSet_AE01.Filter   := 'AE_CODCHK = ' + QuotedStr(HWS_ComboBox_CheckList.Items.Names[Y]);
      HWS_ClientModule.HWS_ClientDataSet_AE01.Filtered := True;
      while not HWS_ClientModule.HWS_ClientDataSet_AE01.Eof do begin
         if HWS_Dicionario_TStringList_AE[Y].IndexOf(FormatFloat('000000',HWS_ClientModule.HWS_ClientDataSet_AC01AC_CODGRUPO.AsInteger) + '=' + FormatFloat('000000',HWS_ClientModule.HWS_ClientDataSet_AC01AC_CODTIPO.AsInteger)) = -1 then
            HWS_ClientModule.HWS_ClientDataSet_AE01.Delete
         else
            HWS_ClientModule.HWS_ClientDataSet_AE01.Next;
      end;
      // Incluindo os marcados na lista
      for X := 0 to HWS_Dicionario_TStringList_AE[Y].Count-1 do begin
         if not HWS_ClientModule.HWS_ClientDataSet_AE01.Locate(
            'AE_CODCHK;AE_GRUPO;AE_CODPER',
            VarArrayOf([HWS_ComboBox_CheckList.Items.Names[Y], HWS_Dicionario_TStringList_AE[Y].Names[X], HWS_Dicionario_TStringList_AE[Y].ValueFromIndex[X]]),[]) then begin
               HWS_ClientModule.HWS_ClientDataSet_AE01.Insert;
               HWS_ClientModule.HWS_ClientDataSet_AE01AE_CODCHK.AsString   := HWS_ComboBox_CheckList.Items.Names[Y];
               HWS_ClientModule.HWS_ClientDataSet_AE01AE_GRUPO.AsString    := HWS_Dicionario_TStringList_AE[Y].Names[X];
               HWS_ClientModule.HWS_ClientDataSet_AE01AE_CODPER.AsString   := HWS_Dicionario_TStringList_AE[Y].ValueFromIndex[X];
               HWS_ClientModule.HWS_ClientDataSet_AE01.Post;
         end;
      end;
      HWS_ClientModule.HWS_ClientDataSet_AE01.ApplyUpdates(-1);
   end;
   Close;
end;

procedure THWS_Form_GrupodePerguntasXPerguntas.HWS_CheckListBox_PerguntasClickCheck(
  Sender: TObject);
begin
   if not HWS_PodeAlterarCheckList then begin
      HWS_CheckListBox_Perguntas.Checked[HWS_CheckListBox_Perguntas.ItemIndex] := not HWS_CheckListBox_Perguntas.Checked[HWS_CheckListBox_Perguntas.ItemIndex];
      MessageDlg('O CheckList selecionado não pode ser alterado pois não está em revisão.',mtError,[mbOK],0);
      Exit;
   end;
   if HWS_Dicionario_TStringList_AE.ContainsKey(HWS_ComboBox_CheckList.ItemIndex) then begin
      if HWS_CheckListBox_Perguntas.Checked[HWS_CheckListBox_Perguntas.ItemIndex] then begin
         if HWS_Dicionario_TStringList_AE[HWS_ComboBox_CheckList.ItemIndex].IndexOf(HWS_ListBox_GrupoPerguntas.Items.Names[HWS_ListBox_GrupoPerguntas.ItemIndex] + '=' + HWS_CheckListBox_Perguntas.Items.Names[HWS_CheckListBox_Perguntas.ItemIndex]) = -1 then
            HWS_Dicionario_TStringList_AE[HWS_ComboBox_CheckList.ItemIndex].Add(HWS_ListBox_GrupoPerguntas.Items.Names[HWS_ListBox_GrupoPerguntas.ItemIndex] + '=' + HWS_CheckListBox_Perguntas.Items.Names[HWS_CheckListBox_Perguntas.ItemIndex]);
      end else begin
         if HWS_Dicionario_TStringList_AE[HWS_ComboBox_CheckList.ItemIndex].IndexOf(HWS_ListBox_GrupoPerguntas.Items.Names[HWS_ListBox_GrupoPerguntas.ItemIndex] + '=' + HWS_CheckListBox_Perguntas.Items.Names[HWS_CheckListBox_Perguntas.ItemIndex]) <> -1 then
            HWS_Dicionario_TStringList_AE[HWS_ComboBox_CheckList.ItemIndex].Delete(HWS_Dicionario_TStringList_AE[HWS_ComboBox_CheckList.ItemIndex].IndexOf(HWS_ListBox_GrupoPerguntas.Items.Names[HWS_ListBox_GrupoPerguntas.ItemIndex] + '=' + HWS_CheckListBox_Perguntas.Items.Names[HWS_CheckListBox_Perguntas.ItemIndex]));
      end;
      HWS_BitBtn_Salvar.Enabled := True;
   end;
end;

procedure THWS_Form_GrupodePerguntasXPerguntas.HWS_ComboBox_CheckListChange(
  Sender: TObject);
begin
   // Preenchendo com o cadastro de grupos de perguntas
   if HWS_Dicionario_TStringList_AB.ContainsKey(HWS_ComboBox_CheckList.ItemIndex) then begin
      HWS_ListBox_GrupoPerguntas.Clear;
      HWS_ListBox_GrupoPerguntas.Items := HWS_Dicionario_TStringList_AB[HWS_ComboBox_CheckList.ItemIndex];
   end;
   // Preenchendo com o cadastro de perguntas
   if HWS_Dicionario_TStringList_AD.ContainsKey(HWS_ComboBox_CheckList.ItemIndex) then begin
      HWS_CheckListBox_Perguntas.Clear;
      HWS_CheckListBox_Perguntas.Items := HWS_Dicionario_TStringList_AD[HWS_ComboBox_CheckList.ItemIndex];
   end;
   HWS_ListBox_GrupoPerguntas.ItemIndex := 0;
   HWS_ListBox_GrupoPerguntasClick(HWS_ListBox_GrupoPerguntas);
   HWS_PodeAlterarCheckList := F_HWS_CheckListPodeSerAlerado(HWS_ComboBox_CheckList.Items.Names[HWS_ComboBox_CheckList.ItemIndex]);
end;

procedure THWS_Form_GrupodePerguntasXPerguntas.HWS_ListBox_GrupoPerguntasClick(
  Sender: TObject);
var X: Integer;
begin
   HWS_CheckListBox_Perguntas.CheckAll(cbUnchecked,True,True);
   // Selecionando os tipos de implementos selecionados para o grupo de perguntas.
   if HWS_Dicionario_TStringList_AE.ContainsKey(HWS_ComboBox_CheckList.ItemIndex) then begin
      for X := 0 to HWS_Dicionario_TStringList_AE[HWS_ComboBox_CheckList.ItemIndex].Count-1 do begin
         if HWS_Dicionario_TStringList_AE[HWS_ComboBox_CheckList.ItemIndex].Names[X] = HWS_ListBox_GrupoPerguntas.Items.Names[HWS_ListBox_GrupoPerguntas.ItemIndex]  then
            HWS_CheckListBox_Perguntas.Checked[HWS_CheckListBox_Perguntas.Items.IndexOfName(HWS_Dicionario_TStringList_AE[HWS_ComboBox_CheckList.ItemIndex].ValueFromIndex[X])] := True;
      end;
   end;
end;

end.
