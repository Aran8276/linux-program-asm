nasm -f elf program.asm
ld -m elf_i386 program.o -o program
./program