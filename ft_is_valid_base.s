global ft_is_valid_base

extern ft_strlen
extern ft_isspace

section .text

ft_is_valid_base:
	mov     rdx, rdi
	mov     rcx, rdi
	push    rbx
	mov     rbx, 1
	call    ft_strlen
	cmp     rax, 2
	jl      .invalid
.base_loop:
	mov     dil, [rdx]
	cmp     dil, 0
	je      .end
	cmp     dil, '-'
	je      .invalid
	cmp     dil, '+'
	je      .invalid
	call    ft_isspace
	cmp     rax, 1
	je      .invalid
	mov     r8, rcx
.sec_loop:
	cmp     r8, rdx
	je      .next_loop
	cmp     [r8], dil
	je      .invalid
	inc     r8
	jmp     .sec_loop
.next_loop:
	inc     rdx
	jmp     .base_loop
.invalid:
	mov     rbx, 0
.end:
	mov     rax, rbx
	pop     rbx
	ret