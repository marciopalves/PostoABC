unit View.Filtro.Rel.Abastecimentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TfrmFiltroRelAbastecimentos = class(TForm)
    pnlCoontainer: TPanel;
    pnlBody: TPanel;
    pnlRodape: TPanel;
    dtpInicio: TDateTimePicker;
    dtpFim: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    btnPesquisar: TButton;
    btnCancelar: TButton;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFiltroRelAbastecimentos: TfrmFiltroRelAbastecimentos;

implementation

{$R *.dfm}

uses View.Rel.Abastecimentos;

procedure TfrmFiltroRelAbastecimentos.FormShow(Sender: TObject);
begin
  dtpInicio.DateTime := Now;
  dtpFim.DateTime    := Now;
end;

procedure TfrmFiltroRelAbastecimentos.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmFiltroRelAbastecimentos.btnPesquisarClick(Sender: TObject);
begin
  if frmRelAbastecimentos = Nil then
    Application.CreateForm(TfrmRelAbastecimentos, frmRelAbastecimentos);
  frmRelAbastecimentos.ShowRel(dtpInicio.DateTime, dtpFim.DateTime);
end;



end.
