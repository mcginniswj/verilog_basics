`timescale 1ns / 1ps

module RCA_16bit_tb();

    reg [15:0] a, b;
    reg cin;
    
    wire [15:0] sum;
    wire cout;

    RCA_16bit uut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );


    initial begin
        a = 16'h0000;
        b = 16'h0000;
        cin = 0;

        #10 a = 16'hABCD;
        #10 b = 16'h1234;
        #10 cin = 1;

        #100 $finish;
    end


endmodule
