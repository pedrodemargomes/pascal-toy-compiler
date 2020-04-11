%{
#include <stdio.h>
#include <ctype.h>
#include <stdlib.h>
#include <string.h>

#include "node.h"
struct NodeRoot *root;
char *binName;

%}


%union {
	char *string;
	int number;
	struct NodeBlock *block;
	struct DeclIntegerVariable *declIntVar;
	struct Variable *variable;
	struct NodeStatemet *stmt; 
	struct NodeExpression *expr;
	struct NodeAsignVariable *asign;
	struct NodeWrite *write;
}

%token PROGRAM ABRE_PARENTESES FECHA_PARENTESES VIRGULA PONTO_E_VIRGULA  DOIS_PONTOS  
%token PONTO T_BEGIN T_END VAR ATRIBUICAO T_IF  T_LABEL  T_TYPE  T_GOTO T_THEN 
%token T_ELSE T_WHILE T_DO  T_OR T_AND T_DIV  T_NOT  T_SUM T_MINUS T_MULT  
%token T_MENOR T_MENOR_IGUAL T_MAIOR T_MAIOR_IGUAL T_IGUAL T_DIFERENTE T_WRITE T_READ
%token T_IDENT T_NUMERO


%type <number> numero
%type <string> ident
%type <block> bloco
%type <declIntVar> declara_var parte_declara_vars
%type <variable> lista_id_var
%type <expr> expressao
%type <asign> atribuicaoInteiro
%type <stmt> comando_composto comandos comando
%type <write> imprime

%nonassoc IFX
%nonassoc T_ELSE

%start programa

%%

programa:
	PROGRAM ident ABRE_PARENTESES lista_idents FECHA_PARENTESES PONTO_E_VIRGULA bloco PONTO
	{
		root = malloc(sizeof(struct NodeRoot));
		INIT_NODE_ROOT(root);
		root->pgrmName = $2;
		root->pgrmBlock = $7;
	}
;

bloco:
	parte_declara_rotulos parte_declara_vars comando_composto
	{
		struct NodeBlock *block = malloc(sizeof(struct NodeBlock));
		INIT_NODE_BLOCK(block);
		block->intVars = $2;
		block->stmt = $3;
		$$ = block;
	}
;

parte_declara_rotulos: 
	T_LABEL lista_rotulos PONTO_E_VIRGULA |
;

lista_rotulos: 
	lista_rotulos VIRGULA T_NUMERO |
	T_NUMERO
;

parte_declara_vars: 
	VAR declara_var
	{
		$$ = $2;
	} |
	{
		$$ = NULL;
	}
;

declara_var:
	lista_id_var DOIS_PONTOS ident PONTO_E_VIRGULA
	{
		if(strcmp($3, "integer") == 0) {
			struct DeclIntegerVariable *vars = malloc(sizeof(struct DeclIntegerVariable));
			vars->var = $1;
			$$ = vars; 
		} else {
			printf("TIPO DE VARIAVEL NAO RECONHECIDO");
			exit(-1);
		}
	}
;

lista_id_var: 
	lista_id_var VIRGULA ident
	{
		struct Variable *var = malloc(sizeof(struct Variable));
		var->name = $3;
		enqueueVariable($1, var);
	} |
	ident
	{
		struct Variable *var = malloc(sizeof(struct Variable));
		var->name = $1;
		var->next = NULL;
		$$ = var;
	}
;

lista_idents:
	lista_idents VIRGULA ident |
	ident 
;

expressao:
	expressao T_MENOR expressaoSimples |
	expressao T_MENOR_IGUAL expressaoSimples |
	expressao T_MAIOR expressaoSimples |
	expressao T_MAIOR_IGUAL expressaoSimples |
	expressao T_IGUAL expressaoSimples |
	expressao T_DIFERENTE expressaoSimples |
	expressaoSimples
;

expressaoSimples: 
	expressaoSimples T_SUM termo |
	expressaoSimples T_MINUS termo |
	expressaoSimples T_OR termo |
	termo
;

