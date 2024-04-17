unit uConexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Comp.UI, FireDAC.Phys.IBBase,
  Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TDmConexao = class(TDataModule)
    FConn: TFDConnection;
    FDPhysFBDriverLink: TFDPhysFBDriverLink;
    FDGUIxWaitCursor: TFDGUIxWaitCursor;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    procedure ConfigurarConexao;
  public
    { Public declarations }
    function CriaQuery: TFDQuery;
  end;

var
  DmConexao: TDmConexao;

const
  PATH_BANCO: string = 'C:\projetos\delphi\Fortes\BD\FORTESAPP.FDB';
  PATH_DLL = 'C:\projetos\delphi\Fortes\BD\fbclient.dll';
  DRIVER_FIREBIRD = 'FB';
  USUARIO_BANCO = 'SYSDBA';
  PASSWORD = 'masterkey';

implementation

{$R *.dfm}

{ TDmConexao }

procedure TDmConexao.ConfigurarConexao;
begin
  FConn.Params.DriverID := DRIVER_FIREBIRD;
  FConn.Params.Database := PATH_BANCO;
  FConn.Params.UserName := USUARIO_BANCO;
  FConn.Params.Password := PASSWORD;
  FConn.LoginPrompt     := False;
  FConn.FormatOptions.OwnMapRules := True;
  FConn.FormatOptions.MapRules.Add(dtSingle, dtDouble);
  FConn.Connected       := True;
end;

function TDmConexao.CriaQuery: TFDQuery;
var
  VQuery: TFDQuery;
begin
  VQuery := TFDQuery.Create(nil);
  VQuery.Connection := FConn;
  Result := VQuery;
end;

procedure TDmConexao.DataModuleCreate(Sender: TObject);
begin
  ConfigurarConexao;
end;

end.
