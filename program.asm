section .bss
    saved resb 128 ; Create a variable called saved and reserve 128 bytes
    bytes resd 1 ; Reserve 4 bytes

section .data
    text db "Hello World!", 10, 0
    len equ $ - text

    text2 db "Type something: ", 0, 0
    len2 equ $ - text2

    text3 db "You said: ", 0, 0
    len3 equ $ - text3
section .text
    global _start

_start:
    ; https://faculty.nps.edu/cseagle/assembly/sys_call.html
    mov eax, 4 ; Save sys_write to Accumulator Register. Let's just say this is the method name `sys_write`

    ; https://manpages.debian.org/unstable/manpages-dev/write.2.en.html
    mov ebx, 1 ; int fd save it to ebx (Descriptor and save it to Base Register)
    mov ecx, text ; const void buf[.count] save it to ecx (Content and save it to Count Register)
    mov edx, len ; size_t count save it to edx (Length and save it to Data register)

    int 0x80 ; interrupt

    mov eax, 4
    
    mov ebx, 1 
    mov ecx, text2
    mov edx, len2

    int 0x80

    mov eax, 3 

    mov ebx, 1
    mov ecx, saved
    mov edx, 128

    int 0x80
    mov eax, 4

    mov ebx, 1
    mov ecx, text3
    mov edx, len3

    int 0x80 ; interrupt

    mov eax, 4

    mov ebx, 1
    mov ecx, saved
    mov edx, 128

    int 0x80 ; interrupt

    mov eax, 1 ; sys_exit
    xor ebx, ebx
    int 0x80
