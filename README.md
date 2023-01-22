# Shellcode-Basics-NASM

Intel (NASM) x86_64 Assembly

A humble collection of simple things intel (NASM) x86_64 assembly

## Extracting Shellcode

Assemble elf with gcc 
```
gcc -nostdlib assembly.s -o elf-filename
```

Extract shellcode
```
objcopy --dump-section .text=shellcode-filename elf-filename
```

Check elf
```
objdump -M intel -d elf-filename
```

## Resources
General: 
- https://nets.ec/Shellcode/Null-free#Removing_Nulls 

Linux:
- https://hackeradam.com/x86-64-linux-syscalls/
- https://github.com/torvalds/linux/tree/master/include/uapi/asm-generic
