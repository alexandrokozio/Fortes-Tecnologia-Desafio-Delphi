unit ufPadraoCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufPadraoPesquisa, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.DBCtrls,
  Vcl.ToolWin, Data.DB, Datasnap.DBClient, Datasnap.Provider;

type
  TModo = (tmInserindo, tmAlterando, tmExcluindo, tmConsultando);

  TfPadraoCadastro = class(TfPadraoPesquisa)
    tsCadastro: TTabSheet;
    pnlCadastro: TPanel;
    btnNovo: TToolButton;
    btnAlterar: TToolButton;
    btnExcluir: TToolButton;
    ToolButton1: TToolButton;
    btnGravar: TToolButton;
    btnCancelar: TToolButton;
    ToolButton4: TToolButton;
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pgcCadastroChanging(Sender: TObject; var AllowChange: Boolean);
    procedure FormShow(Sender: TObject);
    procedure cdsPesquisaAfterScroll(DataSet: TDataSet);
    procedure grdPesquisaDblClick(Sender: TObject);
  private
    { Private declarations }
    FModo: TModo;
    procedure setModo(const Value: TModo);
    procedure DesabilitarEdicao(const Value: Boolean);
  protected
    procedure IniciarTela; virtual;
    procedure HabilitarBotoesCRUD(const Value: Boolean); virtual;

    procedure Novo; virtual;
    procedure Alterar; virtual;

    function  ConfirmarAntesDeExcluir: Boolean; virtual;
    procedure Excluir; virtual;
    procedure DepoisDeExcluir; virtual;

    function  ConfirmarAntesDeCancelar: Boolean; virtual;
    procedure Cancelar; virtual;
    procedure DepoisDeCancelar; virtual;

    procedure Gravar; virtual; abstract;
    procedure DepoisDeGravar; virtual;

    //function  ValidarDados: Boolean; virtual; abstract;
    procedure AtribuirValores; virtual; abstract;

    procedure SetTabSheet(ATabSheet: TTabSheet);
    procedure ExibirDados; virtual;
    procedure LimparTela; virtual;
  public
    { Public declarations }
    property Modo: TModo read FModo write setModo;
  end;

var
  fPadraoCadastro: TfPadraoCadastro;

implementation

uses
  rtti.helper;

{$R *.dfm}

{ TfPadraoCadastro }

procedure TfPadraoCadastro.Alterar;
begin
  Modo := tmAlterando;
  HabilitarBotoesCRUD(False);
  ExibirDados;
end;

procedure TfPadraoCadastro.btnAlterarClick(Sender: TObject);
begin
  inherited;
  Alterar;
end;

procedure TfPadraoCadastro.btnCancelarClick(Sender: TObject);
begin
  inherited;
  if ConfirmarAntesDeCancelar then
  begin
    Cancelar;
    DepoisDeCancelar;
  end;
end;

procedure TfPadraoCadastro.btnExcluirClick(Sender: TObject);
begin
  inherited;
  Excluir;
end;

procedure TfPadraoCadastro.btnGravarClick(Sender: TObject);
begin
  inherited;
  //if ValidarDados then
  begin
    Gravar;
    Application.MessageBox('MSG_REG_GRAVADO_SUCESSO', 'MSG_SUCESSO',
      MB_OK+MB_ICONEXCLAMATION);
    DepoisDeGravar;
  end;
end;

procedure TfPadraoCadastro.btnNovoClick(Sender: TObject);
begin
  inherited;
  Novo;
end;

procedure TfPadraoCadastro.Cancelar;
begin
  Modo := tmConsultando;
  HabilitarBotoesCRUD(True);
  SetTabSheet(tsPesquisa);
end;

procedure TfPadraoCadastro.cdsPesquisaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if pgcCadastro.ActivePage = tsCadastro then
    SetDadosCadastro;
end;

function TfPadraoCadastro.ConfirmarAntesDeCancelar: Boolean;
begin
  Result := Application.MessageBox('MSG_CONFIRME_CANCEL_EDICAO',
    'MSG_CONFIRME_OPCAO', MB_ICONQUESTION+MB_YESNO) = IDYES;
end;

function TfPadraoCadastro.ConfirmarAntesDeExcluir: Boolean;
begin
  Result := Application.MessageBox('MSG_CONFIRME_EXCLUSAO_REG_SEL',
    'MSG_CONFIRME_OPCAO', MB_ICONQUESTION+MB_YESNO) = IDYES;
