// Code your design here
`default_nettype none
module one_bit_adder(
  			
  			input wire a,
            input wire b,
            input wire cin,
            output reg sum,
            output reg cout);
  
  always@(*) begin
      sum=a ^ b ^ cin;
    cout=(a & b) | (b & cin) | (cin & a);
    
  end
   
  
endmodule