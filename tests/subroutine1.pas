program exFunction(input, output);
var a : integer;

procedure proc(a, b, c : integer);
begin
    writeln(a+b+c);
end;

function fun(var a : integer): integer;
var ret: integer;
    procedure proc(var b : integer);
    begin
        writeln(666);
        b := 0;
    end;
begin
    proc(a);
    fun := a+5;
end;

begin
    a := 100;
    a := fun(a);
    
    proc(1,10, 100);

    writeln(a);
end.
