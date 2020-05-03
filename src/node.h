#define MAX_IDENT_LEN 30
enum Operation{SUM, MINUS, MULT, DIV, MOD, NOP, EQU, NEQU, GT, GE, LT, LE};
enum ParamType{VAL, REF, NDEF_PARAM_TYPE};
enum VarType{INTEGER, NDEF_VAR_TYPE};

#define INIT_NODE_ROOT(node) node->pgrmBlock = NULL

#define INIT_NODE_BLOCK(node) node->intVars = node->subroutine = node->stmt = NULL

#define INIT_NODE_STMT(node) node->asign = node->if_ = node->while_ = node->write = \
								 node->read = node->subroutineCall = node->next = NULL

#define INIT_EXPRESSION(node) node->expr = node->simpleExpr = NULL; \
								node->operation = NOP

#define INIT_SIMPLE_EXPRESSION(node) node->simpleExpr = node->termo = NULL; \
								node->operation = NOP

#define INIT_TERMO(node) node->termo = node->terminal = NULL; \
								node->operation = NOP

#define INIT_TERMINAL(node) node->expr = node->variable = NULL

#define INIT_IF(node) node->cond = node->ifBlock = node->elseBlock = NULL

#define INIT_SUBROUTINE(node) node->name = node->returnType = node->params = node->block = node->next = NULL

#define INIT_SUBROUTINE_CALL(node) node->name = node->args = NULL

#define INIT_PARAM(node) node->name = node->next = NULL; \
								node->paramType = NDEF_PARAM_TYPE; \
								node->varType = NDEF_VAR_TYPE

#define INIT_GENVAR(node) node->name = node->prev = NULL; \
								node->offset = node->level = -1

#define INIT_GENSUBROUTINE(node) node->name = node->returnType = node->params = node->prev = NULL

struct Variable {
	char *name;
	struct Variable *next;
};

struct DeclIntegerVariable {
	struct Variable *var;	
};

struct Parameter {
	char *name;
	enum ParamType paramType;
	enum VarType varType;
	struct Parameter *next;
};

struct ExpressionList {
	struct NodeExpression *expr;
	struct ExpressionList *next;
};

// ++++++++ NODES ++++++++++

struct NodeRoot {
	char *pgrmName;
	struct NodeBlock *pgrmBlock;
};

struct NodeStatemet {
	struct NodeAsignVariable *asign;
	struct NodeIf *if_;
	struct NodeWhile *while_;
	struct NodeWrite *write;
	struct NodeRead *read;
	struct NodeSubroutineCall *subroutineCall;
	struct NodeStatemet *next;
};

struct NodeBlock {
	struct DeclIntegerVariable *intVars;
	struct NodeSubroutine *subroutine;
	struct NodeStatemet *stmt;
};

struct NodeExpression {
    struct NodeExpression *expr;
    enum Operation operation;
    struct NodeSimpleExpression *simpleExpr;
};

struct NodeSimpleExpression {
	struct NodeSimpleExpression *simpleExpr;
	enum Operation operation;
	struct NodeTermo *termo;
};

struct NodeTermo {
	struct NodeTermo *termo;
	enum Operation operation;
	struct NodeTerminal *terminal;
};


struct NodeTerminal {
	int number;
	char *variable;
	struct NodeExpression *expr;
};

struct NodeWhile {
	struct NodeExpression *cond;
	struct NodeStatemet *loopBlock;
};

struct NodeAsignVariable {
	struct Variable *var;
	struct NodeExpression *value;
};

struct NodeIf {
	struct NodeExpression *cond;
	struct NodeStatemet *ifBlock;
	struct NodeStatemet *elseBlock;	
};

struct NodeWrite {
	struct NodeExpression *expr;
};

struct NodeRead {
	struct Variable *var;
};

struct NodeSubroutine {
	char *name;
	char *returnType;
	struct Parameter *params;
	struct NodeBlock *block;
	struct NodeSubroutine *next;
};

struct NodeSubroutineCall {
	char *name;
	struct ExpressionList *args;
};

int enqueueExpressionList(struct ExpressionList *head, struct ExpressionList *node);

int enqueueStatement(struct NodeStatemet *head, struct NodeStatemet *node);

int enqueueSubroutine(struct NodeSubroutine *head, struct NodeSubroutine *node);

int enqueueVariable(struct Variable *head, struct Variable *node);

int enqueueParameter(struct Parameter *head, struct Parameter *node);

void printNodeRoot(struct NodeRoot *node);

void printNodeBlock(struct NodeBlock *node);

void printNodeStmt(struct NodeStatemet *node);

void printNodeExpression(struct NodeExpression *node);

void printNodeSimpleExpression(struct NodeSimpleExpression *node);

void printNodeTermo(struct NodeTermo *node);

void printNodeTerminal(struct NodeTerminal *node);

void printNodeWhile(struct NodeWhile *node);

void printNodeIf(struct NodeIf *node);

void printNodeRead(struct NodeRead *node);

void printNodeSubroutine(struct NodeSubroutine *node);

void printNodeSubroutineCall(struct NodeSubroutineCall *node);

void genCodeNodeRoot(struct NodeRoot *node);

void genCodeNodeBlock(struct NodeBlock *node, char *name);

void genCodeNodeStmt(struct NodeStatemet *node);

void genCodeNodeExpression(struct NodeExpression *node);

void genCodeNodeSimpleExpression(struct NodeSimpleExpression *node);

void genCodeNodeTermo(struct NodeTermo *node);

void genCodeNodeTerminal(struct NodeTerminal *node);

void genCodeNodeIf(struct NodeIf *node);

void genCodeNodeWhile(struct NodeWhile *node);

void genCodeNodeRead(struct NodeRead *node);

void genCodeNodeSubroutineCall(struct NodeSubroutineCall *node);

void genCodeNodeSubroutine(struct NodeSubroutine *node);

