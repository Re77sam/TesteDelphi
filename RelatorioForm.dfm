object FormRelatorio: TFormRelatorio
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio'
  ClientHeight = 450
  ClientWidth = 600
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 13
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 600
    Height = 50
    Align = alTop
    Color = clSkyBlue
    TabOrder = 0
    object btnGerarRelatorio: TButton
      Left = 14
      Top = 13
      Width = 120
      Height = 25
      Caption = 'Gerar Relat'#243'rio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnGerarRelatorioClick
    end
    object btnSelecionar: TButton
      Left = 150
      Top = 13
      Width = 120
      Height = 25
      Caption = 'Selecionar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnSelecionarClick
    end
    object rdbTipo: TRadioGroup
      Left = 296
      Top = 0
      Width = 153
      Height = 38
      Columns = 2
      Items.Strings = (
        'Contas'
        'Ag'#234'ncias')
      TabOrder = 2
    end
  end
  object pnlMain: TPanel
    Left = 0
    Top = 50
    Width = 600
    Height = 400
    Align = alClient
    Color = clWhite
    TabOrder = 1
    ExplicitTop = 47
    object lblSelecionado: TLabel
      Left = 16
      Top = 16
      Width = 118
      Height = 16
      Caption = 'Nenhum selecionado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
  object frxReport: TfrxReport
    Version = '2023.3.4'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45487.664252974540000000
    ReportOptions.LastChange = 45487.664252974540000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 16
    Top = 200
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object frxDBDatasetAgencias: TfrxDBDataset
    UserName = 'Agencias'
    CloseDataSource = False
    DataSet = dmMain.cdsAgencias
    BCDToCurrency = False
    DataSetOptions = []
    Left = 16
    Top = 240
  end
  object frxDBDatasetContas: TfrxDBDataset
    UserName = 'Contas'
    CloseDataSource = False
    DataSet = dmMain.cdsContas
    BCDToCurrency = False
    DataSetOptions = []
    Left = 16
    Top = 280
  end
end
