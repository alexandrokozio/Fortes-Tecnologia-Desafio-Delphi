unit model.entity.precos;

interface

uses
  Data.DB,
  Generics.Collections,
  model.connection.interfaces,
  model.connection.factory,
  model.entity.interfaces,
  mapping.attributes;

type
  [Table('Precos')]
  TPrecos = class
  private
    FCodigo: Integer;
    FCodigo_Combustivel: Integer;
    FUnidade: string;
    FVrCusto: Double;
    FVrVista: Double;
    FVrImposto: Double;
   public
    {constructor Create;
    destructor Destroy; override;}
    [Column('Codigo', ftInteger, 0, 'Código')]
    property Codigo: Integer read FCodigo write FCodigo;
    [Column('Codigo_Combustivel', ftInteger, 0, 'Combustível')]
    property Codigo_Combustivel: Integer read FCodigo_Combustivel write FCodigo_Combustivel;
    [Column('Unidade', ftString, 10)]
    property Unidade: string read FUnidade write FUnidade;
    [Column('VrCusto', ftFloat)]
    property VrCusto: Double read FVrCusto write FVrCusto;
    [Column('VrVista', ftFloat)]
    property VrVista: Double read FVrVista write FVrVista;
    [Column('VrImposto', ftFloat)]
    property VrImposto: Double read FVrImposto write FVrImposto;
  end;

  TEntityPrecos = class(TInterfacedObject, IEntity)
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

{ TEntityPrecos }

constructor TEntityPrecos.Create;
begin
  FQuery := TConnectionFactory.New.Query;
end;

function TEntityPrecos.DataSet(Value: TObjectList<TObject>): IEntity;
var
  lPreco: TPrecos;
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
      lPreco := TPrecos.Create;
      Value.Add(lPreco);
      lPreco.Codigo := FieldByName('Codigo').AsInteger;
      lPreco.Codigo_Combustivel := FieldByName('Codigo_Combustivel').AsInteger;
      lPreco.Unidade := FieldByName('Unidade').AsString;
      lPreco.VrCusto := FieldByName('VrCusto').AsFloat;
      lPreco.VrVista := FieldByName('VrVista').AsFloat;
      lPreco.VrImposto := FieldByName('VrImposto').AsFloat;
      Next;
    end;
  end;
end;

function TEntityPrecos.DataSet(Value: TDataSource): IEntity;
begin
  Result := Self;
  Value.DataSet := TDataSet(FQuery.Query);
end;

procedure TEntityPrecos.Delete(const AWhere: array of string);
var
  sWhere,
  sSep: string;
  cSql: TStringList;
begin
  cSql := TStringList.Create;
  try
    cSql.Add('DELETE FROM Pedidos');
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

destructor TEntityPrecos.Destroy;
begin

  inherited;
end;

procedure TEntityPrecos.Insert(const AColumns, AValues: array of string);
var
  sValue,
  sColumn,
  sSep: string;
  cSql: TStringList;
begin
  cSql := TStringList.Create;
  try
    cSql.Add('INSERT INTO Precos');
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

class function TEntityPrecos.New: IEntity;
begin
  Result := Self.Create;
end;

procedure TEntityPrecos.Open(const AWhere: array of string);
var
  sWhere,
  sSep: string;
  cSql: TStringList;
begin
  cSql := TStringList.Create;
  try
    cSql.Add('SELECT * FROM Precos');
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

procedure TEntityPrecos.OpenList(Value: TObjectList<TObject>;
  const AWhere: array of string);
var
  lPreco: TPrecos;
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
      lPreco := TPrecos.Create;
      Value.Add(lPreco);
      lPreco.Codigo := FieldByName('Codigo').AsInteger;
      lPreco.Codigo_Combustivel := FieldByName('Codigo_Combustivel').AsInteger;
      lPreco.Unidade := FieldByName('Unidade').AsString;
      lPreco.VrCusto := FieldByName('VrCusto').AsFloat;
      lPreco.VrVista := FieldByName('VrVista').AsFloat;
      lPreco.VrImposto := FieldByName('VrImposto').AsFloat;
      Next;
    end;
  end;
end;

procedure TEntityPrecos.Update(const AColumns, AWhere: array of string);
var
  sWhere,
  sColumn,
  sSep: string;
  cSql: TStringList;
begin
  cSql := TStringList.Create;
  try
    cSql.Add('UPDATE Precos');
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
