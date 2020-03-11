unit uHWSCheckListClientOrganizarSequenciaDasPerguntas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.Buttons, Data.DB;

type
  THWS_Form_OrganizarSequenciaDasPerguntas = class(TForm)
    GroupBox1: TGroupBox;
    HWS_StringGrid_GrupoPerguntas: TStringGrid;
    GroupBox2: TGroupBox;
    HWS_StringGrid_Perguntas: TStringGrid;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    GroupBox3: TGroupBox;
    HWS_ComboBox_CheckList: TComboBox;
    HWS_BitBtn_Gravar: TBitBtn;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure HWS_ComboBox_CheckListChange(Sender: TObject);
    procedure HWS_CriaListaDeGruposdePerguntas(HWS_CheckList: String);
    procedure HWS_FiltraPerguntasDoGrupo(HWS_CheckList: String; HWS_GrupoPerguntas: String);
    procedure HWS_StringGrid_GrupoPerguntasClick(Sender: TObject);
    procedure HWS_StringGrid_PerguntasRowMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure HWS_StringGrid_PerguntasMouseActivate(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y, HitTest: Integer;
      var MouseActivate: TMouseActivate);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HWS_Form_OrganizarSequenciaDasPerguntas: THWS_Form_OrganizarSequenciaDasPerguntas;
  HWS_Copia_StringGrid: TStringGrid;

implementation

uses uHWSFuncoes, uHWSCheckListClientDataModule;

{$R *.dfm}

procedure THWS_Form_OrganizarSequenciaDasPerguntas.BitBtn1Click(Sender: TObject);
begin
   Close;
end;

procedure THWS_Form_OrganizarSequenciaDasPerguntas.FormCreate(Sender: TObject);
begin
   HWS_ClientModule.HWS_ClientDataSet_AB01.Open;
   F_HWS_RetornaCheckLists(HWS_ComboBox_CheckList);
   HWS_ComboBox_CheckListChange(HWS_ComboBox_CheckList);
   HWS_Copia_StringGrid := TStringGrid.Create(Self);
end;

procedure THWS_Form_OrganizarSequenciaDasPerguntas.HWS_ComboBox_CheckListChange(Sender: TObject);
var HWS_PodeAlterarCheckList: Boolean;
begin
   HWS_CriaListaDeGruposdePerguntas(HWS_ComboBox_CheckList.Items.Names[HWS_ComboBox_CheckList.ItemIndex]);
   HWS_PodeAlterarCheckList := F_HWS_CheckListPodeSerAlerado(HWS_ComboBox_CheckList.Items.Names[HWS_ComboBox_CheckList.ItemIndex]);
   HWS_BitBtn_Gravar.Enabled := HWS_PodeAlterarCheckList;
end;

procedure THWS_Form_OrganizarSequenciaDasPerguntas.HWS_CriaListaDeGruposdePerguntas(HWS_CheckList: String);
var HWS_Linha: Integer;
begin
   //
   HWS_StringGrid_GrupoPerguntas.RowCount := 2;
   HWS_StringGrid_GrupoPerguntas.ColCount := 3;
   HWS_StringGrid_GrupoPerguntas.FixedCols := 1;
   HWS_StringGrid_GrupoPerguntas.FixedRows := 1;
   HWS_StringGrid_GrupoPerguntas.ColWidths[0] := 20;
   //
   HWS_ClientModule.HWS_ClientDataSet_AB01.Filtered := False;
   HWS_ClientModule.HWS_ClientDataSet_AB01.Filter   := 'AB_CODCHK = ' + QuotedStr(HWS_CheckList);
   HWS_ClientModule.HWS_ClientDataSet_AB01.Filtered := True;
   HWS_Linha := 1;
   while not HWS_ClientModule.HWS_ClientDataSet_AB01.Eof do begin
      HWS_StringGrid_GrupoPerguntas.Cells[1,HWS_Linha] := FormatFloat('000000',HWS_ClientModule.HWS_ClientDataSet_AB01AB_CODIGO.AsInteger);
      HWS_StringGrid_GrupoPerguntas.Cells[2,HWS_Linha] := HWS_ClientModule.HWS_ClientDataSet_AB01AB_DESC.AsString;
      Inc(HWS_Linha);
      HWS_ClientModule.HWS_ClientDataSet_AB01.Next;
      if not HWS_ClientModule.HWS_ClientDataSet_AB01.Eof then
         HWS_StringGrid_GrupoPerguntas.RowCount := HWS_StringGrid_GrupoPerguntas.RowCount + 1;
   end;
