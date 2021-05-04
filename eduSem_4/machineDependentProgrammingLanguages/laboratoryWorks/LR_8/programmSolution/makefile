.PHONY : all debug runmem gcov clean func check unit

SRC_DIR := ./src
INC_DIR := ./inc
OUT_DIR := ./out
UTESTS_DIR := ./unit_tests

CC := gcc
ASM := nasm
CFLAGS := -std=gnu99 -w -I$(INC_DIR) -masm=intel

SRCS := $(wildcard $(SRC_DIR)/*.c)
ASM_SRCS += $(wildcard $(SRC_DIR)/*.asm)
INCS := $(SRCS:$(SRC_DIR)/%.c=$(INC_DIR)/%.h)

U_CFLAGS := -lcheck -lpthread -lrt
U_SRCS := $(wildcard $(UTESTS_DIR)/*.c)
OBJS := $(U_SRCS:$(UTESTS_DIR)/%.c=$(OUT_DIR)/%.o)
OBJS += $(SRCS:$(SRC_DIR)/%.c=$(OUT_DIR)/%.o)
OBJS += $(ASM_SRCS:$(SRC_DIR)/%.asm=$(OUT_DIR)/%.o)

EXEC := main.out

all: $(EXEC)

$(EXEC) : $(OBJS) $(INCS)
	@$(CC) $(CFLAGS) -o $@ $(OBJS) $(U_CFLAGS)

$(OUT_DIR):
	@mkdir -p $(OUT_DIR)

${OUT_DIR}/%.o : ${SRC_DIR}/%.c $(OUT_DIR)
	@$(CC) $(CFLAGS) -c $< -o $@

${OUT_DIR}/%.o : ${SRC_DIR}/%.asm $(OUT_DIR)
	@$(ASM) -f elf64 ./src/strcopy.asm
	@mv ./src/strcopy.o ./out

$(OUT_DIR)/check_%.o : $(UTESTS_DIR)/check_%.c $(OUT_DIR)
	@$(CC) $(CFLAGS) -o $@ -c $<

$(INC_DIR)/%.h:

clean:
	@$(RM) $(EXEC) ${OUT_DIR}/* ./*.o
	@rm -rf $(OUT_DIR)
