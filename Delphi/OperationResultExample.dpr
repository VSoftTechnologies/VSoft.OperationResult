program OperationResultExample;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  VSoft.OperationResult in 'VSoft.OperationResult.pas',
  ExampleService in 'ExampleService.pas';

var
  res : TOperationResult<string>;
begin
  try
    res := GetSomething('foo');
    case res.Kind of
      Success :
      begin
        Writeln(res.Value);
        //if the type of Value is an object, you will need to free it
      end
    else
      Writeln('Something went wrong : ' + res.Message);
    end;
    ReadLn;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
