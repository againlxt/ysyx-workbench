ENTRY(_start)

MEMORY {
  mrom : ORIGIN = 0x20000000, LENGTH = 4K
  sram : ORIGIN = 0x0f000000, LENGTH = 8K
}

SECTIONS {
    . = ORIGIN(mrom);
    .text : ALIGN(4) {
        *(entry)
        *(.text*)
    } > mrom AT> mrom
    .data : ALIGN(4) {
        _data_start = .;
        *(.data)
    } > sram AT> mrom
    _data_size = SIZEOF(.data);
    _data_load_start = LOADADDR(.data);
    .bss : ALIGN(4) {
        *(.bss*)
    } > sram
    _stack_top = ALIGN(10, ORIGIN(sram) + LENGTH(sram) - 0x200);
    _heap_start = ALIGN(10, _stack_top - 0x200);
    . = _stack_top + 0x200;
    _stack_pointer = .;
}