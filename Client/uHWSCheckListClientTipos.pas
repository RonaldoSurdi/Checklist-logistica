unit uHWSCheckListClientTipos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.Buttons, Data.DB;

type
  THWS_Form_Tipos = class(TForm)
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    StatusBar1: TStatusBar;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HWS_Form_Tipos: THWS_Form_Tipos;

implementation

uses uHWSCheckListClientDataModule;

{$R *.dfm}

procedure THWS_Form_Tipos.BitBtn1Click(Sender: TObject);
begin
   if HWS_ClientModule.HWS_ClientDataSet_AC01.Locate('AC_CODTIPO',HWS_ClientModule.HWS_ClientDataSet_AA01AA_CODIGO.AsInteger,[]) then begin
       MessageDlg('Não é possível excluir o tipo ' + HWS_ClientModule.HWS_ClientDataSet_AA01AA_DESC.AsString + '.' ,mtInformation,[mbOK],0);
       Exit;
   end;
   if (MessageDlg('Tem certeza que deseja excluir o tipo ' + HWS_ClientModule.HWS_ClientDataSet_AA01AA_DESC.AsString + '?',mtInformation,[mbYes,mbNO],0) = mrYes) then begin
      try
         HWS_ClientModule.HWS_ClientDataSet_AA01.Delete;
         HWS_ClientModule.HWS_ClientDataSet_AA01.ApplyUpdates(-1);
      except on E: Exception do
         MessageDlg(E.ToString,mtError,[mbOK],0);
      end;
   end;
end;

procedure THWS_Form_Tipos.BitBtn2Click(Sender: TObject);
begin
   Close;
end;

procedure THWS_Form_Tipos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if HWS_ClientModule.HWS_ClientDataSet_AA01.State in [dsInsert, dsEdit] then
      HWS_ClientModule.HWS_ClientDataSet_AA01.Post;
   HWS_ClientModule.HWS_ClientDataSet_AA01.Close;
   HWS_ClientModule.HWS_ClientDataSet_AC01.Close;
end;

procedure THWS_Form_Tipos.FormCreate(Sender: TObject);
begin
   HWS_ClientModule.HWS_ClientDataSet_AA01.Open;
   HWS_ClientModule.HWS_ClientDataSet_AC01.Open;
end;

end.
