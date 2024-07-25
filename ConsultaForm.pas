unit ConsultaForm;

interface

uses
  Vcl.Forms, Vcl.Controls, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Data.DB, Datasnap.DBClient,
  System.Classes, Vcl.ComCtrls, System.SysUtils, Vcl.Buttons, Vcl.Dialogs, Vcl.Graphics, Vcl.ImgList,
  System.ImageList;

type
  TConsultaTipo = (ctAgencia, ctConta);

  TFormConsulta = class(TForm)
    pnlMain: TPanel;
    dbGrid: TDBGrid;
    pnlBotoes: TPanel;
    btnTodos: TBitBtn;
    dsConsulta: TDataSource;
    cdsConsulta: TClientDataSet;
    btnIncluir: TBitBtn;
    btnExcluir: TBitBtn;
    pnlParametro: TPanel;
    lblParametro1: TLabel;
    lblParametro3: TLabel;
    lblParametro2: TLabel;
    lblParametro4: TLabel;
    edtParametro1: TEdit;
    edtParametro2: TEdit;
    edtParametro3: TEdit;
    edtParametro4: TEdit;
    btnFiltrar: TBitBtn;
    btnConsultar: TBitBtn;
    ImageList1: TImageList;
    procedure FormCreate(Sender: TObject);
    procedure btnTodosClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure dbGridDblClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
  private
    FConsultaTipo: TConsultaTipo;
    FParametro: Integer;
    procedure ConfigurarCampos;
    procedure ConfigurarParametros;
    procedure RetornarValores;
    procedure Design;
    procedure ToggleButtons(Ativo: Boolean);
  public
    procedure SetConsultaTipo(ConsultaTipo: TConsultaTipo);
    constructor Create(AOwner: TComponent; Parametro: Integer); reintroduce;
  end;

var
  FormConsulta: TFormConsulta;

implementation

{$R *.dfm}

uses DataModule, CadastroPaiForm, CadastroFilhoForm;

constructor TFormConsulta.Create(AOwner: TComponent; Parametro: Integer);
begin
  inherited Create(AOwner);
  FParametro := Parametro;
end;

procedure TFormConsulta.FormCreate(Sender: TObject);
begin
  Design;
  cdsConsulta.CreateDataSet;
  dbGrid.DataSource := dsConsulta;
  dsConsulta.DataSet := cdsConsulta;
  pnlParametro.Visible := False;  // Oculta o painel de parâmetros inicialmente
  ConfigurarParametros;
end;

procedure TFormConsulta.SetConsultaTipo(ConsultaTipo: TConsultaTipo);
begin
  FConsultaTipo := ConsultaTipo;
  ConfigurarCampos;
end;

procedure TFormConsulta.ConfigurarCampos;
begin
  case FConsultaTipo of
    ctAgencia:
      begin
        cdsConsulta.FieldDefs.Clear;
        cdsConsulta.FieldDefs.Add('CodigoAgencia', ftString, 10);
        cdsConsulta.FieldDefs.Add('NumeroAgencia', ftString, 10);
        cdsConsulta.FieldDefs.Add('NomeAgencia', ftString, 100);
        cdsConsulta.FieldDefs.Add('NomeCidade', ftString, 100);
        cdsConsulta.FieldDefs.Add('Estado', ftString, 2);
        cdsConsulta.FieldDefs.Add('DataAbertura', ftDate);
        cdsConsulta.FieldDefs.Add('GerenteResponsavel', ftString, 100);
        cdsConsulta.CreateDataSet;
      end;
    ctConta:
      begin
        cdsConsulta.FieldDefs.Clear;
        cdsConsulta.FieldDefs.Add('CodigoConta', ftString, 10);
        cdsConsulta.FieldDefs.Add('NumeroConta', ftString, 10);
        cdsConsulta.FieldDefs.Add('DigitoConta', ftString, 1);
        cdsConsulta.FieldDefs.Add('CodigoAgencia', ftString, 10);
        cdsConsulta.FieldDefs.Add('NumeroAgencia', ftString, 10);
        cdsConsulta.FieldDefs.Add('TitularConta', ftString, 100);
        cdsConsulta.FieldDefs.Add('GerenteConta', ftString, 100);
        cdsConsulta.CreateDataSet;
      end;
  end;
