program RepertoireTelephoniqueFMX;

uses
  System.StartUpCopy,
  FMX.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  uDM in 'uDM.pas' {DataModule2: TDataModule},
  uAffichage in 'uAffichage.pas' {frmAffichage},
  uModifier in 'uModifier.pas' {frmModifier};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDataModule2, DataModule2);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfrmAffichage, frmAffichage);
  Application.CreateForm(TfrmModifier, frmModifier);
  Application.Run;
end.
