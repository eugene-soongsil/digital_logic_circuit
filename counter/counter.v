module counter(
    input           clk,
    input           rst_n,
    output [3:0]    cnt
);
test

//output으로 내보낼 4bit cnt resistor(r_cnt) 선언
reg [3:0] r_cnt;

//r_cnt의 값을 정의하는 always block
always@(posedge clk or negedge rst_n)begin
    if(!rst_n)
        r_cnt <= 4'b0000;
    else
        r_cnt <= cnt + 1;
end

//cnt resistor(r_cnt)를 cnt로 assign
assign cnt = r_cnt;

endmodule
