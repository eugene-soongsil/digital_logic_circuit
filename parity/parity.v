module parity(
    input       a,
    input       b,
    input       c,
    output      p
);

//generate even parity
assign p = ~a&~b&c | ~a&b&~c | a&~b&~c |  a&b&c;

endmodule
