unit MainForm;

interface

uses
  Vcl.Forms, Vcl.StdCtrls, Vcl.Controls, Vcl.ExtCtrls, System.Classes, Vcl.Graphics, Vcl.Imaging.pngimage,
  System.ImageList, Vcl.ImgList, ConsultaForm, RelatorioForm;

type
  TFormMain = class(TForm)
    pnlMain: TPanel;
    pnlCadastroPai: TPanel;
    pnlCadastroFilho: TPanel;
    pnlRelatorio: TPanel;
    lblTitle: TLabel;
    imgCadastroPai: TImage;
    lblCadastroPaiTitle: TLabel;
    lblCadastroPaiDesc: TLabel;
    imgCadastroFilho: TImage;
    lblCadastroFilhoTitle: TLabel;
    lblCadastroFilhoDesc: TLabel;
    imgRelatorio: TImage;
    lblRelatorioTitle: TLabel;
    lblRelatorioDesc: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure pnlCadastroPaiClick(Sender: TObject);
    procedure pnlCadastroFilhoClick(Sender: TObject);
    procedure pnlRelatorioClick(Sender: TObject);
  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}

procedure TFormMain.FormCreate(Sender: TObject);
begin
  pnlMain.Color := clWhite;
  lblTitle.Font.Color := clNavy;

  pnlCadastroPai.Color := clSkyBlue;
  pnlCadastroPai.Cursor := crHandPoint;
  pnlCadastroPai.BevelOuter := bvNone;

  pnlCadastroFilho.Color := clSkyBlue;
  pnlCadastroFilho.Cursor := crHandPoint;
  pnlCadastroFilho.BevelOuter := bvNone;

  pnlRelatorio.Color := clSkyBlue;
  pnlRelatorio.Cursor := crHandPoint;
  pnlRelatorio.BevelOuter := bvNone;

  lblCadastroPaiTitle.Caption := 'Cadastro de Agências';
  lblCadastroPaiTitle.Font.Color := clWhite;
  lblCadastroPaiDesc.Caption := 'Cadastrar novas agências';
  lblCadastroPaiDesc.Font.Color := clWhite;

  lblCadastroFilhoTitle.Caption := 'Cadastro de Contas Bancárias';
  lblCadastroFilhoTitle.Font.Color := clWhite;
  lblCadastroFilhoDesc.Caption := 'Cadastrar novas contas bancárias';
  lblCadastroFilhoDesc.Font.Color := clWhite;

  lblRelatorioTitle.Caption := 'Relatório';
  lblRelatorioTitle.Font.Color := clWhite;
  lblRelatorioDesc.Caption := 'Gerar relatórios';
  lblRelatorioDesc.Font.Color := clWhite;
end;

procedure TFormMain.pnlCadastroPaiClick(Sender: TObject);
begin
  FormConsulta := TFormConsulta.Create(Self, 1);
  try
    FormConsulta.SetConsultaTipo(ctAgencia);
    if FormConsulta.ShowModal = mrOk then
    begin
      // Trazer os dados selecionados do formulário de consulta
    end;
  finally
    FormConsulta.Free;
  end;
end;

procedure TFormMain.pnlCadastroFilhoClick(Sender: TObject);
begin
  FormConsulta := TFormConsulta.Create(Self, 2);
  try
    FormConsulta.SetConsultaTipo(ctConta);
    if FormConsulta.ShowModal = mrOk then
    begin
      // Trazer os dados selecionados do formulário de consulta
    end;
  finally
    FormConsulta.Free;
  end;
end;

procedure TFormMain.pnlRelatorioClick(Sender: TObject);
begin
  FormRelatorio := TFormRelatorio.Create(Self);
  try
    FormRelatorio.ShowModal;
  finally
    FormRelatorio.Free;
  end;
end;

end.

