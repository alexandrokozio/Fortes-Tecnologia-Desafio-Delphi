unit model.entity.bombas;

interface

uses
  Data.DB,
  Generics.Collections,
  model.connection.interfaces,
  model.connection.factory,
  model.entity.interfaces,
  mapping.attributes;

type
  [Table('Bombas')]
  TBombas = class
  private
    FCodigo: Integer;
    FCodigo_Tanque: Integer;
   public
    [Column('Codigo', ftInteger, 0, 'Código')]
    property Codigo: Integer read FCodigo write FCodigo;
    [Column('Codigo_Tanque', ftInteger, 0, 'Código Tanque')]
    property Codigo_Tanque: Integer read FCodigo_Tanque write FCodigo_Tanque;
  end;

  TEntityBombas = class(TInterfacedObject, IEntity)
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

{ TEntityBombas }

constructor TEntityBombas.Create;
begin
  FQuery := TConnectionFactory.New.Query;
end;

function TEntityBombas.DataSet(Value: TObjectList<TObject>): IEntity;
var
  lBomba: TBombas;
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
      lBomba := TBombas.Create;
      Value.Add(lBomba);
      lBomba.Codigo := FieldByName('Codigo').AsInteger;
      lBomba.Codigo_Tanque := FieldByName('Codigo_Tanque').AsInteger;
      Next;
    end;
  end;
end;

function TEntityBombas.DataSet(Value: TDataSource): IEntity;
begin
  Result := Self;
  Value.DataSet := TDataSet(FQuery.Query);
end;

procedure TEntityBombas.Delete(const AWhere: array of string);
var
  sWhere,
  sSep: string;
  cSql: TStringList;
begin
  cSql := TStringList.Create;
  try
    cSql.Add('DELETE FROM Bombas');
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

destructor TEntityBombas.Destroy;
begin

  inherited;
end;

procedure TEntityBombas.Insert(const AColumns, AValues: array of string);
var
  sValue,
  sColumn,
  sSep: string;
  cSql: TStringList;
begin
  cSql := TStringList.Create;
  try
    cSql.Add('INSERT INTO Bombas');
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

class function TEntityBombas.New: IEntity;
begin
  Result := Self.Create;
end;

procedure TEntityBombas.Open(const AWhere: array of string);
var
  sWhere,
  sSep: string;
  cSql: TStringList;
begin
  cSql := TStringList.Create;
  try
    cSql.Add('SELECT * FROM Bombas');
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

procedure TEntityBombas.OpenList(Value: TObjectList<TObject>;
  const AWhere: array of string);
var
  lBomba: TBombas;
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
      lBomba := TBombas.Create;
      Value.Add(lBomba);
      lBomba.Codigo := FieldByName('Codigo').AsInteger;
      lBomba.Codigo_Tanque := FieldByName('Codigo_Tanque').AsInteger;
      Next;
    end;
  end;
end;

procedure TEntityBombas.Update(const AColumns, AWhere: array of string);
var
  sWhere,
  sColumn,
  sSep: string;
  cSql: TStringList;
begin
  cSql := TStringList.Create;
  try
    cSql.Add('UPDATE Bombas');
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
