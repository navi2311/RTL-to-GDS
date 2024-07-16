`default_nettype none
`include "full_adder.v"
module my_alu #(
	parameter  WIDTH=4,
    parameter  OFF=0,
  	parameter  ADD=1,
    parameter  SUB=2,
    parameter  NO_OP=3
)
  (
    input wire clk,
    input wire rst,
    input wire [(WIDTH-1):0]A,
    input wire [(WIDTH-1):0]B,
    input wire [1:0]alu_op,
    output reg [(WIDTH-1):0] out,
    output reg flag);
  wire [3:0]sum_w;
  wire carry_w;

  full_adder dut(.clk(clk),
                 .rst(rst),
                 .A(A),
                 .B(B),
                 .sum(sum_w),
                 .carry(carry_w));
 
  always@(posedge clk) begin
    if(rst) begin
      out<=4'b0;
      flag<=1'b0;
    end
    else begin
    	case(alu_op)
      		OFF:begin
        		out<=4'b0;
        		flag<=1'b0;
      		end
      		ADD:begin
              	//a_temp=A;
                //b_temp<=B;
        		out<=sum_w;
        		flag<=carry_w;
      		end
      		SUB:begin
        		if(A>=B) begin
          			out<=A-B;
          			flag<=1'b0;
        		end
        		else begin
          			out<=B-A;
          			flag<=1'b1;
        		end
        
      		end
      		NO_OP:begin
        	//assuming it keeps perviosu values only
        		out<=out;
        		flag<=flag;
      		end
      		default: begin
        		out<=4'bz;
        		flag<=4'bz;
      		end
    	endcase
    end
    
  end
  
  
  
endmodule
