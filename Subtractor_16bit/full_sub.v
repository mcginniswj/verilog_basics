`timescale  1ns / 1ps

module full_sub (
    input a,b,Bin,
    output D, Bout
);
    wire Dtemp, Btemp1, Btemp2;
    
    half_sub hs1 (.a(a), .b(b), .D(Dtemp), .Bout(Btemp1));
    half_sub hs2 (.a(Dtemp), .b(Bin), .D(D), .Bout(Btemp2));
    xor x1(Bout, Btemp1, Btemp2);
    
endmodule
    