COMPILADOR=$1
SRC=$2

echo "$COMPILADOR $SRC"
eval "$COMPILADOR $SRC"

echo "nasm -felf64 ${SRC}.s && gcc ${SRC}.o"
nasm -felf64 ${SRC}.s && gcc ${SRC}.o
rm ${SRC}.o

