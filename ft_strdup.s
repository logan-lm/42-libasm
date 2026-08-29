global ft_strdup

extern malloc
extern __errno_location
extern ft_strlen
extern ft_strcpy

section .text

ft_strdup:
	call ft_strlen
	push rdi
	inc rax
	mov rdi, rax
	call malloc WRT ..plt
	cmp rax, 0
	je error
	mov rdi, rax
	pop rsi
	call ft_strcpy
	ret
error:
	neg rax
	push rax
	call __errno_location WRT ..plt
	pop rdi
	mov dword [rax], edi
	mov rax, 0
	ret