end;

procedure TFormConsulta.ConfigurarParametros;
begin
  case FConsultaTipo of
    ctAgencia:
      begin
        lblParametro1.Caption := 'Número Agência:';
        lblParametro2.Caption := 'Nome Agência:';
        lblParametro3.Caption := 'Nome Cidade:';
        lblParametro4.Caption := 'Nome Gerente:';
      end;
    ctConta:
      begin
        lblParametro1.Caption := 'Número Agência:';
        lblParametro2.Caption := 'Número Conta:';
        lblParametro3.Caption := 'Nome Titular:';
        lblParametro4.Caption := 'Nome Gerente:';
      end;
  end;
end;

procedure TFormConsulta.ToggleButtons(Ativo: Boolean);
begin
  btnConsultar.Enabled := Ativo;
  btnTodos.Enabled := Ativo;
  btnIncluir.Enabled := Ativo;
  btnFiltrar.Enabled := Ativo;
  btnExcluir.Enabled := Ativo;
  btnConsultar.Enabled := not Ativo; // O botão "Consultar" deve estar ativo apenas quando os outros estiverem desativados
end;

procedure TFormConsulta.btnTodosClick(Sender: TObject);
begin
  cdsConsulta.EmptyDataSet;
  case FConsultaTipo of
    ctAgencia:
      begin
        dmMain.FDQuery.SQL.Text := 'SELECT CodigoAgencia, NumeroAgencia, NomeAgencia, NomeCidade, Estado, DataAbertura, GerenteResponsavel FROM Agencia';
        dmMain.FDQuery.Open;
        while not dmMain.FDQuery.Eof do
        begin
          cdsConsulta.Append;
          cdsConsulta.FieldByName('CodigoAgencia').AsString := dmMain.FDQuery.FieldByName('CodigoAgencia').AsString;
          cdsConsulta.FieldByName('NumeroAgencia').AsString := dmMain.FDQuery.FieldByName('NumeroAgencia').AsString;
          cdsConsulta.FieldByName('NomeAgencia').AsString := dmMain.FDQuery.FieldByName('NomeAgencia').AsString;
          cdsConsulta.FieldByName('NomeCidade').AsString := dmMain.FDQuery.FieldByName('NomeCidade').AsString;
          cdsConsulta.FieldByName('Estado').AsString := dmMain.FDQuery.FieldByName('Estado').AsString;
          cdsConsulta.FieldByName('DataAbertura').AsDateTime := dmMain.FDQuery.FieldByName('DataAbertura').AsDateTime;
          cdsConsulta.FieldByName('GerenteResponsavel').AsString := dmMain.FDQuery.FieldByName('GerenteResponsavel').AsString;
          cdsConsulta.Post;
          dmMain.FDQuery.Next;
        end;
        dmMain.FDQuery.Close;
      end;
    ctConta:
      begin
        dmMain.FDQuery.SQL.Text := 'SELECT CodigoConta, NumeroConta, DigitoConta, CodigoAgencia, NumeroAgencia, TitularConta, GerenteConta FROM Conta';
        dmMain.FDQuery.Open;
        while not dmMain.FDQuery.Eof do
        begin
          cdsConsulta.Append;
          cdsConsulta.FieldByName('CodigoConta').AsString := dmMain.FDQuery.FieldByName('CodigoConta').AsString;
          cdsConsulta.FieldByName('NumeroConta').AsString := dmMain.FDQuery.FieldByName('NumeroConta').AsString;
          cdsConsulta.FieldByName('DigitoConta').AsString := dmMain.FDQuery.FieldByName('DigitoConta').AsString;
          cdsConsulta.FieldByName('CodigoAgencia').AsString := dmMain.FDQuery.FieldByName('CodigoAgencia').AsString;
          cdsConsulta.FieldByName('NumeroAgencia').AsString := dmMain.FDQuery.FieldByName('NumeroAgencia').AsString;
          cdsConsulta.FieldByName('TitularConta').AsString := dmMain.FDQuery.FieldByName('TitularConta').AsString;
          cdsConsulta.FieldByName('GerenteConta').AsString := dmMain.FDQuery.FieldByName('GerenteConta').AsString;
          cdsConsulta.Post;
          dmMain.FDQuery.Next;
        end;
        dmMain.FDQuery.Close;
      end;
  end;
