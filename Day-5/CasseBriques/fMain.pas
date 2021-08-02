unit fMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.Objects;

type
  TfrmMain = class(TForm)
    Rebords: TRectangle;
    ZoneDeJeu: TRectangle;
    Raquette: TRectangle;
    Balle: TRectangle;
    Mur: TLayout;
    btnJouer: TButton;
    BoucleDeJeu: TTimer;
    lblScore: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure btnJouerClick(Sender: TObject);
    procedure BoucleDeJeuTimer(Sender: TObject);
  private
    FRaquetteVX: single;
    FPartieDemarree: boolean;
    FBalleVX: single;
    FBalleVY: single;
    Fscore: integer;
    procedure SetPartieDemarree(const Value: boolean);
    procedure SetRaquetteVX(const Value: single);
    procedure SetBalleVX(const Value: single);
    procedure SetBalleVY(const Value: single);
    procedure Setscore(const Value: integer);
    { Déclarations privées }
  public
    { Déclarations publiques }
    property RaquetteVX: single read FRaquetteVX write SetRaquetteVX;
    property BalleVX: single read FBalleVX write SetBalleVX;
    property BalleVY: single read FBalleVY write SetBalleVY;
    property PartieDemarree: boolean read FPartieDemarree
      write SetPartieDemarree;
    property score: integer read Fscore write Setscore;
    procedure ArreterPartie;
    procedure FinDePartie;
  end;

const
  VitesseMax = 10;
  CNbBriquesEnLargeur = 15;
  CNbBriquesEnHauteur = 10;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

procedure TfrmMain.ArreterPartie;
begin
  PartieDemarree := false;
  btnJouer.Visible := true;
end;

procedure TfrmMain.BoucleDeJeuTimer(Sender: TObject);
var
  i: integer;
  brique: TRectangle;
begin
  if not FPartieDemarree then
    exit;

  // Déplacement raquette
  Raquette.Position.x := Raquette.Position.x + FRaquetteVX;
  if Raquette.Position.x < 0 then
  begin
    Raquette.Position.x := 0;
    RaquetteVX := 0;
  end
  else if Raquette.Position.x > ZoneDeJeu.Width - Raquette.Width then
  begin
    Raquette.Position.x := ZoneDeJeu.Width - Raquette.Width;
    RaquetteVX := 0;
  end;

  // Déplacement balle
  Balle.Position.x := Balle.Position.x + FBalleVX;
  if Balle.Position.x < 0 then
  begin
    Balle.Position.x := 0;
    BalleVX := -BalleVX * 1.1;
  end
  else if Balle.Position.x > ZoneDeJeu.Width - Balle.Width then
  begin
    Balle.Position.x := ZoneDeJeu.Width - Balle.Width;
    BalleVX := -BalleVX * 1.1;
  end;
  Balle.Position.y := Balle.Position.y + FBalleVY;
  if Balle.Position.y < 0 then
  begin
    Balle.Position.y := 0;
    BalleVY := -BalleVY * 1.1;
  end
  else if Balle.Position.y > Raquette.Position.y - Balle.height then
  begin // on sort de l'écran ou touche la raquette
    if IntersectRect(Balle.BoundsRect, Raquette.BoundsRect) then
    begin
      Balle.Position.y := Raquette.Position.y - Balle.height;
      BalleVX := BalleVX * 0.9;
      BalleVY := -BalleVY * 0.9;
    end
    else
      FinDePartie;
  end;

  // Test collision entre balle et briques du mur
  for i := Mur.ChildrenCount - 1 downto 0 do
    if (Mur.Children[i] is TRectangle) then
    begin
      brique := (Mur.Children[i] as TRectangle);
      if IntersectRect(Balle.BoundsRect, brique.BoundsRect) then
      begin
        // La balle touche une brique
        score := score + brique.tag;
        if (Balle.Position.x + Balle.height > brique.Position.x) and
          (Balle.Position.x < brique.Position.x) then
          BalleVX := -BalleVX
        else if (Balle.Position.x < brique.Position.x + brique.Width) and
          (Balle.Position.x + Balle.Width > brique.Position.x + brique.Width)
        then
          BalleVX := -BalleVX;
        if (Balle.Position.y + Balle.height > brique.Position.y) and
          (Balle.Position.y < brique.Position.y) then
          BalleVY := -BalleVY
        else if (Balle.Position.y < brique.Position.y + brique.height) and
          (Balle.Position.y + Balle.height > brique.Position.y + brique.height)
        then
          BalleVY := -BalleVY;
        brique.free;
      end;
    end;
