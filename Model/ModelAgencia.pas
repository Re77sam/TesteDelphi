unit ModelAgencia;

interface

type
  TAgencia = class
  private
    FCodigoAgencia: string;
    FNumeroAgencia: string;
    FNomeAgencia: string;
    FNomeCidade: string;
    FEstado: string;
    FDataAbertura: TDateTime;
    FGerenteResponsavel: string;
  public
    property CodigoAgencia: string read FCodigoAgencia write FCodigoAgencia;
    property NumeroAgencia: string read FNumeroAgencia write FNumeroAgencia;
    property NomeAgencia: string read FNomeAgencia write FNomeAgencia;
    property NomeCidade: string read FNomeCidade write FNomeCidade;
    property Estado: string read FEstado write FEstado;
    property DataAbertura: TDateTime read FDataAbertura write FDataAbertura;
    property GerenteResponsavel: string read FGerenteResponsavel write FGerenteResponsavel;
  end;

implementation

end.

