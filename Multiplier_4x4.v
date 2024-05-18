`timescale 1ns / 1ps
///////////////////////////////////////////////////////////////////
//4x4 Array Multiplier Using interconnected array of full adders 
///////////////////////////////////////////////////////////////////


//Instantiate 4x4 array of interconnected full adder nodes
module Multiplier_4x4(p, a, b);
    input [3:0] a, b;
    output [7:0] p;
    wire [3:0] sum0, sum1, sum2, sum3, sum4, sum5, sum6;
    wire [3:0] c0, c1, c2, c3, c4, c5, c6;
    

    Node node0(c0[0], sum0[0], a[0], b[0], 0, 0);
    Node node1(c1[0], sum1[0], a[1], b[0], c0[0], 0);
    Node node2(c2[0], sum2[0], a[2], b[0], c1[0], 0);
    Node node3(c3[0], sum3[0], a[3], b[0], c2[0], 0);

    Node node4(c1[1], sum1[1], a[0], b[1], 0, sum1[0]);
    Node node5(c2[1], sum2[1], a[1], b[1], c1[1], sum2[0]);
    Node node6(c3[1], sum3[1], a[2], b[1], c2[1], sum3[0]);
    Node node7(c4[1], sum4[1], a[3], b[1], c3[1], c3[0]);
    
    Node node8(c2[2], sum2[2], a[0], b[2], 0, sum2[1]);
    Node node9(c3[2], sum3[2], a[1], b[2], c2[2], sum3[1]);
    Node node10(c4[2], sum4[2], a[2], b[2], c3[2], sum4[1]);
    Node node11(c5[2], sum5[2], a[3], b[2], c4[2], c4[1]);

    Node node12(c3[3], sum3[3], a[0], b[3], 0, sum3[2]);
    Node node13(c4[3], sum4[3], a[1], b[3], c3[3], sum4[2]);
    Node node14(c5[3], sum5[3], a[2], b[3], c4[3], sum5[2]);
    Node node15(c6[3], sum6[3], a[3], b[3], c5[3], c5[2]);
    
    assign p[0] = sum0[0];
    assign p[1] = sum1[1];
    assign p[2] = sum2[2];
    assign p[3] = sum3[3];
    assign p[4] = sum4[3];
    assign p[5] = sum5[3];
    assign p[6] = sum6[3];
    assign p[7] = c6[3];
endmodule

//Build full adder circuit to be used in each node
module full_adder(Cout, S, A, B, Cin);
    input A, B, Cin;
    output Cout, S;
    wire S1, C1, C2;
    
    xor(S1, A, B);
    and(C1, A, B);
    xor(S, S1, Cin);
    and(C2, S1, Cin);
    or(Cout, C1, C2);
endmodule
 
//Connect outputs for the node
module Node(HCout, VCout, A, B, HCin, VCin);
    input A, B, HCin, VCin;
    output HCout, VCout;
    wire W1;
    
    assign W1 = A&B;
    full_adder fa1(HCout, VCout, W1, VCin, HCin);
endmodule
