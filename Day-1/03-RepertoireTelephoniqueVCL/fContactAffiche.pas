unit fContactAffiche;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uDM, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.DBCtrls;

type
  TfrmAffichage = class(TForm)
    Nom: TDBText;
    Prenom: TDBText;
    Telephone: TDBText;
    BitBtn1: TBitBtn;
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  frmAffichage: TfrmAffichage;

implementation

{$R *.dfm}

end.
