// Code your testbench here
// or browse Examples

module tb;
  reg clk;
  reg rst;
  reg [3:0]a;
  reg [3:0]b;
  reg [1:0]sel;
  wire [3:0]sum;
  wire carry;
  
  my_alu dut(
    .clk(clk),
    .rst(rst),
    		.A(a),
            .B(b),
             .alu_op(sel),
            .out(sum),
            .flag(carry)
  			);
  initial begin
    clk=0;
    repeat(1000) begin
      #5 clk=~clk;
    end
  end
  initial begin
    $monitor("Time: %t, a: %h, b: %h, sel: %b, sum: %h, carry: %b", $time, a, b, sel, sum, carry);
  end

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1,tb);
    a=0;
    b=0;
    rst=1'b0;
    #10
    rst=1'b1;
    sel=0;
    //OFF
    repeat(1)begin
      
      a=$urandom %16;
      b=$urandom %16;
      sel=2'b00;
      #10;
      
    end
    //ADD
    repeat(1) begin 
      a=$urandom %16;
      b=$urandom %16;
      sel=2'b01;
      #10;
    end
    //sub
    repeat(1) begin 
      a=$urandom %16;
      b=$urandom %16;
      sel=2'b10;
      #10;
    end
    //no op
    repeat(1) begin 
      a=$urandom %16;
      b=$urandom %16;
      sel=2'b11;
      #10;
    end
    //random
    repeat(1) begin 
      
      a=$urandom %16;
      b=$urandom %16;
      sel=$urandom %4;
      #10;
    end
    
    #10
    a=4'bx;
    b=4'bx;
    sel=2'bxx;
    
    #50
    
    
    $finish;
  end
endmodule
