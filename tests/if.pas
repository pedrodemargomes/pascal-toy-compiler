program if_(input, output);
var a,b : integer;
begin
	a := 2;
   	b := 2;
	if a - b then
	begin
		write(999999);
	end
	else
	begin
		if 1 then
		begin
			write(121212);
		end;
		write(0-999999);
	end;
	write(a);
	write(b);
end.
