inherited fPadraoPesquisa: TfPadraoPesquisa
  Caption = 'fPadraoPesquisa'
  ClientHeight = 333
  ClientWidth = 582
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 598
  ExplicitHeight = 372
  PixelsPerInch = 96
  TextHeight = 13
  object tlbMenuPaiCad: TToolBar
    Left = 0
    Top = 0
    Width = 582
    Height = 31
    ButtonHeight = 27
    ButtonWidth = 60
    Caption = 'tlbMenuPaiCad'
    DrawingStyle = dsGradient
    List = True
    ParentShowHint = False
    ShowCaptions = True
    ShowHint = True
    TabOrder = 0
    Wrapable = False
    object btnSepGravar: TToolButton
      Left = 0
      Top = 0
      Width = 8
      Caption = 'btnSepGravar'
      ImageIndex = 5
      Style = tbsSeparator
    end
    object btnExportar: TToolButton
      Left = 8
      Top = 0
      Hint = 'Exportar dados listados'
      Caption = '&Exportar'
      ImageIndex = 3
      Style = tbsDropDown
    end
    object btnImprimir: TToolButton
      Left = 83
      Top = 0
      Hint = 'Imprimir dados listados'
      Caption = '&Imprimir'
      ImageIndex = 1
    end
    object ToolButton2: TToolButton
      Left = 143
      Top = 0
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 6
      Style = tbsSeparator
    end
    object navPesquisa: TDBNavigator
      Left = 151
      Top = 0
      Width = 96
      Height = 27
      DataSource = dtsPesquisa
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 0
    end
    object ToolButton3: TToolButton
      Left = 247
      Top = 0
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 7
      Style = tbsSeparator
    end
  end
  object pgcCadastro: TPageControl
    Left = 0
    Top = 31
    Width = 582
    Height = 302
    ActivePage = tsPesquisa
    Align = alClient
    TabHeight = 25
    TabOrder = 1
    TabWidth = 80
    object tsPesquisa: TTabSheet
      Caption = 'Pesquisa'
      object stbPesquisa: TStatusBar
        Left = 0
        Top = 248
        Width = 574
        Height = 19
        Panels = <
          item
            Text = 'Registro %s do total de %s registros.'
            Width = 50
          end>
      end
      object pnlPesquisa: TPanel
        Left = 0
        Top = 0
        Width = 574
        Height = 248
        Align = alClient
        BevelOuter = bvNone
        Caption = 'pnlPesquisa'
        ShowCaption = False
        TabOrder = 1
        object grdPesquisa: TDBGrid
          Left = 0
          Top = 47
          Width = 574
          Height = 201
          Align = alClient
          DataSource = dtsPesquisa
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
        end
        object pnlFiltrosPesq: TPanel
          Left = 0
          Top = 0
          Width = 574
          Height = 47
          Align = alTop
          TabOrder = 1
          object pnlCampos: TPanel
            Left = 1
            Top = 1
            Width = 296
            Height = 45
            Align = alLeft
            BevelOuter = bvNone
            Ctl3D = True
            ParentBackground = False
            ParentCtl3D = False
            TabOrder = 0
            object lblLocalizar: TLabel
              Left = 6
              Top = 4
              Width = 32
              Height = 13
              Caption = 'Filtrar:'
            end
            object lblCondicao: TLabel
              Left = 182
              Top = 4
              Width = 48
              Height = 13
              Caption = 'Condi'#231#227'o:'
            end
            object cbbCampo: TComboBox
              Left = 6
              Top = 19
              Width = 171
              Height = 21
              Style = csDropDownList
              DropDownCount = 20
              TabOrder = 0
            end
            object cbbCondicao: TComboBox
              Left = 182
              Top = 19
              Width = 110
              Height = 21
              Style = csDropDownList
              DropDownCount = 12
              TabOrder = 1
            end
          end
          object pnlBotoes: TPanel
            Left = 468
            Top = 1
            Width = 105
            Height = 45
            Align = alRight
            BevelOuter = bvNone
            ParentBackground = False
            TabOrder = 2
            object btnCancelarPesquisa: TSpeedButton
              Left = 80
              Top = 15
              Width = 24
              Height = 25
              Glyph.Data = {
                36060000424D3606000000000000360000002800000020000000100000000100
                18000000000000060000340B0000340B00000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FF000000000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000
                00000000FF00FFFF00FFFF00FFFF00FFFF00FF787878787878FF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FF787878787878FF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FF000000000000FF00FFFF00FFFF00FFFF00FFFF00FF0000000000
                00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF787878787878FF00FFFF
                00FFFF00FFFF00FFFF00FF787878787878FF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FF000000000000FF00FFFF00FFFF00FF000000000000FF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF787878787878FF
                00FFFF00FFFF00FF787878787878FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FF000000000000FF00FF000000000000FF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF78787878
                7878FF00FF787878787878FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FF000000000000000000FF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF78
                7878787878787878FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FF000000000000000000FF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF78
                7878787878787878FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FF000000000000FF00FF000000000000FF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF78787878
                7878FF00FF787878787878FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FF000000000000FF00FFFF00FFFF00FF000000000000FF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF787878787878FF
                00FFFF00FFFF00FF787878787878FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FF000000000000FF00FFFF00FFFF00FFFF00FFFF00FF0000000000
                00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF787878787878FF00FFFF
                00FFFF00FFFF00FFFF00FF787878787878FF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FF000000000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000
                00000000FF00FFFF00FFFF00FFFF00FFFF00FF787878787878FF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FF787878787878FF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
            end
            object btnPesquisar: TBitBtn
              Left = 2
              Top = 15
              Width = 77
              Height = 25
              Caption = '&Pesquisar'
              Default = True
              Glyph.Data = {
                36040000424D3604000000000000360000002800000010000000100000000100
                20000000000000040000120B0000120B00000000000000000000FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00145D9503105A921AFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF0022669E061B629AAD22679DFF115B9387FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003272
                AA062B6DA5AD558DBCFF89B5DDFF185F97FFFFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00447FB7063C79
                B1AD6497C5FF9DC1E4FF6699C7FF1F659DEBFFFFFF00FFFFFF00FFFFFF00FFFF
                FF00DDB28F02D9AE8A97D6A985E3D3A57FFDD0A07BFDCD9C76E4A2938ADE75A2
                CCFFABCBE8FF76A4CEFF3070A8EB286BA327FFFFFF00FFFFFF00FFFFFF00E4BD
                9B02E1B896C0E8C9AEFFF5E1CDFFF7E5D3FFF7E5D1FFF3DDC8FFDFBA9CFFC7A8
                91FF86AED5FF417DB5EB3977AF27FFFFFF00FFFFFF00FFFFFF00FFFFFF00E8C3
                A297EDD0B7FFF8E8D9FFF5DEC8FFF3D8BDFFF3D6BBFFF4DBC2FFF7E4D2FFDFBB
                9DFF9D9492F74B84BC27FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ECC8
                A8E3F7E7D7FFF6E1CCFFF4DBC2FFF4DAC0FFF3D8BDFFF3D7BBFFF4DBC2FFF3DE
                C9FFCD9F7BE7FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F0CE
                AEFDF9ECDFFFF5DFC8FFF5DDC6FFF4DCC3FFF4DAC1FFF3D9BEFFF3D7BDFFF8E6
                D3FFD3A57FFDFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F4D3
                B4FDF9EDE1FFF6E1CCFFF5DFC9FFF5DEC7FFF4DCC4FFF4DBC2FFF4DAC0FFF8E7
                D6FFD7AA86FDFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7D7
                B9E3F9EBDEFFF7E7D6FFF6E1CCFFF5E0CAFFF5DEC8FFF5DDC5FFF6E1CBFFF5E2
                D0FFDBB08CE3FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FADB
                BD97F8E2CCFFFAEEE3FFF7E7D6FFF6E2CEFFF6E1CBFFF6E3D0FFF9EADDFFECCF
                B5FFDFB69397FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCDE
                C002FADBBEC0F9E2CDFFFAECDEFFF9EEE2FFF9EDE2FFF8E9DAFFF0D5BDFFE7C0
                9FC0E3BC9A02FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FCDEC102FADCBF97F9D9BBE3F6D6B8FDF4D3B4FDF1CFAFE3EECBAB97EBC6
                A602FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
              TabOrder = 0
            end
          end
          object pnlValores: TPanel
            Left = 297
            Top = 1
            Width = 171
            Height = 45
            Align = alClient
            BevelOuter = bvNone
            ParentBackground = False
            TabOrder = 1
            DesignSize = (
              171
              45)
            object lblValor: TLabel
              Left = 1
              Top = 4
              Width = 122
              Height = 13
              Caption = 'Filtrar por [NomeCampo]:'
            end
            object edtPesquisa: TEdit
              Left = 1
              Top = 19
              Width = 442
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              CharCase = ecUpperCase
              TabOrder = 0
            end
          end
        end
      end
    end
  end
  object cdsPesquisa: TClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = cdsPesquisaAfterOpen
    AfterScroll = cdsPesquisaAfterScroll
    Left = 328
    Top = 32
  end
  object dtsPesquisa: TDataSource
    DataSet = cdsPesquisa
    Left = 284
    Top = 6
  end
end
