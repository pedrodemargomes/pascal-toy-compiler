program exFunction(input, output);
var a, b : integer;

begin
    for a := 1 to 10 do
    begin
        for b := 1 to a do
        begin
            writeln(a*b);
        end;
    end;
end.
