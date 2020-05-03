#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "node.h"

extern char *binName;
int ifElseLabelCount = 0;
int whileLabelCount = 0;

char *getIfElseLabel() {
	char *label = malloc(MAX_IDENT_LEN*sizeof(char));
	sprintf(label, "ifelse_%d", ifElseLabelCount++);
	return label;
}

char *getWhileLabel() {
	char *label = malloc(MAX_IDENT_LEN*sizeof(char));
	sprintf(label, "while_%d", whileLabelCount++);
	return label;
}

int enqueueExpressionList(struct ExpressionList *head, struct ExpressionList *node) {
	if(!head)
		return -1;		
	while(head->next)
		head = head->next;

	node->next = NULL;
	head->next = node;

	return 0;
}

int enqueueStatement(struct NodeStatemet *head, struct NodeStatemet *node) {
	if(!head)
		return -1;		
	while(head->next)
		head = head->next;

	node->next = NULL;
	head->next = node;

	return 0;
}

int enqueueSubroutine(struct NodeSubroutine *head, struct NodeSubroutine *node) {
	if(!head)
		return -1;		
	while(head->next)
		head = head->next;

	node->next = NULL;
	head->next = node;

	return 0;
}

int enqueueParameter(struct Parameter *head, struct Parameter *node) {
	if(!head)
		return -1;		
	while(head->next)
		head = head->next;

	node->next = NULL;
	head->next = node;

	return 0;
}

int enqueueVariable(struct Variable *head, struct Variable *node) {
	if(!head)
		return -1;
	struct Variable *aux = NULL;	
	while(head) {
		if(strcmp(head->name, node->name) == 0) {
			printf("ERROR: Variable name (%s) already used\n", node->name);
			exit(-1);
		}
		aux = head;
		head = head->next;
	}

	node->next = NULL;
	aux->next = node;

	return 0;
}

// ++++++++++ PRINT ++++++++++

void printNodeRoot(struct NodeRoot *node) {
	printf("=== NODE ROOT ===\n");
	printf("node->pgrmName = %s\n", node->pgrmName);
	printf("++++\n");
	printNodeBlock(node->pgrmBlock);
}

void printNodeBlock(struct NodeBlock *node) {
	printf("=== NODE BLOCK ===\n");
	if(node->intVars) {
		struct Variable *var = node->intVars->var;
		printf("INTEGER VARS = ");
		while(var) {
			printf("%s ", var->name);
			var = var->next;
		}
		printf("\n");
	}
	struct NodeSubroutine *subroutine = node->subroutine;
	while(subroutine) {
		printNodeSubroutine(subroutine);
		subroutine = subroutine->next;
	}
	if(node->stmt) {
		struct NodeStatemet *stmt = node->stmt;
		printf("STMTS:\n");
		while(stmt) {
			printNodeStmt(stmt);
			printf("--\n");
			stmt = stmt->next;
		}
	}
	printf("++++\n");	
}

void printNodeStmt(struct NodeStatemet *node) {
	if(node->asign) {
		printf("%s = ", node->asign->var->name);
		printNodeExpression(node->asign->value);
		printf("\n");
	} else if(node->write) {
		printf("write( ");
		printNodeExpression(node->write->expr);
		printf(" )\n");
	} else if(node->if_) {
		printNodeIf(node->if_);	
	} else if(node->while_) {
		printNodeWhile(node->while_);	
	} else if(node->read) {
		printNodeRead(node->read);
	} else if(node->subroutineCall) {
		printNodeSubroutineCall(node->subroutineCall);
	}
}

void printOperation(enum Operation op) {
	if(op == SUM)
		printf("+");
	else if(op == MINUS)
		printf("-");
	else if(op == MULT)
		printf("*");
	else if(op == DIV)
		printf("/");
	else if(op == MOD)
		printf(" mod ");
	else if(op == EQU)
	    printf("=");
    else if(op == NEQU)
	    printf("<>");
    else if(op == GT)
	    printf(">");
    else if(op == GE)
	    printf(">=");
    else if(op == LT)
	    printf("<");
    else if(op == LE)
	    printf("<=");
}

