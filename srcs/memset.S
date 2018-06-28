BITS 64
	global memset:
	section .text

memset:
	xor rcx, rcx

start:
	cmp rcx, rdx
	jz end
	mov BYTE [rdi + rcx], sil
	inc rcx
	jmp start

end:
	mov rax, rdi
	ret
