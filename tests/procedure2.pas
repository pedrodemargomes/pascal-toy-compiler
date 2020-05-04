program procedure_(input, output);
var a, b, c, d : integer;

	procedure proc_a(a, b, c, d : integer);
	begin
		writeln(a);
		writeln(b);
		writeln(c);
		writeln(d);
		a := 666;
	end;

	procedure proc_b(a, b : integer);
	begin
		writeln(a);
		a := 564;
		writeln(b);
	end;

begin
	a := 12;
	proc_a(1,2,3,4);
	proc_b(5,6);
	writeln(a);
end.

