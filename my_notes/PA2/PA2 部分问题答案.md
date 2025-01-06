# PA2 部分问题答案

## 理解mainargs

对于`$ISA-nemu`采用的方法是在编译flag中使用-D定义一个预处理器宏

```
CFLAGS += -DMAINARGS=\"$(mainargs)\"
```

而在`native`中采用的方法是在使用`getenv`（https://man7.org/linux/man-pages/man3/getenv.3.html）函数。

```c
  const char *args = getenv("mainargs");
  halt(main(args ? args : "")); // call main here!
```

