
MEMORY
{
    FLASH (rx) : ORIGIN = 0x00000000, LENGTH = 256K
    SRAM (rwx) : ORIGIN = 0x20000000, LENGTH = 64K
}

SECTIONS
{
    .text :
    {
	_text = .;
        KEEP(*(.vector_table))
	KEEP(*(.forth))
        *(.text*)
        *(.rodata*)
/*	*(.init)
	*(.fini)
	*(.ARM.exidx) */
        _etext = .;
    } > FLASH
    _xxx = ADDR(.text) +  SIZEOF(.text) + 1K;
    .data  : AT(ADDR(.text) +  SIZEOF(.text) + 1K)
    {
   
        _data = .;
        *(.data)
        _edata = .;
    } > SRAM

    .bss :
    {
        _bss = .;
        *(.bss)
        *(COMMON)
        _ebss = .;
	. = ALIGN(8);
	_end = .;
    } > SRAM
}

PROVIDE( _HEAP_START = _end );
PROVIDE ( _HEAP_END = ALIGN(ORIGIN(SRAM) + LENGTH(SRAM) - 8 ,8) );

/* Notes: +) KEEP(xxx) -- when garbage collection is in use `--gc-sections' KEEP indicates that
             the section shall NOT be removed

	  +) AT

*/