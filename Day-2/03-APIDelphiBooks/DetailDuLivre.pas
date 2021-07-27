unit DetailDuLivre;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, REST.Types,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.Bind.EngExt, FMX.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs,
  FMX.Bind.Editors, Data.Bind.Components, Data.Bind.DBScope,
  FMX.Controls.Presentation, FMX.StdCtrls, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, REST.Response.Adapter, REST.Client,
  Data.Bind.ObjectScope;

type
  TfrmDetail = class(TForm)
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter;
    FDMemTable1: TFDMemTable;
    Label1: TLabel;
    Label2: TLabel;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkPropertyToFieldText: TLinkPropertyToField;
    LinkPropertyToFieldText2: TLinkPropertyToField;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
    procedure charge(IDLivre: integer);
  end;

var
  frmDetail: TfrmDetail;

implementation

{$R *.fmx}
{ TfrmDetail }

procedure TfrmDetail.Button1Click(Sender: TObject);
begin
  close;
end;

procedure TfrmDetail.charge(IDLivre: integer);
begin
  RESTRequest1.Params.ParameterByName('ID').Value := IDLivre.ToString;
  RESTRequest1.Execute;
end;

end.
