unit ufCadastroTanques;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufPadraoCadastro, Data.DB,
  Datasnap.DBClient, Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.DBCtrls, Vcl.ToolWin, Generics.Collections,
  model.entity.tanques;

type
  TfCadastroTanques = class(TfPadraoCadastro)
    Label1: TLabel;
    CampoCodigo: TEdit;
    Label2: TLabel;
    CampoCodigo_Combustivel: TEdit;
    Label4: TLabel;
    CampoCapacidade: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FTanques: TTanques;
    FTanquesList: TObjectList<TTanques>;
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
  fCadastroTanques: TfCadastroTanques;

implementation

uses
  uCommons, rtti.helper;

{$R *.dfm}

procedure TfCadastroTanques.Excluir;
begin
  inherited;
  if ConfirmarAntesDeExcluir then
  begin
    FController.Entities.Tanques.Delete(['Codigo=' +CampoCodigo.Text]);
    DepoisDeExcluir;
  end;
end;

procedure TfCadastroTanques.FormCreate(Sender: TObject);
begin
  inherited;
  FTanques := TTanques.Create;
  FTanquesList := TObjectList<TTanques>.Create;
end;

procedure TfCadastroTanques.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(FTanques);
  FreeAndNil(FTanquesList);
end;

procedure TfCadastroTanques.FormShow(Sender: TObject);
begin
  inherited;
  Self.Caption := TConstantsType.TITLE_CAD_TANQUES;
end;

procedure TfCadastroTanques.GetDataPackage;
begin
  inherited;
  FController.Entities.Tanques.OpenList(TObjectList<TObject>(FTanquesList), []);
end;

procedure TfCadastroTanques.Gravar;
var
  lColVal: array of string;
  lCol: array of string;
begin
  inherited;
  case Modo of
    tmInserindo:
    begin
      lCol := ['Codigo_Combustivel', 'Capacidade'];
      lColVal := [CampoCodigo_Combustivel.Text,
                  CampoCapacidade.Text];
      FController.Entities.Tanques.Insert(lCol, lColVal);
    end;
    tmAlterando:
    begin
      lCol := ['Codigo='+CampoCodigo.Text];
      lColVal := ['Codigo='+CampoCodigo.Text,
                  'Codigo_Combustivel='+CampoCodigo_Combustivel.Text,
                  'Capacidade='+CampoCapacidade.Text];
      FController.Entities.Tanques.Update(lColVal, lCol);
    end;
  end;
end;

procedure TfCadastroTanques.SetClientDataSet;
begin
  inherited;
  CreateClientDataSet(FTanques, cdsPesquisa);
end;

procedure TfCadastroTanques.SetDadosCadastro;
begin
  inherited;
  PopularFormFields(FTanquesList[Pred(cdsPesquisa.RecNo)], Self);
end;

procedure TfCadastroTanques.SetDataClientDataSet;
begin
  inherited;
  PopularClientDataSet(FTanques, TObjectList<TObject>(FTanquesList), cdsPesquisa);
end;

end.
