global ft_list_push_front

extern malloc

struc t_list
.data:          resq    1
.next:          resq    1
	endstruc


section .text

ft_list_new:
	push    rbx
	mov     rbx, rdi
	mov     rdi, t_list_size
	call    malloc WRT ..plt
	test    rax, rax
	jz      .end
	mov     [rax + t_list.data], rbx
	mov     [rax + t_list.next], 0
.end:
	pop     rbx
	jmp     ft_list_push_front.callback


ft_list_push_front:
	push    rbx
	mov     rbx, rdi
	mov     rdi, rsi
	jmp     ft_list_new
.callback:
	test    rax, rax
	jz      .end
	mov     rsi, [rbx]
	mov     [rax + t_list.next], rsi
	mov     [rbx], rax
	mov     rax, rbx
.end:
	pop     rbx
	ret
