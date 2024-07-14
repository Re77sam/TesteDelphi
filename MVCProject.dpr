program MVCProject;

uses
  Vcl.Forms,
  DataModule in 'DataModule\DataModule.pas' {dmMain: TDataModule},
  ModelAgencia in 'Model\ModelAgencia.pas',
  ModelConta in 'Model\ModelConta.pas',
  ControllerAgencia in 'Controller\ControllerAgencia.pas',
  ControllerConta in 'Controller\ControllerConta.pas',
  MainForm in 'View\MainForm.pas' {FormMain},
  CadastroPaiForm in 'View\CadastroPaiForm.pas' {FormCadastroPai},
  RelatorioForm in 'View\RelatorioForm.pas' {FormRelatorio},
  CadastroFilhoForm in 'View\CadastroFilhoForm.pas' {FormCadastroFilho},
  ConsultaForm in 'View\ConsultaForm.pas' {FormConsulta};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TdmMain, dmMain);
  Application.CreateForm(TFormCadastroPai, FormCadastroPai);
  Application.CreateForm(TFormRelatorio, FormRelatorio);
  Application.CreateForm(TFormCadastroFilho, FormCadastroFilho);
  Application.CreateForm(TFormConsulta, FormConsulta);
  Application.Run;
end.

