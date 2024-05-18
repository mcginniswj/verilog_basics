`timescale 1ns / 1ps

module half_adder(
    input a,b,
    output sum,cout
    );
    
    xor  m1(sum, a,b);
    and  m2(cout ,a,b);
    
endmodule
