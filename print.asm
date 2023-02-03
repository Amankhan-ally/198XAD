printstring:
push ax
push bx

mov ah, 0x0e
loopptr:
cmp [bx], byte 0
je .exit
mov al, [bx]
int 0x10
inc bx
jmp loopptr

.exit:
pop ax
pop bx
ret
