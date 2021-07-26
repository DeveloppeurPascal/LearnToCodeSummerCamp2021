object frmListe: TfrmListe
  Left = 0
  Top = 0
  Caption = 'Liste des contacts'
  ClientHeight = 226
  ClientWidth = 967
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    967
    226)
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 967
    Height = 201
    Align = alClient
    DataSource = DataModule1.DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBNavigator1: TDBNavigator
    Left = 0
    Top = 201
    Width = 967
    Height = 25
    DataSource = DataModule1.DataSource1
    Align = alBottom
    TabOrder = 1
    ExplicitLeft = 208
    ExplicitTop = 160
    ExplicitWidth = 240
  end
  object btnAfficheDetail: TButton
    Left = 803
    Top = 170
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'D'#233'tail'
    TabOrder = 2
    OnClick = btnAfficheDetailClick
    ExplicitLeft = 781
    ExplicitTop = 243
  end
  object btnModifieContact: TButton
    Left = 884
    Top = 170
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Modifier'
    TabOrder = 3
    OnClick = btnModifieContactClick
    ExplicitLeft = 862
    ExplicitTop = 243
  end
end
