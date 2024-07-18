
//note alu op 3 is for unbsigned sltu operation will be implemented latter for navi_core 
`default_nettype none
`include "my_alu.v"
module alu_with_flop #(
  parameter WIDTH =32
)
  (input clk,
   input rst,
   input [(WIDTH-1):0] a,
   input [(WIDTH-1):0] b,
  input [3:0] sel,
   output reg [(WIDTH-1):0] out,
  output reg flag
  );
  wire [(WIDTH-1):0] out_w;
  wire flag_w;
  my_alu #(
    .WIDTH(WIDTH))
  alu_DUT (
    .a(a),
    .b(b),
    .sel(sel),
    .out(out_w),
    .flag(flag_w));
  
  
  always @(posedge clk) begin
    if(rst) begin
      out <= {WIDTH{1'b0}};
      flag <=1'b0;
    end
    else 
      out <= out_w;
      flag <= flag_w;
  end
endmodule