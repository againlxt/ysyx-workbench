ENTRY(_start)
PHDRS { text PT_LOAD; data PT_LOAD; }

MEMORY {
  mrom : ORIGIN = 0x20000000, LENGTH = 4K
  sram : ORIGIN = 0x0f000000, LENGTH = 8K
}

SECTIONS {
    . = ORIGIN(mrom);
    .text : ALIGN(4) {
        *(entry)
        *(.text*)
        _etext = .;
    } > mrom AT> mrom : text
    etext = .;
    .rodata : ALIGN(4) {
        _rodata = .;
        *(.rodata*)
        *(.srodata*)
        _erodata = .;
    } > mrom AT> mrom
    .data : ALIGN(4) {
        _data_start = .;
        *(.data*)
        *(.sdata*)
        _edata = .;
    } > sram AT> mrom :data
    _data_size = SIZEOF(.data);
    _data_load_start = LOADADDR(.data);
    .bss : ALIGN(4) {
        _bstart = .;
        *(.bss*)
        *(.sbss*)
        *(.scommon)
        _bstart = .;
    } > sram
    _stack_top = ALIGN(0x10);
    . = _stack_top + 0x800;
    _stack_pointer = .;
    end = .;
    _end = .;
    _heap_start = ALIGN(0x10);
    _heap_end = _heap_start + 0x400;
}