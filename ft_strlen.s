global ft_strlen

section .text

ft_strlen:
	xor     eax, eax
.loop:
	cmp     byte[rdi+rax], 0
	je      .LE
	inc     rax
	jmp     .L1
.end:
	ret