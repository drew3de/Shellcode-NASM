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
        

        # read(int fd, void *buf, size_t count);
        # rax	System Call	 rdi	                rsi	        rdx
        # 0	sys_read	 unsigned int fd	char* buf	size_t count

        mov rdi, rax # put the result of the last syscall (fd) in rdi
        mov rax, 0 # read syscall
        mov rsi, rsp # dump stack pointer at rsi
        mov rdx, 1000 # large ish number for bytes to read
        syscall


        # write (int fd, const void *buf, size_t count);
        # rax	System Call	 rdi	                rsi	         rdx
        # 1	sys_write	 unsigned int fd	const char* buf  size_t coun

        mov rax, 1 # write syscall 
        mov rdi, 1 # write to stdout
        syscall


        # exit(int status);
        # rax	System Call	 rdi
        # 60	sys_exit	 int error_code

        mov rax, 60 # sys_exit
        mov rdi, 0 # exit code
        syscall


filetext:
        .string "/path/to/file"