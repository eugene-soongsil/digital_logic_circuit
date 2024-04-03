module mux_4bit(
    input      [3:0]   a,
    input      [3:0]   b,
    input              sel,
    output reg [3:0]   d 
);

always@(*)begin
    if(sel)
        d = a;
    else if(!sel)
        d = b;
    else ;
end

endmodule