end;

procedure THWS_Form_OrganizarSequenciaDasPerguntas.HWS_FiltraPerguntasDoGrupo(HWS_CheckList: String; HWS_GrupoPerguntas: String);
var HWS_Linha: Integer;
    HWS_Nivel: String;
    X: Integer;
begin
   //
   HWS_StringGrid_Perguntas.ColCount   := 5;
   HWS_StringGrid_Perguntas.FixedCols  := 1;
   HWS_StringGrid_Perguntas.FixedRows  := 1;
   HWS_StringGrid_Perguntas.RowCount   := 2;
   HWS_StringGrid_Perguntas.ColWidths[0] := 20;
   HWS_StringGrid_Perguntas.Cells[1,0] := '1o Nivel';
   HWS_StringGrid_Perguntas.Cells[2,0] := '2o Nivel';
   HWS_StringGrid_Perguntas.Cells[3,0] := '3o Nivel';
   HWS_StringGrid_Perguntas.Cells[4,0] := 'Pergunta';
   // Chama a rotina que traz toda as estrutura de perguntas
   HWS_ClientModule.HWS_SqlServerMethod_F_HWS_RetornaEstruturaDasPerguntas.ParamByName('HWS_CheckList').AsString := HWS_CheckList;
   HWS_ClientModule.HWS_SqlServerMethod_F_HWS_RetornaEstruturaDasPerguntas.ExecuteMethod;
   HWS_ClientModule.HWS_ClientDataSet_F_HWS_RetornaEstruturaDasPerguntas.Open;
   HWS_ClientModule.HWS_ClientDataSet_F_HWS_RetornaEstruturaDasPerguntas.Filtered := False;
   HWS_ClientModule.HWS_ClientDataSet_F_HWS_RetornaEstruturaDasPerguntas.Filter   := 'AE_GRUPO = ' + QuotedStr(HWS_GrupoPerguntas);
   HWS_ClientModule.HWS_ClientDataSet_F_HWS_RetornaEstruturaDasPerguntas.Filtered := True;
   //
   HWS_Linha := 1;
   while not HWS_ClientModule.HWS_ClientDataSet_F_HWS_RetornaEstruturaDasPerguntas.Eof do begin
      HWS_Nivel := HWS_ClientModule.HWS_ClientDataSet_F_HWS_RetornaEstruturaDasPerguntas.FieldByName('NIVEL').AsString;
      if HWS_Nivel = '01' then begin
         HWS_StringGrid_Perguntas.Cells[1,HWS_Linha] := FormatFloat('000000',HWS_ClientModule.HWS_ClientDataSet_F_HWS_RetornaEstruturaDasPerguntas.FieldByName('PAI').AsInteger);
         HWS_StringGrid_Perguntas.Cells[2,HWS_Linha] := '';
         HWS_StringGrid_Perguntas.Cells[3,HWS_Linha] := '';
      end else if HWS_Nivel = '02' then begin
         HWS_StringGrid_Perguntas.Cells[1,HWS_Linha] := FormatFloat('000000',HWS_ClientModule.HWS_ClientDataSet_F_HWS_RetornaEstruturaDasPerguntas.FieldByName('PAI').AsInteger);
         HWS_StringGrid_Perguntas.Cells[2,HWS_Linha] := FormatFloat('000000',HWS_ClientModule.HWS_ClientDataSet_F_HWS_RetornaEstruturaDasPerguntas.FieldByName('FILHA').AsInteger);
         HWS_StringGrid_Perguntas.Cells[3,HWS_Linha] := '';
      end else if HWS_Nivel = '03' then begin
         HWS_StringGrid_Perguntas.Cells[1,HWS_Linha] := FormatFloat('000000',HWS_ClientModule.HWS_ClientDataSet_F_HWS_RetornaEstruturaDasPerguntas.FieldByName('PAI').AsInteger);
         HWS_StringGrid_Perguntas.Cells[2,HWS_Linha] := FormatFloat('000000',HWS_ClientModule.HWS_ClientDataSet_F_HWS_RetornaEstruturaDasPerguntas.FieldByName('FILHA').AsInteger);
         HWS_StringGrid_Perguntas.Cells[3,HWS_Linha] := FormatFloat('000000',HWS_ClientModule.HWS_ClientDataSet_F_HWS_RetornaEstruturaDasPerguntas.FieldByName('FILHADAFILHA').AsInteger);
      end;
      HWS_StringGrid_Perguntas.Cells[4,HWS_Linha] := HWS_ClientModule.HWS_ClientDataSet_F_HWS_RetornaEstruturaDasPerguntas.FieldByName('AD_PERGUNTA').AsString;
      Inc(HWS_Linha);
      HWS_ClientModule.HWS_ClientDataSet_F_HWS_RetornaEstruturaDasPerguntas.Next;
      if not HWS_ClientModule.HWS_ClientDataSet_F_HWS_RetornaEstruturaDasPerguntas.Eof then
         HWS_StringGrid_Perguntas.RowCount := HWS_StringGrid_Perguntas.RowCount + 1;
   end;
   HWS_ClientModule.HWS_ClientDataSet_F_HWS_RetornaEstruturaDasPerguntas.Filtered := False;
   HWS_ClientModule.HWS_ClientDataSet_F_HWS_RetornaEstruturaDasPerguntas.Close;
