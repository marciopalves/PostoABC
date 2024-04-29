object frmBomba: TfrmBomba
  Left = 0
  Top = 0
  Caption = 'Bombas de Combust'#237'vel'
  ClientHeight = 393
  ClientWidth = 589
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object pnlBotoes: TPanel
    Left = 0
    Top = 0
    Width = 589
    Height = 65
    Align = alTop
    BevelOuter = bvNone
    Color = clSkyBlue
    ParentBackground = False
    TabOrder = 0
    object pnlNovo: TPanel
      AlignWithMargins = True
      Left = 0
      Top = 0
      Width = 105
      Height = 65
      Margins.Left = 0
      Margins.Top = 0
      Margins.Bottom = 0
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object Shape3: TShape
        Left = 0
        Top = 0
        Width = 105
        Height = 65
        Align = alClient
        Brush.Color = 14342621
        Pen.Style = psClear
        Shape = stRoundRect
        ExplicitLeft = 32
        ExplicitTop = 16
        ExplicitWidth = 65
      end
      object btnNovo: TSpeedButton
        Left = 0
        Top = 0
        Width = 105
        Height = 65
        Action = actNovo
        Align = alClient
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitLeft = 1
        ExplicitWidth = 185
        ExplicitHeight = 72
      end
    end
    object pnlEditar: TPanel
      AlignWithMargins = True
      Left = 108
      Top = 0
      Width = 105
      Height = 65
      Margins.Left = 0
      Margins.Top = 0
      Margins.Bottom = 0
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 1
      object Shape1: TShape
        Left = 0
        Top = 0
        Width = 105
        Height = 65
        Align = alClient
        Brush.Color = 14342621
        Pen.Style = psClear
        Shape = stRoundRect
        ExplicitLeft = 32
        ExplicitTop = 16
        ExplicitWidth = 65
      end
      object btEditar: TSpeedButton
        Left = 0
        Top = 0
        Width = 105
        Height = 65
        Action = actEditar
        Align = alClient
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitLeft = 1
        ExplicitWidth = 185
        ExplicitHeight = 72
      end
    end
    object pnlExcluir: TPanel
      AlignWithMargins = True
      Left = 216
      Top = 0
      Width = 105
      Height = 65
      Margins.Left = 0
      Margins.Top = 0
      Margins.Bottom = 0
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 2
      object Shape2: TShape
        Left = 0
        Top = 0
        Width = 105
        Height = 65
        Align = alClient
        Brush.Color = 14342621
        Pen.Style = psClear
        Shape = stRoundRect
        ExplicitLeft = 32
        ExplicitTop = 16
        ExplicitWidth = 65
      end
      object btnExcluir: TSpeedButton
        Left = 0
        Top = 0
        Width = 105
        Height = 65
        Action = actDeletar
        Align = alClient
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitLeft = 1
        ExplicitWidth = 185
        ExplicitHeight = 72
      end
    end
  end
  object pnlFiltro: TPanel
    Left = 0
    Top = 65
    Width = 589
    Height = 78
    Align = alTop
    BevelOuter = bvNone
    Color = clSkyBlue
    ParentBackground = False
    TabOrder = 1
    object lblCodigo: TLabel
      Left = 13
      Top = 20
      Width = 39
      Height = 15
      Caption = 'C'#243'digo'
    end
    object lblDescricao: TLabel
      Left = 71
      Top = 20
      Width = 51
      Height = 15
      Caption = 'Descri'#231#227'o'
    end
    object edtCodigoFiltro: TEdit
      Left = 9
      Top = 38
      Width = 56
      Height = 23
      NumbersOnly = True
      TabOrder = 0
    end
    object edtDescricaoFiltro: TEdit
      Left = 69
      Top = 38
      Width = 224
      Height = 23
      TabOrder = 1
    end
    object btnPesquisar: TButton
      Left = 520
      Top = 36
      Width = 75
      Height = 25
      Action = actPesquisar
      TabOrder = 2
    end
  end
  object pnlDados: TPanel
    Left = 0
    Top = 143
    Width = 589
    Height = 250
    Align = alClient
    BevelOuter = bvNone
    Color = clSkyBlue
    ParentBackground = False
    TabOrder = 2
    object pgDados: TPageControl
      Left = 0
      Top = 0
      Width = 589
      Height = 250
      ActivePage = tsDados
      Align = alClient
      TabOrder = 0
      object tsPesquisa: TTabSheet
        Caption = 'Pesquisa'
        object dbgDados: TDBGrid
          Left = 0
          Top = 0
          Width = 585
          Height = 221
          Align = alClient
          DataSource = ds
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
          OnDblClick = dbgDadosDblClick
          Columns = <
            item
              Expanded = False
              FieldName = 'ID'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRICAO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TANQUE'
              Title.Caption = 'Tanque'
              Width = 125
              Visible = True
            end>
        end
      end
      object tsDados: TTabSheet
        Caption = 'Dados'
        ImageIndex = 1
        object pnlEdits: TPanel
          Left = 0
          Top = 0
          Width = 581
          Height = 220
          Align = alClient
          Color = clSkyBlue
          ParentBackground = False
          TabOrder = 0
          object Label1: TLabel
            Left = 21
            Top = 12
            Width = 39
            Height = 15
            Caption = 'C'#243'digo'
          end
          object Label2: TLabel
            Left = 78
            Top = 12
            Width = 51
            Height = 15
            Caption = 'Descri'#231#227'o'
          end
          object Label4: TLabel
            Left = 18
            Top = 76
            Width = 31
            Height = 15
            Caption = 'Taque'
          end
          object edtCodigo: TEdit
            Left = 17
            Top = 30
            Width = 56
            Height = 23
            Enabled = False
            NumbersOnly = True
            TabOrder = 0
          end
          object edtDescricao: TEdit
            Left = 76
            Top = 30
            Width = 280
            Height = 23
            TabOrder = 1
          end
          object pnlRodape: TPanel
            Left = 1
            Top = 178
            Width = 579
            Height = 41
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 2
            object pnlEspacamento: TPanel
              Left = 0
              Top = 0
              Width = 355
              Height = 41
              Align = alLeft
              BevelOuter = bvNone
              TabOrder = 0
            end
            object pnlBotoesRodape: TPanel
              Left = 355
              Top = 0
              Width = 224
              Height = 41
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 1
              object pnlSalvar: TPanel
                AlignWithMargins = True
                Left = 0
                Top = 0
                Width = 105
                Height = 41
                Margins.Left = 0
                Margins.Top = 0
                Margins.Bottom = 0
                Align = alLeft
                BevelOuter = bvNone
                TabOrder = 0
                object Shape4: TShape
                  Left = 0
                  Top = 0
                  Width = 105
                  Height = 41
                  Align = alClient
                  Brush.Color = 14342621
                  Pen.Style = psClear
                  Shape = stRoundRect
                  ExplicitLeft = 32
                  ExplicitTop = 16
                  ExplicitWidth = 65
                  ExplicitHeight = 65
                end
                object btnSalvar: TSpeedButton
                  Left = 0
                  Top = 0
                  Width = 105
                  Height = 41
                  Action = actSalvar
                  Align = alClient
                  Flat = True
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                  ExplicitLeft = 6
                end
              end
              object pnlCancelar: TPanel
                AlignWithMargins = True
                Left = 108
                Top = 0
                Width = 105
                Height = 41
                Margins.Left = 0
                Margins.Top = 0
                Margins.Bottom = 0
                Align = alLeft
                BevelOuter = bvNone
                TabOrder = 1
                object Shape5: TShape
                  Left = 0
                  Top = 0
                  Width = 105
                  Height = 41
                  Align = alClient
                  Brush.Color = 14342621
                  Pen.Style = psClear
                  Shape = stRoundRect
                  ExplicitLeft = 32
                  ExplicitTop = 16
                  ExplicitWidth = 65
                  ExplicitHeight = 65
                end
                object btnCancelar: TSpeedButton
                  Left = 0
                  Top = 0
                  Width = 105
                  Height = 41
                  Action = actCancelar
                  Align = alClient
                  Flat = True
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                  ExplicitLeft = 32
                  ExplicitTop = 16
                  ExplicitWidth = 23
                  ExplicitHeight = 22
                end
              end
            end
          end
          object cbbTanques: TComboBox
            Left = 18
            Top = 92
            Width = 145
            Height = 23
            TabOrder = 3
            Text = 'cbbTanques'
          end
        end
      end
    end
  end
  object ActionList: TActionList
    Left = 120
    Top = 345
    object actLimpar: TAction
      Category = 'Funcoes'
      Caption = 'Limpar'
      ShortCut = 27
      OnExecute = actLimparExecute
    end
    object actNovo: TAction
      Category = 'Funcoes'
      Caption = 'Novo'
      ShortCut = 32846
      OnExecute = actNovoExecute
    end
    object actEditar: TAction
      Category = 'Funcoes'
      Caption = 'Editar'
      ShortCut = 32837
      OnExecute = actEditarExecute
    end
    object actDeletar: TAction
      Category = 'Funcoes'
      Caption = 'Deletar'
      ShortCut = 32836
      OnExecute = actDeletarExecute
    end
    object actSalvar: TAction
      Category = 'Funcoes'
      Caption = 'Salvar'
      ShortCut = 32851
      OnExecute = actSalvarExecute
    end
    object actCancelar: TAction
      Category = 'Funcoes'
      Caption = 'Cancelar'
      ShortCut = 32835
    end
    object actPesquisar: TAction
      Category = 'Funcoes'
      Caption = 'Pesquisar'
      ShortCut = 113
      OnExecute = actPesquisarExecute
    end
  end
  object ds: TDataSource
    DataSet = mmTable
    Left = 76
    Top = 345
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
    Left = 20
    Top = 345
    object mmTableID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID'
    end
    object mmTableDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
    end
    object mmTableTANQUE: TStringField
      FieldName = 'TANQUE'
    end
    object mmTableID_TANQUE: TIntegerField
      FieldName = 'ID_TANQUE'
    end
  end
end
