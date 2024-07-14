unit ControllerAgencia;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Datasnap.DBClient, ModelAgencia, FireDAC.Comp.Client;

type
  TControllerAgencia = class
  private
    FDataSet: TClientDataSet;
    FFDQuery: TFDQuery;
  public
    constructor Create(DataSet: TClientDataSet; FDQuery: TFDQuery);
    procedure AdicionarAgencia(Agencia: TAgencia);
    procedure EditarAgencia(Agencia: TAgencia);
    procedure ExcluirAgencia(CodigoAgencia: string);
    procedure ConsultarAgencias;
  end;

implementation

constructor TControllerAgencia.Create(DataSet: TClientDataSet; FDQuery: TFDQuery);
begin
  FDataSet := DataSet;
  FFDQuery := FDQuery;
end;

procedure TControllerAgencia.AdicionarAgencia(Agencia: TAgencia);
begin
  FDataSet.Append;
  FDataSet.FieldByName('CodigoAgencia').AsString := Agencia.CodigoAgencia;
  FDataSet.FieldByName('NumeroAgencia').AsString := Agencia.NumeroAgencia;
  FDataSet.FieldByName('NomeAgencia').AsString := Agencia.NomeAgencia;
  FDataSet.FieldByName('NomeCidade').AsString := Agencia.NomeCidade;
  FDataSet.FieldByName('Estado').AsString := Agencia.Estado;
  FDataSet.FieldByName('DataAbertura').AsDateTime := Agencia.DataAbertura;
  FDataSet.FieldByName('GerenteResponsavel').AsString := Agencia.GerenteResponsavel;
  FDataSet.Post;
end;

procedure TControllerAgencia.EditarAgencia(Agencia: TAgencia);
begin
  if FDataSet.Locate('CodigoAgencia', Agencia.CodigoAgencia, []) then
  begin
    FDataSet.Edit;
    FDataSet.FieldByName('NumeroAgencia').AsString := Agencia.NumeroAgencia;
    FDataSet.FieldByName('NomeAgencia').AsString := Agencia.NomeAgencia;
    FDataSet.FieldByName('NomeCidade').AsString := Agencia.NomeCidade;
    FDataSet.FieldByName('Estado').AsString := Agencia.Estado;
    FDataSet.FieldByName('DataAbertura').AsDateTime := Agencia.DataAbertura;
    FDataSet.FieldByName('GerenteResponsavel').AsString := Agencia.GerenteResponsavel;
    FDataSet.Post;
  end;
end;

procedure TControllerAgencia.ExcluirAgencia(CodigoAgencia: string);
begin
  if FDataSet.Locate('CodigoAgencia', CodigoAgencia, []) then
    FDataSet.Delete;
end;

procedure TControllerAgencia.ConsultarAgencias;
begin
  FFDQuery.SQL.Text := 'SELECT CodigoAgencia, NumeroAgencia, NomeAgencia, NomeCidade, Estado, DataAbertura, GerenteResponsavel FROM Agencia';
  FFDQuery.Open;

  FDataSet.EmptyDataSet;
  while not FFDQuery.Eof do
  begin
    FDataSet.Append;
    FDataSet.FieldByName('CodigoAgencia').AsString := FFDQuery.FieldByName('CodigoAgencia').AsString;
    FDataSet.FieldByName('NumeroAgencia').AsString := FFDQuery.FieldByName('NumeroAgencia').AsString;
    FDataSet.FieldByName('NomeAgencia').AsString := FFDQuery.FieldByName('NomeAgencia').AsString;
    FDataSet.FieldByName('NomeCidade').AsString := FFDQuery.FieldByName('NomeCidade').AsString;
    FDataSet.FieldByName('Estado').AsString := FFDQuery.FieldByName('Estado').AsString;
    FDataSet.FieldByName('DataAbertura').AsDateTime := FFDQuery.FieldByName('DataAbertura').AsDateTime;
    FDataSet.FieldByName('GerenteResponsavel').AsString := FFDQuery.FieldByName('GerenteResponsavel').AsString;
    FDataSet.Post;

    FFDQuery.Next;
  end;

  FFDQuery.Close;
end;

end.

