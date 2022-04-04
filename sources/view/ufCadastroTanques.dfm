inherited fCadastroTanques: TfCadastroTanques
  Caption = 'fCadastroTanques'
  ClientHeight = 316
  ClientWidth = 622
  OnDestroy = FormDestroy
  ExplicitWidth = 638
  ExplicitHeight = 355
  PixelsPerInch = 96
  TextHeight = 13
  inherited tlbMenuPaiCad: TToolBar
    Width = 622
    ExplicitWidth = 599
    inherited navPesquisa: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited pgcCadastro: TPageControl
    Width = 622
    Height = 285
    ActivePage = tsCadastro
    ExplicitWidth = 599
    ExplicitHeight = 220
    inherited tsPesquisa: TTabSheet
      ExplicitWidth = 591
      ExplicitHeight = 185
      inherited stbPesquisa: TStatusBar
        Top = 231
        Width = 614
        ExplicitTop = 166
        ExplicitWidth = 591
      end
      inherited pnlPesquisa: TPanel
        Width = 614
        Height = 231
        TabOrder = 0
        ExplicitWidth = 591
        ExplicitHeight = 166
        inherited grdPesquisa: TDBGrid
          Width = 614
          Height = 184
          TabOrder = 1
        end
        inherited pnlFiltrosPesq: TPanel
          Width = 614
          TabOrder = 0
          ExplicitWidth = 591
          inherited pnlBotoes: TPanel
            Left = 508
            ExplicitLeft = 485
          end
          inherited pnlValores: TPanel
            Width = 211
            ExplicitWidth = 188
            inherited edtPesquisa: TEdit
              Width = 482
              ExplicitWidth = 459
            end
          end
        end
      end
    end
    inherited tsCadastro: TTabSheet
      ExplicitWidth = 591
      ExplicitHeight = 185
      inherited pnlCadastro: TPanel
        Width = 614
        Height = 250
        ExplicitWidth = 591
        ExplicitHeight = 185
        object Label1: TLabel
          Left = 32
          Top = 36
          Width = 33
          Height = 13
          Caption = 'Codigo'
        end
        object Label2: TLabel
          Left = 32
          Top = 90
          Width = 94
          Height = 13
          Caption = 'C'#243'digo Combust'#237'vel'
        end
        object Label4: TLabel
          Left = 32
          Top = 141
          Width = 56
          Height = 13
          Caption = 'Capacidade'
        end
        object CampoCodigo: TEdit
          Left = 32
          Top = 52
          Width = 121
          Height = 21
          Enabled = False
          TabOrder = 0
        end
        object CampoCodigo_Combustivel: TEdit
          Left = 32
          Top = 106
          Width = 279
          Height = 21
          TabOrder = 1
        end
        object CampoCapacidade: TEdit
          Left = 32
          Top = 159
          Width = 279
          Height = 21
          TabOrder = 2
        end
      end
    end
  end
  inherited cdsPesquisa: TClientDataSet
    Left = 296
    Top = 40
  end
  inherited dtsPesquisa: TDataSource
    Left = 244
    Top = 38
  end
end
