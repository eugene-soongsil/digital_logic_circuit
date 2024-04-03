`timescale 1ps/1ps

module tb_mux_4bit();

reg     [3:0]   a, b;
reg             sel;
output  [3:0]   d;

mux_4bit        inst_mux(
    .a(a),
    .b(b),
    .sel(sel),
    .d(d)
);

//a와 b의 값을 정의하고 sel 을 1에서 0으로 변경
initial begin
    a = 4'b1111; b = 4'b0101;
    sel = 1'b1;
    #30
    sel = 1'b0;
    #30
    $finish;
end

initial begin
    $monitor("시간 = %t, a = %b, b = %b, sel =%b \n d = %b", $time, a, b, sel, d);
end
endmodule