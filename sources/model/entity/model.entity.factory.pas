unit model.entity.factory;

interface

uses
  model.connection.interfaces,
  model.entity.interfaces,
  model.entity.combustiveis,
  model.entity.tanques,
  model.entity.bombas,
  model.entity.precos;

type
  TEntityFactory = class(TInterfacedObject, IEntityFactory)
  private
    FCombustiveis: IEntity;
    FTanques: IEntity;
    FBombas: IEntity;
    FPrecos: IEntity;
  public
    constructor Create;
    destructor Destroy; override;

    class function New: IEntityFactory;
    function Combustiveis: IEntity;
    function Tanques: IEntity;
    function Bombas: IEntity;
    function Precos: IEntity;
  end;

implementation

{ TEntityFactory }

constructor TEntityFactory.Create;
begin

end;

destructor TEntityFactory.Destroy;
begin

  inherited;
end;

class function TEntityFactory.New: IEntityFactory;
begin
  Result := Self.Create;
end;

function TEntityFactory.Precos: IEntity;
begin
  if not Assigned(FPrecos) then
    FPrecos := TEntityPrecos.New;
  Result := FPrecos;
end;

function TEntityFactory.Bombas: IEntity;
begin
  if not Assigned(FBombas) then
    FBombas := TEntityBombas.New;
  Result := FBombas;
end;

function TEntityFactory.Combustiveis: IEntity;
begin
  if not Assigned(FCombustiveis) then
    FCombustiveis := TEntityCombustiveis.New;
  Result := FCombustiveis;
end;

function TEntityFactory.Tanques: IEntity;
begin
  if not Assigned(FTanques) then
    FTanques := TEntityTanques.New;
  Result := FTanques;
end;

end.
