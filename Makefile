# make files

CC ?= clang
DEBUG_FLAG ?= -g -o0

APP := html_ast
LOG_PREFIX := $(APP):

ENTRY := $(APP).c

SRC := $(wildcard *.c)
OBJS := $(strip $(patsubst %.c, %.o, $(SRC)))
SRC := $(filter-out $(ENTRY), $(SRC))

.PHONY: clean all

all: clean

clean:
	@echo $(LOG_PREFIX)"Clear all build objs"
	@echo $(LOG_PREFIX)$(OBJS) $(APP)
