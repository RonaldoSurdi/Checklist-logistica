unit uHWSCheckListClientPerguntasFilhasInclusao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.CheckLst, Vcl.ComCtrls,
  Vcl.Buttons;

type
  THWS_Form_PerguntasFilhasInclusao = class(TForm)
    GroupBox1: TGroupBox;
    HWS_Memo_PerguntaPai: TMemo;
    GroupBox2: TGroupBox;
    HWS_CheckListBox_PerguntasFilhas: TCheckListBox;
    StatusBar1: TStatusBar;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    GroupBox3: TGroupBox;
    HWS_Label_RespostaPai: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HWS_Form_PerguntasFilhasInclusao: THWS_Form_PerguntasFilhasInclusao;

implementation

uses uHWSCheckListClientPerguntasFilhas, uHWSCheckListClientDataModule;

{$R *.dfm}

procedure THWS_Form_PerguntasFilhasInclusao.BitBtn1Click(Sender: TObject);
begin
   Close;
end;

procedure THWS_Form_PerguntasFilhasInclusao.BitBtn2Click(Sender: TObject);
var X: Integer;
begin
   for X := 0 to HWS_CheckListBox_PerguntasFilhas.Count-1 do begin
      if HWS_CheckListBox_PerguntasFilhas.Checked[X] then begin
         HWS_ClientModule.HWS_ClientDataSet_AG01.Insert;
         HWS_ClientModule.HWS_ClientDataSet_AG01AG_CODCHK.AsString      := HWS_Form_PerguntasFilhas.HWS_ComboBox_CheckList.Items.Names[HWS_Form_PerguntasFilhas.HWS_ComboBox_CheckList.ItemIndex];
         HWS_ClientModule.HWS_ClientDataSet_AG01AG_PERPAI.AsString      := HWS_Form_PerguntasFilhas.HWS_ListBox_PerguntasPai.Items.Names[HWS_Form_PerguntasFilhas.HWS_ListBox_PerguntasPai.ItemIndex];
         HWS_ClientModule.HWS_ClientDataSet_AG01AG_PERFILHA.AsString    := HWS_CheckListBox_PerguntasFilhas.Items.Names[X];
         HWS_ClientModule.HWS_ClientDataSet_AG01AG_CODRESPAI.AsString   := Copy(HWS_Label_RespostaPai.Caption,1,6);
         HWS_ClientModule.HWS_ClientDataSet_AG01.Post;
      end;
   end;
   HWS_ClientModule.HWS_ClientDataSet_AG01.ApplyUpdates(-1);
   HWS_Form_PerguntasFilhas.HWS_ListBox_RespostasPaiClick(HWS_Form_PerguntasFilhas.HWS_ListBox_RespostasPai);
   Close;
end;

procedure THWS_Form_PerguntasFilhasInclusao.FormCreate(Sender: TObject);
var HWS_PodeIncluir: Boolean;
    HWS_PerguntaPai: String;
    HWS_GrupoDaPerguntaPai: String;
