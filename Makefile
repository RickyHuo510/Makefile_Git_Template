CC=gcc
CFLAGS= -Wall -g -std=c11

SRCS_DIR:=src
BUILD_DIR=build
TARGET=myprog
LDFLAGS=-lreadline

SRCS:=$(shell find $(SRCS_DIR) -name "*.c")
#SRCS=$(wildcard $(SRCS_DIR)/*.c)

OBJS=$(patsubst $(SRCS_DIR)/%.c,$(BUILD_DIR)/%.o,$(SRCS))


all:$(TARGET)

$(TARGET):$(OBJS)
	$(CC) $(CFLAGS) $^ -o $@ $(LDFLAGS)

$(BUILD_DIR)/%.o:$(SRCS_DIR)/%.c | $(BUILD_DIR)
	mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -c $< -o $@

$(BUILD_DIR):
	mkdir -p $@

clean:
	rm -rf $(OBJS) $(TARGET) $(BUILD_DIR)

test:
	@echo $(SRCS)
	@echo $(OBJS)

.PHONY: all clean




# ---------------EXPLANATIONS----------------
#	Outputs the target name
#	echo $@
#
#	Outputs all prerequisites newer than the target
#	echo $?
#
#	Outputs all prerequisites
#	echo $^
#
#	Outputs the first prerequisite
#	echo $<
# 
# 	wildcard: find all .c files in current directory
# 	patsubst: replace .c with .o
#
#   Structure of a rule:
#	target: prerequisites
#		commands
#   target can either be the file name to be generated or a label for an action
#   prerequisites are files that the target depends on
#   commands are the shell commands to generate the target from the prerequisites 
#   MAKE will first check prerequisites, if any of them is newer than the target or if the target does not exist, the commands will be executed
#   
#   Explain: $(BUILD_DIR)/%.o:%.c | $(BUILD_DIR)
#				$(CC) $(CFLAGS) -c $< -o $@
#   Each time when Make encounters a .o file in $(BUILD_DIR), 
#   it will check if the corresponding .c file exists and  
#   the .c file is newer than the .o file
#   However, for the cmds after the | symbol, Make will not check the timestamps.
#   Make will first interperet $(BUILD_DIR) as a file name, if it does not exist,
#   it will then regard it as a target name and execute it.