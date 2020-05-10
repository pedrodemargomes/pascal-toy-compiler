program procedure_(input, output);
var proc_a : integer;

	procedure proc;
	begin
		writeln(2010);
	end;

begin
	proc_a := 12 + proc();
	writeln(proc_a);
end.

