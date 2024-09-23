# Chisel 时钟与重置

Chisel 模块具有默认时钟和重置，它们被模块内部创建的每个寄存器隐式使用。有时您希望能够覆盖此默认行为；也许您有一个生成时钟或重置信号的黑匣子，或者您有一个多时钟设计。
Chisel 提供了处理这种情况的方法。Clocks和resets可以被一下方法强制覆盖：

- **withClock() {}**：强制覆盖时钟
- **withReset() {}：**强制覆盖复位
- **withClockAndReset() {}：**强制覆盖时钟和复位

需要注意的一点是，“reset”始终是同步的，并且属于“Bool”类型。时钟在 Chisel 中有自己的类型（“Clock”），应这样声明。可以通过对“Bool”调用“asClock()”将其转换为“Clock”，但您应该小心，不要做傻事。

在引用时需要加入一下语句：

```scala
import chisel3.experimental.{withClock, withReset, withClockAndReset}
```



# 乘法问题

只能够相同类型相乘，在chisel设计上无符号只能够乘以无符号。

# 滤波器生成器

```scala
class MyManyDynamicElementVecFir(length: Int) extends Module {
    val io = IO(new Bundle {
        val in = Input(UInt(8.w))
        val valid = Input(Bool())
        val out = Output(UInt(8.w))
        val consts = Input(Vec(length, UInt(8.W)))
    })
    
    // Such concision! You'll learn what all this means later
    val taps = Seq(io.in) ++ Seq.fill(io.consts.length - 1)(RegInit(0.U(8.W)))
    taps.zip(taps.tail).foreach { case (a, b) => a * b }.reduce(_ + _)
}

visualize(() => new MyManyDynamicElementVecFir(4))
```

