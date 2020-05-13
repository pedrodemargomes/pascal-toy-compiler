program expression(input, output);
Var a, b, c : integer;
begin
	b := 2;
	a := (b-4)*((2)+2*(2-1*2));
	writeln((b-4)*((2)+2*(2-1*2))); (*-4*)
	writeln(a); (*-4*)
	writeln(0-99); (*-99*)
	writeln(b-2); (*0*)
	writeln((1-3)*(0-2)); (*4*)

	writeln(99999999);

	writeln(4*(0-2)); (*-8*)
	writeln((0-4)*(0-2)); (*8*)
	writeln((0-4)*2); (*-8*)
	writeln(4*2); (*8*)
	writeln((4)*(2)); (*8*)

	writeln(99999999);
	
	writeln(4/(0-2)); (*-2*)
	writeln((0-4)/(0-2)); (*2*)
	writeln((0-4)/2); (*-2*)
	writeln(4/2); (*2*)
	writeln((4)/(2)); (*2*)

	writeln(99999999);
	
	b := 0-4;
	c := 0-1;
	writeln(b/c); (*4*)
	writeln(b/(0-c)); (*-4*)
	writeln(b/(1-c)); (*-2*)
	writeln((0-b)/(1-c)); (*2*)

	writeln(99999999);

	a := 9;
	b := 0-6;
	writeln(a); (*9*)
	writeln(b); (*-6*)
	c := a;
	a := b;
	b := c;
	writeln(a); (*-6*)
	writeln(b); (*9*)

	writeln(99999999);

	writeln(5 mod 2); (*1*)
	writeln((0-5) mod (0-2)); (*-1*)
	writeln((0-5) mod (2)); (*-1*)
	writeln((5) mod (0-2)); (*1*)
	writeln(1+(5+1) mod (2+1)+1); (*2*)

	writeln(19 mod 4*100); (*300*)
end.

