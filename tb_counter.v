`timescale 1ns/1ps
module tb_counter();

reg clk, rst_n;
wire [3:0] cnt;

counter     inst_counter(
    .clk(clk),
    .rst_n(rst_n),
    .cnt(cnt)
);

//input들의 초기값과 testbench의 길이 설정 initial block
//rst_n은 내려가는 edge에 반응하기 때문에 1 -> 0 -> 1로 설정해 초기화 작업
initial begin
    clk = 0; rst_n = 1;
    #10
    rst_n = 0;
    #10
    rst_n = 1;
    #2000
    $finish;
end

//50ns마다 clk을 뒤집어주는 initial block (100ns주기 clk 생성)
always begin
    #50
    clk = ~clk;
end

initial begin
    $monitor("시간 = %t, output cnt = %d", $time, cnt);
end


endmodule