BITS 64
	global strcasecmp:
	section .text

strcasecmp:
	xor rcx, rcx
	xor rdx, rdx
	xor rax, rax

start:
	mov cl, BYTE [rdi + rax]
	mov dl, BYTE [rsi + rax]
	cmp cl, 0
	jz diff
	cmp dl, 0
	jz diff
	jmp comparecl

next:
	cmp cl, dl
	jne diff
	inc rax
	jmp start

comparecl:
	cmp cl, 64
	jle comparedl
	cmp cl, 90
	jle clisupper
	jmp comparedl

clisupper:
	add cl, 32

comparedl:
	cmp dl, 64
	jle next
	cmp dl, 90
	jle dlisupper
	jmp next

dlisupper:
	add dl, 32
	jmp next

diff:
	sub cl, dl
	movsx rax, cl
	ret
