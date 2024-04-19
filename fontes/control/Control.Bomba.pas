unit Control.Bomba;

interface

uses FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Model.Bomba, Dao.Bomba;

Type
  TBombaControl = class
    private
    FDao: TBombaDao;

    function ProximoRegistro: Integer;

    public
      property Dao: TBombaDao read FDao write FDao;
      constructor Create;
      destructor Destroy; override;

      function RetornaTodos: TFDQuery;
      function BuscaPeloId(const pId: Integer): TFDQuery;
      function BuscaPeloNome(const pNome: String): TFDquery;
      function BuscaTanques: TFDquery;
      function Editar(pBomba: TBombaModel): boolean;
      function Incluir(pBomba: TBombaModel): boolean;
      function Deletar(const pId: Integer): Boolean;
      function Salvar(pBomba: TBombaModel): boolean;
  end;

implementation


Uses
  SysUtils,
  Model.Enumerado,
  Dao.Sequencia,
  RTTIUtils;

{ TBombaControl }

constructor TBombaControl.Create;
begin
  FDao := TBombaDao.Create;
end;

destructor TBombaControl.Destroy;
begin
  FreeAndNil(FDao);
  inherited;
end;

function TBombaControl.BuscaPeloId(const pId: Integer): TFDQuery;
begin
  result:= Dao.BuscaPeloId(pId);
end;

function TBombaControl.BuscaPeloNome(const pNome: String): TFDquery;
begin
 result:= Dao.BuscaPeloNome(pNome);
end;

function TBombaControl.BuscaTanques: TFDquery;
begin
  result := Dao.BuscaTanques;
end;

function TBombaControl.Deletar(const pId: Integer): Boolean;
begin
  result := Dao.Deletar(pId);
end;

function TBombaControl.Editar(pBomba: TBombaModel): boolean;
begin
  result := Dao.Editar(pBomba);
end;

function TBombaControl.Incluir(pBomba: TBombaModel): boolean;
begin
  result := Dao.Incluir(pBomba);
end;

function TBombaControl.ProximoRegistro: Integer;
begin
  result := TRegistro.Proximo('BOMBA', 'ID');
end;

function TBombaControl.RetornaTodos: TFDQuery;
begin
  result := Dao.RetornaTodos;
end;

function TBombaControl.Salvar(pBomba: TBombaModel): boolean;
begin
  result := false;
  if TRTTIUTtils.ValidarCampos(pBomba) then
  begin
    case pBomba.Acao of
      tacIncluir:
      begin
        pBomba.Id := ProximoRegistro;
        result := Dao.Incluir(pBomba);
      end;
      tacEdicao: result := Dao.Editar(pBomba);
    end;
  end;
end;

end.
