program fibonacci(input, output);
var f1, f2, aux, count : integer;
begin
	f1 := 1;
	f2 := 1;
	count := 0;
	while count-100 do
	begin
		aux := f2;
		f2 := f1 + f2;
		f1 := aux; 
		write(f2);
		count := count + 1;
	end;
end.
