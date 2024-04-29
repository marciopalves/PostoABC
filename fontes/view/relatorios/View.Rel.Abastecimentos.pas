unit View.Rel.Abastecimentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  RLReport, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.StorageBin, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, Vcl.DBCtrls, FireDAC.Stan.Async,
  FireDAC.DApt, Constantes;

type
  TfrmRelAbastecimentos = class(TForm)
    relAbastecimentos: TRLReport;
    mmTable: TFDMemTable;
    RLBand1: TRLBand;
    mmTableID_BOMBA: TIntegerField;
    mmTableID_TANQUE: TIntegerField;
    mmTableQTD_TOTAL: TFloatField;
    mmTableMEDIA_VALOR_UNITARIO: TFloatField;
    mmTableTOTAL_IMPOSTO: TFloatField;
    mmTableTOTAL_VALOR: TFloatField;
    RLblEmpresa: TRLLabel;
    RLlblCnpj: TRLLabel;
    RLSystemInfo: TRLSystemInfo;
    RLLabel1: TRLLabel;
    ds: TDataSource;
    RLBand2: TRLBand;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLBand3: TRLBand;
    RLLabel2: TRLLabel;
    rlblTotal: TRLLabel;
    rlblFiltro: TRLLabel;
    RLDraw1: TRLDraw;
    procedure relAbastecimentosBeforePrint(Sender: TObject;
      var PrintIt: Boolean);
  private
    { Private declarations }
    function Total: Real;
  public
    { Public declarations }
    procedure ShowRel(const pDataInicio: TDateTime; Const pDataFim: TDateTime);
  end;

var
  frmRelAbastecimentos: TfrmRelAbastecimentos;

implementation

{$R *.dfm}

uses
  Control.Abastecimento;

{ TfrmFiltroRelAbastecimentos }

procedure TfrmRelAbastecimentos.relAbastecimentosBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  rlblTotal.Caption := FormatFloat(FORMATO_VALOR_3_CASAS, total);
end;

procedure TfrmRelAbastecimentos.ShowRel(const pDataInicio,
  pDataFim: TDateTime);
Var
  Control : TAbastecimentoControl;
  qry: TFDQuery;
begin
  rlblFiltro.Caption := 'Filtro '+DateToStr(pDataInicio)+' Até '+DateToStr(pDataFim);
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

function TfrmRelAbastecimentos.Total: Real;
begin
  if Not mmTable.IsEmpty then
  begin
    try
      mmTable.DisableControls;
      mmTable.First;
      while Not mmTable.Eof do
      begin
        result := result + mmTableTOTAL_VALOR.AsFloat;
        mmtable.Next;
      end;
    finally
      mmTable.EnableControls;
      mmTable.First;
    end;
  end;
end;

end.
