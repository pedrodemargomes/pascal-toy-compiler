program exFunction(input, output);
var a, b, aux : integer;

begin
    for a := 2 to 100 do
    begin
        aux := 0;
        for b := 2 to a do
        begin
            aux := aux + ((a mod b) = 0);
        end;
        if aux = 1 then
        begin
            writeln(a);
        end;
    end;
end.
