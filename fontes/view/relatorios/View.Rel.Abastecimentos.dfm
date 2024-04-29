object frmRelAbastecimentos: TfrmRelAbastecimentos
  Left = 0
  Top = 0
  Caption = 'frmRelAbastecimentos'
  ClientHeight = 442
  ClientWidth = 771
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object relAbastecimentos: TRLReport
    Left = -8
    Top = -9
    Width = 794
    Height = 1123
    DataSource = ds
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    BeforePrint = relAbastecimentosBeforePrint
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 106
      BandType = btHeader
      object Label1: TLabel
        Left = 16
        Top = 88
        Width = 41
        Height = 16
        Caption = 'Tanque'
      end
      object Label2: TLabel
        Left = 77
        Top = 88
        Width = 41
        Height = 16
        Caption = 'Bomba'
      end
      object Label3: TLabel
        Left = 154
        Top = 88
        Width = 56
        Height = 16
        Caption = 'Qtd. Total'
      end
      object Label4: TLabel
        Left = 264
        Top = 88
        Width = 103
        Height = 16
        Caption = 'M'#233'dia Vl. Unit'#225'rio'
      end
      object Label5: TLabel
        Left = 569
        Top = 88
        Width = 27
        Height = 16
        Caption = 'Total'
      end
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
        Left = 81
        Top = 55
        Width = 37
        Height = 16
        Info = itNow
        Text = ''
      end
      object RLLabel1: TRLLabel
        Left = 3
        Top = 55
        Width = 76
        Height = 16
        Caption = 'Gerado em.:'
      end
      object rlblFiltro: TRLLabel
        Left = 514
        Top = 56
        Width = 50
        Height = 16
      end
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 144
      Width = 718
      Height = 39
      object RLDBText1: TRLDBText
        Left = 20
        Top = 24
        Width = 35
        Height = 16
        DataField = 'ID_TANQUE'
        DataSource = ds
        Text = ''
      end
      object RLDBText2: TRLDBText
        Left = 83
        Top = 24
        Width = 45
        Height = 16
        DataField = 'ID_BOMBA'
        DataSource = ds
        Text = ''
      end
      object RLDBText3: TRLDBText
        Left = 143
        Top = 24
        Width = 55
        Height = 16
        Alignment = taRightJustify
        DataField = 'QTD_TOTAL'
        DataSource = ds
        DisplayMask = '#,##0.000'
        Text = ''
      end
      object RLDBText4: TRLDBText
        Left = 267
        Top = 24
        Width = 84
        Height = 16
        Alignment = taRightJustify
        DataField = 'MEDIA_VALOR_UNITARIO'
        DataSource = ds
        DisplayMask = '#,##0.000'
        Text = ''
      end
      object RLDBText5: TRLDBText
        Left = 548
        Top = 22
        Width = 61
        Height = 16
        Alignment = taRightJustify
        DataField = 'TOTAL_VALOR'
        DataSource = ds
        DisplayMask = '#,##0.000'
        Text = ''
      end
    end
    object RLBand3: TRLBand
      Left = 38
      Top = 183
      Width = 718
      Height = 40
      BandType = btSummary
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object RLLabel2: TRLLabel
        Left = 445
        Top = 22
        Width = 75
        Height = 16
        Caption = 'Total Geral'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rlblTotal: TRLLabel
        Left = 552
        Top = 22
        Width = 57
        Height = 16
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object RLDraw1: TRLDraw
      Left = 41
      Top = 110
      Width = 712
      Height = 1
    end
  end
  object mmTable: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 368
    Top = 392
    object mmTableID_BOMBA: TIntegerField
      DisplayLabel = 'Bomba'
      FieldName = 'ID_BOMBA'
    end
    object mmTableID_TANQUE: TIntegerField
      DisplayLabel = 'Tanque'
      FieldName = 'ID_TANQUE'
    end
    object mmTableQTD_TOTAL: TFloatField
      DisplayLabel = 'Qtd. Total'
      FieldName = 'QTD_TOTAL'
    end
    object mmTableMEDIA_VALOR_UNITARIO: TFloatField
      DisplayLabel = 'M'#233'dia Vl. Unit'#225'rio'
      FieldName = 'MEDIA_VALOR_UNITARIO'
    end
    object mmTableTOTAL_IMPOSTO: TFloatField
      FieldName = 'TOTAL_IMPOSTO'
    end
    object mmTableTOTAL_VALOR: TFloatField
      DisplayLabel = 'VL. Total'
      FieldName = 'TOTAL_VALOR'
    end
  end
  object ds: TDataSource
    DataSet = mmTable
    Left = 320
    Top = 392
  end
end