void printNodeRead(struct NodeRead *node) {
	struct Variable *var = node->var;
	printf("READ( ");
	while(var) {
		printf("%s ", var->name);
		var = var->next;
	}
	printf(")\n");
}

void printNodeTerminal(struct NodeTerminal *node) {
	if(node == NULL)
		return;
	if(node->expr != NULL) {
		printf("(");
		printNodeExpression(node->expr);
		printf(")");
	} else if(node->variable != NULL) {
		printf("%s", node->variable);
	} else
		printf("%d", node->number);
}

void printNodeTermo(struct NodeTermo *node) {
	if(node == NULL)
		return;
	printf("(");
	printNodeTermo(node->termo);
	printOperation(node->operation);
	printNodeTerminal(node->terminal);
	printf(")");

}

void printNodeSimpleExpression(struct NodeSimpleExpression *node) {
	if(node == NULL)
		return;
	printf("(");
	printNodeSimpleExpression(node->simpleExpr);
	printOperation(node->operation);
	printNodeTermo(node->termo);
	printf(")");
}

void printNodeExpression(struct NodeExpression *node) {
    if(node == NULL)
        return;
    printNodeExpression(node->expr);
    printOperation(node->operation);
    printNodeSimpleExpression(node->simpleExpr);
}

void printNodeIf(struct NodeIf *node) {
	printf("if( ");
	printNodeExpression(node->cond);
	printf(" ) {\n");
	struct NodeStatemet *stmt = node->ifBlock;
	while(stmt) {
		printNodeStmt(stmt);
		stmt = stmt->next;
	}
	printf("} ");
	if(node->elseBlock) {
		printf("else {\n");
		struct NodeStatemet *stmt = node->elseBlock;
		while(stmt) {
			printNodeStmt(stmt);
			stmt = stmt->next;
		}
		printf("}");
	}
	printf("\n");
}

void printNodeWhile(struct NodeWhile *node) {
	printf("while( ");
	printNodeExpression(node->cond);
	printf(" ) {\n");
	struct NodeStatemet *stmt = node->loopBlock;
	while(stmt) {
		printNodeStmt(stmt);
		stmt = stmt->next;
	}
	printf("}\n");

}

void printNodeSubroutineCall(struct NodeSubroutineCall *node) {
	printf("%s(", node->name);
	struct ExpressionList *arg = node->args;
	while(arg) {
		printNodeExpression(arg->expr);
		printf(", ");
		arg = arg->next;
	}
	printf(")\n");
}

void printNodeSubroutine(struct NodeSubroutine *node) {
	if(node->returnType)	
		printf("%s Function ", node->returnType);
	else
		printf("Procedure ");

	printf("%s", node->name);

	struct Parameter *params = node->params;
	printf("( ");
	while(params) {
		printf("%s %s %s, ",
				params->paramType == REF ? "VAR" : "",
				params->name,
			 	params->varType == INTEGER ? "INTEGER" : ""	
			);
		params = params->next;	
	}
	printf(")\n");
	printNodeBlock(node->block);
}

// +++++++++++ CODE GENERATION ++++++++++

#define INIT_VAR_VALUE 0

FILE *f;

struct GenCodeVariable {
	char *name;
	int offset;
	int level;
	struct GenCodeVariable *prev;
};

struct GenCodeSubroutine {
	char *name;
	char *returnType;
	struct Parameter *params;
	struct GenCodeSubroutine *prev;
};

struct GenCodeVariable *genCodeVarHead = NULL;
struct GenCodeSubroutine *genCodeSubroutineHead = NULL;

struct GenCodeSubroutine *getSubroutine(char *name) {
	struct GenCodeSubroutine *head = genCodeSubroutineHead;
	if(!head) {
		printf("ERROR: Subroutine (%s) node found\n", name);
		exit(-1);
	}
	while(head) {
		if(strcmp(head->name, name) == 0)
			return head;
		head = head->prev;
	}

	printf("ERROR: Subroutine (%s) node found\n", name);
	exit(-1);
}

