module decode(
    input [15:0] i_instruction,
    output [3:0] o_opcode,
    output [3:0] o_srcadd_1,
    output [3:0] o_srcadd_2,
    output [3:0] o_destadd
);

always(*)begin
    o_opcode = [15:12]i_instruction; //inst excute
    o_srcadd_1 = [11:8]i_instruction; //inst resister
    o_srcadd_2 = [7:4]i_instruction; //inst resister
    o_destadd = [3:0]i_instruction; //inst excute
end

endmodule
    