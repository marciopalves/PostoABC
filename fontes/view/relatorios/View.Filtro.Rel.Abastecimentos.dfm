object frmFiltroRelAbastecimentos: TfrmFiltroRelAbastecimentos
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio de Abastecimentos'
  ClientHeight = 178
  ClientWidth = 326
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 15
  object pnlCoontainer: TPanel
    Left = 0
    Top = 0
    Width = 326
    Height = 178
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 322
    ExplicitHeight = 177
    object pnlBody: TPanel
      Left = 1
      Top = 1
      Width = 324
      Height = 135
      Align = alClient
      TabOrder = 0
      ExplicitWidth = 320
      ExplicitHeight = 134
      object Label1: TLabel
        Left = 48
        Top = 88
        Width = 56
        Height = 15
        Caption = 'Data Inicio'
      end
      object Label2: TLabel
        Left = 154
        Top = 88
        Width = 47
        Height = 15
        Caption = 'Data Fim'
      end
      object dtpInicio: TDateTimePicker
        Left = 48
        Top = 103
        Width = 81
        Height = 23
        Date = 45394.000000000000000000
        Time = 0.497569351849961100
        TabOrder = 0
      end
      object dtpFim: TDateTimePicker
        Left = 152
        Top = 103
        Width = 81
        Height = 23
        Date = 45394.000000000000000000
        Time = 0.497569351849961100
        TabOrder = 1
      end
    end
    object pnlRodape: TPanel
      Left = 1
      Top = 136
      Width = 324
      Height = 41
      Align = alBottom
      TabOrder = 1
      ExplicitTop = 135
      ExplicitWidth = 320
      object btnPesquisar: TButton
        Left = 88
        Top = 6
        Width = 75
        Height = 25
        Caption = 'Pesquisar '
        TabOrder = 0
        OnClick = btnPesquisarClick
      end
      object btnCancelar: TButton
        Left = 192
        Top = 6
        Width = 75
        Height = 25
        Caption = 'Cancelar'
        TabOrder = 1
        OnClick = btnCancelarClick
      end
    end
  end
end
