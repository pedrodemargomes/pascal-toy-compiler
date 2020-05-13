#define MAX_IDENT_LEN 30
enum Operation{SUM, MINUS, MULT, DIV, MOD, NOP, EQU, NEQU, GT, GE, LT, LE, AND, OR};
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

#define INIT_TERMINAL(node) node->expr = node->notExpr = node->variable = node->funcCall = NULL

#define INIT_IF(node) node->cond = node->ifBlock = node->elseBlock = NULL

#define INIT_SUBROUTINE(node) node->name = node->params = node->block = node->next = NULL; \
								node->returnType = NDEF_VAR_TYPE

#define INIT_SUBROUTINE_CALL(node) node->name = node->args = NULL

#define INIT_PARAM(node) node->name = node->next = node->prev = NULL; \
								node->paramType = NDEF_PARAM_TYPE; \
								node->varType = NDEF_VAR_TYPE

#define INIT_GENVAR(node) node->name = node->prev = NULL; \
								node->offset = node->level = -1; \
								node->paramType = NDEF_PARAM_TYPE

#define INIT_GENSUBROUTINE(node) node->name = node->label = node->params = node->prev = NULL; \
								node->returnType = NDEF_VAR_TYPE

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
	struct Parameter *prev;
};

struct ExpressionList {
	struct NodeExpression *expr;
	struct ExpressionList *prev;
	struct ExpressionList *next;
};

// +++++++ GEN CODE +++++++

struct GenCodeVariable {
	char *name;
	int offset;
	int level;
	enum ParamType paramType;
	struct GenCodeVariable *prev;
};

struct GenCodeSubroutine {
	char *name;
	char *label;
    int level;
    enum VarType returnType;
	struct Parameter *params;
	struct GenCodeSubroutine *prev;
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
    struct NodeTerminal	*notExpr;
    struct NodeExpression *expr;
	struct NodeSubroutineCall *funcCall;
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
    enum VarType returnType;
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

void genCodeNodeBlock(struct NodeBlock *node, char *name, struct GenCodeSubroutine *func, int level);

void genCodeNodeStmt(struct NodeStatemet *node, int level);

void genCodeNodeExpression(struct NodeExpression *node, int level);

void genCodeNodeSimpleExpression(struct NodeSimpleExpression *node, int level);

void genCodeNodeTermo(struct NodeTermo *node, int level);

void genCodeNodeTerminal(struct NodeTerminal *node, int level);

void genCodeNodeIf(struct NodeIf *node, int level);

void genCodeNodeWhile(struct NodeWhile *node, int level);

void genCodeNodeRead(struct NodeRead *node, int level);

void genCodeNodeSubroutineCall(struct NodeSubroutineCall *node, int level);

void genCodeNodeSubroutine(struct GenCodeSubroutine *genCodeSubroutine, struct NodeBlock *block, int level);

