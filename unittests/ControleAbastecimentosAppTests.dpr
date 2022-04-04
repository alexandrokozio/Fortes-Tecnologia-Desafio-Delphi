program ControleAbastecimentosAppTests;
{

  Delphi DUnit Test Project
  -------------------------
  This project contains the DUnit test framework and the GUI/Console test runners.
  Add "CONSOLE_TESTRUNNER" to the conditional defines entry in the project options
  to use the console test runner.  Otherwise the GUI test runner will be used by
  default.

}

{$IFDEF CONSOLE_TESTRUNNER}
{$APPTYPE CONSOLE}
{$ENDIF}

uses
  DUnitTestRunner,
  TestFireDAC in 'TestFireDAC.pas',
  model.controller.entity in '..\sources\control\model.controller.entity.pas',
  model.connection.factory in '..\sources\model\connection\model.connection.factory.pas',
  model.connection.firedac in '..\sources\model\connection\model.connection.firedac.pas',
  model.connection.interfaces in '..\sources\model\connection\model.connection.interfaces.pas',
  rtti.helper in '..\sources\model\entity\rtti.helper.pas',
  mapping.attributes in '..\sources\model\entity\mapping.attributes.pas',
  mapping.types in '..\sources\model\entity\mapping.types.pas',
  model.entity.bombas in '..\sources\model\entity\model.entity.bombas.pas',
  model.entity.combustiveis in '..\sources\model\entity\model.entity.combustiveis.pas',
  model.entity.factory in '..\sources\model\entity\model.entity.factory.pas',
  model.entity.interfaces in '..\sources\model\entity\model.entity.interfaces.pas',
  model.entity.precos in '..\sources\model\entity\model.entity.precos.pas',
  model.entity.tanques in '..\sources\model\entity\model.entity.tanques.pas';

{$R *.RES}

begin
  DUnitTestRunner.RunRegisteredTests;
end.

