`timescale 1ns / 1ps

module Comparator_4bit_tb;

reg [3:0] a, b;
wire G, L, E;

Comparator_4bit dut(a, b, G, L, E);

initial begin
    // Test case 1
    a = 4'b0101; 
    b = 4'b0011; 
    #10;
    if (G !== 1'b1 || L !== 1'b0 || E !== 1'b0) $display("Test case 1 failed");

    // Test case 2
    a = 4'b1010; 
    b = 4'b1111; 
    #10;
    if (G !== 1'b0 || L !== 1'b1 || E !== 1'b0) $display("Test case 2 failed");

    // Test case 3
    a = 4'b1111; 
    b = 4'b1111; 
    #10;
    if (G !== 1'b0 || L !== 1'b0 || E !== 1'b1) $display("Test case 3 failed");

    $finish;
end

endmodule