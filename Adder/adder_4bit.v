module adder_4bit(
    input [3:0] a,
    input [3:0] b,
    input ci,
    output [3:0] s,
    output co
);

wire c1, c2, c3;

full_adder adder0(.a(a[0]), .b(b[0]), .c(ci), .s(s[0]), .co(c1));
full_adder adder1(.a(a[1]), .b(b[1]), .c(c1), .s(s[1]), .co(c2));
full_adder adder2(.a(a[2]), .b(b[2]), .c(c2), .s(s[2]), .co(c3));
full_adder adder3(.a(a[3]), .b(b[3]), .c(c3), .s(s[3]), .co(co));

endmodule
