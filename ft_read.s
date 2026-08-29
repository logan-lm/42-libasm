global ft_read

extern __errno_location

section .text

ft_read:
	mov rax, 0
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