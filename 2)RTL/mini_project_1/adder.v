// Code your design here
`default_nettype none
module adder(
  			input clk,
  			input rst,
  			input wire A,
            input wire B,
            input wire cin,
            output reg sum,
            output reg carry);
  
  always@(posedge clk) begin
    if(rst) begin
      sum <=1'b0;
      carry <=1'b0;
    end
    else begin
      sum=A ^ B ^ cin;
      carry=(A & B) | (B & cin) | (cin & A);
    end
  end
   
  
endmodule
