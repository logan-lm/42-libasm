global ft_strlen

section .text

ft_strlen:
	mov rax, 0
.L1:
	cmp byte[rdi+rax], 0
	je .LE
	inc rax
	jmp .L1
.LE:
	ret