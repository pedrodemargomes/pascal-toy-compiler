program procedureVar(input, output);
var a_global : integer;

	procedure prodA;
		var a_prodA, a, b, c : integer;
		procedure prodB;
			procedure prodC;
			begin
				a_prodA := a_prodA + 1;
				a_global := a_global + 1;
			end;
		begin
			a_prodA := a_prodA + 1;
			a_global := a_global + 1;
			prodC;
		end;
	begin
		a_prodA := 10;
		a_global := a_global + 1;
		prodB;
		writeln(a_prodA);
	end;

begin
	a_global := 10;
	prodA;
	writeln(a_global);
end.

