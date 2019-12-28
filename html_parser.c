#include "html_parser.h"
#include <stdio.h>
#include <assert.h>
#include <string.h>

#define MAX_LINE_CHAR 1024

void parse_from_file(FILE* html) {
	assert(html != NULL);
	char line_buf[MAX_LINE_CHAR];
	int lines = 0;

  // phase 1: ensure how many lines are there
	while (fgets(line_buf, MAX_LINE_CHAR, html) != NULL) {
		puts(line_buf);
		++lines;
	}

	// phase 2: ensure line chars counting
	size_t line_chars[lines];
	if (lines > 0) {
		int loop_line = 0;

		// rewind
		//fseek(html, 0, SEEK_SET);
		rewind(html);

		while (fgets(line_buf, MAX_LINE_CHAR, html) != NULL) {
			line_chars[loop_line++] = strlen(line_buf);
		}

		if (loop_line > 1) {
			printf("the second item is %lu\n", line_chars[1]);
		} else {
			printf("no loop line incremented?\n");
		}
	}
}
