#include <stdlib.h>
#include <stdio.h>
#include "html_parser.h"

int main(int argc, char** argv) {
  printf("Start parsing the html as AST\n");

	FILE* html_file_handler = fopen("./testdata/vue.common.dev.js", "r");
	parse_from_file(html_file_handler);
	fclose(html_file_handler);

  return EXIT_SUCCESS;
}
