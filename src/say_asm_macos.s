# Compile with LLVM assembler
.intel_syntax noprefix

.section __DATA,__data
	_asm_hello: .asciz "This is an Asm function\n"
	_hello_len = 24

.section __TEXT,__text
	.global _say_asm
_say_asm:
    mov rax, 0x2000004                # system call 4 (write code)
    mov rdi, 1
    lea rsi, _asm_hello[rip]
    mov rdx, _hello_len                # Set register rdx to 12
    syscall                           # envoke syscall
