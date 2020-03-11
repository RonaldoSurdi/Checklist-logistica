unit uHWSCheckListClientCelulares;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids;

type
  THWS_Form_Celulares = class(TForm)
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Pesquisar: TButton;
    Button1: TButton;
    Button2: TButton;
    Button4: TButton;
    StatusBar1: TStatusBar;
    procedure Button4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HWS_Form_Celulares: THWS_Form_Celulares;

implementation

uses uHWSCheckListClientDataModule, uHWSCheckListClientCelularesInclusao, uHWSCheckListClientCelularesAlteracao, uHWSCheckListClientAutenticacao;

{$R *.dfm}

procedure THWS_Form_Celulares.Button1Click(Sender: TObject);
begin
   Application.CreateForm(THWS_Form_Celulares_Inclusao, HWS_Form_Celulares_Inclusao);
   HWS_Form_Celulares_Inclusao.ShowModal;
end;

procedure THWS_Form_Celulares.Button2Click(Sender: TObject);
begin
   if (HWS_ClientModule.HWS_ClientDataSet_HD01HD_STATUS.AsString <> '1') then begin
      MessageDlg('Só é possível alterar celulares com o status 1=Ativo',mtInformation,[mbOK],0);
      Exit;
   end;
   Application.CreateForm(THWS_Form_Celulares_Alteracao, HWS_Form_Celulares_Alteracao);
   HWS_Form_Celulares_Alteracao.ShowModal;
end;

procedure THWS_Form_Celulares.Button4Click(Sender: TObject);
begin
   Close;
end;

procedure THWS_Form_Celulares.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (Shift = [ssCtrl]) and (Key = 46) then
      Key := 0;
end;

procedure THWS_Form_Celulares.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
   HWS_ClientModule.HWS_ClientDataSet_HD01.Close;
end;

procedure THWS_Form_Celulares.FormCreate(Sender: TObject);
begin
   HWS_ClientModule.HWS_ClientDataSet_HD01.Open;
   HWS_ClientModule.HWS_ClientDataSet_HD01.Filtered := False;
   HWS_ClientModule.HWS_ClientDataSet_HD01.Filter   := 'HD_CODCLI = ' + QuotedStr(HWS_PUBLIC_CODCLIENTE);
   HWS_ClientModule.HWS_ClientDataSet_HD01.Filtered := True;
end;

end.
