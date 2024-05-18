`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 32 bit Shift Register, rising edge clock triggered, enable 
//////////////////////////////////////////////////////////////////////////////////

module Shift_Register(
    input clk, en, shift_in,
    output shift_out
);


    parameter WIDTH = 32;
    reg [WIDTH-1:0] shreg;
    integer i;
    
always @(posedge clk)
    begin
    if (en)
        begin
            for (i = 0; i < WIDTH-1; i = i+1)
                shreg[i+1] <= shreg[i];
                shreg[0] <= shift_in;
            end
        end
    assign shift_out = shreg[WIDTH-1];

endmodule