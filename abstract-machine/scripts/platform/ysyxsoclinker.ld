ENTRY(_start)
PHDRS { text PT_LOAD; data PT_LOAD; entry PT_LOAD; ssbl PT_LOAD;}

MEMORY {
  flash : ORIGIN = 0x30000000, LENGTH = 262144K
  psram : ORIGIN = 0x80000000, LENGTH = 524288K
  sdram : ORIGIN = 0xa0000000, LENGTH = 32M
  sram 	: ORIGIN = 0x0f000000, LENGTH = 8K
}

SECTIONS {
    . = ORIGIN(flash);
	.entry : ALIGN(4) {
		*(entry)
		*(.entry.boot)
	} > flash AT> flash : entry
	.ssbl : ALIGN(4) {
		_ssbl_start = .;
        *(.ssbl*)
		_ssbl_end = .;
    } > sram AT> flash : ssbl
	_ssbl_load_start = LOADADDR(.ssbl);
    .text : ALIGN(4) {
		_text_start = .;
        *(.text*)
		_text_end = .;
    } > sdram AT> flash : text
	_text_load_start = LOADADDR(.text);
    .data : ALIGN(4) {
        _data_start = .;
        *(.data*)
        *(.sdata*)
        _data_end = .;
    } > sdram AT> flash : data
	.rodata : ALIGN(4) {
        _rodata_start = .;
		*(.rodata*)
        *(.srodata*)
        _rodata_end = .;
    } > sdram AT> flash
	_rodata_load_start = LOADADDR(.rodata);
    _data_size = SIZEOF(.data);
    _data_load_start = LOADADDR(.data);
	_heap_start = ALIGN(0x1000);
    _heap_end = _heap_start + 0x8000000;
    .bss : ALIGN(4) {
        _bss_start = .;
        *(.bss*)
        *(.sbss*)
        *(.scommon)
        _bss_end = .;
    } > sdram AT> sdram
	. = ORIGIN(sram) + 0x1000;
    _stack_top = ALIGN(0x10);
    . = _stack_top + 0x1000;
    _stack_pointer = .;
    end = .;
    _end = .;
}