.global _start 
_start:
.intel_syntax noprefix

        # open(const char *pathname, int flags, mode_t mode);
        # rax	System Call	 rdi	                rsi	        rdx
        #  2	sys_open	 const char* filename	int flags	int mode
		
        mov rax, 2  # open syscall
        mov rsi, 0  # O_RDONLY 
        mov rdx, 0  # ignore
        lea rdi, [rip+filetext] 
        syscall


        # sendfile(int out_fd, int in_fd, off_t *offset, size_t count);
        # rax    System Call     rdi             rsi             rdx             r10   
        # 40     sys_sendfile    int out_fd      int in_fd       off_t* offset   size_t count    

        mov rsi, rax  # put the result of the last syscall (fd) in rdi
        mov rax, 40 # sys_sendfile
        mov rdi, 1 # send file to stdout
        mov rdx, 0 # no offset 
        push 1024
        pop r10
        syscall


        # exit(int status);
        # rax	System Call	 rdi
        # 60	sys_exit	 int error_code

        mov rax, 60 # sys_exit
        mov rdi, 0 # exit code
        syscall


filetext:
        .string "/path/to/file"

