inherited fCadastroPrecos: TfCadastroPrecos
  Caption = 'fCadastroPrecos'
  ClientHeight = 423
  ClientWidth = 611
  OnDestroy = FormDestroy
  ExplicitWidth = 627
  ExplicitHeight = 462
  PixelsPerInch = 96
  TextHeight = 13
  inherited tlbMenuPaiCad: TToolBar
    Width = 611
    ExplicitWidth = 611
    inherited navPesquisa: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited pgcCadastro: TPageControl
    Width = 611
    Height = 392
    ActivePage = tsCadastro
    ExplicitWidth = 611
    ExplicitHeight = 195
    inherited tsPesquisa: TTabSheet
      ExplicitWidth = 603
      ExplicitHeight = 160
      inherited stbPesquisa: TStatusBar
        Top = 338
        Width = 603
        ExplicitTop = 141
        ExplicitWidth = 603
      end
      inherited pnlPesquisa: TPanel
        Width = 603
        Height = 338
        TabOrder = 0
        ExplicitWidth = 603
        ExplicitHeight = 141
        inherited grdPesquisa: TDBGrid
          Width = 603
          Height = 291
          TabOrder = 1
        end
        inherited pnlFiltrosPesq: TPanel
          Width = 603
          TabOrder = 0
          ExplicitWidth = 603
          inherited pnlBotoes: TPanel
            Left = 497
            ExplicitLeft = 497
          end
          inherited pnlValores: TPanel
            Width = 200
            ExplicitWidth = 200
            inherited edtPesquisa: TEdit
              Width = 471
              ExplicitWidth = 471
            end
          end
        end
      end
    end
    inherited tsCadastro: TTabSheet
      ExplicitWidth = 603
      ExplicitHeight = 160
      inherited pnlCadastro: TPanel
        Width = 603
        Height = 357
        ExplicitWidth = 603
        ExplicitHeight = 160
        object Label1: TLabel
          Left = 32
          Top = 36
          Width = 33
          Height = 13
          Caption = 'Codigo'
        end
        object Label3: TLabel
          Left = 32
          Top = 84
          Width = 94
          Height = 13
          Caption = 'C'#243'digo Combust'#237'vel'
        end
        object Label5: TLabel
          Left = 32
          Top = 131
          Width = 39
          Height = 13
          Caption = 'Unidade'
        end
        object Label6: TLabel
          Left = 32
          Top = 183
          Width = 41
          Height = 13
          Caption = 'Vr Custo'
        end
        object Label7: TLabel
          Left = 32
          Top = 231
          Width = 45
          Height = 13
          Caption = 'Vr '#224' Vista'
        end
        object Label8: TLabel
          Left = 32
          Top = 278
          Width = 52
          Height = 13
          Caption = 'Vr Imposto'
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
          Top = 100
          Width = 279
          Height = 21
          TabOrder = 1
        end
        object CampoUnidade: TEdit
          Left = 32
          Top = 148
          Width = 100
          Height = 21
          TabOrder = 2
        end
        object CampoVrCusto: TEdit
          Left = 32
          Top = 202
          Width = 100
          Height = 21
          TabOrder = 3
        end
        object CampoVravista: TEdit
          Left = 32
          Top = 248
          Width = 100
          Height = 21
          TabOrder = 4
        end
        object CampoVrImposto: TEdit
          Left = 32
          Top = 294
          Width = 100
          Height = 21
          TabOrder = 5
        end
      end
    end
  end
end
