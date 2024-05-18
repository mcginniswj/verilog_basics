`timescale 1ns / 1ps 

module Subtractor_16bit(
    input [15:0] a,b,
    output [16:0] Dfinal
    );
    
    wire [15:0] D;
    
    wire b0,b1,b2,b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13,b14,b15;
    
    half_sub hs1 (.a(a[0]), .b(b[0]), .D(D[0]), .Bout(b0));
    full_sub fs1 (.a(a[1]), .b(b[1]), .Bin(b0), .D(D[1]), .Bout(b1));
    full_sub fs2 (.a(a[2]), .b(b[2]), .Bin(b1), .D(D[2]), .Bout(b2));
    full_sub fs3 (.a(a[3]), .b(b[3]), .Bin(b2), .D(D[3]), .Bout(b3));
    full_sub fs4 (.a(a[4]), .b(b[4]), .Bin(b3), .D(D[4]), .Bout(b4));
    full_sub fs5 (.a(a[5]), .b(b[5]), .Bin(b4), .D(D[5]), .Bout(b5));
    full_sub fs6 (.a(a[6]), .b(b[6]), .Bin(b5), .D(D[6]), .Bout(b6));
    full_sub fs7 (.a(a[7]), .b(b[7]), .Bin(b6), .D(D[7]), .Bout(b7));
    full_sub fs8 (.a(a[8]), .b(b[8]), .Bin(b7), .D(D[8]), .Bout(b8));
    full_sub fs9 (.a(a[9]), .b(b[9]), .Bin(b8), .D(D[9]), .Bout(b9));
    full_sub fs10 (.a(a[10]), .b(b[10]), .Bin(b9), .D(D[10]), .Bout(b10));
    full_sub fs11 (.a(a[11]), .b(b[11]), .Bin(b10), .D(D[11]), .Bout(b11));
    full_sub fs12 (.a(a[12]), .b(b[12]), .Bin(b11), .D(D[12]), .Bout(b12));
    full_sub fs13 (.a(a[13]), .b(b[13]), .Bin(b12), .D(D[13]), .Bout(b13));
    full_sub fs14 (.a(a[14]), .b(b[14]), .Bin(b13), .D(D[14]), .Bout(b14));
    full_sub fs15 (.a(a[15]), .b(b[15]), .Bin(b14), .D(D[15]), .Bout(b15));
    
    assign Dfinal = {b15, D[15:0]};
    
endmodule
