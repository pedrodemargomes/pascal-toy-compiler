program exFunction(input, output);
var a, b : integer;

begin
    for a := 1 to 10 do
    begin
        for b:= 1 to a do
        begin
            if b = 1 then
            begin
                writeln(a);
            end;
        end;
    end;
end.
