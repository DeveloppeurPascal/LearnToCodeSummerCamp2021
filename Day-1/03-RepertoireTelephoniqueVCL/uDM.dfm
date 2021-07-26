object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 534
  Width = 969
  object FDMemTable1: TFDMemTable
    Active = True
    BeforeOpen = FDMemTable1BeforeOpen
    FieldDefs = <
      item
        Name = 'Nom'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Prenom'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Telephone'
        DataType = ftString
        Size = 50
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvPersistent, rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 48
    Top = 104
    object FDMemTable1Nom: TStringField
      FieldName = 'Nom'
      Size = 50
    end
    object FDMemTable1Prenom: TStringField
      FieldName = 'Prenom'
      Size = 50
    end
    object FDMemTable1Telephone: TStringField
      FieldName = 'Telephone'
      Size = 50
    end
  end
  object DataSource1: TDataSource
    DataSet = FDMemTable1
    Left = 56
    Top = 184
  end
end
