unit Model.Abastecimento;

interface

Uses Model.Enumerado;

Type TAbastecimentoModel = class
  private
    FId: Integer;
    FIdBomba: Integer;
    FCombustivel: String;
    FQt: Real;
    FValorImposto: Real;
    FPercentualImposto: Integer;
    FValorUnitario: Real;
    FDataHora: TDatetime;
    FValorTotal: Real;
    FAcao: TAcao;

  public
    property Id: Integer read FId write FId;
    property IdBomba: Integer read FIdBomba write FIdBomba;
    property Combustivel: String read FCombustivel Write FCombustivel;
    property Qt: Real read FQt write FQt;
    property ValorUnitario: Real read FValorUnitario write FValorUnitario;
    property PercentualImposto: Integer read FPercentualImposto write FPercentualImposto;
    property ValorImposto: Real read FValorImposto write FValorImposto;
    property ValorTotal: Real read FValorTotal write FValorTotal;
    property DataHora: TDatetime read FDataHora write FDataHora;
    property Acao: TAcao read FAcao write FAcao;

end;

implementation

end.
