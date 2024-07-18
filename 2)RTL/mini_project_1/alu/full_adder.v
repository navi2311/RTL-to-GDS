`default_nettype none
`include "one_bit_adder.v"

module full_adder #(
    parameter WIDTH = 32
)(
    input wire [WIDTH-1:0] a,
    input wire [WIDTH-1:0] b,
    output wire [WIDTH-1:0] sum,
    output wire cout
);
    wire [WIDTH-1:0] carry;
    genvar i;

    generate
        for (i = 0; i < WIDTH; i = i + 1) begin : adder
            if (i == 0) begin
                one_bit_adder fa (
                    .a(a[i]),
                    .b(b[i]),
                    .cin(1'b0), // cin is always 0 for the first bit
                    .sum(sum[i]),
                    .cout(carry[i])
                );
            end else begin
                one_bit_adder fa (
                    .a(a[i]),
                    .b(b[i]),
                    .cin(carry[i-1]),
                    .sum(sum[i]),
                    .cout(carry[i])
                );
            end
        end
    endgenerate

    assign cout = carry[WIDTH-1];
endmodule
