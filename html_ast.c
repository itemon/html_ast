#include <stdlib.h>
#include <stdio.h>
#include "html_parser.h"

int main(int argc, char** argv) {
  printf("Start parsing the html as AST\n");

	FILE* html_file_handler = fopen("./demo.html", "r");
	size_t html_ptr_size = sizeof(html_file_handler);
	parse("hello world ---- ");
	printf("handler size %lu\n", html_ptr_size);
	fclose(html_file_handler);
  return EXIT_SUCCESS;
}
