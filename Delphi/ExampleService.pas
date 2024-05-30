unit ExampleService;

interface

uses
  VSoft.OperationResult;

function GetSomething(const a : string) : TOperationResult<string>;

implementation

function GetSomething(const a : string) : TOperationResult<string>;
begin
  if a = 'foo' then
    result := TOperationResult<string>.CreateSuccess('bar')
  else if a = 'ping'  then
    result := TOperationResult<string>.CreateForbidden('Nope, you are not allowed to do this')
  else if a = '1' then
    result := TOperationResult<string>.CreateNotFound('I don''t know what it is you are looking for!')
  else
    result := TOperationResult<string>.CreateBadRequest('Ummm.. what is [' + a + '] supposed to be?');

end;


end.
