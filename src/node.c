#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "node.h"

extern char *binName;

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
	while(head->next)
		head = head->next;

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
			stmt->print(stmt);
			printf("--\n");
			stmt = stmt->next;
		}
	}
	printf("++++\n");	
}

void printNodeStmt(struct NodeStatemet *node) {
	if(node->asign) {
		printf("%s = %d\n", node->asign->var->name, node->asign->value);
	} else if(node->write) {
		if(node->write->var)
			printf("write(%s)\n", node->write->var->name);
		else
			printf("write(%d)\n", node->write->number);
	}
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

// TODO: CHECK IF VAR NAME HAS ALREADY BEEN USED
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

// TODO: PRINT ERROR AND EXIT WHEN VAR IS NOT FOUND
int getOffsetOfVariable(struct GenCodeVariable *head, char *name) {
	if(!head)
		return 1;
	while(head) {
		if(strcmp(head->name, name) == 0)
			return head->offset;
		head = head->next;
	}
	return 1;
}

void genCodeNodeRoot(struct NodeRoot *node) {
	f = fopen(binName, "a");
	fprintf(f,"\tglobal _start\n");
	fprintf(f,"\tsection .text\n");
	fprintf(f,"_start:\n");
	fprintf(f,"\tpush rbp\n");
	fprintf(f,"\tmov rbp, rsp\n");
	node->pgrmBlock->genCode(node->pgrmBlock);
	fprintf(f,"\tmov rsp, rbp\n");
	fprintf(f,"\tpop rbp\n");
	fprintf(f,"\tmov rax, 60\n");
	fprintf(f,"\txor rdi, rdi\n");
	fprintf(f,"\tsyscall\n");
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
			stmt->genCode(stmt);
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

void genCodeAsign(char *name, int value) {
	int offset = getOffsetOfVariable(genCodeVarHead, name);		
	fprintf(f,"\tmov rax, %d\n", value);
	fprintf(f,"\tmov [rbp%+d], rax\n", offset);
}

void genCodeNodeStmt(struct NodeStatemet *node) {
	if(node->asign) {
		genCodeAsign(node->asign->var->name, node->asign->value);
	} else if(node->write) {
		/*if(node->write->var)
			printf("write(%s)\n", node->write->var->name);
		else
			printf("write(%d)\n", node->write->number);*/
	}
}


