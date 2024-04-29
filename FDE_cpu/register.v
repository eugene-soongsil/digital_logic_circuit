module resister(
    input i_clk,
    input i_reset,
    input i_write_en, // 쓰기 활성화 신호
    input [3:0] i_read_reg1, // 첫 번째 읽기 레지스터 주소
    input [3:0] i_read_reg2, // 두 번째 읽기 레지스터 주소
    input [3:0] i_write_reg, // 쓰기 레지스터 주소
    input [7:0] i_write_data, // 쓰기 데이터
    output [7:0] o_read_data1, // 첫 번째 레지스터에서 읽은 데이터
    output [7:0] o_read_data2 // 두 번째 레지스터에서 읽은 데이터
);

reg [7:0] registers [0:15];

integer i;
always @(posedge i_clk or negedge i_reset) begin
    if (~reset) begin
        for (i = 0; i < 16; i = i + 1) begin
            registers[i] <= 8'h0;
        end
    end
    else if (i_write_en && i_write_reg != 4'd0) begin // 레지스터 0은 읽기 전용으로 고정
        registers[i_write_reg] <= i_write_data;
    end
end

always@(posedge i_clk or negedge i_reset)begin
    if(~reset)
        r_read_data1 = 8'h0;
    else
        r_read_data1 = registers[i_read_reg1];
end

always@(posedge i_clk or negedge i_reset)begin
    if(~reset)
        r_read_data2 = 8'h0;
    else
        r_read_data2 = registers[i_read_reg2];
end

assign o_read_data1 = r_read_data1;
assign o_read_data2 = r_read_data2;

endmodule