unit model.entity.combustiveis;

interface

uses
  Data.DB,
  Generics.Collections,
  model.connection.interfaces,
  model.connection.factory,
  model.entity.interfaces,
  mapping.attributes;

type
  [Table('Combustiveis')]
  TCombustiveis = class
  private
    FCodigo: Integer;
    FDescricao: string;
    FTipo: string;
    FValor: Double;
   public
    {constructor Create;
    destructor Destroy; override;}
    [Column('Codigo', ftInteger, 0, 'Código')]
    property Codigo: Integer read FCodigo write FCodigo;
    [Column('Descricao', ftString, 100, 'Descrição')]
    property Descricao: string read FDescricao write FDescricao;
    [Column('Tipo', ftString, 20)]
    property Tipo: string read FTipo write FTipo;
    [Column('Valor', ftFloat)]
    property Valor: Double read FValor write FValor;
  end;

  TEntityCombustiveis = class(TInterfacedObject, IEntity)
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

{ TEntityCombustiveis }

constructor TEntityCombustiveis.Create;
begin
  FQuery := TConnectionFactory.New.Query;
end;

function TEntityCombustiveis.DataSet(Value: TDataSource): IEntity;
begin
  Result := Self;
  Value.DataSet := TDataSet(FQuery.Query);
end;

function TEntityCombustiveis.DataSet(Value: TObjectList<TObject>): IEntity;
var
  lCombustivel: TCombustiveis;
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
      lCombustivel := TCombustiveis.Create;
      Value.Add(lCombustivel);
      lCombustivel.Codigo := FieldByName('Codigo').AsInteger;
      lCombustivel.Descricao := FieldByName('Descricao').AsString;
      lCombustivel.Tipo := FieldByName('Tipo').AsString;
      lCombustivel.Valor := FieldByName('Valor').AsFloat;
      Next;
    end;
  end;
end;

procedure TEntityCombustiveis.Delete(const AWhere: array of string);
var
  sWhere,
  sSep: string;
  cSql: TStringList;
begin
  cSql := TStringList.Create;
  try
    cSql.Add('DELETE FROM Combustiveis');
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

destructor TEntityCombustiveis.Destroy;
begin

  inherited;
end;

procedure TEntityCombustiveis.Insert(const AColumns, AValues: array of string);
var
  sValue,
  sColumn,
  sSep: string;
  cSql: TStringList;
begin
  cSql := TStringList.Create;
  try
    cSql.Add('INSERT INTO Combustiveis');
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

class function TEntityCombustiveis.New: IEntity;
begin
  Result := Self.Create;
end;

procedure TEntityCombustiveis.Open(const AWhere: array of string);
var
  sWhere,
  sSep: string;
  cSql: TStringList;
begin
  cSql := TStringList.Create;
  try
    cSql.Add('SELECT * FROM Combustiveis');
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

procedure TEntityCombustiveis.OpenList(Value: TObjectList<TObject>;
  const AWhere: array of string);
var
  lCombustivel: TCombustiveis;
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
      lCombustivel := TCombustiveis.Create;
      Value.Add(lCombustivel);
      lCombustivel.Codigo := FieldByName('Codigo').AsInteger;
      lCombustivel.Descricao := FieldByName('Descricao').AsString;
      lCombustivel.Tipo := FieldByName('Tipo').AsString;
      lCombustivel.Valor := FieldByName('Valor').AsFloat;
      Next;
    end;
  end;
end;

procedure TEntityCombustiveis.Update(const AColumns: array of string;
  const AWhere: array of string);
var
  sWhere,
  sColumn,
  sSep: string;
  cSql: TStringList;
begin
  cSql := TStringList.Create;
  try
    cSql.Add('UPDATE Combustiveis');
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
