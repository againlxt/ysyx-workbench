ENTRY(_start)
PHDRS { text PT_LOAD; data PT_LOAD; entry PT_LOAD;}

MEMORY {
  flash : ORIGIN = 0x30000000, LENGTH = 262144K
  psram : ORIGIN = 0x80000000, LENGTH = 524288K
  sram 	: ORIGIN = 0x0f000000, LENGTH = 8K
}

SECTIONS {
    . = ORIGIN(flash);
	.entry : ALIGN(4) {
		*(entry)
		*(.entry.boot)
	} > flash AT> flash : entry
    .text : ALIGN(4) {
		_text_start = .;
		*(.rodata*)
        *(.text*)
		_text_end = .;
    } > psram AT> flash : text
	_text_load_start = LOADADDR(.text);
    .data : ALIGN(4) {
        _data_start = .;
        *(.data*)
        *(.sdata*)
        _data_end = .;
    } > sram AT> flash : data
    _data_size = SIZEOF(.data);
    _data_load_start = LOADADDR(.data);
	_heap_start = ALIGN(0x100);
    _heap_end = _heap_start + 0x10000;
    .bss : ALIGN(4) {
        _bss_start = .;
        *(.bss*)
        *(.sbss*)
        *(.scommon)
        _bss_end = .;
    } > sram
	. = ORIGIN(sram);
    _stack_top = ALIGN(0x10);
    . = _stack_top + 0x2000;
    _stack_pointer = .;
    end = .;
    _end = .;
}