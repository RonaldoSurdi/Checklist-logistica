unit uHWSCheckListClientCheckList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.Buttons, Data.DBXJSON, Vcl.ExtCtrls, Data.DB;

type
  THWS_Form_CheckList = class(TForm)
    GroupBox1: TGroupBox;
    StatusBar1: TStatusBar;
    HWS_DBGrid_CheckLists: TDBGrid;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    Panel5: TPanel;
    Label7: TLabel;
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    Label2: TLabel;
    Panel3: TPanel;
    Label3: TLabel;
    procedure BitBtn5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure HWS_DBGrid_CheckListsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure HWS_DBGrid_CheckListsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BitBtn6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HWS_Form_CheckList: THWS_Form_CheckList;

implementation

uses uHWSCheckListClientDataModule, uHWSCheckListClientCheckListInclusao,
  uHWSCheckListClientCheckListAlteracao;

{$R *.dfm}

procedure THWS_Form_CheckList.BitBtn1Click(Sender: TObject);
begin
   Application.CreateForm(THWS_Form_CheckList_Alteracao, HWS_Form_CheckList_Alteracao);
   HWS_Form_CheckList_Alteracao.ShowModal;
end;

procedure THWS_Form_CheckList.BitBtn2Click(Sender: TObject);
begin
   Application.CreateForm(THWS_Form_CheckList_Inclusao, HWS_Form_CheckList_Inclusao);
   HWS_Form_CheckList_Inclusao.ShowModal;
end;

procedure THWS_Form_CheckList.BitBtn3Click(Sender: TObject);
begin
   if HWS_ClientModule.HWS_ClientDataSet_AA01.Locate('AA_CODCHK',HWS_ClientModule.HWS_ClientDataSet_A901A9_CODIGO.AsInteger,[]) then begin
       MessageDlg('Não é possível excluir o checklist: ' + Chr(13) + Chr(13) +
                  HWS_ClientModule.HWS_ClientDataSet_A901A9_DESC.AsString + Chr(13) + Chr(13) +
                  'pois ele está associado a um tipo de implemento.' ,mtInformation,[mbOK],0);
       Exit;
   end;
   if (MessageDlg('Tem certeza que deseja excluir o checklist ' + HWS_ClientModule.HWS_ClientDataSet_A901A9_DESC.AsString + '?',mtInformation,[mbYes,mbNO],0) = mrYes) then begin
      try
         HWS_ClientModule.HWS_ClientDataSet_A901.Delete;
         HWS_ClientModule.HWS_ClientDataSet_A901.ApplyUpdates(-1);
      except on E: Exception do
         MessageDlg(E.ToString,mtError,[mbOK],0);
      end;
   end;
end;

procedure THWS_Form_CheckList.BitBtn4Click(Sender: TObject);
var HWS_Retorno: TJsonArray;
    HWS_CodigoCheck: Integer;
