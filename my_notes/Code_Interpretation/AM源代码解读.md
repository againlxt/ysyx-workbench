# AM 源代码解读

## linker.ld

你的 `linker.ld` 文件定义了程序入口、程序头（`PHDRS`）和多个内存段（`SECTIONS`），其功能如下：

### 1. **ENTRY 指令**

```
ld


复制代码
ENTRY(_start)
```

- 指定程序的入口点为 `_start`，这意味着程序在启动时会从 `_start` 位置执行。

### 2. **程序头 (`PHDRS`)**

```
ld


复制代码
PHDRS { text PT_LOAD; data PT_LOAD; }
```

- 定义了两个程序头 `text` 和 `data`，两者都对应 `PT_LOAD`，即加载类型的程序段。`PT_LOAD` 用于指示在加载程序时，需要将指定的段加载到内存中。

### 3. **段定义 (`SECTIONS`)**

段定义控制了程序中代码和数据的布局。

- **`. = _pmem_start + _entry_offset;`**

  - 通过 `_pmem_start` 和 `_entry_offset` 设置段的起始地址，起始地址是通过链接标志传递给 `ld` 的外部符号。

- **`.text` 段**

  ```
  ld复制代码.text : {
    *(entry)
    *(.text*)
  } : text
  ```

  - `.text` 段用于存储程序的代码。
  - `*(entry)` 表示将所有被标记为 `entry` 的符号放入 `.text` 段，后续是 `*.(text*)`，它表示匹配所有的代码段。
  - `: text` 表示 `.text` 段与 `PHDRS` 中定义的 `text` 程序头相关联。

- **`.rodata` 段**

  ```
  ld复制代码.rodata : {
    *(.rodata*)
  }
  ```

  - `.rodata` 段存储只读数据，比如常量。

- **`.data` 段**

  ```
  ld复制代码.data : {
    *(.data)
  } : data
  ```

  - `.data` 段存储已初始化的全局变量和静态变量，`: data` 将 `.data` 段与 `PHDRS` 中的 `data` 程序头相关联。

- **`.bss` 段**

  ```
  ld复制代码.bss : {
    _bss_start = .;
    *(.bss*)
    *(.sbss*)
    *(.scommon)
  }
  ```

  - `.bss` 段存储未初始化的全局变量和静态变量，`_bss_start` 用于记录 `.bss` 段的起始地址。

- **栈和堆**

  ```
  ld复制代码_stack_top = ALIGN(0x1000);
  . = _stack_top + 0x8000;
  _stack_pointer = .;
  _heap_start = ALIGN(0x1000);
  ```

  - `_stack_top` 定义栈的顶部，`ALIGN(0x1000)` 确保栈地址对齐到 0x1000 的边界。
  - `_stack_pointer` 是栈指针，用于指向栈的结束地址。
  - `_heap_start` 定义了堆的起始地址，也对齐到 0x1000 的边界。

### 4. **符号定义**

- `etext`、`edata`、`end` 这些符号分别对应 `.text` 段、`.data` 段和整个内存空间的结束地址。
- `_stack_pointer` 和 `_heap_start` 用于指示栈顶和堆的起始地址，方便程序在运行时使用这些信息。

### 