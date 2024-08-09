# Compile with GNU Assembler (gcc/as)
.intel_syntax noprefix
.section .rodata
	asm_hello: .asciz "This is an Asm function\n"
	hello_len = .-asm_hello

.section .text
	.global say_asm

say_asm:
	mov eax, 1 # system call 1
	mov rdi, 1 # fd = stdout
	lea rsi, asm_hello[rip] # char *message
	mov rdx, hello_len # size_t length
	syscall
	ret
