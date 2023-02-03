nasm -f bin boot.asm -o boot.bin

echo "[+] Created bootloader binary file"

nasm -f elf64 readit.asm -o ex.o

echo "[+] Created Sector2 object file"

x86_64-elf-gcc -ffreestanding -mno-red-zone -m64 -c kernel.cpp -o kernel.o

echo "[+] Compiled Kernel file"

x86_64-elf-ld -o kernel.tmp -Ttext 0x7e00 ex.o kernel.o

echo "[+] Linked Stage2 with kernel"

x86_64-elf-objcopy -O binary kernel.tmp kernel.bin

echo "[+] Kernel binary file created"

cat boot.bin kernel.bin > boot.img

echo "[+] Boot image created"


