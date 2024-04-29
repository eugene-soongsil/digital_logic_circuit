`timescale 1ns/1ps
module adder_tb();

reg [7:0] a, b;
reg ci;
wire [7:0] s;
wire co;

Adder_8bit adder(
    .a(a),
    .b(b),
    .ci(ci),
    .s(s),
    .co(co)
);

initial begin
    a = 8'd70;
    b = 8'd50;
    ci = 0;
    #400 ci = 1;
end

endmodule