program exFunction(input, output);
var n : integer;

function func1 : integer;
    function func2 : integer;
    begin
        func2 := 4545;
    end;
begin
    func1 := func2()+13;
end;

function func2 : integer;
begin
    func2 := func1();
end;

begin
    writeln(13+func2());
end.
