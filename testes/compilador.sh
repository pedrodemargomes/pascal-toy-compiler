COMPILADOR=$1
SRC=$2

echo "$COMPILADOR $SRC"
eval "$COMPILADOR $SRC"

if [ $? -eq 0 ]
then
	echo "nasm -felf64 ${SRC}.s && gcc ${SRC}.o"
	nasm -felf64 ${SRC}.s && gcc ${SRC}.o
	rm ${SRC}.o
fi

