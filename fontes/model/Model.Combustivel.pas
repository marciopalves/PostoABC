unit Model.Combustivel;

interface

Uses Model.Enumerado, RTTIUtils;

Type
  TCombustivelModel = class
    private
      FId: Integer;
      FDescricao: String;
      FValor: Currency;
      FSigla: String;
      FPercentualImposto: Integer;
      FAcao: TAcao;

    public
      property Id: Integer read FId write FId;
      [NotNull('O campo descrição não pode ser Nulo')]
      [MinLength(6, 'O campo descrição não pode ter menos que seis caracteres')]
      property Descricao: String read FDescricao write FDescricao;
      [NotNull('O campo Sigla não pode ser vazio')]
      property Sigla: String read FSigla Write FSigla;
      [NotZero('O campo valor tem que ser maior que zero')]
      property Valor: Currency read FValor write FValor;
      [NotZero('O campo Percentual tem que ser maior que zero')]
      property PercentualImposto: Integer read FPercentualImposto write FPercentualImposto;
      property Acao: TAcao read FAcao write FAcao;
  end;

implementation

{ TCombustivel }



end.
