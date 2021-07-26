unit uModifier;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, uDM,
  System.Rtti, System.Bindings.Outputs, FMX.Bind.Editors, Data.Bind.EngExt,
  FMX.Bind.DBEngExt, FMX.StdCtrls, Data.Bind.Components, Data.Bind.DBScope,
  FMX.Controls.Presentation, FMX.Edit;

type
  TfrmModifier = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    btnOk: TButton;
    btnCancel: TButton;
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  frmModifier: TfrmModifier;

implementation

{$R *.fmx}

procedure TfrmModifier.btnCancelClick(Sender: TObject);
begin
  DataModule2.FDMemTable1.Cancel;
  close;
end;

procedure TfrmModifier.btnOkClick(Sender: TObject);
begin
  DataModule2.FDMemTable1.post;
  close;
end;

end.
