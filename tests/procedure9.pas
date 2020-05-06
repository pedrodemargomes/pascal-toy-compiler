program procedure_(input, output);
var a, b : integer;

    Procedure procA(var a, b : integer);
        Procedure procB(var a, b : integer);
            Procedure procC(var a, b : integer);
            begin
                read(b);
                a := b+12;
                writeln(a);
            end;
        begin
            procC(a, b);
        end;
    begin
        procB(a, b);
    end;

begin
    a := 1;
    b := 2;
    procA(a, b);
    writeln(a);
    writeln(b);
end.