end;

procedure TfPadraoCadastro.DepoisDeCancelar;
begin
  RefreshClientDataSet;
end;

procedure TfPadraoCadastro.DepoisDeExcluir;
begin
  Modo := tmConsultando;
  HabilitarBotoesCRUD(False);
  RefreshClientDataSet;
  SetTabSheet(tsPesquisa);
end;

procedure TfPadraoCadastro.DepoisDeGravar;
begin
  Modo := tmConsultando;
  HabilitarBotoesCRUD(True);
  RefreshClientDataSet;
  SetTabSheet(tsPesquisa);
end;

procedure TfPadraoCadastro.Excluir;
begin
  Modo := tmExcluindo;
  HabilitarBotoesCRUD(False);
  ExibirDados;
end;

procedure TfPadraoCadastro.ExibirDados;
begin
  SetTabSheet(tsCadastro);
  SetDadosCadastro;
end;

procedure TfPadraoCadastro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if not (Modo = tmConsultando) then
  if True then 
  begin
    if Application.MessageBox('MSG_DADOS_EM_EDICAO'+#13+'MSG_CONFIRME_CANCEL_ALTERACAO',
      'MSG_CONFIRME_OPCAO', MB_ICONQUESTION+MB_YESNO) = IDYES then
    begin
      Cancelar;
      DepoisDeCancelar;
      inherited;
    end
    else
    begin
      Action := caNone;
    end;
  end
  else
    inherited;
end;

procedure TfPadraoCadastro.FormShow(Sender: TObject);
begin
  inherited;
  IniciarTela;
end;

procedure TfPadraoCadastro.grdPesquisaDblClick(Sender: TObject);
begin
  inherited;
  if HaRegistro then
  begin
    Modo := tmConsultando;
    ExibirDados;
  end;
end;

procedure TfPadraoCadastro.DesabilitarEdicao(const Value: Boolean);
begin
  btnAlterar.Enabled := not Value;
  btnExcluir.Enabled := not Value;
  tsCadastro.TabVisible := not Value;
end;

procedure TfPadraoCadastro.HabilitarBotoesCRUD(const Value: Boolean);
begin
  btnNovo.Enabled     := Value;
  btnAlterar.Enabled  := Value and HaRegistro;
  btnExcluir.Enabled  := Value and HaRegistro;
  btnCancelar.Enabled := (not Value);
  btnGravar.Enabled   := (not Value);
end;

procedure TfPadraoCadastro.IniciarTela;
begin
  Modo := tmConsultando;
  HabilitarBotoesCRUD(True);
  LimparTela;
  SetTabSheet(tsPesquisa);
end;

procedure TfPadraoCadastro.LimparTela;
var
  i: Integer;
begin
  for i := 0 to Self.ComponentCount - 1 do
    if Self.Components[i] is TCustomEdit then
     (Self.Components[i] as TCustomEdit).Clear
    else
    if (Self.Components[i] is TDateTimePicker ) then
      (Self.Components[i] as TDateTimePicker ).Date := Date;
end;

procedure TfPadraoCadastro.Novo;
begin
  Modo := tmInserindo;
  HabilitarBotoesCRUD(False);
  DesabilitarEdicao(False);
  LimparTela;
  SetTabSheet(tsCadastro);
end;

procedure TfPadraoCadastro.pgcCadastroChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  inherited;
  if not (Modo = tmConsultando) then
  begin
    if Application.MessageBox('MSG_DADOS_EM_EDICAO'+#13+'MSG_CONFIRME_CANCEL_ALTERACAO',
      'MSG_CONFIRME_OPCAO', MB_ICONQUESTION+MB_YESNO) = IDYES then
    begin
      Cancelar;
      DepoisDeCancelar;
    end
    else
      AllowChange := False;
  end
  else
  if pgcCadastro.ActivePage = tsPesquisa then
    ExibirDados
  else
  if pgcCadastro.ActivePage = tsCadastro then
    Modo := tmConsultando;
end;

procedure TfPadraoCadastro.setModo(const Value: TModo);
begin
  FModo := Value;
end;

procedure TfPadraoCadastro.SetTabSheet(ATabSheet: TTabSheet);
begin
  pgcCadastro.ActivePage := ATabSheet;
end;

end.
