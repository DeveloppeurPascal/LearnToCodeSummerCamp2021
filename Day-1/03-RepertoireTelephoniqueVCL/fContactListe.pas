unit fContactListe;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls, Vcl.DBCtrls,
  Vcl.Grids, Vcl.DBGrids, uDM, Vcl.StdCtrls;

type
  TfrmListe = class(TForm)
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    btnAfficheDetail: TButton;
    btnModifieContact: TButton;
    procedure btnAfficheDetailClick(Sender: TObject);
    procedure btnModifieContactClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  frmListe: TfrmListe;

implementation

{$R *.dfm}

uses fContactAffiche, fContactModifie;

procedure TfrmListe.btnAfficheDetailClick(Sender: TObject);
begin
  frmAffichage.Show;
end;

procedure TfrmListe.btnModifieContactClick(Sender: TObject);
begin
  if frmModifier.ShowModal = mrok then
    DataModule1.DataSource1.DataSet.post
  else
    DataModule1.DataSource1.DataSet.Cancel;
end;

end.
