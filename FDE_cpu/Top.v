module Top(
    input i_clk,
    input i_reset,
    input [15:0] i_instruction,
    input [7:0] i_srcdata_1,
    input [7:0] i_srcdata_2,
    output [11:0] o_pc,
    output [3:0] o_srcadd_1,
    output [3:0] o_srcadd_2,
    output o_write_en,
    output [3:0] o_write_add,
    output [7:0] o_write_data
);

wire    [3:0]   w_opcode, w_destadd;

fetch   fetcher(
    .i_clk(i_clk),
    .i_reset(i_reset),
    .o_pc(o_pc)
);

decode  decoder(
    .i_instruction(i_instruction),
    .o_srcadd_1(o_srcadd_1),
    .o_srcadd_2(o_srcadd_2),
    .o_opcode(w_opcode),
    .o_destadd(w_destadd),
);

excute  excuter(
    .i_clk(i_clk),
    .i_reset(i_reset),
    .i_opcode(w_opcode),
    .i_srcdata_1(i_srcdata_1),
    .i_srcdata_2(i_srcdata_2),
    .i_destadd(w_destadd),
    .o_write_en(o_write_en),
    .o_write_add(o_write_add),
    .o_write_data(o_write_data)
);

InstMem     mem(
    .i_clk(i_clk),
    .i_reset(i_reset),
    .i_pc(o_pc),
    .o_instruction(i_instruction)
);

resister    regi(
    .i_clk(i_clk),
    .i_reset(i_reset),
    .i_write_en(o_write_en),
    .i_read_reg1(o_srcadd_1),
    .i_read_reg2(o_srcadd_2),
    .i_write_reg(o_destadd),
    .i_write_data(o_write_data),
    .o_read_data1(i_srcdata_1),
    .o_read_data2(i_srcdata_2)
);

endmodule