void pushGenCodeSubroutine(struct GenCodeSubroutine *node) {
	struct GenCodeSubroutine *head = genCodeSubroutineHead;
	if(!head) {
		genCodeSubroutineHead = node;
		genCodeSubroutineHead->prev = NULL;
		return ;
	}

	while(head) {
		if(strcmp(head->name, node->name) == 0) {
			printf("ERROR: Subroutine name (%s) already used\n", node->name);
			exit(-1);
		}
		head = head->prev;
	}
	
	node->prev = genCodeSubroutineHead;
	genCodeSubroutineHead = node;
}

void popGenCodeSubroutine() {
	// TODO: Free top
	genCodeSubroutineHead = genCodeSubroutineHead->prev;
}

struct GenCodeVariable *getVariable(char *name) {
	struct GenCodeVariable *head = genCodeVarHead;
	if(!head) {
		printf("ERROR: Variable (%s) node found\n", name);
		exit(-1);
	}
	while(head) {
		if(strcmp(head->name, name) == 0)
			return head;
		head = head->prev;
	}

	printf("ERROR: Variable (%s) node found\n", name);
	exit(-1);
}

void pushGenCodeVariable(struct GenCodeVariable *node) {
	struct GenCodeVariable *head = genCodeVarHead;
	if(!head) {
		genCodeVarHead = node;
		genCodeVarHead->prev = NULL;
		genCodeVarHead->offset = -16;
		return ;
	}

	int offset = -16;	
	while(head && head->level == node->level) {
		if(strcmp(head->name, node->name) == 0) {
			printf("ERROR: Variable name (%s) already used\n", node->name);
			exit(-1);
		}
		offset -= 16;
		head = head->prev;
	}
	
	node->offset = offset;
	node->prev = genCodeVarHead;
	genCodeVarHead = node;
}

void popGenCodeVariable() {
	// TODO: Free top
	genCodeVarHead = genCodeVarHead->prev;
}

void genCodeNodeRoot(struct NodeRoot *node) {
	f = fopen(binName, "w");
	fprintf(f,"\tdefault rel\n");
	fprintf(f,"\tglobal main\n");
	fprintf(f,"\textern  printf\n");
	fprintf(f,"\textern  scanf\n");
	
	fprintf(f,"\tsection .text\n");
	
	genCodeNodeBlock(node->pgrmBlock, "main");
	
	fprintf(f,"\tsection .rodata\n");
	fprintf(f,"formatNumPrintf:\tdb '%%ld', 10, 0\n");
	fprintf(f,"formatNumScanf:\tdb '%%ld', 0\n");
}

void genCodeNodeBlock(struct NodeBlock *node, char *name) {	
	struct NodeSubroutine *subroutine = node->subroutine;
	int numSubroutines = 0;
	while(subroutine) {
		struct GenCodeSubroutine *genCodeSubroutine = malloc(sizeof(struct GenCodeSubroutine));
		INIT_GENSUBROUTINE(genCodeSubroutine);
		genCodeSubroutine->name = subroutine->name;
		genCodeSubroutine->returnType = subroutine->returnType;
		genCodeSubroutine->params = subroutine->params;	
		
		pushGenCodeSubroutine(genCodeSubroutine);
		genCodeNodeSubroutine(subroutine);

		subroutine = subroutine->next;
		numSubroutines++;
	}


	fprintf(f,"%s:\n", name);	
	
	 // CREATE NEW STACK FRAME
	fprintf(f,"\tpush rbp\n");
	fprintf(f,"\tmov rbp, rsp\n");
	
	if(node->intVars) {
		struct Variable *var = node->intVars->var;
		struct GenCodeVariable *genCodeVar;
		while(var) {
			genCodeVar = malloc(sizeof(struct GenCodeVariable));
			INIT_GENVAR(genCodeVar);
			genCodeVar->name = var->name;
			genCodeVar->level = 0;
			
			pushGenCodeVariable(genCodeVar);

			fprintf(f,"\tmov rax, %d\n", -1);
			fprintf(f,"\tpush rax\n");
			fprintf(f,"\tmov rax, %d\n", INIT_VAR_VALUE);
			fprintf(f,"\tpush rax\n");

			var = var->next;
		}
	}


	if(node->stmt) {
		struct NodeStatemet *stmt = node->stmt;
		while(stmt) {
			genCodeNodeStmt(stmt);
			stmt = stmt->next;
		}
	}
	// RESTORE STACK
	fprintf(f,"\tmov rsp, rbp\n");
	fprintf(f,"\tpop rbp\n");
	fprintf(f,"\tret\n");
	
	// TODO: Pop subroutines declared in this block
	for(int i = 0;i < numSubroutines; i++)
		popGenCodeSubroutine();
}

