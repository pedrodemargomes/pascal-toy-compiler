program procedure_(input, output);
var a_global : integer;

	procedure writeNum;
	var proced_a, proced_b : integer;
		procedure procedA;
		begin
			read(a_global);
		end;
	begin
		procedA;
		proced_a := 111;
		proced_b := 111;
	end;

begin
	a_global := 12;
	writeNum;
	writeln(a_global);
end.

