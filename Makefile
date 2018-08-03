NONE            = "\x1B[m"
GRAY            = "\x1B[0;30m"
LIGHT_GRAY      = "\x1B[1;30m"
RED             = "\x1B[0;31m"
LIGHT_RED       = "\x1B[1;31m"
GREEN           = "\x1B[0;32m"
LIGHT_GREEN     = "\x1B[1;32m"
YELLOW          = "\x1B[0;33m"
LIGHT_YELLOW    = "\x1B[1;33m"
BLUE            = "\x1B[0;34m"
LIGHT_BLUE      = "\x1B[1;34m"
PURPLE          = "\x1B[0;35m"
LIGHT_PURPLE    = "\x1B[1;35m"
CYAN            = "\x1B[0;36m"
LIGHT_CYAN      = "\x1B[1;36m"
WHITE           = "\x1B[0;37m"
LIGHT_WHITE     = "\x1B[1;37m"
######################################
ECHO = @echo -e
COMPILER = gcc -g -fPIC -fdiagnostics-color=auto
AC = @ar -rcs
CFLAGS += -D_GNU_SOURCE -export-dynamic

COLOR_OBJ       =       $(CYAN)
COLOR_TAG       =       $(YELLOW)
COLOR_TXT       =       $(GREEN)
COLOR_NONE      =       $(NONE)
COLOR_RED       =       $(RED)

define compile_obj
	$(ECHO) $(COLOR_TXT)"\t\t- COMPILE\t===>\t"$(COLOR_OBJ)"$(1:.c=.o)"$(COLOR_NONE)
	$(COMPILER) $(CFLAGS) $(INC_DIR) -c $(1) -o $(2)
endef

libargparser.a: carg_parser.o
	$(AC) $@ $^

all:
	make libargparser.a
	gcc -Wall -g -O0 -o example main.c carg_parser.c

%.o: %.c
	$(call compile_obj, $^, $@)


clean:
	rm -rf *.o libargparser.a example