end;

procedure TfrmMain.btnJouerClick(Sender: TObject);
var
  i, j: integer;
  brique: TRectangle;
  largeur, hauteur: single;
begin
  btnJouer.Visible := false;
  PartieDemarree := true;
  score := 0;
  // init position et vitesse raquette
  Raquette.Position.x := (ZoneDeJeu.Width - Raquette.Width) / 2;
  Raquette.Position.y := ZoneDeJeu.height - (Raquette.height / 2);
  RaquetteVX := 0;
  // init position et vitesse balle
  Balle.Position.x := (ZoneDeJeu.Width - Balle.Width) / 2;
  // balle.Position.x :=Raquette.Position.x + (raquette.width - balle.width) / 2;
  Balle.Position.y := Raquette.Position.y - Balle.height;
  BalleVX := (random(VitesseMax * 2 + 1) - VitesseMax) / 2;
  BalleVY := -1;
  // on vide le mur au cas où
  while Mur.ChildrenCount > 0 do
    Mur.Children[0].free;
  // on ajoute des briques
  largeur := (Mur.Width - 20) / CNbBriquesEnLargeur;
  hauteur := (Mur.height - 20) / CNbBriquesEnHauteur;
  for i := 0 to CNbBriquesEnLargeur - 1 do
    for j := 0 to CNbBriquesEnHauteur - 1 do
    begin
      if (j mod 2 = 1) then
      begin
        if i = CNbBriquesEnLargeur - 1 then
          continue;
        brique := TRectangle.Create(self);
        brique.Position.x := 10 + i * largeur + largeur / 2;
      end
      else
      begin
        brique := TRectangle.Create(self);
        brique.Position.x := 10 + i * largeur;
      end;
      brique.Position.y := 10 + j * hauteur;
      brique.Parent := Mur;
      brique.Width := largeur;
      brique.height := hauteur;
      brique.tag := random(50) + 1;
      case random(5) of
        0:
          brique.fill.Color := talphacolors.red;
        1:
          brique.fill.Color := talphacolors.green;
        2:
          brique.fill.Color := talphacolors.blue;
        3:
          brique.fill.Color := talphacolors.yellow;
      else
        brique.fill.Color := talphacolors.orange;
      end;
    end;
end;

procedure TfrmMain.FinDePartie;
begin
  ArreterPartie;
  showmessage('perdu');
end;

procedure TfrmMain.FormKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  if PartieDemarree then
  begin
    if Key in [vkescape, vkHardwareBack] then
    begin
      ArreterPartie;
      Key := 0;
    end
    else if Key = vkLeft then
    begin
      RaquetteVX := RaquetteVX - 1;
      Key := 0;
    end
    else if Key = vkright then
    begin
      RaquetteVX := RaquetteVX + 1;
      Key := 0;
    end;
  end
  else
  begin
    if Key in [vkescape] then
    begin
      close;
      Key := 0;
    end;
  end;
end;

procedure TfrmMain.SetBalleVX(const Value: single);
begin
  FBalleVX := Value;
end;

procedure TfrmMain.SetBalleVY(const Value: single);
begin
  FBalleVY := Value;
end;

procedure TfrmMain.SetPartieDemarree(const Value: boolean);
begin
  FPartieDemarree := Value;
end;

procedure TfrmMain.SetRaquetteVX(const Value: single);
begin
  if (Value < -VitesseMax) or (Value > VitesseMax) then
    exit;
  FRaquetteVX := Value;
end;

procedure TfrmMain.Setscore(const Value: integer);
begin
  Fscore := Value;
  lblScore.Text := 'Score : ' + Fscore.ToString;
end;

initialization

randomize;

end.
