unit View.Bomba;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  System.Actions, Vcl.ActnList, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Stan.StorageBin,
  Vcl.DBCtrls, uConexao, Model.Enumerado, Model.Bomba;

type
  TfrmBomba = class(TForm)
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
    ds: TDataSource;
    actCancelar: TAction;
    mmTable: TFDMemTable;
    actPesquisar: TAction;
    pnlCancelar: TPanel;
    Shape5: TShape;
    btnCancelar: TSpeedButton;
    mmTableID: TIntegerField;
    mmTableDESCRICAO: TStringField;
    cbbTanques: TComboBox;
    mmTableTANQUE: TStringField;
    mmTableID_TANQUE: TIntegerField;
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
    FBomba: TBombaModel;

    procedure Limpar;
    procedure CarregarTanques;
    procedure CarregarEdits;
    procedure AtribuirValores;
    procedure Refresh;
    procedure HabilitarDefinirCampos(const pAcao: TAcao);
    procedure Pesquisar;
  public
    property Model: TBombaModel read FBomba write FBomba;
  end;

var
  frmBomba: TfrmBomba;

implementation

{$R *.dfm}

uses

  Control.Bomba,
  Constantes;

{ TfrmCombustivel }

procedure TfrmBomba.Limpar;
begin
  edtCodigoFiltro.Clear;
  edtDescricaoFiltro.Clear;
  edtCodigo.Clear;
  edtDescricao.Clear;
  cbbTanques.ItemIndex := INDICE_INDEFINIDO;

  if Assigned(Model) then
  begin
    Model.Id := 0;
    Model.Descricao:= EmptyStr;
    Model.IdTanque := 0;
    Model.Acao := tacIndefinido;
  end;
end;

procedure TfrmBomba.Pesquisar;
Var
  Control: TBombaControl;
  qryBomba: TFDQuery;
  vCont: Integer;
  FieldValue: Variant;
begin
  Control:= TBombaControl.Create;
  try
    mmTable.Close;
    qryBomba:= nil;

    if edtCodigoFiltro.Text <> EmptyStr then
      qryBomba:= Control.BuscaPeloId(StrToInt(edtCodigoFiltro.Text))
    else if edtDescricaoFiltro.Text <> EmptyStr  then
      qryBomba:= Control.BuscaPeloNome(edtDescricaoFiltro.Text)
    else
      qryBomba:= Control.RetornaTodos;

    mmTable.Data := qryBomba;

  finally
    FreeAndNil(Control);
    qryBomba.Close;
    pgDados.ActivePage := tsPesquisa;
  end;
end;

procedure TfrmBomba.actNovoExecute(Sender: TObject);
begin
  if Not Assigned(Model) then
    Model := TBombaModel.Create;
  Limpar;
  HabilitarDefinirCampos(tacIncluir);

  Model.Id:= 0;
  edtCodigo.Text:= IntToStr(Model.Id);
end;

procedure TfrmBomba.actPesquisarExecute(Sender: TObject);
begin
  Pesquisar;
end;

procedure TfrmBomba.actEditarExecute(Sender: TObject);
begin
  if Not Assigned(Model) then
    Model := TBombaModel.Create;
  CarregarEdits;
  HabilitarDefinirCampos(tacEdicao);
end;

procedure TfrmBomba.actLimparExecute(Sender: TObject);
begin
  Limpar;
end;

procedure TfrmBomba.actDeletarExecute(Sender: TObject);
Const MSG_EXCLUIR = 'Deseja excluir este registro %d ?';
Var
  Control: TBombaControl;
  msg: String;
begin
  msg := Format(MSG_EXCLUIR, [mmTableID.AsInteger]);

  if application.messagebox(PWideChar(msg),'Confirma',mb_iconquestion+mb_yesnocancel) = IDYES then
  begin
    Control := TBombaControl.Create;
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

procedure TfrmBomba.actSalvarExecute(Sender: TObject);
Var
  Control: TBombaControl;
begin
  AtribuirValores;
  Control := TBombaControl.Create;
  try
    if Control.Salvar(Model) then
      application.messagebox('Registro gravado com sucesso!','Atenção',MB_ICONWARNING+MB_OK)
    else
    begin
      application.messagebox('Falha existem dados que precisam ser preenchidos!','Atenção',MB_ICONWARNING+MB_OK);
      edtDescricao.SetFocus;
    end;
  finally
    FreeAndNil(Control);
    Refresh;
    HabilitarDefinirCampos(tacIndefinido);
  end;
end;

procedure TfrmBomba.btnCancelarClick(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmBomba.FormCreate(Sender: TObject);
begin
  Model := TBombaModel.Create;
end;

procedure TfrmBomba.FormShow(Sender: TObject);
Var
  Control: TBombaControl;
begin
  if Not Assigned(Model) then
    Model := TBombaModel.Create;

  Refresh;
  HabilitarDefinirCampos(tacIndefinido);
end;

procedure TfrmBomba.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  mmTable.Close;
  FreeAndNil(Model);
end;

procedure TfrmBomba.CarregarEdits;

procedure DefinirIndiceTanque;
Var
  Indice: Integer;
begin
  if Model.IdTanque > 0 then
  begin
    for Indice := 0 to cbbTanques.Items.Count - 1 do
    begin
      if Integer(cbbTanques.Items.Objects[Indice]) = Model.IdTanque then
      begin
        cbbTanques.ItemIndex := Indice;
        Exit;
      end;
    end;
  end;
end;

begin
  Model.Id := mmTableId.Value;
  Model.Descricao := mmTableDescricao.AsString;
  Model.IdTanque  := mmTableID_TANQUE.AsInteger;

  edtCodigo.Text        := IntToStr(Model.Id);
  edtDescricao.Text     := Model.Descricao;
  DefinirIndiceTanque;
end;

procedure TfrmBomba.dbgDadosDblClick(Sender: TObject);
begin
  actEditarExecute(self);
end;

procedure TfrmBomba.edtArmazenamentoKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', ',',  KEY_ESPACO, KEY_TAB, KEY_ENTER]) then
    Key := #0;
end;

procedure TfrmBomba.AtribuirValores;
begin
  Model.Id        := StrToInt(edtCodigo.Text);
  Model.Descricao := edtDescricao.Text;
  Model.IdTanque  := Integer(cbbTanques.Items.Objects[cbbTanques.ItemIndex]);;
end;

procedure TfrmBomba.HabilitarDefinirCampos(const pAcao: TAcao);
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

procedure TfrmBomba.Refresh;
begin
  Pesquisar;
  CarregarTanques;
  Limpar;
end;

procedure TfrmBomba.CarregarTanques;
Var
  Control: TBombaControl;
  qryTanques: TFDQuery;
begin
  Control:= TBombaControl.Create;
  qryTanques:= DmConexao.CriaQuery;
  qryTanques:= Control.BuscaTanques;
  try
    qryTanques.First;
    qryTanques.DisableControls;
    while Not qryTanques.Eof do
    begin
      cbbTanques.AddItem(qryTanques.FieldByName('DESCRICAO').AsString,
                         TObject(qryTanques.FieldByName('ID').AsInteger));
      qryTanques.Next;
    end;
  finally
    FreeAndNil(Control);
    FreeAndNil(qryTanques);
  end;
end;

end.
