unit model.connection.firedac;

interface

uses
  Data.DB,
  System.Classes,
  System.Rtti,
  System.SysUtils,
  System.Generics.Collections,
  FireDAC.Stan.Option, FireDAC.Phys.FB,
  FireDAC.Comp.Client, FireDAC.Comp.BatchMove, FireDAC.Stan.Error,
  FireDAC.Comp.BatchMove.Text, FireDAC.Comp.BatchMove.DataSet,
  FireDAC.Stan.Param, FireDAC.Comp.DataSet, FireDAC.Stan.Intf,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Phys.IBBase,
  model.connection.interfaces;

type
  TFDAConnection = class(TInterfacedObject, IConnection)
  private
    FConnection: TFDConnection;
  public
    constructor Create;
    destructor Destroy; override;

    class function New: IConnection;
    function Connection: TCustomConnection;
  end;

  TFDAQuery = class(TInterfacedObject, IQuery)
  private
    FQuery: TFDQuery;
    FConnection: IConnection;
  public
    constructor Create(Value: IConnection);
    destructor Destroy; override;

    class function New(Value: IConnection): IQuery;
    function Query: TObject;
    function Open(const ASql: string): IQuery;
    function ExecSQL(const ASql: string): IQuery;
  end;

implementation

uses
  Forms;

{ TFDConexao }

function TFDAConnection.Connection: TCustomConnection;
begin
  Result := FConnection;
end;

constructor TFDAConnection.Create;
var
  lPath: string;
begin
  FConnection := TFDConnection.Create(nil);
  with FConnection do
  begin
    lPath := ExpandFileName(ExtractFileDir(Application.ExeName));
    Params.Database := lPath + '\CONTROLEABASTECIMENTOS.FDB';
    Params.UserName := 'sysdba';
    Params.Password := 'masterkey';
    Params.DriverID := 'FB';
    Params.Values['Server'] := 'localhost';
    LoginPrompt := False;
    Open;
  end;
end;

destructor TFDAConnection.Destroy;
begin
  FreeAndNil(FConnection);
  inherited;
end;

class function TFDAConnection.New: IConnection;
begin
  Result := Self.Create;
end;

{ TFDQuery }

constructor TFDAQuery.Create(Value: IConnection);
begin
  FConnection := Value;
  FQuery := TFDQuery.Create(nil);
  FQuery.Connection := TFDConnection(FConnection.Connection);
end;

destructor TFDAQuery.Destroy;
begin
  FreeAndNil(FQuery);
  inherited;
end;

function TFDAQuery.ExecSQL(const ASql: string): IQuery;
begin
  Result := Self;
  FQuery.SQL.Clear;
  FQuery.SQL.Text := ASql;
  FQuery.ExecSQL;
end;

class function TFDAQuery.New(Value: IConnection): IQuery;
begin
  Result := Self.Create(Value);
end;

function TFDAQuery.Open(const ASql: string): IQuery;
begin
  Result := Self;
  FQuery.Open(ASql);
end;

function TFDAQuery.Query: TObject;
begin
  Result := FQuery;
end;

end.
