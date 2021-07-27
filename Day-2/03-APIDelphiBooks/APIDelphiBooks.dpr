program APIDelphiBooks;

uses
  System.StartUpCopy,
  FMX.Forms,
  ListeDesLivres in 'ListeDesLivres.pas' {Form1},
  u_download in 'u_download.pas',
  DetailDuLivre in 'DetailDuLivre.pas' {frmDetail};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfrmDetail, frmDetail);
  Application.Run;
end.
