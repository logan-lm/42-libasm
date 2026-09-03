global ft_isspace

section .text

ft_isspace:
	mov eax, 0
	cmp dil, `\t`
	jl end
	cmp dil, `\v`
	jle true
	cmp dil, ' '
	jne end
true:
	mov eax, 1
end:
	ret