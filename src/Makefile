DEBUG ?= 

all: compilador

compilador: lex.yy.c compilador.tab.c node.c
	gcc lex.yy.c compilador.tab.c node.c ${DEBUG} -Wno-incompatible-pointer-types -ly -lc -o compilador

lex.yy.c: compilador.l 
	flex -i compilador.l

compilador.tab.c: compilador.y node.h
	bison compilador.y -d -v -t 

clean:
	rm -f compilador.tab.* *.o lex.yy.c compilador.output

purge: clean
	rm compilador
