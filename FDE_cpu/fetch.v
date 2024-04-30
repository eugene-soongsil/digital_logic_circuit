module fetch(
    input i_clk,
    input i_reset,
    output [11:0] o_pc;
);

    wire [11:0] next_pc;
    reg [11:0] r_pc; //= 12'h000;
    

    always @(posedge i_clk or negedge i_reset) begin
        if (~i_reset)
            r_pc <= 12'h000;
        else
            r_pc <= next_pc;
    end
    
    assign next_pc = r_pc + 12'h001;
    assign o_pc = r_pc;

    InstMem memory (
        .i_clk(i_clk),
        .i_reset(i_reset),
        .i_address(pc_out),
        .o_instruction(o_instruction)
    );

endmodule