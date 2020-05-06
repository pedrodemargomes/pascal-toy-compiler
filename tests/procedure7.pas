program procedure_(input, output);
var a, b : integer;

	procedure proc(var n : integer; m : integer);
	
		procedure proca(var g : integer);
		begin
			n := 42;
			g := 965;
		end;

	begin
		n := 123;
		m := 321;
		proca(a);
	end;

begin
	a := 666;
	b := 666;
	proc(a, b);
	writeln(a);
	writeln(b);
end.

