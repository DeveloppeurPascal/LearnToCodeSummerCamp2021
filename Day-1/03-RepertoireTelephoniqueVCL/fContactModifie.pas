unit fContactModifie;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uDM, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.Buttons;

type
  TfrmModifier = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    edtNom: TDBEdit;
    edtPrenom: TDBEdit;
    edtTelephone: TDBEdit;
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  frmModifier: TfrmModifier;

implementation

{$R *.dfm}

end.
