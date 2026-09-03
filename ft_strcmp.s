global ft_strcmp

section .text

ft_strcmp:
	mov     rax, 0
.loop:
	mov     al, byte[rdi]
	mov     dl, byte[rsi]

	cmp     al, 0
	je      .LE

	cmp     al, dl
	jne     .LE

	inc     rdi
	inc     rsi
	jmp     .L0
.end:
	movzx   rax, al
	movzx   rdx, dl
	sub     rax, rdx
	ret