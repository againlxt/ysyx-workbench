ENTRY(_start)
PHDRS { text PT_LOAD; data PT_LOAD; }

SECTIONS {
    /* _mrom_start and _entry_offset are defined in LDFLAGS */
    . = _mrom_start + _entry_offset;
    .text : {
        *(entry)
        *(.text*)
    } : text
    /* _sram_start is defined in LDFLAGS */
    . = _sram_start;
    .data : {
        *(.data)
    } : data
    .bss : {
        *(.bss*)
    }
    . = _sram_start + 0x1000;
    _stack_top = ALIGN(0x1000);
    . = _stack_top + 0x1000;
    _stack_pointer = .;
    . = _sram_start;
    _heap_start = ALIGN(0x1000);
}