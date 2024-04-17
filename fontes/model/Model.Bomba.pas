unit Model.Bomba;

interface

Uses Model.Enumerado;

Type
  TBombaModel = class
    private
      FId: Integer;
      FDescricao: String;
      FIdTanque: Integer;
      FDescricaoTanque: String;
      FAcao: TAcao;

    public
      property Id: Integer read FId write FId;
      property Descricao: String read FDescricao write FDescricao;
      property IdTanque: Integer read FIdTanque write FIdTanque;
      property DescricaoTanque: String read FDescricaoTanque write FDescricaoTanque;
      property Acao: TAcao read FAcao write FAcao;
  end;

implementation

end.

