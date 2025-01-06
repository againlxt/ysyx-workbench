# 编译后的文件包含那些内容

- 代码和数据
  - 可以没有数据，但没有意义
- 没有其他东西了么？
  - 可以没有，如NEMU读入的bin文件
  - 也可以有，gcc编译出的文件还包含数多东西

# 编译添加其他信息的需求

## 调试信息

是否打开`Enable debug information`会影响NEMU的大小

`addr2line`可以根据调试信息将地址转换为源文件地址（gdb）

```c
addr2line -e xxx.elf 0x1234
```

## 权限管理

- 代码可读可执行，但不能写
- 数据可读可写但不能执行
  - 也可以通过一下方法来实现可执行![Screenshot from 2024-07-17 15-28-39](/home/lxt/ysyx-workbench/my_notes/一生一芯课程/ELF文件与链接.assets/Screenshot from 2024-07-17 15-28-39.png)

- 我们需要里清楚代码与数据的边界

## 入口位置：代码不一定都从头开始执行

## 需要跟多的数据

- 以及用来组织这些数据的数据（元数据）

# ELF文件中的节

![Screenshot from 2024-07-17 15-52-10](/home/lxt/ysyx-workbench/my_notes/一生一芯课程/ELF文件与链接.assets/Screenshot from 2024-07-17 15-52-10.png)

![Screenshot from 2024-07-17 15-39-26](/home/lxt/ysyx-workbench/my_notes/一生一芯课程/ELF文件与链接.assets/Screenshot from 2024-07-17 15-39-26.png)

![Screenshot from 2024-07-17 15-47-45](/home/lxt/ysyx-workbench/my_notes/一生一芯课程/ELF文件与链接.assets/Screenshot from 2024-07-17 15-47-45.png)

![Screenshot from 2024-07-17 15-49-11](/home/lxt/ysyx-workbench/my_notes/一生一芯课程/ELF文件与链接.assets/Screenshot from 2024-07-17 15-49-11.png)

![Screenshot from 2024-07-17 15-50-39](/home/lxt/ysyx-workbench/my_notes/一生一芯课程/ELF文件与链接.assets/Screenshot from 2024-07-17 15-50-39.png)

# 静态链接

## 链接的作用

![Screenshot from 2024-07-17 15-54-40](/home/lxt/ysyx-workbench/my_notes/一生一芯课程/ELF文件与链接.assets/Screenshot from 2024-07-17 15-54-40.png)

汇编和编译都无法处理跨节的数据和数据引用。

![Screenshot from 2024-07-17 15-56-47](/home/lxt/ysyx-workbench/my_notes/一生一芯课程/ELF文件与链接.assets/Screenshot from 2024-07-17 15-56-47.png)

**链接的工作**

![Screenshot from 2024-07-17 15-59-52](/home/lxt/ysyx-workbench/my_notes/一生一芯课程/ELF文件与链接.assets/Screenshot from 2024-07-17 15-59-52.png)

## 符号解析

### 符号表

![Screenshot from 2024-07-17 16-03-26](/home/lxt/ysyx-workbench/my_notes/一生一芯课程/ELF文件与链接.assets/Screenshot from 2024-07-17 16-03-26.png)

### 符号解析的过程

![image-20240717161000499](/home/lxt/ysyx-workbench/my_notes/一生一芯课程/ELF文件与链接.assets/image-20240717161000499.png)

### 静态库

![image-20240717161404211](/home/lxt/ysyx-workbench/my_notes/一生一芯课程/ELF文件与链接.assets/image-20240717161404211.png)

#### 静态库的潜在问题

![image-20240717162341521](/home/lxt/ysyx-workbench/my_notes/一生一芯课程/ELF文件与链接.assets/image-20240717162341521.png)

![image-20240717162608496](/home/lxt/ysyx-workbench/my_notes/一生一芯课程/ELF文件与链接.assets/image-20240717162608496.png)

![image-20240717163227539](/home/lxt/ysyx-workbench/my_notes/一生一芯课程/ELF文件与链接.assets/image-20240717163227539.png)

![image-20240717163403421](/home/lxt/ysyx-workbench/my_notes/一生一芯课程/ELF文件与链接.assets/image-20240717163403421.png)

![image-20240717163859462](/home/lxt/ysyx-workbench/my_notes/一生一芯课程/ELF文件与链接.assets/image-20240717163859462.png)

## 启发

![image-20240717164255490](/home/lxt/ysyx-workbench/my_notes/一生一芯课程/ELF文件与链接.assets/image-20240717164255490.png)

# 重定位

![image-20240717164440578](/home/lxt/ysyx-workbench/my_notes/一生一芯课程/ELF文件与链接.assets/image-20240717164440578.png)

![image-20240717164738853](/home/lxt/ysyx-workbench/my_notes/一生一芯课程/ELF文件与链接.assets/image-20240717164738853.png)

![image-20240717165103571](/home/lxt/ysyx-workbench/my_notes/一生一芯课程/ELF文件与链接.assets/image-20240717165103571.png)

![image-20240717170107962](/home/lxt/ysyx-workbench/my_notes/一生一芯课程/ELF文件与链接.assets/image-20240717170107962.png)

![image-20240717170236559](/home/lxt/ysyx-workbench/my_notes/一生一芯课程/ELF文件与链接.assets/image-20240717170236559.png)

# Binutils - 生成/解析二进制文件的工具集合

![Screenshot from 2024-07-17 15-33-59](/home/lxt/ysyx-workbench/my_notes/一生一芯课程/ELF文件与链接.assets/Screenshot from 2024-07-17 15-33-59.png)

# 总结

![image-20240717170531743](/home/lxt/ysyx-workbench/my_notes/一生一芯课程/ELF文件与链接.assets/image-20240717170531743.png)