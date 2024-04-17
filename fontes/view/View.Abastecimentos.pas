unit View.Abastecimentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls, Model.Abastecimento;

type
  TfrmAbastecimento = class(TForm)
    pnlContainer: TPanel;
    pnlBombas: TPanel;
    pnlBomba01: TPanel;
    Shape3: TShape;
    btnBomba01: TSpeedButton;
    pnlBomba02: TPanel;
    Shape1: TShape;
    btnBomba02: TSpeedButton;
    pnlBomba03: TPanel;
    Shape2: TShape;
    btnBomba03: TSpeedButton;
    pnlBomba04: TPanel;
    Shape4: TShape;
    btnBomba04: TSpeedButton;
    pnlDivisor01: TPanel;
    pnlDivisor02: TPanel;
    pnlDivisor03: TPanel;
    pnlDados: TPanel;
    pnlValores: TPanel;
    edtCombustivel: TEdit;
    edtQuantidade: TEdit;
    Label1: TLabel;
    edtValorUnitario: TEdit;
    Label2: TLabel;
    edtValorTotal: TEdit;
    Label3: TLabel;
    pnlRodape: TPanel;
    pnlDadosTop: TPanel;
    pnlEspacamentoRegistrar: TPanel;
    pnlEspacamento01: TPanel;
    pnlRegistrar: TPanel;
    Shape5: TShape;
    btnRegistrar: TSpeedButton;
    procedure btnBomba01Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnBomba02Click(Sender: TObject);
    procedure btnBomba03Click(Sender: TObject);
    procedure btnBomba04Click(Sender: TObject);
    procedure edtQuantidadeExit(Sender: TObject);
    procedure edtQuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure btnRegistrarClick(Sender: TObject);
  private
    FModel: TAbastecimentoModel;
    { Private declarations }

    procedure preencheDados(const pIdBomba: Integer);
    procedure LimparDados;
    procedure AtualizaValores;
    procedure RelCupom(const pId: Integer);
  public
    { Public declarations }
    property Model: TAbastecimentoModel read FModel write FModel;
  end;

var
  frmAbastecimento: TfrmAbastecimento;

implementation

Uses Control.Abastecimento, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Model.Enumerado,
  FireDAC.Stan.StorageBin, Constantes, View.Rel.Cupom;

Const
  CODIGO_BOMBA01 = 1;
  CODIGO_BOMBA02 = 2;
  CODIGO_BOMBA03 = 3;
  CODIGO_BOMBA04 = 4;

{$R *.dfm}

procedure TfrmAbastecimento.FormCreate(Sender: TObject);
begin
  FModel := TAbastecimentoModel.Create;
end;

procedure TfrmAbastecimento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(FModel);
end;

procedure TfrmAbastecimento.LimparDados;
begin
  Model.IdBomba     := 0;
  Model.Combustivel := EmptyStr;
  Model.Qt := 0;
  Model.ValorUnitario := 0;
  Model.ValorImposto := 0;
  Model.PercentualImposto := 0;
  Model.ValorTotal := 0;

  edtCombustivel.Text   := Model.Combustivel;
  edtValorUnitario.Text := FloatToStr(Model.ValorUnitario);
  edtQuantidade.Text    := FloatToStr(Model.Qt);
  edtValorTotal.Text    := FloatToStr(Model.ValorTotal);
end;

procedure TfrmAbastecimento.preencheDados(const pIdBomba: Integer);
Var
  Control: TAbastecimentoControl;
  qry: TFDQuery;
begin
  LimparDados;
  Control := TAbastecimentoControl.Create;
  qry := Control.Abastecer(pIdBomba);
  try
    Model.IdBomba           := pIdBomba;
    Model.Combustivel       := qry.FieldByName('DESCRICAO_COMBUSTIVEL').AsString;
    Model.ValorUnitario     := qry.FieldByName('VALOR').AsFloat;
    Model.PercentualImposto := qry.FieldByName('PERCENTUAL_IMPOSTO').AsInteger;

    edtCombustivel.Text     := Model.Combustivel;
    edtValorUnitario.Text   := FormatFloat(FORMATO_VALOR_3_CASAS, Model.ValorUnitario);
  finally
    FreeAndNil(qry);
    FreeAndNil(Control);
  end;
end;

procedure TfrmAbastecimento.btnBomba01Click(Sender: TObject);
begin
  preencheDados(CODIGO_BOMBA01);
end;

procedure TfrmAbastecimento.btnBomba02Click(Sender: TObject);
begin
  preencheDados(CODIGO_BOMBA02);
end;

procedure TfrmAbastecimento.btnBomba03Click(Sender: TObject);
begin
  preencheDados(CODIGO_BOMBA03);
end;

procedure TfrmAbastecimento.btnBomba04Click(Sender: TObject);
begin
  preencheDados(CODIGO_BOMBA04);
end;

procedure TfrmAbastecimento.AtualizaValores;
Var
  Control: TAbastecimentoControl;
begin
  Model.Qt := StrToFloat(edtQuantidade.Text);
  Control.Calcular(Model);
  edtQuantidade.Text := FormatFloat(FORMATO_VALOR_3_CASAS, Model.Qt);
  edtValorTotal.Text := FormatFloat(FORMATO_VALOR_3_CASAS, Model.ValorTotal);
end;

procedure TfrmAbastecimento.edtQuantidadeExit(Sender: TObject);
begin
  AtualizaValores;
end;

procedure TfrmAbastecimento.edtQuantidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['0'..'9', ',',  KEY_ESPACO, KEY_TAB, KEY_ENTER]) then
    Key := #0;

  case Key of
    KEY_TAB, KEY_ENTER:
    begin
      AtualizaValores;
      Perform(WM_NEXTDLGCTL, 0, 0);
    end;
  end;
end;

procedure TfrmAbastecimento.btnRegistrarClick(Sender: TObject);
Var
  Control: TAbastecimentoControl;
begin
  Control := TAbastecimentoControl.Create;
  try
    Model.Acao := tacIncluir;
    if Control.RegistrarAbastecimento(Model) then
      if Model.Id > 0 then
        RelCupom(Model.Id);
  finally
    FreeAndNil(Control);
    LimparDados;
  end;
end;

procedure TfrmAbastecimento.RelCupom(const pId: Integer);
begin
  if frmRelCupom = Nil then
    Application.CreateForm(TfrmRelCupom, frmRelCupom);
  try
    frmRelCupom.ShowRel(pId);
  finally
    FreeAndNil(frmRelCupom);
  end;

end;

end.
