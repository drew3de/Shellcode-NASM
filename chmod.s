.global _start 
_start:
.intel_syntax noprefix

	# chmod
	# rax	System Call	rdi	                rsi	       
	# 90	sys_chmod	const char* filename	mode_t mode

	mov rax, 90 # sys_chmod
	mov rsi, 0x1ff # octal 777
	lea rdi, [rip+filename]
	syscall


	# exit(int status);
        # rax	System Call	 rdi
        # 60	sys_exit	 int error_code

        mov rax, 60 # sys_exit
        xor rdi, rdi # exit code 0
        syscall


filename:
        .string "/path/to/file"
