unit uDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Stan.StorageXML, FireDAC.Stan.StorageBin;

type
  TDataModule1 = class(TDataModule)
    FDMemTable1: TFDMemTable;
    FDMemTable1Nom: TStringField;
    FDMemTable1Prenom: TStringField;
    FDMemTable1Telephone: TStringField;
    DataSource1: TDataSource;
    procedure FDMemTable1BeforeOpen(DataSet: TDataSet);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

uses
  System.ioutils;

procedure TDataModule1.FDMemTable1BeforeOpen(DataSet: TDataSet);
begin
  FDMemTable1.ResourceOptions.PersistentFileName :=
    tpath.combine(tpath.GetDocumentsPath, 'MaBaseDuRepertoireTelephonique.xml');
  FDMemTable1.ResourceOptions.persistent := true;
end;

end.
