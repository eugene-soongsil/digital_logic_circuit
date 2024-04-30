module excute(
    input i_clk,
    input i_reset,
    input [3:0] i_opcode,
    input [7:0] i_srcdata_1,
    input [7:0] i_srcdata_2,
    input [3:0] i_destadd,
    output o_write_en,//to reg
    output [3:0] o_write_add,//to reg
    output [7:0] o_write_data//to reg
);

localparam ADD = 4'b0001;
localparam SUB = 4'b0010;
localparam LS = 4'b0100;
localparam RS = 4'b1000;

always@(posedge i_clk or negedge i_reset)begin
    if(~i_reset)
        o_write_en <= 0;
    else if(o_write_data != 8'h0)
        o_write_en <= 1;
end

always@(posedge i_clk or negedge i_reset)begin
    if(~i_reset)
        o_write_add <= 0;
    else
        o_write_add <= i_destadd;
end

always@(*)begin
    case(i_opcode)
        ADD:
            o_write_data = i_srcdata_1 + i_srcdata_2;
        SUB:
            o_write_data = i_srcdata_1 - i_srcdata_2;
        LS:
            o_write_data = i_srcdata_1 << 1;
        RS:
            o_write_data = i_srcdata_1 >> 1;
        default:
            o_write_data = 8'h0;
    endcase
end

endmodule