program ControleAbastecimentosApp;

uses
  Vcl.Forms,
  model.connection.factory in '..\..\sources\model\connection\model.connection.factory.pas',
  model.connection.firedac in '..\..\sources\model\connection\model.connection.firedac.pas',
  model.connection.interfaces in '..\..\sources\model\connection\model.connection.interfaces.pas',
  model.entity.combustiveis in '..\..\sources\model\entity\model.entity.combustiveis.pas',
  model.entity.factory in '..\..\sources\model\entity\model.entity.factory.pas',
  model.controller.entity in '..\..\sources\control\model.controller.entity.pas',
  ufPadrao in '..\..\sources\view\ufPadrao.pas' {fPadrao},
  ufPadraoPrincipal in '..\..\sources\view\ufPadraoPrincipal.pas' {fPadraoPrincipal},
  ufPadraoPesquisa in '..\..\sources\view\ufPadraoPesquisa.pas' {fPadraoPesquisa},
  ufPadraoCadastro in '..\..\sources\view\ufPadraoCadastro.pas' {fPadraoCadastro},
  uCommons in '..\..\sources\commons\uCommons.pas',
  udPrincipal in '..\..\sources\view\udPrincipal.pas' {dtmPrincipal: TDataModule},
  ufCadastroCombustiveis in '..\..\sources\view\ufCadastroCombustiveis.pas' {fCadastroCombustiveis},
  ufPrincipal in '..\..\sources\view\ufPrincipal.pas' {fPrincipal},
  model.entity.interfaces in '..\..\sources\model\entity\model.entity.interfaces.pas',
  mapping.attributes in '..\..\sources\model\entity\mapping.attributes.pas',
  mapping.types in '..\..\sources\model\entity\mapping.types.pas',
  rtti.helper in '..\..\sources\model\entity\rtti.helper.pas',
  ufCadastroTanques in '..\..\sources\view\ufCadastroTanques.pas' {fCadastroTanques},
  ufCadastroBombas in '..\..\sources\view\ufCadastroBombas.pas' {fCadastroBombas},
  ufCadastroPrecos in '..\..\sources\view\ufCadastroPrecos.pas' {fCadastroPrecos},
  model.entity.tanques in '..\..\sources\model\entity\model.entity.tanques.pas',
  model.entity.bombas in '..\..\sources\model\entity\model.entity.bombas.pas',
  model.entity.precos in '..\..\sources\model\entity\model.entity.precos.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := TConstantsType.TITLE_APP;
  Application.CreateForm(TdtmPrincipal, dtmPrincipal);
  Application.CreateForm(TfPrincipal, fPrincipal);
  Application.Run;
end.
