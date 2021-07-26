object frmAffichage: TfrmAffichage
  Left = 0
  Top = 0
  Caption = 'D'#233'tail du contact'
  ClientHeight = 104
  ClientWidth = 266
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    266
    104)
  PixelsPerInch = 96
  TextHeight = 13
  object Nom: TDBText
    Left = 0
    Top = 0
    Width = 266
    Height = 17
    Align = alTop
    DataField = 'Nom'
    DataSource = DataModule1.DataSource1
    ExplicitLeft = 296
    ExplicitTop = 160
    ExplicitWidth = 65
  end
  object Prenom: TDBText
    Left = 0
    Top = 17
    Width = 266
    Height = 17
    Align = alTop
    DataField = 'Prenom'
    DataSource = DataModule1.DataSource1
    ExplicitTop = 23
    ExplicitWidth = 570
  end
  object Telephone: TDBText
    Left = 0
    Top = 34
    Width = 266
    Height = 17
    Align = alTop
    DataField = 'Telephone'
    DataSource = DataModule1.DataSource1
    ExplicitLeft = 312
    ExplicitTop = 176
    ExplicitWidth = 65
  end
  object BitBtn1: TBitBtn
    Left = 183
    Top = 71
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Kind = bkClose
    NumGlyphs = 2
    TabOrder = 0
  end
end
