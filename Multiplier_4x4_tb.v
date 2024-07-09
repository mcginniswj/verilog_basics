`timescale 1ns / 1ps

module Multiplier_4x4_tb;
    reg [3:0] a, b;
    wire [7:0] p;
    
Multiplier_4x4 dut(p, a, b);

initial begin
        // Test case 1
        a = 4'b0101; // 5
        b = 4'b0011; // 3
        #10;
        if (p !== 8'b00011111) $display("Test case 1 failed");
        // Test case 2
        a = 4'b1010; // 10
        b = 4'b1111; // 15
        #10;
        if (p !== 8'b11110010) $display("Test case 2 failed");
        // Test case 3
        a = 4'b1111; // 15
        b = 4'b1111; // 15
        #10;
        if (p !== 8'b11100001) $display("Test case 3 failed");
    $finish;
    end
endmodule