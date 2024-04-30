module InstMem(
    input i_clk,
    input i_reset,
    input [11:0] i_pc,
    output [15:0] o_instruction
);

    reg [15:0] r_instruction;
    reg [15:0] mem[4095:0];

    always @(posedge i_clk or negedge i_reset) begin
        if(~reset)
            r_instruction <= 16'h0;
        else
            r_instruction <= mem[i_pc];
    end
    
    initial begin
        mem[0] = 16'h1234;
        mem[1] = 16'h5678;
        mem[2] = 16'h9ABC;
    end

    assign o_instruction = r_instruction;


endmodule