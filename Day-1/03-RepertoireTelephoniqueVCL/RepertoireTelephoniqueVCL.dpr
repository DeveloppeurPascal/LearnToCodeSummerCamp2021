program RepertoireTelephoniqueVCL;

uses
  Vcl.Forms,
  fContactListe in 'fContactListe.pas' {frmListe},
  fContactModifie in 'fContactModifie.pas' {frmModifier},
  fContactAffiche in 'fContactAffiche.pas' {frmAffichage},
  uDM in 'uDM.pas' {DataModule1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TfrmListe, frmListe);
  Application.CreateForm(TfrmModifier, frmModifier);
  Application.CreateForm(TfrmAffichage, frmAffichage);
  Application.Run;
end.