void genCodeAsign(char *name, struct NodeExpression *value) {
	// Generate expression asm and save result in rax register
	genCodeNodeExpression(value);

	struct GenCodeVariable *var = getVariable(name);

	fprintf(f,"\tmov [rbp%+d], rax\n", var->offset);
}

void genCodeWrite(struct NodeWrite *node) {
	genCodeNodeExpression(node->expr);
		
	fprintf(f,"\tmov rdi, formatNumPrintf\n");
	fprintf(f,"\tmov rsi, rax\n");
	fprintf(f,"\txor rax, rax\n");
	fprintf(f,"\tcall printf wrt ..plt\n");
}

void genCodeNodeStmt(struct NodeStatemet *node) {
	if(node->asign)
		genCodeAsign(node->asign->var->name, node->asign->value);
	else if(node->write)
		genCodeWrite(node->write);
	else if(node->if_)
		genCodeNodeIf(node->if_);
	else if(node->while_)
		genCodeNodeWhile(node->while_);
	else if(node->read)
		genCodeNodeRead(node->read);
	else if(node->subroutineCall)
		genCodeNodeSubroutineCall(node->subroutineCall);
}

void genCodeNodeTerminal(struct NodeTerminal *node) {
	if(node->expr != NULL) {
		genCodeNodeExpression(node->expr);
	} else if(node->variable != NULL) {
		struct GenCodeVariable *var = getVariable(node->variable);
		fprintf(f,"\tmov rax, [rbp%+d]\n", var->offset);
	} else
		fprintf(f,"\tmov rax, %d\n", node->number);
}

void genCodeNodeTermo(struct NodeTermo *node) {
	if(node->termo) {
		genCodeNodeTermo(node->termo);
		fprintf(f,"\tpush rax\n");
		genCodeNodeTerminal(node->terminal);
		fprintf(f,"\tpop rcx\n");
		if(node->operation == MULT)
			fprintf(f,"\tmul rcx\n");
		else if(node->operation == DIV) {
			fprintf(f,"\tmov rbx, rax\n");
			fprintf(f,"\tmov rax, rcx\n");
			fprintf(f,"\tmov rcx, rbx\n");
			fprintf(f,"\tcqo\n"); // Extend rax to rdx:rax
			fprintf(f,"\tidiv rcx\n");
		} else if(node->operation == MOD) {
			fprintf(f,"\tmov rbx, rax\n");
			fprintf(f,"\tmov rax, rcx\n");
			fprintf(f,"\tmov rcx, rbx\n");
			fprintf(f,"\tcqo\n"); // Extend rax to rdx:rax
			fprintf(f,"\tidiv rcx\n");
			fprintf(f,"\tmov rax, rdx\n");
		}
	} else
		genCodeNodeTerminal(node->terminal);
}

void genCodeNodeSimpleExpression(struct NodeSimpleExpression *node) {
	if(node->simpleExpr) {
		genCodeNodeSimpleExpression(node->simpleExpr);
		fprintf(f,"\tpush rax\n");
		genCodeNodeTermo(node->termo);
		fprintf(f,"\tpop rcx\n");
		if(node->operation == SUM)
			fprintf(f,"\tadd rax, rcx\n");
		else if(node->operation == MINUS) {
			fprintf(f,"\tsub rcx, rax\n");
			fprintf(f,"\tmov rax, rcx\n");
		}
	} else
		genCodeNodeTermo(node->termo);
}