end;

procedure TFormConsulta.btnFiltrarClick(Sender: TObject);
begin
  ConfigurarParametros;
  pnlParametro.Visible := True;  // Exibe o painel de parâmetros
  ToggleButtons(False); // Desativar todos os botões exceto "Consultar"
end;

procedure TFormConsulta.btnExcluirClick(Sender: TObject);
var
  SQL: string;
begin
  if cdsConsulta.IsEmpty then
  begin
    ShowMessage('Nenhuma linha selecionada para excluir.');
    Exit;
  end;

  if MessageDlg('Tem certeza que deseja excluir o registro selecionado?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    case FConsultaTipo of
      ctAgencia:
        begin
          SQL := 'DELETE FROM Agencia WHERE CodigoAgencia = ' + QuotedStr(cdsConsulta.FieldByName('CodigoAgencia').AsString);
        end;
      ctConta:
        begin
          SQL := 'DELETE FROM Conta WHERE CodigoConta = ' + QuotedStr(cdsConsulta.FieldByName('CodigoConta').AsString);
        end;
    end;

    try
      dmMain.FDQuery.SQL.Text := SQL;
      dmMain.FDQuery.ExecSQL;
      cdsConsulta.Delete;
      ShowMessage('Registro excluído com sucesso.');
    except
      on E: Exception do
      begin
        ShowMessage('Erro ao excluir registro: ' + E.Message);
      end;
    end;
  end;
end;


procedure TFormConsulta.btnIncluirClick(Sender: TObject);
begin
  case FConsultaTipo of
    ctAgencia:
      begin
        FormCadastroPai := TFormCadastroPai.Create(Self);
        try
          FormCadastroPai.ShowModal;
        finally
          FormCadastroPai.Free;
        end;
      end;
    ctConta:
      begin
        FormCadastroFilho := TFormCadastroFilho.Create(Self);
        try
          FormCadastroFilho.ShowModal;
        finally
          FormCadastroFilho.Free;
        end;
      end;
  end;
end;



procedure TFormConsulta.btnPesquisarClick(Sender: TObject);
var
  SQL: string;
begin
  ShowMessage('Pesquisando com os parâmetros configurados...');
  ToggleButtons(True); // Reativar os botões após a pesquisa
  pnlParametro.Visible := False; // Ocultar o painel de parâmetros
  SQL := '';
  case FConsultaTipo of
    ctAgencia:
      begin
        SQL := 'SELECT CodigoAgencia, NumeroAgencia, NomeAgencia, NomeCidade, Estado, DataAbertura, GerenteResponsavel FROM Agencia WHERE 1=1';
        if edtParametro1.Text <> '' then
          SQL := SQL + ' AND NumeroAgencia LIKE ' + QuotedStr('%' + edtParametro1.Text + '%');
        if edtParametro2.Text <> '' then
          SQL := SQL + ' AND NomeAgencia LIKE ' + QuotedStr('%' + edtParametro2.Text + '%');
        if edtParametro3.Text <> '' then
          SQL := SQL + ' AND NomeCidade LIKE ' + QuotedStr('%' + edtParametro3.Text + '%');
        if edtParametro4.Text <> '' then
          SQL := SQL + ' AND GerenteResponsavel LIKE ' + QuotedStr('%' + edtParametro4.Text + '%');
      end;
    ctConta:
      begin
        SQL := 'SELECT CodigoConta, NumeroConta, DigitoConta, CodigoAgencia, NumeroAgencia, TitularConta, GerenteConta FROM Conta WHERE 1=1';
        if edtParametro1.Text <> '' then
          SQL := SQL + ' AND NumeroAgencia LIKE ' + QuotedStr('%' + edtParametro1.Text + '%');
        if edtParametro2.Text <> '' then
          SQL := SQL + ' AND NumeroConta LIKE ' + QuotedStr('%' + edtParametro2.Text + '%');
        if edtParametro3.Text <> '' then
          SQL := SQL + ' AND TitularConta LIKE ' + QuotedStr('%' + edtParametro3.Text + '%');
        if edtParametro4.Text <> '' then
          SQL := SQL + ' AND GerenteConta LIKE ' + QuotedStr('%' + edtParametro4.Text + '%');
      end;
  end;
  cdsConsulta.EmptyDataSet;
  dmMain.FDQuery.SQL.Text := SQL;
  dmMain.FDQuery.Open;
  while not dmMain.FDQuery.Eof do
  begin
    cdsConsulta.Append;
    case FConsultaTipo of
      ctAgencia:
        begin
          cdsConsulta.FieldByName('CodigoAgencia').AsString := dmMain.FDQuery.FieldByName('CodigoAgencia').AsString;
          cdsConsulta.FieldByName('NumeroAgencia').AsString := dmMain.FDQuery.FieldByName('NumeroAgencia').AsString;
          cdsConsulta.FieldByName('NomeAgencia').AsString := dmMain.FDQuery.FieldByName('NomeAgencia').AsString;
          cdsConsulta.FieldByName('NomeCidade').AsString := dmMain.FDQuery.FieldByName('NomeCidade').AsString;
          cdsConsulta.FieldByName('Estado').AsString := dmMain.FDQuery.FieldByName('Estado').AsString;
          cdsConsulta.FieldByName('DataAbertura').AsDateTime := dmMain.FDQuery.FieldByName('DataAbertura').AsDateTime;
          cdsConsulta.FieldByName('GerenteResponsavel').AsString := dmMain.FDQuery.FieldByName('GerenteResponsavel').AsString;
        end;
      ctConta:
        begin
          cdsConsulta.FieldByName('CodigoConta').AsString := dmMain.FDQuery.FieldByName('CodigoConta').AsString;
          cdsConsulta.FieldByName('NumeroConta').AsString := dmMain.FDQuery.FieldByName('NumeroConta').AsString;
          cdsConsulta.FieldByName('DigitoConta').AsString := dmMain.FDQuery.FieldByName('DigitoConta').AsString;
          cdsConsulta.FieldByName('CodigoAgencia').AsString := dmMain.FDQuery.FieldByName('CodigoAgencia').AsString;
          cdsConsulta.FieldByName('NumeroAgencia').AsString := dmMain.FDQuery.FieldByName('NumeroAgencia').AsString;
          cdsConsulta.FieldByName('TitularConta').AsString := dmMain.FDQuery.FieldByName('TitularConta').AsString;
          cdsConsulta.FieldByName('GerenteConta').AsString := dmMain.FDQuery.FieldByName('GerenteConta').AsString;
        end;
    end;
    cdsConsulta.Post;
    dmMain.FDQuery.Next;
  end;
  dmMain.FDQuery.Close;
end;

procedure TFormConsulta.RetornarValores;
begin
  case FConsultaTipo of
    ctAgencia:
      begin
        with FormCadastroPai do
        begin
          txtCodigoAgencia.Text := cdsConsulta.FieldByName('CodigoAgencia').AsString;
          txtNumeroAgencia.Text := cdsConsulta.FieldByName('NumeroAgencia').AsString;
          txtNomeAgencia.Text := cdsConsulta.FieldByName('NomeAgencia').AsString;
          txtNomeCidade.Text := cdsConsulta.FieldByName('NomeCidade').AsString;
          cbEstado.Text := cdsConsulta.FieldByName('Estado').AsString;
          dtDataAbertura.Date := cdsConsulta.FieldByName('DataAbertura').AsDateTime;
          txtGerenteResponsavel.Text := cdsConsulta.FieldByName('GerenteResponsavel').AsString;
        end;
      end;
    ctConta:
      begin
        with FormCadastroFilho do
        begin
          txtCodigoConta.Text := cdsConsulta.FieldByName('CodigoConta').AsString;
          txtNumeroConta.Text := cdsConsulta.FieldByName('NumeroConta').AsString;
          txtDigitoConta.Text := cdsConsulta.FieldByName('DigitoConta').AsString;
          txtCodigoAgencia.Text := cdsConsulta.FieldByName('CodigoAgencia').AsString;
          txtNumeroAgencia.Text := cdsConsulta.FieldByName('NumeroAgencia').AsString;
          txtTitularConta.Text := cdsConsulta.FieldByName('TitularConta').AsString;
          txtGerenteConta.Text := cdsConsulta.FieldByName('GerenteConta').AsString;
        end;
      end;
  end;
end;

procedure TFormConsulta.dbGridDblClick(Sender: TObject);
begin
  RetornarValores;
  ModalResult := mrOk;
end;

procedure TFormConsulta.btnSelecionarClick(Sender: TObject);
begin
  RetornarValores;
  ModalResult := mrOk;
end;

procedure TFormConsulta.btnAlterarClick(Sender: TObject);
begin
    if cdsConsulta.IsEmpty then
  begin
    ShowMessage('Nenhuma linha selecionada.');
    Exit;
  end;

  case FConsultaTipo of
    ctAgencia:
      begin
        FormCadastroPai := TFormCadastroPai.Create(Self);
        try
          FormCadastroPai.txtCodigoAgencia.Text := cdsConsulta.FieldByName('CodigoAgencia').AsString;
          FormCadastroPai.txtNumeroAgencia.Text := cdsConsulta.FieldByName('NumeroAgencia').AsString;
          FormCadastroPai.txtNomeAgencia.Text := cdsConsulta.FieldByName('NomeAgencia').AsString;
          FormCadastroPai.txtNomeCidade.Text := cdsConsulta.FieldByName('NomeCidade').AsString;
          FormCadastroPai.cbEstado.Text := cdsConsulta.FieldByName('Estado').AsString;
          FormCadastroPai.dtDataAbertura.Date := cdsConsulta.FieldByName('DataAbertura').AsDateTime;
          FormCadastroPai.txtGerenteResponsavel.Text := cdsConsulta.FieldByName('GerenteResponsavel').AsString;
          FormCadastroPai.ShowModal;
        finally
          FormCadastroPai.Free;
        end;
      end;
    ctConta:
      begin
        FormCadastroFilho := TFormCadastroFilho.Create(Self);
        try
          FormCadastroFilho.txtCodigoConta.Text := cdsConsulta.FieldByName('CodigoConta').AsString;
          FormCadastroFilho.txtNumeroConta.Text := cdsConsulta.FieldByName('NumeroConta').AsString;
          FormCadastroFilho.txtDigitoConta.Text := cdsConsulta.FieldByName('DigitoConta').AsString;
          FormCadastroFilho.txtCodigoAgencia.Text := cdsConsulta.FieldByName('CodigoAgencia').AsString;
          FormCadastroFilho.txtNumeroAgencia.Text := cdsConsulta.FieldByName('NumeroAgencia').AsString;
          FormCadastroFilho.txtTitularConta.Text := cdsConsulta.FieldByName('TitularConta').AsString;
          FormCadastroFilho.txtGerenteConta.Text := cdsConsulta.FieldByName('GerenteConta').AsString;
          FormCadastroFilho.ShowModal;
        finally
          FormCadastroFilho.Free;
        end;
      end;
  end;
end;


procedure TFormConsulta.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFormConsulta.Design;
begin
  // Configurações dos painéis
  pnlMain.Align := alClient;
  pnlMain.Color := clWhite;

  pnlBotoes.Align := alRight;
  pnlBotoes.Width := 130;
  pnlBotoes.Color := clSkyBlue;

  // Configurações dos botões
  btnFiltrar.Caption := 'Filtrar';
  btnFiltrar.Font.Color := clWhite;
  btnFiltrar.Font.Size := 10;
  btnFiltrar.Layout := blGlyphTop;
  btnFiltrar.Margins.Left := 10;
  btnFiltrar.Margins.Right := 10;
  btnFiltrar.Margins.Top := 10;
  btnFiltrar.Margins.Bottom := 10;
  btnFiltrar.Glyph.Assign(ImageList.GetBitmap(0)); // Adicione o índice correto da imagem

  btnTodos.Caption := 'Todos';
  btnTodos.Font.Color := clWhite;
  btnTodos.Font.Size := 10;
  btnTodos.Layout := blGlyphTop;
  btnTodos.Margins.Left := 10;
  btnTodos.Margins.Right := 10;
  btnTodos.Margins.Top := 10;
  btnTodos.Margins.Bottom := 10;
  btnTodos.Glyph.Assign(ImageList.GetBitmap(1)); // Adicione o índice correto da imagem

  btnIncluir.Caption := 'Incluir';
  btnIncluir.Font.Color := clWhite;
  btnIncluir.Font.Size := 10;
  btnIncluir.Layout := blGlyphTop;
  btnIncluir.Margins.Left := 10;
  btnIncluir.Margins.Right := 10;
  btnIncluir.Margins.Top := 10;
  btnIncluir.Margins.Bottom := 10;
  btnIncluir.Glyph.Assign(ImageList.GetBitmap(2)); // Adicione o índice correto da imagem

  btnAlterar.Caption := 'Alterar';
  btnAlterar.Font.Color := clWhite;
  btnAlterar.Font.Size := 10;
  btnAlterar.Layout := blGlyphTop;
  btnAlterar.Margins.Left := 10;
  btnAlterar.Margins.Right := 10;
  btnAlterar.Margins.Top := 10;
  btnAlterar.Margins.Bottom := 10;
  btnAlterar.Glyph.Assign(ImageList.GetBitmap(3)); // Adicione o índice correto da imagem

  btnExcluir.Caption := 'Excluir';
  btnExcluir.Font.Color := clWhite;
  btnExcluir.Font.Size := 10;
  btnExcluir.Layout := blGlyphTop;
  btnExcluir.Margins.Left := 10;
  btnExcluir.Margins.Right := 10;
  btnExcluir.Margins.Top := 10;
  btnExcluir.Margins.Bottom := 10;
  btnExcluir.Glyph.Assign(ImageList.GetBitmap(4)); // Adicione o índice correto da imagem

  btnConsultar.Caption := 'Consultar';
  btnConsultar.Font.Color := clWhite;
  btnConsultar.Font.Size := 10;
  btnConsultar.Layout := blGlyphTop;
  btnConsultar.Margins.Left := 10;
  btnConsultar.Margins.Right := 10;
  btnConsultar.Margins.Top := 10;
  btnConsultar.Margins.Bottom := 10;
  btnConsultar.Glyph.Assign(ImageList.GetBitmap(5)); // Adicione o índice correto da imagem

  btnSair.Caption := 'Sair';
  btnSair.Font.Color := clWhite;
  btnSair.Font.Size := 10;
  btnSair.Layout := blGlyphTop;
  btnSair.Margins.Left := 10;
  btnSair.Margins.Right := 10;
  btnSair.Margins.Top := 10;
  btnSair.Margins.Bottom := 10;
  btnSair.Glyph.Assign(ImageList.GetBitmap(6)); // Adicione o índice correto da imagem
end;

end.

