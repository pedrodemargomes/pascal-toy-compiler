program exFunction(input, output);
var n : integer;

function fib(num: integer): integer;
begin
    if num = 1 then
    begin
        fib := 1;
    end;
    if num = 2 then
    begin
        fib := 1;
    end;
    if num > 2 then
    begin
        fib := fib(num-1) + fib(num-2);
    end;
end;

begin
    read(n);
    writeln(fib(n));
end.
