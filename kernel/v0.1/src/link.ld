OUTPUT_FORMAT(elf32-i386)
ENTRY(_start)
SECTIONS
 { 
   .text 0x100000 : 
   { 
       *(.multiboot_header)
       *(.text) 
   }
   .data : 
   { 
      *(.data) 
   }
   
   .bss : 
   { 
      *(.bss)  
	}
 }
