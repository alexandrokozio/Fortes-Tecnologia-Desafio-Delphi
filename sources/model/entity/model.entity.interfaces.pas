unit model.entity.interfaces;

interface

uses
  Data.DB,
  Generics.Collections;

type
  IEntity = interface
    function DataSet(Value: TDataSource): IEntity; overload;
    function DataSet(Value: TObjectList<TObject>): IEntity; overload;
    procedure OpenList(Value: TObjectList<TObject>; const AWhere: array of string);
    procedure Open(const AWhere: array of string);
    procedure Delete(const AWhere: array of string);
    procedure Update(const AColumns, AWhere: array of string);
    procedure Insert(const AColumns, AValues: array of string);
  end;

  IEntityFactory = interface
    function Combustiveis: IEntity;
    function Tanques: IEntity;
    function Bombas: IEntity;
    function Precos: IEntity;
  end;

implementation

end.
