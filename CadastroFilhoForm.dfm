object FormCadastroFilho: TFormCadastroFilho
  Left = 0
  Top = 0
  Caption = 'Cadastro de Contas'
  ClientHeight = 399
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
  object pnlMain: TPanel
    Left = 0
    Top = 50
    Width = 401
    Height = 349
    Color = clWhite
    TabOrder = 0
    object lblCodigoConta: TLabel
      Left = 16
      Top = 16
      Width = 69
      Height = 13
      Caption = 'C'#243'digo Conta:'
    end
    object lblNumeroConta: TLabel
      Left = 16
      Top = 64
      Width = 73
      Height = 13
      Caption = 'N'#250'mero Conta:'
    end
    object lblDigitoConta: TLabel
      Left = 16
      Top = 112
      Width = 63
      Height = 13
      Caption = 'D'#237'gito Conta:'
    end
    object lblCodigoAgencia: TLabel
      Left = 16
      Top = 160
      Width = 78
      Height = 13
      Caption = 'C'#243'digo Ag'#234'ncia:'
    end
    object lblNumeroAgencia: TLabel
      Left = 16
      Top = 208
      Width = 82
      Height = 13
      Caption = 'N'#250'mero Ag'#234'ncia:'
    end
    object lblTitularConta: TLabel
      Left = 16
      Top = 256
      Width = 66
      Height = 13
      Caption = 'Titular Conta:'
    end
    object lblGerenteConta: TLabel
      Left = 16
      Top = 304
      Width = 75
      Height = 13
      Caption = 'Gerente Conta:'
    end
    object txtCodigoConta: TEdit
      Left = 16
      Top = 32
      Width = 120
      Height = 21
      TabOrder = 0
    end
    object txtNumeroConta: TEdit
      Left = 16
      Top = 80
      Width = 120
      Height = 21
      TabOrder = 1
    end
    object txtDigitoConta: TEdit
      Left = 16
      Top = 128
      Width = 240
      Height = 21
      TabOrder = 2
    end
    object txtCodigoAgencia: TEdit
      Left = 16
      Top = 176
      Width = 120
      Height = 21
      TabOrder = 3
    end
    object txtNumeroAgencia: TEdit
      Left = 16
      Top = 224
      Width = 120
      Height = 21
      TabOrder = 4
    end
    object txtTitularConta: TEdit
      Left = 16
      Top = 272
      Width = 240
      Height = 21
      TabOrder = 5
    end
    object txtGerenteConta: TEdit
      Left = 16
      Top = 320
      Width = 240
      Height = 21
      TabOrder = 6
    end
  end
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 600
    Height = 50
    Align = alTop
    Color = clSkyBlue
    TabOrder = 1
    ExplicitWidth = 596
    object lblTitle: TLabel
      Left = 16
      Top = 16
      Width = 144
      Height = 18
      Caption = 'Cadastro de Contas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object pnlBottom: TPanel
    Left = 384
    Top = 50
    Width = 216
    Height = 349
    Align = alRight
    Color = clSkyBlue
    TabOrder = 2
    ExplicitHeight = 367
    object btnRestaurar: TBitBtn
      Left = 16
      Top = 71
      Width = 190
      Height = 40
      Caption = 'Restaurar'
      ImageIndex = 6
      Images = FormConsulta.ImageList1
      TabOrder = 0
    end
    object btnOk: TBitBtn
      Left = 16
      Top = 244
      Width = 190
      Height = 40
      Caption = 'OK'
      ImageIndex = 0
      Images = FormConsulta.ImageList1
      TabOrder = 1
    end
    object btnSair: TBitBtn
      Left = 16
      Top = 290
      Width = 190
      Height = 40
      Caption = 'Sair'
      ImageIndex = 5
      Images = FormConsulta.ImageList1
      TabOrder = 2
    end
    object btnPrimeiro: TBitBtn
      Left = 16
      Top = 11
      Width = 40
      Height = 40
      Caption = '<<'
      TabOrder = 3
    end
    object btnAnterior: TBitBtn
      Left = 66
      Top = 11
      Width = 40
      Height = 40
      Caption = '<'
      TabOrder = 4
    end
    object btnProximo: TBitBtn
      Left = 116
      Top = 11
      Width = 40
      Height = 40
      Caption = '>'
      TabOrder = 5
    end
    object btnUltimo: TBitBtn
      Left = 166
      Top = 11
      Width = 40
      Height = 40
      Caption = '>>'
      TabOrder = 6
    end
  end
end
