#include <stdlib.h>
#include <stdio.h>
#include "html_parser.h"
#include "linkedlist/linkedlist.h"

int main(int argc, char** argv) {
  printf("Start parsing the html as AST\n");

	FILE* html_file_handler = fopen("./demo.html", "r");
	parse_from_file(html_file_handler);
	fclose(html_file_handler);

	printf("size of struct L_Node is %lu\n", sizeof(L_Node));

  return EXIT_SUCCESS;
}
