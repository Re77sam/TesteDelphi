unit ControllerConta;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Datasnap.DBClient, ModelConta, FireDAC.Comp.Client;

type
  TControllerConta = class
  private
    FDataSet: TClientDataSet;
    FFDQuery: TFDQuery;
  public
    constructor Create(DataSet: TClientDataSet; FDQuery: TFDQuery);
    procedure AdicionarConta(Conta: TConta);
    procedure EditarConta(Conta: TConta);
    procedure ExcluirConta(CodigoConta: string);
    procedure ConsultarContas;
  end;

implementation

constructor TControllerConta.Create(DataSet: TClientDataSet; FDQuery: TFDQuery);
begin
  FDataSet := DataSet;
  FFDQuery := FDQuery;
end;

procedure TControllerConta.AdicionarConta(Conta: TConta);
begin
  FDataSet.Append;
  FDataSet.FieldByName('CodigoConta').AsString := Conta.CodigoConta;
  FDataSet.FieldByName('NumeroConta').AsString := Conta.NumeroConta;
  FDataSet.FieldByName('DigitoConta').AsString := Conta.DigitoConta;
  FDataSet.FieldByName('CodigoAgencia').AsString := Conta.CodigoAgencia;
  FDataSet.FieldByName('NumeroAgencia').AsString := Conta.NumeroAgencia;
  FDataSet.FieldByName('TitularConta').AsString := Conta.TitularConta;
  FDataSet.FieldByName('GerenteConta').AsString := Conta.GerenteConta;
  FDataSet.Post;
end;

procedure TControllerConta.EditarConta(Conta: TConta);
begin
  if FDataSet.Locate('CodigoConta', Conta.CodigoConta, []) then
  begin
    FDataSet.Edit;
    FDataSet.FieldByName('NumeroConta').AsString := Conta.NumeroConta;
    FDataSet.FieldByName('DigitoConta').AsString := Conta.DigitoConta;
    FDataSet.FieldByName('CodigoAgencia').AsString := Conta.CodigoAgencia;
    FDataSet.FieldByName('NumeroAgencia').AsString := Conta.NumeroAgencia;
    FDataSet.FieldByName('TitularConta').AsString := Conta.TitularConta;
    FDataSet.FieldByName('GerenteConta').AsString := Conta.GerenteConta;
    FDataSet.Post;
  end;
end;

procedure TControllerConta.ExcluirConta(CodigoConta: string);
begin
  if FDataSet.Locate('CodigoConta', CodigoConta, []) then
    FDataSet.Delete;
end;

procedure TControllerConta.ConsultarContas;
begin
  FFDQuery.SQL.Text := 'SELECT CodigoConta, NumeroConta, DigitoConta, CodigoAgencia, NumeroAgencia, TitularConta, GerenteConta FROM Conta';
  FFDQuery.Open;

  FDataSet.EmptyDataSet;
  while not FFDQuery.Eof do
  begin
    FDataSet.Append;
    FDataSet.FieldByName('CodigoConta').AsString := FFDQuery.FieldByName('CodigoConta').AsString;
    FDataSet.FieldByName('NumeroConta').AsString := FFDQuery.FieldByName('NumeroConta').AsString;
    FDataSet.FieldByName('DigitoConta').AsString := FFDQuery.FieldByName('DigitoConta').AsString;
    FDataSet.FieldByName('CodigoAgencia').AsString := FFDQuery.FieldByName('CodigoAgencia').AsString;
    FDataSet.FieldByName('NumeroAgencia').AsString := FFDQuery.FieldByName('NumeroAgencia').AsString;
    FDataSet.FieldByName('TitularConta').AsString := FFDQuery.FieldByName('TitularConta').AsString;
    FDataSet.FieldByName('GerenteConta').AsString := FFDQuery.FieldByName('GerenteConta').AsString;
    FDataSet.Post;

    FFDQuery.Next;
  end;

  FFDQuery.Close;
end;

end.

