program exFunction(input, output);
var n : integer;

function func1 : integer;
begin
    func1 := 42;
end;

function func1 : integer;
begin
   func1 := 9;
end;

begin
    writeln(func1());
end.
