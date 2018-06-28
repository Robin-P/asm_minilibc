BITS 64
        global rindex:
	section .text

rindex:
	xor rax, rax
	mov rdx, rdi

start:
	cmp BYTE [rdi], 0
	jz next
	inc rdi
	jmp start

next:
	cmp BYTE [rdi], sil
	jz diff
	cmp rdi, rdx
	jz end
	dec rdi
	jmp next

diff:
	mov rax, rdi
	ret

end:
	ret
