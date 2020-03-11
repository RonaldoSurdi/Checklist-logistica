unit uHWSCheckListClientCelularesAlteracao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Mask;

type
  THWS_Form_Celulares_Alteracao = class(TForm)
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    HWS_Edit_Descricao: TEdit;
    HWS_ComboBox_Status: TComboBox;
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    HWS_Edit_Numero: TEdit;
    Button1: TButton;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HWS_Form_Celulares_Alteracao: THWS_Form_Celulares_Alteracao;

implementation

uses uHWSFuncoes, uHWSCheckListClientDataModule;

{$R *.dfm}

procedure THWS_Form_Celulares_Alteracao.Button1Click(Sender: TObject);
begin
   if HWS_ComboBox_Status.Items.Names[HWS_ComboBox_Status.ItemIndex] = '2'   then begin
      if (MessageDlg('Se o celular for desativado não será mais possível ativá-lo. Tem certeza que deseja confirmar a alteração?',mtInformation,[mbYes,mbNO],0) = mrNo) then
         Exit;
   end;
   if F_HWS_ValidaDadosFormulario(HWS_ClientModule.HWS_ClientDataSet_HD01,'A','','',HWS_Form_Celulares_Alteracao) then begin
      try
         HWS_ClientModule.HWS_ClientDataSet_HD01.Edit;
         HWS_ClientModule.HWS_ClientDataSet_HD01HD_CHIP.AsString     := HWS_Edit_Numero.Text;
         HWS_ClientModule.HWS_ClientDataSet_HD01HD_DESC.AsString     := HWS_Edit_Descricao.Text;
         HWS_ClientModule.HWS_ClientDataSet_HD01HD_STATUS.AsString   := HWS_ComboBox_Status.Items.Names[HWS_ComboBox_Status.ItemIndex];
         HWS_ClientModule.HWS_ClientDataSet_HD01.Post;
         HWS_ClientModule.HWS_ClientDataSet_HD01.ApplyUpdates(-1);
         Close;
      except on E: Exception do
         MessageDlg(E.ToString,mtError,[mbOK],0);
      end;
   end;
end;

procedure THWS_Form_Celulares_Alteracao.Button2Click(Sender: TObject);
begin
   Close;
end;

procedure THWS_Form_Celulares_Alteracao.FormCreate(Sender: TObject);
begin
   HWS_Edit_Numero.Text          := HWS_ClientModule.HWS_ClientDataSet_HD01HD_CHIP.AsString;
   HWS_Edit_Descricao.Text       := HWS_ClientModule.HWS_ClientDataSet_HD01HD_DESC.AsString;
   HWS_ComboBox_Status.ItemIndex := HWS_ComboBox_Status.Items.IndexOfName(HWS_ClientModule.HWS_ClientDataSet_HD01HD_STATUS.AsString);
end;

end.
