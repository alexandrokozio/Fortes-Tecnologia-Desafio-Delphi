unit ufPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufPadraoPrincipal, System.Actions,
  Vcl.ActnList, Vcl.Menus, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Imaging.pngimage;

type
  TfPrincipal = class(TfPadraoPrincipal)
    actCadCombustiveis: TAction;
    pnlMain: TPanel;
    pnlBotoes: TPanel;
    btnCadCombustiveis: TButton;
    btnCaixa: TButton;
    pnlWorkArea: TPanel;
    btnSair: TButton;
    actSair: TAction;
    imgLogo: TImage;
    actCaixa: TAction;
    btnCadTanques: TButton;
    actCadTanques: TAction;
    actCadBombas: TAction;
    actCadPrecos: TAction;
    btnCadPrecos: TButton;
    btnCadBombas: TButton;
    btnVendas: TButton;
    actVendas: TAction;
    procedure actCadCombustiveisExecute(Sender: TObject);
    procedure actSairExecute(Sender: TObject);
    procedure actCadTanquesExecute(Sender: TObject);
    procedure actCadBombasExecute(Sender: TObject);
    procedure actCadPrecosExecute(Sender: TObject);
  private
    { Private declarations }
    FFormActive: TForm;
    procedure LoadForm(AClass: TFormClass);
  public
    { Public declarations }
  end;

var
  fPrincipal: TfPrincipal;

implementation

uses
  ufCadastroCombustiveis, ufCadastroBombas, ufCadastroPrecos, ufCadastroTanques;

{$R *.dfm}

procedure TfPrincipal.actCadBombasExecute(Sender: TObject);
begin
  inherited;
  Self.LoadForm(TfCadastroBombas);
end;

procedure TfPrincipal.actCadCombustiveisExecute(Sender: TObject);
begin
  inherited;
  Self.LoadForm(TfCadastroCombustiveis);
end;

procedure TfPrincipal.actCadPrecosExecute(Sender: TObject);
begin
  inherited;
  Self.LoadForm(TfCadastroPrecos);
end;

procedure TfPrincipal.actCadTanquesExecute(Sender: TObject);
begin
  inherited;
  Self.LoadForm(TfCadastroTanques);
end;

procedure TfPrincipal.actSairExecute(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfPrincipal.LoadForm(AClass: TFormClass);
begin
  if Assigned(Self.FFormActive) then
  begin
    Self.FFormActive.Close;
    Self.FFormActive.Free;
    Self.FFormActive := nil;
  end;

  Self.FFormActive := AClass.Create(nil);
  Self.FFormActive.Parent := Self.pnlWorkArea;
  Self.FFormActive.BorderStyle := TFormBorderStyle.bsNone;
  Self.FFormActive.Top := 0;
  Self.FFormActive.Left := 0;
  Self.FFormActive.Align := TAlign.alClient;
  Self.FFormActive.Show;

  Self.Caption := Format('%s - [%s]', [Application.Title, Self.FFormActive.Caption]);
end;

end.
