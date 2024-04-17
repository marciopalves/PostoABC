unit Dao.Combustivel;

interface

Uses Model.Combustivel, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

Type
  TCombustivelDao = class

    private

    public
      function RetornaTodos: TFDQuery;
      function BuscaPeloId(const pId: Integer): TFDQuery;
      function BuscaPeloNome(const pNome: String): TFDquery;
      function Editar(pCombustivel: TCombustivelModel): boolean;
      function Incluir(pCombustivel: TCombustivelModel): boolean;
      function Deletar(const pId: Integer): Boolean;
      function Referencias(const pId: Integer): Boolean;
      function RetornaCombustiveis: TFDQuery;
  end;


implementation

{ TCombustivelDao }

uses uConexao, SysUtils;

Const
  SQL_GERAL =' SELECT a.ID, a.DESCRICAO, a.SIGLA, a.VALOR, a.PERCENTUAL_IMPOSTO'+
             ' FROM COMBUSTIVEL a ';

  SQL_COMBUSTIVEL =' SELECT c.ID, c.DESCRICAO'+
                   ' FROM COMBUSTIVEL c ';

  WHERE_ID = ' WHERE a.Id = :Id';

  WHERE_NOME = ' WHERE UPPER(DESCRICAO) LIKE UPPER( ''%''|| :NOME || ''%'') ';

  SQL_UPDATE = ' UPDATE COMBUSTIVEL a SET '+
               '    a.DESCRICAO = :DESCRICAO,'+
               '    a.SIGLA = :SIGLA,'+
               '    a.VALOR = :VALOR,'+
               '    a.PERCENTUAL_IMPOSTO = :PERCENTUAL_IMPOSTO'+
               ' WHERE a.ID = :ID';

  SQL_INSERT = 'INSERT INTO COMBUSTIVEL (ID, DESCRICAO, SIGLA, VALOR, PERCENTUAL_IMPOSTO)'+
               'VALUES (:ID, :DESCRICAO, :SIGLA, :VALOR, :PERCENTUAL_IMPOSTO );';

  SQL_DELETE = ' DELETE FROM COMBUSTIVEL WHERE ID = :ID;';

  SQL_REFERENCIA = ' SELECT ID FROM TANQUE WHERE ID_COMBUSTIVEL = :ID_COMBUSTIVEL;';


function TCombustivelDao.RetornaTodos: TFDQuery;
Var
  qry: TFDquery;
begin
  qry:= DmConexao.CriaQuery;
  qry.Open(SQL_GERAL);
  qry.FetchAll;
  result := qry;
end;

function TCombustivelDao.BuscaPeloId(const pId: Integer): TFDQuery;
Var
  qry: TFDquery;
begin
  qry:= DmConexao.CriaQuery;
  qry.Open(SQL_GERAL + WHERE_ID, [pId]);
  qry.FetchAll;
  result := qry;
end;

function TCombustivelDao.BuscaPeloNome(const pNome: String): TFDquery;
Var
  qry: TFDquery;
begin
  qry:= DmConexao.CriaQuery;
  qry.Open(SQL_GERAL + WHERE_NOME, [pNome]);
  qry.FetchAll;
  result := qry;
end;

function TCombustivelDao.Editar(pCombustivel: TCombustivelModel): boolean;
Var
  qry: TFDquery;
begin
  result := False;
  qry:= DmConexao.CriaQuery;
  try
    qry.Sql.Text:= SQL_UPDATE;
    qry.ParamByName('ID').AsInteger := pCombustivel.Id;
    qry.ParamByName('DESCRICAO').AsString := pCombustivel.Descricao;
    qry.ParamByName('SIGLA').AsString := pCombustivel.Sigla;
    qry.ParamByName('VALOR').AsFloat := pCombustivel.Valor;
    qry.ParamByName('PERCENTUAL_IMPOSTO').AsFloat := pCombustivel.PercentualImposto;
    qry.ExecSQL;
    result := True;
  finally
    FreeAndNil(qry);
  end;
end;

function TCombustivelDao.Incluir(pCombustivel: TCombustivelModel): boolean;
Var
  qry: TFDquery;
begin
  result := False;
  qry:= DmConexao.CriaQuery;
  try
    qry.Sql.Text:= SQL_INSERT;
    qry.ParamByName('ID').AsInteger := pCombustivel.Id;
    qry.ParamByName('DESCRICAO').AsString := pCombustivel.Descricao;
    qry.ParamByName('SIGLA').AsString := pCombustivel.Sigla;
    qry.ParamByName('VALOR').AsFloat := pCombustivel.Valor;
    qry.ParamByName('PERCENTUAL_IMPOSTO').AsFloat := pCombustivel.PercentualImposto;
    qry.ExecSQL;
    result := True;
  finally
    FreeAndNil(qry);
  end;
end;

function TCombustivelDao.Deletar(const pId: Integer): Boolean;
Var
  qry: TFDquery;
begin
  result := False;
  qry:= DmConexao.CriaQuery;
  try
    qry.ExecSQL(SQL_DELETE, [pId]);
    result := True;
  finally
    FreeAndNil(qry);
  end;
end;

function TCombustivelDao.Referencias(const pId: Integer): Boolean;
Var
  qry: TFDquery;
begin
  result := False;
  qry:= DmConexao.CriaQuery;
  try
    qry.Open(SQL_REFERENCIA, [pId]);
    result := Not qry.IsEmpty;
  finally
    FreeAndNil(qry);
  end;
end;

function TCombustivelDao.RetornaCombustiveis: TFDQuery;
Var
  qry: TFDquery;
begin
  qry:= DmConexao.CriaQuery;
  qry.Open(SQL_COMBUSTIVEL);
  result := qry;
end;

end.


