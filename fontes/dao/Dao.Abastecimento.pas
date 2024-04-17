unit Dao.Abastecimento;

interface

Uses Model.Abastecimento, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

Type
  TAbastecimentoDao = class
    private

    public
      function RegistrarAbastecimento(pAbastecimento: TAbastecimentoModel):boolean;
      function RelAbastacimentosPorData(pDataIni, pDataFim: TDate):TFDQuery;
      function RelAbastecimentoPorId(const pId: integer): TFDQuery;
      function AbastecimentoPorBomba(const pIdBomba: Integer):TFDQuery;
  end;

implementation

{ TAbastecimento }

Uses uConexao, SysUtils;

Const
  SQL_INSERT= ' INSERT INTO ABASTECIMENTO (ID, ID_BOMBA, QTD, VALOR_UNITARIO,'+
              ' PERCENTUAL_IMPOSTO, VALOR_IMPOSTO, VALOR_TOTAL, DATAHORA) '+
              ' VALUES (:ID, :ID_BOMBA, :QTD, :VALOR_UNITARIO, '+
              ' :PERCENTUAL_IMPOSTO, :VALOR_IMPOSTO, :VALOR_TOTAL, CURRENT_TIMESTAMP);';

  WHERE_COMBUSTIVEL = ' WHERE A.ID_COMBUSTIVEL = :ID';

  SQL_ABASTECER = ' SELECT B.ID, B.DESCRICAO, B.ID_TANQUE, '+
                  '       C.DESCRICAO AS DESCRICAO_COMBUSTIVEL, C.PERCENTUAL_IMPOSTO, C.VALOR'+
                  ' FROM BOMBA B'+
                  ' INNER JOIN TANQUE T ON T.ID = B.ID_TANQUE'+
                  ' INNER JOIN COMBUSTIVEL C ON C.ID = T.ID_COMBUSTIVEL';

  WHERE_BOMBA = ' WHERE B.ID = :ID';

  SQL_CUPOM = ' SELECT A.ID AS ID_ABASTECIMENTO, A.ID_BOMBA, '+
              '        B.ID_TANQUE, C.ID AS ID_COMBUSTIVEL, '+
              '        C.DESCRICAO AS COMBUSTIVEL, A.QTD, '+
              '        A.VALOR_UNITARIO, A.PERCENTUAL_IMPOSTO, '+
              '        A.VALOR_IMPOSTO, A.VALOR_TOTAL, A.DATAHORA '+
              ' FROM ABASTECIMENTO A '+
              ' INNER JOIN BOMBA B ON B.ID = A.ID_BOMBA '+
              ' INNER JOIN TANQUE T ON T.ID = B.ID_TANQUE '+
              ' INNER JOIN COMBUSTIVEL C ON C.ID = T.ID_COMBUSTIVEL ';

  SQL_ABASTECIMENTOS_AGRUPADOS = ' SELECT A.DATAHORA, '+
                                 '        B.ID_TANQUE, '+
                                 '        A.ID_BOMBA, '+
                                 '        SUM(A.QTD) AS QTD_TOTAL, '+
                                 '        AVG(A.VALOR_UNITARIO) AS MEDIA_VALOR_UNITARIO, '+
                                 '        AVG(A.PERCENTUAL_IMPOSTO) AS MEDIA_PERCENTUAL_IMPOSTO, '+
                                 '        SUM(A.VALOR_IMPOSTO) AS TOTAL_IMPOSTO, '+
                                 '        SUM(A.VALOR_TOTAL) AS TOTAL_VALOR '+
                                 ' FROM ABASTECIMENTO A '+
                                 ' INNER JOIN BOMBA B ON B.ID = A.ID_BOMBA '+
                                 ' INNER JOIN TANQUE T ON T.ID = B.ID_TANQUE '+
                                 ' INNER JOIN COMBUSTIVEL C ON C.ID = T.ID_COMBUSTIVEL '+
                                 ' GROUP BY A.DATAHORA, B.ID_TANQUE, A.ID_BOMBA, A.QTD, A.VALOR_TOTAL'+
                                 ' HAVING A.DATAHORA BETWEEN :PDATAINI AND :PDATAFIM';

  WHERE_CUPOM_DATA = ' WHERE A.DATAHORA BETWEEN :PDATAINI AND :PDATAFIM';

  WHERE_CUPOM_ID = ' WHERE A.ID = :ID ';

function TAbastecimentoDao.RelAbastacimentosPorData(pDataIni,
  pDataFim: TDate): TFDQuery;
Var
  qry: TFDquery;
begin
  qry:= DmConexao.CriaQuery;
  qry.SQL.Text := SQL_ABASTECIMENTOS_AGRUPADOS;
  qry.ParamByName('PDATAINI').AsDate := pDataIni;
  qry.ParamByName('PDATAFIM').AsDate := pDataFim;
  qry.Open;
  qry.FetchAll;
  result := qry;
end;

function TAbastecimentoDao.AbastecimentoPorBomba(
  const pIdBomba: Integer): TFDQuery;
Var
  qry: TFDquery;
begin
  qry:= DmConexao.CriaQuery;
  qry.SQL.Text := SQL_ABASTECER + WHERE_BOMBA;
  qry.ParamByName('ID').AsInteger := pIdBomba;
  qry.Open;
  qry.FetchAll;
  result := qry;
end;

function TAbastecimentoDao.RegistrarAbastecimento(
  pAbastecimento: TAbastecimentoModel): boolean;
Var
  qry: TFDquery;
begin
  result := False;
  qry:= DmConexao.CriaQuery;
  try
    qry.SQL.Text := SQL_INSERT;
    qry.ParamByName('ID').AsInteger := pAbastecimento.Id;
    qry.ParamByName('ID_BOMBA').AsInteger := pAbastecimento.IdBomba;
    qry.ParamByName('QTD').AsFloat := pAbastecimento.Qt;
    qry.ParamByName('VALOR_UNITARIO').AsFloat := pAbastecimento.ValorUnitario;
    qry.ParamByName('PERCENTUAL_IMPOSTO').AsInteger := pAbastecimento.PercentualImposto;
    qry.ParamByName('VALOR_IMPOSTO').AsFloat := pAbastecimento.ValorImposto;
    qry.ParamByName('VALOR_TOTAL').AsFloat := pAbastecimento.ValorTotal;
    qry.ExecSQL;
    result := True;
  finally
    FreeAndNil(qry);
  end;
end;

function TAbastecimentoDao.RelAbastecimentoPorId(const pId: integer): TFDQuery;
Var
  qry: TFDquery;
begin
  qry:= DmConexao.CriaQuery;
  qry.Open(SQL_CUPOM + WHERE_CUPOM_ID, [pId]);
  qry.FetchAll;
  result := qry;
end;

end.

