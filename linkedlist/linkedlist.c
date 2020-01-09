#include "linkedlist.h"
#include <stdio.h>
#include <assert.h>
#include <stdlib.h>

L_Node* append_lnode(L_Node* prev, L_Node* born) {
	assert(born != NULL);
	if (prev == NULL)
		return born;

	L_Node* old_next = prev->next;
	L_Node* tmp_next;
	while (old_next != NULL) {
		tmp_next = old_next->next;
		if (tmp_next != NULL) {
			old_next->next = NULL;
		}
		free(old_next);
		old_next = tmp_next;
	}
	prev->next = born;
	return born;
}

void test_lnode() {
	L_Node* root = malloc(sizeof(L_Node*));
	root->type = "tag";
	root->key = "body";
	root->value = "";
	printf("node:");
	puts(root->type);
	free(root);
}
