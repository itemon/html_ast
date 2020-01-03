#include "html_parser.h"
#include <stdio.h>
#include <assert.h>
#include <string.h>

#define MAX_LINE_CHAR 1024

const int max_deep_of_loop = 10;

void parse_from_file(FILE* html) {
	assert(html != NULL);
}