termo: 
	termo T_MULT terminal |
	termo T_DIV terminal |
	termo T_AND terminal |
	terminal
;

terminal:   
	ident |
	ABRE_PARENTESES expressao FECHA_PARENTESES |
	T_NOT terminal |
	T_NUMERO
;

comando_repetitivo: 
	T_WHILE expressao T_DO comando_composto
;

comando_condicional:
	T_IF expressao T_THEN comando_composto cond_else
;

cond_else: 
	T_ELSE comando_composto |
	%prec IFX
; 
                                   

atribuicaoInteiro:
	ident ATRIBUICAO numero
	{
		struct NodeAsignVariable *as = malloc(sizeof(struct NodeAsignVariable));	
		as->var = malloc(sizeof(struct Variable));
		as->var->name = $1;
		as->value = $3;
		$$ = as;
	}
;

imprime: 
	T_WRITE ABRE_PARENTESES ident FECHA_PARENTESES {
		struct NodeWrite *write = malloc(sizeof(struct NodeWrite)); 
		write->var = malloc(sizeof(struct Variable));	
		write->var->name = $3;
		$$ = write;
	} |
	T_WRITE ABRE_PARENTESES numero FECHA_PARENTESES {
		struct NodeWrite *write = malloc(sizeof(struct NodeWrite)); 
		write->number = $3;
		$$ = write;
	}
;

le:
	T_READ ABRE_PARENTESES lista_leitura FECHA_PARENTESES
;

lista_leitura:
	lista_leitura VIRGULA ident |
	ident
;

comando_composto:
	T_BEGIN comandos T_END
	{
		$$ = $2;
	}
;

comandos:
	comandos comando PONTO_E_VIRGULA
	{
		printf("======> %s\n", $1->asign->var->name);
		enqueueStatement($1, $2);
	} |
	comando PONTO_E_VIRGULA
	{
		printf("======> %s\n", $1->asign->var->name);
		$$ = $1;	
	}
;

comando: 
	comando_repetitivo |
	comando_condicional |
	atribuicaoInteiro {
		struct NodeStatemet *stmt = malloc(sizeof(struct NodeStatemet));
		INIT_NODE_STMT(stmt);
		stmt->asign = $1;
		$$ = stmt;
	} |
	imprime {
		struct NodeStatemet *stmt = malloc(sizeof(struct NodeStatemet));
		INIT_NODE_STMT(stmt);
		stmt->write = $1;
		$$ = stmt;
	} |
	le
;

ident:
	T_IDENT
	{
		if(strlen($<string>1) > MAX_IDENT_LEN) {
			printf("token len > MAX_IDENT_LEN");
			exit(-1);
		}
		char *ident = malloc((strlen($<string>1)+1)*sizeof(char));
		strcpy(ident, $<string>1);
		$$ = ident;
	}
;

numero:
	T_NUMERO
	{
		if(strlen($<string>1) > MAX_IDENT_LEN) {
			printf("token len > MAX_IDENT_LEN");
			exit(-1);
		}
		char *num = malloc((strlen($<string>1)+1)*sizeof(char));
		strcpy(num, $<string>1);
		
		$$ = atoi(num);
	}

%%

void printAST() {

}


int main(int argc, char **argv) {
	#ifdef DEBUG
	yydebug = 1;	 
	#endif

	FILE *fp;
	extern FILE *yyin;

	if(argc < 2 || argc > 2) {
		printf("usage compilador <arq>a %d\n", argc);
		return-1;
	}

	binName = malloc((strlen(argv[1])+3)*sizeof(char));
	strcpy(binName, argv[1]);
	char *sufix = ".s";
	strncat(binName, sufix, strlen(sufix));
	fp = fopen(argv[1], "r");
	if(fp == NULL) {
		printf("usage compilador <arq>b\n");
		return -1;
	}

	yyin = fp;
	yyparse();


	printf("\n\n ---- AST ---- \n\n");
	root->print(root);
	root->pgrmBlock->print(root->pgrmBlock);

	root->genCode(root);	


	return 0;
}

