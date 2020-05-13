program function_(input, output);
var a : integer;

	function func : integer;
	begin
		func := 10;
	end;

begin
	a := 10 + func ();
    writeln(a);
end.

