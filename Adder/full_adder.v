module full_adder(
    input a,
    input b,
    input c,
    output co,
    output s
);

assign co = (b&c) | (a&c) | (a&b);
assign s = a ^ b ^ c;

endmodule
