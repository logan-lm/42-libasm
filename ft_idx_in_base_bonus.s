BITS 64

global ft_idx_in_base

section .text

ft_idx_in_base:
	mov     eax, 0
.loop:
	cmp     byte[rsi], 0
	je      .not_found
	cmp     [rsi], dil
	je      .end
	inc     rsi
	inc     eax
	jmp     .loop

.not_found:
	mov     eax, -1
.end:
	ret