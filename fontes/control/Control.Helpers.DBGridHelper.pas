unit Control.Helpers.DBGridHelper;

interface

uses
  Vcl.DBGrids, System.SysUtils, Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Intf;

type
  TDBGridHelper = class helper for TDBGrid
  private
    procedure GridTitleClick(Column: TColumn);
  public
    procedure EnableSorting;
  end;

implementation

procedure TDBGridHelper.GridTitleClick(Column: TColumn);
var
  DataSet: TDataSet;
  FDMemTable: TFDMemTable;
  FSortedFieldName: string;
begin
  DataSet := DataSource.DataSet;
  if not Assigned(DataSet) or not (DataSet is TFDMemTable) then
    Exit;

  FDMemTable := TFDMemTable(DataSet);

  FSortedFieldName := Column.FieldName;

  // Se já está ordenado pela mesma coluna, inverte a ordem
  if FDMemTable.IndexFieldNames = FSortedFieldName then
    FDMemTable.IndexFieldNames := FSortedFieldName + ':D'
  else
    FDMemTable.IndexFieldNames := FSortedFieldName;
end;

procedure TDBGridHelper.EnableSorting;
var
  i: Integer;
begin
  OnTitleClick := GridTitleClick;
  for i := 0 to Columns.Count - 1 do
    Columns[i].Title.Caption := Columns[i].Title.Caption + ' ▼';
end;

end.

