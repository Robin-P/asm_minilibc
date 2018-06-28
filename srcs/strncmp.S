BITS 64
        global strncmp:
	section .text

strncmp:
	xor rcx, rcx
	xor rbx, rbx
	xor rax, rax

start:
	cmp rax, rdx
	jz diff
	mov cl, BYTE [rdi + rax]
	mov bl, BYTE [rsi + rax]
	cmp cl, 0
	jz diff
	cmp bl, 0
	jz diff
	cmp cl, bl
	jne diff
	inc rax
	jmp start

diff:
	sub cl, bl
	movsx rax, cl
	ret
