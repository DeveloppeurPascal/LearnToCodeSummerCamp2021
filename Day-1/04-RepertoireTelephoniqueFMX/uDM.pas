unit uDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.StorageBin, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Stan.StorageXML;

type
  TDataModule2 = class(TDataModule)
    FDMemTable1: TFDMemTable;
    FDMemTable1Nom: TStringField;
    FDMemTable1Prenom: TStringField;
    FDMemTable1Telephone: TStringField;
    FDStanStorageXMLLink1: TFDStanStorageXMLLink;
    procedure FDMemTable1BeforeOpen(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
    procedure sauvegarde;
  end;

var
  DataModule2: TDataModule2;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}
{$R *.dfm}

uses
  System.ioutils;

procedure TDataModule2.DataModuleCreate(Sender: TObject);
begin
{$IFDEF MACOS}
  if tfile.Exists(tpath.combine(tpath.GetDocumentsPath,
    'MaBaseDuRepertoireTelephonique.xml')) then
    FDMemTable1.loadfromfile(tpath.combine(tpath.GetDocumentsPath,
      'MaBaseDuRepertoireTelephonique.xml'))
  else
    FDMemTable1.Open;
{$ELSE}
  FDMemTable1.Open;
{$ENDIF}
end;

procedure TDataModule2.FDMemTable1BeforeOpen(DataSet: TDataSet);
begin
{$IFDEF MACOS}
  // Semble ne pas exister sur MacOS !
  // (code non proposé par le débogueur)
{$ELSE}
  FDMemTable1.ResourceOptions.PersistentFileName :=
    tpath.combine(tpath.GetDocumentsPath, 'MaBaseDuRepertoireTelephonique.xml');
  FDMemTable1.ResourceOptions.persistent := true;
{$ENDIF}
end;

procedure TDataModule2.sauvegarde;
begin
  FDMemTable1.savetofile(tpath.combine(tpath.GetDocumentsPath,
    'MaBaseDuRepertoireTelephonique.xml'));
end;

end.
