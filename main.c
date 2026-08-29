#include <stdio.h>
#include <stddef.h>
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

	printf("%lu\n", ft_strlen(a));

	printf("%d\n", ft_strcmp(a, b));

	char *cpy = ft_strdup(b);

	printf("%s\n", ft_strcpy(b, a));

	int ret = ft_write(1, "coucou\n", 7);
	printf("Write returned %d\n", ret);
	if (ret < 0)
		printf("errno has been set to : %s\n", strerror(errno));

	char str[100] = {0};
	ret = ft_read(1, str, 99);
	printf("Read returned %d\n", ret);
	if (ret < 0)
		printf("errno has been set to : %s\n", strerror(errno));
	else
	{
		str[ret] = '\0';
		printf("Read : %s\n", str);
	}

	if (!cpy)
		printf("ft_strup failed to allocate memory\n");
	else
		printf("duplicated string : %s\n", cpy);
}