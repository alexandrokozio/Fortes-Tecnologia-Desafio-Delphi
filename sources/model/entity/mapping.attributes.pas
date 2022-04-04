unit mapping.attributes;

interface

uses
  Data.DB,
  System.Rtti,
  System.Classes,
  System.SysUtils,
  System.TypInfo,
  System.Generics.Collections,
  mapping.types;

type
  TTable = class

  end;

 //[Table('master','')]
  Table = class(TCustomAttribute)
  private
    FName: string;
    FDescription: string;
  public
    constructor Create; overload;
    constructor Create(const AName: string); overload;
    constructor Create(const AName, ADescription: String); overload;
    property Name: string read FName write FName;
    property Description: string read FDescription write FDescription;
  end;

  //[Column('client_id', ftInteger)]
  Column = class(TCustomAttribute)
  private
    FColumnName: String;
    FFieldType: TFieldType;
    FScale: Integer;
    FSize: Integer;
    FPrecision: Integer;
    FDescription: string;
  public
    constructor Create(const AColumnName: String;
      const AFieldType: TFieldType;
      const ADescription: string = ''); overload;
    constructor Create(const AColumnName: string;
      const AFieldType: TFieldType;
      const ASize: Integer;
      const ADescription: string = ''); overload;
    constructor Create(const AColumnName: string;
      const AFieldType: TFieldType;
      const APrecision, AScale: Integer;
      const ADescription: string = ''); overload;
    property ColumnName: String read FColumnName;
    property FieldType: TFieldType read FFieldType;
    property Size: Integer read FSize;
    property Scale: Integer read FScale;
    property Precision: Integer read FPrecision;
    property Description: string read FDescription;
  end;

  IAttributes = interface
    ['{196DAB34-2AA3-48A4-A91B-DC6A90BDB9DB}']
    function GetTable(const ATable: TTable): string;
    function GetColumn(const AColumn: string; const AColumns: array of string): Boolean;
    procedure Clear(const ATable: TTable);
  end;

  TAttributes = class(TInterfacedObject, IAttributes)
  private
  public
    class function GetInstance: IAttributes;
    function GetTable(const ATable: TTable): string;
    function GetColumn(const AColumn: string; const AColumns: array of string): Boolean;
    procedure Clear(const ATable: TTable);
  end;

  TMappingDescription = class abstract
  protected
    FDescription: string;
  public
    property Description: string read FDescription write FDescription;
  end;
  TColumnMapping = class(TMappingDescription)
  private
    FColumnName: string;
    FFieldType: TFieldType;
    FScale: Integer;
    FSize: Integer;
    FPrecision: Integer;
    FIsNotNull: Boolean;
    FIsPrimaryKey: Boolean;
    FProperty: TRttiProperty;
  public
    property ColumnName: string read FColumnName write FColumnName;
    property FieldType: TFieldType read FFieldType write FFieldType;
    property Scale: Integer read FScale write FScale;
    property Size: Integer read FSize write FSize;
    property Precision: Integer read FPrecision write FPrecision;
    property IsNotNull: Boolean read FIsNotNull write FIsNotNull;
    property IsPrimaryKey: Boolean read FIsPrimaryKey write FIsPrimaryKey;
    property ColumnProperty: TRttiProperty read FProperty write FProperty;
  end;
  TColumnMappingList = class(TObjectList<TColumnMapping>);

  TMappingPopular = class
  public
    function PopularColumn(ARttiType: TRttiType; AClass: TClass): TColumnMappingList;
  end;

  TMappingExplorer = class
  private
  class var
    FContext: TRttiContext;
    FPopularMapping: TMappingPopular;
    FColumnMapping: TDictionary<string, TColumnMappingList>;
    class procedure ExecuteCreate;
    class procedure ExecuteDestroy;
  public
    { Public declarations }
    class function GetMappingColumn(const AClass: TClass): TColumnMappingList; inline;
  end;

implementation

constructor Column.Create(const AColumnName: String;
  const AFieldType: TFieldType; const ADescription: string);
begin
  Create(AColumnName, AFieldType, 0, ADescription);
end;

constructor Column.Create(const AColumnName: string;
  const AFieldType: TFieldType; const ASize: Integer;
  const ADescription: string);
begin
  Create(AColumnName, AFieldType, 0, 0, ADescription);
  FSize := ASize;
end;

