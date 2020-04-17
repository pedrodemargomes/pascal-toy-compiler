#define MAX_IDENT_LEN 30
enum Operation{SUM, MINUS, MULT, DIV, NOP};

#define INIT_NODE_ROOT(node) node->pgrmBlock = NULL; \
								node->print = printNodeRoot; \
								node->genCode = genCodeNodeRoot

#define INIT_NODE_BLOCK(node) node->intVars = node->stmt = NULL; \
								node->print = printNodeBlock; \
								node->genCode = genCodeNodeBlock

#define INIT_NODE_STMT(node) node->asign = node->if_ = node->while_ = node->write = node->next = NULL; \
								node->print = printNodeStmt; \
								node->genCode = genCodeNodeStmt

#define INIT_EXPRESSION(node) node->simpleExpr = NULL; \
								node->print = printNodeExpression

#define INIT_SIMPLE_EXPRESSION(node) node->simpleExpr = node->termo = NULL; \
								node->operation = NOP; \
								node->print = printNodeSimpleExpression

#define INIT_TERMO(node) node->termo = node->terminal = NULL; \
								node->operation = NOP; \
								node->print = printNodeTermo

#define INIT_TERMINAL(node) node->expr = node->variable = NULL; \
								node->print = printNodeTerminal

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
	
	void (*print)(struct NodeRoot *node);
	void (*genCode)(struct NodeRoot *node);
};

struct NodeStatemet {
	struct NodeAsignVariable *asign;
	struct NodeIf *if_;
	struct NodeWhile *while_;
	struct NodeWrite *write;
	struct NodeStatemet *next;

	void (*print)(struct NodeStatemet *node);
	void (*genCode)(struct NodeStatemet *node);
};

struct NodeBlock {
	struct DeclIntegerVariable *intVars;
	struct NodeStatemet *stmt;
	
	void (*print)(struct NodeBlock *node);
	void (*genCode)(struct NodeBlock *node);
};

struct NodeExpression {
	struct NodeSimpleExpression *simpleExpr;
	
	void (*print)(struct NodeExpression *node);
};

struct NodeSimpleExpression {
	struct NodeSimpleExpression *simpleExpr;
	enum Operation operation;
	struct NodeTermo *termo;
	
	void (*print)(struct NodeSimpleExpression *node);
};

struct NodeTermo {
	struct NodeTermo *termo;
	enum Operation operation;
	struct NodeTerminal *terminal;
	
	void (*print)(struct NodeTermo *node);
};


struct NodeTerminal {
	int number;
	char *variable;
	struct NodeExpression *expr;
	
	void (*print)(struct NodeTerminal *node);
};

struct NodeWhile {
	struct NodeExpression *cond;
	struct NodeBlock *loopBlock;
};

struct NodeAsignVariable {
	struct Variable *var;
	struct NodeExpression *value;
};

struct NodeIf {
	struct NodeExpression *cond;
	struct NodeBlock *ifBlock;
	struct NodeBlock *elseBlock;	
};

struct NodeWrite {
	struct NodeExpression *expr;
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

void genCodeNodeRoot(struct NodeRoot *node);

void genCodeNodeBlock(struct NodeBlock *node);

void genCodeNodeStmt(struct NodeStatemet *node);

void genCodeNodeExpression(struct NodeExpression *node);

void genCodeNodeSimpleExpression(struct NodeSimpleExpression *node);

void genCodeNodeTermo(struct NodeTermo *node);

void genCodeNodeTerminal(struct NodeTerminal *node);

