#include <stdbool.h>

typedef struct s_list
{
	void *data;
	struct s_list *next;
} t_list;

void ft_list_swap(t_list **first_prev, t_list **second_prev)
{
	t_list *reminder = *first_prev;
	*first_prev = *second_prev;
	*second_prev = reminder;
	reminder = (*first_prev)->next;
	(*first_prev)->next = (*second_prev)->next;
	(*second_prev)->next = reminder;
}

t_list *ft_list_pop_node(t_list **node)
{
	t_list *reminder = *node;
	*node = (*node)->next;
	return (reminder);
}

void ft_list_push_back(t_list **begin, t_list *node)
{
	if (!*begin)
	{
		*begin = node;
		return;
	}
	while ((*begin)->next)
		(*begin) = (*begin)->next;
	(*begin)->next = node;
}

void ft_list_sort(t_list **begin, int (*cmp)(const void *, const void *))
{
	t_list **ptr = begin;
	bool sort = true;

	while (sort)
	{
		ptr = begin;
		while ((*ptr)->next)
		{
			if (cmp((*ptr)->data, (*ptr)->next->data) > 0)
			{
				ft_list_swap(ptr, &(*ptr)->next);
				sort = false;
			}
			ptr = &(*ptr)->next;
		}
		if (sort)
			return;
	}
}