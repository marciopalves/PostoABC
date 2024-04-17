unit Model.Combustivel;

interface

Uses Model.Enumerado;

Type
  TCombustivelModel = class
    private
      FId: Integer;
      FDescricao: String;
      FValor: Real;
      FSigla: String;
      FPercentualImposto: Integer;
      FAcao: TAcao;

    public
      property Id: Integer read FId write FId;
      property Descricao: String read FDescricao write FDescricao;
      property Sigla: String read FSigla Write FSigla;
      property Valor: Real read FValor write FValor;
      property PercentualImposto: Integer read FPercentualImposto write FPercentualImposto;
      property Acao: TAcao read FAcao write FAcao;
  end;

implementation

{ TCombustivel }



end.
