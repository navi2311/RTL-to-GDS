// Code your design here
`default_nettype none
module adder(input wire A,
            input wire B,
            input wire cin,
            output wire sum,
            output wire carry);
  
  
  assign sum=A ^ B ^ cin;
  assign carry=(A & B) | (B & cin) | (cin & A);
  
endmodule
