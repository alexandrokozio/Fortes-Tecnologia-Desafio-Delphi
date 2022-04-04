unit ufCadastroBombas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufPadraoCadastro, Data.DB,
  Datasnap.DBClient, Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.DBCtrls, Vcl.ToolWin, Generics.Collections,
  model.entity.bombas;

type
  TfCadastroBombas = class(TfPadraoCadastro)
    Label1: TLabel;
    CampoCodigo: TEdit;
    Label2: TLabel;
    CampoCodigo_Tanque: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FBombas: TBombas;
    FBombasList: TObjectList<TBombas>;
  protected
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
  fCadastroBombas: TfCadastroBombas;

implementation

uses
  uCommons, rtti.helper;

{$R *.dfm}

{ TfCadastroBombas }

procedure TfCadastroBombas.Excluir;
begin
  inherited;
  if ConfirmarAntesDeExcluir then
  begin
    FController.Entities.Bombas.Delete(['Codigo=' +CampoCodigo.Text]);
    DepoisDeExcluir;
  end;
end;

procedure TfCadastroBombas.FormCreate(Sender: TObject);
begin
  inherited;
  FBombas := TBombas.Create;
  FBombasList := TObjectList<TBombas>.Create;
end;

procedure TfCadastroBombas.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(FBombas);
  FreeAndNil(FBombasList);
end;

procedure TfCadastroBombas.FormShow(Sender: TObject);
begin
  inherited;
  Self.Caption := TConstantsType.TITLE_CAD_BOMBAS;
end;

procedure TfCadastroBombas.GetDataPackage;
begin
  inherited;
  FController.Entities.Bombas.OpenList(TObjectList<TObject>(FBombasList), []);
end;

procedure TfCadastroBombas.Gravar;
var
  lColVal: array of string;
  lCol: array of string;
begin
  inherited;
  case Modo of
    tmInserindo:
    begin
      lCol := ['Codigo_Tanque'];
      lColVal := [CampoCodigo_Tanque.Text];
      FController.Entities.Bombas.Insert(lCol, lColVal);
    end;
    tmAlterando:
    begin
      lCol := ['Codigo='+CampoCodigo.Text];
      lColVal := ['Codigo='+CampoCodigo.Text,
                  'Codigo_Tanque='+CampoCodigo_Tanque.Text];
      FController.Entities.Bombas.Update(lColVal, lCol);
    end;
  end;
end;

procedure TfCadastroBombas.SetClientDataSet;
begin
  inherited;
  CreateClientDataSet(FBombas, cdsPesquisa);
end;

procedure TfCadastroBombas.SetDadosCadastro;
begin
  inherited;
  PopularFormFields(FBombasList[Pred(cdsPesquisa.RecNo)], Self);
end;

procedure TfCadastroBombas.SetDataClientDataSet;
begin
  inherited;
  PopularClientDataSet(FBombas, TObjectList<TObject>(FBombasList), cdsPesquisa);
end;

end.