begin
   // 0 - Novo
   // 1 - Ativo
   // 2 - Já revisado
   // 3 - Em Revisão

   // Para revisar o checklist o mesmo tem que estar ativo
   HWS_CodigoCheck := HWS_ClientModule.HWS_ClientDataSet_A901A9_CODIGO.AsInteger;
   if HWS_ClientModule.HWS_ClientDataSet_A901A9_STATUS.AsString = '1' then begin
      // Verifica se existe alguma revisao para este checklits pendente.
      // Se houver nao deixa incluir uma nova revisao
      if HWS_ClientModule.HWS_ClientDataSet_A901.Locate('A9_CODREV',HWS_CodigoCheck,[]) then begin
         if HWS_ClientModule.HWS_ClientDataSet_A901A9_STATUS.AsString = '3' then begin
            HWS_ClientModule.HWS_ClientDataSet_A901.Locate('A9_CODIGO',HWS_CodigoCheck,[]);
            MessageDlg('Não é possível revisar um CheckList que possui revisões em aberto.',mtError,[mbOK],0);
            Exit;
         end;
      end;
      // Verifica se existe amarracao de checklist X tipos de implementos.
      // Por que se for um novo essa amarracao nao existe, portando nao tem o porque revisar
      HWS_ClientModule.HWS_ClientDataSet_AA01.Refresh;
      if not HWS_ClientModule.HWS_ClientDataSet_AA01.Locate('AA_CODCHK',HWS_CodigoCheck,[]) then begin
         MessageDlg('Não é possível revisar um CheckList que ainda não possui relacionamentos.',mtInformation,[mbOK],0);
         Exit;
      end;
      HWS_ClientModule.HWS_SqlServerMethod_F_HWS_RevisarCheckList.ParamByName('HWS_Codigo').AsString := HWS_ClientModule.HWS_ClientDataSet_A901A9_CODIGO.AsString;
      HWS_ClientModule.HWS_SqlServerMethod_F_HWS_RevisarCheckList.ExecuteMethod;
      HWS_Retorno := (HWS_ClientModule.HWS_SqlServerMethod_F_HWS_RevisarCheckList.ParamByName('Retorno').AsObject as TJSONArray);
      if HWS_Retorno.Get(0).Value = 'N' then
         MessageDlg(HWS_Retorno.Get(1).Value,mtError,[mbOK],0);
      if HWS_ClientModule.HWS_ClientDataSet_A901.State in [dsBrowse] then
         HWS_ClientModule.HWS_ClientDataSet_A901.Refresh;
      if HWS_ClientModule.HWS_ClientDataSet_AA01.State in [dsBrowse] then
         HWS_ClientModule.HWS_ClientDataSet_AA01.Refresh;
      if HWS_ClientModule.HWS_ClientDataSet_AB01.State in [dsBrowse] then
         HWS_ClientModule.HWS_ClientDataSet_AB01.Refresh;
      if HWS_ClientModule.HWS_ClientDataSet_AC01.State in [dsBrowse] then
         HWS_ClientModule.HWS_ClientDataSet_AC01.Refresh;
      if HWS_ClientModule.HWS_ClientDataSet_AD01.State in [dsBrowse] then
         HWS_ClientModule.HWS_ClientDataSet_AD01.Refresh;
      if HWS_ClientModule.HWS_ClientDataSet_AE01.State in [dsBrowse] then
         HWS_ClientModule.HWS_ClientDataSet_AE01.Refresh;
      if HWS_ClientModule.HWS_ClientDataSet_AF01.State in [dsBrowse] then
         HWS_ClientModule.HWS_ClientDataSet_AF01.Refresh;
      if HWS_ClientModule.HWS_ClientDataSet_AG01.State in [dsBrowse] then
         HWS_ClientModule.HWS_ClientDataSet_AG01.Refresh;
      if HWS_ClientModule.HWS_ClientDataSet_AH01.State in [dsBrowse] then
         HWS_ClientModule.HWS_ClientDataSet_AH01.Refresh;
      if HWS_ClientModule.HWS_ClientDataSet_AI01.State in [dsBrowse] then
         HWS_ClientModule.HWS_ClientDataSet_AI01.Refresh;
      if HWS_ClientModule.HWS_ClientDataSet_AJ01.State in [dsBrowse] then
         HWS_ClientModule.HWS_ClientDataSet_AJ01.Refresh;
   end else begin
      MessageDlg('Só é possível revisar checklists ativos.',mtInformation,[mbOK],0);
   end;
end;

procedure THWS_Form_CheckList.BitBtn5Click(Sender: TObject);
begin
   Close;
end;

