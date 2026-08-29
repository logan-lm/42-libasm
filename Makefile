LIBNAME = asm
NAME = lib$(LIBNAME).a

NASM = nasm
NASMFLAGS = -f elf64
NASMSRCS = ft_strcmp.s ft_strcpy.s ft_strlen.s ft_write.s ft_read.s ft_strdup.s
NASMOBJS = $(NASMSRCS:.s=.o)

AR = ar
ARFLAGS = rcs

TESTERNAME = asm_tester
CC = cc
CFLAGS = -Wall -Wextra -Werror
CSRCS = main.c
COBJS = $(CSRCS:.c=.o)

all: $(NAME)

$(NAME): $(NASMOBJS)
	ar $(ARFLAGS) $@ $^

tester: $(TESTERNAME)

$(TESTERNAME): $(COBJS)
	$(CC) $^ $(CFLAGS) -L. -l$(LIBNAME) -o $@

%.o : %.s
	$(NASM) $(NASMFLAGS) $< -o $@

%.o : %.c $(NAME)
	$(CC) -c $< $(CFLAGS)

clean:
	rm -rf $(NASMOBJS) $(COBJS)

fclean: clean
	rm -rf $(NAME) $(TESTERNAME)

re:
	make fclean
	make $(NAME)

.PHONY: all tester clean fclean