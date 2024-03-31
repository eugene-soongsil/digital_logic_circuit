`timescale 1ns/1ps
module tb_parity();

reg a, b, c;
wire p;

parity inst_parity(
    .a(a),
    .b(b),
    .c(c),
    .p(p)
);

//10ns 주기로 input을 바꿔주는 initial block
initial begin
    a = 0; b = 0; c = 0; //p = 0
    #10
    a = 0; b = 0; c = 1; //p = 1
    #10
    a = 0; b = 1; c = 0; //p = 1
    #10
    a = 0; b = 1; c = 1; //p = 0
    #10
    a = 1; b = 0; c = 0; //p = 1
    #10
    a = 1; b = 0; c = 1; //p = 0
    #10
    a = 1; b = 1; c = 0; //p = 0
    #10
    a = 1; b = 1; c = 1; //p = 1
    #10
    $finish;
end

initial begin
    $monitor("시간 = %t, input(a = %b, b = %b, c = %b), output p = %b", $time, a, b, c, p);
end

endmodule