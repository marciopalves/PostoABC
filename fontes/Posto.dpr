program Posto;

uses
  Vcl.Forms,
  Model.Enumerado in 'model\Model.Enumerado.pas',
  Model.Combustivel in 'model\Model.Combustivel.pas',
  Model.Tanque in 'model\Model.Tanque.pas',
  Model.Bomba in 'model\Model.Bomba.pas',
  Model.Abastecimento in 'model\Model.Abastecimento.pas',
  uConexao in 'dao\uConexao.pas' {DmConexao: TDataModule},
  Dao.Sequencia in 'dao\Dao.Sequencia.pas',
  Dao.Combustivel in 'dao\Dao.Combustivel.pas',
  Dao.Tanque in 'dao\Dao.Tanque.pas',
  Dao.Bomba in 'dao\Dao.Bomba.pas',
  Dao.Abastecimento in 'dao\Dao.Abastecimento.pas',
  Constantes in 'control\Constantes.pas',
  Control.Combustivel in 'control\Control.Combustivel.pas',
  Control.Tanque in 'control\Control.Tanque.pas',
  Control.Bomba in 'control\Control.Bomba.pas',
  Control.Abastecimento in 'control\Control.Abastecimento.pas',
  View.Principal in 'view\View.Principal.pas' {frmPrincipal},
  View.Combustivel in 'view\View.Combustivel.pas' {frmCombustivel},
  View.Bomba in 'view\View.Bomba.pas' {frmBomba},
  View.Tanque in 'view\View.Tanque.pas' {frmTanque},
  View.Abastecimentos in 'view\View.Abastecimentos.pas' {frmAbastecimento},
  View.Rel.Cupom in 'view\relatorios\View.Rel.Cupom.pas' {frmRelCupom},
  View.Filtro.Rel.Abastecimentos in 'view\relatorios\View.Filtro.Rel.Abastecimentos.pas' {frmFiltroRelAbastecimentos},
  View.Rel.Abastecimentos in 'view\relatorios\View.Rel.Abastecimentos.pas' {frmRelAbastecimentos};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDmConexao, DmConexao);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmRelAbastecimentos, frmRelAbastecimentos);
  Application.Run;
end.
