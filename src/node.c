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

int enqueueStatement(struct NodeStatemet *head, struct NodeStatemet *node) {
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
	while(head->next) {
		if(strcmp(head->name, node->name) == 0) {
			printf("ERROR: Variable name (%s) already used\n", node->name);
			exit(-1);
		}	
		head = head->next;
	}

	node->next = NULL;
	head->next = node;

	return 0;
}

// ++++++++++ PRINT ++++++++++

void printNodeRoot(struct NodeRoot *node) {
	printf("=== NODE ROOT ===\n");
	printf("node->pgrmName = %s\n", node->pgrmName);
	printf("++++\n");
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

// +++++++++++ CODE GENERATION ++++++++++

#define INIT_VAR_VALUE 0

FILE *f;

struct GenCodeVariable {
	char *name;
	int offset;
	struct GenCodeVariable *next;
};

struct GenCodeVariable *genCodeVarHead = NULL;

int enqueueGenCodeVariable(struct GenCodeVariable *head, struct GenCodeVariable *node) {
	if(!head)
		return -1;
	
	int offset = -8;
	while(head->next) {
		offset -= 8;
		head = head->next;
	}

	node->next = NULL;
	node->offset = offset;
	head->next = node;

	return 0;
}

int getOffsetOfVariable(struct GenCodeVariable *head, char *name) {
	if(!head)
		return -1;
	while(head) {
		if(strcmp(head->name, name) == 0)
			return head->offset;
		head = head->next;
	}

	printf("ERROR: Variable (%s) node found\n", name);
	exit(-1);
}

void genCodeNodeRoot(struct NodeRoot *node) {
	f = fopen(binName, "w");
	fprintf(f,"\tglobal main\n");
	fprintf(f,"\textern  printf\n");
	
	fprintf(f,"\tsection .text\n");
	fprintf(f,"main:\n");
	
	// CREATE NEW STACK FRAME
	fprintf(f,"\tpush rbp\n");
	fprintf(f,"\tmov rbp, rsp\n");
	
	genCodeNodeBlock(node->pgrmBlock);
	
	// RESTORE STACK
	fprintf(f,"\tmov rsp, rbp\n");
	fprintf(f,"\tpop rbp\n");

	// EXECUTE SYSCALL
	// fprintf(f,"\tmov rax, 60\n");
	// fprintf(f,"\txor rdi, rdi\n");
	// fprintf(f,"\tsyscall\n");

	fprintf(f,"\tsection .rodata\n");
	fprintf(f,"formatNum:\tdb '%%ld', 10, 0\n");	
}

void genCodeNodeBlock(struct NodeBlock *node) {
	if(node->intVars) {
		struct Variable *var = node->intVars->var;
		genCodeVarHead = malloc(sizeof(struct GenCodeVariable));
		genCodeVarHead->name = var->name;
		genCodeVarHead->offset = 0;
		genCodeVarHead->next = NULL;
		
		fprintf(f,"\tmov rax, %d\n", INIT_VAR_VALUE);
		fprintf(f,"\tpush rax\n");

		var = var->next;
		struct GenCodeVariable *genCodeVar;
		while(var) {
			genCodeVar = malloc(sizeof(struct GenCodeVariable));
			genCodeVar->name = var->name;
			enqueueGenCodeVariable(genCodeVarHead, genCodeVar);
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
	// Pop all variables used in block
	struct GenCodeVariable *genCodeVar = genCodeVarHead;
	while(genCodeVar) {
		fprintf(f,"\tpop rax\n");
		genCodeVar = genCodeVar->next;
	}
}

void genCodeAsign(char *name, struct NodeExpression *value) {
	// Generate expression asm and save result in rax register
	genCodeNodeExpression(value);
	int offset = getOffsetOfVariable(genCodeVarHead, name);
	fprintf(f,"\tmov [rbp%+d], rax\n", offset);
}

void genCodeWrite(struct NodeWrite *node) {
	fprintf(f,"\tpush rax\n");
	fprintf(f,"\tpush rbx\n");
	fprintf(f,"\tpush rcx\n");
	fprintf(f,"\tpush rdx\n");

	genCodeNodeExpression(node->expr);
		
	fprintf(f,"\tmov rdi, formatNum\n");
	fprintf(f,"\tmov rsi, rax\n");
	fprintf(f,"\txor rax, rax\n");
	fprintf(f,"\tcall printf wrt ..plt\n");

	fprintf(f,"\tpop rdx\n");
	fprintf(f,"\tpop rcx\n");
	fprintf(f,"\tpop rbx\n");
	fprintf(f,"\tpop rax\n");
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
}

void genCodeNodeTerminal(struct NodeTerminal *node) {
	if(node->expr != NULL) {
		genCodeNodeExpression(node->expr);
	} else if(node->variable != NULL) {
		int offset = getOffsetOfVariable(genCodeVarHead, node->variable);
		fprintf(f,"\tmov rax, [rbp%+d]\n", offset);
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


