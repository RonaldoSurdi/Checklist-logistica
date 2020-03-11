unit uHWSCheckListClientPerguntasRestricaoInclusao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.ComCtrls, Vcl.Buttons;

type
  THWS_Form_RestricaoInclusao = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    StatusBar1: TStatusBar;
    GroupBox3: TGroupBox;
    HWS_Label_GrupoPerguntas: TLabel;
    HWS_Label_RespostaDoGrupo: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    UpDown1: TUpDown;
    HWS_Edit_QtdRespostas: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    BitBtn4: TBitBtn;
    BitBtn1: TBitBtn;
    HWS_ListBox_GrupoPerguntas: TListBox;
    HWS_ListBox_RespostasDoGrupo: TListBox;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure HWS_ListBox_GrupoPerguntasClick(Sender: TObject);
    procedure HWS_ListBox_RespostasDoGrupoClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HWS_Form_RestricaoInclusao: THWS_Form_RestricaoInclusao;

implementation

uses uHWSFuncoes, uHWSCheckListClientDataModule,
  uHWSCheckListClientPerguntasRestricao;

{$R *.dfm}

procedure THWS_Form_RestricaoInclusao.BitBtn1Click(Sender: TObject);
begin
   if F_HWS_ValidaDadosFormulario(HWS_ClientModule.HWS_ClientDataSet_AJ01,'I','AJ_CODCHK;AJ_CODGRP;AJ_CODRES',
      VarArrayOf([HWS_Form_PerguntasRestricao.HWS_ComboBox_CheckList.Items.Names[HWS_Form_PerguntasRestricao.HWS_ComboBox_CheckList.ItemIndex],
                  HWS_ListBox_GrupoPerguntas.Items.Names[HWS_ListBox_GrupoPerguntas.ItemIndex],
                  HWS_ListBox_RespostasDoGrupo.Items.Names[HWS_ListBox_RespostasDoGrupo.ItemIndex]]),
                  HWS_Form_RestricaoInclusao) then begin
      try
         HWS_ClientModule.HWS_ClientDataSet_AJ01.Insert;
         HWS_ClientModule.HWS_ClientDataSet_AJ01AJ_CODCHK.AsString      := HWS_Form_PerguntasRestricao.HWS_ComboBox_CheckList.Items.Names[HWS_Form_PerguntasRestricao.HWS_ComboBox_CheckList.ItemIndex];
         HWS_ClientModule.HWS_ClientDataSet_AJ01AJ_CODGRP.AsString      := HWS_ListBox_GrupoPerguntas.Items.Names[HWS_ListBox_GrupoPerguntas.ItemIndex];
         HWS_ClientModule.HWS_ClientDataSet_AJ01AJ_CODRES.AsString      := HWS_ListBox_RespostasDoGrupo.Items.Names[HWS_ListBox_RespostasDoGrupo.ItemIndex];
         HWS_ClientModule.HWS_ClientDataSet_AJ01AJ_QTDRESTR.AsInteger   := StrToInt(HWS_Edit_QtdRespostas.Text);
         HWS_ClientModule.HWS_ClientDataSet_AJ01.Post;
         HWS_ClientModule.HWS_ClientDataSet_AJ01.ApplyUpdates(-1);
         Close;
      except on E: Exception do
         MessageDlg(E.ToString,mtError,[mbOK],0);
      end;
   end;
end;

procedure THWS_Form_RestricaoInclusao.BitBtn4Click(Sender: TObject);
begin
   Close;
end;

procedure THWS_Form_RestricaoInclusao.FormCreate(Sender: TObject);
var X: Integer;
begin
   HWS_ClientModule.HWS_ClientDataSet_AF01.Filtered  := False;
   HWS_ClientModule.HWS_ClientDataSet_AB01.Filtered  := False;
   HWS_ClientModule.HWS_ClientDataSet_AB01.Filter    := 'AB_CODCHK = ' + QuotedStr(HWS_Form_PerguntasRestricao.HWS_ComboBox_CheckList.Items.Names[HWS_Form_PerguntasRestricao.HWS_ComboBox_CheckList.ItemIndex]);
   HWS_ClientModule.HWS_ClientDataSet_AB01.Filtered  := True;
   HWS_ListBox_GrupoPerguntas.Clear;
   while not HWS_ClientModule.HWS_ClientDataSet_AB01.Eof do begin
      HWS_ListBox_GrupoPerguntas.Items.Add(FormatFloat('000000',HWS_ClientModule.HWS_ClientDataSet_AB01AB_CODIGO.AsInteger) + '=' + HWS_ClientModule.HWS_ClientDataSet_AB01AB_DESC.AsString);
      HWS_ClientModule.HWS_ClientDataSet_AB01.Next;
   end;
   if HWS_ListBox_GrupoPerguntas.Count > 0 then begin
      HWS_ListBox_GrupoPerguntas.ItemIndex := 0;
      HWS_ListBox_GrupoPerguntasClick(HWS_ListBox_GrupoPerguntas);
      HWS_ListBox_RespostasDoGrupoClick(HWS_ListBox_RespostasDoGrupo);
   end;
