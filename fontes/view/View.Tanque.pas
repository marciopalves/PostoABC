unit View.Tanque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  System.Actions, Vcl.ActnList, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Stan.StorageBin,
  Vcl.DBCtrls, Model.Tanque, Model.Enumerado;

type
  TfrmTanque = class(TForm)
    pnlBotoes: TPanel;
    pnlFiltro: TPanel;
    edtCodigoFiltro: TEdit;
    lblCodigo: TLabel;
    edtDescricaoFiltro: TEdit;
    lblDescricao: TLabel;
    pnlDados: TPanel;
    btnPesquisar: TButton;
    ActionList: TActionList;
    actLimpar: TAction;
    actNovo: TAction;
    actEditar: TAction;
    actDeletar: TAction;
    actSalvar: TAction;
    pgDados: TPageControl;
    tsPesquisa: TTabSheet;
    tsDados: TTabSheet;
    dbgDados: TDBGrid;
    pnlEdits: TPanel;
    edtCodigo: TEdit;
    Label1: TLabel;
    edtDescricao: TEdit;
    Label2: TLabel;
    pnlNovo: TPanel;
    Shape3: TShape;
    btnNovo: TSpeedButton;
    pnlEditar: TPanel;
    Shape1: TShape;
    btEditar: TSpeedButton;
    pnlExcluir: TPanel;
    Shape2: TShape;
    btnExcluir: TSpeedButton;
    pnlRodape: TPanel;
    pnlEspacamento: TPanel;
    pnlBotoesRodape: TPanel;
    pnlSalvar: TPanel;
    Shape4: TShape;
    btnSalvar: TSpeedButton;
    Label4: TLabel;
    edtArmazenamento: TEdit;
    Label5: TLabel;
    ds: TDataSource;
    actCancelar: TAction;
    mmTable: TFDMemTable;
    actPesquisar: TAction;
    pnlCancelar: TPanel;
    Shape5: TShape;
    btnCancelar: TSpeedButton;
    mmTableID: TIntegerField;
    mmTableDESCRICAO: TStringField;
    mmTableCOMBUSTIVEL: TStringField;
    mmTableARMAZENAMENTO: TFloatField;
    cbbCombustiveis: TComboBox;
    mmTableID_COMBUSTIVEL: TIntegerField;
    procedure actNovoExecute(Sender: TObject);
    procedure actEditarExecute(Sender: TObject);
    procedure actDeletarExecute(Sender: TObject);
    procedure actSalvarExecute(Sender: TObject);
    procedure actLimparExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actPesquisarExecute(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure dbgDadosDblClick(Sender: TObject);
    procedure edtArmazenamentoKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    FTanque: TTanqueModel;

    procedure Limpar;
    procedure CarregarCombustiveis;
    procedure CarregarEdits;
    procedure AtribuirValores;
    procedure Refresh;
    procedure HabilitarDefinirCampos(const pAcao: TAcao);
    procedure Pesquisar;
  public
    property Model: TTanqueModel read FTanque write FTanque;
  end;

var
  frmTanque: TfrmTanque;

implementation

{$R *.dfm}

uses
  uConexao,
  Control.Tanque,
  Constantes;

{ TfrmCombustivel }

procedure TfrmTanque.Limpar;
begin
  edtCodigoFiltro.Clear;
  edtDescricaoFiltro.Clear;
  edtCodigo.Clear;
  edtDescricao.Clear;
  edtArmazenamento.Clear;
  cbbCombustiveis.ItemIndex := INDICE_INDEFINIDO;

  if Assigned(Model) then
  begin
    Model.Id := 0;
    Model.Descricao:= EmptyStr;
    Model.DescricaoCombustivel := EmptyStr;
    Model.Armazenamento:= 0;
    Model.IdCombustivel := 0;
    Model.Acao := tacIndefinido;
  end;
end;

procedure TfrmTanque.Pesquisar;
Var
  Control: TTanqueControl;
  qryTanque: TFDQuery;
  vCont: Integer;
  FieldValue: Variant;
begin
  Control:= TTanqueControl.Create;
  try
    mmTable.Close;
    qryTanque:= nil;

    if edtCodigoFiltro.Text <> EmptyStr then
      qryTanque:= Control.BuscaPeloId(StrToInt(edtCodigoFiltro.Text))
    else if edtDescricaoFiltro.Text <> EmptyStr  then
      qryTanque:= Control.BuscaPeloNome(edtDescricaoFiltro.Text)
    else
      qryTanque:= Control.RetornaTodos;

    mmTable.Data := qryTanque;

  finally
    FreeAndNil(Control);
    qryTanque.Close;
    pgDados.ActivePage := tsPesquisa;
  end;
end;

procedure TfrmTanque.actNovoExecute(Sender: TObject);
begin
  if Not Assigned(Model) then
    Model := TTanqueModel.Create;
  Limpar;
  HabilitarDefinirCampos(tacIncluir);

  Model.Id:= 0;
  edtCodigo.Text:= IntToStr(Model.Id);
end;

procedure TfrmTanque.actPesquisarExecute(Sender: TObject);
begin
  Pesquisar;
end;

procedure TfrmTanque.actEditarExecute(Sender: TObject);
begin
  if Not Assigned(Model) then
    Model := TTanqueModel.Create;
  Model.Acao := tacEdicao;
  CarregarEdits;
  HabilitarDefinirCampos(tacEdicao);
end;

procedure TfrmTanque.actLimparExecute(Sender: TObject);
begin
  Limpar;
end;

procedure TfrmTanque.actDeletarExecute(Sender: TObject);
Const MSG_EXCLUIR = 'Deseja excluir este registro %d ?';
Var
  Control: TTanqueControl;
  msg: String;
begin
  msg := Format(MSG_EXCLUIR, [mmTableID.AsInteger]);

  if application.messagebox(PWideChar(msg),'Confirma',mb_iconquestion+mb_yesnocancel) = IDYES then
  begin
    Control := TTanqueControl.Create;
    try
      if Control.Deletar(mmTableID.AsInteger) then
        application.messagebox('Registro excluido com sucesso!','Atenção',MB_ICONWARNING+MB_OK)
      else application.messagebox('Existe referências em outros registros, não será possível excluir!','Atenção',MB_ICONWARNING+MB_OK);
    finally
      FreeAndNil(Control);
      Refresh;
    end;
  end;
end;

procedure TfrmTanque.actSalvarExecute(Sender: TObject);
Var
  Control: TTanqueControl;
  Salvar: Boolean;
begin
  AtribuirValores;
  Control := TTanqueControl.Create;
  try
    try
      Salvar := Control.Salvar(Model);
      if Salvar then
        application.messagebox('Registro gravado com sucesso!','Atenção',MB_ICONWARNING+MB_OK);
    except
      on e: exception do
        raise Exception.Create('Falha ao salvar registro!'+sLineBreak+e.ToString);
    end;
  finally
    FreeAndNil(Control);
    if Salvar then
    begin
      Refresh;
      HabilitarDefinirCampos(tacIndefinido);
    end;
  end;
end;

procedure TfrmTanque.btnCancelarClick(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmTanque.FormCreate(Sender: TObject);
begin
  Model := TTanqueModel.Create;
end;

procedure TfrmTanque.FormShow(Sender: TObject);
Var
  Control: TTanqueControl;
begin
  Refresh;
  HabilitarDefinirCampos(tacIndefinido);
end;

procedure TfrmTanque.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  mmTable.Close;
  FreeAndNil(Model);
end;

procedure TfrmTanque.CarregarEdits;

procedure DefinirIndiceCombustivel;
Var
  Indice: Integer;
begin
  if Model.IdCombustivel > 0 then
  begin
    for Indice := 0 to cbbCombustiveis.Items.Count - 1 do
    begin
      if Integer(cbbCombustiveis.Items.Objects[Indice]) = Model.IdCombustivel then
      begin
        cbbCombustiveis.ItemIndex := Indice;
        Exit;
      end;
    end;
  end;
end;

begin
  Model.Id            := mmTableID.Value;
  Model.Descricao     := mmTableDESCRICAO.AsString;
  Model.Armazenamento := mmTableARMAZENAMENTO.AsFloat;
  Model.IdCombustivel := mmTableID_COMBUSTIVEL.Value;

  edtCodigo.Text            := IntToStr(Model.Id);
  edtDescricao.Text         := Model.Descricao;
  edtArmazenamento.Text     := FloatToStr(Model.Armazenamento);
  DefinirIndiceCombustivel;
end;

procedure TfrmTanque.dbgDadosDblClick(Sender: TObject);
begin
  actEditarExecute(self);
end;

procedure TfrmTanque.edtArmazenamentoKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', ',',  KEY_ESPACO, KEY_TAB, KEY_ENTER]) then
    Key := #0;
end;

procedure TfrmTanque.AtribuirValores;
begin
  Model.Id := StrToInt(edtCodigo.Text);
  Model.Descricao := edtDescricao.Text;
  if cbbCombustiveis.ItemIndex >= 0 then
    Model.IdCombustivel := Integer(cbbCombustiveis.Items.Objects[cbbCombustiveis.ItemIndex]);
  Model.Armazenamento := StrToFloatDef(edtArmazenamento.Text, 0);
end;

procedure TfrmTanque.HabilitarDefinirCampos(const pAcao: TAcao);
begin
  case pAcao of
    tacIncluir:
    begin
      pnlBotoes.Enabled := False;
      pnlFiltro.Enabled := False;
      pnlBotoesRodape.Enabled := True;
      pgDados.ActivePage := tsDados;
      edtDescricao.SetFocus;
    end;
    tacEdicao:
    begin
      pnlBotoes.Enabled := False;
      pnlFiltro.Enabled := False;
      pnlBotoesRodape.Enabled := True;
      pgDados.ActivePage := tsDados;
      edtDescricao.SetFocus;
    end;
    tacIndefinido:
    begin
      pnlBotoes.Enabled := True;
      pnlFiltro.Enabled := True;
      pnlBotoesRodape.Enabled := False;
      pgDados.ActivePage := tsPesquisa;
      edtCodigoFiltro.SetFocus;
    end;
  end;
  Model.Acao:= pAcao;;
end;

procedure TfrmTanque.Refresh;
begin
  Pesquisar;
  CarregarCombustiveis;
  Limpar;
end;

procedure TfrmTanque.CarregarCombustiveis;
Var
  Control: TTanqueControl;
  qryComb: TFDQuery;
begin
  Control:= TTanqueControl.Create;
  qryComb:= DmConexao.CriaQuery;
  qryComb:= Control.BuscaCombustiveis;
  try
    qryComb.First;
    qryComb.DisableControls;
    cbbCombustiveis.Clear;
    while Not qryComb.Eof do
    begin
      cbbCombustiveis.AddItem(qryComb.FieldByName('DESCRICAO').AsString,
                              TObject(qryComb.FieldByName('ID').AsInteger));
      qryComb.Next;
    end;
  finally
    FreeAndNil(Control);
    FreeAndNil(qryComb);
  end;
end;

end.
