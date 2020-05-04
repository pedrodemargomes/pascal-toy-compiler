program procedureVar(input, output);
var a : integer;
	procedure prodA(a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r : integer);
	var bb, cc : integer;
		procedure prodB(a : integer);
		begin
			a := 666;
		end;

	begin
		a := 44;
		bb := 45;
		cc := 46;
		writeln(a);
		writeln(b);
		writeln(c);
		prodB(a);
		writeln(a);
	end;

	procedure prodC(a : integer; b : integer);
	begin
		writeln(a+b);
	end;

begin
	prodA(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18);
	prodC(10,10);
end.

