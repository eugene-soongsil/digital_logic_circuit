module fetch(
    input i_clk,
    input i_reset,
    output [31:0] o_instruction
);

    wire [11:0] pc_out;
    wire [11:0] next_pc;
    reg [11:0] pc = 12'h000;
    

    always @(posedge i_clk or negedge i_reset) begin
        if (~i_reset)
            pc <= 12'h000; 
        else
            pc <= next_pc;
    end
    
    assign next_pc = pc + 12'h001;
    assign pc_out = pc;
    
    InstMem memory (
        .i_clk(i_clk),
        .i_address(pc_out),
        .o_instruction(o_instruction)
    );

endmodule