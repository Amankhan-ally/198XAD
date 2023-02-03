[org 0x7c00]

mov ah, 0x0e
mov al, 'W'
int 0x10

mov [BOOT_DISK], dl

mov bp, 0x7c00
mov sp, bp

call read_disk

jmp SECOND_SECTOR
jmp SECOND_SECTOR

%include "disk.asm"
%include "print.asm"


times 510-($-$$) db 0
dw 0xaa55