procedure THWS_Form_CheckList.BitBtn6Click(Sender: TObject);
var HWS_Efetivar: Boolean;
begin
   // 0 - Novo
   // 1 - Ativos
   // 2 - Já Revisados
   // 3 - Em Revisão
   HWS_Efetivar := False;
   if (HWS_ClientModule.HWS_ClientDataSet_A901A9_STATUS.AsString = '0') and (Trim(HWS_ClientModule.HWS_ClientDataSet_A901A9_CODREV.AsString) = '') then begin
      // Deixa efetivar pois é o primeiro checklist
      HWS_Efetivar := True;
   end else if (HWS_ClientModule.HWS_ClientDataSet_A901A9_STATUS.AsString = '3') then begin
      // Nao Deixa efetivar pois ja foi revisado
      HWS_Efetivar := True;
   end;
   HWS_ClientModule.HWS_ClientDataSet_AA01.Refresh;
   if not HWS_ClientModule.HWS_ClientDataSet_AA01.Locate('AA_CODCHK',HWS_ClientModule.HWS_ClientDataSet_A901A9_CODIGO.AsInteger,[]) then begin
      MessageDlg('Não é possível revisar um CheckList que ainda não possui relacionamentos.',mtInformation,[mbOK],0);
      Exit;
   end;
   if HWS_Efetivar then begin
      if (MessageDlg('Ao Efetivar a revisão do checklist ' + Chr(13) +
                     HWS_ClientModule.HWS_ClientDataSet_A901A9_DESC.AsString + Chr(13) +
                     'não será possível mais alterá-lo. Para poder alterá-lo você precisa revisá-lo novamente.' + Chr(13) +
                     'Tem certeza que deseja efetivar a revisão deste CheckList?',mtInformation,[mbYes,mbNO],0) = mrYes) then begin
         HWS_ClientModule.HWS_ClientDataSet_A901.Edit;
         HWS_ClientModule.HWS_ClientDataSet_A901A9_STATUS.AsString := '1';
         HWS_ClientModule.HWS_ClientDataSet_A901.Post;
         if HWS_ClientModule.HWS_ClientDataSet_A901.Locate('A9_CODIGO',HWS_ClientModule.HWS_ClientDataSet_A901A9_CODREV.AsInteger,[]) then begin
            HWS_ClientModule.HWS_ClientDataSet_A901.Edit;
            HWS_ClientModule.HWS_ClientDataSet_A901A9_STATUS.AsString := '2';
            HWS_ClientModule.HWS_ClientDataSet_A901.Post;
         end;
         HWS_ClientModule.HWS_ClientDataSet_A901.ApplyUpdates(-1);
      end;
   end else
      MessageDlg('Só é possível efetivar checklists em revisão.',mtInformation,[mbOK],0);
end;

procedure THWS_Form_CheckList.HWS_DBGrid_CheckListsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var CorAtual: TColor;
begin
   CorAtual := HWS_DBGrid_CheckLists.Canvas.Brush.Color;
   if Column.FieldName = 'A9_STATUS' then begin
      Column.Title.Caption := '';
      if Column.Field.AsString = '0' then begin
         // Novo
         HWS_DBGrid_CheckLists.Canvas.Brush.Color := clYellow;
         HWS_DBGrid_CheckLists.DefaultDrawColumnCell(Rect, DataCol, Column, State);
         HWS_DBGrid_CheckLists.Canvas.Brush.Color := CorAtual;
      end else if Column.Field.AsString = '1' then begin
         // É ativo
         HWS_DBGrid_CheckLists.Canvas.Brush.Color := clGreen;
         HWS_DBGrid_CheckLists.DefaultDrawColumnCell(Rect, DataCol, Column, State);
         HWS_DBGrid_CheckLists.Canvas.Brush.Color := CorAtual;
      end else if Column.Field.AsString = '2' then begin
         // Já revisados
         HWS_DBGrid_CheckLists.Canvas.Brush.Color := clGray;
         HWS_DBGrid_CheckLists.DefaultDrawColumnCell(Rect, DataCol, Column, State);
         HWS_DBGrid_CheckLists.Canvas.Brush.Color := CorAtual;
      end else if Column.Field.AsString = '3' then begin
         // Emm Revisão
         HWS_DBGrid_CheckLists.Canvas.Brush.Color := clRed;
         HWS_DBGrid_CheckLists.DefaultDrawColumnCell(Rect, DataCol, Column, State);
         HWS_DBGrid_CheckLists.Canvas.Brush.Color := CorAtual;
      end;
   end;
end;

procedure THWS_Form_CheckList.HWS_DBGrid_CheckListsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (Shift = [ssCtrl]) and (Key = 46) then
      Key := 0;
end;

procedure THWS_Form_CheckList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   HWS_ClientModule.HWS_ClientDataSet_A901.Close;
   HWS_ClientModule.HWS_ClientDataSet_AA01.Close;
end;

procedure THWS_Form_CheckList.FormCreate(Sender: TObject);
begin
   HWS_ClientModule.HWS_ClientDataSet_A901.Open;
   HWS_ClientModule.HWS_ClientDataSet_AA01.Open;
end;

end.
