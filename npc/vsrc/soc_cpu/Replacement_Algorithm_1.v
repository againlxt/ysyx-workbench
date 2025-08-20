module Replacement_Algorithm_1(
  input        clock,
  input        reset,
  input        io_update_entry, // @[src/main/scala/ifu/Icache.scala 365:20]
  input  [2:0] io_update_index, // @[src/main/scala/ifu/Icache.scala 365:20]
  output [2:0] io_way_index // @[src/main/scala/ifu/Icache.scala 365:20]
);
  wire  uints_0_clock; // @[src/main/scala/ifu/Icache.scala 372:42]
  wire  uints_0_reset; // @[src/main/scala/ifu/Icache.scala 372:42]
  wire  uints_0_io_update_entry; // @[src/main/scala/ifu/Icache.scala 372:42]
  wire [2:0] uints_0_io_update_index; // @[src/main/scala/ifu/Icache.scala 372:42]
  wire [2:0] uints_0_io_index; // @[src/main/scala/ifu/Icache.scala 372:42]
  wire  uints_1_clock; // @[src/main/scala/ifu/Icache.scala 372:42]
  wire  uints_1_reset; // @[src/main/scala/ifu/Icache.scala 372:42]
  wire  uints_1_io_update_entry; // @[src/main/scala/ifu/Icache.scala 372:42]
  wire [2:0] uints_1_io_update_index; // @[src/main/scala/ifu/Icache.scala 372:42]
  wire [2:0] uints_1_io_index; // @[src/main/scala/ifu/Icache.scala 372:42]
  wire  uints_2_clock; // @[src/main/scala/ifu/Icache.scala 372:42]
  wire  uints_2_reset; // @[src/main/scala/ifu/Icache.scala 372:42]
  wire  uints_2_io_update_entry; // @[src/main/scala/ifu/Icache.scala 372:42]
  wire [2:0] uints_2_io_update_index; // @[src/main/scala/ifu/Icache.scala 372:42]
  wire [2:0] uints_2_io_index; // @[src/main/scala/ifu/Icache.scala 372:42]
  wire  uints_3_clock; // @[src/main/scala/ifu/Icache.scala 372:42]
  wire  uints_3_reset; // @[src/main/scala/ifu/Icache.scala 372:42]
  wire  uints_3_io_update_entry; // @[src/main/scala/ifu/Icache.scala 372:42]
  wire [2:0] uints_3_io_update_index; // @[src/main/scala/ifu/Icache.scala 372:42]
  wire [2:0] uints_3_io_index; // @[src/main/scala/ifu/Icache.scala 372:42]
  wire  uints_4_clock; // @[src/main/scala/ifu/Icache.scala 372:42]
  wire  uints_4_reset; // @[src/main/scala/ifu/Icache.scala 372:42]
  wire  uints_4_io_update_entry; // @[src/main/scala/ifu/Icache.scala 372:42]
  wire [2:0] uints_4_io_update_index; // @[src/main/scala/ifu/Icache.scala 372:42]
  wire [2:0] uints_4_io_index; // @[src/main/scala/ifu/Icache.scala 372:42]
  wire  uints_5_clock; // @[src/main/scala/ifu/Icache.scala 372:42]
  wire  uints_5_reset; // @[src/main/scala/ifu/Icache.scala 372:42]
  wire  uints_5_io_update_entry; // @[src/main/scala/ifu/Icache.scala 372:42]
  wire [2:0] uints_5_io_update_index; // @[src/main/scala/ifu/Icache.scala 372:42]
  wire [2:0] uints_5_io_index; // @[src/main/scala/ifu/Icache.scala 372:42]
  wire  uints_6_clock; // @[src/main/scala/ifu/Icache.scala 372:42]
  wire  uints_6_reset; // @[src/main/scala/ifu/Icache.scala 372:42]
  wire  uints_6_io_update_entry; // @[src/main/scala/ifu/Icache.scala 372:42]
  wire [2:0] uints_6_io_update_index; // @[src/main/scala/ifu/Icache.scala 372:42]
  wire [2:0] uints_6_io_index; // @[src/main/scala/ifu/Icache.scala 372:42]
  wire  uints_7_clock; // @[src/main/scala/ifu/Icache.scala 372:42]
  wire  uints_7_reset; // @[src/main/scala/ifu/Icache.scala 372:42]
  wire  uints_7_io_update_entry; // @[src/main/scala/ifu/Icache.scala 372:42]
  wire [2:0] uints_7_io_update_index; // @[src/main/scala/ifu/Icache.scala 372:42]
  wire [2:0] uints_7_io_index; // @[src/main/scala/ifu/Icache.scala 372:42]
  wire [2:0] wayArray_0 = uints_0_io_index; // @[src/main/scala/ifu/Icache.scala 371:28 377:29]
  wire [2:0] wayArray_1 = uints_1_io_index; // @[src/main/scala/ifu/Icache.scala 371:28 377:29]
  wire [2:0] _GEN_1 = 3'h1 == io_update_index ? wayArray_1 : wayArray_0; // @[src/main/scala/ifu/Icache.scala 380:{22,22}]
  wire [2:0] wayArray_2 = uints_2_io_index; // @[src/main/scala/ifu/Icache.scala 371:28 377:29]
  wire [2:0] _GEN_2 = 3'h2 == io_update_index ? wayArray_2 : _GEN_1; // @[src/main/scala/ifu/Icache.scala 380:{22,22}]
  wire [2:0] wayArray_3 = uints_3_io_index; // @[src/main/scala/ifu/Icache.scala 371:28 377:29]
  wire [2:0] _GEN_3 = 3'h3 == io_update_index ? wayArray_3 : _GEN_2; // @[src/main/scala/ifu/Icache.scala 380:{22,22}]
  wire [2:0] wayArray_4 = uints_4_io_index; // @[src/main/scala/ifu/Icache.scala 371:28 377:29]
  wire [2:0] _GEN_4 = 3'h4 == io_update_index ? wayArray_4 : _GEN_3; // @[src/main/scala/ifu/Icache.scala 380:{22,22}]
  wire [2:0] wayArray_5 = uints_5_io_index; // @[src/main/scala/ifu/Icache.scala 371:28 377:29]
  wire [2:0] _GEN_5 = 3'h5 == io_update_index ? wayArray_5 : _GEN_4; // @[src/main/scala/ifu/Icache.scala 380:{22,22}]
  wire [2:0] wayArray_6 = uints_6_io_index; // @[src/main/scala/ifu/Icache.scala 371:28 377:29]
  wire [2:0] _GEN_6 = 3'h6 == io_update_index ? wayArray_6 : _GEN_5; // @[src/main/scala/ifu/Icache.scala 380:{22,22}]
  wire [2:0] wayArray_7 = uints_7_io_index; // @[src/main/scala/ifu/Icache.scala 371:28 377:29]
  Replacement_Algorithm_Unit_8 uints_0 ( // @[src/main/scala/ifu/Icache.scala 372:42]
    .clock(uints_0_clock),
    .reset(uints_0_reset),
    .io_update_entry(uints_0_io_update_entry),
    .io_update_index(uints_0_io_update_index),
    .io_index(uints_0_io_index)
  );
  Replacement_Algorithm_Unit_8 uints_1 ( // @[src/main/scala/ifu/Icache.scala 372:42]
    .clock(uints_1_clock),
    .reset(uints_1_reset),
    .io_update_entry(uints_1_io_update_entry),
    .io_update_index(uints_1_io_update_index),
    .io_index(uints_1_io_index)
  );
  Replacement_Algorithm_Unit_8 uints_2 ( // @[src/main/scala/ifu/Icache.scala 372:42]
    .clock(uints_2_clock),
    .reset(uints_2_reset),
    .io_update_entry(uints_2_io_update_entry),
    .io_update_index(uints_2_io_update_index),
    .io_index(uints_2_io_index)
  );
  Replacement_Algorithm_Unit_8 uints_3 ( // @[src/main/scala/ifu/Icache.scala 372:42]
    .clock(uints_3_clock),
    .reset(uints_3_reset),
    .io_update_entry(uints_3_io_update_entry),
    .io_update_index(uints_3_io_update_index),
    .io_index(uints_3_io_index)
  );
  Replacement_Algorithm_Unit_8 uints_4 ( // @[src/main/scala/ifu/Icache.scala 372:42]
    .clock(uints_4_clock),
    .reset(uints_4_reset),
    .io_update_entry(uints_4_io_update_entry),
    .io_update_index(uints_4_io_update_index),
    .io_index(uints_4_io_index)
  );
  Replacement_Algorithm_Unit_8 uints_5 ( // @[src/main/scala/ifu/Icache.scala 372:42]
    .clock(uints_5_clock),
    .reset(uints_5_reset),
    .io_update_entry(uints_5_io_update_entry),
    .io_update_index(uints_5_io_update_index),
    .io_index(uints_5_io_index)
  );
  Replacement_Algorithm_Unit_8 uints_6 ( // @[src/main/scala/ifu/Icache.scala 372:42]
    .clock(uints_6_clock),
    .reset(uints_6_reset),
    .io_update_entry(uints_6_io_update_entry),
    .io_update_index(uints_6_io_update_index),
    .io_index(uints_6_io_index)
  );
  Replacement_Algorithm_Unit_8 uints_7 ( // @[src/main/scala/ifu/Icache.scala 372:42]
    .clock(uints_7_clock),
    .reset(uints_7_reset),
    .io_update_entry(uints_7_io_update_entry),
    .io_update_index(uints_7_io_update_index),
    .io_index(uints_7_io_index)
  );
  assign io_way_index = 3'h7 == io_update_index ? wayArray_7 : _GEN_6; // @[src/main/scala/ifu/Icache.scala 380:{22,22}]
  assign uints_0_clock = clock;
  assign uints_0_reset = reset;
  assign uints_0_io_update_entry = io_update_entry & io_update_index == 3'h0; // @[src/main/scala/ifu/Icache.scala 375:61]
  assign uints_0_io_update_index = io_update_index; // @[src/main/scala/ifu/Icache.scala 376:42]
  assign uints_1_clock = clock;
  assign uints_1_reset = reset;
  assign uints_1_io_update_entry = io_update_entry & io_update_index == 3'h1; // @[src/main/scala/ifu/Icache.scala 375:61]
  assign uints_1_io_update_index = io_update_index; // @[src/main/scala/ifu/Icache.scala 376:42]
  assign uints_2_clock = clock;
  assign uints_2_reset = reset;
  assign uints_2_io_update_entry = io_update_entry & io_update_index == 3'h2; // @[src/main/scala/ifu/Icache.scala 375:61]
  assign uints_2_io_update_index = io_update_index; // @[src/main/scala/ifu/Icache.scala 376:42]
  assign uints_3_clock = clock;
  assign uints_3_reset = reset;
  assign uints_3_io_update_entry = io_update_entry & io_update_index == 3'h3; // @[src/main/scala/ifu/Icache.scala 375:61]
  assign uints_3_io_update_index = io_update_index; // @[src/main/scala/ifu/Icache.scala 376:42]
  assign uints_4_clock = clock;
  assign uints_4_reset = reset;
  assign uints_4_io_update_entry = io_update_entry & io_update_index == 3'h4; // @[src/main/scala/ifu/Icache.scala 375:61]
  assign uints_4_io_update_index = io_update_index; // @[src/main/scala/ifu/Icache.scala 376:42]
  assign uints_5_clock = clock;
  assign uints_5_reset = reset;
  assign uints_5_io_update_entry = io_update_entry & io_update_index == 3'h5; // @[src/main/scala/ifu/Icache.scala 375:61]
  assign uints_5_io_update_index = io_update_index; // @[src/main/scala/ifu/Icache.scala 376:42]
  assign uints_6_clock = clock;
  assign uints_6_reset = reset;
  assign uints_6_io_update_entry = io_update_entry & io_update_index == 3'h6; // @[src/main/scala/ifu/Icache.scala 375:61]
  assign uints_6_io_update_index = io_update_index; // @[src/main/scala/ifu/Icache.scala 376:42]
  assign uints_7_clock = clock;
  assign uints_7_reset = reset;
  assign uints_7_io_update_entry = io_update_entry & io_update_index == 3'h7; // @[src/main/scala/ifu/Icache.scala 375:61]
  assign uints_7_io_update_index = io_update_index; // @[src/main/scala/ifu/Icache.scala 376:42]
endmodule
