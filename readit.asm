
mov ah, 0x0e
mov al, 'e'
int 0x10
mov al, 'x'
int 0x10


mov ah, 0
mov al, 0
int 0x10

jmp ProtectedMode


%include "ngdt.asm"

ProtectedMode:
call EnableA20
cli        		    ;disable interrupts
lgdt [gdt_descriptor]       ;load gdt in lgdt
mov eax, cr0                ;move cr0 register in eax register
or eax, 1                   ;move 1 byte in eax register
mov cr0, eax                ;move cr0 register back to eax register

jmp codeseg:StartProtectedMode

EnableA20:
in al, 0x92
or al, 2
out 0x92, al
ret


[BITS 32]
;%include "cpuid.asm"
;%include "paging.asm"
;%include "print.asm"
StartProtectedMode:
mov ax, dataseg
mov ds, ax
mov ss, ax
mov es, ax
mov fs, ax
mov gs, ax


;mov [0xb8000], byte 'X'

;call DetectCPUID        ;check cpu id for more information about processor
;call DetectLongMode     ;check if cpu supports Long mode 64bit
;call SetUpIdentityPaging ;main problem was here -> because of so many typing mistakes in various files but now the problems are resolved.
;call EditGDT              ;call Edited gdt for long mode

;jmp codeseg:Start64bit



[BITS 64]
[extern _start]
Start64bit:

mov edi, 0xb8000
mov rax, 0

call _start
jmp $

times 2048-($-$$) db 0
