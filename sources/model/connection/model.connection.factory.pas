unit model.connection.factory;

interface

uses
  model.connection.interfaces, model.connection.firedac;

type
  TConnectionFactory = class(TInterfacedObject, IConnectionFactory)
  private
  public
    constructor Create;
    destructor Destroy; override;

    class function New: IConnectionFactory;
    function Conexao: IConnection;
    function Query: IQuery;
  end;

implementation

{ TConnectionFactory }

function TConnectionFactory.Conexao: IConnection;
begin
  Result := TFDAConnection.New;
end;

constructor TConnectionFactory.Create;
begin

end;

destructor TConnectionFactory.Destroy;
begin

  inherited;
end;

class function TConnectionFactory.New: IConnectionFactory;
begin
  Result := Self.Create;
end;

function TConnectionFactory.Query: IQuery;
begin
  Result := TFDAQuery.New(Self.Conexao);
end;

end.
