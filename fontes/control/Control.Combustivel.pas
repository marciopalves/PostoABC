unit Control.Combustivel;

interface

Uses Model.Combustivel, Dao.Combustivel, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

  Type TCombustivelControl = class
    private
    FDao: TCombustivelDao;

    function ValidaDados(pCombustivel: TCombustivelModel): boolean;
    function ProximoRegistro: Integer;

    public
      property Dao: TCombustivelDao read FDao write FDao;

      constructor Create;
      destructor Destroy; override;
      function RetornaTodos: TFDQuery;
      function BuscaPeloId(const pId: Integer): TFDQuery;
      function BuscaPeloNome(const pNome: String): TFDquery;
      function Deletar(const pId: Integer): Boolean;
      function Salvar(pCombustivel: TCombustivelModel): boolean;

  end;


implementation

{ TCombustivelControl }

uses
  Model.Enumerado,
  System.SysUtils,
  Dao.Sequencia,
  RTTIUtils;

constructor TCombustivelControl.Create;
begin
  FDao := TCombustivelDao.Create;
end;

destructor TCombustivelControl.Destroy;
begin
  FreeAndNil(FDao);
  inherited;
end;

function TCombustivelControl.ProximoRegistro: Integer;
begin
  result := TRegistro.Proximo('COMBUSTIVEL', 'ID');
end;

function TCombustivelControl.BuscaPeloId(const pId: Integer): TFDQuery;
begin
  result := Dao.BuscaPeloId(pId);
end;

function TCombustivelControl.BuscaPeloNome(const pNome: String): TFDquery;
begin
  result:= Dao.BuscaPeloNome(pNome);
end;

function TCombustivelControl.Deletar(const pId: Integer): Boolean;
begin
  result := false;
  if Not Dao.Referencias(pId) then
    result:= Dao.Deletar(pId);
end;

function TCombustivelControl.RetornaTodos: TFDQuery;
begin
  result:= Dao.RetornaTodos;
end;

function TCombustivelControl.Salvar(pCombustivel: TCombustivelModel): boolean;
begin
  result:= false;
  if TRTTIUTtils.ValidarCampos(pCombustivel) then
  begin
    case pCombustivel.Acao of
      tacIncluir:
      begin
        pCombustivel.Id := ProximoRegistro;
        result          := Dao.Incluir(pCombustivel);
      end;
      tacEdicao: result := Dao.Editar(pCombustivel);
    end;
  end;
end;

function TCombustivelControl.ValidaDados(
  pCombustivel: TCombustivelModel): boolean;
begin
  result := false;
  result:= (pCombustivel.Descricao <> EmptyStr) And
           (pCombustivel.Valor > 0) And
           (pCombustivel.PercentualImposto > 0) And
           (pCombustivel.Acao <> tacIndefinido);
end;

end.
