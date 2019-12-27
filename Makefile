# make files

CC ?= clang
DEBUG_FLAG ?= -g -o0

APP := html_ast
LOG_PREFIX := $(APP):

ENTRY := $(APP).c

SRC := $(wildcard *.c)
OBJS := $(strip $(patsubst %.c, %.o, $(SRC)))
SRC := $(filter-out $(ENTRY), $(SRC))

.PHONY: clean all run

all: clean

clean:
	@echo $(LOG_PREFIX)"Clear all build objs"
	@echo $(LOG_PREFIX)$(OBJS) $(APP)
	@rm -rf $(OBJS)

$(APP): $(OBJS)
	$(CC) $(OBJS) -o $(APP)

html_parser.o: html_parser.c html_parser.h Makefile
	$(CC) $(DEBUG_FLAG) -c html_parser.c -o $@

html_ast.o: html_parser.o html_ast.c Makefile
	$(CC) $(DEBUG_FLAGS) -c html_ast.c -o $@

build: $(APP)
	@echo done

run: $(APP)
	./$< --stop=1

