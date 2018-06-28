BITS 64
	global strpbrk:
	section .text

strpbrk:
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
	cmp rax, 0
	jz vraiend
	dec rax
	inc rdi
	jmp end

vraiend:
	cmp BYTE [rdi + rax], 0
	jz retnull
	cmp BYTE [rsi], 0
	jz retnull
	mov rax, rdi
	ret

retnull:
	mov rax, 0
	ret
