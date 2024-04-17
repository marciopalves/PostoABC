object DmConexao: TDmConexao
  OnCreate = DataModuleCreate
  Height = 181
  Width = 328
  object FConn: TFDConnection
    Params.Strings = (
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Server=127.0.0.1'
      'Database=C:\projetos\delphi\Fortes\BD\FORTESAPP.FDB'
      'Port=3050'
      'CharacterSet=ISO8859_2'
      'DriverID=FB')
    FormatOptions.AssignedValues = [fvMapRules]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <
      item
        SourceDataType = dtSingle
        TargetDataType = dtDouble
      end>
    LoginPrompt = False
    Left = 40
    Top = 24
  end
  object FDPhysFBDriverLink: TFDPhysFBDriverLink
    VendorLib = 'C:\projetos\delphi\Fortes\BD\fbclient.dll'
    Left = 40
    Top = 96
  end
  object FDGUIxWaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 128
    Top = 16
  end
end
