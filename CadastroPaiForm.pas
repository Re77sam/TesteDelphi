unit CadastroPaiForm;

interface

uses
  Vcl.Forms, Vcl.StdCtrls, Vcl.Controls, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Mask, Vcl.ComCtrls,
  Data.DB, Datasnap.DBClient,
  System.Classes, Vcl.Graphics, ConsultaForm, DataModule, ControllerAgencia,
  ModelAgencia, System.SysUtils, Vcl.Buttons;

type
  TFormCadastroPai = class(TForm)
    pnlMain: TPanel;
    pnlTop: TPanel;
    pnlBottom: TPanel;
    lblTitle: TLabel;
    lblCodigoAgencia: TLabel;
    txtCodigoAgencia: TEdit;
    lblNumeroAgencia: TLabel;
    txtNumeroAgencia: TMaskEdit;
    lblNomeAgencia: TLabel;
    txtNomeAgencia: TEdit;
    lblNomeCidade: TLabel;
    txtNomeCidade: TEdit;
    lblEstado: TLabel;
    cbEstado: TComboBox;
    lblDataAbertura: TLabel;
    dtDataAbertura: TDateTimePicker;
    lblGerenteResponsavel: TLabel;
    txtGerenteResponsavel: TEdit;
    btnRestaurar: TBitBtn;
    btnOk: TBitBtn;
    btnSair: TBitBtn;
    btnPrimeiro: TBitBtn;
    btnAnterior: TBitBtn;
    btnProximo: TBitBtn;
    btnUltimo: TBitBtn;
    dsAgencias: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure btnRestaurarClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure NavegarRegistro(Sender: TObject);
  private
    FController: TControllerAgencia;
    FOriginalValues: TStringList;
    procedure LimparCampos;
    procedure HabilitarCampos(Habilitar: Boolean);
    procedure PreencherEstados;
    procedure SalvarValoresOriginais;
    procedure RestaurarValoresOriginais;
  public
    procedure SetParametros(CodigoAgencia: string);
  end;

var
  FormCadastroPai: TFormCadastroPai;

implementation

{$R *.dfm}

procedure TFormCadastroPai.FormCreate(Sender: TObject);
begin
  pnlMain.Color := clWhite;
  pnlTop.Color := clSkyBlue;
  pnlBottom.Color := clSkyBlue;
  lblTitle.Font.Color := clWhite;

  dsAgencias.DataSet := dmMain.cdsAgencias;

  FController := TControllerAgencia.Create(dmMain.cdsAgencias, dmMain.FDQuery);
  FOriginalValues := TStringList.Create;

  PreencherEstados;
  HabilitarCampos(False);
end;

procedure TFormCadastroPai.SetParametros(CodigoAgencia: string);
begin
  // Código para preencher os campos do formulário com os dados do CódigoAgencia
end;

procedure TFormCadastroPai.PreencherEstados;
begin
  cbEstado.Items.Clear;
  cbEstado.Items.Add('AC');
  cbEstado.Items.Add('AL');
  cbEstado.Items.Add('AP');
  cbEstado.Items.Add('AM');
  cbEstado.Items.Add('BA');
  cbEstado.Items.Add('CE');
  cbEstado.Items.Add('DF');
  cbEstado.Items.Add('ES');
  cbEstado.Items.Add('GO');
  cbEstado.Items.Add('MA');
  cbEstado.Items.Add('MT');
  cbEstado.Items.Add('MS');
  cbEstado.Items.Add('MG');
  cbEstado.Items.Add('PA');
  cbEstado.Items.Add('PB');
  cbEstado.Items.Add('PR');
  cbEstado.Items.Add('PE');
  cbEstado.Items.Add('PI');
  cbEstado.Items.Add('RJ');
  cbEstado.Items.Add('RN');
  cbEstado.Items.Add('RS');
  cbEstado.Items.Add('RO');
  cbEstado.Items.Add('RR');
  cbEstado.Items.Add('SC');
  cbEstado.Items.Add('SP');
  cbEstado.Items.Add('SE');
  cbEstado.Items.Add('TO');
