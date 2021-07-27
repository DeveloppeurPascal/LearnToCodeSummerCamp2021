unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Memo.Types,
  FMX.Layouts, FMX.ScrollBox, FMX.Memo, FMX.StdCtrls, FMX.Controls.Presentation,
  FMX.Edit, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdWhois,
  FMX.Effects;

type
  TForm1 = class(TForm)
    IdWhois1: TIdWhois;
    Edit1: TEdit;
    Button1: TButton;
    Memo1: TMemo;
    Layout1: TLayout;
    Edit1EnErreur: TGlowEffect;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit1ChangeTracking(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.Button1Click(Sender: TObject);
begin
  if Edit1.Text.trim.IsEmpty then
  begin
    Edit1EnErreur.Enabled := true;
    showmessage('Veuillez saisir un nom de domaine.');
    Edit1.SetFocus;
    exit;
  end;

  Memo1.lines.Clear;
  Memo1.lines.Add(IdWhois1.WhoIs(Edit1.Text));
end;

procedure TForm1.Edit1ChangeTracking(Sender: TObject);
begin
  Edit1EnErreur.Enabled := Edit1.Text.trim.IsEmpty;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Edit1EnErreur.Enabled := false;
end;

end.
