unit View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList, Vcl.Menus,
  Vcl.ExtCtrls, Vcl.Imaging.jpeg, Vcl.StdCtrls, Vcl.Buttons, System.ImageList,
  Vcl.ImgList;

type
  TfrmPrincipal = class(TForm)
    ActionList: TActionList;
    actCombustivel: TAction;
    actTanques: TAction;
    actBombas: TAction;
    actAbastecimentos: TAction;
    actRelAbastecimentos: TAction;
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    CadastrodeTanques1: TMenuItem;
    CadastrodeBombas1: TMenuItem;
    CadastrodeCombustvel1: TMenuItem;
    N1: TMenuItem;
    Relatrios1: TMenuItem;
    RelatoriodeAbastecimentos1: TMenuItem;
    Vendas1: TMenuItem;
    Abastecimentos1: TMenuItem;
    pnContainer: TPanel;
    pnlLeft: TPanel;
    pnlImagem: TPanel;
    pnlBottom: TPanel;
    Image: TImage;
    pnlAbastecimento: TPanel;
    pnlDivisor01: TPanel;
    pnlDivisor02: TPanel;
    ImageList1: TImageList;
    btnAbastecimentos: TSpeedButton;
    pnlRelAbastecimentos: TPanel;
    btnRelAbastecimentos: TSpeedButton;
    pnlDivisor03: TPanel;
    procedure actCombustivelExecute(Sender: TObject);
    procedure actTanquesExecute(Sender: TObject);
    procedure actBombasExecute(Sender: TObject);
    procedure actAbastecimentosExecute(Sender: TObject);
    procedure actRelAbastecimentosExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses View.Abastecimentos, View.Combustivel, View.Tanque, View.Bomba,
  View.Filtro.Rel.Abastecimentos;


procedure TfrmPrincipal.actAbastecimentosExecute(Sender: TObject);
begin
  if frmAbastecimento = Nil then
    Application.CreateForm(TfrmAbastecimento, frmAbastecimento);

  frmAbastecimento.ShowModal;
end;

procedure TfrmPrincipal.actCombustivelExecute(Sender: TObject);
begin
  if frmCombustivel = Nil then
    Application.CreateForm(TfrmCombustivel, frmCombustivel);
  frmCombustivel.ShowModal;
end;

procedure TfrmPrincipal.actTanquesExecute(Sender: TObject);
begin
  if frmTanque = Nil then
    Application.CreateForm(TfrmTanque, frmTanque);
  frmTanque.ShowModal;
end;

procedure TfrmPrincipal.actBombasExecute(Sender: TObject);
begin
  if frmBomba = Nil then
    Application.CreateForm(TfrmBomba, frmBomba);
  frmBomba.ShowModal;
end;

procedure TfrmPrincipal.actRelAbastecimentosExecute(Sender: TObject);
begin
  if frmFiltroRelAbastecimentos = Nil then
    Application.CreateForm(TfrmFiltroRelAbastecimentos, frmFiltroRelAbastecimentos);
  frmFiltroRelAbastecimentos.ShowModal;
end;

end.
