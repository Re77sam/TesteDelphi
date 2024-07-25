object FormCadastroPai: TFormCadastroPai
  Left = 0
  Top = 0
  Caption = 'Cadastro de Ag'#234'ncias'
  ClientHeight = 406
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
    Top = 56
    Width = 378
    Height = 350
    Color = clWhite
    TabOrder = 0
    object lblCodigoAgencia: TLabel
      Left = 16
      Top = 16
      Width = 78
      Height = 13
      Caption = 'C'#243'digo Ag'#234'ncia:'
    end
    object lblNumeroAgencia: TLabel
      Left = 16
      Top = 64
      Width = 82
      Height = 13
      Caption = 'N'#250'mero Ag'#234'ncia:'
    end
    object lblNomeAgencia: TLabel
      Left = 16
      Top = 112
      Width = 72
      Height = 13
      Caption = 'Nome Ag'#234'ncia:'
    end
    object lblNomeCidade: TLabel
      Left = 16
      Top = 160
      Width = 67
      Height = 13
      Caption = 'Nome Cidade:'
    end
    object lblEstado: TLabel
      Left = 16
      Top = 208
      Width = 37
      Height = 13
      Caption = 'Estado:'
    end
    object lblDataAbertura: TLabel
      Left = 16
      Top = 256
      Width = 73
      Height = 13
      Caption = 'Data Abertura:'
    end
    object lblGerenteResponsavel: TLabel
      Left = 16
      Top = 304
      Width = 107
      Height = 13
      Caption = 'Gerente Respons'#225'vel:'
    end
    object txtCodigoAgencia: TEdit
      Left = 16
      Top = 32
      Width = 120
      Height = 21
      TabOrder = 0
    end
    object txtNumeroAgencia: TMaskEdit
      Left = 16
      Top = 80
      Width = 120
      Height = 21
      TabOrder = 1
      Text = ''
    end
    object txtNomeAgencia: TEdit
      Left = 16
      Top = 128
      Width = 240
      Height = 21
      TabOrder = 2
    end
    object txtNomeCidade: TEdit
      Left = 16
      Top = 176
      Width = 240
      Height = 21
      TabOrder = 3
    end
    object cbEstado: TComboBox
      Left = 16
      Top = 224
      Width = 120
      Height = 21
      TabOrder = 4
    end
    object dtDataAbertura: TDateTimePicker
      Left = 16
      Top = 272
      Width = 120
      Height = 21
      Date = 45487.000000000000000000
      Time = 0.613549120367679300
      TabOrder = 5
    end
    object txtGerenteResponsavel: TEdit
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
      Width = 160
      Height = 18
      Caption = 'Cadastro de Ag'#234'ncias'
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
    Height = 356
    Align = alRight
    Color = clSkyBlue
    TabOrder = 2
    ExplicitLeft = 380
    ExplicitHeight = 355
    object btnRestaurar: TBitBtn
      Left = 16
      Top = 71
      Width = 190
      Height = 40
      Caption = 'Restaurar'
      ImageIndex = 6
      Images = FormConsulta.ImageList1
      TabOrder = 0
      OnClick = btnRestaurarClick
    end
    object btnOk: TBitBtn
      Left = 16
      Top = 262
      Width = 190
      Height = 40
      Caption = 'OK'
      ImageIndex = 0
      Images = FormConsulta.ImageList1
      TabOrder = 1
      OnClick = btnOkClick
    end
    object btnSair: TBitBtn
      Left = 16
      Top = 308
      Width = 190
      Height = 40
      Caption = 'Sair'
      ImageIndex = 5
      Images = FormConsulta.ImageList1
      TabOrder = 2
      OnClick = btnSairClick
    end
    object btnPrimeiro: TBitBtn
      Left = 16
      Top = 11
      Width = 40
      Height = 40
      Caption = '<<'
      TabOrder = 3
      OnClick = NavegarRegistro
    end
    object btnAnterior: TBitBtn
      Left = 66
      Top = 11
      Width = 40
      Height = 40
      Caption = '<'
      TabOrder = 4
      OnClick = NavegarRegistro
    end
    object btnProximo: TBitBtn
      Left = 116
      Top = 11
      Width = 40
      Height = 40
      Caption = '>'
      TabOrder = 5
      OnClick = NavegarRegistro
    end
    object btnUltimo: TBitBtn
      Left = 166
      Top = 11
      Width = 40
      Height = 40
      Caption = '>>'
      TabOrder = 6
      OnClick = NavegarRegistro
    end
  end
end
