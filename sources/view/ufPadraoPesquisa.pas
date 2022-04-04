unit ufPadraoPesquisa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufPadrao, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.DBCtrls, Vcl.ToolWin,
  Data.DB, System.Generics.Collections,
  model.controller.entity,
  model.entity.interfaces, Datasnap.DBClient;

type
  TfPadraoPesquisa = class(TfPadrao)
    tlbMenuPaiCad: TToolBar;
    btnSepGravar: TToolButton;
    btnExportar: TToolButton;
    btnImprimir: TToolButton;
    ToolButton2: TToolButton;
    navPesquisa: TDBNavigator;
    ToolButton3: TToolButton;
    pgcCadastro: TPageControl;
    tsPesquisa: TTabSheet;
    stbPesquisa: TStatusBar;
    pnlPesquisa: TPanel;
    grdPesquisa: TDBGrid;
    pnlFiltrosPesq: TPanel;
    pnlCampos: TPanel;
    lblLocalizar: TLabel;
    lblCondicao: TLabel;
    cbbCampo: TComboBox;
    cbbCondicao: TComboBox;
    pnlBotoes: TPanel;
    btnCancelarPesquisa: TSpeedButton;
    btnPesquisar: TBitBtn;
    pnlValores: TPanel;
    lblValor: TLabel;
    edtPesquisa: TEdit;
    cdsPesquisa: TClientDataSet;
    dtsPesquisa: TDataSource;
    procedure cdsPesquisaAfterOpen(DataSet: TDataSet);
    procedure cdsPesquisaAfterScroll(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure SetStatusBar;
  protected
    FController: IController;
    procedure GetDataPackage; virtual; abstract;
    procedure SetClientDataSet; virtual; abstract;
    procedure SetDataClientDataSet; virtual; abstract;
    procedure SetDadosCadastro; virtual; abstract;
    function HaRegistro: Boolean; virtual;
    procedure RefreshClientDataSet;
  public
    { Public declarations }
  end;

var
  fPadraoPesquisa: TfPadraoPesquisa;

implementation

uses
  uCommons;

{$R *.dfm}

procedure TfPadraoPesquisa.cdsPesquisaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  SetStatusBar;
end;

procedure TfPadraoPesquisa.cdsPesquisaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  SetStatusBar;
end;

procedure TfPadraoPesquisa.FormCreate(Sender: TObject);
begin
  inherited;
  FController := TController.New;
end;

procedure TfPadraoPesquisa.FormShow(Sender: TObject);
begin
  inherited;
  pgcCadastro.ActivePage := tsPesquisa;
  RefreshClientDataSet;
end;

function TfPadraoPesquisa.HaRegistro: Boolean;
begin
  Result := cdsPesquisa.Active and (cdsPesquisa.RecordCount > 0);
end;

procedure TfPadraoPesquisa.RefreshClientDataSet;
begin
  GetDataPackage;
  SetClientDataSet;
  SetDataClientDataSet;
end;

procedure TfPadraoPesquisa.SetStatusBar;
begin
  if cdsPesquisa.Active then
  begin
    stbPesquisa.Panels[0].Text := Format(TMessagesAppType.MSG_REGISTRO_TOTAL_PESQUISA,
      [IntToStr(cdsPesquisa.RecNo), IntToStr(cdsPesquisa.RecordCount)]);
  end;
end;

end.
