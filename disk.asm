SECOND_SECTOR  equ 0x7e00

read_disk:
	mov ah, 2h
	mov bx, SECOND_SECTOR
	mov al, 6       ;number of sectors to read
	mov ch, 0       ;cylinder number
	mov cl, 0x02    ;sector number
	mov dh, 0x00    ;disk head
	mov dl, [BOOT_DISK]  ;drive number saved in a variable
	int 0x13
	jc disk_read_error
	ret


BOOT_DISK:
	db 0

error_msg:
	db '[+] Disk read failed!', 0

disk_read_error:
	mov bx, error_msg
	call printstring
	jmp $
