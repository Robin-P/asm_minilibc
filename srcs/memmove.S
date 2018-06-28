BITS 64
	global memmove
	section .text

memmove:
	xor rcx, rcx

start:
	mov r8b, byte[rsi + rcx]
	mov byte[rbp + rcx], r8b
	cmp rcx, rdx
	jz prepairsecond
	inc rcx
	jmp start

prepairsecond:
	xor rcx, rcx

second:
	mov r8b, byte[rbp + rcx]
	mov byte[rdi + rcx], r8b
	cmp rcx, rdx
	jz end
	inc rcx
	jmp second

end:
	mov rax, rdi
	ret
