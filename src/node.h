#define MAX_IDENT_LEN 30
enum Operation{SUM, MINUS, MULT, DIV, MOD, NOP, EQU, NEQU, GT, GE, LT, LE};

#define INIT_NODE_ROOT(node) node->pgrmBlock = NULL

#define INIT_NODE_BLOCK(node) node->intVars = node->stmt = NULL

#define INIT_NODE_STMT(node) node->asign = node->if_ = node->while_ = node->write = node->read = node->next = NULL

#define INIT_EXPRESSION(node) node->expr = node->simpleExpr = NULL; \
								node->operation = NOP

#define INIT_SIMPLE_EXPRESSION(node) node->simpleExpr = node->termo = NULL; \
								node->operation = NOP

#define INIT_TERMO(node) node->termo = node->terminal = NULL; \
								node->operation = NOP

#define INIT_TERMINAL(node) node->expr = node->variable = NULL

#define INIT_IF(node) node->cond = node->ifBlock = node->elseBlock = NULL

struct Variable {
	char *name;
	struct Variable *next;
};

struct DeclIntegerVariable {
	struct Variable *var;	
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
	struct NodeStatemet *next;
};

struct NodeBlock {
	struct DeclIntegerVariable *intVars;
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

int enqueueStatement(struct NodeStatemet *head, struct NodeStatemet *node);

int enqueueVariable(struct Variable *head, struct Variable *node);

void printNodeRoot(struct NodeRoot *node);

void printNodeBlock(struct NodeBlock *node);

void printNodeStmt(struct NodeStatemet *node);

void printNodeExpression(struct NodeExpression *node);

void printNodeSimpleExpression(struct NodeSimpleExpression *node);

void printNodeTermo(struct NodeTermo *node);

void printNodeTerminal(struct NodeTerminal *node);

void printNodeWhile(struct NodeWhile *node);

void printNodeIf(struct NodeIf *node);

void genCodeNodeRoot(struct NodeRoot *node);

void genCodeNodeBlock(struct NodeBlock *node);

void genCodeNodeStmt(struct NodeStatemet *node);

void genCodeNodeExpression(struct NodeExpression *node);

void genCodeNodeSimpleExpression(struct NodeSimpleExpression *node);

void genCodeNodeTermo(struct NodeTermo *node);

void genCodeNodeTerminal(struct NodeTerminal *node);

void genCodeNodeIf(struct NodeIf *node);

void genCodeNodeWhile(struct NodeWhile *node);

void genCodeNodeRead(struct NodeRead *node);
