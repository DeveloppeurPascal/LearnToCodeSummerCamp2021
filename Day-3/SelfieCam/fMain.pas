unit fMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Media,
  FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts,
  FMX.Filter.Effects, FMX.Effects, System.Messaging, System.Actions,
  FMX.ActnList, FMX.StdActns, FMX.MediaLibrary.Actions;

type
  TfrmMain = class(TForm)
    CameraComponent1: TCameraComponent;
    Image1: TImage;
    btnPlayPause: TButton;
    ToonEffect1: TToonEffect;
    RippleEffect1: TRippleEffect;
    TilerEffect1: TTilerEffect;
    GridPanelLayout1: TGridPanelLayout;
    Circle1: TCircle;
    Circle2: TCircle;
    Circle3: TCircle;
    Circle4: TCircle;
    WrapEffect1: TWrapEffect;
    btnShare: TButton;
    ActionList1: TActionList;
    ShowShareSheetAction1: TShowShareSheetAction;
    procedure CameraComponent1SampleBufferReady(Sender: TObject;
      const ATime: TMediaTime);
    procedure btnPlayPauseClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Circle1Click(Sender: TObject);
    procedure Circle2Click(Sender: TObject);
    procedure Circle3Click(Sender: TObject);
    procedure Circle4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ShowShareSheetAction1BeforeExecute(Sender: TObject);
    procedure btnShareClick(Sender: TObject);
  private
    { Déclarations privées }
    FSavedCameraActive: boolean;
    procedure ActiveCamera;
    procedure StopCamera;
    procedure ApplicationEventChangedHandler(const Sender: TObject;
      const AMessage: TMessage);
  public
    { Déclarations publiques }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

uses
  System.Permissions, FMX.DialogService, FMX.Platform;

procedure TfrmMain.ActiveCamera;
begin
  CameraComponent1.Active := true;
  btnPlayPause.Text := 'Stop';
  GridPanelLayout1.Visible := false;
  btnShare.Visible := false;
  for var c in Image1.Children do
    if (c is teffect) then
      (c as teffect).Enabled := false;
end;

procedure TfrmMain.ApplicationEventChangedHandler(const Sender: TObject;
  const AMessage: TMessage);
begin
  case TApplicationEventMessage(AMessage).Value.Event of
    TApplicationEvent.WillBecomeInactive:
      begin
        FSavedCameraActive := CameraComponent1.Active;
        CameraComponent1.Active := false;
      end;
    TApplicationEvent.BecameActive:
      CameraComponent1.Active := FSavedCameraActive;
  end;
end;

procedure TfrmMain.btnPlayPauseClick(Sender: TObject);
begin
  if CameraComponent1.Active then
  begin
    StopCamera;
  end
  else
    PermissionsService.RequestPermissions(['android.permission.CAMERA'],
      procedure(const APermissions: TArray<string>;
        const AGrantResults: TArray<TPermissionStatus>)
      begin
        if (length(AGrantResults) = 1) and
          (AGrantResults[0] = TPermissionStatus.Granted) then
        begin
          ActiveCamera;
        end
        else
          TDialogService.showmessage
            ('Il me faut la caméra pour prendre des photos.');
      end,
      procedure(const APermissions: TArray<string>;
        const APostRationaleProc: TProc)
      begin
        TDialogService.showmessage
          ('Coco, il me faut la caméra pour te photographier !',
          procedure(const AResult: TModalResult)
          begin
            APostRationaleProc;
          end);
      end);
end;

procedure TfrmMain.btnShareClick(Sender: TObject);
begin
  ShowShareSheetAction1.Execute;
end;

procedure TfrmMain.CameraComponent1SampleBufferReady(Sender: TObject;
const ATime: TMediaTime);
begin
  CameraComponent1.SampleBufferToBitmap(Image1.Bitmap, true);
end;

procedure TfrmMain.Circle1Click(Sender: TObject);
begin
  WrapEffect1.Enabled := not WrapEffect1.Enabled;
end;

procedure TfrmMain.Circle2Click(Sender: TObject);
begin
  ToonEffect1.Enabled := not ToonEffect1.Enabled;
end;

procedure TfrmMain.Circle3Click(Sender: TObject);
begin
  TilerEffect1.Enabled := not TilerEffect1.Enabled;
end;

procedure TfrmMain.Circle4Click(Sender: TObject);
begin
  RippleEffect1.Enabled := not RippleEffect1.Enabled;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  StopCamera;
  TMessageManager.DefaultManager.SubscribeToMessage(TApplicationEventMessage,
    ApplicationEventChangedHandler);
end;

procedure TfrmMain.Image1Click(Sender: TObject);
begin
  btnPlayPause.Text := 'Play';
end;

procedure TfrmMain.ShowShareSheetAction1BeforeExecute(Sender: TObject);
begin
  // droit "partage de fichiers sécurisé" nécessaire sinon erreur Java à la con
  // => à activer en options de projet / droit / Android
  ShowShareSheetAction1.Bitmap.Assign(Image1.MakeScreenshot);
end;

procedure TfrmMain.StopCamera;
begin
  CameraComponent1.Active := false;
  btnPlayPause.Text := 'Play';
  GridPanelLayout1.Visible := true;
  btnShare.Visible := true;
end;

end.
