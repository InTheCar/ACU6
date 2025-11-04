TARGET_BIN  = hello-acu6

CFLAGS  += -MMD -MP -Wall -Wextra -pedantic -Werror -Wno-error=deprecated-declarations

LIBS    +=

C_SRCS   = hello.c

OBJS     += $(patsubst %.c, $(BUILD_DIR)/%.o, $(C_SRCS))
OBJS     += $(patsubst %.S, $(BUILD_DIR)/%.o, $(ASM_SRCS))

DEPS = $(OBJS:%.o=%.d)

BUILD_DIR = build

.PHONY: all

all: $(BUILD_DIR)/$(TARGET_BIN)

$(BUILD_DIR)/$(TARGET_BIN): $(OBJS)
	@echo LINK $@ $(LDFLAGS)
	@$(CC) $(CFLAGS) $(LDFLAGS) $(OBJS) $(LIBS) -o $@

$(BUILD_DIR)/%.o: %.c
	@echo CC $<
	@mkdir -p $(@D)
	@$(CC) -c $(CFLAGS) $< -o $@

install: all
	@install -m 755 $(BUILD_DIR)/$(TARGET_BIN) $(DESTDIR)/$(PREFIX)/bin

clean:
	@-rm -rf $(BUILD_DIR)/

-include $(DEPS)
