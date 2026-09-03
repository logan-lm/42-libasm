#include <stdio.h>
#include <stddef.h>
#include <stdlib.h>
#include <errno.h>
#include <string.h>

size_t	ft_strlen(const char *str);
int		ft_strcmp(const char *s1, const char *s2);
char	*ft_strcpy(const char *dst, const char *src);
size_t	ft_write(int fd, const void *buf, size_t count);
size_t	ft_read(int fd, const void *buf, size_t count);
char	*ft_strdup(const char *str);

int main(void)
{
	char a[] = "hello";
	char b[] = "byebye";

	printf("a: %s\n", a);
	printf("b: %s\n", b);


	printf("\n-----ft_strlen-----\n");
	printf("a: %lu\n", ft_strlen(a));
	printf("\"\": %lu\n", ft_strlen(""));
	// SHOULD SEGFAULT
	// printf("%lu\n", ft_strlen(NULL));


	printf("\n-----ft_strcmp-----\n");
	printf("a, b: %d\n", ft_strcmp(a, b));
	printf("\"a\", \"a\": %d\n", ft_strcmp("a", "a"));
	printf("\"a\", \"c\": %d\n", ft_strcmp("a", "c"));
	printf("\"c\", \"a\": %d\n", ft_strcmp("c", "a"));
	printf("\"aa\", \"a\": %d\n", ft_strcmp("aa", "a"));
	//SHOULD SEGFAULT
	// printf("%d\n", ft_strcmp("c", NULL));

	char *cpy = ft_strdup(b);

	printf("\n-----ft_strcpy-----\n");
	printf("a -> b\n");
	printf("ret: %s\n", ft_strcpy(b, a));
	printf("a: %s\n", a);
	printf("b: %s\n", b);
	// SHOULD SEGFAULT
	// printf("ret: %s\n", ft_strcpy(b, NULL));


	printf("\n-----ft_write------\n");
	int ret = ft_write(1, "coucou\n", 7);
	printf("return: %d\n", ret);
	ret = ft_write(3, "coucou\n", 7);
	printf("fd 3 return: %d\n", ret);
	printf("errno has been set to : %s\n", strerror(errno));
	ret = ft_write(1, NULL, 7);
	printf("NULL ptr return: %d\n", ret);
	printf("errno has been set to : %s\n", strerror(errno));
	ret = ft_write(1, "coucou\n", -1);
	printf("negative size return: %d\n", ret);
	printf("errno has been set to : %s\n", strerror(errno));
	ret = ft_write(1, "coucou\n", -0);
	printf("0 size return: %d\n", ret);


	printf("\n------ft_read------\n");
	char str[100] = {0};
	printf("write a test value : ");
	fflush(stdout);
	ret = ft_read(1, str, 99);
	printf("\n");
	printf("Read returned %d\n", ret);
	if (ret < 0)
		printf("errno has been set to : %s\n", strerror(errno));
	else
	{
		str[ret] = '\0';
		printf("your value was : %s\n", str);
	}

	printf("\n-----ft_strdup-----\n");
	if (!cpy)
		printf("ft_strup failed to allocate memory\n");
	else
		printf("duplicated b before ft_strcpy: %s\n", cpy);
	free(cpy);
}