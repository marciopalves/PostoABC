unit Model.Tanque;

interface

Uses Model.Enumerado, RTTIUtils;

Type
  TTanqueModel = class
    private
      FId: Integer;
      FDescricao: String;
      FIdCombustivel: Integer;
      FDecricaoCombustivel: String;
      FArmazenamento: Real;
      FAcao: TAcao;

    public
      property Id: Integer read FId write FId;
      [NotNull('O campo descrição não pode ser Nulo')]
      property Descricao: String read FDescricao write FDescricao;
      [NotZero('O campo IdCombustivel tem que ser maior que zero')]
      property IdCombustivel: Integer read FIdCombustivel write FIdCombustivel;
      property DescricaoCombustivel: String read FDecricaoCombustivel write FDecricaoCombustivel;
      [NotZero('O campo Armazenamento tem que ser maior que zero')]
      property Armazenamento: Real read FArmazenamento write FArmazenamento;
      property Acao: TAcao read FAcao write FAcao;
  end;



implementation

{ TTanque }

end.
