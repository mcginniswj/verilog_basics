`timescale 1ns / 1ps

module Mux_16x1_tb;

reg clk;
reg [15:0] data;
reg [3:0] sel;
wire Q;

Mux_16x1 dut(clk, data, sel, Q);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    data = 16'b1010101010101010;    
    sel = 4'b0000;
    #20;

    sel = 4'b0001;
    #20;

    sel = 4'b0010;
    #20;
    
    sel = 4'b1110;
    #40;

    $finish;
end

endmodule