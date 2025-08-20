module Replacement_Algorithm_Unit_8(
  input        clock,
  input        reset,
  input        io_update_entry, // @[src/main/scala/ifu/Icache.scala 333:20]
  input  [2:0] io_update_index, // @[src/main/scala/ifu/Icache.scala 333:20]
  output [2:0] io_index // @[src/main/scala/ifu/Icache.scala 333:20]
);
  wire  lru_clock; // @[src/main/scala/ifu/Icache.scala 342:41]
  wire  lru_reset; // @[src/main/scala/ifu/Icache.scala 342:41]
  wire  lru_io_update_entry; // @[src/main/scala/ifu/Icache.scala 342:41]
  wire [2:0] lru_io_update_index; // @[src/main/scala/ifu/Icache.scala 342:41]
  wire [2:0] lru_io_lru_index; // @[src/main/scala/ifu/Icache.scala 342:41]
  LRU_8 lru ( // @[src/main/scala/ifu/Icache.scala 342:41]
    .clock(lru_clock),
    .reset(lru_reset),
    .io_update_entry(lru_io_update_entry),
    .io_update_index(lru_io_update_index),
    .io_lru_index(lru_io_lru_index)
  );
  assign io_index = lru_io_lru_index; // @[src/main/scala/ifu/Icache.scala 345:34]
  assign lru_clock = clock;
  assign lru_reset = reset;
  assign lru_io_update_entry = io_update_entry; // @[src/main/scala/ifu/Icache.scala 343:45]
  assign lru_io_update_index = io_update_index; // @[src/main/scala/ifu/Icache.scala 344:45]
endmodule
