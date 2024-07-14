unit DAO;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.UI.Intf,
  FireDAC.VCLUI.Wait, FireDAC.Phys.ODBCBase, Winapi.Windows;

type
  TdmMain = class(TDataModule)
    FDConnection: TFDConnection;
    FDQuery: TFDQuery;
    FDPhysMSSQLDriverLink: TFDPhysMSSQLDriverLink;
    cdsAgencias: TClientDataSet;
    cdsContas: TClientDataSet;
    procedure DataModuleCreate(Sender: TObject);
  private
    procedure ConfigurarConexao;
    function GetLocalComputerName: string;
  public
    { Public declarations }
  end;

var
  dmMain: TdmMain;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmMain.DataModuleCreate(Sender: TObject);
begin
  ConfigurarConexao;
  cdsAgencias.CreateDataSet;
  cdsContas.CreateDataSet;
end;

procedure TdmMain.ConfigurarConexao;
var
  ServerName: string;
begin
  ServerName := GetLocalComputerName;

  FDConnection.Params.Clear;
  FDConnection.Params.Add('DriverID=MSSQL');
  FDConnection.Params.Add('Server=' + ServerName);
  FDConnection.Params.Add('Database=BancoSistema');
  FDConnection.Params.Add('Integrated Security=SSPI');
  FDConnection.LoginPrompt := False;
  FDConnection.Connected := True;
end;

function TdmMain.GetLocalComputerName: string;
var
  Buffer: array[0..MAX_COMPUTERNAME_LENGTH + 1] of Char;
  Size: DWORD;
begin
  Size := SizeOf(Buffer) - 1;
  if GetComputerName(Buffer, Size) then
    Result := Buffer
  else
    Result := 'localhost';
end;

end.

