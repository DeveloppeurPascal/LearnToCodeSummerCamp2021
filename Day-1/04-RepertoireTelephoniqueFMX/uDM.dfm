object DataModule2: TDataModule2
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 274
  Width = 418
  object FDMemTable1: TFDMemTable
    BeforeOpen = FDMemTable1BeforeOpen
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvPersistent, rvSilentMode]
    ResourceOptions.Persistent = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 88
    Top = 56
    object FDMemTable1Nom: TStringField
      FieldName = 'Nom'
      Origin = 'Nom'
      Size = 50
    end
    object FDMemTable1Prenom: TStringField
      FieldName = 'Prenom'
      Origin = 'Prenom'
      Size = 50
    end
    object FDMemTable1Telephone: TStringField
      FieldName = 'Telephone'
      Origin = 'Telephone'
      Size = 50
    end
  end
  object FDStanStorageXMLLink1: TFDStanStorageXMLLink
    Left = 160
    Top = 96
  end
end
