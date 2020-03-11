unit uHWSCheckListClientUsuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.Buttons;

type
  THWS_Form_Usuarios = class(TForm)
    GroupBox1: TGroupBox;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    HWS_DBGrid_UsuariosSistema: TDBGrid;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    HWS_BitBtn_Incluir_Sistema: TBitBtn;
    HWS_BitBtn_Alterar_Sistema: TBitBtn;
    HWS_DBGrid_UsuariosMobile: TDBGrid;
    Panel2: TPanel;
    HWS_BitBtn_Incluir_Mobile: TBitBtn;
    HWS_BitBtn_Alterar_Mobile: TBitBtn;
    HWS_Sair: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure HWS_SairClick(Sender: TObject);
    procedure HWS_BitBtn_Incluir_SistemaClick(Sender: TObject);
    procedure HWS_BitBtn_Alterar_SistemaClick(Sender: TObject);
    procedure HWS_BitBtn_Incluir_MobileClick(Sender: TObject);
    procedure HWS_BitBtn_Alterar_MobileClick(Sender: TObject);
    procedure HWS_DBGrid_UsuariosSistemaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure HWS_DBGrid_UsuariosMobileKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HWS_Form_Usuarios: THWS_Form_Usuarios;

implementation

uses uHWSCheckListClientAutenticacao,uHWSCheckListClientDataModule,
  uHWSCheckListClientUsuariosSistemasInclusao,
  uHWSCheckListClientUsuariosSistemasAlteracao,
  uHWSCheckListClientUsuariosMobileInclusao,
  uHWSCheckListClientUsuariosMobileAlteracao;

{$R *.dfm}

procedure THWS_Form_Usuarios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   HWS_ClientModule.HWS_ClientDataSet_HG01.Close;
   HWS_ClientModule.HWS_ClientDataSet_HI01.Close;
end;

procedure THWS_Form_Usuarios.FormCreate(Sender: TObject);
begin
   HWS_ClientModule.HWS_ClientDataSet_HG01.Open;
   HWS_ClientModule.HWS_ClientDataSet_HG01.Filtered := False;
   HWS_ClientModule.HWS_ClientDataSet_HG01.Filter := 'HG_CODEMP = ' + QuotedStr(HWS_PUBLIC_CODCLIENTE);
   HWS_ClientModule.HWS_ClientDataSet_HG01.Filtered := True;
   //
   HWS_ClientModule.HWS_ClientDataSet_HI01.Open;
   HWS_ClientModule.HWS_ClientDataSet_HI01.Filtered := False;
   HWS_ClientModule.HWS_ClientDataSet_HI01.Filter := 'HI_CODEMP = ' + QuotedStr(HWS_PUBLIC_CODCLIENTE);
   HWS_ClientModule.HWS_ClientDataSet_HI01.Filtered := True;
   //
   PageControl1.ActivePageIndex := 0;
end;

procedure THWS_Form_Usuarios.HWS_BitBtn_Alterar_MobileClick(Sender: TObject);
begin
   Application.CreateForm(THWS_Form_Usuarios_Mobile_Alteracao, HWS_Form_Usuarios_Mobile_Alteracao);
   HWS_Form_Usuarios_Mobile_Alteracao.ShowModal;
end;

procedure THWS_Form_Usuarios.HWS_BitBtn_Alterar_SistemaClick(Sender: TObject);
begin
   Application.CreateForm(THWS_Form_Usuarios_Sistema_Alteracao, HWS_Form_Usuarios_Sistema_Alteracao);
   HWS_Form_Usuarios_Sistema_Alteracao.ShowModal;
end;

procedure THWS_Form_Usuarios.HWS_BitBtn_Incluir_MobileClick(Sender: TObject);
begin
   Application.CreateForm(THWS_Form_Usuarios_Mobile_Inclusao, HWS_Form_Usuarios_Mobile_Inclusao);
   HWS_Form_Usuarios_Mobile_Inclusao.ShowModal;
end;

procedure THWS_Form_Usuarios.HWS_BitBtn_Incluir_SistemaClick(Sender: TObject);
begin
   Application.CreateForm(THWS_Form_Usuario_Sistema_Inclusao, HWS_Form_Usuario_Sistema_Inclusao);
   HWS_Form_Usuario_Sistema_Inclusao.ShowModal;
end;

procedure THWS_Form_Usuarios.HWS_DBGrid_UsuariosMobileKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if (Shift = [ssCtrl]) and (Key = 46) then
      Key := 0;
end;

procedure THWS_Form_Usuarios.HWS_DBGrid_UsuariosSistemaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if (Shift = [ssCtrl]) and (Key = 46) then
      Key := 0;
end;

procedure THWS_Form_Usuarios.HWS_SairClick(Sender: TObject);
begin
   Close;
end;

end.
