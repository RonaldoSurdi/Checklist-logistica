unit uHWSFuncoes;

interface

uses  DataSnap.DbClient, Vcl.Forms, Vcl.StdCtrls, System.SysUtils, Vcl.Dialogs, Vcl.Mask, System.Variants, System.Classes,
      Vcl.Controls, Data.DB, Vcl.DBGrids, IdHashMessageDigest, IdHash;

function    F_HWS_ValidaDadosFormulario(HWS_DataSet: TClientDataSet; HWS_Tipo: String; HWS_KeyFields: String; HWS_KeyValues: Variant; HWS_Formulario: TForm): Boolean;
procedure   P_HWS_PopulaComboBox(HWS_DataSetGetDados: TClientDataSet; HWS_DataSetPutDados: TClientDataSet; HWS_CampoParaALista: string; HWS_CampoParaRetorno: String; HWS_ListaParaRetorno: TComboBox; HWS_Posiciona: Boolean; HWS_CampoPutDados: string);
function    F_HWS_ConsultaGenerica(HWS_DataSource: TDataSource; HWS_Nome_Indices, HWS_Campos_Indices,HWS_Campos_Para_DBGrid, HWS_Campos_Retorno: TStringList): TStringList;
function    F_HWS_Capitular(input: string): string;
function    F_HWS_RetornaCheckLists(HWS_ComboBox: TComboBox): TStrings;
function    F_HWS_FiltraTabela(HWS_ComboBox: TComboBox; HWS_DataSet: TDataSet; HWS_Campo: String):Boolean;
function    F_HWS_CheckListPodeSerAlerado(HWS_CheckList: String): Boolean;
function    F_HWS_Criptografa_MD5(HWS_Texto: String): String;


implementation

uses uHWSCheckListClientConsultasGenericas, uHWSCheckListClientDataModule;

function F_HWS_ValidaDadosFormulario(HWS_DataSet: TClientDataSet; HWS_Tipo: String; HWS_KeyFields: String; HWS_KeyValues: Variant; HWS_Formulario: TForm): Boolean;
var X: Integer;
    HWS_Texto_MaskEdit: string;
    HWS_Retorno: Boolean;
    HWS_Erro_Obrigatorio: Boolean;
    HWS_Mensagem: string;
begin
   HWS_Retorno          := True;
   HWS_Erro_Obrigatorio := False;
   // Os componentes obrigatorios possuem a propriedade Tag como 10
   // Verificando se há campos obrigatorios em branco no Formulario
   for X := 0 to HWS_Formulario.ComponentCount-1 do begin
      if (HWS_Formulario.Components[X].Tag = 10) then begin
         // Campos do tipo TEdit
         if (HWS_Formulario.Components[X] is TEdit) then begin
            if Trim((HWS_Formulario.Components[X] as TEdit).Text) = '' then begin
               HWS_Erro_Obrigatorio := True;
               HWS_Mensagem := (HWS_Formulario.Components[X] as TEdit).TextHint;
               Break;
            end;
         end;
         // Campos do tipo TMaskEdit
         if (HWS_Formulario.Components[X] is TMaskEdit) then begin
            HWS_Texto_MaskEdit := (HWS_Formulario.Components[X] as TMaskEdit).Text;
            if Pos(' ',HWS_Texto_MaskEdit) <> 0 then begin
               HWS_Erro_Obrigatorio := True;
               HWS_Mensagem := (HWS_Formulario.Components[X] as TMaskEdit).TextHint;
               Break;
            end;
         end;
         // Campos do tipo TMaskEdit
         if (HWS_Formulario.Components[X] is TCustomCombo) then begin
            if (HWS_Formulario.Components[X] as TCustomCombo).ItemIndex = -1 then begin
               HWS_Erro_Obrigatorio := True;
               HWS_Mensagem := (HWS_Formulario.Components[X] as TCustomComboBox).TextHint;
               Break;
            end;
         end;
         // Campos do tipo TMaskEdit
         if (HWS_Formulario.Components[X] is TMemo) then begin
            if Trim((HWS_Formulario.Components[X] as TMemo).Text) = '' then begin
               HWS_Erro_Obrigatorio := True;
               HWS_Mensagem := (HWS_Formulario.Components[X] as TMemo).TextHint;
               Break;
            end;
         end;
      end;
   end;
   if HWS_Erro_Obrigatorio then begin
      MessageDlg(HWS_Mensagem + ' (Campo obrigatório).' ,mtWarning,[mbOK],0);
      if (HWS_Formulario.Components[X] as TWinControl).Enabled then
         (HWS_Formulario.Components[X] as TWinControl).SetFocus;
      HWS_Retorno := False;
   end else begin
      //// Se os campos obrigatorios estiverem certos entao verifica se existe a chave na tabela quando for inclusao
      if HWS_Tipo = 'I' then begin //Inclusao
         HWS_DataSet.Refresh;
         if HWS_DataSet.Locate(HWS_KeyFields,HWS_KeyValues,[]) then begin
            MessageDlg('Já existe um registro gravado com estas informações.' ,mtError,[mbOK],0);
            HWS_Retorno := False;
         end;
      end;
   end;
   Result := HWS_Retorno;
end;


procedure P_HWS_PopulaComboBox(HWS_DataSetGetDados: TClientDataSet; HWS_DataSetPutDados: TClientDataSet; HWS_CampoParaALista: string; HWS_CampoParaRetorno: String; HWS_ListaParaRetorno: TComboBox; HWS_Posiciona: Boolean; HWS_CampoPutDados: string);