void genCodeNodeExpression(struct NodeExpression *node) {
    if(node->expr) {
		genCodeNodeExpression(node->expr);
		fprintf(f,"\tpush rax\n");
		genCodeNodeSimpleExpression(node->simpleExpr);
		fprintf(f,"\tpop rcx\n");
	    if(node->operation == EQU) {
            fprintf(f,"\tcmp rcx, rax\n");
            fprintf(f,"\tsete al\n");
            fprintf(f,"\tmovsx rax, al\n");
        } else if(node->operation == NEQU) {
            fprintf(f,"\tcmp rcx, rax\n");
            fprintf(f,"\tsetne al\n");
            fprintf(f,"\tmovsx rax, al\n");
        } else if(node->operation == GT) {
            fprintf(f,"\tcmp rcx, rax\n");
            fprintf(f,"\tsetg al\n");
            fprintf(f,"\tmovsx rax, al\n");
        } else if(node->operation == GE) {
            fprintf(f,"\tcmp rcx, rax\n");
            fprintf(f,"\tsetge al\n");
            fprintf(f,"\tmovsx rax, al\n");
        } else if(node->operation == LT) {
            fprintf(f,"\tcmp rcx, rax\n");
            fprintf(f,"\tsetl al\n");
            fprintf(f,"\tmovsx rax, al\n");
        } else if(node->operation == LE) {
            fprintf(f,"\tcmp rcx, rax\n");
            fprintf(f,"\tsetle al\n");
            fprintf(f,"\tmovsx rax, al\n");
        }
	} else
		genCodeNodeSimpleExpression(node->simpleExpr);
}

void genCodeNodeIf(struct NodeIf *node) {
	genCodeNodeExpression(node->cond);
	char *ifLabel = getIfElseLabel(); 
	fprintf(f,"\tcmp rax, 0\n"); // Compare to zero(false)
	fprintf(f,"\tje %s\n", ifLabel);
	struct NodeStatemet *stmt = node->ifBlock;
	while(stmt) {
		genCodeNodeStmt(stmt);
		stmt = stmt->next;
	}
	if(node->elseBlock) {
		char *elseLabel = getIfElseLabel();
		fprintf(f,"\tjmp %s\n", elseLabel);
		fprintf(f,"%s:\n", ifLabel);
		struct NodeStatemet *stmt = node->elseBlock;
		while(stmt) {
			genCodeNodeStmt(stmt);
			stmt = stmt->next;
		}
		fprintf(f,"%s:\n", elseLabel);
		free(elseLabel);
	} else {
		fprintf(f,"%s:\n", ifLabel);
	}	
	free(ifLabel);
}

void genCodeNodeWhile(struct NodeWhile *node) {
	char *whileLabelBegin = getWhileLabel();
	char *whileLabelEnd = getWhileLabel();
	fprintf(f,"%s:\n", whileLabelBegin);
	genCodeNodeExpression(node->cond);
	fprintf(f,"\tcmp rax, 0\n"); // Compare to zero(false)
	fprintf(f,"\tje %s\n", whileLabelEnd);
	struct NodeStatemet *stmt = node->loopBlock;
	while(stmt) {
		genCodeNodeStmt(stmt);
		stmt = stmt->next;
	}
	fprintf(f,"\tjmp %s\n", whileLabelBegin);
	fprintf(f,"%s:\n", whileLabelEnd);
	free(whileLabelBegin);
	free(whileLabelEnd);
}

void genCodeNodeRead(struct NodeRead *node) {
	struct Variable *var = node->var;
	while(var) {
		struct GenCodeVariable *genVar = getVariable(var->name);

		fprintf(f,"\tlea rsi, [rbp%+d]\n", genVar->offset);
		fprintf(f,"\tmov rdi, formatNumScanf\n");
		fprintf(f,"\txor rax, rax\n");
		fprintf(f,"\tcall scanf wrt ..plt\n");
		
		var = var->next;
	}
}

void genCodeNodeSubroutineCall(struct NodeSubroutineCall *node) {
	struct GenCodeSubroutine *subroutine = getSubroutine(node->name);
	fprintf(f,"\tcall %s\n", subroutine->name);
}

void genCodeNodeSubroutine(struct NodeSubroutine *node) {
	genCodeNodeBlock(node->block, node->name);
}

