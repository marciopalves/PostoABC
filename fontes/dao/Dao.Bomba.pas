unit Dao.Bomba;

interface

Uses Model.Bomba, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

Type
  TBombaDao = class
    private

    public
      function RetornaTodos: TFDQuery;
      function BuscaPeloId(const pId: Integer): TFDQuery;
      function BuscaPeloNome(const pNome: String): TFDquery;
      function BuscaTanques: TFDquery;
      function Editar(pBomba: TBombaModel): boolean;
      function Incluir(pBomba: TBombaModel): boolean;
      function Deletar(const pId: Integer): Boolean;
      function Referencias(const pId: Integer): Boolean;
  end;

implementation

Uses uConexao, SysUtils;

Const
  SQL_GERAL = ' SELECT B.ID, B.DESCRICAO, B.ID_TANQUE, T.DESCRICAO AS TANQUE '+
              ' FROM BOMBA B '+
              ' INNER JOIN TANQUE T ON T.ID = B.ID_TANQUE ';

  SQL_ORDER = ' ORDER BY B.ID ASC ';

  SQL_TANQUES = ' SELECT T.ID, T.DESCRICAO FROM TANQUE T';

  WHERE_ID  = ' WHERE B.ID = :ID';

  WHERE_NOME = ' WHERE UPPER(B.DESCRICAO) LIKE UPPER( ''%''|| :NOME || ''%'') ';

  SQL_DELETE = ' DELETE FROM BOMBA WHERE ID = :ID;';

  SQL_UPDATE = ' UPDATE BOMBA B SET'+
               ' B.DESCRICAO = :DESCRICAO,'+
               ' B.ID_TANQUE = :ID_TANQUE'+
               ' WHERE B.ID = :ID';

  SQL_INSERT = ' INSERT INTO BOMBA (ID, DESCRICAO, ID_TANQUE)'+
               ' VALUES (:ID, :DESCRICAO, :ID_TANQUE);';

  SQL_REFERENCIA = ' SELECT A.ID FROM ABASTECIMENTO A WHERE A.ID_BOMBA = :ID_BOMBA';


{ TBombaDao }

function TBombaDao.BuscaPeloId(const pId: Integer): TFDQuery;
Var
  qry: TFDquery;
begin
  qry:= DmConexao.CriaQuery;
  qry.Open(SQL_GERAL + WHERE_ID, [pId]);
  qry.FetchAll;
  result := qry;
end;

function TBombaDao.BuscaPeloNome(const pNome: String): TFDquery;
Var
  qry: TFDquery;
begin
  qry:= DmConexao.CriaQuery;
  qry.Open(SQL_GERAL + WHERE_NOME, [pNome]);
  qry.FetchAll;
  result := qry;
end;

function TBombaDao.BuscaTanques: TFDquery;
Var
  qry: TFDquery;
begin
  qry:= DmConexao.CriaQuery;
  qry.Open(SQL_TANQUES);
  qry.FetchAll;
  result := qry;
end;

function TBombaDao.Deletar(const pId: Integer): Boolean;
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

function TBombaDao.Editar(pBomba: TBombaModel): boolean;
Var
  qry: TFDquery;
begin
  result := False;
  qry:= DmConexao.CriaQuery;
  try
    qry.Sql.Text:= SQL_UPDATE;
    qry.ParamByName('ID').AsInteger        := pBomba.Id;
    qry.ParamByName('DESCRICAO').AsString  := pBomba.Descricao;
    qry.ParamByName('ID_TANQUE').AsInteger := pBomba.IdTanque;
    qry.ExecSQL;
    result := True;
  finally
    FreeAndNil(qry);
  end;
end;

function TBombaDao.Incluir(pBomba: TBombaModel): boolean;
Var
  qry: TFDquery;
begin
  result := False;
  qry:= DmConexao.CriaQuery;
  try
    qry.Sql.Text:= SQL_INSERT;
    qry.ParamByName('ID').AsInteger       := pBomba.Id;
    qry.ParamByName('DESCRICAO').AsString := pBomba.Descricao;
    qry.ParamByName('ID_TANQUE').AsInteger:= pBomba.IdTanque;
    qry.ExecSQL;
    result := True;
  finally
    FreeAndNil(qry);
  end;
end;

function TBombaDao.Referencias(const pId: Integer): Boolean;
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

function TBombaDao.RetornaTodos: TFDQuery;
Var
  qry: TFDquery;
begin
  qry:= DmConexao.CriaQuery;
  qry.Open(SQL_GERAL+SQL_ORDER);
  qry.FetchAll;
  result := qry;
end;

end.
