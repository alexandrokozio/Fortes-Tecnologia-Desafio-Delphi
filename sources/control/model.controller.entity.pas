unit model.controller.entity;

interface

uses
  model.connection.interfaces,
  model.entity.interfaces,
  model.entity.factory;

type
  IController = interface
    function Entities: IEntityFactory;
  end;

  TController = class(TInterfacedObject, IController)
  private
    FEntities: IEntityFactory;
  public
    constructor Create;
    destructor Destroy; override;

    class function New: IController;
    function Entities: IEntityFactory;
  end;

implementation

{ TController }

constructor TController.Create;
begin
  FEntities := TEntityFactory.New;
end;

destructor TController.Destroy;
begin

  inherited;
end;

function TController.Entities: IEntityFactory;
begin
  Result := FEntities;
end;

class function TController.New: IController;
begin
  Result := Self.Create;
end;

end.
