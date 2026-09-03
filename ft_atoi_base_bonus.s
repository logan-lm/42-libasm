global ft_atoi_base

extern ft_isspace
extern ft_is_valid_base
extern ft_strlen
extern ft_idx_in_base

section .text

ft_atoi_base:
	push    r12
	push    r13
	push    r14
	push    r15
	push    rbx

	mov     r12, rdi
	mov     r13, rsi
	mov     rbx, 0

	mov     rdi, r13
	mov     rdi, rsi
	call    ft_is_valid_base
	cmp     rax, 0
	je      .ret
	call    ft_strlen
	mov     r14, rax
	mov     r15, 1

.skip_space:
	mov     dil, [r12]
	cmp     dil, 0
	je      .ret
	call    ft_isspace
	cmp     rax, 1
	jne     .neg
	inc     r12
	jmp     .skip_space

.neg:
	cmp     byte[r12], 0
	je      .ret
	cmp     byte[r12], '+'
	je      .plus
	cmp     byte[r12], '-'
	jne     .count
	mov     r15, -1
.plus:
	inc     r12

.count:
	mov     dil, [r12]
	cmp     dil, 0
	je      .ret
	mov     rsi, r13
	call    ft_idx_in_base
	cmp     eax, -1
	je      .ret
	imul    rbx, r14
	add     ebx, eax
	inc     r12
	jmp     .count

.ret:
	mov     rax, rbx
	imul    rax, r15
	pop     rbx
	pop     r15
	pop     r14
	pop     r13
	pop     r12
	ret
