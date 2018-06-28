BITS 64
        global strchr:
	section .text

strchr:
	xor rax, rax

start:
	cmp BYTE [rdi], sil
	jz diff
	cmp BYTE [rdi], 0
	jz end
	inc rdi
	jmp start

diff:
	mov rax, rdi
	ret

end:
	ret
