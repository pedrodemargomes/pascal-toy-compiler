#define MAX_IDENT_LEN 30

#define INIT_NODE_ROOT(node) node->pgrmBlock = NULL; \
								node->print = printNodeRoot; \
								node->genCode = genCodeNodeRoot

#define INIT_NODE_BLOCK(node) node->intVars = node->stmt = NULL; \
								node->print = printNodeBlock; \
								node->genCode = genCodeNodeBlock

#define INIT_NODE_STMT(node) node->asign = node->if_ = node->while_ = node->write = node->next = NULL; \
								node->print = printNodeStmt; \
								node->genCode = genCodeNodeStmt

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

};

struct NodeSimpleExpression {

};

struct NodeTermo {

};


struct NodeTerminal {
	
};

struct NodeWhile {
	struct NodeExpression *cond;
	struct NodeBlock *loopBlock;
};

struct NodeAsignVariable {
	struct Variable *var;
	int value;
};

struct NodeIf {
	struct NodeExpression *cond;
	struct NodeBlock *ifBlock;
	struct NodeBlock *elseBlock;	
};

struct NodeWrite {
	struct Variable *var;
	int number;
};

int enqueueStatement(struct NodeStatemet *head, struct NodeStatemet *node);

int enqueueVariable(struct Variable *head, struct Variable *node);

void printNodeRoot(struct NodeRoot *node);

void printNodeBlock(struct NodeBlock *node);

void printNodeStmt(struct NodeStatemet *node);

void genCodeNodeRoot(struct NodeRoot *node);

void genCodeNodeBlock(struct NodeBlock *node);

void genCodeNodeStmt(struct NodeStatemet *node);