end;

procedure THWS_Form_RestricaoInclusao.HWS_ListBox_GrupoPerguntasClick(
  Sender: TObject);
begin
   HWS_ClientModule.HWS_ClientDataSet_AE01.Filtered := False;
   HWS_ClientModule.HWS_ClientDataSet_AE01.Filter   := 'AE_CODCHK = ' + QuotedStr(HWS_Form_PerguntasRestricao.HWS_ComboBox_CheckList.Items.Names[HWS_Form_PerguntasRestricao.HWS_ComboBox_CheckList.ItemIndex]) + ' and AE_GRUPO = ' + QuotedStr(HWS_ListBox_GrupoPerguntas.Items.Names[HWS_ListBox_GrupoPerguntas.ItemIndex]);
   HWS_ClientModule.HWS_ClientDataSet_AE01.Filtered := True;
   HWS_ListBox_RespostasDoGrupo.Clear;
   while not HWS_ClientModule.HWS_ClientDataSet_AE01.Eof do begin
      HWS_ClientModule.HWS_ClientDataSet_AH01.Filtered := False;
      HWS_ClientModule.HWS_ClientDataSet_AH01.Filter   := 'AH_CODCHK = ' + QuotedStr(HWS_Form_PerguntasRestricao.HWS_ComboBox_CheckList.Items.Names[HWS_Form_PerguntasRestricao.HWS_ComboBox_CheckList.ItemIndex]) + ' and AH_CODPER = ' + QuotedStr(HWS_ClientModule.HWS_ClientDataSet_AE01AE_CODPER.AsString);
      HWS_ClientModule.HWS_ClientDataSet_AH01.Filtered := True;
      while not HWS_ClientModule.HWS_ClientDataSet_AH01.Eof do begin
         if HWS_ClientModule.HWS_ClientDataSet_AF01.Locate(
            'AF_CODCHK;AF_CODIGO',
            VarArrayOf([HWS_ClientModule.HWS_ClientDataSet_AH01AH_CODCHK.AsInteger,
                        HWS_ClientModule.HWS_ClientDataSet_AH01AH_CODRES.AsInteger]),[]) then begin
               if HWS_ListBox_RespostasDoGrupo.Items.IndexOf(FormatFloat('000000',HWS_ClientModule.HWS_ClientDataSet_AH01AH_CODRES.AsInteger) + '=' + HWS_ClientModule.HWS_ClientDataSet_AF01AF_RESPOSTA.AsString) = -1 then
                  HWS_ListBox_RespostasDoGrupo.Items.Add(FormatFloat('000000',HWS_ClientModule.HWS_ClientDataSet_AF01AF_CODIGO.AsInteger) + '=' + HWS_ClientModule.HWS_ClientDataSet_AF01AF_RESPOSTA.AsString);
         end;
         HWS_ClientModule.HWS_ClientDataSet_AH01.Next;
      end;
      HWS_ClientModule.HWS_ClientDataSet_AE01.Next;
   end;
   if HWS_ListBox_RespostasDoGrupo.Count > 0 then
      HWS_ListBox_RespostasDoGrupo.ItemIndex := 0;
   HWS_Label_GrupoPerguntas.Caption := HWS_ListBox_GrupoPerguntas.Items.ValueFromIndex[HWS_ListBox_GrupoPerguntas.ItemIndex];
end;

procedure THWS_Form_RestricaoInclusao.HWS_ListBox_RespostasDoGrupoClick(
  Sender: TObject);
begin
   HWS_Label_RespostaDoGrupo.Caption := HWS_ListBox_RespostasDoGrupo.Items.ValueFromIndex[HWS_ListBox_RespostasDoGrupo.ItemIndex];
end;

end.
