BITS 64
	global strstr:
	section .text

strstr:
	cmp byte[rsi], 0
	jz end
	jmp start

inc_c:
	inc rdi

start:
	xor rdx, rdx
	xor rcx, rcx

loop:
	mov r8b, byte[rsi]
	cmp byte[rdi], r8b
	jz found_c_loop
	cmp byte[rdi], 0
	jz end_zero
	inc rdi
	jmp loop

found_c_loop:
	mov r8b, byte[rsi + rcx]
	cmp r8b, 0
	jz end
	cmp byte[rdi + rdx], r8b
	jnz inc_c
	cmp byte[rdi + rdx], 0
	jz end_zero
	inc rcx
	inc rdx
	jmp found_c_loop

end:
	mov rax, rdi
	ret

end_zero:
	mov rax, 0
	ret
