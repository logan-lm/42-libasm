LIBNAME = asm
BONUSLIBNAME = asm_bonus
NAME = lib$(LIBNAME).a
BONUSNAME = lib$(BONUSLIBNAME).a
OBJDIR = objs

NASM = nasm
NASMFLAGS = -f elf64 -g
NASMSRCS = ft_strcmp.s ft_strcpy.s ft_strlen.s ft_write.s ft_read.s ft_strdup.s
NASMOBJS = $(addprefix $(OBJDIR)/,$(NASMSRCS:.s=.o))
BONUSNASMSRCS = ft_isspace_bonus.s ft_idx_in_base_bonus.s ft_is_valid_base.s ft_atoi_base_bonus.s ft_list_size.s ft_list_push_front.s
BONUSNASMOBJS = $(addprefix $(OBJDIR)/,$(BONUSNASMSRCS:.s=.o))

AR = ar
ARFLAGS = rcs

TESTERNAME = asm_tester
BONUSTESTERNAME = asm_bonus_tester
CC = cc
CFLAGS = -Wall -Wextra -Werror -g3
CSRCS = main.c
CBONUSSRCS = main_bonus.c ft_list_swap.c
COBJS = $(addprefix $(OBJDIR)/,$(CSRCS:.c=.o))
CBONUSOBJS = $(addprefix $(OBJDIR)/,$(CBONUSSRCS:.c=.o))

RM = rm

all: $(NAME)

bonus: $(BONUSNAME)

$(BONUSNAME): $(NASMOBJS) $(BONUSNASMOBJS)
	$(AR) $(ARFLAGS) $(BONUSNAME) $^

$(NAME): $(NASMOBJS)
	$(AR) $(ARFLAGS) $@ $^

tester: $(TESTERNAME)

bonus_tester: $(BONUSTESTERNAME)

$(TESTERNAME): $(COBJS) $(NAME)
	$(CC) $(COBJS) $(CFLAGS) -L. -l$(LIBNAME) -o $@

$(BONUSTESTERNAME): $(CBONUSOBJS) $(BONUSNAME)
	$(CC) $(CBONUSOBJS) $(CFLAGS) -L. -l$(BONUSLIBNAME) -o $@

$(OBJDIR):
	mkdir -p $@

$(OBJDIR)/%.o : %.s | $(OBJDIR)
	$(NASM) $(NASMFLAGS) $< -o $@

$(OBJDIR)/%.o : %.c | $(OBJDIR)
	$(CC) -c $< $(CFLAGS) -o $@

clean:
	$(RM) -rf $(OBJDIR)

fclean: clean
	$(RM) -rf $(NAME) $(BONUSNAME) $(TESTERNAME) $(BONUSTESTERNAME)

re:
	$(MAKE) fclean
	$(MAKE) all

.PHONY: all tester clean fclean re