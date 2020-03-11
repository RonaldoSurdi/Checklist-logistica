unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Data.DB;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses uHWSCheckListClientDataModule, uHWSCheckListClientClientClassesRest;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var foto: TMemoryStream;
begin
   foto := TMemoryStream.Create;
   Image1.Picture.Graphic.SaveToStream(foto);
   foto.Position := 0;
   HWS_ClientModule.HWS_ServerMethodsClient.F_HWS_RecebeImagens_Cache(foto);
end;


end.
