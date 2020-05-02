program procedure_(input, output);
var a_global : integer;

	procedure proc_a;
		procedure proc_b;
		begin
			writeln(101);
		end;
	begin
		writeln(999);
	end;

	procedure proc_c;
		procedure proc_d;
		begin
			writeln(666);
		end;
	begin
		proc_a;
		writeln(2010);
	end;

begin
	a_global := 12;
	proc_c;
end.

