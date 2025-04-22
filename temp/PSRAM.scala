package ysyx

import chisel3._
import chisel3.util._
import chisel3.experimental.Analog

import freechips.rocketchip.amba.apb._
import org.chipsalliance.cde.config.Parameters
import freechips.rocketchip.diplomacy._
import freechips.rocketchip.util._
import javax.print.DocFlavor.STRING

class QSPIIO extends Bundle {
  val sck = Output(Bool())
  val ce_n = Output(Bool())
  val dio = Analog(4.W)
}

class psram_top_apb extends BlackBox {
  val io = IO(new Bundle {
    val clock = Input(Clock())
    val reset = Input(Reset())
    val in = Flipped(new APBBundle(APBBundleParameters(addrBits = 32, dataBits = 32)))
    val qspi = new QSPIIO
  })
}

class psram extends BlackBox {
  val io = IO(Flipped(new QSPIIO))
}

class psramChisel extends RawModule {
	val io = IO(Flipped(new QSPIIO))

	val clkn 		= ~io.sck
	val rst 		= io.ce_n

	object StateEnum extends ChiselEnum {
		val S_IDLE, S_CMD, S_ADDR, S_WRITE, S_READ = Value
	}
	withReset(rst) {
		withClock(io.sck.asClock) {
			val countReg 		= RegInit(0.U(5.W))
			val cmdReg 			= RegInit(0.U(8.W))
			val addrReg 		= RegInit(0.U(24.W))
			val dataReg 		= RegInit(0.U(32.W))
			val lenWire 		= Wire(UInt(8.W))
			val validReg 		= Reg(Bool())
			val validWire 		= Wire(Bool())
			lenWire := (countReg - 14.U) >> 1

			val stateReg = RegInit(StateEnum.S_IDLE)
			stateReg 	:= MuxLookup(stateReg, StateEnum.S_IDLE) (List(
				StateEnum.S_IDLE 	-> Mux(rst, StateEnum.S_IDLE, StateEnum.S_CMD),
				StateEnum.S_CMD 	-> Mux((countReg === 7.U), StateEnum.S_ADDR, StateEnum.S_CMD),
				StateEnum.S_ADDR 	-> Mux((countReg === 13.U), 
				Mux(((cmdReg === "h38".U)), StateEnum.S_WRITE, StateEnum.S_READ), StateEnum.S_ADDR),
				StateEnum.S_WRITE 	-> Mux((countReg === 0.U), StateEnum.S_IDLE, StateEnum.S_WRITE),
				StateEnum.S_READ 	-> Mux((countReg === 0.U), StateEnum.S_IDLE, StateEnum.S_READ)
			))

			val psram 				= Module(new psramChiselV)
			psram.io.clock 			:= io.sck.asClock
			psram.io.valid 			:= validWire
			psram.io.cmd 			:= cmdReg
			psram.io.len 			:= lenWire
			psram.io.addr 			:= addrReg
			psram.io.dataIn 		:= dataReg
			val dinWire = TriStateInBuf(io.dio, dataReg, (countReg >= 20.U))

			when (stateReg === StateEnum.S_IDLE) {
				countReg 	:= 0.U
				cmdReg 		:= 0.U
				addrReg 	:= 0.U
				dataReg 	:= 0.U
				validReg 	:= 0.U
			} .elsewhen(stateReg === StateEnum.S_CMD & (countReg =/= 7.U)) {
				countReg 	:= countReg + 1.U
				validReg	:= 0.B
				cmdReg 		:= dinWire(0) + (cmdReg << 1);
			} .elsewhen(stateReg === StateEnum.S_ADDR) {
				countReg 	:= countReg + 1.U
				when (countReg(2,0) === 1.U) {
					addrReg		:= Cat(dinWire, 0.U(20.W))
				} .elsewhen(countReg(2,0) === 2.U) {
					addrReg 	:= Cat(addrReg(23,20), Cat(dinWire, 0.U(16.W)))
				} .elsewhen(countReg(2,0) === 3.U) {
					addrReg 	:= Cat(addrReg(23,16), Cat(dinWire, 0.U(12.W)))
				} .elsewhen(countReg(2,0) === 4.U) {
					addrReg 	:= Cat(addrReg(23,12), Cat(dinWire, 0.U(8.W)))
				} .elsewhen(countReg(2,0) === 5.U) {
					addrReg 	:= Cat(addrReg(23,8), Cat(dinWire, 0.U(4.W)))
				} .elsewhen(countReg(2,0) === 6.U) {
					addrReg 	:= Cat(addrReg(23,4), dinWire)
				}
				when (countReg >= 19.U) {
					validReg 		:= 1.B
				}
			} .elsewhen(stateReg === StateEnum.S_WRITE) {
				countReg 	:= countReg + 1.U
				dataReg := dinWire(3,0) + dataReg << 4;
			} .elsewhen(stateReg === StateEnum.S_READ) {
				countReg 	:= countReg + 1.U
				when (countReg === 16.U) {
					dataReg 	:= psram.io.dataOut
					validReg 	:= 0.B
				} .elsewhen (countReg >= 20.U) {
					dataReg 	:= dataReg >> 4
				}
			} .otherwise {
				countReg 	:= countReg + 1.U
			}
			validWire 	:= ((stateReg === StateEnum.S_WRITE) & rst) | ((stateReg === StateEnum.S_READ) & validReg) 
		}
	}
}

class psramChiselV extends BlackBox with HasBlackBoxInline {
	val io = IO(new Bundle{
		val clock 	= Input(Clock())
		val valid 	= Input(Bool())
		val cmd 	= Input(UInt(8.W))
		val len 	= Input(UInt(8.W))
		val addr 	= Input(UInt(32.W))
		val dataIn  = Input(UInt(32.W))
		val dataOut = Output(UInt(32.W))
	})

	setInline("psramChiselV.sv",
	"""module psramChiselV(
|  input             clock,
|  input             valid,
|  input       [7:0] cmd,
|  input 	  [7:0] len,
|  input      [31:0] addr,
|  input 	 [31:0] dataIn,
|  output reg [31:0] dataOut
|);
|import "DPI-C" function void psram_read(input int addr, output int data);
|import "DPI-C" function void psram_write(input int addr, input byte len, input int data);
|  always@(posedge clock) begin
|    if (valid)
|      if (cmd == 8'hEB) 	psram_read(addr, dataOut);
|	  else if(cmd == 8'h38)	psram_write(addr, len, dataIn);
|
|      else begin
|        $fwrite(32'h80000002, "Assertion failed: Unsupport command `%xh`, only support `EBh` read command and `38h` write command\n", cmd);
|        $fatal;
|      end
|  end
|endmodule
	""".stripMargin)
}

class APBPSRAM(address: Seq[AddressSet])(implicit p: Parameters) extends LazyModule {
  val node = APBSlaveNode(Seq(APBSlavePortParameters(
    Seq(APBSlaveParameters(
      address       = address,
      executable    = true,
      supportsRead  = true,
      supportsWrite = true)),
    beatBytes  = 4)))

  lazy val module = new Impl
  class Impl extends LazyModuleImp(this) {
    val (in, _) = node.in(0)
    val qspi_bundle = IO(new QSPIIO)

    val mpsram = Module(new psram_top_apb)
    mpsram.io.clock := clock
    mpsram.io.reset := reset
    mpsram.io.in <> in
    qspi_bundle <> mpsram.io.qspi
  }
}
