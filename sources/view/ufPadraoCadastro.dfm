inherited fPadraoCadastro: TfPadraoCadastro
  Caption = 'fPadraoCadastro'
  ClientHeight = 377
  ClientWidth = 843
  OnClose = FormClose
  ExplicitWidth = 859
  ExplicitHeight = 416
  PixelsPerInch = 96
  TextHeight = 13
  inherited tlbMenuPaiCad: TToolBar
    Width = 843
    ExplicitWidth = 843
    inherited navPesquisa: TDBNavigator
      Hints.Strings = ()
    end
    object btnNovo: TToolButton
      Left = 255
      Top = 0
      Caption = '&Novo'
      ImageIndex = 7
      OnClick = btnNovoClick
    end
    object btnAlterar: TToolButton
      Left = 315
      Top = 0
      Caption = '&Alterar'
      ImageIndex = 8
      OnClick = btnAlterarClick
    end
    object btnExcluir: TToolButton
      Left = 375
      Top = 0
      Caption = '&Excluir'
      ImageIndex = 9
      OnClick = btnExcluirClick
    end
    object ToolButton4: TToolButton
      Left = 435
      Top = 0
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 8
      Style = tbsSeparator
    end
    object btnCancelar: TToolButton
      Left = 443
      Top = 0
      Caption = '&Cancelar'
      ImageIndex = 11
      OnClick = btnCancelarClick
    end
    object btnGravar: TToolButton
      Left = 503
      Top = 0
      Caption = '&Gravar'
      ImageIndex = 10
      OnClick = btnGravarClick
    end
    object ToolButton1: TToolButton
      Left = 563
      Top = 0
      Width = 8
      Caption = 'ToolButton1'
      ImageIndex = 10
      Style = tbsSeparator
    end
  end
  inherited pgcCadastro: TPageControl
    Width = 843
    Height = 346
    OnChanging = pgcCadastroChanging
    ExplicitWidth = 843
    ExplicitHeight = 346
    inherited tsPesquisa: TTabSheet
      ExplicitWidth = 835
      ExplicitHeight = 311
      inherited stbPesquisa: TStatusBar
        Top = 292
        Width = 835
        ExplicitTop = 292
        ExplicitWidth = 835
      end
      inherited pnlPesquisa: TPanel
        Width = 835
        Height = 292
        ExplicitWidth = 835
        ExplicitHeight = 292
        inherited grdPesquisa: TDBGrid
          Width = 835
          Height = 245
          OnDblClick = grdPesquisaDblClick
        end
        inherited pnlFiltrosPesq: TPanel
          Width = 835
          ExplicitWidth = 835
          inherited pnlBotoes: TPanel
            Left = 729
            ExplicitLeft = 729
          end
          inherited pnlValores: TPanel
            Width = 432
            ExplicitWidth = 432
            DesignSize = (
              432
              45)
            inherited edtPesquisa: TEdit
              Width = 703
              ExplicitWidth = 703
            end
          end
        end
      end
    end
    object tsCadastro: TTabSheet
      Caption = 'Cadastro'
      ImageIndex = 1
      object pnlCadastro: TPanel
        Left = 0
        Top = 0
        Width = 835
        Height = 311
        Align = alClient
        BevelInner = bvLowered
        Caption = 'pnlCadastro'
        ParentShowHint = False
        ShowCaption = False
        ShowHint = False
        TabOrder = 0
      end
    end
  end
end
