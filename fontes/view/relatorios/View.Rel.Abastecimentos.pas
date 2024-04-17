unit View.Rel.Abastecimentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  RLReport, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.StorageBin, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, Vcl.DBCtrls, FireDAC.Stan.Async,
  FireDAC.DApt;

type
  TfrmRelAbastecimentos = class(TForm)
    relAbastecimentos: TRLReport;
    mmTable: TFDMemTable;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ShowRel(const pDataInicio: TDateTime; Const pDataFim: TDateTime);
  end;

var
  frmRelAbastecimentos: TfrmRelAbastecimentos;

implementation

{$R *.dfm}

uses Control.Abastecimento;

{ TfrmFiltroRelAbastecimentos }

procedure TfrmRelAbastecimentos.ShowRel(const pDataInicio,
  pDataFim: TDateTime);
Var
  Control : TAbastecimentoControl;
  qry: TFDQuery;
begin
  Control := TAbastecimentoControl.Create;
  qry:= Control.RelAbastecimentosPorData(pDataInicio, pDataFim);
  try
    mmTable.Data := qry;
    relAbastecimentos.Preview();
  finally
    qry.Close;
    FreeAndNil(qry);
    FreeAndNil(Control);
  end;
end;

end.
