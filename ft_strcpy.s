global ft_strcpy

section .text

ft_strcpy:
	mov rax, 0
.L1:
	mov dl, byte[rsi + rax]
	mov byte[rdi + rax], dl
	cmp dl, 0
	je .L2
	inc rax
	jmp .L1
.L2:
	mov rax, rdi
	ret