unit View.Combustivel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  System.Actions, Vcl.ActnList, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Model.Combustivel,
  Model.Enumerado, FireDAC.Stan.StorageBin;

type
  TfrmCombustivel = class(TForm)
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
    edtSigla: TEdit;
    Label3: TLabel;
    edtValor: TEdit;
    Label4: TLabel;
    edtPercentual: TEdit;
    Label5: TLabel;
    ds: TDataSource;
    actCancelar: TAction;
    mmTable: TFDMemTable;
    mmTableID: TIntegerField;
    mmTableDESCRICAO: TStringField;
    mmTableSIGLA: TStringField;
    mmTablePERCENTUAL_IMPOSTO: TIntegerField;
    actPesquisar: TAction;
    pnlCancelar: TPanel;
    Shape5: TShape;
    btnCancelar: TSpeedButton;
    mmTableVALOR: TFloatField;
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
    procedure FormCreate(Sender: TObject);
  private
    FCombustivel: TCombustivelModel;
    procedure Limpar;
    procedure CarregarEdits;
    procedure AtribuirValores;
    procedure Refresh;
    procedure HabilitarDefinirCampos(const pAcao: TAcao);
    procedure Pesquisar;
  public
    property Model: TCombustivelModel read FCombustivel write FCombustivel;
  end;

var
  frmCombustivel: TfrmCombustivel;

implementation

{$R *.dfm}

uses
  uConexao,
  Control.Combustivel,
  Control.Helpers.DBGridHelper;

{ TfrmCombustivel }

procedure TfrmCombustivel.Limpar;
begin
  edtCodigoFiltro.Clear;
  edtDescricaoFiltro.Clear;
  edtCodigo.Clear;
  edtDescricao.Clear;
  edtSigla.Clear;
  edtValor.Clear;
  edtPercentual.Clear;
  if Assigned(Model) then
  begin
    Model.Id := 0;
    Model.Descricao:= EmptyStr;
    Model.Sigla:= EmptyStr;
    Model.Valor:= 0;
    Model.PercentualImposto := 0;
    Model.Acao := tacIndefinido;
  end;
end;


procedure TfrmCombustivel.Pesquisar;
Var
  Control: TCombustivelControl;
  qry: TFDQuery;
begin
  Control:= TCombustivelControl.Create;
  try
    mmTable.Close;
    qry:= nil;

    if edtCodigoFiltro.Text <> EmptyStr then
      qry:= Control.BuscaPeloId(StrToInt(edtCodigoFiltro.Text))
    else if edtDescricaoFiltro.Text <> EmptyStr  then
      qry:= Control.BuscaPeloNome(edtDescricaoFiltro.Text)
    else
      qry:= Control.RetornaTodos;

    mmTable.Data := qry.Data;

  finally
    FreeAndNil(Control);
    qry.Close;
    pgDados.ActivePage := tsPesquisa;
  end;
end;

procedure TfrmCombustivel.actNovoExecute(Sender: TObject);
begin
  if Not Assigned(Model) then
    Model := TCombustivelModel.Create;
  Limpar;
  HabilitarDefinirCampos(tacIncluir);

  Model.Id:= 0;
  edtCodigo.Text:= IntToStr(Model.Id);
end;

procedure TfrmCombustivel.actPesquisarExecute(Sender: TObject);
begin
  Pesquisar;
end;

procedure TfrmCombustivel.actEditarExecute(Sender: TObject);
begin
  if Not Assigned(Model) then
    Model := TCombustivelModel.Create;
  CarregarEdits;
  HabilitarDefinirCampos(tacEdicao);
end;

procedure TfrmCombustivel.actLimparExecute(Sender: TObject);
begin
  Limpar;
end;

procedure TfrmCombustivel.actDeletarExecute(Sender: TObject);
Const MSG_EXCLUIR = 'Deseja excluir este registro %d ?';
Var
  Control: TCombustivelControl;
  msg: String;
begin
  msg := Format(MSG_EXCLUIR, [mmTableID.AsInteger]);

  if application.messagebox(PWideChar(msg),'Confirma',mb_iconquestion+mb_yesnocancel) = IDYES then
  begin
    Control := TCombustivelControl.Create;
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

procedure TfrmCombustivel.actSalvarExecute(Sender: TObject);
Var
  Control: TCombustivelControl;
  Salvar: Boolean;
begin
  AtribuirValores;
  Control := TCombustivelControl.Create;
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

procedure TfrmCombustivel.btnCancelarClick(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmCombustivel.FormShow(Sender: TObject);
Var
  Control: TCombustivelControl;
begin
  if Not Assigned(Model) then
    Model := TCombustivelModel.Create;

  Refresh;
  HabilitarDefinirCampos(tacIndefinido);
end;

procedure TfrmCombustivel.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  mmTable.Close;
  FreeAndNil(Model);
end;

procedure TfrmCombustivel.FormCreate(Sender: TObject);
begin
  dbgDados.EnableSorting;
end;

procedure TfrmCombustivel.CarregarEdits;
begin
  Model.Id := mmTableId.Value;
  Model.Descricao := mmTableDESCRICAO.AsString;
  Model.Sigla := mmTableSIGLA.AsString;
  Model.PercentualImposto := mmTablePERCENTUAL_IMPOSTO.AsInteger;
  Model.Valor := mmTableVALOR.Value;

  edtCodigo.Text     := IntToStr(Model.Id);
  edtDescricao.Text  := Model.Descricao;
  edtSigla.Text      := Model.Sigla;
  edtValor.Text      := FloatToStr(Model.Valor);
  edtPercentual.Text := IntToStr(Model.PercentualImposto);
end;

procedure TfrmCombustivel.dbgDadosDblClick(Sender: TObject);
begin
  actEditarExecute(self);
end;

procedure TfrmCombustivel.AtribuirValores;
begin
  Model.Id := StrToInt(edtCodigo.Text);
  Model.Descricao := edtDescricao.Text;
  Model.Sigla := edtSigla.Text;
  Model.Valor := StrToFloatDef(edtValor.Text, 0);
  Model.PercentualImposto := StrToIntDef(edtPercentual.Text, 0);
end;

procedure TfrmCombustivel.HabilitarDefinirCampos(const pAcao: TAcao);
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
      Refresh;
      edtCodigoFiltro.SetFocus;
    end;
  end;
  Model.Acao:= pAcao;;
end;

procedure TfrmCombustivel.Refresh;
begin
  Limpar;
  Pesquisar;
end;

end.
