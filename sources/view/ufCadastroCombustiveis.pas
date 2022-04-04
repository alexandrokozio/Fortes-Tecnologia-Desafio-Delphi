unit ufCadastroCombustiveis;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufPadraoCadastro, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.DBCtrls,
  Vcl.ToolWin, Data.DB, Datasnap.DBClient, Datasnap.Provider, Vcl.Mask,
  Generics.Collections,
  model.entity.combustiveis;

type
  TfCadastroCombustiveis = class(TfPadraoCadastro)
    CampoCodigo: TLabeledEdit;
    CampoTipo: TLabeledEdit;
    CampoValor: TLabeledEdit;
    CampoDescricao: TLabeledEdit;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FCombustiveis: TCombustiveis;
    FCombustiveisList: TObjectList<TCombustiveis>;
  protected
    procedure ExibirDados; override;
    procedure GetDataPackage; override;
    procedure SetClientDataSet; override;
    procedure SetDataClientDataSet; override;
    procedure SetDadosCadastro; override;
    procedure Excluir; override;
    procedure Gravar; override;
  public
    { Public declarations }
  end;

var
  fCadastroCombustiveis: TfCadastroCombustiveis;

implementation

uses
  uCommons, rtti.helper;

{$R *.dfm}

procedure TfCadastroCombustiveis.GetDataPackage;
begin
  inherited;
  FController.Entities.Combustiveis.OpenList(TObjectList<TObject>(FCombustiveisList), []);
end;

procedure TfCadastroCombustiveis.SetClientDataSet;
begin
  inherited;
  CreateClientDataSet(FCombustiveis, cdsPesquisa);
end;

procedure TfCadastroCombustiveis.SetDadosCadastro;
begin
  inherited;
  PopularFormFields(FCombustiveisList[Pred(cdsPesquisa.RecNo)], Self);
end;

procedure TfCadastroCombustiveis.SetDataClientDataSet;
begin
  inherited;
  PopularClientDataSet(FCombustiveis, TObjectList<TObject>(FCombustiveisList), cdsPesquisa);
end;

procedure TfCadastroCombustiveis.Excluir;
begin
  inherited;
  if ConfirmarAntesDeExcluir then
  begin
    FController.Entities.Combustiveis.Delete(['Codigo=' +CampoCodigo.Text]);
    DepoisDeExcluir;
  end;
end;

procedure TfCadastroCombustiveis.ExibirDados;
begin
  inherited;
  if CampoCodigo.CanFocus then
    CampoCodigo.SetFocus;
end;

procedure TfCadastroCombustiveis.FormCreate(Sender: TObject);
begin
  inherited;
  FCombustiveis := TCombustiveis.Create;
  FCombustiveisList := TObjectList<TCombustiveis>.Create;
end;

procedure TfCadastroCombustiveis.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(FCombustiveis);
  FreeAndNil(FCombustiveisList);
end;

procedure TfCadastroCombustiveis.FormShow(Sender: TObject);
begin
  inherited;
  Self.Caption := TConstantsType.TITLE_CAD_COMBUSTIVEIS;
end;

procedure TfCadastroCombustiveis.Gravar;
var
  lColVal: array of string;
  lCol: array of string;
begin
  inherited;
  case Modo of
    tmInserindo:
    begin
      lCol := [ 'Descricao', 'Tipo', 'Valor'];
      lColVal := [QuotedStr(CampoDescricao.Text),
                  QuotedStr(CampoTipo.Text),
                  CampoValor.Text];
      FController.Entities.Combustiveis.Insert(lCol, lColVal);
    end;
    tmAlterando:
    begin
      lCol := ['Codigo='+CampoCodigo.Text];
      lColVal := ['Codigo='+CampoCodigo.Text,
                  'Descricao='+QuotedStr(CampoDescricao.Text),
                  'Tipo='+QuotedStr(CampoTipo.Text),
                  'Valor='+CampoValor.Text];
      FController.Entities.Combustiveis.Update(lColVal, lCol);
    end;
  end;
end;

end.
