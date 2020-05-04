program prime(input, output);
var p, c, count : integer;
begin
	count := 0;
	p := 2;
	while count < 100 do 
	begin
		c := 2;
		while p mod c > 0 do
		begin
			c := c + 1;
		end;
		if p - c > 0 then
		begin
			c := 8787;	
		end
		else
		begin
			writeln(p);
			count := count + 1;
		end;
		p := p + 1;
	end;
end.
