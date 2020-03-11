unit uHWSCheckListClientGruposPerguntasXTiposImplementos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.CheckLst, Vcl.Buttons, System.Generics.Collections;

type
  THWS_Form_GrupoPerguntasXTiposImplementos = class(TForm)
    GroupBox1: TGroupBox;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    GroupBox2: TGroupBox;
    HWS_ListBox_GrupoPerguntas: TListBox;
    HWS_CheckListBox_TiposImplementos: TCheckListBox;
    HWS_BitBtn_Salvar: TBitBtn;
    BitBtn1: TBitBtn;
    GroupBox3: TGroupBox;
    HWS_ComboBox_CheckList: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure HWS_ListBox_GrupoPerguntasClick(Sender: TObject);
    procedure HWS_CheckListBox_TiposImplementosClickCheck(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure HWS_BitBtn_SalvarClick(Sender: TObject);
    procedure HWS_ComboBox_CheckListChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HWS_Form_GrupoPerguntasXTiposImplementos: THWS_Form_GrupoPerguntasXTiposImplementos;
  //HWS_StringList_Checkados: TStrings;
  HWS_Dicionario_TStringList_AA : TObjectDictionary<Integer,TStringList>;
  HWS_Dicionario_TStringList_AB : TObjectDictionary<Integer,TStringList>;
  HWS_Dicionario_TStringList_AC : TObjectDictionary<Integer,TStringList>;
  HWS_PodeAlterarCheckList      : Boolean;

implementation

uses uHWSCheckListClientDataModule, uHWSFuncoes;

{$R *.dfm}

procedure THWS_Form_GrupoPerguntasXTiposImplementos.BitBtn1Click(
  Sender: TObject);
begin
   Close;
end;

procedure THWS_Form_GrupoPerguntasXTiposImplementos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   HWS_ClientModule.HWS_ClientDataSet_AA01.Close;
   HWS_ClientModule.HWS_ClientDataSet_AB01.Close;
   HWS_ClientModule.HWS_ClientDataSet_AC01.Close;
end;

procedure THWS_Form_GrupoPerguntasXTiposImplementos.FormCreate(Sender: TObject);
var X: Integer;
    HWS_StringList_AA, HWS_StringList_AB, HWS_StringList_AC: TStringList;
begin
   HWS_ClientModule.HWS_ClientDataSet_AA01.Open;
   HWS_ClientModule.HWS_ClientDataSet_AB01.Open;
   HWS_ClientModule.HWS_ClientDataSet_AC01.Open;
   HWS_Dicionario_TStringList_AA := TObjectDictionary<Integer,TStringList>.Create;
   HWS_Dicionario_TStringList_AB := TObjectDictionary<Integer,TStringList>.Create;
   HWS_Dicionario_TStringList_AC := TObjectDictionary<Integer,TStringList>.Create;
   F_HWS_RetornaCheckLists(HWS_ComboBox_CheckList);
   for X := 0 to HWS_ComboBox_CheckList.Items.Count -1 do begin
      ///////////////////////////////////////////////////////////////////////////////////////////
      ///   Montando o Dicionario para guardar os relacionamentos grupos perguntas X tipos //////
      ///////////////////////////////////////////////////////////////////////////////////////////
      HWS_StringList_AC := TStringList.Create;
      // Grupo de Perguntas X Tipos de Implementos
      HWS_ClientModule.HWS_ClientDataSet_AC01.Filtered := False;
      HWS_ClientModule.HWS_ClientDataSet_AC01.Filter   := 'AC_CODCHK = ' + QuotedStr(HWS_ComboBox_CheckList.Items.Names[X]);
      HWS_ClientModule.HWS_ClientDataSet_AC01.Filtered := True;
      while not HWS_ClientModule.HWS_ClientDataSet_AC01.Eof do begin
         HWS_StringList_AC.Add(FormatFloat('000000',HWS_ClientModule.HWS_ClientDataSet_AC01AC_CODGRUPO.AsInteger) + '=' + FormatFloat('000000',HWS_ClientModule.HWS_ClientDataSet_AC01AC_CODTIPO.AsInteger));
         HWS_ClientModule.HWS_ClientDataSet_AC01.Next;
      end;
      // Criando o dicionario
      HWS_Dicionario_TStringList_AC.Add(X, HWS_StringList_AC);
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
      ///   Montando o Dicionario para guardar o cadastro de  tipos de Implementos         //////
      ///////////////////////////////////////////////////////////////////////////////////////////
      HWS_StringList_AA := TStringList.Create;
      HWS_ClientModule.HWS_ClientDataSet_AA01.Filtered := False;
      HWS_ClientModule.HWS_ClientDataSet_AA01.Filter   := 'AA_CODCHK = ' + QuotedStr(HWS_ComboBox_CheckList.Items.Names[X]);
      HWS_ClientModule.HWS_ClientDataSet_AA01.Filtered := True;
      while not HWS_ClientModule.HWS_ClientDataSet_AA01.Eof do begin
         HWS_StringList_AA.Add(FormatFloat('000000',HWS_ClientModule.HWS_ClientDataSet_AA01AA_CODIGO.AsInteger) + '=' + HWS_ClientModule.HWS_ClientDataSet_AA01AA_DESC.AsString);
         HWS_ClientModule.HWS_ClientDataSet_AA01.Next;
      end;
      // Criando o dicionario
      HWS_Dicionario_TStringList_AA.Add(X, HWS_StringList_AA);
   end;
   HWS_ListBox_GrupoPerguntas.ItemIndex := 0;
   HWS_ComboBox_CheckListChange(HWS_ComboBox_CheckList);
end;

procedure THWS_Form_GrupoPerguntasXTiposImplementos.HWS_BitBtn_SalvarClick(Sender: TObject);
var X,Y: Integer;
begin
   for Y := 0 to HWS_Dicionario_TStringList_AC.Count-1 do begin
      // Excluindo os registros desmarcados na lista
      HWS_ClientModule.HWS_ClientDataSet_AC01.Filtered := False;
      HWS_ClientModule.HWS_ClientDataSet_AC01.Filter   := 'AC_CODCHK = ' + QuotedStr(HWS_ComboBox_CheckList.Items.Names[Y]);
      HWS_ClientModule.HWS_ClientDataSet_AC01.Filtered := True;
      while not HWS_ClientModule.HWS_ClientDataSet_AC01.Eof do begin
         if HWS_Dicionario_TStringList_AC[Y].IndexOf(FormatFloat('000000',HWS_ClientModule.HWS_ClientDataSet_AC01AC_CODGRUPO.AsInteger) + '=' + FormatFloat('000000',HWS_ClientModule.HWS_ClientDataSet_AC01AC_CODTIPO.AsInteger)) = -1 then
            HWS_ClientModule.HWS_ClientDataSet_AC01.Delete
         else
            HWS_ClientModule.HWS_ClientDataSet_AC01.Next;
      end;
      // Incluindo os marcados na lista
      for X := 0 to HWS_Dicionario_TStringList_AC[Y].Count-1 do begin
         if not HWS_ClientModule.HWS_ClientDataSet_AC01.Locate(
            'AC_CODCHK;AC_CODGRUPO;AC_CODTIPO',
            VarArrayOf([HWS_ComboBox_CheckList.Items.Names[Y], HWS_Dicionario_TStringList_AC[Y].Names[X], HWS_Dicionario_TStringList_AC[Y].ValueFromIndex[X]]),[]) then begin
               HWS_ClientModule.HWS_ClientDataSet_AC01.Insert;
               HWS_ClientModule.HWS_ClientDataSet_AC01AC_CODCHK.AsString   := HWS_ComboBox_CheckList.Items.Names[Y];
               HWS_ClientModule.HWS_ClientDataSet_AC01AC_CODGRUPO.AsString := HWS_Dicionario_TStringList_AC[Y].Names[X];
               HWS_ClientModule.HWS_ClientDataSet_AC01AC_CODTIPO.AsString  := HWS_Dicionario_TStringList_AC[Y].ValueFromIndex[X];
               HWS_ClientModule.HWS_ClientDataSet_AC01.Post;
         end;
      end;
      HWS_ClientModule.HWS_ClientDataSet_AC01.ApplyUpdates(-1);
   end;
   Close;
end;

procedure THWS_Form_GrupoPerguntasXTiposImplementos.HWS_ListBox_GrupoPerguntasClick(Sender: TObject);
var X: Integer;
begin
   HWS_CheckListBox_TiposImplementos.CheckAll(cbUnchecked,True,True);
   // Selecionando os tipos de implementos selecionados para o grupo de perguntas.
   if HWS_Dicionario_TStringList_AC.ContainsKey(HWS_ComboBox_CheckList.ItemIndex) then begin
      for X := 0 to HWS_Dicionario_TStringList_AC[HWS_ComboBox_CheckList.ItemIndex].Count-1 do begin
         if HWS_Dicionario_TStringList_AC[HWS_ComboBox_CheckList.ItemIndex].Names[X] = HWS_ListBox_GrupoPerguntas.Items.Names[HWS_ListBox_GrupoPerguntas.ItemIndex]  then
            HWS_CheckListBox_TiposImplementos.Checked[HWS_CheckListBox_TiposImplementos.Items.IndexOfName(HWS_Dicionario_TStringList_AC[HWS_ComboBox_CheckList.ItemIndex].ValueFromIndex[X])] := True;
      end;
   end;
end;

procedure THWS_Form_GrupoPerguntasXTiposImplementos.HWS_CheckListBox_TiposImplementosClickCheck(Sender: TObject);
begin
   if not HWS_PodeAlterarCheckList then begin
      HWS_CheckListBox_TiposImplementos.Checked[HWS_CheckListBox_TiposImplementos.ItemIndex] := not HWS_CheckListBox_TiposImplementos.Checked[HWS_CheckListBox_TiposImplementos.ItemIndex];
      MessageDlg('O CheckList selecionado não pode ser alterado pois não está em revisão',mtError,[mbOK],0);
      Exit;
   end;
   if HWS_Dicionario_TStringList_AC.ContainsKey(HWS_ComboBox_CheckList.ItemIndex) then begin
      if HWS_CheckListBox_TiposImplementos.Checked[HWS_CheckListBox_TiposImplementos.ItemIndex] then begin
         if HWS_Dicionario_TStringList_AC[HWS_ComboBox_CheckList.ItemIndex].IndexOf(HWS_ListBox_GrupoPerguntas.Items.Names[HWS_ListBox_GrupoPerguntas.ItemIndex] + '=' + HWS_CheckListBox_TiposImplementos.Items.Names[HWS_CheckListBox_TiposImplementos.ItemIndex]) = -1 then
            HWS_Dicionario_TStringList_AC[HWS_ComboBox_CheckList.ItemIndex].Add(HWS_ListBox_GrupoPerguntas.Items.Names[HWS_ListBox_GrupoPerguntas.ItemIndex] + '=' + HWS_CheckListBox_TiposImplementos.Items.Names[HWS_CheckListBox_TiposImplementos.ItemIndex]);
      end else begin
         if HWS_Dicionario_TStringList_AC[HWS_ComboBox_CheckList.ItemIndex].IndexOf(HWS_ListBox_GrupoPerguntas.Items.Names[HWS_ListBox_GrupoPerguntas.ItemIndex] + '=' + HWS_CheckListBox_TiposImplementos.Items.Names[HWS_CheckListBox_TiposImplementos.ItemIndex]) <> -1 then
            HWS_Dicionario_TStringList_AC[HWS_ComboBox_CheckList.ItemIndex].Delete(HWS_Dicionario_TStringList_AC[HWS_ComboBox_CheckList.ItemIndex].IndexOf(HWS_ListBox_GrupoPerguntas.Items.Names[HWS_ListBox_GrupoPerguntas.ItemIndex] + '=' + HWS_CheckListBox_TiposImplementos.Items.Names[HWS_CheckListBox_TiposImplementos.ItemIndex]));
      end;
      HWS_BitBtn_Salvar.Enabled := True;
   end;
end;

procedure THWS_Form_GrupoPerguntasXTiposImplementos.HWS_ComboBox_CheckListChange(
  Sender: TObject);
begin
   // Preenchendo com o cadastro de grupos de perguntas
   if HWS_Dicionario_TStringList_AB.ContainsKey(HWS_ComboBox_CheckList.ItemIndex) then begin
      HWS_ListBox_GrupoPerguntas.Clear;
      HWS_ListBox_GrupoPerguntas.Items := HWS_Dicionario_TStringList_AB[HWS_ComboBox_CheckList.ItemIndex];
   end;
   // Preenchendo com o cadastro de tipos de implementoos
   if HWS_Dicionario_TStringList_AA.ContainsKey(HWS_ComboBox_CheckList.ItemIndex) then begin
      HWS_CheckListBox_TiposImplementos.Clear;
      HWS_CheckListBox_TiposImplementos.Items := HWS_Dicionario_TStringList_AA[HWS_ComboBox_CheckList.ItemIndex];
   end;
   HWS_ListBox_GrupoPerguntas.ItemIndex := 0;
   HWS_ListBox_GrupoPerguntasClick(HWS_ListBox_GrupoPerguntas);
   HWS_PodeAlterarCheckList := F_HWS_CheckListPodeSerAlerado(HWS_ComboBox_CheckList.Items.Names[HWS_ComboBox_CheckList.ItemIndex]);
end;

end.
