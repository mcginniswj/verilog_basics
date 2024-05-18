`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Structural 4-bit Comparator built using two 2-bit comparators
//////////////////////////////////////////////////////////////////////////////////
 
//Connect each 2-bit comparator to build a 4-bit comparator
module Comparator_4bit(
    input [3:0] a,b,
    output G, L, E
    );
    wire g1, g2, l1, l2, e1, e2;
    
    Comparator_2bit comp1(a[3:2], b[3:2], g2, l2, e2);
    Comparator_2bit comp2(a[1:0], b[1:0], g1, l1, e1);
    
    assign G = (g2)|(e2&g1);
    assign L = (l2)|(e2&l1);
    assign E = e1&e2; 
endmodule
 
//Stuctural comparator based on K-map for Greater, Less than, and Equal
module Comparator_2bit(
    input [1:0] a,b,
    output G, L, E
);
    assign G = ((a[1])&(~b[1]))|(((a[1])~^(b[1]))&((a[0])&(~b[0])));
    assign L = ((~a[1])&(b[1]))|(((a[1])~^(b[1]))&((~a[0])&(b[0])));
    assign E = (a[1]~^b[1])&(a[0]~^b[0]);
endmodule