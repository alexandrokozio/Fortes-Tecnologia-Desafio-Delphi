unit model.connection.interfaces;

interface

uses
  Data.DB;

type
  IQuery = interface;

  IConnection = interface
    function Connection: TCustomConnection;
  end;

  IConnectionFactory = interface
    function Conexao: IConnection;
    function Query: IQuery;
  end;

  IQuery = interface
    function Query: TObject;
    function Open(const ASql: string): IQuery;
    function ExecSQL(const ASql: string): IQuery;
  end;

implementation

end.
