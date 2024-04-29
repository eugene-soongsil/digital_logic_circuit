module InstMem(
    input i_clk,
    input [11:0] i_address,
    output [31:0] o_instruction
);

    reg [31:0] r_instruction;
    reg [31:0] mem [4095:0];

    always @(posedge clk or negedge reset) begin
        if(~reset)
            r_instruction <= 31'h0;
        else
            r_instruction <= mem[address];
    end
    
    initial begin
        mem[0] = 16'h1234;
        mem[1] = 16'h5678;
        mem[2] = 16'h9ABC;
    end

    assign o_instruction = r_instruction;


endmodule