end;

procedure THWS_Form_OrganizarSequenciaDasPerguntas.HWS_StringGrid_GrupoPerguntasClick(Sender: TObject);
begin
   HWS_FiltraPerguntasDoGrupo(HWS_ComboBox_CheckList.Items.Names[HWS_ComboBox_CheckList.ItemIndex], HWS_StringGrid_GrupoPerguntas.Cells[1,HWS_StringGrid_GrupoPerguntas.Row]);
end;

procedure THWS_Form_OrganizarSequenciaDasPerguntas.HWS_StringGrid_PerguntasMouseActivate(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y,
  HitTest: Integer; var MouseActivate: TMouseActivate);
   var W: Integer;
begin
   // Fazendo uma copia para eventual mudanca de sequencias
   HWS_Copia_StringGrid.ColCount := HWS_StringGrid_Perguntas.ColCount;
   HWS_Copia_StringGrid.RowCount := HWS_StringGrid_Perguntas.RowCount;
   for W := 0 to HWS_StringGrid_Perguntas.RowCount-1 do begin
      HWS_Copia_StringGrid.Rows[W] := HWS_StringGrid_Perguntas.Rows[W];
   end;
end;

procedure THWS_Form_OrganizarSequenciaDasPerguntas.HWS_StringGrid_PerguntasRowMoved(Sender: TObject; FromIndex, ToIndex: Integer);
var HWS_Nivel01_MOVIDO,
    HWS_Nivel02_MOVIDO,
    HWS_Nivel03_MOVIDO,
    HWS_PERGUNTA_MOVIDO: String;
    HWS_Nivel01_ANTERIOR_AO_MOVIDO,
    HWS_Nivel02_ANTERIOR_AO_MOVIDO,
    HWS_Nivel03_ANTERIOR_AO_MOVIDO,
    HWS_PERGUNTA_ANTERIOR_AO_MOVIDO: String;
    HWS_Nivel01_POSTERIOR_AO_MOVIDO,
    HWS_Nivel02_POSTERIOR_AO_MOVIDO,
    HWS_Nivel03_POSTERIOR_AO_MOVIDO,
    HWS_PERGUNTA_PORSTERIOR_AO_MOVIDO: String;
    X: Integer;
