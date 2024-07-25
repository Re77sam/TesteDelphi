unit RelatorioForm;

interface

uses
  Vcl.Forms, Vcl.Controls, Vcl.StdCtrls, Vcl.ExtCtrls, frxClass, frxDBSet, System.Classes, DataModule, ConsultaForm,
  frCoreClasses, System.SysUtils;

type
  TFormRelatorio = class(TForm)
    pnlTop: TPanel;
    pnlMain: TPanel;
    btnGerarRelatorio: TButton;
    btnSelecionar: TButton;
    frxReport: TfrxReport;
    frxDBDatasetAgencias: TfrxDBDataset;
    frxDBDatasetContas: TfrxDBDataset;
    lblSelecionado: TLabel;
    rdbTipo: TRadioGroup;
    procedure btnGerarRelatorioClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    SelectedCodigo: string;
    SelectedNome: string;
  public
    { Public declarations }
  end;

var
  FormRelatorio: TFormRelatorio;

implementation

{$R *.dfm}

procedure TFormRelatorio.FormCreate(Sender: TObject);
begin
  frxDBDatasetAgencias.DataSet := dmMain.cdsAgencias;
  frxDBDatasetContas.DataSet := dmMain.cdsContas;

  lblSelecionado.Caption := 'Nenhum selecionado';
  SelectedCodigo := '';
  SelectedNome := '';
end;

procedure TFormRelatorio.btnSelecionarClick(Sender: TObject);
var
  Consulta: TFormConsulta;
  Resposta: String;
begin
  Consulta := TFormConsulta.Create(Self,1);
  try
    // Verifica qual opção está selecionada no radio button
    if rdbTipo.ItemIndex = 0 then
    begin
      Consulta.SetConsultaTipo(ctAgencia); // Configurando para exibir agências
    end
    else if rdbTipo.ItemIndex = 1 then
    begin
      Consulta.SetConsultaTipo(ctConta); // Configurando para exibir contas
    end;

    // Executa a consulta automaticamente ao abrir o formulário
    Consulta.btnTodosClick(Sender);

    // Verifica se o usuário confirmou a seleção
    if Consulta.ShowModal = mrOk then
    begin
      // Define os valores selecionados com base na escolha do tipo de consulta
      if rdbTipo.ItemIndex = 0 then
      begin
        SelectedCodigo := Consulta.cdsConsulta.FieldByName('CodigoAgencia').AsString;
        SelectedNome := Consulta.cdsConsulta.FieldByName('NomeAgencia').AsString;
        lblSelecionado.Caption := 'Agência: ' + SelectedNome;
      end
      else if rdbTipo.ItemIndex = 1 then
      begin
        SelectedCodigo := Consulta.cdsConsulta.FieldByName('CodigoConta').AsString;
        SelectedNome := Consulta.cdsConsulta.FieldByName('NomeConta').AsString;
        lblSelecionado.Caption := 'Conta: ' + SelectedNome;
      end;
    end;
  finally
    Consulta.Free;
  end;
end;

procedure TFormRelatorio.btnGerarRelatorioClick(Sender: TObject);
var
  SQL: string;
begin
  SQL := 'SELECT * FROM Agencia';
  if SelectedCodigo <> '' then
    SQL := SQL + ' WHERE CodigoAgencia = ' + QuotedStr(SelectedCodigo);

  dmMain.FDQuery.SQL.Text := SQL;
  dmMain.FDQuery.Open;
  frxDBDatasetAgencias.DataSet := dmMain.FDQuery;
  frxReport.LoadFromFile('RelatorioAgencias.fr3');
  frxReport.ShowReport;
end;

end.

