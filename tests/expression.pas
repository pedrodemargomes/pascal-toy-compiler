program expression(input, output);
Var a, b, c : integer;
begin
	b := 2;
	a := (b-4)*((2)+2*(2-1*2));
	write((b-4)*((2)+2*(2-1*2))); (*-4*)
	write(a); (*-4*)
	write(0-99); (*-99*)
	write(b-2); (*0*)
	write((1-3)*(0-2)); (*4*)

	write(99999999);

	write(4*(0-2)); (*-8*)
	write((0-4)*(0-2)); (*8*)
	write((0-4)*2); (*-8*)
	write(4*2); (*8*)
	write((4)*(2)); (*8*)

	write(99999999);
	
	write(4/(0-2)); (*-2*)
	write((0-4)/(0-2)); (*2*)
	write((0-4)/2); (*-2*)
	write(4/2); (*2*)
	write((4)/(2)); (*2*)

	write(99999999);
	
	b := 0-4;
	c := 0-1;
	write(b/c); (*4*)
	write(b/(0-c)); (*-4*)
	write(b/(1-c)); (*-2*)
	write((0-b)/(1-c)); (*2*)

	write(99999999);

	a := 9;
	b := 0-6;
	write(a); (*9*)
	write(b); (*-6*)
	c := a;
	a := b;
	b := c;
	write(a); (*-6*)
	write(b); (*9*)

	write(99999999);

	write(5 mod 2); (*1*)
	write((0-5) mod (0-2)); (*-1*)
	write((0-5) mod (2)); (*-1*)
	write((5) mod (0-2)); (*1*)
	write(1+(5+1) mod (2+1)+1); (*2*)

	write(19 mod 4*100); (*300*)
end.
