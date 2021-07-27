unit ListeDesLivres;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, REST.Types,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  System.Rtti, FMX.Grid.Style, Data.Bind.Controls, Data.Bind.EngExt,
  FMX.Bind.DBEngExt, FMX.Bind.Grid, System.Bindings.Outputs, FMX.Bind.Editors,
  Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope, FMX.Layouts,
  FMX.Bind.Navigator, FMX.Controls.Presentation, FMX.ScrollBox, FMX.Grid,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, REST.Response.Adapter,
  REST.Client, Data.Bind.ObjectScope, FMX.Objects, FMX.StdCtrls, FMX.WebBrowser;

type
  TForm1 = class(TForm)
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter;
    FDMemTable1: TFDMemTable;
    StringGrid1: TStringGrid;
    BindNavigator1: TBindNavigator;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    Image1: TImage;
    Label1: TLabel;
    FDMemTable1id: TFloatField;
    FDMemTable1name: TWideStringField;
    FDMemTable1url: TWideStringField;
    FDMemTable1thumb: TWideStringField;
    FDMemTable1lang: TWideStringField;
    FDMemTable1pubdate: TWideStringField;
    WebBrowser1: TWebBrowser;
    Button1: TButton;
    VertScrollBox1: TVertScrollBox;
    Layout1: TLayout;
    Layout2: TLayout;
    procedure FormCreate(Sender: TObject);
    procedure StringGrid1SelChanged(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses
  u_download, System.IOUtils, DetailDuLivre;

procedure TForm1.Button1Click(Sender: TObject);
begin
  frmdetail.charge(FDMemTable1.FieldByName('id').asinteger);
  frmdetail.Show;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  RESTRequest1.Execute;
end;

procedure TForm1.StringGrid1SelChanged(Sender: TObject);
var
  url_img: string;
  NomFichierImage: string;
begin
  url_img := FDMemTable1.FieldByName('thumb').asstring;
  Label1.Text := url_img.Substring(url_img.length - 30);
  NomFichierImage := tpath.GetTempFileName;
  tdownload_file.download(url_img, NomFichierImage,
    procedure
    begin
      Image1.Bitmap.LoadFromFile(NomFichierImage);
      Image1.Visible := true;
      tfile.Delete(NomFichierImage);
    end,
    procedure
    begin
      Image1.Visible := false;
      if tfile.Exists(NomFichierImage) then
        tfile.Delete(NomFichierImage);
    end);
  WebBrowser1.Navigate(FDMemTable1.FieldByName('url').asstring);
end;

end.
