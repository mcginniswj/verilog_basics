`timescale 1ns / 1ps

module Ripple_Counter_4bit_tb();

    reg clk;
    reg rst;
    wire [3:0] up_count;
    wire [3:0] down_count;

    Ripple_Counter_4bit uut (
        .clk(clk),
        .rst(rst),
        .up_count(up_count),
        .down_count(down_count)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 0;
        #10 rst = 1;
        #5 rst = 0;
        #150 $finish;
    end

endmodule
