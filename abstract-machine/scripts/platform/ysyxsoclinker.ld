ENTRY(_start)
PHDRS { text PT_LOAD; data PT_LOAD; }

MEMORY {
  flash : ORIGIN = 0x30000000, LENGTH = 262144K
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
    } > sram AT> flash : data
    _data_size = SIZEOF(.data);
    _data_load_start = LOADADDR(.data);
    .bss : ALIGN(4) {
        _bss_start = .;
        *(.bss*)
        *(.sbss*)
        *(.scommon)
        _bss_end = .;
    } > sram
    _stack_top = ALIGN(0x10);
    . = _stack_top + 0x800;
    _stack_pointer = .;
    end = .;
    _end = .;
    _heap_start = ALIGN(0x10);
    _heap_end = _heap_start + 0x400; 
}