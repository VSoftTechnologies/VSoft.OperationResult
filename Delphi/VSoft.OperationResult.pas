unit VSoft.OperationResult;

interface

uses
  Generics.Defaults;

type
  TOperationResultKind = (
    Success,
    BadRequest,
    Forbidden,
    NotFound,
    Error);

type
  TOperationResult<T> = record  //using a record to simplify memory management.
  private
    FKind     : TOperationResultKind;
    FMessage  : string;
    FValue    : T;

    constructor Create(const kind : TOperationResultKind; const message : string; const value : T);
    function GetSuccessful: boolean;
    function GetFailure: boolean;
    function GetNotFound: boolean;
    function GetError : boolean;
    function GetForbidden : boolean;
    function GetBadRequest : boolean;
  public
    class function CreateSuccess(const value : T) : TOperationResult<T> ;static;
    class function CreateError(const message : string = '') : TOperationResult<T> ;static;
    class function CreateNotFound(const message : string = '') : TOperationResult<T> ;static;
    class function CreateForbidden(const message : string = '') : TOperationResult<T> ;static;
    class function CreateBadRequest(const message : string = '') : TOperationResult<T> ;static;

    property Kind : TOperationResultKind read FKind;
    property Message : string read FMessage;
    property Value : T read FValue;

    property Successful : boolean read GetSuccessful;
    property Failure : boolean read GetFailure;
    property NotFound : boolean read GetNotFound;
    property Forbidden : boolean read GetForbidden;
    property BadRequest: boolean read GetBadRequest;
    property Error : boolean read GetError;
  end;

implementation

{ TOperationResult<T> }

constructor TOperationResult<T>.Create(const kind: TOperationResultKind; const message: string; const value: T);
begin
  FKind := kind;
  FMessage := message;
  FValue := value;
end;

function TOperationResult<T>.GetBadRequest: boolean;
begin
  result := FKind = TOperationResultKind.BadRequest;
end;

function TOperationResult<T>.GetError: boolean;
begin
  result := FKind = TOperationResultKind.Error;
end;

function TOperationResult<T>.GetFailure: boolean;
begin
  result := FKind <> TOperationResultKind.Success;
end;

function TOperationResult<T>.GetForbidden: boolean;
begin
  result := FKind = TOperationResultKind.Forbidden;
end;

function TOperationResult<T>.GetNotFound: boolean;
begin
  result := FKind = TOperationResultKind.NotFound;
end;

function TOperationResult<T>.GetSuccessful: boolean;
begin
  result := FKind = TOperationResultKind.Success;
end;

class function TOperationResult<T>.CreateBadRequest(const message: string): TOperationResult<T>;
begin
  result := TOperationResult<T>.Create(TOperationResultKind.BadRequest, message, Default(T));
end;

class function TOperationResult<T>.CreateError(const message : string): TOperationResult<T>;
begin
  result := TOperationResult<T>.Create(TOperationResultKind.Error, message, Default(T));
end;

class function TOperationResult<T>.CreateForbidden(const message: string): TOperationResult<T>;
begin
  result := TOperationResult<T>.Create(TOperationResultKind.NotFound, message, Default(T));

end;

class function TOperationResult<T>.CreateNotFound(const message: string): TOperationResult<T>;
begin
  result := TOperationResult<T>.Create(TOperationResultKind.NotFound, message, Default(T));

end;

class function TOperationResult<T>.CreateSuccess(const value: T): TOperationResult<T>;
begin
  result := TOperationResult<T>.Create(TOperationResultKind.Success,'',value);
end;

end.
