AS = nasm
CC = x86_64-elf-gcc
ld = x86_64-elf-ld
obj = x86_64-elf-objcopy

boot:$(AS) -f bin boot.asm -o boot.bin

ex:$(AS) -f elf64 readit.asm -o ex.o

kernel:$(CC) -ffreestanding -mno-red-zone -m64 -c kernel.cpp -o kernel.o

kertmp: ex kernel $
 $(ld) -o kernel.tmp -Ttext 0x7e000 ex.o kernel.o

kerbin: kertmp $
 $(obj) -O binary kernel.tmp kernel.bin

copy:cat boot.bin kernel.bin > boot.img

