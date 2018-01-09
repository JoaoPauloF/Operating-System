.extern _kmain
.global_start
.set MB_MAGIC, 0x1BADB002
.set MB_FLAGS, (1<<0) | (1<<1)
.set MB_CHECKSUM, (0 - (MB_MAGIC + MB_FLAGS)

.section .multiboot
	.align 4 
	.long MB_MAGIC
	.long MB_FLAGS
	.long MB_CHECKSUM

.section .text
.global	_start
.type _start, @function
_start:
		mov $stack_top, $esp
		call _kmain
		
		hang:
			cli		
			hlt
			jmp hang
.section .bss
	.align 16
	stack_bottom:
		.skip 4096 
	stack_top:

