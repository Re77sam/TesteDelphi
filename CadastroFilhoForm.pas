unit CadastroFilhoForm;

interface

uses
  Vcl.Forms, Vcl.StdCtrls, Vcl.Controls, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Mask, Data.DB, Datasnap.DBClient, System.Classes,
  Vcl.Graphics, ConsultaForm, DataModule, ControllerConta, ModelConta,
  Vcl.Buttons;

type
  TFormCadastroFilho = class(TForm)
    pnlMain: TPanel;
    pnlTop: TPanel;
    lblTitle: TLabel;
    lblCodigoConta: TLabel;
    txtCodigoConta: TEdit;
    lblNumeroConta: TLabel;
    txtNumeroConta: TEdit;
    lblDigitoConta: TLabel;
    txtDigitoConta: TEdit;
    lblCodigoAgencia: TLabel;
    txtCodigoAgencia: TEdit;
    lblNumeroAgencia: TLabel;
    txtNumeroAgencia: TEdit;
    lblTitularConta: TLabel;
    txtTitularConta: TEdit;
    lblGerenteConta: TLabel;
    txtGerenteConta: TEdit;
    dsContas: TDataSource;
    pnlBottom: TPanel;
    btnRestaurar: TBitBtn;
    btnOk: TBitBtn;
    btnSair: TBitBtn;
    btnPrimeiro: TBitBtn;
    btnAnterior: TBitBtn;
    btnProximo: TBitBtn;
    btnUltimo: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    FController: TControllerConta;
    procedure LimparCampos;
    procedure HabilitarCampos(Habilitar: Boolean);
  public
  end;

var
  FormCadastroFilho: TFormCadastroFilho;

implementation

{$R *.dfm}

procedure TFormCadastroFilho.FormCreate(Sender: TObject);
begin
  pnlMain.Color := clWhite;
  pnlTop.Color := clSkyBlue;
  pnlBottom.Color := clSkyBlue;
  lblTitle.Font.Color := clWhite;

  dsContas.DataSet := dmMain.cdsContas;

  FController := TControllerConta.Create(dmMain.cdsContas, dmMain.FDQuery);

  HabilitarCampos(False);
end;

procedure TFormCadastroFilho.btnNovoClick(Sender: TObject);
begin
  LimparCampos;
  HabilitarCampos(True);
end;

procedure TFormCadastroFilho.btnEditarClick(Sender: TObject);
var
  Conta: TConta;
begin
  if not dmMain.cdsContas.IsEmpty then
  begin
    HabilitarCampos(True);
    dmMain.cdsContas.Edit;
    Conta := TConta.Create;
    try
      Conta.CodigoConta := dmMain.cdsContas.FieldByName('CodigoConta').AsString;
      Conta.NumeroConta := txtNumeroConta.Text;
      Conta.DigitoConta := txtDigitoConta.Text;
      Conta.CodigoAgencia := txtCodigoAgencia.Text;
      Conta.NumeroAgencia := txtNumeroAgencia.Text;
      Conta.TitularConta := txtTitularConta.Text;
      Conta.GerenteConta := txtGerenteConta.Text;
      FController.EditarConta(Conta);
    finally
      Conta.Free;
    end;
  end;
end;

procedure TFormCadastroFilho.btnDeletarClick(Sender: TObject);
begin
  if not dmMain.cdsContas.IsEmpty then
  begin
    FController.ExcluirConta(dmMain.cdsContas.FieldByName('CodigoConta').AsString);
  end;
end;

procedure TFormCadastroFilho.btnConsultarClick(Sender: TObject);
var
  Consulta: TFormConsulta;
begin
  Consulta := TFormConsulta.Create(Self, 1); // Passando o parâmetro desejado
  try
    Consulta.SetConsultaTipo(ctConta);
    if Consulta.ShowModal = mrOk then
    begin
      // Trazer os dados selecionados do formulário de consulta
    end;
  finally
    Consulta.Free;
  end;
end;

procedure TFormCadastroFilho.btnSalvarClick(Sender: TObject);
var
  Conta: TConta;
begin
  if dmMain.cdsContas.State in [dsEdit, dsInsert] then
  begin
    Conta := TConta.Create;
    try
      Conta.CodigoConta := txtCodigoConta.Text;
      Conta.NumeroConta := txtNumeroConta.Text;
      Conta.DigitoConta := txtDigitoConta.Text;
      Conta.CodigoAgencia := txtCodigoAgencia.Text;
      Conta.NumeroAgencia := txtNumeroAgencia.Text;
      Conta.TitularConta := txtTitularConta.Text;
      Conta.GerenteConta := txtGerenteConta.Text;
      FController.AdicionarConta(Conta);
    finally
      Conta.Free;
    end;
    HabilitarCampos(False);
    LimparCampos;
  end;
end;

procedure TFormCadastroFilho.btnCancelarClick(Sender: TObject);
begin
  dmMain.cdsContas.Cancel;
  HabilitarCampos(False);
  LimparCampos;
end;

procedure TFormCadastroFilho.LimparCampos;
begin
  txtCodigoConta.Clear;
  txtNumeroConta.Clear;
  txtDigitoConta.Clear;
  txtCodigoAgencia.Clear;
  txtNumeroAgencia.Clear;
  txtTitularConta.Clear;
  txtGerenteConta.Clear;
end;

procedure TFormCadastroFilho.HabilitarCampos(Habilitar: Boolean);
begin
  txtCodigoConta.Enabled := Habilitar;
  txtNumeroConta.Enabled := Habilitar;
  txtDigitoConta.Enabled := Habilitar;
  txtCodigoAgencia.Enabled := Habilitar;
  txtNumeroAgencia.Enabled := Habilitar;
  txtTitularConta.Enabled := Habilitar;
  txtGerenteConta.Enabled := Habilitar;
  btnSalvar.Enabled := Habilitar;
  btnCancelar.Enabled := Habilitar;
end;

end.

