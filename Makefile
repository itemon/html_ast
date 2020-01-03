# make files

CC ?= clang
DEBUG_FLAG ?= -g -o0

APP := aster
LOG_PREFIX := $(APP):

ENTRY := $(APP).c

#SRC := $(wildcard *.c linkedlist/*.c)
#OBJS := $(strip $(patsubst %.c, %.o, $(SRC)))
#SRC := $(filter-out $(ENTRY), $(SRC))

LINKED_LIST_DIR := ./linkedlist
TMP_DIR := ./tmp

V = $(wildcard $(TMP_DIR))
ifneq ($(V),)
$(info found tmp dir, use it)
else
$(warning not found tmp dir, make it)
$(shell mkdir $(TMP_DIR))
endif

vpath %.c $(LINKED_LIST_DIR)
vpath %.h $(LINKED_LIST_DIR)

#LINK_OBJS = $(TMP_DIR)/linkedlist.o $(TMP_DIR)/html_parser.o $(TMP_DIR)/html_ast.o
LINK_OBJS = $(patsubst %.o, $(TMP_DIR)/%.o, linkedlist.o html_parser.o html_ast.o)

.PHONY: clean all run

all: clean run

clean:
	@echo $(LOG_PREFIX) Clear all build objs $(LINK_OBJS)
	@rm -rf $(TMP_DIR)/* $(APP)

$(APP): $(LINK_OBJS)
	$(CC) $^ -o $(APP)

$(TMP_DIR)/html_parser.o: html_parser.c html_parser.h
	$(CC) $(DEBUG_FLAG) -c $< -o $@

$(TMP_DIR)/html_ast.o: $(TMP_DIR)/linkedlist.o $(TMP_DIR)/html_parser.o html_ast.c
	$(CC) $(DEBUG_FLAG) -c html_ast.c -o $@

$(TMP_DIR)/linkedlist.o: linkedlist.c linkedlist.h
	@echo $(LOG_PREFIX) Find all headers and sources to compile $^
	$(CC) $(DEBUG_FLAG) -c $(filter-out %.h, $^) -o $@

build: $(APP)
	@echo done

run: $(APP)
	./$(APP) --stop=1