end;

procedure TFormCadastroPai.btnRestaurarClick(Sender: TObject);
begin
  if dsAgencias.State in [dsEdit, dsInsert] then
    RestaurarValoresOriginais;
end;

procedure TFormCadastroPai.btnOkClick(Sender: TObject);
var
  Agencia: TAgencia;
begin
  if dsAgencias.State in [dsEdit, dsInsert] then
  begin
    Agencia := TAgencia.Create;
    try
      Agencia.CodigoAgencia := txtCodigoAgencia.Text;
      Agencia.NumeroAgencia := txtNumeroAgencia.Text;
      Agencia.NomeAgencia := txtNomeAgencia.Text;
      Agencia.NomeCidade := txtNomeCidade.Text;
      Agencia.Estado := cbEstado.Text;
      Agencia.DataAbertura := dtDataAbertura.Date;
      Agencia.GerenteResponsavel := txtGerenteResponsavel.Text;
      FController.AdicionarAgencia(Agencia);
    finally
      Agencia.Free;
    end;
    HabilitarCampos(False);
    LimparCampos;
  end;
end;

procedure TFormCadastroPai.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFormCadastroPai.LimparCampos;
begin
  txtCodigoAgencia.Clear;
  txtNumeroAgencia.Clear;
  txtNomeAgencia.Clear;
  txtNomeCidade.Clear;
  cbEstado.ItemIndex := -1;
  dtDataAbertura.Date := Now;
  txtGerenteResponsavel.Clear;
end;

procedure TFormCadastroPai.HabilitarCampos(Habilitar: Boolean);
begin
  txtCodigoAgencia.Enabled := Habilitar;
  txtNumeroAgencia.Enabled := Habilitar;
  txtNomeAgencia.Enabled := Habilitar;
  txtNomeCidade.Enabled := Habilitar;
  cbEstado.Enabled := Habilitar;
  dtDataAbertura.Enabled := Habilitar;
  txtGerenteResponsavel.Enabled := Habilitar;
  btnOk.Enabled := Habilitar;
  btnRestaurar.Enabled := Habilitar and (dsAgencias.State = dsEdit);
end;

procedure TFormCadastroPai.SalvarValoresOriginais;
begin
  FOriginalValues.Clear;
  FOriginalValues.Values['CodigoAgencia'] := txtCodigoAgencia.Text;
  FOriginalValues.Values['NumeroAgencia'] := txtNumeroAgencia.Text;
  FOriginalValues.Values['NomeAgencia'] := txtNomeAgencia.Text;
  FOriginalValues.Values['NomeCidade'] := txtNomeCidade.Text;
  FOriginalValues.Values['Estado'] := cbEstado.Text;
  FOriginalValues.Values['DataAbertura'] := DateToStr(dtDataAbertura.Date);
  FOriginalValues.Values['GerenteResponsavel'] := txtGerenteResponsavel.Text;
end;

procedure TFormCadastroPai.RestaurarValoresOriginais;
begin
  txtCodigoAgencia.Text := FOriginalValues.Values['CodigoAgencia'];
  txtNumeroAgencia.Text := FOriginalValues.Values['NumeroAgencia'];
  txtNomeAgencia.Text := FOriginalValues.Values['NomeAgencia'];
  txtNomeCidade.Text := FOriginalValues.Values['NomeCidade'];
  cbEstado.Text := FOriginalValues.Values['Estado'];
  dtDataAbertura.Date := StrToDate(FOriginalValues.Values['DataAbertura']);
  txtGerenteResponsavel.Text := FOriginalValues.Values['GerenteResponsavel'];
end;

procedure TFormCadastroPai.NavegarRegistro(Sender: TObject);
begin
  if Sender = btnPrimeiro then
    dsAgencias.DataSet.First
  else if Sender = btnAnterior then
    dsAgencias.DataSet.Prior
  else if Sender = btnProximo then
    dsAgencias.DataSet.Next
  else if Sender = btnUltimo then
    dsAgencias.DataSet.Last;
end;

end.

