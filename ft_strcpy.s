global ft_strcpy

section .text

ft_strcpy:
	mov     rax, 0
.loop:
	mov     dl, byte[rsi + rax]
	mov     byte[rdi + rax], dl
	cmp     dl, 0
	je      .L2
	inc     rax
	jmp     .L1
.end:
	mov     rax, rdi
	ret