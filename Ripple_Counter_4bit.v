`timescale 1ns / 1ps

module dff (
    input d, clk, rst,
    output reg q,
    output qn
);

always @ (posedge clk or posedge rst)
    if (rst)
        q <= 0;
    else 
        q <= d;
    
    assign qn = ~q;
endmodule

module Ripple_Counter_4bit (
    input clk, rst,
    output [3:0] up_count, down_count
);
    
    wire q0, qn0, q1, qn1, q2, qn2, q3, qn3;
    
    dff dff0 (.d(qn0),
              .clk(clk),
              .rst(rst),
              .q(q0),
              .qn(qn0));
              
    dff dff1 (.d(qn1),
              .clk(qn0),
              .rst(rst),
              .q(q1),
              .qn(qn1));
              
    dff dff2 (.d(qn2),
              .clk(qn1),
              .rst(rst),
              .q(q2),
              .qn(qn2));
              
    dff dff3 (.d(qn3),
              .clk(qn2),
              .rst(rst),
              .q(q3),
              .qn(qn3));
          
    assign up_count = {q3, q2, q1, q0};
    assign down_count = {qn3, qn2, qn1, qn0};
    
endmodule
