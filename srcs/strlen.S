BITS 64
	global strlen:
	section .text

strlen:
	xor rax, rax


start:
	cmp BYTE [rdi + rax], 0
	jz end
	inc rax
	jmp start

end:	ret
