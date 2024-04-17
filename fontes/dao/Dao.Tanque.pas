unit Dao.Tanque;

interface

Uses Model.Tanque, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

Type
  TTanqueDao = class
    private

    public
      function RetornaTodos: TFDQuery;
      function BuscaPeloId(const pId: Integer): TFDQuery;
      function BuscaPeloNome(const pNome: String): TFDquery;
      function Editar(pTanque: TTanqueModel): boolean;
      function Incluir(pTanque: TTanqueModel): boolean;
      function Deletar(const pId: Integer): Boolean;
      function Referencias(const pId: Integer): Boolean;
  end;

implementation

{ TTanqueDao }

uses uConexao, SysUtils;

Const
  SQL_GERAL =' SELECT T.ID, T.DESCRICAO, T.ID_COMBUSTIVEL, '+
             '        C.DESCRICAO AS COMBUSTIVEL, '+
             '        T.ARMAZENAMENTO '+
             ' FROM TANQUE T '+
             ' INNER JOIN COMBUSTIVEL C ON C.ID = T.ID_COMBUSTIVEL';

  WHERE_ID = ' WHERE T.ID = :ID ';

  WHERE_NOME = ' WHERE UPPER(T.DESCRICAO) LIKE UPPER( ''%''|| :NOME || ''%'') ';

  SQL_DELETE = ' DELETE FROM TANQUE T WHERE T.ID = :ID';

  SQL_UPDATE = ' UPDATE TANQUE T SET '+
               ' T.ID = :ID,'+
               ' T.DESCRICAO = :DESCRICAO,'+
               ' T.ID_COMBUSTIVEL = :ID_COMBUSTIVEL,'+
               ' T.ARMAZENAMENTO = :ARMAZENAMENTO'+
               ' WHERE T.ID = :ID';

  SQL_INSERT = ' INSERT INTO TANQUE (ID, DESCRICAO, ID_COMBUSTIVEL, ARMAZENAMENTO)'+
               ' VALUES (:ID, :DESCRICAO, :ID_COMBUSTIVEL, :ARMAZENAMENTO);';

  SQL_REFERENCIA = ' SELECT ID FROM BOMBA B WHERE B.ID_TANQUE = :ID';


function TTanqueDao.RetornaTodos: TFDQuery;
Var
  qry: TFDquery;
begin
  qry:= DmConexao.CriaQuery;
  qry.Open(SQL_GERAL);
  qry.FetchAll;
  result := qry;
end;

function TTanqueDao.BuscaPeloId(const pId: Integer): TFDQuery;
Var
  qry: TFDquery;
begin
  qry:= DmConexao.CriaQuery;
  qry.Open(SQL_GERAL + WHERE_ID, [pId]);
  qry.FetchAll;
  result := qry;
end;

function TTanqueDao.BuscaPeloNome(const pNome: String): TFDquery;
Var
  qry: TFDquery;
begin
  qry:= DmConexao.CriaQuery;
  qry.Open(SQL_GERAL + WHERE_NOME, [pNome]);
  qry.FetchAll;
  result := qry;
end;

function TTanqueDao.Deletar(const pId: Integer): Boolean;
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

function TTanqueDao.Editar(pTanque: TTanqueModel): boolean;
Var
  qry: TFDquery;
begin
  result := False;
  qry:= DmConexao.CriaQuery;
  try
    qry.Sql.Text:= SQL_UPDATE;
    qry.ParamByName('ID').AsInteger       := pTanque.Id;
    qry.ParamByName('DESCRICAO').AsString := pTanque.Descricao;
    qry.ParamByName('ID_COMBUSTIVEL').AsInteger := pTanque.Id;
    qry.ParamByName('ARMAZENAMENTO').AsFloat := pTanque.Armazenamento;
    qry.ExecSQL;
    result := True;
  finally
    FreeAndNil(qry);
  end;
end;

function TTanqueDao.Incluir(pTanque: TTanqueModel): boolean;
Var
  qry: TFDquery;
begin
  result := False;
  qry:= DmConexao.CriaQuery;
  try
    qry.Sql.Text:= SQL_INSERT;
    qry.ParamByName('ID').AsInteger       := pTanque.Id;
    qry.ParamByName('DESCRICAO').AsString := pTanque.Descricao;
    qry.ParamByName('ID_COMBUSTIVEL').AsInteger := pTanque.Id;
    qry.ParamByName('ARMAZENAMENTO').AsFloat := pTanque.Armazenamento;
    qry.ExecSQL;
    result := True;
  finally
    FreeAndNil(qry);
  end;
end;

function TTanqueDao.Referencias(const pId: Integer): Boolean;
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

end.
