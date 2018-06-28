BITS 64
	global strcspn:
	section .text

strcspn:
	xor rax, rax
	xor rcx, rcx

start:
	mov r9b, BYTE [rdi + rax]
	cmp r9b, 0
	jz end
	jmp loop

addrax:
	xor rcx, rcx
	inc rax
	jmp start

loop:
	cmp BYTE [rsi + rcx], 0
	jz addrax
	cmp BYTE [rsi + rcx], r9b
	jz end
	inc rcx
	jmp loop

end:
	ret
