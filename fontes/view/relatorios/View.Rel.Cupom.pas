unit View.Rel.Cupom;

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
  TfrmRelCupom = class(TForm)
    relCupom: TRLReport;
    mmTable: TFDMemTable;
    mmTableID_ABASTECIMENTO: TIntegerField;
    mmTableCOMBUSTIVEL: TStringField;
    mmTableQTD: TFloatField;
    mmTableVALOR_UNITARIO: TFloatField;
    mmTableVALOR_IMPOSTO: TFloatField;
    mmTableVALOR_TOTAL: TFloatField;
    dsRel: TDataSource;
    RLBandTitle: TRLBand;
    RLblEmpresa: TRLLabel;
    RLlblCnpj: TRLLabel;
    RLBandHeader: TRLBand;
    RLSystemInfo: TRLSystemInfo;
    RLLabel1: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLBand1: TRLBand;
    DBEdit1: TDBEdit;
    RLLabel9: TRLLabel;
    RLDBCoo: TRLDBText;
    RLDBComb: TRLDBText;
    RLDBQtd: TRLDBText;
    RLDBUN: TRLDBText;
    RLDBPerImp: TRLDBText;
    RLDBVLIMP: TRLDBText;
    RLDBVLTotal: TRLDBText;
    RLBand2: TRLBand;
    RLSystemInfo1: TRLSystemInfo;
    RLLabel2: TRLLabel;
    mmTablemmTablePERCENTUAL_IMPOSTO: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ShowRel(const pId: Integer);
  end;

var
  frmRelCupom: TfrmRelCupom;

implementation

{$R *.dfm}

uses Control.Abastecimento;

{ TfrmRelCupom }

procedure TfrmRelCupom.ShowRel(const pId: Integer);
Var
  Control : TAbastecimentoControl;
  qry: TFDQuery;
begin
  Control := TAbastecimentoControl.Create;
  qry:= Control.RelAbastecimentoPorId(pId);
  try
    mmTable.Data := qry;
    relCupom.Preview();
  finally
    qry.Close;
    FreeAndNil(qry);
    FreeAndNil(Control);
  end;
end;

end.
