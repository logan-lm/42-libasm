global ft_list_swap

section .text

struc t_list
.data:          resq    1
.next:          resq    1
	endstruc

ft_list_swap:
	mov     rdx, [rdi]
	mov     rcx, [rsi]
	mov     [rdi], rcx
	mov     [rsi], rdx
	mov     r8, [rdi]
	mov     r9, [rsi]
	mov     rdx, [rdx + t_list.next]
	mov     rcx, [rcx + t_list.next]
	mov     [r8 + t_list.next], rdx
	mov     [r9 + t_list.next], rcx
	ret

ft_list_sort:

