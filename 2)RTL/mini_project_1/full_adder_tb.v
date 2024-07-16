// Code your testbench here
// or browse Examples

module full_adder_tb;
  reg clk;
  reg rst;
  reg [3:0] a;
  reg [3:0] b;
  //reg [1:0]sel;
  wire [3:0] sum;
  wire carry;
  full_adder(
    .clk(clk),
    .rst(rst),
    .A(a),
    .B(b),
    .sum(sum),
    .carry(carry));
  
  initial begin
    clk=0;
    repeat(1000) begin
      #5 clk=~clk;
    end
  end
  initial begin
    $monitor("Time: %t, a: %h, b: %h, sum: %h, carry: %b", $time, a, b,  sum, carry);
  end

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1,full_adder_tb);
    a=0;
    b=0;
    rst=1;
    #10
    rst=0;
    repeat(200) begin
      a=$urandom %16;
      b=$urandom %16;
      #10;
    end
   
    #20
    
    $finish;
  end
endmodule
