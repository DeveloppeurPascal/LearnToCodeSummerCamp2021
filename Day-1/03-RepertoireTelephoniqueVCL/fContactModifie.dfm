object frmModifier: TfrmModifier
  Left = 0
  Top = 0
  Caption = 'Modification du contact'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    635
    299)
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtn1: TBitBtn
    Left = 552
    Top = 266
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 0
  end
  object BitBtn2: TBitBtn
    Left = 456
    Top = 266
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 1
  end
  object edtNom: TDBEdit
    Left = 0
    Top = 0
    Width = 635
    Height = 21
    Align = alTop
    DataField = 'Nom'
    DataSource = DataModule1.DataSource1
    TabOrder = 2
    ExplicitLeft = 264
    ExplicitTop = 160
    ExplicitWidth = 121
  end
  object edtPrenom: TDBEdit
    Left = 0
    Top = 21
    Width = 635
    Height = 21
    Align = alTop
    DataField = 'Prenom'
    DataSource = DataModule1.DataSource1
    TabOrder = 3
    ExplicitLeft = 272
    ExplicitTop = 168
    ExplicitWidth = 121
  end
  object edtTelephone: TDBEdit
    Left = 0
    Top = 42
    Width = 635
    Height = 21
    Align = alTop
    DataField = 'Telephone'
    DataSource = DataModule1.DataSource1
    TabOrder = 4
    ExplicitLeft = 280
    ExplicitTop = 176
    ExplicitWidth = 121
  end
end