begin
   HWS_DataSetGetDados.Open;
   HWS_DataSetGetDados.First;
   HWS_ListaParaRetorno.Items.Clear;
   HWS_ListaParaRetorno.DropDownCount := 20;
   while not HWS_DataSetGetDados.Eof do begin
      HWS_ListaParaRetorno.Items.Add(HWS_DataSetGetDados.FieldByName(HWS_CampoParaRetorno).AsString + '=' + HWS_DataSetGetDados.FieldByName(HWS_CampoParaALista).AsString);
      HWS_DataSetGetDados.Next;
   end;
   if HWS_Posiciona then
      HWS_ListaParaRetorno.ItemIndex := HWS_ListaParaRetorno.Items.IndexOfName(HWS_DataSetPutDados.FieldByName(HWS_CampoPutDados).AsString);
end;


function F_HWS_ConsultaGenerica(HWS_DataSource: TDataSource; HWS_Nome_Indices, HWS_Campos_Indices,HWS_Campos_Para_DBGrid, HWS_Campos_Retorno: TStringList): TStringList;
var X: Integer;
    HWS_Colunas: TColumn;
begin
   Result := TStringList.Create;
   // Cria a tela da consulta
   Application.CreateForm(THWS_Form_ConsultasGenericas, HWS_Form_ConsultasGenericas);
   HWS_DataSource.DataSet.Open;
   HWS_Form_ConsultasGenericas.HWS_DBGrid_Pesquisa.DataSource  := HWS_DataSource;
   HWS_Form_ConsultasGenericas.HWS_ComboBox_Nome_Indice.Items.Assign(HWS_Nome_Indices);
   HWS_Form_ConsultasGenericas.HWS_ComboBox_Nome_Indice.ItemIndex := 0;
   HWS_Form_ConsultasGenericas.HWS_Campos_Do_Indice.Text := HWS_Campos_Indices.Text;
   // Criando as colunas para a Grid
   HWS_Colunas := TColumn.Create(HWS_Form_ConsultasGenericas.HWS_DBGrid_Pesquisa.Columns);
   HWS_Form_ConsultasGenericas.HWS_DBGrid_Pesquisa.Columns.Clear;
   for X := 0 to HWS_Campos_Para_DBGrid.Count-1 do begin
      HWS_Form_ConsultasGenericas.HWS_DBGrid_Pesquisa.Columns.Add;
      HWS_Form_ConsultasGenericas.HWS_DBGrid_Pesquisa.Columns.Items[X].FieldName := HWS_Campos_Para_DBGrid.Strings[X];
   end;
   HWS_Form_ConsultasGenericas.ShowModal;
   if HWS_Form_ConsultasGenericas.Tag = 1 then begin
      for X := 0 to HWS_Campos_Retorno.Count-1 do
         Result.Add(HWS_DataSource.DataSet.FieldByName(HWS_Campos_Retorno.Strings[X]).AsString);
   end;
end;

function F_HWS_Capitular(input: string): string;
var index: integer;
begin
   result := input;
   for index:=1 to length(result) do
      if (index=1) or (result[index-1]=' ') then
         result[index] := ansiUpperCase(result[index])[1];
end;

function F_HWS_RetornaCheckLists(HWS_ComboBox: TComboBox): TStrings;
begin
   //
   HWS_ComboBox.Items.Clear;
   HWS_ClientModule.HWS_ClientDataSet_A901.Open;
   HWS_ClientModule.HWS_ClientDataSet_A901.First;
   while not HWS_ClientModule.HWS_ClientDataSet_A901.Eof do begin
      HWS_ComboBox.Items.Add(FormatFloat('000000',HWS_ClientModule.HWS_ClientDataSet_A901A9_CODIGO.AsInteger)+ '=' + HWS_ClientModule.HWS_ClientDataSet_A901A9_DESC.AsString);
      HWS_ClientModule.HWS_ClientDataSet_A901.Next;
   end;
   HWS_ClientModule.HWS_ClientDataSet_A901.Close;
   if HWS_ComboBox.Items.Count > 0 then
      HWS_ComboBox.ItemIndex := 0;
end;

function F_HWS_FiltraTabela(HWS_ComboBox: TComboBox; HWS_DataSet: TDataSet; HWS_Campo: String):Boolean;
var HWS_CheckList: String;
begin
   HWS_CheckList := HWS_ComboBox.Items.Names[HWS_ComboBox.ItemIndex];
   HWS_DataSet.Filtered := False;
   HWS_DataSet.Filter   := HWS_Campo + ' = ' + QuotedStr(HWS_CheckList);
   HWS_DataSet.Filtered := True;
end;

function F_HWS_CheckListPodeSerAlerado(HWS_CheckList: String): Boolean;
begin
   Result := True;
   HWS_ClientModule.HWS_ClientDataSet_A901.Open;
   if HWS_ClientModule.HWS_ClientDataSet_A901.Locate('A9_CODIGO',HWS_CheckList,[]) then begin
      if HWS_ClientModule.HWS_ClientDataSet_A901A9_STATUS.AsString <> '3' then
         Result := True;
   end;
end;

function F_HWS_Criptografa_MD5(HWS_Texto: String): String;
var HWS_HASH: TIdHashMessageDigest5;
begin
    HWS_HASH := TIdHashMessageDigest5.Create;
    try
       Result := HWS_HASH.HashStringAsHex(HWS_Texto);
    finally
      HWS_HASH.Free;
    end;
end;

end.
