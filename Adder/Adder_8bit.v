module Adder_8bit(
    input [7:0] a,
    input [7:0] b,
    input ci,
    output [7:0] s,
    output co
);

wire w_c;

adder_4bit adder0(.a(a[3:0]), .b(b[3:0]), .ci(ci), .s(s[3:0]), .co(w_c));
adder_4bit adder1(.a(a[7:4]), .b(b[7:4]), .ci(w_c), .s(s[7:4]), .co(co));

endmodule
