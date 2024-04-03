`timescale 1ns/1ps

module tb_decoder();

reg     i0, i1;
wire    d0, d1, d2, d3;

decoder     inst_decoder(
    .i0(i0),
    .i1(i1),
    .d0(d0),
    .d1(d1),
    .d2(d2),
    .d3(d3)
);

//i0, i1 조합 생성
initial begin
    i0 = 0; i1 = 0;
    #10
    i0 = 0; i1 = 1;
    #10
    i0 = 1; i1 = 0;
    #10
    i0 = 1; i1 = 1;
    #10
    $finish;
end

initial begin
    $monitor("시간 = %t, i0 = %b, i1 = %b\nd0 = %b, d1 = %b, d2 = %b, d3 = %b", $time, i0, i1, d0, d1, d2, d3);
end

endmodule