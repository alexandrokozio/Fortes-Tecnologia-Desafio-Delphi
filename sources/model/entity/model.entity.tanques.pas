unit model.entity.tanques;

interface

uses
  Data.DB,
  Generics.Collections,
  model.connection.interfaces,
  model.connection.factory,
  model.entity.interfaces,
  mapping.attributes;

type
  [Table('Tanques')]
  TTanques = class
  private
    FCodigo: Integer;
    FCodigo_Combustivel: Integer;
    FCapacidade: Double;
   public
    [Column('Codigo', ftInteger, 0, 'Código')]
    property Codigo: Integer read FCodigo write FCodigo;
    [Column('Codigo_Combustivel', ftInteger, 0, 'Código Combustível')]
    property Codigo_Combustivel: Integer read FCodigo_Combustivel write FCodigo_Combustivel;
    [Column('Capacidade', ftFloat)]
    property Capacidade: Double read FCapacidade write FCapacidade;
  end;

  TEntityTanques = class(TInterfacedObject, IEntity)
  private
    FQuery: IQuery;
  public
    constructor Create;
    destructor Destroy; override;

    class function New: IEntity;
    function DataSet(Value: TDataSource): IEntity; overload;
    function DataSet(Value: TObjectList<TObject>): IEntity; overload;
    procedure OpenList(Value: TObjectList<TObject>; const AWhere: array of string);
    procedure Open(const AWhere: array of string);
    procedure Delete(const AWhere: array of string);
    procedure Update(const AColumns, AWhere: array of string);
    procedure Insert(const AColumns, AValues: array of string);
  end;

implementation

uses
  System.SysUtils,
  System.Classes;

{ TEntityTanques }

constructor TEntityTanques.Create;
begin
  FQuery := TConnectionFactory.New.Query;
end;

function TEntityTanques.DataSet(Value: TObjectList<TObject>): IEntity;
var
  lTanque: TTanques;
begin
  Result := Self;
  if not Assigned(Value) then
    Exit;

  Value.Clear;
  with TDataSet(FQuery.Query) do
  begin
    First;
    while not Eof do
    begin
      lTanque := TTanques.Create;
      Value.Add(lTanque);
      lTanque.Codigo := FieldByName('Codigo').AsInteger;
      lTanque.Codigo_Combustivel := FieldByName('Codigo_Combustivel').AsInteger;
      lTanque.Capacidade := FieldByName('Capacidade').AsFloat;
      Next;
    end;
  end;
end;

function TEntityTanques.DataSet(Value: TDataSource): IEntity;
begin
  Result := Self;
  Value.DataSet := TDataSet(FQuery.Query);
end;

procedure TEntityTanques.Delete(const AWhere: array of string);
var
  sWhere,
  sSep: string;
  cSql: TStringList;
begin
  cSql := TStringList.Create;
  try
    cSql.Add('DELETE FROM Tanques');
    if Length(AWhere) > 0 then
    begin
      cSql.Add('WHERE 1=1');
      sSep := ' AND ';
      for sWhere in AWhere do
        if not sWhere.IsEmpty then
        cSql.Add(sSep + sWhere);
    end;

    FQuery.ExecSQL(cSql.Text);
  finally
    FreeAndNil(cSql);
  end;
end;

destructor TEntityTanques.Destroy;
begin

  inherited;
end;

procedure TEntityTanques.Insert(const AColumns, AValues: array of string);
var
  sValue,
  sColumn,
  sSep: string;
  cSql: TStringList;
begin
  cSql := TStringList.Create;
  try
    cSql.Add('INSERT INTO Tanques');
    cSql.Add('(');
    sSep := '';
    if Length(AColumns) > 0 then
    begin
      for sColumn in AColumns do
        if not sColumn.IsEmpty then
        begin
          cSql.Add(sSep + sColumn);
          sSep := ',';
        end;
    end;

    cSql.Add(')');
    cSql.Add('VALUES (');
    sSep := '';
    if Length(AValues) > 0 then
    begin
      for sValue in AValues do
        if not sValue.IsEmpty then
        begin
          cSql.Add(sSep + sValue);
          sSep := ',';
        end;
    end;

    cSql.Add(')');
    FQuery.ExecSQL(cSql.Text);
  finally
    FreeAndNil(cSql);
  end;
end;

class function TEntityTanques.New: IEntity;
begin
  Result := Self.Create;
end;

procedure TEntityTanques.Open(const AWhere: array of string);
var
  sWhere,
  sSep: string;
  cSql: TStringList;
begin
  cSql := TStringList.Create;
  try
    cSql.Add('SELECT * FROM Tanques');
    if Length(AWhere) > 0 then
    begin
      cSql.Add('WHERE 1=1');
      sSep := ' AND ';
      for sWhere in AWhere do
        if not sWhere.IsEmpty then
          cSql.Add(sSep + sWhere);
    end;

    FQuery.Open(cSql.Text);
  finally
    FreeAndNil(cSql);
  end;
end;

procedure TEntityTanques.OpenList(Value: TObjectList<TObject>;
  const AWhere: array of string);
var
  lTanque: TTanques;
begin
  if not Assigned(Value) then
    Exit;

  Value.Clear;
  Open(AWhere);
  with TDataSet(FQuery.Query) do
  begin
    First;
    while not Eof do
    begin
      lTanque := TTanques.Create;
      Value.Add(lTanque);
      lTanque.Codigo := FieldByName('Codigo').AsInteger;
      lTanque.Codigo_Combustivel := FieldByName('Codigo_Combustivel').AsInteger;
      lTanque.Capacidade := FieldByName('Capacidade').AsFloat;
      Next;
    end;
  end;
end;

procedure TEntityTanques.Update(const AColumns, AWhere: array of string);
var
  sWhere,
  sColumn,
  sSep: string;
  cSql: TStringList;
begin
  cSql := TStringList.Create;
  try
    cSql.Add('UPDATE Tanques');
    cSql.Add('SET');
    sSep := '';
    if Length(AColumns) > 0 then
    begin
      for sColumn in AColumns do
        if not sColumn.IsEmpty then
        begin
          cSql.Add(sSep + sColumn);
          sSep := ',';
        end;
    end;

    if Length(AWhere) > 0 then
    begin
      cSql.Add('WHERE');
      sSep := '';
      for sWhere in AWhere do
        if not sWhere.IsEmpty then
        begin
          cSql.Add(sSep + sWhere);
          sSep := ' AND ';
        end;
    end;

    FQuery.ExecSQL(cSql.Text);
  finally
    FreeAndNil(cSql);
  end;
end;

end.
