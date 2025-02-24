ENTRY(_start)
PHDRS { text PT_LOAD; data PT_LOAD; }

MEMORY {
  flash : ORIGIN = 0x30000000, LENGTH = 262144K
  psram : ORIGIN = 0x80000000, LENGTH = 524288K
  sram 	: ORIGIN = 0x0f000000, LENGTH = 8K
}

SECTIONS {
    . = ORIGIN(flash);
    .text : ALIGN(4) {
        *(entry)
        *(.text*)
    } > flash AT> flash : text
    .rodata : 
    {
        _rodata = .;
        *(.rodata*)
        *(.srodata*)
        _erodata = .;
    } > flash
    .data : ALIGN(4) {
        _data_start = .;
        *(.data*)
        *(.sdata*)
        _data_end = .;
    } > psram AT> flash : data
    _data_size = SIZEOF(.data);
    _data_load_start = LOADADDR(.data);
	_heap_start = ALIGN(0x100);
    _heap_end = _heap_start + 0x1000000;
    .bss : ALIGN(4) {
        _bss_start = .;
        *(.bss*)
        *(.sbss*)
        *(.scommon)
        _bss_end = .;
    } > psram
	. = ORIGIN(sram);
    _stack_top = ALIGN(0x10);
    . = _stack_top + 0x2000;
    _stack_pointer = .;
    end = .;
    _end = .;
}