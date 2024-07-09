`timescale 1ns / 1ps

module Subtractor_16bit_tb;

    reg [15:0] a, b;
    wire [16:0] Dfinal; 

    Subtractor_16bit uut (
        .a(a),
        .b(b),
        .Dfinal(Dfinal)
    );

    initial begin
    
       a = 0; b= 0; #10;
       a = 10; b = 5; #10;
       a = 5; b = 10; #10;
       a = 16'h1010; b = 16'h1234; #10;
       a = 16'hAAAA; b = 16'hBBBB; #10;
       
        $finish;
    end

endmodule
