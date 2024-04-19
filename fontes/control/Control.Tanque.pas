unit Control.Tanque;

interface

uses Model.Tanque, Dao.Tanque, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

Type
  TTanqueControl = class
    private
    FDao: TTanqueDao;

    function ValidaDados(pTanque: TTanqueModel): boolean;
    function ProximoRegistro: Integer;
    public
      property Dao: TTanqueDao read FDao write FDao;
      constructor Create;
      destructor Destroy; override;

      function RetornaTodos: TFDQuery;
      function BuscaPeloId(const pId: Integer): TFDQuery;
      function BuscaPeloNome(const pNome: String): TFDquery;
      function BuscaCombustiveis: TFDQuery;
      function Deletar(const pId: Integer): Boolean;
      function Salvar(pTanque: TTanqueModel): boolean;
  end;

implementation

Uses
  System.SysUtils,
  Dao.Sequencia,
  Model.Enumerado,
  Dao.Combustivel,
  RTTIUtils;

{ TTanqueControl }

constructor TTanqueControl.Create;
begin
  FDao := TTanqueDao.Create;
end;

destructor TTanqueControl.Destroy;
begin
  FreeAndNil(FDao);
  inherited;
end;

function TTanqueControl.ProximoRegistro: Integer;
begin
  result := TRegistro.Proximo('TANQUE', 'ID');
end;

function TTanqueControl.RetornaTodos: TFDQuery;
begin
  result := Dao.RetornaTodos;
end;

function TTanqueControl.BuscaPeloId(const pId: Integer): TFDQuery;
begin
  result := Dao.BuscaPeloId(pId);
end;

function TTanqueControl.BuscaPeloNome(const pNome: String): TFDquery;
begin
  result:= Dao.BuscaPeloNome(pNome);
end;

function TTanqueControl.Deletar(const pId: Integer): Boolean;
begin
  result := false;
  if Not Dao.Referencias(pId) then
    result:= Dao.Deletar(pId);
end;

function TTanqueControl.Salvar(pTanque: TTanqueModel): boolean;
begin
  result:= false;
  if TRTTIUTtils.ValidarCampos(pTanque) then
  begin
    case pTanque.Acao of
      tacIncluir:
      begin
        pTanque.Id := ProximoRegistro;
        result     := Dao.Incluir(pTanque);
      end;
      tacEdicao:  result := Dao.Editar(pTanque);
    end;
  end;
end;

function TTanqueControl.ValidaDados(pTanque: TTanqueModel): boolean;
begin
  result := false;
  result:=  (pTanque.Descricao <> EmptyStr) And
            (pTanque.IdCombustivel > 0) And
            (pTanque.Acao <> tacIndefinido);
end;

function TTanqueControl.BuscaCombustiveis: TFDQuery;
Var
  DaoCombustivel: TCombustivelDao;
begin
  DaoCombustivel:= TCombustivelDao.Create;
  result := DaoCombustivel.RetornaCombustiveis;
end;

end.
