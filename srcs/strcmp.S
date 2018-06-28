BITS 64
	global strcmp:
	section .text

strcmp:
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
	cmp cl, dl
	jne diff
	inc rax
	jmp start

diff:
	sub cl, dl
	movsx rax, cl
	ret
