`ifndef HEXPATH
`define HEXPATH "/workspaces/lab-3-behavioral-verilog-jasonwaseq/part4/sinusoid/"
`endif
module sinusoid
  #(parameter [31:0] depth_p = 100  
   ,parameter [31:0] width_p = 12)  
  (input logic clk_i
  ,input logic reset_i
  
  ,input logic [$clog2(depth_p)-1:0] rd_addr_i
  ,output logic signed [width_p-1:0] sine_out_o);

  ram_1r1w_async #(
    .width_p(width_p),
    .depth_p(depth_p),
    .filename_p("sine.hex")
  ) sine_lut (
    .clk_i(clk_i),
    .reset_i(reset_i),
    .wr_valid_i(1'b0),       
    .wr_data_i('0),
    .wr_addr_i('0),
    .rd_addr_i(rd_addr_i),
    .rd_data_o(sine_out_o)
  );

endmodule
