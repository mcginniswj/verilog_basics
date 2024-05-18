`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 16-to-1 Multiplexer using 5, 4-to-1 Multiplexers
//////////////////////////////////////////////////////////////////////////////////


//connect 5 4-to-1 Multiplexers to achieve 16-to-1 Mux funcitonality 
//*******requires 2 clock cyles to produce output*************
module Mux_16x1(
    input clk,
    input [15:0] data,
    input [3:0] sel,
    output Q
    );
    
    wire [3:0] q;
    wire Q_temp;
    
    Mux_4x1 mux1 (clk, data[3:0], sel[1:0], q[0]);
    Mux_4x1 mux2 (clk, data[7:4], sel[1:0], q[1]);
    Mux_4x1 mux3 (clk, data[11:8], sel[1:0], q[2]);
    Mux_4x1 mux4 (clk, data[15:12], sel[1:0], q[3]);
    Mux_4x1 mux5 (clk, q, sel[3:2], Q);
    
endmodule

//Create 4-to-1 Multiplexer 
module Mux_4x1(
    input clk,
    input [3:0] data, 
    input [1:0] sel,
    output reg Q
);
    always @ (posedge clk)
    case (sel)
        2'b00: Q = data[0];
        2'b01: Q = data[1];
        2'b10: Q = data[2];
        2'b11: Q = data[3];
    endcase
endmodule
