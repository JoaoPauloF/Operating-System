 
global bootstrap_entry, KERNEL_VMA_OFFSET, KERNEL_PMA_OFFSET
extern kmain
; Set up the multiboot header
MB_FLAGS	equ	(1<<0) | (1<<1)
MB_MAGIC	equ	0x1BADB002
MB_CHECKSUM	equ	 (0 -(MB_MAGIC + MB_FLAGS))	

section .multiboot
bits 32	
align 4
	dd MB_MAGIC
	dd MB_FLAGS
	dd MB_CHECKSUM
 
KERNEl_PMA_OFFSET 	equ 	0x0000000000100000
KERNEL_VMA_OFFSET 	equ	0xFFFFFFFF00000000
%define phys(virt) (virt - KERNEL_VMA_OFFSET)
section .multiboot
align 4
	dd MB_MAGIC
	dd MB_FLAGS
	dd MB_CHECKSUM
section .text
bits 32
bootstrap_entry:
	mov esp, phys(kernel_stack_top)
	push eax
	push ebx
section .bss
kernel_stack_bottom:
	resb 16384
kernel_stack_top:
kernel_PML4_table:
	resb 4096
kernel_PDP_table:
	resb 4096
kernel_PD_table:
	resb 4096
kernel_page_table:
	resb 4096
.hang:
	jmp .hang