begin
   HWS_Nivel01_MOVIDO     := HWS_StringGrid_Perguntas.Cells[1,ToIndex];
   HWS_Nivel02_MOVIDO     := HWS_StringGrid_Perguntas.Cells[2,ToIndex];
   HWS_Nivel03_MOVIDO     := HWS_StringGrid_Perguntas.Cells[3,ToIndex];
   HWS_PERGUNTA_MOVIDO    := HWS_StringGrid_Perguntas.Cells[4,ToIndex];

   HWS_Nivel01_ANTERIOR_AO_MOVIDO    := HWS_StringGrid_Perguntas.Cells[1,ToIndex-1];
   HWS_Nivel02_ANTERIOR_AO_MOVIDO    := HWS_StringGrid_Perguntas.Cells[2,ToIndex-1];
   HWS_Nivel03_ANTERIOR_AO_MOVIDO    := HWS_StringGrid_Perguntas.Cells[3,ToIndex-1];
   HWS_PERGUNTA_ANTERIOR_AO_MOVIDO   := HWS_StringGrid_Perguntas.Cells[4,ToIndex-1];

   HWS_Nivel01_POSTERIOR_AO_MOVIDO    := HWS_StringGrid_Perguntas.Cells[1,ToIndex+1];
   HWS_Nivel02_POSTERIOR_AO_MOVIDO    := HWS_StringGrid_Perguntas.Cells[2,ToIndex+1];
   HWS_Nivel03_POSTERIOR_AO_MOVIDO    := HWS_StringGrid_Perguntas.Cells[3,ToIndex+1];
   HWS_PERGUNTA_PORSTERIOR_AO_MOVIDO  := HWS_StringGrid_Perguntas.Cells[4,ToIndex+1];


   if Trim(HWS_Nivel03_MOVIDO) <> '' then begin
      // Esta movendo o 3 Nivel - Verifica se o 2 Nivel da Linha Anterior e o mesmo da Linha Movida;
      if (Trim(HWS_Nivel02_MOVIDO) <> Trim(HWS_Nivel02_ANTERIOR_AO_MOVIDO)) or
         (Trim(HWS_Nivel02_MOVIDO) <> Trim(HWS_Nivel02_POSTERIOR_AO_MOVIDO)) then begin
         MessageDlg('A pergunta não pode ser movida para um nível diferente dela.' ,mtError,[mbOK],0);
         for X := 0 to HWS_Copia_StringGrid.RowCount-1 do begin
            HWS_StringGrid_Perguntas.Rows[X] := HWS_Copia_StringGrid.Rows[X];
         end;
         Exit;
      end;
   end;

   if Trim(HWS_Nivel02_MOVIDO) <> '' then begin
      // Esta movendo o 3 Nivel - Verifica se o 2 Nivel da Linha Anterior e o mesmo da Linha Movida;
      if (Trim(HWS_Nivel01_MOVIDO) <> Trim(HWS_Nivel01_ANTERIOR_AO_MOVIDO)) or
         (Trim(HWS_Nivel01_MOVIDO) <> Trim(HWS_Nivel01_POSTERIOR_AO_MOVIDO)) then begin
         MessageDlg('A pergunta não pode ser movida para um nível diferente dela.' ,mtError,[mbOK],0);
         for X := 0 to HWS_Copia_StringGrid.RowCount-1 do begin
            HWS_StringGrid_Perguntas.Rows[X] := HWS_Copia_StringGrid.Rows[X];
         end;
         Exit;
      end;
   end;

end;

end.
