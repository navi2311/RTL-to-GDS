// Code your testbench here
// or browse Examples

module adder_tb;
  reg clk;
  reg rst;
  reg a;
  reg b;
  reg cin;
  //reg [1:0]sel;
  wire sum;
  wire carry;
  adder(
    .clk(clk),
    .rst(rst),
    .A(a),
    .B(b),
    .cin(cin),
    .sum(sum),
    .carry(carry));
  
  initial begin
    clk=0;
    repeat(1000) begin
      #5 clk=~clk;
    end
  end
  initial begin
    $monitor("Time: %t, a: %h, b: %h,cin: %h sum: %h, carry: %b", $time, a, b, cin, sum, carry);
  end

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1,adder_tb);
    a=0;
    b=0;
    cin=0;
    rst=1;
    #10
    rst=0;
    repeat(200) begin
      a=$urandom %2;
      b=$urandom %2;
      cin=$urandom %2;
      #10;
    end
   
    #20
    
    $finish;
  end
endmodule
