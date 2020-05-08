%{


#include <stdio.h>
#include <string.h>

#include "compilador.tab.h"

#define IMPRIME(STR) printf("%s    # %s \n", STR, yytext)
#define SAVE_TOKEN yylval.string = strlwr(yytext)

int desloc;
int nl = 1;  

char *strlwr(char *str)
{
  unsigned char *p = (unsigned char *)str;

  while (*p) {
     *p = tolower((unsigned char)*p);
      p++;
  }

  return str;
}

%}

%option noyywrap
%option caseless

pulo_linha [\n]

descarte [\t ]+

ident [a-zA-Z_][a-zA-Z0-9_]*

numero [0-9]+

comentario "(*".*"*)"

%%

{pulo_linha} {printf("linha = %d\n", ++nl);} 

{descarte}

{comentario}

program { 
	IMPRIME("program ");
	return PROGRAM;
}

var {
	IMPRIME("var  ");
	return VAR;
}

begin { 
	IMPRIME("begin ");
	return T_BEGIN;
}

end { 
	IMPRIME("end  ");
	return T_END;
}

if {
	IMPRIME("if  ");
	return T_IF;
}

label {
	IMPRIME("label ");
	return T_LABEL;
}

type {
	IMPRIME("type ");
	return T_TYPE;
}

goto {
	IMPRIME("goto ");
	return T_GOTO;
}

then {
	IMPRIME("then ");
	return T_THEN;
}

else {
	IMPRIME("else ");
	return T_ELSE;
}

while {
	IMPRIME("while ");
	return T_WHILE;
}

do {
	IMPRIME("do ");
	return T_DO;
}

or {
	IMPRIME("or ");
	return T_OR;
}

and {
	IMPRIME(" and ");
	return T_AND;
}

div {
	IMPRIME("div ");
	return T_DIV;
}

not {
	IMPRIME("not ");
	return T_NOT;
}

writeln {
	IMPRIME("write ");
	return T_WRITELN;
}

read {
	IMPRIME("read ");
	return T_READ;
}

mod {
	IMPRIME("mod ");
	return T_MOD;
}

procedure {
	IMPRIME("procedure ");
	return T_PROCEDURE;
}

function {
	IMPRIME("function ");
	return T_FUNCTION;
}

\+ {
	IMPRIME("sum ");
	return T_SUM;
}

\- {
	IMPRIME("minus ");
	return T_MINUS;
}

\* {
	IMPRIME("mult ");
	return T_MULT;
}

:= {
	IMPRIME(" atribuicao  ");
	return ATRIBUICAO;  
}

\; {
	IMPRIME(" pt_virgula  ");
	return PONTO_E_VIRGULA;
}

\: {
	IMPRIME(" dois pontos ");
	return DOIS_PONTOS;
}

\, {
	IMPRIME(" virgula  ");
	return VIRGULA;
}


\. {
	IMPRIME(" ponto  ");
	return PONTO;
}

\( {
	IMPRIME(" abre_parenteses  ");
	return ABRE_PARENTESES;
}

\) {
	IMPRIME(" fecha_parenteses ");
	return FECHA_PARENTESES;
}

\/ {
	IMPRIME(" divisao ");
	return T_DIV;
}

\< {
	IMPRIME(" menor ");
	return T_MENOR;
}

\<= {
	IMPRIME(" menor igual ");
	return T_MENOR_IGUAL;
}

\> {
	IMPRIME(" maior ");
	return T_MAIOR;
}

\>= {
	IMPRIME(" maior igual ");
	return T_MAIOR_IGUAL;
}

= {
	IMPRIME(" igual ");
	return T_IGUAL;
}

\<\> {
	IMPRIME(" diferente ");
	return T_DIFERENTE;
}

{numero} {
	SAVE_TOKEN;
	IMPRIME(" NUMERO  ");
	return T_NUMERO;
}

{ident} {
	SAVE_TOKEN;
	IMPRIME(" ident  ");
	return T_IDENT;
}


%%

