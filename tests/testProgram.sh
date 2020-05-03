PROGRAM=$1

fpc -al $PROGRAM -oexecfpc > /dev/null
if [ $? -ne 0 ]
then
	echo "ERROR: fpc compilation failed" 
	rm a.out execfpc saidaToy.txt saidaFpc.txt
	exit
fi

./compilador.sh ../src/compilador $PROGRAM > /dev/null
if [ $? -ne 0 ]
then
	echo "ERROR: pascalToyCompiler compilation failed" 
	rm a.out execfpc saidaToy.txt saidaFpc.txt
	exit
fi

./a.out > saidaToy.txt
./execfpc > saidaFpc.txt

diff saidaToy.txt saidaFpc.txt
if [ $? -ne 0 ]
then
	echo "ERROR: Different output in $PROGRAM" 
else
	echo "Program $PROGRAM compilation is OK"
fi

rm a.out execfpc saidaToy.txt saidaFpc.txt

