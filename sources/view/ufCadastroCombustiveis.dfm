inherited fCadastroCombustiveis: TfCadastroCombustiveis
  Caption = 'fCadastroCombustiveis'
  ClientHeight = 324
  ClientWidth = 630
  OnDestroy = FormDestroy
  ExplicitWidth = 646
  ExplicitHeight = 363
  PixelsPerInch = 96
  TextHeight = 13
  inherited tlbMenuPaiCad: TToolBar
    Width = 630
    inherited navPesquisa: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited pgcCadastro: TPageControl
    Width = 630
    Height = 293
    ActivePage = tsCadastro
    inherited tsPesquisa: TTabSheet
      inherited stbPesquisa: TStatusBar
        Top = 239
        Width = 622
      end
      inherited pnlPesquisa: TPanel
        Width = 622
        Height = 239
        TabOrder = 0
        inherited grdPesquisa: TDBGrid
          Width = 622
          Height = 192
          TabOrder = 1
        end
        inherited pnlFiltrosPesq: TPanel
          Width = 622
          TabOrder = 0
          inherited pnlBotoes: TPanel
            Left = 516
          end
          inherited pnlValores: TPanel
            Width = 219
            inherited edtPesquisa: TEdit
              Width = 490
            end
          end
        end
      end
    end
    inherited tsCadastro: TTabSheet
      inherited pnlCadastro: TPanel
        Width = 622
        Height = 258
        object CampoCodigo: TLabeledEdit
          Left = 40
          Top = 40
          Width = 121
          Height = 21
          EditLabel.Width = 33
          EditLabel.Height = 13
          EditLabel.Caption = 'C'#243'digo'
          Enabled = False
          TabOrder = 0
        end
        object CampoTipo: TLabeledEdit
          Left = 40
          Top = 138
          Width = 211
          Height = 21
          EditLabel.Width = 20
          EditLabel.Height = 13
          EditLabel.Caption = 'Tipo'
          TabOrder = 2
        end
        object CampoValor: TLabeledEdit
          Left = 40
          Top = 186
          Width = 121
          Height = 21
          EditLabel.Width = 24
          EditLabel.Height = 13
          EditLabel.Caption = 'Valor'
          TabOrder = 3
        end
        object CampoDescricao: TLabeledEdit
          Left = 40
          Top = 90
          Width = 353
          Height = 21
          EditLabel.Width = 46
          EditLabel.Height = 13
          EditLabel.Caption = 'Descri'#231#227'o'
          TabOrder = 1
        end
      end
    end
  end
  inherited cdsPesquisa: TClientDataSet
    Left = 320
    Top = 48
  end
  inherited dtsPesquisa: TDataSource
    Left = 260
    Top = 38
  end
end
