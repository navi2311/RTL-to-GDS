`default_nettype none
`include "adder.v"
module full_adder #(
  parameter int WIDTH=4
) (
  input wire [(WIDTH-1):0] A,
  input wire [(WIDTH-1):0] B,
  input wire [(WIDTH-1):0] sum,
  input wire carry);
   
  wire carry_1,carry_2,carry_3;
  adder dut_0(.A(A[0]),
              .B(B[0]),
              .cin(1'b0),
              .sum(sum[0]),
              .carry(carry_1));
  adder dut_1(.A(A[1]),
              .B(B[1]),
              .cin(carry_1),
              .sum(sum[1]),
              .carry(carry_2));
  adder dut_2(.A(A[2]),
              .B(B[2]),
              .cin(carry_2),
              .sum(sum[2]),
              .carry(carry_3));
  adder dut_3(.A(A[3]),
              .B(B[3]),
              .cin(carry_3),
              .sum(sum[3]),
              .carry(carry));
 
  
endmodule
