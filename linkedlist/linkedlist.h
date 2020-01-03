#ifndef LINKED_LIST

#define LINKED_LIST 1

enum lexical_token_type {
  tag = 1,
  text,
};

struct LNode {
  char* type;
  char* key;
  char* value;
  struct LNode* next;
};

typedef struct LNode L_Node;

#endif
