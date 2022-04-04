unit ufCadastroPrecos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufPadraoCadastro, Data.DB,
  Datasnap.DBClient, Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.DBCtrls, Vcl.ToolWin, Generics.Collections,
  model.entity.precos;

type
  TfCadastroPrecos = class(TfPadraoCadastro)
    Label1: TLabel;
    CampoCodigo: TEdit;
    Label3: TLabel;
    CampoCodigo_Combustivel: TEdit;
    CampoUnidade: TEdit;
    Label5: TLabel;
    CampoVrCusto: TEdit;
    Label6: TLabel;
    CampoVravista: TEdit;
    Label7: TLabel;
    CampoVrImposto: TEdit;
    Label8: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FPrecos: TPrecos;
    FPrecosList: TObjectList<TPrecos>;
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
  fCadastroPrecos: TfCadastroPrecos;

implementation

uses
  uCommons, rtti.helper;

{$R *.dfm}

{ TfCadastroPrecos }

procedure TfCadastroPrecos.Excluir;
begin
  inherited;
  if ConfirmarAntesDeExcluir then
  begin
    FController.Entities.Precos.Delete(['Codigo=' +CampoCodigo.Text]);
    DepoisDeExcluir;
  end;
end;

procedure TfCadastroPrecos.FormCreate(Sender: TObject);
begin
  inherited;
  FPrecos := TPrecos.Create;
  FPrecosList := TObjectList<TPrecos>.Create;
end;

procedure TfCadastroPrecos.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(FPrecos);
  FreeAndNil(FPrecosList);
end;

procedure TfCadastroPrecos.GetDataPackage;
begin
  inherited;
  FController.Entities.Precos.OpenList(TObjectList<TObject>(FPrecosList), []);
end;

procedure TfCadastroPrecos.Gravar;
var
  lColVal: array of string;
  lCol: array of string;
begin
  inherited;
  case Modo of
    tmInserindo:
    begin
      lCol := ['Codigo_Combustivel', 'Unidade', 'VrCusto',
               'VrAvista', 'VrImposto'];
      lColVal := [CampoCodigo_Combustivel.Text,
                  CampoUnidade.Text, CampoVrCusto.Text, CampoVrAvista.Text,
                  CampoVrImposto.Text];
      FController.Entities.Tanques.Insert(lCol, lColVal);
    end;
    tmAlterando:
    begin
      lCol := ['Codigo='+CampoCodigo.Text];
      lColVal := ['Codigo='+CampoCodigo.Text,
                  'Codigo_Combustivel='+CampoCodigo_Combustivel.Text,
                  'Unidade='+CampoUnidade.Text,
                  'VrCusto='+CampoVrCusto.Text,
                  'VrAvista='+CampoVrAvista.Text,
                  'VrIMposto='+CampoVrimposto.Text];
      FController.Entities.Tanques.Update(lColVal, lCol);
    end;
  end;
end;

procedure TfCadastroPrecos.SetClientDataSet;
begin
  inherited;
  CreateClientDataSet(FPrecos, cdsPesquisa);
end;

procedure TfCadastroPrecos.SetDadosCadastro;
begin
  inherited;
  PopularFormFields(FPrecosList[Pred(cdsPesquisa.RecNo)], Self);
end;

procedure TfCadastroPrecos.SetDataClientDataSet;
begin
  inherited;
  PopularClientDataSet(FPrecos, TObjectList<TObject>(FPrecosList), cdsPesquisa);
end;

end.
