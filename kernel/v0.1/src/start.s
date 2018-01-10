extern _kmain

section .multiboot_header
header_start:
    dd 0xe85250d6                ; magic number (multiboot 2)
    dd 0                         ; architecture 0 (protected mode i386)
    dd header_end - header_start ; header length
    ; checksum
    dd 0x100000000 - (0xe85250d6 + 0 + (header_end - header_start))

    ; optional multiboot tags

    ; required end tag
    dw 0    ; type
    dw 0    ; flags
    dd 8    ; size
header_end:



section .text

global _start
_start:
    ; print `OK` to screen
    mov dword [0xb8000], 0x2f4b2f4f	
	mov esp, stack_top 
        //call _kmain 	
	
hang:
    hlt
	cli		
	jmp hang
			
			
section .data
stack_bottom:
    TIMES (16*1024) DB 0 
stack_top:
			
section .bss


