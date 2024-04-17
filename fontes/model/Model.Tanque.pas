unit Model.Tanque;

interface

Uses Model.Enumerado;

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
      property Descricao: String read FDescricao write FDescricao;
      property IdCombustivel: Integer read FIdCombustivel write FIdCombustivel;
      property DescricaoCombustivel: String read FDecricaoCombustivel write FDecricaoCombustivel;
      property Armazenamento: Real read FArmazenamento write FArmazenamento;
      property Acao: TAcao read FAcao write FAcao;
  end;



implementation

{ TTanque }

end.
