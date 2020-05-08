program exFunction(input, output);
var a, b, retVal : integer;

(*function definition *)
function max(num1, num2: integer): integer;
var ret: integer;

begin
    if (num1 > num2) then
    begin
       ret := num1;
    end
    else
    begin
        ret := num2;
    end;
    max := ret;
end;

begin
   a := 100;
   b := 200;
   (* calling a function to get max value *)
   retVal := max(a, b);
   
   writeln(retVal);
end.
