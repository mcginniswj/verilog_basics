`timescale 1ns / 1ps

module Shift_Register_tb;

reg clk, en, shift_in;

wire shift_out;

Shift_Register uut (
    .clk(clk),
    .en(en),
    .shift_in(shift_in),
    .shift_out(shift_out)
);

always #5 clk = ~clk; 

initial begin
    clk = 0;
    en = 0;
    shift_in = 0;

    #10 en = 1;
    repeat (32) begin
        shift_in = 1;
        #10;
    end

    shift_in = 0;
    #320;

    repeat (32) begin
        shift_in = 1;
        #10;
    end

    #320 $finish;
end

endmodule