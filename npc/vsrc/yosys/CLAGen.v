module CLAGen(
  input  [31:0] io_a, // @[src/main/scala/basemode/BaseALU.scala 98:14]
  input  [31:0] io_b, // @[src/main/scala/basemode/BaseALU.scala 98:14]
  input         io_cin, // @[src/main/scala/basemode/BaseALU.scala 98:14]
  output        io_cout, // @[src/main/scala/basemode/BaseALU.scala 98:14]
  output [31:0] io_sum // @[src/main/scala/basemode/BaseALU.scala 98:14]
);
  wire  FullAdder_io_a; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_io_b; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_io_cin; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_1_io_a; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_1_io_b; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_1_io_cin; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_1_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_1_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_1_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_2_io_a; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_2_io_b; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_2_io_cin; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_2_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_2_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_2_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_3_io_a; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_3_io_b; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_3_io_cin; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_3_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_3_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_3_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_4_io_a; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_4_io_b; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_4_io_cin; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_4_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_4_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_4_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_5_io_a; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_5_io_b; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_5_io_cin; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_5_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_5_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_5_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_6_io_a; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_6_io_b; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_6_io_cin; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_6_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_6_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_6_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_7_io_a; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_7_io_b; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_7_io_cin; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_7_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_7_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_7_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_8_io_a; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_8_io_b; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_8_io_cin; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_8_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_8_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_8_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_9_io_a; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_9_io_b; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_9_io_cin; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_9_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_9_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_9_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_10_io_a; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_10_io_b; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_10_io_cin; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_10_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_10_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_10_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_11_io_a; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_11_io_b; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_11_io_cin; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_11_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_11_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_11_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_12_io_a; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_12_io_b; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_12_io_cin; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_12_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_12_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_12_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_13_io_a; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_13_io_b; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_13_io_cin; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_13_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_13_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_13_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_14_io_a; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_14_io_b; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_14_io_cin; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_14_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_14_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_14_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_15_io_a; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_15_io_b; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_15_io_cin; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_15_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_15_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_15_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_16_io_a; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_16_io_b; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_16_io_cin; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_16_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_16_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_16_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_17_io_a; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_17_io_b; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_17_io_cin; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_17_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_17_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_17_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_18_io_a; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_18_io_b; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_18_io_cin; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_18_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_18_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_18_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_19_io_a; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_19_io_b; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_19_io_cin; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_19_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_19_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_19_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_20_io_a; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_20_io_b; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_20_io_cin; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_20_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_20_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_20_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_21_io_a; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_21_io_b; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_21_io_cin; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_21_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_21_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_21_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_22_io_a; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_22_io_b; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_22_io_cin; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_22_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_22_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_22_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_23_io_a; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_23_io_b; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_23_io_cin; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_23_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_23_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_23_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_24_io_a; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_24_io_b; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_24_io_cin; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_24_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_24_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_24_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_25_io_a; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_25_io_b; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_25_io_cin; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_25_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_25_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_25_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_26_io_a; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_26_io_b; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_26_io_cin; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_26_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_26_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_26_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_27_io_a; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_27_io_b; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_27_io_cin; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_27_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_27_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_27_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_28_io_a; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_28_io_b; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_28_io_cin; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_28_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_28_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_28_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_29_io_a; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_29_io_b; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_29_io_cin; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_29_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_29_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_29_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_30_io_a; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_30_io_b; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_30_io_cin; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_30_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_30_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_30_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_31_io_a; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_31_io_b; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_31_io_cin; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_31_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_31_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  FullAdder_31_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:42]
  wire  adders_0_p = FullAdder_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_0_g = FullAdder_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  cs_1 = adders_0_g | adders_0_p & io_cin; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  wire  adders_1_p = FullAdder_1_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_1_g = FullAdder_1_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  cs_2 = adders_1_g | adders_1_p & cs_1; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  wire  adders_2_p = FullAdder_2_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_2_g = FullAdder_2_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  cs_3 = adders_2_g | adders_2_p & cs_2; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  wire  adders_3_p = FullAdder_3_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_3_g = FullAdder_3_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  cs_4 = adders_3_g | adders_3_p & cs_3; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  wire  adders_4_p = FullAdder_4_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_4_g = FullAdder_4_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  cs_5 = adders_4_g | adders_4_p & cs_4; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  wire  adders_5_p = FullAdder_5_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_5_g = FullAdder_5_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  cs_6 = adders_5_g | adders_5_p & cs_5; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  wire  adders_6_p = FullAdder_6_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_6_g = FullAdder_6_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  cs_7 = adders_6_g | adders_6_p & cs_6; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  wire  adders_7_p = FullAdder_7_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_7_g = FullAdder_7_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  cs_8 = adders_7_g | adders_7_p & cs_7; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  wire  adders_8_p = FullAdder_8_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_8_g = FullAdder_8_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  cs_9 = adders_8_g | adders_8_p & cs_8; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  wire  adders_9_p = FullAdder_9_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_9_g = FullAdder_9_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  cs_10 = adders_9_g | adders_9_p & cs_9; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  wire  adders_10_p = FullAdder_10_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_10_g = FullAdder_10_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  cs_11 = adders_10_g | adders_10_p & cs_10; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  wire  adders_11_p = FullAdder_11_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_11_g = FullAdder_11_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  cs_12 = adders_11_g | adders_11_p & cs_11; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  wire  adders_12_p = FullAdder_12_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_12_g = FullAdder_12_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  cs_13 = adders_12_g | adders_12_p & cs_12; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  wire  adders_13_p = FullAdder_13_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_13_g = FullAdder_13_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  cs_14 = adders_13_g | adders_13_p & cs_13; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  wire  adders_14_p = FullAdder_14_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_14_g = FullAdder_14_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  cs_15 = adders_14_g | adders_14_p & cs_14; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  wire  adders_15_p = FullAdder_15_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_15_g = FullAdder_15_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  cs_16 = adders_15_g | adders_15_p & cs_15; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  wire  adders_16_p = FullAdder_16_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_16_g = FullAdder_16_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  cs_17 = adders_16_g | adders_16_p & cs_16; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  wire  adders_17_p = FullAdder_17_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_17_g = FullAdder_17_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  cs_18 = adders_17_g | adders_17_p & cs_17; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  wire  adders_18_p = FullAdder_18_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_18_g = FullAdder_18_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  cs_19 = adders_18_g | adders_18_p & cs_18; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  wire  adders_19_p = FullAdder_19_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_19_g = FullAdder_19_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  cs_20 = adders_19_g | adders_19_p & cs_19; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  wire  adders_20_p = FullAdder_20_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_20_g = FullAdder_20_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  cs_21 = adders_20_g | adders_20_p & cs_20; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  wire  adders_21_p = FullAdder_21_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_21_g = FullAdder_21_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  cs_22 = adders_21_g | adders_21_p & cs_21; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  wire  adders_22_p = FullAdder_22_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_22_g = FullAdder_22_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  cs_23 = adders_22_g | adders_22_p & cs_22; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  wire  adders_23_p = FullAdder_23_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_23_g = FullAdder_23_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  cs_24 = adders_23_g | adders_23_p & cs_23; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  wire  adders_24_p = FullAdder_24_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_24_g = FullAdder_24_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  cs_25 = adders_24_g | adders_24_p & cs_24; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  wire  adders_25_p = FullAdder_25_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_25_g = FullAdder_25_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  cs_26 = adders_25_g | adders_25_p & cs_25; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  wire  adders_26_p = FullAdder_26_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_26_g = FullAdder_26_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  cs_27 = adders_26_g | adders_26_p & cs_26; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  wire  adders_27_p = FullAdder_27_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_27_g = FullAdder_27_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  cs_28 = adders_27_g | adders_27_p & cs_27; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  wire  adders_28_p = FullAdder_28_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_28_g = FullAdder_28_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  cs_29 = adders_28_g | adders_28_p & cs_28; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  wire  adders_29_p = FullAdder_29_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_29_g = FullAdder_29_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  cs_30 = adders_29_g | adders_29_p & cs_29; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  wire  adders_30_p = FullAdder_30_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_30_g = FullAdder_30_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  cs_31 = adders_30_g | adders_30_p & cs_30; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  wire  adders_31_p = FullAdder_31_io_p; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_31_g = FullAdder_31_io_g; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_1_s = FullAdder_1_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_0_s = FullAdder_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_3_s = FullAdder_3_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_2_s = FullAdder_2_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_5_s = FullAdder_5_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_4_s = FullAdder_4_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_7_s = FullAdder_7_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_6_s = FullAdder_6_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire [7:0] io_sum_lo_lo = {adders_7_s,adders_6_s,adders_5_s,adders_4_s,adders_3_s,adders_2_s,adders_1_s,adders_0_s}; // @[src/main/scala/basemode/BaseALU.scala 127:18]
  wire  adders_9_s = FullAdder_9_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_8_s = FullAdder_8_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_11_s = FullAdder_11_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_10_s = FullAdder_10_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_13_s = FullAdder_13_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_12_s = FullAdder_12_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_15_s = FullAdder_15_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_14_s = FullAdder_14_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire [15:0] io_sum_lo = {adders_15_s,adders_14_s,adders_13_s,adders_12_s,adders_11_s,adders_10_s,adders_9_s,adders_8_s
    ,io_sum_lo_lo}; // @[src/main/scala/basemode/BaseALU.scala 127:18]
  wire  adders_17_s = FullAdder_17_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_16_s = FullAdder_16_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_19_s = FullAdder_19_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_18_s = FullAdder_18_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_21_s = FullAdder_21_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_20_s = FullAdder_20_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_23_s = FullAdder_23_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_22_s = FullAdder_22_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire [7:0] io_sum_hi_lo = {adders_23_s,adders_22_s,adders_21_s,adders_20_s,adders_19_s,adders_18_s,adders_17_s,
    adders_16_s}; // @[src/main/scala/basemode/BaseALU.scala 127:18]
  wire  adders_25_s = FullAdder_25_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_24_s = FullAdder_24_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_27_s = FullAdder_27_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_26_s = FullAdder_26_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_29_s = FullAdder_29_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_28_s = FullAdder_28_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_31_s = FullAdder_31_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire  adders_30_s = FullAdder_30_io_s; // @[src/main/scala/basemode/BaseALU.scala 108:{23,23}]
  wire [15:0] io_sum_hi = {adders_31_s,adders_30_s,adders_29_s,adders_28_s,adders_27_s,adders_26_s,adders_25_s,
    adders_24_s,io_sum_hi_lo}; // @[src/main/scala/basemode/BaseALU.scala 127:18]
  FullAdder FullAdder ( // @[src/main/scala/basemode/BaseALU.scala 108:42]
    .io_a(FullAdder_io_a),
    .io_b(FullAdder_io_b),
    .io_cin(FullAdder_io_cin),
    .io_s(FullAdder_io_s),
    .io_p(FullAdder_io_p),
    .io_g(FullAdder_io_g)
  );
  FullAdder FullAdder_1 ( // @[src/main/scala/basemode/BaseALU.scala 108:42]
    .io_a(FullAdder_1_io_a),
    .io_b(FullAdder_1_io_b),
    .io_cin(FullAdder_1_io_cin),
    .io_s(FullAdder_1_io_s),
    .io_p(FullAdder_1_io_p),
    .io_g(FullAdder_1_io_g)
  );
  FullAdder FullAdder_2 ( // @[src/main/scala/basemode/BaseALU.scala 108:42]
    .io_a(FullAdder_2_io_a),
    .io_b(FullAdder_2_io_b),
    .io_cin(FullAdder_2_io_cin),
    .io_s(FullAdder_2_io_s),
    .io_p(FullAdder_2_io_p),
    .io_g(FullAdder_2_io_g)
  );
  FullAdder FullAdder_3 ( // @[src/main/scala/basemode/BaseALU.scala 108:42]
    .io_a(FullAdder_3_io_a),
    .io_b(FullAdder_3_io_b),
    .io_cin(FullAdder_3_io_cin),
    .io_s(FullAdder_3_io_s),
    .io_p(FullAdder_3_io_p),
    .io_g(FullAdder_3_io_g)
  );
  FullAdder FullAdder_4 ( // @[src/main/scala/basemode/BaseALU.scala 108:42]
    .io_a(FullAdder_4_io_a),
    .io_b(FullAdder_4_io_b),
    .io_cin(FullAdder_4_io_cin),
    .io_s(FullAdder_4_io_s),
    .io_p(FullAdder_4_io_p),
    .io_g(FullAdder_4_io_g)
  );
  FullAdder FullAdder_5 ( // @[src/main/scala/basemode/BaseALU.scala 108:42]
    .io_a(FullAdder_5_io_a),
    .io_b(FullAdder_5_io_b),
    .io_cin(FullAdder_5_io_cin),
    .io_s(FullAdder_5_io_s),
    .io_p(FullAdder_5_io_p),
    .io_g(FullAdder_5_io_g)
  );
  FullAdder FullAdder_6 ( // @[src/main/scala/basemode/BaseALU.scala 108:42]
    .io_a(FullAdder_6_io_a),
    .io_b(FullAdder_6_io_b),
    .io_cin(FullAdder_6_io_cin),
    .io_s(FullAdder_6_io_s),
    .io_p(FullAdder_6_io_p),
    .io_g(FullAdder_6_io_g)
  );
  FullAdder FullAdder_7 ( // @[src/main/scala/basemode/BaseALU.scala 108:42]
    .io_a(FullAdder_7_io_a),
    .io_b(FullAdder_7_io_b),
    .io_cin(FullAdder_7_io_cin),
    .io_s(FullAdder_7_io_s),
    .io_p(FullAdder_7_io_p),
    .io_g(FullAdder_7_io_g)
  );
  FullAdder FullAdder_8 ( // @[src/main/scala/basemode/BaseALU.scala 108:42]
    .io_a(FullAdder_8_io_a),
    .io_b(FullAdder_8_io_b),
    .io_cin(FullAdder_8_io_cin),
    .io_s(FullAdder_8_io_s),
    .io_p(FullAdder_8_io_p),
    .io_g(FullAdder_8_io_g)
  );
  FullAdder FullAdder_9 ( // @[src/main/scala/basemode/BaseALU.scala 108:42]
    .io_a(FullAdder_9_io_a),
    .io_b(FullAdder_9_io_b),
    .io_cin(FullAdder_9_io_cin),
    .io_s(FullAdder_9_io_s),
    .io_p(FullAdder_9_io_p),
    .io_g(FullAdder_9_io_g)
  );
  FullAdder FullAdder_10 ( // @[src/main/scala/basemode/BaseALU.scala 108:42]
    .io_a(FullAdder_10_io_a),
    .io_b(FullAdder_10_io_b),
    .io_cin(FullAdder_10_io_cin),
    .io_s(FullAdder_10_io_s),
    .io_p(FullAdder_10_io_p),
    .io_g(FullAdder_10_io_g)
  );
  FullAdder FullAdder_11 ( // @[src/main/scala/basemode/BaseALU.scala 108:42]
    .io_a(FullAdder_11_io_a),
    .io_b(FullAdder_11_io_b),
    .io_cin(FullAdder_11_io_cin),
    .io_s(FullAdder_11_io_s),
    .io_p(FullAdder_11_io_p),
    .io_g(FullAdder_11_io_g)
  );
  FullAdder FullAdder_12 ( // @[src/main/scala/basemode/BaseALU.scala 108:42]
    .io_a(FullAdder_12_io_a),
    .io_b(FullAdder_12_io_b),
    .io_cin(FullAdder_12_io_cin),
    .io_s(FullAdder_12_io_s),
    .io_p(FullAdder_12_io_p),
    .io_g(FullAdder_12_io_g)
  );
  FullAdder FullAdder_13 ( // @[src/main/scala/basemode/BaseALU.scala 108:42]
    .io_a(FullAdder_13_io_a),
    .io_b(FullAdder_13_io_b),
    .io_cin(FullAdder_13_io_cin),
    .io_s(FullAdder_13_io_s),
    .io_p(FullAdder_13_io_p),
    .io_g(FullAdder_13_io_g)
  );
  FullAdder FullAdder_14 ( // @[src/main/scala/basemode/BaseALU.scala 108:42]
    .io_a(FullAdder_14_io_a),
    .io_b(FullAdder_14_io_b),
    .io_cin(FullAdder_14_io_cin),
    .io_s(FullAdder_14_io_s),
    .io_p(FullAdder_14_io_p),
    .io_g(FullAdder_14_io_g)
  );
  FullAdder FullAdder_15 ( // @[src/main/scala/basemode/BaseALU.scala 108:42]
    .io_a(FullAdder_15_io_a),
    .io_b(FullAdder_15_io_b),
    .io_cin(FullAdder_15_io_cin),
    .io_s(FullAdder_15_io_s),
    .io_p(FullAdder_15_io_p),
    .io_g(FullAdder_15_io_g)
  );
  FullAdder FullAdder_16 ( // @[src/main/scala/basemode/BaseALU.scala 108:42]
    .io_a(FullAdder_16_io_a),
    .io_b(FullAdder_16_io_b),
    .io_cin(FullAdder_16_io_cin),
    .io_s(FullAdder_16_io_s),
    .io_p(FullAdder_16_io_p),
    .io_g(FullAdder_16_io_g)
  );
  FullAdder FullAdder_17 ( // @[src/main/scala/basemode/BaseALU.scala 108:42]
    .io_a(FullAdder_17_io_a),
    .io_b(FullAdder_17_io_b),
    .io_cin(FullAdder_17_io_cin),
    .io_s(FullAdder_17_io_s),
    .io_p(FullAdder_17_io_p),
    .io_g(FullAdder_17_io_g)
  );
  FullAdder FullAdder_18 ( // @[src/main/scala/basemode/BaseALU.scala 108:42]
    .io_a(FullAdder_18_io_a),
    .io_b(FullAdder_18_io_b),
    .io_cin(FullAdder_18_io_cin),
    .io_s(FullAdder_18_io_s),
    .io_p(FullAdder_18_io_p),
    .io_g(FullAdder_18_io_g)
  );
  FullAdder FullAdder_19 ( // @[src/main/scala/basemode/BaseALU.scala 108:42]
    .io_a(FullAdder_19_io_a),
    .io_b(FullAdder_19_io_b),
    .io_cin(FullAdder_19_io_cin),
    .io_s(FullAdder_19_io_s),
    .io_p(FullAdder_19_io_p),
    .io_g(FullAdder_19_io_g)
  );
  FullAdder FullAdder_20 ( // @[src/main/scala/basemode/BaseALU.scala 108:42]
    .io_a(FullAdder_20_io_a),
    .io_b(FullAdder_20_io_b),
    .io_cin(FullAdder_20_io_cin),
    .io_s(FullAdder_20_io_s),
    .io_p(FullAdder_20_io_p),
    .io_g(FullAdder_20_io_g)
  );
  FullAdder FullAdder_21 ( // @[src/main/scala/basemode/BaseALU.scala 108:42]
    .io_a(FullAdder_21_io_a),
    .io_b(FullAdder_21_io_b),
    .io_cin(FullAdder_21_io_cin),
    .io_s(FullAdder_21_io_s),
    .io_p(FullAdder_21_io_p),
    .io_g(FullAdder_21_io_g)
  );
  FullAdder FullAdder_22 ( // @[src/main/scala/basemode/BaseALU.scala 108:42]
    .io_a(FullAdder_22_io_a),
    .io_b(FullAdder_22_io_b),
    .io_cin(FullAdder_22_io_cin),
    .io_s(FullAdder_22_io_s),
    .io_p(FullAdder_22_io_p),
    .io_g(FullAdder_22_io_g)
  );
  FullAdder FullAdder_23 ( // @[src/main/scala/basemode/BaseALU.scala 108:42]
    .io_a(FullAdder_23_io_a),
    .io_b(FullAdder_23_io_b),
    .io_cin(FullAdder_23_io_cin),
    .io_s(FullAdder_23_io_s),
    .io_p(FullAdder_23_io_p),
    .io_g(FullAdder_23_io_g)
  );
  FullAdder FullAdder_24 ( // @[src/main/scala/basemode/BaseALU.scala 108:42]
    .io_a(FullAdder_24_io_a),
    .io_b(FullAdder_24_io_b),
    .io_cin(FullAdder_24_io_cin),
    .io_s(FullAdder_24_io_s),
    .io_p(FullAdder_24_io_p),
    .io_g(FullAdder_24_io_g)
  );
  FullAdder FullAdder_25 ( // @[src/main/scala/basemode/BaseALU.scala 108:42]
    .io_a(FullAdder_25_io_a),
    .io_b(FullAdder_25_io_b),
    .io_cin(FullAdder_25_io_cin),
    .io_s(FullAdder_25_io_s),
    .io_p(FullAdder_25_io_p),
    .io_g(FullAdder_25_io_g)
  );
  FullAdder FullAdder_26 ( // @[src/main/scala/basemode/BaseALU.scala 108:42]
    .io_a(FullAdder_26_io_a),
    .io_b(FullAdder_26_io_b),
    .io_cin(FullAdder_26_io_cin),
    .io_s(FullAdder_26_io_s),
    .io_p(FullAdder_26_io_p),
    .io_g(FullAdder_26_io_g)
  );
  FullAdder FullAdder_27 ( // @[src/main/scala/basemode/BaseALU.scala 108:42]
    .io_a(FullAdder_27_io_a),
    .io_b(FullAdder_27_io_b),
    .io_cin(FullAdder_27_io_cin),
    .io_s(FullAdder_27_io_s),
    .io_p(FullAdder_27_io_p),
    .io_g(FullAdder_27_io_g)
  );
  FullAdder FullAdder_28 ( // @[src/main/scala/basemode/BaseALU.scala 108:42]
    .io_a(FullAdder_28_io_a),
    .io_b(FullAdder_28_io_b),
    .io_cin(FullAdder_28_io_cin),
    .io_s(FullAdder_28_io_s),
    .io_p(FullAdder_28_io_p),
    .io_g(FullAdder_28_io_g)
  );
  FullAdder FullAdder_29 ( // @[src/main/scala/basemode/BaseALU.scala 108:42]
    .io_a(FullAdder_29_io_a),
    .io_b(FullAdder_29_io_b),
    .io_cin(FullAdder_29_io_cin),
    .io_s(FullAdder_29_io_s),
    .io_p(FullAdder_29_io_p),
    .io_g(FullAdder_29_io_g)
  );
  FullAdder FullAdder_30 ( // @[src/main/scala/basemode/BaseALU.scala 108:42]
    .io_a(FullAdder_30_io_a),
    .io_b(FullAdder_30_io_b),
    .io_cin(FullAdder_30_io_cin),
    .io_s(FullAdder_30_io_s),
    .io_p(FullAdder_30_io_p),
    .io_g(FullAdder_30_io_g)
  );
  FullAdder FullAdder_31 ( // @[src/main/scala/basemode/BaseALU.scala 108:42]
    .io_a(FullAdder_31_io_a),
    .io_b(FullAdder_31_io_b),
    .io_cin(FullAdder_31_io_cin),
    .io_s(FullAdder_31_io_s),
    .io_p(FullAdder_31_io_p),
    .io_g(FullAdder_31_io_g)
  );
  assign io_cout = adders_31_g | adders_31_p & cs_31; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  assign io_sum = {io_sum_hi,io_sum_lo}; // @[src/main/scala/basemode/BaseALU.scala 127:18]
  assign FullAdder_io_a = io_a[0]; // @[src/main/scala/basemode/BaseALU.scala 118:24]
  assign FullAdder_io_b = io_b[0]; // @[src/main/scala/basemode/BaseALU.scala 119:24]
  assign FullAdder_io_cin = io_cin; // @[src/main/scala/basemode/BaseALU.scala 113:16 115:9]
  assign FullAdder_1_io_a = io_a[1]; // @[src/main/scala/basemode/BaseALU.scala 118:24]
  assign FullAdder_1_io_b = io_b[1]; // @[src/main/scala/basemode/BaseALU.scala 119:24]
  assign FullAdder_1_io_cin = adders_0_g | adders_0_p & io_cin; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  assign FullAdder_2_io_a = io_a[2]; // @[src/main/scala/basemode/BaseALU.scala 118:24]
  assign FullAdder_2_io_b = io_b[2]; // @[src/main/scala/basemode/BaseALU.scala 119:24]
  assign FullAdder_2_io_cin = adders_1_g | adders_1_p & cs_1; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  assign FullAdder_3_io_a = io_a[3]; // @[src/main/scala/basemode/BaseALU.scala 118:24]
  assign FullAdder_3_io_b = io_b[3]; // @[src/main/scala/basemode/BaseALU.scala 119:24]
  assign FullAdder_3_io_cin = adders_2_g | adders_2_p & cs_2; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  assign FullAdder_4_io_a = io_a[4]; // @[src/main/scala/basemode/BaseALU.scala 118:24]
  assign FullAdder_4_io_b = io_b[4]; // @[src/main/scala/basemode/BaseALU.scala 119:24]
  assign FullAdder_4_io_cin = adders_3_g | adders_3_p & cs_3; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  assign FullAdder_5_io_a = io_a[5]; // @[src/main/scala/basemode/BaseALU.scala 118:24]
  assign FullAdder_5_io_b = io_b[5]; // @[src/main/scala/basemode/BaseALU.scala 119:24]
  assign FullAdder_5_io_cin = adders_4_g | adders_4_p & cs_4; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  assign FullAdder_6_io_a = io_a[6]; // @[src/main/scala/basemode/BaseALU.scala 118:24]
  assign FullAdder_6_io_b = io_b[6]; // @[src/main/scala/basemode/BaseALU.scala 119:24]
  assign FullAdder_6_io_cin = adders_5_g | adders_5_p & cs_5; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  assign FullAdder_7_io_a = io_a[7]; // @[src/main/scala/basemode/BaseALU.scala 118:24]
  assign FullAdder_7_io_b = io_b[7]; // @[src/main/scala/basemode/BaseALU.scala 119:24]
  assign FullAdder_7_io_cin = adders_6_g | adders_6_p & cs_6; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  assign FullAdder_8_io_a = io_a[8]; // @[src/main/scala/basemode/BaseALU.scala 118:24]
  assign FullAdder_8_io_b = io_b[8]; // @[src/main/scala/basemode/BaseALU.scala 119:24]
  assign FullAdder_8_io_cin = adders_7_g | adders_7_p & cs_7; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  assign FullAdder_9_io_a = io_a[9]; // @[src/main/scala/basemode/BaseALU.scala 118:24]
  assign FullAdder_9_io_b = io_b[9]; // @[src/main/scala/basemode/BaseALU.scala 119:24]
  assign FullAdder_9_io_cin = adders_8_g | adders_8_p & cs_8; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  assign FullAdder_10_io_a = io_a[10]; // @[src/main/scala/basemode/BaseALU.scala 118:24]
  assign FullAdder_10_io_b = io_b[10]; // @[src/main/scala/basemode/BaseALU.scala 119:24]
  assign FullAdder_10_io_cin = adders_9_g | adders_9_p & cs_9; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  assign FullAdder_11_io_a = io_a[11]; // @[src/main/scala/basemode/BaseALU.scala 118:24]
  assign FullAdder_11_io_b = io_b[11]; // @[src/main/scala/basemode/BaseALU.scala 119:24]
  assign FullAdder_11_io_cin = adders_10_g | adders_10_p & cs_10; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  assign FullAdder_12_io_a = io_a[12]; // @[src/main/scala/basemode/BaseALU.scala 118:24]
  assign FullAdder_12_io_b = io_b[12]; // @[src/main/scala/basemode/BaseALU.scala 119:24]
  assign FullAdder_12_io_cin = adders_11_g | adders_11_p & cs_11; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  assign FullAdder_13_io_a = io_a[13]; // @[src/main/scala/basemode/BaseALU.scala 118:24]
  assign FullAdder_13_io_b = io_b[13]; // @[src/main/scala/basemode/BaseALU.scala 119:24]
  assign FullAdder_13_io_cin = adders_12_g | adders_12_p & cs_12; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  assign FullAdder_14_io_a = io_a[14]; // @[src/main/scala/basemode/BaseALU.scala 118:24]
  assign FullAdder_14_io_b = io_b[14]; // @[src/main/scala/basemode/BaseALU.scala 119:24]
  assign FullAdder_14_io_cin = adders_13_g | adders_13_p & cs_13; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  assign FullAdder_15_io_a = io_a[15]; // @[src/main/scala/basemode/BaseALU.scala 118:24]
  assign FullAdder_15_io_b = io_b[15]; // @[src/main/scala/basemode/BaseALU.scala 119:24]
  assign FullAdder_15_io_cin = adders_14_g | adders_14_p & cs_14; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  assign FullAdder_16_io_a = io_a[16]; // @[src/main/scala/basemode/BaseALU.scala 118:24]
  assign FullAdder_16_io_b = io_b[16]; // @[src/main/scala/basemode/BaseALU.scala 119:24]
  assign FullAdder_16_io_cin = adders_15_g | adders_15_p & cs_15; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  assign FullAdder_17_io_a = io_a[17]; // @[src/main/scala/basemode/BaseALU.scala 118:24]
  assign FullAdder_17_io_b = io_b[17]; // @[src/main/scala/basemode/BaseALU.scala 119:24]
  assign FullAdder_17_io_cin = adders_16_g | adders_16_p & cs_16; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  assign FullAdder_18_io_a = io_a[18]; // @[src/main/scala/basemode/BaseALU.scala 118:24]
  assign FullAdder_18_io_b = io_b[18]; // @[src/main/scala/basemode/BaseALU.scala 119:24]
  assign FullAdder_18_io_cin = adders_17_g | adders_17_p & cs_17; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  assign FullAdder_19_io_a = io_a[19]; // @[src/main/scala/basemode/BaseALU.scala 118:24]
  assign FullAdder_19_io_b = io_b[19]; // @[src/main/scala/basemode/BaseALU.scala 119:24]
  assign FullAdder_19_io_cin = adders_18_g | adders_18_p & cs_18; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  assign FullAdder_20_io_a = io_a[20]; // @[src/main/scala/basemode/BaseALU.scala 118:24]
  assign FullAdder_20_io_b = io_b[20]; // @[src/main/scala/basemode/BaseALU.scala 119:24]
  assign FullAdder_20_io_cin = adders_19_g | adders_19_p & cs_19; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  assign FullAdder_21_io_a = io_a[21]; // @[src/main/scala/basemode/BaseALU.scala 118:24]
  assign FullAdder_21_io_b = io_b[21]; // @[src/main/scala/basemode/BaseALU.scala 119:24]
  assign FullAdder_21_io_cin = adders_20_g | adders_20_p & cs_20; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  assign FullAdder_22_io_a = io_a[22]; // @[src/main/scala/basemode/BaseALU.scala 118:24]
  assign FullAdder_22_io_b = io_b[22]; // @[src/main/scala/basemode/BaseALU.scala 119:24]
  assign FullAdder_22_io_cin = adders_21_g | adders_21_p & cs_21; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  assign FullAdder_23_io_a = io_a[23]; // @[src/main/scala/basemode/BaseALU.scala 118:24]
  assign FullAdder_23_io_b = io_b[23]; // @[src/main/scala/basemode/BaseALU.scala 119:24]
  assign FullAdder_23_io_cin = adders_22_g | adders_22_p & cs_22; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  assign FullAdder_24_io_a = io_a[24]; // @[src/main/scala/basemode/BaseALU.scala 118:24]
  assign FullAdder_24_io_b = io_b[24]; // @[src/main/scala/basemode/BaseALU.scala 119:24]
  assign FullAdder_24_io_cin = adders_23_g | adders_23_p & cs_23; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  assign FullAdder_25_io_a = io_a[25]; // @[src/main/scala/basemode/BaseALU.scala 118:24]
  assign FullAdder_25_io_b = io_b[25]; // @[src/main/scala/basemode/BaseALU.scala 119:24]
  assign FullAdder_25_io_cin = adders_24_g | adders_24_p & cs_24; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  assign FullAdder_26_io_a = io_a[26]; // @[src/main/scala/basemode/BaseALU.scala 118:24]
  assign FullAdder_26_io_b = io_b[26]; // @[src/main/scala/basemode/BaseALU.scala 119:24]
  assign FullAdder_26_io_cin = adders_25_g | adders_25_p & cs_25; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  assign FullAdder_27_io_a = io_a[27]; // @[src/main/scala/basemode/BaseALU.scala 118:24]
  assign FullAdder_27_io_b = io_b[27]; // @[src/main/scala/basemode/BaseALU.scala 119:24]
  assign FullAdder_27_io_cin = adders_26_g | adders_26_p & cs_26; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  assign FullAdder_28_io_a = io_a[28]; // @[src/main/scala/basemode/BaseALU.scala 118:24]
  assign FullAdder_28_io_b = io_b[28]; // @[src/main/scala/basemode/BaseALU.scala 119:24]
  assign FullAdder_28_io_cin = adders_27_g | adders_27_p & cs_27; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  assign FullAdder_29_io_a = io_a[29]; // @[src/main/scala/basemode/BaseALU.scala 118:24]
  assign FullAdder_29_io_b = io_b[29]; // @[src/main/scala/basemode/BaseALU.scala 119:24]
  assign FullAdder_29_io_cin = adders_28_g | adders_28_p & cs_28; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  assign FullAdder_30_io_a = io_a[30]; // @[src/main/scala/basemode/BaseALU.scala 118:24]
  assign FullAdder_30_io_b = io_b[30]; // @[src/main/scala/basemode/BaseALU.scala 119:24]
  assign FullAdder_30_io_cin = adders_29_g | adders_29_p & cs_29; // @[src/main/scala/basemode/BaseALU.scala 124:24]
  assign FullAdder_31_io_a = io_a[31]; // @[src/main/scala/basemode/BaseALU.scala 118:24]
  assign FullAdder_31_io_b = io_b[31]; // @[src/main/scala/basemode/BaseALU.scala 119:24]
  assign FullAdder_31_io_cin = adders_30_g | adders_30_p & cs_30; // @[src/main/scala/basemode/BaseALU.scala 124:24]
endmodule
