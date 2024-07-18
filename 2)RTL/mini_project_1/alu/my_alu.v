`default_nettype none
`include "full_adder.v"

module my_alu #(
    parameter WIDTH = 32
)(
    input [WIDTH-1:0] a,
    input [WIDTH-1:0] b,
    input [3:0] sel,
    output reg [WIDTH-1:0] out,
    output reg flag
);

    // Operation codes
    parameter ADD = 4'b0000,   // 0
              SUB = 4'b0001,   // 1
              SLL = 4'b0010,   // 2
              SLT = 4'b0011,   // 3
  			  //SLTU=4'b0100;
              XOR = 4'b0101,   // 5
              SRL = 4'b0110,   // 6
              SRA = 4'b0111,   // 7
              OR  = 4'b1000,   // 8
              AND = 4'b1001;   // 9

    wire [WIDTH-1:0] sum_w;
    wire cout_w;

    full_adder #(.WIDTH(WIDTH)) dut (
        .a(a),
        .b(b),
        .sum(sum_w),
        .cout(cout_w)
    );

    always @(*) begin
        flag = 1'b0;
        case (sel)
            ADD: begin
                out = sum_w; 
                flag = cout_w;
            end
            SUB: begin
                if (a >= b) begin
                    out = a - b;
                    flag = 1'b0;
                end else begin
                    out = b - a;
                    flag = 1'b1;
                end
            end
            SLL: out = a << b[4:0];
            SLT: out = (a < b) ? 32'b1 : 32'b0;
            XOR: out = a ^ b;
            SRL: out = a >> b[4:0];
            SRA: out = a >>> b[4:0]; // Arithmetic right shift
            OR: out = a | b;
            AND: out = a & b;
            default: begin
                out = 4'bz;
                flag = 1'bz;
            end
        endcase
    end

endmodule
