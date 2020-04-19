program teste_expression(input, output);
Var a, b, c : integer;
begin
	b := 2;
	a := (b-4)*((2)+2*(2-1*2));
	write((b-4)*((2)+2*(2-1*2)));
	write(a);
	write(0-99);
	write(b-2);
	write((1-3)*(0-2));

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

end.
