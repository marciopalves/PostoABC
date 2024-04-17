object frmAbastecimento: TfrmAbastecimento
  Left = 0
  Top = 0
  Caption = 'Abastecimento'
  ClientHeight = 479
  ClientWidth = 948
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 13
  object pnlContainer: TPanel
    Left = 0
    Top = 0
    Width = 948
    Height = 479
    Align = alClient
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 944
    ExplicitHeight = 478
    object pnlBombas: TPanel
      Left = 1
      Top = 1
      Width = 192
      Height = 436
      Align = alLeft
      BevelOuter = bvNone
      Color = clActiveCaption
      ParentBackground = False
      TabOrder = 0
      ExplicitHeight = 435
      object pnlBomba01: TPanel
        AlignWithMargins = True
        Left = 0
        Top = 0
        Width = 189
        Height = 72
        Margins.Left = 0
        Margins.Top = 0
        Margins.Bottom = 0
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Shape3: TShape
          Left = 0
          Top = 0
          Width = 189
          Height = 72
          Align = alClient
          Brush.Color = 14342621
          Pen.Style = psClear
          Shape = stRoundRect
          ExplicitLeft = 32
          ExplicitTop = 16
          ExplicitWidth = 65
          ExplicitHeight = 65
        end
        object btnBomba01: TSpeedButton
          Left = 0
          Top = 0
          Width = 189
          Height = 72
          Align = alClient
          Caption = 'Bomba 01'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = btnBomba01Click
          ExplicitLeft = 1
          ExplicitWidth = 185
        end
      end
      object pnlBomba02: TPanel
        AlignWithMargins = True
        Left = 0
        Top = 82
        Width = 189
        Height = 72
        Margins.Left = 0
        Margins.Top = 0
        Margins.Bottom = 0
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object Shape1: TShape
          Left = 0
          Top = 0
          Width = 189
          Height = 72
          Align = alClient
          Brush.Color = 14342621
          Pen.Style = psClear
          Shape = stRoundRect
          ExplicitLeft = 32
          ExplicitTop = 16
          ExplicitWidth = 65
          ExplicitHeight = 65
        end
        object btnBomba02: TSpeedButton
          Left = 0
          Top = 0
          Width = 189
          Height = 72
          Align = alClient
          Caption = 'Bomba 02'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = btnBomba02Click
          ExplicitLeft = 1
          ExplicitWidth = 185
        end
      end
      object pnlBomba03: TPanel
        AlignWithMargins = True
        Left = 0
        Top = 164
        Width = 189
        Height = 72
        Margins.Left = 0
        Margins.Top = 0
        Margins.Bottom = 0
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 2
        object Shape2: TShape
          Left = 0
          Top = 0
          Width = 189
          Height = 72
          Align = alClient
          Brush.Color = 14342621
          Pen.Style = psClear
          Shape = stRoundRect
          ExplicitLeft = 32
          ExplicitTop = 16
          ExplicitWidth = 65
          ExplicitHeight = 65
        end
        object btnBomba03: TSpeedButton
          Left = 0
          Top = 0
          Width = 189
          Height = 72
          Align = alClient
          Caption = 'Bomba 03'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = btnBomba03Click
          ExplicitLeft = 1
          ExplicitWidth = 185
        end
      end
      object pnlBomba04: TPanel
        AlignWithMargins = True
        Left = 0
        Top = 246
        Width = 189
        Height = 72
        Margins.Left = 0
        Margins.Top = 0
        Margins.Bottom = 0
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 3
        object Shape4: TShape
          Left = 0
          Top = 0
          Width = 189
          Height = 72
          Align = alClient
          Brush.Color = 14342621
          Pen.Style = psClear
          Shape = stRoundRect
          ExplicitLeft = 32
          ExplicitTop = 16
          ExplicitWidth = 65
          ExplicitHeight = 65
        end
        object btnBomba04: TSpeedButton
          Left = 0
          Top = 0
          Width = 189
          Height = 72
          Align = alClient
          Caption = 'Bomba 04'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = btnBomba04Click
          ExplicitLeft = 1
          ExplicitWidth = 185
        end
      end
      object pnlDivisor01: TPanel
        Left = 0
        Top = 72
        Width = 192
        Height = 10
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 4
      end
      object pnlDivisor02: TPanel
        Left = 0
        Top = 154
        Width = 192
        Height = 10
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 5
      end
      object pnlDivisor03: TPanel
        Left = 0
        Top = 236
        Width = 192
        Height = 10
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 6
      end
    end
    object pnlDados: TPanel
      Left = 193
      Top = 1
      Width = 754
      Height = 436
      Align = alClient
      BevelOuter = bvNone
      Color = clActiveCaption
      ParentBackground = False
      TabOrder = 1
      ExplicitWidth = 750
      ExplicitHeight = 435
      object pnlValores: TPanel
        Left = 0
        Top = 122
        Width = 754
        Height = 101
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitWidth = 750
        object TLabel
          Left = 51
          Top = 29
          Width = 146
          Height = 19
          Caption = 'Tipo de Combust'#237'vel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label1: TLabel
          Left = 365
          Top = 29
          Width = 33
          Height = 19
          Caption = 'QTD'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label2: TLabel
          Left = 251
          Top = 29
          Width = 79
          Height = 19
          Caption = 'VL.Unit'#225'rio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label3: TLabel
          Left = 415
          Top = 29
          Width = 59
          Height = 19
          Caption = 'VL.Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object edtCombustivel: TEdit
          Left = 51
          Top = 51
          Width = 201
          Height = 21
          Enabled = False
          TabOrder = 0
        end
        object edtQuantidade: TEdit
          Left = 362
          Top = 51
          Width = 57
          Height = 21
          Hint = 'Informe a quantidade '
          TabOrder = 2
          OnExit = edtQuantidadeExit
          OnKeyPress = edtQuantidadeKeyPress
        end
        object edtValorUnitario: TEdit
          Left = 253
          Top = 51
          Width = 108
          Height = 21
          Hint = 'Informe a quantidade '
          Enabled = False
          TabOrder = 1
        end
        object edtValorTotal: TEdit
          Left = 420
          Top = 51
          Width = 85
          Height = 21
          Hint = 'Informe a quantidade '
          Enabled = False
          NumbersOnly = True
          TabOrder = 3
        end
      end
      object pnlDadosTop: TPanel
        Left = 0
        Top = 0
        Width = 754
        Height = 122
        Align = alTop
        BevelOuter = bvNone
        Caption = 'Confira os dados do Abastecimento'
        Color = clActiveCaption
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 1
        ExplicitWidth = 750
      end
      object pnlEspacamentoRegistrar: TPanel
        Left = 0
        Top = 368
        Width = 754
        Height = 68
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 2
        ExplicitTop = 367
        ExplicitWidth = 750
        object pnlEspacamento01: TPanel
          Left = 0
          Top = 0
          Width = 521
          Height = 68
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 0
        end
        object pnlRegistrar: TPanel
          AlignWithMargins = True
          Left = 521
          Top = 0
          Width = 224
          Height = 68
          Margins.Left = 0
          Margins.Top = 0
          Margins.Bottom = 0
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 1
          object Shape5: TShape
            Left = 0
            Top = 0
            Width = 224
            Height = 68
            Align = alClient
            Brush.Color = 14342621
            Pen.Style = psClear
            Shape = stRoundRect
            ExplicitLeft = 32
            ExplicitTop = 16
            ExplicitWidth = 65
            ExplicitHeight = 65
          end
          object btnRegistrar: TSpeedButton
            Left = 0
            Top = 0
            Width = 224
            Height = 68
            Align = alClient
            Caption = 'Registrar Abastecimento'
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = btnRegistrarClick
            ExplicitLeft = 1
            ExplicitWidth = 185
            ExplicitHeight = 72
          end
        end
      end
    end
    object pnlRodape: TPanel
      Left = 1
      Top = 437
      Width = 946
      Height = 41
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      ExplicitTop = 436
      ExplicitWidth = 942
    end
  end
end
