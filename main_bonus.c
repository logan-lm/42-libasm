#include <stdio.h>
#include <stdlib.h>

typedef struct s_list
{
	void *data;
	struct s_list *next;
} t_list;

int ft_isspace(const char c);
int ft_idx_in_base(const char c, char *base);
int ft_atoi_base(const char *nb, const char *base);
size_t ft_strlen(char *str);
int ft_is_valid_base(char *str);
unsigned int ft_list_size(t_list *begin_list);
void ft_list_push_front(t_list **begin, void *data);
void *ft_list_swap(t_list **first_prev, t_list **second_prev);
int ft_strcmp(const char *, const char *);
void ft_list_sort(t_list **begin, int (*cmp)(const char *, const char *));

int main(void)
{
	// printf("%d\n", ft_isspace('a'));
	// printf("%d\n", ft_idx_in_base('9', "0123456789"));
	// printf("%lu\n", ft_strlen("0123456789"));
	// printf("%d\n", ft_atoi_base("     +41324231r", "0123406789"));
	// printf("%d\n", ft_is_valid_base("01"));
	t_list *begin = NULL;

	ft_list_push_front(&begin, "7");
	ft_list_push_front(&begin, "2");
	ft_list_push_front(&begin, "9");
	ft_list_push_front(&begin, "1");
	ft_list_push_front(&begin, "5");
	ft_list_push_front(&begin, "4");
	ft_list_push_front(&begin, "8");
	ft_list_push_front(&begin, "3");
	ft_list_push_front(&begin, "6");
	// printf("%u\n", ft_list_size(begin));
	// printf("%s\n", (char *)begin->data);
	ft_list_sort(&begin, ft_strcmp);
	printf("%s\n", (char *)begin->data);
	begin = begin->next;
	printf("%s\n", (char *)begin->data);
	begin = begin->next;
	printf("%s\n", (char *)begin->data);
	begin = begin->next;
	printf("%s\n", (char *)begin->data);
	begin = begin->next;
	printf("%s\n", (char *)begin->data);
	begin = begin->next;
	printf("%s\n", (char *)begin->data);
	begin = begin->next;
	printf("%s\n", (char *)begin->data);
	begin = begin->next;
	printf("%s\n", (char *)begin->data);
	begin = begin->next;
	printf("%s\n", (char *)begin->data);
	begin = begin->next;
	printf("%s\n", (char *)begin->data);
	printf("%pz\n", (char *)begin->next);
	return (0);
}