begin
   HWS_CheckListBox_PerguntasFilhas.Clear;
   HWS_PerguntaPai           := HWS_Form_PerguntasFilhas.HWS_ListBox_PerguntasPai.Items.Names[HWS_Form_PerguntasFilhas.HWS_ListBox_PerguntasPai.ItemIndex];
   HWS_Memo_PerguntaPai.Text := HWS_Form_PerguntasFilhas.HWS_ListBox_PerguntasPai.Items.ValueFromIndex[HWS_Form_PerguntasFilhas.HWS_ListBox_PerguntasPai.ItemIndex];

   HWS_Label_RespostaPai.Caption := HWS_Form_PerguntasFilhas.HWS_ListBox_RespostasPai.Items.Strings[HWS_Form_PerguntasFilhas.HWS_ListBox_RespostasPai.ItemIndex];

   // Filtra as perguntas filhas do checklist atual
   HWS_ClientModule.HWS_ClientDataSet_AG01.Filtered := False;
   HWS_ClientModule.HWS_ClientDataSet_AG01.Filter   := 'AG_CODCHK = ' + QuotedStr(HWS_Form_PerguntasFilhas.HWS_ComboBox_CheckList.Items.Names[HWS_Form_PerguntasFilhas.HWS_ComboBox_CheckList.ItemIndex]);
   HWS_ClientModule.HWS_ClientDataSet_AG01.Filtered := True;

   HWS_ClientModule.HWS_ClientDataSet_AE01.Filtered := False;
   HWS_ClientModule.HWS_ClientDataSet_AE01.Filter   := 'AE_CODCHK = ' + QuotedStr(HWS_Form_PerguntasFilhas.HWS_ComboBox_CheckList.Items.Names[HWS_Form_PerguntasFilhas.HWS_ComboBox_CheckList.ItemIndex]);
   HWS_ClientModule.HWS_ClientDataSet_AE01.Filtered := True;


   // Filtra o cadastro de perguntas do checklist atual
   HWS_ClientModule.HWS_ClientDataSet_AD01.Filtered := False;
   HWS_ClientModule.HWS_ClientDataSet_AD01.Filter   := 'AD_CODCHK = ' + QuotedStr(HWS_Form_PerguntasFilhas.HWS_ComboBox_CheckList.Items.Names[HWS_Form_PerguntasFilhas.HWS_ComboBox_CheckList.ItemIndex]) + ' and AD_CODIGO <> ' + HWS_Form_PerguntasFilhas.HWS_ListBox_PerguntasPai.Items.Names[HWS_Form_PerguntasFilhas.HWS_ListBox_PerguntasPai.ItemIndex];
   HWS_ClientModule.HWS_ClientDataSet_AD01.Filtered := True;
   while not HWS_ClientModule.HWS_ClientDataSet_AD01.Eof do begin
      // So inclui na lista de perguntas filhas caso a pergunta não seja uma pegunta pai
      if HWS_ClientModule.HWS_ClientDataSet_AG01.Locate(
             'AG_CODCHK;AG_PERPAI',
             VarArrayOf([HWS_ClientModule.HWS_ClientDataSet_AD01AD_CODCHK.AsInteger,
                         HWS_ClientModule.HWS_ClientDataSet_AD01AD_CODIGO.AsInteger]),[]) then begin
         HWS_ClientModule.HWS_ClientDataSet_AD01.Next;
         Continue;
      end;
      // So inclui na lista de perguntas filhas caso a pergunta não seja uma pegunta filha de outra pergunta
      if HWS_ClientModule.HWS_ClientDataSet_AG01.Locate(
                'AG_CODCHK;AG_PERFILHA',
                VarArrayOf([HWS_ClientModule.HWS_ClientDataSet_AD01AD_CODCHK.AsInteger,
                            HWS_ClientModule.HWS_ClientDataSet_AD01AD_CODIGO.AsInteger]),[]) then begin
         HWS_ClientModule.HWS_ClientDataSet_AD01.Next;
         Continue;
      end;
      // So Inclui na Lista pergunta do mesmo grupo da pergunta pai
      if HWS_ClientModule.HWS_ClientDataSet_AE01.Locate(
         'AE_CODCHK;AE_CODPER',
          VarArrayOf([HWS_ClientModule.HWS_ClientDataSet_AD01AD_CODCHK.AsInteger,
                      HWS_PerguntaPai]),[]) then begin
         HWS_GrupoDaPerguntaPai := HWS_ClientModule.HWS_ClientDataSet_AE01AE_GRUPO.AsString;
         if HWS_ClientModule.HWS_ClientDataSet_AE01.Locate(
            'AE_CODCHK;AE_CODPER',
            VarArrayOf([HWS_ClientModule.HWS_ClientDataSet_AD01AD_CODCHK.AsInteger,
                        HWS_ClientModule.HWS_ClientDataSet_AD01AD_CODIGO.AsInteger]),[]) then begin
            if Trim(HWS_GrupoDaPerguntaPai) <> Trim(HWS_ClientModule.HWS_ClientDataSet_AE01AE_GRUPO.AsString) then begin
               HWS_ClientModule.HWS_ClientDataSet_AD01.Next;
               Continue;
            end;
         end;
      end;
      if HWS_Form_PerguntasFilhas.HWS_ListBox_PerguntasFilhas.Items.IndexOf(FormatFloat('000000',HWS_ClientModule.HWS_ClientDataSet_AD01AD_CODIGO.AsInteger) + '=' + HWS_ClientModule.HWS_ClientDataSet_AD01AD_PERGUNTA.AsString) = -1 then
         HWS_CheckListBox_PerguntasFilhas.Items.Add(FormatFloat('000000',HWS_ClientModule.HWS_ClientDataSet_AD01AD_CODIGO.AsInteger) + '=' + HWS_ClientModule.HWS_ClientDataSet_AD01AD_PERGUNTA.AsString);
      HWS_ClientModule.HWS_ClientDataSet_AD01.Next;
   end;
end;

end.
