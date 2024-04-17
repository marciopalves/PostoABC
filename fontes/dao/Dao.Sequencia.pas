unit Dao.Sequencia;

interface

Type
  TRegistro = class

    private

    public
      Class Function Proximo(const pTabela: String; pCampo: String):Integer;

  end;

implementation

{ TRegistro }

Uses FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uConexao, System.SysUtils;

class function TRegistro.Proximo(const pTabela: String;
  pCampo: String): Integer;
Const
  SQL_PROXIMO = ' SELECT COALESCE(MAX(%s),0) +1 AS VALOR FROM %s ';
Var
  SQL: String;
  qry: TFDQuery;
begin
  result := 0;
  SQL := Format(SQL_PROXIMO, [pCampo, pTabela]);
  qry:= DmConexao.CriaQuery;
  try
    qry.Open(SQL);
    result := qry.FieldByName('VALOR').AsInteger;
  finally
    FreeAndNil(qry);
  end;
end;

end.
