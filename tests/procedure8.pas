program procedure_(input, output);
var a, b : integer;

    procedure proc(var n : integer; var m : integer);	
	    procedure proca(var g : integer);
	    begin
        n := 42;
        g := n+20+a+b+m;
        writeln(n);
	    writeln(g);
	    writeln(m);
	    writeln(a);
	    writeln(b);
	    end;
	begin
	    n := 123;
	    read(m);
	    proca(a);
	end;

begin
    a := 666;
	b := 666;
	proc(a, b);
	writeln(a);
	writeln(b);
end.

