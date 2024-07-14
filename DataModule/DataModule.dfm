object dmMain: TdmMain
  OnCreate = DataModuleCreate
  Height = 350
  Width = 400
  object FDConnection: TFDConnection
    LoginPrompt = False
    Left = 120
    Top = 32
  end
  object FDQuery: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT * FROM MyTable')
    Left = 120
    Top = 80
  end
  object FDPhysMSSQLDriverLink: TFDPhysMSSQLDriverLink
    DriverID = 'MSSQL'
    Left = 120
    Top = 128
  end
  object cdsAgencias: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'CodigoAgencia'
    Params = <>
  end
  object cdsContas: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'CodigoConta'
    Params = <>
  end
end
