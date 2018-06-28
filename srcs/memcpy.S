BITS 64
        global memcpy:
	section .text

memcpy:
	xor r9, r9
	mov rax, rdi

start:
	cmp r9, rdx
	jz end
	mov r8b, BYTE [rsi + r9]
	mov BYTE [rdi + r9], r8b
	inc r9
	jmp start

end:
	ret
