global ft_write

extern __errno_location

section .text

ft_write:
	mov rax, 1
	syscall
	cmp rax, 0
	jge success

	neg rax
	push rax
	call __errno_location WRT ..plt
	pop rdi
	mov dword [rax], edi
	mov rax, -1
success:
	ret