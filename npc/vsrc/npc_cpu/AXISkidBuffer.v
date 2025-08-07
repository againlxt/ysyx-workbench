module AXISkidBuffer(
  input         clock,
  input         reset,
  input         io_axiMaster_awready, // @[src/main/scala/basemode/SkidBuffer.scala 158:16]
  output        io_axiMaster_awvalid, // @[src/main/scala/basemode/SkidBuffer.scala 158:16]
  output [31:0] io_axiMaster_awaddr, // @[src/main/scala/basemode/SkidBuffer.scala 158:16]
  output [3:0]  io_axiMaster_awid, // @[src/main/scala/basemode/SkidBuffer.scala 158:16]
  output [7:0]  io_axiMaster_awlen, // @[src/main/scala/basemode/SkidBuffer.scala 158:16]
  output [2:0]  io_axiMaster_awsize, // @[src/main/scala/basemode/SkidBuffer.scala 158:16]
  output [1:0]  io_axiMaster_awburst, // @[src/main/scala/basemode/SkidBuffer.scala 158:16]
  input         io_axiMaster_wready, // @[src/main/scala/basemode/SkidBuffer.scala 158:16]
  output        io_axiMaster_wvalid, // @[src/main/scala/basemode/SkidBuffer.scala 158:16]
  output [31:0] io_axiMaster_wdata, // @[src/main/scala/basemode/SkidBuffer.scala 158:16]
  output [3:0]  io_axiMaster_wstrb, // @[src/main/scala/basemode/SkidBuffer.scala 158:16]
  output        io_axiMaster_wlast, // @[src/main/scala/basemode/SkidBuffer.scala 158:16]
  output        io_axiMaster_bready, // @[src/main/scala/basemode/SkidBuffer.scala 158:16]
  input         io_axiMaster_bvalid, // @[src/main/scala/basemode/SkidBuffer.scala 158:16]
  input  [1:0]  io_axiMaster_bresp, // @[src/main/scala/basemode/SkidBuffer.scala 158:16]
  input  [3:0]  io_axiMaster_bid, // @[src/main/scala/basemode/SkidBuffer.scala 158:16]
  input         io_axiMaster_arready, // @[src/main/scala/basemode/SkidBuffer.scala 158:16]
  output        io_axiMaster_arvalid, // @[src/main/scala/basemode/SkidBuffer.scala 158:16]
  output [31:0] io_axiMaster_araddr, // @[src/main/scala/basemode/SkidBuffer.scala 158:16]
  output [3:0]  io_axiMaster_arid, // @[src/main/scala/basemode/SkidBuffer.scala 158:16]
  output [7:0]  io_axiMaster_arlen, // @[src/main/scala/basemode/SkidBuffer.scala 158:16]
  output [2:0]  io_axiMaster_arsize, // @[src/main/scala/basemode/SkidBuffer.scala 158:16]
  output [1:0]  io_axiMaster_arburst, // @[src/main/scala/basemode/SkidBuffer.scala 158:16]
  output        io_axiMaster_rready, // @[src/main/scala/basemode/SkidBuffer.scala 158:16]
  input         io_axiMaster_rvalid, // @[src/main/scala/basemode/SkidBuffer.scala 158:16]
  input  [1:0]  io_axiMaster_rresp, // @[src/main/scala/basemode/SkidBuffer.scala 158:16]
  input  [31:0] io_axiMaster_rdata, // @[src/main/scala/basemode/SkidBuffer.scala 158:16]
  input         io_axiMaster_rlast, // @[src/main/scala/basemode/SkidBuffer.scala 158:16]
  input  [3:0]  io_axiMaster_rid, // @[src/main/scala/basemode/SkidBuffer.scala 158:16]
  output        io_axiSlave_awready, // @[src/main/scala/basemode/SkidBuffer.scala 158:16]
  input         io_axiSlave_awvalid, // @[src/main/scala/basemode/SkidBuffer.scala 158:16]
  input  [31:0] io_axiSlave_awaddr, // @[src/main/scala/basemode/SkidBuffer.scala 158:16]
  input  [2:0]  io_axiSlave_awsize, // @[src/main/scala/basemode/SkidBuffer.scala 158:16]
  output        io_axiSlave_wready, // @[src/main/scala/basemode/SkidBuffer.scala 158:16]
  input         io_axiSlave_wvalid, // @[src/main/scala/basemode/SkidBuffer.scala 158:16]
  input  [31:0] io_axiSlave_wdata, // @[src/main/scala/basemode/SkidBuffer.scala 158:16]
  input  [3:0]  io_axiSlave_wstrb, // @[src/main/scala/basemode/SkidBuffer.scala 158:16]
  input         io_axiSlave_wlast, // @[src/main/scala/basemode/SkidBuffer.scala 158:16]
  input         io_axiSlave_bready, // @[src/main/scala/basemode/SkidBuffer.scala 158:16]
  output        io_axiSlave_bvalid, // @[src/main/scala/basemode/SkidBuffer.scala 158:16]
  output        io_axiSlave_arready, // @[src/main/scala/basemode/SkidBuffer.scala 158:16]
  input         io_axiSlave_arvalid, // @[src/main/scala/basemode/SkidBuffer.scala 158:16]
  input  [31:0] io_axiSlave_araddr, // @[src/main/scala/basemode/SkidBuffer.scala 158:16]
  input  [7:0]  io_axiSlave_arlen, // @[src/main/scala/basemode/SkidBuffer.scala 158:16]
  input  [2:0]  io_axiSlave_arsize, // @[src/main/scala/basemode/SkidBuffer.scala 158:16]
  input         io_axiSlave_rready, // @[src/main/scala/basemode/SkidBuffer.scala 158:16]
  output        io_axiSlave_rvalid, // @[src/main/scala/basemode/SkidBuffer.scala 158:16]
  output [31:0] io_axiSlave_rdata, // @[src/main/scala/basemode/SkidBuffer.scala 158:16]
  output        io_axiSlave_rlast // @[src/main/scala/basemode/SkidBuffer.scala 158:16]
);
  wire  awSkidBuffer_clock; // @[src/main/scala/basemode/SkidBuffer.scala 165:37]
  wire  awSkidBuffer_clear; // @[src/main/scala/basemode/SkidBuffer.scala 165:37]
  wire  awSkidBuffer_input_valid; // @[src/main/scala/basemode/SkidBuffer.scala 165:37]
  wire  awSkidBuffer_input_ready; // @[src/main/scala/basemode/SkidBuffer.scala 165:37]
  wire [48:0] awSkidBuffer_input_data; // @[src/main/scala/basemode/SkidBuffer.scala 165:37]
  wire  awSkidBuffer_output_valid; // @[src/main/scala/basemode/SkidBuffer.scala 165:37]
  wire  awSkidBuffer_output_ready; // @[src/main/scala/basemode/SkidBuffer.scala 165:37]
  wire [48:0] awSkidBuffer_output_data; // @[src/main/scala/basemode/SkidBuffer.scala 165:37]
  wire  wSkidBuffer_clock; // @[src/main/scala/basemode/SkidBuffer.scala 192:37]
  wire  wSkidBuffer_clear; // @[src/main/scala/basemode/SkidBuffer.scala 192:37]
  wire  wSkidBuffer_input_valid; // @[src/main/scala/basemode/SkidBuffer.scala 192:37]
  wire  wSkidBuffer_input_ready; // @[src/main/scala/basemode/SkidBuffer.scala 192:37]
  wire [36:0] wSkidBuffer_input_data; // @[src/main/scala/basemode/SkidBuffer.scala 192:37]
  wire  wSkidBuffer_output_valid; // @[src/main/scala/basemode/SkidBuffer.scala 192:37]
  wire  wSkidBuffer_output_ready; // @[src/main/scala/basemode/SkidBuffer.scala 192:37]
  wire [36:0] wSkidBuffer_output_data; // @[src/main/scala/basemode/SkidBuffer.scala 192:37]
  wire  bSkidBuffer_clock; // @[src/main/scala/basemode/SkidBuffer.scala 215:37]
  wire  bSkidBuffer_clear; // @[src/main/scala/basemode/SkidBuffer.scala 215:37]
  wire  bSkidBuffer_input_valid; // @[src/main/scala/basemode/SkidBuffer.scala 215:37]
  wire  bSkidBuffer_input_ready; // @[src/main/scala/basemode/SkidBuffer.scala 215:37]
  wire [5:0] bSkidBuffer_input_data; // @[src/main/scala/basemode/SkidBuffer.scala 215:37]
  wire  bSkidBuffer_output_valid; // @[src/main/scala/basemode/SkidBuffer.scala 215:37]
  wire  bSkidBuffer_output_ready; // @[src/main/scala/basemode/SkidBuffer.scala 215:37]
  wire [5:0] bSkidBuffer_output_data; // @[src/main/scala/basemode/SkidBuffer.scala 215:37]
  wire  arSkidBuffer_clock; // @[src/main/scala/basemode/SkidBuffer.scala 235:37]
  wire  arSkidBuffer_clear; // @[src/main/scala/basemode/SkidBuffer.scala 235:37]
  wire  arSkidBuffer_input_valid; // @[src/main/scala/basemode/SkidBuffer.scala 235:37]
  wire  arSkidBuffer_input_ready; // @[src/main/scala/basemode/SkidBuffer.scala 235:37]
  wire [48:0] arSkidBuffer_input_data; // @[src/main/scala/basemode/SkidBuffer.scala 235:37]
  wire  arSkidBuffer_output_valid; // @[src/main/scala/basemode/SkidBuffer.scala 235:37]
  wire  arSkidBuffer_output_ready; // @[src/main/scala/basemode/SkidBuffer.scala 235:37]
  wire [48:0] arSkidBuffer_output_data; // @[src/main/scala/basemode/SkidBuffer.scala 235:37]
  wire  rSkidBuffer_clock; // @[src/main/scala/basemode/SkidBuffer.scala 262:37]
  wire  rSkidBuffer_clear; // @[src/main/scala/basemode/SkidBuffer.scala 262:37]
  wire  rSkidBuffer_input_valid; // @[src/main/scala/basemode/SkidBuffer.scala 262:37]
  wire  rSkidBuffer_input_ready; // @[src/main/scala/basemode/SkidBuffer.scala 262:37]
  wire [38:0] rSkidBuffer_input_data; // @[src/main/scala/basemode/SkidBuffer.scala 262:37]
  wire  rSkidBuffer_output_valid; // @[src/main/scala/basemode/SkidBuffer.scala 262:37]
  wire  rSkidBuffer_output_ready; // @[src/main/scala/basemode/SkidBuffer.scala 262:37]
  wire [38:0] rSkidBuffer_output_data; // @[src/main/scala/basemode/SkidBuffer.scala 262:37]
  wire [4:0] awSkidBuffer_io_input_data_lo = {io_axiSlave_awsize,2'h1}; // @[src/main/scala/basemode/SkidBuffer.scala 171:43]
  wire [43:0] awSkidBuffer_io_input_data_hi = {io_axiSlave_awaddr,4'h0,8'h0}; // @[src/main/scala/basemode/SkidBuffer.scala 171:43]
  wire [35:0] wSkidBuffer_io_input_data_hi = {io_axiSlave_wdata,io_axiSlave_wstrb}; // @[src/main/scala/basemode/SkidBuffer.scala 198:43]
  wire [4:0] arSkidBuffer_io_input_data_lo = {io_axiSlave_arsize,2'h1}; // @[src/main/scala/basemode/SkidBuffer.scala 241:43]
  wire [43:0] arSkidBuffer_io_input_data_hi = {io_axiSlave_araddr,4'h0,io_axiSlave_arlen}; // @[src/main/scala/basemode/SkidBuffer.scala 241:43]
  wire [4:0] rSkidBuffer_io_input_data_lo = {io_axiMaster_rlast,io_axiMaster_rid}; // @[src/main/scala/basemode/SkidBuffer.scala 268:43]
  wire [33:0] rSkidBuffer_io_input_data_hi = {io_axiMaster_rresp,io_axiMaster_rdata}; // @[src/main/scala/basemode/SkidBuffer.scala 268:43]
  SkidBuffer #(.DATA_WIDTH(49)) awSkidBuffer ( // @[src/main/scala/basemode/SkidBuffer.scala 165:37]
    .clock(awSkidBuffer_clock),
    .clear(awSkidBuffer_clear),
    .input_valid(awSkidBuffer_input_valid),
    .input_ready(awSkidBuffer_input_ready),
    .input_data(awSkidBuffer_input_data),
    .output_valid(awSkidBuffer_output_valid),
    .output_ready(awSkidBuffer_output_ready),
    .output_data(awSkidBuffer_output_data)
  );
  SkidBuffer #(.DATA_WIDTH(37)) wSkidBuffer ( // @[src/main/scala/basemode/SkidBuffer.scala 192:37]
    .clock(wSkidBuffer_clock),
    .clear(wSkidBuffer_clear),
    .input_valid(wSkidBuffer_input_valid),
    .input_ready(wSkidBuffer_input_ready),
    .input_data(wSkidBuffer_input_data),
    .output_valid(wSkidBuffer_output_valid),
    .output_ready(wSkidBuffer_output_ready),
    .output_data(wSkidBuffer_output_data)
  );
  SkidBuffer #(.DATA_WIDTH(6)) bSkidBuffer ( // @[src/main/scala/basemode/SkidBuffer.scala 215:37]
    .clock(bSkidBuffer_clock),
    .clear(bSkidBuffer_clear),
    .input_valid(bSkidBuffer_input_valid),
    .input_ready(bSkidBuffer_input_ready),
    .input_data(bSkidBuffer_input_data),
    .output_valid(bSkidBuffer_output_valid),
    .output_ready(bSkidBuffer_output_ready),
    .output_data(bSkidBuffer_output_data)
  );
  SkidBuffer #(.DATA_WIDTH(49)) arSkidBuffer ( // @[src/main/scala/basemode/SkidBuffer.scala 235:37]
    .clock(arSkidBuffer_clock),
    .clear(arSkidBuffer_clear),
    .input_valid(arSkidBuffer_input_valid),
    .input_ready(arSkidBuffer_input_ready),
    .input_data(arSkidBuffer_input_data),
    .output_valid(arSkidBuffer_output_valid),
    .output_ready(arSkidBuffer_output_ready),
    .output_data(arSkidBuffer_output_data)
  );
  SkidBuffer #(.DATA_WIDTH(39)) rSkidBuffer ( // @[src/main/scala/basemode/SkidBuffer.scala 262:37]
    .clock(rSkidBuffer_clock),
    .clear(rSkidBuffer_clear),
    .input_valid(rSkidBuffer_input_valid),
    .input_ready(rSkidBuffer_input_ready),
    .input_data(rSkidBuffer_input_data),
    .output_valid(rSkidBuffer_output_valid),
    .output_ready(rSkidBuffer_output_ready),
    .output_data(rSkidBuffer_output_data)
  );
  assign io_axiMaster_awvalid = awSkidBuffer_output_valid; // @[src/main/scala/basemode/SkidBuffer.scala 174:37]
  assign io_axiMaster_awaddr = awSkidBuffer_output_data[48:17]; // @[src/main/scala/basemode/SkidBuffer.scala 176:67]
  assign io_axiMaster_awid = awSkidBuffer_output_data[16:13]; // @[src/main/scala/basemode/SkidBuffer.scala 177:67]
  assign io_axiMaster_awlen = awSkidBuffer_output_data[12:5]; // @[src/main/scala/basemode/SkidBuffer.scala 178:67]
  assign io_axiMaster_awsize = awSkidBuffer_output_data[4:2]; // @[src/main/scala/basemode/SkidBuffer.scala 179:67]
  assign io_axiMaster_awburst = awSkidBuffer_output_data[1:0]; // @[src/main/scala/basemode/SkidBuffer.scala 180:67]
  assign io_axiMaster_wvalid = wSkidBuffer_output_valid; // @[src/main/scala/basemode/SkidBuffer.scala 201:37]
  assign io_axiMaster_wdata = wSkidBuffer_output_data[36:5]; // @[src/main/scala/basemode/SkidBuffer.scala 203:66]
  assign io_axiMaster_wstrb = wSkidBuffer_output_data[4:1]; // @[src/main/scala/basemode/SkidBuffer.scala 204:66]
  assign io_axiMaster_wlast = wSkidBuffer_output_data[0]; // @[src/main/scala/basemode/SkidBuffer.scala 205:66]
  assign io_axiMaster_bready = bSkidBuffer_input_ready; // @[src/main/scala/basemode/SkidBuffer.scala 220:37]
  assign io_axiMaster_arvalid = arSkidBuffer_output_valid; // @[src/main/scala/basemode/SkidBuffer.scala 244:37]
  assign io_axiMaster_araddr = arSkidBuffer_output_data[48:17]; // @[src/main/scala/basemode/SkidBuffer.scala 246:67]
  assign io_axiMaster_arid = arSkidBuffer_output_data[16:13]; // @[src/main/scala/basemode/SkidBuffer.scala 247:67]
  assign io_axiMaster_arlen = arSkidBuffer_output_data[12:5]; // @[src/main/scala/basemode/SkidBuffer.scala 248:67]
  assign io_axiMaster_arsize = arSkidBuffer_output_data[4:2]; // @[src/main/scala/basemode/SkidBuffer.scala 249:67]
  assign io_axiMaster_arburst = arSkidBuffer_output_data[1:0]; // @[src/main/scala/basemode/SkidBuffer.scala 250:67]
  assign io_axiMaster_rready = rSkidBuffer_input_ready; // @[src/main/scala/basemode/SkidBuffer.scala 267:37]
  assign io_axiSlave_awready = awSkidBuffer_input_ready; // @[src/main/scala/basemode/SkidBuffer.scala 170:37]
  assign io_axiSlave_wready = wSkidBuffer_input_ready; // @[src/main/scala/basemode/SkidBuffer.scala 197:37]
  assign io_axiSlave_bvalid = bSkidBuffer_output_valid; // @[src/main/scala/basemode/SkidBuffer.scala 223:37]
  assign io_axiSlave_arready = arSkidBuffer_input_ready; // @[src/main/scala/basemode/SkidBuffer.scala 240:37]
  assign io_axiSlave_rvalid = rSkidBuffer_output_valid; // @[src/main/scala/basemode/SkidBuffer.scala 271:37]
  assign io_axiSlave_rdata = rSkidBuffer_output_data[36:5]; // @[src/main/scala/basemode/SkidBuffer.scala 274:66]
  assign io_axiSlave_rlast = rSkidBuffer_output_data[4]; // @[src/main/scala/basemode/SkidBuffer.scala 275:66]
  assign awSkidBuffer_clock = clock; // @[src/main/scala/basemode/SkidBuffer.scala 166:37]
  assign awSkidBuffer_clear = reset; // @[src/main/scala/basemode/SkidBuffer.scala 167:37]
  assign awSkidBuffer_input_valid = io_axiSlave_awvalid; // @[src/main/scala/basemode/SkidBuffer.scala 169:37]
  assign awSkidBuffer_input_data = {awSkidBuffer_io_input_data_hi,awSkidBuffer_io_input_data_lo}; // @[src/main/scala/basemode/SkidBuffer.scala 171:43]
  assign awSkidBuffer_output_ready = io_axiMaster_awready; // @[src/main/scala/basemode/SkidBuffer.scala 175:37]
  assign wSkidBuffer_clock = clock; // @[src/main/scala/basemode/SkidBuffer.scala 193:37]
  assign wSkidBuffer_clear = reset; // @[src/main/scala/basemode/SkidBuffer.scala 194:37]
  assign wSkidBuffer_input_valid = io_axiSlave_wvalid; // @[src/main/scala/basemode/SkidBuffer.scala 196:37]
  assign wSkidBuffer_input_data = {wSkidBuffer_io_input_data_hi,io_axiSlave_wlast}; // @[src/main/scala/basemode/SkidBuffer.scala 198:43]
  assign wSkidBuffer_output_ready = io_axiMaster_wready; // @[src/main/scala/basemode/SkidBuffer.scala 202:37]
  assign bSkidBuffer_clock = clock; // @[src/main/scala/basemode/SkidBuffer.scala 216:37]
  assign bSkidBuffer_clear = reset; // @[src/main/scala/basemode/SkidBuffer.scala 217:37]
  assign bSkidBuffer_input_valid = io_axiMaster_bvalid; // @[src/main/scala/basemode/SkidBuffer.scala 219:37]
  assign bSkidBuffer_input_data = {io_axiMaster_bresp,io_axiMaster_bid}; // @[src/main/scala/basemode/SkidBuffer.scala 221:43]
  assign bSkidBuffer_output_ready = io_axiSlave_bready; // @[src/main/scala/basemode/SkidBuffer.scala 224:37]
  assign arSkidBuffer_clock = clock; // @[src/main/scala/basemode/SkidBuffer.scala 236:37]
  assign arSkidBuffer_clear = reset; // @[src/main/scala/basemode/SkidBuffer.scala 237:37]
  assign arSkidBuffer_input_valid = io_axiSlave_arvalid; // @[src/main/scala/basemode/SkidBuffer.scala 239:37]
  assign arSkidBuffer_input_data = {arSkidBuffer_io_input_data_hi,arSkidBuffer_io_input_data_lo}; // @[src/main/scala/basemode/SkidBuffer.scala 241:43]
  assign arSkidBuffer_output_ready = io_axiMaster_arready; // @[src/main/scala/basemode/SkidBuffer.scala 245:37]
  assign rSkidBuffer_clock = clock; // @[src/main/scala/basemode/SkidBuffer.scala 263:37]
  assign rSkidBuffer_clear = reset; // @[src/main/scala/basemode/SkidBuffer.scala 264:37]
  assign rSkidBuffer_input_valid = io_axiMaster_rvalid; // @[src/main/scala/basemode/SkidBuffer.scala 266:37]
  assign rSkidBuffer_input_data = {rSkidBuffer_io_input_data_hi,rSkidBuffer_io_input_data_lo}; // @[src/main/scala/basemode/SkidBuffer.scala 268:43]
  assign rSkidBuffer_output_ready = io_axiSlave_rready; // @[src/main/scala/basemode/SkidBuffer.scala 272:37]
endmodule
