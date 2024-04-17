unit Control.Abastecimento;

interface

uses Model.Abastecimento, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Dao.Abastecimento;

Type
  TAbastecimentoControl = class
    private
      FDao: TAbastecimentoDao;
      function ProximoRegistro: Integer;
      function ValidaDados(pAbastecimento: TAbastecimentoModel):Boolean;
    public
      constructor Create;
      destructor Destroy; override;

      property Dao: TAbastecimentoDao read FDao write FDao;
      function BuscaPeloId(const pId: Integer): TFDQuery;
      function RegistrarAbastecimento(pAbastecimento: TAbastecimentoModel): boolean;
      function Abastecer(const pIdBomba: Integer): TFDQuery;
      procedure Calcular(pAbastecimento: TAbastecimentoModel);
      function RelAbastecimentoPorId(const pId: Integer): TFDQuery;
      function RelAbastecimentosPorData(const pDataIni: TDate;
                                        const pDataFim: TDate): TFDQuery;
  end;

implementation

Uses System.SysUtils, Dao.Sequencia, Model.Enumerado;

{ TAbastecimentoControl }

constructor TAbastecimentoControl.Create;
begin
  FDao:= TAbastecimentoDao.Create;
end;

destructor TAbastecimentoControl.Destroy;
begin
  FreeAndNil(Dao);
  inherited;
end;

function TAbastecimentoControl.Abastecer(const pIdBomba: Integer): TFDQuery;
begin
  result := Dao.AbastecimentoPorBomba(pIdBomba);
end;

procedure TAbastecimentoControl.Calcular(
  pAbastecimento: TAbastecimentoModel);
begin
  if pAbastecimento.Qt <= 0 then
  begin
    pAbastecimento.Qt := 0;
    pAbastecimento.ValorTotal  := 0;
    pAbastecimento.ValorTotal  := 0;
    pAbastecimento.ValorImposto:= 0;
  end
  else
  begin
    pAbastecimento.ValorTotal  := pAbastecimento.Qt * pAbastecimento.ValorUnitario;
    pAbastecimento.ValorImposto:= (pAbastecimento.ValorTotal * pAbastecimento.PercentualImposto)/100;
  end;
end;

function TAbastecimentoControl.BuscaPeloId(const pId: Integer): TFDQuery;
begin
  result := Dao.RelAbastecimentoPorId(pId);
end;

function TAbastecimentoControl.RegistrarAbastecimento(
  pAbastecimento: TAbastecimentoModel): boolean;
begin
  if ValidaDados(pAbastecimento) then
  begin
    pAbastecimento.Id := ProximoRegistro;
    result := Dao.RegistrarAbastecimento(pAbastecimento);
  end;
end;

function TAbastecimentoControl.ProximoRegistro: Integer;
begin
  result := TRegistro.Proximo('ABASTECIMENTO', 'ID');
end;


function TAbastecimentoControl.ValidaDados(
  pAbastecimento: TAbastecimentoModel): Boolean;
begin
  result := False;
  result := (pAbastecimento.IdBomba > 0) And
            (pAbastecimento.Qt > 0) And
            (pAbastecimento.ValorTotal > 0) And
            (pAbastecimento.Acao <> tacIndefinido);
end;

function TAbastecimentoControl.RelAbastecimentoPorId(
  const pId: Integer): TFDQuery;
begin
  result := Dao.RelAbastecimentoPorId(pId);
end;

function TAbastecimentoControl.RelAbastecimentosPorData(const pDataIni,
  pDataFim: TDate): TFDQuery;
begin
  result := Dao.RelAbastacimentosPorData(pDataIni, pDataFim);
end;

end.
