LIBNAME = asm
NAME = lib$(LIBNAME).a
OBJDIR = objs

NASM = nasm
NASMFLAGS = -f elf64
NASMSRCS = ft_strcmp.s ft_strcpy.s ft_strlen.s ft_write.s ft_read.s ft_strdup.s
NASMOBJS = $(addprefix $(OBJDIR)/,$(NASMSRCS:.s=.o))

AR = ar
ARFLAGS = rcs

TESTERNAME = asm_tester
CC = cc
CFLAGS = -Wall -Wextra -Werror -g3
CSRCS = main.c
COBJS = $(addprefix $(OBJDIR)/,$(CSRCS:.c=.o))

RM = rm

all: $(NAME)

$(NAME): $(NASMOBJS)
	$(AR) $(ARFLAGS) $@ $^

tester: $(TESTERNAME)

$(TESTERNAME): $(COBJS) $(NAME)
	$(CC) $(COBJS) $(CFLAGS) -L. -l$(LIBNAME) -o $@

$(OBJDIR):
	mkdir -p $@

$(OBJDIR)/%.o : %.s | $(OBJDIR)
	$(NASM) $(NASMFLAGS) $< -o $@

$(OBJDIR)/%.o : %.c | $(OBJDIR)
	$(CC) -c $< $(CFLAGS) -o $@

clean:
	$(RM) -rf $(OBJDIR)

fclean: clean
	$(RM) -rf $(NAME) $(TESTERNAME)

re:
	$(MAKE) fclean
	$(MAKE) all

.PHONY: all tester clean fclean re