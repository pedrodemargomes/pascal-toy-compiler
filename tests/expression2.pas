program expression(input, output);
Var a, b, c : integer;
begin
    b := 4;
    c := 6;

    a := (b-4) or 0 or c = 4 or b <> 12;
    writeln(a);

    a :=  b <> c or b and c-4 > 5 <= 8;
    writeln(a);


end.

