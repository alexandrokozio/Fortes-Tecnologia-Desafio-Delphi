inherited fCadastroBombas: TfCadastroBombas
  Caption = 'fCadastroBombas'
  ClientHeight = 235
  ClientWidth = 614
  OnDestroy = FormDestroy
  ExplicitWidth = 630
  ExplicitHeight = 274
  PixelsPerInch = 96
  TextHeight = 13
  inherited tlbMenuPaiCad: TToolBar
    Width = 614
    ExplicitWidth = 614
    inherited navPesquisa: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited pgcCadastro: TPageControl
    Width = 614
    Height = 204
    ActivePage = tsCadastro
    ExplicitWidth = 614
    ExplicitHeight = 204
    inherited tsPesquisa: TTabSheet
      ExplicitWidth = 606
      ExplicitHeight = 169
      inherited stbPesquisa: TStatusBar
        Top = 150
        Width = 606
        ExplicitTop = 150
        ExplicitWidth = 606
      end
      inherited pnlPesquisa: TPanel
        Width = 606
        Height = 150
        TabOrder = 0
        ExplicitWidth = 606
        ExplicitHeight = 150
        inherited grdPesquisa: TDBGrid
          Width = 606
          Height = 103
          TabOrder = 1
        end
        inherited pnlFiltrosPesq: TPanel
          Width = 606
          TabOrder = 0
          ExplicitWidth = 606
          inherited pnlBotoes: TPanel
            Left = 500
            ExplicitLeft = 500
          end
          inherited pnlValores: TPanel
            Width = 203
            ExplicitWidth = 203
            inherited edtPesquisa: TEdit
              Width = 474
              ExplicitWidth = 474
            end
          end
        end
      end
    end
    inherited tsCadastro: TTabSheet
      ExplicitWidth = 606
      ExplicitHeight = 169
      inherited pnlCadastro: TPanel
        Width = 606
        Height = 169
        object Label1: TLabel
          Left = 32
          Top = 36
          Width = 33
          Height = 13
          Caption = 'Codigo'
        end
        object Label2: TLabel
          Left = 32
          Top = 88
          Width = 36
          Height = 13
          Caption = 'Tanque'
        end
        object CampoCodigo: TEdit
          Left = 32
          Top = 52
          Width = 121
          Height = 21
          Enabled = False
          TabOrder = 0
        end
        object CampoCodigo_Tanque: TEdit
          Left = 32
          Top = 104
          Width = 279
          Height = 21
          TabOrder = 1
        end
      end
    end
  end
  inherited cdsPesquisa: TClientDataSet
    Left = 280
    Top = 48
  end
  inherited dtsPesquisa: TDataSource
    Left = 244
    Top = 38
  end
end