constructor Column.Create(const AColumnName: string;
  const AFieldType: TFieldType; const APrecision, AScale: Integer;
  const ADescription: string);
begin
  FColumnName := AColumnName;
  FFieldType := AFieldType;
  FPrecision := APrecision;
  FScale := AScale;
  FSize := AScale;
  FDescription := ADescription;
end;

{ Table }

constructor Table.Create;
begin
  Create('');
end;

constructor Table.Create(const AName: String);
begin
  Create(AName, '');
end;

constructor Table.Create(const AName, ADescription: String);
begin
  FName := AName;
  FDescription := ADescription;
end;

{ TAttributes }

class function TAttributes.GetInstance: IAttributes;
begin
  Result := TAttributes.Create;
end;

procedure TAttributes.Clear(const ATable: TTable);
var
  lContext: TRttiContext;
  lTypeRtti: TRttiType;
  lProperty: TRttiProperty;
begin
  lContext := TRttiContext.Create;
  try
    lTypeRtti := lContext.GetType(ATable.ClassType);
    for lProperty in lTypeRtti.GetProperties do
    begin
       case lProperty.PropertyType.TypeKind of
         tkFloat,
         tkInteger:
           lProperty.SetValue(ATable, 0);
         tkClass:
           begin
             if not (lProperty.GetValue(ATable).AsObject is TTable)  then
               Continue;

             Clear((lProperty.GetValue(ATable).AsObject as TTable));
           end
       else
         lProperty.SetValue(ATable, '');
       end;
    end;
  finally
    lContext.Free;
  end;
end;

function TAttributes.GetColumn(const AColumn: string;
  const AColumns: array of string): Boolean;
var
  lColumn: string;
begin
  Result := False;
  for lColumn in AColumns do
  begin
    if SameText(AColumn, lColumn) then
    begin
      Result := True;
      Break;
    end;
  end;
end;

function TAttributes.GetTable(const ATable: TTable): string;
var
  lContext: TRttiContext;
  lTypeRtti: TRttiType;
  lAttribute: TCustomAttribute;
begin
  lContext := TRttiContext.Create;
  lTypeRtti := lContext.GetType(ATable.ClassType);
  try
    for lAttribute in lTypeRtti.GetAttributes do
      if lAttribute Is Table then
      begin
        Result := (lAttribute as Table).Name;
        Break;
      end;
  finally
    lContext.Free;
  end;
end;

{ TMappingExplorer }

class procedure TMappingExplorer.ExecuteCreate;
begin
  FContext := TRttiContext.Create;
  FPopularMapping := TMappingPopular.Create;
  FColumnMapping := TObjectDictionary<string, TColumnMappingList>.Create([doOwnsValues]);
end;

class procedure TMappingExplorer.ExecuteDestroy;
begin
  FContext.Free;
  FPopularMapping.Free;
  FColumnMapping.Free;
end;

class function TMappingExplorer.GetMappingColumn(
  const AClass: TClass): TColumnMappingList;
var
  LRttiType: TRttiType;
begin
  if FColumnMapping.ContainsKey(AClass.ClassName) then
     Exit(FColumnMapping[AClass.ClassName]);

  LRttiType := FContext.GetType(AClass);
  Result    := FPopularMapping.PopularColumn(LRttiType, AClass);
  FColumnMapping.Add(AClass.ClassName, Result);
end;

{ TMappingPopular }

function TMappingPopular.PopularColumn(ARttiType: TRttiType;
  AClass: TClass): TColumnMappingList;
var
  LProperty: TRttiProperty;
  LAttrib: TCustomAttribute;
  LColumn: Column;
begin
  Result := nil;
  for LProperty in ARttiType.GetProperties do
  begin
    for LAttrib in LProperty.GetAttributes do
    begin
      if not (LAttrib is Column) then // Column
        Continue;

      LColumn := Column(LAttrib);
      if Result = nil then
        Result := TColumnMappingList.Create;
      Result.Add(TColumnMapping.Create);
      Result.Last.ColumnName := LColumn.ColumnName;
      Result.Last.FieldType := LColumn.FieldType;
      Result.Last.Scale := LColumn.Scale;
      Result.Last.Size := LColumn.Size;
      Result.Last.Precision := LColumn.Precision;
      Result.Last.ColumnProperty := LProperty;
    end;
  end;
end;

initialization
  TMappingExplorer.ExecuteCreate;

finalization
  TMappingExplorer.ExecuteDestroy;

end.
