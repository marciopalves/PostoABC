object frmRelCupom: TfrmRelCupom
  Left = 0
  Top = 0
  ClientHeight = 442
  ClientWidth = 771
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object relCupom: TRLReport
    Left = -8
    Top = -8
    Width = 794
    Height = 1123
    DataSource = dsRel
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Title = 'Cupom de Abastecimento'
    object RLBandTitle: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 83
      BandType = btTitle
      object RLblEmpresa: TRLLabel
        Left = 271
        Top = 25
        Width = 80
        Height = 18
        Caption = 'Posto ABC'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLlblCnpj: TRLLabel
        Left = 241
        Top = 4
        Width = 174
        Height = 18
        Caption = 'Cnpj.:45.102.321/0001-35'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLSystemInfo: TRLSystemInfo
        Left = 83
        Top = 67
        Width = 37
        Height = 16
        Info = itNow
        Text = ''
      end
      object RLLabel1: TRLLabel
        Left = 5
        Top = 67
        Width = 76
        Height = 16
        Caption = 'Gerado em.:'
      end
      object RLLabel9: TRLLabel
        Left = 651
        Top = 66
        Width = 35
        Height = 16
        Caption = 'Coo.:'
      end
      object RLDBCoo: TRLDBText
        Left = 688
        Top = 66
        Width = 27
        Height = 16
        DataField = 'ID_ABASTECIMENTO'
        DataSource = dsRel
        Text = ''
      end
    end
    object RLBandHeader: TRLBand
      Left = 38
      Top = 121
      Width = 718
      Height = 40
      BandType = btColumnHeader
      object RLLabel3: TRLLabel
        Left = 6
        Top = 22
        Width = 62
        Height = 16
        Caption = 'Descri'#231#227'o'
      end
      object RLLabel4: TRLLabel
        Left = 185
        Top = 22
        Width = 25
        Height = 16
        Caption = 'Qtd'
      end
      object RLLabel5: TRLLabel
        Left = 265
        Top = 22
        Width = 64
        Height = 16
        Caption = 'Vl.Unit'#225'rio'
      end
      object RLLabel6: TRLLabel
        Left = 665
        Top = 22
        Width = 48
        Height = 16
        Caption = 'Vl.Total'
      end
      object RLLabel7: TRLLabel
        Left = 393
        Top = 22
        Width = 62
        Height = 16
        Caption = '%Imposto'
      end
      object RLLabel8: TRLLabel
        Left = 514
        Top = 22
        Width = 70
        Height = 16
        Caption = 'Vl. Imposto'
      end
    end
    object RLBand1: TRLBand
      Left = 38
      Top = 161
      Width = 718
      Height = 32
      object DBEdit1: TDBEdit
        Left = 8
        Top = 32
        Width = 154
        Height = 24
        DataField = 'ID_ABASTECIMENTO'
        DataSource = dsRel
        TabOrder = 0
      end
      object RLDBComb: TRLDBText
        Left = 6
        Top = 16
        Width = 147
        Height = 16
        DataField = 'COMBUSTIVEL'
        DataSource = dsRel
        Text = ''
      end
      object RLDBQtd: TRLDBText
        Left = 187
        Top = 16
        Width = 25
        Height = 16
        Alignment = taRightJustify
        DataField = 'QTD'
        DataSource = dsRel
        Text = ''
      end
      object RLDBUN: TRLDBText
        Left = 276
        Top = 16
        Width = 45
        Height = 16
        Alignment = taRightJustify
        DataField = 'VALOR_UNITARIO'
        DataSource = dsRel
        Text = ''
      end
      object RLDBPerImp: TRLDBText
        Left = 406
        Top = 16
        Width = 40
        Height = 16
        Alignment = taRightJustify
        DataField = 'PERCENTUAL_IMPOSTO'
        DataSource = dsRel
        Text = ''
      end
      object RLDBVLIMP: TRLDBText
        Left = 531
        Top = 16
        Width = 42
        Height = 16
        Alignment = taRightJustify
        DataField = 'VALOR_IMPOSTO'
        DataSource = dsRel
        Text = ''
      end
      object RLDBVLTotal: TRLDBText
        Left = 664
        Top = 16
        Width = 48
        Height = 16
        Alignment = taRightJustify
        DataField = 'VALOR_TOTAL'
        DataSource = dsRel
        Text = ''
      end
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 193
      Width = 718
      Height = 48
      BandType = btFooter
      object RLSystemInfo1: TRLSystemInfo
        Left = 3
        Top = 29
        Width = 39
        Height = 16
        Text = ''
      end
      object RLLabel2: TRLLabel
        Left = 165
        Top = 31
        Width = 203
        Height = 16
        Caption = 'Consumidor Final n'#227'o identificado'
      end
    end
  end
  object mmTable: TFDMemTable
    FieldDefs = <
      item
        Name = 'ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'ID_COMBUSTIVEL'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'ARMAZENAMENTO'
        DataType = ftSingle
        Precision = 8
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    FormatOptions.AssignedValues = [fvMaxBcdPrecision, fvMaxBcdScale]
    FormatOptions.MaxBcdPrecision = 2147483647
    FormatOptions.MaxBcdScale = 1073741823
    ResourceOptions.AssignedValues = [rvPersistent, rvSilentMode]
    ResourceOptions.Persistent = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 348
    Top = 353
    object mmTableID_ABASTECIMENTO: TIntegerField
      DisplayLabel = 'Coo'
      FieldName = 'ID_ABASTECIMENTO'
    end
    object mmTableCOMBUSTIVEL: TStringField
      DisplayLabel = 'Combustivel'
      FieldName = 'COMBUSTIVEL'
    end
    object mmTableQTD: TFloatField
      DisplayLabel = 'Qtd'
      FieldName = 'QTD'
      DisplayFormat = '#,##0.00'
    end
    object mmTableVALOR_UNITARIO: TFloatField
      DisplayLabel = 'Vl. Unitario'
      FieldName = 'VALOR_UNITARIO'
      DisplayFormat = '#,##0.00'
    end
    object mmTableVALOR_IMPOSTO: TFloatField
      DisplayLabel = 'Vl. Imposto'
      FieldName = 'VALOR_IMPOSTO'
      DisplayFormat = '#,##0.00'
    end
    object mmTableVALOR_TOTAL: TFloatField
      DisplayLabel = 'Vl. Total'
      FieldName = 'VALOR_TOTAL'
      DisplayFormat = '#,##0.00'
    end
    object mmTablemmTablePERCENTUAL_IMPOSTO: TIntegerField
      DisplayLabel = '% Imposto'
      FieldName = 'PERCENTUAL_IMPOSTO'
    end
  end
  object dsRel: TDataSource
    DataSet = mmTable
    Left = 344
    Top = 288
  end
end
