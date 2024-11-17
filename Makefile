CC = gcc
CFLAGS = -Wall -Wextra -I./src -I./include
LDFLAGS =

SRC_DIR = src
BUILD_DIR = build
INCLUDE_DIR = include
TESTS_DIR = tests

SRC_FILES = $(SRC_DIR)/main.c $(SRC_DIR)/btxt.c $(SRC_DIR)/utils.c
OBJ_FILES = $(SRC_FILES:$(SRC_DIR)/%.c=$(BUILD_DIR)/%.o)

EXEC = $(BUILD_DIR)/btxt

README = docs/README.md
LICENSE = docs/LICENSE

all: $(EXEC)

$(EXEC): $(OBJ_FILES)
	$(CC) $(OBJ_FILES) -o $(EXEC) $(LDFLAGS)

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -rf $(BUILD_DIR)

run_tests:
	$(CC) $(CFLAGS) $(SRC_DIR)/test_btxt.c $(OBJ_FILES) -o $(BUILD_DIR)/test_btxt
	$(BUILD_DIR)/test_btxt

check:
	$(CC) $(CFLAGS) -o $(BUILD_DIR)/check $(SRC_FILES)

help:
	@echo "Usage: make [target]"
	@echo
	@echo "Targets:"
	@echo "  all          - Compile the project"
	@echo "  clean        - Remove build files"
	@echo "  run_tests    - Compile and run tests"
	@echo "  check        - Check code for errors and warnings"
	@echo "  help         - Show this help message"

.PHONY: all clean run_tests check help
