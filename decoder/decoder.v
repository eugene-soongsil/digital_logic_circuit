module decoder(
    input         i0,
    input         i1,
    output  reg   d0,
    output  reg   d1,
    output  reg   d2,
    output  reg   d3
);

//combinational circuit
always@(*)begin
    case({i1, i0}) // i0과 i1을 묶어서 2bit으로 보는 case문
    2'b00 : {d3, d2, d1, d0} = 4'b0001;
    2'b01 : {d3, d2, d1, d0} = 4'b0010;
    2'b10 : {d3, d2, d1, d0} = 4'b0100;
    2'b11 : {d3, d2, d1, d0} = 4'b1000;
    default : {d3, d2, d1, d0} = 4'b0000;
    endcase
end

endmodule


