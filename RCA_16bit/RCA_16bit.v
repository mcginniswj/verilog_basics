`timescale 1ns / 1ps

module RCA_16bit(
    input [15:0] a,b,
    input cin,
    output [15:0] sum,
    output cout

    );
    
    wire c0,c1,c2;
    
    RCA_4bit   rca0 (.a(a[3:0]), .b(b[3:0]), .cin(cin), .sum(sum[3:0]), .cout(c0));
    RCA_4bit   rca1 (.a(a[7:4]), .b(b[7:4]), .cin(c0), .sum(sum[7:4]), .cout(c1));
    RCA_4bit   rca2 (.a(a[11:8]), .b(b[11:8]), .cin(c1), .sum(sum[11:8]), .cout(c2));
    RCA_4bit   rca3 (.a(a[15:12]), .b(b[15:12]), .cin(c2), .sum(sum[15:12]), .cout(cout));

endmodule