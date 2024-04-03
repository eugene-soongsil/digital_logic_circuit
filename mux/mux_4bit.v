module mux_4bit(
    input      [3:0]   a,
    input      [3:0]   b,
    input              sel,
    output reg [3:0]   d 
);

//combinational circut
always@(*)begin
    if(sel) //sel = 1
        d = a;
    else if(!sel) //sel = 0
        d = b;
    else ; // sel의 값을 알 수 없을때 
end

endmodule