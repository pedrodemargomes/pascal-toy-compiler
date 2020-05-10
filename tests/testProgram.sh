PROGRAM=$1

fpc -al $PROGRAM -oexecfpc > /dev/null
if [ $? -ne 0 ]
then
	echo "ERROR: fpc compilation failed" 
    echo "FAILED" > saidaFpc.txt
else
    ./execfpc > saidaFpc.txt
fi

./compilador.sh ../src/compilador $PROGRAM > /dev/null
if [ $? -ne 0 ]
then
	echo "ERROR: pascalToyCompiler compilation failed" 
    echo "FAILED" > saidaToy.txt
else
    ./a.out > saidaToy.txt
fi

diff saidaToy.txt saidaFpc.txt
if [ $? -ne 0 ]
then
	echo "ERROR: Different output in $PROGRAM" 
else
	echo "$PROGRAM OK"
fi

rm -f a.out execfpc saidaToy.txt saidaFpc.txt

